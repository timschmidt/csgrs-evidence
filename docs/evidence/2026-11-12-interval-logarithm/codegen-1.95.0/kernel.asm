hyperinterval::float::F64Enclosure::abs:
   17060:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   17064:	75 33                	jne    17099 <hyperinterval::float::F64Enclosure::abs+0x39>
   17066:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1706a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   17071:	ff ff 7f 
   17074:	48 85 c9             	test   %rcx,%rcx
   17077:	41 0f 99 c0          	setns  %r8b
   1707b:	48 89 c8             	mov    %rcx,%rax
   1707e:	48 21 d0             	and    %rdx,%rax
   17081:	41 0f 94 c1          	sete   %r9b
   17085:	45 08 c1             	or     %r8b,%r9b
   17088:	74 17                	je     170a1 <hyperinterval::float::F64Enclosure::abs+0x41>
   1708a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1708e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   17092:	0f 10 06             	movups (%rsi),%xmm0
   17095:	0f 11 07             	movups %xmm0,(%rdi)
   17098:	c3                   	ret
   17099:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   170a0:	c3                   	ret
   170a1:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   170a5:	48 85 f6             	test   %rsi,%rsi
   170a8:	41 0f 98 c1          	sets   %r9b
   170ac:	49 89 f0             	mov    %rsi,%r8
   170af:	49 21 d0             	and    %rdx,%r8
   170b2:	41 0f 95 c2          	setne  %r10b
   170b6:	45 84 d1             	test   %r10b,%r9b
   170b9:	74 10                	je     170cb <hyperinterval::float::F64Enclosure::abs+0x6b>
   170bb:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   170c2:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   170c6:	48 89 47 10          	mov    %rax,0x10(%rdi)
   170ca:	c3                   	ret
   170cb:	49 f7 d8             	neg    %r8
   170ce:	48 85 f6             	test   %rsi,%rsi
   170d1:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   170d6:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   170db:	49 0f 49 d1          	cmovns %r9,%rdx
   170df:	48 39 d1             	cmp    %rdx,%rcx
   170e2:	48 0f 46 c6          	cmovbe %rsi,%rax
   170e6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   170ed:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   170f4:	00 
   170f5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   170f9:	c3                   	ret
   170fa:	cc                   	int3
   170fb:	cc                   	int3
   170fc:	cc                   	int3
   170fd:	cc                   	int3
   170fe:	cc                   	int3
   170ff:	cc                   	int3

hyperinterval_strict_chain32:
   17160:	53                   	push   %rbx
   17161:	48 83 ec 60          	sub    $0x60,%rsp
   17165:	48 89 fb             	mov    %rdi,%rbx
   17168:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   1716d:	ff 15 7d 83 04 00    	call   *0x4837d(%rip)        # 5f4f0 <_DYNAMIC+0x2b0>
   17173:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17177:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1717c:	83 f9 02             	cmp    $0x2,%ecx
   1717f:	0f 84 f4 00 00 00    	je     17279 <hyperinterval_strict_chain32+0x119>
   17185:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17189:	8b 74 24 14          	mov    0x14(%rsp),%esi
   1718d:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
   17191:	89 54 24 59          	mov    %edx,0x59(%rsp)
   17195:	89 4c 24 54          	mov    %ecx,0x54(%rsp)
   17199:	88 44 24 58          	mov    %al,0x58(%rsp)
   1719d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   171a2:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   171a7:	f3 0f 10 05 19 e7 fe 	movss  -0x118e7(%rip),%xmm0        # 58c8 <__abi_tag+0x55cc>
   171ae:	ff 
   171af:	f3 0f 10 0d 09 e7 fe 	movss  -0x118f7(%rip),%xmm1        # 58c0 <__abi_tag+0x55c4>
   171b6:	ff 
   171b7:	ff 15 3b 83 04 00    	call   *0x4833b(%rip)        # 5f4f8 <_DYNAMIC+0x2b8>
   171bd:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   171c1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   171c6:	83 f9 02             	cmp    $0x2,%ecx
   171c9:	0f 84 aa 00 00 00    	je     17279 <hyperinterval_strict_chain32+0x119>
   171cf:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   171d3:	8b 74 24 20          	mov    0x20(%rsp),%esi
   171d7:	89 74 24 50          	mov    %esi,0x50(%rsp)
   171db:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   171df:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   171e3:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   171e7:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   171ec:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   171f1:	ff 15 09 83 04 00    	call   *0x48309(%rip)        # 5f500 <_DYNAMIC+0x2c0>
   171f7:	8b 4c 24 3c          	mov    0x3c(%rsp),%ecx
   171fb:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17200:	83 f9 02             	cmp    $0x2,%ecx
   17203:	74 74                	je     17279 <hyperinterval_strict_chain32+0x119>
   17205:	8b 54 24 41          	mov    0x41(%rsp),%edx
   17209:	8b 74 24 44          	mov    0x44(%rsp),%esi
   1720d:	89 74 24 38          	mov    %esi,0x38(%rsp)
   17211:	89 54 24 35          	mov    %edx,0x35(%rsp)
   17215:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   17219:	88 44 24 34          	mov    %al,0x34(%rsp)
   1721d:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   17222:	f3 0f 10 05 6a e6 fe 	movss  -0x11996(%rip),%xmm0        # 5894 <__abi_tag+0x5598>
   17229:	ff 
   1722a:	ff 15 d8 82 04 00    	call   *0x482d8(%rip)        # 5f508 <_DYNAMIC+0x2c8>
   17230:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
   17234:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   17239:	83 f9 02             	cmp    $0x2,%ecx
   1723c:	74 3b                	je     17279 <hyperinterval_strict_chain32+0x119>
   1723e:	8b 54 24 11          	mov    0x11(%rsp),%edx
   17242:	8b 74 24 14          	mov    0x14(%rsp),%esi
   17246:	89 74 24 20          	mov    %esi,0x20(%rsp)
   1724a:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   1724e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   17252:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   17256:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   1725b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   17260:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   17265:	ff 15 a5 82 04 00    	call   *0x482a5(%rip)        # 5f510 <_DYNAMIC+0x2d0>
   1726b:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   1726f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17274:	83 f9 02             	cmp    $0x2,%ecx
   17277:	75 12                	jne    1728b <hyperinterval_strict_chain32+0x12b>
   17279:	88 43 04             	mov    %al,0x4(%rbx)
   1727c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17282:	48 89 d8             	mov    %rbx,%rax
   17285:	48 83 c4 60          	add    $0x60,%rsp
   17289:	5b                   	pop    %rbx
   1728a:	c3                   	ret
   1728b:	8b 54 24 29          	mov    0x29(%rsp),%edx
   1728f:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   17293:	89 74 24 14          	mov    %esi,0x14(%rsp)
   17297:	89 54 24 11          	mov    %edx,0x11(%rsp)
   1729b:	89 4c 24 0c          	mov    %ecx,0xc(%rsp)
   1729f:	88 44 24 10          	mov    %al,0x10(%rsp)
   172a3:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
   172a8:	48 89 df             	mov    %rbx,%rdi
   172ab:	ff 15 67 82 04 00    	call   *0x48267(%rip)        # 5f518 <_DYNAMIC+0x2d8>
   172b1:	48 89 d8             	mov    %rbx,%rax
   172b4:	48 83 c4 60          	add    $0x60,%rsp
   172b8:	5b                   	pop    %rbx
   172b9:	c3                   	ret
   172ba:	cc                   	int3
   172bb:	cc                   	int3
   172bc:	cc                   	int3
   172bd:	cc                   	int3
   172be:	cc                   	int3
   172bf:	cc                   	int3

hyperinterval_strict_chain64:
   172c0:	53                   	push   %rbx
   172c1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
   172c8:	48 89 fb             	mov    %rdi,%rbx
   172cb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   172d0:	ff 15 4a 82 04 00    	call   *0x4824a(%rip)        # 5f520 <_DYNAMIC+0x2e0>
   172d6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   172db:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   172e0:	48 83 f9 02          	cmp    $0x2,%rcx
   172e4:	0f 84 32 01 00 00    	je     1741c <hyperinterval_strict_chain64+0x15c>
   172ea:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   172ef:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   172f4:	48 89 b4 24 a8 00 00 	mov    %rsi,0xa8(%rsp)
   172fb:	00 
   172fc:	48 89 94 24 a1 00 00 	mov    %rdx,0xa1(%rsp)
   17303:	00 
   17304:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
   1730b:	00 
   1730c:	88 84 24 a0 00 00 00 	mov    %al,0xa0(%rsp)
   17313:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17318:	48 8d b4 24 98 00 00 	lea    0x98(%rsp),%rsi
   1731f:	00 
   17320:	f2 0f 10 05 28 e5 fe 	movsd  -0x11ad8(%rip),%xmm0        # 5850 <__abi_tag+0x5554>
   17327:	ff 
   17328:	f2 0f 10 0d 30 e5 fe 	movsd  -0x11ad0(%rip),%xmm1        # 5860 <__abi_tag+0x5564>
   1732f:	ff 
   17330:	ff 15 f2 81 04 00    	call   *0x481f2(%rip)        # 5f528 <_DYNAMIC+0x2e8>
   17336:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1733b:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   17340:	48 83 f9 02          	cmp    $0x2,%rcx
   17344:	0f 84 d2 00 00 00    	je     1741c <hyperinterval_strict_chain64+0x15c>
   1734a:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   1734f:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   17354:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   1735b:	00 
   1735c:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17363:	00 
   17364:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   1736b:	00 
   1736c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17373:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
   17378:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   1737f:	00 
   17380:	ff 15 aa 81 04 00    	call   *0x481aa(%rip)        # 5f530 <_DYNAMIC+0x2f0>
   17386:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1738b:	0f b6 44 24 70       	movzbl 0x70(%rsp),%eax
   17390:	48 83 f9 02          	cmp    $0x2,%rcx
   17394:	0f 84 82 00 00 00    	je     1741c <hyperinterval_strict_chain64+0x15c>
   1739a:	48 8b 54 24 71       	mov    0x71(%rsp),%rdx
   1739f:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
   173a4:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   173a9:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   173ae:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   173b3:	88 44 24 58          	mov    %al,0x58(%rsp)
   173b7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   173bc:	f2 0f 10 05 7c e4 fe 	movsd  -0x11b84(%rip),%xmm0        # 5840 <__abi_tag+0x5544>
   173c3:	ff 
   173c4:	ff 15 6e 81 04 00    	call   *0x4816e(%rip)        # 5f538 <_DYNAMIC+0x2f8>
   173ca:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   173cf:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   173d4:	48 83 f9 02          	cmp    $0x2,%rcx
   173d8:	74 42                	je     1741c <hyperinterval_strict_chain64+0x15c>
   173da:	48 8b 54 24 11       	mov    0x11(%rsp),%rdx
   173df:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
   173e4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   173e9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   173ee:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   173f3:	88 44 24 28          	mov    %al,0x28(%rsp)
   173f7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   173fc:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   17401:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
   17406:	ff 15 34 81 04 00    	call   *0x48134(%rip)        # 5f540 <_DYNAMIC+0x300>
   1740c:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   17411:	0f b6 44 24 40       	movzbl 0x40(%rsp),%eax
   17416:	48 83 f9 02          	cmp    $0x2,%rcx
   1741a:	75 16                	jne    17432 <hyperinterval_strict_chain64+0x172>
   1741c:	88 43 08             	mov    %al,0x8(%rbx)
   1741f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   17426:	48 89 d8             	mov    %rbx,%rax
   17429:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17430:	5b                   	pop    %rbx
   17431:	c3                   	ret
   17432:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   17437:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   1743c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   17441:	48 89 54 24 11       	mov    %rdx,0x11(%rsp)
   17446:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1744b:	88 44 24 10          	mov    %al,0x10(%rsp)
   1744f:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   17454:	48 89 df             	mov    %rbx,%rdi
   17457:	ff 15 eb 80 04 00    	call   *0x480eb(%rip)        # 5f548 <_DYNAMIC+0x308>
   1745d:	48 89 d8             	mov    %rbx,%rax
   17460:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
   17467:	5b                   	pop    %rbx
   17468:	c3                   	ret
   17469:	cc                   	int3
   1746a:	cc                   	int3
   1746b:	cc                   	int3
   1746c:	cc                   	int3
   1746d:	cc                   	int3
   1746e:	cc                   	int3
   1746f:	cc                   	int3

hyperinterval_strict_sqrt32:
   17470:	53                   	push   %rbx
   17471:	48 83 ec 20          	sub    $0x20,%rsp
   17475:	48 89 fb             	mov    %rdi,%rbx
   17478:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   1747d:	ff 15 6d 80 04 00    	call   *0x4806d(%rip)        # 5f4f0 <_DYNAMIC+0x2b0>
   17483:	8b 4c 24 14          	mov    0x14(%rsp),%ecx
   17487:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   1748c:	83 f9 02             	cmp    $0x2,%ecx
   1748f:	75 12                	jne    174a3 <hyperinterval_strict_sqrt32+0x33>
   17491:	88 43 04             	mov    %al,0x4(%rbx)
   17494:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1749a:	48 89 d8             	mov    %rbx,%rax
   1749d:	48 83 c4 20          	add    $0x20,%rsp
   174a1:	5b                   	pop    %rbx
   174a2:	c3                   	ret
   174a3:	8b 54 24 19          	mov    0x19(%rsp),%edx
   174a7:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
   174ab:	89 74 24 10          	mov    %esi,0x10(%rsp)
   174af:	89 54 24 0d          	mov    %edx,0xd(%rsp)
   174b3:	89 4c 24 08          	mov    %ecx,0x8(%rsp)
   174b7:	88 44 24 0c          	mov    %al,0xc(%rsp)
   174bb:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
   174c0:	48 89 df             	mov    %rbx,%rdi
   174c3:	ff 15 87 80 04 00    	call   *0x48087(%rip)        # 5f550 <_DYNAMIC+0x310>
   174c9:	48 89 d8             	mov    %rbx,%rax
   174cc:	48 83 c4 20          	add    $0x20,%rsp
   174d0:	5b                   	pop    %rbx
   174d1:	c3                   	ret
   174d2:	cc                   	int3
   174d3:	cc                   	int3
   174d4:	cc                   	int3
   174d5:	cc                   	int3
   174d6:	cc                   	int3
   174d7:	cc                   	int3
   174d8:	cc                   	int3
   174d9:	cc                   	int3
   174da:	cc                   	int3
   174db:	cc                   	int3
   174dc:	cc                   	int3
   174dd:	cc                   	int3
   174de:	cc                   	int3
   174df:	cc                   	int3

hyperinterval_strict_sqrt64:
   174e0:	53                   	push   %rbx
   174e1:	48 83 ec 30          	sub    $0x30,%rsp
   174e5:	48 89 fb             	mov    %rdi,%rbx
   174e8:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   174ed:	ff 15 2d 80 04 00    	call   *0x4802d(%rip)        # 5f520 <_DYNAMIC+0x2e0>
   174f3:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   174f8:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   174fd:	48 83 f9 02          	cmp    $0x2,%rcx
   17501:	75 13                	jne    17516 <hyperinterval_strict_sqrt64+0x36>
   17503:	88 43 08             	mov    %al,0x8(%rbx)
   17506:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1750d:	48 89 d8             	mov    %rbx,%rax
   17510:	48 83 c4 30          	add    $0x30,%rsp
   17514:	5b                   	pop    %rbx
   17515:	c3                   	ret
   17516:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   1751b:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   17520:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17525:	48 89 54 24 09       	mov    %rdx,0x9(%rsp)
   1752a:	48 89 0c 24          	mov    %rcx,(%rsp)
   1752e:	88 44 24 08          	mov    %al,0x8(%rsp)
   17532:	48 89 e6             	mov    %rsp,%rsi
   17535:	48 89 df             	mov    %rbx,%rdi
   17538:	ff 15 1a 80 04 00    	call   *0x4801a(%rip)        # 5f558 <_DYNAMIC+0x318>
   1753e:	48 89 d8             	mov    %rbx,%rax
   17541:	48 83 c4 30          	add    $0x30,%rsp
   17545:	5b                   	pop    %rbx
   17546:	c3                   	ret
   17547:	cc                   	int3
   17548:	cc                   	int3
   17549:	cc                   	int3
   1754a:	cc                   	int3
   1754b:	cc                   	int3
   1754c:	cc                   	int3
   1754d:	cc                   	int3
   1754e:	cc                   	int3
   1754f:	cc                   	int3

hyperinterval_strict_surface32:
   17550:	55                   	push   %rbp
   17551:	41 57                	push   %r15
   17553:	41 56                	push   %r14
   17555:	41 55                	push   %r13
   17557:	41 54                	push   %r12
   17559:	53                   	push   %rbx
   1755a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   17561:	89 f5                	mov    %esi,%ebp
   17563:	48 89 fb             	mov    %rdi,%rbx
   17566:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1756b:	66 0f 7e 44 24 3c    	movd   %xmm0,0x3c(%rsp)
   17571:	66 0f 7e 4c 24 2c    	movd   %xmm1,0x2c(%rsp)
   17577:	ff 15 73 7f 04 00    	call   *0x47f73(%rip)        # 5f4f0 <_DYNAMIC+0x2b0>
   1757d:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   17582:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17587:	41 83 fd 02          	cmp    $0x2,%r13d
   1758b:	75 0e                	jne    1759b <hyperinterval_strict_surface32+0x4b>
   1758d:	88 43 04             	mov    %al,0x4(%rbx)
   17590:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17596:	e9 8a 00 00 00       	jmp    17625 <hyperinterval_strict_surface32+0xd5>
   1759b:	49 89 df             	mov    %rbx,%r15
   1759e:	8b 4c 24 0d          	mov    0xd(%rsp),%ecx
   175a2:	8b 54 24 10          	mov    0x10(%rsp),%edx
   175a6:	89 54 24 48          	mov    %edx,0x48(%rsp)
   175aa:	89 4c 24 45          	mov    %ecx,0x45(%rsp)
   175ae:	44 89 6c 24 40       	mov    %r13d,0x40(%rsp)
   175b3:	88 44 24 44          	mov    %al,0x44(%rsp)
   175b7:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   175bd:	ff 15 9d 7f 04 00    	call   *0x47f9d(%rip)        # 5f560 <_DYNAMIC+0x320>
   175c3:	48 89 c3             	mov    %rax,%rbx
   175c6:	f6 c3 01             	test   $0x1,%bl
   175c9:	74 0b                	je     175d6 <hyperinterval_strict_surface32+0x86>
   175cb:	4c 89 f8             	mov    %r15,%rax
   175ce:	88 78 04             	mov    %bh,0x4(%rax)
   175d1:	4c 89 fb             	mov    %r15,%rbx
   175d4:	eb 48                	jmp    1761e <hyperinterval_strict_surface32+0xce>
   175d6:	66 0f 6e 44 24 2c    	movd   0x2c(%rsp),%xmm0
   175dc:	ff 15 86 7f 04 00    	call   *0x47f86(%rip)        # 5f568 <_DYNAMIC+0x328>
   175e2:	a8 01                	test   $0x1,%al
   175e4:	74 08                	je     175ee <hyperinterval_strict_surface32+0x9e>
   175e6:	4c 89 fb             	mov    %r15,%rbx
   175e9:	88 63 04             	mov    %ah,0x4(%rbx)
   175ec:	eb 30                	jmp    1761e <hyperinterval_strict_surface32+0xce>
   175ee:	48 c1 eb 20          	shr    $0x20,%rbx
   175f2:	66 0f 6e c3          	movd   %ebx,%xmm0
   175f6:	48 c1 e8 20          	shr    $0x20,%rax
   175fa:	66 0f 6e c8          	movd   %eax,%xmm1
   175fe:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17603:	ff 15 e7 7e 04 00    	call   *0x47ee7(%rip)        # 5f4f0 <_DYNAMIC+0x2b0>
   17609:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1760d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17612:	83 f9 02             	cmp    $0x2,%ecx
   17615:	75 23                	jne    1763a <hyperinterval_strict_surface32+0xea>
   17617:	4c 89 fb             	mov    %r15,%rbx
   1761a:	41 88 47 04          	mov    %al,0x4(%r15)
   1761e:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   17625:	48 89 d8             	mov    %rbx,%rax
   17628:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   1762f:	5b                   	pop    %rbx
   17630:	41 5c                	pop    %r12
   17632:	41 5d                	pop    %r13
   17634:	41 5e                	pop    %r14
   17636:	41 5f                	pop    %r15
   17638:	5d                   	pop    %rbp
   17639:	c3                   	ret
   1763a:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1763e:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17642:	89 74 24 60          	mov    %esi,0x60(%rsp)
   17646:	89 54 24 5d          	mov    %edx,0x5d(%rsp)
   1764a:	89 4c 24 58          	mov    %ecx,0x58(%rsp)
   1764e:	88 44 24 5c          	mov    %al,0x5c(%rsp)
   17652:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17657:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1765c:	89 ea                	mov    %ebp,%edx
   1765e:	ff 15 0c 7f 04 00    	call   *0x47f0c(%rip)        # 5f570 <_DYNAMIC+0x330>
   17664:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17668:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   1766d:	83 f9 02             	cmp    $0x2,%ecx
   17670:	4c 89 fb             	mov    %r15,%rbx
   17673:	0f 84 14 ff ff ff    	je     1758d <hyperinterval_strict_surface32+0x3d>
   17679:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   1767d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   17681:	89 74 24 78          	mov    %esi,0x78(%rsp)
   17685:	89 54 24 75          	mov    %edx,0x75(%rsp)
   17689:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   1768d:	88 44 24 74          	mov    %al,0x74(%rsp)
   17691:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   17696:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
   1769b:	ff 15 d7 7e 04 00    	call   *0x47ed7(%rip)        # 5f578 <_DYNAMIC+0x338>
   176a1:	8b 4c 24 4c          	mov    0x4c(%rsp),%ecx
   176a5:	0f b6 44 24 50       	movzbl 0x50(%rsp),%eax
   176aa:	83 f9 02             	cmp    $0x2,%ecx
   176ad:	0f 84 da fe ff ff    	je     1758d <hyperinterval_strict_surface32+0x3d>
   176b3:	8b 54 24 51          	mov    0x51(%rsp),%edx
   176b7:	8b 74 24 54          	mov    0x54(%rsp),%esi
   176bb:	89 74 24 38          	mov    %esi,0x38(%rsp)
   176bf:	89 54 24 35          	mov    %edx,0x35(%rsp)
   176c3:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   176c7:	88 44 24 34          	mov    %al,0x34(%rsp)
   176cb:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   176d2:	00 
   176d3:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   176d8:	4c 8d 64 24 58       	lea    0x58(%rsp),%r12
   176dd:	48 89 df             	mov    %rbx,%rdi
   176e0:	4c 89 e2             	mov    %r12,%rdx
   176e3:	ff 15 97 7e 04 00    	call   *0x47e97(%rip)        # 5f580 <_DYNAMIC+0x340>
   176e9:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   176ee:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   176f3:	4c 89 f7             	mov    %r14,%rdi
   176f6:	48 89 de             	mov    %rbx,%rsi
   176f9:	ff 15 89 7e 04 00    	call   *0x47e89(%rip)        # 5f588 <_DYNAMIC+0x348>
   176ff:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17704:	4c 89 f6             	mov    %r14,%rsi
   17707:	ff 15 83 7e 04 00    	call   *0x47e83(%rip)        # 5f590 <_DYNAMIC+0x350>
   1770d:	48 8d 7c 24 14       	lea    0x14(%rsp),%rdi
   17712:	4c 89 f6             	mov    %r14,%rsi
   17715:	4c 89 e2             	mov    %r12,%rdx
   17718:	ff 15 7a 7e 04 00    	call   *0x47e7a(%rip)        # 5f598 <_DYNAMIC+0x358>
   1771e:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   17723:	4c 89 f6             	mov    %r14,%rsi
   17726:	4c 89 e2             	mov    %r12,%rdx
   17729:	ff 15 71 7e 04 00    	call   *0x47e71(%rip)        # 5f5a0 <_DYNAMIC+0x360>
   1772f:	8b 44 24 28          	mov    0x28(%rsp),%eax
   17733:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   1773a:	0f 10 44 24 08       	movups 0x8(%rsp),%xmm0
   1773f:	0f 10 4c 24 18       	movups 0x18(%rsp),%xmm1
   17744:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   1774b:	00 
   1774c:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   17751:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   17756:	4c 89 f7             	mov    %r14,%rdi
   17759:	ff 15 49 7e 04 00    	call   *0x47e49(%rip)        # 5f5a8 <_DYNAMIC+0x368>
   1775f:	8b 4c 24 64          	mov    0x64(%rsp),%ecx
   17763:	83 f9 01             	cmp    $0x1,%ecx
   17766:	75 1c                	jne    17784 <hyperinterval_strict_surface32+0x234>
   17768:	8b 74 24 68          	mov    0x68(%rsp),%esi
   1776c:	8b 7c 24 6c          	mov    0x6c(%rsp),%edi
   17770:	39 fe                	cmp    %edi,%esi
   17772:	0f 94 c2             	sete   %dl
   17775:	66 0f 6e ce          	movd   %esi,%xmm1
   17779:	66 0f 6e c7          	movd   %edi,%xmm0
   1777d:	be 01 00 00 00       	mov    $0x1,%esi
   17782:	eb 04                	jmp    17788 <hyperinterval_strict_surface32+0x238>
   17784:	31 d2                	xor    %edx,%edx
   17786:	31 f6                	xor    %esi,%esi
   17788:	80 f1 01             	xor    $0x1,%cl
   1778b:	89 74 24 08          	mov    %esi,0x8(%rsp)
   1778f:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   17795:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   17799:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1779d:	88 44 24 12          	mov    %al,0x12(%rsp)
   177a1:	89 74 24 14          	mov    %esi,0x14(%rsp)
   177a5:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   177ab:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   177b0:	4c 8d 64 24 64       	lea    0x64(%rsp),%r12
   177b5:	48 8d 5c 24 58       	lea    0x58(%rsp),%rbx
   177ba:	4c 89 e7             	mov    %r12,%rdi
   177bd:	48 89 de             	mov    %rbx,%rsi
   177c0:	ff 15 ea 7d 04 00    	call   *0x47dea(%rip)        # 5f5b0 <_DYNAMIC+0x370>
   177c6:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   177ca:	4c 89 e7             	mov    %r12,%rdi
   177cd:	48 89 de             	mov    %rbx,%rsi
   177d0:	ff 15 e2 7d 04 00    	call   *0x47de2(%rip)        # 5f5b8 <_DYNAMIC+0x378>
   177d6:	41 89 c6             	mov    %eax,%r14d
   177d9:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
   177de:	4c 89 e7             	mov    %r12,%rdi
   177e1:	48 89 de             	mov    %rbx,%rsi
   177e4:	ff 15 d6 7d 04 00    	call   *0x47dd6(%rip)        # 5f5c0 <_DYNAMIC+0x380>
   177ea:	89 c5                	mov    %eax,%ebp
   177ec:	4c 89 e7             	mov    %r12,%rdi
   177ef:	48 89 de             	mov    %rbx,%rsi
   177f2:	ff 15 d0 7d 04 00    	call   *0x47dd0(%rip)        # 5f5c8 <_DYNAMIC+0x388>
   177f8:	89 c3                	mov    %eax,%ebx
   177fa:	4c 89 e7             	mov    %r12,%rdi
   177fd:	66 0f 6e 44 24 3c    	movd   0x3c(%rsp),%xmm0
   17803:	ff 15 7f 7c 04 00    	call   *0x47c7f(%rip)        # 5f488 <_DYNAMIC+0x248>
   17809:	a8 01                	test   $0x1,%al
   1780b:	74 0c                	je     17819 <hyperinterval_strict_surface32+0x2c9>
   1780d:	4c 89 fb             	mov    %r15,%rbx
   17810:	41 88 57 04          	mov    %dl,0x4(%r15)
   17814:	e9 05 fe ff ff       	jmp    1761e <hyperinterval_strict_surface32+0xce>
   17819:	80 e2 01             	and    $0x1,%dl
   1781c:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   17821:	88 44 24 08          	mov    %al,0x8(%rsp)
   17825:	44 88 74 24 09       	mov    %r14b,0x9(%rsp)
   1782a:	40 88 6c 24 0a       	mov    %bpl,0xa(%rsp)
   1782f:	88 5c 24 0b          	mov    %bl,0xb(%rsp)
   17833:	88 54 24 0c          	mov    %dl,0xc(%rsp)
   17837:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   1783c:	41 83 fd 01          	cmp    $0x1,%r13d
   17840:	75 2a                	jne    1786c <hyperinterval_strict_surface32+0x31c>
   17842:	f3 0f 7e 44 24 44    	movq   0x44(%rsp),%xmm0
   17848:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1784c:	66 0f 6f 15 1c e1 fe 	movdqa -0x11ee4(%rip),%xmm2        # 5970 <__abi_tag+0x5674>
   17853:	ff 
   17854:	66 0f ef d0          	pxor   %xmm0,%xmm2
   17858:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   1785c:	66 0f df ca          	pandn  %xmm2,%xmm1
   17860:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   17865:	b8 01 00 00 00       	mov    $0x1,%eax
   1786a:	eb 02                	jmp    1786e <hyperinterval_strict_surface32+0x31e>
   1786c:	31 c0                	xor    %eax,%eax
   1786e:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
   17872:	66 0f d6 44 24 50    	movq   %xmm0,0x50(%rsp)
   17878:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1787d:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   17882:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   17887:	ff 15 43 7d 04 00    	call   *0x47d43(%rip)        # 5f5d0 <_DYNAMIC+0x390>
   1788d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   17891:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   17896:	83 f9 02             	cmp    $0x2,%ecx
   17899:	4c 89 fb             	mov    %r15,%rbx
   1789c:	0f 84 eb fc ff ff    	je     1758d <hyperinterval_strict_surface32+0x3d>
   178a2:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   178a6:	8b 74 24 10          	mov    0x10(%rsp),%esi
   178aa:	89 74 24 38          	mov    %esi,0x38(%rsp)
   178ae:	89 54 24 35          	mov    %edx,0x35(%rsp)
   178b2:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   178b6:	88 44 24 34          	mov    %al,0x34(%rsp)
   178ba:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   178bf:	66 0f 6e 05 fd df fe 	movd   -0x12003(%rip),%xmm0        # 58c4 <__abi_tag+0x55c8>
   178c6:	ff 
   178c7:	ff 15 3b 7c 04 00    	call   *0x47c3b(%rip)        # 5f508 <_DYNAMIC+0x2c8>
   178cd:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   178d1:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   178d6:	83 f9 02             	cmp    $0x2,%ecx
   178d9:	0f 84 ae fc ff ff    	je     1758d <hyperinterval_strict_surface32+0x3d>
   178df:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   178e3:	8b 74 24 10          	mov    0x10(%rsp),%esi
   178e7:	89 74 24 78          	mov    %esi,0x78(%rsp)
   178eb:	89 54 24 75          	mov    %edx,0x75(%rsp)
   178ef:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   178f3:	88 44 24 74          	mov    %al,0x74(%rsp)
   178f7:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
   178fc:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   17901:	48 89 df             	mov    %rbx,%rdi
   17904:	ff 15 ce 7c 04 00    	call   *0x47cce(%rip)        # 5f5d8 <_DYNAMIC+0x398>
   1790a:	e9 16 fd ff ff       	jmp    17625 <hyperinterval_strict_surface32+0xd5>
   1790f:	cc                   	int3

hyperinterval_strict_surface64:
   17910:	55                   	push   %rbp
   17911:	41 57                	push   %r15
   17913:	41 56                	push   %r14
   17915:	41 55                	push   %r13
   17917:	41 54                	push   %r12
   17919:	53                   	push   %rbx
   1791a:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
   17921:	89 f5                	mov    %esi,%ebp
   17923:	48 89 fb             	mov    %rdi,%rbx
   17926:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1792b:	f2 0f 11 84 24 98 00 	movsd  %xmm0,0x98(%rsp)
   17932:	00 00 
   17934:	66 0f d6 4c 24 60    	movq   %xmm1,0x60(%rsp)
   1793a:	ff 15 e0 7b 04 00    	call   *0x47be0(%rip)        # 5f520 <_DYNAMIC+0x2e0>
   17940:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   17945:	44 0f b6 64 24 18    	movzbl 0x18(%rsp),%r12d
   1794b:	49 83 ff 02          	cmp    $0x2,%r15
   1794f:	75 09                	jne    1795a <hyperinterval_strict_surface64+0x4a>
   17951:	44 88 63 08          	mov    %r12b,0x8(%rbx)
   17955:	e9 9c 00 00 00       	jmp    179f6 <hyperinterval_strict_surface64+0xe6>
   1795a:	44 0f b6 74 24 1f    	movzbl 0x1f(%rsp),%r14d
   17960:	44 0f b7 6c 24 1d    	movzwl 0x1d(%rsp),%r13d
   17966:	8b 44 24 19          	mov    0x19(%rsp),%eax
   1796a:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1796f:	4c 89 7c 24 68       	mov    %r15,0x68(%rsp)
   17974:	44 88 64 24 70       	mov    %r12b,0x70(%rsp)
   17979:	44 88 74 24 77       	mov    %r14b,0x77(%rsp)
   1797e:	66 44 89 6c 24 75    	mov    %r13w,0x75(%rsp)
   17984:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
   1798b:	00 
   1798c:	89 44 24 71          	mov    %eax,0x71(%rsp)
   17990:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
   17997:	00 
   17998:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   1799d:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   179a4:	00 
   179a5:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
   179ac:	00 00 
   179ae:	ff 15 2c 7c 04 00    	call   *0x47c2c(%rip)        # 5f5e0 <_DYNAMIC+0x3a0>
   179b4:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
   179bb:	01 
   179bc:	74 2d                	je     179eb <hyperinterval_strict_surface64+0xdb>
   179be:	f2 0f 10 84 24 d8 00 	movsd  0xd8(%rsp),%xmm0
   179c5:	00 00 
   179c7:	f2 0f 11 44 24 58    	movsd  %xmm0,0x58(%rsp)
   179cd:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
   179d4:	00 
   179d5:	f2 0f 10 44 24 60    	movsd  0x60(%rsp),%xmm0
   179db:	ff 15 07 7c 04 00    	call   *0x47c07(%rip)        # 5f5e8 <_DYNAMIC+0x3a8>
   179e1:	80 bc 24 d0 00 00 00 	cmpb   $0x1,0xd0(%rsp)
   179e8:	01 
   179e9:	75 27                	jne    17a12 <hyperinterval_strict_surface64+0x102>
   179eb:	0f b6 84 24 d1 00 00 	movzbl 0xd1(%rsp),%eax
   179f2:	00 
   179f3:	88 43 08             	mov    %al,0x8(%rbx)
   179f6:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   179fd:	48 89 d8             	mov    %rbx,%rax
   17a00:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
   17a07:	5b                   	pop    %rbx
   17a08:	41 5c                	pop    %r12
   17a0a:	41 5d                	pop    %r13
   17a0c:	41 5e                	pop    %r14
   17a0e:	41 5f                	pop    %r15
   17a10:	5d                   	pop    %rbp
   17a11:	c3                   	ret
   17a12:	f3 0f 7e 8c 24 d8 00 	movq   0xd8(%rsp),%xmm1
   17a19:	00 00 
   17a1b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17a20:	f2 0f 10 44 24 58    	movsd  0x58(%rsp),%xmm0
   17a26:	ff 15 f4 7a 04 00    	call   *0x47af4(%rip)        # 5f520 <_DYNAMIC+0x2e0>
   17a2c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17a31:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17a36:	48 83 f9 02          	cmp    $0x2,%rcx
   17a3a:	74 b7                	je     179f3 <hyperinterval_strict_surface64+0xe3>
   17a3c:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17a41:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17a46:	48 89 b4 24 b0 00 00 	mov    %rsi,0xb0(%rsp)
   17a4d:	00 
   17a4e:	48 89 94 24 a9 00 00 	mov    %rdx,0xa9(%rsp)
   17a55:	00 
   17a56:	48 89 8c 24 a0 00 00 	mov    %rcx,0xa0(%rsp)
   17a5d:	00 
   17a5e:	88 84 24 a8 00 00 00 	mov    %al,0xa8(%rsp)
   17a65:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17a6a:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17a6f:	89 ea                	mov    %ebp,%edx
   17a71:	ff 15 79 7b 04 00    	call   *0x47b79(%rip)        # 5f5f0 <_DYNAMIC+0x3b0>
   17a77:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17a7c:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17a81:	48 83 f9 02          	cmp    $0x2,%rcx
   17a85:	0f 84 68 ff ff ff    	je     179f3 <hyperinterval_strict_surface64+0xe3>
   17a8b:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17a90:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17a95:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
   17a9c:	00 
   17a9d:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
   17aa4:	00 
   17aa5:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   17aac:	00 
   17aad:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
   17ab4:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
   17abb:	00 
   17abc:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
   17ac3:	00 
   17ac4:	ff 15 2e 7b 04 00    	call   *0x47b2e(%rip)        # 5f5f8 <_DYNAMIC+0x3b8>
   17aca:	48 8b 8c 24 b8 00 00 	mov    0xb8(%rsp),%rcx
   17ad1:	00 
   17ad2:	0f b6 84 24 c0 00 00 	movzbl 0xc0(%rsp),%eax
   17ad9:	00 
   17ada:	48 83 f9 02          	cmp    $0x2,%rcx
   17ade:	0f 84 0f ff ff ff    	je     179f3 <hyperinterval_strict_surface64+0xe3>
   17ae4:	48 8b 94 24 c1 00 00 	mov    0xc1(%rsp),%rdx
   17aeb:	00 
   17aec:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
   17af3:	00 
   17af4:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17afb:	00 
   17afc:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17b03:	00 
   17b04:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17b0b:	00 
   17b0c:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17b13:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
   17b1a:	00 
   17b1b:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17b22:	00 
   17b23:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17b2a:	00 
   17b2b:	ff 15 cf 7a 04 00    	call   *0x47acf(%rip)        # 5f600 <_DYNAMIC+0x3c0>
   17b31:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
   17b38:	00 
   17b39:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   17b3e:	48 89 ef             	mov    %rbp,%rdi
   17b41:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
   17b48:	00 
   17b49:	ff 15 b9 7a 04 00    	call   *0x47ab9(%rip)        # 5f608 <_DYNAMIC+0x3c8>
   17b4f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17b54:	48 89 ee             	mov    %rbp,%rsi
   17b57:	e8 04 f5 ff ff       	call   17060 <hyperinterval::float::F64Enclosure::abs>
   17b5c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   17b61:	48 89 ee             	mov    %rbp,%rsi
   17b64:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17b6b:	00 
   17b6c:	ff 15 9e 7a 04 00    	call   *0x47a9e(%rip)        # 5f610 <_DYNAMIC+0x3d0>
   17b72:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   17b77:	48 89 ee             	mov    %rbp,%rsi
   17b7a:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   17b81:	00 
   17b82:	ff 15 90 7a 04 00    	call   *0x47a90(%rip)        # 5f618 <_DYNAMIC+0x3d8>
   17b88:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   17b8d:	48 89 84 24 10 01 00 	mov    %rax,0x110(%rsp)
   17b94:	00 
   17b95:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   17b9a:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   17b9f:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   17ba4:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   17ba9:	0f 29 9c 24 00 01 00 	movaps %xmm3,0x100(%rsp)
   17bb0:	00 
   17bb1:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
   17bb8:	00 
   17bb9:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
   17bc0:	00 
   17bc1:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
   17bc8:	00 
   17bc9:	48 8d 84 24 d0 00 00 	lea    0xd0(%rsp),%rax
   17bd0:	00 
   17bd1:	48 89 ef             	mov    %rbp,%rdi
   17bd4:	ff 15 46 7a 04 00    	call   *0x47a46(%rip)        # 5f620 <_DYNAMIC+0x3e0>
   17bda:	48 8b 8c 24 28 01 00 	mov    0x128(%rsp),%rcx
   17be1:	00 
   17be2:	48 83 f9 01          	cmp    $0x1,%rcx
   17be6:	75 27                	jne    17c0f <hyperinterval_strict_surface64+0x2ff>
   17be8:	48 8b b4 24 30 01 00 	mov    0x130(%rsp),%rsi
   17bef:	00 
   17bf0:	48 8b bc 24 38 01 00 	mov    0x138(%rsp),%rdi
   17bf7:	00 
   17bf8:	48 39 fe             	cmp    %rdi,%rsi
   17bfb:	0f 94 c2             	sete   %dl
   17bfe:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   17c03:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   17c08:	be 01 00 00 00       	mov    $0x1,%esi
   17c0d:	eb 04                	jmp    17c13 <hyperinterval_strict_surface64+0x303>
   17c0f:	31 d2                	xor    %edx,%edx
   17c11:	31 f6                	xor    %esi,%esi
   17c13:	80 f1 01             	xor    $0x1,%cl
   17c16:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
   17c1b:	66 0f d6 4c 24 18    	movq   %xmm1,0x18(%rsp)
   17c21:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   17c25:	88 54 24 21          	mov    %dl,0x21(%rsp)
   17c29:	88 44 24 22          	mov    %al,0x22(%rsp)
   17c2d:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   17c32:	66 0f d6 44 24 30    	movq   %xmm0,0x30(%rsp)
   17c38:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17c3d:	48 8d ac 24 28 01 00 	lea    0x128(%rsp),%rbp
   17c44:	00 
   17c45:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17c4c:	00 
   17c4d:	48 89 ef             	mov    %rbp,%rdi
   17c50:	ff 15 d2 79 04 00    	call   *0x479d2(%rip)        # 5f628 <_DYNAMIC+0x3e8>
   17c56:	88 44 24 60          	mov    %al,0x60(%rsp)
   17c5a:	48 89 ef             	mov    %rbp,%rdi
   17c5d:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
   17c64:	00 
   17c65:	ff 15 c5 79 04 00    	call   *0x479c5(%rip)        # 5f630 <_DYNAMIC+0x3f0>
   17c6b:	88 44 24 58          	mov    %al,0x58(%rsp)
   17c6f:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17c74:	48 89 ef             	mov    %rbp,%rdi
   17c77:	ff 15 bb 79 04 00    	call   *0x479bb(%rip)        # 5f638 <_DYNAMIC+0x3f8>
   17c7d:	88 44 24 0f          	mov    %al,0xf(%rsp)
   17c81:	48 89 ef             	mov    %rbp,%rdi
   17c84:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   17c89:	ff 15 b1 79 04 00    	call   *0x479b1(%rip)        # 5f640 <_DYNAMIC+0x400>
   17c8f:	88 44 24 0e          	mov    %al,0xe(%rsp)
   17c93:	48 89 ef             	mov    %rbp,%rdi
   17c96:	f2 0f 10 84 24 98 00 	movsd  0x98(%rsp),%xmm0
   17c9d:	00 00 
   17c9f:	ff 15 db 77 04 00    	call   *0x477db(%rip)        # 5f480 <_DYNAMIC+0x240>
   17ca5:	a8 01                	test   $0x1,%al
   17ca7:	74 08                	je     17cb1 <hyperinterval_strict_surface64+0x3a1>
   17ca9:	88 53 08             	mov    %dl,0x8(%rbx)
   17cac:	e9 45 fd ff ff       	jmp    179f6 <hyperinterval_strict_surface64+0xe6>
   17cb1:	80 e2 01             	and    $0x1,%dl
   17cb4:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   17cb9:	88 44 24 10          	mov    %al,0x10(%rsp)
   17cbd:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   17cc2:	88 44 24 11          	mov    %al,0x11(%rsp)
   17cc6:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
   17ccb:	88 44 24 12          	mov    %al,0x12(%rsp)
   17ccf:	0f b6 44 24 0e       	movzbl 0xe(%rsp),%eax
   17cd4:	88 44 24 13          	mov    %al,0x13(%rsp)
   17cd8:	88 54 24 14          	mov    %dl,0x14(%rsp)
   17cdc:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
   17ce1:	41 83 ff 01          	cmp    $0x1,%r15d
   17ce5:	75 51                	jne    17d38 <hyperinterval_strict_surface64+0x428>
   17ce7:	41 c1 e6 10          	shl    $0x10,%r14d
   17ceb:	45 09 f5             	or     %r14d,%r13d
   17cee:	41 0f b6 c4          	movzbl %r12b,%eax
   17cf2:	49 c1 e5 20          	shl    $0x20,%r13
   17cf6:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
   17cfd:	00 
   17cfe:	4c 09 ea             	or     %r13,%rdx
   17d01:	48 c1 e2 08          	shl    $0x8,%rdx
   17d05:	48 09 c2             	or     %rax,%rdx
   17d08:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   17d0f:	00 00 80 
   17d12:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
   17d19:	00 
   17d1a:	48 89 f1             	mov    %rsi,%rcx
   17d1d:	48 31 c1             	xor    %rax,%rcx
   17d20:	48 85 f6             	test   %rsi,%rsi
   17d23:	48 0f 44 ce          	cmove  %rsi,%rcx
   17d27:	48 31 d0             	xor    %rdx,%rax
   17d2a:	48 85 d2             	test   %rdx,%rdx
   17d2d:	48 0f 44 c2          	cmove  %rdx,%rax
   17d31:	ba 01 00 00 00       	mov    $0x1,%edx
   17d36:	eb 02                	jmp    17d3a <hyperinterval_strict_surface64+0x42a>
   17d38:	31 d2                	xor    %edx,%edx
   17d3a:	48 89 94 24 b8 00 00 	mov    %rdx,0xb8(%rsp)
   17d41:	00 
   17d42:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
   17d49:	00 
   17d4a:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
   17d51:	00 
   17d52:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17d57:	48 8d b4 24 28 01 00 	lea    0x128(%rsp),%rsi
   17d5e:	00 
   17d5f:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
   17d66:	00 
   17d67:	ff 15 db 78 04 00    	call   *0x478db(%rip)        # 5f648 <_DYNAMIC+0x408>
   17d6d:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17d72:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17d77:	48 83 f9 02          	cmp    $0x2,%rcx
   17d7b:	0f 84 72 fc ff ff    	je     179f3 <hyperinterval_strict_surface64+0xe3>
   17d81:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17d86:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17d8b:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   17d92:	00 
   17d93:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   17d9a:	00 
   17d9b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   17da2:	00 
   17da3:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   17daa:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   17daf:	f2 0f 10 05 79 da fe 	movsd  -0x12587(%rip),%xmm0        # 5830 <__abi_tag+0x5534>
   17db6:	ff 
   17db7:	ff 15 7b 77 04 00    	call   *0x4777b(%rip)        # 5f538 <_DYNAMIC+0x2f8>
   17dbd:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   17dc2:	0f b6 44 24 18       	movzbl 0x18(%rsp),%eax
   17dc7:	48 83 f9 02          	cmp    $0x2,%rcx
   17dcb:	0f 84 22 fc ff ff    	je     179f3 <hyperinterval_strict_surface64+0xe3>
   17dd1:	48 8b 54 24 19       	mov    0x19(%rsp),%rdx
   17dd6:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   17ddb:	48 89 b4 24 e0 00 00 	mov    %rsi,0xe0(%rsp)
   17de2:	00 
   17de3:	48 89 94 24 d9 00 00 	mov    %rdx,0xd9(%rsp)
   17dea:	00 
   17deb:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   17df2:	00 
   17df3:	88 84 24 d8 00 00 00 	mov    %al,0xd8(%rsp)
   17dfa:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   17e01:	00 
   17e02:	48 8d 94 24 d0 00 00 	lea    0xd0(%rsp),%rdx
   17e09:	00 
   17e0a:	48 89 df             	mov    %rbx,%rdi
   17e0d:	ff 15 3d 78 04 00    	call   *0x4783d(%rip)        # 5f650 <_DYNAMIC+0x410>
   17e13:	e9 e5 fb ff ff       	jmp    179fd <hyperinterval_strict_surface64+0xed>
   17e18:	cc                   	int3
   17e19:	cc                   	int3
   17e1a:	cc                   	int3
   17e1b:	cc                   	int3
   17e1c:	cc                   	int3
   17e1d:	cc                   	int3
   17e1e:	cc                   	int3
   17e1f:	cc                   	int3

hyperinterval::float::F32Enclosure::reciprocal:
   17ea0:	41 57                	push   %r15
   17ea2:	41 56                	push   %r14
   17ea4:	41 54                	push   %r12
   17ea6:	53                   	push   %rbx
   17ea7:	48 83 ec 28          	sub    $0x28,%rsp
   17eab:	48 89 fb             	mov    %rdi,%rbx
   17eae:	83 3e 00             	cmpl   $0x0,(%rsi)
   17eb1:	74 5e                	je     17f11 <hyperinterval::float::F32Enclosure::reciprocal+0x71>
   17eb3:	49 89 f6             	mov    %rsi,%r14
   17eb6:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   17ebc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ec1:	be 00 00 00 80       	mov    $0x80000000,%esi
   17ec6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ecb:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17ed0:	e8 8b 4f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   17ed5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17eda:	74 25                	je     17f01 <hyperinterval::float::F32Enclosure::reciprocal+0x61>
   17edc:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   17ee1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ee6:	be 00 00 00 80       	mov    $0x80000000,%esi
   17eeb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   17ef0:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   17ef5:	e8 66 4f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   17efa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   17eff:	75 25                	jne    17f26 <hyperinterval::float::F32Enclosure::reciprocal+0x86>
   17f01:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   17f06:	88 4b 04             	mov    %cl,0x4(%rbx)
   17f09:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   17f0f:	eb 06                	jmp    17f17 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17f11:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   17f17:	48 89 d8             	mov    %rbx,%rax
   17f1a:	48 83 c4 28          	add    $0x28,%rsp
   17f1e:	5b                   	pop    %rbx
   17f1f:	41 5c                	pop    %r12
   17f21:	41 5e                	pop    %r14
   17f23:	41 5f                	pop    %r15
   17f25:	c3                   	ret
   17f26:	8b 44 24 10          	mov    0x10(%rsp),%eax
   17f2a:	44 89 e1             	mov    %r12d,%ecx
   17f2d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   17f33:	89 c2                	mov    %eax,%edx
   17f35:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   17f3b:	be 00 00 00 80       	mov    $0x80000000,%esi
   17f40:	29 ce                	sub    %ecx,%esi
   17f42:	44 09 f9             	or     %r15d,%ecx
   17f45:	45 85 e4             	test   %r12d,%r12d
   17f48:	48 0f 49 f1          	cmovns %rcx,%rsi
   17f4c:	89 d1                	mov    %edx,%ecx
   17f4e:	44 09 f9             	or     %r15d,%ecx
   17f51:	41 29 d7             	sub    %edx,%r15d
   17f54:	85 c0                	test   %eax,%eax
   17f56:	4c 0f 49 f9          	cmovns %rcx,%r15
   17f5a:	b1 01                	mov    $0x1,%cl
   17f5c:	44 39 fe             	cmp    %r15d,%esi
   17f5f:	77 a5                	ja     17f06 <hyperinterval::float::F32Enclosure::reciprocal+0x66>
   17f61:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%rsp)
   17f68:	00 
   17f69:	44 89 64 24 20       	mov    %r12d,0x20(%rsp)
   17f6e:	89 44 24 24          	mov    %eax,0x24(%rsp)
   17f72:	41 83 7e 04 00       	cmpl   $0x0,0x4(%r14)
   17f77:	7f 15                	jg     17f8e <hyperinterval::float::F32Enclosure::reciprocal+0xee>
   17f79:	41 8b 46 08          	mov    0x8(%r14),%eax
   17f7d:	85 c0                	test   %eax,%eax
   17f7f:	0f 99 c1             	setns  %cl
   17f82:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   17f87:	0f 94 c0             	sete   %al
   17f8a:	08 c8                	or     %cl,%al
   17f8c:	75 1a                	jne    17fa8 <hyperinterval::float::F32Enclosure::reciprocal+0x108>
   17f8e:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   17f93:	48 89 df             	mov    %rbx,%rdi
   17f96:	4c 89 f2             	mov    %r14,%rdx
   17f99:	b9 01 00 00 00       	mov    $0x1,%ecx
   17f9e:	e8 8d 02 00 00       	call   18230 <hyperinterval::float::F32Enclosure::corner_image>
   17fa3:	e9 6f ff ff ff       	jmp    17f17 <hyperinterval::float::F32Enclosure::reciprocal+0x77>
   17fa8:	c6 43 04 06          	movb   $0x6,0x4(%rbx)
   17fac:	e9 58 ff ff ff       	jmp    17f09 <hyperinterval::float::F32Enclosure::reciprocal+0x69>
   17fb1:	cc                   	int3
   17fb2:	cc                   	int3
   17fb3:	cc                   	int3
   17fb4:	cc                   	int3
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

hyperinterval::float::F32Enclosure::checked_pow:
   17fc0:	55                   	push   %rbp
   17fc1:	41 57                	push   %r15
   17fc3:	41 56                	push   %r14
   17fc5:	41 55                	push   %r13
   17fc7:	41 54                	push   %r12
   17fc9:	53                   	push   %rbx
   17fca:	48 83 ec 38          	sub    $0x38,%rsp
   17fce:	48 89 fb             	mov    %rdi,%rbx
   17fd1:	83 fa 02             	cmp    $0x2,%edx
   17fd4:	75 0e                	jne    17fe4 <hyperinterval::float::F32Enclosure::checked_pow+0x24>
   17fd6:	48 89 df             	mov    %rbx,%rdi
   17fd9:	ff 15 21 75 04 00    	call   *0x47521(%rip)        # 5f500 <_DYNAMIC+0x2c0>
   17fdf:	e9 c8 00 00 00       	jmp    180ac <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   17fe4:	f6 06 01             	testb  $0x1,(%rsi)
   17fe7:	0f 84 b9 00 00 00    	je     180a6 <hyperinterval::float::F32Enclosure::checked_pow+0xe6>
   17fed:	89 d5                	mov    %edx,%ebp
   17fef:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   17ff3:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   17ff7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   17ffc:	be 00 00 00 80       	mov    $0x80000000,%esi
   18001:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18006:	4c 89 f9             	mov    %r15,%rcx
   18009:	41 89 e8             	mov    %ebp,%r8d
   1800c:	e8 5f 46 00 00       	call   1c670 <hyperinterval::ieee::Format::power>
   18011:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18016:	75 7e                	jne    18096 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18018:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   1801d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18022:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18027:	be 00 00 00 80       	mov    $0x80000000,%esi
   1802c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18031:	4c 89 f1             	mov    %r14,%rcx
   18034:	41 89 e8             	mov    %ebp,%r8d
   18037:	e8 34 46 00 00       	call   1c670 <hyperinterval::ieee::Format::power>
   1803c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18041:	74 53                	je     18096 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18043:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18047:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1804c:	8b 44 24 18          	mov    0x18(%rsp),%eax
   18050:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   18055:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1805a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1805f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18064:	4c 89 e1             	mov    %r12,%rcx
   18067:	e8 f4 4d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1806c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18071:	74 23                	je     18096 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18073:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18078:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1807d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18082:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18087:	4c 89 e9             	mov    %r13,%rcx
   1808a:	e8 d1 4d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1808f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18094:	75 28                	jne    180be <hyperinterval::float::F32Enclosure::checked_pow+0xfe>
   18096:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1809b:	88 43 04             	mov    %al,0x4(%rbx)
   1809e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   180a4:	eb 06                	jmp    180ac <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   180a6:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   180ac:	48 89 d8             	mov    %rbx,%rax
   180af:	48 83 c4 38          	add    $0x38,%rsp
   180b3:	5b                   	pop    %rbx
   180b4:	41 5c                	pop    %r12
   180b6:	41 5d                	pop    %r13
   180b8:	41 5e                	pop    %r14
   180ba:	41 5f                	pop    %r15
   180bc:	5d                   	pop    %rbp
   180bd:	c3                   	ret
   180be:	8b 7c 24 10          	mov    0x10(%rsp),%edi
   180c2:	44 89 e0             	mov    %r12d,%eax
   180c5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   180ca:	89 f9                	mov    %edi,%ecx
   180cc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   180d2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   180d7:	29 c2                	sub    %eax,%edx
   180d9:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   180df:	44 09 e8             	or     %r13d,%eax
   180e2:	45 85 e4             	test   %r12d,%r12d
   180e5:	48 0f 49 d0          	cmovns %rax,%rdx
   180e9:	be 00 00 00 80       	mov    $0x80000000,%esi
   180ee:	29 ce                	sub    %ecx,%esi
   180f0:	89 c8                	mov    %ecx,%eax
   180f2:	44 09 e8             	or     %r13d,%eax
   180f5:	85 ff                	test   %edi,%edi
   180f7:	48 0f 49 f0          	cmovns %rax,%rsi
   180fb:	b0 01                	mov    $0x1,%al
   180fd:	39 f2                	cmp    %esi,%edx
   180ff:	77 9a                	ja     1809b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   18101:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)
   18105:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1810a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1810f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18114:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   18119:	e8 42 4d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1811e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18123:	0f 84 6d ff ff ff    	je     18096 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18129:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
   1812e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   18133:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18138:	be 00 00 00 80       	mov    $0x80000000,%esi
   1813d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18142:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   18147:	e8 14 4d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1814c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18151:	0f 84 3f ff ff ff    	je     18096 <hyperinterval::float::F32Enclosure::checked_pow+0xd6>
   18157:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1815b:	44 89 e0             	mov    %r12d,%eax
   1815e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18163:	89 ca                	mov    %ecx,%edx
   18165:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1816b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18170:	29 c6                	sub    %eax,%esi
   18172:	44 09 e8             	or     %r13d,%eax
   18175:	45 85 e4             	test   %r12d,%r12d
   18178:	48 0f 49 f0          	cmovns %rax,%rsi
   1817c:	89 d0                	mov    %edx,%eax
   1817e:	44 09 e8             	or     %r13d,%eax
   18181:	41 29 d5             	sub    %edx,%r13d
   18184:	85 c9                	test   %ecx,%ecx
   18186:	4c 0f 49 e8          	cmovns %rax,%r13
   1818a:	b0 01                	mov    $0x1,%al
   1818c:	44 39 ee             	cmp    %r13d,%esi
   1818f:	0f 87 06 ff ff ff    	ja     1809b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   18195:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1819a:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   1819e:	44 89 e2             	mov    %r12d,%edx
   181a1:	e8 9a 54 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   181a6:	41 89 c5             	mov    %eax,%r13d
   181a9:	41 89 d4             	mov    %edx,%r12d
   181ac:	85 ed                	test   %ebp,%ebp
   181ae:	0f 95 c0             	setne  %al
   181b1:	40 f6 c5 01          	test   $0x1,%bpl
   181b5:	0f 94 c1             	sete   %cl
   181b8:	84 c8                	test   %cl,%al
   181ba:	74 11                	je     181cd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   181bc:	44 89 ff             	mov    %r15d,%edi
   181bf:	44 89 f6             	mov    %r14d,%esi
   181c2:	31 d2                	xor    %edx,%edx
   181c4:	e8 27 56 00 00       	call   1d7f0 <hyperinterval::bounds::Bounds<T>::signs>
   181c9:	a8 02                	test   $0x2,%al
   181cb:	75 13                	jne    181e0 <hyperinterval::float::F32Enclosure::checked_pow+0x220>
   181cd:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   181d3:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   181d7:	44 89 63 08          	mov    %r12d,0x8(%rbx)
   181db:	e9 cc fe ff ff       	jmp    180ac <hyperinterval::float::F32Enclosure::checked_pow+0xec>
   181e0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   181e5:	31 f6                	xor    %esi,%esi
   181e7:	31 d2                	xor    %edx,%edx
   181e9:	e8 52 17 00 00       	call   19940 <hyperinterval::float::F32Enclosure::from_bits>
   181ee:	8b 44 24 08          	mov    0x8(%rsp),%eax
   181f2:	83 f8 02             	cmp    $0x2,%eax
   181f5:	75 0a                	jne    18201 <hyperinterval::float::F32Enclosure::checked_pow+0x241>
   181f7:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   181fc:	e9 9a fe ff ff       	jmp    1809b <hyperinterval::float::F32Enclosure::checked_pow+0xdb>
   18201:	83 f8 01             	cmp    $0x1,%eax
   18204:	75 c7                	jne    181cd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   18206:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   1820a:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1820e:	44 89 ef             	mov    %r13d,%edi
   18211:	44 89 e6             	mov    %r12d,%esi
   18214:	e8 27 54 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   18219:	41 89 c5             	mov    %eax,%r13d
   1821c:	41 89 d4             	mov    %edx,%r12d
   1821f:	eb ac                	jmp    181cd <hyperinterval::float::F32Enclosure::checked_pow+0x20d>
   18221:	cc                   	int3
   18222:	cc                   	int3
   18223:	cc                   	int3
   18224:	cc                   	int3
   18225:	cc                   	int3
   18226:	cc                   	int3
   18227:	cc                   	int3
   18228:	cc                   	int3
   18229:	cc                   	int3
   1822a:	cc                   	int3
   1822b:	cc                   	int3
   1822c:	cc                   	int3
   1822d:	cc                   	int3
   1822e:	cc                   	int3
   1822f:	cc                   	int3

hyperinterval::float::F32Enclosure::corner_image:
   18230:	55                   	push   %rbp
   18231:	41 57                	push   %r15
   18233:	41 56                	push   %r14
   18235:	41 55                	push   %r13
   18237:	41 54                	push   %r12
   18239:	53                   	push   %rbx
   1823a:	48 83 ec 58          	sub    $0x58,%rsp
   1823e:	48 89 fb             	mov    %rdi,%rbx
   18241:	f6 06 01             	testb  $0x1,(%rsi)
   18244:	74 49                	je     1828f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   18246:	f6 02 01             	testb  $0x1,(%rdx)
   18249:	74 44                	je     1828f <hyperinterval::float::F32Enclosure::corner_image+0x5f>
   1824b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   1824f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18253:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18257:	8b 46 08             	mov    0x8(%rsi),%eax
   1825a:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1825f:	84 c9                	test   %cl,%cl
   18261:	74 37                	je     1829a <hyperinterval::float::F32Enclosure::corner_image+0x6a>
   18263:	48 89 e7             	mov    %rsp,%rdi
   18266:	be 00 00 00 80       	mov    $0x80000000,%esi
   1826b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18270:	4c 89 e9             	mov    %r13,%rcx
   18273:	4d 89 e0             	mov    %r12,%r8
   18276:	e8 85 3c 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   1827b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1827f:	0f 84 bf 00 00 00    	je     18344 <hyperinterval::float::F32Enclosure::corner_image+0x114>
   18285:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1828a:	e9 ad 00 00 00       	jmp    1833c <hyperinterval::float::F32Enclosure::corner_image+0x10c>
   1828f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18295:	e9 42 03 00 00       	jmp    185dc <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   1829a:	44 89 e8             	mov    %r13d,%eax
   1829d:	c1 e8 17             	shr    $0x17,%eax
   182a0:	0f b6 d0             	movzbl %al,%edx
   182a3:	44 89 ee             	mov    %r13d,%esi
   182a6:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   182ac:	31 c9                	xor    %ecx,%ecx
   182ae:	85 d2                	test   %edx,%edx
   182b0:	0f 95 c1             	setne  %cl
   182b3:	b8 01 00 00 00       	mov    $0x1,%eax
   182b8:	0f 45 c2             	cmovne %edx,%eax
   182bb:	c1 e1 17             	shl    $0x17,%ecx
   182be:	48 09 f1             	or     %rsi,%rcx
   182c1:	44 89 e2             	mov    %r12d,%edx
   182c4:	c1 ea 17             	shr    $0x17,%edx
   182c7:	0f b6 d2             	movzbl %dl,%edx
   182ca:	44 89 e6             	mov    %r12d,%esi
   182cd:	81 e6 ff ff 7f 00    	and    $0x7fffff,%esi
   182d3:	8d ba d4 fe ff ff    	lea    -0x12c(%rdx),%edi
   182d9:	45 31 c0             	xor    %r8d,%r8d
   182dc:	85 d2                	test   %edx,%edx
   182de:	ba d5 fe ff ff       	mov    $0xfffffed5,%edx
   182e3:	0f 45 d7             	cmovne %edi,%edx
   182e6:	41 0f 95 c0          	setne  %r8b
   182ea:	41 c1 e0 17          	shl    $0x17,%r8d
   182ee:	49 09 f0             	or     %rsi,%r8
   182f1:	4c 0f af c1          	imul   %rcx,%r8
   182f5:	44 89 e9             	mov    %r13d,%ecx
   182f8:	44 31 e1             	xor    %r12d,%ecx
   182fb:	01 c2                	add    %eax,%edx
   182fd:	c1 e9 1f             	shr    $0x1f,%ecx
   18300:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   18304:	4c 89 04 24          	mov    %r8,(%rsp)
   18308:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1830f:	00 00 
   18311:	89 54 24 10          	mov    %edx,0x10(%rsp)
   18315:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1831a:	48 89 e1             	mov    %rsp,%rcx
   1831d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18322:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18327:	e8 74 4b 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1832c:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18331:	0f 84 54 02 00 00    	je     1858b <hyperinterval::float::F32Enclosure::corner_image+0x35b>
   18337:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1833c:	88 43 04             	mov    %al,0x4(%rbx)
   1833f:	e9 92 02 00 00       	jmp    185d6 <hyperinterval::float::F32Enclosure::corner_image+0x3a6>
   18344:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18348:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1834d:	48 89 e7             	mov    %rsp,%rdi
   18350:	be 00 00 00 80       	mov    $0x80000000,%esi
   18355:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1835a:	e8 01 4b 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1835f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18363:	0f 85 63 02 00 00    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18369:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1836e:	48 89 e7             	mov    %rsp,%rdi
   18371:	be 00 00 00 80       	mov    $0x80000000,%esi
   18376:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1837b:	4c 89 f9             	mov    %r15,%rcx
   1837e:	e8 dd 4a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18383:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18387:	0f 85 3f 02 00 00    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1838d:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   18391:	89 e8                	mov    %ebp,%eax
   18393:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18398:	89 f9                	mov    %edi,%ecx
   1839a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   183a0:	ba 00 00 00 80       	mov    $0x80000000,%edx
   183a5:	29 c2                	sub    %eax,%edx
   183a7:	be 00 00 00 80       	mov    $0x80000000,%esi
   183ac:	09 f0                	or     %esi,%eax
   183ae:	85 ed                	test   %ebp,%ebp
   183b0:	48 0f 49 d0          	cmovns %rax,%rdx
   183b4:	b8 00 00 00 80       	mov    $0x80000000,%eax
   183b9:	29 c8                	sub    %ecx,%eax
   183bb:	09 f1                	or     %esi,%ecx
   183bd:	85 ff                	test   %edi,%edi
   183bf:	48 0f 49 c1          	cmovns %rcx,%rax
   183c3:	41 b7 01             	mov    $0x1,%r15b
   183c6:	39 c2                	cmp    %eax,%edx
   183c8:	0f 87 04 02 00 00    	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   183ce:	89 7c 24 50          	mov    %edi,0x50(%rsp)
   183d2:	48 89 6c 24 28       	mov    %rbp,0x28(%rsp)
   183d7:	48 89 e7             	mov    %rsp,%rdi
   183da:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   183df:	4c 89 e9             	mov    %r13,%rcx
   183e2:	4d 89 f0             	mov    %r14,%r8
   183e5:	e8 16 3b 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   183ea:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   183ee:	0f 85 91 fe ff ff    	jne    18285 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   183f4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   183f8:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   183fd:	48 89 e7             	mov    %rsp,%rdi
   18400:	be 00 00 00 80       	mov    $0x80000000,%esi
   18405:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1840a:	e8 51 4a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1840f:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18413:	0f 85 b3 01 00 00    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18419:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1841e:	48 89 e7             	mov    %rsp,%rdi
   18421:	be 00 00 00 80       	mov    $0x80000000,%esi
   18426:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1842b:	4c 89 e9             	mov    %r13,%rcx
   1842e:	e8 2d 4a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18433:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18437:	0f 85 8f 01 00 00    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1843d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18441:	89 e8                	mov    %ebp,%eax
   18443:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18448:	89 ca                	mov    %ecx,%edx
   1844a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18450:	be 00 00 00 80       	mov    $0x80000000,%esi
   18455:	29 c6                	sub    %eax,%esi
   18457:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1845c:	09 f8                	or     %edi,%eax
   1845e:	85 ed                	test   %ebp,%ebp
   18460:	48 0f 49 f0          	cmovns %rax,%rsi
   18464:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18469:	29 d0                	sub    %edx,%eax
   1846b:	09 fa                	or     %edi,%edx
   1846d:	85 c9                	test   %ecx,%ecx
   1846f:	48 0f 49 c2          	cmovns %rdx,%rax
   18473:	39 c6                	cmp    %eax,%esi
   18475:	0f 87 57 01 00 00    	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   1847b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   18480:	8b 74 24 50          	mov    0x50(%rsp),%esi
   18484:	89 ea                	mov    %ebp,%edx
   18486:	e8 b5 51 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   1848b:	89 c5                	mov    %eax,%ebp
   1848d:	41 89 d5             	mov    %edx,%r13d
   18490:	48 89 e7             	mov    %rsp,%rdi
   18493:	be 00 00 00 80       	mov    $0x80000000,%esi
   18498:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1849d:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   184a2:	4d 89 e0             	mov    %r12,%r8
   184a5:	e8 56 3a 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   184aa:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   184ae:	0f 85 d1 fd ff ff    	jne    18285 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   184b4:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   184b8:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   184bd:	48 89 e7             	mov    %rsp,%rdi
   184c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   184c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   184ca:	e8 91 49 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   184cf:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   184d3:	0f 85 f3 00 00 00    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   184d9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   184de:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   184e3:	48 89 e7             	mov    %rsp,%rdi
   184e6:	be 00 00 00 80       	mov    $0x80000000,%esi
   184eb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   184f0:	4c 89 e1             	mov    %r12,%rcx
   184f3:	e8 68 49 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   184f8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   184fc:	0f 85 ca 00 00 00    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18502:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18506:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1850b:	89 d0                	mov    %edx,%eax
   1850d:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18512:	41 89 c8             	mov    %ecx,%r8d
   18515:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1851c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18521:	29 c6                	sub    %eax,%esi
   18523:	bf 00 00 00 80       	mov    $0x80000000,%edi
   18528:	09 f8                	or     %edi,%eax
   1852a:	85 d2                	test   %edx,%edx
   1852c:	48 0f 49 f0          	cmovns %rax,%rsi
   18530:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18535:	44 29 c0             	sub    %r8d,%eax
   18538:	41 09 f8             	or     %edi,%r8d
   1853b:	85 c9                	test   %ecx,%ecx
   1853d:	49 0f 49 c0          	cmovns %r8,%rax
   18541:	39 c6                	cmp    %eax,%esi
   18543:	0f 87 89 00 00 00    	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   18549:	89 ef                	mov    %ebp,%edi
   1854b:	44 89 ee             	mov    %r13d,%esi
   1854e:	e8 ed 50 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   18553:	41 89 c5             	mov    %eax,%r13d
   18556:	41 89 d4             	mov    %edx,%r12d
   18559:	48 89 e7             	mov    %rsp,%rdi
   1855c:	be 00 00 00 80       	mov    $0x80000000,%esi
   18561:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18566:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1856b:	4d 89 f0             	mov    %r14,%r8
   1856e:	e8 8d 39 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   18573:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18577:	0f 85 08 fd ff ff    	jne    18285 <hyperinterval::float::F32Enclosure::corner_image+0x55>
   1857d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18581:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   18586:	e9 62 02 00 00       	jmp    187ed <hyperinterval::float::F32Enclosure::corner_image+0x5bd>
   1858b:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   1858f:	44 8b 7c 24 40       	mov    0x40(%rsp),%r15d
   18594:	48 89 e7             	mov    %rsp,%rdi
   18597:	be 00 00 00 80       	mov    $0x80000000,%esi
   1859c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185a1:	e8 ba 48 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   185a6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   185aa:	74 20                	je     185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   185ac:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   185b1:	48 89 e7             	mov    %rsp,%rdi
   185b4:	be 00 00 00 80       	mov    $0x80000000,%esi
   185b9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   185be:	4c 89 f9             	mov    %r15,%rcx
   185c1:	e8 9a 48 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   185c6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   185ca:	75 1f                	jne    185eb <hyperinterval::float::F32Enclosure::corner_image+0x3bb>
   185cc:	44 0f b6 7c 24 01    	movzbl 0x1(%rsp),%r15d
   185d2:	44 88 7b 04          	mov    %r15b,0x4(%rbx)
   185d6:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   185dc:	48 83 c4 58          	add    $0x58,%rsp
   185e0:	5b                   	pop    %rbx
   185e1:	41 5c                	pop    %r12
   185e3:	41 5d                	pop    %r13
   185e5:	41 5e                	pop    %r14
   185e7:	41 5f                	pop    %r15
   185e9:	5d                   	pop    %rbp
   185ea:	c3                   	ret
   185eb:	8b 7c 24 08          	mov    0x8(%rsp),%edi
   185ef:	89 e8                	mov    %ebp,%eax
   185f1:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   185f6:	89 f9                	mov    %edi,%ecx
   185f8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   185fe:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18603:	29 c2                	sub    %eax,%edx
   18605:	be 00 00 00 80       	mov    $0x80000000,%esi
   1860a:	09 f0                	or     %esi,%eax
   1860c:	85 ed                	test   %ebp,%ebp
   1860e:	48 0f 49 d0          	cmovns %rax,%rdx
   18612:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18617:	29 c8                	sub    %ecx,%eax
   18619:	09 f1                	or     %esi,%ecx
   1861b:	85 ff                	test   %edi,%edi
   1861d:	48 0f 49 c1          	cmovns %rcx,%rax
   18621:	41 b7 01             	mov    $0x1,%r15b
   18624:	39 c2                	cmp    %eax,%edx
   18626:	77 aa                	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   18628:	89 7c 24 28          	mov    %edi,0x28(%rsp)
   1862c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   18631:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18636:	4c 89 e9             	mov    %r13,%rcx
   18639:	4d 89 f0             	mov    %r14,%r8
   1863c:	e8 ff 3c 00 00       	call   1c340 <hyperinterval::ieee::Format::mul>
   18641:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18646:	0f 85 eb fc ff ff    	jne    18337 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   1864c:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   18650:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   18655:	48 89 e7             	mov    %rsp,%rdi
   18658:	be 00 00 00 80       	mov    $0x80000000,%esi
   1865d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18662:	e8 f9 47 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18667:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1866b:	0f 85 5b ff ff ff    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18671:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18676:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1867b:	48 89 e7             	mov    %rsp,%rdi
   1867e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18683:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18688:	4c 89 e9             	mov    %r13,%rcx
   1868b:	e8 d0 47 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18690:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18694:	0f 85 32 ff ff ff    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1869a:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1869e:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   186a3:	89 d0                	mov    %edx,%eax
   186a5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   186aa:	41 89 c8             	mov    %ecx,%r8d
   186ad:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   186b4:	be 00 00 00 80       	mov    $0x80000000,%esi
   186b9:	29 c6                	sub    %eax,%esi
   186bb:	bf 00 00 00 80       	mov    $0x80000000,%edi
   186c0:	09 f8                	or     %edi,%eax
   186c2:	85 d2                	test   %edx,%edx
   186c4:	48 0f 49 f0          	cmovns %rax,%rsi
   186c8:	b8 00 00 00 80       	mov    $0x80000000,%eax
   186cd:	44 29 c0             	sub    %r8d,%eax
   186d0:	41 09 f8             	or     %edi,%r8d
   186d3:	85 c9                	test   %ecx,%ecx
   186d5:	49 0f 49 c0          	cmovns %r8,%rax
   186d9:	39 c6                	cmp    %eax,%esi
   186db:	0f 87 f1 fe ff ff    	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   186e1:	89 ef                	mov    %ebp,%edi
   186e3:	8b 74 24 28          	mov    0x28(%rsp),%esi
   186e7:	e8 54 4f 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   186ec:	89 c5                	mov    %eax,%ebp
   186ee:	41 89 d5             	mov    %edx,%r13d
   186f1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   186f6:	be 00 00 00 80       	mov    $0x80000000,%esi
   186fb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18700:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   18705:	4d 89 e0             	mov    %r12,%r8
   18708:	e8 33 3c 00 00       	call   1c340 <hyperinterval::ieee::Format::mul>
   1870d:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   18712:	0f 85 1f fc ff ff    	jne    18337 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   18718:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   1871c:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   18721:	48 89 e7             	mov    %rsp,%rdi
   18724:	be 00 00 00 80       	mov    $0x80000000,%esi
   18729:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1872e:	e8 2d 47 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18733:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18737:	0f 85 8f fe ff ff    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1873d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   18742:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18747:	48 89 e7             	mov    %rsp,%rdi
   1874a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1874f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18754:	4c 89 e1             	mov    %r12,%rcx
   18757:	e8 04 47 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1875c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18760:	0f 85 66 fe ff ff    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18766:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1876a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1876f:	89 d0                	mov    %edx,%eax
   18771:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18776:	41 89 c8             	mov    %ecx,%r8d
   18779:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18780:	be 00 00 00 80       	mov    $0x80000000,%esi
   18785:	29 c6                	sub    %eax,%esi
   18787:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1878c:	09 f8                	or     %edi,%eax
   1878e:	85 d2                	test   %edx,%edx
   18790:	48 0f 49 f0          	cmovns %rax,%rsi
   18794:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18799:	44 29 c0             	sub    %r8d,%eax
   1879c:	41 09 f8             	or     %edi,%r8d
   1879f:	85 c9                	test   %ecx,%ecx
   187a1:	49 0f 49 c0          	cmovns %r8,%rax
   187a5:	39 c6                	cmp    %eax,%esi
   187a7:	0f 87 25 fe ff ff    	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   187ad:	89 ef                	mov    %ebp,%edi
   187af:	44 89 ee             	mov    %r13d,%esi
   187b2:	e8 89 4e 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   187b7:	41 89 c5             	mov    %eax,%r13d
   187ba:	41 89 d4             	mov    %edx,%r12d
   187bd:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   187c2:	be 00 00 00 80       	mov    $0x80000000,%esi
   187c7:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187cc:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   187d1:	4d 89 f0             	mov    %r14,%r8
   187d4:	e8 67 3b 00 00       	call   1c340 <hyperinterval::ieee::Format::mul>
   187d9:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   187de:	0f 85 53 fb ff ff    	jne    18337 <hyperinterval::float::F32Enclosure::corner_image+0x107>
   187e4:	8b 4c 24 38          	mov    0x38(%rsp),%ecx
   187e8:	44 8b 74 24 40       	mov    0x40(%rsp),%r14d
   187ed:	48 89 e7             	mov    %rsp,%rdi
   187f0:	be 00 00 00 80       	mov    $0x80000000,%esi
   187f5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   187fa:	e8 61 46 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   187ff:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18803:	0f 85 c3 fd ff ff    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   18809:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1880e:	48 89 e7             	mov    %rsp,%rdi
   18811:	be 00 00 00 80       	mov    $0x80000000,%esi
   18816:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1881b:	4c 89 f1             	mov    %r14,%rcx
   1881e:	e8 3d 46 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18823:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18827:	0f 85 9f fd ff ff    	jne    185cc <hyperinterval::float::F32Enclosure::corner_image+0x39c>
   1882d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18831:	89 e8                	mov    %ebp,%eax
   18833:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18838:	89 ca                	mov    %ecx,%edx
   1883a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18840:	be 00 00 00 80       	mov    $0x80000000,%esi
   18845:	29 c6                	sub    %eax,%esi
   18847:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1884c:	09 f8                	or     %edi,%eax
   1884e:	85 ed                	test   %ebp,%ebp
   18850:	48 0f 49 f0          	cmovns %rax,%rsi
   18854:	89 d0                	mov    %edx,%eax
   18856:	09 f8                	or     %edi,%eax
   18858:	29 d7                	sub    %edx,%edi
   1885a:	85 c9                	test   %ecx,%ecx
   1885c:	48 0f 49 f8          	cmovns %rax,%rdi
   18860:	39 fe                	cmp    %edi,%esi
   18862:	0f 87 6a fd ff ff    	ja     185d2 <hyperinterval::float::F32Enclosure::corner_image+0x3a2>
   18868:	44 89 ef             	mov    %r13d,%edi
   1886b:	44 89 e6             	mov    %r12d,%esi
   1886e:	89 ea                	mov    %ebp,%edx
   18870:	e8 cb 4d 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   18875:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1887b:	89 43 04             	mov    %eax,0x4(%rbx)
   1887e:	89 53 08             	mov    %edx,0x8(%rbx)
   18881:	e9 56 fd ff ff       	jmp    185dc <hyperinterval::float::F32Enclosure::corner_image+0x3ac>
   18886:	cc                   	int3
   18887:	cc                   	int3
   18888:	cc                   	int3
   18889:	cc                   	int3
   1888a:	cc                   	int3
   1888b:	cc                   	int3
   1888c:	cc                   	int3
   1888d:	cc                   	int3
   1888e:	cc                   	int3
   1888f:	cc                   	int3

hyperinterval::float::F32Enclosure::intersection:
   18890:	48 89 f8             	mov    %rdi,%rax
   18893:	45 31 c9             	xor    %r9d,%r9d
   18896:	f6 06 01             	testb  $0x1,(%rsi)
   18899:	0f 84 ed 00 00 00    	je     1898c <hyperinterval::float::F32Enclosure::intersection+0xfc>
   1889f:	f6 02 01             	testb  $0x1,(%rdx)
   188a2:	0f 84 d9 00 00 00    	je     18981 <hyperinterval::float::F32Enclosure::intersection+0xf1>
   188a8:	53                   	push   %rbx
   188a9:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   188ad:	8b 4e 04             	mov    0x4(%rsi),%ecx
   188b0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   188b5:	41 89 c9             	mov    %ecx,%r9d
   188b8:	41 09 f9             	or     %edi,%r9d
   188bb:	41 89 ca             	mov    %ecx,%r10d
   188be:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   188c5:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   188cb:	45 29 d3             	sub    %r10d,%r11d
   188ce:	85 c9                	test   %ecx,%ecx
   188d0:	4d 0f 49 d9          	cmovns %r9,%r11
   188d4:	45 89 c1             	mov    %r8d,%r9d
   188d7:	41 09 f9             	or     %edi,%r9d
   188da:	45 89 c2             	mov    %r8d,%r10d
   188dd:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   188e4:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   188e9:	44 29 d3             	sub    %r10d,%ebx
   188ec:	45 85 c0             	test   %r8d,%r8d
   188ef:	49 0f 49 d9          	cmovns %r9,%rbx
   188f3:	8b 52 08             	mov    0x8(%rdx),%edx
   188f6:	41 39 db             	cmp    %ebx,%r11d
   188f9:	41 0f 42 c8          	cmovb  %r8d,%ecx
   188fd:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   18901:	44 89 c6             	mov    %r8d,%esi
   18904:	09 fe                	or     %edi,%esi
   18906:	45 89 c1             	mov    %r8d,%r9d
   18909:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18910:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18916:	45 29 ca             	sub    %r9d,%r10d
   18919:	45 85 c0             	test   %r8d,%r8d
   1891c:	4c 0f 49 d6          	cmovns %rsi,%r10
   18920:	89 d6                	mov    %edx,%esi
   18922:	09 fe                	or     %edi,%esi
   18924:	41 89 d1             	mov    %edx,%r9d
   18927:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1892e:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18934:	45 29 cb             	sub    %r9d,%r11d
   18937:	85 d2                	test   %edx,%edx
   18939:	4c 0f 49 de          	cmovns %rsi,%r11
   1893d:	45 39 da             	cmp    %r11d,%r10d
   18940:	44 0f 47 c2          	cmova  %edx,%r8d
   18944:	89 ca                	mov    %ecx,%edx
   18946:	09 fa                	or     %edi,%edx
   18948:	89 ce                	mov    %ecx,%esi
   1894a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18950:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18956:	41 29 f2             	sub    %esi,%r10d
   18959:	85 c9                	test   %ecx,%ecx
   1895b:	4c 0f 49 d2          	cmovns %rdx,%r10
   1895f:	44 89 c2             	mov    %r8d,%edx
   18962:	09 fa                	or     %edi,%edx
   18964:	44 89 c6             	mov    %r8d,%esi
   18967:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1896d:	29 f7                	sub    %esi,%edi
   1896f:	45 85 c0             	test   %r8d,%r8d
   18972:	48 0f 49 fa          	cmovns %rdx,%rdi
   18976:	45 31 c9             	xor    %r9d,%r9d
   18979:	41 39 fa             	cmp    %edi,%r10d
   1897c:	41 0f 96 c1          	setbe  %r9b
   18980:	5b                   	pop    %rbx
   18981:	44 89 08             	mov    %r9d,(%rax)
   18984:	89 48 04             	mov    %ecx,0x4(%rax)
   18987:	44 89 40 08          	mov    %r8d,0x8(%rax)
   1898b:	c3                   	ret
   1898c:	44 89 08             	mov    %r9d,(%rax)
   1898f:	89 48 04             	mov    %ecx,0x4(%rax)
   18992:	44 89 40 08          	mov    %r8d,0x8(%rax)
   18996:	c3                   	ret
   18997:	cc                   	int3
   18998:	cc                   	int3
   18999:	cc                   	int3
   1899a:	cc                   	int3
   1899b:	cc                   	int3
   1899c:	cc                   	int3
   1899d:	cc                   	int3
   1899e:	cc                   	int3
   1899f:	cc                   	int3

hyperinterval::float::F32Enclosure::contains_point:
   189a0:	41 56                	push   %r14
   189a2:	53                   	push   %rbx
   189a3:	48 83 ec 18          	sub    $0x18,%rsp
   189a7:	48 89 fb             	mov    %rdi,%rbx
   189aa:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   189b0:	66 0f 7e c1          	movd   %xmm0,%ecx
   189b4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   189b9:	be 00 00 00 80       	mov    $0x80000000,%esi
   189be:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   189c3:	e8 98 44 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   189c8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   189cd:	3c 01                	cmp    $0x1,%al
   189cf:	75 0d                	jne    189de <hyperinterval::float::F32Enclosure::contains_point+0x3e>
   189d1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   189d6:	48 83 c4 18          	add    $0x18,%rsp
   189da:	5b                   	pop    %rbx
   189db:	41 5e                	pop    %r14
   189dd:	c3                   	ret
   189de:	f6 03 01             	testb  $0x1,(%rbx)
   189e1:	74 44                	je     18a27 <hyperinterval::float::F32Enclosure::contains_point+0x87>
   189e3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   189e8:	8b 73 04             	mov    0x4(%rbx),%esi
   189eb:	89 d1                	mov    %edx,%ecx
   189ed:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   189f3:	89 f7                	mov    %esi,%edi
   189f5:	44 09 f7             	or     %r14d,%edi
   189f8:	41 89 f0             	mov    %esi,%r8d
   189fb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18a02:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18a08:	45 29 c1             	sub    %r8d,%r9d
   18a0b:	85 f6                	test   %esi,%esi
   18a0d:	4c 0f 49 cf          	cmovns %rdi,%r9
   18a11:	be 00 00 00 80       	mov    $0x80000000,%esi
   18a16:	48 29 ce             	sub    %rcx,%rsi
   18a19:	4c 09 f1             	or     %r14,%rcx
   18a1c:	85 d2                	test   %edx,%edx
   18a1e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   18a22:	41 39 c9             	cmp    %ecx,%r9d
   18a25:	76 0a                	jbe    18a31 <hyperinterval::float::F32Enclosure::contains_point+0x91>
   18a27:	31 d2                	xor    %edx,%edx
   18a29:	48 83 c4 18          	add    $0x18,%rsp
   18a2d:	5b                   	pop    %rbx
   18a2e:	41 5e                	pop    %r14
   18a30:	c3                   	ret
   18a31:	8b 53 08             	mov    0x8(%rbx),%edx
   18a34:	89 d6                	mov    %edx,%esi
   18a36:	44 09 f6             	or     %r14d,%esi
   18a39:	89 d7                	mov    %edx,%edi
   18a3b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18a41:	41 29 fe             	sub    %edi,%r14d
   18a44:	85 d2                	test   %edx,%edx
   18a46:	4c 0f 49 f6          	cmovns %rsi,%r14
   18a4a:	44 39 f1             	cmp    %r14d,%ecx
   18a4d:	0f 96 c2             	setbe  %dl
   18a50:	48 83 c4 18          	add    $0x18,%rsp
   18a54:	5b                   	pop    %rbx
   18a55:	41 5e                	pop    %r14
   18a57:	c3                   	ret
   18a58:	cc                   	int3
   18a59:	cc                   	int3
   18a5a:	cc                   	int3
   18a5b:	cc                   	int3
   18a5c:	cc                   	int3
   18a5d:	cc                   	int3
   18a5e:	cc                   	int3
   18a5f:	cc                   	int3

hyperinterval::float::F32Enclosure::interior_subset_of:
   18a60:	b0 01                	mov    $0x1,%al
   18a62:	f6 07 01             	testb  $0x1,(%rdi)
   18a65:	0f 84 93 00 00 00    	je     18afe <hyperinterval::float::F32Enclosure::interior_subset_of+0x9e>
   18a6b:	f6 06 01             	testb  $0x1,(%rsi)
   18a6e:	0f 84 88 00 00 00    	je     18afc <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18a74:	8b 4f 04             	mov    0x4(%rdi),%ecx
   18a77:	8b 56 04             	mov    0x4(%rsi),%edx
   18a7a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18a7f:	41 89 d0             	mov    %edx,%r8d
   18a82:	41 09 c0             	or     %eax,%r8d
   18a85:	41 89 d1             	mov    %edx,%r9d
   18a88:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18a8f:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18a95:	45 29 ca             	sub    %r9d,%r10d
   18a98:	85 d2                	test   %edx,%edx
   18a9a:	4d 0f 49 d0          	cmovns %r8,%r10
   18a9e:	89 ca                	mov    %ecx,%edx
   18aa0:	09 c2                	or     %eax,%edx
   18aa2:	41 89 c8             	mov    %ecx,%r8d
   18aa5:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   18aac:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   18ab2:	45 29 c1             	sub    %r8d,%r9d
   18ab5:	85 c9                	test   %ecx,%ecx
   18ab7:	4c 0f 49 ca          	cmovns %rdx,%r9
   18abb:	45 39 ca             	cmp    %r9d,%r10d
   18abe:	73 3c                	jae    18afc <hyperinterval::float::F32Enclosure::interior_subset_of+0x9c>
   18ac0:	8b 4f 08             	mov    0x8(%rdi),%ecx
   18ac3:	8b 56 08             	mov    0x8(%rsi),%edx
   18ac6:	89 ce                	mov    %ecx,%esi
   18ac8:	09 c6                	or     %eax,%esi
   18aca:	89 cf                	mov    %ecx,%edi
   18acc:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18ad2:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18ad8:	41 29 f8             	sub    %edi,%r8d
   18adb:	85 c9                	test   %ecx,%ecx
   18add:	4c 0f 49 c6          	cmovns %rsi,%r8
   18ae1:	89 d1                	mov    %edx,%ecx
   18ae3:	09 c1                	or     %eax,%ecx
   18ae5:	89 d6                	mov    %edx,%esi
   18ae7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   18aed:	29 f0                	sub    %esi,%eax
   18aef:	85 d2                	test   %edx,%edx
   18af1:	48 0f 49 c1          	cmovns %rcx,%rax
   18af5:	41 39 c0             	cmp    %eax,%r8d
   18af8:	0f 92 c0             	setb   %al
   18afb:	c3                   	ret
   18afc:	31 c0                	xor    %eax,%eax
   18afe:	c3                   	ret
   18aff:	cc                   	int3

hyperinterval::float::F32Enclosure::abs:
   18b00:	48 89 f8             	mov    %rdi,%rax
   18b03:	f6 06 01             	testb  $0x1,(%rsi)
   18b06:	74 24                	je     18b2c <hyperinterval::float::F32Enclosure::abs+0x2c>
   18b08:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18b0b:	85 c9                	test   %ecx,%ecx
   18b0d:	0f 99 c2             	setns  %dl
   18b10:	f7 c1 ff ff ff 7f    	test   $0x7fffffff,%ecx
   18b16:	40 0f 94 c7          	sete   %dil
   18b1a:	40 08 d7             	or     %dl,%dil
   18b1d:	74 14                	je     18b33 <hyperinterval::float::F32Enclosure::abs+0x33>
   18b1f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   18b22:	89 48 08             	mov    %ecx,0x8(%rax)
   18b25:	48 8b 0e             	mov    (%rsi),%rcx
   18b28:	48 89 08             	mov    %rcx,(%rax)
   18b2b:	c3                   	ret
   18b2c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18b32:	c3                   	ret
   18b33:	8b 56 08             	mov    0x8(%rsi),%edx
   18b36:	85 d2                	test   %edx,%edx
   18b38:	40 0f 98 c7          	sets   %dil
   18b3c:	48 89 d6             	mov    %rdx,%rsi
   18b3f:	48 81 e6 ff ff ff 7f 	and    $0x7fffffff,%rsi
   18b46:	41 0f 95 c0          	setne  %r8b
   18b4a:	44 84 c7             	test   %r8b,%dil
   18b4d:	74 19                	je     18b68 <hyperinterval::float::F32Enclosure::abs+0x68>
   18b4f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18b55:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18b5b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18b61:	89 50 04             	mov    %edx,0x4(%rax)
   18b64:	89 48 08             	mov    %ecx,0x8(%rax)
   18b67:	c3                   	ret
   18b68:	89 cf                	mov    %ecx,%edi
   18b6a:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   18b70:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18b76:	41 89 d1             	mov    %edx,%r9d
   18b79:	45 09 c1             	or     %r8d,%r9d
   18b7c:	41 29 f0             	sub    %esi,%r8d
   18b7f:	85 d2                	test   %edx,%edx
   18b81:	4d 0f 49 c1          	cmovns %r9,%r8
   18b85:	41 39 c8             	cmp    %ecx,%r8d
   18b88:	0f 43 fa             	cmovae %edx,%edi
   18b8b:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   18b92:	89 78 08             	mov    %edi,0x8(%rax)
   18b95:	c3                   	ret
   18b96:	cc                   	int3
   18b97:	cc                   	int3
   18b98:	cc                   	int3
   18b99:	cc                   	int3
   18b9a:	cc                   	int3
   18b9b:	cc                   	int3
   18b9c:	cc                   	int3
   18b9d:	cc                   	int3
   18b9e:	cc                   	int3
   18b9f:	cc                   	int3

hyperinterval::float::F32Enclosure::add:
   18ba0:	48 89 f8             	mov    %rdi,%rax
   18ba3:	f6 06 01             	testb  $0x1,(%rsi)
   18ba6:	0f 84 d6 00 00 00    	je     18c82 <hyperinterval::float::F32Enclosure::add+0xe2>
   18bac:	f6 02 01             	testb  $0x1,(%rdx)
   18baf:	0f 84 cd 00 00 00    	je     18c82 <hyperinterval::float::F32Enclosure::add+0xe2>
   18bb5:	41 57                	push   %r15
   18bb7:	41 56                	push   %r14
   18bb9:	41 55                	push   %r13
   18bbb:	41 54                	push   %r12
   18bbd:	53                   	push   %rbx
   18bbe:	48 83 ec 20          	sub    $0x20,%rsp
   18bc2:	49 89 c4             	mov    %rax,%r12
   18bc5:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18bc8:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   18bce:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   18bd2:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18bd6:	8b 4e 04             	mov    0x4(%rsi),%ecx
   18bd9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bde:	be 00 00 00 80       	mov    $0x80000000,%esi
   18be3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18be8:	e8 63 30 00 00       	call   1bc50 <hyperinterval::ieee::Format::add>
   18bed:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18bf2:	74 6b                	je     18c5f <hyperinterval::float::F32Enclosure::add+0xbf>
   18bf4:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   18bf9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18bfe:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c03:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c08:	48 89 d9             	mov    %rbx,%rcx
   18c0b:	4d 89 f0             	mov    %r14,%r8
   18c0e:	e8 3d 30 00 00       	call   1bc50 <hyperinterval::ieee::Format::add>
   18c13:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c18:	74 45                	je     18c5f <hyperinterval::float::F32Enclosure::add+0xbf>
   18c1a:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   18c1e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c23:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c28:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c2d:	4c 89 f9             	mov    %r15,%rcx
   18c30:	e8 2b 42 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18c35:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c3a:	74 23                	je     18c5f <hyperinterval::float::F32Enclosure::add+0xbf>
   18c3c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   18c41:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18c46:	be 00 00 00 80       	mov    $0x80000000,%esi
   18c4b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18c50:	48 89 d9             	mov    %rbx,%rcx
   18c53:	e8 08 42 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18c58:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18c5d:	75 2a                	jne    18c89 <hyperinterval::float::F32Enclosure::add+0xe9>
   18c5f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   18c64:	4c 89 e0             	mov    %r12,%rax
   18c67:	41 88 4c 24 04       	mov    %cl,0x4(%r12)
   18c6c:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   18c73:	00 
   18c74:	48 83 c4 20          	add    $0x20,%rsp
   18c78:	5b                   	pop    %rbx
   18c79:	41 5c                	pop    %r12
   18c7b:	41 5d                	pop    %r13
   18c7d:	41 5e                	pop    %r14
   18c7f:	41 5f                	pop    %r15
   18c81:	c3                   	ret
   18c82:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18c88:	c3                   	ret
   18c89:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18c8d:	44 89 f0             	mov    %r14d,%eax
   18c90:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18c95:	89 ca                	mov    %ecx,%edx
   18c97:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18c9d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ca2:	29 c6                	sub    %eax,%esi
   18ca4:	44 09 e8             	or     %r13d,%eax
   18ca7:	45 85 f6             	test   %r14d,%r14d
   18caa:	48 0f 49 f0          	cmovns %rax,%rsi
   18cae:	89 d0                	mov    %edx,%eax
   18cb0:	44 09 e8             	or     %r13d,%eax
   18cb3:	41 29 d5             	sub    %edx,%r13d
   18cb6:	85 c9                	test   %ecx,%ecx
   18cb8:	4c 0f 49 e8          	cmovns %rax,%r13
   18cbc:	44 39 ee             	cmp    %r13d,%esi
   18cbf:	4c 89 e0             	mov    %r12,%rax
   18cc2:	76 0c                	jbe    18cd0 <hyperinterval::float::F32Enclosure::add+0x130>
   18cc4:	c6 40 04 01          	movb   $0x1,0x4(%rax)
   18cc8:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   18cce:	eb a4                	jmp    18c74 <hyperinterval::float::F32Enclosure::add+0xd4>
   18cd0:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   18cd6:	44 89 70 04          	mov    %r14d,0x4(%rax)
   18cda:	89 48 08             	mov    %ecx,0x8(%rax)
   18cdd:	eb 95                	jmp    18c74 <hyperinterval::float::F32Enclosure::add+0xd4>
   18cdf:	cc                   	int3

hyperinterval::float::F32Enclosure::div:
   18ce0:	53                   	push   %rbx
   18ce1:	48 89 fb             	mov    %rdi,%rbx
   18ce4:	83 3a 01             	cmpl   $0x1,(%rdx)
   18ce7:	75 1a                	jne    18d03 <hyperinterval::float::F32Enclosure::div+0x23>
   18ce9:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   18ced:	7f 14                	jg     18d03 <hyperinterval::float::F32Enclosure::div+0x23>
   18cef:	8b 42 08             	mov    0x8(%rdx),%eax
   18cf2:	85 c0                	test   %eax,%eax
   18cf4:	0f 99 c1             	setns  %cl
   18cf7:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   18cfc:	0f 94 c0             	sete   %al
   18cff:	08 c8                	or     %cl,%al
   18d01:	75 12                	jne    18d15 <hyperinterval::float::F32Enclosure::div+0x35>
   18d03:	48 89 df             	mov    %rbx,%rdi
   18d06:	b9 01 00 00 00       	mov    $0x1,%ecx
   18d0b:	e8 20 f5 ff ff       	call   18230 <hyperinterval::float::F32Enclosure::corner_image>
   18d10:	48 89 d8             	mov    %rbx,%rax
   18d13:	5b                   	pop    %rbx
   18d14:	c3                   	ret
   18d15:	c6 43 04 06          	movb   $0x6,0x4(%rbx)
   18d19:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18d1f:	48 89 d8             	mov    %rbx,%rax
   18d22:	5b                   	pop    %rbx
   18d23:	c3                   	ret
   18d24:	cc                   	int3
   18d25:	cc                   	int3
   18d26:	cc                   	int3
   18d27:	cc                   	int3
   18d28:	cc                   	int3
   18d29:	cc                   	int3
   18d2a:	cc                   	int3
   18d2b:	cc                   	int3
   18d2c:	cc                   	int3
   18d2d:	cc                   	int3
   18d2e:	cc                   	int3
   18d2f:	cc                   	int3

hyperinterval::float::F32Enclosure::new:
   18d30:	41 57                	push   %r15
   18d32:	41 56                	push   %r14
   18d34:	53                   	push   %rbx
   18d35:	48 83 ec 20          	sub    $0x20,%rsp
   18d39:	f3 0f 11 4c 24 1c    	movss  %xmm1,0x1c(%rsp)
   18d3f:	48 89 fb             	mov    %rdi,%rbx
   18d42:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   18d48:	66 0f 7e c1          	movd   %xmm0,%ecx
   18d4c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d51:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d56:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d5b:	e8 00 41 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18d60:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d65:	74 2a                	je     18d91 <hyperinterval::float::F32Enclosure::new+0x61>
   18d67:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18d6c:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
   18d72:	66 0f 7e c1          	movd   %xmm0,%ecx
   18d76:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18d7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d80:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d85:	e8 d6 40 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   18d8a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18d8f:	75 1b                	jne    18dac <hyperinterval::float::F32Enclosure::new+0x7c>
   18d91:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   18d96:	88 43 04             	mov    %al,0x4(%rbx)
   18d99:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18d9f:	48 89 d8             	mov    %rbx,%rax
   18da2:	48 83 c4 20          	add    $0x20,%rsp
   18da6:	5b                   	pop    %rbx
   18da7:	41 5e                	pop    %r14
   18da9:	41 5f                	pop    %r15
   18dab:	c3                   	ret
   18dac:	8b 44 24 10          	mov    0x10(%rsp),%eax
   18db0:	44 89 f9             	mov    %r15d,%ecx
   18db3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18db9:	89 c2                	mov    %eax,%edx
   18dbb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   18dc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   18dc6:	29 ce                	sub    %ecx,%esi
   18dc8:	44 09 f1             	or     %r14d,%ecx
   18dcb:	45 85 ff             	test   %r15d,%r15d
   18dce:	48 0f 49 f1          	cmovns %rcx,%rsi
   18dd2:	89 d1                	mov    %edx,%ecx
   18dd4:	44 09 f1             	or     %r14d,%ecx
   18dd7:	41 29 d6             	sub    %edx,%r14d
   18dda:	85 c0                	test   %eax,%eax
   18ddc:	4c 0f 49 f1          	cmovns %rcx,%r14
   18de0:	44 39 f6             	cmp    %r14d,%esi
   18de3:	76 06                	jbe    18deb <hyperinterval::float::F32Enclosure::new+0xbb>
   18de5:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   18de9:	eb ae                	jmp    18d99 <hyperinterval::float::F32Enclosure::new+0x69>
   18deb:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   18df1:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   18df5:	89 43 08             	mov    %eax,0x8(%rbx)
   18df8:	eb a5                	jmp    18d9f <hyperinterval::float::F32Enclosure::new+0x6f>
   18dfa:	cc                   	int3
   18dfb:	cc                   	int3
   18dfc:	cc                   	int3
   18dfd:	cc                   	int3
   18dfe:	cc                   	int3
   18dff:	cc                   	int3

hyperinterval::float::F32Enclosure::sub:
   18e00:	53                   	push   %rbx
   18e01:	48 83 ec 10          	sub    $0x10,%rsp
   18e05:	48 89 fb             	mov    %rdi,%rbx
   18e08:	f6 02 01             	testb  $0x1,(%rdx)
   18e0b:	74 29                	je     18e36 <hyperinterval::float::F32Enclosure::sub+0x36>
   18e0d:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   18e12:	66 0f ef c9          	pxor   %xmm1,%xmm1
   18e16:	66 0f 6f 15 52 cb fe 	movdqa -0x134ae(%rip),%xmm2        # 5970 <__abi_tag+0x5674>
   18e1d:	ff 
   18e1e:	66 0f ef d0          	pxor   %xmm0,%xmm2
   18e22:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   18e26:	66 0f df ca          	pandn  %xmm2,%xmm1
   18e2a:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   18e2f:	b8 01 00 00 00       	mov    $0x1,%eax
   18e34:	eb 02                	jmp    18e38 <hyperinterval::float::F32Enclosure::sub+0x38>
   18e36:	31 c0                	xor    %eax,%eax
   18e38:	89 44 24 04          	mov    %eax,0x4(%rsp)
   18e3c:	66 0f d6 44 24 08    	movq   %xmm0,0x8(%rsp)
   18e42:	48 8d 54 24 04       	lea    0x4(%rsp),%rdx
   18e47:	48 89 df             	mov    %rbx,%rdi
   18e4a:	ff 15 c0 66 04 00    	call   *0x466c0(%rip)        # 5f510 <_DYNAMIC+0x2d0>
   18e50:	48 89 d8             	mov    %rbx,%rax
   18e53:	48 83 c4 10          	add    $0x10,%rsp
   18e57:	5b                   	pop    %rbx
   18e58:	c3                   	ret
   18e59:	cc                   	int3
   18e5a:	cc                   	int3
   18e5b:	cc                   	int3
   18e5c:	cc                   	int3
   18e5d:	cc                   	int3
   18e5e:	cc                   	int3
   18e5f:	cc                   	int3

hyperinterval::float::F32Enclosure::hull:
   18e60:	48 89 f8             	mov    %rdi,%rax
   18e63:	44 8b 0e             	mov    (%rsi),%r9d
   18e66:	44 8b 02             	mov    (%rdx),%r8d
   18e69:	8b 7a 04             	mov    0x4(%rdx),%edi
   18e6c:	8b 4a 08             	mov    0x8(%rdx),%ecx
   18e6f:	41 f6 c1 01          	test   $0x1,%r9b
   18e73:	0f 84 a1 00 00 00    	je     18f1a <hyperinterval::float::F32Enclosure::hull+0xba>
   18e79:	8b 56 04             	mov    0x4(%rsi),%edx
   18e7c:	8b 76 08             	mov    0x8(%rsi),%esi
   18e7f:	41 f6 c0 01          	test   $0x1,%r8b
   18e83:	0f 84 9b 00 00 00    	je     18f24 <hyperinterval::float::F32Enclosure::hull+0xc4>
   18e89:	53                   	push   %rbx
   18e8a:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   18e90:	41 89 d1             	mov    %edx,%r9d
   18e93:	45 09 c1             	or     %r8d,%r9d
   18e96:	41 89 d2             	mov    %edx,%r10d
   18e99:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18ea0:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   18ea6:	45 29 d3             	sub    %r10d,%r11d
   18ea9:	85 d2                	test   %edx,%edx
   18eab:	4d 0f 49 d9          	cmovns %r9,%r11
   18eaf:	41 89 f9             	mov    %edi,%r9d
   18eb2:	45 09 c1             	or     %r8d,%r9d
   18eb5:	41 89 fa             	mov    %edi,%r10d
   18eb8:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   18ebf:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   18ec4:	44 29 d3             	sub    %r10d,%ebx
   18ec7:	85 ff                	test   %edi,%edi
   18ec9:	49 0f 49 d9          	cmovns %r9,%rbx
   18ecd:	41 39 db             	cmp    %ebx,%r11d
   18ed0:	0f 47 d7             	cmova  %edi,%edx
   18ed3:	89 f7                	mov    %esi,%edi
   18ed5:	44 09 c7             	or     %r8d,%edi
   18ed8:	41 89 f1             	mov    %esi,%r9d
   18edb:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18ee2:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   18ee8:	45 29 ca             	sub    %r9d,%r10d
   18eeb:	85 f6                	test   %esi,%esi
   18eed:	4c 0f 49 d7          	cmovns %rdi,%r10
   18ef1:	89 cf                	mov    %ecx,%edi
   18ef3:	44 09 c7             	or     %r8d,%edi
   18ef6:	41 89 c9             	mov    %ecx,%r9d
   18ef9:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   18f00:	45 29 c8             	sub    %r9d,%r8d
   18f03:	85 c9                	test   %ecx,%ecx
   18f05:	4c 0f 49 c7          	cmovns %rdi,%r8
   18f09:	45 39 c2             	cmp    %r8d,%r10d
   18f0c:	0f 42 f1             	cmovb  %ecx,%esi
   18f0f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   18f15:	89 f1                	mov    %esi,%ecx
   18f17:	89 d7                	mov    %edx,%edi
   18f19:	5b                   	pop    %rbx
   18f1a:	44 89 00             	mov    %r8d,(%rax)
   18f1d:	89 78 04             	mov    %edi,0x4(%rax)
   18f20:	89 48 08             	mov    %ecx,0x8(%rax)
   18f23:	c3                   	ret
   18f24:	89 f1                	mov    %esi,%ecx
   18f26:	89 d7                	mov    %edx,%edi
   18f28:	45 89 c8             	mov    %r9d,%r8d
   18f2b:	44 89 00             	mov    %r8d,(%rax)
   18f2e:	89 78 04             	mov    %edi,0x4(%rax)
   18f31:	89 48 08             	mov    %ecx,0x8(%rax)
   18f34:	c3                   	ret
   18f35:	cc                   	int3
   18f36:	cc                   	int3
   18f37:	cc                   	int3
   18f38:	cc                   	int3
   18f39:	cc                   	int3
   18f3a:	cc                   	int3
   18f3b:	cc                   	int3
   18f3c:	cc                   	int3
   18f3d:	cc                   	int3
   18f3e:	cc                   	int3
   18f3f:	cc                   	int3

hyperinterval::float::F32Enclosure::sqrt:
   18f40:	48 89 f8             	mov    %rdi,%rax
   18f43:	f6 06 01             	testb  $0x1,(%rsi)
   18f46:	74 2c                	je     18f74 <hyperinterval::float::F32Enclosure::sqrt+0x34>
   18f48:	55                   	push   %rbp
   18f49:	41 57                	push   %r15
   18f4b:	41 56                	push   %r14
   18f4d:	41 55                	push   %r13
   18f4f:	41 54                	push   %r12
   18f51:	53                   	push   %rbx
   18f52:	48 83 ec 18          	sub    $0x18,%rsp
   18f56:	8b 5e 08             	mov    0x8(%rsi),%ebx
   18f59:	85 db                	test   %ebx,%ebx
   18f5b:	0f 98 c1             	sets   %cl
   18f5e:	f7 c3 ff ff ff 7f    	test   $0x7fffffff,%ebx
   18f64:	0f 95 c2             	setne  %dl
   18f67:	84 d1                	test   %dl,%cl
   18f69:	74 14                	je     18f7f <hyperinterval::float::F32Enclosure::sqrt+0x3f>
   18f6b:	c6 40 04 07          	movb   $0x7,0x4(%rax)
   18f6f:	e9 ce 00 00 00       	jmp    19042 <hyperinterval::float::F32Enclosure::sqrt+0x102>
   18f74:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
   18f7a:	c6 40 0c 00          	movb   $0x0,0xc(%rax)
   18f7e:	c3                   	ret
   18f7f:	49 89 c7             	mov    %rax,%r15
   18f82:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18f86:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   18f8c:	45 85 ed             	test   %r13d,%r13d
   18f8f:	0f 98 c0             	sets   %al
   18f92:	41 f7 c5 ff ff ff 7f 	test   $0x7fffffff,%r13d
   18f99:	40 0f 95 c5          	setne  %bpl
   18f9d:	31 c9                	xor    %ecx,%ecx
   18f9f:	40 20 c5             	and    %al,%bpl
   18fa2:	49 0f 44 cd          	cmove  %r13,%rcx
   18fa6:	48 89 e7             	mov    %rsp,%rdi
   18fa9:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fb3:	e8 58 34 00 00       	call   1c410 <hyperinterval::ieee::Format::sqrt>
   18fb8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18fbc:	74 15                	je     18fd3 <hyperinterval::float::F32Enclosure::sqrt+0x93>
   18fbe:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   18fc3:	4c 89 f8             	mov    %r15,%rax
   18fc6:	41 88 4f 04          	mov    %cl,0x4(%r15)
   18fca:	41 c7 07 02 00 00 00 	movl   $0x2,(%r15)
   18fd1:	eb 75                	jmp    19048 <hyperinterval::float::F32Enclosure::sqrt+0x108>
   18fd3:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   18fd8:	41 39 dd             	cmp    %ebx,%r13d
   18fdb:	74 1b                	je     18ff8 <hyperinterval::float::F32Enclosure::sqrt+0xb8>
   18fdd:	48 89 e7             	mov    %rsp,%rdi
   18fe0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fe5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fea:	48 89 d9             	mov    %rbx,%rcx
   18fed:	e8 1e 34 00 00       	call   1c410 <hyperinterval::ieee::Format::sqrt>
   18ff2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18ff6:	74 c6                	je     18fbe <hyperinterval::float::F32Enclosure::sqrt+0x7e>
   18ff8:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   18ffc:	48 89 e7             	mov    %rsp,%rdi
   18fff:	be 00 00 00 80       	mov    $0x80000000,%esi
   19004:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19009:	4c 89 f1             	mov    %r14,%rcx
   1900c:	e8 4f 3e 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19011:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19015:	74 20                	je     19037 <hyperinterval::float::F32Enclosure::sqrt+0xf7>
   19017:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1901c:	48 89 e7             	mov    %rsp,%rdi
   1901f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19024:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19029:	48 89 d9             	mov    %rbx,%rcx
   1902c:	e8 2f 3e 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19031:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19035:	75 20                	jne    19057 <hyperinterval::float::F32Enclosure::sqrt+0x117>
   19037:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1903c:	4c 89 f8             	mov    %r15,%rax
   1903f:	88 50 04             	mov    %dl,0x4(%rax)
   19042:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
   19048:	48 83 c4 18          	add    $0x18,%rsp
   1904c:	5b                   	pop    %rbx
   1904d:	41 5c                	pop    %r12
   1904f:	41 5d                	pop    %r13
   19051:	41 5e                	pop    %r14
   19053:	41 5f                	pop    %r15
   19055:	5d                   	pop    %rbp
   19056:	c3                   	ret
   19057:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   1905b:	44 89 f0             	mov    %r14d,%eax
   1905e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19063:	89 ca                	mov    %ecx,%edx
   19065:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1906b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19070:	29 c6                	sub    %eax,%esi
   19072:	44 09 e0             	or     %r12d,%eax
   19075:	45 85 f6             	test   %r14d,%r14d
   19078:	48 0f 49 f0          	cmovns %rax,%rsi
   1907c:	89 d0                	mov    %edx,%eax
   1907e:	44 09 e0             	or     %r12d,%eax
   19081:	41 29 d4             	sub    %edx,%r12d
   19084:	85 c9                	test   %ecx,%ecx
   19086:	4c 0f 49 e0          	cmovns %rax,%r12
   1908a:	b2 01                	mov    $0x1,%dl
   1908c:	44 39 e6             	cmp    %r12d,%esi
   1908f:	4c 89 f8             	mov    %r15,%rax
   19092:	77 ab                	ja     1903f <hyperinterval::float::F32Enclosure::sqrt+0xff>
   19094:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
   1909a:	44 89 70 04          	mov    %r14d,0x4(%rax)
   1909e:	89 48 08             	mov    %ecx,0x8(%rax)
   190a1:	40 88 68 0c          	mov    %bpl,0xc(%rax)
   190a5:	eb a1                	jmp    19048 <hyperinterval::float::F32Enclosure::sqrt+0x108>
   190a7:	cc                   	int3
   190a8:	cc                   	int3
   190a9:	cc                   	int3
   190aa:	cc                   	int3
   190ab:	cc                   	int3
   190ac:	cc                   	int3
   190ad:	cc                   	int3
   190ae:	cc                   	int3
   190af:	cc                   	int3

hyperinterval::float::F32Enclosure::point:
   190b0:	53                   	push   %rbx
   190b1:	48 83 ec 10          	sub    $0x10,%rsp
   190b5:	48 89 fb             	mov    %rdi,%rbx
   190b8:	66 0f 7e c1          	movd   %xmm0,%ecx
   190bc:	48 89 e7             	mov    %rsp,%rdi
   190bf:	be 00 00 00 80       	mov    $0x80000000,%esi
   190c4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190c9:	e8 92 3d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   190ce:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   190d2:	75 0f                	jne    190e3 <hyperinterval::float::F32Enclosure::point+0x33>
   190d4:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   190d9:	88 43 04             	mov    %al,0x4(%rbx)
   190dc:	b8 02 00 00 00       	mov    $0x2,%eax
   190e1:	eb 0f                	jmp    190f2 <hyperinterval::float::F32Enclosure::point+0x42>
   190e3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   190e7:	89 43 04             	mov    %eax,0x4(%rbx)
   190ea:	89 43 08             	mov    %eax,0x8(%rbx)
   190ed:	b8 01 00 00 00       	mov    $0x1,%eax
   190f2:	89 03                	mov    %eax,(%rbx)
   190f4:	48 89 d8             	mov    %rbx,%rax
   190f7:	48 83 c4 10          	add    $0x10,%rsp
   190fb:	5b                   	pop    %rbx
   190fc:	c3                   	ret
   190fd:	cc                   	int3
   190fe:	cc                   	int3
   190ff:	cc                   	int3

hyperinterval::float::F32Enclosure::signs:
   19100:	83 3f 01             	cmpl   $0x1,(%rdi)
   19103:	75 65                	jne    1916a <hyperinterval::float::F32Enclosure::signs+0x6a>
   19105:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1910a:	8b 57 04             	mov    0x4(%rdi),%edx
   1910d:	8b 47 08             	mov    0x8(%rdi),%eax
   19110:	48 89 d6             	mov    %rdx,%rsi
   19113:	48 09 ce             	or     %rcx,%rsi
   19116:	41 89 d0             	mov    %edx,%r8d
   19119:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19120:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19125:	4c 29 c7             	sub    %r8,%rdi
   19128:	85 d2                	test   %edx,%edx
   1912a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1912e:	31 f6                	xor    %esi,%esi
   19130:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   19136:	0f 94 c2             	sete   %dl
   19139:	48 39 cf             	cmp    %rcx,%rdi
   1913c:	77 1d                	ja     1915b <hyperinterval::float::F32Enclosure::signs+0x5b>
   1913e:	39 cf                	cmp    %ecx,%edi
   19140:	0f 92 c1             	setb   %cl
   19143:	80 c9 02             	or     $0x2,%cl
   19146:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1914b:	0f b6 c9             	movzbl %cl,%ecx
   1914e:	40 88 d6             	mov    %dl,%sil
   19151:	0f 44 f1             	cmove  %ecx,%esi
   19154:	85 c0                	test   %eax,%eax
   19156:	0f 49 f1             	cmovns %ecx,%esi
   19159:	89 f2                	mov    %esi,%edx
   1915b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1915e:	85 c0                	test   %eax,%eax
   19160:	0f b6 d2             	movzbl %dl,%edx
   19163:	0f b6 c1             	movzbl %cl,%eax
   19166:	0f 4e c2             	cmovle %edx,%eax
   19169:	c3                   	ret
   1916a:	31 c0                	xor    %eax,%eax
   1916c:	c3                   	ret
   1916d:	cc                   	int3
   1916e:	cc                   	int3
   1916f:	cc                   	int3

hyperinterval::float::F32Enclosure::affine:
   19170:	55                   	push   %rbp
   19171:	41 57                	push   %r15
   19173:	41 56                	push   %r14
   19175:	41 55                	push   %r13
   19177:	41 54                	push   %r12
   19179:	53                   	push   %rbx
   1917a:	48 83 ec 28          	sub    $0x28,%rsp
   1917e:	f3 0f 11 4c 24 20    	movss  %xmm1,0x20(%rsp)
   19184:	49 89 f7             	mov    %rsi,%r15
   19187:	48 89 fb             	mov    %rdi,%rbx
   1918a:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   19190:	66 0f 7e c1          	movd   %xmm0,%ecx
   19194:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19199:	be 00 00 00 80       	mov    $0x80000000,%esi
   1919e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191a3:	e8 b8 3c 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   191a8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   191ad:	74 2a                	je     191d9 <hyperinterval::float::F32Enclosure::affine+0x69>
   191af:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   191b4:	66 0f 6e 44 24 20    	movd   0x20(%rsp),%xmm0
   191ba:	66 0f 7e c1          	movd   %xmm0,%ecx
   191be:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   191c3:	be 00 00 00 80       	mov    $0x80000000,%esi
   191c8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191cd:	e8 8e 3c 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   191d2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   191d7:	75 20                	jne    191f9 <hyperinterval::float::F32Enclosure::affine+0x89>
   191d9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   191de:	88 43 04             	mov    %al,0x4(%rbx)
   191e1:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   191e7:	48 89 d8             	mov    %rbx,%rax
   191ea:	48 83 c4 28          	add    $0x28,%rsp
   191ee:	5b                   	pop    %rbx
   191ef:	41 5c                	pop    %r12
   191f1:	41 5d                	pop    %r13
   191f3:	41 5e                	pop    %r14
   191f5:	41 5f                	pop    %r15
   191f7:	5d                   	pop    %rbp
   191f8:	c3                   	ret
   191f9:	41 f6 07 01          	testb  $0x1,(%r15)
   191fd:	0f 84 19 01 00 00    	je     1931c <hyperinterval::float::F32Enclosure::affine+0x1ac>
   19203:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   19208:	41 8b 4f 04          	mov    0x4(%r15),%ecx
   1920c:	45 8b 7f 08          	mov    0x8(%r15),%r15d
   19210:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19215:	be 00 00 00 80       	mov    $0x80000000,%esi
   1921a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1921f:	4d 89 f0             	mov    %r14,%r8
   19222:	4d 89 e1             	mov    %r12,%r9
   19225:	e8 46 38 00 00       	call   1ca70 <hyperinterval::ieee::Format::affine>
   1922a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1922f:	74 a8                	je     191d9 <hyperinterval::float::F32Enclosure::affine+0x69>
   19231:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   19235:	8b 44 24 18          	mov    0x18(%rsp),%eax
   19239:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1923e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19243:	be 00 00 00 80       	mov    $0x80000000,%esi
   19248:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1924d:	4c 89 f9             	mov    %r15,%rcx
   19250:	4d 89 f0             	mov    %r14,%r8
   19253:	4d 89 e1             	mov    %r12,%r9
   19256:	e8 15 38 00 00       	call   1ca70 <hyperinterval::ieee::Format::affine>
   1925b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19260:	0f 84 73 ff ff ff    	je     191d9 <hyperinterval::float::F32Enclosure::affine+0x69>
   19266:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1926b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   19270:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19275:	be 00 00 00 80       	mov    $0x80000000,%esi
   1927a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1927f:	48 89 e9             	mov    %rbp,%rcx
   19282:	e8 d9 3b 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19287:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1928c:	0f 84 47 ff ff ff    	je     191d9 <hyperinterval::float::F32Enclosure::affine+0x69>
   19292:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19297:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1929c:	be 00 00 00 80       	mov    $0x80000000,%esi
   192a1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   192a6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   192ab:	e8 b0 3b 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   192b0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   192b5:	0f 84 1e ff ff ff    	je     191d9 <hyperinterval::float::F32Enclosure::affine+0x69>
   192bb:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   192bf:	44 89 f0             	mov    %r14d,%eax
   192c2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   192c7:	89 e9                	mov    %ebp,%ecx
   192c9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   192cf:	ba 00 00 00 80       	mov    $0x80000000,%edx
   192d4:	29 c2                	sub    %eax,%edx
   192d6:	44 09 e8             	or     %r13d,%eax
   192d9:	45 85 f6             	test   %r14d,%r14d
   192dc:	48 0f 49 d0          	cmovns %rax,%rdx
   192e0:	89 c8                	mov    %ecx,%eax
   192e2:	44 09 e8             	or     %r13d,%eax
   192e5:	41 29 cd             	sub    %ecx,%r13d
   192e8:	85 ed                	test   %ebp,%ebp
   192ea:	4c 0f 49 e8          	cmovns %rax,%r13
   192ee:	b0 01                	mov    $0x1,%al
   192f0:	44 39 ea             	cmp    %r13d,%edx
   192f3:	0f 87 e5 fe ff ff    	ja     191de <hyperinterval::float::F32Enclosure::affine+0x6e>
   192f9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   192fe:	4c 89 fe             	mov    %r15,%rsi
   19301:	4c 89 e2             	mov    %r12,%rdx
   19304:	e8 37 06 00 00       	call   19940 <hyperinterval::float::F32Enclosure::from_bits>
   19309:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1930d:	83 f8 02             	cmp    $0x2,%eax
   19310:	75 15                	jne    19327 <hyperinterval::float::F32Enclosure::affine+0x1b7>
   19312:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   19317:	e9 c2 fe ff ff       	jmp    191de <hyperinterval::float::F32Enclosure::affine+0x6e>
   1931c:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19322:	e9 c0 fe ff ff       	jmp    191e7 <hyperinterval::float::F32Enclosure::affine+0x77>
   19327:	83 f8 01             	cmp    $0x1,%eax
   1932a:	75 17                	jne    19343 <hyperinterval::float::F32Enclosure::affine+0x1d3>
   1932c:	8b 54 24 0c          	mov    0xc(%rsp),%edx
   19330:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19334:	44 89 f7             	mov    %r14d,%edi
   19337:	89 ee                	mov    %ebp,%esi
   19339:	e8 02 43 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   1933e:	41 89 c6             	mov    %eax,%r14d
   19341:	89 d5                	mov    %edx,%ebp
   19343:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19349:	44 89 73 04          	mov    %r14d,0x4(%rbx)
   1934d:	89 6b 08             	mov    %ebp,0x8(%rbx)
   19350:	e9 92 fe ff ff       	jmp    191e7 <hyperinterval::float::F32Enclosure::affine+0x77>
   19355:	cc                   	int3
   19356:	cc                   	int3
   19357:	cc                   	int3
   19358:	cc                   	int3
   19359:	cc                   	int3
   1935a:	cc                   	int3
   1935b:	cc                   	int3
   1935c:	cc                   	int3
   1935d:	cc                   	int3
   1935e:	cc                   	int3
   1935f:	cc                   	int3

hyperinterval::float::F32Enclosure::square:
   19360:	55                   	push   %rbp
   19361:	41 57                	push   %r15
   19363:	41 56                	push   %r14
   19365:	41 55                	push   %r13
   19367:	41 54                	push   %r12
   19369:	53                   	push   %rbx
   1936a:	48 83 ec 48          	sub    $0x48,%rsp
   1936e:	48 89 fb             	mov    %rdi,%rbx
   19371:	f6 06 01             	testb  $0x1,(%rsi)
   19374:	0f 84 d8 00 00 00    	je     19452 <hyperinterval::float::F32Enclosure::square+0xf2>
   1937a:	44 8b 7e 04          	mov    0x4(%rsi),%r15d
   1937e:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   19382:	44 89 f8             	mov    %r15d,%eax
   19385:	c1 e8 17             	shr    $0x17,%eax
   19388:	0f b6 c8             	movzbl %al,%ecx
   1938b:	44 89 fa             	mov    %r15d,%edx
   1938e:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19394:	31 c0                	xor    %eax,%eax
   19396:	85 c9                	test   %ecx,%ecx
   19398:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   1939f:	41 bc d6 fe ff ff    	mov    $0xfffffed6,%r12d
   193a5:	41 0f 44 cc          	cmove  %r12d,%ecx
   193a9:	0f 95 c0             	setne  %al
   193ac:	c1 e0 17             	shl    $0x17,%eax
   193af:	48 09 d0             	or     %rdx,%rax
   193b2:	48 f7 e0             	mul    %rax
   193b5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   193ba:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   193bf:	48 89 04 24          	mov    %rax,(%rsp)
   193c3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   193c7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   193cc:	48 89 e1             	mov    %rsp,%rcx
   193cf:	be 00 00 00 80       	mov    $0x80000000,%esi
   193d4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   193d9:	e8 c2 3a 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   193de:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   193e3:	75 66                	jne    1944b <hyperinterval::float::F32Enclosure::square+0xeb>
   193e5:	44 8b 6c 24 38       	mov    0x38(%rsp),%r13d
   193ea:	8b 6c 24 40          	mov    0x40(%rsp),%ebp
   193ee:	44 89 f0             	mov    %r14d,%eax
   193f1:	c1 e8 17             	shr    $0x17,%eax
   193f4:	0f b6 c8             	movzbl %al,%ecx
   193f7:	44 89 f2             	mov    %r14d,%edx
   193fa:	81 e2 ff ff 7f 00    	and    $0x7fffff,%edx
   19400:	31 c0                	xor    %eax,%eax
   19402:	85 c9                	test   %ecx,%ecx
   19404:	8d 8c 09 d4 fe ff ff 	lea    -0x12c(%rcx,%rcx,1),%ecx
   1940b:	41 0f 44 cc          	cmove  %r12d,%ecx
   1940f:	0f 95 c0             	setne  %al
   19412:	c1 e0 17             	shl    $0x17,%eax
   19415:	48 09 d0             	or     %rdx,%rax
   19418:	48 f7 e0             	mul    %rax
   1941b:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19420:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   19425:	48 89 04 24          	mov    %rax,(%rsp)
   19429:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1942d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   19432:	48 89 e1             	mov    %rsp,%rcx
   19435:	be 00 00 00 80       	mov    $0x80000000,%esi
   1943a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1943f:	e8 5c 3a 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   19444:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   19449:	75 0f                	jne    1945a <hyperinterval::float::F32Enclosure::square+0xfa>
   1944b:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   19450:	eb 59                	jmp    194ab <hyperinterval::float::F32Enclosure::square+0x14b>
   19452:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19458:	eb 5a                	jmp    194b4 <hyperinterval::float::F32Enclosure::square+0x154>
   1945a:	8b 44 24 38          	mov    0x38(%rsp),%eax
   1945e:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19463:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
   19468:	48 89 e7             	mov    %rsp,%rdi
   1946b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19470:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19475:	4c 89 e9             	mov    %r13,%rcx
   19478:	e8 e3 39 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1947d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19481:	74 23                	je     194a6 <hyperinterval::float::F32Enclosure::square+0x146>
   19483:	4d 89 e5             	mov    %r12,%r13
   19486:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1948b:	48 89 e7             	mov    %rsp,%rdi
   1948e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19493:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19498:	48 89 e9             	mov    %rbp,%rcx
   1949b:	e8 c0 39 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   194a0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   194a4:	75 20                	jne    194c6 <hyperinterval::float::F32Enclosure::square+0x166>
   194a6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   194ab:	88 43 04             	mov    %al,0x4(%rbx)
   194ae:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   194b4:	48 89 d8             	mov    %rbx,%rax
   194b7:	48 83 c4 48          	add    $0x48,%rsp
   194bb:	5b                   	pop    %rbx
   194bc:	41 5c                	pop    %r12
   194be:	41 5d                	pop    %r13
   194c0:	41 5e                	pop    %r14
   194c2:	41 5f                	pop    %r15
   194c4:	5d                   	pop    %rbp
   194c5:	c3                   	ret
   194c6:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   194ca:	44 89 e0             	mov    %r12d,%eax
   194cd:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   194d2:	89 e9                	mov    %ebp,%ecx
   194d4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   194da:	ba 00 00 00 80       	mov    $0x80000000,%edx
   194df:	29 c2                	sub    %eax,%edx
   194e1:	bf 00 00 00 80       	mov    $0x80000000,%edi
   194e6:	09 f8                	or     %edi,%eax
   194e8:	45 85 e4             	test   %r12d,%r12d
   194eb:	48 0f 49 d0          	cmovns %rax,%rdx
   194ef:	be 00 00 00 80       	mov    $0x80000000,%esi
   194f4:	29 ce                	sub    %ecx,%esi
   194f6:	89 c8                	mov    %ecx,%eax
   194f8:	09 f8                	or     %edi,%eax
   194fa:	85 ed                	test   %ebp,%ebp
   194fc:	48 0f 49 f0          	cmovns %rax,%rsi
   19500:	b0 01                	mov    $0x1,%al
   19502:	39 f2                	cmp    %esi,%edx
   19504:	77 a5                	ja     194ab <hyperinterval::float::F32Enclosure::square+0x14b>
   19506:	48 89 e7             	mov    %rsp,%rdi
   19509:	be 00 00 00 80       	mov    $0x80000000,%esi
   1950e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19513:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19518:	e8 43 39 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1951d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19521:	74 83                	je     194a6 <hyperinterval::float::F32Enclosure::square+0x146>
   19523:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19528:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1952d:	48 89 e7             	mov    %rsp,%rdi
   19530:	be 00 00 00 80       	mov    $0x80000000,%esi
   19535:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1953a:	4c 89 e9             	mov    %r13,%rcx
   1953d:	e8 1e 39 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19542:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19546:	0f 84 5a ff ff ff    	je     194a6 <hyperinterval::float::F32Enclosure::square+0x146>
   1954c:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   19550:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19555:	89 d0                	mov    %edx,%eax
   19557:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1955c:	41 89 c8             	mov    %ecx,%r8d
   1955f:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19566:	be 00 00 00 80       	mov    $0x80000000,%esi
   1956b:	29 c6                	sub    %eax,%esi
   1956d:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19572:	09 f8                	or     %edi,%eax
   19574:	85 d2                	test   %edx,%edx
   19576:	48 0f 49 f0          	cmovns %rax,%rsi
   1957a:	44 89 c0             	mov    %r8d,%eax
   1957d:	09 f8                	or     %edi,%eax
   1957f:	44 29 c7             	sub    %r8d,%edi
   19582:	85 c9                	test   %ecx,%ecx
   19584:	48 0f 49 f8          	cmovns %rax,%rdi
   19588:	b0 01                	mov    $0x1,%al
   1958a:	39 fe                	cmp    %edi,%esi
   1958c:	0f 87 19 ff ff ff    	ja     194ab <hyperinterval::float::F32Enclosure::square+0x14b>
   19592:	44 89 e7             	mov    %r12d,%edi
   19595:	89 ee                	mov    %ebp,%esi
   19597:	e8 a4 40 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   1959c:	41 89 c4             	mov    %eax,%r12d
   1959f:	89 d5                	mov    %edx,%ebp
   195a1:	44 89 ff             	mov    %r15d,%edi
   195a4:	44 89 f6             	mov    %r14d,%esi
   195a7:	31 d2                	xor    %edx,%edx
   195a9:	e8 42 42 00 00       	call   1d7f0 <hyperinterval::bounds::Bounds<T>::signs>
   195ae:	a8 02                	test   $0x2,%al
   195b0:	75 12                	jne    195c4 <hyperinterval::float::F32Enclosure::square+0x264>
   195b2:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   195b8:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   195bc:	89 6b 08             	mov    %ebp,0x8(%rbx)
   195bf:	e9 f0 fe ff ff       	jmp    194b4 <hyperinterval::float::F32Enclosure::square+0x154>
   195c4:	48 89 e7             	mov    %rsp,%rdi
   195c7:	31 f6                	xor    %esi,%esi
   195c9:	31 d2                	xor    %edx,%edx
   195cb:	e8 70 03 00 00       	call   19940 <hyperinterval::float::F32Enclosure::from_bits>
   195d0:	8b 04 24             	mov    (%rsp),%eax
   195d3:	83 f8 02             	cmp    $0x2,%eax
   195d6:	75 0a                	jne    195e2 <hyperinterval::float::F32Enclosure::square+0x282>
   195d8:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   195dd:	e9 c9 fe ff ff       	jmp    194ab <hyperinterval::float::F32Enclosure::square+0x14b>
   195e2:	83 f8 01             	cmp    $0x1,%eax
   195e5:	75 cb                	jne    195b2 <hyperinterval::float::F32Enclosure::square+0x252>
   195e7:	8b 54 24 04          	mov    0x4(%rsp),%edx
   195eb:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   195ef:	44 89 e7             	mov    %r12d,%edi
   195f2:	89 ee                	mov    %ebp,%esi
   195f4:	e8 47 40 00 00       	call   1d640 <hyperinterval::bounds::Bounds<T>::hull>
   195f9:	41 89 c4             	mov    %eax,%r12d
   195fc:	89 d5                	mov    %edx,%ebp
   195fe:	eb b2                	jmp    195b2 <hyperinterval::float::F32Enclosure::square+0x252>

hyperinterval::float::F32Enclosure::next_up:
   19600:	48 83 ec 18          	sub    $0x18,%rsp
   19604:	66 0f 7e c1          	movd   %xmm0,%ecx
   19608:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1960d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19612:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19617:	e8 44 38 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1961c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19621:	75 10                	jne    19633 <hyperinterval::float::F32Enclosure::next_up+0x33>
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
   19655:	e8 06 38 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1965a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1965f:	75 0a                	jne    1966b <hyperinterval::float::F32Enclosure::next_up+0x6b>
   19661:	b8 01 05 00 00       	mov    $0x501,%eax
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

hyperinterval::float::F32Enclosure::disjoint:
   19680:	83 3f 00             	cmpl   $0x0,(%rdi)
   19683:	b0 01                	mov    $0x1,%al
   19685:	0f 84 a3 00 00 00    	je     1972e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   1968b:	8b 0e                	mov    (%rsi),%ecx
   1968d:	85 c9                	test   %ecx,%ecx
   1968f:	0f 84 99 00 00 00    	je     1972e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   19695:	f6 c1 01             	test   $0x1,%cl
   19698:	74 4c                	je     196e6 <hyperinterval::float::F32Enclosure::disjoint+0x66>
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
   196e4:	72 48                	jb     1972e <hyperinterval::float::F32Enclosure::disjoint+0xae>
   196e6:	f6 c1 01             	test   $0x1,%cl
   196e9:	75 03                	jne    196ee <hyperinterval::float::F32Enclosure::disjoint+0x6e>
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

hyperinterval::float::F32Enclosure::expanded:
   19730:	41 57                	push   %r15
   19732:	41 56                	push   %r14
   19734:	41 54                	push   %r12
   19736:	53                   	push   %rbx
   19737:	48 83 ec 18          	sub    $0x18,%rsp
   1973b:	48 89 fb             	mov    %rdi,%rbx
   1973e:	f6 06 01             	testb  $0x1,(%rsi)
   19741:	74 7c                	je     197bf <hyperinterval::float::F32Enclosure::expanded+0x8f>
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
   19778:	e8 e3 36 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1977d:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19782:	75 2f                	jne    197b3 <hyperinterval::float::F32Enclosure::expanded+0x83>
   19784:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19789:	31 c0                	xor    %eax,%eax
   1978b:	45 85 f6             	test   %r14d,%r14d
   1978e:	0f 99 c0             	setns  %al
   19791:	49 8d 0c 46          	lea    (%r14,%rax,2),%rcx
   19795:	48 ff c9             	dec    %rcx
   19798:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1979d:	be 00 00 00 80       	mov    $0x80000000,%esi
   197a2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   197a7:	e8 b4 36 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   197ac:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197b1:	75 21                	jne    197d4 <hyperinterval::float::F32Enclosure::expanded+0xa4>
   197b3:	c6 43 04 05          	movb   $0x5,0x4(%rbx)
   197b7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   197bd:	eb 06                	jmp    197c5 <hyperinterval::float::F32Enclosure::expanded+0x95>
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
   197f5:	e8 66 36 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   197fa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   197ff:	74 23                	je     19824 <hyperinterval::float::F32Enclosure::expanded+0xf4>
   19801:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19806:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1980b:	be 00 00 00 80       	mov    $0x80000000,%esi
   19810:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19815:	4c 89 f1             	mov    %r14,%rcx
   19818:	e8 43 36 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1981d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19822:	75 10                	jne    19834 <hyperinterval::float::F32Enclosure::expanded+0x104>
   19824:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19829:	88 43 04             	mov    %al,0x4(%rbx)
   1982c:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19832:	eb 91                	jmp    197c5 <hyperinterval::float::F32Enclosure::expanded+0x95>
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
   1986b:	76 0f                	jbe    1987c <hyperinterval::float::F32Enclosure::expanded+0x14c>
   1986d:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   19871:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19877:	e9 49 ff ff ff       	jmp    197c5 <hyperinterval::float::F32Enclosure::expanded+0x95>
   1987c:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19882:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   19886:	89 43 08             	mov    %eax,0x8(%rbx)
   19889:	e9 37 ff ff ff       	jmp    197c5 <hyperinterval::float::F32Enclosure::expanded+0x95>
   1988e:	cc                   	int3
   1988f:	cc                   	int3

hyperinterval::float::F32Enclosure::overlaps:
   19890:	31 c0                	xor    %eax,%eax
   19892:	83 3f 00             	cmpl   $0x0,(%rdi)
   19895:	0f 84 a1 00 00 00    	je     1993c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   1989b:	8b 0e                	mov    (%rsi),%ecx
   1989d:	85 c9                	test   %ecx,%ecx
   1989f:	0f 84 97 00 00 00    	je     1993c <hyperinterval::float::F32Enclosure::overlaps+0xac>
   198a5:	f6 c1 01             	test   $0x1,%cl
   198a8:	74 4b                	je     198f5 <hyperinterval::float::F32Enclosure::overlaps+0x65>
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
   198f0:	73 03                	jae    198f5 <hyperinterval::float::F32Enclosure::overlaps+0x65>
   198f2:	31 c0                	xor    %eax,%eax
   198f4:	c3                   	ret
   198f5:	b0 01                	mov    $0x1,%al
   198f7:	f6 c1 01             	test   $0x1,%cl
   198fa:	74 40                	je     1993c <hyperinterval::float::F32Enclosure::overlaps+0xac>
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

hyperinterval::float::F32Enclosure::from_bits:
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
   19968:	e8 f3 34 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1996d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19972:	74 23                	je     19997 <hyperinterval::float::F32Enclosure::from_bits+0x57>
   19974:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19979:	44 89 f1             	mov    %r14d,%ecx
   1997c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19981:	be 00 00 00 80       	mov    $0x80000000,%esi
   19986:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1998b:	e8 d0 34 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19990:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19995:	75 1a                	jne    199b1 <hyperinterval::float::F32Enclosure::from_bits+0x71>
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
   199e8:	76 06                	jbe    199f0 <hyperinterval::float::F32Enclosure::from_bits+0xb0>
   199ea:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   199ee:	eb af                	jmp    1999f <hyperinterval::float::F32Enclosure::from_bits+0x5f>
   199f0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   199f6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   199fa:	89 43 08             	mov    %eax,0x8(%rbx)
   199fd:	eb a6                	jmp    199a5 <hyperinterval::float::F32Enclosure::from_bits+0x65>
   199ff:	cc                   	int3

hyperinterval::float::F32Enclosure::max_image:
   19a00:	48 89 f8             	mov    %rdi,%rax
   19a03:	31 c9                	xor    %ecx,%ecx
   19a05:	f6 06 01             	testb  $0x1,(%rsi)
   19a08:	0f 84 db 00 00 00    	je     19ae9 <hyperinterval::float::F32Enclosure::max_image+0xe9>
   19a0e:	f6 02 01             	testb  $0x1,(%rdx)
   19a11:	0f 84 ca 00 00 00    	je     19ae1 <hyperinterval::float::F32Enclosure::max_image+0xe1>
   19a17:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19a1c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19a21:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19a25:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19a29:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   19a2d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19a31:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19a35:	66 0f 6f 1d c3 c0 fe 	movdqa -0x13f3d(%rip),%xmm3        # 5b00 <__abi_tag+0x5804>
   19a3c:	ff 
   19a3d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19a41:	66 0f eb f3          	por    %xmm3,%xmm6
   19a45:	66 0f 6f 3d b3 be fe 	movdqa -0x1414d(%rip),%xmm7        # 5900 <__abi_tag+0x5604>
   19a4c:	ff 
   19a4d:	66 0f db e7          	pand   %xmm7,%xmm4
   19a51:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19a56:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   19a5b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19a60:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19a65:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   19a6a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   19a6f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19a74:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19a79:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   19a7d:	66 0f eb e3          	por    %xmm3,%xmm4
   19a81:	66 0f db ef          	pand   %xmm7,%xmm5
   19a85:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19a89:	66 0f fb f5          	psubq  %xmm5,%xmm6
   19a8d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   19a92:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   19a96:	66 0f db f2          	pand   %xmm2,%xmm6
   19a9a:	66 0f df d4          	pandn  %xmm4,%xmm2
   19a9e:	66 0f eb d6          	por    %xmm6,%xmm2
   19aa2:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   19aa7:	66 0f ef d3          	pxor   %xmm3,%xmm2
   19aab:	66 0f 6f da          	movdqa %xmm2,%xmm3
   19aaf:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   19ab4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   19ab9:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   19abe:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   19ac3:	66 0f db ec          	pand   %xmm4,%xmm5
   19ac7:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   19acc:	66 0f eb d5          	por    %xmm5,%xmm2
   19ad0:	66 0f db c2          	pand   %xmm2,%xmm0
   19ad4:	66 0f df d1          	pandn  %xmm1,%xmm2
   19ad8:	66 0f eb d0          	por    %xmm0,%xmm2
   19adc:	b9 01 00 00 00       	mov    $0x1,%ecx
   19ae1:	89 08                	mov    %ecx,(%rax)
   19ae3:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19ae8:	c3                   	ret
   19ae9:	89 08                	mov    %ecx,(%rax)
   19aeb:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19aef:	c3                   	ret

hyperinterval::float::F32Enclosure::min_image:
   19af0:	48 89 f8             	mov    %rdi,%rax
   19af3:	31 c9                	xor    %ecx,%ecx
   19af5:	f6 06 01             	testb  $0x1,(%rsi)
   19af8:	0f 84 dc 00 00 00    	je     19bda <hyperinterval::float::F32Enclosure::min_image+0xea>
   19afe:	f6 02 01             	testb  $0x1,(%rdx)
   19b01:	0f 84 cb 00 00 00    	je     19bd2 <hyperinterval::float::F32Enclosure::min_image+0xe2>
   19b07:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   19b0c:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   19b11:	66 0f ef d2          	pxor   %xmm2,%xmm2
   19b15:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   19b19:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   19b1d:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   19b21:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   19b25:	66 0f 6f 1d d3 bf fe 	movdqa -0x1402d(%rip),%xmm3        # 5b00 <__abi_tag+0x5804>
   19b2c:	ff 
   19b2d:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   19b31:	66 0f eb f3          	por    %xmm3,%xmm6
   19b35:	66 0f 6f 3d c3 bd fe 	movdqa -0x1423d(%rip),%xmm7        # 5900 <__abi_tag+0x5604>
   19b3c:	ff 
   19b3d:	66 0f db e7          	pand   %xmm7,%xmm4
   19b41:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   19b46:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   19b4b:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   19b50:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   19b55:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   19b5a:	66 45 0f db c1       	pand   %xmm9,%xmm8
   19b5f:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   19b64:	66 45 0f eb c8       	por    %xmm8,%xmm9
   19b69:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   19b6d:	66 0f eb e3          	por    %xmm3,%xmm4
   19b71:	66 0f db ef          	pand   %xmm7,%xmm5
   19b75:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   19b79:	66 0f fb f5          	psubq  %xmm5,%xmm6
   19b7d:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   19b82:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   19b86:	66 0f db f2          	pand   %xmm2,%xmm6
   19b8a:	66 0f df d4          	pandn  %xmm4,%xmm2
   19b8e:	66 0f eb d6          	por    %xmm6,%xmm2
   19b92:	66 0f ef d3          	pxor   %xmm3,%xmm2
   19b96:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   19b9b:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   19ba0:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   19ba4:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   19ba9:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   19bae:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   19bb4:	66 0f db ec          	pand   %xmm4,%xmm5
   19bb8:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   19bbd:	66 0f eb d5          	por    %xmm5,%xmm2
   19bc1:	66 0f db c2          	pand   %xmm2,%xmm0
   19bc5:	66 0f df d1          	pandn  %xmm1,%xmm2
   19bc9:	66 0f eb d0          	por    %xmm0,%xmm2
   19bcd:	b9 01 00 00 00       	mov    $0x1,%ecx
   19bd2:	89 08                	mov    %ecx,(%rax)
   19bd4:	66 0f d6 50 04       	movq   %xmm2,0x4(%rax)
   19bd9:	c3                   	ret
   19bda:	89 08                	mov    %ecx,(%rax)
   19bdc:	0f 13 50 04          	movlps %xmm2,0x4(%rax)
   19be0:	c3                   	ret
   19be1:	cc                   	int3
   19be2:	cc                   	int3
   19be3:	cc                   	int3
   19be4:	cc                   	int3
   19be5:	cc                   	int3
   19be6:	cc                   	int3
   19be7:	cc                   	int3
   19be8:	cc                   	int3
   19be9:	cc                   	int3
   19bea:	cc                   	int3
   19beb:	cc                   	int3
   19bec:	cc                   	int3
   19bed:	cc                   	int3
   19bee:	cc                   	int3
   19bef:	cc                   	int3

hyperinterval::float::F32Enclosure::next_down:
   19bf0:	53                   	push   %rbx
   19bf1:	48 83 ec 10          	sub    $0x10,%rsp
   19bf5:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   19bfa:	66 0f 7e c1          	movd   %xmm0,%ecx
   19bfe:	48 89 e7             	mov    %rsp,%rdi
   19c01:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c06:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c0b:	e8 50 32 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19c10:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19c14:	75 11                	jne    19c27 <hyperinterval::float::F32Enclosure::next_down+0x37>
   19c16:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19c1b:	c1 e0 08             	shl    $0x8,%eax
   19c1e:	48 ff c0             	inc    %rax
   19c21:	48 83 c4 10          	add    $0x10,%rsp
   19c25:	5b                   	pop    %rbx
   19c26:	c3                   	ret
   19c27:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19c2c:	48 89 c1             	mov    %rax,%rcx
   19c2f:	48 31 d9             	xor    %rbx,%rcx
   19c32:	48 85 c0             	test   %rax,%rax
   19c35:	48 0f 44 c8          	cmove  %rax,%rcx
   19c39:	31 c0                	xor    %eax,%eax
   19c3b:	85 c9                	test   %ecx,%ecx
   19c3d:	0f 99 c0             	setns  %al
   19c40:	48 8d 0c 41          	lea    (%rcx,%rax,2),%rcx
   19c44:	48 ff c9             	dec    %rcx
   19c47:	48 89 e7             	mov    %rsp,%rdi
   19c4a:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c4f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c54:	e8 07 32 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19c59:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19c5d:	75 0b                	jne    19c6a <hyperinterval::float::F32Enclosure::next_down+0x7a>
   19c5f:	b8 01 05 00 00       	mov    $0x501,%eax
   19c64:	48 83 c4 10          	add    $0x10,%rsp
   19c68:	5b                   	pop    %rbx
   19c69:	c3                   	ret
   19c6a:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19c6f:	48 89 c8             	mov    %rcx,%rax
   19c72:	48 35 00 00 00 80    	xor    $0xffffffff80000000,%rax
   19c78:	48 c1 e0 20          	shl    $0x20,%rax
   19c7c:	48 85 c9             	test   %rcx,%rcx
   19c7f:	48 0f 44 c1          	cmove  %rcx,%rax
   19c83:	48 83 c4 10          	add    $0x10,%rsp
   19c87:	5b                   	pop    %rbx
   19c88:	c3                   	ret
   19c89:	cc                   	int3
   19c8a:	cc                   	int3
   19c8b:	cc                   	int3
   19c8c:	cc                   	int3
   19c8d:	cc                   	int3
   19c8e:	cc                   	int3
   19c8f:	cc                   	int3

hyperinterval::float::F32Enclosure::subset_of:
   19c90:	b0 01                	mov    $0x1,%al
   19c92:	f6 07 01             	testb  $0x1,(%rdi)
   19c95:	74 53                	je     19cea <hyperinterval::float::F32Enclosure::subset_of+0x5a>
   19c97:	f6 06 01             	testb  $0x1,(%rsi)
   19c9a:	74 4c                	je     19ce8 <hyperinterval::float::F32Enclosure::subset_of+0x58>
   19c9c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   19c9f:	8b 56 04             	mov    0x4(%rsi),%edx
   19ca2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19ca7:	41 89 d0             	mov    %edx,%r8d
   19caa:	41 09 c0             	or     %eax,%r8d
   19cad:	41 89 d1             	mov    %edx,%r9d
   19cb0:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   19cb7:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   19cbd:	45 29 ca             	sub    %r9d,%r10d
   19cc0:	85 d2                	test   %edx,%edx
   19cc2:	4d 0f 49 d0          	cmovns %r8,%r10
   19cc6:	89 ca                	mov    %ecx,%edx
   19cc8:	09 c2                	or     %eax,%edx
   19cca:	41 89 c8             	mov    %ecx,%r8d
   19ccd:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   19cd4:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19cda:	45 29 c1             	sub    %r8d,%r9d
   19cdd:	85 c9                	test   %ecx,%ecx
   19cdf:	4c 0f 49 ca          	cmovns %rdx,%r9
   19ce3:	45 39 ca             	cmp    %r9d,%r10d
   19ce6:	76 03                	jbe    19ceb <hyperinterval::float::F32Enclosure::subset_of+0x5b>
   19ce8:	31 c0                	xor    %eax,%eax
   19cea:	c3                   	ret
   19ceb:	8b 4f 08             	mov    0x8(%rdi),%ecx
   19cee:	8b 56 08             	mov    0x8(%rsi),%edx
   19cf1:	89 ce                	mov    %ecx,%esi
   19cf3:	09 c6                	or     %eax,%esi
   19cf5:	89 cf                	mov    %ecx,%edi
   19cf7:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19cfd:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19d03:	41 29 f8             	sub    %edi,%r8d
   19d06:	85 c9                	test   %ecx,%ecx
   19d08:	4c 0f 49 c6          	cmovns %rsi,%r8
   19d0c:	89 d1                	mov    %edx,%ecx
   19d0e:	09 c1                	or     %eax,%ecx
   19d10:	89 d6                	mov    %edx,%esi
   19d12:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19d18:	29 f0                	sub    %esi,%eax
   19d1a:	85 d2                	test   %edx,%edx
   19d1c:	48 0f 49 c1          	cmovns %rcx,%rax
   19d20:	41 39 c0             	cmp    %eax,%r8d
   19d23:	0f 96 c0             	setbe  %al
   19d26:	c3                   	ret
   19d27:	cc                   	int3
   19d28:	cc                   	int3
   19d29:	cc                   	int3
   19d2a:	cc                   	int3
   19d2b:	cc                   	int3
   19d2c:	cc                   	int3
   19d2d:	cc                   	int3
   19d2e:	cc                   	int3
   19d2f:	cc                   	int3

hyperinterval::float::F64Enclosure::reciprocal:
   19d30:	55                   	push   %rbp
   19d31:	41 57                	push   %r15
   19d33:	41 56                	push   %r14
   19d35:	41 55                	push   %r13
   19d37:	41 54                	push   %r12
   19d39:	53                   	push   %rbx
   19d3a:	48 83 ec 28          	sub    $0x28,%rsp
   19d3e:	48 89 fb             	mov    %rdi,%rbx
   19d41:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   19d45:	74 65                	je     19dac <hyperinterval::float::F64Enclosure::reciprocal+0x7c>
   19d47:	49 89 f6             	mov    %rsi,%r14
   19d4a:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   19d51:	00 00 80 
   19d54:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   19d5b:	00 f0 7f 
   19d5e:	49 bd 00 00 00 00 00 	movabs $0x3ff0000000000000,%r13
   19d65:	00 f0 3f 
   19d68:	48 89 e7             	mov    %rsp,%rdi
   19d6b:	4c 89 fe             	mov    %r15,%rsi
   19d6e:	4c 89 e2             	mov    %r12,%rdx
   19d71:	4c 89 e9             	mov    %r13,%rcx
   19d74:	e8 e7 30 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19d79:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d7d:	74 1c                	je     19d9b <hyperinterval::float::F64Enclosure::reciprocal+0x6b>
   19d7f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   19d84:	48 89 e7             	mov    %rsp,%rdi
   19d87:	4c 89 fe             	mov    %r15,%rsi
   19d8a:	4c 89 e2             	mov    %r12,%rdx
   19d8d:	4c 89 e9             	mov    %r13,%rcx
   19d90:	e8 cb 30 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19d95:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d99:	75 2a                	jne    19dc5 <hyperinterval::float::F64Enclosure::reciprocal+0x95>
   19d9b:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19da0:	88 53 08             	mov    %dl,0x8(%rbx)
   19da3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19daa:	eb 07                	jmp    19db3 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   19dac:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   19db3:	48 89 d8             	mov    %rbx,%rax
   19db6:	48 83 c4 28          	add    $0x28,%rsp
   19dba:	5b                   	pop    %rbx
   19dbb:	41 5c                	pop    %r12
   19dbd:	41 5d                	pop    %r13
   19dbf:	41 5e                	pop    %r14
   19dc1:	41 5f                	pop    %r15
   19dc3:	5d                   	pop    %rbp
   19dc4:	c3                   	ret
   19dc5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19dca:	48 89 ea             	mov    %rbp,%rdx
   19dcd:	4c 09 fa             	or     %r15,%rdx
   19dd0:	49 8d 47 ff          	lea    -0x1(%r15),%rax
   19dd4:	48 89 ee             	mov    %rbp,%rsi
   19dd7:	48 21 c6             	and    %rax,%rsi
   19dda:	4c 89 ff             	mov    %r15,%rdi
   19ddd:	48 29 f7             	sub    %rsi,%rdi
   19de0:	48 85 ed             	test   %rbp,%rbp
   19de3:	48 0f 49 fa          	cmovns %rdx,%rdi
   19de7:	48 89 ca             	mov    %rcx,%rdx
   19dea:	4c 09 fa             	or     %r15,%rdx
   19ded:	48 89 ce             	mov    %rcx,%rsi
   19df0:	48 21 c6             	and    %rax,%rsi
   19df3:	49 29 f7             	sub    %rsi,%r15
   19df6:	48 85 c9             	test   %rcx,%rcx
   19df9:	4c 0f 49 fa          	cmovns %rdx,%r15
   19dfd:	b2 01                	mov    $0x1,%dl
   19dff:	4c 39 ff             	cmp    %r15,%rdi
   19e02:	77 9c                	ja     19da0 <hyperinterval::float::F64Enclosure::reciprocal+0x70>
   19e04:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
   19e0b:	00 00 
   19e0d:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   19e12:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   19e17:	49 83 7e 08 00       	cmpq   $0x0,0x8(%r14)
   19e1c:	7f 0e                	jg     19e2c <hyperinterval::float::F64Enclosure::reciprocal+0xfc>
   19e1e:	49 8b 4e 10          	mov    0x10(%r14),%rcx
   19e22:	48 85 c9             	test   %rcx,%rcx
   19e25:	79 1f                	jns    19e46 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   19e27:	48 21 c1             	and    %rax,%rcx
   19e2a:	74 1a                	je     19e46 <hyperinterval::float::F64Enclosure::reciprocal+0x116>
   19e2c:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   19e31:	48 89 df             	mov    %rbx,%rdi
   19e34:	4c 89 f2             	mov    %r14,%rdx
   19e37:	b9 01 00 00 00       	mov    $0x1,%ecx
   19e3c:	e8 9f 02 00 00       	call   1a0e0 <hyperinterval::float::F64Enclosure::corner_image>
   19e41:	e9 6d ff ff ff       	jmp    19db3 <hyperinterval::float::F64Enclosure::reciprocal+0x83>
   19e46:	c6 43 08 06          	movb   $0x6,0x8(%rbx)
   19e4a:	e9 54 ff ff ff       	jmp    19da3 <hyperinterval::float::F64Enclosure::reciprocal+0x73>
   19e4f:	cc                   	int3

hyperinterval::float::F64Enclosure::checked_pow:
   19e50:	55                   	push   %rbp
   19e51:	41 57                	push   %r15
   19e53:	41 56                	push   %r14
   19e55:	41 55                	push   %r13
   19e57:	41 54                	push   %r12
   19e59:	53                   	push   %rbx
   19e5a:	48 83 ec 48          	sub    $0x48,%rsp
   19e5e:	48 89 fb             	mov    %rdi,%rbx
   19e61:	83 fa 02             	cmp    $0x2,%edx
   19e64:	75 0e                	jne    19e74 <hyperinterval::float::F64Enclosure::checked_pow+0x24>
   19e66:	48 89 df             	mov    %rbx,%rdi
   19e69:	ff 15 c1 56 04 00    	call   *0x456c1(%rip)        # 5f530 <_DYNAMIC+0x2f0>
   19e6f:	e9 e0 00 00 00       	jmp    19f54 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   19e74:	f6 06 01             	testb  $0x1,(%rsi)
   19e77:	0f 84 d0 00 00 00    	je     19f4d <hyperinterval::float::F64Enclosure::checked_pow+0xfd>
   19e7d:	89 d5                	mov    %edx,%ebp
   19e7f:	4c 8b 76 10          	mov    0x10(%rsi),%r14
   19e83:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   19e8a:	00 00 80 
   19e8d:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   19e94:	00 f0 7f 
   19e97:	4c 8b 7e 08          	mov    0x8(%rsi),%r15
   19e9b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ea0:	4c 89 e6             	mov    %r12,%rsi
   19ea3:	4c 89 ea             	mov    %r13,%rdx
   19ea6:	4c 89 f9             	mov    %r15,%rcx
   19ea9:	41 89 e8             	mov    %ebp,%r8d
   19eac:	e8 bf 27 00 00       	call   1c670 <hyperinterval::ieee::Format::power>
   19eb1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19eb6:	0f 85 80 00 00 00    	jne    19f3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19ebc:	4c 89 f1             	mov    %r14,%rcx
   19ebf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19ec4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19ec9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19ece:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19ed3:	4c 89 e6             	mov    %r12,%rsi
   19ed6:	4c 89 ea             	mov    %r13,%rdx
   19ed9:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
   19ede:	41 89 e8             	mov    %ebp,%r8d
   19ee1:	e8 8a 27 00 00       	call   1c670 <hyperinterval::ieee::Format::power>
   19ee6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19eeb:	74 4f                	je     19f3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19eed:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19ef2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19ef7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   19efc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   19f01:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19f06:	4c 89 e6             	mov    %r12,%rsi
   19f09:	4c 89 ea             	mov    %r13,%rdx
   19f0c:	4c 89 f1             	mov    %r14,%rcx
   19f0f:	e8 4c 2f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19f14:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19f19:	74 21                	je     19f3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19f1b:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   19f20:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19f25:	4c 89 e6             	mov    %r12,%rsi
   19f28:	4c 89 ea             	mov    %r13,%rdx
   19f2b:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19f30:	e8 2b 2f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19f35:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19f3a:	75 2a                	jne    19f66 <hyperinterval::float::F64Enclosure::checked_pow+0x116>
   19f3c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   19f41:	88 43 08             	mov    %al,0x8(%rbx)
   19f44:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   19f4b:	eb 07                	jmp    19f54 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   19f4d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   19f54:	48 89 d8             	mov    %rbx,%rax
   19f57:	48 83 c4 48          	add    $0x48,%rsp
   19f5b:	5b                   	pop    %rbx
   19f5c:	41 5c                	pop    %r12
   19f5e:	41 5d                	pop    %r13
   19f60:	41 5e                	pop    %r14
   19f62:	41 5f                	pop    %r15
   19f64:	5d                   	pop    %rbp
   19f65:	c3                   	ret
   19f66:	4c 89 f0             	mov    %r14,%rax
   19f69:	4c 09 e0             	or     %r12,%rax
   19f6c:	4c 89 f6             	mov    %r14,%rsi
   19f6f:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   19f74:	48 89 f1             	mov    %rsi,%rcx
   19f77:	4c 21 f1             	and    %r14,%rcx
   19f7a:	4c 89 e2             	mov    %r12,%rdx
   19f7d:	48 29 ca             	sub    %rcx,%rdx
   19f80:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   19f85:	48 85 f6             	test   %rsi,%rsi
   19f88:	48 0f 49 d0          	cmovns %rax,%rdx
   19f8c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19f91:	48 89 f8             	mov    %rdi,%rax
   19f94:	4c 09 e0             	or     %r12,%rax
   19f97:	48 89 f9             	mov    %rdi,%rcx
   19f9a:	4c 21 f1             	and    %r14,%rcx
   19f9d:	4c 89 e6             	mov    %r12,%rsi
   19fa0:	48 29 ce             	sub    %rcx,%rsi
   19fa3:	48 85 ff             	test   %rdi,%rdi
   19fa6:	48 0f 49 f0          	cmovns %rax,%rsi
   19faa:	b0 01                	mov    $0x1,%al
   19fac:	48 39 f2             	cmp    %rsi,%rdx
   19faf:	77 90                	ja     19f41 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   19fb1:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   19fb6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19fbb:	4c 89 e6             	mov    %r12,%rsi
   19fbe:	4c 89 ea             	mov    %r13,%rdx
   19fc1:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   19fc6:	e8 95 2e 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19fcb:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19fd0:	0f 84 66 ff ff ff    	je     19f3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   19fd6:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19fdb:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19fe0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19fe5:	4c 89 e6             	mov    %r12,%rsi
   19fe8:	4c 89 ea             	mov    %r13,%rdx
   19feb:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   19ff0:	e8 6b 2e 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   19ff5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19ffa:	0f 84 3c ff ff ff    	je     19f3c <hyperinterval::float::F64Enclosure::checked_pow+0xec>
   1a000:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1a005:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
   1a00a:	48 89 d0             	mov    %rdx,%rax
   1a00d:	4c 09 e0             	or     %r12,%rax
   1a010:	48 89 d7             	mov    %rdx,%rdi
   1a013:	4c 21 f7             	and    %r14,%rdi
   1a016:	4c 89 e6             	mov    %r12,%rsi
   1a019:	48 29 fe             	sub    %rdi,%rsi
   1a01c:	48 85 d2             	test   %rdx,%rdx
   1a01f:	48 0f 49 f0          	cmovns %rax,%rsi
   1a023:	48 89 c8             	mov    %rcx,%rax
   1a026:	4c 09 e0             	or     %r12,%rax
   1a029:	49 21 ce             	and    %rcx,%r14
   1a02c:	4d 29 f4             	sub    %r14,%r12
   1a02f:	48 85 c9             	test   %rcx,%rcx
   1a032:	4c 0f 49 e0          	cmovns %rax,%r12
   1a036:	b0 01                	mov    $0x1,%al
   1a038:	4c 39 e6             	cmp    %r12,%rsi
   1a03b:	0f 87 00 ff ff ff    	ja     19f41 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   1a041:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1a046:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1a04b:	e8 80 36 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a050:	49 89 c5             	mov    %rax,%r13
   1a053:	49 89 d4             	mov    %rdx,%r12
   1a056:	85 ed                	test   %ebp,%ebp
   1a058:	0f 95 c0             	setne  %al
   1a05b:	40 f6 c5 01          	test   $0x1,%bpl
   1a05f:	0f 94 c1             	sete   %cl
   1a062:	84 c8                	test   %cl,%al
   1a064:	74 13                	je     1a079 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1a066:	4c 89 ff             	mov    %r15,%rdi
   1a069:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1a06e:	31 d2                	xor    %edx,%edx
   1a070:	e8 eb 36 00 00       	call   1d760 <hyperinterval::bounds::Bounds<T>::signs>
   1a075:	a8 02                	test   $0x2,%al
   1a077:	75 14                	jne    1a08d <hyperinterval::float::F64Enclosure::checked_pow+0x23d>
   1a079:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a080:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1a084:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1a088:	e9 c7 fe ff ff       	jmp    19f54 <hyperinterval::float::F64Enclosure::checked_pow+0x104>
   1a08d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a092:	31 f6                	xor    %esi,%esi
   1a094:	31 d2                	xor    %edx,%edx
   1a096:	e8 f5 17 00 00       	call   1b890 <hyperinterval::float::F64Enclosure::from_bits>
   1a09b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a0a0:	48 83 f8 02          	cmp    $0x2,%rax
   1a0a4:	75 0a                	jne    1a0b0 <hyperinterval::float::F64Enclosure::checked_pow+0x260>
   1a0a6:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
   1a0ab:	e9 91 fe ff ff       	jmp    19f41 <hyperinterval::float::F64Enclosure::checked_pow+0xf1>
   1a0b0:	83 f8 01             	cmp    $0x1,%eax
   1a0b3:	75 c4                	jne    1a079 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1a0b5:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a0ba:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1a0bf:	4c 89 ef             	mov    %r13,%rdi
   1a0c2:	4c 89 e6             	mov    %r12,%rsi
   1a0c5:	e8 06 36 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a0ca:	49 89 c5             	mov    %rax,%r13
   1a0cd:	49 89 d4             	mov    %rdx,%r12
   1a0d0:	eb a7                	jmp    1a079 <hyperinterval::float::F64Enclosure::checked_pow+0x229>
   1a0d2:	cc                   	int3
   1a0d3:	cc                   	int3
   1a0d4:	cc                   	int3
   1a0d5:	cc                   	int3
   1a0d6:	cc                   	int3
   1a0d7:	cc                   	int3
   1a0d8:	cc                   	int3
   1a0d9:	cc                   	int3
   1a0da:	cc                   	int3
   1a0db:	cc                   	int3
   1a0dc:	cc                   	int3
   1a0dd:	cc                   	int3
   1a0de:	cc                   	int3
   1a0df:	cc                   	int3

hyperinterval::float::F64Enclosure::corner_image:
   1a0e0:	55                   	push   %rbp
   1a0e1:	41 57                	push   %r15
   1a0e3:	41 56                	push   %r14
   1a0e5:	41 55                	push   %r13
   1a0e7:	41 54                	push   %r12
   1a0e9:	53                   	push   %rbx
   1a0ea:	48 83 ec 68          	sub    $0x68,%rsp
   1a0ee:	48 89 fb             	mov    %rdi,%rbx
   1a0f1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a0f5:	75 5f                	jne    1a156 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1a0f7:	f6 02 01             	testb  $0x1,(%rdx)
   1a0fa:	74 5a                	je     1a156 <hyperinterval::float::F64Enclosure::corner_image+0x76>
   1a0fc:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a103:	00 00 80 
   1a106:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a10d:	00 f0 7f 
   1a110:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1a114:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1a118:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a11d:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1a121:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1a125:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a12a:	84 c9                	test   %cl,%cl
   1a12c:	74 34                	je     1a162 <hyperinterval::float::F64Enclosure::corner_image+0x82>
   1a12e:	48 89 e7             	mov    %rsp,%rdi
   1a131:	4c 89 f6             	mov    %r14,%rsi
   1a134:	4c 89 fa             	mov    %r15,%rdx
   1a137:	4c 89 e1             	mov    %r12,%rcx
   1a13a:	49 89 e8             	mov    %rbp,%r8
   1a13d:	e8 be 1d 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   1a142:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a146:	0f 84 c3 00 00 00    	je     1a20f <hyperinterval::float::F64Enclosure::corner_image+0x12f>
   1a14c:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a151:	e9 b1 00 00 00       	jmp    1a207 <hyperinterval::float::F64Enclosure::corner_image+0x127>
   1a156:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1a15d:	e9 84 03 00 00       	jmp    1a4e6 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   1a162:	4c 89 e1             	mov    %r12,%rcx
   1a165:	48 c1 e9 34          	shr    $0x34,%rcx
   1a169:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1a16f:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1a176:	ff 0f 00 
   1a179:	4c 89 e7             	mov    %r12,%rdi
   1a17c:	48 21 d7             	and    %rdx,%rdi
   1a17f:	48 8d 42 01          	lea    0x1(%rdx),%rax
   1a183:	44 8d 81 9a f7 ff ff 	lea    -0x866(%rcx),%r8d
   1a18a:	48 85 c9             	test   %rcx,%rcx
   1a18d:	48 0f 45 c8          	cmovne %rax,%rcx
   1a191:	be 9b f7 ff ff       	mov    $0xfffff79b,%esi
   1a196:	41 0f 45 f0          	cmovne %r8d,%esi
   1a19a:	48 09 f9             	or     %rdi,%rcx
   1a19d:	48 89 ef             	mov    %rbp,%rdi
   1a1a0:	48 c1 ef 34          	shr    $0x34,%rdi
   1a1a4:	81 e7 ff 07 00 00    	and    $0x7ff,%edi
   1a1aa:	48 21 ea             	and    %rbp,%rdx
   1a1ad:	48 85 ff             	test   %rdi,%rdi
   1a1b0:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1a1b6:	44 0f 45 c7          	cmovne %edi,%r8d
   1a1ba:	48 0f 44 c7          	cmove  %rdi,%rax
   1a1be:	48 09 d0             	or     %rdx,%rax
   1a1c1:	48 89 ef             	mov    %rbp,%rdi
   1a1c4:	4c 31 e7             	xor    %r12,%rdi
   1a1c7:	48 f7 e1             	mul    %rcx
   1a1ca:	41 01 f0             	add    %esi,%r8d
   1a1cd:	48 c1 ef 3f          	shr    $0x3f,%rdi
   1a1d1:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1a1d6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1a1db:	48 89 04 24          	mov    %rax,(%rsp)
   1a1df:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   1a1e4:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a1e9:	48 89 e1             	mov    %rsp,%rcx
   1a1ec:	4c 89 f6             	mov    %r14,%rsi
   1a1ef:	4c 89 fa             	mov    %r15,%rdx
   1a1f2:	e8 a9 2c 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1a1f7:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a1fc:	0f 84 99 02 00 00    	je     1a49b <hyperinterval::float::F64Enclosure::corner_image+0x3bb>
   1a202:	0f b6 44 24 41       	movzbl 0x41(%rsp),%eax
   1a207:	88 43 08             	mov    %al,0x8(%rbx)
   1a20a:	e9 d0 02 00 00       	jmp    1a4df <hyperinterval::float::F64Enclosure::corner_image+0x3ff>
   1a20f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a214:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1a219:	48 89 e7             	mov    %rsp,%rdi
   1a21c:	4c 89 f6             	mov    %r14,%rsi
   1a21f:	4c 89 fa             	mov    %r15,%rdx
   1a222:	e8 39 2c 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a227:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a22b:	0f 85 a4 02 00 00    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a231:	4c 89 fa             	mov    %r15,%rdx
   1a234:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1a239:	48 89 e7             	mov    %rsp,%rdi
   1a23c:	4c 89 f6             	mov    %r14,%rsi
   1a23f:	4c 89 e9             	mov    %r13,%rcx
   1a242:	e8 19 2c 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a247:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a24b:	0f 85 84 02 00 00    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a251:	4c 89 f8             	mov    %r15,%rax
   1a254:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a25b:	00 00 80 
   1a25e:	4c 09 f0             	or     %r14,%rax
   1a261:	49 8d 76 ff          	lea    -0x1(%r14),%rsi
   1a265:	4c 89 f9             	mov    %r15,%rcx
   1a268:	48 21 f1             	and    %rsi,%rcx
   1a26b:	4c 89 f2             	mov    %r14,%rdx
   1a26e:	48 29 ca             	sub    %rcx,%rdx
   1a271:	4d 85 ff             	test   %r15,%r15
   1a274:	48 0f 49 d0          	cmovns %rax,%rdx
   1a278:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1a27d:	48 89 f8             	mov    %rdi,%rax
   1a280:	4c 09 f0             	or     %r14,%rax
   1a283:	48 89 f9             	mov    %rdi,%rcx
   1a286:	48 21 f1             	and    %rsi,%rcx
   1a289:	4c 89 f6             	mov    %r14,%rsi
   1a28c:	48 29 ce             	sub    %rcx,%rsi
   1a28f:	48 85 ff             	test   %rdi,%rdi
   1a292:	48 0f 49 f0          	cmovns %rax,%rsi
   1a296:	41 b5 01             	mov    $0x1,%r13b
   1a299:	48 39 f2             	cmp    %rsi,%rdx
   1a29c:	0f 87 39 02 00 00    	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a2a2:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
   1a2a7:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
   1a2ac:	48 89 e7             	mov    %rsp,%rdi
   1a2af:	4c 89 f6             	mov    %r14,%rsi
   1a2b2:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a2b9:	00 f0 7f 
   1a2bc:	4c 89 fa             	mov    %r15,%rdx
   1a2bf:	4c 89 e1             	mov    %r12,%rcx
   1a2c2:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a2c7:	e8 34 1c 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   1a2cc:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a2d0:	0f 85 76 fe ff ff    	jne    1a14c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1a2d6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a2db:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a2e0:	48 89 e7             	mov    %rsp,%rdi
   1a2e3:	4c 89 f6             	mov    %r14,%rsi
   1a2e6:	4c 89 fa             	mov    %r15,%rdx
   1a2e9:	e8 72 2b 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a2ee:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a2f2:	0f 85 dd 01 00 00    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a2f8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a2fd:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1a302:	48 89 e7             	mov    %rsp,%rdi
   1a305:	4c 89 f6             	mov    %r14,%rsi
   1a308:	4c 89 fa             	mov    %r15,%rdx
   1a30b:	4c 89 e1             	mov    %r12,%rcx
   1a30e:	e8 4d 2b 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a313:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a317:	0f 85 b8 01 00 00    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a31d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a322:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1a327:	48 89 d0             	mov    %rdx,%rax
   1a32a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a331:	00 00 80 
   1a334:	4c 09 f0             	or     %r14,%rax
   1a337:	49 89 d0             	mov    %rdx,%r8
   1a33a:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a33e:	49 21 f8             	and    %rdi,%r8
   1a341:	4c 89 f6             	mov    %r14,%rsi
   1a344:	4c 29 c6             	sub    %r8,%rsi
   1a347:	48 85 d2             	test   %rdx,%rdx
   1a34a:	48 0f 49 f0          	cmovns %rax,%rsi
   1a34e:	48 89 c8             	mov    %rcx,%rax
   1a351:	4c 09 f0             	or     %r14,%rax
   1a354:	49 89 c8             	mov    %rcx,%r8
   1a357:	49 21 f8             	and    %rdi,%r8
   1a35a:	4c 89 f7             	mov    %r14,%rdi
   1a35d:	4c 29 c7             	sub    %r8,%rdi
   1a360:	48 85 c9             	test   %rcx,%rcx
   1a363:	48 0f 49 f8          	cmovns %rax,%rdi
   1a367:	48 39 fe             	cmp    %rdi,%rsi
   1a36a:	0f 87 6b 01 00 00    	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a370:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1a375:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1a37a:	e8 51 33 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a37f:	49 89 c4             	mov    %rax,%r12
   1a382:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a387:	48 89 e7             	mov    %rsp,%rdi
   1a38a:	4c 89 f6             	mov    %r14,%rsi
   1a38d:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a394:	00 f0 7f 
   1a397:	4c 89 fa             	mov    %r15,%rdx
   1a39a:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a39f:	49 89 e8             	mov    %rbp,%r8
   1a3a2:	e8 59 1b 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   1a3a7:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a3ab:	0f 85 9b fd ff ff    	jne    1a14c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1a3b1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a3b6:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a3bb:	48 89 e7             	mov    %rsp,%rdi
   1a3be:	4c 89 f6             	mov    %r14,%rsi
   1a3c1:	4c 89 fa             	mov    %r15,%rdx
   1a3c4:	e8 97 2a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a3c9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a3cd:	0f 85 02 01 00 00    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a3d3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a3d8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a3dd:	48 89 e7             	mov    %rsp,%rdi
   1a3e0:	4c 89 f6             	mov    %r14,%rsi
   1a3e3:	4c 89 fa             	mov    %r15,%rdx
   1a3e6:	48 89 e9             	mov    %rbp,%rcx
   1a3e9:	e8 72 2a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a3ee:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a3f2:	0f 85 dd 00 00 00    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a3f8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a3fd:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1a402:	48 89 d0             	mov    %rdx,%rax
   1a405:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a40c:	00 00 80 
   1a40f:	4c 09 f0             	or     %r14,%rax
   1a412:	49 89 d0             	mov    %rdx,%r8
   1a415:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a419:	49 21 f8             	and    %rdi,%r8
   1a41c:	4c 89 f6             	mov    %r14,%rsi
   1a41f:	4c 29 c6             	sub    %r8,%rsi
   1a422:	48 85 d2             	test   %rdx,%rdx
   1a425:	48 0f 49 f0          	cmovns %rax,%rsi
   1a429:	48 89 c8             	mov    %rcx,%rax
   1a42c:	4c 09 f0             	or     %r14,%rax
   1a42f:	49 89 c8             	mov    %rcx,%r8
   1a432:	49 21 f8             	and    %rdi,%r8
   1a435:	4c 89 f7             	mov    %r14,%rdi
   1a438:	4c 29 c7             	sub    %r8,%rdi
   1a43b:	48 85 c9             	test   %rcx,%rcx
   1a43e:	48 0f 49 f8          	cmovns %rax,%rdi
   1a442:	48 39 fe             	cmp    %rdi,%rsi
   1a445:	0f 87 90 00 00 00    	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a44b:	4c 89 e7             	mov    %r12,%rdi
   1a44e:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1a453:	e8 78 32 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a458:	49 89 c4             	mov    %rax,%r12
   1a45b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a460:	48 89 e7             	mov    %rsp,%rdi
   1a463:	4c 89 f6             	mov    %r14,%rsi
   1a466:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a46d:	00 f0 7f 
   1a470:	4c 89 fa             	mov    %r15,%rdx
   1a473:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a478:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a47d:	e8 7e 1a 00 00       	call   1bf00 <hyperinterval::ieee::Format::div>
   1a482:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a486:	0f 85 c0 fc ff ff    	jne    1a14c <hyperinterval::float::F64Enclosure::corner_image+0x6c>
   1a48c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a491:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a496:	e9 ae 02 00 00       	jmp    1a749 <hyperinterval::float::F64Enclosure::corner_image+0x669>
   1a49b:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a4a0:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
   1a4a5:	48 89 e7             	mov    %rsp,%rdi
   1a4a8:	4c 89 f6             	mov    %r14,%rsi
   1a4ab:	4c 89 fa             	mov    %r15,%rdx
   1a4ae:	e8 ad 29 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a4b3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a4b7:	74 1c                	je     1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a4b9:	4c 89 f6             	mov    %r14,%rsi
   1a4bc:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1a4c1:	48 89 e7             	mov    %rsp,%rdi
   1a4c4:	4c 89 fa             	mov    %r15,%rdx
   1a4c7:	4c 89 e9             	mov    %r13,%rcx
   1a4ca:	e8 91 29 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a4cf:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a4d3:	75 20                	jne    1a4f5 <hyperinterval::float::F64Enclosure::corner_image+0x415>
   1a4d5:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1a4db:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1a4df:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1a4e6:	48 83 c4 68          	add    $0x68,%rsp
   1a4ea:	5b                   	pop    %rbx
   1a4eb:	41 5c                	pop    %r12
   1a4ed:	41 5d                	pop    %r13
   1a4ef:	41 5e                	pop    %r14
   1a4f1:	41 5f                	pop    %r15
   1a4f3:	5d                   	pop    %rbp
   1a4f4:	c3                   	ret
   1a4f5:	4c 89 f0             	mov    %r14,%rax
   1a4f8:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1a4ff:	00 00 80 
   1a502:	48 09 f8             	or     %rdi,%rax
   1a505:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
   1a509:	4c 89 f1             	mov    %r14,%rcx
   1a50c:	48 21 f1             	and    %rsi,%rcx
   1a50f:	48 89 fa             	mov    %rdi,%rdx
   1a512:	48 29 ca             	sub    %rcx,%rdx
   1a515:	4d 85 f6             	test   %r14,%r14
   1a518:	48 0f 49 d0          	cmovns %rax,%rdx
   1a51c:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1a521:	4c 89 c0             	mov    %r8,%rax
   1a524:	48 09 f8             	or     %rdi,%rax
   1a527:	4c 89 c1             	mov    %r8,%rcx
   1a52a:	48 21 f1             	and    %rsi,%rcx
   1a52d:	48 89 fe             	mov    %rdi,%rsi
   1a530:	48 29 ce             	sub    %rcx,%rsi
   1a533:	4d 85 c0             	test   %r8,%r8
   1a536:	48 0f 49 f0          	cmovns %rax,%rsi
   1a53a:	41 b5 01             	mov    $0x1,%r13b
   1a53d:	48 39 f2             	cmp    %rsi,%rdx
   1a540:	77 99                	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a542:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
   1a547:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
   1a54c:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a551:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a558:	00 00 80 
   1a55b:	4c 89 f6             	mov    %r14,%rsi
   1a55e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a565:	00 f0 7f 
   1a568:	4c 89 fa             	mov    %r15,%rdx
   1a56b:	4c 89 e1             	mov    %r12,%rcx
   1a56e:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a573:	e8 c8 1d 00 00       	call   1c340 <hyperinterval::ieee::Format::mul>
   1a578:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a57d:	0f 85 7f fc ff ff    	jne    1a202 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1a583:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a588:	4c 8b 64 24 50       	mov    0x50(%rsp),%r12
   1a58d:	48 89 e7             	mov    %rsp,%rdi
   1a590:	4c 89 f6             	mov    %r14,%rsi
   1a593:	4c 89 fa             	mov    %r15,%rdx
   1a596:	e8 c5 28 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a59b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a59f:	0f 85 30 ff ff ff    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a5a5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a5aa:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1a5af:	48 89 e7             	mov    %rsp,%rdi
   1a5b2:	4c 89 f6             	mov    %r14,%rsi
   1a5b5:	4c 89 fa             	mov    %r15,%rdx
   1a5b8:	4c 89 e1             	mov    %r12,%rcx
   1a5bb:	e8 a0 28 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a5c0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a5c4:	0f 85 0b ff ff ff    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a5ca:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a5cf:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
   1a5d4:	48 89 d0             	mov    %rdx,%rax
   1a5d7:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a5de:	00 00 80 
   1a5e1:	4c 09 f0             	or     %r14,%rax
   1a5e4:	49 89 d0             	mov    %rdx,%r8
   1a5e7:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a5eb:	49 21 f8             	and    %rdi,%r8
   1a5ee:	4c 89 f6             	mov    %r14,%rsi
   1a5f1:	4c 29 c6             	sub    %r8,%rsi
   1a5f4:	48 85 d2             	test   %rdx,%rdx
   1a5f7:	48 0f 49 f0          	cmovns %rax,%rsi
   1a5fb:	48 89 c8             	mov    %rcx,%rax
   1a5fe:	4c 09 f0             	or     %r14,%rax
   1a601:	49 89 c8             	mov    %rcx,%r8
   1a604:	49 21 f8             	and    %rdi,%r8
   1a607:	4c 89 f7             	mov    %r14,%rdi
   1a60a:	4c 29 c7             	sub    %r8,%rdi
   1a60d:	48 85 c9             	test   %rcx,%rcx
   1a610:	48 0f 49 f8          	cmovns %rax,%rdi
   1a614:	48 39 fe             	cmp    %rdi,%rsi
   1a617:	0f 87 be fe ff ff    	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a61d:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1a622:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1a627:	e8 a4 30 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a62c:	49 89 c4             	mov    %rax,%r12
   1a62f:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a634:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a639:	4c 89 f6             	mov    %r14,%rsi
   1a63c:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a643:	00 f0 7f 
   1a646:	4c 89 fa             	mov    %r15,%rdx
   1a649:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a64e:	49 89 e8             	mov    %rbp,%r8
   1a651:	e8 ea 1c 00 00       	call   1c340 <hyperinterval::ieee::Format::mul>
   1a656:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a65b:	0f 85 a1 fb ff ff    	jne    1a202 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1a661:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a666:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1a66b:	48 89 e7             	mov    %rsp,%rdi
   1a66e:	4c 89 f6             	mov    %r14,%rsi
   1a671:	4c 89 fa             	mov    %r15,%rdx
   1a674:	e8 e7 27 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a679:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a67d:	0f 85 52 fe ff ff    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a683:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a688:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   1a68d:	48 89 e7             	mov    %rsp,%rdi
   1a690:	4c 89 f6             	mov    %r14,%rsi
   1a693:	4c 89 fa             	mov    %r15,%rdx
   1a696:	48 89 e9             	mov    %rbp,%rcx
   1a699:	e8 c2 27 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a69e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a6a2:	0f 85 2d fe ff ff    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a6a8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a6ad:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1a6b2:	48 89 d0             	mov    %rdx,%rax
   1a6b5:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1a6bc:	00 00 80 
   1a6bf:	4c 09 f0             	or     %r14,%rax
   1a6c2:	49 89 d0             	mov    %rdx,%r8
   1a6c5:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1a6c9:	49 21 f8             	and    %rdi,%r8
   1a6cc:	4c 89 f6             	mov    %r14,%rsi
   1a6cf:	4c 29 c6             	sub    %r8,%rsi
   1a6d2:	48 85 d2             	test   %rdx,%rdx
   1a6d5:	48 0f 49 f0          	cmovns %rax,%rsi
   1a6d9:	48 89 c8             	mov    %rcx,%rax
   1a6dc:	4c 09 f0             	or     %r14,%rax
   1a6df:	49 89 c8             	mov    %rcx,%r8
   1a6e2:	49 21 f8             	and    %rdi,%r8
   1a6e5:	4c 89 f7             	mov    %r14,%rdi
   1a6e8:	4c 29 c7             	sub    %r8,%rdi
   1a6eb:	48 85 c9             	test   %rcx,%rcx
   1a6ee:	48 0f 49 f8          	cmovns %rax,%rdi
   1a6f2:	48 39 fe             	cmp    %rdi,%rsi
   1a6f5:	0f 87 e0 fd ff ff    	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a6fb:	4c 89 e7             	mov    %r12,%rdi
   1a6fe:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1a703:	e8 c8 2f 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a708:	49 89 c4             	mov    %rax,%r12
   1a70b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a710:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   1a715:	4c 89 f6             	mov    %r14,%rsi
   1a718:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1a71f:	00 f0 7f 
   1a722:	4c 89 fa             	mov    %r15,%rdx
   1a725:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a72a:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1a72f:	e8 0c 1c 00 00       	call   1c340 <hyperinterval::ieee::Format::mul>
   1a734:	80 7c 24 40 00       	cmpb   $0x0,0x40(%rsp)
   1a739:	0f 85 c3 fa ff ff    	jne    1a202 <hyperinterval::float::F64Enclosure::corner_image+0x122>
   1a73f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1a744:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
   1a749:	48 89 e7             	mov    %rsp,%rdi
   1a74c:	4c 89 f6             	mov    %r14,%rsi
   1a74f:	4c 89 fa             	mov    %r15,%rdx
   1a752:	e8 09 27 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a757:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a75b:	0f 85 74 fd ff ff    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a761:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a766:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a76b:	48 89 e7             	mov    %rsp,%rdi
   1a76e:	4c 89 f6             	mov    %r14,%rsi
   1a771:	4c 89 fa             	mov    %r15,%rdx
   1a774:	48 89 e9             	mov    %rbp,%rcx
   1a777:	e8 e4 26 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a77c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1a780:	0f 85 4f fd ff ff    	jne    1a4d5 <hyperinterval::float::F64Enclosure::corner_image+0x3f5>
   1a786:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a78b:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
   1a790:	4c 89 c8             	mov    %r9,%rax
   1a793:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1a79a:	00 00 80 
   1a79d:	4c 09 c0             	or     %r8,%rax
   1a7a0:	4c 89 ca             	mov    %r9,%rdx
   1a7a3:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   1a7a7:	48 21 fa             	and    %rdi,%rdx
   1a7aa:	4c 89 c6             	mov    %r8,%rsi
   1a7ad:	48 29 d6             	sub    %rdx,%rsi
   1a7b0:	4d 85 c9             	test   %r9,%r9
   1a7b3:	48 0f 49 f0          	cmovns %rax,%rsi
   1a7b7:	48 89 c8             	mov    %rcx,%rax
   1a7ba:	4c 09 c0             	or     %r8,%rax
   1a7bd:	48 21 cf             	and    %rcx,%rdi
   1a7c0:	49 29 f8             	sub    %rdi,%r8
   1a7c3:	48 85 c9             	test   %rcx,%rcx
   1a7c6:	4c 0f 49 c0          	cmovns %rax,%r8
   1a7ca:	4c 39 c6             	cmp    %r8,%rsi
   1a7cd:	0f 87 08 fd ff ff    	ja     1a4db <hyperinterval::float::F64Enclosure::corner_image+0x3fb>
   1a7d3:	4c 89 e7             	mov    %r12,%rdi
   1a7d6:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   1a7db:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
   1a7e0:	e8 eb 2e 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1a7e5:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1a7ec:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1a7f0:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   1a7f4:	e9 ed fc ff ff       	jmp    1a4e6 <hyperinterval::float::F64Enclosure::corner_image+0x406>
   1a7f9:	cc                   	int3
   1a7fa:	cc                   	int3
   1a7fb:	cc                   	int3
   1a7fc:	cc                   	int3
   1a7fd:	cc                   	int3
   1a7fe:	cc                   	int3
   1a7ff:	cc                   	int3

hyperinterval::float::F64Enclosure::intersection:
   1a800:	48 89 f8             	mov    %rdi,%rax
   1a803:	45 31 c9             	xor    %r9d,%r9d
   1a806:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1a80a:	0f 85 e1 00 00 00    	jne    1a8f1 <hyperinterval::float::F64Enclosure::intersection+0xf1>
   1a810:	f6 02 01             	testb  $0x1,(%rdx)
   1a813:	0f 84 cc 00 00 00    	je     1a8e5 <hyperinterval::float::F64Enclosure::intersection+0xe5>
   1a819:	41 56                	push   %r14
   1a81b:	53                   	push   %rbx
   1a81c:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1a820:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1a824:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1a82b:	00 00 80 
   1a82e:	49 89 ca             	mov    %rcx,%r10
   1a831:	49 09 fa             	or     %rdi,%r10
   1a834:	4c 8d 4f ff          	lea    -0x1(%rdi),%r9
   1a838:	49 89 cb             	mov    %rcx,%r11
   1a83b:	4d 21 cb             	and    %r9,%r11
   1a83e:	48 89 fb             	mov    %rdi,%rbx
   1a841:	4c 29 db             	sub    %r11,%rbx
   1a844:	48 85 c9             	test   %rcx,%rcx
   1a847:	49 0f 49 da          	cmovns %r10,%rbx
   1a84b:	4d 89 c2             	mov    %r8,%r10
   1a84e:	49 09 fa             	or     %rdi,%r10
   1a851:	4d 89 c3             	mov    %r8,%r11
   1a854:	4d 21 cb             	and    %r9,%r11
   1a857:	49 89 fe             	mov    %rdi,%r14
   1a85a:	4d 29 de             	sub    %r11,%r14
   1a85d:	4d 85 c0             	test   %r8,%r8
   1a860:	4d 0f 49 f2          	cmovns %r10,%r14
   1a864:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1a868:	4c 39 f3             	cmp    %r14,%rbx
   1a86b:	49 0f 42 c8          	cmovb  %r8,%rcx
   1a86f:	4c 8b 46 10          	mov    0x10(%rsi),%r8
   1a873:	4c 89 c6             	mov    %r8,%rsi
   1a876:	48 09 fe             	or     %rdi,%rsi
   1a879:	4d 89 c2             	mov    %r8,%r10
   1a87c:	4d 21 ca             	and    %r9,%r10
   1a87f:	49 89 fb             	mov    %rdi,%r11
   1a882:	4d 29 d3             	sub    %r10,%r11
   1a885:	4d 85 c0             	test   %r8,%r8
   1a888:	4c 0f 49 de          	cmovns %rsi,%r11
   1a88c:	48 89 d6             	mov    %rdx,%rsi
   1a88f:	48 09 fe             	or     %rdi,%rsi
   1a892:	49 89 d2             	mov    %rdx,%r10
   1a895:	4d 21 ca             	and    %r9,%r10
   1a898:	48 89 fb             	mov    %rdi,%rbx
   1a89b:	4c 29 d3             	sub    %r10,%rbx
   1a89e:	48 85 d2             	test   %rdx,%rdx
   1a8a1:	48 0f 49 de          	cmovns %rsi,%rbx
   1a8a5:	49 39 db             	cmp    %rbx,%r11
   1a8a8:	4c 0f 47 c2          	cmova  %rdx,%r8
   1a8ac:	48 89 ca             	mov    %rcx,%rdx
   1a8af:	48 09 fa             	or     %rdi,%rdx
   1a8b2:	48 89 ce             	mov    %rcx,%rsi
   1a8b5:	4c 21 ce             	and    %r9,%rsi
   1a8b8:	49 89 fa             	mov    %rdi,%r10
   1a8bb:	49 29 f2             	sub    %rsi,%r10
   1a8be:	48 85 c9             	test   %rcx,%rcx
   1a8c1:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a8c5:	4c 89 c2             	mov    %r8,%rdx
   1a8c8:	48 09 fa             	or     %rdi,%rdx
   1a8cb:	4d 21 c1             	and    %r8,%r9
   1a8ce:	4c 29 cf             	sub    %r9,%rdi
   1a8d1:	4d 85 c0             	test   %r8,%r8
   1a8d4:	48 0f 49 fa          	cmovns %rdx,%rdi
   1a8d8:	45 31 c9             	xor    %r9d,%r9d
   1a8db:	49 39 fa             	cmp    %rdi,%r10
   1a8de:	41 0f 96 c1          	setbe  %r9b
   1a8e2:	5b                   	pop    %rbx
   1a8e3:	41 5e                	pop    %r14
   1a8e5:	4c 89 08             	mov    %r9,(%rax)
   1a8e8:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1a8ec:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1a8f0:	c3                   	ret
   1a8f1:	4c 89 08             	mov    %r9,(%rax)
   1a8f4:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1a8f8:	4c 89 40 10          	mov    %r8,0x10(%rax)
   1a8fc:	c3                   	ret
   1a8fd:	cc                   	int3
   1a8fe:	cc                   	int3
   1a8ff:	cc                   	int3

hyperinterval::float::F64Enclosure::contains_point:
   1a900:	41 56                	push   %r14
   1a902:	53                   	push   %rbx
   1a903:	48 83 ec 18          	sub    $0x18,%rsp
   1a907:	49 89 fe             	mov    %rdi,%r14
   1a90a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1a911:	00 00 80 
   1a914:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1a919:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a91e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1a925:	00 f0 7f 
   1a928:	48 89 de             	mov    %rbx,%rsi
   1a92b:	e8 30 25 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1a930:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a935:	3c 01                	cmp    $0x1,%al
   1a937:	75 0d                	jne    1a946 <hyperinterval::float::F64Enclosure::contains_point+0x46>
   1a939:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1a93e:	48 83 c4 18          	add    $0x18,%rsp
   1a942:	5b                   	pop    %rbx
   1a943:	41 5e                	pop    %r14
   1a945:	c3                   	ret
   1a946:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1a94a:	75 44                	jne    1a990 <hyperinterval::float::F64Enclosure::contains_point+0x90>
   1a94c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1a951:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1a955:	48 89 d7             	mov    %rdx,%rdi
   1a958:	48 09 df             	or     %rbx,%rdi
   1a95b:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1a95f:	49 89 d0             	mov    %rdx,%r8
   1a962:	49 21 c8             	and    %rcx,%r8
   1a965:	49 89 d9             	mov    %rbx,%r9
   1a968:	4d 29 c1             	sub    %r8,%r9
   1a96b:	48 85 d2             	test   %rdx,%rdx
   1a96e:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a972:	48 89 f7             	mov    %rsi,%rdi
   1a975:	48 09 df             	or     %rbx,%rdi
   1a978:	49 89 f0             	mov    %rsi,%r8
   1a97b:	49 21 c8             	and    %rcx,%r8
   1a97e:	48 89 da             	mov    %rbx,%rdx
   1a981:	4c 29 c2             	sub    %r8,%rdx
   1a984:	48 85 f6             	test   %rsi,%rsi
   1a987:	48 0f 49 d7          	cmovns %rdi,%rdx
   1a98b:	49 39 d1             	cmp    %rdx,%r9
   1a98e:	76 0a                	jbe    1a99a <hyperinterval::float::F64Enclosure::contains_point+0x9a>
   1a990:	31 d2                	xor    %edx,%edx
   1a992:	48 83 c4 18          	add    $0x18,%rsp
   1a996:	5b                   	pop    %rbx
   1a997:	41 5e                	pop    %r14
   1a999:	c3                   	ret
   1a99a:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1a99e:	48 89 f7             	mov    %rsi,%rdi
   1a9a1:	48 09 df             	or     %rbx,%rdi
   1a9a4:	48 21 f1             	and    %rsi,%rcx
   1a9a7:	48 29 cb             	sub    %rcx,%rbx
   1a9aa:	48 85 f6             	test   %rsi,%rsi
   1a9ad:	48 0f 49 df          	cmovns %rdi,%rbx
   1a9b1:	48 39 da             	cmp    %rbx,%rdx
   1a9b4:	0f 96 c2             	setbe  %dl
   1a9b7:	48 83 c4 18          	add    $0x18,%rsp
   1a9bb:	5b                   	pop    %rbx
   1a9bc:	41 5e                	pop    %r14
   1a9be:	c3                   	ret
   1a9bf:	cc                   	int3

hyperinterval::float::F64Enclosure::interior_subset_of:
   1a9c0:	b0 01                	mov    $0x1,%al
   1a9c2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1a9c6:	0f 85 93 00 00 00    	jne    1aa5f <hyperinterval::float::F64Enclosure::interior_subset_of+0x9f>
   1a9cc:	f6 06 01             	testb  $0x1,(%rsi)
   1a9cf:	0f 84 88 00 00 00    	je     1aa5d <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   1a9d5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1a9d9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1a9dd:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1a9e4:	00 00 80 
   1a9e7:	4d 89 c1             	mov    %r8,%r9
   1a9ea:	49 09 c1             	or     %rax,%r9
   1a9ed:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1a9f1:	4d 89 c2             	mov    %r8,%r10
   1a9f4:	49 21 ca             	and    %rcx,%r10
   1a9f7:	49 89 c3             	mov    %rax,%r11
   1a9fa:	4d 29 d3             	sub    %r10,%r11
   1a9fd:	4d 85 c0             	test   %r8,%r8
   1aa00:	4d 0f 49 d9          	cmovns %r9,%r11
   1aa04:	49 89 d0             	mov    %rdx,%r8
   1aa07:	49 09 c0             	or     %rax,%r8
   1aa0a:	49 89 d1             	mov    %rdx,%r9
   1aa0d:	49 21 c9             	and    %rcx,%r9
   1aa10:	49 89 c2             	mov    %rax,%r10
   1aa13:	4d 29 ca             	sub    %r9,%r10
   1aa16:	48 85 d2             	test   %rdx,%rdx
   1aa19:	4d 0f 49 d0          	cmovns %r8,%r10
   1aa1d:	4d 39 d3             	cmp    %r10,%r11
   1aa20:	73 3b                	jae    1aa5d <hyperinterval::float::F64Enclosure::interior_subset_of+0x9d>
   1aa22:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1aa26:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1aa2a:	48 89 d7             	mov    %rdx,%rdi
   1aa2d:	48 09 c7             	or     %rax,%rdi
   1aa30:	49 89 d0             	mov    %rdx,%r8
   1aa33:	49 21 c8             	and    %rcx,%r8
   1aa36:	49 89 c1             	mov    %rax,%r9
   1aa39:	4d 29 c1             	sub    %r8,%r9
   1aa3c:	48 85 d2             	test   %rdx,%rdx
   1aa3f:	4c 0f 49 cf          	cmovns %rdi,%r9
   1aa43:	48 89 f2             	mov    %rsi,%rdx
   1aa46:	48 09 c2             	or     %rax,%rdx
   1aa49:	48 21 f1             	and    %rsi,%rcx
   1aa4c:	48 29 c8             	sub    %rcx,%rax
   1aa4f:	48 85 f6             	test   %rsi,%rsi
   1aa52:	48 0f 49 c2          	cmovns %rdx,%rax
   1aa56:	49 39 c1             	cmp    %rax,%r9
   1aa59:	0f 92 c0             	setb   %al
   1aa5c:	c3                   	ret
   1aa5d:	31 c0                	xor    %eax,%eax
   1aa5f:	c3                   	ret

hyperinterval::float::F64Enclosure::add:
   1aa60:	48 89 f8             	mov    %rdi,%rax
   1aa63:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1aa67:	0f 85 cb 00 00 00    	jne    1ab38 <hyperinterval::float::F64Enclosure::add+0xd8>
   1aa6d:	f6 02 01             	testb  $0x1,(%rdx)
   1aa70:	0f 84 c2 00 00 00    	je     1ab38 <hyperinterval::float::F64Enclosure::add+0xd8>
   1aa76:	55                   	push   %rbp
   1aa77:	41 57                	push   %r15
   1aa79:	41 56                	push   %r14
   1aa7b:	41 55                	push   %r13
   1aa7d:	41 54                	push   %r12
   1aa7f:	53                   	push   %rbx
   1aa80:	48 83 ec 18          	sub    $0x18,%rsp
   1aa84:	48 89 c5             	mov    %rax,%rbp
   1aa87:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1aa8b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1aa8f:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1aa93:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1aa9a:	00 00 80 
   1aa9d:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1aaa4:	00 f0 7f 
   1aaa7:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1aaab:	48 89 e7             	mov    %rsp,%rdi
   1aaae:	48 89 de             	mov    %rbx,%rsi
   1aab1:	4c 89 f2             	mov    %r14,%rdx
   1aab4:	e8 97 11 00 00       	call   1bc50 <hyperinterval::ieee::Format::add>
   1aab9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aabd:	74 57                	je     1ab16 <hyperinterval::float::F64Enclosure::add+0xb6>
   1aabf:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1aac4:	48 89 e7             	mov    %rsp,%rdi
   1aac7:	48 89 de             	mov    %rbx,%rsi
   1aaca:	4c 89 f2             	mov    %r14,%rdx
   1aacd:	4c 89 f9             	mov    %r15,%rcx
   1aad0:	4d 89 e0             	mov    %r12,%r8
   1aad3:	e8 78 11 00 00       	call   1bc50 <hyperinterval::ieee::Format::add>
   1aad8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aadc:	74 38                	je     1ab16 <hyperinterval::float::F64Enclosure::add+0xb6>
   1aade:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1aae3:	48 89 e7             	mov    %rsp,%rdi
   1aae6:	48 89 de             	mov    %rbx,%rsi
   1aae9:	4c 89 f2             	mov    %r14,%rdx
   1aaec:	4c 89 e9             	mov    %r13,%rcx
   1aaef:	e8 6c 23 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1aaf4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1aaf8:	74 1c                	je     1ab16 <hyperinterval::float::F64Enclosure::add+0xb6>
   1aafa:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1aaff:	48 89 e7             	mov    %rsp,%rdi
   1ab02:	48 89 de             	mov    %rbx,%rsi
   1ab05:	4c 89 f2             	mov    %r14,%rdx
   1ab08:	4c 89 f9             	mov    %r15,%rcx
   1ab0b:	e8 50 23 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1ab10:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ab14:	75 2a                	jne    1ab40 <hyperinterval::float::F64Enclosure::add+0xe0>
   1ab16:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1ab1b:	48 89 e8             	mov    %rbp,%rax
   1ab1e:	88 4d 08             	mov    %cl,0x8(%rbp)
   1ab21:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1ab28:	00 
   1ab29:	48 83 c4 18          	add    $0x18,%rsp
   1ab2d:	5b                   	pop    %rbx
   1ab2e:	41 5c                	pop    %r12
   1ab30:	41 5d                	pop    %r13
   1ab32:	41 5e                	pop    %r14
   1ab34:	41 5f                	pop    %r15
   1ab36:	5d                   	pop    %rbp
   1ab37:	c3                   	ret
   1ab38:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1ab3f:	c3                   	ret
   1ab40:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ab45:	4c 89 e0             	mov    %r12,%rax
   1ab48:	48 09 d8             	or     %rbx,%rax
   1ab4b:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1ab4f:	4c 89 e6             	mov    %r12,%rsi
   1ab52:	48 21 d6             	and    %rdx,%rsi
   1ab55:	48 89 df             	mov    %rbx,%rdi
   1ab58:	48 29 f7             	sub    %rsi,%rdi
   1ab5b:	4d 85 e4             	test   %r12,%r12
   1ab5e:	48 0f 49 f8          	cmovns %rax,%rdi
   1ab62:	48 89 c8             	mov    %rcx,%rax
   1ab65:	48 09 d8             	or     %rbx,%rax
   1ab68:	48 21 ca             	and    %rcx,%rdx
   1ab6b:	48 29 d3             	sub    %rdx,%rbx
   1ab6e:	48 85 c9             	test   %rcx,%rcx
   1ab71:	48 0f 49 d8          	cmovns %rax,%rbx
   1ab75:	48 39 df             	cmp    %rbx,%rdi
   1ab78:	48 89 e8             	mov    %rbp,%rax
   1ab7b:	76 0d                	jbe    1ab8a <hyperinterval::float::F64Enclosure::add+0x12a>
   1ab7d:	c6 40 08 01          	movb   $0x1,0x8(%rax)
   1ab81:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1ab88:	eb 9f                	jmp    1ab29 <hyperinterval::float::F64Enclosure::add+0xc9>
   1ab8a:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1ab91:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1ab95:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ab99:	eb 8e                	jmp    1ab29 <hyperinterval::float::F64Enclosure::add+0xc9>
   1ab9b:	cc                   	int3
   1ab9c:	cc                   	int3
   1ab9d:	cc                   	int3
   1ab9e:	cc                   	int3
   1ab9f:	cc                   	int3

hyperinterval::float::F64Enclosure::div:
   1aba0:	53                   	push   %rbx
   1aba1:	48 89 fb             	mov    %rdi,%rbx
   1aba4:	83 3a 01             	cmpl   $0x1,(%rdx)
   1aba7:	75 1e                	jne    1abc7 <hyperinterval::float::F64Enclosure::div+0x27>
   1aba9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1abae:	7f 17                	jg     1abc7 <hyperinterval::float::F64Enclosure::div+0x27>
   1abb0:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1abb4:	48 85 c0             	test   %rax,%rax
   1abb7:	0f 99 c1             	setns  %cl
   1abba:	48 d1 e0             	shl    $1,%rax
   1abbd:	48 85 c0             	test   %rax,%rax
   1abc0:	0f 94 c0             	sete   %al
   1abc3:	08 c8                	or     %cl,%al
   1abc5:	75 12                	jne    1abd9 <hyperinterval::float::F64Enclosure::div+0x39>
   1abc7:	48 89 df             	mov    %rbx,%rdi
   1abca:	b9 01 00 00 00       	mov    $0x1,%ecx
   1abcf:	e8 0c f5 ff ff       	call   1a0e0 <hyperinterval::float::F64Enclosure::corner_image>
   1abd4:	48 89 d8             	mov    %rbx,%rax
   1abd7:	5b                   	pop    %rbx
   1abd8:	c3                   	ret
   1abd9:	c6 43 08 06          	movb   $0x6,0x8(%rbx)
   1abdd:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1abe4:	48 89 d8             	mov    %rbx,%rax
   1abe7:	5b                   	pop    %rbx
   1abe8:	c3                   	ret
   1abe9:	cc                   	int3
   1abea:	cc                   	int3
   1abeb:	cc                   	int3
   1abec:	cc                   	int3
   1abed:	cc                   	int3
   1abee:	cc                   	int3
   1abef:	cc                   	int3

hyperinterval::float::F64Enclosure::new:
   1abf0:	41 57                	push   %r15
   1abf2:	41 56                	push   %r14
   1abf4:	41 54                	push   %r12
   1abf6:	53                   	push   %rbx
   1abf7:	48 83 ec 18          	sub    $0x18,%rsp
   1abfb:	f2 0f 11 4c 24 10    	movsd  %xmm1,0x10(%rsp)
   1ac01:	48 89 fb             	mov    %rdi,%rbx
   1ac04:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1ac0b:	00 00 80 
   1ac0e:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1ac15:	00 f0 7f 
   1ac18:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ac1d:	48 89 e7             	mov    %rsp,%rdi
   1ac20:	4c 89 f6             	mov    %r14,%rsi
   1ac23:	4c 89 fa             	mov    %r15,%rdx
   1ac26:	e8 35 22 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1ac2b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ac2f:	74 24                	je     1ac55 <hyperinterval::float::F64Enclosure::new+0x65>
   1ac31:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1ac36:	f3 0f 7e 44 24 10    	movq   0x10(%rsp),%xmm0
   1ac3c:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1ac41:	48 89 e7             	mov    %rsp,%rdi
   1ac44:	4c 89 f6             	mov    %r14,%rsi
   1ac47:	4c 89 fa             	mov    %r15,%rdx
   1ac4a:	e8 11 22 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1ac4f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ac53:	75 1e                	jne    1ac73 <hyperinterval::float::F64Enclosure::new+0x83>
   1ac55:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ac5a:	88 43 08             	mov    %al,0x8(%rbx)
   1ac5d:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ac64:	48 89 d8             	mov    %rbx,%rax
   1ac67:	48 83 c4 18          	add    $0x18,%rsp
   1ac6b:	5b                   	pop    %rbx
   1ac6c:	41 5c                	pop    %r12
   1ac6e:	41 5e                	pop    %r14
   1ac70:	41 5f                	pop    %r15
   1ac72:	c3                   	ret
   1ac73:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1ac78:	4c 89 e1             	mov    %r12,%rcx
   1ac7b:	4c 09 f1             	or     %r14,%rcx
   1ac7e:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1ac82:	4c 89 e6             	mov    %r12,%rsi
   1ac85:	48 21 d6             	and    %rdx,%rsi
   1ac88:	4c 89 f7             	mov    %r14,%rdi
   1ac8b:	48 29 f7             	sub    %rsi,%rdi
   1ac8e:	4d 85 e4             	test   %r12,%r12
   1ac91:	48 0f 49 f9          	cmovns %rcx,%rdi
   1ac95:	48 89 c1             	mov    %rax,%rcx
   1ac98:	4c 09 f1             	or     %r14,%rcx
   1ac9b:	48 21 c2             	and    %rax,%rdx
   1ac9e:	49 29 d6             	sub    %rdx,%r14
   1aca1:	48 85 c0             	test   %rax,%rax
   1aca4:	4c 0f 49 f1          	cmovns %rcx,%r14
   1aca8:	4c 39 f7             	cmp    %r14,%rdi
   1acab:	76 06                	jbe    1acb3 <hyperinterval::float::F64Enclosure::new+0xc3>
   1acad:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1acb1:	eb aa                	jmp    1ac5d <hyperinterval::float::F64Enclosure::new+0x6d>
   1acb3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1acba:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1acbe:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1acc2:	eb a0                	jmp    1ac64 <hyperinterval::float::F64Enclosure::new+0x74>
   1acc4:	cc                   	int3
   1acc5:	cc                   	int3
   1acc6:	cc                   	int3
   1acc7:	cc                   	int3
   1acc8:	cc                   	int3
   1acc9:	cc                   	int3
   1acca:	cc                   	int3
   1accb:	cc                   	int3
   1accc:	cc                   	int3
   1accd:	cc                   	int3
   1acce:	cc                   	int3
   1accf:	cc                   	int3

hyperinterval::float::F64Enclosure::sub:
   1acd0:	53                   	push   %rbx
   1acd1:	48 83 ec 20          	sub    $0x20,%rsp
   1acd5:	48 89 fb             	mov    %rdi,%rbx
   1acd8:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1acdc:	75 30                	jne    1ad0e <hyperinterval::float::F64Enclosure::sub+0x3e>
   1acde:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1ace2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1ace6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1aced:	00 00 80 
   1acf0:	48 89 d1             	mov    %rdx,%rcx
   1acf3:	48 31 c1             	xor    %rax,%rcx
   1acf6:	48 85 d2             	test   %rdx,%rdx
   1acf9:	48 0f 44 ca          	cmove  %rdx,%rcx
   1acfd:	48 31 f8             	xor    %rdi,%rax
   1ad00:	48 85 ff             	test   %rdi,%rdi
   1ad03:	48 0f 44 c7          	cmove  %rdi,%rax
   1ad07:	ba 01 00 00 00       	mov    $0x1,%edx
   1ad0c:	eb 02                	jmp    1ad10 <hyperinterval::float::F64Enclosure::sub+0x40>
   1ad0e:	31 d2                	xor    %edx,%edx
   1ad10:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ad15:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
   1ad1a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1ad1f:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
   1ad24:	48 89 df             	mov    %rbx,%rdi
   1ad27:	ff 15 13 48 04 00    	call   *0x44813(%rip)        # 5f540 <_DYNAMIC+0x300>
   1ad2d:	48 89 d8             	mov    %rbx,%rax
   1ad30:	48 83 c4 20          	add    $0x20,%rsp
   1ad34:	5b                   	pop    %rbx
   1ad35:	c3                   	ret
   1ad36:	cc                   	int3
   1ad37:	cc                   	int3
   1ad38:	cc                   	int3
   1ad39:	cc                   	int3
   1ad3a:	cc                   	int3
   1ad3b:	cc                   	int3
   1ad3c:	cc                   	int3
   1ad3d:	cc                   	int3
   1ad3e:	cc                   	int3
   1ad3f:	cc                   	int3

hyperinterval::float::F64Enclosure::hull:
   1ad40:	48 89 f8             	mov    %rdi,%rax
   1ad43:	4c 8b 02             	mov    (%rdx),%r8
   1ad46:	48 8b 7a 08          	mov    0x8(%rdx),%rdi
   1ad4a:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   1ad4e:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ad52:	0f 85 a7 00 00 00    	jne    1adff <hyperinterval::float::F64Enclosure::hull+0xbf>
   1ad58:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1ad5c:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1ad60:	ba 01 00 00 00       	mov    $0x1,%edx
   1ad65:	49 83 f8 01          	cmp    $0x1,%r8
   1ad69:	0f 85 9f 00 00 00    	jne    1ae0e <hyperinterval::float::F64Enclosure::hull+0xce>
   1ad6f:	41 57                	push   %r15
   1ad71:	41 56                	push   %r14
   1ad73:	53                   	push   %rbx
   1ad74:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1ad7b:	00 00 80 
   1ad7e:	4d 89 d3             	mov    %r10,%r11
   1ad81:	4d 09 c3             	or     %r8,%r11
   1ad84:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1ad88:	4c 89 d3             	mov    %r10,%rbx
   1ad8b:	4c 21 cb             	and    %r9,%rbx
   1ad8e:	4d 89 c6             	mov    %r8,%r14
   1ad91:	49 29 de             	sub    %rbx,%r14
   1ad94:	4d 85 d2             	test   %r10,%r10
   1ad97:	4d 0f 49 f3          	cmovns %r11,%r14
   1ad9b:	49 89 fb             	mov    %rdi,%r11
   1ad9e:	4d 09 c3             	or     %r8,%r11
   1ada1:	48 89 fb             	mov    %rdi,%rbx
   1ada4:	4c 21 cb             	and    %r9,%rbx
   1ada7:	4d 89 c7             	mov    %r8,%r15
   1adaa:	49 29 df             	sub    %rbx,%r15
   1adad:	48 85 ff             	test   %rdi,%rdi
   1adb0:	4d 0f 49 fb          	cmovns %r11,%r15
   1adb4:	4d 39 fe             	cmp    %r15,%r14
   1adb7:	49 0f 46 fa          	cmovbe %r10,%rdi
   1adbb:	49 89 f2             	mov    %rsi,%r10
   1adbe:	4d 09 c2             	or     %r8,%r10
   1adc1:	49 89 f3             	mov    %rsi,%r11
   1adc4:	4d 21 cb             	and    %r9,%r11
   1adc7:	4c 89 c3             	mov    %r8,%rbx
   1adca:	4c 29 db             	sub    %r11,%rbx
   1adcd:	48 85 f6             	test   %rsi,%rsi
   1add0:	49 0f 49 da          	cmovns %r10,%rbx
   1add4:	49 89 ca             	mov    %rcx,%r10
   1add7:	4d 09 c2             	or     %r8,%r10
   1adda:	49 21 c9             	and    %rcx,%r9
   1addd:	4d 29 c8             	sub    %r9,%r8
   1ade0:	48 85 c9             	test   %rcx,%rcx
   1ade3:	4d 0f 49 c2          	cmovns %r10,%r8
   1ade7:	4c 39 c3             	cmp    %r8,%rbx
   1adea:	48 0f 43 ce          	cmovae %rsi,%rcx
   1adee:	5b                   	pop    %rbx
   1adef:	41 5e                	pop    %r14
   1adf1:	41 5f                	pop    %r15
   1adf3:	48 89 10             	mov    %rdx,(%rax)
   1adf6:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1adfa:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1adfe:	c3                   	ret
   1adff:	4c 89 c2             	mov    %r8,%rdx
   1ae02:	48 89 10             	mov    %rdx,(%rax)
   1ae05:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ae09:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ae0d:	c3                   	ret
   1ae0e:	48 89 f1             	mov    %rsi,%rcx
   1ae11:	4c 89 d7             	mov    %r10,%rdi
   1ae14:	48 89 10             	mov    %rdx,(%rax)
   1ae17:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ae1b:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ae1f:	c3                   	ret

hyperinterval::float::F64Enclosure::sqrt:
   1ae20:	48 89 f8             	mov    %rdi,%rax
   1ae23:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ae27:	75 3a                	jne    1ae63 <hyperinterval::float::F64Enclosure::sqrt+0x43>
   1ae29:	55                   	push   %rbp
   1ae2a:	41 57                	push   %r15
   1ae2c:	41 56                	push   %r14
   1ae2e:	41 55                	push   %r13
   1ae30:	41 54                	push   %r12
   1ae32:	53                   	push   %rbx
   1ae33:	48 83 ec 28          	sub    $0x28,%rsp
   1ae37:	4c 8b 76 08          	mov    0x8(%rsi),%r14
   1ae3b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1ae3f:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1ae46:	00 00 80 
   1ae49:	48 8d 6b ff          	lea    -0x1(%rbx),%rbp
   1ae4d:	4d 85 ff             	test   %r15,%r15
   1ae50:	79 1d                	jns    1ae6f <hyperinterval::float::F64Enclosure::sqrt+0x4f>
   1ae52:	4c 89 f9             	mov    %r15,%rcx
   1ae55:	48 21 e9             	and    %rbp,%rcx
   1ae58:	74 15                	je     1ae6f <hyperinterval::float::F64Enclosure::sqrt+0x4f>
   1ae5a:	c6 40 08 07          	movb   $0x7,0x8(%rax)
   1ae5e:	e9 da 00 00 00       	jmp    1af3d <hyperinterval::float::F64Enclosure::sqrt+0x11d>
   1ae63:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
   1ae6a:	c6 40 18 00          	movb   $0x0,0x18(%rax)
   1ae6e:	c3                   	ret
   1ae6f:	48 89 04 24          	mov    %rax,(%rsp)
   1ae73:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1ae7a:	00 f0 7f 
   1ae7d:	4d 85 f6             	test   %r14,%r14
   1ae80:	0f 98 c0             	sets   %al
   1ae83:	49 85 ee             	test   %rbp,%r14
   1ae86:	41 0f 95 c5          	setne  %r13b
   1ae8a:	31 c9                	xor    %ecx,%ecx
   1ae8c:	41 20 c5             	and    %al,%r13b
   1ae8f:	49 0f 44 ce          	cmove  %r14,%rcx
   1ae93:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ae98:	48 89 de             	mov    %rbx,%rsi
   1ae9b:	49 89 d4             	mov    %rdx,%r12
   1ae9e:	e8 6d 15 00 00       	call   1c410 <hyperinterval::ieee::Format::sqrt>
   1aea3:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1aea8:	74 11                	je     1aebb <hyperinterval::float::F64Enclosure::sqrt+0x9b>
   1aeaa:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1aeaf:	48 8b 04 24          	mov    (%rsp),%rax
   1aeb3:	88 48 08             	mov    %cl,0x8(%rax)
   1aeb6:	e9 82 00 00 00       	jmp    1af3d <hyperinterval::float::F64Enclosure::sqrt+0x11d>
   1aebb:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1aec0:	4d 39 fe             	cmp    %r15,%r14
   1aec3:	75 0a                	jne    1aecf <hyperinterval::float::F64Enclosure::sqrt+0xaf>
   1aec5:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1aeca:	4d 89 e6             	mov    %r12,%r14
   1aecd:	eb 2c                	jmp    1aefb <hyperinterval::float::F64Enclosure::sqrt+0xdb>
   1aecf:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   1aed4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aed9:	48 89 de             	mov    %rbx,%rsi
   1aedc:	4d 89 e6             	mov    %r12,%r14
   1aedf:	4c 89 e2             	mov    %r12,%rdx
   1aee2:	4c 89 f9             	mov    %r15,%rcx
   1aee5:	e8 26 15 00 00       	call   1c410 <hyperinterval::ieee::Format::sqrt>
   1aeea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1aeef:	74 b9                	je     1aeaa <hyperinterval::float::F64Enclosure::sqrt+0x8a>
   1aef1:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
   1aef6:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1aefb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1af00:	48 89 de             	mov    %rbx,%rsi
   1af03:	4c 89 f2             	mov    %r14,%rdx
   1af06:	e8 55 1f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1af0b:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1af10:	74 1f                	je     1af31 <hyperinterval::float::F64Enclosure::sqrt+0x111>
   1af12:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1af17:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1af1c:	48 89 de             	mov    %rbx,%rsi
   1af1f:	4c 89 f2             	mov    %r14,%rdx
   1af22:	4c 89 f9             	mov    %r15,%rcx
   1af25:	e8 36 1f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1af2a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1af2f:	75 22                	jne    1af53 <hyperinterval::float::F64Enclosure::sqrt+0x133>
   1af31:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1af36:	48 8b 04 24          	mov    (%rsp),%rax
   1af3a:	88 50 08             	mov    %dl,0x8(%rax)
   1af3d:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1af44:	48 83 c4 28          	add    $0x28,%rsp
   1af48:	5b                   	pop    %rbx
   1af49:	41 5c                	pop    %r12
   1af4b:	41 5d                	pop    %r13
   1af4d:	41 5e                	pop    %r14
   1af4f:	41 5f                	pop    %r15
   1af51:	5d                   	pop    %rbp
   1af52:	c3                   	ret
   1af53:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1af58:	4c 89 e0             	mov    %r12,%rax
   1af5b:	48 09 d8             	or     %rbx,%rax
   1af5e:	4c 89 e2             	mov    %r12,%rdx
   1af61:	48 21 ea             	and    %rbp,%rdx
   1af64:	48 89 de             	mov    %rbx,%rsi
   1af67:	48 29 d6             	sub    %rdx,%rsi
   1af6a:	4d 85 e4             	test   %r12,%r12
   1af6d:	48 0f 49 f0          	cmovns %rax,%rsi
   1af71:	48 89 c8             	mov    %rcx,%rax
   1af74:	48 09 d8             	or     %rbx,%rax
   1af77:	48 21 cd             	and    %rcx,%rbp
   1af7a:	48 29 eb             	sub    %rbp,%rbx
   1af7d:	48 85 c9             	test   %rcx,%rcx
   1af80:	48 0f 49 d8          	cmovns %rax,%rbx
   1af84:	b2 01                	mov    $0x1,%dl
   1af86:	48 39 de             	cmp    %rbx,%rsi
   1af89:	48 8b 04 24          	mov    (%rsp),%rax
   1af8d:	77 ab                	ja     1af3a <hyperinterval::float::F64Enclosure::sqrt+0x11a>
   1af8f:	48 c7 00 01 00 00 00 	movq   $0x1,(%rax)
   1af96:	4c 89 60 08          	mov    %r12,0x8(%rax)
   1af9a:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1af9e:	44 88 68 18          	mov    %r13b,0x18(%rax)
   1afa2:	eb a0                	jmp    1af44 <hyperinterval::float::F64Enclosure::sqrt+0x124>
   1afa4:	cc                   	int3
   1afa5:	cc                   	int3
   1afa6:	cc                   	int3
   1afa7:	cc                   	int3
   1afa8:	cc                   	int3
   1afa9:	cc                   	int3
   1afaa:	cc                   	int3
   1afab:	cc                   	int3
   1afac:	cc                   	int3
   1afad:	cc                   	int3
   1afae:	cc                   	int3
   1afaf:	cc                   	int3

hyperinterval::float::F64Enclosure::point:
   1afb0:	53                   	push   %rbx
   1afb1:	48 83 ec 10          	sub    $0x10,%rsp
   1afb5:	48 89 fb             	mov    %rdi,%rbx
   1afb8:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1afbd:	48 89 e7             	mov    %rsp,%rdi
   1afc0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1afc7:	00 00 80 
   1afca:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1afd1:	00 f0 7f 
   1afd4:	e8 87 1e 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1afd9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1afdd:	75 0f                	jne    1afee <hyperinterval::float::F64Enclosure::point+0x3e>
   1afdf:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1afe4:	88 43 08             	mov    %al,0x8(%rbx)
   1afe7:	b8 02 00 00 00       	mov    $0x2,%eax
   1afec:	eb 12                	jmp    1b000 <hyperinterval::float::F64Enclosure::point+0x50>
   1afee:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1aff3:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1aff7:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1affb:	b8 01 00 00 00       	mov    $0x1,%eax
   1b000:	48 89 03             	mov    %rax,(%rbx)
   1b003:	48 89 d8             	mov    %rbx,%rax
   1b006:	48 83 c4 10          	add    $0x10,%rsp
   1b00a:	5b                   	pop    %rbx
   1b00b:	c3                   	ret
   1b00c:	cc                   	int3
   1b00d:	cc                   	int3
   1b00e:	cc                   	int3
   1b00f:	cc                   	int3

hyperinterval::float::F64Enclosure::signs:
   1b010:	83 3f 01             	cmpl   $0x1,(%rdi)
   1b013:	75 6b                	jne    1b080 <hyperinterval::float::F64Enclosure::signs+0x70>
   1b015:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b01c:	00 00 80 
   1b01f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1b023:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1b027:	48 89 ca             	mov    %rcx,%rdx
   1b02a:	4c 09 c2             	or     %r8,%rdx
   1b02d:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1b031:	49 89 c9             	mov    %rcx,%r9
   1b034:	49 21 f1             	and    %rsi,%r9
   1b037:	4c 89 c7             	mov    %r8,%rdi
   1b03a:	4c 29 cf             	sub    %r9,%rdi
   1b03d:	48 85 c9             	test   %rcx,%rcx
   1b040:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b044:	31 d2                	xor    %edx,%edx
   1b046:	48 85 ff             	test   %rdi,%rdi
   1b049:	0f 99 c1             	setns  %cl
   1b04c:	4c 39 c7             	cmp    %r8,%rdi
   1b04f:	77 1f                	ja     1b070 <hyperinterval::float::F64Enclosure::signs+0x60>
   1b051:	48 85 ff             	test   %rdi,%rdi
   1b054:	40 0f 99 c7          	setns  %dil
   1b058:	40 80 cf 02          	or     $0x2,%dil
   1b05c:	48 85 f0             	test   %rsi,%rax
   1b05f:	88 ca                	mov    %cl,%dl
   1b061:	40 0f b6 cf          	movzbl %dil,%ecx
   1b065:	0f 44 d1             	cmove  %ecx,%edx
   1b068:	48 85 c0             	test   %rax,%rax
   1b06b:	0f 49 d1             	cmovns %ecx,%edx
   1b06e:	89 d1                	mov    %edx,%ecx
   1b070:	8d 51 04             	lea    0x4(%rcx),%edx
   1b073:	48 85 c0             	test   %rax,%rax
   1b076:	0f b6 c9             	movzbl %cl,%ecx
   1b079:	0f b6 c2             	movzbl %dl,%eax
   1b07c:	0f 4e c1             	cmovle %ecx,%eax
   1b07f:	c3                   	ret
   1b080:	31 c0                	xor    %eax,%eax
   1b082:	c3                   	ret
   1b083:	cc                   	int3
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

hyperinterval::float::F64Enclosure::affine:
   1b090:	55                   	push   %rbp
   1b091:	41 57                	push   %r15
   1b093:	41 56                	push   %r14
   1b095:	41 55                	push   %r13
   1b097:	41 54                	push   %r12
   1b099:	53                   	push   %rbx
   1b09a:	48 83 ec 28          	sub    $0x28,%rsp
   1b09e:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   1b0a4:	49 89 f5             	mov    %rsi,%r13
   1b0a7:	48 89 fb             	mov    %rdi,%rbx
   1b0aa:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b0b1:	00 00 80 
   1b0b4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b0bb:	00 f0 7f 
   1b0be:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b0c3:	48 89 e7             	mov    %rsp,%rdi
   1b0c6:	4c 89 f6             	mov    %r14,%rsi
   1b0c9:	4c 89 fa             	mov    %r15,%rdx
   1b0cc:	e8 8f 1d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b0d1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0d5:	74 24                	je     1b0fb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b0d7:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b0dc:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   1b0e2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b0e7:	48 89 e7             	mov    %rsp,%rdi
   1b0ea:	4c 89 f6             	mov    %r14,%rsi
   1b0ed:	4c 89 fa             	mov    %r15,%rdx
   1b0f0:	e8 6b 1d 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b0f5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0f9:	75 21                	jne    1b11c <hyperinterval::float::F64Enclosure::affine+0x8c>
   1b0fb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b100:	88 43 08             	mov    %al,0x8(%rbx)
   1b103:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b10a:	48 89 d8             	mov    %rbx,%rax
   1b10d:	48 83 c4 28          	add    $0x28,%rsp
   1b111:	5b                   	pop    %rbx
   1b112:	41 5c                	pop    %r12
   1b114:	41 5d                	pop    %r13
   1b116:	41 5e                	pop    %r14
   1b118:	41 5f                	pop    %r15
   1b11a:	5d                   	pop    %rbp
   1b11b:	c3                   	ret
   1b11c:	41 f6 45 00 01       	testb  $0x1,0x0(%r13)
   1b121:	0f 84 0a 01 00 00    	je     1b231 <hyperinterval::float::F64Enclosure::affine+0x1a1>
   1b127:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b12c:	49 8b 45 10          	mov    0x10(%r13),%rax
   1b130:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b135:	49 8b 4d 08          	mov    0x8(%r13),%rcx
   1b139:	48 89 e7             	mov    %rsp,%rdi
   1b13c:	4c 89 f6             	mov    %r14,%rsi
   1b13f:	4c 89 fa             	mov    %r15,%rdx
   1b142:	4d 89 e0             	mov    %r12,%r8
   1b145:	49 89 e9             	mov    %rbp,%r9
   1b148:	e8 23 19 00 00       	call   1ca70 <hyperinterval::ieee::Format::affine>
   1b14d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b151:	74 a8                	je     1b0fb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b153:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b158:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1b15d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1b162:	48 89 e7             	mov    %rsp,%rdi
   1b165:	4c 89 f6             	mov    %r14,%rsi
   1b168:	4c 89 fa             	mov    %r15,%rdx
   1b16b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1b170:	4d 89 e0             	mov    %r12,%r8
   1b173:	49 89 e9             	mov    %rbp,%r9
   1b176:	e8 f5 18 00 00       	call   1ca70 <hyperinterval::ieee::Format::affine>
   1b17b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b17f:	0f 84 76 ff ff ff    	je     1b0fb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b185:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b18a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1b18f:	48 89 e7             	mov    %rsp,%rdi
   1b192:	4c 89 f6             	mov    %r14,%rsi
   1b195:	4c 89 fa             	mov    %r15,%rdx
   1b198:	4c 89 e9             	mov    %r13,%rcx
   1b19b:	e8 c0 1c 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b1a0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b1a4:	0f 84 51 ff ff ff    	je     1b0fb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b1aa:	4d 89 e5             	mov    %r12,%r13
   1b1ad:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b1b2:	48 89 e7             	mov    %rsp,%rdi
   1b1b5:	4c 89 f6             	mov    %r14,%rsi
   1b1b8:	4c 89 fa             	mov    %r15,%rdx
   1b1bb:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1b1c0:	e8 9b 1c 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b1c5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b1c9:	0f 84 2c ff ff ff    	je     1b0fb <hyperinterval::float::F64Enclosure::affine+0x6b>
   1b1cf:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b1d4:	4c 89 e0             	mov    %r12,%rax
   1b1d7:	4c 09 f0             	or     %r14,%rax
   1b1da:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b1de:	4c 89 e2             	mov    %r12,%rdx
   1b1e1:	48 21 ca             	and    %rcx,%rdx
   1b1e4:	4c 89 f6             	mov    %r14,%rsi
   1b1e7:	48 29 d6             	sub    %rdx,%rsi
   1b1ea:	4d 85 e4             	test   %r12,%r12
   1b1ed:	48 0f 49 f0          	cmovns %rax,%rsi
   1b1f1:	4c 89 f8             	mov    %r15,%rax
   1b1f4:	4c 09 f0             	or     %r14,%rax
   1b1f7:	4c 21 f9             	and    %r15,%rcx
   1b1fa:	49 29 ce             	sub    %rcx,%r14
   1b1fd:	4d 85 ff             	test   %r15,%r15
   1b200:	4c 0f 49 f0          	cmovns %rax,%r14
   1b204:	b0 01                	mov    $0x1,%al
   1b206:	4c 39 f6             	cmp    %r14,%rsi
   1b209:	0f 87 f1 fe ff ff    	ja     1b100 <hyperinterval::float::F64Enclosure::affine+0x70>
   1b20f:	48 89 e7             	mov    %rsp,%rdi
   1b212:	4c 89 ee             	mov    %r13,%rsi
   1b215:	48 89 ea             	mov    %rbp,%rdx
   1b218:	e8 73 06 00 00       	call   1b890 <hyperinterval::float::F64Enclosure::from_bits>
   1b21d:	48 8b 04 24          	mov    (%rsp),%rax
   1b221:	48 83 f8 02          	cmp    $0x2,%rax
   1b225:	75 16                	jne    1b23d <hyperinterval::float::F64Enclosure::affine+0x1ad>
   1b227:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b22c:	e9 cf fe ff ff       	jmp    1b100 <hyperinterval::float::F64Enclosure::affine+0x70>
   1b231:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b238:	e9 cd fe ff ff       	jmp    1b10a <hyperinterval::float::F64Enclosure::affine+0x7a>
   1b23d:	83 f8 01             	cmp    $0x1,%eax
   1b240:	75 1b                	jne    1b25d <hyperinterval::float::F64Enclosure::affine+0x1cd>
   1b242:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1b247:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b24c:	4c 89 e7             	mov    %r12,%rdi
   1b24f:	4c 89 fe             	mov    %r15,%rsi
   1b252:	e8 79 24 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1b257:	49 89 c4             	mov    %rax,%r12
   1b25a:	49 89 d7             	mov    %rdx,%r15
   1b25d:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b264:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b268:	4c 89 7b 10          	mov    %r15,0x10(%rbx)
   1b26c:	e9 99 fe ff ff       	jmp    1b10a <hyperinterval::float::F64Enclosure::affine+0x7a>
   1b271:	cc                   	int3
   1b272:	cc                   	int3
   1b273:	cc                   	int3
   1b274:	cc                   	int3
   1b275:	cc                   	int3
   1b276:	cc                   	int3
   1b277:	cc                   	int3
   1b278:	cc                   	int3
   1b279:	cc                   	int3
   1b27a:	cc                   	int3
   1b27b:	cc                   	int3
   1b27c:	cc                   	int3
   1b27d:	cc                   	int3
   1b27e:	cc                   	int3
   1b27f:	cc                   	int3

hyperinterval::float::F64Enclosure::square:
   1b280:	55                   	push   %rbp
   1b281:	41 57                	push   %r15
   1b283:	41 56                	push   %r14
   1b285:	41 55                	push   %r13
   1b287:	41 54                	push   %r12
   1b289:	53                   	push   %rbx
   1b28a:	48 83 ec 58          	sub    $0x58,%rsp
   1b28e:	48 89 fb             	mov    %rdi,%rbx
   1b291:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b295:	0f 85 0c 01 00 00    	jne    1b3a7 <hyperinterval::float::F64Enclosure::square+0x127>
   1b29b:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1b29f:	49 bc 00 00 00 00 00 	movabs $0x8000000000000000,%r12
   1b2a6:	00 00 80 
   1b2a9:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1b2b0:	00 f0 7f 
   1b2b3:	49 be ff ff ff ff ff 	movabs $0xfffffffffffff,%r14
   1b2ba:	ff 0f 00 
   1b2bd:	48 8b 56 08          	mov    0x8(%rsi),%rdx
   1b2c1:	48 89 d1             	mov    %rdx,%rcx
   1b2c4:	48 c1 e9 34          	shr    $0x34,%rcx
   1b2c8:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b2ce:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1b2d3:	4c 21 f2             	and    %r14,%rdx
   1b2d6:	49 8d 6e 01          	lea    0x1(%r14),%rbp
   1b2da:	48 85 c9             	test   %rcx,%rcx
   1b2dd:	48 89 e8             	mov    %rbp,%rax
   1b2e0:	48 0f 44 c1          	cmove  %rcx,%rax
   1b2e4:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b2eb:	41 bd 9c f7 ff ff    	mov    $0xfffff79c,%r13d
   1b2f1:	41 0f 44 cd          	cmove  %r13d,%ecx
   1b2f5:	48 09 d0             	or     %rdx,%rax
   1b2f8:	48 f7 e0             	mul    %rax
   1b2fb:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b300:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b305:	48 89 04 24          	mov    %rax,(%rsp)
   1b309:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b30d:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b312:	48 89 e1             	mov    %rsp,%rcx
   1b315:	4c 89 e6             	mov    %r12,%rsi
   1b318:	4c 89 c2             	mov    %r8,%rdx
   1b31b:	e8 80 1b 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1b320:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b325:	75 79                	jne    1b3a0 <hyperinterval::float::F64Enclosure::square+0x120>
   1b327:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1b32c:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1b331:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1b336:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1b33b:	4c 89 f8             	mov    %r15,%rax
   1b33e:	48 c1 e8 34          	shr    $0x34,%rax
   1b342:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b347:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1b34c:	4d 21 fe             	and    %r15,%r14
   1b34f:	48 85 c0             	test   %rax,%rax
   1b352:	48 0f 44 e8          	cmove  %rax,%rbp
   1b356:	8d 8c 00 9a f7 ff ff 	lea    -0x866(%rax,%rax,1),%ecx
   1b35d:	41 0f 44 cd          	cmove  %r13d,%ecx
   1b361:	4c 09 f5             	or     %r14,%rbp
   1b364:	48 89 e8             	mov    %rbp,%rax
   1b367:	48 f7 e5             	mul    %rbp
   1b36a:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b36f:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b374:	48 89 04 24          	mov    %rax,(%rsp)
   1b378:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b37c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b381:	48 89 e1             	mov    %rsp,%rcx
   1b384:	4c 89 e6             	mov    %r12,%rsi
   1b387:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b38e:	00 f0 7f 
   1b391:	4c 89 fa             	mov    %r15,%rdx
   1b394:	e8 07 1b 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1b399:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1b39e:	75 10                	jne    1b3b0 <hyperinterval::float::F64Enclosure::square+0x130>
   1b3a0:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1b3a5:	eb 4f                	jmp    1b3f6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b3a7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b3ae:	eb 50                	jmp    1b400 <hyperinterval::float::F64Enclosure::square+0x180>
   1b3b0:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
   1b3b5:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1b3ba:	48 89 e7             	mov    %rsp,%rdi
   1b3bd:	4c 89 e6             	mov    %r12,%rsi
   1b3c0:	4c 89 fa             	mov    %r15,%rdx
   1b3c3:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   1b3c8:	e8 93 1a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b3cd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b3d1:	74 1e                	je     1b3f1 <hyperinterval::float::F64Enclosure::square+0x171>
   1b3d3:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b3d8:	48 89 e7             	mov    %rsp,%rdi
   1b3db:	4c 89 e6             	mov    %r12,%rsi
   1b3de:	4c 89 fa             	mov    %r15,%rdx
   1b3e1:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b3e6:	e8 75 1a 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b3eb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b3ef:	75 21                	jne    1b412 <hyperinterval::float::F64Enclosure::square+0x192>
   1b3f1:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b3f6:	88 43 08             	mov    %al,0x8(%rbx)
   1b3f9:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b400:	48 89 d8             	mov    %rbx,%rax
   1b403:	48 83 c4 58          	add    $0x58,%rsp
   1b407:	5b                   	pop    %rbx
   1b408:	41 5c                	pop    %r12
   1b40a:	41 5d                	pop    %r13
   1b40c:	41 5e                	pop    %r14
   1b40e:	41 5f                	pop    %r15
   1b410:	5d                   	pop    %rbp
   1b411:	c3                   	ret
   1b412:	4c 89 f1             	mov    %r14,%rcx
   1b415:	48 89 e8             	mov    %rbp,%rax
   1b418:	4c 09 e0             	or     %r12,%rax
   1b41b:	4d 8d 74 24 ff       	lea    -0x1(%r12),%r14
   1b420:	48 89 ee             	mov    %rbp,%rsi
   1b423:	4c 21 f6             	and    %r14,%rsi
   1b426:	4c 89 e2             	mov    %r12,%rdx
   1b429:	48 29 f2             	sub    %rsi,%rdx
   1b42c:	48 85 ed             	test   %rbp,%rbp
   1b42f:	48 0f 49 d0          	cmovns %rax,%rdx
   1b433:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1b438:	48 89 f8             	mov    %rdi,%rax
   1b43b:	4c 09 e0             	or     %r12,%rax
   1b43e:	49 89 f8             	mov    %rdi,%r8
   1b441:	4d 21 f0             	and    %r14,%r8
   1b444:	4c 89 e6             	mov    %r12,%rsi
   1b447:	4c 29 c6             	sub    %r8,%rsi
   1b44a:	48 85 ff             	test   %rdi,%rdi
   1b44d:	48 0f 49 f0          	cmovns %rax,%rsi
   1b451:	b0 01                	mov    $0x1,%al
   1b453:	48 39 f2             	cmp    %rsi,%rdx
   1b456:	77 9e                	ja     1b3f6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b458:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b45d:	48 89 e7             	mov    %rsp,%rdi
   1b460:	4c 89 e6             	mov    %r12,%rsi
   1b463:	4c 89 fa             	mov    %r15,%rdx
   1b466:	e8 f5 19 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b46b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b46f:	74 80                	je     1b3f1 <hyperinterval::float::F64Enclosure::square+0x171>
   1b471:	4c 89 e9             	mov    %r13,%rcx
   1b474:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b479:	48 89 e7             	mov    %rsp,%rdi
   1b47c:	4c 89 e6             	mov    %r12,%rsi
   1b47f:	4c 89 fa             	mov    %r15,%rdx
   1b482:	e8 d9 19 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b487:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b48b:	0f 84 60 ff ff ff    	je     1b3f1 <hyperinterval::float::F64Enclosure::square+0x171>
   1b491:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b496:	4c 89 e8             	mov    %r13,%rax
   1b499:	4c 09 e0             	or     %r12,%rax
   1b49c:	4c 89 ea             	mov    %r13,%rdx
   1b49f:	4c 21 f2             	and    %r14,%rdx
   1b4a2:	4c 89 e6             	mov    %r12,%rsi
   1b4a5:	48 29 d6             	sub    %rdx,%rsi
   1b4a8:	4d 85 ed             	test   %r13,%r13
   1b4ab:	48 0f 49 f0          	cmovns %rax,%rsi
   1b4af:	48 89 c8             	mov    %rcx,%rax
   1b4b2:	4c 09 e0             	or     %r12,%rax
   1b4b5:	49 21 ce             	and    %rcx,%r14
   1b4b8:	4d 29 f4             	sub    %r14,%r12
   1b4bb:	48 85 c9             	test   %rcx,%rcx
   1b4be:	4c 0f 49 e0          	cmovns %rax,%r12
   1b4c2:	b0 01                	mov    $0x1,%al
   1b4c4:	4c 39 e6             	cmp    %r12,%rsi
   1b4c7:	0f 87 29 ff ff ff    	ja     1b3f6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b4cd:	48 89 ef             	mov    %rbp,%rdi
   1b4d0:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b4d5:	4c 89 ea             	mov    %r13,%rdx
   1b4d8:	e8 f3 21 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1b4dd:	49 89 c5             	mov    %rax,%r13
   1b4e0:	49 89 d4             	mov    %rdx,%r12
   1b4e3:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1b4e8:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   1b4ed:	31 d2                	xor    %edx,%edx
   1b4ef:	e8 6c 22 00 00       	call   1d760 <hyperinterval::bounds::Bounds<T>::signs>
   1b4f4:	a8 02                	test   $0x2,%al
   1b4f6:	75 14                	jne    1b50c <hyperinterval::float::F64Enclosure::square+0x28c>
   1b4f8:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b4ff:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b503:	4c 89 63 10          	mov    %r12,0x10(%rbx)
   1b507:	e9 f4 fe ff ff       	jmp    1b400 <hyperinterval::float::F64Enclosure::square+0x180>
   1b50c:	48 89 e7             	mov    %rsp,%rdi
   1b50f:	31 f6                	xor    %esi,%esi
   1b511:	31 d2                	xor    %edx,%edx
   1b513:	e8 78 03 00 00       	call   1b890 <hyperinterval::float::F64Enclosure::from_bits>
   1b518:	48 8b 04 24          	mov    (%rsp),%rax
   1b51c:	48 83 f8 02          	cmp    $0x2,%rax
   1b520:	75 0a                	jne    1b52c <hyperinterval::float::F64Enclosure::square+0x2ac>
   1b522:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b527:	e9 ca fe ff ff       	jmp    1b3f6 <hyperinterval::float::F64Enclosure::square+0x176>
   1b52c:	83 f8 01             	cmp    $0x1,%eax
   1b52f:	75 c7                	jne    1b4f8 <hyperinterval::float::F64Enclosure::square+0x278>
   1b531:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1b536:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   1b53b:	4c 89 ef             	mov    %r13,%rdi
   1b53e:	4c 89 e6             	mov    %r12,%rsi
   1b541:	e8 8a 21 00 00       	call   1d6d0 <hyperinterval::bounds::Bounds<T>::hull>
   1b546:	49 89 c5             	mov    %rax,%r13
   1b549:	49 89 d4             	mov    %rdx,%r12
   1b54c:	eb aa                	jmp    1b4f8 <hyperinterval::float::F64Enclosure::square+0x278>
   1b54e:	cc                   	int3
   1b54f:	cc                   	int3

hyperinterval::float::F64Enclosure::next_up:
   1b550:	41 57                	push   %r15
   1b552:	41 56                	push   %r14
   1b554:	53                   	push   %rbx
   1b555:	48 83 ec 10          	sub    $0x10,%rsp
   1b559:	48 89 fb             	mov    %rdi,%rbx
   1b55c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b563:	00 00 80 
   1b566:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b56d:	00 f0 7f 
   1b570:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1b575:	48 89 e7             	mov    %rsp,%rdi
   1b578:	4c 89 f6             	mov    %r14,%rsi
   1b57b:	4c 89 fa             	mov    %r15,%rdx
   1b57e:	e8 dd 18 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b583:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b587:	75 0c                	jne    1b595 <hyperinterval::float::F64Enclosure::next_up+0x45>
   1b589:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b58e:	88 43 01             	mov    %al,0x1(%rbx)
   1b591:	b0 01                	mov    $0x1,%al
   1b593:	eb 3c                	jmp    1b5d1 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1b595:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b59a:	48 89 c1             	mov    %rax,%rcx
   1b59d:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b5a1:	48 83 c9 01          	or     $0x1,%rcx
   1b5a5:	48 01 c1             	add    %rax,%rcx
   1b5a8:	48 89 e7             	mov    %rsp,%rdi
   1b5ab:	4c 89 f6             	mov    %r14,%rsi
   1b5ae:	4c 89 fa             	mov    %r15,%rdx
   1b5b1:	e8 aa 18 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b5b6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b5ba:	75 08                	jne    1b5c4 <hyperinterval::float::F64Enclosure::next_up+0x74>
   1b5bc:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1b5c0:	b0 01                	mov    $0x1,%al
   1b5c2:	eb 0d                	jmp    1b5d1 <hyperinterval::float::F64Enclosure::next_up+0x81>
   1b5c4:	f3 0f 7e 44 24 08    	movq   0x8(%rsp),%xmm0
   1b5ca:	66 0f d6 43 08       	movq   %xmm0,0x8(%rbx)
   1b5cf:	31 c0                	xor    %eax,%eax
   1b5d1:	88 03                	mov    %al,(%rbx)
   1b5d3:	48 89 d8             	mov    %rbx,%rax
   1b5d6:	48 83 c4 10          	add    $0x10,%rsp
   1b5da:	5b                   	pop    %rbx
   1b5db:	41 5e                	pop    %r14
   1b5dd:	41 5f                	pop    %r15
   1b5df:	c3                   	ret

hyperinterval::float::F64Enclosure::disjoint:
   1b5e0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1b5e4:	b0 01                	mov    $0x1,%al
   1b5e6:	0f 84 93 00 00 00    	je     1b67f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1b5ec:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b5f0:	0f 84 89 00 00 00    	je     1b67f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1b5f6:	53                   	push   %rbx
   1b5f7:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1b5fe:	00 00 80 
   1b601:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1b605:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1b609:	4d 89 c2             	mov    %r8,%r10
   1b60c:	49 09 ca             	or     %rcx,%r10
   1b60f:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1b613:	4d 89 c3             	mov    %r8,%r11
   1b616:	49 21 d3             	and    %rdx,%r11
   1b619:	48 89 cb             	mov    %rcx,%rbx
   1b61c:	4c 29 db             	sub    %r11,%rbx
   1b61f:	4d 85 c0             	test   %r8,%r8
   1b622:	49 0f 49 da          	cmovns %r10,%rbx
   1b626:	4d 89 c8             	mov    %r9,%r8
   1b629:	49 09 c8             	or     %rcx,%r8
   1b62c:	4d 89 ca             	mov    %r9,%r10
   1b62f:	49 21 d2             	and    %rdx,%r10
   1b632:	49 89 cb             	mov    %rcx,%r11
   1b635:	4d 29 d3             	sub    %r10,%r11
   1b638:	4d 85 c9             	test   %r9,%r9
   1b63b:	4d 0f 49 d8          	cmovns %r8,%r11
   1b63f:	4c 39 db             	cmp    %r11,%rbx
   1b642:	5b                   	pop    %rbx
   1b643:	72 3a                	jb     1b67f <hyperinterval::float::F64Enclosure::disjoint+0x9f>
   1b645:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1b649:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b64d:	48 89 f7             	mov    %rsi,%rdi
   1b650:	48 09 cf             	or     %rcx,%rdi
   1b653:	49 89 f0             	mov    %rsi,%r8
   1b656:	49 21 d0             	and    %rdx,%r8
   1b659:	49 89 c9             	mov    %rcx,%r9
   1b65c:	4d 29 c1             	sub    %r8,%r9
   1b65f:	48 85 f6             	test   %rsi,%rsi
   1b662:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b666:	48 89 c6             	mov    %rax,%rsi
   1b669:	48 09 ce             	or     %rcx,%rsi
   1b66c:	48 21 c2             	and    %rax,%rdx
   1b66f:	48 29 d1             	sub    %rdx,%rcx
   1b672:	48 85 c0             	test   %rax,%rax
   1b675:	48 0f 49 ce          	cmovns %rsi,%rcx
   1b679:	49 39 c9             	cmp    %rcx,%r9
   1b67c:	0f 92 c0             	setb   %al
   1b67f:	c3                   	ret

hyperinterval::float::F64Enclosure::expanded:
   1b680:	41 57                	push   %r15
   1b682:	41 56                	push   %r14
   1b684:	41 55                	push   %r13
   1b686:	41 54                	push   %r12
   1b688:	53                   	push   %rbx
   1b689:	48 83 ec 10          	sub    $0x10,%rsp
   1b68d:	48 89 fb             	mov    %rdi,%rbx
   1b690:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b694:	75 7f                	jne    1b715 <hyperinterval::float::F64Enclosure::expanded+0x95>
   1b696:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1b69a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b6a1:	00 00 80 
   1b6a4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b6ab:	00 f0 7f 
   1b6ae:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1b6b2:	48 89 c2             	mov    %rax,%rdx
   1b6b5:	4c 31 f2             	xor    %r14,%rdx
   1b6b8:	48 85 c0             	test   %rax,%rax
   1b6bb:	48 0f 44 d0          	cmove  %rax,%rdx
   1b6bf:	48 89 d1             	mov    %rdx,%rcx
   1b6c2:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b6c6:	48 83 c9 01          	or     $0x1,%rcx
   1b6ca:	48 01 d1             	add    %rdx,%rcx
   1b6cd:	48 89 e7             	mov    %rsp,%rdi
   1b6d0:	4c 89 f6             	mov    %r14,%rsi
   1b6d3:	4c 89 fa             	mov    %r15,%rdx
   1b6d6:	e8 85 17 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b6db:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b6df:	75 27                	jne    1b708 <hyperinterval::float::F64Enclosure::expanded+0x88>
   1b6e1:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b6e6:	4c 89 e1             	mov    %r12,%rcx
   1b6e9:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1b6ed:	48 83 c9 01          	or     $0x1,%rcx
   1b6f1:	4c 01 e1             	add    %r12,%rcx
   1b6f4:	48 89 e7             	mov    %rsp,%rdi
   1b6f7:	4c 89 f6             	mov    %r14,%rsi
   1b6fa:	4c 89 fa             	mov    %r15,%rdx
   1b6fd:	e8 5e 17 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b702:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b706:	75 25                	jne    1b72d <hyperinterval::float::F64Enclosure::expanded+0xad>
   1b708:	c6 43 08 05          	movb   $0x5,0x8(%rbx)
   1b70c:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b713:	eb 07                	jmp    1b71c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b715:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b71c:	48 89 d8             	mov    %rbx,%rax
   1b71f:	48 83 c4 10          	add    $0x10,%rsp
   1b723:	5b                   	pop    %rbx
   1b724:	41 5c                	pop    %r12
   1b726:	41 5d                	pop    %r13
   1b728:	41 5e                	pop    %r14
   1b72a:	41 5f                	pop    %r15
   1b72c:	c3                   	ret
   1b72d:	4c 89 e9             	mov    %r13,%rcx
   1b730:	4c 31 f1             	xor    %r14,%rcx
   1b733:	4d 85 ed             	test   %r13,%r13
   1b736:	49 0f 44 cd          	cmove  %r13,%rcx
   1b73a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b73f:	48 89 e7             	mov    %rsp,%rdi
   1b742:	4c 89 f6             	mov    %r14,%rsi
   1b745:	4c 89 fa             	mov    %r15,%rdx
   1b748:	e8 13 17 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b74d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b751:	74 1c                	je     1b76f <hyperinterval::float::F64Enclosure::expanded+0xef>
   1b753:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b758:	48 89 e7             	mov    %rsp,%rdi
   1b75b:	4c 89 f6             	mov    %r14,%rsi
   1b75e:	4c 89 fa             	mov    %r15,%rdx
   1b761:	4c 89 e1             	mov    %r12,%rcx
   1b764:	e8 f7 16 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b769:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b76d:	75 11                	jne    1b780 <hyperinterval::float::F64Enclosure::expanded+0x100>
   1b76f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b774:	88 43 08             	mov    %al,0x8(%rbx)
   1b777:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b77e:	eb 9c                	jmp    1b71c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b780:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b785:	4c 89 e9             	mov    %r13,%rcx
   1b788:	4c 09 f1             	or     %r14,%rcx
   1b78b:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1b78f:	4c 89 ee             	mov    %r13,%rsi
   1b792:	48 21 d6             	and    %rdx,%rsi
   1b795:	4c 89 f7             	mov    %r14,%rdi
   1b798:	48 29 f7             	sub    %rsi,%rdi
   1b79b:	4d 85 ed             	test   %r13,%r13
   1b79e:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b7a2:	48 89 c1             	mov    %rax,%rcx
   1b7a5:	4c 09 f1             	or     %r14,%rcx
   1b7a8:	48 21 c2             	and    %rax,%rdx
   1b7ab:	49 29 d6             	sub    %rdx,%r14
   1b7ae:	48 85 c0             	test   %rax,%rax
   1b7b1:	4c 0f 49 f1          	cmovns %rcx,%r14
   1b7b5:	4c 39 f7             	cmp    %r14,%rdi
   1b7b8:	76 10                	jbe    1b7ca <hyperinterval::float::F64Enclosure::expanded+0x14a>
   1b7ba:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b7be:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b7c5:	e9 52 ff ff ff       	jmp    1b71c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b7ca:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b7d1:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b7d5:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b7d9:	e9 3e ff ff ff       	jmp    1b71c <hyperinterval::float::F64Enclosure::expanded+0x9c>
   1b7de:	cc                   	int3
   1b7df:	cc                   	int3

hyperinterval::float::F64Enclosure::overlaps:
   1b7e0:	31 c0                	xor    %eax,%eax
   1b7e2:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1b7e6:	0f 84 94 00 00 00    	je     1b880 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1b7ec:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1b7f0:	0f 84 8a 00 00 00    	je     1b880 <hyperinterval::float::F64Enclosure::overlaps+0xa0>
   1b7f6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1b7fd:	00 00 80 
   1b800:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1b804:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1b808:	49 89 d1             	mov    %rdx,%r9
   1b80b:	49 09 c1             	or     %rax,%r9
   1b80e:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1b812:	49 89 d2             	mov    %rdx,%r10
   1b815:	49 21 ca             	and    %rcx,%r10
   1b818:	49 89 c3             	mov    %rax,%r11
   1b81b:	4d 29 d3             	sub    %r10,%r11
   1b81e:	48 85 d2             	test   %rdx,%rdx
   1b821:	4d 0f 49 d9          	cmovns %r9,%r11
   1b825:	4c 89 c2             	mov    %r8,%rdx
   1b828:	48 09 c2             	or     %rax,%rdx
   1b82b:	4d 89 c1             	mov    %r8,%r9
   1b82e:	49 21 c9             	and    %rcx,%r9
   1b831:	49 89 c2             	mov    %rax,%r10
   1b834:	4d 29 ca             	sub    %r9,%r10
   1b837:	4d 85 c0             	test   %r8,%r8
   1b83a:	4c 0f 49 d2          	cmovns %rdx,%r10
   1b83e:	4d 39 d3             	cmp    %r10,%r11
   1b841:	73 03                	jae    1b846 <hyperinterval::float::F64Enclosure::overlaps+0x66>
   1b843:	31 c0                	xor    %eax,%eax
   1b845:	c3                   	ret
   1b846:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1b84a:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b84e:	48 89 f7             	mov    %rsi,%rdi
   1b851:	48 09 c7             	or     %rax,%rdi
   1b854:	49 89 f0             	mov    %rsi,%r8
   1b857:	49 21 c8             	and    %rcx,%r8
   1b85a:	49 89 c1             	mov    %rax,%r9
   1b85d:	4d 29 c1             	sub    %r8,%r9
   1b860:	48 85 f6             	test   %rsi,%rsi
   1b863:	4c 0f 49 cf          	cmovns %rdi,%r9
   1b867:	48 89 d6             	mov    %rdx,%rsi
   1b86a:	48 09 c6             	or     %rax,%rsi
   1b86d:	48 21 d1             	and    %rdx,%rcx
   1b870:	48 29 c8             	sub    %rcx,%rax
   1b873:	48 85 d2             	test   %rdx,%rdx
   1b876:	48 0f 49 c6          	cmovns %rsi,%rax
   1b87a:	49 39 c1             	cmp    %rax,%r9
   1b87d:	0f 93 c0             	setae  %al
   1b880:	c3                   	ret
   1b881:	cc                   	int3
   1b882:	cc                   	int3
   1b883:	cc                   	int3
   1b884:	cc                   	int3
   1b885:	cc                   	int3
   1b886:	cc                   	int3
   1b887:	cc                   	int3
   1b888:	cc                   	int3
   1b889:	cc                   	int3
   1b88a:	cc                   	int3
   1b88b:	cc                   	int3
   1b88c:	cc                   	int3
   1b88d:	cc                   	int3
   1b88e:	cc                   	int3
   1b88f:	cc                   	int3

hyperinterval::float::F64Enclosure::from_bits:
   1b890:	41 57                	push   %r15
   1b892:	41 56                	push   %r14
   1b894:	41 55                	push   %r13
   1b896:	41 54                	push   %r12
   1b898:	53                   	push   %rbx
   1b899:	48 83 ec 10          	sub    $0x10,%rsp
   1b89d:	49 89 d7             	mov    %rdx,%r15
   1b8a0:	48 89 f1             	mov    %rsi,%rcx
   1b8a3:	48 89 fb             	mov    %rdi,%rbx
   1b8a6:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b8ad:	00 00 80 
   1b8b0:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b8b7:	00 f0 7f 
   1b8ba:	48 89 e7             	mov    %rsp,%rdi
   1b8bd:	4c 89 f6             	mov    %r14,%rsi
   1b8c0:	4c 89 e2             	mov    %r12,%rdx
   1b8c3:	e8 98 15 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b8c8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b8cc:	74 1c                	je     1b8ea <hyperinterval::float::F64Enclosure::from_bits+0x5a>
   1b8ce:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b8d3:	48 89 e7             	mov    %rsp,%rdi
   1b8d6:	4c 89 f6             	mov    %r14,%rsi
   1b8d9:	4c 89 e2             	mov    %r12,%rdx
   1b8dc:	4c 89 f9             	mov    %r15,%rcx
   1b8df:	e8 7c 15 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1b8e4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b8e8:	75 1d                	jne    1b907 <hyperinterval::float::F64Enclosure::from_bits+0x77>
   1b8ea:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b8ef:	88 43 08             	mov    %al,0x8(%rbx)
   1b8f2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b8f9:	48 83 c4 10          	add    $0x10,%rsp
   1b8fd:	5b                   	pop    %rbx
   1b8fe:	41 5c                	pop    %r12
   1b900:	41 5d                	pop    %r13
   1b902:	41 5e                	pop    %r14
   1b904:	41 5f                	pop    %r15
   1b906:	c3                   	ret
   1b907:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b90c:	4c 89 e9             	mov    %r13,%rcx
   1b90f:	4c 09 f1             	or     %r14,%rcx
   1b912:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1b916:	4c 89 ee             	mov    %r13,%rsi
   1b919:	48 21 d6             	and    %rdx,%rsi
   1b91c:	4c 89 f7             	mov    %r14,%rdi
   1b91f:	48 29 f7             	sub    %rsi,%rdi
   1b922:	4d 85 ed             	test   %r13,%r13
   1b925:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b929:	48 89 c1             	mov    %rax,%rcx
   1b92c:	4c 09 f1             	or     %r14,%rcx
   1b92f:	48 21 c2             	and    %rax,%rdx
   1b932:	49 29 d6             	sub    %rdx,%r14
   1b935:	48 85 c0             	test   %rax,%rax
   1b938:	4c 0f 49 f1          	cmovns %rcx,%r14
   1b93c:	4c 39 f7             	cmp    %r14,%rdi
   1b93f:	76 06                	jbe    1b947 <hyperinterval::float::F64Enclosure::from_bits+0xb7>
   1b941:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b945:	eb ab                	jmp    1b8f2 <hyperinterval::float::F64Enclosure::from_bits+0x62>
   1b947:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b94e:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b952:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b956:	eb a1                	jmp    1b8f9 <hyperinterval::float::F64Enclosure::from_bits+0x69>
   1b958:	cc                   	int3
   1b959:	cc                   	int3
   1b95a:	cc                   	int3
   1b95b:	cc                   	int3
   1b95c:	cc                   	int3
   1b95d:	cc                   	int3
   1b95e:	cc                   	int3
   1b95f:	cc                   	int3

hyperinterval::float::F64Enclosure::max_image:
   1b960:	48 89 f8             	mov    %rdi,%rax
   1b963:	45 31 c0             	xor    %r8d,%r8d
   1b966:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b96a:	0f 85 ab 00 00 00    	jne    1ba1b <hyperinterval::float::F64Enclosure::max_image+0xbb>
   1b970:	f6 02 01             	testb  $0x1,(%rdx)
   1b973:	0f 84 96 00 00 00    	je     1ba0f <hyperinterval::float::F64Enclosure::max_image+0xaf>
   1b979:	41 56                	push   %r14
   1b97b:	53                   	push   %rbx
   1b97c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1b980:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1b984:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1b988:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b98f:	00 00 80 
   1b992:	49 89 fa             	mov    %rdi,%r10
   1b995:	49 09 f2             	or     %rsi,%r10
   1b998:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1b99c:	49 89 fb             	mov    %rdi,%r11
   1b99f:	4d 21 c3             	and    %r8,%r11
   1b9a2:	48 89 f3             	mov    %rsi,%rbx
   1b9a5:	4c 29 db             	sub    %r11,%rbx
   1b9a8:	48 85 ff             	test   %rdi,%rdi
   1b9ab:	49 0f 49 da          	cmovns %r10,%rbx
   1b9af:	4d 89 ca             	mov    %r9,%r10
   1b9b2:	49 09 f2             	or     %rsi,%r10
   1b9b5:	4d 89 cb             	mov    %r9,%r11
   1b9b8:	4d 21 c3             	and    %r8,%r11
   1b9bb:	49 89 f6             	mov    %rsi,%r14
   1b9be:	4d 29 de             	sub    %r11,%r14
   1b9c1:	4d 85 c9             	test   %r9,%r9
   1b9c4:	4d 0f 49 f2          	cmovns %r10,%r14
   1b9c8:	4c 39 f3             	cmp    %r14,%rbx
   1b9cb:	49 0f 42 f9          	cmovb  %r9,%rdi
   1b9cf:	49 89 c9             	mov    %rcx,%r9
   1b9d2:	49 09 f1             	or     %rsi,%r9
   1b9d5:	49 89 ca             	mov    %rcx,%r10
   1b9d8:	4d 21 c2             	and    %r8,%r10
   1b9db:	49 89 f3             	mov    %rsi,%r11
   1b9de:	4d 29 d3             	sub    %r10,%r11
   1b9e1:	48 85 c9             	test   %rcx,%rcx
   1b9e4:	4d 0f 49 d9          	cmovns %r9,%r11
   1b9e8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1b9ec:	49 89 d1             	mov    %rdx,%r9
   1b9ef:	49 09 f1             	or     %rsi,%r9
   1b9f2:	49 21 d0             	and    %rdx,%r8
   1b9f5:	4c 29 c6             	sub    %r8,%rsi
   1b9f8:	48 85 d2             	test   %rdx,%rdx
   1b9fb:	49 0f 49 f1          	cmovns %r9,%rsi
   1b9ff:	49 39 f3             	cmp    %rsi,%r11
   1ba02:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1ba06:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1ba0c:	5b                   	pop    %rbx
   1ba0d:	41 5e                	pop    %r14
   1ba0f:	4c 89 00             	mov    %r8,(%rax)
   1ba12:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ba16:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ba1a:	c3                   	ret
   1ba1b:	4c 89 00             	mov    %r8,(%rax)
   1ba1e:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1ba22:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1ba26:	c3                   	ret
   1ba27:	cc                   	int3
   1ba28:	cc                   	int3
   1ba29:	cc                   	int3
   1ba2a:	cc                   	int3
   1ba2b:	cc                   	int3
   1ba2c:	cc                   	int3
   1ba2d:	cc                   	int3
   1ba2e:	cc                   	int3
   1ba2f:	cc                   	int3

hyperinterval::float::F64Enclosure::min_image:
   1ba30:	48 89 f8             	mov    %rdi,%rax
   1ba33:	45 31 c0             	xor    %r8d,%r8d
   1ba36:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ba3a:	0f 85 ab 00 00 00    	jne    1baeb <hyperinterval::float::F64Enclosure::min_image+0xbb>
   1ba40:	f6 02 01             	testb  $0x1,(%rdx)
   1ba43:	0f 84 96 00 00 00    	je     1badf <hyperinterval::float::F64Enclosure::min_image+0xaf>
   1ba49:	41 56                	push   %r14
   1ba4b:	53                   	push   %rbx
   1ba4c:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1ba50:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1ba54:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
   1ba58:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1ba5c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1ba63:	00 00 80 
   1ba66:	49 89 fa             	mov    %rdi,%r10
   1ba69:	49 09 f2             	or     %rsi,%r10
   1ba6c:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1ba70:	49 89 fb             	mov    %rdi,%r11
   1ba73:	4d 21 c3             	and    %r8,%r11
   1ba76:	48 89 f3             	mov    %rsi,%rbx
   1ba79:	4c 29 db             	sub    %r11,%rbx
   1ba7c:	48 85 ff             	test   %rdi,%rdi
   1ba7f:	49 0f 49 da          	cmovns %r10,%rbx
   1ba83:	4d 89 ca             	mov    %r9,%r10
   1ba86:	49 09 f2             	or     %rsi,%r10
   1ba89:	4d 89 cb             	mov    %r9,%r11
   1ba8c:	4d 21 c3             	and    %r8,%r11
   1ba8f:	49 89 f6             	mov    %rsi,%r14
   1ba92:	4d 29 de             	sub    %r11,%r14
   1ba95:	4d 85 c9             	test   %r9,%r9
   1ba98:	4d 0f 49 f2          	cmovns %r10,%r14
   1ba9c:	4c 39 f3             	cmp    %r14,%rbx
   1ba9f:	49 0f 47 f9          	cmova  %r9,%rdi
   1baa3:	49 89 c9             	mov    %rcx,%r9
   1baa6:	49 09 f1             	or     %rsi,%r9
   1baa9:	49 89 ca             	mov    %rcx,%r10
   1baac:	4d 21 c2             	and    %r8,%r10
   1baaf:	49 89 f3             	mov    %rsi,%r11
   1bab2:	4d 29 d3             	sub    %r10,%r11
   1bab5:	48 85 c9             	test   %rcx,%rcx
   1bab8:	4d 0f 49 d9          	cmovns %r9,%r11
   1babc:	49 89 d1             	mov    %rdx,%r9
   1babf:	49 09 f1             	or     %rsi,%r9
   1bac2:	49 21 d0             	and    %rdx,%r8
   1bac5:	4c 29 c6             	sub    %r8,%rsi
   1bac8:	48 85 d2             	test   %rdx,%rdx
   1bacb:	49 0f 49 f1          	cmovns %r9,%rsi
   1bacf:	49 39 f3             	cmp    %rsi,%r11
   1bad2:	48 0f 47 ca          	cmova  %rdx,%rcx
   1bad6:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1badc:	5b                   	pop    %rbx
   1badd:	41 5e                	pop    %r14
   1badf:	4c 89 00             	mov    %r8,(%rax)
   1bae2:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1bae6:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1baea:	c3                   	ret
   1baeb:	4c 89 00             	mov    %r8,(%rax)
   1baee:	48 89 78 08          	mov    %rdi,0x8(%rax)
   1baf2:	48 89 48 10          	mov    %rcx,0x10(%rax)
   1baf6:	c3                   	ret
   1baf7:	cc                   	int3
   1baf8:	cc                   	int3
   1baf9:	cc                   	int3
   1bafa:	cc                   	int3
   1bafb:	cc                   	int3
   1bafc:	cc                   	int3
   1bafd:	cc                   	int3
   1bafe:	cc                   	int3
   1baff:	cc                   	int3

hyperinterval::float::F64Enclosure::next_down:
   1bb00:	41 57                	push   %r15
   1bb02:	41 56                	push   %r14
   1bb04:	53                   	push   %rbx
   1bb05:	48 83 ec 10          	sub    $0x10,%rsp
   1bb09:	48 89 fb             	mov    %rdi,%rbx
   1bb0c:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1bb13:	00 00 80 
   1bb16:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1bb1d:	00 f0 7f 
   1bb20:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb25:	48 89 e7             	mov    %rsp,%rdi
   1bb28:	4c 89 f6             	mov    %r14,%rsi
   1bb2b:	4c 89 fa             	mov    %r15,%rdx
   1bb2e:	e8 2d 13 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1bb33:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb37:	75 0c                	jne    1bb45 <hyperinterval::float::F64Enclosure::next_down+0x45>
   1bb39:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bb3e:	88 43 01             	mov    %al,0x1(%rbx)
   1bb41:	b0 01                	mov    $0x1,%al
   1bb43:	eb 51                	jmp    1bb96 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1bb45:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bb4a:	48 89 c2             	mov    %rax,%rdx
   1bb4d:	4c 31 f2             	xor    %r14,%rdx
   1bb50:	48 85 c0             	test   %rax,%rax
   1bb53:	48 0f 44 d0          	cmove  %rax,%rdx
   1bb57:	48 89 d1             	mov    %rdx,%rcx
   1bb5a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1bb5e:	48 83 c9 01          	or     $0x1,%rcx
   1bb62:	48 01 d1             	add    %rdx,%rcx
   1bb65:	48 89 e7             	mov    %rsp,%rdi
   1bb68:	4c 89 f6             	mov    %r14,%rsi
   1bb6b:	4c 89 fa             	mov    %r15,%rdx
   1bb6e:	e8 ed 12 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1bb73:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb77:	75 08                	jne    1bb81 <hyperinterval::float::F64Enclosure::next_down+0x81>
   1bb79:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1bb7d:	b0 01                	mov    $0x1,%al
   1bb7f:	eb 15                	jmp    1bb96 <hyperinterval::float::F64Enclosure::next_down+0x96>
   1bb81:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bb86:	49 31 c6             	xor    %rax,%r14
   1bb89:	48 85 c0             	test   %rax,%rax
   1bb8c:	4c 0f 44 f0          	cmove  %rax,%r14
   1bb90:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1bb94:	31 c0                	xor    %eax,%eax
   1bb96:	88 03                	mov    %al,(%rbx)
   1bb98:	48 89 d8             	mov    %rbx,%rax
   1bb9b:	48 83 c4 10          	add    $0x10,%rsp
   1bb9f:	5b                   	pop    %rbx
   1bba0:	41 5e                	pop    %r14
   1bba2:	41 5f                	pop    %r15
   1bba4:	c3                   	ret
   1bba5:	cc                   	int3
   1bba6:	cc                   	int3
   1bba7:	cc                   	int3
   1bba8:	cc                   	int3
   1bba9:	cc                   	int3
   1bbaa:	cc                   	int3
   1bbab:	cc                   	int3
   1bbac:	cc                   	int3
   1bbad:	cc                   	int3
   1bbae:	cc                   	int3
   1bbaf:	cc                   	int3

hyperinterval::float::F64Enclosure::subset_of:
   1bbb0:	b0 01                	mov    $0x1,%al
   1bbb2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bbb6:	75 54                	jne    1bc0c <hyperinterval::float::F64Enclosure::subset_of+0x5c>
   1bbb8:	f6 06 01             	testb  $0x1,(%rsi)
   1bbbb:	74 4d                	je     1bc0a <hyperinterval::float::F64Enclosure::subset_of+0x5a>
   1bbbd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bbc1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bbc5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bbcc:	00 00 80 
   1bbcf:	4d 89 c1             	mov    %r8,%r9
   1bbd2:	49 09 c1             	or     %rax,%r9
   1bbd5:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bbd9:	4d 89 c2             	mov    %r8,%r10
   1bbdc:	49 21 ca             	and    %rcx,%r10
   1bbdf:	49 89 c3             	mov    %rax,%r11
   1bbe2:	4d 29 d3             	sub    %r10,%r11
   1bbe5:	4d 85 c0             	test   %r8,%r8
   1bbe8:	4d 0f 49 d9          	cmovns %r9,%r11
   1bbec:	49 89 d0             	mov    %rdx,%r8
   1bbef:	49 09 c0             	or     %rax,%r8
   1bbf2:	49 89 d1             	mov    %rdx,%r9
   1bbf5:	49 21 c9             	and    %rcx,%r9
   1bbf8:	49 89 c2             	mov    %rax,%r10
   1bbfb:	4d 29 ca             	sub    %r9,%r10
   1bbfe:	48 85 d2             	test   %rdx,%rdx
   1bc01:	4d 0f 49 d0          	cmovns %r8,%r10
   1bc05:	4d 39 d3             	cmp    %r10,%r11
   1bc08:	76 03                	jbe    1bc0d <hyperinterval::float::F64Enclosure::subset_of+0x5d>
   1bc0a:	31 c0                	xor    %eax,%eax
   1bc0c:	c3                   	ret
   1bc0d:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bc11:	48 89 d7             	mov    %rdx,%rdi
   1bc14:	48 09 c7             	or     %rax,%rdi
   1bc17:	49 89 d0             	mov    %rdx,%r8
   1bc1a:	49 21 c8             	and    %rcx,%r8
   1bc1d:	49 89 c1             	mov    %rax,%r9
   1bc20:	4d 29 c1             	sub    %r8,%r9
   1bc23:	48 85 d2             	test   %rdx,%rdx
   1bc26:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bc2a:	48 8b 56 10          	mov    0x10(%rsi),%rdx
   1bc2e:	48 89 d6             	mov    %rdx,%rsi
   1bc31:	48 09 c6             	or     %rax,%rsi
   1bc34:	48 21 d1             	and    %rdx,%rcx
   1bc37:	48 29 c8             	sub    %rcx,%rax
   1bc3a:	48 85 d2             	test   %rdx,%rdx
   1bc3d:	48 0f 49 c6          	cmovns %rsi,%rax
   1bc41:	49 39 c1             	cmp    %rax,%r9
   1bc44:	0f 96 c0             	setbe  %al
   1bc47:	c3                   	ret
   1bc48:	cc                   	int3
   1bc49:	cc                   	int3
   1bc4a:	cc                   	int3
   1bc4b:	cc                   	int3
   1bc4c:	cc                   	int3
   1bc4d:	cc                   	int3
   1bc4e:	cc                   	int3
   1bc4f:	cc                   	int3

hyperinterval::ieee::Format::add:
   1bc50:	55                   	push   %rbp
   1bc51:	41 57                	push   %r15
   1bc53:	41 56                	push   %r14
   1bc55:	41 55                	push   %r13
   1bc57:	41 54                	push   %r12
   1bc59:	53                   	push   %rbx
   1bc5a:	48 83 ec 38          	sub    $0x38,%rsp
   1bc5e:	48 89 fb             	mov    %rdi,%rbx
   1bc61:	48 85 c9             	test   %rcx,%rcx
   1bc64:	0f 84 48 01 00 00    	je     1bdb2 <hyperinterval::ieee::Format::add+0x162>
   1bc6a:	49 89 c9             	mov    %rcx,%r9
   1bc6d:	4d 85 c0             	test   %r8,%r8
   1bc70:	0f 84 46 01 00 00    	je     1bdbc <hyperinterval::ieee::Format::add+0x16c>
   1bc76:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
   1bc7b:	bf 40 00 00 00       	mov    $0x40,%edi
   1bc80:	f3 48 0f bc fa       	tzcnt  %rdx,%rdi
   1bc85:	4d 89 ca             	mov    %r9,%r10
   1bc88:	49 21 d2             	and    %rdx,%r10
   1bc8b:	89 f9                	mov    %edi,%ecx
   1bc8d:	49 d3 ea             	shr    %cl,%r10
   1bc90:	bb 01 00 00 00       	mov    $0x1,%ebx
   1bc95:	48 d3 e3             	shl    %cl,%rbx
   1bc98:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
   1bc9c:	4d 89 f7             	mov    %r14,%r15
   1bc9f:	4d 21 cf             	and    %r9,%r15
   1bca2:	4d 85 d2             	test   %r10,%r10
   1bca5:	b8 01 00 00 00       	mov    $0x1,%eax
   1bcaa:	45 89 d3             	mov    %r10d,%r11d
   1bcad:	44 0f 44 d8          	cmove  %eax,%r11d
   1bcb1:	4c 0f 45 d3          	cmovne %rbx,%r10
   1bcb5:	49 89 d5             	mov    %rdx,%r13
   1bcb8:	49 d3 ed             	shr    %cl,%r13
   1bcbb:	4d 09 fa             	or     %r15,%r10
   1bcbe:	49 d1 ed             	shr    $1,%r13
   1bcc1:	41 01 fd             	add    %edi,%r13d
   1bcc4:	45 31 e4             	xor    %r12d,%r12d
   1bcc7:	49 85 f1             	test   %rsi,%r9
   1bcca:	41 0f 95 c4          	setne  %r12b
   1bcce:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1bcd3:	49 0f bd ca          	bsr    %r10,%rcx
   1bcd7:	83 f1 3f             	xor    $0x3f,%ecx
   1bcda:	01 f9                	add    %edi,%ecx
   1bcdc:	83 c1 c1             	add    $0xffffffc1,%ecx
   1bcdf:	31 ed                	xor    %ebp,%ebp
   1bce1:	4c 0f a5 d5          	shld   %cl,%r10,%rbp
   1bce5:	49 d3 e2             	shl    %cl,%r10
   1bce8:	45 31 ff             	xor    %r15d,%r15d
   1bceb:	f6 c1 40             	test   $0x40,%cl
   1bcee:	49 0f 45 ea          	cmovne %r10,%rbp
   1bcf2:	4d 0f 45 d7          	cmovne %r15,%r10
   1bcf6:	44 01 e9             	add    %r13d,%ecx
   1bcf9:	41 29 cb             	sub    %ecx,%r11d
   1bcfc:	49 c1 e4 20          	shl    $0x20,%r12
   1bd00:	4d 09 dc             	or     %r11,%r12
   1bd03:	4d 89 c7             	mov    %r8,%r15
   1bd06:	49 21 d7             	and    %rdx,%r15
   1bd09:	89 f9                	mov    %edi,%ecx
   1bd0b:	49 d3 ef             	shr    %cl,%r15
   1bd0e:	4d 21 c6             	and    %r8,%r14
   1bd11:	4d 85 ff             	test   %r15,%r15
   1bd14:	41 0f 45 c7          	cmovne %r15d,%eax
   1bd18:	4c 0f 45 fb          	cmovne %rbx,%r15
   1bd1c:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1bd21:	4d 09 f7             	or     %r14,%r15
   1bd24:	45 31 f6             	xor    %r14d,%r14d
   1bd27:	48 89 f3             	mov    %rsi,%rbx
   1bd2a:	49 85 f0             	test   %rsi,%r8
   1bd2d:	41 0f 95 c6          	setne  %r14b
   1bd31:	49 0f bd cf          	bsr    %r15,%rcx
   1bd35:	83 f1 3f             	xor    $0x3f,%ecx
   1bd38:	01 f9                	add    %edi,%ecx
   1bd3a:	83 c1 c1             	add    $0xffffffc1,%ecx
   1bd3d:	31 ff                	xor    %edi,%edi
   1bd3f:	4c 0f a5 ff          	shld   %cl,%r15,%rdi
   1bd43:	49 d3 e7             	shl    %cl,%r15
   1bd46:	f6 c1 40             	test   $0x40,%cl
   1bd49:	49 0f 45 ff          	cmovne %r15,%rdi
   1bd4d:	be 00 00 00 00       	mov    $0x0,%esi
   1bd52:	4c 0f 45 fe          	cmovne %rsi,%r15
   1bd56:	41 01 cd             	add    %ecx,%r13d
   1bd59:	44 29 e8             	sub    %r13d,%eax
   1bd5c:	49 c1 e6 20          	shl    $0x20,%r14
   1bd60:	49 09 c6             	or     %rax,%r14
   1bd63:	41 39 c3             	cmp    %eax,%r11d
   1bd66:	7d 64                	jge    1bdcc <hyperinterval::ieee::Format::add+0x17c>
   1bd68:	4d 89 e5             	mov    %r12,%r13
   1bd6b:	4d 89 d1             	mov    %r10,%r9
   1bd6e:	45 89 da             	mov    %r11d,%r10d
   1bd71:	44 29 d0             	sub    %r10d,%eax
   1bd74:	83 f8 4a             	cmp    $0x4a,%eax
   1bd77:	48 89 de             	mov    %rbx,%rsi
   1bd7a:	7f 7c                	jg     1bdf8 <hyperinterval::ieee::Format::add+0x1a8>
   1bd7c:	89 c1                	mov    %eax,%ecx
   1bd7e:	4c 0f a5 ff          	shld   %cl,%r15,%rdi
   1bd82:	49 d3 e7             	shl    %cl,%r15
   1bd85:	31 c9                	xor    %ecx,%ecx
   1bd87:	a8 40                	test   $0x40,%al
   1bd89:	49 0f 45 ff          	cmovne %r15,%rdi
   1bd8d:	49 0f 44 cf          	cmove  %r15,%rcx
   1bd91:	49 c1 ee 20          	shr    $0x20,%r14
   1bd95:	49 c1 ed 20          	shr    $0x20,%r13
   1bd99:	4d 39 ee             	cmp    %r13,%r14
   1bd9c:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1bda1:	0f 85 a0 00 00 00    	jne    1be47 <hyperinterval::ieee::Format::add+0x1f7>
   1bda7:	49 01 c9             	add    %rcx,%r9
   1bdaa:	48 11 fd             	adc    %rdi,%rbp
   1bdad:	e9 f4 00 00 00       	jmp    1bea6 <hyperinterval::ieee::Format::add+0x256>
   1bdb2:	4c 89 43 08          	mov    %r8,0x8(%rbx)
   1bdb6:	4c 89 43 10          	mov    %r8,0x10(%rbx)
   1bdba:	eb 08                	jmp    1bdc4 <hyperinterval::ieee::Format::add+0x174>
   1bdbc:	4c 89 4b 08          	mov    %r9,0x8(%rbx)
   1bdc0:	4c 89 4b 10          	mov    %r9,0x10(%rbx)
   1bdc4:	c6 03 00             	movb   $0x0,(%rbx)
   1bdc7:	e9 18 01 00 00       	jmp    1bee4 <hyperinterval::ieee::Format::add+0x294>
   1bdcc:	4d 89 f5             	mov    %r14,%r13
   1bdcf:	4c 89 f9             	mov    %r15,%rcx
   1bdd2:	48 89 fe             	mov    %rdi,%rsi
   1bdd5:	4d 89 e6             	mov    %r12,%r14
   1bdd8:	4d 89 d7             	mov    %r10,%r15
   1bddb:	48 89 ef             	mov    %rbp,%rdi
   1bdde:	48 89 f5             	mov    %rsi,%rbp
   1bde1:	41 89 c2             	mov    %eax,%r10d
   1bde4:	44 89 d8             	mov    %r11d,%eax
   1bde7:	4d 89 c8             	mov    %r9,%r8
   1bdea:	49 89 c9             	mov    %rcx,%r9
   1bded:	44 29 d0             	sub    %r10d,%eax
   1bdf0:	83 f8 4a             	cmp    $0x4a,%eax
   1bdf3:	48 89 de             	mov    %rbx,%rsi
   1bdf6:	7e 84                	jle    1bd7c <hyperinterval::ieee::Format::add+0x12c>
   1bdf8:	48 b8 00 00 00 00 01 	movabs $0x100000000,%rax
   1bdff:	00 00 00 
   1be02:	49 85 c5             	test   %rax,%r13
   1be05:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   1be0a:	75 51                	jne    1be5d <hyperinterval::ieee::Format::add+0x20d>
   1be0c:	4c 89 c0             	mov    %r8,%rax
   1be0f:	48 21 f0             	and    %rsi,%rax
   1be12:	31 c9                	xor    %ecx,%ecx
   1be14:	48 f7 d8             	neg    %rax
   1be17:	0f 93 c1             	setae  %cl
   1be1a:	4d 89 c6             	mov    %r8,%r14
   1be1d:	49 8d 0c 48          	lea    (%r8,%rcx,2),%rcx
   1be21:	48 ff c9             	dec    %rcx
   1be24:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1be29:	e8 32 10 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1be2e:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1be33:	75 5b                	jne    1be90 <hyperinterval::ieee::Format::add+0x240>
   1be35:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1be3a:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1be3e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1be42:	e9 99 00 00 00       	jmp    1bee0 <hyperinterval::ieee::Format::add+0x290>
   1be47:	4c 39 c9             	cmp    %r9,%rcx
   1be4a:	48 89 f8             	mov    %rdi,%rax
   1be4d:	48 19 e8             	sbb    %rbp,%rax
   1be50:	73 48                	jae    1be9a <hyperinterval::ieee::Format::add+0x24a>
   1be52:	49 29 c9             	sub    %rcx,%r9
   1be55:	48 19 fd             	sbb    %rdi,%rbp
   1be58:	4d 89 ee             	mov    %r13,%r14
   1be5b:	eb 49                	jmp    1bea6 <hyperinterval::ieee::Format::add+0x256>
   1be5d:	4d 89 c6             	mov    %r8,%r14
   1be60:	4c 89 c0             	mov    %r8,%rax
   1be63:	48 31 f0             	xor    %rsi,%rax
   1be66:	48 89 c1             	mov    %rax,%rcx
   1be69:	48 21 f1             	and    %rsi,%rcx
   1be6c:	31 ff                	xor    %edi,%edi
   1be6e:	48 f7 d9             	neg    %rcx
   1be71:	40 0f 93 c7          	setae  %dil
   1be75:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1be79:	48 ff c9             	dec    %rcx
   1be7c:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1be81:	49 89 f7             	mov    %rsi,%r15
   1be84:	e8 d7 0f 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1be89:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1be8e:	74 39                	je     1bec9 <hyperinterval::ieee::Format::add+0x279>
   1be90:	c6 43 01 05          	movb   $0x5,0x1(%rbx)
   1be94:	b0 01                	mov    $0x1,%al
   1be96:	88 03                	mov    %al,(%rbx)
   1be98:	eb 4a                	jmp    1bee4 <hyperinterval::ieee::Format::add+0x294>
   1be9a:	4c 29 c9             	sub    %r9,%rcx
   1be9d:	48 19 ef             	sbb    %rbp,%rdi
   1bea0:	49 89 c9             	mov    %rcx,%r9
   1bea3:	48 89 fd             	mov    %rdi,%rbp
   1bea6:	44 88 74 24 24       	mov    %r14b,0x24(%rsp)
   1beab:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
   1beb0:	48 89 6c 24 18       	mov    %rbp,0x18(%rsp)
   1beb5:	44 89 54 24 20       	mov    %r10d,0x20(%rsp)
   1beba:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1bebf:	48 89 df             	mov    %rbx,%rdi
   1bec2:	e8 d9 0f 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1bec7:	eb 1b                	jmp    1bee4 <hyperinterval::ieee::Format::add+0x294>
   1bec9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1bece:	49 31 c7             	xor    %rax,%r15
   1bed1:	48 85 c0             	test   %rax,%rax
   1bed4:	4c 0f 44 f8          	cmove  %rax,%r15
   1bed8:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1bedc:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1bee0:	31 c0                	xor    %eax,%eax
   1bee2:	88 03                	mov    %al,(%rbx)
   1bee4:	48 89 d8             	mov    %rbx,%rax
   1bee7:	48 83 c4 38          	add    $0x38,%rsp
   1beeb:	5b                   	pop    %rbx
   1beec:	41 5c                	pop    %r12
   1beee:	41 5d                	pop    %r13
   1bef0:	41 5e                	pop    %r14
   1bef2:	41 5f                	pop    %r15
   1bef4:	5d                   	pop    %rbp
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

hyperinterval::ieee::Format::div:
   1bf00:	55                   	push   %rbp
   1bf01:	41 57                	push   %r15
   1bf03:	41 56                	push   %r14
   1bf05:	41 55                	push   %r13
   1bf07:	41 54                	push   %r12
   1bf09:	53                   	push   %rbx
   1bf0a:	48 83 ec 48          	sub    $0x48,%rsp
   1bf0e:	4d 85 c0             	test   %r8,%r8
   1bf11:	0f 84 cb 00 00 00    	je     1bfe2 <hyperinterval::ieee::Format::div+0xe2>
   1bf17:	48 85 c9             	test   %rcx,%rcx
   1bf1a:	0f 84 cc 00 00 00    	je     1bfec <hyperinterval::ieee::Format::div+0xec>
   1bf20:	41 be 40 00 00 00    	mov    $0x40,%r14d
   1bf26:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1bf2b:	49 89 cd             	mov    %rcx,%r13
   1bf2e:	49 21 d5             	and    %rdx,%r13
   1bf31:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
   1bf36:	41 83 e6 3f          	and    $0x3f,%r14d
   1bf3a:	48 89 c8             	mov    %rcx,%rax
   1bf3d:	44 89 f1             	mov    %r14d,%ecx
   1bf40:	49 d3 ed             	shr    %cl,%r13
   1bf43:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1bf49:	49 d3 e2             	shl    %cl,%r10
   1bf4c:	4d 8d 5a ff          	lea    -0x1(%r10),%r11
   1bf50:	4c 89 db             	mov    %r11,%rbx
   1bf53:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1bf58:	48 21 c3             	and    %rax,%rbx
   1bf5b:	4d 85 ed             	test   %r13,%r13
   1bf5e:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1bf64:	44 89 e8             	mov    %r13d,%eax
   1bf67:	41 0f 44 c1          	cmove  %r9d,%eax
   1bf6b:	4d 0f 45 ea          	cmovne %r10,%r13
   1bf6f:	4c 89 c5             	mov    %r8,%rbp
   1bf72:	48 21 d5             	and    %rdx,%rbp
   1bf75:	48 d3 ea             	shr    %cl,%rdx
   1bf78:	48 d3 ed             	shr    %cl,%rbp
   1bf7b:	49 09 dd             	or     %rbx,%r13
   1bf7e:	48 d1 ea             	shr    $1,%rdx
   1bf81:	4d 21 c3             	and    %r8,%r11
   1bf84:	48 85 ed             	test   %rbp,%rbp
   1bf87:	44 0f 45 cd          	cmovne %ebp,%r9d
   1bf8b:	49 0f 45 ea          	cmovne %r10,%rbp
   1bf8f:	4c 09 dd             	or     %r11,%rbp
   1bf92:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1bf97:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1bf9d:	4c 0f bd d5          	bsr    %rbp,%r10
   1bfa1:	41 83 f2 3f          	xor    $0x3f,%r10d
   1bfa5:	41 83 c2 40          	add    $0x40,%r10d
   1bfa9:	49 0f bd cd          	bsr    %r13,%rcx
   1bfad:	83 f1 3f             	xor    $0x3f,%ecx
   1bfb0:	45 89 d7             	mov    %r10d,%r15d
   1bfb3:	41 29 cf             	sub    %ecx,%r15d
   1bfb6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1bfba:	78 3f                	js     1bffb <hyperinterval::ieee::Format::div+0xfb>
   1bfbc:	45 31 db             	xor    %r11d,%r11d
   1bfbf:	44 89 f9             	mov    %r15d,%ecx
   1bfc2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1bfc6:	31 db                	xor    %ebx,%ebx
   1bfc8:	49 89 ec             	mov    %rbp,%r12
   1bfcb:	49 d3 e4             	shl    %cl,%r12
   1bfce:	41 f6 c7 40          	test   $0x40,%r15b
   1bfd2:	4d 0f 45 dc          	cmovne %r12,%r11
   1bfd6:	4c 0f 45 e3          	cmovne %rbx,%r12
   1bfda:	4d 39 e5             	cmp    %r12,%r13
   1bfdd:	4c 19 db             	sbb    %r11,%rbx
   1bfe0:	eb 3f                	jmp    1c021 <hyperinterval::ieee::Format::div+0x121>
   1bfe2:	66 c7 07 01 06       	movw   $0x601,(%rdi)
   1bfe7:	e9 24 03 00 00       	jmp    1c310 <hyperinterval::ieee::Format::div+0x410>
   1bfec:	c6 07 00             	movb   $0x0,(%rdi)
   1bfef:	0f 57 c0             	xorps  %xmm0,%xmm0
   1bff2:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1bff6:	e9 15 03 00 00       	jmp    1c310 <hyperinterval::ieee::Format::div+0x410>
   1bffb:	44 89 f9             	mov    %r15d,%ecx
   1bffe:	f6 d9                	neg    %cl
   1c000:	45 31 db             	xor    %r11d,%r11d
   1c003:	4d 0f a5 eb          	shld   %cl,%r13,%r11
   1c007:	31 db                	xor    %ebx,%ebx
   1c009:	4d 89 ec             	mov    %r13,%r12
   1c00c:	49 d3 e4             	shl    %cl,%r12
   1c00f:	f6 c1 40             	test   $0x40,%cl
   1c012:	4d 0f 45 dc          	cmovne %r12,%r11
   1c016:	4c 0f 45 e3          	cmovne %rbx,%r12
   1c01a:	49 39 ec             	cmp    %rbp,%r12
   1c01d:	49 83 db 00          	sbb    $0x0,%r11
   1c021:	0f 92 c1             	setb   %cl
   1c024:	44 29 c8             	sub    %r9d,%eax
   1c027:	41 01 c7             	add    %eax,%r15d
   1c02a:	0f b6 c9             	movzbl %cl,%ecx
   1c02d:	41 29 cf             	sub    %ecx,%r15d
   1c030:	41 39 d7             	cmp    %edx,%r15d
   1c033:	0f 8f 19 02 00 00    	jg     1c252 <hyperinterval::ieee::Format::div+0x352>
   1c039:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
   1c03e:	46 8d 1c 0a          	lea    (%rdx,%r9,1),%r11d
   1c042:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c047:	4c 89 5c 24 18       	mov    %r11,0x18(%rsp)
   1c04c:	44 29 d9             	sub    %r11d,%ecx
   1c04f:	45 29 cf             	sub    %r9d,%r15d
   1c052:	41 39 cf             	cmp    %ecx,%r15d
   1c055:	44 0f 4e f9          	cmovle %ecx,%r15d
   1c059:	44 29 f8             	sub    %r15d,%eax
   1c05c:	78 61                	js     1c0bf <hyperinterval::ieee::Format::div+0x1bf>
   1c05e:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1c063:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1c068:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1c06d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1c072:	48 85 ed             	test   %rbp,%rbp
   1c075:	0f 84 a7 02 00 00    	je     1c322 <hyperinterval::ieee::Format::div+0x422>
   1c07b:	45 31 e4             	xor    %r12d,%r12d
   1c07e:	89 c1                	mov    %eax,%ecx
   1c080:	4d 0f a5 ec          	shld   %cl,%r13,%r12
   1c084:	31 d2                	xor    %edx,%edx
   1c086:	49 d3 e5             	shl    %cl,%r13
   1c089:	a8 40                	test   $0x40,%al
   1c08b:	4d 0f 45 e5          	cmovne %r13,%r12
   1c08f:	4c 0f 45 ea          	cmovne %rdx,%r13
   1c093:	4c 89 ef             	mov    %r13,%rdi
   1c096:	4c 89 e6             	mov    %r12,%rsi
   1c099:	48 89 ea             	mov    %rbp,%rdx
   1c09c:	31 c9                	xor    %ecx,%ecx
   1c09e:	ff 15 e4 35 04 00    	call   *0x435e4(%rip)        # 5f688 <_DYNAMIC+0x448>
   1c0a4:	49 89 c2             	mov    %rax,%r10
   1c0a7:	49 89 d1             	mov    %rdx,%r9
   1c0aa:	48 89 d1             	mov    %rdx,%rcx
   1c0ad:	48 0f af cd          	imul   %rbp,%rcx
   1c0b1:	48 f7 e5             	mul    %rbp
   1c0b4:	48 01 ca             	add    %rcx,%rdx
   1c0b7:	49 29 c5             	sub    %rax,%r13
   1c0ba:	49 19 d4             	sbb    %rdx,%r12
   1c0bd:	eb 79                	jmp    1c138 <hyperinterval::ieee::Format::div+0x238>
   1c0bf:	f7 d8                	neg    %eax
   1c0c1:	44 39 d0             	cmp    %r10d,%eax
   1c0c4:	7e 07                	jle    1c0cd <hyperinterval::ieee::Format::div+0x1cd>
   1c0c6:	b3 01                	mov    $0x1,%bl
   1c0c8:	e9 df 00 00 00       	jmp    1c1ac <hyperinterval::ieee::Format::div+0x2ac>
   1c0cd:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1c0d2:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1c0d7:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   1c0dc:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1c0e1:	31 db                	xor    %ebx,%ebx
   1c0e3:	89 c1                	mov    %eax,%ecx
   1c0e5:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1c0e9:	48 d3 e5             	shl    %cl,%rbp
   1c0ec:	31 c9                	xor    %ecx,%ecx
   1c0ee:	a8 40                	test   $0x40,%al
   1c0f0:	48 0f 45 dd          	cmovne %rbp,%rbx
   1c0f4:	48 0f 45 e9          	cmovne %rcx,%rbp
   1c0f8:	48 89 e8             	mov    %rbp,%rax
   1c0fb:	48 09 d8             	or     %rbx,%rax
   1c0fe:	0f 84 2b 02 00 00    	je     1c32f <hyperinterval::ieee::Format::div+0x42f>
   1c104:	45 31 e4             	xor    %r12d,%r12d
   1c107:	4c 89 ef             	mov    %r13,%rdi
   1c10a:	31 f6                	xor    %esi,%esi
   1c10c:	48 89 ea             	mov    %rbp,%rdx
   1c10f:	48 89 d9             	mov    %rbx,%rcx
   1c112:	ff 15 70 35 04 00    	call   *0x43570(%rip)        # 5f688 <_DYNAMIC+0x448>
   1c118:	49 89 c2             	mov    %rax,%r10
   1c11b:	49 89 d1             	mov    %rdx,%r9
   1c11e:	48 0f af d8          	imul   %rax,%rbx
   1c122:	48 f7 e5             	mul    %rbp
   1c125:	48 01 da             	add    %rbx,%rdx
   1c128:	4c 89 c9             	mov    %r9,%rcx
   1c12b:	48 0f af cd          	imul   %rbp,%rcx
   1c12f:	48 01 d1             	add    %rdx,%rcx
   1c132:	49 29 c5             	sub    %rax,%r13
   1c135:	49 19 cc             	sbb    %rcx,%r12
   1c138:	4d 09 e5             	or     %r12,%r13
   1c13b:	0f 95 c3             	setne  %bl
   1c13e:	4c 89 d0             	mov    %r10,%rax
   1c141:	4c 09 c8             	or     %r9,%rax
   1c144:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
   1c149:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1c14e:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1c153:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
   1c158:	74 52                	je     1c1ac <hyperinterval::ieee::Format::div+0x2ac>
   1c15a:	49 0f bd c1          	bsr    %r9,%rax
   1c15e:	83 f0 3f             	xor    $0x3f,%eax
   1c161:	4d 0f bd da          	bsr    %r10,%r11
   1c165:	41 83 f3 3f          	xor    $0x3f,%r11d
   1c169:	41 83 cb 40          	or     $0x40,%r11d
   1c16d:	4d 85 c9             	test   %r9,%r9
   1c170:	44 0f 45 d8          	cmovne %eax,%r11d
   1c174:	41 83 f3 7f          	xor    $0x7f,%r11d
   1c178:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1c17c:	39 d5                	cmp    %edx,%ebp
   1c17e:	0f 8f ce 00 00 00    	jg     1c252 <hyperinterval::ieee::Format::div+0x352>
   1c184:	b8 01 00 00 00       	mov    $0x1,%eax
   1c189:	29 d0                	sub    %edx,%eax
   1c18b:	39 c5                	cmp    %eax,%ebp
   1c18d:	7d 28                	jge    1c1b7 <hyperinterval::ieee::Format::div+0x2b7>
   1c18f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c194:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1c198:	fe c9                	dec    %cl
   1c19a:	4c 89 d0             	mov    %r10,%rax
   1c19d:	48 d3 e0             	shl    %cl,%rax
   1c1a0:	45 31 db             	xor    %r11d,%r11d
   1c1a3:	f6 c1 40             	test   $0x40,%cl
   1c1a6:	4c 0f 44 d8          	cmove  %rax,%r11
   1c1aa:	eb 6e                	jmp    1c21a <hyperinterval::ieee::Format::div+0x31a>
   1c1ac:	45 31 d2             	xor    %r10d,%r10d
   1c1af:	45 31 c9             	xor    %r9d,%r9d
   1c1b2:	45 31 db             	xor    %r11d,%r11d
   1c1b5:	eb 63                	jmp    1c21a <hyperinterval::ieee::Format::div+0x31a>
   1c1b7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1c1bc:	89 c1                	mov    %eax,%ecx
   1c1be:	44 29 d9             	sub    %r11d,%ecx
   1c1c1:	4d 89 d4             	mov    %r10,%r12
   1c1c4:	49 d3 e4             	shl    %cl,%r12
   1c1c7:	89 c8                	mov    %ecx,%eax
   1c1c9:	f7 d8                	neg    %eax
   1c1cb:	45 31 ed             	xor    %r13d,%r13d
   1c1ce:	f6 c1 40             	test   $0x40,%cl
   1c1d1:	4d 0f 44 ec          	cmove  %r12,%r13
   1c1d5:	4d 89 d4             	mov    %r10,%r12
   1c1d8:	89 c1                	mov    %eax,%ecx
   1c1da:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1c1de:	88 5c 24 0f          	mov    %bl,0xf(%rsp)
   1c1e2:	4c 89 cb             	mov    %r9,%rbx
   1c1e5:	48 d3 eb             	shr    %cl,%rbx
   1c1e8:	a8 40                	test   $0x40,%al
   1c1ea:	49 0f 44 dc          	cmove  %r12,%rbx
   1c1ee:	44 39 5c 24 10       	cmp    %r11d,0x10(%rsp)
   1c1f3:	49 0f 43 dd          	cmovae %r13,%rbx
   1c1f7:	01 d5                	add    %edx,%ebp
   1c1f9:	48 63 c5             	movslq %ebp,%rax
   1c1fc:	44 89 f1             	mov    %r14d,%ecx
   1c1ff:	48 d3 e0             	shl    %cl,%rax
   1c202:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1c209:	49 d3 e3             	shl    %cl,%r11
   1c20c:	49 f7 d3             	not    %r11
   1c20f:	49 21 db             	and    %rbx,%r11
   1c212:	0f b6 5c 24 0f       	movzbl 0xf(%rsp),%ebx
   1c217:	49 09 c3             	or     %rax,%r11
   1c21a:	0f b6 db             	movzbl %bl,%ebx
   1c21d:	4c 01 d3             	add    %r10,%rbx
   1c220:	49 83 d1 00          	adc    $0x0,%r9
   1c224:	48 89 d8             	mov    %rbx,%rax
   1c227:	4c 09 c8             	or     %r9,%rax
   1c22a:	74 30                	je     1c25c <hyperinterval::ieee::Format::div+0x35c>
   1c22c:	49 0f bd c1          	bsr    %r9,%rax
   1c230:	83 f0 3f             	xor    $0x3f,%eax
   1c233:	4c 0f bd d3          	bsr    %rbx,%r10
   1c237:	41 83 f2 3f          	xor    $0x3f,%r10d
   1c23b:	41 83 ca 40          	or     $0x40,%r10d
   1c23f:	4d 85 c9             	test   %r9,%r9
   1c242:	44 0f 45 d0          	cmovne %eax,%r10d
   1c246:	41 83 f2 7f          	xor    $0x7f,%r10d
   1c24a:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1c24e:	39 d5                	cmp    %edx,%ebp
   1c250:	7e 0e                	jle    1c260 <hyperinterval::ieee::Format::div+0x360>
   1c252:	66 c7 07 01 05       	movw   $0x501,(%rdi)
   1c257:	e9 b4 00 00 00       	jmp    1c310 <hyperinterval::ieee::Format::div+0x410>
   1c25c:	31 c0                	xor    %eax,%eax
   1c25e:	eb 76                	jmp    1c2d6 <hyperinterval::ieee::Format::div+0x3d6>
   1c260:	b8 01 00 00 00       	mov    $0x1,%eax
   1c265:	29 d0                	sub    %edx,%eax
   1c267:	39 c5                	cmp    %eax,%ebp
   1c269:	7d 18                	jge    1c283 <hyperinterval::ieee::Format::div+0x383>
   1c26b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   1c270:	44 01 f9             	add    %r15d,%ecx
   1c273:	fe c9                	dec    %cl
   1c275:	48 d3 e3             	shl    %cl,%rbx
   1c278:	31 c0                	xor    %eax,%eax
   1c27a:	f6 c1 40             	test   $0x40,%cl
   1c27d:	48 0f 44 c3          	cmove  %rbx,%rax
   1c281:	eb 53                	jmp    1c2d6 <hyperinterval::ieee::Format::div+0x3d6>
   1c283:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1c288:	44 89 e9             	mov    %r13d,%ecx
   1c28b:	44 29 d1             	sub    %r10d,%ecx
   1c28e:	89 c8                	mov    %ecx,%eax
   1c290:	f7 d8                	neg    %eax
   1c292:	49 89 df             	mov    %rbx,%r15
   1c295:	49 d3 e7             	shl    %cl,%r15
   1c298:	45 31 e4             	xor    %r12d,%r12d
   1c29b:	f6 c1 40             	test   $0x40,%cl
   1c29e:	4d 0f 44 e7          	cmove  %r15,%r12
   1c2a2:	89 c1                	mov    %eax,%ecx
   1c2a4:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1c2a8:	49 d3 e9             	shr    %cl,%r9
   1c2ab:	a8 40                	test   $0x40,%al
   1c2ad:	4c 0f 44 cb          	cmove  %rbx,%r9
   1c2b1:	45 39 d5             	cmp    %r10d,%r13d
   1c2b4:	4d 0f 43 cc          	cmovae %r12,%r9
   1c2b8:	01 d5                	add    %edx,%ebp
   1c2ba:	48 63 d5             	movslq %ebp,%rdx
   1c2bd:	44 89 f1             	mov    %r14d,%ecx
   1c2c0:	48 d3 e2             	shl    %cl,%rdx
   1c2c3:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1c2ca:	48 d3 e0             	shl    %cl,%rax
   1c2cd:	48 f7 d0             	not    %rax
   1c2d0:	4c 21 c8             	and    %r9,%rax
   1c2d3:	48 09 d0             	or     %rdx,%rax
   1c2d6:	48 85 74 24 40       	test   %rsi,0x40(%rsp)
   1c2db:	0f 95 c1             	setne  %cl
   1c2de:	49 85 f0             	test   %rsi,%r8
   1c2e1:	0f 94 c2             	sete   %dl
   1c2e4:	30 ca                	xor    %cl,%dl
   1c2e6:	75 1d                	jne    1c305 <hyperinterval::ieee::Format::div+0x405>
   1c2e8:	48 89 c1             	mov    %rax,%rcx
   1c2eb:	48 31 f1             	xor    %rsi,%rcx
   1c2ee:	48 85 c0             	test   %rax,%rax
   1c2f1:	48 0f 44 c8          	cmove  %rax,%rcx
   1c2f5:	4c 31 de             	xor    %r11,%rsi
   1c2f8:	4d 85 db             	test   %r11,%r11
   1c2fb:	49 0f 44 f3          	cmove  %r11,%rsi
   1c2ff:	48 89 f0             	mov    %rsi,%rax
   1c302:	49 89 cb             	mov    %rcx,%r11
   1c305:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1c309:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1c30d:	c6 07 00             	movb   $0x0,(%rdi)
   1c310:	48 89 f8             	mov    %rdi,%rax
   1c313:	48 83 c4 48          	add    $0x48,%rsp
   1c317:	5b                   	pop    %rbx
   1c318:	41 5c                	pop    %r12
   1c31a:	41 5d                	pop    %r13
   1c31c:	41 5e                	pop    %r14
   1c31e:	41 5f                	pop    %r15
   1c320:	5d                   	pop    %rbp
   1c321:	c3                   	ret
   1c322:	48 8d 3d 97 10 04 00 	lea    0x41097(%rip),%rdi        # 5d3c0 <__frame_dummy_init_array_entry+0x1f0>
   1c329:	ff 15 61 33 04 00    	call   *0x43361(%rip)        # 5f690 <_DYNAMIC+0x450>
   1c32f:	48 8d 3d 72 10 04 00 	lea    0x41072(%rip),%rdi        # 5d3a8 <__frame_dummy_init_array_entry+0x1d8>
   1c336:	ff 15 54 33 04 00    	call   *0x43354(%rip)        # 5f690 <_DYNAMIC+0x450>
   1c33c:	cc                   	int3
   1c33d:	cc                   	int3
   1c33e:	cc                   	int3
   1c33f:	cc                   	int3

hyperinterval::ieee::Format::mul:
   1c340:	55                   	push   %rbp
   1c341:	41 57                	push   %r15
   1c343:	41 56                	push   %r14
   1c345:	41 54                	push   %r12
   1c347:	53                   	push   %rbx
   1c348:	48 83 ec 20          	sub    $0x20,%rsp
   1c34c:	48 89 c8             	mov    %rcx,%rax
   1c34f:	49 89 d1             	mov    %rdx,%r9
   1c352:	b9 40 00 00 00       	mov    $0x40,%ecx
   1c357:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1c35c:	48 89 c2             	mov    %rax,%rdx
   1c35f:	4c 21 ca             	and    %r9,%rdx
   1c362:	48 d3 ea             	shr    %cl,%rdx
   1c365:	41 be 01 00 00 00    	mov    $0x1,%r14d
   1c36b:	49 d3 e6             	shl    %cl,%r14
   1c36e:	4d 8d 66 ff          	lea    -0x1(%r14),%r12
   1c372:	4c 89 e3             	mov    %r12,%rbx
   1c375:	48 21 c3             	and    %rax,%rbx
   1c378:	48 85 d2             	test   %rdx,%rdx
   1c37b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1c381:	41 89 d3             	mov    %edx,%r11d
   1c384:	45 0f 44 da          	cmove  %r10d,%r11d
   1c388:	49 0f 45 d6          	cmovne %r14,%rdx
   1c38c:	48 09 da             	or     %rbx,%rdx
   1c38f:	4d 89 cf             	mov    %r9,%r15
   1c392:	49 d3 ef             	shr    %cl,%r15
   1c395:	48 85 f0             	test   %rsi,%rax
   1c398:	40 0f 95 c5          	setne  %bpl
   1c39c:	4c 89 c0             	mov    %r8,%rax
   1c39f:	4c 21 c8             	and    %r9,%rax
   1c3a2:	48 d3 e8             	shr    %cl,%rax
   1c3a5:	4d 21 c4             	and    %r8,%r12
   1c3a8:	48 85 c0             	test   %rax,%rax
   1c3ab:	44 0f 45 d0          	cmovne %eax,%r10d
   1c3af:	48 89 fb             	mov    %rdi,%rbx
   1c3b2:	49 0f 45 c6          	cmovne %r14,%rax
   1c3b6:	4c 09 e0             	or     %r12,%rax
   1c3b9:	49 85 f0             	test   %rsi,%r8
   1c3bc:	40 0f 95 c7          	setne  %dil
   1c3c0:	40 30 ef             	xor    %bpl,%dil
   1c3c3:	48 f7 e2             	mul    %rdx
   1c3c6:	45 01 da             	add    %r11d,%r10d
   1c3c9:	41 8d 0c 4f          	lea    (%r15,%rcx,2),%ecx
   1c3cd:	83 e1 fe             	and    $0xfffffffe,%ecx
   1c3d0:	41 29 ca             	sub    %ecx,%r10d
   1c3d3:	40 88 7c 24 14       	mov    %dil,0x14(%rsp)
   1c3d8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c3dd:	48 89 04 24          	mov    %rax,(%rsp)
   1c3e1:	44 89 54 24 10       	mov    %r10d,0x10(%rsp)
   1c3e6:	48 89 e1             	mov    %rsp,%rcx
   1c3e9:	48 89 df             	mov    %rbx,%rdi
   1c3ec:	4c 89 ca             	mov    %r9,%rdx
   1c3ef:	e8 ac 0a 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1c3f4:	48 89 d8             	mov    %rbx,%rax
   1c3f7:	48 83 c4 20          	add    $0x20,%rsp
   1c3fb:	5b                   	pop    %rbx
   1c3fc:	41 5c                	pop    %r12
   1c3fe:	41 5e                	pop    %r14
   1c400:	41 5f                	pop    %r15
   1c402:	5d                   	pop    %rbp
   1c403:	c3                   	ret
   1c404:	cc                   	int3
   1c405:	cc                   	int3
   1c406:	cc                   	int3
   1c407:	cc                   	int3
   1c408:	cc                   	int3
   1c409:	cc                   	int3
   1c40a:	cc                   	int3
   1c40b:	cc                   	int3
   1c40c:	cc                   	int3
   1c40d:	cc                   	int3
   1c40e:	cc                   	int3
   1c40f:	cc                   	int3

hyperinterval::ieee::Format::sqrt:
   1c410:	55                   	push   %rbp
   1c411:	41 57                	push   %r15
   1c413:	41 56                	push   %r14
   1c415:	41 55                	push   %r13
   1c417:	41 54                	push   %r12
   1c419:	53                   	push   %rbx
   1c41a:	48 83 ec 38          	sub    $0x38,%rsp
   1c41e:	49 89 c8             	mov    %rcx,%r8
   1c421:	49 89 d6             	mov    %rdx,%r14
   1c424:	41 bc 40 00 00 00    	mov    $0x40,%r12d
   1c42a:	f3 4c 0f bc e2       	tzcnt  %rdx,%r12
   1c42f:	48 89 ca             	mov    %rcx,%rdx
   1c432:	4c 21 f2             	and    %r14,%rdx
   1c435:	45 89 e7             	mov    %r12d,%r15d
   1c438:	41 83 e7 3f          	and    $0x3f,%r15d
   1c43c:	44 89 f9             	mov    %r15d,%ecx
   1c43f:	48 d3 ea             	shr    %cl,%rdx
   1c442:	be 01 00 00 00       	mov    $0x1,%esi
   1c447:	48 d3 e6             	shl    %cl,%rsi
   1c44a:	48 89 f8             	mov    %rdi,%rax
   1c44d:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1c451:	4c 21 c7             	and    %r8,%rdi
   1c454:	48 85 d2             	test   %rdx,%rdx
   1c457:	48 0f 44 f2          	cmove  %rdx,%rsi
   1c45b:	49 d3 ee             	shr    %cl,%r14
   1c45e:	48 09 fe             	or     %rdi,%rsi
   1c461:	0f 84 a0 00 00 00    	je     1c507 <hyperinterval::ieee::Format::sqrt+0xf7>
   1c467:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1c46c:	49 d1 ee             	shr    $1,%r14
   1c46f:	48 85 d2             	test   %rdx,%rdx
   1c472:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c477:	0f 45 ca             	cmovne %edx,%ecx
   1c47a:	44 29 f1             	sub    %r14d,%ecx
   1c47d:	44 29 e1             	sub    %r12d,%ecx
   1c480:	48 0f bd ee          	bsr    %rsi,%rbp
   1c484:	83 f5 3f             	xor    $0x3f,%ebp
   1c487:	83 cd 40             	or     $0x40,%ebp
   1c48a:	83 f5 7f             	xor    $0x7f,%ebp
   1c48d:	01 cd                	add    %ecx,%ebp
   1c48f:	d1 fd                	sar    $1,%ebp
   1c491:	41 89 ed             	mov    %ebp,%r13d
   1c494:	45 29 e5             	sub    %r12d,%r13d
   1c497:	44 29 e9             	sub    %r13d,%ecx
   1c49a:	44 29 e9             	sub    %r13d,%ecx
   1c49d:	31 d2                	xor    %edx,%edx
   1c49f:	48 0f a5 f2          	shld   %cl,%rsi,%rdx
   1c4a3:	31 db                	xor    %ebx,%ebx
   1c4a5:	48 d3 e6             	shl    %cl,%rsi
   1c4a8:	f6 c1 40             	test   $0x40,%cl
   1c4ab:	48 0f 45 d6          	cmovne %rsi,%rdx
   1c4af:	48 0f 45 f3          	cmovne %rbx,%rsi
   1c4b3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c4b8:	e8 f3 0c 00 00       	call   1d1b0 <hyperinterval::sqrt::integer_sqrt_bounds>
   1c4bd:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
   1c4c2:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
   1c4c7:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1c4cc:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1c4d1:	4c 89 c0             	mov    %r8,%rax
   1c4d4:	48 09 f8             	or     %rdi,%rax
   1c4d7:	74 59                	je     1c532 <hyperinterval::ieee::Format::sqrt+0x122>
   1c4d9:	48 0f bd c7          	bsr    %rdi,%rax
   1c4dd:	83 f0 3f             	xor    $0x3f,%eax
   1c4e0:	4d 0f bd c8          	bsr    %r8,%r9
   1c4e4:	41 83 f1 3f          	xor    $0x3f,%r9d
   1c4e8:	41 83 c9 40          	or     $0x40,%r9d
   1c4ec:	48 85 ff             	test   %rdi,%rdi
   1c4ef:	44 0f 45 c8          	cmovne %eax,%r9d
   1c4f3:	41 83 f1 7f          	xor    $0x7f,%r9d
   1c4f7:	47 8d 14 29          	lea    (%r9,%r13,1),%r10d
   1c4fb:	45 39 f2             	cmp    %r14d,%r10d
   1c4fe:	7e 13                	jle    1c513 <hyperinterval::ieee::Format::sqrt+0x103>
   1c500:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c505:	eb 5e                	jmp    1c565 <hyperinterval::ieee::Format::sqrt+0x155>
   1c507:	0f 57 c0             	xorps  %xmm0,%xmm0
   1c50a:	0f 11 40 08          	movups %xmm0,0x8(%rax)
   1c50e:	e9 43 01 00 00       	jmp    1c656 <hyperinterval::ieee::Format::sqrt+0x246>
   1c513:	b8 01 00 00 00       	mov    $0x1,%eax
   1c518:	44 29 f0             	sub    %r14d,%eax
   1c51b:	41 39 c2             	cmp    %eax,%r10d
   1c51e:	7d 78                	jge    1c598 <hyperinterval::ieee::Format::sqrt+0x188>
   1c520:	41 8d 0c 2e          	lea    (%r14,%rbp,1),%ecx
   1c524:	fe c9                	dec    %cl
   1c526:	49 d3 e0             	shl    %cl,%r8
   1c529:	31 db                	xor    %ebx,%ebx
   1c52b:	f6 c1 40             	test   $0x40,%cl
   1c52e:	49 0f 44 d8          	cmove  %r8,%rbx
   1c532:	48 89 f0             	mov    %rsi,%rax
   1c535:	48 09 d0             	or     %rdx,%rax
   1c538:	0f 84 b4 00 00 00    	je     1c5f2 <hyperinterval::ieee::Format::sqrt+0x1e2>
   1c53e:	48 0f bd c2          	bsr    %rdx,%rax
   1c542:	83 f0 3f             	xor    $0x3f,%eax
   1c545:	48 0f bd fe          	bsr    %rsi,%rdi
   1c549:	83 f7 3f             	xor    $0x3f,%edi
   1c54c:	83 cf 40             	or     $0x40,%edi
   1c54f:	48 85 d2             	test   %rdx,%rdx
   1c552:	0f 45 f8             	cmovne %eax,%edi
   1c555:	83 f7 7f             	xor    $0x7f,%edi
   1c558:	41 01 fd             	add    %edi,%r13d
   1c55b:	45 39 f5             	cmp    %r14d,%r13d
   1c55e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c563:	7e 0b                	jle    1c570 <hyperinterval::ieee::Format::sqrt+0x160>
   1c565:	c6 40 01 05          	movb   $0x5,0x1(%rax)
   1c569:	b1 01                	mov    $0x1,%cl
   1c56b:	e9 e8 00 00 00       	jmp    1c658 <hyperinterval::ieee::Format::sqrt+0x248>
   1c570:	b9 01 00 00 00       	mov    $0x1,%ecx
   1c575:	44 29 f1             	sub    %r14d,%ecx
   1c578:	41 39 cd             	cmp    %ecx,%r13d
   1c57b:	7d 7e                	jge    1c5fb <hyperinterval::ieee::Format::sqrt+0x1eb>
   1c57d:	41 01 ee             	add    %ebp,%r14d
   1c580:	41 fe ce             	dec    %r14b
   1c583:	44 89 f1             	mov    %r14d,%ecx
   1c586:	48 d3 e6             	shl    %cl,%rsi
   1c589:	31 ff                	xor    %edi,%edi
   1c58b:	41 f6 c6 40          	test   $0x40,%r14b
   1c58f:	48 0f 44 fe          	cmove  %rsi,%rdi
   1c593:	e9 b6 00 00 00       	jmp    1c64e <hyperinterval::ieee::Format::sqrt+0x23e>
   1c598:	44 89 e1             	mov    %r12d,%ecx
   1c59b:	44 29 c9             	sub    %r9d,%ecx
   1c59e:	89 c8                	mov    %ecx,%eax
   1c5a0:	f7 d8                	neg    %eax
   1c5a2:	4d 89 c3             	mov    %r8,%r11
   1c5a5:	49 d3 e3             	shl    %cl,%r11
   1c5a8:	31 db                	xor    %ebx,%ebx
   1c5aa:	f6 c1 40             	test   $0x40,%cl
   1c5ad:	49 0f 44 db          	cmove  %r11,%rbx
   1c5b1:	89 c1                	mov    %eax,%ecx
   1c5b3:	49 0f ad f8          	shrd   %cl,%rdi,%r8
   1c5b7:	48 d3 ef             	shr    %cl,%rdi
   1c5ba:	a8 40                	test   $0x40,%al
   1c5bc:	49 0f 44 f8          	cmove  %r8,%rdi
   1c5c0:	45 39 cc             	cmp    %r9d,%r12d
   1c5c3:	48 0f 43 fb          	cmovae %rbx,%rdi
   1c5c7:	45 01 f2             	add    %r14d,%r10d
   1c5ca:	49 63 c2             	movslq %r10d,%rax
   1c5cd:	44 89 f9             	mov    %r15d,%ecx
   1c5d0:	48 d3 e0             	shl    %cl,%rax
   1c5d3:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1c5da:	48 d3 e3             	shl    %cl,%rbx
   1c5dd:	48 f7 d3             	not    %rbx
   1c5e0:	48 21 fb             	and    %rdi,%rbx
   1c5e3:	48 09 c3             	or     %rax,%rbx
   1c5e6:	48 89 f0             	mov    %rsi,%rax
   1c5e9:	48 09 d0             	or     %rdx,%rax
   1c5ec:	0f 85 4c ff ff ff    	jne    1c53e <hyperinterval::ieee::Format::sqrt+0x12e>
   1c5f2:	31 ff                	xor    %edi,%edi
   1c5f4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c5f9:	eb 53                	jmp    1c64e <hyperinterval::ieee::Format::sqrt+0x23e>
   1c5fb:	44 89 e1             	mov    %r12d,%ecx
   1c5fe:	29 f9                	sub    %edi,%ecx
   1c600:	41 89 ca             	mov    %ecx,%r10d
   1c603:	41 f7 da             	neg    %r10d
   1c606:	49 89 f0             	mov    %rsi,%r8
   1c609:	49 d3 e0             	shl    %cl,%r8
   1c60c:	45 31 c9             	xor    %r9d,%r9d
   1c60f:	f6 c1 40             	test   $0x40,%cl
   1c612:	4d 0f 44 c8          	cmove  %r8,%r9
   1c616:	44 89 d1             	mov    %r10d,%ecx
   1c619:	48 0f ad d6          	shrd   %cl,%rdx,%rsi
   1c61d:	48 d3 ea             	shr    %cl,%rdx
   1c620:	41 f6 c2 40          	test   $0x40,%r10b
   1c624:	48 0f 44 d6          	cmove  %rsi,%rdx
   1c628:	41 39 fc             	cmp    %edi,%r12d
   1c62b:	49 0f 43 d1          	cmovae %r9,%rdx
   1c62f:	45 01 f5             	add    %r14d,%r13d
   1c632:	49 63 f5             	movslq %r13d,%rsi
   1c635:	44 89 f9             	mov    %r15d,%ecx
   1c638:	48 d3 e6             	shl    %cl,%rsi
   1c63b:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1c642:	48 d3 e7             	shl    %cl,%rdi
   1c645:	48 f7 d7             	not    %rdi
   1c648:	48 21 d7             	and    %rdx,%rdi
   1c64b:	48 09 f7             	or     %rsi,%rdi
   1c64e:	48 89 58 08          	mov    %rbx,0x8(%rax)
   1c652:	48 89 78 10          	mov    %rdi,0x10(%rax)
   1c656:	31 c9                	xor    %ecx,%ecx
   1c658:	88 08                	mov    %cl,(%rax)
   1c65a:	48 83 c4 38          	add    $0x38,%rsp
   1c65e:	5b                   	pop    %rbx
   1c65f:	41 5c                	pop    %r12
   1c661:	41 5d                	pop    %r13
   1c663:	41 5e                	pop    %r14
   1c665:	41 5f                	pop    %r15
   1c667:	5d                   	pop    %rbp
   1c668:	c3                   	ret
   1c669:	cc                   	int3
   1c66a:	cc                   	int3
   1c66b:	cc                   	int3
   1c66c:	cc                   	int3
   1c66d:	cc                   	int3
   1c66e:	cc                   	int3
   1c66f:	cc                   	int3

hyperinterval::ieee::Format::power:
   1c670:	55                   	push   %rbp
   1c671:	41 57                	push   %r15
   1c673:	41 56                	push   %r14
   1c675:	41 55                	push   %r13
   1c677:	41 54                	push   %r12
   1c679:	53                   	push   %rbx
   1c67a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1c681:	49 89 cb             	mov    %rcx,%r11
   1c684:	49 89 d6             	mov    %rdx,%r14
   1c687:	48 85 f1             	test   %rsi,%rcx
   1c68a:	41 0f 95 c1          	setne  %r9b
   1c68e:	b8 40 00 00 00       	mov    $0x40,%eax
   1c693:	f3 48 0f bc c2       	tzcnt  %rdx,%rax
   1c698:	41 89 c2             	mov    %eax,%r10d
   1c69b:	41 83 e2 3f          	and    $0x3f,%r10d
   1c69f:	44 89 d1             	mov    %r10d,%ecx
   1c6a2:	48 d3 ea             	shr    %cl,%rdx
   1c6a5:	48 89 d1             	mov    %rdx,%rcx
   1c6a8:	48 d1 e9             	shr    $1,%rcx
   1c6ab:	48 63 d9             	movslq %ecx,%rbx
   1c6ae:	44 89 d1             	mov    %r10d,%ecx
   1c6b1:	48 d3 e3             	shl    %cl,%rbx
   1c6b4:	45 85 c0             	test   %r8d,%r8d
   1c6b7:	0f 84 46 03 00 00    	je     1ca03 <hyperinterval::ieee::Format::power+0x393>
   1c6bd:	44 88 4c 24 03       	mov    %r9b,0x3(%rsp)
   1c6c2:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
   1c6c7:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1c6cd:	44 89 d1             	mov    %r10d,%ecx
   1c6d0:	49 d3 e1             	shl    %cl,%r9
   1c6d3:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
   1c6d7:	49 21 cb             	and    %rcx,%r11
   1c6da:	48 89 d9             	mov    %rbx,%rcx
   1c6dd:	4d 8d 79 ff          	lea    -0x1(%r9),%r15
   1c6e1:	8d 2c 42             	lea    (%rdx,%rax,2),%ebp
   1c6e4:	83 e5 fe             	and    $0xfffffffe,%ebp
   1c6e7:	ba 02 00 00 00       	mov    $0x2,%edx
   1c6ec:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1c6f1:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1c6f6:	44 89 44 24 68       	mov    %r8d,0x68(%rsp)
   1c6fb:	44 89 c3             	mov    %r8d,%ebx
   1c6fe:	4c 89 5c 24 58       	mov    %r11,0x58(%rsp)
   1c703:	4c 89 5c 24 60       	mov    %r11,0x60(%rsp)
   1c708:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
   1c70d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1c712:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1c719:	00 
   1c71a:	4c 89 54 24 78       	mov    %r10,0x78(%rsp)
   1c71f:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   1c724:	89 6c 24 6c          	mov    %ebp,0x6c(%rsp)
   1c728:	f6 c3 01             	test   $0x1,%bl
   1c72b:	0f 84 a4 01 00 00    	je     1c8d5 <hyperinterval::ieee::Format::power+0x265>
   1c731:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1c738:	0f 1f 84 00 00 00 00 
   1c73f:	00 
   1c740:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1c744:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1c749:	48 89 d0             	mov    %rdx,%rax
   1c74c:	4c 21 f0             	and    %r14,%rax
   1c74f:	44 89 d1             	mov    %r10d,%ecx
   1c752:	48 d3 e8             	shr    %cl,%rax
   1c755:	48 89 d1             	mov    %rdx,%rcx
   1c758:	4c 21 f9             	and    %r15,%rcx
   1c75b:	48 85 c0             	test   %rax,%rax
   1c75e:	41 89 c3             	mov    %eax,%r11d
   1c761:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c767:	45 0f 44 d8          	cmove  %r8d,%r11d
   1c76b:	49 0f 45 c1          	cmovne %r9,%rax
   1c76f:	48 09 c8             	or     %rcx,%rax
   1c772:	48 85 f2             	test   %rsi,%rdx
   1c775:	0f 95 44 24 08       	setne  0x8(%rsp)
   1c77a:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
   1c77f:	4c 89 eb             	mov    %r13,%rbx
   1c782:	4c 21 f3             	and    %r14,%rbx
   1c785:	44 89 d1             	mov    %r10d,%ecx
   1c788:	48 d3 eb             	shr    %cl,%rbx
   1c78b:	4c 89 e9             	mov    %r13,%rcx
   1c78e:	4c 21 f9             	and    %r15,%rcx
   1c791:	48 85 db             	test   %rbx,%rbx
   1c794:	41 89 d8             	mov    %ebx,%r8d
   1c797:	ba 01 00 00 00       	mov    $0x1,%edx
   1c79c:	44 0f 44 c2          	cmove  %edx,%r8d
   1c7a0:	49 0f 45 d9          	cmovne %r9,%rbx
   1c7a4:	48 09 cb             	or     %rcx,%rbx
   1c7a7:	49 85 f5             	test   %rsi,%r13
   1c7aa:	0f 95 c1             	setne  %cl
   1c7ad:	32 4c 24 08          	xor    0x8(%rsp),%cl
   1c7b1:	48 f7 e3             	mul    %rbx
   1c7b4:	41 29 e8             	sub    %ebp,%r8d
   1c7b7:	45 01 d8             	add    %r11d,%r8d
   1c7ba:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1c7be:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c7c3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c7c8:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1c7cd:	4c 89 f2             	mov    %r14,%rdx
   1c7d0:	4c 89 e1             	mov    %r12,%rcx
   1c7d3:	49 89 fd             	mov    %rdi,%r13
   1c7d6:	4d 89 cc             	mov    %r9,%r12
   1c7d9:	48 89 f3             	mov    %rsi,%rbx
   1c7dc:	4c 89 f5             	mov    %r14,%rbp
   1c7df:	4d 89 d6             	mov    %r10,%r14
   1c7e2:	e8 b9 06 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1c7e7:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1c7ec:	0f 85 00 02 00 00    	jne    1c9f2 <hyperinterval::ieee::Format::power+0x382>
   1c7f2:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
   1c7f7:	48 89 d0             	mov    %rdx,%rax
   1c7fa:	48 21 e8             	and    %rbp,%rax
   1c7fd:	44 89 f1             	mov    %r14d,%ecx
   1c800:	48 d3 e8             	shr    %cl,%rax
   1c803:	48 89 d1             	mov    %rdx,%rcx
   1c806:	4c 21 f9             	and    %r15,%rcx
   1c809:	48 85 c0             	test   %rax,%rax
   1c80c:	89 c6                	mov    %eax,%esi
   1c80e:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1c814:	41 0f 44 f2          	cmove  %r10d,%esi
   1c818:	49 0f 45 c4          	cmovne %r12,%rax
   1c81c:	48 09 c8             	or     %rcx,%rax
   1c81f:	48 85 da             	test   %rbx,%rdx
   1c822:	0f 95 c2             	setne  %dl
   1c825:	4c 8b 4c 24 58       	mov    0x58(%rsp),%r9
   1c82a:	4c 89 cf             	mov    %r9,%rdi
   1c82d:	48 21 ef             	and    %rbp,%rdi
   1c830:	44 89 f1             	mov    %r14d,%ecx
   1c833:	48 d3 ef             	shr    %cl,%rdi
   1c836:	4c 89 c9             	mov    %r9,%rcx
   1c839:	4c 21 f9             	and    %r15,%rcx
   1c83c:	48 85 ff             	test   %rdi,%rdi
   1c83f:	41 89 f8             	mov    %edi,%r8d
   1c842:	45 0f 44 c2          	cmove  %r10d,%r8d
   1c846:	49 0f 45 fc          	cmovne %r12,%rdi
   1c84a:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   1c84f:	4c 89 54 24 08       	mov    %r10,0x8(%rsp)
   1c854:	48 09 cf             	or     %rcx,%rdi
   1c857:	49 85 d9             	test   %rbx,%r9
   1c85a:	0f 95 c1             	setne  %cl
   1c85d:	30 d1                	xor    %dl,%cl
   1c85f:	48 f7 e7             	mul    %rdi
   1c862:	4d 89 ef             	mov    %r13,%r15
   1c865:	44 8b 6c 24 6c       	mov    0x6c(%rsp),%r13d
   1c86a:	45 29 e8             	sub    %r13d,%r8d
   1c86d:	41 01 f0             	add    %esi,%r8d
   1c870:	88 4c 24 24          	mov    %cl,0x24(%rsp)
   1c874:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c879:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c87e:	44 89 44 24 20       	mov    %r8d,0x20(%rsp)
   1c883:	4c 89 ff             	mov    %r15,%rdi
   1c886:	48 89 de             	mov    %rbx,%rsi
   1c889:	48 89 ea             	mov    %rbp,%rdx
   1c88c:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1c891:	4c 89 e1             	mov    %r12,%rcx
   1c894:	e8 07 06 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1c899:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1c89e:	0f 84 4e 01 00 00    	je     1c9f2 <hyperinterval::ieee::Format::power+0x382>
   1c8a4:	48 89 de             	mov    %rbx,%rsi
   1c8a7:	49 89 ee             	mov    %rbp,%r14
   1c8aa:	44 89 ed             	mov    %r13d,%ebp
   1c8ad:	4c 89 ff             	mov    %r15,%rdi
   1c8b0:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1c8b5:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1c8ba:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1c8c1:	00 
   1c8c2:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1c8c7:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1c8cc:	ba 02 00 00 00       	mov    $0x2,%edx
   1c8d1:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1c8d5:	d1 eb                	shr    $1,%ebx
   1c8d7:	0f 84 6c 01 00 00    	je     1ca49 <hyperinterval::ieee::Format::power+0x3d9>
   1c8dd:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   1c8e1:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1c8e6:	4c 89 c0             	mov    %r8,%rax
   1c8e9:	4c 21 f0             	and    %r14,%rax
   1c8ec:	44 89 d1             	mov    %r10d,%ecx
   1c8ef:	48 d3 e8             	shr    %cl,%rax
   1c8f2:	4d 21 f8             	and    %r15,%r8
   1c8f5:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1c8f8:	48 85 c0             	test   %rax,%rax
   1c8fb:	49 0f 45 c1          	cmovne %r9,%rax
   1c8ff:	0f 44 ca             	cmove  %edx,%ecx
   1c902:	4c 09 c0             	or     %r8,%rax
   1c905:	48 f7 e0             	mul    %rax
   1c908:	29 e9                	sub    %ebp,%ecx
   1c90a:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1c90f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c914:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c919:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1c91d:	4c 89 f2             	mov    %r14,%rdx
   1c920:	4c 89 e1             	mov    %r12,%rcx
   1c923:	41 89 ed             	mov    %ebp,%r13d
   1c926:	4d 89 cc             	mov    %r9,%r12
   1c929:	4c 89 fb             	mov    %r15,%rbx
   1c92c:	49 89 f7             	mov    %rsi,%r15
   1c92f:	4c 89 f5             	mov    %r14,%rbp
   1c932:	4d 89 d6             	mov    %r10,%r14
   1c935:	e8 66 05 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1c93a:	80 7c 24 30 00       	cmpb   $0x0,0x30(%rsp)
   1c93f:	0f 85 ad 00 00 00    	jne    1c9f2 <hyperinterval::ieee::Format::power+0x382>
   1c945:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1c94a:	48 89 d0             	mov    %rdx,%rax
   1c94d:	48 21 e8             	and    %rbp,%rax
   1c950:	44 89 f1             	mov    %r14d,%ecx
   1c953:	48 d3 e8             	shr    %cl,%rax
   1c956:	48 21 da             	and    %rbx,%rdx
   1c959:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
   1c95c:	48 85 c0             	test   %rax,%rax
   1c95f:	49 0f 45 c4          	cmovne %r12,%rax
   1c963:	be 02 00 00 00       	mov    $0x2,%esi
   1c968:	0f 44 ce             	cmove  %esi,%ecx
   1c96b:	48 09 d0             	or     %rdx,%rax
   1c96e:	48 f7 e0             	mul    %rax
   1c971:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
   1c976:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   1c97b:	44 29 e9             	sub    %r13d,%ecx
   1c97e:	c6 44 24 24 00       	movb   $0x0,0x24(%rsp)
   1c983:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c988:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c98d:	89 4c 24 20          	mov    %ecx,0x20(%rsp)
   1c991:	48 8d 5c 24 30       	lea    0x30(%rsp),%rbx
   1c996:	48 89 df             	mov    %rbx,%rdi
   1c999:	4c 89 fe             	mov    %r15,%rsi
   1c99c:	48 89 ea             	mov    %rbp,%rdx
   1c99f:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
   1c9a4:	4c 89 e1             	mov    %r12,%rcx
   1c9a7:	e8 f4 04 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1c9ac:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1c9b1:	ba 02 00 00 00       	mov    $0x2,%edx
   1c9b6:	74 3a                	je     1c9f2 <hyperinterval::ieee::Format::power+0x382>
   1c9b8:	4c 89 fe             	mov    %r15,%rsi
   1c9bb:	49 89 ee             	mov    %rbp,%r14
   1c9be:	44 89 ed             	mov    %r13d,%ebp
   1c9c1:	48 89 df             	mov    %rbx,%rdi
   1c9c4:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   1c9c9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1c9ce:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1c9d5:	00 
   1c9d6:	4c 8b 54 24 78       	mov    0x78(%rsp),%r10
   1c9db:	4c 8b 7c 24 70       	mov    0x70(%rsp),%r15
   1c9e0:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   1c9e4:	f6 c3 01             	test   $0x1,%bl
   1c9e7:	0f 85 53 fd ff ff    	jne    1c740 <hyperinterval::ieee::Format::power+0xd0>
   1c9ed:	e9 e3 fe ff ff       	jmp    1c8d5 <hyperinterval::ieee::Format::power+0x265>
   1c9f2:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
   1c9f7:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1c9fc:	88 47 01             	mov    %al,0x1(%rdi)
   1c9ff:	b0 01                	mov    $0x1,%al
   1ca01:	eb 2f                	jmp    1ca32 <hyperinterval::ieee::Format::power+0x3c2>
   1ca03:	48 89 d9             	mov    %rbx,%rcx
   1ca06:	45 20 c1             	and    %r8b,%r9b
   1ca09:	74 1d                	je     1ca28 <hyperinterval::ieee::Format::power+0x3b8>
   1ca0b:	48 89 d8             	mov    %rbx,%rax
   1ca0e:	48 31 f0             	xor    %rsi,%rax
   1ca11:	48 85 db             	test   %rbx,%rbx
   1ca14:	48 0f 44 c3          	cmove  %rbx,%rax
   1ca18:	48 31 ce             	xor    %rcx,%rsi
   1ca1b:	48 85 c9             	test   %rcx,%rcx
   1ca1e:	48 0f 44 f1          	cmove  %rcx,%rsi
   1ca22:	48 89 c1             	mov    %rax,%rcx
   1ca25:	48 89 f3             	mov    %rsi,%rbx
   1ca28:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1ca2c:	48 89 5f 10          	mov    %rbx,0x10(%rdi)
   1ca30:	31 c0                	xor    %eax,%eax
   1ca32:	88 07                	mov    %al,(%rdi)
   1ca34:	48 89 f8             	mov    %rdi,%rax
   1ca37:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1ca3e:	5b                   	pop    %rbx
   1ca3f:	41 5c                	pop    %r12
   1ca41:	41 5d                	pop    %r13
   1ca43:	41 5e                	pop    %r14
   1ca45:	41 5f                	pop    %r15
   1ca47:	5d                   	pop    %rbp
   1ca48:	c3                   	ret
   1ca49:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   1ca4e:	44 8b 44 24 68       	mov    0x68(%rsp),%r8d
   1ca53:	44 0f b6 4c 24 03    	movzbl 0x3(%rsp),%r9d
   1ca59:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
   1ca5e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1ca63:	45 20 c1             	and    %r8b,%r9b
   1ca66:	75 a3                	jne    1ca0b <hyperinterval::ieee::Format::power+0x39b>
   1ca68:	eb be                	jmp    1ca28 <hyperinterval::ieee::Format::power+0x3b8>
   1ca6a:	cc                   	int3
   1ca6b:	cc                   	int3
   1ca6c:	cc                   	int3
   1ca6d:	cc                   	int3
   1ca6e:	cc                   	int3
   1ca6f:	cc                   	int3

hyperinterval::ieee::Format::affine:
   1ca70:	55                   	push   %rbp
   1ca71:	41 57                	push   %r15
   1ca73:	41 56                	push   %r14
   1ca75:	41 55                	push   %r13
   1ca77:	41 54                	push   %r12
   1ca79:	53                   	push   %rbx
   1ca7a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1ca81:	48 89 c8             	mov    %rcx,%rax
   1ca84:	49 89 d6             	mov    %rdx,%r14
   1ca87:	b9 40 00 00 00       	mov    $0x40,%ecx
   1ca8c:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1ca91:	48 89 c2             	mov    %rax,%rdx
   1ca94:	4c 21 f2             	and    %r14,%rdx
   1ca97:	48 d3 ea             	shr    %cl,%rdx
   1ca9a:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1caa0:	49 d3 e3             	shl    %cl,%r11
   1caa3:	4d 8d 7b ff          	lea    -0x1(%r11),%r15
   1caa7:	4c 89 fb             	mov    %r15,%rbx
   1caaa:	48 21 c3             	and    %rax,%rbx
   1caad:	48 85 d2             	test   %rdx,%rdx
   1cab0:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1cab6:	89 d5                	mov    %edx,%ebp
   1cab8:	41 0f 44 ea          	cmove  %r10d,%ebp
   1cabc:	48 89 3c 24          	mov    %rdi,(%rsp)
   1cac0:	49 0f 45 d3          	cmovne %r11,%rdx
   1cac4:	4d 89 f5             	mov    %r14,%r13
   1cac7:	49 d3 ed             	shr    %cl,%r13
   1caca:	48 09 da             	or     %rbx,%rdx
   1cacd:	49 d1 ed             	shr    $1,%r13
   1cad0:	41 01 cd             	add    %ecx,%r13d
   1cad3:	44 29 ed             	sub    %r13d,%ebp
   1cad6:	48 85 f0             	test   %rsi,%rax
   1cad9:	0f 95 c3             	setne  %bl
   1cadc:	4c 89 c0             	mov    %r8,%rax
   1cadf:	4c 21 f0             	and    %r14,%rax
   1cae2:	48 d3 e8             	shr    %cl,%rax
   1cae5:	4d 89 fc             	mov    %r15,%r12
   1cae8:	4d 21 c4             	and    %r8,%r12
   1caeb:	48 85 c0             	test   %rax,%rax
   1caee:	89 c7                	mov    %eax,%edi
   1caf0:	41 0f 44 fa          	cmove  %r10d,%edi
   1caf4:	49 0f 45 c3          	cmovne %r11,%rax
   1caf8:	4c 09 e0             	or     %r12,%rax
   1cafb:	44 29 ef             	sub    %r13d,%edi
   1cafe:	49 85 f0             	test   %rsi,%r8
   1cb01:	41 0f 95 c0          	setne  %r8b
   1cb05:	01 ef                	add    %ebp,%edi
   1cb07:	4c 89 f5             	mov    %r14,%rbp
   1cb0a:	4d 89 cc             	mov    %r9,%r12
   1cb0d:	4d 21 f4             	and    %r14,%r12
   1cb10:	49 d3 ec             	shr    %cl,%r12
   1cb13:	41 30 d8             	xor    %bl,%r8b
   1cb16:	48 f7 e2             	mul    %rdx
   1cb19:	4d 21 cf             	and    %r9,%r15
   1cb1c:	4d 85 e4             	test   %r12,%r12
   1cb1f:	45 0f 45 d4          	cmovne %r12d,%r10d
   1cb23:	4d 0f 45 e3          	cmovne %r11,%r12
   1cb27:	4d 09 fc             	or     %r15,%r12
   1cb2a:	45 29 ea             	sub    %r13d,%r10d
   1cb2d:	49 85 f1             	test   %rsi,%r9
   1cb30:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1cb37:	00 
   1cb38:	0f 95 c3             	setne  %bl
   1cb3b:	48 89 c1             	mov    %rax,%rcx
   1cb3e:	48 09 d1             	or     %rdx,%rcx
   1cb41:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1cb46:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1cb4b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1cb50:	89 7c 24 60          	mov    %edi,0x60(%rsp)
   1cb54:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
   1cb59:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1cb60:	00 00 
   1cb62:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1cb69:	00 
   1cb6a:	74 79                	je     1cbe5 <hyperinterval::ieee::Format::affine+0x175>
   1cb6c:	4d 85 e4             	test   %r12,%r12
   1cb6f:	74 7b                	je     1cbec <hyperinterval::ieee::Format::affine+0x17c>
   1cb71:	48 89 6c 24 30       	mov    %rbp,0x30(%rsp)
   1cb76:	48 0f bd ca          	bsr    %rdx,%rcx
   1cb7a:	83 f1 3f             	xor    $0x3f,%ecx
   1cb7d:	4c 0f bd d8          	bsr    %rax,%r11
   1cb81:	41 83 f3 3f          	xor    $0x3f,%r11d
   1cb85:	41 83 cb 40          	or     $0x40,%r11d
   1cb89:	48 85 d2             	test   %rdx,%rdx
   1cb8c:	44 0f 45 d9          	cmovne %ecx,%r11d
   1cb90:	41 83 f3 7f          	xor    $0x7f,%r11d
   1cb94:	41 01 fb             	add    %edi,%r11d
   1cb97:	4d 0f bd fc          	bsr    %r12,%r15
   1cb9b:	41 83 f7 3f          	xor    $0x3f,%r15d
   1cb9f:	41 83 cf 40          	or     $0x40,%r15d
   1cba3:	41 83 f7 7f          	xor    $0x7f,%r15d
   1cba7:	45 01 d7             	add    %r10d,%r15d
   1cbaa:	45 39 df             	cmp    %r11d,%r15d
   1cbad:	45 0f 4e fb          	cmovle %r11d,%r15d
   1cbb1:	41 83 c7 82          	add    $0xffffff82,%r15d
   1cbb5:	44 29 ff             	sub    %r15d,%edi
   1cbb8:	78 4b                	js     1cc05 <hyperinterval::ieee::Format::affine+0x195>
   1cbba:	89 f9                	mov    %edi,%ecx
   1cbbc:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1cbc0:	48 d3 e0             	shl    %cl,%rax
   1cbc3:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1cbca:	00 00 
   1cbcc:	40 f6 c7 40          	test   $0x40,%dil
   1cbd0:	48 0f 45 d0          	cmovne %rax,%rdx
   1cbd4:	bd 00 00 00 00       	mov    $0x0,%ebp
   1cbd9:	48 0f 44 e8          	cmove  %rax,%rbp
   1cbdd:	49 89 d3             	mov    %rdx,%r11
   1cbe0:	e9 9b 00 00 00       	jmp    1cc80 <hyperinterval::ieee::Format::affine+0x210>
   1cbe5:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1cbea:	eb 05                	jmp    1cbf1 <hyperinterval::ieee::Format::affine+0x181>
   1cbec:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1cbf1:	4c 8b 34 24          	mov    (%rsp),%r14
   1cbf5:	4c 89 f7             	mov    %r14,%rdi
   1cbf8:	48 89 ea             	mov    %rbp,%rdx
   1cbfb:	e8 a0 02 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1cc00:	e9 43 02 00 00       	jmp    1ce48 <hyperinterval::ieee::Format::affine+0x3d8>
   1cc05:	f7 df                	neg    %edi
   1cc07:	bd 00 00 00 00       	mov    $0x0,%ebp
   1cc0c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1cc12:	83 ff 7f             	cmp    $0x7f,%edi
   1cc15:	7f 5b                	jg     1cc72 <hyperinterval::ieee::Format::affine+0x202>
   1cc17:	48 89 c5             	mov    %rax,%rbp
   1cc1a:	89 f9                	mov    %edi,%ecx
   1cc1c:	48 0f ad d5          	shrd   %cl,%rdx,%rbp
   1cc20:	49 89 d3             	mov    %rdx,%r11
   1cc23:	49 d3 eb             	shr    %cl,%r11
   1cc26:	41 89 dd             	mov    %ebx,%r13d
   1cc29:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   1cc30:	48 d3 e3             	shl    %cl,%rbx
   1cc33:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1cc3a:	40 f6 c7 40          	test   $0x40,%dil
   1cc3e:	49 0f 45 eb          	cmovne %r11,%rbp
   1cc42:	41 be 00 00 00 00    	mov    $0x0,%r14d
   1cc48:	4d 0f 45 de          	cmovne %r14,%r11
   1cc4c:	48 0f 45 cb          	cmovne %rbx,%rcx
   1cc50:	bf 00 00 00 00       	mov    $0x0,%edi
   1cc55:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1cc5a:	49 0f 45 de          	cmovne %r14,%rbx
   1cc5e:	48 f7 d3             	not    %rbx
   1cc61:	48 f7 d1             	not    %rcx
   1cc64:	48 21 d1             	and    %rdx,%rcx
   1cc67:	48 21 c3             	and    %rax,%rbx
   1cc6a:	48 09 cb             	or     %rcx,%rbx
   1cc6d:	44 89 eb             	mov    %r13d,%ebx
   1cc70:	74 0e                	je     1cc80 <hyperinterval::ieee::Format::affine+0x210>
   1cc72:	41 0f b6 c0          	movzbl %r8b,%eax
   1cc76:	f7 d8                	neg    %eax
   1cc78:	83 c8 01             	or     $0x1,%eax
   1cc7b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1cc80:	45 29 fa             	sub    %r15d,%r10d
   1cc83:	78 20                	js     1cca5 <hyperinterval::ieee::Format::affine+0x235>
   1cc85:	31 d2                	xor    %edx,%edx
   1cc87:	44 89 d1             	mov    %r10d,%ecx
   1cc8a:	4c 0f a5 e2          	shld   %cl,%r12,%rdx
   1cc8e:	49 d3 e4             	shl    %cl,%r12
   1cc91:	45 31 ed             	xor    %r13d,%r13d
   1cc94:	41 f6 c2 40          	test   $0x40,%r10b
   1cc98:	49 0f 45 d4          	cmovne %r12,%rdx
   1cc9c:	4d 0f 45 e5          	cmovne %r13,%r12
   1cca0:	4c 89 e0             	mov    %r12,%rax
   1cca3:	eb 58                	jmp    1ccfd <hyperinterval::ieee::Format::affine+0x28d>
   1cca5:	41 f7 da             	neg    %r10d
   1cca8:	45 31 ed             	xor    %r13d,%r13d
   1ccab:	b8 00 00 00 00       	mov    $0x0,%eax
   1ccb0:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1ccb4:	7f 2d                	jg     1cce3 <hyperinterval::ieee::Format::affine+0x273>
   1ccb6:	4c 89 e0             	mov    %r12,%rax
   1ccb9:	44 89 d1             	mov    %r10d,%ecx
   1ccbc:	4c 0f ad e8          	shrd   %cl,%r13,%rax
   1ccc0:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   1ccc7:	48 d3 e7             	shl    %cl,%rdi
   1ccca:	41 f6 c2 40          	test   $0x40,%r10b
   1ccce:	49 0f 45 c5          	cmovne %r13,%rax
   1ccd2:	49 0f 45 fd          	cmovne %r13,%rdi
   1ccd6:	48 f7 d7             	not    %rdi
   1ccd9:	ba 00 00 00 00       	mov    $0x0,%edx
   1ccde:	4c 85 e7             	test   %r12,%rdi
   1cce1:	74 1a                	je     1ccfd <hyperinterval::ieee::Format::affine+0x28d>
   1cce3:	4c 89 ea             	mov    %r13,%rdx
   1cce6:	4c 89 c9             	mov    %r9,%rcx
   1cce9:	48 21 f1             	and    %rsi,%rcx
   1ccec:	31 ff                	xor    %edi,%edi
   1ccee:	48 f7 d9             	neg    %rcx
   1ccf1:	40 0f 93 c7          	setae  %dil
   1ccf5:	44 8d 2c 7d ff ff ff 	lea    -0x1(,%rdi,2),%r13d
   1ccfc:	ff 
   1ccfd:	49 85 f1             	test   %rsi,%r9
   1cd00:	0f 95 c1             	setne  %cl
   1cd03:	41 38 c8             	cmp    %cl,%r8b
   1cd06:	74 16                	je     1cd1e <hyperinterval::ieee::Format::affine+0x2ae>
   1cd08:	48 39 c5             	cmp    %rax,%rbp
   1cd0b:	4c 89 d9             	mov    %r11,%rcx
   1cd0e:	48 19 d1             	sbb    %rdx,%rcx
   1cd11:	73 13                	jae    1cd26 <hyperinterval::ieee::Format::affine+0x2b6>
   1cd13:	48 29 e8             	sub    %rbp,%rax
   1cd16:	4c 19 da             	sbb    %r11,%rdx
   1cd19:	41 89 d8             	mov    %ebx,%r8d
   1cd1c:	eb 14                	jmp    1cd32 <hyperinterval::ieee::Format::affine+0x2c2>
   1cd1e:	48 01 e8             	add    %rbp,%rax
   1cd21:	4c 11 da             	adc    %r11,%rdx
   1cd24:	eb 0c                	jmp    1cd32 <hyperinterval::ieee::Format::affine+0x2c2>
   1cd26:	48 29 c5             	sub    %rax,%rbp
   1cd29:	49 19 d3             	sbb    %rdx,%r11
   1cd2c:	48 89 e8             	mov    %rbp,%rax
   1cd2f:	4c 89 da             	mov    %r11,%rdx
   1cd32:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1cd37:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1cd3c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1cd41:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1cd46:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1cd4b:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1cd50:	49 89 f4             	mov    %rsi,%r12
   1cd53:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
   1cd58:	48 89 da             	mov    %rbx,%rdx
   1cd5b:	e8 40 01 00 00       	call   1cea0 <hyperinterval::ieee::Format::rounded>
   1cd60:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1cd65:	75 16                	jne    1cd7d <hyperinterval::ieee::Format::affine+0x30d>
   1cd67:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1cd6c:	4c 8b 34 24          	mov    (%rsp),%r14
   1cd70:	41 88 46 01          	mov    %al,0x1(%r14)
   1cd74:	41 c6 06 01          	movb   $0x1,(%r14)
   1cd78:	e9 cb 00 00 00       	jmp    1ce48 <hyperinterval::ieee::Format::affine+0x3d8>
   1cd7d:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1cd82:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1cd87:	49 39 c7             	cmp    %rax,%r15
   1cd8a:	0f 85 a8 00 00 00    	jne    1ce38 <hyperinterval::ieee::Format::affine+0x3c8>
   1cd90:	44 03 6c 24 08       	add    0x8(%rsp),%r13d
   1cd95:	41 83 fd 01          	cmp    $0x1,%r13d
   1cd99:	74 60                	je     1cdfb <hyperinterval::ieee::Format::affine+0x38b>
   1cd9b:	41 83 fd ff          	cmp    $0xffffffff,%r13d
   1cd9f:	0f 85 93 00 00 00    	jne    1ce38 <hyperinterval::ieee::Format::affine+0x3c8>
   1cda5:	4c 89 f8             	mov    %r15,%rax
   1cda8:	4c 89 e6             	mov    %r12,%rsi
   1cdab:	4c 31 e0             	xor    %r12,%rax
   1cdae:	4d 85 ff             	test   %r15,%r15
   1cdb1:	49 0f 44 c7          	cmove  %r15,%rax
   1cdb5:	48 89 c1             	mov    %rax,%rcx
   1cdb8:	4c 21 e1             	and    %r12,%rcx
   1cdbb:	31 d2                	xor    %edx,%edx
   1cdbd:	48 f7 d9             	neg    %rcx
   1cdc0:	0f 93 c2             	setae  %dl
   1cdc3:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1cdc7:	48 ff c9             	dec    %rcx
   1cdca:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1cdcf:	48 89 da             	mov    %rbx,%rdx
   1cdd2:	e8 89 00 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1cdd7:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1cddc:	75 49                	jne    1ce27 <hyperinterval::ieee::Format::affine+0x3b7>
   1cdde:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1cde3:	49 31 c4             	xor    %rax,%r12
   1cde6:	48 85 c0             	test   %rax,%rax
   1cde9:	4c 0f 44 e0          	cmove  %rax,%r12
   1cded:	4c 8b 34 24          	mov    (%rsp),%r14
   1cdf1:	4d 89 66 08          	mov    %r12,0x8(%r14)
   1cdf5:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1cdf9:	eb 49                	jmp    1ce44 <hyperinterval::ieee::Format::affine+0x3d4>
   1cdfb:	4c 89 e6             	mov    %r12,%rsi
   1cdfe:	4c 89 f8             	mov    %r15,%rax
   1ce01:	4c 21 e0             	and    %r12,%rax
   1ce04:	31 c9                	xor    %ecx,%ecx
   1ce06:	48 f7 d8             	neg    %rax
   1ce09:	0f 93 c1             	setae  %cl
   1ce0c:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1ce10:	48 ff c9             	dec    %rcx
   1ce13:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1ce18:	48 89 da             	mov    %rbx,%rdx
   1ce1b:	e8 40 00 00 00       	call   1ce60 <hyperinterval::ieee::Format::finite>
   1ce20:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1ce25:	74 0c                	je     1ce33 <hyperinterval::ieee::Format::affine+0x3c3>
   1ce27:	4c 8b 34 24          	mov    (%rsp),%r14
   1ce2b:	66 41 c7 06 01 05    	movw   $0x501,(%r14)
   1ce31:	eb 15                	jmp    1ce48 <hyperinterval::ieee::Format::affine+0x3d8>
   1ce33:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ce38:	4c 8b 34 24          	mov    (%rsp),%r14
   1ce3c:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1ce40:	49 89 46 10          	mov    %rax,0x10(%r14)
   1ce44:	41 c6 06 00          	movb   $0x0,(%r14)
   1ce48:	4c 89 f0             	mov    %r14,%rax
   1ce4b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1ce52:	5b                   	pop    %rbx
   1ce53:	41 5c                	pop    %r12
   1ce55:	41 5d                	pop    %r13
   1ce57:	41 5e                	pop    %r14
   1ce59:	41 5f                	pop    %r15
   1ce5b:	5d                   	pop    %rbp
   1ce5c:	c3                   	ret
   1ce5d:	cc                   	int3
   1ce5e:	cc                   	int3
   1ce5f:	cc                   	int3

hyperinterval::ieee::Format::finite:
   1ce60:	48 89 f8             	mov    %rdi,%rax
   1ce63:	48 89 cf             	mov    %rcx,%rdi
   1ce66:	48 f7 d7             	not    %rdi
   1ce69:	48 85 fa             	test   %rdi,%rdx
   1ce6c:	75 09                	jne    1ce77 <hyperinterval::ieee::Format::finite+0x17>
   1ce6e:	c6 40 01 00          	movb   $0x0,0x1(%rax)
   1ce72:	b1 01                	mov    $0x1,%cl
   1ce74:	88 08                	mov    %cl,(%rax)
   1ce76:	c3                   	ret
   1ce77:	48 ff ce             	dec    %rsi
   1ce7a:	48 85 f1             	test   %rsi,%rcx
   1ce7d:	74 09                	je     1ce88 <hyperinterval::ieee::Format::finite+0x28>
   1ce7f:	48 89 48 08          	mov    %rcx,0x8(%rax)
   1ce83:	31 c9                	xor    %ecx,%ecx
   1ce85:	88 08                	mov    %cl,(%rax)
   1ce87:	c3                   	ret
   1ce88:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
   1ce8f:	00 
   1ce90:	31 c9                	xor    %ecx,%ecx
   1ce92:	88 08                	mov    %cl,(%rax)
   1ce94:	c3                   	ret
   1ce95:	cc                   	int3
   1ce96:	cc                   	int3
   1ce97:	cc                   	int3
   1ce98:	cc                   	int3
   1ce99:	cc                   	int3
   1ce9a:	cc                   	int3
   1ce9b:	cc                   	int3
   1ce9c:	cc                   	int3
   1ce9d:	cc                   	int3
   1ce9e:	cc                   	int3
   1ce9f:	cc                   	int3

hyperinterval::ieee::Format::rounded:
   1cea0:	48 89 c8             	mov    %rcx,%rax
   1cea3:	4c 8b 11             	mov    (%rcx),%r10
   1cea6:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1ceaa:	4c 89 d1             	mov    %r10,%rcx
   1cead:	4c 09 d9             	or     %r11,%rcx
   1ceb0:	74 79                	je     1cf2b <hyperinterval::ieee::Format::rounded+0x8b>
   1ceb2:	55                   	push   %rbp
   1ceb3:	41 57                	push   %r15
   1ceb5:	41 56                	push   %r14
   1ceb7:	41 55                	push   %r13
   1ceb9:	41 54                	push   %r12
   1cebb:	53                   	push   %rbx
   1cebc:	8b 68 10             	mov    0x10(%rax),%ebp
   1cebf:	49 0f bd cb          	bsr    %r11,%rcx
   1cec3:	83 f1 3f             	xor    $0x3f,%ecx
   1cec6:	4d 0f bd f2          	bsr    %r10,%r14
   1ceca:	41 83 f6 3f          	xor    $0x3f,%r14d
   1cece:	41 83 ce 40          	or     $0x40,%r14d
   1ced2:	4d 85 db             	test   %r11,%r11
   1ced5:	44 0f 45 f1          	cmovne %ecx,%r14d
   1ced9:	bb 40 00 00 00       	mov    $0x40,%ebx
   1cede:	f3 48 0f bc da       	tzcnt  %rdx,%rbx
   1cee3:	41 89 d8             	mov    %ebx,%r8d
   1cee6:	41 83 e0 3f          	and    $0x3f,%r8d
   1ceea:	44 89 c1             	mov    %r8d,%ecx
   1ceed:	48 d3 ea             	shr    %cl,%rdx
   1cef0:	41 83 f6 7f          	xor    $0x7f,%r14d
   1cef4:	41 01 ee             	add    %ebp,%r14d
   1cef7:	48 d1 ea             	shr    $1,%rdx
   1cefa:	41 39 d6             	cmp    %edx,%r14d
   1cefd:	0f 8f 54 01 00 00    	jg     1d057 <hyperinterval::ieee::Format::rounded+0x1b7>
   1cf03:	44 8d 2c 13          	lea    (%rbx,%rdx,1),%r13d
   1cf07:	b9 01 00 00 00       	mov    $0x1,%ecx
   1cf0c:	44 29 e9             	sub    %r13d,%ecx
   1cf0f:	41 29 de             	sub    %ebx,%r14d
   1cf12:	41 39 ce             	cmp    %ecx,%r14d
   1cf15:	44 0f 4e f1          	cmovle %ecx,%r14d
   1cf19:	44 89 f1             	mov    %r14d,%ecx
   1cf1c:	29 e9                	sub    %ebp,%ecx
   1cf1e:	83 f9 7f             	cmp    $0x7f,%ecx
   1cf21:	7e 13                	jle    1cf36 <hyperinterval::ieee::Format::rounded+0x96>
   1cf23:	41 b4 01             	mov    $0x1,%r12b
   1cf26:	e9 ea 00 00 00       	jmp    1d015 <hyperinterval::ieee::Format::rounded+0x175>
   1cf2b:	c6 07 00             	movb   $0x0,(%rdi)
   1cf2e:	0f 57 c0             	xorps  %xmm0,%xmm0
   1cf31:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1cf35:	c3                   	ret
   1cf36:	85 c9                	test   %ecx,%ecx
   1cf38:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
   1cf3d:	0f 8e ad 00 00 00    	jle    1cff0 <hyperinterval::ieee::Format::rounded+0x150>
   1cf43:	4d 89 d7             	mov    %r10,%r15
   1cf46:	4d 0f ad df          	shrd   %cl,%r11,%r15
   1cf4a:	4d 89 dd             	mov    %r11,%r13
   1cf4d:	49 d3 ed             	shr    %cl,%r13
   1cf50:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1cf57:	49 d3 e4             	shl    %cl,%r12
   1cf5a:	48 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%rbp
   1cf61:	45 31 c9             	xor    %r9d,%r9d
   1cf64:	f6 c1 40             	test   $0x40,%cl
   1cf67:	4d 0f 45 fd          	cmovne %r13,%r15
   1cf6b:	4d 0f 45 e9          	cmovne %r9,%r13
   1cf6f:	49 0f 45 ec          	cmovne %r12,%rbp
   1cf73:	4d 0f 45 e1          	cmovne %r9,%r12
   1cf77:	49 f7 d4             	not    %r12
   1cf7a:	48 f7 d5             	not    %rbp
   1cf7d:	4c 21 dd             	and    %r11,%rbp
   1cf80:	4d 21 d4             	and    %r10,%r12
   1cf83:	49 09 ec             	or     %rbp,%r12
   1cf86:	41 0f 95 c4          	setne  %r12b
   1cf8a:	4d 89 eb             	mov    %r13,%r11
   1cf8d:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1cf92:	4c 89 f9             	mov    %r15,%rcx
   1cf95:	4c 09 d9             	or     %r11,%rcx
   1cf98:	74 7b                	je     1d015 <hyperinterval::ieee::Format::rounded+0x175>
   1cf9a:	49 0f bd cb          	bsr    %r11,%rcx
   1cf9e:	83 f1 3f             	xor    $0x3f,%ecx
   1cfa1:	4d 0f bd ef          	bsr    %r15,%r13
   1cfa5:	41 83 f5 3f          	xor    $0x3f,%r13d
   1cfa9:	41 83 cd 40          	or     $0x40,%r13d
   1cfad:	4d 85 db             	test   %r11,%r11
   1cfb0:	44 0f 45 e9          	cmovne %ecx,%r13d
   1cfb4:	41 83 f5 7f          	xor    $0x7f,%r13d
   1cfb8:	43 8d 2c 2e          	lea    (%r14,%r13,1),%ebp
   1cfbc:	39 d5                	cmp    %edx,%ebp
   1cfbe:	0f 8f 93 00 00 00    	jg     1d057 <hyperinterval::ieee::Format::rounded+0x1b7>
   1cfc4:	b9 01 00 00 00       	mov    $0x1,%ecx
   1cfc9:	29 d1                	sub    %edx,%ecx
   1cfcb:	39 cd                	cmp    %ecx,%ebp
   1cfcd:	0f 8d 53 01 00 00    	jge    1d126 <hyperinterval::ieee::Format::rounded+0x286>
   1cfd3:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1cfd8:	43 8d 0c 2e          	lea    (%r14,%r13,1),%ecx
   1cfdc:	fe c9                	dec    %cl
   1cfde:	4d 89 f9             	mov    %r15,%r9
   1cfe1:	49 d3 e1             	shl    %cl,%r9
   1cfe4:	45 31 d2             	xor    %r10d,%r10d
   1cfe7:	f6 c1 40             	test   $0x40,%cl
   1cfea:	4d 0f 44 d1          	cmove  %r9,%r10
   1cfee:	eb 2e                	jmp    1d01e <hyperinterval::ieee::Format::rounded+0x17e>
   1cff0:	f6 d9                	neg    %cl
   1cff2:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   1cff6:	49 d3 e2             	shl    %cl,%r10
   1cff9:	45 31 e4             	xor    %r12d,%r12d
   1cffc:	f6 c1 40             	test   $0x40,%cl
   1cfff:	4d 0f 45 da          	cmovne %r10,%r11
   1d003:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1d009:	4d 0f 44 fa          	cmove  %r10,%r15
   1d00d:	4c 89 f9             	mov    %r15,%rcx
   1d010:	4c 09 d9             	or     %r11,%rcx
   1d013:	75 85                	jne    1cf9a <hyperinterval::ieee::Format::rounded+0xfa>
   1d015:	45 31 ff             	xor    %r15d,%r15d
   1d018:	45 31 db             	xor    %r11d,%r11d
   1d01b:	45 31 d2             	xor    %r10d,%r10d
   1d01e:	45 0f b6 e4          	movzbl %r12b,%r12d
   1d022:	4d 01 fc             	add    %r15,%r12
   1d025:	49 83 d3 00          	adc    $0x0,%r11
   1d029:	4c 89 e1             	mov    %r12,%rcx
   1d02c:	4c 09 d9             	or     %r11,%rcx
   1d02f:	74 30                	je     1d061 <hyperinterval::ieee::Format::rounded+0x1c1>
   1d031:	49 0f bd cb          	bsr    %r11,%rcx
   1d035:	83 f1 3f             	xor    $0x3f,%ecx
   1d038:	4d 0f bd fc          	bsr    %r12,%r15
   1d03c:	41 83 f7 3f          	xor    $0x3f,%r15d
   1d040:	41 83 cf 40          	or     $0x40,%r15d
   1d044:	4d 85 db             	test   %r11,%r11
   1d047:	44 0f 45 f9          	cmovne %ecx,%r15d
   1d04b:	41 83 f7 7f          	xor    $0x7f,%r15d
   1d04f:	43 8d 2c 37          	lea    (%r15,%r14,1),%ebp
   1d053:	39 d5                	cmp    %edx,%ebp
   1d055:	7e 1b                	jle    1d072 <hyperinterval::ieee::Format::rounded+0x1d2>
   1d057:	66 c7 07 01 05       	movw   $0x501,(%rdi)
   1d05c:	e9 ba 00 00 00       	jmp    1d11b <hyperinterval::ieee::Format::rounded+0x27b>
   1d061:	31 d2                	xor    %edx,%edx
   1d063:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1d067:	0f 84 86 00 00 00    	je     1d0f3 <hyperinterval::ieee::Format::rounded+0x253>
   1d06d:	e9 9e 00 00 00       	jmp    1d110 <hyperinterval::ieee::Format::rounded+0x270>
   1d072:	b9 01 00 00 00       	mov    $0x1,%ecx
   1d077:	29 d1                	sub    %edx,%ecx
   1d079:	39 cd                	cmp    %ecx,%ebp
   1d07b:	7d 1e                	jge    1d09b <hyperinterval::ieee::Format::rounded+0x1fb>
   1d07d:	45 01 f5             	add    %r14d,%r13d
   1d080:	41 fe cd             	dec    %r13b
   1d083:	44 89 e9             	mov    %r13d,%ecx
   1d086:	49 d3 e4             	shl    %cl,%r12
   1d089:	31 d2                	xor    %edx,%edx
   1d08b:	41 f6 c5 40          	test   $0x40,%r13b
   1d08f:	49 0f 44 d4          	cmove  %r12,%rdx
   1d093:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1d097:	74 5a                	je     1d0f3 <hyperinterval::ieee::Format::rounded+0x253>
   1d099:	eb 75                	jmp    1d110 <hyperinterval::ieee::Format::rounded+0x270>
   1d09b:	89 d9                	mov    %ebx,%ecx
   1d09d:	44 29 f9             	sub    %r15d,%ecx
   1d0a0:	41 89 c9             	mov    %ecx,%r9d
   1d0a3:	41 f7 d9             	neg    %r9d
   1d0a6:	4d 89 e6             	mov    %r12,%r14
   1d0a9:	49 d3 e6             	shl    %cl,%r14
   1d0ac:	45 31 ed             	xor    %r13d,%r13d
   1d0af:	f6 c1 40             	test   $0x40,%cl
   1d0b2:	4d 0f 44 ee          	cmove  %r14,%r13
   1d0b6:	44 89 c9             	mov    %r9d,%ecx
   1d0b9:	4d 0f ad dc          	shrd   %cl,%r11,%r12
   1d0bd:	49 d3 eb             	shr    %cl,%r11
   1d0c0:	41 f6 c1 40          	test   $0x40,%r9b
   1d0c4:	4d 0f 44 dc          	cmove  %r12,%r11
   1d0c8:	44 39 fb             	cmp    %r15d,%ebx
   1d0cb:	4d 0f 43 dd          	cmovae %r13,%r11
   1d0cf:	01 d5                	add    %edx,%ebp
   1d0d1:	4c 63 cd             	movslq %ebp,%r9
   1d0d4:	44 89 c1             	mov    %r8d,%ecx
   1d0d7:	49 d3 e1             	shl    %cl,%r9
   1d0da:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1d0e1:	48 d3 e2             	shl    %cl,%rdx
   1d0e4:	48 f7 d2             	not    %rdx
   1d0e7:	4c 21 da             	and    %r11,%rdx
   1d0ea:	4c 09 ca             	or     %r9,%rdx
   1d0ed:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1d0f1:	75 1d                	jne    1d110 <hyperinterval::ieee::Format::rounded+0x270>
   1d0f3:	48 89 d0             	mov    %rdx,%rax
   1d0f6:	48 31 f0             	xor    %rsi,%rax
   1d0f9:	48 85 d2             	test   %rdx,%rdx
   1d0fc:	48 0f 44 c2          	cmove  %rdx,%rax
   1d100:	4c 31 d6             	xor    %r10,%rsi
   1d103:	4d 85 d2             	test   %r10,%r10
   1d106:	49 0f 44 f2          	cmove  %r10,%rsi
   1d10a:	49 89 c2             	mov    %rax,%r10
   1d10d:	48 89 f2             	mov    %rsi,%rdx
   1d110:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   1d114:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1d118:	c6 07 00             	movb   $0x0,(%rdi)
   1d11b:	5b                   	pop    %rbx
   1d11c:	41 5c                	pop    %r12
   1d11e:	41 5d                	pop    %r13
   1d120:	41 5e                	pop    %r14
   1d122:	41 5f                	pop    %r15
   1d124:	5d                   	pop    %rbp
   1d125:	c3                   	ret
   1d126:	89 d9                	mov    %ebx,%ecx
   1d128:	44 29 e9             	sub    %r13d,%ecx
   1d12b:	4d 89 f9             	mov    %r15,%r9
   1d12e:	49 d3 e1             	shl    %cl,%r9
   1d131:	41 89 ca             	mov    %ecx,%r10d
   1d134:	41 f7 da             	neg    %r10d
   1d137:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
   1d13e:	00 00 
   1d140:	f6 c1 40             	test   $0x40,%cl
   1d143:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
   1d148:	49 0f 44 c9          	cmove  %r9,%rcx
   1d14c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
   1d151:	4d 89 f9             	mov    %r15,%r9
   1d154:	44 89 d1             	mov    %r10d,%ecx
   1d157:	4d 0f ad d9          	shrd   %cl,%r11,%r9
   1d15b:	4c 89 4c 24 f8       	mov    %r9,-0x8(%rsp)
   1d160:	4d 89 d9             	mov    %r11,%r9
   1d163:	49 d3 e9             	shr    %cl,%r9
   1d166:	41 f6 c2 40          	test   $0x40,%r10b
   1d16a:	4c 0f 44 4c 24 f8    	cmove  -0x8(%rsp),%r9
   1d170:	44 39 eb             	cmp    %r13d,%ebx
   1d173:	4c 0f 43 4c 24 e8    	cmovae -0x18(%rsp),%r9
   1d179:	01 d5                	add    %edx,%ebp
   1d17b:	4c 63 ed             	movslq %ebp,%r13
   1d17e:	44 89 c1             	mov    %r8d,%ecx
   1d181:	49 d3 e5             	shl    %cl,%r13
   1d184:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1d18b:	49 d3 e2             	shl    %cl,%r10
   1d18e:	49 f7 d2             	not    %r10
   1d191:	4d 21 ca             	and    %r9,%r10
   1d194:	4d 09 ea             	or     %r13,%r10
   1d197:	4c 8b 6c 24 f0       	mov    -0x10(%rsp),%r13
   1d19c:	e9 7d fe ff ff       	jmp    1d01e <hyperinterval::ieee::Format::rounded+0x17e>
   1d1a1:	cc                   	int3
   1d1a2:	cc                   	int3
   1d1a3:	cc                   	int3
   1d1a4:	cc                   	int3
   1d1a5:	cc                   	int3
   1d1a6:	cc                   	int3
   1d1a7:	cc                   	int3
   1d1a8:	cc                   	int3
   1d1a9:	cc                   	int3
   1d1aa:	cc                   	int3
   1d1ab:	cc                   	int3
   1d1ac:	cc                   	int3
   1d1ad:	cc                   	int3
   1d1ae:	cc                   	int3
   1d1af:	cc                   	int3

hyperinterval::sqrt::integer_sqrt_bounds:
   1d1b0:	55                   	push   %rbp
   1d1b1:	41 57                	push   %r15
   1d1b3:	41 56                	push   %r14
   1d1b5:	41 55                	push   %r13
   1d1b7:	41 54                	push   %r12
   1d1b9:	53                   	push   %rbx
   1d1ba:	50                   	push   %rax
   1d1bb:	49 89 d2             	mov    %rdx,%r10
   1d1be:	48 89 f3             	mov    %rsi,%rbx
   1d1c1:	49 89 fe             	mov    %rdi,%r14
   1d1c4:	48 85 d2             	test   %rdx,%rdx
   1d1c7:	75 37                	jne    1d200 <hyperinterval::sqrt::integer_sqrt_bounds+0x50>
   1d1c9:	48 89 d8             	mov    %rbx,%rax
   1d1cc:	48 c1 e8 20          	shr    $0x20,%rax
   1d1d0:	0f 85 3e 01 00 00    	jne    1d314 <hyperinterval::sqrt::integer_sqrt_bounds+0x164>
   1d1d6:	48 81 fb 00 00 01 00 	cmp    $0x10000,%rbx
   1d1dd:	0f 83 d1 02 00 00    	jae    1d4b4 <hyperinterval::sqrt::integer_sqrt_bounds+0x304>
   1d1e3:	48 81 fb 00 01 00 00 	cmp    $0x100,%rbx
   1d1ea:	0f 83 93 03 00 00    	jae    1d583 <hyperinterval::sqrt::integer_sqrt_bounds+0x3d3>
   1d1f0:	48 8d 05 dd a1 fe ff 	lea    -0x15e23(%rip),%rax        # 73d4 <__abi_tag+0x70d8>
   1d1f7:	0f b6 04 58          	movzbl (%rax,%rbx,2),%eax
   1d1fb:	e9 e8 03 00 00       	jmp    1d5e8 <hyperinterval::sqrt::integer_sqrt_bounds+0x438>
   1d200:	49 0f bd c2          	bsr    %r10,%rax
   1d204:	48 83 f0 3f          	xor    $0x3f,%rax
   1d208:	4c 0f bd eb          	bsr    %rbx,%r13
   1d20c:	49 83 f5 3f          	xor    $0x3f,%r13
   1d210:	49 83 cd 40          	or     $0x40,%r13
   1d214:	4d 85 d2             	test   %r10,%r10
   1d217:	4c 0f 45 e8          	cmovne %rax,%r13
   1d21b:	44 89 e9             	mov    %r13d,%ecx
   1d21e:	80 e1 3e             	and    $0x3e,%cl
   1d221:	4c 89 14 24          	mov    %r10,(%rsp)
   1d225:	4c 89 d5             	mov    %r10,%rbp
   1d228:	48 0f a5 dd          	shld   %cl,%rbx,%rbp
   1d22c:	48 89 d8             	mov    %rbx,%rax
   1d22f:	48 d3 e0             	shl    %cl,%rax
   1d232:	31 c9                	xor    %ecx,%ecx
   1d234:	41 f6 c5 40          	test   $0x40,%r13b
   1d238:	48 0f 45 e8          	cmovne %rax,%rbp
   1d23c:	41 bf 00 00 00 00    	mov    $0x0,%r15d
   1d242:	4c 0f 44 f8          	cmove  %rax,%r15
   1d246:	48 89 e8             	mov    %rbp,%rax
   1d249:	48 c1 e8 38          	shr    $0x38,%rax
   1d24d:	48 8d 15 80 a1 fe ff 	lea    -0x15e80(%rip),%rdx        # 73d4 <__abi_tag+0x70d8>
   1d254:	0f b6 34 42          	movzbl (%rdx,%rax,2),%esi
   1d258:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d25d:	89 f7                	mov    %esi,%edi
   1d25f:	01 f7                	add    %esi,%edi
   1d261:	c1 e2 04             	shl    $0x4,%edx
   1d264:	48 89 e8             	mov    %rbp,%rax
   1d267:	48 c1 e8 34          	shr    $0x34,%rax
   1d26b:	83 e0 0f             	and    $0xf,%eax
   1d26e:	09 d0                	or     %edx,%eax
   1d270:	31 d2                	xor    %edx,%edx
   1d272:	66 f7 f7             	div    %di
   1d275:	48 89 ef             	mov    %rbp,%rdi
   1d278:	48 c1 ef 30          	shr    $0x30,%rdi
   1d27c:	40 c0 e6 04          	shl    $0x4,%sil
   1d280:	40 0f b6 f6          	movzbl %sil,%esi
   1d284:	01 c6                	add    %eax,%esi
   1d286:	c1 e2 04             	shl    $0x4,%edx
   1d289:	83 e7 0f             	and    $0xf,%edi
   1d28c:	09 d7                	or     %edx,%edi
   1d28e:	0f af c0             	imul   %eax,%eax
   1d291:	66 29 c7             	sub    %ax,%di
   1d294:	8d 44 36 ff          	lea    -0x1(%rsi,%rsi,1),%eax
   1d298:	0f 43 c1             	cmovae %ecx,%eax
   1d29b:	66 83 de 00          	sbb    $0x0,%si
   1d29f:	01 f8                	add    %edi,%eax
   1d2a1:	0f b7 fe             	movzwl %si,%edi
   1d2a4:	01 ff                	add    %edi,%edi
   1d2a6:	0f b7 d0             	movzwl %ax,%edx
   1d2a9:	c1 e2 08             	shl    $0x8,%edx
   1d2ac:	48 89 e8             	mov    %rbp,%rax
   1d2af:	48 c1 e8 28          	shr    $0x28,%rax
   1d2b3:	0f b6 c0             	movzbl %al,%eax
   1d2b6:	09 d0                	or     %edx,%eax
   1d2b8:	31 d2                	xor    %edx,%edx
   1d2ba:	f7 f7                	div    %edi
   1d2bc:	48 89 ef             	mov    %rbp,%rdi
   1d2bf:	48 c1 ef 20          	shr    $0x20,%rdi
   1d2c3:	c1 e6 08             	shl    $0x8,%esi
   1d2c6:	44 0f b7 e6          	movzwl %si,%r12d
   1d2ca:	41 01 c4             	add    %eax,%r12d
   1d2cd:	c1 e2 08             	shl    $0x8,%edx
   1d2d0:	40 0f b6 f7          	movzbl %dil,%esi
   1d2d4:	09 d6                	or     %edx,%esi
   1d2d6:	0f af c0             	imul   %eax,%eax
   1d2d9:	29 c6                	sub    %eax,%esi
   1d2db:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d2e0:	0f 43 c1             	cmovae %ecx,%eax
   1d2e3:	8d 14 06             	lea    (%rsi,%rax,1),%edx
   1d2e6:	41 83 dc 00          	sbb    $0x0,%r12d
   1d2ea:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d2ee:	48 c1 e2 10          	shl    $0x10,%rdx
   1d2f2:	89 e8                	mov    %ebp,%eax
   1d2f4:	c1 e8 10             	shr    $0x10,%eax
   1d2f7:	48 09 d0             	or     %rdx,%rax
   1d2fa:	48 09 ca             	or     %rcx,%rdx
   1d2fd:	48 c1 ea 20          	shr    $0x20,%rdx
   1d301:	66 85 d2             	test   %dx,%dx
   1d304:	0f 84 ff 00 00 00    	je     1d409 <hyperinterval::sqrt::integer_sqrt_bounds+0x259>
   1d30a:	31 d2                	xor    %edx,%edx
   1d30c:	48 f7 f1             	div    %rcx
   1d30f:	e9 f9 00 00 00       	jmp    1d40d <hyperinterval::sqrt::integer_sqrt_bounds+0x25d>
   1d314:	48 0f bd f3          	bsr    %rbx,%rsi
   1d318:	48 83 f6 3f          	xor    $0x3f,%rsi
   1d31c:	89 f1                	mov    %esi,%ecx
   1d31e:	80 e1 3e             	and    $0x3e,%cl
   1d321:	48 89 df             	mov    %rbx,%rdi
   1d324:	48 d3 e7             	shl    %cl,%rdi
   1d327:	48 89 f8             	mov    %rdi,%rax
   1d32a:	48 c1 e8 38          	shr    $0x38,%rax
   1d32e:	48 8d 0d 9f a0 fe ff 	lea    -0x15f61(%rip),%rcx        # 73d4 <__abi_tag+0x70d8>
   1d335:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
   1d33a:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
   1d33f:	45 89 c1             	mov    %r8d,%r9d
   1d342:	45 01 c1             	add    %r8d,%r9d
   1d345:	c1 e1 04             	shl    $0x4,%ecx
   1d348:	48 89 f8             	mov    %rdi,%rax
   1d34b:	48 c1 e8 34          	shr    $0x34,%rax
   1d34f:	83 e0 0f             	and    $0xf,%eax
   1d352:	09 c8                	or     %ecx,%eax
   1d354:	31 d2                	xor    %edx,%edx
   1d356:	66 41 f7 f1          	div    %r9w
   1d35a:	49 89 f9             	mov    %rdi,%r9
   1d35d:	49 c1 e9 30          	shr    $0x30,%r9
   1d361:	31 c9                	xor    %ecx,%ecx
   1d363:	41 c0 e0 04          	shl    $0x4,%r8b
   1d367:	45 0f b6 c0          	movzbl %r8b,%r8d
   1d36b:	41 01 c0             	add    %eax,%r8d
   1d36e:	c1 e2 04             	shl    $0x4,%edx
   1d371:	41 83 e1 0f          	and    $0xf,%r9d
   1d375:	41 09 d1             	or     %edx,%r9d
   1d378:	0f af c0             	imul   %eax,%eax
   1d37b:	66 41 29 c1          	sub    %ax,%r9w
   1d37f:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
   1d384:	0f 43 c1             	cmovae %ecx,%eax
   1d387:	66 41 83 d8 00       	sbb    $0x0,%r8w
   1d38c:	44 01 c8             	add    %r9d,%eax
   1d38f:	45 0f b7 c8          	movzwl %r8w,%r9d
   1d393:	45 01 c9             	add    %r9d,%r9d
   1d396:	0f b7 d0             	movzwl %ax,%edx
   1d399:	c1 e2 08             	shl    $0x8,%edx
   1d39c:	48 89 f8             	mov    %rdi,%rax
   1d39f:	48 c1 e8 28          	shr    $0x28,%rax
   1d3a3:	0f b6 c0             	movzbl %al,%eax
   1d3a6:	09 d0                	or     %edx,%eax
   1d3a8:	31 d2                	xor    %edx,%edx
   1d3aa:	41 f7 f1             	div    %r9d
   1d3ad:	49 89 f9             	mov    %rdi,%r9
   1d3b0:	49 c1 e9 20          	shr    $0x20,%r9
   1d3b4:	41 c1 e0 08          	shl    $0x8,%r8d
   1d3b8:	45 0f b7 e0          	movzwl %r8w,%r12d
   1d3bc:	41 01 c4             	add    %eax,%r12d
   1d3bf:	c1 e2 08             	shl    $0x8,%edx
   1d3c2:	45 0f b6 c1          	movzbl %r9b,%r8d
   1d3c6:	41 09 d0             	or     %edx,%r8d
   1d3c9:	0f af c0             	imul   %eax,%eax
   1d3cc:	41 29 c0             	sub    %eax,%r8d
   1d3cf:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1d3d4:	0f 43 c1             	cmovae %ecx,%eax
   1d3d7:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
   1d3db:	41 83 dc 00          	sbb    $0x0,%r12d
   1d3df:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1d3e3:	48 c1 e2 10          	shl    $0x10,%rdx
   1d3e7:	89 f8                	mov    %edi,%eax
   1d3e9:	c1 e8 10             	shr    $0x10,%eax
   1d3ec:	48 09 d0             	or     %rdx,%rax
   1d3ef:	48 09 ca             	or     %rcx,%rdx
   1d3f2:	48 c1 ea 20          	shr    $0x20,%rdx
   1d3f6:	66 85 d2             	test   %dx,%dx
   1d3f9:	0f 84 59 01 00 00    	je     1d558 <hyperinterval::sqrt::integer_sqrt_bounds+0x3a8>
   1d3ff:	31 d2                	xor    %edx,%edx
   1d401:	48 f7 f1             	div    %rcx
   1d404:	e9 53 01 00 00       	jmp    1d55c <hyperinterval::sqrt::integer_sqrt_bounds+0x3ac>
   1d409:	31 d2                	xor    %edx,%edx
   1d40b:	f7 f1                	div    %ecx
   1d40d:	41 c1 e4 10          	shl    $0x10,%r12d
   1d411:	49 01 c4             	add    %rax,%r12
   1d414:	48 c1 e2 10          	shl    $0x10,%rdx
   1d418:	0f b7 cd             	movzwl %bp,%ecx
   1d41b:	48 09 d1             	or     %rdx,%rcx
   1d41e:	48 0f af c0          	imul   %rax,%rax
   1d422:	31 d2                	xor    %edx,%edx
   1d424:	48 29 c1             	sub    %rax,%rcx
   1d427:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
   1d42c:	48 0f 42 d0          	cmovb  %rax,%rdx
   1d430:	49 83 dc 00          	sbb    $0x0,%r12
   1d434:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1d438:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
   1d43c:	4c 89 e1             	mov    %r12,%rcx
   1d43f:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1d443:	48 89 fe             	mov    %rdi,%rsi
   1d446:	48 c1 ee 20          	shr    $0x20,%rsi
   1d44a:	4c 0f a4 ff 20       	shld   $0x20,%r15,%rdi
   1d44f:	ff 15 33 22 04 00    	call   *0x42233(%rip)        # 5f688 <_DYNAMIC+0x448>
   1d455:	48 89 d6             	mov    %rdx,%rsi
   1d458:	49 c1 e4 20          	shl    $0x20,%r12
   1d45c:	49 01 c4             	add    %rax,%r12
   1d45f:	48 83 d6 00          	adc    $0x0,%rsi
   1d463:	48 89 f0             	mov    %rsi,%rax
   1d466:	49 f7 e4             	mul    %r12
   1d469:	0f 90 c1             	seto   %cl
   1d46c:	48 85 f6             	test   %rsi,%rsi
   1d46f:	40 0f 95 c7          	setne  %dil
   1d473:	40 08 cf             	or     %cl,%dil
   1d476:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   1d47a:	4c 89 e0             	mov    %r12,%rax
   1d47d:	49 f7 e4             	mul    %r12
   1d480:	48 01 ca             	add    %rcx,%rdx
   1d483:	0f 92 c1             	setb   %cl
   1d486:	40 08 f9             	or     %dil,%cl
   1d489:	49 39 c7             	cmp    %rax,%r15
   1d48c:	48 19 d5             	sbb    %rdx,%rbp
   1d48f:	0f 92 c0             	setb   %al
   1d492:	08 c8                	or     %cl,%al
   1d494:	0f b6 c0             	movzbl %al,%eax
   1d497:	49 29 c4             	sub    %rax,%r12
   1d49a:	48 83 de 00          	sbb    $0x0,%rsi
   1d49e:	41 d1 ed             	shr    $1,%r13d
   1d4a1:	44 89 e9             	mov    %r13d,%ecx
   1d4a4:	49 0f ad f4          	shrd   %cl,%rsi,%r12
   1d4a8:	48 d3 ee             	shr    %cl,%rsi
   1d4ab:	4c 8b 14 24          	mov    (%rsp),%r10
   1d4af:	e9 3c 01 00 00       	jmp    1d5f0 <hyperinterval::sqrt::integer_sqrt_bounds+0x440>
   1d4b4:	0f bd f3             	bsr    %ebx,%esi
   1d4b7:	83 f6 1f             	xor    $0x1f,%esi
   1d4ba:	89 f1                	mov    %esi,%ecx
   1d4bc:	80 e1 1e             	and    $0x1e,%cl
   1d4bf:	49 89 d9             	mov    %rbx,%r9
   1d4c2:	d3 e3                	shl    %cl,%ebx
   1d4c4:	89 d8                	mov    %ebx,%eax
   1d4c6:	c1 e8 18             	shr    $0x18,%eax
   1d4c9:	48 8d 15 04 9f fe ff 	lea    -0x160fc(%rip),%rdx        # 73d4 <__abi_tag+0x70d8>
   1d4d0:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1d4d4:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1d4d9:	89 cf                	mov    %ecx,%edi
   1d4db:	01 cf                	add    %ecx,%edi
   1d4dd:	c1 e2 04             	shl    $0x4,%edx
   1d4e0:	89 d8                	mov    %ebx,%eax
   1d4e2:	c1 e8 14             	shr    $0x14,%eax
   1d4e5:	83 e0 0f             	and    $0xf,%eax
   1d4e8:	09 d0                	or     %edx,%eax
   1d4ea:	31 d2                	xor    %edx,%edx
   1d4ec:	66 f7 f7             	div    %di
   1d4ef:	89 df                	mov    %ebx,%edi
   1d4f1:	c1 ef 10             	shr    $0x10,%edi
   1d4f4:	45 31 c0             	xor    %r8d,%r8d
   1d4f7:	c0 e1 04             	shl    $0x4,%cl
   1d4fa:	0f b6 c9             	movzbl %cl,%ecx
   1d4fd:	01 c1                	add    %eax,%ecx
   1d4ff:	c1 e2 04             	shl    $0x4,%edx
   1d502:	83 e7 0f             	and    $0xf,%edi
   1d505:	09 d7                	or     %edx,%edi
   1d507:	0f af c0             	imul   %eax,%eax
   1d50a:	66 29 c7             	sub    %ax,%di
   1d50d:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1d511:	41 0f 43 c0          	cmovae %r8d,%eax
   1d515:	66 83 d9 00          	sbb    $0x0,%cx
   1d519:	01 f8                	add    %edi,%eax
   1d51b:	0f b7 f9             	movzwl %cx,%edi
   1d51e:	01 ff                	add    %edi,%edi
   1d520:	0f b7 d0             	movzwl %ax,%edx
   1d523:	c1 e2 08             	shl    $0x8,%edx
   1d526:	0f b6 c7             	movzbl %bh,%eax
   1d529:	09 d0                	or     %edx,%eax
   1d52b:	31 d2                	xor    %edx,%edx
   1d52d:	f7 f7                	div    %edi
   1d52f:	c1 e1 08             	shl    $0x8,%ecx
   1d532:	0f b7 f9             	movzwl %cx,%edi
   1d535:	01 c7                	add    %eax,%edi
   1d537:	89 f8                	mov    %edi,%eax
   1d539:	f7 e7                	mul    %edi
   1d53b:	0f 90 c1             	seto   %cl
   1d53e:	39 d8                	cmp    %ebx,%eax
   1d540:	4c 89 cb             	mov    %r9,%rbx
   1d543:	0f 97 c0             	seta   %al
   1d546:	08 c8                	or     %cl,%al
   1d548:	0f b6 c0             	movzbl %al,%eax
   1d54b:	29 c7                	sub    %eax,%edi
   1d54d:	d1 ee                	shr    $1,%esi
   1d54f:	89 f1                	mov    %esi,%ecx
   1d551:	d3 ef                	shr    %cl,%edi
   1d553:	e9 93 00 00 00       	jmp    1d5eb <hyperinterval::sqrt::integer_sqrt_bounds+0x43b>
   1d558:	31 d2                	xor    %edx,%edx
   1d55a:	f7 f1                	div    %ecx
   1d55c:	41 c1 e4 10          	shl    $0x10,%r12d
   1d560:	49 01 c4             	add    %rax,%r12
   1d563:	4c 89 e0             	mov    %r12,%rax
   1d566:	49 f7 e4             	mul    %r12
   1d569:	0f 90 c1             	seto   %cl
   1d56c:	48 39 f8             	cmp    %rdi,%rax
   1d56f:	0f 97 c0             	seta   %al
   1d572:	08 c8                	or     %cl,%al
   1d574:	0f b6 c0             	movzbl %al,%eax
   1d577:	49 29 c4             	sub    %rax,%r12
   1d57a:	d1 ee                	shr    $1,%esi
   1d57c:	89 f1                	mov    %esi,%ecx
   1d57e:	49 d3 ec             	shr    %cl,%r12
   1d581:	eb 6b                	jmp    1d5ee <hyperinterval::sqrt::integer_sqrt_bounds+0x43e>
   1d583:	66 0f bd f3          	bsr    %bx,%si
   1d587:	83 f6 0f             	xor    $0xf,%esi
   1d58a:	89 f1                	mov    %esi,%ecx
   1d58c:	80 e1 0e             	and    $0xe,%cl
   1d58f:	89 d8                	mov    %ebx,%eax
   1d591:	d3 e0                	shl    %cl,%eax
   1d593:	89 c7                	mov    %eax,%edi
   1d595:	0f b6 cc             	movzbl %ah,%ecx
   1d598:	48 8d 15 35 9e fe ff 	lea    -0x161cb(%rip),%rdx        # 73d4 <__abi_tag+0x70d8>
   1d59f:	44 0f b6 04 4a       	movzbl (%rdx,%rcx,2),%r8d
   1d5a4:	0f b6 4c 4a 01       	movzbl 0x1(%rdx,%rcx,2),%ecx
   1d5a9:	45 89 c1             	mov    %r8d,%r9d
   1d5ac:	45 01 c1             	add    %r8d,%r9d
   1d5af:	c1 e1 04             	shl    $0x4,%ecx
   1d5b2:	c1 e8 04             	shr    $0x4,%eax
   1d5b5:	83 e0 0f             	and    $0xf,%eax
   1d5b8:	09 c8                	or     %ecx,%eax
   1d5ba:	31 d2                	xor    %edx,%edx
   1d5bc:	66 41 f7 f1          	div    %r9w
   1d5c0:	41 c0 e0 04          	shl    $0x4,%r8b
   1d5c4:	41 0f b6 c8          	movzbl %r8b,%ecx
   1d5c8:	01 c1                	add    %eax,%ecx
   1d5ca:	89 c8                	mov    %ecx,%eax
   1d5cc:	66 f7 e1             	mul    %cx
   1d5cf:	0f 90 c2             	seto   %dl
   1d5d2:	66 39 f8             	cmp    %di,%ax
   1d5d5:	0f 97 c0             	seta   %al
   1d5d8:	08 d0                	or     %dl,%al
   1d5da:	0f b6 c0             	movzbl %al,%eax
   1d5dd:	29 c1                	sub    %eax,%ecx
   1d5df:	0f b7 c1             	movzwl %cx,%eax
   1d5e2:	d1 ee                	shr    $1,%esi
   1d5e4:	89 f1                	mov    %esi,%ecx
   1d5e6:	d3 e8                	shr    %cl,%eax
   1d5e8:	0f b7 f8             	movzwl %ax,%edi
   1d5eb:	41 89 fc             	mov    %edi,%r12d
   1d5ee:	31 f6                	xor    %esi,%esi
   1d5f0:	4c 89 e1             	mov    %r12,%rcx
   1d5f3:	48 0f af ce          	imul   %rsi,%rcx
   1d5f7:	4c 89 e0             	mov    %r12,%rax
   1d5fa:	49 f7 e4             	mul    %r12
   1d5fd:	48 01 ca             	add    %rcx,%rdx
   1d600:	48 01 ca             	add    %rcx,%rdx
   1d603:	4c 31 d2             	xor    %r10,%rdx
   1d606:	48 31 d8             	xor    %rbx,%rax
   1d609:	31 c9                	xor    %ecx,%ecx
   1d60b:	48 09 d0             	or     %rdx,%rax
   1d60e:	0f 95 c1             	setne  %cl
   1d611:	4c 01 e1             	add    %r12,%rcx
   1d614:	49 89 76 08          	mov    %rsi,0x8(%r14)
   1d618:	48 83 d6 00          	adc    $0x0,%rsi
   1d61c:	4d 89 26             	mov    %r12,(%r14)
   1d61f:	49 89 4e 10          	mov    %rcx,0x10(%r14)
   1d623:	49 89 76 18          	mov    %rsi,0x18(%r14)
   1d627:	4c 89 f0             	mov    %r14,%rax
   1d62a:	48 83 c4 08          	add    $0x8,%rsp
   1d62e:	5b                   	pop    %rbx
   1d62f:	41 5c                	pop    %r12
   1d631:	41 5d                	pop    %r13
   1d633:	41 5e                	pop    %r14
   1d635:	41 5f                	pop    %r15
   1d637:	5d                   	pop    %rbp
   1d638:	c3                   	ret
   1d639:	cc                   	int3
   1d63a:	cc                   	int3
   1d63b:	cc                   	int3
   1d63c:	cc                   	int3
   1d63d:	cc                   	int3
   1d63e:	cc                   	int3
   1d63f:	cc                   	int3

hyperinterval::bounds::Bounds<T>::hull:
   1d6d0:	53                   	push   %rbx
   1d6d1:	49 89 d0             	mov    %rdx,%r8
   1d6d4:	48 89 f2             	mov    %rsi,%rdx
   1d6d7:	48 89 f8             	mov    %rdi,%rax
   1d6da:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1d6e1:	00 00 80 
   1d6e4:	49 89 f9             	mov    %rdi,%r9
   1d6e7:	49 09 f1             	or     %rsi,%r9
   1d6ea:	48 8d 7e ff          	lea    -0x1(%rsi),%rdi
   1d6ee:	49 89 c2             	mov    %rax,%r10
   1d6f1:	49 21 fa             	and    %rdi,%r10
   1d6f4:	49 89 f3             	mov    %rsi,%r11
   1d6f7:	4d 29 d3             	sub    %r10,%r11
   1d6fa:	48 85 c0             	test   %rax,%rax
   1d6fd:	4d 0f 49 d9          	cmovns %r9,%r11
   1d701:	4d 89 c1             	mov    %r8,%r9
   1d704:	49 09 f1             	or     %rsi,%r9
   1d707:	4d 89 c2             	mov    %r8,%r10
   1d70a:	49 21 fa             	and    %rdi,%r10
   1d70d:	48 89 f3             	mov    %rsi,%rbx
   1d710:	4c 29 d3             	sub    %r10,%rbx
   1d713:	4d 85 c0             	test   %r8,%r8
   1d716:	49 0f 49 d9          	cmovns %r9,%rbx
   1d71a:	49 39 db             	cmp    %rbx,%r11
   1d71d:	49 0f 47 c0          	cmova  %r8,%rax
   1d721:	49 89 d0             	mov    %rdx,%r8
   1d724:	49 09 f0             	or     %rsi,%r8
   1d727:	49 89 d1             	mov    %rdx,%r9
   1d72a:	49 21 f9             	and    %rdi,%r9
   1d72d:	49 89 f2             	mov    %rsi,%r10
   1d730:	4d 29 ca             	sub    %r9,%r10
   1d733:	48 85 d2             	test   %rdx,%rdx
   1d736:	4d 0f 49 d0          	cmovns %r8,%r10
   1d73a:	49 89 c8             	mov    %rcx,%r8
   1d73d:	49 09 f0             	or     %rsi,%r8
   1d740:	48 21 cf             	and    %rcx,%rdi
   1d743:	48 29 fe             	sub    %rdi,%rsi
   1d746:	48 85 c9             	test   %rcx,%rcx
   1d749:	49 0f 49 f0          	cmovns %r8,%rsi
   1d74d:	49 39 f2             	cmp    %rsi,%r10
   1d750:	48 0f 42 d1          	cmovb  %rcx,%rdx
   1d754:	5b                   	pop    %rbx
   1d755:	c3                   	ret
   1d756:	cc                   	int3
   1d757:	cc                   	int3
   1d758:	cc                   	int3
   1d759:	cc                   	int3
   1d75a:	cc                   	int3
   1d75b:	cc                   	int3
   1d75c:	cc                   	int3
   1d75d:	cc                   	int3
   1d75e:	cc                   	int3
   1d75f:	cc                   	int3

hyperinterval::bounds::Bounds<T>::signs:
   1d7f0:	89 f9                	mov    %edi,%ecx
   1d7f2:	41 89 d0             	mov    %edx,%r8d
   1d7f5:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1d7fa:	49 89 c9             	mov    %rcx,%r9
   1d7fd:	49 09 c1             	or     %rax,%r9
   1d800:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1d806:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1d80c:	49 29 ca             	sub    %rcx,%r10
   1d80f:	85 ff                	test   %edi,%edi
   1d811:	4d 0f 49 d1          	cmovns %r9,%r10
   1d815:	4c 89 c7             	mov    %r8,%rdi
   1d818:	48 09 c7             	or     %rax,%rdi
   1d81b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1d822:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1d827:	4c 29 c1             	sub    %r8,%rcx
   1d82a:	85 d2                	test   %edx,%edx
   1d82c:	48 0f 49 cf          	cmovns %rdi,%rcx
   1d830:	89 f7                	mov    %esi,%edi
   1d832:	48 89 fa             	mov    %rdi,%rdx
   1d835:	48 09 c2             	or     %rax,%rdx
   1d838:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1d83e:	48 29 f8             	sub    %rdi,%rax
   1d841:	45 31 c0             	xor    %r8d,%r8d
   1d844:	49 39 ca             	cmp    %rcx,%r10
   1d847:	40 0f 92 c7          	setb   %dil
   1d84b:	77 1e                	ja     1d86b <hyperinterval::bounds::Bounds<T>::signs+0x7b>
   1d84d:	85 f6                	test   %esi,%esi
   1d84f:	49 89 d1             	mov    %rdx,%r9
   1d852:	4c 0f 48 c8          	cmovs  %rax,%r9
   1d856:	44 8d 57 02          	lea    0x2(%rdi),%r10d
   1d85a:	4c 39 c9             	cmp    %r9,%rcx
   1d85d:	45 0f b6 ca          	movzbl %r10b,%r9d
   1d861:	41 88 f8             	mov    %dil,%r8b
   1d864:	45 0f 46 c1          	cmovbe %r9d,%r8d
   1d868:	44 89 c7             	mov    %r8d,%edi
   1d86b:	85 f6                	test   %esi,%esi
   1d86d:	48 0f 48 d0          	cmovs  %rax,%rdx
   1d871:	8d 47 04             	lea    0x4(%rdi),%eax
   1d874:	39 ca                	cmp    %ecx,%edx
   1d876:	40 0f b6 cf          	movzbl %dil,%ecx
   1d87a:	0f b6 c0             	movzbl %al,%eax
   1d87d:	0f 46 c1             	cmovbe %ecx,%eax
   1d880:	c3                   	ret
   1d881:	cc                   	int3
   1d882:	cc                   	int3
   1d883:	cc                   	int3
   1d884:	cc                   	int3
   1d885:	cc                   	int3
   1d886:	cc                   	int3
   1d887:	cc                   	int3
   1d888:	cc                   	int3
   1d889:	cc                   	int3
   1d88a:	cc                   	int3
   1d88b:	cc                   	int3
   1d88c:	cc                   	int3
   1d88d:	cc                   	int3
   1d88e:	cc                   	int3
   1d88f:	cc                   	int3

__udivti3:
   5c080:	49 89 d0             	mov    %rdx,%r8
   5c083:	48 85 c9             	test   %rcx,%rcx
   5c086:	74 71                	je     5c0f9 <__udivti3+0x79>
   5c088:	4c 0f bd c9          	bsr    %rcx,%r9
   5c08c:	44 89 ca             	mov    %r9d,%edx
   5c08f:	83 f2 3f             	xor    $0x3f,%edx
   5c092:	b0 40                	mov    $0x40,%al
   5c094:	28 d0                	sub    %dl,%al
   5c096:	4c 89 c2             	mov    %r8,%rdx
   5c099:	49 89 cb             	mov    %rcx,%r11
   5c09c:	89 c1                	mov    %eax,%ecx
   5c09e:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   5c0a2:	4d 89 da             	mov    %r11,%r10
   5c0a5:	49 d3 ea             	shr    %cl,%r10
   5c0a8:	a8 40                	test   $0x40,%al
   5c0aa:	4c 0f 44 d2          	cmove  %rdx,%r10
   5c0ae:	48 89 f0             	mov    %rsi,%rax
   5c0b1:	48 0f a4 f8 3f       	shld   $0x3f,%rdi,%rax
   5c0b6:	48 89 f2             	mov    %rsi,%rdx
   5c0b9:	48 d1 ea             	shr    $1,%rdx
   5c0bc:	49 f7 f2             	div    %r10
   5c0bf:	49 89 c2             	mov    %rax,%r10
   5c0c2:	44 89 c9             	mov    %r9d,%ecx
   5c0c5:	49 d3 ea             	shr    %cl,%r10
   5c0c8:	49 83 fa 01          	cmp    $0x1,%r10
   5c0cc:	49 83 d2 ff          	adc    $0xffffffffffffffff,%r10
   5c0d0:	4d 89 d9             	mov    %r11,%r9
   5c0d3:	4d 0f af ca          	imul   %r10,%r9
   5c0d7:	4c 89 c0             	mov    %r8,%rax
   5c0da:	49 f7 e2             	mul    %r10
   5c0dd:	48 89 c1             	mov    %rax,%rcx
   5c0e0:	4c 89 d0             	mov    %r10,%rax
   5c0e3:	4c 01 ca             	add    %r9,%rdx
   5c0e6:	48 29 cf             	sub    %rcx,%rdi
   5c0e9:	48 19 d6             	sbb    %rdx,%rsi
   5c0ec:	4c 39 c7             	cmp    %r8,%rdi
   5c0ef:	4c 19 de             	sbb    %r11,%rsi
   5c0f2:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   5c0f6:	31 d2                	xor    %edx,%edx
   5c0f8:	c3                   	ret
   5c0f9:	4c 39 c6             	cmp    %r8,%rsi
   5c0fc:	73 0c                	jae    5c10a <__udivti3+0x8a>
   5c0fe:	48 89 f8             	mov    %rdi,%rax
   5c101:	48 89 f2             	mov    %rsi,%rdx
   5c104:	49 f7 f0             	div    %r8
   5c107:	31 d2                	xor    %edx,%edx
   5c109:	c3                   	ret
   5c10a:	48 89 f0             	mov    %rsi,%rax
   5c10d:	4c 09 c0             	or     %r8,%rax
   5c110:	48 c1 e8 20          	shr    $0x20,%rax
   5c114:	74 15                	je     5c12b <__udivti3+0xab>
   5c116:	48 89 f0             	mov    %rsi,%rax
   5c119:	31 d2                	xor    %edx,%edx
   5c11b:	49 f7 f0             	div    %r8
   5c11e:	48 89 c1             	mov    %rax,%rcx
   5c121:	48 89 f8             	mov    %rdi,%rax
   5c124:	49 f7 f0             	div    %r8
   5c127:	48 89 ca             	mov    %rcx,%rdx
   5c12a:	c3                   	ret
   5c12b:	89 f0                	mov    %esi,%eax
   5c12d:	31 d2                	xor    %edx,%edx
   5c12f:	41 f7 f0             	div    %r8d
   5c132:	89 c1                	mov    %eax,%ecx
   5c134:	48 89 f8             	mov    %rdi,%rax
   5c137:	49 f7 f0             	div    %r8
   5c13a:	48 89 ca             	mov    %rcx,%rdx
   5c13d:	c3                   	ret

Disassembly of section .init:
