<hyperinterval::float::F64Enclosure>::abs:
   11260:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   11264:	75 33                	jne    11299 <<hyperinterval::float::F64Enclosure>::abs+0x39>
   11266:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1126a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   11271:	ff ff 7f 
   11274:	48 85 c9             	test   %rcx,%rcx
   11277:	41 0f 99 c0          	setns  %r8b
   1127b:	48 89 c8             	mov    %rcx,%rax
   1127e:	48 21 d0             	and    %rdx,%rax
   11281:	41 0f 94 c1          	sete   %r9b
   11285:	45 08 c1             	or     %r8b,%r9b
   11288:	74 17                	je     112a1 <<hyperinterval::float::F64Enclosure>::abs+0x41>
   1128a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1128e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   11292:	0f 10 06             	movups (%rsi),%xmm0
   11295:	0f 11 07             	movups %xmm0,(%rdi)
   11298:	c3                   	ret
   11299:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   112a0:	c3                   	ret
   112a1:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   112a5:	48 85 f6             	test   %rsi,%rsi
   112a8:	41 0f 98 c1          	sets   %r9b
   112ac:	49 89 f0             	mov    %rsi,%r8
   112af:	49 21 d0             	and    %rdx,%r8
   112b2:	41 0f 95 c2          	setne  %r10b
   112b6:	45 84 d1             	test   %r10b,%r9b
   112b9:	74 10                	je     112cb <<hyperinterval::float::F64Enclosure>::abs+0x6b>
   112bb:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   112c2:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   112c6:	48 89 47 10          	mov    %rax,0x10(%rdi)
   112ca:	c3                   	ret
   112cb:	49 f7 d8             	neg    %r8
   112ce:	48 85 f6             	test   %rsi,%rsi
   112d1:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   112d6:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   112db:	49 0f 49 d1          	cmovns %r9,%rdx
   112df:	48 39 d1             	cmp    %rdx,%rcx
   112e2:	48 0f 46 c6          	cmovbe %rsi,%rax
   112e6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   112ed:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   112f4:	00 
   112f5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   112f9:	c3                   	ret
   112fa:	cc                   	int3
   112fb:	cc                   	int3
   112fc:	cc                   	int3
   112fd:	cc                   	int3
   112fe:	cc                   	int3
   112ff:	cc                   	int3

hyperinterval_strict_chain32:
   11330:	55                   	push   %rbp
   11331:	41 57                	push   %r15
   11333:	41 56                	push   %r14
   11335:	41 55                	push   %r13
   11337:	41 54                	push   %r12
   11339:	53                   	push   %rbx
   1133a:	48 83 ec 68          	sub    $0x68,%rsp
   1133e:	f3 0f 11 4c 24 4c    	movss  %xmm1,0x4c(%rsp)
   11344:	48 89 fb             	mov    %rdi,%rbx
   11347:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   1134d:	66 0f 7e c1          	movd   %xmm0,%ecx
   11351:	48 89 e7             	mov    %rsp,%rdi
   11354:	be 00 00 00 80       	mov    $0x80000000,%esi
   11359:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1135e:	e8 6d 85 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11363:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11367:	74 27                	je     11390 <hyperinterval_strict_chain32+0x60>
   11369:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   1136e:	66 0f 6e 44 24 4c    	movd   0x4c(%rsp),%xmm0
   11374:	66 0f 7e c1          	movd   %xmm0,%ecx
   11378:	48 89 e7             	mov    %rsp,%rdi
   1137b:	be 00 00 00 80       	mov    $0x80000000,%esi
   11380:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11385:	e8 46 85 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1138a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1138e:	75 20                	jne    113b0 <hyperinterval_strict_chain32+0x80>
   11390:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11395:	88 43 04             	mov    %al,0x4(%rbx)
   11398:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1139e:	48 89 d8             	mov    %rbx,%rax
   113a1:	48 83 c4 68          	add    $0x68,%rsp
   113a5:	5b                   	pop    %rbx
   113a6:	41 5c                	pop    %r12
   113a8:	41 5d                	pop    %r13
   113aa:	41 5e                	pop    %r14
   113ac:	41 5f                	pop    %r15
   113ae:	5d                   	pop    %rbp
   113af:	c3                   	ret
   113b0:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   113b5:	44 89 f0             	mov    %r14d,%eax
   113b8:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   113bd:	89 e9                	mov    %ebp,%ecx
   113bf:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   113c5:	ba 00 00 00 80       	mov    $0x80000000,%edx
   113ca:	29 c2                	sub    %eax,%edx
   113cc:	44 09 e0             	or     %r12d,%eax
   113cf:	45 85 f6             	test   %r14d,%r14d
   113d2:	48 0f 49 d0          	cmovns %rax,%rdx
   113d6:	be 00 00 00 80       	mov    $0x80000000,%esi
   113db:	29 ce                	sub    %ecx,%esi
   113dd:	89 c8                	mov    %ecx,%eax
   113df:	44 09 e0             	or     %r12d,%eax
   113e2:	85 ed                	test   %ebp,%ebp
   113e4:	48 0f 49 f0          	cmovns %rax,%rsi
   113e8:	b0 01                	mov    $0x1,%al
   113ea:	39 f2                	cmp    %esi,%edx
   113ec:	77 a7                	ja     11395 <hyperinterval_strict_chain32+0x65>
   113ee:	49 8d 8c 24 00 00 00 	lea    0x3f000000(%r12),%rcx
   113f5:	3f 
   113f6:	48 89 e7             	mov    %rsp,%rdi
   113f9:	be 00 00 00 80       	mov    $0x80000000,%esi
   113fe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11403:	e8 c8 84 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11408:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1140c:	74 82                	je     11390 <hyperinterval_strict_chain32+0x60>
   1140e:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   11413:	48 89 e7             	mov    %rsp,%rdi
   11416:	be 00 00 00 80       	mov    $0x80000000,%esi
   1141b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11420:	b9 00 00 80 3e       	mov    $0x3e800000,%ecx
   11425:	e8 a6 84 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1142a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1142e:	0f 84 5c ff ff ff    	je     11390 <hyperinterval_strict_chain32+0x60>
   11434:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   11439:	48 89 e7             	mov    %rsp,%rdi
   1143c:	be 00 00 00 80       	mov    $0x80000000,%esi
   11441:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11446:	4c 89 f1             	mov    %r14,%rcx
   11449:	4d 89 f8             	mov    %r15,%r8
   1144c:	4d 89 e9             	mov    %r13,%r9
   1144f:	e8 dc a7 00 00       	call   1bc30 <<hyperinterval::ieee::Format>::affine>
   11454:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11458:	0f 84 32 ff ff ff    	je     11390 <hyperinterval_strict_chain32+0x60>
   1145e:	89 e9                	mov    %ebp,%ecx
   11460:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   11464:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   11469:	48 89 e7             	mov    %rsp,%rdi
   1146c:	be 00 00 00 80       	mov    $0x80000000,%esi
   11471:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11476:	4d 89 f8             	mov    %r15,%r8
   11479:	4d 89 e9             	mov    %r13,%r9
   1147c:	e8 af a7 00 00       	call   1bc30 <<hyperinterval::ieee::Format>::affine>
   11481:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11485:	0f 84 05 ff ff ff    	je     11390 <hyperinterval_strict_chain32+0x60>
   1148b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   11490:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   11495:	48 89 e7             	mov    %rsp,%rdi
   11498:	be 00 00 00 80       	mov    $0x80000000,%esi
   1149d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   114a2:	48 89 e9             	mov    %rbp,%rcx
   114a5:	e8 26 84 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   114aa:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   114ae:	74 20                	je     114d0 <hyperinterval_strict_chain32+0x1a0>
   114b0:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   114b5:	48 89 e7             	mov    %rsp,%rdi
   114b8:	be 00 00 00 80       	mov    $0x80000000,%esi
   114bd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   114c2:	4c 89 f1             	mov    %r14,%rcx
   114c5:	e8 06 84 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   114ca:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   114ce:	75 13                	jne    114e3 <hyperinterval_strict_chain32+0x1b3>
   114d0:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   114d5:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   114d9:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   114de:	e9 b2 fe ff ff       	jmp    11395 <hyperinterval_strict_chain32+0x65>
   114e3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   114e7:	89 e9                	mov    %ebp,%ecx
   114e9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   114ef:	89 c2                	mov    %eax,%edx
   114f1:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   114f7:	be 00 00 00 80       	mov    $0x80000000,%esi
   114fc:	29 ce                	sub    %ecx,%esi
   114fe:	44 09 e1             	or     %r12d,%ecx
   11501:	85 ed                	test   %ebp,%ebp
   11503:	48 0f 49 f1          	cmovns %rcx,%rsi
   11507:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1150c:	29 d7                	sub    %edx,%edi
   1150e:	89 d1                	mov    %edx,%ecx
   11510:	44 09 e1             	or     %r12d,%ecx
   11513:	85 c0                	test   %eax,%eax
   11515:	48 0f 49 f9          	cmovns %rcx,%rdi
   11519:	b1 01                	mov    $0x1,%cl
   1151b:	39 fe                	cmp    %edi,%esi
   1151d:	77 b6                	ja     114d5 <hyperinterval_strict_chain32+0x1a5>
   1151f:	89 e9                	mov    %ebp,%ecx
   11521:	c1 e9 08             	shr    $0x8,%ecx
   11524:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   1152b:	00 
   1152c:	40 88 6c 24 38       	mov    %bpl,0x38(%rsp)
   11531:	c1 ed 18             	shr    $0x18,%ebp
   11534:	40 88 6c 24 3b       	mov    %bpl,0x3b(%rsp)
   11539:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   1153e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   11542:	48 89 e7             	mov    %rsp,%rdi
   11545:	4c 89 ee             	mov    %r13,%rsi
   11548:	4c 89 fa             	mov    %r15,%rdx
   1154b:	e8 a0 97 00 00       	call   1acf0 <<hyperinterval::float::F32Enclosure>::from_bits>
   11550:	8b 0c 24             	mov    (%rsp),%ecx
   11553:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   11558:	83 f9 02             	cmp    $0x2,%ecx
   1155b:	75 09                	jne    11566 <hyperinterval_strict_chain32+0x236>
   1155d:	88 44 24 20          	mov    %al,0x20(%rsp)
   11561:	e9 73 ff ff ff       	jmp    114d9 <hyperinterval_strict_chain32+0x1a9>
   11566:	8b 54 24 05          	mov    0x5(%rsp),%edx
   1156a:	8b 74 24 08          	mov    0x8(%rsp),%esi
   1156e:	89 74 24 48          	mov    %esi,0x48(%rsp)
   11572:	89 54 24 45          	mov    %edx,0x45(%rsp)
   11576:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1157a:	88 44 24 44          	mov    %al,0x44(%rsp)
   1157e:	48 8d 7c 24 1c       	lea    0x1c(%rsp),%rdi
   11583:	48 8d 74 24 34       	lea    0x34(%rsp),%rsi
   11588:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   1158d:	e8 0e 96 00 00       	call   1aba0 <<hyperinterval::float::F32Enclosure>::hull>
   11592:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
   11596:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   1159b:	83 f9 02             	cmp    $0x2,%ecx
   1159e:	0f 84 f1 fd ff ff    	je     11395 <hyperinterval_strict_chain32+0x65>
   115a4:	8b 54 24 21          	mov    0x21(%rsp),%edx
   115a8:	8b 74 24 24          	mov    0x24(%rsp),%esi
   115ac:	89 74 24 64          	mov    %esi,0x64(%rsp)
   115b0:	89 54 24 61          	mov    %edx,0x61(%rsp)
   115b4:	89 4c 24 5c          	mov    %ecx,0x5c(%rsp)
   115b8:	88 44 24 60          	mov    %al,0x60(%rsp)
   115bc:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   115c1:	48 8d 74 24 5c       	lea    0x5c(%rsp),%rsi
   115c6:	e8 b5 8e 00 00       	call   1a480 <<hyperinterval::float::F32Enclosure>::square>
   115cb:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   115cf:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   115d4:	83 f9 02             	cmp    $0x2,%ecx
   115d7:	0f 84 b8 fd ff ff    	je     11395 <hyperinterval_strict_chain32+0x65>
   115dd:	8b 54 24 2d          	mov    0x2d(%rsp),%edx
   115e1:	8b 74 24 30          	mov    0x30(%rsp),%esi
   115e5:	89 74 24 24          	mov    %esi,0x24(%rsp)
   115e9:	89 54 24 21          	mov    %edx,0x21(%rsp)
   115ed:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
   115f1:	88 44 24 20          	mov    %al,0x20(%rsp)
   115f5:	48 89 e7             	mov    %rsp,%rdi
   115f8:	be 00 00 00 80       	mov    $0x80000000,%esi
   115fd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11602:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11607:	e8 c4 82 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1160c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11610:	0f 84 7a fd ff ff    	je     11390 <hyperinterval_strict_chain32+0x60>
   11616:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1161b:	89 c1                	mov    %eax,%ecx
   1161d:	c1 e9 08             	shr    $0x8,%ecx
   11620:	89 c2                	mov    %eax,%edx
   11622:	c1 ea 18             	shr    $0x18,%edx
   11625:	88 54 24 3b          	mov    %dl,0x3b(%rsp)
   11629:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   1162e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   11632:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   11639:	00 
   1163a:	88 44 24 38          	mov    %al,0x38(%rsp)
   1163e:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   11643:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   11648:	48 8d 54 24 34       	lea    0x34(%rsp),%rdx
   1164d:	e8 5e 9a 00 00       	call   1b0b0 <<hyperinterval::float::F32Enclosure>::add>
   11652:	8b 44 24 50          	mov    0x50(%rsp),%eax
   11656:	0f b6 4c 24 54       	movzbl 0x54(%rsp),%ecx
   1165b:	83 f8 02             	cmp    $0x2,%eax
   1165e:	75 08                	jne    11668 <hyperinterval_strict_chain32+0x338>
   11660:	88 4b 04             	mov    %cl,0x4(%rbx)
   11663:	e9 30 fd ff ff       	jmp    11398 <hyperinterval_strict_chain32+0x68>
   11668:	8b 54 24 55          	mov    0x55(%rsp),%edx
   1166c:	8b 74 24 58          	mov    0x58(%rsp),%esi
   11670:	89 74 24 30          	mov    %esi,0x30(%rsp)
   11674:	89 54 24 2d          	mov    %edx,0x2d(%rsp)
   11678:	89 44 24 28          	mov    %eax,0x28(%rsp)
   1167c:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
   11680:	85 c0                	test   %eax,%eax
   11682:	74 4c                	je     116d0 <hyperinterval_strict_chain32+0x3a0>
   11684:	48 89 e7             	mov    %rsp,%rdi
   11687:	be 00 00 00 80       	mov    $0x80000000,%esi
   1168c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11691:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11696:	e8 35 82 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1169b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1169f:	74 22                	je     116c3 <hyperinterval_strict_chain32+0x393>
   116a1:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   116a6:	48 89 e7             	mov    %rsp,%rdi
   116a9:	be 00 00 00 80       	mov    $0x80000000,%esi
   116ae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   116b3:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   116b8:	e8 13 82 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   116bd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   116c1:	75 18                	jne    116db <hyperinterval_strict_chain32+0x3ab>
   116c3:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   116c8:	88 4b 04             	mov    %cl,0x4(%rbx)
   116cb:	e9 c8 fc ff ff       	jmp    11398 <hyperinterval_strict_chain32+0x68>
   116d0:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   116d6:	e9 c3 fc ff ff       	jmp    1139e <hyperinterval_strict_chain32+0x6e>
   116db:	8b 44 24 08          	mov    0x8(%rsp),%eax
   116df:	44 89 f1             	mov    %r14d,%ecx
   116e2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   116e8:	89 c2                	mov    %eax,%edx
   116ea:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   116f0:	be 00 00 00 80       	mov    $0x80000000,%esi
   116f5:	29 ce                	sub    %ecx,%esi
   116f7:	44 09 e1             	or     %r12d,%ecx
   116fa:	45 85 f6             	test   %r14d,%r14d
   116fd:	48 0f 49 f1          	cmovns %rcx,%rsi
   11701:	89 d1                	mov    %edx,%ecx
   11703:	44 09 e1             	or     %r12d,%ecx
   11706:	41 29 d4             	sub    %edx,%r12d
   11709:	85 c0                	test   %eax,%eax
   1170b:	4c 0f 49 e1          	cmovns %rcx,%r12
   1170f:	b1 01                	mov    $0x1,%cl
   11711:	44 39 e6             	cmp    %r12d,%esi
   11714:	0f 87 46 ff ff ff    	ja     11660 <hyperinterval_strict_chain32+0x330>
   1171a:	44 89 f1             	mov    %r14d,%ecx
   1171d:	c1 e9 08             	shr    $0x8,%ecx
   11720:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%rsp)
   11727:	00 
   11728:	44 88 74 24 44       	mov    %r14b,0x44(%rsp)
   1172d:	41 c1 ee 18          	shr    $0x18,%r14d
   11731:	44 88 74 24 47       	mov    %r14b,0x47(%rsp)
   11736:	66 89 4c 24 45       	mov    %cx,0x45(%rsp)
   1173b:	89 44 24 48          	mov    %eax,0x48(%rsp)
   1173f:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%rsp)
   11744:	7f 15                	jg     1175b <hyperinterval_strict_chain32+0x42b>
   11746:	8b 44 24 30          	mov    0x30(%rsp),%eax
   1174a:	85 c0                	test   %eax,%eax
   1174c:	0f 99 c1             	setns  %cl
   1174f:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   11754:	0f 94 c0             	sete   %al
   11757:	08 c8                	or     %cl,%al
   11759:	75 17                	jne    11772 <hyperinterval_strict_chain32+0x442>
   1175b:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   11760:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   11765:	48 89 df             	mov    %rbx,%rdi
   11768:	e8 a3 81 00 00       	call   19910 <<hyperinterval::float::F32Enclosure>::corner_image>
   1176d:	e9 2c fc ff ff       	jmp    1139e <hyperinterval_strict_chain32+0x6e>
   11772:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   11776:	e9 1d fc ff ff       	jmp    11398 <hyperinterval_strict_chain32+0x68>
   1177b:	cc                   	int3
   1177c:	cc                   	int3
   1177d:	cc                   	int3
   1177e:	cc                   	int3
   1177f:	cc                   	int3

hyperinterval_strict_chain64:
   11780:	55                   	push   %rbp
   11781:	41 57                	push   %r15
   11783:	41 56                	push   %r14
   11785:	41 55                	push   %r13
   11787:	41 54                	push   %r12
   11789:	53                   	push   %rbx
   1178a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   11791:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   11797:	48 89 fb             	mov    %rdi,%rbx
   1179a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   117a1:	00 00 80 
   117a4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   117ab:	00 f0 7f 
   117ae:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   117b3:	48 89 e7             	mov    %rsp,%rdi
   117b6:	4c 89 f6             	mov    %r14,%rsi
   117b9:	4c 89 fa             	mov    %r15,%rdx
   117bc:	e8 0f 81 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   117c1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   117c5:	74 24                	je     117eb <hyperinterval_strict_chain64+0x6b>
   117c7:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   117cc:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   117d2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   117d7:	48 89 e7             	mov    %rsp,%rdi
   117da:	4c 89 f6             	mov    %r14,%rsi
   117dd:	4c 89 fa             	mov    %r15,%rdx
   117e0:	e8 eb 80 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   117e5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   117e9:	75 24                	jne    1180f <hyperinterval_strict_chain64+0x8f>
   117eb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   117f0:	88 43 08             	mov    %al,0x8(%rbx)
   117f3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   117fa:	48 89 d8             	mov    %rbx,%rax
   117fd:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   11804:	5b                   	pop    %rbx
   11805:	41 5c                	pop    %r12
   11807:	41 5d                	pop    %r13
   11809:	41 5e                	pop    %r14
   1180b:	41 5f                	pop    %r15
   1180d:	5d                   	pop    %rbp
   1180e:	c3                   	ret
   1180f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   11814:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   11818:	49 8d 6e ff          	lea    -0x1(%r14),%rbp
   1181c:	4c 89 e9             	mov    %r13,%rcx
   1181f:	48 21 e9             	and    %rbp,%rcx
   11822:	4c 89 f2             	mov    %r14,%rdx
   11825:	48 29 ca             	sub    %rcx,%rdx
   11828:	4d 85 ed             	test   %r13,%r13
   1182b:	48 0f 49 d0          	cmovns %rax,%rdx
   1182f:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   11833:	4c 89 e1             	mov    %r12,%rcx
   11836:	48 21 e9             	and    %rbp,%rcx
   11839:	4c 89 f6             	mov    %r14,%rsi
   1183c:	48 29 ce             	sub    %rcx,%rsi
   1183f:	4d 85 e4             	test   %r12,%r12
   11842:	48 0f 49 f0          	cmovns %rax,%rsi
   11846:	b0 01                	mov    $0x1,%al
   11848:	48 39 f2             	cmp    %rsi,%rdx
   1184b:	77 a3                	ja     117f0 <hyperinterval_strict_chain64+0x70>
   1184d:	48 89 e7             	mov    %rsp,%rdi
   11850:	48 b9 00 00 00 00 00 	movabs $0xbfe0000000000000,%rcx
   11857:	00 e0 bf 
   1185a:	4c 89 f6             	mov    %r14,%rsi
   1185d:	4c 89 fa             	mov    %r15,%rdx
   11860:	e8 6b 80 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11865:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11869:	74 80                	je     117eb <hyperinterval_strict_chain64+0x6b>
   1186b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11870:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   11875:	48 89 e7             	mov    %rsp,%rdi
   11878:	48 b9 00 00 00 00 00 	movabs $0x3fd0000000000000,%rcx
   1187f:	00 d0 3f 
   11882:	4c 89 f6             	mov    %r14,%rsi
   11885:	4c 89 fa             	mov    %r15,%rdx
   11888:	e8 43 80 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1188d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11891:	0f 84 54 ff ff ff    	je     117eb <hyperinterval_strict_chain64+0x6b>
   11897:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1189c:	48 89 e7             	mov    %rsp,%rdi
   1189f:	4c 89 f6             	mov    %r14,%rsi
   118a2:	4c 89 fa             	mov    %r15,%rdx
   118a5:	4c 89 e9             	mov    %r13,%rcx
   118a8:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   118ad:	4d 89 cd             	mov    %r9,%r13
   118b0:	e8 7b a3 00 00       	call   1bc30 <<hyperinterval::ieee::Format>::affine>
   118b5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   118b9:	0f 84 2c ff ff ff    	je     117eb <hyperinterval_strict_chain64+0x6b>
   118bf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   118c4:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   118cb:	00 
   118cc:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   118d1:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   118d8:	00 
   118d9:	48 89 e7             	mov    %rsp,%rdi
   118dc:	4c 89 f6             	mov    %r14,%rsi
   118df:	4c 89 fa             	mov    %r15,%rdx
   118e2:	4c 89 e1             	mov    %r12,%rcx
   118e5:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   118ea:	4d 89 e9             	mov    %r13,%r9
   118ed:	e8 3e a3 00 00       	call   1bc30 <<hyperinterval::ieee::Format>::affine>
   118f2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   118f6:	0f 84 ef fe ff ff    	je     117eb <hyperinterval_strict_chain64+0x6b>
   118fc:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   11901:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11906:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1190b:	48 89 e7             	mov    %rsp,%rdi
   1190e:	4c 89 f6             	mov    %r14,%rsi
   11911:	4c 89 fa             	mov    %r15,%rdx
   11914:	48 8b 8c 24 a0 00 00 	mov    0xa0(%rsp),%rcx
   1191b:	00 
   1191c:	e8 af 7f 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11921:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11925:	74 21                	je     11948 <hyperinterval_strict_chain64+0x1c8>
   11927:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1192c:	48 89 e7             	mov    %rsp,%rdi
   1192f:	4c 89 f6             	mov    %r14,%rsi
   11932:	4c 89 fa             	mov    %r15,%rdx
   11935:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   1193c:	00 
   1193d:	e8 8e 7f 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11942:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11946:	75 13                	jne    1195b <hyperinterval_strict_chain64+0x1db>
   11948:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1194d:	88 4c 24 28          	mov    %cl,0x28(%rsp)
   11951:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   11956:	e9 95 fe ff ff       	jmp    117f0 <hyperinterval_strict_chain64+0x70>
   1195b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11960:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   11964:	4c 89 ea             	mov    %r13,%rdx
   11967:	48 21 ea             	and    %rbp,%rdx
   1196a:	4c 89 f6             	mov    %r14,%rsi
   1196d:	48 29 d6             	sub    %rdx,%rsi
   11970:	4d 85 ed             	test   %r13,%r13
   11973:	48 0f 49 f1          	cmovns %rcx,%rsi
   11977:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1197b:	48 89 c2             	mov    %rax,%rdx
   1197e:	48 21 ea             	and    %rbp,%rdx
   11981:	4c 89 f7             	mov    %r14,%rdi
   11984:	48 29 d7             	sub    %rdx,%rdi
   11987:	48 85 c0             	test   %rax,%rax
   1198a:	48 0f 49 f9          	cmovns %rcx,%rdi
   1198e:	b1 01                	mov    $0x1,%cl
   11990:	48 39 fe             	cmp    %rdi,%rsi
   11993:	77 b8                	ja     1194d <hyperinterval_strict_chain64+0x1cd>
   11995:	48 c7 84 24 80 00 00 	movq   $0x1,0x80(%rsp)
   1199c:	00 01 00 00 00 
   119a1:	4c 89 ac 24 88 00 00 	mov    %r13,0x88(%rsp)
   119a8:	00 
   119a9:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   119b0:	00 
   119b1:	48 89 e7             	mov    %rsp,%rdi
   119b4:	4c 89 e6             	mov    %r12,%rsi
   119b7:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
   119bc:	e8 8f b3 00 00       	call   1cd50 <<hyperinterval::float::F64Enclosure>::from_bits>
   119c1:	48 8b 0c 24          	mov    (%rsp),%rcx
   119c5:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   119ca:	48 83 f9 02          	cmp    $0x2,%rcx
   119ce:	75 09                	jne    119d9 <hyperinterval_strict_chain64+0x259>
   119d0:	88 44 24 28          	mov    %al,0x28(%rsp)
   119d4:	e9 78 ff ff ff       	jmp    11951 <hyperinterval_strict_chain64+0x1d1>
   119d9:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   119de:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   119e3:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   119e8:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   119ed:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   119f2:	88 44 24 70          	mov    %al,0x70(%rsp)
   119f6:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   119fb:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   11a02:	00 
   11a03:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   11a08:	e8 e3 b1 00 00       	call   1cbf0 <<hyperinterval::float::F64Enclosure>::hull>
   11a0d:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   11a12:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   11a17:	48 83 f9 02          	cmp    $0x2,%rcx
   11a1b:	0f 84 cf fd ff ff    	je     117f0 <hyperinterval_strict_chain64+0x70>
   11a21:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   11a26:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   11a2b:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   11a32:	00 
   11a33:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   11a3a:	00 
   11a3b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   11a42:	00 
   11a43:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   11a4a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   11a4f:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   11a56:	00 
   11a57:	e8 54 ae 00 00       	call   1c8b0 <<hyperinterval::float::F64Enclosure>::square>
   11a5c:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   11a61:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   11a66:	48 83 f9 02          	cmp    $0x2,%rcx
   11a6a:	0f 84 80 fd ff ff    	je     117f0 <hyperinterval_strict_chain64+0x70>
   11a70:	49 bc 00 00 00 00 00 	movabs $0x3ff0000000000000,%r12
   11a77:	00 f0 3f 
   11a7a:	48 8b 54 24 59       	mov    0x59(%rsp),%rdx
   11a7f:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   11a84:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   11a89:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   11a8e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   11a93:	88 44 24 28          	mov    %al,0x28(%rsp)
   11a97:	48 89 e7             	mov    %rsp,%rdi
   11a9a:	4c 89 f6             	mov    %r14,%rsi
   11a9d:	4c 89 fa             	mov    %r15,%rdx
   11aa0:	4c 89 e1             	mov    %r12,%rcx
   11aa3:	e8 28 7e 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11aa8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11aac:	0f 84 39 fd ff ff    	je     117eb <hyperinterval_strict_chain64+0x6b>
   11ab2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11ab7:	48 89 c1             	mov    %rax,%rcx
   11aba:	48 c1 e9 08          	shr    $0x8,%rcx
   11abe:	48 89 c2             	mov    %rax,%rdx
   11ac1:	48 c1 ea 38          	shr    $0x38,%rdx
   11ac5:	88 54 24 77          	mov    %dl,0x77(%rsp)
   11ac9:	48 89 c2             	mov    %rax,%rdx
   11acc:	48 c1 ea 28          	shr    $0x28,%rdx
   11ad0:	66 89 54 24 75       	mov    %dx,0x75(%rsp)
   11ad5:	89 4c 24 71          	mov    %ecx,0x71(%rsp)
   11ad9:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   11ade:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   11ae5:	00 00 
   11ae7:	88 44 24 70          	mov    %al,0x70(%rsp)
   11aeb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   11af0:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   11af5:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   11afa:	e8 71 b5 00 00       	call   1d070 <<hyperinterval::float::F64Enclosure>::add>
   11aff:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   11b04:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
   11b09:	48 83 f8 02          	cmp    $0x2,%rax
   11b0d:	75 08                	jne    11b17 <hyperinterval_strict_chain64+0x397>
   11b0f:	88 4b 08             	mov    %cl,0x8(%rbx)
   11b12:	e9 dc fc ff ff       	jmp    117f3 <hyperinterval_strict_chain64+0x73>
   11b17:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   11b1c:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   11b21:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   11b26:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   11b2b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   11b30:	88 4c 24 58          	mov    %cl,0x58(%rsp)
   11b34:	48 85 c0             	test   %rax,%rax
   11b37:	74 46                	je     11b7f <hyperinterval_strict_chain64+0x3ff>
   11b39:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   11b3e:	4c 89 f6             	mov    %r14,%rsi
   11b41:	4c 89 fa             	mov    %r15,%rdx
   11b44:	4c 89 e1             	mov    %r12,%rcx
   11b47:	e8 84 7d 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11b4c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   11b51:	74 1f                	je     11b72 <hyperinterval_strict_chain64+0x3f2>
   11b53:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
   11b58:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   11b5d:	4c 89 f6             	mov    %r14,%rsi
   11b60:	4c 89 fa             	mov    %r15,%rdx
   11b63:	4c 89 e1             	mov    %r12,%rcx
   11b66:	e8 65 7d 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11b6b:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   11b70:	75 19                	jne    11b8b <hyperinterval_strict_chain64+0x40b>
   11b72:	0f b6 4c 24 39       	movzbl 0x39(%rsp),%ecx
   11b77:	88 4b 08             	mov    %cl,0x8(%rbx)
   11b7a:	e9 74 fc ff ff       	jmp    117f3 <hyperinterval_strict_chain64+0x73>
   11b7f:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   11b86:	e9 6f fc ff ff       	jmp    117fa <hyperinterval_strict_chain64+0x7a>
   11b8b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   11b90:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   11b94:	4c 89 ea             	mov    %r13,%rdx
   11b97:	48 21 ea             	and    %rbp,%rdx
   11b9a:	4c 89 f6             	mov    %r14,%rsi
   11b9d:	48 29 d6             	sub    %rdx,%rsi
   11ba0:	4d 85 ed             	test   %r13,%r13
   11ba3:	48 0f 49 f1          	cmovns %rcx,%rsi
   11ba7:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   11bab:	48 89 c2             	mov    %rax,%rdx
   11bae:	48 21 ea             	and    %rbp,%rdx
   11bb1:	49 29 d6             	sub    %rdx,%r14
   11bb4:	48 85 c0             	test   %rax,%rax
   11bb7:	4c 0f 49 f1          	cmovns %rcx,%r14
   11bbb:	b1 01                	mov    $0x1,%cl
   11bbd:	4c 39 f6             	cmp    %r14,%rsi
   11bc0:	0f 87 49 ff ff ff    	ja     11b0f <hyperinterval_strict_chain64+0x38f>
   11bc6:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   11bcd:	00 
   11bce:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
   11bd3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   11bd8:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
   11bde:	7f 0f                	jg     11bef <hyperinterval_strict_chain64+0x46f>
   11be0:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   11be5:	48 85 c0             	test   %rax,%rax
   11be8:	79 1a                	jns    11c04 <hyperinterval_strict_chain64+0x484>
   11bea:	48 21 e8             	and    %rbp,%rax
   11bed:	74 15                	je     11c04 <hyperinterval_strict_chain64+0x484>
   11bef:	48 89 e6             	mov    %rsp,%rsi
   11bf2:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
   11bf7:	48 89 df             	mov    %rbx,%rdi
   11bfa:	e8 21 a8 00 00       	call   1c420 <<hyperinterval::float::F64Enclosure>::corner_image>
   11bff:	e9 f6 fb ff ff       	jmp    117fa <hyperinterval_strict_chain64+0x7a>
   11c04:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   11c08:	e9 e6 fb ff ff       	jmp    117f3 <hyperinterval_strict_chain64+0x73>
   11c0d:	cc                   	int3
   11c0e:	cc                   	int3
   11c0f:	cc                   	int3

hyperinterval_strict_sqrt32:
   11c10:	55                   	push   %rbp
   11c11:	41 57                	push   %r15
   11c13:	41 56                	push   %r14
   11c15:	41 55                	push   %r13
   11c17:	41 54                	push   %r12
   11c19:	53                   	push   %rbx
   11c1a:	48 83 ec 28          	sub    $0x28,%rsp
   11c1e:	f3 0f 11 4c 24 24    	movss  %xmm1,0x24(%rsp)
   11c24:	48 89 fb             	mov    %rdi,%rbx
   11c27:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   11c2d:	66 0f 7e c1          	movd   %xmm0,%ecx
   11c31:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11c36:	be 00 00 00 80       	mov    $0x80000000,%esi
   11c3b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11c40:	e8 8b 7c 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11c45:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11c4a:	74 2a                	je     11c76 <hyperinterval_strict_sqrt32+0x66>
   11c4c:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   11c51:	66 0f 6e 44 24 24    	movd   0x24(%rsp),%xmm0
   11c57:	66 0f 7e c1          	movd   %xmm0,%ecx
   11c5b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11c60:	be 00 00 00 80       	mov    $0x80000000,%esi
   11c65:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11c6a:	e8 61 7c 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11c6f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11c74:	75 20                	jne    11c96 <hyperinterval_strict_sqrt32+0x86>
   11c76:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   11c7b:	88 43 04             	mov    %al,0x4(%rbx)
   11c7e:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   11c84:	48 89 d8             	mov    %rbx,%rax
   11c87:	48 83 c4 28          	add    $0x28,%rsp
   11c8b:	5b                   	pop    %rbx
   11c8c:	41 5c                	pop    %r12
   11c8e:	41 5d                	pop    %r13
   11c90:	41 5e                	pop    %r14
   11c92:	41 5f                	pop    %r15
   11c94:	5d                   	pop    %rbp
   11c95:	c3                   	ret
   11c96:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   11c9b:	44 89 f8             	mov    %r15d,%eax
   11c9e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   11ca3:	44 89 e9             	mov    %r13d,%ecx
   11ca6:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11cac:	ba 00 00 00 80       	mov    $0x80000000,%edx
   11cb1:	29 c2                	sub    %eax,%edx
   11cb3:	44 09 e0             	or     %r12d,%eax
   11cb6:	45 85 ff             	test   %r15d,%r15d
   11cb9:	48 0f 49 d0          	cmovns %rax,%rdx
   11cbd:	be 00 00 00 80       	mov    $0x80000000,%esi
   11cc2:	29 ce                	sub    %ecx,%esi
   11cc4:	89 c8                	mov    %ecx,%eax
   11cc6:	44 09 e0             	or     %r12d,%eax
   11cc9:	45 85 ed             	test   %r13d,%r13d
   11ccc:	48 0f 49 f0          	cmovns %rax,%rsi
   11cd0:	b0 01                	mov    $0x1,%al
   11cd2:	39 f2                	cmp    %esi,%edx
   11cd4:	77 a5                	ja     11c7b <hyperinterval_strict_sqrt32+0x6b>
   11cd6:	45 89 ee             	mov    %r13d,%r14d
   11cd9:	45 85 ed             	test   %r13d,%r13d
   11cdc:	0f 98 c0             	sets   %al
   11cdf:	4c 89 f1             	mov    %r14,%rcx
   11ce2:	48 c1 e1 21          	shl    $0x21,%rcx
   11ce6:	0f 95 c1             	setne  %cl
   11ce9:	84 c8                	test   %cl,%al
   11ceb:	74 06                	je     11cf3 <hyperinterval_strict_sqrt32+0xe3>
   11ced:	c6 43 04 05          	movb   $0x5,0x4(%rbx)
   11cf1:	eb 8b                	jmp    11c7e <hyperinterval_strict_sqrt32+0x6e>
   11cf3:	44 89 f8             	mov    %r15d,%eax
   11cf6:	25 00 ff ff ff       	and    $0xffffff00,%eax
   11cfb:	41 0f b6 ef          	movzbl %r15b,%ebp
   11cff:	09 c5                	or     %eax,%ebp
   11d01:	89 e8                	mov    %ebp,%eax
   11d03:	45 85 ff             	test   %r15d,%r15d
   11d06:	0f 98 c1             	sets   %cl
   11d09:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   11d0e:	41 0f 95 c7          	setne  %r15b
   11d12:	31 d2                	xor    %edx,%edx
   11d14:	41 20 cf             	and    %cl,%r15b
   11d17:	48 0f 44 d0          	cmove  %rax,%rdx
   11d1b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11d20:	be 00 00 80 7f       	mov    $0x7f800000,%esi
   11d25:	e8 e6 97 00 00       	call   1b510 <<hyperinterval::ieee::Format>::sqrt>
   11d2a:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   11d2f:	0f 85 41 ff ff ff    	jne    11c76 <hyperinterval_strict_sqrt32+0x66>
   11d35:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   11d39:	44 39 ed             	cmp    %r13d,%ebp
   11d3c:	75 07                	jne    11d45 <hyperinterval_strict_sqrt32+0x135>
   11d3e:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   11d43:	eb 28                	jmp    11d6d <hyperinterval_strict_sqrt32+0x15d>
   11d45:	49 89 cd             	mov    %rcx,%r13
   11d48:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11d4d:	be 00 00 80 7f       	mov    $0x7f800000,%esi
   11d52:	4c 89 f2             	mov    %r14,%rdx
   11d55:	e8 b6 97 00 00       	call   1b510 <<hyperinterval::ieee::Format>::sqrt>
   11d5a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11d5f:	0f 84 11 ff ff ff    	je     11c76 <hyperinterval_strict_sqrt32+0x66>
   11d65:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   11d6a:	4c 89 e9             	mov    %r13,%rcx
   11d6d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11d72:	be 00 00 00 80       	mov    $0x80000000,%esi
   11d77:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11d7c:	e8 4f 7b 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11d81:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11d86:	74 23                	je     11dab <hyperinterval_strict_sqrt32+0x19b>
   11d88:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   11d8d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11d92:	be 00 00 00 80       	mov    $0x80000000,%esi
   11d97:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11d9c:	4c 89 f1             	mov    %r14,%rcx
   11d9f:	e8 2c 7b 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11da4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11da9:	75 0d                	jne    11db8 <hyperinterval_strict_sqrt32+0x1a8>
   11dab:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   11db0:	88 4b 04             	mov    %cl,0x4(%rbx)
   11db3:	e9 c6 fe ff ff       	jmp    11c7e <hyperinterval_strict_sqrt32+0x6e>
   11db8:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11dbc:	44 89 e9             	mov    %r13d,%ecx
   11dbf:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11dc5:	89 c2                	mov    %eax,%edx
   11dc7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11dcd:	be 00 00 00 80       	mov    $0x80000000,%esi
   11dd2:	29 ce                	sub    %ecx,%esi
   11dd4:	44 09 e1             	or     %r12d,%ecx
   11dd7:	45 85 ed             	test   %r13d,%r13d
   11dda:	48 0f 49 f1          	cmovns %rcx,%rsi
   11dde:	89 d1                	mov    %edx,%ecx
   11de0:	44 09 e1             	or     %r12d,%ecx
   11de3:	41 29 d4             	sub    %edx,%r12d
   11de6:	85 c0                	test   %eax,%eax
   11de8:	4c 0f 49 e1          	cmovns %rcx,%r12
   11dec:	b1 01                	mov    $0x1,%cl
   11dee:	44 39 e6             	cmp    %r12d,%esi
   11df1:	77 bd                	ja     11db0 <hyperinterval_strict_sqrt32+0x1a0>
   11df3:	44 89 e9             	mov    %r13d,%ecx
   11df6:	c1 e9 08             	shr    $0x8,%ecx
   11df9:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   11dff:	44 88 6b 04          	mov    %r13b,0x4(%rbx)
   11e03:	41 c1 ed 18          	shr    $0x18,%r13d
   11e07:	44 88 6b 07          	mov    %r13b,0x7(%rbx)
   11e0b:	66 89 4b 05          	mov    %cx,0x5(%rbx)
   11e0f:	89 43 08             	mov    %eax,0x8(%rbx)
   11e12:	44 88 7b 0c          	mov    %r15b,0xc(%rbx)
   11e16:	e9 69 fe ff ff       	jmp    11c84 <hyperinterval_strict_sqrt32+0x74>
   11e1b:	cc                   	int3
   11e1c:	cc                   	int3
   11e1d:	cc                   	int3
   11e1e:	cc                   	int3
   11e1f:	cc                   	int3

hyperinterval_strict_sqrt64:
   11e20:	55                   	push   %rbp
   11e21:	41 57                	push   %r15
   11e23:	41 56                	push   %r14
   11e25:	41 55                	push   %r13
   11e27:	41 54                	push   %r12
   11e29:	53                   	push   %rbx
   11e2a:	48 83 ec 28          	sub    $0x28,%rsp
   11e2e:	f2 0f 11 4c 24 20    	movsd  %xmm1,0x20(%rsp)
   11e34:	48 89 fb             	mov    %rdi,%rbx
   11e37:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   11e3e:	00 00 80 
   11e41:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   11e48:	00 f0 7f 
   11e4b:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   11e50:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11e55:	4c 89 f6             	mov    %r14,%rsi
   11e58:	4c 89 fa             	mov    %r15,%rdx
   11e5b:	e8 70 7a 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11e60:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11e65:	74 27                	je     11e8e <hyperinterval_strict_sqrt64+0x6e>
   11e67:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   11e6c:	f3 0f 7e 44 24 20    	movq   0x20(%rsp),%xmm0
   11e72:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   11e77:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11e7c:	4c 89 f6             	mov    %r14,%rsi
   11e7f:	4c 89 fa             	mov    %r15,%rdx
   11e82:	e8 49 7a 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11e87:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11e8c:	75 21                	jne    11eaf <hyperinterval_strict_sqrt64+0x8f>
   11e8e:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   11e93:	88 4b 08             	mov    %cl,0x8(%rbx)
   11e96:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   11e9d:	48 89 d8             	mov    %rbx,%rax
   11ea0:	48 83 c4 28          	add    $0x28,%rsp
   11ea4:	5b                   	pop    %rbx
   11ea5:	41 5c                	pop    %r12
   11ea7:	41 5d                	pop    %r13
   11ea9:	41 5e                	pop    %r14
   11eab:	41 5f                	pop    %r15
   11ead:	5d                   	pop    %rbp
   11eae:	c3                   	ret
   11eaf:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   11eb4:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   11eb8:	49 8d 6e ff          	lea    -0x1(%r14),%rbp
   11ebc:	4c 89 e9             	mov    %r13,%rcx
   11ebf:	48 21 e9             	and    %rbp,%rcx
   11ec2:	4c 89 f2             	mov    %r14,%rdx
   11ec5:	48 29 ca             	sub    %rcx,%rdx
   11ec8:	4d 85 ed             	test   %r13,%r13
   11ecb:	48 0f 49 d0          	cmovns %rax,%rdx
   11ecf:	4b 8d 0c 34          	lea    (%r12,%r14,1),%rcx
   11ed3:	4c 89 e0             	mov    %r12,%rax
   11ed6:	48 21 e8             	and    %rbp,%rax
   11ed9:	4c 89 f6             	mov    %r14,%rsi
   11edc:	48 29 c6             	sub    %rax,%rsi
   11edf:	4d 85 e4             	test   %r12,%r12
   11ee2:	48 0f 49 f1          	cmovns %rcx,%rsi
   11ee6:	b1 01                	mov    $0x1,%cl
   11ee8:	48 39 f2             	cmp    %rsi,%rdx
   11eeb:	77 a6                	ja     11e93 <hyperinterval_strict_sqrt64+0x73>
   11eed:	4d 85 e4             	test   %r12,%r12
   11ef0:	0f 98 c1             	sets   %cl
   11ef3:	48 85 c0             	test   %rax,%rax
   11ef6:	0f 95 c0             	setne  %al
   11ef9:	84 c1                	test   %al,%cl
   11efb:	74 06                	je     11f03 <hyperinterval_strict_sqrt64+0xe3>
   11efd:	c6 43 08 05          	movb   $0x5,0x8(%rbx)
   11f01:	eb 93                	jmp    11e96 <hyperinterval_strict_sqrt64+0x76>
   11f03:	4d 85 ed             	test   %r13,%r13
   11f06:	0f 98 c0             	sets   %al
   11f09:	49 85 ed             	test   %rbp,%r13
   11f0c:	0f 95 c1             	setne  %cl
   11f0f:	31 d2                	xor    %edx,%edx
   11f11:	20 c1                	and    %al,%cl
   11f13:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   11f17:	49 0f 44 d5          	cmove  %r13,%rdx
   11f1b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11f20:	4c 89 fe             	mov    %r15,%rsi
   11f23:	e8 e8 95 00 00       	call   1b510 <<hyperinterval::ieee::Format>::sqrt>
   11f28:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   11f2d:	74 0d                	je     11f3c <hyperinterval_strict_sqrt64+0x11c>
   11f2f:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   11f34:	88 43 08             	mov    %al,0x8(%rbx)
   11f37:	e9 5a ff ff ff       	jmp    11e96 <hyperinterval_strict_sqrt64+0x76>
   11f3c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
   11f41:	4d 39 e5             	cmp    %r12,%r13
   11f44:	75 07                	jne    11f4d <hyperinterval_strict_sqrt64+0x12d>
   11f46:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   11f4b:	eb 22                	jmp    11f6f <hyperinterval_strict_sqrt64+0x14f>
   11f4d:	49 89 cd             	mov    %rcx,%r13
   11f50:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11f55:	4c 89 fe             	mov    %r15,%rsi
   11f58:	4c 89 e2             	mov    %r12,%rdx
   11f5b:	e8 b0 95 00 00       	call   1b510 <<hyperinterval::ieee::Format>::sqrt>
   11f60:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11f65:	74 c8                	je     11f2f <hyperinterval_strict_sqrt64+0x10f>
   11f67:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
   11f6c:	4c 89 e9             	mov    %r13,%rcx
   11f6f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11f74:	4c 89 f6             	mov    %r14,%rsi
   11f77:	4c 89 fa             	mov    %r15,%rdx
   11f7a:	e8 51 79 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11f7f:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11f84:	0f 84 04 ff ff ff    	je     11e8e <hyperinterval_strict_sqrt64+0x6e>
   11f8a:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   11f8f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11f94:	4c 89 f6             	mov    %r14,%rsi
   11f97:	4c 89 fa             	mov    %r15,%rdx
   11f9a:	4c 89 e1             	mov    %r12,%rcx
   11f9d:	e8 2e 79 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   11fa2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11fa7:	0f 84 e1 fe ff ff    	je     11e8e <hyperinterval_strict_sqrt64+0x6e>
   11fad:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11fb2:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   11fb6:	4c 89 ea             	mov    %r13,%rdx
   11fb9:	48 21 ea             	and    %rbp,%rdx
   11fbc:	4c 89 f6             	mov    %r14,%rsi
   11fbf:	48 29 d6             	sub    %rdx,%rsi
   11fc2:	4d 85 ed             	test   %r13,%r13
   11fc5:	48 0f 49 f1          	cmovns %rcx,%rsi
   11fc9:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   11fcd:	48 21 c5             	and    %rax,%rbp
   11fd0:	49 29 ee             	sub    %rbp,%r14
   11fd3:	48 85 c0             	test   %rax,%rax
   11fd6:	4c 0f 49 f1          	cmovns %rcx,%r14
   11fda:	b1 01                	mov    $0x1,%cl
   11fdc:	4c 39 f6             	cmp    %r14,%rsi
   11fdf:	0f 87 ae fe ff ff    	ja     11e93 <hyperinterval_strict_sqrt64+0x73>
   11fe5:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   11fec:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   11ff0:	48 89 43 10          	mov    %rax,0x10(%rbx)
   11ff4:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   11ff9:	88 43 18             	mov    %al,0x18(%rbx)
   11ffc:	e9 9c fe ff ff       	jmp    11e9d <hyperinterval_strict_sqrt64+0x7d>
   12001:	cc                   	int3
   12002:	cc                   	int3
   12003:	cc                   	int3
   12004:	cc                   	int3
   12005:	cc                   	int3
   12006:	cc                   	int3
   12007:	cc                   	int3
   12008:	cc                   	int3
   12009:	cc                   	int3
   1200a:	cc                   	int3
   1200b:	cc                   	int3
   1200c:	cc                   	int3
   1200d:	cc                   	int3
   1200e:	cc                   	int3
   1200f:	cc                   	int3

hyperinterval_strict_surface32:
   12010:	55                   	push   %rbp
   12011:	41 57                	push   %r15
   12013:	41 56                	push   %r14
   12015:	41 55                	push   %r13
   12017:	41 54                	push   %r12
   12019:	53                   	push   %rbx
   1201a:	48 81 ec c8 00 00 00 	sub    $0xc8,%rsp
   12021:	41 89 f7             	mov    %esi,%r15d
   12024:	66 0f 7e 4c 24 58    	movd   %xmm1,0x58(%rsp)
   1202a:	48 89 fd             	mov    %rdi,%rbp
   1202d:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   12033:	66 0f 7e 84 24 94 00 	movd   %xmm0,0x94(%rsp)
   1203a:	00 00 
   1203c:	66 0f 7e c3          	movd   %xmm0,%ebx
   12040:	48 89 e7             	mov    %rsp,%rdi
   12043:	be 00 00 00 80       	mov    $0x80000000,%esi
   12048:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1204d:	48 89 d9             	mov    %rbx,%rcx
   12050:	e8 7b 78 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12055:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12059:	74 2b                	je     12086 <hyperinterval_strict_surface32+0x76>
   1205b:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   12060:	66 0f 6e 44 24 58    	movd   0x58(%rsp),%xmm0
   12066:	66 41 0f 7e c6       	movd   %xmm0,%r14d
   1206b:	48 89 e7             	mov    %rsp,%rdi
   1206e:	be 00 00 00 80       	mov    $0x80000000,%esi
   12073:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   12078:	4c 89 f1             	mov    %r14,%rcx
   1207b:	e8 50 78 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12080:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12084:	75 24                	jne    120aa <hyperinterval_strict_surface32+0x9a>
   12086:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1208b:	88 45 04             	mov    %al,0x4(%rbp)
   1208e:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   12095:	48 89 e8             	mov    %rbp,%rax
   12098:	48 81 c4 c8 00 00 00 	add    $0xc8,%rsp
   1209f:	5b                   	pop    %rbx
   120a0:	41 5c                	pop    %r12
   120a2:	41 5d                	pop    %r13
   120a4:	41 5e                	pop    %r14
   120a6:	41 5f                	pop    %r15
   120a8:	5d                   	pop    %rbp
   120a9:	c3                   	ret
   120aa:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   120af:	44 89 e0             	mov    %r12d,%eax
   120b2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   120b7:	89 f9                	mov    %edi,%ecx
   120b9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   120bf:	ba 00 00 00 80       	mov    $0x80000000,%edx
   120c4:	29 c2                	sub    %eax,%edx
   120c6:	44 09 e8             	or     %r13d,%eax
   120c9:	45 85 e4             	test   %r12d,%r12d
   120cc:	48 0f 49 d0          	cmovns %rax,%rdx
   120d0:	be 00 00 00 80       	mov    $0x80000000,%esi
   120d5:	29 ce                	sub    %ecx,%esi
   120d7:	89 c8                	mov    %ecx,%eax
   120d9:	44 09 e8             	or     %r13d,%eax
   120dc:	85 ff                	test   %edi,%edi
   120de:	48 0f 49 f0          	cmovns %rax,%rsi
   120e2:	b0 01                	mov    $0x1,%al
   120e4:	39 f2                	cmp    %esi,%edx
   120e6:	77 a3                	ja     1208b <hyperinterval_strict_surface32+0x7b>
   120e8:	44 89 e0             	mov    %r12d,%eax
   120eb:	44 89 e1             	mov    %r12d,%ecx
   120ee:	c1 e9 08             	shr    $0x8,%ecx
   120f1:	41 c1 ec 18          	shr    $0x18,%r12d
   120f5:	44 88 64 24 53       	mov    %r12b,0x53(%rsp)
   120fa:	66 89 4c 24 51       	mov    %cx,0x51(%rsp)
   120ff:	49 89 fc             	mov    %rdi,%r12
   12102:	89 7c 24 54          	mov    %edi,0x54(%rsp)
   12106:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%rsp)
   1210d:	00 
   1210e:	88 44 24 50          	mov    %al,0x50(%rsp)
   12112:	48 89 e7             	mov    %rsp,%rdi
   12115:	be 00 00 00 80       	mov    $0x80000000,%esi
   1211a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1211f:	48 89 d9             	mov    %rbx,%rcx
   12122:	e8 a9 77 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12127:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1212b:	75 12                	jne    1213f <hyperinterval_strict_surface32+0x12f>
   1212d:	0f b6 5c 24 01       	movzbl 0x1(%rsp),%ebx
   12132:	c1 e3 08             	shl    $0x8,%ebx
   12135:	48 ff c3             	inc    %rbx
   12138:	f6 c3 01             	test   $0x1,%bl
   1213b:	75 5e                	jne    1219b <hyperinterval_strict_surface32+0x18b>
   1213d:	eb 64                	jmp    121a3 <hyperinterval_strict_surface32+0x193>
   1213f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12144:	48 89 c1             	mov    %rax,%rcx
   12147:	4c 31 e9             	xor    %r13,%rcx
   1214a:	48 85 c0             	test   %rax,%rax
   1214d:	48 0f 44 c8          	cmove  %rax,%rcx
   12151:	31 c0                	xor    %eax,%eax
   12153:	85 c9                	test   %ecx,%ecx
   12155:	0f 99 c0             	setns  %al
   12158:	48 8d 4c 41 ff       	lea    -0x1(%rcx,%rax,2),%rcx
   1215d:	48 89 e7             	mov    %rsp,%rdi
   12160:	be 00 00 00 80       	mov    $0x80000000,%esi
   12165:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1216a:	e8 61 77 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1216f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12173:	75 07                	jne    1217c <hyperinterval_strict_surface32+0x16c>
   12175:	bb 01 03 00 00       	mov    $0x301,%ebx
   1217a:	eb 1f                	jmp    1219b <hyperinterval_strict_surface32+0x18b>
   1217c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12181:	48 89 c3             	mov    %rax,%rbx
   12184:	48 81 f3 00 00 00 80 	xor    $0xffffffff80000000,%rbx
   1218b:	48 c1 e3 20          	shl    $0x20,%rbx
   1218f:	48 85 c0             	test   %rax,%rax
   12192:	48 0f 44 d8          	cmove  %rax,%rbx
   12196:	f6 c3 01             	test   $0x1,%bl
   12199:	74 08                	je     121a3 <hyperinterval_strict_surface32+0x193>
   1219b:	88 7d 04             	mov    %bh,0x4(%rbp)
   1219e:	e9 eb fe ff ff       	jmp    1208e <hyperinterval_strict_surface32+0x7e>
   121a3:	48 89 e7             	mov    %rsp,%rdi
   121a6:	be 00 00 00 80       	mov    $0x80000000,%esi
   121ab:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   121b0:	4c 89 f1             	mov    %r14,%rcx
   121b3:	e8 18 77 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   121b8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   121bc:	75 11                	jne    121cf <hyperinterval_strict_surface32+0x1bf>
   121be:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   121c3:	c1 e0 08             	shl    $0x8,%eax
   121c6:	48 ff c0             	inc    %rax
   121c9:	a8 01                	test   $0x1,%al
   121cb:	75 3f                	jne    1220c <hyperinterval_strict_surface32+0x1fc>
   121cd:	eb 45                	jmp    12214 <hyperinterval_strict_surface32+0x204>
   121cf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   121d4:	31 c9                	xor    %ecx,%ecx
   121d6:	85 c0                	test   %eax,%eax
   121d8:	0f 99 c1             	setns  %cl
   121db:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   121e0:	48 89 e7             	mov    %rsp,%rdi
   121e3:	be 00 00 00 80       	mov    $0x80000000,%esi
   121e8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   121ed:	e8 de 76 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   121f2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   121f6:	75 07                	jne    121ff <hyperinterval_strict_surface32+0x1ef>
   121f8:	b8 01 03 00 00       	mov    $0x301,%eax
   121fd:	eb 0d                	jmp    1220c <hyperinterval_strict_surface32+0x1fc>
   121ff:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12204:	48 c1 e0 20          	shl    $0x20,%rax
   12208:	a8 01                	test   $0x1,%al
   1220a:	74 08                	je     12214 <hyperinterval_strict_surface32+0x204>
   1220c:	88 65 04             	mov    %ah,0x4(%rbp)
   1220f:	e9 7a fe ff ff       	jmp    1208e <hyperinterval_strict_surface32+0x7e>
   12214:	49 89 c6             	mov    %rax,%r14
   12217:	48 c1 eb 20          	shr    $0x20,%rbx
   1221b:	48 89 e7             	mov    %rsp,%rdi
   1221e:	be 00 00 00 80       	mov    $0x80000000,%esi
   12223:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   12228:	48 89 d9             	mov    %rbx,%rcx
   1222b:	e8 a0 76 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12230:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12234:	74 24                	je     1225a <hyperinterval_strict_surface32+0x24a>
   12236:	4c 89 f1             	mov    %r14,%rcx
   12239:	48 c1 e9 20          	shr    $0x20,%rcx
   1223d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   12242:	48 89 e7             	mov    %rsp,%rdi
   12245:	be 00 00 00 80       	mov    $0x80000000,%esi
   1224a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1224f:	e8 7c 76 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12254:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12258:	75 0d                	jne    12267 <hyperinterval_strict_surface32+0x257>
   1225a:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1225f:	88 4d 04             	mov    %cl,0x4(%rbp)
   12262:	e9 27 fe ff ff       	jmp    1208e <hyperinterval_strict_surface32+0x7e>
   12267:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1226b:	89 d9                	mov    %ebx,%ecx
   1226d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   12273:	89 c2                	mov    %eax,%edx
   12275:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1227b:	be 00 00 00 80       	mov    $0x80000000,%esi
   12280:	29 ce                	sub    %ecx,%esi
   12282:	44 09 e9             	or     %r13d,%ecx
   12285:	85 db                	test   %ebx,%ebx
   12287:	48 0f 49 f1          	cmovns %rcx,%rsi
   1228b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   12290:	29 d7                	sub    %edx,%edi
   12292:	89 d1                	mov    %edx,%ecx
   12294:	44 09 e9             	or     %r13d,%ecx
   12297:	85 c0                	test   %eax,%eax
   12299:	48 0f 49 f9          	cmovns %rcx,%rdi
   1229d:	b1 01                	mov    $0x1,%cl
   1229f:	39 fe                	cmp    %edi,%esi
   122a1:	77 bc                	ja     1225f <hyperinterval_strict_surface32+0x24f>
   122a3:	89 d9                	mov    %ebx,%ecx
   122a5:	89 da                	mov    %ebx,%edx
   122a7:	c1 ea 08             	shr    $0x8,%edx
   122aa:	c1 eb 18             	shr    $0x18,%ebx
   122ad:	88 5c 24 6b          	mov    %bl,0x6b(%rsp)
   122b1:	66 89 54 24 69       	mov    %dx,0x69(%rsp)
   122b6:	89 44 24 6c          	mov    %eax,0x6c(%rsp)
   122ba:	c7 44 24 64 01 00 00 	movl   $0x1,0x64(%rsp)
   122c1:	00 
   122c2:	88 4c 24 68          	mov    %cl,0x68(%rsp)
   122c6:	41 83 ff 02          	cmp    $0x2,%r15d
   122ca:	0f 85 a9 00 00 00    	jne    12379 <hyperinterval_strict_surface32+0x369>
   122d0:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   122d5:	48 8d 74 24 4c       	lea    0x4c(%rsp),%rsi
   122da:	e8 a1 81 00 00       	call   1a480 <<hyperinterval::float::F32Enclosure>::square>
   122df:	8b 44 24 28          	mov    0x28(%rsp),%eax
   122e3:	0f b6 4c 24 2c       	movzbl 0x2c(%rsp),%ecx
   122e8:	83 f8 02             	cmp    $0x2,%eax
   122eb:	0f 84 6e ff ff ff    	je     1225f <hyperinterval_strict_surface32+0x24f>
   122f1:	a8 01                	test   $0x1,%al
   122f3:	0f 84 38 01 00 00    	je     12431 <hyperinterval_strict_surface32+0x421>
   122f9:	0f b6 c1             	movzbl %cl,%eax
   122fc:	0f b6 4c 24 2f       	movzbl 0x2f(%rsp),%ecx
   12301:	c1 e1 10             	shl    $0x10,%ecx
   12304:	0f b7 54 24 2d       	movzwl 0x2d(%rsp),%edx
   12309:	09 ca                	or     %ecx,%edx
   1230b:	8b 5c 24 30          	mov    0x30(%rsp),%ebx
   1230f:	c1 e2 08             	shl    $0x8,%edx
   12312:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   12315:	85 c9                	test   %ecx,%ecx
   12317:	8d 84 02 00 00 00 80 	lea    -0x80000000(%rdx,%rax,1),%eax
   1231e:	0f 44 c1             	cmove  %ecx,%eax
   12321:	31 c9                	xor    %ecx,%ecx
   12323:	85 c0                	test   %eax,%eax
   12325:	0f 99 c1             	setns  %cl
   12328:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   1232d:	48 89 e7             	mov    %rsp,%rdi
   12330:	be 00 00 00 80       	mov    $0x80000000,%esi
   12335:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1233a:	e8 91 75 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1233f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12343:	74 2d                	je     12372 <hyperinterval_strict_surface32+0x362>
   12345:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1234a:	31 c0                	xor    %eax,%eax
   1234c:	85 db                	test   %ebx,%ebx
   1234e:	0f 99 c0             	setns  %al
   12351:	48 8d 4c 43 ff       	lea    -0x1(%rbx,%rax,2),%rcx
   12356:	48 89 e7             	mov    %rsp,%rdi
   12359:	be 00 00 00 80       	mov    $0x80000000,%esi
   1235e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   12363:	e8 68 75 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12368:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1236c:	0f 85 21 03 00 00    	jne    12693 <hyperinterval_strict_surface32+0x683>
   12372:	b1 03                	mov    $0x3,%cl
   12374:	e9 e6 fe ff ff       	jmp    1225f <hyperinterval_strict_surface32+0x24f>
   12379:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
   1237d:	48 89 e7             	mov    %rsp,%rdi
   12380:	be 00 00 00 80       	mov    $0x80000000,%esi
   12385:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1238a:	45 89 f8             	mov    %r15d,%r8d
   1238d:	e8 fe 83 00 00       	call   1a790 <<hyperinterval::ieee::Format>::power>
   12392:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12396:	0f 84 be fe ff ff    	je     1225a <hyperinterval_strict_surface32+0x24a>
   1239c:	44 89 e1             	mov    %r12d,%ecx
   1239f:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
   123a3:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   123a8:	48 89 e7             	mov    %rsp,%rdi
   123ab:	be 00 00 00 80       	mov    $0x80000000,%esi
   123b0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   123b5:	45 89 f8             	mov    %r15d,%r8d
   123b8:	e8 d3 83 00 00       	call   1a790 <<hyperinterval::ieee::Format>::power>
   123bd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   123c1:	0f 84 93 fe ff ff    	je     1225a <hyperinterval_strict_surface32+0x24a>
   123c7:	8b 44 24 08          	mov    0x8(%rsp),%eax
   123cb:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   123d0:	8b 44 24 10          	mov    0x10(%rsp),%eax
   123d4:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
   123db:	00 
   123dc:	48 89 e7             	mov    %rsp,%rdi
   123df:	be 00 00 00 80       	mov    $0x80000000,%esi
   123e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   123e9:	48 89 d9             	mov    %rbx,%rcx
   123ec:	e8 df 74 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   123f1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   123f5:	74 24                	je     1241b <hyperinterval_strict_surface32+0x40b>
   123f7:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   123fc:	48 89 e7             	mov    %rsp,%rdi
   123ff:	be 00 00 00 80       	mov    $0x80000000,%esi
   12404:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   12409:	4c 89 f1             	mov    %r14,%rcx
   1240c:	e8 bf 74 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12411:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12415:	0f 85 18 03 00 00    	jne    12733 <hyperinterval_strict_surface32+0x723>
   1241b:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   12420:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
   12424:	c7 44 24 28 02 00 00 	movl   $0x2,0x28(%rsp)
   1242b:	00 
   1242c:	e9 ae fe ff ff       	jmp    122df <hyperinterval_strict_surface32+0x2cf>
   12431:	31 d2                	xor    %edx,%edx
   12433:	66 89 8c 24 a9 00 00 	mov    %cx,0xa9(%rsp)
   1243a:	00 
   1243b:	c1 e9 10             	shr    $0x10,%ecx
   1243e:	88 8c 24 ab 00 00 00 	mov    %cl,0xab(%rsp)
   12445:	89 84 24 ac 00 00 00 	mov    %eax,0xac(%rsp)
   1244c:	89 94 24 a4 00 00 00 	mov    %edx,0xa4(%rsp)
   12453:	44 88 b4 24 a8 00 00 	mov    %r14b,0xa8(%rsp)
   1245a:	00 
   1245b:	4c 8d bc 24 bc 00 00 	lea    0xbc(%rsp),%r15
   12462:	00 
   12463:	48 8d b4 24 a4 00 00 	lea    0xa4(%rsp),%rsi
   1246a:	00 
   1246b:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   12470:	4c 89 ff             	mov    %r15,%rdi
   12473:	4c 89 f2             	mov    %r14,%rdx
   12476:	e8 35 89 00 00       	call   1adb0 <<hyperinterval::float::F32Enclosure>::intersection>
   1247b:	48 8d 9c 24 98 00 00 	lea    0x98(%rsp),%rbx
   12482:	00 
   12483:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   12488:	48 89 df             	mov    %rbx,%rdi
   1248b:	4c 89 fe             	mov    %r15,%rsi
   1248e:	e8 0d 87 00 00       	call   1aba0 <<hyperinterval::float::F32Enclosure>::hull>
   12493:	48 89 e7             	mov    %rsp,%rdi
   12496:	48 89 de             	mov    %rbx,%rsi
   12499:	e8 82 8b 00 00       	call   1b020 <<hyperinterval::float::F32Enclosure>::abs>
   1249e:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   124a3:	48 89 de             	mov    %rbx,%rsi
   124a6:	4c 89 f2             	mov    %r14,%rdx
   124a9:	e8 e2 9d 00 00       	call   1c290 <<hyperinterval::float::F32Enclosure>::min_image>
   124ae:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   124b3:	48 89 de             	mov    %rbx,%rsi
   124b6:	4c 89 f2             	mov    %r14,%rdx
   124b9:	e8 e2 9c 00 00       	call   1c1a0 <<hyperinterval::float::F32Enclosure>::max_image>
   124be:	8b 44 24 20          	mov    0x20(%rsp),%eax
   124c2:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   124c9:	0f 10 04 24          	movups (%rsp),%xmm0
   124cd:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
   124d2:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   124d9:	00 
   124da:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   124df:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   124e4:	48 89 df             	mov    %rbx,%rdi
   124e7:	e8 94 87 00 00       	call   1ac80 <<hyperinterval::float::F32Enclosure>::signs>
   124ec:	8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%ecx
   124f3:	83 f9 01             	cmp    $0x1,%ecx
   124f6:	75 22                	jne    1251a <hyperinterval_strict_surface32+0x50a>
   124f8:	8b b4 24 9c 00 00 00 	mov    0x9c(%rsp),%esi
   124ff:	8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%edi
   12506:	39 fe                	cmp    %edi,%esi
   12508:	0f 94 c2             	sete   %dl
   1250b:	66 0f 6e ce          	movd   %esi,%xmm1
   1250f:	66 0f 6e c7          	movd   %edi,%xmm0
   12513:	be 01 00 00 00       	mov    $0x1,%esi
   12518:	eb 04                	jmp    1251e <hyperinterval_strict_surface32+0x50e>
   1251a:	31 d2                	xor    %edx,%edx
   1251c:	31 f6                	xor    %esi,%esi
   1251e:	80 f1 01             	xor    $0x1,%cl
   12521:	89 34 24             	mov    %esi,(%rsp)
   12524:	66 0f 7e 4c 24 04    	movd   %xmm1,0x4(%rsp)
   1252a:	88 4c 24 08          	mov    %cl,0x8(%rsp)
   1252e:	88 54 24 09          	mov    %dl,0x9(%rsp)
   12532:	88 44 24 0a          	mov    %al,0xa(%rsp)
   12536:	89 74 24 0c          	mov    %esi,0xc(%rsp)
   1253a:	66 0f 7e 44 24 10    	movd   %xmm0,0x10(%rsp)
   12540:	48 89 e0             	mov    %rsp,%rax
   12543:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
   1254a:	00 
   1254b:	66 0f 6e 84 24 94 00 	movd   0x94(%rsp),%xmm0
   12552:	00 00 
   12554:	e8 67 89 00 00       	call   1aec0 <<hyperinterval::float::F32Enclosure>::contains_point>
   12559:	41 89 d6             	mov    %edx,%r14d
   1255c:	a8 01                	test   $0x1,%al
   1255e:	74 09                	je     12569 <hyperinterval_strict_surface32+0x559>
   12560:	44 88 75 04          	mov    %r14b,0x4(%rbp)
   12564:	e9 25 fb ff ff       	jmp    1208e <hyperinterval_strict_surface32+0x7e>
   12569:	4c 8d ac 24 98 00 00 	lea    0x98(%rsp),%r13
   12570:	00 
   12571:	4c 8d 7c 24 4c       	lea    0x4c(%rsp),%r15
   12576:	4c 89 ef             	mov    %r13,%rdi
   12579:	4c 89 fe             	mov    %r15,%rsi
   1257c:	e8 6f 9b 00 00       	call   1c0f0 <<hyperinterval::float::F32Enclosure>::overlaps>
   12581:	88 44 24 58          	mov    %al,0x58(%rsp)
   12585:	4c 89 ef             	mov    %r13,%rdi
   12588:	4c 89 fe             	mov    %r15,%rsi
   1258b:	e8 b0 9a 00 00       	call   1c040 <<hyperinterval::float::F32Enclosure>::disjoint>
   12590:	41 89 c7             	mov    %eax,%r15d
   12593:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   12598:	4c 89 ef             	mov    %r13,%rdi
   1259b:	e8 e0 89 00 00       	call   1af80 <<hyperinterval::float::F32Enclosure>::interior_subset_of>
   125a0:	89 c3                	mov    %eax,%ebx
   125a2:	4c 89 ef             	mov    %r13,%rdi
   125a5:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   125aa:	e8 d1 9d 00 00       	call   1c380 <<hyperinterval::float::F32Enclosure>::subset_of>
   125af:	88 04 24             	mov    %al,(%rsp)
   125b2:	88 5c 24 01          	mov    %bl,0x1(%rsp)
   125b6:	44 88 7c 24 02       	mov    %r15b,0x2(%rsp)
   125bb:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   125c0:	88 44 24 03          	mov    %al,0x3(%rsp)
   125c4:	44 88 74 24 04       	mov    %r14b,0x4(%rsp)
   125c9:	48 89 e0             	mov    %rsp,%rax
   125cc:	8b 44 24 50          	mov    0x50(%rsp),%eax
   125d0:	41 8d 8c 24 00 00 00 	lea    -0x80000000(%r12),%ecx
   125d7:	80 
   125d8:	45 85 e4             	test   %r12d,%r12d
   125db:	41 0f 44 cc          	cmove  %r12d,%ecx
   125df:	8d 90 00 00 00 80    	lea    -0x80000000(%rax),%edx
   125e5:	85 c0                	test   %eax,%eax
   125e7:	0f 44 d0             	cmove  %eax,%edx
   125ea:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   125f1:	00 
   125f2:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   125f6:	89 54 24 3c          	mov    %edx,0x3c(%rsp)
   125fa:	48 89 e7             	mov    %rsp,%rdi
   125fd:	48 8d 54 24 34       	lea    0x34(%rsp),%rdx
   12602:	4c 89 ee             	mov    %r13,%rsi
   12605:	e8 b6 8e 00 00       	call   1b4c0 <<hyperinterval::float::F32Enclosure>::sub>
   1260a:	8b 0c 24             	mov    (%rsp),%ecx
   1260d:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   12612:	83 f9 02             	cmp    $0x2,%ecx
   12615:	0f 84 70 fa ff ff    	je     1208b <hyperinterval_strict_surface32+0x7b>
   1261b:	8b 54 24 05          	mov    0x5(%rsp),%edx
   1261f:	8b 74 24 08          	mov    0x8(%rsp),%esi
   12623:	89 74 24 48          	mov    %esi,0x48(%rsp)
   12627:	89 54 24 45          	mov    %edx,0x45(%rsp)
   1262b:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1262f:	88 44 24 44          	mov    %al,0x44(%rsp)
   12633:	48 89 e7             	mov    %rsp,%rdi
   12636:	be 00 00 00 80       	mov    $0x80000000,%esi
   1263b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   12640:	b9 00 00 00 40       	mov    $0x40000000,%ecx
   12645:	e8 86 72 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1264a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1264e:	0f 84 32 fa ff ff    	je     12086 <hyperinterval_strict_surface32+0x76>
   12654:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12659:	89 c1                	mov    %eax,%ecx
   1265b:	c1 e9 08             	shr    $0x8,%ecx
   1265e:	89 c2                	mov    %eax,%edx
   12660:	c1 ea 18             	shr    $0x18,%edx
   12663:	88 54 24 77          	mov    %dl,0x77(%rsp)
   12667:	66 89 4c 24 75       	mov    %cx,0x75(%rsp)
   1266c:	89 44 24 78          	mov    %eax,0x78(%rsp)
   12670:	c7 44 24 70 01 00 00 	movl   $0x1,0x70(%rsp)
   12677:	00 
   12678:	88 44 24 74          	mov    %al,0x74(%rsp)
   1267c:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   12681:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   12686:	48 89 ef             	mov    %rbp,%rdi
   12689:	e8 f2 8d 00 00       	call   1b480 <<hyperinterval::float::F32Enclosure>::div>
   1268e:	e9 02 fa ff ff       	jmp    12095 <hyperinterval_strict_surface32+0x85>
   12693:	44 89 f1             	mov    %r14d,%ecx
   12696:	4c 31 e9             	xor    %r13,%rcx
   12699:	4d 85 f6             	test   %r14,%r14
   1269c:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
   126a0:	49 0f 44 ce          	cmove  %r14,%rcx
   126a4:	48 89 e7             	mov    %rsp,%rdi
   126a7:	be 00 00 00 80       	mov    $0x80000000,%esi
   126ac:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   126b1:	e8 1a 72 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   126b6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   126ba:	0f 84 9a fb ff ff    	je     1225a <hyperinterval_strict_surface32+0x24a>
   126c0:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   126c5:	48 89 e7             	mov    %rsp,%rdi
   126c8:	be 00 00 00 80       	mov    $0x80000000,%esi
   126cd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   126d2:	48 89 d9             	mov    %rbx,%rcx
   126d5:	e8 f6 71 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   126da:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   126de:	0f 84 76 fb ff ff    	je     1225a <hyperinterval_strict_surface32+0x24a>
   126e4:	8b 44 24 08          	mov    0x8(%rsp),%eax
   126e8:	44 89 f1             	mov    %r14d,%ecx
   126eb:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   126f1:	89 c2                	mov    %eax,%edx
   126f3:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   126f9:	be 00 00 00 80       	mov    $0x80000000,%esi
   126fe:	29 ce                	sub    %ecx,%esi
   12700:	44 09 e9             	or     %r13d,%ecx
   12703:	45 85 f6             	test   %r14d,%r14d
   12706:	48 0f 49 f1          	cmovns %rcx,%rsi
   1270a:	89 d1                	mov    %edx,%ecx
   1270c:	44 09 e9             	or     %r13d,%ecx
   1270f:	41 29 d5             	sub    %edx,%r13d
   12712:	85 c0                	test   %eax,%eax
   12714:	4c 0f 49 e9          	cmovns %rcx,%r13
   12718:	b1 01                	mov    $0x1,%cl
   1271a:	44 39 ee             	cmp    %r13d,%esi
   1271d:	0f 87 3c fb ff ff    	ja     1225f <hyperinterval_strict_surface32+0x24f>
   12723:	44 89 f1             	mov    %r14d,%ecx
   12726:	c1 e9 08             	shr    $0x8,%ecx
   12729:	ba 01 00 00 00       	mov    $0x1,%edx
   1272e:	e9 00 fd ff ff       	jmp    12433 <hyperinterval_strict_surface32+0x423>
   12733:	8b 44 24 08          	mov    0x8(%rsp),%eax
   12737:	89 d9                	mov    %ebx,%ecx
   12739:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1273f:	89 c2                	mov    %eax,%edx
   12741:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   12747:	be 00 00 00 80       	mov    $0x80000000,%esi
   1274c:	29 ce                	sub    %ecx,%esi
   1274e:	44 09 e9             	or     %r13d,%ecx
   12751:	85 db                	test   %ebx,%ebx
   12753:	48 0f 49 f1          	cmovns %rcx,%rsi
   12757:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1275c:	29 d7                	sub    %edx,%edi
   1275e:	89 d1                	mov    %edx,%ecx
   12760:	44 09 e9             	or     %r13d,%ecx
   12763:	85 c0                	test   %eax,%eax
   12765:	48 0f 49 f9          	cmovns %rcx,%rdi
   12769:	b1 01                	mov    $0x1,%cl
   1276b:	39 fe                	cmp    %edi,%esi
   1276d:	0f 87 ad fc ff ff    	ja     12420 <hyperinterval_strict_surface32+0x410>
   12773:	89 d9                	mov    %ebx,%ecx
   12775:	c1 e9 08             	shr    $0x8,%ecx
   12778:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   1277f:	00 
   12780:	88 5c 24 38          	mov    %bl,0x38(%rsp)
   12784:	c1 eb 18             	shr    $0x18,%ebx
   12787:	88 5c 24 3b          	mov    %bl,0x3b(%rsp)
   1278b:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   12790:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   12794:	48 89 e7             	mov    %rsp,%rdi
   12797:	be 00 00 00 80       	mov    $0x80000000,%esi
   1279c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   127a1:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   127a6:	e8 25 71 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   127ab:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   127af:	0f 84 66 fc ff ff    	je     1241b <hyperinterval_strict_surface32+0x40b>
   127b5:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   127ba:	48 89 e7             	mov    %rsp,%rdi
   127bd:	be 00 00 00 80       	mov    $0x80000000,%esi
   127c2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   127c7:	48 8b 8c 24 b0 00 00 	mov    0xb0(%rsp),%rcx
   127ce:	00 
   127cf:	e8 fc 70 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   127d4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   127d8:	0f 84 3d fc ff ff    	je     1241b <hyperinterval_strict_surface32+0x40b>
   127de:	8b 44 24 08          	mov    0x8(%rsp),%eax
   127e2:	89 d9                	mov    %ebx,%ecx
   127e4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   127ea:	89 c2                	mov    %eax,%edx
   127ec:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   127f2:	be 00 00 00 80       	mov    $0x80000000,%esi
   127f7:	29 ce                	sub    %ecx,%esi
   127f9:	44 09 e9             	or     %r13d,%ecx
   127fc:	85 db                	test   %ebx,%ebx
   127fe:	48 0f 49 f1          	cmovns %rcx,%rsi
   12802:	bf 00 00 00 80       	mov    $0x80000000,%edi
   12807:	29 d7                	sub    %edx,%edi
   12809:	89 d1                	mov    %edx,%ecx
   1280b:	44 09 e9             	or     %r13d,%ecx
   1280e:	85 c0                	test   %eax,%eax
   12810:	48 0f 49 f9          	cmovns %rcx,%rdi
   12814:	b1 01                	mov    $0x1,%cl
   12816:	39 fe                	cmp    %edi,%esi
   12818:	0f 87 02 fc ff ff    	ja     12420 <hyperinterval_strict_surface32+0x410>
   1281e:	89 d9                	mov    %ebx,%ecx
   12820:	c1 e9 08             	shr    $0x8,%ecx
   12823:	c7 44 24 70 01 00 00 	movl   $0x1,0x70(%rsp)
   1282a:	00 
   1282b:	88 5c 24 74          	mov    %bl,0x74(%rsp)
   1282f:	c1 eb 18             	shr    $0x18,%ebx
   12832:	88 5c 24 77          	mov    %bl,0x77(%rsp)
   12836:	66 89 4c 24 75       	mov    %cx,0x75(%rsp)
   1283b:	89 44 24 78          	mov    %eax,0x78(%rsp)
   1283f:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   12844:	48 8d 74 24 34       	lea    0x34(%rsp),%rsi
   12849:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   1284e:	e8 4d 83 00 00       	call   1aba0 <<hyperinterval::float::F32Enclosure>::hull>
   12853:	45 85 ff             	test   %r15d,%r15d
   12856:	0f 95 c0             	setne  %al
   12859:	41 f6 c7 01          	test   $0x1,%r15b
   1285d:	0f 94 c1             	sete   %cl
   12860:	84 c8                	test   %cl,%al
   12862:	74 76                	je     128da <hyperinterval_strict_surface32+0x8ca>
   12864:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   12869:	e8 12 84 00 00       	call   1ac80 <<hyperinterval::float::F32Enclosure>::signs>
   1286e:	a8 02                	test   $0x2,%al
   12870:	74 68                	je     128da <hyperinterval_strict_surface32+0x8ca>
   12872:	48 89 e7             	mov    %rsp,%rdi
   12875:	31 f6                	xor    %esi,%esi
   12877:	31 d2                	xor    %edx,%edx
   12879:	e8 72 84 00 00       	call   1acf0 <<hyperinterval::float::F32Enclosure>::from_bits>
   1287e:	8b 0c 24             	mov    (%rsp),%ecx
   12881:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   12886:	83 f9 02             	cmp    $0x2,%ecx
   12889:	75 11                	jne    1289c <hyperinterval_strict_surface32+0x88c>
   1288b:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   1288f:	c7 44 24 28 02 00 00 	movl   $0x2,0x28(%rsp)
   12896:	00 
   12897:	e9 43 fa ff ff       	jmp    122df <hyperinterval_strict_surface32+0x2cf>
   1289c:	8b 54 24 05          	mov    0x5(%rsp),%edx
   128a0:	8b 74 24 08          	mov    0x8(%rsp),%esi
   128a4:	89 74 24 78          	mov    %esi,0x78(%rsp)
   128a8:	89 54 24 75          	mov    %edx,0x75(%rsp)
   128ac:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   128b0:	88 44 24 74          	mov    %al,0x74(%rsp)
   128b4:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
   128b9:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   128be:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   128c3:	e8 d8 82 00 00       	call   1aba0 <<hyperinterval::float::F32Enclosure>::hull>
   128c8:	8b 44 24 3c          	mov    0x3c(%rsp),%eax
   128cc:	89 44 24 48          	mov    %eax,0x48(%rsp)
   128d0:	48 8b 44 24 34       	mov    0x34(%rsp),%rax
   128d5:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   128da:	8b 44 24 48          	mov    0x48(%rsp),%eax
   128de:	89 44 24 30          	mov    %eax,0x30(%rsp)
   128e2:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   128e7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   128ec:	e9 ee f9 ff ff       	jmp    122df <hyperinterval_strict_surface32+0x2cf>
   128f1:	cc                   	int3
   128f2:	cc                   	int3
   128f3:	cc                   	int3
   128f4:	cc                   	int3
   128f5:	cc                   	int3
   128f6:	cc                   	int3
   128f7:	cc                   	int3
   128f8:	cc                   	int3
   128f9:	cc                   	int3
   128fa:	cc                   	int3
   128fb:	cc                   	int3
   128fc:	cc                   	int3
   128fd:	cc                   	int3
   128fe:	cc                   	int3
   128ff:	cc                   	int3

hyperinterval_strict_surface64:
   12900:	55                   	push   %rbp
   12901:	41 57                	push   %r15
   12903:	41 56                	push   %r14
   12905:	41 55                	push   %r13
   12907:	41 54                	push   %r12
   12909:	53                   	push   %rbx
   1290a:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
   12911:	41 89 f6             	mov    %esi,%r14d
   12914:	66 0f d6 4c 24 48    	movq   %xmm1,0x48(%rsp)
   1291a:	48 89 fb             	mov    %rdi,%rbx
   1291d:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
   12924:	00 00 80 
   12927:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1292e:	00 f0 7f 
   12931:	66 0f d6 84 24 68 01 	movq   %xmm0,0x168(%rsp)
   12938:	00 00 
   1293a:	66 49 0f 7e c7       	movq   %xmm0,%r15
   1293f:	48 89 e7             	mov    %rsp,%rdi
   12942:	48 89 ee             	mov    %rbp,%rsi
   12945:	4c 89 e2             	mov    %r12,%rdx
   12948:	4c 89 f9             	mov    %r15,%rcx
   1294b:	e8 80 6f 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12950:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12954:	74 2c                	je     12982 <hyperinterval_strict_surface64+0x82>
   12956:	44 89 74 24 50       	mov    %r14d,0x50(%rsp)
   1295b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   12960:	f3 0f 7e 44 24 48    	movq   0x48(%rsp),%xmm0
   12966:	66 49 0f 7e c5       	movq   %xmm0,%r13
   1296b:	48 89 e7             	mov    %rsp,%rdi
   1296e:	48 89 ee             	mov    %rbp,%rsi
   12971:	4c 89 e2             	mov    %r12,%rdx
   12974:	4c 89 e9             	mov    %r13,%rcx
   12977:	e8 54 6f 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1297c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12980:	75 24                	jne    129a6 <hyperinterval_strict_surface64+0xa6>
   12982:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   12987:	88 43 08             	mov    %al,0x8(%rbx)
   1298a:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   12991:	48 89 d8             	mov    %rbx,%rax
   12994:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
   1299b:	5b                   	pop    %rbx
   1299c:	41 5c                	pop    %r12
   1299e:	41 5d                	pop    %r13
   129a0:	41 5e                	pop    %r14
   129a2:	41 5f                	pop    %r15
   129a4:	5d                   	pop    %rbp
   129a5:	c3                   	ret
   129a6:	48 89 ee             	mov    %rbp,%rsi
   129a9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   129ae:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   129b2:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   129b6:	4c 89 f1             	mov    %r14,%rcx
   129b9:	4c 21 c1             	and    %r8,%rcx
   129bc:	48 89 f2             	mov    %rsi,%rdx
   129bf:	48 29 ca             	sub    %rcx,%rdx
   129c2:	4d 85 f6             	test   %r14,%r14
   129c5:	48 0f 49 d0          	cmovns %rax,%rdx
   129c9:	48 8d 04 2e          	lea    (%rsi,%rbp,1),%rax
   129cd:	48 89 e9             	mov    %rbp,%rcx
   129d0:	4c 21 c1             	and    %r8,%rcx
   129d3:	48 89 f7             	mov    %rsi,%rdi
   129d6:	48 29 cf             	sub    %rcx,%rdi
   129d9:	48 85 ed             	test   %rbp,%rbp
   129dc:	48 0f 49 f8          	cmovns %rax,%rdi
   129e0:	b0 01                	mov    $0x1,%al
   129e2:	48 39 fa             	cmp    %rdi,%rdx
   129e5:	77 a0                	ja     12987 <hyperinterval_strict_surface64+0x87>
   129e7:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   129ec:	48 c7 84 24 c8 00 00 	movq   $0x1,0xc8(%rsp)
   129f3:	00 01 00 00 00 
   129f8:	4c 89 b4 24 a8 00 00 	mov    %r14,0xa8(%rsp)
   129ff:	00 
   12a00:	4c 89 b4 24 d0 00 00 	mov    %r14,0xd0(%rsp)
   12a07:	00 
   12a08:	48 89 ac 24 d8 00 00 	mov    %rbp,0xd8(%rsp)
   12a0f:	00 
   12a10:	48 89 e7             	mov    %rsp,%rdi
   12a13:	49 89 f6             	mov    %rsi,%r14
   12a16:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   12a1d:	00 f0 7f 
   12a20:	4c 89 e2             	mov    %r12,%rdx
   12a23:	4c 89 f9             	mov    %r15,%rcx
   12a26:	e8 a5 6e 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12a2b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12a2f:	0f 84 4d ff ff ff    	je     12982 <hyperinterval_strict_surface64+0x82>
   12a35:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12a3a:	48 89 c2             	mov    %rax,%rdx
   12a3d:	4c 31 f2             	xor    %r14,%rdx
   12a40:	48 85 c0             	test   %rax,%rax
   12a43:	48 0f 44 d0          	cmove  %rax,%rdx
   12a47:	48 89 d1             	mov    %rdx,%rcx
   12a4a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12a4e:	48 83 c9 01          	or     $0x1,%rcx
   12a52:	48 01 d1             	add    %rdx,%rcx
   12a55:	48 89 e7             	mov    %rsp,%rdi
   12a58:	4c 89 f6             	mov    %r14,%rsi
   12a5b:	4c 89 e2             	mov    %r12,%rdx
   12a5e:	e8 6d 6e 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12a63:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12a67:	75 07                	jne    12a70 <hyperinterval_strict_surface64+0x170>
   12a69:	b0 03                	mov    $0x3,%al
   12a6b:	e9 17 ff ff ff       	jmp    12987 <hyperinterval_strict_surface64+0x87>
   12a70:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12a75:	49 89 c7             	mov    %rax,%r15
   12a78:	4d 31 f7             	xor    %r14,%r15
   12a7b:	48 85 c0             	test   %rax,%rax
   12a7e:	4c 0f 44 f8          	cmove  %rax,%r15
   12a82:	48 89 e7             	mov    %rsp,%rdi
   12a85:	4c 89 f6             	mov    %r14,%rsi
   12a88:	4c 89 e2             	mov    %r12,%rdx
   12a8b:	4c 89 e9             	mov    %r13,%rcx
   12a8e:	e8 3d 6e 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12a93:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12a97:	0f 84 e5 fe ff ff    	je     12982 <hyperinterval_strict_surface64+0x82>
   12a9d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12aa2:	48 89 c1             	mov    %rax,%rcx
   12aa5:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12aa9:	48 83 c9 01          	or     $0x1,%rcx
   12aad:	48 01 c1             	add    %rax,%rcx
   12ab0:	48 89 e7             	mov    %rsp,%rdi
   12ab3:	4c 89 f6             	mov    %r14,%rsi
   12ab6:	4c 89 e2             	mov    %r12,%rdx
   12ab9:	e8 12 6e 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12abe:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12ac2:	74 a5                	je     12a69 <hyperinterval_strict_surface64+0x169>
   12ac4:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   12ac9:	48 89 e7             	mov    %rsp,%rdi
   12acc:	4c 89 f6             	mov    %r14,%rsi
   12acf:	4c 89 e2             	mov    %r12,%rdx
   12ad2:	4c 89 f9             	mov    %r15,%rcx
   12ad5:	e8 f6 6d 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12ada:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12ade:	74 1c                	je     12afc <hyperinterval_strict_surface64+0x1fc>
   12ae0:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12ae5:	48 89 e7             	mov    %rsp,%rdi
   12ae8:	4c 89 f6             	mov    %r14,%rsi
   12aeb:	4c 89 e2             	mov    %r12,%rdx
   12aee:	4c 89 e9             	mov    %r13,%rcx
   12af1:	e8 da 6d 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12af6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12afa:	75 0d                	jne    12b09 <hyperinterval_strict_surface64+0x209>
   12afc:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   12b01:	88 4b 08             	mov    %cl,0x8(%rbx)
   12b04:	e9 81 fe ff ff       	jmp    1298a <hyperinterval_strict_surface64+0x8a>
   12b09:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12b0e:	4b 8d 0c 37          	lea    (%r15,%r14,1),%rcx
   12b12:	4c 89 fa             	mov    %r15,%rdx
   12b15:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   12b1a:	48 21 fa             	and    %rdi,%rdx
   12b1d:	4c 89 f6             	mov    %r14,%rsi
   12b20:	48 29 d6             	sub    %rdx,%rsi
   12b23:	4d 85 ff             	test   %r15,%r15
   12b26:	48 0f 49 f1          	cmovns %rcx,%rsi
   12b2a:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   12b2e:	48 89 c2             	mov    %rax,%rdx
   12b31:	48 21 fa             	and    %rdi,%rdx
   12b34:	4c 89 f7             	mov    %r14,%rdi
   12b37:	48 29 d7             	sub    %rdx,%rdi
   12b3a:	48 85 c0             	test   %rax,%rax
   12b3d:	48 0f 49 f9          	cmovns %rcx,%rdi
   12b41:	b1 01                	mov    $0x1,%cl
   12b43:	48 39 fe             	cmp    %rdi,%rsi
   12b46:	77 b9                	ja     12b01 <hyperinterval_strict_surface64+0x201>
   12b48:	44 89 f9             	mov    %r15d,%ecx
   12b4b:	4c 89 fa             	mov    %r15,%rdx
   12b4e:	48 c1 ea 08          	shr    $0x8,%rdx
   12b52:	4c 89 fe             	mov    %r15,%rsi
   12b55:	48 c1 ee 38          	shr    $0x38,%rsi
   12b59:	40 88 b4 24 bf 00 00 	mov    %sil,0xbf(%rsp)
   12b60:	00 
   12b61:	49 c1 ef 28          	shr    $0x28,%r15
   12b65:	66 44 89 bc 24 bd 00 	mov    %r15w,0xbd(%rsp)
   12b6c:	00 00 
   12b6e:	89 94 24 b9 00 00 00 	mov    %edx,0xb9(%rsp)
   12b75:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
   12b7c:	00 
   12b7d:	48 c7 84 24 b0 00 00 	movq   $0x1,0xb0(%rsp)
   12b84:	00 01 00 00 00 
   12b89:	88 8c 24 b8 00 00 00 	mov    %cl,0xb8(%rsp)
   12b90:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   12b95:	41 83 fd 02          	cmp    $0x2,%r13d
   12b99:	0f 85 d6 00 00 00    	jne    12c75 <hyperinterval_strict_surface64+0x375>
   12b9f:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
   12ba4:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
   12bab:	00 
   12bac:	e8 ff 9c 00 00       	call   1c8b0 <<hyperinterval::float::F64Enclosure>::square>
   12bb1:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   12bb8:	00 f0 7f 
   12bbb:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   12bc0:	0f b6 4c 24 78       	movzbl 0x78(%rsp),%ecx
   12bc5:	48 83 f8 02          	cmp    $0x2,%rax
   12bc9:	0f 84 32 ff ff ff    	je     12b01 <hyperinterval_strict_surface64+0x201>
   12bcf:	48 83 f8 01          	cmp    $0x1,%rax
   12bd3:	0f 85 67 01 00 00    	jne    12d40 <hyperinterval_strict_surface64+0x440>
   12bd9:	0f b6 c1             	movzbl %cl,%eax
   12bdc:	0f b6 4c 24 7f       	movzbl 0x7f(%rsp),%ecx
   12be1:	c1 e1 10             	shl    $0x10,%ecx
   12be4:	0f b7 54 24 7d       	movzwl 0x7d(%rsp),%edx
   12be9:	09 ca                	or     %ecx,%edx
   12beb:	48 c1 e2 20          	shl    $0x20,%rdx
   12bef:	8b 4c 24 79          	mov    0x79(%rsp),%ecx
   12bf3:	48 09 d1             	or     %rdx,%rcx
   12bf6:	4c 8b bc 24 80 00 00 	mov    0x80(%rsp),%r15
   12bfd:	00 
   12bfe:	48 c1 e1 08          	shl    $0x8,%rcx
   12c02:	48 09 c1             	or     %rax,%rcx
   12c05:	48 89 c8             	mov    %rcx,%rax
   12c08:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   12c0f:	00 00 80 
   12c12:	4c 31 f0             	xor    %r14,%rax
   12c15:	48 85 c9             	test   %rcx,%rcx
   12c18:	48 0f 44 c1          	cmove  %rcx,%rax
   12c1c:	48 89 c1             	mov    %rax,%rcx
   12c1f:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12c23:	48 83 c9 01          	or     $0x1,%rcx
   12c27:	48 01 c1             	add    %rax,%rcx
   12c2a:	48 89 e7             	mov    %rsp,%rdi
   12c2d:	4c 89 f6             	mov    %r14,%rsi
   12c30:	4c 89 e2             	mov    %r12,%rdx
   12c33:	e8 98 6c 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12c38:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12c3c:	74 30                	je     12c6e <hyperinterval_strict_surface64+0x36e>
   12c3e:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
   12c43:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   12c48:	4c 89 f9             	mov    %r15,%rcx
   12c4b:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12c4f:	48 83 c9 01          	or     $0x1,%rcx
   12c53:	4c 01 f9             	add    %r15,%rcx
   12c56:	48 89 e7             	mov    %rsp,%rdi
   12c59:	4c 89 f6             	mov    %r14,%rsi
   12c5c:	4c 89 e2             	mov    %r12,%rdx
   12c5f:	e8 6c 6c 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12c64:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12c68:	0f 85 94 03 00 00    	jne    13002 <hyperinterval_strict_surface64+0x702>
   12c6e:	b1 03                	mov    $0x3,%cl
   12c70:	e9 8c fe ff ff       	jmp    12b01 <hyperinterval_strict_surface64+0x201>
   12c75:	48 89 e7             	mov    %rsp,%rdi
   12c78:	4c 89 f6             	mov    %r14,%rsi
   12c7b:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   12c82:	00 f0 7f 
   12c85:	4c 89 e2             	mov    %r12,%rdx
   12c88:	48 8b 8c 24 a8 00 00 	mov    0xa8(%rsp),%rcx
   12c8f:	00 
   12c90:	45 89 e8             	mov    %r13d,%r8d
   12c93:	e8 f8 7a 00 00       	call   1a790 <<hyperinterval::ieee::Format>::power>
   12c98:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12c9c:	0f 84 5a fe ff ff    	je     12afc <hyperinterval_strict_surface64+0x1fc>
   12ca2:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12ca7:	45 89 e8             	mov    %r13d,%r8d
   12caa:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   12caf:	48 89 e7             	mov    %rsp,%rdi
   12cb2:	4c 89 f6             	mov    %r14,%rsi
   12cb5:	4c 89 e2             	mov    %r12,%rdx
   12cb8:	48 89 e9             	mov    %rbp,%rcx
   12cbb:	e8 d0 7a 00 00       	call   1a790 <<hyperinterval::ieee::Format>::power>
   12cc0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12cc4:	0f 84 32 fe ff ff    	je     12afc <hyperinterval_strict_surface64+0x1fc>
   12cca:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12ccf:	48 89 84 24 60 01 00 	mov    %rax,0x160(%rsp)
   12cd6:	00 
   12cd7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   12cdc:	48 89 84 24 58 01 00 	mov    %rax,0x158(%rsp)
   12ce3:	00 
   12ce4:	48 89 e7             	mov    %rsp,%rdi
   12ce7:	4c 89 f6             	mov    %r14,%rsi
   12cea:	4c 89 e2             	mov    %r12,%rdx
   12ced:	4c 89 f9             	mov    %r15,%rcx
   12cf0:	e8 db 6b 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12cf5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12cf9:	74 2e                	je     12d29 <hyperinterval_strict_surface64+0x429>
   12cfb:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12d00:	48 89 e7             	mov    %rsp,%rdi
   12d03:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12d0a:	00 00 80 
   12d0d:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   12d14:	00 f0 7f 
   12d17:	4c 89 e9             	mov    %r13,%rcx
   12d1a:	e8 b1 6b 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12d1f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12d23:	0f 85 9a 03 00 00    	jne    130c3 <hyperinterval_strict_surface64+0x7c3>
   12d29:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   12d2e:	88 4c 24 78          	mov    %cl,0x78(%rsp)
   12d32:	48 c7 44 24 70 02 00 	movq   $0x2,0x70(%rsp)
   12d39:	00 00 
   12d3b:	e9 71 fe ff ff       	jmp    12bb1 <hyperinterval_strict_surface64+0x2b1>
   12d40:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
   12d45:	31 c9                	xor    %ecx,%ecx
   12d47:	89 94 24 01 01 00 00 	mov    %edx,0x101(%rsp)
   12d4e:	48 89 d6             	mov    %rdx,%rsi
   12d51:	48 c1 ee 30          	shr    $0x30,%rsi
   12d55:	40 88 b4 24 07 01 00 	mov    %sil,0x107(%rsp)
   12d5c:	00 
   12d5d:	48 c1 ea 20          	shr    $0x20,%rdx
   12d61:	66 89 94 24 05 01 00 	mov    %dx,0x105(%rsp)
   12d68:	00 
   12d69:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
   12d70:	00 
   12d71:	48 89 8c 24 f8 00 00 	mov    %rcx,0xf8(%rsp)
   12d78:	00 
   12d79:	44 88 ac 24 00 01 00 	mov    %r13b,0x100(%rsp)
   12d80:	00 
   12d81:	48 8d ac 24 70 01 00 	lea    0x170(%rsp),%rbp
   12d88:	00 
   12d89:	48 8d b4 24 f8 00 00 	lea    0xf8(%rsp),%rsi
   12d90:	00 
   12d91:	4c 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%r13
   12d98:	00 
   12d99:	48 89 ef             	mov    %rbp,%rdi
   12d9c:	4c 89 ea             	mov    %r13,%rdx
   12d9f:	e8 7c a0 00 00       	call   1ce20 <<hyperinterval::float::F64Enclosure>::intersection>
   12da4:	4c 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%r15
   12dab:	00 
   12dac:	48 8d 94 24 c8 00 00 	lea    0xc8(%rsp),%rdx
   12db3:	00 
   12db4:	4c 89 ff             	mov    %r15,%rdi
   12db7:	48 89 ee             	mov    %rbp,%rsi
   12dba:	e8 31 9e 00 00       	call   1cbf0 <<hyperinterval::float::F64Enclosure>::hull>
   12dbf:	48 89 e7             	mov    %rsp,%rdi
   12dc2:	4c 89 fe             	mov    %r15,%rsi
   12dc5:	e8 96 e4 ff ff       	call   11260 <<hyperinterval::float::F64Enclosure>::abs>
   12dca:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   12dcf:	4c 89 fe             	mov    %r15,%rsi
   12dd2:	4c 89 ea             	mov    %r13,%rdx
   12dd5:	e8 66 a6 00 00       	call   1d440 <<hyperinterval::float::F64Enclosure>::min_image>
   12dda:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   12ddf:	4c 89 fe             	mov    %r15,%rsi
   12de2:	4c 89 ea             	mov    %r13,%rdx
   12de5:	e8 96 a5 00 00       	call   1d380 <<hyperinterval::float::F64Enclosure>::max_image>
   12dea:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   12def:	48 89 84 24 50 01 00 	mov    %rax,0x150(%rsp)
   12df6:	00 
   12df7:	0f 10 04 24          	movups (%rsp),%xmm0
   12dfb:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
   12e00:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
   12e05:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
   12e0a:	0f 29 9c 24 40 01 00 	movaps %xmm3,0x140(%rsp)
   12e11:	00 
   12e12:	0f 29 94 24 30 01 00 	movaps %xmm2,0x130(%rsp)
   12e19:	00 
   12e1a:	0f 29 8c 24 20 01 00 	movaps %xmm1,0x120(%rsp)
   12e21:	00 
   12e22:	0f 29 84 24 10 01 00 	movaps %xmm0,0x110(%rsp)
   12e29:	00 
   12e2a:	48 8d 84 24 10 01 00 	lea    0x110(%rsp),%rax
   12e31:	00 
   12e32:	4c 89 ff             	mov    %r15,%rdi
   12e35:	e8 96 9e 00 00       	call   1ccd0 <<hyperinterval::float::F64Enclosure>::signs>
   12e3a:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
   12e41:	00 
   12e42:	48 83 f9 01          	cmp    $0x1,%rcx
   12e46:	75 27                	jne    12e6f <hyperinterval_strict_surface64+0x56f>
   12e48:	48 8b b4 24 e8 00 00 	mov    0xe8(%rsp),%rsi
   12e4f:	00 
   12e50:	48 8b bc 24 f0 00 00 	mov    0xf0(%rsp),%rdi
   12e57:	00 
   12e58:	48 39 fe             	cmp    %rdi,%rsi
   12e5b:	0f 94 c2             	sete   %dl
   12e5e:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   12e63:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   12e68:	be 01 00 00 00       	mov    $0x1,%esi
   12e6d:	eb 04                	jmp    12e73 <hyperinterval_strict_surface64+0x573>
   12e6f:	31 d2                	xor    %edx,%edx
   12e71:	31 f6                	xor    %esi,%esi
   12e73:	80 f1 01             	xor    $0x1,%cl
   12e76:	48 89 34 24          	mov    %rsi,(%rsp)
   12e7a:	66 0f d6 4c 24 08    	movq   %xmm1,0x8(%rsp)
   12e80:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   12e84:	88 54 24 11          	mov    %dl,0x11(%rsp)
   12e88:	88 44 24 12          	mov    %al,0x12(%rsp)
   12e8c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   12e91:	66 0f d6 44 24 20    	movq   %xmm0,0x20(%rsp)
   12e97:	48 89 e0             	mov    %rsp,%rax
   12e9a:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   12ea1:	00 
   12ea2:	f3 0f 7e 84 24 68 01 	movq   0x168(%rsp),%xmm0
   12ea9:	00 00 
   12eab:	e8 60 a0 00 00       	call   1cf10 <<hyperinterval::float::F64Enclosure>::contains_point>
   12eb0:	89 d5                	mov    %edx,%ebp
   12eb2:	a8 01                	test   $0x1,%al
   12eb4:	74 09                	je     12ebf <hyperinterval_strict_surface64+0x5bf>
   12eb6:	40 88 6b 08          	mov    %bpl,0x8(%rbx)
   12eba:	e9 cb fa ff ff       	jmp    1298a <hyperinterval_strict_surface64+0x8a>
   12ebf:	4c 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%r14
   12ec6:	00 
   12ec7:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
   12ece:	00 
   12ecf:	4c 89 f7             	mov    %r14,%rdi
   12ed2:	4c 89 ee             	mov    %r13,%rsi
   12ed5:	e8 06 a4 00 00       	call   1d2e0 <<hyperinterval::float::F64Enclosure>::overlaps>
   12eda:	88 44 24 48          	mov    %al,0x48(%rsp)
   12ede:	4c 89 f7             	mov    %r14,%rdi
   12ee1:	4c 89 ee             	mov    %r13,%rsi
   12ee4:	e8 57 a3 00 00       	call   1d240 <<hyperinterval::float::F64Enclosure>::disjoint>
   12ee9:	41 89 c5             	mov    %eax,%r13d
   12eec:	4c 8d a4 24 b0 00 00 	lea    0xb0(%rsp),%r12
   12ef3:	00 
   12ef4:	4c 89 f7             	mov    %r14,%rdi
   12ef7:	4c 89 e6             	mov    %r12,%rsi
   12efa:	e8 d1 a0 00 00       	call   1cfd0 <<hyperinterval::float::F64Enclosure>::interior_subset_of>
   12eff:	41 89 c7             	mov    %eax,%r15d
   12f02:	4c 89 f7             	mov    %r14,%rdi
   12f05:	4c 89 e6             	mov    %r12,%rsi
   12f08:	e8 f3 a5 00 00       	call   1d500 <<hyperinterval::float::F64Enclosure>::subset_of>
   12f0d:	88 04 24             	mov    %al,(%rsp)
   12f10:	44 88 7c 24 01       	mov    %r15b,0x1(%rsp)
   12f15:	44 88 6c 24 02       	mov    %r13b,0x2(%rsp)
   12f1a:	0f b6 44 24 48       	movzbl 0x48(%rsp),%eax
   12f1f:	88 44 24 03          	mov    %al,0x3(%rsp)
   12f23:	40 88 6c 24 04       	mov    %bpl,0x4(%rsp)
   12f28:	48 89 e0             	mov    %rsp,%rax
   12f2b:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
   12f30:	48 89 f1             	mov    %rsi,%rcx
   12f33:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   12f3a:	00 00 80 
   12f3d:	48 31 f9             	xor    %rdi,%rcx
   12f40:	48 85 f6             	test   %rsi,%rsi
   12f43:	48 0f 44 ce          	cmove  %rsi,%rcx
   12f47:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
   12f4e:	00 
   12f4f:	48 89 f2             	mov    %rsi,%rdx
   12f52:	49 89 fe             	mov    %rdi,%r14
   12f55:	48 31 fa             	xor    %rdi,%rdx
   12f58:	48 85 f6             	test   %rsi,%rsi
   12f5b:	48 0f 44 d6          	cmove  %rsi,%rdx
   12f5f:	48 c7 84 24 10 01 00 	movq   $0x1,0x110(%rsp)
   12f66:	00 01 00 00 00 
   12f6b:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
   12f72:	00 
   12f73:	48 89 94 24 20 01 00 	mov    %rdx,0x120(%rsp)
   12f7a:	00 
   12f7b:	48 89 e7             	mov    %rsp,%rdi
   12f7e:	48 8d 94 24 10 01 00 	lea    0x110(%rsp),%rdx
   12f85:	00 
   12f86:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
   12f8d:	00 
   12f8e:	e8 4d a2 00 00       	call   1d1e0 <<hyperinterval::float::F64Enclosure>::sub>
   12f93:	48 8b 0c 24          	mov    (%rsp),%rcx
   12f97:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   12f9c:	48 83 f9 02          	cmp    $0x2,%rcx
   12fa0:	0f 84 e1 f9 ff ff    	je     12987 <hyperinterval_strict_surface64+0x87>
   12fa6:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   12fab:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12fb0:	48 89 74 24 68       	mov    %rsi,0x68(%rsp)
   12fb5:	48 89 54 24 61       	mov    %rdx,0x61(%rsp)
   12fba:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   12fbf:	88 44 24 60          	mov    %al,0x60(%rsp)
   12fc3:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
   12fca:	00 
   12fcb:	48 b9 00 00 00 00 00 	movabs $0x4000000000000000,%rcx
   12fd2:	00 00 40 
   12fd5:	4c 89 f6             	mov    %r14,%rsi
   12fd8:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   12fdf:	00 f0 7f 
   12fe2:	e8 e9 68 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   12fe7:	80 bc 24 90 00 00 00 	cmpb   $0x1,0x90(%rsp)
   12fee:	01 
   12fef:	0f 85 9d 01 00 00    	jne    13192 <hyperinterval_strict_surface64+0x892>
   12ff5:	0f b6 84 24 91 00 00 	movzbl 0x91(%rsp),%eax
   12ffc:	00 
   12ffd:	e9 85 f9 ff ff       	jmp    12987 <hyperinterval_strict_surface64+0x87>
   13002:	4c 89 e9             	mov    %r13,%rcx
   13005:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1300c:	00 00 80 
   1300f:	48 31 f1             	xor    %rsi,%rcx
   13012:	4d 85 ed             	test   %r13,%r13
   13015:	49 0f 44 cd          	cmove  %r13,%rcx
   13019:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1301e:	48 89 e7             	mov    %rsp,%rdi
   13021:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   13028:	00 f0 7f 
   1302b:	e8 a0 68 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   13030:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   13034:	0f 84 c2 fa ff ff    	je     12afc <hyperinterval_strict_surface64+0x1fc>
   1303a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1303f:	48 89 e7             	mov    %rsp,%rdi
   13042:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   13049:	00 00 80 
   1304c:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   13053:	00 f0 7f 
   13056:	4c 89 f9             	mov    %r15,%rcx
   13059:	e8 72 68 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1305e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   13062:	0f 84 94 fa ff ff    	je     12afc <hyperinterval_strict_surface64+0x1fc>
   13068:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1306d:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   13074:	00 00 80 
   13077:	4a 8d 0c 2f          	lea    (%rdi,%r13,1),%rcx
   1307b:	4c 89 ea             	mov    %r13,%rdx
   1307e:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   13083:	4c 21 c2             	and    %r8,%rdx
   13086:	48 89 fe             	mov    %rdi,%rsi
   13089:	48 29 d6             	sub    %rdx,%rsi
   1308c:	4d 85 ed             	test   %r13,%r13
   1308f:	48 0f 49 f1          	cmovns %rcx,%rsi
   13093:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   13097:	49 21 c0             	and    %rax,%r8
   1309a:	48 89 fa             	mov    %rdi,%rdx
   1309d:	4c 29 c2             	sub    %r8,%rdx
   130a0:	48 85 c0             	test   %rax,%rax
   130a3:	48 0f 49 d1          	cmovns %rcx,%rdx
   130a7:	b1 01                	mov    $0x1,%cl
   130a9:	48 39 d6             	cmp    %rdx,%rsi
   130ac:	0f 87 4f fa ff ff    	ja     12b01 <hyperinterval_strict_surface64+0x201>
   130b2:	4c 89 ea             	mov    %r13,%rdx
   130b5:	48 c1 ea 08          	shr    $0x8,%rdx
   130b9:	b9 01 00 00 00       	mov    $0x1,%ecx
   130be:	e9 84 fc ff ff       	jmp    12d47 <hyperinterval_strict_surface64+0x447>
   130c3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   130c8:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   130cf:	00 00 80 
   130d2:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   130d6:	4c 89 fa             	mov    %r15,%rdx
   130d9:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   130de:	4c 21 c2             	and    %r8,%rdx
   130e1:	48 89 fe             	mov    %rdi,%rsi
   130e4:	48 29 d6             	sub    %rdx,%rsi
   130e7:	4d 85 ff             	test   %r15,%r15
   130ea:	48 0f 49 f1          	cmovns %rcx,%rsi
   130ee:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   130f2:	48 89 c2             	mov    %rax,%rdx
   130f5:	4c 21 c2             	and    %r8,%rdx
   130f8:	48 29 d7             	sub    %rdx,%rdi
   130fb:	48 85 c0             	test   %rax,%rax
   130fe:	48 0f 49 f9          	cmovns %rcx,%rdi
   13102:	b1 01                	mov    $0x1,%cl
   13104:	48 39 fe             	cmp    %rdi,%rsi
   13107:	0f 87 21 fc ff ff    	ja     12d2e <hyperinterval_strict_surface64+0x42e>
   1310d:	48 c7 84 24 10 01 00 	movq   $0x1,0x110(%rsp)
   13114:	00 01 00 00 00 
   13119:	4c 89 bc 24 18 01 00 	mov    %r15,0x118(%rsp)
   13120:	00 
   13121:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
   13128:	00 
   13129:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
   1312e:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   13135:	00 00 80 
   13138:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1313f:	00 f0 7f 
   13142:	48 8b 8c 24 60 01 00 	mov    0x160(%rsp),%rcx
   13149:	00 
   1314a:	e8 81 67 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1314f:	80 7c 24 58 01       	cmpb   $0x1,0x58(%rsp)
   13154:	74 32                	je     13188 <hyperinterval_strict_surface64+0x888>
   13156:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
   1315b:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
   13160:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   13167:	00 00 80 
   1316a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   13171:	00 f0 7f 
   13174:	48 8b 8c 24 58 01 00 	mov    0x158(%rsp),%rcx
   1317b:	00 
   1317c:	e8 4f 67 00 00       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   13181:	80 7c 24 58 01       	cmpb   $0x1,0x58(%rsp)
   13186:	75 5a                	jne    131e2 <hyperinterval_strict_surface64+0x8e2>
   13188:	0f b6 4c 24 59       	movzbl 0x59(%rsp),%ecx
   1318d:	e9 9c fb ff ff       	jmp    12d2e <hyperinterval_strict_surface64+0x42e>
   13192:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
   13199:	00 
   1319a:	48 89 c1             	mov    %rax,%rcx
   1319d:	48 c1 e9 08          	shr    $0x8,%rcx
   131a1:	48 89 c2             	mov    %rax,%rdx
   131a4:	48 c1 ea 38          	shr    $0x38,%rdx
   131a8:	88 54 24 0f          	mov    %dl,0xf(%rsp)
   131ac:	48 89 c2             	mov    %rax,%rdx
   131af:	48 c1 ea 28          	shr    $0x28,%rdx
   131b3:	66 89 54 24 0d       	mov    %dx,0xd(%rsp)
   131b8:	89 4c 24 09          	mov    %ecx,0x9(%rsp)
   131bc:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   131c1:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   131c8:	00 
   131c9:	88 44 24 08          	mov    %al,0x8(%rsp)
   131cd:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
   131d2:	48 89 e2             	mov    %rsp,%rdx
   131d5:	48 89 df             	mov    %rbx,%rdi
   131d8:	e8 c3 9f 00 00       	call   1d1a0 <<hyperinterval::float::F64Enclosure>::div>
   131dd:	e9 af f7 ff ff       	jmp    12991 <hyperinterval_strict_surface64+0x91>
   131e2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   131e7:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   131ee:	00 00 80 
   131f1:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   131f5:	4c 89 fa             	mov    %r15,%rdx
   131f8:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   131fd:	4c 21 c2             	and    %r8,%rdx
   13200:	48 89 fe             	mov    %rdi,%rsi
   13203:	48 29 d6             	sub    %rdx,%rsi
   13206:	4d 85 ff             	test   %r15,%r15
   13209:	48 0f 49 f1          	cmovns %rcx,%rsi
   1320d:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   13211:	48 89 c2             	mov    %rax,%rdx
   13214:	4c 21 c2             	and    %r8,%rdx
   13217:	48 29 d7             	sub    %rdx,%rdi
   1321a:	48 85 c0             	test   %rax,%rax
   1321d:	48 0f 49 f9          	cmovns %rcx,%rdi
   13221:	b1 01                	mov    $0x1,%cl
   13223:	48 39 fe             	cmp    %rdi,%rsi
   13226:	0f 87 02 fb ff ff    	ja     12d2e <hyperinterval_strict_surface64+0x42e>
   1322c:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   13233:	00 
   13234:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
   13239:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1323e:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
   13245:	00 
   13246:	48 8d b4 24 10 01 00 	lea    0x110(%rsp),%rsi
   1324d:	00 
   1324e:	48 89 e2             	mov    %rsp,%rdx
   13251:	e8 9a 99 00 00       	call   1cbf0 <<hyperinterval::float::F64Enclosure>::hull>
   13256:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
   1325a:	85 c9                	test   %ecx,%ecx
   1325c:	0f 95 c0             	setne  %al
   1325f:	f6 c1 01             	test   $0x1,%cl
   13262:	0f 94 c1             	sete   %cl
   13265:	84 c8                	test   %cl,%al
   13267:	0f 84 98 00 00 00    	je     13305 <hyperinterval_strict_surface64+0xa05>
   1326d:	48 8d bc 24 c8 00 00 	lea    0xc8(%rsp),%rdi
   13274:	00 
   13275:	e8 56 9a 00 00       	call   1ccd0 <<hyperinterval::float::F64Enclosure>::signs>
   1327a:	a8 02                	test   $0x2,%al
   1327c:	0f 84 83 00 00 00    	je     13305 <hyperinterval_strict_surface64+0xa05>
   13282:	48 89 e7             	mov    %rsp,%rdi
   13285:	31 f6                	xor    %esi,%esi
   13287:	31 d2                	xor    %edx,%edx
   13289:	e8 c2 9a 00 00       	call   1cd50 <<hyperinterval::float::F64Enclosure>::from_bits>
   1328e:	48 8b 0c 24          	mov    (%rsp),%rcx
   13292:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   13297:	48 83 f9 02          	cmp    $0x2,%rcx
   1329b:	75 09                	jne    132a6 <hyperinterval_strict_surface64+0x9a6>
   1329d:	88 44 24 78          	mov    %al,0x78(%rsp)
   132a1:	e9 8c fa ff ff       	jmp    12d32 <hyperinterval_strict_surface64+0x432>
   132a6:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   132ab:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   132b0:	48 89 b4 24 20 01 00 	mov    %rsi,0x120(%rsp)
   132b7:	00 
   132b8:	48 89 94 24 19 01 00 	mov    %rdx,0x119(%rsp)
   132bf:	00 
   132c0:	48 89 8c 24 10 01 00 	mov    %rcx,0x110(%rsp)
   132c7:	00 
   132c8:	88 84 24 18 01 00 00 	mov    %al,0x118(%rsp)
   132cf:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
   132d4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
   132db:	00 
   132dc:	48 8d 94 24 10 01 00 	lea    0x110(%rsp),%rdx
   132e3:	00 
   132e4:	e8 07 99 00 00       	call   1cbf0 <<hyperinterval::float::F64Enclosure>::hull>
   132e9:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
   132ee:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   132f5:	00 
   132f6:	f3 0f 6f 44 24 58    	movdqu 0x58(%rsp),%xmm0
   132fc:	66 0f 7f 84 24 90 00 	movdqa %xmm0,0x90(%rsp)
   13303:	00 00 
   13305:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
   1330c:	00 
   1330d:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   13314:	00 
   13315:	66 0f 6f 84 24 90 00 	movdqa 0x90(%rsp),%xmm0
   1331c:	00 00 
   1331e:	66 0f 7f 44 24 70    	movdqa %xmm0,0x70(%rsp)
   13324:	e9 88 f8 ff ff       	jmp    12bb1 <hyperinterval_strict_surface64+0x2b1>
   13329:	cc                   	int3
   1332a:	cc                   	int3
   1332b:	cc                   	int3
   1332c:	cc                   	int3
   1332d:	cc                   	int3
   1332e:	cc                   	int3
   1332f:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   198d0:	48 89 c8             	mov    %rcx,%rax
   198d3:	48 f7 d0             	not    %rax
   198d6:	48 85 d0             	test   %rdx,%rax
   198d9:	75 09                	jne    198e4 <<hyperinterval::ieee::Format>::finite+0x14>
   198db:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   198df:	b0 01                	mov    $0x1,%al
   198e1:	88 07                	mov    %al,(%rdi)
   198e3:	c3                   	ret
   198e4:	48 ff ce             	dec    %rsi
   198e7:	48 85 f1             	test   %rsi,%rcx
   198ea:	74 09                	je     198f5 <<hyperinterval::ieee::Format>::finite+0x25>
   198ec:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   198f0:	31 c0                	xor    %eax,%eax
   198f2:	88 07                	mov    %al,(%rdi)
   198f4:	c3                   	ret
   198f5:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   198fc:	00 
   198fd:	31 c0                	xor    %eax,%eax
   198ff:	88 07                	mov    %al,(%rdi)
   19901:	c3                   	ret
   19902:	cc                   	int3
   19903:	cc                   	int3
   19904:	cc                   	int3
   19905:	cc                   	int3
   19906:	cc                   	int3
   19907:	cc                   	int3
   19908:	cc                   	int3
   19909:	cc                   	int3
   1990a:	cc                   	int3
   1990b:	cc                   	int3
   1990c:	cc                   	int3
   1990d:	cc                   	int3
   1990e:	cc                   	int3
   1990f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   19910:	55                   	push   %rbp
   19911:	41 57                	push   %r15
   19913:	41 56                	push   %r14
   19915:	41 55                	push   %r13
   19917:	41 54                	push   %r12
   19919:	53                   	push   %rbx
   1991a:	48 83 ec 38          	sub    $0x38,%rsp
   1991e:	48 89 fb             	mov    %rdi,%rbx
   19921:	f6 06 01             	testb  $0x1,(%rsi)
   19924:	0f 84 95 00 00 00    	je     199bf <<hyperinterval::float::F32Enclosure>::corner_image+0xaf>
   1992a:	f6 02 01             	testb  $0x1,(%rdx)
   1992d:	0f 84 8c 00 00 00    	je     199bf <<hyperinterval::float::F32Enclosure>::corner_image+0xaf>
   19933:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   19937:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   1993b:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   1993f:	8b 46 08             	mov    0x8(%rsi),%eax
   19942:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19947:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1994c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19951:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19956:	4c 89 e9             	mov    %r13,%rcx
   19959:	4d 89 e0             	mov    %r12,%r8
   1995c:	e8 df 06 00 00       	call   1a040 <<hyperinterval::ieee::Format>::div>
   19961:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19966:	75 46                	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19968:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1996c:	8b 6c 24 18          	mov    0x18(%rsp),%ebp
   19970:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19975:	be 00 00 00 80       	mov    $0x80000000,%esi
   1997a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1997f:	e8 4c ff ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19984:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19989:	75 23                	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   1998b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19990:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19995:	be 00 00 00 80       	mov    $0x80000000,%esi
   1999a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1999f:	48 89 e9             	mov    %rbp,%rcx
   199a2:	e8 29 ff ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   199a7:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   199ac:	74 26                	je     199d4 <<hyperinterval::float::F32Enclosure>::corner_image+0xc4>
   199ae:	0f b6 6c 24 09       	movzbl 0x9(%rsp),%ebp
   199b3:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   199b7:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   199bd:	eb 06                	jmp    199c5 <<hyperinterval::float::F32Enclosure>::corner_image+0xb5>
   199bf:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   199c5:	48 83 c4 38          	add    $0x38,%rsp
   199c9:	5b                   	pop    %rbx
   199ca:	41 5c                	pop    %r12
   199cc:	41 5d                	pop    %r13
   199ce:	41 5e                	pop    %r14
   199d0:	41 5f                	pop    %r15
   199d2:	5d                   	pop    %rbp
   199d3:	c3                   	ret
   199d4:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   199d9:	44 89 f8             	mov    %r15d,%eax
   199dc:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   199e1:	89 f9                	mov    %edi,%ecx
   199e3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   199e9:	ba 00 00 00 80       	mov    $0x80000000,%edx
   199ee:	29 c2                	sub    %eax,%edx
   199f0:	be 00 00 00 80       	mov    $0x80000000,%esi
   199f5:	09 f0                	or     %esi,%eax
   199f7:	45 85 ff             	test   %r15d,%r15d
   199fa:	48 0f 49 d0          	cmovns %rax,%rdx
   199fe:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19a03:	29 c8                	sub    %ecx,%eax
   19a05:	09 f1                	or     %esi,%ecx
   19a07:	85 ff                	test   %edi,%edi
   19a09:	48 0f 49 c1          	cmovns %rcx,%rax
   19a0d:	40 b5 01             	mov    $0x1,%bpl
   19a10:	39 c2                	cmp    %eax,%edx
   19a12:	77 9f                	ja     199b3 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   19a14:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   19a19:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19a1e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a23:	4c 89 e9             	mov    %r13,%rcx
   19a26:	4d 89 f0             	mov    %r14,%r8
   19a29:	e8 12 06 00 00       	call   1a040 <<hyperinterval::ieee::Format>::div>
   19a2e:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19a33:	0f 85 75 ff ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19a39:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19a3d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   19a42:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19a47:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a4c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a51:	e8 7a fe ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19a56:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19a5b:	0f 84 4d ff ff ff    	je     199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19a61:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19a66:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   19a6b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19a70:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a75:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a7a:	4c 89 e9             	mov    %r13,%rcx
   19a7d:	e8 4e fe ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19a82:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19a87:	0f 84 21 ff ff ff    	je     199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19a8d:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   19a92:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
   19a97:	44 89 c1             	mov    %r8d,%ecx
   19a9a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19aa0:	44 89 e8             	mov    %r13d,%eax
   19aa3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19aa8:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19aad:	48 29 ca             	sub    %rcx,%rdx
   19ab0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19ab5:	48 09 f9             	or     %rdi,%rcx
   19ab8:	45 85 c0             	test   %r8d,%r8d
   19abb:	48 0f 48 ca          	cmovs  %rdx,%rcx
   19abf:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19ac4:	48 29 c2             	sub    %rax,%rdx
   19ac7:	48 09 f8             	or     %rdi,%rax
   19aca:	45 85 ed             	test   %r13d,%r13d
   19acd:	48 0f 48 c2          	cmovs  %rdx,%rax
   19ad1:	48 39 c1             	cmp    %rax,%rcx
   19ad4:	0f 87 d9 fe ff ff    	ja     199b3 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   19ada:	44 89 fa             	mov    %r15d,%edx
   19add:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19ae3:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ae8:	29 d6                	sub    %edx,%esi
   19aea:	09 fa                	or     %edi,%edx
   19aec:	45 85 ff             	test   %r15d,%r15d
   19aef:	48 0f 49 f2          	cmovns %rdx,%rsi
   19af3:	39 ce                	cmp    %ecx,%esi
   19af5:	45 0f 46 c7          	cmovbe %r15d,%r8d
   19af9:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
   19afe:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   19b03:	89 f1                	mov    %esi,%ecx
   19b05:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19b0b:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19b10:	29 ca                	sub    %ecx,%edx
   19b12:	09 f9                	or     %edi,%ecx
   19b14:	85 f6                	test   %esi,%esi
   19b16:	48 0f 49 d1          	cmovns %rcx,%rdx
   19b1a:	39 c2                	cmp    %eax,%edx
   19b1c:	44 0f 43 ee          	cmovae %esi,%r13d
   19b20:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b25:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b2a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b2f:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19b34:	4d 89 e0             	mov    %r12,%r8
   19b37:	e8 04 05 00 00       	call   1a040 <<hyperinterval::ieee::Format>::div>
   19b3c:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19b41:	0f 85 67 fe ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19b47:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19b4b:	44 8b 64 24 18       	mov    0x18(%rsp),%r12d
   19b50:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b55:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b5a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b5f:	e8 6c fd ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19b64:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19b69:	0f 85 3f fe ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19b6f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19b74:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19b79:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b7e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b83:	4c 89 e1             	mov    %r12,%rcx
   19b86:	e8 45 fd ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19b8b:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19b90:	0f 85 18 fe ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19b96:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   19b9b:	44 89 f9             	mov    %r15d,%ecx
   19b9e:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19ba4:	44 89 e0             	mov    %r12d,%eax
   19ba7:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19bac:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19bb1:	48 29 ca             	sub    %rcx,%rdx
   19bb4:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19bba:	4c 09 c1             	or     %r8,%rcx
   19bbd:	45 85 ff             	test   %r15d,%r15d
   19bc0:	48 0f 48 ca          	cmovs  %rdx,%rcx
   19bc4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19bc9:	48 29 c2             	sub    %rax,%rdx
   19bcc:	4c 09 c0             	or     %r8,%rax
   19bcf:	45 85 e4             	test   %r12d,%r12d
   19bd2:	48 0f 48 c2          	cmovs  %rdx,%rax
   19bd6:	48 39 c1             	cmp    %rax,%rcx
   19bd9:	0f 87 d4 fd ff ff    	ja     199b3 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   19bdf:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
   19be4:	44 89 ca             	mov    %r9d,%edx
   19be7:	44 09 c2             	or     %r8d,%edx
   19bea:	44 89 ce             	mov    %r9d,%esi
   19bed:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19bf3:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19bf8:	29 f7                	sub    %esi,%edi
   19bfa:	45 85 c9             	test   %r9d,%r9d
   19bfd:	48 0f 49 fa          	cmovns %rdx,%rdi
   19c01:	39 cf                	cmp    %ecx,%edi
   19c03:	45 0f 46 f9          	cmovbe %r9d,%r15d
   19c07:	44 89 e9             	mov    %r13d,%ecx
   19c0a:	44 09 c1             	or     %r8d,%ecx
   19c0d:	44 89 ea             	mov    %r13d,%edx
   19c10:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19c16:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c1b:	29 d6                	sub    %edx,%esi
   19c1d:	45 85 ed             	test   %r13d,%r13d
   19c20:	48 0f 49 f1          	cmovns %rcx,%rsi
   19c24:	39 c6                	cmp    %eax,%esi
   19c26:	45 0f 43 e5          	cmovae %r13d,%r12d
   19c2a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c2f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c34:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c39:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19c3e:	4d 89 f0             	mov    %r14,%r8
   19c41:	e8 fa 03 00 00       	call   1a040 <<hyperinterval::ieee::Format>::div>
   19c46:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19c4b:	0f 85 5d fd ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19c51:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19c55:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   19c5a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c5f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c64:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c69:	e8 62 fc ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19c6e:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19c73:	0f 85 35 fd ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19c79:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   19c7e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19c83:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c88:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c8d:	4c 89 f1             	mov    %r14,%rcx
   19c90:	e8 3b fc ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   19c95:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19c9a:	0f 85 0e fd ff ff    	jne    199ae <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19ca0:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19ca5:	44 89 ea             	mov    %r13d,%edx
   19ca8:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19cae:	89 c1                	mov    %eax,%ecx
   19cb0:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19cb6:	be 00 00 00 80       	mov    $0x80000000,%esi
   19cbb:	48 29 d6             	sub    %rdx,%rsi
   19cbe:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19cc3:	48 09 fa             	or     %rdi,%rdx
   19cc6:	45 85 ed             	test   %r13d,%r13d
   19cc9:	48 0f 48 d6          	cmovs  %rsi,%rdx
   19ccd:	be 00 00 00 80       	mov    $0x80000000,%esi
   19cd2:	48 29 ce             	sub    %rcx,%rsi
   19cd5:	48 09 f9             	or     %rdi,%rcx
   19cd8:	85 c0                	test   %eax,%eax
   19cda:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19cde:	48 39 ca             	cmp    %rcx,%rdx
   19ce1:	0f 87 cc fc ff ff    	ja     199b3 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   19ce7:	44 89 fe             	mov    %r15d,%esi
   19cea:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19cf0:	44 09 ce             	or     %r9d,%esi
   19cf3:	44 89 ff             	mov    %r15d,%edi
   19cf6:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19cfc:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19d02:	41 29 f8             	sub    %edi,%r8d
   19d05:	45 85 ff             	test   %r15d,%r15d
   19d08:	4c 0f 49 c6          	cmovns %rsi,%r8
   19d0c:	41 39 d0             	cmp    %edx,%r8d
   19d0f:	45 0f 46 ef          	cmovbe %r15d,%r13d
   19d13:	44 89 e2             	mov    %r12d,%edx
   19d16:	44 09 ca             	or     %r9d,%edx
   19d19:	44 89 e6             	mov    %r12d,%esi
   19d1c:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19d22:	41 29 f1             	sub    %esi,%r9d
   19d25:	45 85 e4             	test   %r12d,%r12d
   19d28:	4c 0f 49 ca          	cmovns %rdx,%r9
   19d2c:	41 39 c9             	cmp    %ecx,%r9d
   19d2f:	41 0f 43 c4          	cmovae %r12d,%eax
   19d33:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19d39:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   19d3d:	89 43 08             	mov    %eax,0x8(%rbx)
   19d40:	e9 80 fc ff ff       	jmp    199c5 <<hyperinterval::float::F32Enclosure>::corner_image+0xb5>
   19d45:	cc                   	int3
   19d46:	cc                   	int3
   19d47:	cc                   	int3
   19d48:	cc                   	int3
   19d49:	cc                   	int3
   19d4a:	cc                   	int3
   19d4b:	cc                   	int3
   19d4c:	cc                   	int3
   19d4d:	cc                   	int3
   19d4e:	cc                   	int3
   19d4f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   19d50:	48 89 c8             	mov    %rcx,%rax
   19d53:	4c 8b 11             	mov    (%rcx),%r10
   19d56:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   19d5a:	4c 89 d1             	mov    %r10,%rcx
   19d5d:	4c 09 d9             	or     %r11,%rcx
   19d60:	0f 84 dd 00 00 00    	je     19e43 <<hyperinterval::ieee::Format>::rounded+0xf3>
   19d66:	55                   	push   %rbp
   19d67:	41 57                	push   %r15
   19d69:	41 56                	push   %r14
   19d6b:	41 55                	push   %r13
   19d6d:	41 54                	push   %r12
   19d6f:	53                   	push   %rbx
   19d70:	8b 68 10             	mov    0x10(%rax),%ebp
   19d73:	49 0f bd cb          	bsr    %r11,%rcx
   19d77:	83 f1 3f             	xor    $0x3f,%ecx
   19d7a:	49 0f bd da          	bsr    %r10,%rbx
   19d7e:	83 f3 3f             	xor    $0x3f,%ebx
   19d81:	83 cb 40             	or     $0x40,%ebx
   19d84:	4d 85 db             	test   %r11,%r11
   19d87:	0f 45 d9             	cmovne %ecx,%ebx
   19d8a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   19d8f:	44 89 c1             	mov    %r8d,%ecx
   19d92:	48 d3 ea             	shr    %cl,%rdx
   19d95:	83 f3 7f             	xor    $0x7f,%ebx
   19d98:	01 eb                	add    %ebp,%ebx
   19d9a:	48 d1 ea             	shr    $1,%rdx
   19d9d:	39 d3                	cmp    %edx,%ebx
   19d9f:	0f 8f 88 01 00 00    	jg     19f2d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19da5:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   19da9:	b9 01 00 00 00       	mov    $0x1,%ecx
   19dae:	44 29 c9             	sub    %r9d,%ecx
   19db1:	44 29 c3             	sub    %r8d,%ebx
   19db4:	39 cb                	cmp    %ecx,%ebx
   19db6:	0f 4e d9             	cmovle %ecx,%ebx
   19db9:	89 d9                	mov    %ebx,%ecx
   19dbb:	29 e9                	sub    %ebp,%ecx
   19dbd:	83 f9 7f             	cmp    $0x7f,%ecx
   19dc0:	0f 8e 88 00 00 00    	jle    19e4e <<hyperinterval::ieee::Format>::rounded+0xfe>
   19dc6:	41 b7 01             	mov    $0x1,%r15b
   19dc9:	45 31 f6             	xor    %r14d,%r14d
   19dcc:	45 31 db             	xor    %r11d,%r11d
   19dcf:	45 31 d2             	xor    %r10d,%r10d
   19dd2:	45 0f b6 ff          	movzbl %r15b,%r15d
   19dd6:	4d 01 f7             	add    %r14,%r15
   19dd9:	49 83 d3 00          	adc    $0x0,%r11
   19ddd:	4c 89 f9             	mov    %r15,%rcx
   19de0:	4c 09 d9             	or     %r11,%rcx
   19de3:	0f 84 c3 00 00 00    	je     19eac <<hyperinterval::ieee::Format>::rounded+0x15c>
   19de9:	49 0f bd cb          	bsr    %r11,%rcx
   19ded:	83 f1 3f             	xor    $0x3f,%ecx
   19df0:	4d 0f bd f7          	bsr    %r15,%r14
   19df4:	41 83 f6 3f          	xor    $0x3f,%r14d
   19df8:	41 83 ce 40          	or     $0x40,%r14d
   19dfc:	4d 85 db             	test   %r11,%r11
   19dff:	44 0f 45 f1          	cmovne %ecx,%r14d
   19e03:	41 83 f6 7f          	xor    $0x7f,%r14d
   19e07:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   19e0b:	39 d5                	cmp    %edx,%ebp
   19e0d:	0f 8f 1a 01 00 00    	jg     19f2d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19e13:	b9 01 00 00 00       	mov    $0x1,%ecx
   19e18:	29 d1                	sub    %edx,%ecx
   19e1a:	39 cd                	cmp    %ecx,%ebp
   19e1c:	0f 8d 41 01 00 00    	jge    19f63 <<hyperinterval::ieee::Format>::rounded+0x213>
   19e22:	41 01 d9             	add    %ebx,%r9d
   19e25:	41 fe c9             	dec    %r9b
   19e28:	44 89 c9             	mov    %r9d,%ecx
   19e2b:	49 d3 e7             	shl    %cl,%r15
   19e2e:	31 d2                	xor    %edx,%edx
   19e30:	41 f6 c1 40          	test   $0x40,%r9b
   19e34:	49 0f 44 d7          	cmove  %r15,%rdx
   19e38:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   19e3c:	74 76                	je     19eb4 <<hyperinterval::ieee::Format>::rounded+0x164>
   19e3e:	e9 8e 00 00 00       	jmp    19ed1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19e43:	c6 07 00             	movb   $0x0,(%rdi)
   19e46:	0f 57 c0             	xorps  %xmm0,%xmm0
   19e49:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   19e4d:	c3                   	ret
   19e4e:	85 c9                	test   %ecx,%ecx
   19e50:	0f 8e 88 00 00 00    	jle    19ede <<hyperinterval::ieee::Format>::rounded+0x18e>
   19e56:	4d 89 d6             	mov    %r10,%r14
   19e59:	4d 0f ad de          	shrd   %cl,%r11,%r14
   19e5d:	4d 89 dc             	mov    %r11,%r12
   19e60:	49 d3 ec             	shr    %cl,%r12
   19e63:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   19e6a:	49 d3 e7             	shl    %cl,%r15
   19e6d:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   19e74:	31 ed                	xor    %ebp,%ebp
   19e76:	f6 c1 40             	test   $0x40,%cl
   19e79:	4d 0f 45 f4          	cmovne %r12,%r14
   19e7d:	4c 0f 45 e5          	cmovne %rbp,%r12
   19e81:	4d 0f 45 ef          	cmovne %r15,%r13
   19e85:	4c 0f 45 fd          	cmovne %rbp,%r15
   19e89:	49 f7 d7             	not    %r15
   19e8c:	49 f7 d5             	not    %r13
   19e8f:	4d 21 dd             	and    %r11,%r13
   19e92:	4d 21 d7             	and    %r10,%r15
   19e95:	4d 09 ef             	or     %r13,%r15
   19e98:	41 0f 95 c7          	setne  %r15b
   19e9c:	4d 89 e3             	mov    %r12,%r11
   19e9f:	4c 89 f1             	mov    %r14,%rcx
   19ea2:	4c 09 d9             	or     %r11,%rcx
   19ea5:	75 60                	jne    19f07 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   19ea7:	e9 1d ff ff ff       	jmp    19dc9 <<hyperinterval::ieee::Format>::rounded+0x79>
   19eac:	31 d2                	xor    %edx,%edx
   19eae:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   19eb2:	75 1d                	jne    19ed1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19eb4:	48 89 d0             	mov    %rdx,%rax
   19eb7:	48 31 f0             	xor    %rsi,%rax
   19eba:	48 85 d2             	test   %rdx,%rdx
   19ebd:	48 0f 44 c2          	cmove  %rdx,%rax
   19ec1:	4c 31 d6             	xor    %r10,%rsi
   19ec4:	4d 85 d2             	test   %r10,%r10
   19ec7:	49 0f 44 f2          	cmove  %r10,%rsi
   19ecb:	49 89 c2             	mov    %rax,%r10
   19ece:	48 89 f2             	mov    %rsi,%rdx
   19ed1:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   19ed5:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   19ed9:	c6 07 00             	movb   $0x0,(%rdi)
   19edc:	eb 54                	jmp    19f32 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   19ede:	f6 d9                	neg    %cl
   19ee0:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   19ee4:	49 d3 e2             	shl    %cl,%r10
   19ee7:	45 31 ff             	xor    %r15d,%r15d
   19eea:	f6 c1 40             	test   $0x40,%cl
   19eed:	4d 0f 45 da          	cmovne %r10,%r11
   19ef1:	41 be 00 00 00 00    	mov    $0x0,%r14d
   19ef7:	4d 0f 44 f2          	cmove  %r10,%r14
   19efb:	4c 89 f1             	mov    %r14,%rcx
   19efe:	4c 09 d9             	or     %r11,%rcx
   19f01:	0f 84 c2 fe ff ff    	je     19dc9 <<hyperinterval::ieee::Format>::rounded+0x79>
   19f07:	49 0f bd cb          	bsr    %r11,%rcx
   19f0b:	83 f1 3f             	xor    $0x3f,%ecx
   19f0e:	4d 0f bd e6          	bsr    %r14,%r12
   19f12:	41 83 f4 3f          	xor    $0x3f,%r12d
   19f16:	41 83 cc 40          	or     $0x40,%r12d
   19f1a:	4d 85 db             	test   %r11,%r11
   19f1d:	44 0f 45 e1          	cmovne %ecx,%r12d
   19f21:	41 83 f4 7f          	xor    $0x7f,%r12d
   19f25:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   19f29:	39 d5                	cmp    %edx,%ebp
   19f2b:	7e 10                	jle    19f3d <<hyperinterval::ieee::Format>::rounded+0x1ed>
   19f2d:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   19f32:	5b                   	pop    %rbx
   19f33:	41 5c                	pop    %r12
   19f35:	41 5d                	pop    %r13
   19f37:	41 5e                	pop    %r14
   19f39:	41 5f                	pop    %r15
   19f3b:	5d                   	pop    %rbp
   19f3c:	c3                   	ret
   19f3d:	b9 01 00 00 00       	mov    $0x1,%ecx
   19f42:	29 d1                	sub    %edx,%ecx
   19f44:	39 cd                	cmp    %ecx,%ebp
   19f46:	7d 7d                	jge    19fc5 <<hyperinterval::ieee::Format>::rounded+0x275>
   19f48:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   19f4c:	fe c9                	dec    %cl
   19f4e:	4d 89 f4             	mov    %r14,%r12
   19f51:	49 d3 e4             	shl    %cl,%r12
   19f54:	45 31 d2             	xor    %r10d,%r10d
   19f57:	f6 c1 40             	test   $0x40,%cl
   19f5a:	4d 0f 44 d4          	cmove  %r12,%r10
   19f5e:	e9 6f fe ff ff       	jmp    19dd2 <<hyperinterval::ieee::Format>::rounded+0x82>
   19f63:	44 89 c1             	mov    %r8d,%ecx
   19f66:	44 29 f1             	sub    %r14d,%ecx
   19f69:	41 89 c9             	mov    %ecx,%r9d
   19f6c:	41 f7 d9             	neg    %r9d
   19f6f:	4c 89 fb             	mov    %r15,%rbx
   19f72:	48 d3 e3             	shl    %cl,%rbx
   19f75:	45 31 e4             	xor    %r12d,%r12d
   19f78:	f6 c1 40             	test   $0x40,%cl
   19f7b:	4c 0f 44 e3          	cmove  %rbx,%r12
   19f7f:	44 89 c9             	mov    %r9d,%ecx
   19f82:	4d 0f ad df          	shrd   %cl,%r11,%r15
   19f86:	49 d3 eb             	shr    %cl,%r11
   19f89:	41 f6 c1 40          	test   $0x40,%r9b
   19f8d:	4d 0f 44 df          	cmove  %r15,%r11
   19f91:	45 39 f0             	cmp    %r14d,%r8d
   19f94:	4d 0f 43 dc          	cmovae %r12,%r11
   19f98:	01 d5                	add    %edx,%ebp
   19f9a:	4c 63 cd             	movslq %ebp,%r9
   19f9d:	44 89 c1             	mov    %r8d,%ecx
   19fa0:	49 d3 e1             	shl    %cl,%r9
   19fa3:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   19faa:	48 d3 e2             	shl    %cl,%rdx
   19fad:	48 f7 d2             	not    %rdx
   19fb0:	4c 21 da             	and    %r11,%rdx
   19fb3:	4c 09 ca             	or     %r9,%rdx
   19fb6:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   19fba:	0f 85 11 ff ff ff    	jne    19ed1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19fc0:	e9 ef fe ff ff       	jmp    19eb4 <<hyperinterval::ieee::Format>::rounded+0x164>
   19fc5:	44 89 c1             	mov    %r8d,%ecx
   19fc8:	44 29 e1             	sub    %r12d,%ecx
   19fcb:	4d 89 f5             	mov    %r14,%r13
   19fce:	49 d3 e5             	shl    %cl,%r13
   19fd1:	41 89 ca             	mov    %ecx,%r10d
   19fd4:	41 f7 da             	neg    %r10d
   19fd7:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   19fde:	00 00 
   19fe0:	f6 c1 40             	test   $0x40,%cl
   19fe3:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   19fe8:	49 0f 44 cd          	cmove  %r13,%rcx
   19fec:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   19ff1:	4d 89 f5             	mov    %r14,%r13
   19ff4:	44 89 d1             	mov    %r10d,%ecx
   19ff7:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   19ffb:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   1a000:	4d 89 dd             	mov    %r11,%r13
   1a003:	49 d3 ed             	shr    %cl,%r13
   1a006:	41 f6 c2 40          	test   $0x40,%r10b
   1a00a:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   1a010:	45 39 e0             	cmp    %r12d,%r8d
   1a013:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   1a019:	01 d5                	add    %edx,%ebp
   1a01b:	4c 63 e5             	movslq %ebp,%r12
   1a01e:	44 89 c1             	mov    %r8d,%ecx
   1a021:	49 d3 e4             	shl    %cl,%r12
   1a024:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1a02b:	49 d3 e2             	shl    %cl,%r10
   1a02e:	49 f7 d2             	not    %r10
   1a031:	4d 21 ea             	and    %r13,%r10
   1a034:	4d 09 e2             	or     %r12,%r10
   1a037:	e9 96 fd ff ff       	jmp    19dd2 <<hyperinterval::ieee::Format>::rounded+0x82>
   1a03c:	cc                   	int3
   1a03d:	cc                   	int3
   1a03e:	cc                   	int3
   1a03f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   1a040:	55                   	push   %rbp
   1a041:	41 57                	push   %r15
   1a043:	41 56                	push   %r14
   1a045:	41 55                	push   %r13
   1a047:	41 54                	push   %r12
   1a049:	53                   	push   %rbx
   1a04a:	48 83 ec 38          	sub    $0x38,%rsp
   1a04e:	4d 85 c0             	test   %r8,%r8
   1a051:	74 47                	je     1a09a <<hyperinterval::ieee::Format>::div+0x5a>
   1a053:	48 85 c9             	test   %rcx,%rcx
   1a056:	74 4c                	je     1a0a4 <<hyperinterval::ieee::Format>::div+0x64>
   1a058:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1a05d:	49 89 c9             	mov    %rcx,%r9
   1a060:	49 21 d1             	and    %rdx,%r9
   1a063:	48 89 c8             	mov    %rcx,%rax
   1a066:	44 89 f1             	mov    %r14d,%ecx
   1a069:	49 d3 e9             	shr    %cl,%r9
   1a06c:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1a072:	49 d3 e2             	shl    %cl,%r10
   1a075:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   1a079:	49 89 ec             	mov    %rbp,%r12
   1a07c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a081:	49 21 c4             	and    %rax,%r12
   1a084:	48 89 d0             	mov    %rdx,%rax
   1a087:	48 d3 e8             	shr    %cl,%rax
   1a08a:	4d 85 c9             	test   %r9,%r9
   1a08d:	74 24                	je     1a0b3 <<hyperinterval::ieee::Format>::div+0x73>
   1a08f:	4d 09 d4             	or     %r10,%r12
   1a092:	48 d1 e8             	shr    $1,%rax
   1a095:	44 01 f0             	add    %r14d,%eax
   1a098:	eb 25                	jmp    1a0bf <<hyperinterval::ieee::Format>::div+0x7f>
   1a09a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1a09f:	e9 ae 03 00 00       	jmp    1a452 <<hyperinterval::ieee::Format>::div+0x412>
   1a0a4:	c6 07 00             	movb   $0x0,(%rdi)
   1a0a7:	0f 57 c0             	xorps  %xmm0,%xmm0
   1a0aa:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1a0ae:	e9 9f 03 00 00       	jmp    1a452 <<hyperinterval::ieee::Format>::div+0x412>
   1a0b3:	48 d1 e8             	shr    $1,%rax
   1a0b6:	44 01 f0             	add    %r14d,%eax
   1a0b9:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1a0bf:	41 29 c1             	sub    %eax,%r9d
   1a0c2:	4d 89 c3             	mov    %r8,%r11
   1a0c5:	49 21 d3             	and    %rdx,%r11
   1a0c8:	44 89 f1             	mov    %r14d,%ecx
   1a0cb:	49 d3 eb             	shr    %cl,%r11
   1a0ce:	4c 21 c5             	and    %r8,%rbp
   1a0d1:	48 89 d0             	mov    %rdx,%rax
   1a0d4:	48 d3 e8             	shr    %cl,%rax
   1a0d7:	4d 85 db             	test   %r11,%r11
   1a0da:	74 0e                	je     1a0ea <<hyperinterval::ieee::Format>::div+0xaa>
   1a0dc:	4c 09 d5             	or     %r10,%rbp
   1a0df:	48 d1 e8             	shr    $1,%rax
   1a0e2:	44 01 f0             	add    %r14d,%eax
   1a0e5:	44 29 d8             	sub    %r11d,%eax
   1a0e8:	eb 08                	jmp    1a0f2 <<hyperinterval::ieee::Format>::div+0xb2>
   1a0ea:	48 d1 e8             	shr    $1,%rax
   1a0ed:	44 01 f0             	add    %r14d,%eax
   1a0f0:	ff c8                	dec    %eax
   1a0f2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a0f7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1a0fd:	4c 0f bd d5          	bsr    %rbp,%r10
   1a101:	41 83 f2 3f          	xor    $0x3f,%r10d
   1a105:	41 83 c2 40          	add    $0x40,%r10d
   1a109:	49 0f bd cc          	bsr    %r12,%rcx
   1a10d:	83 f1 3f             	xor    $0x3f,%ecx
   1a110:	45 89 d7             	mov    %r10d,%r15d
   1a113:	41 29 cf             	sub    %ecx,%r15d
   1a116:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1a11a:	78 26                	js     1a142 <<hyperinterval::ieee::Format>::div+0x102>
   1a11c:	45 31 db             	xor    %r11d,%r11d
   1a11f:	44 89 f9             	mov    %r15d,%ecx
   1a122:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   1a126:	31 db                	xor    %ebx,%ebx
   1a128:	49 89 ed             	mov    %rbp,%r13
   1a12b:	49 d3 e5             	shl    %cl,%r13
   1a12e:	41 f6 c7 40          	test   $0x40,%r15b
   1a132:	4d 0f 45 dd          	cmovne %r13,%r11
   1a136:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a13a:	4d 39 ec             	cmp    %r13,%r12
   1a13d:	4c 19 db             	sbb    %r11,%rbx
   1a140:	eb 26                	jmp    1a168 <<hyperinterval::ieee::Format>::div+0x128>
   1a142:	44 89 f9             	mov    %r15d,%ecx
   1a145:	f6 d9                	neg    %cl
   1a147:	45 31 db             	xor    %r11d,%r11d
   1a14a:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   1a14e:	31 db                	xor    %ebx,%ebx
   1a150:	4d 89 e5             	mov    %r12,%r13
   1a153:	49 d3 e5             	shl    %cl,%r13
   1a156:	f6 c1 40             	test   $0x40,%cl
   1a159:	4d 0f 45 dd          	cmovne %r13,%r11
   1a15d:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a161:	49 39 ed             	cmp    %rbp,%r13
   1a164:	49 83 db 00          	sbb    $0x0,%r11
   1a168:	41 0f 92 c3          	setb   %r11b
   1a16c:	44 89 f1             	mov    %r14d,%ecx
   1a16f:	48 d3 ea             	shr    %cl,%rdx
   1a172:	44 01 c8             	add    %r9d,%eax
   1a175:	41 01 c7             	add    %eax,%r15d
   1a178:	41 0f b6 cb          	movzbl %r11b,%ecx
   1a17c:	41 29 cf             	sub    %ecx,%r15d
   1a17f:	48 d1 ea             	shr    $1,%rdx
   1a182:	41 39 d7             	cmp    %edx,%r15d
   1a185:	0f 8f 0e 02 00 00    	jg     1a399 <<hyperinterval::ieee::Format>::div+0x359>
   1a18b:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   1a18f:	b9 01 00 00 00       	mov    $0x1,%ecx
   1a194:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   1a199:	44 29 c9             	sub    %r9d,%ecx
   1a19c:	45 29 f7             	sub    %r14d,%r15d
   1a19f:	41 39 cf             	cmp    %ecx,%r15d
   1a1a2:	44 0f 4e f9          	cmovle %ecx,%r15d
   1a1a6:	44 29 f8             	sub    %r15d,%eax
   1a1a9:	78 61                	js     1a20c <<hyperinterval::ieee::Format>::div+0x1cc>
   1a1ab:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a1b0:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   1a1b5:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1a1ba:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1a1bf:	48 85 ed             	test   %rbp,%rbp
   1a1c2:	0f 84 99 02 00 00    	je     1a461 <<hyperinterval::ieee::Format>::div+0x421>
   1a1c8:	45 31 ed             	xor    %r13d,%r13d
   1a1cb:	89 c1                	mov    %eax,%ecx
   1a1cd:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   1a1d1:	31 d2                	xor    %edx,%edx
   1a1d3:	49 d3 e4             	shl    %cl,%r12
   1a1d6:	a8 40                	test   $0x40,%al
   1a1d8:	4d 0f 45 ec          	cmovne %r12,%r13
   1a1dc:	4c 0f 45 e2          	cmovne %rdx,%r12
   1a1e0:	4c 89 e7             	mov    %r12,%rdi
   1a1e3:	4c 89 ee             	mov    %r13,%rsi
   1a1e6:	48 89 ea             	mov    %rbp,%rdx
   1a1e9:	31 c9                	xor    %ecx,%ecx
   1a1eb:	ff 15 af 7a 03 00    	call   *0x37aaf(%rip)        # 51ca0 <_DYNAMIC+0x298>
   1a1f1:	49 89 c2             	mov    %rax,%r10
   1a1f4:	49 89 d1             	mov    %rdx,%r9
   1a1f7:	48 89 d1             	mov    %rdx,%rcx
   1a1fa:	48 0f af cd          	imul   %rbp,%rcx
   1a1fe:	48 f7 e5             	mul    %rbp
   1a201:	48 01 ca             	add    %rcx,%rdx
   1a204:	49 29 c4             	sub    %rax,%r12
   1a207:	49 19 d5             	sbb    %rdx,%r13
   1a20a:	eb 79                	jmp    1a285 <<hyperinterval::ieee::Format>::div+0x245>
   1a20c:	f7 d8                	neg    %eax
   1a20e:	44 39 d0             	cmp    %r10d,%eax
   1a211:	7e 07                	jle    1a21a <<hyperinterval::ieee::Format>::div+0x1da>
   1a213:	b3 01                	mov    $0x1,%bl
   1a215:	e9 df 00 00 00       	jmp    1a2f9 <<hyperinterval::ieee::Format>::div+0x2b9>
   1a21a:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1a21f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   1a224:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1a229:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1a22e:	31 db                	xor    %ebx,%ebx
   1a230:	89 c1                	mov    %eax,%ecx
   1a232:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   1a236:	48 d3 e5             	shl    %cl,%rbp
   1a239:	31 c9                	xor    %ecx,%ecx
   1a23b:	a8 40                	test   $0x40,%al
   1a23d:	48 0f 45 dd          	cmovne %rbp,%rbx
   1a241:	48 0f 45 e9          	cmovne %rcx,%rbp
   1a245:	48 89 e8             	mov    %rbp,%rax
   1a248:	48 09 d8             	or     %rbx,%rax
   1a24b:	0f 84 1c 02 00 00    	je     1a46d <<hyperinterval::ieee::Format>::div+0x42d>
   1a251:	45 31 ed             	xor    %r13d,%r13d
   1a254:	4c 89 e7             	mov    %r12,%rdi
   1a257:	31 f6                	xor    %esi,%esi
   1a259:	48 89 ea             	mov    %rbp,%rdx
   1a25c:	48 89 d9             	mov    %rbx,%rcx
   1a25f:	ff 15 3b 7a 03 00    	call   *0x37a3b(%rip)        # 51ca0 <_DYNAMIC+0x298>
   1a265:	49 89 c2             	mov    %rax,%r10
   1a268:	49 89 d1             	mov    %rdx,%r9
   1a26b:	48 0f af d8          	imul   %rax,%rbx
   1a26f:	48 f7 e5             	mul    %rbp
   1a272:	48 01 da             	add    %rbx,%rdx
   1a275:	4c 89 c9             	mov    %r9,%rcx
   1a278:	48 0f af cd          	imul   %rbp,%rcx
   1a27c:	48 01 d1             	add    %rdx,%rcx
   1a27f:	49 29 c4             	sub    %rax,%r12
   1a282:	49 19 cd             	sbb    %rcx,%r13
   1a285:	4d 09 ec             	or     %r13,%r12
   1a288:	0f 95 c3             	setne  %bl
   1a28b:	4c 89 d0             	mov    %r10,%rax
   1a28e:	4c 09 c8             	or     %r9,%rax
   1a291:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   1a296:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1a29b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   1a2a0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   1a2a5:	74 52                	je     1a2f9 <<hyperinterval::ieee::Format>::div+0x2b9>
   1a2a7:	49 0f bd c1          	bsr    %r9,%rax
   1a2ab:	83 f0 3f             	xor    $0x3f,%eax
   1a2ae:	4d 0f bd da          	bsr    %r10,%r11
   1a2b2:	41 83 f3 3f          	xor    $0x3f,%r11d
   1a2b6:	41 83 cb 40          	or     $0x40,%r11d
   1a2ba:	4d 85 c9             	test   %r9,%r9
   1a2bd:	44 0f 45 d8          	cmovne %eax,%r11d
   1a2c1:	41 83 f3 7f          	xor    $0x7f,%r11d
   1a2c5:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   1a2c9:	39 d5                	cmp    %edx,%ebp
   1a2cb:	0f 8f c8 00 00 00    	jg     1a399 <<hyperinterval::ieee::Format>::div+0x359>
   1a2d1:	b8 01 00 00 00       	mov    $0x1,%eax
   1a2d6:	29 d0                	sub    %edx,%eax
   1a2d8:	39 c5                	cmp    %eax,%ebp
   1a2da:	7d 28                	jge    1a304 <<hyperinterval::ieee::Format>::div+0x2c4>
   1a2dc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a2e1:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   1a2e5:	fe c9                	dec    %cl
   1a2e7:	4c 89 d0             	mov    %r10,%rax
   1a2ea:	48 d3 e0             	shl    %cl,%rax
   1a2ed:	45 31 db             	xor    %r11d,%r11d
   1a2f0:	f6 c1 40             	test   $0x40,%cl
   1a2f3:	4c 0f 44 d8          	cmove  %rax,%r11
   1a2f7:	eb 68                	jmp    1a361 <<hyperinterval::ieee::Format>::div+0x321>
   1a2f9:	45 31 d2             	xor    %r10d,%r10d
   1a2fc:	45 31 c9             	xor    %r9d,%r9d
   1a2ff:	45 31 db             	xor    %r11d,%r11d
   1a302:	eb 5d                	jmp    1a361 <<hyperinterval::ieee::Format>::div+0x321>
   1a304:	44 89 f1             	mov    %r14d,%ecx
   1a307:	44 29 d9             	sub    %r11d,%ecx
   1a30a:	4d 89 d4             	mov    %r10,%r12
   1a30d:	49 d3 e4             	shl    %cl,%r12
   1a310:	89 c8                	mov    %ecx,%eax
   1a312:	f7 d8                	neg    %eax
   1a314:	45 31 ed             	xor    %r13d,%r13d
   1a317:	f6 c1 40             	test   $0x40,%cl
   1a31a:	4d 0f 44 ec          	cmove  %r12,%r13
   1a31e:	4d 89 d4             	mov    %r10,%r12
   1a321:	89 c1                	mov    %eax,%ecx
   1a323:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   1a327:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   1a32b:	4c 89 cb             	mov    %r9,%rbx
   1a32e:	48 d3 eb             	shr    %cl,%rbx
   1a331:	a8 40                	test   $0x40,%al
   1a333:	49 0f 44 dc          	cmove  %r12,%rbx
   1a337:	45 39 de             	cmp    %r11d,%r14d
   1a33a:	49 0f 43 dd          	cmovae %r13,%rbx
   1a33e:	01 d5                	add    %edx,%ebp
   1a340:	48 63 c5             	movslq %ebp,%rax
   1a343:	44 89 f1             	mov    %r14d,%ecx
   1a346:	48 d3 e0             	shl    %cl,%rax
   1a349:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1a350:	49 d3 e3             	shl    %cl,%r11
   1a353:	49 f7 d3             	not    %r11
   1a356:	49 21 db             	and    %rbx,%r11
   1a359:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   1a35e:	49 09 c3             	or     %rax,%r11
   1a361:	0f b6 db             	movzbl %bl,%ebx
   1a364:	4c 01 d3             	add    %r10,%rbx
   1a367:	49 83 d1 00          	adc    $0x0,%r9
   1a36b:	48 89 d8             	mov    %rbx,%rax
   1a36e:	4c 09 c8             	or     %r9,%rax
   1a371:	74 30                	je     1a3a3 <<hyperinterval::ieee::Format>::div+0x363>
   1a373:	49 0f bd c1          	bsr    %r9,%rax
   1a377:	83 f0 3f             	xor    $0x3f,%eax
   1a37a:	4c 0f bd d3          	bsr    %rbx,%r10
   1a37e:	41 83 f2 3f          	xor    $0x3f,%r10d
   1a382:	41 83 ca 40          	or     $0x40,%r10d
   1a386:	4d 85 c9             	test   %r9,%r9
   1a389:	44 0f 45 d0          	cmovne %eax,%r10d
   1a38d:	41 83 f2 7f          	xor    $0x7f,%r10d
   1a391:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   1a395:	39 d5                	cmp    %edx,%ebp
   1a397:	7e 0e                	jle    1a3a7 <<hyperinterval::ieee::Format>::div+0x367>
   1a399:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1a39e:	e9 af 00 00 00       	jmp    1a452 <<hyperinterval::ieee::Format>::div+0x412>
   1a3a3:	31 c0                	xor    %eax,%eax
   1a3a5:	eb 71                	jmp    1a418 <<hyperinterval::ieee::Format>::div+0x3d8>
   1a3a7:	b8 01 00 00 00       	mov    $0x1,%eax
   1a3ac:	29 d0                	sub    %edx,%eax
   1a3ae:	39 c5                	cmp    %eax,%ebp
   1a3b0:	7d 18                	jge    1a3ca <<hyperinterval::ieee::Format>::div+0x38a>
   1a3b2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1a3b7:	44 01 f9             	add    %r15d,%ecx
   1a3ba:	fe c9                	dec    %cl
   1a3bc:	48 d3 e3             	shl    %cl,%rbx
   1a3bf:	31 c0                	xor    %eax,%eax
   1a3c1:	f6 c1 40             	test   $0x40,%cl
   1a3c4:	48 0f 44 c3          	cmove  %rbx,%rax
   1a3c8:	eb 4e                	jmp    1a418 <<hyperinterval::ieee::Format>::div+0x3d8>
   1a3ca:	44 89 f1             	mov    %r14d,%ecx
   1a3cd:	44 29 d1             	sub    %r10d,%ecx
   1a3d0:	89 c8                	mov    %ecx,%eax
   1a3d2:	f7 d8                	neg    %eax
   1a3d4:	49 89 df             	mov    %rbx,%r15
   1a3d7:	49 d3 e7             	shl    %cl,%r15
   1a3da:	45 31 e4             	xor    %r12d,%r12d
   1a3dd:	f6 c1 40             	test   $0x40,%cl
   1a3e0:	4d 0f 44 e7          	cmove  %r15,%r12
   1a3e4:	89 c1                	mov    %eax,%ecx
   1a3e6:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1a3ea:	49 d3 e9             	shr    %cl,%r9
   1a3ed:	a8 40                	test   $0x40,%al
   1a3ef:	4c 0f 44 cb          	cmove  %rbx,%r9
   1a3f3:	45 39 d6             	cmp    %r10d,%r14d
   1a3f6:	4d 0f 43 cc          	cmovae %r12,%r9
   1a3fa:	01 d5                	add    %edx,%ebp
   1a3fc:	48 63 d5             	movslq %ebp,%rdx
   1a3ff:	44 89 f1             	mov    %r14d,%ecx
   1a402:	48 d3 e2             	shl    %cl,%rdx
   1a405:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1a40c:	48 d3 e0             	shl    %cl,%rax
   1a40f:	48 f7 d0             	not    %rax
   1a412:	4c 21 c8             	and    %r9,%rax
   1a415:	48 09 d0             	or     %rdx,%rax
   1a418:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   1a41d:	0f 95 c1             	setne  %cl
   1a420:	49 85 f0             	test   %rsi,%r8
   1a423:	0f 94 c2             	sete   %dl
   1a426:	30 ca                	xor    %cl,%dl
   1a428:	75 1d                	jne    1a447 <<hyperinterval::ieee::Format>::div+0x407>
   1a42a:	48 89 c1             	mov    %rax,%rcx
   1a42d:	48 31 f1             	xor    %rsi,%rcx
   1a430:	48 85 c0             	test   %rax,%rax
   1a433:	48 0f 44 c8          	cmove  %rax,%rcx
   1a437:	4c 31 de             	xor    %r11,%rsi
   1a43a:	4d 85 db             	test   %r11,%r11
   1a43d:	49 0f 44 f3          	cmove  %r11,%rsi
   1a441:	48 89 f0             	mov    %rsi,%rax
   1a444:	49 89 cb             	mov    %rcx,%r11
   1a447:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   1a44b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a44f:	c6 07 00             	movb   $0x0,(%rdi)
   1a452:	48 83 c4 38          	add    $0x38,%rsp
   1a456:	5b                   	pop    %rbx
   1a457:	41 5c                	pop    %r12
   1a459:	41 5d                	pop    %r13
   1a45b:	41 5e                	pop    %r14
   1a45d:	41 5f                	pop    %r15
   1a45f:	5d                   	pop    %rbp
   1a460:	c3                   	ret
   1a461:	48 8d 3d 48 61 03 00 	lea    0x36148(%rip),%rdi        # 505b0 <__frame_dummy_init_array_entry+0x480>
   1a468:	e8 93 cc ff ff       	call   17100 <core::panicking::panic_const::panic_const_div_by_zero>
   1a46d:	48 8d 3d 24 61 03 00 	lea    0x36124(%rip),%rdi        # 50598 <__frame_dummy_init_array_entry+0x468>
   1a474:	e8 87 cc ff ff       	call   17100 <core::panicking::panic_const::panic_const_div_by_zero>
   1a479:	cc                   	int3
   1a47a:	cc                   	int3
   1a47b:	cc                   	int3
   1a47c:	cc                   	int3
   1a47d:	cc                   	int3
   1a47e:	cc                   	int3
   1a47f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   1a480:	55                   	push   %rbp
   1a481:	41 57                	push   %r15
   1a483:	41 56                	push   %r14
   1a485:	41 55                	push   %r13
   1a487:	41 54                	push   %r12
   1a489:	53                   	push   %rbx
   1a48a:	48 83 ec 78          	sub    $0x78,%rsp
   1a48e:	48 89 fb             	mov    %rdi,%rbx
   1a491:	f6 06 01             	testb  $0x1,(%rsi)
   1a494:	0f 84 e9 00 00 00    	je     1a583 <<hyperinterval::float::F32Enclosure>::square+0x103>
   1a49a:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   1a49e:	8b 6e 08             	mov    0x8(%rsi),%ebp
   1a4a1:	44 89 f0             	mov    %r14d,%eax
   1a4a4:	c1 e8 17             	shr    $0x17,%eax
   1a4a7:	0f b6 c0             	movzbl %al,%eax
   1a4aa:	44 89 f1             	mov    %r14d,%ecx
   1a4ad:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1a4b3:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1a4ba:	85 c0                	test   %eax,%eax
   1a4bc:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   1a4c3:	48 0f 44 d1          	cmove  %rcx,%rdx
   1a4c7:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   1a4cd:	41 0f 44 c7          	cmove  %r15d,%eax
   1a4d1:	48 0f af d2          	imul   %rdx,%rdx
   1a4d5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a4da:	48 89 14 24          	mov    %rdx,(%rsp)
   1a4de:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1a4e5:	00 00 
   1a4e7:	89 44 24 10          	mov    %eax,0x10(%rsp)
   1a4eb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1a4f0:	48 89 e1             	mov    %rsp,%rcx
   1a4f3:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a4f8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a4fd:	e8 4e f8 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1a502:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   1a507:	75 6a                	jne    1a573 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   1a509:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   1a50e:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   1a513:	89 e8                	mov    %ebp,%eax
   1a515:	c1 e8 17             	shr    $0x17,%eax
   1a518:	0f b6 c0             	movzbl %al,%eax
   1a51b:	89 e9                	mov    %ebp,%ecx
   1a51d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1a523:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   1a52a:	85 c0                	test   %eax,%eax
   1a52c:	48 0f 44 d1          	cmove  %rcx,%rdx
   1a530:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   1a537:	41 0f 44 c7          	cmove  %r15d,%eax
   1a53b:	48 0f af d2          	imul   %rdx,%rdx
   1a53f:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1a544:	48 89 14 24          	mov    %rdx,(%rsp)
   1a548:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1a54f:	00 00 
   1a551:	89 44 24 10          	mov    %eax,0x10(%rsp)
   1a555:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1a55a:	48 89 e1             	mov    %rsp,%rcx
   1a55d:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a562:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a567:	e8 e4 f7 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1a56c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1a571:	75 25                	jne    1a598 <<hyperinterval::float::F32Enclosure>::square+0x118>
   1a573:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1a578:	88 43 04             	mov    %al,0x4(%rbx)
   1a57b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a581:	eb 06                	jmp    1a589 <<hyperinterval::float::F32Enclosure>::square+0x109>
   1a583:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   1a589:	48 83 c4 78          	add    $0x78,%rsp
   1a58d:	5b                   	pop    %rbx
   1a58e:	41 5c                	pop    %r12
   1a590:	41 5d                	pop    %r13
   1a592:	41 5e                	pop    %r14
   1a594:	41 5f                	pop    %r15
   1a596:	5d                   	pop    %rbp
   1a597:	c3                   	ret
   1a598:	8b 44 24 40          	mov    0x40(%rsp),%eax
   1a59c:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1a5a1:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   1a5a6:	48 89 e7             	mov    %rsp,%rdi
   1a5a9:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a5ae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a5b3:	4c 89 e9             	mov    %r13,%rcx
   1a5b6:	e8 15 f3 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1a5bb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a5bf:	74 25                	je     1a5e6 <<hyperinterval::float::F32Enclosure>::square+0x166>
   1a5c1:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   1a5c6:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1a5cb:	48 89 e7             	mov    %rsp,%rdi
   1a5ce:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a5d3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a5d8:	4c 89 e1             	mov    %r12,%rcx
   1a5db:	e8 f0 f2 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1a5e0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a5e4:	75 07                	jne    1a5ed <<hyperinterval::float::F32Enclosure>::square+0x16d>
   1a5e6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a5eb:	eb 8b                	jmp    1a578 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   1a5ed:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   1a5f2:	45 89 fd             	mov    %r15d,%r13d
   1a5f5:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   1a5fc:	41 89 d4             	mov    %edx,%r12d
   1a5ff:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   1a606:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a60b:	4c 29 e8             	sub    %r13,%rax
   1a60e:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a613:	49 09 cd             	or     %rcx,%r13
   1a616:	45 85 ff             	test   %r15d,%r15d
   1a619:	4c 0f 48 e8          	cmovs  %rax,%r13
   1a61d:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a622:	4c 29 e0             	sub    %r12,%rax
   1a625:	49 09 cc             	or     %rcx,%r12
   1a628:	85 d2                	test   %edx,%edx
   1a62a:	4c 0f 48 e0          	cmovs  %rax,%r12
   1a62e:	b0 01                	mov    $0x1,%al
   1a630:	4d 39 e5             	cmp    %r12,%r13
   1a633:	0f 87 3f ff ff ff    	ja     1a578 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   1a639:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1a63e:	48 89 e7             	mov    %rsp,%rdi
   1a641:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a646:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a64b:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   1a650:	e8 7b f2 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1a655:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a659:	74 27                	je     1a682 <<hyperinterval::float::F32Enclosure>::square+0x202>
   1a65b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a660:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1a665:	48 89 e7             	mov    %rsp,%rdi
   1a668:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a66d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a672:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1a677:	e8 54 f2 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1a67c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a680:	75 13                	jne    1a695 <<hyperinterval::float::F32Enclosure>::square+0x215>
   1a682:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1a687:	88 53 04             	mov    %dl,0x4(%rbx)
   1a68a:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a690:	e9 f4 fe ff ff       	jmp    1a589 <<hyperinterval::float::F32Enclosure>::square+0x109>
   1a695:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1a69a:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   1a69f:	44 89 c1             	mov    %r8d,%ecx
   1a6a2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a6a8:	89 c2                	mov    %eax,%edx
   1a6aa:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a6b0:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a6b5:	48 29 ce             	sub    %rcx,%rsi
   1a6b8:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1a6bd:	48 09 f9             	or     %rdi,%rcx
   1a6c0:	45 85 c0             	test   %r8d,%r8d
   1a6c3:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1a6c7:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   1a6cb:	48 29 d7             	sub    %rdx,%rdi
   1a6ce:	85 c0                	test   %eax,%eax
   1a6d0:	48 0f 49 fe          	cmovns %rsi,%rdi
   1a6d4:	b2 01                	mov    $0x1,%dl
   1a6d6:	48 39 f9             	cmp    %rdi,%rcx
   1a6d9:	77 ac                	ja     1a687 <<hyperinterval::float::F32Enclosure>::square+0x207>
   1a6db:	41 39 cd             	cmp    %ecx,%r13d
   1a6de:	45 0f 47 f8          	cmova  %r8d,%r15d
   1a6e2:	41 39 fc             	cmp    %edi,%r12d
   1a6e5:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   1a6ea:	0f 42 c8             	cmovb  %eax,%ecx
   1a6ed:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   1a6f4:	00 
   1a6f5:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   1a6fa:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   1a6fe:	45 85 f6             	test   %r14d,%r14d
   1a701:	7f 6d                	jg     1a770 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   1a703:	85 ed                	test   %ebp,%ebp
   1a705:	0f 98 c0             	sets   %al
   1a708:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   1a70e:	0f 95 c1             	setne  %cl
   1a711:	84 c8                	test   %cl,%al
   1a713:	75 5b                	jne    1a770 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   1a715:	48 89 e7             	mov    %rsp,%rdi
   1a718:	31 f6                	xor    %esi,%esi
   1a71a:	31 d2                	xor    %edx,%edx
   1a71c:	e8 cf 05 00 00       	call   1acf0 <<hyperinterval::float::F32Enclosure>::from_bits>
   1a721:	8b 0c 24             	mov    (%rsp),%ecx
   1a724:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   1a729:	83 f9 02             	cmp    $0x2,%ecx
   1a72c:	0f 84 46 fe ff ff    	je     1a578 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   1a732:	8b 54 24 05          	mov    0x5(%rsp),%edx
   1a736:	8b 74 24 08          	mov    0x8(%rsp),%esi
   1a73a:	89 74 24 40          	mov    %esi,0x40(%rsp)
   1a73e:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   1a742:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   1a746:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   1a74a:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   1a74f:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   1a754:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   1a759:	e8 42 04 00 00       	call   1aba0 <<hyperinterval::float::F32Enclosure>::hull>
   1a75e:	8b 44 24 74          	mov    0x74(%rsp),%eax
   1a762:	89 44 24 30          	mov    %eax,0x30(%rsp)
   1a766:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   1a76b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1a770:	8b 44 24 30          	mov    0x30(%rsp),%eax
   1a774:	89 43 08             	mov    %eax,0x8(%rbx)
   1a777:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a77c:	48 89 03             	mov    %rax,(%rbx)
   1a77f:	e9 05 fe ff ff       	jmp    1a589 <<hyperinterval::float::F32Enclosure>::square+0x109>
   1a784:	cc                   	int3
   1a785:	cc                   	int3
   1a786:	cc                   	int3
   1a787:	cc                   	int3
   1a788:	cc                   	int3
   1a789:	cc                   	int3
   1a78a:	cc                   	int3
   1a78b:	cc                   	int3
   1a78c:	cc                   	int3
   1a78d:	cc                   	int3
   1a78e:	cc                   	int3
   1a78f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   1a790:	55                   	push   %rbp
   1a791:	41 57                	push   %r15
   1a793:	41 56                	push   %r14
   1a795:	41 55                	push   %r13
   1a797:	41 54                	push   %r12
   1a799:	53                   	push   %rbx
   1a79a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1a7a1:	49 89 ca             	mov    %rcx,%r10
   1a7a4:	49 89 d6             	mov    %rdx,%r14
   1a7a7:	48 85 f1             	test   %rsi,%rcx
   1a7aa:	0f 95 c0             	setne  %al
   1a7ad:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a7b2:	49 89 d3             	mov    %rdx,%r11
   1a7b5:	44 89 c9             	mov    %r9d,%ecx
   1a7b8:	49 d3 eb             	shr    %cl,%r11
   1a7bb:	49 d1 eb             	shr    $1,%r11
   1a7be:	49 63 d3             	movslq %r11d,%rdx
   1a7c1:	48 d3 e2             	shl    %cl,%rdx
   1a7c4:	45 85 c0             	test   %r8d,%r8d
   1a7c7:	0f 84 65 03 00 00    	je     1ab32 <<hyperinterval::ieee::Format>::power+0x3a2>
   1a7cd:	88 44 24 07          	mov    %al,0x7(%rsp)
   1a7d1:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   1a7d6:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   1a7da:	49 21 c2             	and    %rax,%r10
   1a7dd:	bb 01 00 00 00       	mov    $0x1,%ebx
   1a7e2:	44 89 c9             	mov    %r9d,%ecx
   1a7e5:	48 d3 e3             	shl    %cl,%rbx
   1a7e8:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   1a7ec:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1a7f1:	45 01 cb             	add    %r9d,%r11d
   1a7f4:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a7fa:	45 29 df             	sub    %r11d,%r15d
   1a7fd:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a802:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   1a807:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   1a80c:	44 89 c5             	mov    %r8d,%ebp
   1a80f:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   1a814:	4d 89 d5             	mov    %r10,%r13
   1a817:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1a81c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1a821:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   1a828:	00 
   1a829:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   1a82e:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   1a833:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   1a83a:	00 
   1a83b:	40 f6 c5 01          	test   $0x1,%bpl
   1a83f:	75 2f                	jne    1a870 <<hyperinterval::ieee::Format>::power+0xe0>
   1a841:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a848:	0f 1f 84 00 00 00 00 
   1a84f:	00 
   1a850:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a855:	d1 ed                	shr    $1,%ebp
   1a857:	0f 85 b6 01 00 00    	jne    1aa13 <<hyperinterval::ieee::Format>::power+0x283>
   1a85d:	e9 13 03 00 00       	jmp    1ab75 <<hyperinterval::ieee::Format>::power+0x3e5>
   1a862:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a869:	1f 84 00 00 00 00 00 
   1a870:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a874:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a879:	4c 89 c2             	mov    %r8,%rdx
   1a87c:	4c 21 f2             	and    %r14,%rdx
   1a87f:	44 89 c9             	mov    %r9d,%ecx
   1a882:	48 d3 ea             	shr    %cl,%rdx
   1a885:	4c 89 c0             	mov    %r8,%rax
   1a888:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a88d:	48 21 e8             	and    %rbp,%rax
   1a890:	41 89 d2             	mov    %edx,%r10d
   1a893:	45 29 da             	sub    %r11d,%r10d
   1a896:	48 85 d2             	test   %rdx,%rdx
   1a899:	45 0f 44 d7          	cmove  %r15d,%r10d
   1a89d:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a8a1:	48 09 c2             	or     %rax,%rdx
   1a8a4:	4c 89 e8             	mov    %r13,%rax
   1a8a7:	4c 21 f0             	and    %r14,%rax
   1a8aa:	48 d3 e8             	shr    %cl,%rax
   1a8ad:	4c 89 e9             	mov    %r13,%rcx
   1a8b0:	48 21 e9             	and    %rbp,%rcx
   1a8b3:	89 c5                	mov    %eax,%ebp
   1a8b5:	44 29 dd             	sub    %r11d,%ebp
   1a8b8:	48 85 c0             	test   %rax,%rax
   1a8bb:	41 0f 44 ef          	cmove  %r15d,%ebp
   1a8bf:	48 0f 45 c3          	cmovne %rbx,%rax
   1a8c3:	48 09 c8             	or     %rcx,%rax
   1a8c6:	49 85 f0             	test   %rsi,%r8
   1a8c9:	0f 95 c1             	setne  %cl
   1a8cc:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   1a8d3:	00 
   1a8d4:	49 85 f5             	test   %rsi,%r13
   1a8d7:	41 0f 95 c0          	setne  %r8b
   1a8db:	48 f7 e2             	mul    %rdx
   1a8de:	41 30 c8             	xor    %cl,%r8b
   1a8e1:	44 01 d5             	add    %r10d,%ebp
   1a8e4:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a8e9:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a8ee:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a8f3:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   1a8f7:	4c 89 f2             	mov    %r14,%rdx
   1a8fa:	4c 89 e1             	mov    %r12,%rcx
   1a8fd:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a902:	4d 89 dd             	mov    %r11,%r13
   1a905:	4d 89 cc             	mov    %r9,%r12
   1a908:	e8 43 f4 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1a90d:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a912:	0f 85 09 02 00 00    	jne    1ab21 <<hyperinterval::ieee::Format>::power+0x391>
   1a918:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   1a91d:	4c 89 c2             	mov    %r8,%rdx
   1a920:	4c 21 f2             	and    %r14,%rdx
   1a923:	4d 89 f2             	mov    %r14,%r10
   1a926:	44 89 e1             	mov    %r12d,%ecx
   1a929:	48 d3 ea             	shr    %cl,%rdx
   1a92c:	4c 89 c7             	mov    %r8,%rdi
   1a92f:	48 21 ef             	and    %rbp,%rdi
   1a932:	89 d6                	mov    %edx,%esi
   1a934:	4d 89 ee             	mov    %r13,%r14
   1a937:	44 29 f6             	sub    %r14d,%esi
   1a93a:	48 85 d2             	test   %rdx,%rdx
   1a93d:	41 0f 44 f7          	cmove  %r15d,%esi
   1a941:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a945:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
   1a94a:	4c 89 c8             	mov    %r9,%rax
   1a94d:	4c 21 d0             	and    %r10,%rax
   1a950:	4d 89 d5             	mov    %r10,%r13
   1a953:	48 d3 e8             	shr    %cl,%rax
   1a956:	48 09 fa             	or     %rdi,%rdx
   1a959:	4c 89 c9             	mov    %r9,%rcx
   1a95c:	48 21 e9             	and    %rbp,%rcx
   1a95f:	89 c7                	mov    %eax,%edi
   1a961:	44 29 f7             	sub    %r14d,%edi
   1a964:	48 85 c0             	test   %rax,%rax
   1a967:	41 0f 44 ff          	cmove  %r15d,%edi
   1a96b:	48 0f 45 c3          	cmovne %rbx,%rax
   1a96f:	48 09 c8             	or     %rcx,%rax
   1a972:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   1a979:	00 
   1a97a:	4d 85 f8             	test   %r15,%r8
   1a97d:	0f 95 c1             	setne  %cl
   1a980:	4d 85 f9             	test   %r15,%r9
   1a983:	41 0f 95 c0          	setne  %r8b
   1a987:	41 30 c8             	xor    %cl,%r8b
   1a98a:	48 f7 e2             	mul    %rdx
   1a98d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   1a992:	01 f7                	add    %esi,%edi
   1a994:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a999:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a99e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a9a3:	89 7c 24 40          	mov    %edi,0x40(%rsp)
   1a9a7:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a9ac:	48 89 fd             	mov    %rdi,%rbp
   1a9af:	4c 89 fe             	mov    %r15,%rsi
   1a9b2:	4c 89 d2             	mov    %r10,%rdx
   1a9b5:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   1a9ba:	49 89 cc             	mov    %rcx,%r12
   1a9bd:	e8 8e f3 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1a9c2:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a9c7:	0f 84 54 01 00 00    	je     1ab21 <<hyperinterval::ieee::Format>::power+0x391>
   1a9cd:	4c 89 fe             	mov    %r15,%rsi
   1a9d0:	4d 89 f3             	mov    %r14,%r11
   1a9d3:	4d 89 ee             	mov    %r13,%r14
   1a9d6:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   1a9db:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a9e0:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a9e5:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a9ec:	00 
   1a9ed:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a9f2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a9f7:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a9fc:	48 89 ef             	mov    %rbp,%rdi
   1a9ff:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1aa03:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   1aa0a:	00 
   1aa0b:	d1 ed                	shr    $1,%ebp
   1aa0d:	0f 84 62 01 00 00    	je     1ab75 <<hyperinterval::ieee::Format>::power+0x3e5>
   1aa13:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1aa17:	4c 89 e8             	mov    %r13,%rax
   1aa1a:	4c 21 f0             	and    %r14,%rax
   1aa1d:	44 89 c9             	mov    %r9d,%ecx
   1aa20:	48 d3 e8             	shr    %cl,%rax
   1aa23:	49 21 d5             	and    %rdx,%r13
   1aa26:	89 c1                	mov    %eax,%ecx
   1aa28:	44 29 d9             	sub    %r11d,%ecx
   1aa2b:	48 85 c0             	test   %rax,%rax
   1aa2e:	48 0f 45 c3          	cmovne %rbx,%rax
   1aa32:	41 0f 44 cf          	cmove  %r15d,%ecx
   1aa36:	4c 09 e8             	or     %r13,%rax
   1aa39:	48 89 d5             	mov    %rdx,%rbp
   1aa3c:	48 f7 e0             	mul    %rax
   1aa3f:	01 c9                	add    %ecx,%ecx
   1aa41:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1aa46:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1aa4b:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1aa50:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1aa54:	4c 89 f2             	mov    %r14,%rdx
   1aa57:	4c 89 e1             	mov    %r12,%rcx
   1aa5a:	49 89 dd             	mov    %rbx,%r13
   1aa5d:	4c 89 db             	mov    %r11,%rbx
   1aa60:	4d 89 f4             	mov    %r14,%r12
   1aa63:	4d 89 ce             	mov    %r9,%r14
   1aa66:	e8 e5 f2 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1aa6b:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1aa70:	0f 85 ab 00 00 00    	jne    1ab21 <<hyperinterval::ieee::Format>::power+0x391>
   1aa76:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   1aa7b:	48 89 d0             	mov    %rdx,%rax
   1aa7e:	4c 21 e0             	and    %r12,%rax
   1aa81:	44 89 f1             	mov    %r14d,%ecx
   1aa84:	48 d3 e8             	shr    %cl,%rax
   1aa87:	48 21 ea             	and    %rbp,%rdx
   1aa8a:	89 c1                	mov    %eax,%ecx
   1aa8c:	29 d9                	sub    %ebx,%ecx
   1aa8e:	48 85 c0             	test   %rax,%rax
   1aa91:	49 0f 45 c5          	cmovne %r13,%rax
   1aa95:	41 0f 44 cf          	cmove  %r15d,%ecx
   1aa99:	48 09 d0             	or     %rdx,%rax
   1aa9c:	48 f7 e0             	mul    %rax
   1aa9f:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1aaa4:	01 c9                	add    %ecx,%ecx
   1aaa6:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1aaab:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1aab0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1aab5:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1aab9:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1aabe:	48 89 ef             	mov    %rbp,%rdi
   1aac1:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1aac8:	00 
   1aac9:	4c 89 f6             	mov    %r14,%rsi
   1aacc:	4c 89 e2             	mov    %r12,%rdx
   1aacf:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1aad4:	4c 89 f9             	mov    %r15,%rcx
   1aad7:	e8 74 f2 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1aadc:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1aae1:	74 3e                	je     1ab21 <<hyperinterval::ieee::Format>::power+0x391>
   1aae3:	4c 89 f6             	mov    %r14,%rsi
   1aae6:	49 89 db             	mov    %rbx,%r11
   1aae9:	4d 89 e6             	mov    %r12,%r14
   1aaec:	48 89 ef             	mov    %rbp,%rdi
   1aaef:	4d 89 fc             	mov    %r15,%r12
   1aaf2:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1aaf7:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1aafc:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1ab03:	00 
   1ab04:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1ab09:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1ab0e:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1ab12:	40 f6 c5 01          	test   $0x1,%bpl
   1ab16:	0f 85 54 fd ff ff    	jne    1a870 <<hyperinterval::ieee::Format>::power+0xe0>
   1ab1c:	e9 2f fd ff ff       	jmp    1a850 <<hyperinterval::ieee::Format>::power+0xc0>
   1ab21:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1ab26:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1ab2b:	88 47 01             	mov    %al,0x1(%rdi)
   1ab2e:	b0 01                	mov    $0x1,%al
   1ab30:	eb 2f                	jmp    1ab61 <<hyperinterval::ieee::Format>::power+0x3d1>
   1ab32:	48 89 d1             	mov    %rdx,%rcx
   1ab35:	44 20 c0             	and    %r8b,%al
   1ab38:	74 1d                	je     1ab57 <<hyperinterval::ieee::Format>::power+0x3c7>
   1ab3a:	48 89 d0             	mov    %rdx,%rax
   1ab3d:	48 31 f0             	xor    %rsi,%rax
   1ab40:	48 85 d2             	test   %rdx,%rdx
   1ab43:	48 0f 44 c2          	cmove  %rdx,%rax
   1ab47:	48 31 ce             	xor    %rcx,%rsi
   1ab4a:	48 85 c9             	test   %rcx,%rcx
   1ab4d:	48 0f 44 f1          	cmove  %rcx,%rsi
   1ab51:	48 89 c1             	mov    %rax,%rcx
   1ab54:	48 89 f2             	mov    %rsi,%rdx
   1ab57:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1ab5b:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1ab5f:	31 c0                	xor    %eax,%eax
   1ab61:	88 07                	mov    %al,(%rdi)
   1ab63:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1ab6a:	5b                   	pop    %rbx
   1ab6b:	41 5c                	pop    %r12
   1ab6d:	41 5d                	pop    %r13
   1ab6f:	41 5e                	pop    %r14
   1ab71:	41 5f                	pop    %r15
   1ab73:	5d                   	pop    %rbp
   1ab74:	c3                   	ret
   1ab75:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1ab7a:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1ab7f:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1ab84:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1ab89:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1ab8e:	44 20 c0             	and    %r8b,%al
   1ab91:	75 a7                	jne    1ab3a <<hyperinterval::ieee::Format>::power+0x3aa>
   1ab93:	eb c2                	jmp    1ab57 <<hyperinterval::ieee::Format>::power+0x3c7>
   1ab95:	cc                   	int3
   1ab96:	cc                   	int3
   1ab97:	cc                   	int3
   1ab98:	cc                   	int3
   1ab99:	cc                   	int3
   1ab9a:	cc                   	int3
   1ab9b:	cc                   	int3
   1ab9c:	cc                   	int3
   1ab9d:	cc                   	int3
   1ab9e:	cc                   	int3
   1ab9f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   1aba0:	44 8b 16             	mov    (%rsi),%r10d
   1aba3:	44 8b 0a             	mov    (%rdx),%r9d
   1aba6:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1abaa:	8b 42 08             	mov    0x8(%rdx),%eax
   1abad:	41 f6 c2 01          	test   $0x1,%r10b
   1abb1:	0f 84 9d 00 00 00    	je     1ac54 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   1abb7:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1abba:	8b 56 08             	mov    0x8(%rsi),%edx
   1abbd:	41 f6 c1 01          	test   $0x1,%r9b
   1abc1:	0f 84 98 00 00 00    	je     1ac5f <<hyperinterval::float::F32Enclosure>::hull+0xbf>
   1abc7:	53                   	push   %rbx
   1abc8:	be 00 00 00 80       	mov    $0x80000000,%esi
   1abcd:	44 8d 0c 31          	lea    (%rcx,%rsi,1),%r9d
   1abd1:	41 89 ca             	mov    %ecx,%r10d
   1abd4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1abdb:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1abe1:	45 29 d3             	sub    %r10d,%r11d
   1abe4:	85 c9                	test   %ecx,%ecx
   1abe6:	4d 0f 49 d9          	cmovns %r9,%r11
   1abea:	45 8d 0c 30          	lea    (%r8,%rsi,1),%r9d
   1abee:	45 89 c2             	mov    %r8d,%r10d
   1abf1:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1abf8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1abfd:	44 29 d3             	sub    %r10d,%ebx
   1ac00:	45 85 c0             	test   %r8d,%r8d
   1ac03:	49 0f 49 d9          	cmovns %r9,%rbx
   1ac07:	41 39 db             	cmp    %ebx,%r11d
   1ac0a:	41 0f 47 c8          	cmova  %r8d,%ecx
   1ac0e:	44 8d 04 32          	lea    (%rdx,%rsi,1),%r8d
   1ac12:	41 89 d1             	mov    %edx,%r9d
   1ac15:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1ac1c:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1ac22:	45 29 ca             	sub    %r9d,%r10d
   1ac25:	85 d2                	test   %edx,%edx
   1ac27:	4d 0f 49 d0          	cmovns %r8,%r10
   1ac2b:	44 8d 04 30          	lea    (%rax,%rsi,1),%r8d
   1ac2f:	41 89 c1             	mov    %eax,%r9d
   1ac32:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1ac39:	44 29 ce             	sub    %r9d,%esi
   1ac3c:	85 c0                	test   %eax,%eax
   1ac3e:	49 0f 49 f0          	cmovns %r8,%rsi
   1ac42:	41 39 f2             	cmp    %esi,%r10d
   1ac45:	0f 42 d0             	cmovb  %eax,%edx
   1ac48:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1ac4e:	89 d0                	mov    %edx,%eax
   1ac50:	41 89 c8             	mov    %ecx,%r8d
   1ac53:	5b                   	pop    %rbx
   1ac54:	44 89 0f             	mov    %r9d,(%rdi)
   1ac57:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1ac5b:	89 47 08             	mov    %eax,0x8(%rdi)
   1ac5e:	c3                   	ret
   1ac5f:	89 d0                	mov    %edx,%eax
   1ac61:	41 89 c8             	mov    %ecx,%r8d
   1ac64:	45 89 d1             	mov    %r10d,%r9d
   1ac67:	44 89 0f             	mov    %r9d,(%rdi)
   1ac6a:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1ac6e:	89 47 08             	mov    %eax,0x8(%rdi)
   1ac71:	c3                   	ret
   1ac72:	cc                   	int3
   1ac73:	cc                   	int3
   1ac74:	cc                   	int3
   1ac75:	cc                   	int3
   1ac76:	cc                   	int3
   1ac77:	cc                   	int3
   1ac78:	cc                   	int3
   1ac79:	cc                   	int3
   1ac7a:	cc                   	int3
   1ac7b:	cc                   	int3
   1ac7c:	cc                   	int3
   1ac7d:	cc                   	int3
   1ac7e:	cc                   	int3
   1ac7f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   1ac80:	83 3f 01             	cmpl   $0x1,(%rdi)
   1ac83:	75 65                	jne    1acea <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   1ac85:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1ac8a:	8b 57 04             	mov    0x4(%rdi),%edx
   1ac8d:	8b 47 08             	mov    0x8(%rdi),%eax
   1ac90:	48 89 d6             	mov    %rdx,%rsi
   1ac93:	48 09 ce             	or     %rcx,%rsi
   1ac96:	41 89 d0             	mov    %edx,%r8d
   1ac99:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1aca0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1aca5:	4c 29 c7             	sub    %r8,%rdi
   1aca8:	85 d2                	test   %edx,%edx
   1acaa:	48 0f 49 fe          	cmovns %rsi,%rdi
   1acae:	31 f6                	xor    %esi,%esi
   1acb0:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   1acb6:	0f 94 c2             	sete   %dl
   1acb9:	48 39 cf             	cmp    %rcx,%rdi
   1acbc:	77 1d                	ja     1acdb <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   1acbe:	39 cf                	cmp    %ecx,%edi
   1acc0:	0f 92 c1             	setb   %cl
   1acc3:	80 c9 02             	or     $0x2,%cl
   1acc6:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1accb:	0f b6 c9             	movzbl %cl,%ecx
   1acce:	40 88 d6             	mov    %dl,%sil
   1acd1:	0f 44 f1             	cmove  %ecx,%esi
   1acd4:	85 c0                	test   %eax,%eax
   1acd6:	0f 49 f1             	cmovns %ecx,%esi
   1acd9:	89 f2                	mov    %esi,%edx
   1acdb:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1acde:	85 c0                	test   %eax,%eax
   1ace0:	0f b6 d2             	movzbl %dl,%edx
   1ace3:	0f b6 c1             	movzbl %cl,%eax
   1ace6:	0f 4e c2             	cmovle %edx,%eax
   1ace9:	c3                   	ret
   1acea:	31 c0                	xor    %eax,%eax
   1acec:	c3                   	ret
   1aced:	cc                   	int3
   1acee:	cc                   	int3
   1acef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1acf0:	41 57                	push   %r15
   1acf2:	41 56                	push   %r14
   1acf4:	41 54                	push   %r12
   1acf6:	53                   	push   %rbx
   1acf7:	48 83 ec 18          	sub    $0x18,%rsp
   1acfb:	49 89 d6             	mov    %rdx,%r14
   1acfe:	48 89 fb             	mov    %rdi,%rbx
   1ad01:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1ad07:	89 f1                	mov    %esi,%ecx
   1ad09:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ad0e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1ad13:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1ad18:	e8 b3 eb ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1ad1d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1ad22:	74 23                	je     1ad47 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   1ad24:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1ad29:	44 89 f1             	mov    %r14d,%ecx
   1ad2c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1ad31:	be 00 00 00 80       	mov    $0x80000000,%esi
   1ad36:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1ad3b:	e8 90 eb ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1ad40:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1ad45:	75 1a                	jne    1ad61 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   1ad47:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1ad4c:	88 43 04             	mov    %al,0x4(%rbx)
   1ad4f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1ad55:	48 83 c4 18          	add    $0x18,%rsp
   1ad59:	5b                   	pop    %rbx
   1ad5a:	41 5c                	pop    %r12
   1ad5c:	41 5e                	pop    %r14
   1ad5e:	41 5f                	pop    %r15
   1ad60:	c3                   	ret
   1ad61:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1ad65:	44 89 e1             	mov    %r12d,%ecx
   1ad68:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1ad6e:	89 c2                	mov    %eax,%edx
   1ad70:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1ad76:	be 00 00 00 80       	mov    $0x80000000,%esi
   1ad7b:	29 ce                	sub    %ecx,%esi
   1ad7d:	44 09 f9             	or     %r15d,%ecx
   1ad80:	45 85 e4             	test   %r12d,%r12d
   1ad83:	48 0f 49 f1          	cmovns %rcx,%rsi
   1ad87:	89 d1                	mov    %edx,%ecx
   1ad89:	44 09 f9             	or     %r15d,%ecx
   1ad8c:	41 29 d7             	sub    %edx,%r15d
   1ad8f:	85 c0                	test   %eax,%eax
   1ad91:	4c 0f 49 f9          	cmovns %rcx,%r15
   1ad95:	44 39 fe             	cmp    %r15d,%esi
   1ad98:	76 06                	jbe    1ada0 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   1ad9a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1ad9e:	eb af                	jmp    1ad4f <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   1ada0:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1ada6:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1adaa:	89 43 08             	mov    %eax,0x8(%rbx)
   1adad:	eb a6                	jmp    1ad55 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   1adaf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   1adb0:	45 31 c9             	xor    %r9d,%r9d
   1adb3:	f6 06 01             	testb  $0x1,(%rsi)
   1adb6:	0f 84 ed 00 00 00    	je     1aea9 <<hyperinterval::float::F32Enclosure>::intersection+0xf9>
   1adbc:	f6 02 01             	testb  $0x1,(%rdx)
   1adbf:	0f 84 d9 00 00 00    	je     1ae9e <<hyperinterval::float::F32Enclosure>::intersection+0xee>
   1adc5:	53                   	push   %rbx
   1adc6:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1adca:	8b 46 04             	mov    0x4(%rsi),%eax
   1adcd:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1add2:	41 89 c1             	mov    %eax,%r9d
   1add5:	41 09 c9             	or     %ecx,%r9d
   1add8:	41 89 c2             	mov    %eax,%r10d
   1addb:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1ade2:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1ade8:	45 29 d3             	sub    %r10d,%r11d
   1adeb:	85 c0                	test   %eax,%eax
   1aded:	4d 0f 49 d9          	cmovns %r9,%r11
   1adf1:	45 89 c1             	mov    %r8d,%r9d
   1adf4:	41 09 c9             	or     %ecx,%r9d
   1adf7:	45 89 c2             	mov    %r8d,%r10d
   1adfa:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1ae01:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1ae06:	44 29 d3             	sub    %r10d,%ebx
   1ae09:	45 85 c0             	test   %r8d,%r8d
   1ae0c:	49 0f 49 d9          	cmovns %r9,%rbx
   1ae10:	8b 52 08             	mov    0x8(%rdx),%edx
   1ae13:	41 39 db             	cmp    %ebx,%r11d
   1ae16:	41 0f 42 c0          	cmovb  %r8d,%eax
   1ae1a:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   1ae1e:	44 89 c6             	mov    %r8d,%esi
   1ae21:	09 ce                	or     %ecx,%esi
   1ae23:	45 89 c1             	mov    %r8d,%r9d
   1ae26:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1ae2d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1ae33:	45 29 ca             	sub    %r9d,%r10d
   1ae36:	45 85 c0             	test   %r8d,%r8d
   1ae39:	4c 0f 49 d6          	cmovns %rsi,%r10
   1ae3d:	89 d6                	mov    %edx,%esi
   1ae3f:	09 ce                	or     %ecx,%esi
   1ae41:	41 89 d1             	mov    %edx,%r9d
   1ae44:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1ae4b:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1ae51:	45 29 cb             	sub    %r9d,%r11d
   1ae54:	85 d2                	test   %edx,%edx
   1ae56:	4c 0f 49 de          	cmovns %rsi,%r11
   1ae5a:	45 39 da             	cmp    %r11d,%r10d
   1ae5d:	44 0f 47 c2          	cmova  %edx,%r8d
   1ae61:	89 c2                	mov    %eax,%edx
   1ae63:	09 ca                	or     %ecx,%edx
   1ae65:	89 c6                	mov    %eax,%esi
   1ae67:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1ae6d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1ae73:	41 29 f2             	sub    %esi,%r10d
   1ae76:	85 c0                	test   %eax,%eax
   1ae78:	4c 0f 49 d2          	cmovns %rdx,%r10
   1ae7c:	44 89 c2             	mov    %r8d,%edx
   1ae7f:	09 ca                	or     %ecx,%edx
   1ae81:	44 89 c6             	mov    %r8d,%esi
   1ae84:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1ae8a:	29 f1                	sub    %esi,%ecx
   1ae8c:	45 85 c0             	test   %r8d,%r8d
   1ae8f:	48 0f 49 ca          	cmovns %rdx,%rcx
   1ae93:	45 31 c9             	xor    %r9d,%r9d
   1ae96:	41 39 ca             	cmp    %ecx,%r10d
   1ae99:	41 0f 96 c1          	setbe  %r9b
   1ae9d:	5b                   	pop    %rbx
   1ae9e:	44 89 0f             	mov    %r9d,(%rdi)
   1aea1:	89 47 04             	mov    %eax,0x4(%rdi)
   1aea4:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1aea8:	c3                   	ret
   1aea9:	44 89 0f             	mov    %r9d,(%rdi)
   1aeac:	89 47 04             	mov    %eax,0x4(%rdi)
   1aeaf:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1aeb3:	c3                   	ret
   1aeb4:	cc                   	int3
   1aeb5:	cc                   	int3
   1aeb6:	cc                   	int3
   1aeb7:	cc                   	int3
   1aeb8:	cc                   	int3
   1aeb9:	cc                   	int3
   1aeba:	cc                   	int3
   1aebb:	cc                   	int3
   1aebc:	cc                   	int3
   1aebd:	cc                   	int3
   1aebe:	cc                   	int3
   1aebf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   1aec0:	41 56                	push   %r14
   1aec2:	53                   	push   %rbx
   1aec3:	48 83 ec 18          	sub    $0x18,%rsp
   1aec7:	48 89 fb             	mov    %rdi,%rbx
   1aeca:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   1aed0:	66 0f 7e c1          	movd   %xmm0,%ecx
   1aed4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1aed9:	be 00 00 00 80       	mov    $0x80000000,%esi
   1aede:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1aee3:	e8 e8 e9 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1aee8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1aeed:	3c 01                	cmp    $0x1,%al
   1aeef:	75 0d                	jne    1aefe <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   1aef1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1aef6:	48 83 c4 18          	add    $0x18,%rsp
   1aefa:	5b                   	pop    %rbx
   1aefb:	41 5e                	pop    %r14
   1aefd:	c3                   	ret
   1aefe:	f6 03 01             	testb  $0x1,(%rbx)
   1af01:	74 44                	je     1af47 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   1af03:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1af08:	8b 73 04             	mov    0x4(%rbx),%esi
   1af0b:	89 d1                	mov    %edx,%ecx
   1af0d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1af13:	89 f7                	mov    %esi,%edi
   1af15:	44 09 f7             	or     %r14d,%edi
   1af18:	41 89 f0             	mov    %esi,%r8d
   1af1b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1af22:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1af28:	45 29 c1             	sub    %r8d,%r9d
   1af2b:	85 f6                	test   %esi,%esi
   1af2d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1af31:	be 00 00 00 80       	mov    $0x80000000,%esi
   1af36:	48 29 ce             	sub    %rcx,%rsi
   1af39:	4c 09 f1             	or     %r14,%rcx
   1af3c:	85 d2                	test   %edx,%edx
   1af3e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1af42:	41 39 c9             	cmp    %ecx,%r9d
   1af45:	76 0a                	jbe    1af51 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   1af47:	31 d2                	xor    %edx,%edx
   1af49:	48 83 c4 18          	add    $0x18,%rsp
   1af4d:	5b                   	pop    %rbx
   1af4e:	41 5e                	pop    %r14
   1af50:	c3                   	ret
   1af51:	8b 53 08             	mov    0x8(%rbx),%edx
   1af54:	89 d6                	mov    %edx,%esi
   1af56:	44 09 f6             	or     %r14d,%esi
   1af59:	89 d7                	mov    %edx,%edi
   1af5b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1af61:	41 29 fe             	sub    %edi,%r14d
   1af64:	85 d2                	test   %edx,%edx
   1af66:	4c 0f 49 f6          	cmovns %rsi,%r14
   1af6a:	44 39 f1             	cmp    %r14d,%ecx
   1af6d:	0f 96 c2             	setbe  %dl
   1af70:	48 83 c4 18          	add    $0x18,%rsp
   1af74:	5b                   	pop    %rbx
   1af75:	41 5e                	pop    %r14
   1af77:	c3                   	ret
   1af78:	cc                   	int3
   1af79:	cc                   	int3
   1af7a:	cc                   	int3
   1af7b:	cc                   	int3
   1af7c:	cc                   	int3
   1af7d:	cc                   	int3
   1af7e:	cc                   	int3
   1af7f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   1af80:	b0 01                	mov    $0x1,%al
   1af82:	f6 07 01             	testb  $0x1,(%rdi)
   1af85:	0f 84 8e 00 00 00    	je     1b019 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1af8b:	f6 06 01             	testb  $0x1,(%rsi)
   1af8e:	0f 84 83 00 00 00    	je     1b017 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1af94:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1af97:	8b 56 04             	mov    0x4(%rsi),%edx
   1af9a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1af9f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1afa3:	41 89 d1             	mov    %edx,%r9d
   1afa6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1afad:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1afb3:	45 29 ca             	sub    %r9d,%r10d
   1afb6:	85 d2                	test   %edx,%edx
   1afb8:	4d 0f 49 d0          	cmovns %r8,%r10
   1afbc:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1afbf:	41 89 c8             	mov    %ecx,%r8d
   1afc2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1afc9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1afcf:	45 29 c1             	sub    %r8d,%r9d
   1afd2:	85 c9                	test   %ecx,%ecx
   1afd4:	4c 0f 49 ca          	cmovns %rdx,%r9
   1afd8:	45 39 ca             	cmp    %r9d,%r10d
   1afdb:	73 3a                	jae    1b017 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1afdd:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1afe0:	8b 56 08             	mov    0x8(%rsi),%edx
   1afe3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   1afe6:	89 cf                	mov    %ecx,%edi
   1afe8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1afee:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1aff4:	41 29 f8             	sub    %edi,%r8d
   1aff7:	85 c9                	test   %ecx,%ecx
   1aff9:	4c 0f 49 c6          	cmovns %rsi,%r8
   1affd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   1b000:	89 d6                	mov    %edx,%esi
   1b002:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1b008:	29 f0                	sub    %esi,%eax
   1b00a:	85 d2                	test   %edx,%edx
   1b00c:	48 0f 49 c1          	cmovns %rcx,%rax
   1b010:	41 39 c0             	cmp    %eax,%r8d
   1b013:	0f 92 c0             	setb   %al
   1b016:	c3                   	ret
   1b017:	31 c0                	xor    %eax,%eax
   1b019:	c3                   	ret
   1b01a:	cc                   	int3
   1b01b:	cc                   	int3
   1b01c:	cc                   	int3
   1b01d:	cc                   	int3
   1b01e:	cc                   	int3
   1b01f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::abs:
   1b020:	f6 06 01             	testb  $0x1,(%rsi)
   1b023:	74 21                	je     1b046 <<hyperinterval::float::F32Enclosure>::abs+0x26>
   1b025:	8b 46 04             	mov    0x4(%rsi),%eax
   1b028:	85 c0                	test   %eax,%eax
   1b02a:	0f 99 c1             	setns  %cl
   1b02d:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1b032:	0f 94 c2             	sete   %dl
   1b035:	08 ca                	or     %cl,%dl
   1b037:	74 14                	je     1b04d <<hyperinterval::float::F32Enclosure>::abs+0x2d>
   1b039:	8b 46 08             	mov    0x8(%rsi),%eax
   1b03c:	89 47 08             	mov    %eax,0x8(%rdi)
   1b03f:	48 8b 06             	mov    (%rsi),%rax
   1b042:	48 89 07             	mov    %rax,(%rdi)
   1b045:	c3                   	ret
   1b046:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
   1b04c:	c3                   	ret
   1b04d:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1b050:	85 c9                	test   %ecx,%ecx
   1b052:	40 0f 98 c6          	sets   %sil
   1b056:	48 89 ca             	mov    %rcx,%rdx
   1b059:	48 81 e2 ff ff ff 7f 	and    $0x7fffffff,%rdx
   1b060:	41 0f 95 c0          	setne  %r8b
   1b064:	44 84 c6             	test   %r8b,%sil
   1b067:	74 18                	je     1b081 <<hyperinterval::float::F32Enclosure>::abs+0x61>
   1b069:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1b06f:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1b074:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
   1b07a:	89 4f 04             	mov    %ecx,0x4(%rdi)
   1b07d:	89 47 08             	mov    %eax,0x8(%rdi)
   1b080:	c3                   	ret
   1b081:	89 c6                	mov    %eax,%esi
   1b083:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1b089:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1b08f:	46 8d 0c 01          	lea    (%rcx,%r8,1),%r9d
   1b093:	41 29 d0             	sub    %edx,%r8d
   1b096:	85 c9                	test   %ecx,%ecx
   1b098:	4d 0f 49 c1          	cmovns %r9,%r8
   1b09c:	41 39 c0             	cmp    %eax,%r8d
   1b09f:	0f 43 f1             	cmovae %ecx,%esi
   1b0a2:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   1b0a9:	89 77 08             	mov    %esi,0x8(%rdi)
   1b0ac:	c3                   	ret
   1b0ad:	cc                   	int3
   1b0ae:	cc                   	int3
   1b0af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   1b0b0:	f6 06 01             	testb  $0x1,(%rsi)
   1b0b3:	0f 84 d3 00 00 00    	je     1b18c <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1b0b9:	f6 02 01             	testb  $0x1,(%rdx)
   1b0bc:	0f 84 ca 00 00 00    	je     1b18c <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1b0c2:	41 57                	push   %r15
   1b0c4:	41 56                	push   %r14
   1b0c6:	41 55                	push   %r13
   1b0c8:	41 54                	push   %r12
   1b0ca:	53                   	push   %rbx
   1b0cb:	48 83 ec 20          	sub    $0x20,%rsp
   1b0cf:	49 89 fc             	mov    %rdi,%r12
   1b0d2:	8b 5e 08             	mov    0x8(%rsi),%ebx
   1b0d5:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1b0db:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1b0df:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   1b0e3:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1b0e6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b0eb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1b0f0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1b0f5:	e8 f6 00 00 00       	call   1b1f0 <<hyperinterval::ieee::Format>::add>
   1b0fa:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b0ff:	74 6b                	je     1b16c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1b101:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1b106:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b10b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1b110:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1b115:	48 89 d9             	mov    %rbx,%rcx
   1b118:	4d 89 f0             	mov    %r14,%r8
   1b11b:	e8 d0 00 00 00       	call   1b1f0 <<hyperinterval::ieee::Format>::add>
   1b120:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b125:	74 45                	je     1b16c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1b127:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1b12b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b130:	be 00 00 00 80       	mov    $0x80000000,%esi
   1b135:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1b13a:	4c 89 f9             	mov    %r15,%rcx
   1b13d:	e8 8e e7 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1b142:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b147:	74 23                	je     1b16c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1b149:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1b14e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b153:	be 00 00 00 80       	mov    $0x80000000,%esi
   1b158:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1b15d:	48 89 d9             	mov    %rbx,%rcx
   1b160:	e8 6b e7 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1b165:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b16a:	75 27                	jne    1b193 <<hyperinterval::float::F32Enclosure>::add+0xe3>
   1b16c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1b171:	41 88 44 24 04       	mov    %al,0x4(%r12)
   1b176:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   1b17d:	00 
   1b17e:	48 83 c4 20          	add    $0x20,%rsp
   1b182:	5b                   	pop    %rbx
   1b183:	41 5c                	pop    %r12
   1b185:	41 5d                	pop    %r13
   1b187:	41 5e                	pop    %r14
   1b189:	41 5f                	pop    %r15
   1b18b:	c3                   	ret
   1b18c:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
   1b192:	c3                   	ret
   1b193:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1b197:	44 89 f1             	mov    %r14d,%ecx
   1b19a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1b1a0:	89 c2                	mov    %eax,%edx
   1b1a2:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1b1a8:	be 00 00 00 80       	mov    $0x80000000,%esi
   1b1ad:	29 ce                	sub    %ecx,%esi
   1b1af:	44 09 e9             	or     %r13d,%ecx
   1b1b2:	45 85 f6             	test   %r14d,%r14d
   1b1b5:	48 0f 49 f1          	cmovns %rcx,%rsi
   1b1b9:	89 d1                	mov    %edx,%ecx
   1b1bb:	44 09 e9             	or     %r13d,%ecx
   1b1be:	41 29 d5             	sub    %edx,%r13d
   1b1c1:	85 c0                	test   %eax,%eax
   1b1c3:	4c 0f 49 e9          	cmovns %rcx,%r13
   1b1c7:	44 39 ee             	cmp    %r13d,%esi
   1b1ca:	76 08                	jbe    1b1d4 <<hyperinterval::float::F32Enclosure>::add+0x124>
   1b1cc:	41 c6 44 24 04 01    	movb   $0x1,0x4(%r12)
   1b1d2:	eb a2                	jmp    1b176 <<hyperinterval::float::F32Enclosure>::add+0xc6>
   1b1d4:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
   1b1db:	00 
   1b1dc:	45 89 74 24 04       	mov    %r14d,0x4(%r12)
   1b1e1:	41 89 44 24 08       	mov    %eax,0x8(%r12)
   1b1e6:	eb 96                	jmp    1b17e <<hyperinterval::float::F32Enclosure>::add+0xce>
   1b1e8:	cc                   	int3
   1b1e9:	cc                   	int3
   1b1ea:	cc                   	int3
   1b1eb:	cc                   	int3
   1b1ec:	cc                   	int3
   1b1ed:	cc                   	int3
   1b1ee:	cc                   	int3
   1b1ef:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1b1f0:	48 85 c9             	test   %rcx,%rcx
   1b1f3:	74 50                	je     1b245 <<hyperinterval::ieee::Format>::add+0x55>
   1b1f5:	48 89 c8             	mov    %rcx,%rax
   1b1f8:	4d 85 c0             	test   %r8,%r8
   1b1fb:	74 54                	je     1b251 <<hyperinterval::ieee::Format>::add+0x61>
   1b1fd:	55                   	push   %rbp
   1b1fe:	41 57                	push   %r15
   1b200:	41 56                	push   %r14
   1b202:	41 55                	push   %r13
   1b204:	41 54                	push   %r12
   1b206:	53                   	push   %rbx
   1b207:	48 83 ec 38          	sub    $0x38,%rsp
   1b20b:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1b210:	49 89 c7             	mov    %rax,%r15
   1b213:	49 21 d7             	and    %rdx,%r15
   1b216:	44 89 c9             	mov    %r9d,%ecx
   1b219:	49 d3 ef             	shr    %cl,%r15
   1b21c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   1b222:	49 d3 e5             	shl    %cl,%r13
   1b225:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   1b229:	49 89 de             	mov    %rbx,%r14
   1b22c:	49 21 c6             	and    %rax,%r14
   1b22f:	49 89 d2             	mov    %rdx,%r10
   1b232:	49 d3 ea             	shr    %cl,%r10
   1b235:	4d 85 ff             	test   %r15,%r15
   1b238:	74 23                	je     1b25d <<hyperinterval::ieee::Format>::add+0x6d>
   1b23a:	4d 09 ee             	or     %r13,%r14
   1b23d:	49 d1 ea             	shr    $1,%r10
   1b240:	45 01 ca             	add    %r9d,%r10d
   1b243:	eb 24                	jmp    1b269 <<hyperinterval::ieee::Format>::add+0x79>
   1b245:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   1b249:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   1b24d:	c6 07 00             	movb   $0x0,(%rdi)
   1b250:	c3                   	ret
   1b251:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1b255:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b259:	c6 07 00             	movb   $0x0,(%rdi)
   1b25c:	c3                   	ret
   1b25d:	49 d1 ea             	shr    $1,%r10
   1b260:	45 01 ca             	add    %r9d,%r10d
   1b263:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1b269:	45 29 d7             	sub    %r10d,%r15d
   1b26c:	48 85 f0             	test   %rsi,%rax
   1b26f:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1b274:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1b279:	49 0f bd ce          	bsr    %r14,%rcx
   1b27d:	83 f1 3f             	xor    $0x3f,%ecx
   1b280:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   1b284:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   1b288:	45 31 e4             	xor    %r12d,%r12d
   1b28b:	44 89 d9             	mov    %r11d,%ecx
   1b28e:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   1b292:	49 d3 e6             	shl    %cl,%r14
   1b295:	31 c9                	xor    %ecx,%ecx
   1b297:	41 f6 c3 40          	test   $0x40,%r11b
   1b29b:	4d 0f 45 e6          	cmovne %r14,%r12
   1b29f:	4c 0f 45 f1          	cmovne %rcx,%r14
   1b2a3:	4d 89 c2             	mov    %r8,%r10
   1b2a6:	49 21 d2             	and    %rdx,%r10
   1b2a9:	44 89 c9             	mov    %r9d,%ecx
   1b2ac:	49 d3 ea             	shr    %cl,%r10
   1b2af:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   1b2b3:	45 29 df             	sub    %r11d,%r15d
   1b2b6:	4c 21 c3             	and    %r8,%rbx
   1b2b9:	49 89 d3             	mov    %rdx,%r11
   1b2bc:	49 d3 eb             	shr    %cl,%r11
   1b2bf:	4d 85 d2             	test   %r10,%r10
   1b2c2:	74 0b                	je     1b2cf <<hyperinterval::ieee::Format>::add+0xdf>
   1b2c4:	4c 09 eb             	or     %r13,%rbx
   1b2c7:	49 d1 eb             	shr    $1,%r11
   1b2ca:	45 01 cb             	add    %r9d,%r11d
   1b2cd:	eb 0c                	jmp    1b2db <<hyperinterval::ieee::Format>::add+0xeb>
   1b2cf:	49 d1 eb             	shr    $1,%r11
   1b2d2:	45 01 cb             	add    %r9d,%r11d
   1b2d5:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1b2db:	45 29 da             	sub    %r11d,%r10d
   1b2de:	49 85 f0             	test   %rsi,%r8
   1b2e1:	41 0f 95 c3          	setne  %r11b
   1b2e5:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1b2ea:	48 0f bd cb          	bsr    %rbx,%rcx
   1b2ee:	83 f1 3f             	xor    $0x3f,%ecx
   1b2f1:	01 e9                	add    %ebp,%ecx
   1b2f3:	83 c1 40             	add    $0x40,%ecx
   1b2f6:	45 31 ed             	xor    %r13d,%r13d
   1b2f9:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1b2fd:	48 d3 e3             	shl    %cl,%rbx
   1b300:	45 31 c9             	xor    %r9d,%r9d
   1b303:	f6 c1 40             	test   $0x40,%cl
   1b306:	4c 0f 45 eb          	cmovne %rbx,%r13
   1b30a:	49 0f 45 d9          	cmovne %r9,%rbx
   1b30e:	41 29 ca             	sub    %ecx,%r10d
   1b311:	45 39 d7             	cmp    %r10d,%r15d
   1b314:	7d 6d                	jge    1b383 <<hyperinterval::ieee::Format>::add+0x193>
   1b316:	44 89 f9             	mov    %r15d,%ecx
   1b319:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   1b31f:	4c 89 f5             	mov    %r14,%rbp
   1b322:	4d 89 e1             	mov    %r12,%r9
   1b325:	4d 89 c6             	mov    %r8,%r14
   1b328:	45 89 dc             	mov    %r11d,%r12d
   1b32b:	41 29 ca             	sub    %ecx,%r10d
   1b32e:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1b332:	7f 76                	jg     1b3aa <<hyperinterval::ieee::Format>::add+0x1ba>
   1b334:	41 89 cb             	mov    %ecx,%r11d
   1b337:	49 85 f0             	test   %rsi,%r8
   1b33a:	41 0f 95 c0          	setne  %r8b
   1b33e:	48 85 f0             	test   %rsi,%rax
   1b341:	41 0f 95 c6          	setne  %r14b
   1b345:	44 89 d1             	mov    %r10d,%ecx
   1b348:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1b34c:	48 d3 e3             	shl    %cl,%rbx
   1b34f:	31 c0                	xor    %eax,%eax
   1b351:	41 f6 c2 40          	test   $0x40,%r10b
   1b355:	4c 0f 45 eb          	cmovne %rbx,%r13
   1b359:	48 0f 44 c3          	cmove  %rbx,%rax
   1b35d:	45 30 c6             	xor    %r8b,%r14b
   1b360:	0f 84 95 00 00 00    	je     1b3fb <<hyperinterval::ieee::Format>::add+0x20b>
   1b366:	48 39 e8             	cmp    %rbp,%rax
   1b369:	4c 89 e9             	mov    %r13,%rcx
   1b36c:	4c 19 c9             	sbb    %r9,%rcx
   1b36f:	0f 83 b8 00 00 00    	jae    1b42d <<hyperinterval::ieee::Format>::add+0x23d>
   1b375:	48 29 c5             	sub    %rax,%rbp
   1b378:	4d 19 e9             	sbb    %r13,%r9
   1b37b:	45 89 fc             	mov    %r15d,%r12d
   1b37e:	e9 b6 00 00 00       	jmp    1b439 <<hyperinterval::ieee::Format>::add+0x249>
   1b383:	44 89 d1             	mov    %r10d,%ecx
   1b386:	48 89 dd             	mov    %rbx,%rbp
   1b389:	4d 89 e9             	mov    %r13,%r9
   1b38c:	4d 89 e5             	mov    %r12,%r13
   1b38f:	4c 89 f3             	mov    %r14,%rbx
   1b392:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   1b398:	45 89 fa             	mov    %r15d,%r10d
   1b39b:	45 89 df             	mov    %r11d,%r15d
   1b39e:	49 89 c6             	mov    %rax,%r14
   1b3a1:	41 29 ca             	sub    %ecx,%r10d
   1b3a4:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1b3a8:	7e 8a                	jle    1b334 <<hyperinterval::ieee::Format>::add+0x144>
   1b3aa:	48 89 fb             	mov    %rdi,%rbx
   1b3ad:	4c 89 f0             	mov    %r14,%rax
   1b3b0:	45 84 ff             	test   %r15b,%r15b
   1b3b3:	74 4e                	je     1b403 <<hyperinterval::ieee::Format>::add+0x213>
   1b3b5:	48 31 f0             	xor    %rsi,%rax
   1b3b8:	48 89 c1             	mov    %rax,%rcx
   1b3bb:	48 21 f1             	and    %rsi,%rcx
   1b3be:	31 ff                	xor    %edi,%edi
   1b3c0:	48 f7 d9             	neg    %rcx
   1b3c3:	40 0f 93 c7          	setae  %dil
   1b3c7:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1b3cb:	48 ff c9             	dec    %rcx
   1b3ce:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1b3d3:	49 89 f7             	mov    %rsi,%r15
   1b3d6:	e8 f5 e4 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1b3db:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1b3e0:	75 44                	jne    1b426 <<hyperinterval::ieee::Format>::add+0x236>
   1b3e2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b3e7:	49 31 c7             	xor    %rax,%r15
   1b3ea:	48 85 c0             	test   %rax,%rax
   1b3ed:	4c 0f 44 f8          	cmove  %rax,%r15
   1b3f1:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1b3f5:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1b3f9:	eb 6b                	jmp    1b466 <<hyperinterval::ieee::Format>::add+0x276>
   1b3fb:	48 01 c5             	add    %rax,%rbp
   1b3fe:	4d 11 e9             	adc    %r13,%r9
   1b401:	eb 36                	jmp    1b439 <<hyperinterval::ieee::Format>::add+0x249>
   1b403:	48 21 f0             	and    %rsi,%rax
   1b406:	31 c9                	xor    %ecx,%ecx
   1b408:	48 f7 d8             	neg    %rax
   1b40b:	0f 93 c1             	setae  %cl
   1b40e:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   1b412:	48 ff c9             	dec    %rcx
   1b415:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1b41a:	e8 b1 e4 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1b41f:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1b424:	74 33                	je     1b459 <<hyperinterval::ieee::Format>::add+0x269>
   1b426:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1b42b:	eb 3c                	jmp    1b469 <<hyperinterval::ieee::Format>::add+0x279>
   1b42d:	48 29 e8             	sub    %rbp,%rax
   1b430:	4d 19 cd             	sbb    %r9,%r13
   1b433:	48 89 c5             	mov    %rax,%rbp
   1b436:	4d 89 e9             	mov    %r13,%r9
   1b439:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   1b43e:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
   1b443:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1b448:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
   1b44d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1b452:	e8 f9 e8 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1b457:	eb 10                	jmp    1b469 <<hyperinterval::ieee::Format>::add+0x279>
   1b459:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b45e:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1b462:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b466:	c6 03 00             	movb   $0x0,(%rbx)
   1b469:	48 83 c4 38          	add    $0x38,%rsp
   1b46d:	5b                   	pop    %rbx
   1b46e:	41 5c                	pop    %r12
   1b470:	41 5d                	pop    %r13
   1b472:	41 5e                	pop    %r14
   1b474:	41 5f                	pop    %r15
   1b476:	5d                   	pop    %rbp
   1b477:	c3                   	ret
   1b478:	cc                   	int3
   1b479:	cc                   	int3
   1b47a:	cc                   	int3
   1b47b:	cc                   	int3
   1b47c:	cc                   	int3
   1b47d:	cc                   	int3
   1b47e:	cc                   	int3
   1b47f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   1b480:	83 3a 01             	cmpl   $0x1,(%rdx)
   1b483:	0f 85 87 e4 ff ff    	jne    19910 <<hyperinterval::float::F32Enclosure>::corner_image>
   1b489:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1b48d:	0f 8f 7d e4 ff ff    	jg     19910 <<hyperinterval::float::F32Enclosure>::corner_image>
   1b493:	8b 42 08             	mov    0x8(%rdx),%eax
   1b496:	85 c0                	test   %eax,%eax
   1b498:	0f 99 c1             	setns  %cl
   1b49b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1b4a0:	0f 94 c0             	sete   %al
   1b4a3:	08 c8                	or     %cl,%al
   1b4a5:	0f 84 65 e4 ff ff    	je     19910 <<hyperinterval::float::F32Enclosure>::corner_image>
   1b4ab:	c6 47 04 04          	movb   $0x4,0x4(%rdi)
   1b4af:	c7 07 02 00 00 00    	movl   $0x2,(%rdi)
   1b4b5:	c3                   	ret
   1b4b6:	cc                   	int3
   1b4b7:	cc                   	int3
   1b4b8:	cc                   	int3
   1b4b9:	cc                   	int3
   1b4ba:	cc                   	int3
   1b4bb:	cc                   	int3
   1b4bc:	cc                   	int3
   1b4bd:	cc                   	int3
   1b4be:	cc                   	int3
   1b4bf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   1b4c0:	f6 02 01             	testb  $0x1,(%rdx)
   1b4c3:	74 29                	je     1b4ee <<hyperinterval::float::F32Enclosure>::sub+0x2e>
   1b4c5:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1b4ca:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1b4ce:	66 0f 6f 15 1a 7e fe 	movdqa -0x181e6(%rip),%xmm2        # 32f0 <__abi_tag+0x2ff4>
   1b4d5:	ff 
   1b4d6:	66 0f ef d0          	pxor   %xmm0,%xmm2
   1b4da:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   1b4de:	66 0f df ca          	pandn  %xmm2,%xmm1
   1b4e2:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1b4e7:	b8 01 00 00 00       	mov    $0x1,%eax
   1b4ec:	eb 02                	jmp    1b4f0 <<hyperinterval::float::F32Enclosure>::sub+0x30>
   1b4ee:	31 c0                	xor    %eax,%eax
   1b4f0:	48 83 ec 18          	sub    $0x18,%rsp
   1b4f4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
   1b4f8:	66 0f d6 44 24 10    	movq   %xmm0,0x10(%rsp)
   1b4fe:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
   1b503:	e8 a8 fb ff ff       	call   1b0b0 <<hyperinterval::float::F32Enclosure>::add>
   1b508:	48 83 c4 18          	add    $0x18,%rsp
   1b50c:	c3                   	ret
   1b50d:	cc                   	int3
   1b50e:	cc                   	int3
   1b50f:	cc                   	int3

<hyperinterval::ieee::Format>::sqrt:
   1b510:	55                   	push   %rbp
   1b511:	41 57                	push   %r15
   1b513:	41 56                	push   %r14
   1b515:	41 55                	push   %r13
   1b517:	41 54                	push   %r12
   1b519:	53                   	push   %rbx
   1b51a:	48 83 ec 28          	sub    $0x28,%rsp
   1b51e:	f3 4c 0f bc ee       	tzcnt  %rsi,%r13
   1b523:	48 89 d0             	mov    %rdx,%rax
   1b526:	48 21 f0             	and    %rsi,%rax
   1b529:	44 89 e9             	mov    %r13d,%ecx
   1b52c:	48 d3 e8             	shr    %cl,%rax
   1b52f:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1b535:	49 d3 e0             	shl    %cl,%r8
   1b538:	49 8d 58 ff          	lea    -0x1(%r8),%rbx
   1b53c:	48 21 d3             	and    %rdx,%rbx
   1b53f:	48 89 f2             	mov    %rsi,%rdx
   1b542:	48 d3 ea             	shr    %cl,%rdx
   1b545:	48 85 c0             	test   %rax,%rax
   1b548:	74 0b                	je     1b555 <<hyperinterval::ieee::Format>::sqrt+0x45>
   1b54a:	4c 09 c3             	or     %r8,%rbx
   1b54d:	48 d1 ea             	shr    $1,%rdx
   1b550:	44 01 ea             	add    %r13d,%edx
   1b553:	eb 14                	jmp    1b569 <<hyperinterval::ieee::Format>::sqrt+0x59>
   1b555:	48 85 db             	test   %rbx,%rbx
   1b558:	0f 84 74 03 00 00    	je     1b8d2 <<hyperinterval::ieee::Format>::sqrt+0x3c2>
   1b55e:	48 d1 ea             	shr    $1,%rdx
   1b561:	44 01 ea             	add    %r13d,%edx
   1b564:	b8 01 00 00 00       	mov    $0x1,%eax
   1b569:	29 d0                	sub    %edx,%eax
   1b56b:	48 0f bd eb          	bsr    %rbx,%rbp
   1b56f:	83 f5 3f             	xor    $0x3f,%ebp
   1b572:	83 cd 40             	or     $0x40,%ebp
   1b575:	83 f5 7f             	xor    $0x7f,%ebp
   1b578:	01 c5                	add    %eax,%ebp
   1b57a:	d1 fd                	sar    $1,%ebp
   1b57c:	41 89 eb             	mov    %ebp,%r11d
   1b57f:	45 29 eb             	sub    %r13d,%r11d
   1b582:	44 29 d8             	sub    %r11d,%eax
   1b585:	44 29 d8             	sub    %r11d,%eax
   1b588:	45 31 ff             	xor    %r15d,%r15d
   1b58b:	89 c1                	mov    %eax,%ecx
   1b58d:	49 0f a5 df          	shld   %cl,%rbx,%r15
   1b591:	48 d3 e3             	shl    %cl,%rbx
   1b594:	45 31 c0             	xor    %r8d,%r8d
   1b597:	a8 40                	test   $0x40,%al
   1b599:	4c 0f 45 fb          	cmovne %rbx,%r15
   1b59d:	49 0f 45 d8          	cmovne %r8,%rbx
   1b5a1:	4d 85 ff             	test   %r15,%r15
   1b5a4:	75 3b                	jne    1b5e1 <<hyperinterval::ieee::Format>::sqrt+0xd1>
   1b5a6:	48 89 d8             	mov    %rbx,%rax
   1b5a9:	48 c1 e8 20          	shr    $0x20,%rax
   1b5ad:	0f 85 5b 01 00 00    	jne    1b70e <<hyperinterval::ieee::Format>::sqrt+0x1fe>
   1b5b3:	48 81 fb 00 00 01 00 	cmp    $0x10000,%rbx
   1b5ba:	0f 83 1e 03 00 00    	jae    1b8de <<hyperinterval::ieee::Format>::sqrt+0x3ce>
   1b5c0:	48 81 fb 00 01 00 00 	cmp    $0x100,%rbx
   1b5c7:	0f 83 e4 05 00 00    	jae    1bbb1 <<hyperinterval::ieee::Format>::sqrt+0x6a1>
   1b5cd:	48 8d 05 d3 c1 fe ff 	lea    -0x13e2d(%rip),%rax        # 77a7 <core::unicode::unicode_data::cf::SHORT_OFFSET_RUNS+0x2d7>
   1b5d4:	44 0f b6 24 58       	movzbl (%rax,%rbx,2),%r12d
   1b5d9:	45 31 c0             	xor    %r8d,%r8d
   1b5dc:	e9 f0 03 00 00       	jmp    1b9d1 <<hyperinterval::ieee::Format>::sqrt+0x4c1>
   1b5e1:	4c 89 6c 24 18       	mov    %r13,0x18(%rsp)
   1b5e6:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1b5eb:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1b5f0:	49 0f bd c7          	bsr    %r15,%rax
   1b5f4:	48 83 f0 3f          	xor    $0x3f,%rax
   1b5f8:	4c 0f bd eb          	bsr    %rbx,%r13
   1b5fc:	49 83 f5 3f          	xor    $0x3f,%r13
   1b600:	49 83 cd 40          	or     $0x40,%r13
   1b604:	4d 85 ff             	test   %r15,%r15
   1b607:	4c 0f 45 e8          	cmovne %rax,%r13
   1b60b:	44 89 e9             	mov    %r13d,%ecx
   1b60e:	80 e1 3e             	and    $0x3e,%cl
   1b611:	4d 89 fe             	mov    %r15,%r14
   1b614:	49 0f a5 de          	shld   %cl,%rbx,%r14
   1b618:	48 89 d8             	mov    %rbx,%rax
   1b61b:	48 d3 e0             	shl    %cl,%rax
   1b61e:	41 f6 c5 40          	test   $0x40,%r13b
   1b622:	4c 0f 45 f0          	cmovne %rax,%r14
   1b626:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   1b62c:	4c 0f 44 c8          	cmove  %rax,%r9
   1b630:	4c 89 f0             	mov    %r14,%rax
   1b633:	48 c1 e8 38          	shr    $0x38,%rax
   1b637:	48 8d 15 69 c1 fe ff 	lea    -0x13e97(%rip),%rdx        # 77a7 <core::unicode::unicode_data::cf::SHORT_OFFSET_RUNS+0x2d7>
   1b63e:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1b642:	89 cf                	mov    %ecx,%edi
   1b644:	01 cf                	add    %ecx,%edi
   1b646:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1b64b:	c1 e2 04             	shl    $0x4,%edx
   1b64e:	4c 89 f0             	mov    %r14,%rax
   1b651:	48 c1 e8 34          	shr    $0x34,%rax
   1b655:	83 e0 0f             	and    $0xf,%eax
   1b658:	09 d0                	or     %edx,%eax
   1b65a:	31 d2                	xor    %edx,%edx
   1b65c:	66 f7 f7             	div    %di
   1b65f:	4c 89 f7             	mov    %r14,%rdi
   1b662:	48 c1 ef 30          	shr    $0x30,%rdi
   1b666:	0f b7 d2             	movzwl %dx,%edx
   1b669:	c0 e1 04             	shl    $0x4,%cl
   1b66c:	0f b6 c9             	movzbl %cl,%ecx
   1b66f:	01 c1                	add    %eax,%ecx
   1b671:	0f b7 c9             	movzwl %cx,%ecx
   1b674:	c1 e2 04             	shl    $0x4,%edx
   1b677:	83 e7 0f             	and    $0xf,%edi
   1b67a:	09 d7                	or     %edx,%edi
   1b67c:	0f af c0             	imul   %eax,%eax
   1b67f:	66 29 c7             	sub    %ax,%di
   1b682:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1b686:	41 0f 43 c0          	cmovae %r8d,%eax
   1b68a:	66 83 d9 00          	sbb    $0x0,%cx
   1b68e:	01 f8                	add    %edi,%eax
   1b690:	0f b7 f9             	movzwl %cx,%edi
   1b693:	01 ff                	add    %edi,%edi
   1b695:	0f b7 d0             	movzwl %ax,%edx
   1b698:	c1 e2 08             	shl    $0x8,%edx
   1b69b:	4c 89 f0             	mov    %r14,%rax
   1b69e:	48 c1 e8 28          	shr    $0x28,%rax
   1b6a2:	0f b6 c0             	movzbl %al,%eax
   1b6a5:	09 d0                	or     %edx,%eax
   1b6a7:	31 d2                	xor    %edx,%edx
   1b6a9:	f7 f7                	div    %edi
   1b6ab:	4c 89 f7             	mov    %r14,%rdi
   1b6ae:	48 c1 ef 20          	shr    $0x20,%rdi
   1b6b2:	c1 e1 08             	shl    $0x8,%ecx
   1b6b5:	44 0f b7 e1          	movzwl %cx,%r12d
   1b6b9:	41 01 c4             	add    %eax,%r12d
   1b6bc:	c1 e2 08             	shl    $0x8,%edx
   1b6bf:	40 0f b6 cf          	movzbl %dil,%ecx
   1b6c3:	09 d1                	or     %edx,%ecx
   1b6c5:	0f af c0             	imul   %eax,%eax
   1b6c8:	29 c1                	sub    %eax,%ecx
   1b6ca:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1b6cf:	41 0f 43 c0          	cmovae %r8d,%eax
   1b6d3:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1b6d6:	41 83 dc 00          	sbb    $0x0,%r12d
   1b6da:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1b6de:	48 c1 e2 10          	shl    $0x10,%rdx
   1b6e2:	44 89 f0             	mov    %r14d,%eax
   1b6e5:	c1 e8 10             	shr    $0x10,%eax
   1b6e8:	48 09 d0             	or     %rdx,%rax
   1b6eb:	48 09 ca             	or     %rcx,%rdx
   1b6ee:	48 c1 ea 20          	shr    $0x20,%rdx
   1b6f2:	66 85 d2             	test   %dx,%dx
   1b6f5:	4c 89 1c 24          	mov    %r11,(%rsp)
   1b6f9:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
   1b6fe:	0f 84 0b 01 00 00    	je     1b80f <<hyperinterval::ieee::Format>::sqrt+0x2ff>
   1b704:	31 d2                	xor    %edx,%edx
   1b706:	48 f7 f1             	div    %rcx
   1b709:	e9 05 01 00 00       	jmp    1b813 <<hyperinterval::ieee::Format>::sqrt+0x303>
   1b70e:	4d 89 de             	mov    %r11,%r14
   1b711:	4c 0f bd db          	bsr    %rbx,%r11
   1b715:	49 83 f3 3f          	xor    $0x3f,%r11
   1b719:	44 89 d9             	mov    %r11d,%ecx
   1b71c:	80 e1 3e             	and    $0x3e,%cl
   1b71f:	49 89 da             	mov    %rbx,%r10
   1b722:	49 d3 e2             	shl    %cl,%r10
   1b725:	4c 89 d0             	mov    %r10,%rax
   1b728:	48 c1 e8 38          	shr    $0x38,%rax
   1b72c:	48 8d 0d 74 c0 fe ff 	lea    -0x13f8c(%rip),%rcx        # 77a7 <core::unicode::unicode_data::cf::SHORT_OFFSET_RUNS+0x2d7>
   1b733:	44 0f b6 04 41       	movzbl (%rcx,%rax,2),%r8d
   1b738:	45 89 c1             	mov    %r8d,%r9d
   1b73b:	45 01 c1             	add    %r8d,%r9d
   1b73e:	0f b6 4c 41 01       	movzbl 0x1(%rcx,%rax,2),%ecx
   1b743:	c1 e1 04             	shl    $0x4,%ecx
   1b746:	4c 89 d0             	mov    %r10,%rax
   1b749:	48 c1 e8 34          	shr    $0x34,%rax
   1b74d:	83 e0 0f             	and    $0xf,%eax
   1b750:	09 c8                	or     %ecx,%eax
   1b752:	31 d2                	xor    %edx,%edx
   1b754:	66 41 f7 f1          	div    %r9w
   1b758:	4d 89 d1             	mov    %r10,%r9
   1b75b:	49 c1 e9 30          	shr    $0x30,%r9
   1b75f:	31 c9                	xor    %ecx,%ecx
   1b761:	0f b7 d2             	movzwl %dx,%edx
   1b764:	41 c0 e0 04          	shl    $0x4,%r8b
   1b768:	45 0f b6 c0          	movzbl %r8b,%r8d
   1b76c:	41 01 c0             	add    %eax,%r8d
   1b76f:	45 0f b7 c0          	movzwl %r8w,%r8d
   1b773:	c1 e2 04             	shl    $0x4,%edx
   1b776:	41 83 e1 0f          	and    $0xf,%r9d
   1b77a:	41 09 d1             	or     %edx,%r9d
   1b77d:	0f af c0             	imul   %eax,%eax
   1b780:	66 41 29 c1          	sub    %ax,%r9w
   1b784:	43 8d 44 00 ff       	lea    -0x1(%r8,%r8,1),%eax
   1b789:	0f 43 c1             	cmovae %ecx,%eax
   1b78c:	66 41 83 d8 00       	sbb    $0x0,%r8w
   1b791:	44 01 c8             	add    %r9d,%eax
   1b794:	45 0f b7 c8          	movzwl %r8w,%r9d
   1b798:	45 01 c9             	add    %r9d,%r9d
   1b79b:	0f b7 d0             	movzwl %ax,%edx
   1b79e:	c1 e2 08             	shl    $0x8,%edx
   1b7a1:	4c 89 d0             	mov    %r10,%rax
   1b7a4:	48 c1 e8 28          	shr    $0x28,%rax
   1b7a8:	0f b6 c0             	movzbl %al,%eax
   1b7ab:	09 d0                	or     %edx,%eax
   1b7ad:	31 d2                	xor    %edx,%edx
   1b7af:	41 f7 f1             	div    %r9d
   1b7b2:	4d 89 d1             	mov    %r10,%r9
   1b7b5:	49 c1 e9 20          	shr    $0x20,%r9
   1b7b9:	41 c1 e0 08          	shl    $0x8,%r8d
   1b7bd:	45 0f b7 e0          	movzwl %r8w,%r12d
   1b7c1:	41 01 c4             	add    %eax,%r12d
   1b7c4:	c1 e2 08             	shl    $0x8,%edx
   1b7c7:	45 0f b6 c1          	movzbl %r9b,%r8d
   1b7cb:	41 09 d0             	or     %edx,%r8d
   1b7ce:	0f af c0             	imul   %eax,%eax
   1b7d1:	41 29 c0             	sub    %eax,%r8d
   1b7d4:	43 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%eax
   1b7d9:	0f 43 c1             	cmovae %ecx,%eax
   1b7dc:	41 8d 14 00          	lea    (%r8,%rax,1),%edx
   1b7e0:	41 83 dc 00          	sbb    $0x0,%r12d
   1b7e4:	4b 8d 0c 24          	lea    (%r12,%r12,1),%rcx
   1b7e8:	48 c1 e2 10          	shl    $0x10,%rdx
   1b7ec:	44 89 d0             	mov    %r10d,%eax
   1b7ef:	c1 e8 10             	shr    $0x10,%eax
   1b7f2:	48 09 d0             	or     %rdx,%rax
   1b7f5:	48 09 ca             	or     %rcx,%rdx
   1b7f8:	48 c1 ea 20          	shr    $0x20,%rdx
   1b7fc:	66 85 d2             	test   %dx,%dx
   1b7ff:	0f 84 9b 01 00 00    	je     1b9a0 <<hyperinterval::ieee::Format>::sqrt+0x490>
   1b805:	31 d2                	xor    %edx,%edx
   1b807:	48 f7 f1             	div    %rcx
   1b80a:	e9 95 01 00 00       	jmp    1b9a4 <<hyperinterval::ieee::Format>::sqrt+0x494>
   1b80f:	31 d2                	xor    %edx,%edx
   1b811:	f7 f1                	div    %ecx
   1b813:	41 c1 e4 10          	shl    $0x10,%r12d
   1b817:	49 01 c4             	add    %rax,%r12
   1b81a:	48 c1 e2 10          	shl    $0x10,%rdx
   1b81e:	41 0f b7 ce          	movzwl %r14w,%ecx
   1b822:	48 09 d1             	or     %rdx,%rcx
   1b825:	48 0f af c0          	imul   %rax,%rax
   1b829:	31 d2                	xor    %edx,%edx
   1b82b:	48 29 c1             	sub    %rax,%rcx
   1b82e:	4b 8d 44 24 ff       	lea    -0x1(%r12,%r12,1),%rax
   1b833:	48 0f 42 d0          	cmovb  %rax,%rdx
   1b837:	49 83 dc 00          	sbb    $0x0,%r12
   1b83b:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
   1b83f:	4b 8d 14 24          	lea    (%r12,%r12,1),%rdx
   1b843:	4c 89 e1             	mov    %r12,%rcx
   1b846:	48 c1 e9 3f          	shr    $0x3f,%rcx
   1b84a:	48 89 fe             	mov    %rdi,%rsi
   1b84d:	48 c1 ee 20          	shr    $0x20,%rsi
   1b851:	4c 0f a4 cf 20       	shld   $0x20,%r9,%rdi
   1b856:	4d 89 cf             	mov    %r9,%r15
   1b859:	ff 15 41 64 03 00    	call   *0x36441(%rip)        # 51ca0 <_DYNAMIC+0x298>
   1b85f:	49 89 d0             	mov    %rdx,%r8
   1b862:	49 c1 e4 20          	shl    $0x20,%r12
   1b866:	49 01 c4             	add    %rax,%r12
   1b869:	49 83 d0 00          	adc    $0x0,%r8
   1b86d:	4c 89 c0             	mov    %r8,%rax
   1b870:	49 f7 e4             	mul    %r12
   1b873:	0f 90 c1             	seto   %cl
   1b876:	4d 85 c0             	test   %r8,%r8
   1b879:	40 0f 95 c7          	setne  %dil
   1b87d:	40 08 cf             	or     %cl,%dil
   1b880:	48 8d 0c 00          	lea    (%rax,%rax,1),%rcx
   1b884:	4c 89 e0             	mov    %r12,%rax
   1b887:	49 f7 e4             	mul    %r12
   1b88a:	48 01 ca             	add    %rcx,%rdx
   1b88d:	0f 92 c1             	setb   %cl
   1b890:	40 08 f9             	or     %dil,%cl
   1b893:	49 39 c7             	cmp    %rax,%r15
   1b896:	49 19 d6             	sbb    %rdx,%r14
   1b899:	0f 92 c0             	setb   %al
   1b89c:	08 c8                	or     %cl,%al
   1b89e:	0f b6 c0             	movzbl %al,%eax
   1b8a1:	49 29 c4             	sub    %rax,%r12
   1b8a4:	49 83 d8 00          	sbb    $0x0,%r8
   1b8a8:	41 d1 ed             	shr    $1,%r13d
   1b8ab:	44 89 e9             	mov    %r13d,%ecx
   1b8ae:	4d 0f ad c4          	shrd   %cl,%r8,%r12
   1b8b2:	49 d3 e8             	shr    %cl,%r8
   1b8b5:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1b8ba:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b8bf:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
   1b8c4:	4c 8b 1c 24          	mov    (%rsp),%r11
   1b8c8:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b8cd:	e9 ff 00 00 00       	jmp    1b9d1 <<hyperinterval::ieee::Format>::sqrt+0x4c1>
   1b8d2:	0f 57 c0             	xorps  %xmm0,%xmm0
   1b8d5:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1b8d9:	e9 c0 02 00 00       	jmp    1bb9e <<hyperinterval::ieee::Format>::sqrt+0x68e>
   1b8de:	44 0f bd cb          	bsr    %ebx,%r9d
   1b8e2:	41 83 f1 1f          	xor    $0x1f,%r9d
   1b8e6:	44 89 c9             	mov    %r9d,%ecx
   1b8e9:	80 e1 1e             	and    $0x1e,%cl
   1b8ec:	89 da                	mov    %ebx,%edx
   1b8ee:	d3 e2                	shl    %cl,%edx
   1b8f0:	89 d0                	mov    %edx,%eax
   1b8f2:	41 89 d2             	mov    %edx,%r10d
   1b8f5:	c1 e8 18             	shr    $0x18,%eax
   1b8f8:	48 8d 15 a8 be fe ff 	lea    -0x14158(%rip),%rdx        # 77a7 <core::unicode::unicode_data::cf::SHORT_OFFSET_RUNS+0x2d7>
   1b8ff:	0f b6 0c 42          	movzbl (%rdx,%rax,2),%ecx
   1b903:	41 89 c8             	mov    %ecx,%r8d
   1b906:	41 01 c8             	add    %ecx,%r8d
   1b909:	0f b6 54 42 01       	movzbl 0x1(%rdx,%rax,2),%edx
   1b90e:	c1 e2 04             	shl    $0x4,%edx
   1b911:	45 89 d6             	mov    %r10d,%r14d
   1b914:	44 89 d0             	mov    %r10d,%eax
   1b917:	c1 e8 14             	shr    $0x14,%eax
   1b91a:	83 e0 0f             	and    $0xf,%eax
   1b91d:	09 d0                	or     %edx,%eax
   1b91f:	31 d2                	xor    %edx,%edx
   1b921:	66 41 f7 f0          	div    %r8w
   1b925:	41 c1 ea 10          	shr    $0x10,%r10d
   1b929:	45 31 c0             	xor    %r8d,%r8d
   1b92c:	0f b7 d2             	movzwl %dx,%edx
   1b92f:	c0 e1 04             	shl    $0x4,%cl
   1b932:	0f b6 c9             	movzbl %cl,%ecx
   1b935:	01 c1                	add    %eax,%ecx
   1b937:	0f b7 c9             	movzwl %cx,%ecx
   1b93a:	c1 e2 04             	shl    $0x4,%edx
   1b93d:	41 83 e2 0f          	and    $0xf,%r10d
   1b941:	41 09 d2             	or     %edx,%r10d
   1b944:	0f af c0             	imul   %eax,%eax
   1b947:	66 41 29 c2          	sub    %ax,%r10w
   1b94b:	8d 44 09 ff          	lea    -0x1(%rcx,%rcx,1),%eax
   1b94f:	41 0f 43 c0          	cmovae %r8d,%eax
   1b953:	66 83 d9 00          	sbb    $0x0,%cx
   1b957:	44 01 d0             	add    %r10d,%eax
   1b95a:	44 0f b7 d1          	movzwl %cx,%r10d
   1b95e:	45 01 d2             	add    %r10d,%r10d
   1b961:	0f b7 d0             	movzwl %ax,%edx
   1b964:	c1 e2 08             	shl    $0x8,%edx
   1b967:	44 89 f0             	mov    %r14d,%eax
   1b96a:	0f b6 c4             	movzbl %ah,%eax
   1b96d:	09 d0                	or     %edx,%eax
   1b96f:	31 d2                	xor    %edx,%edx
   1b971:	41 f7 f2             	div    %r10d
   1b974:	c1 e1 08             	shl    $0x8,%ecx
   1b977:	44 0f b7 e1          	movzwl %cx,%r12d
   1b97b:	41 01 c4             	add    %eax,%r12d
   1b97e:	44 89 e0             	mov    %r12d,%eax
   1b981:	41 f7 e4             	mul    %r12d
   1b984:	0f 90 c1             	seto   %cl
   1b987:	44 39 f0             	cmp    %r14d,%eax
   1b98a:	0f 97 c0             	seta   %al
   1b98d:	08 c8                	or     %cl,%al
   1b98f:	0f b6 c0             	movzbl %al,%eax
   1b992:	41 29 c4             	sub    %eax,%r12d
   1b995:	41 d1 e9             	shr    $1,%r9d
   1b998:	44 89 c9             	mov    %r9d,%ecx
   1b99b:	41 d3 ec             	shr    %cl,%r12d
   1b99e:	eb 31                	jmp    1b9d1 <<hyperinterval::ieee::Format>::sqrt+0x4c1>
   1b9a0:	31 d2                	xor    %edx,%edx
   1b9a2:	f7 f1                	div    %ecx
   1b9a4:	41 c1 e4 10          	shl    $0x10,%r12d
   1b9a8:	49 01 c4             	add    %rax,%r12
   1b9ab:	4c 89 e0             	mov    %r12,%rax
   1b9ae:	49 f7 e4             	mul    %r12
   1b9b1:	0f 90 c1             	seto   %cl
   1b9b4:	4c 39 d0             	cmp    %r10,%rax
   1b9b7:	0f 97 c0             	seta   %al
   1b9ba:	08 c8                	or     %cl,%al
   1b9bc:	0f b6 c0             	movzbl %al,%eax
   1b9bf:	49 29 c4             	sub    %rax,%r12
   1b9c2:	41 d1 eb             	shr    $1,%r11d
   1b9c5:	44 89 d9             	mov    %r11d,%ecx
   1b9c8:	49 d3 ec             	shr    %cl,%r12
   1b9cb:	45 31 c0             	xor    %r8d,%r8d
   1b9ce:	4d 89 f3             	mov    %r14,%r11
   1b9d1:	4c 89 e1             	mov    %r12,%rcx
   1b9d4:	4c 89 e0             	mov    %r12,%rax
   1b9d7:	49 f7 e4             	mul    %r12
   1b9da:	49 0f af c8          	imul   %r8,%rcx
   1b9de:	48 01 ca             	add    %rcx,%rdx
   1b9e1:	48 01 ca             	add    %rcx,%rdx
   1b9e4:	4c 31 fa             	xor    %r15,%rdx
   1b9e7:	48 31 d8             	xor    %rbx,%rax
   1b9ea:	45 31 f6             	xor    %r14d,%r14d
   1b9ed:	48 09 d0             	or     %rdx,%rax
   1b9f0:	41 0f 95 c6          	setne  %r14b
   1b9f4:	4d 01 e6             	add    %r12,%r14
   1b9f7:	4d 89 c7             	mov    %r8,%r15
   1b9fa:	49 83 d7 00          	adc    $0x0,%r15
   1b9fe:	4c 89 e0             	mov    %r12,%rax
   1ba01:	4c 09 c0             	or     %r8,%rax
   1ba04:	74 61                	je     1ba67 <<hyperinterval::ieee::Format>::sqrt+0x557>
   1ba06:	49 0f bd c0          	bsr    %r8,%rax
   1ba0a:	83 f0 3f             	xor    $0x3f,%eax
   1ba0d:	4d 0f bd cc          	bsr    %r12,%r9
   1ba11:	41 83 f1 3f          	xor    $0x3f,%r9d
   1ba15:	41 83 c9 40          	or     $0x40,%r9d
   1ba19:	4d 85 c0             	test   %r8,%r8
   1ba1c:	44 0f 45 c8          	cmovne %eax,%r9d
   1ba20:	48 89 f0             	mov    %rsi,%rax
   1ba23:	44 89 e9             	mov    %r13d,%ecx
   1ba26:	48 d3 e8             	shr    %cl,%rax
   1ba29:	41 83 f1 7f          	xor    $0x7f,%r9d
   1ba2d:	47 8d 14 19          	lea    (%r9,%r11,1),%r10d
   1ba31:	48 d1 e8             	shr    $1,%rax
   1ba34:	41 39 c2             	cmp    %eax,%r10d
   1ba37:	7f 6b                	jg     1baa4 <<hyperinterval::ieee::Format>::sqrt+0x594>
   1ba39:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ba3e:	29 c1                	sub    %eax,%ecx
   1ba40:	41 39 ca             	cmp    %ecx,%r10d
   1ba43:	0f 8d 8f 00 00 00    	jge    1bad8 <<hyperinterval::ieee::Format>::sqrt+0x5c8>
   1ba49:	01 e8                	add    %ebp,%eax
   1ba4b:	fe c8                	dec    %al
   1ba4d:	89 c1                	mov    %eax,%ecx
   1ba4f:	49 d3 e4             	shl    %cl,%r12
   1ba52:	31 d2                	xor    %edx,%edx
   1ba54:	a8 40                	test   $0x40,%al
   1ba56:	49 0f 44 d4          	cmove  %r12,%rdx
   1ba5a:	4c 89 f0             	mov    %r14,%rax
   1ba5d:	4c 09 f8             	or     %r15,%rax
   1ba60:	75 13                	jne    1ba75 <<hyperinterval::ieee::Format>::sqrt+0x565>
   1ba62:	e9 dc 00 00 00       	jmp    1bb43 <<hyperinterval::ieee::Format>::sqrt+0x633>
   1ba67:	31 d2                	xor    %edx,%edx
   1ba69:	4c 89 f0             	mov    %r14,%rax
   1ba6c:	4c 09 f8             	or     %r15,%rax
   1ba6f:	0f 84 ce 00 00 00    	je     1bb43 <<hyperinterval::ieee::Format>::sqrt+0x633>
   1ba75:	49 0f bd c7          	bsr    %r15,%rax
   1ba79:	83 f0 3f             	xor    $0x3f,%eax
   1ba7c:	4d 0f bd c6          	bsr    %r14,%r8
   1ba80:	41 83 f0 3f          	xor    $0x3f,%r8d
   1ba84:	41 83 c8 40          	or     $0x40,%r8d
   1ba88:	4d 85 ff             	test   %r15,%r15
   1ba8b:	44 0f 45 c0          	cmovne %eax,%r8d
   1ba8f:	44 89 e9             	mov    %r13d,%ecx
   1ba92:	48 d3 ee             	shr    %cl,%rsi
   1ba95:	41 83 f0 7f          	xor    $0x7f,%r8d
   1ba99:	45 01 c3             	add    %r8d,%r11d
   1ba9c:	48 d1 ee             	shr    $1,%rsi
   1ba9f:	41 39 f3             	cmp    %esi,%r11d
   1baa2:	7e 0b                	jle    1baaf <<hyperinterval::ieee::Format>::sqrt+0x59f>
   1baa4:	c6 47 01 03          	movb   $0x3,0x1(%rdi)
   1baa8:	b0 01                	mov    $0x1,%al
   1baaa:	e9 f1 00 00 00       	jmp    1bba0 <<hyperinterval::ieee::Format>::sqrt+0x690>
   1baaf:	b8 01 00 00 00       	mov    $0x1,%eax
   1bab4:	29 f0                	sub    %esi,%eax
   1bab6:	41 39 c3             	cmp    %eax,%r11d
   1bab9:	0f 8d 88 00 00 00    	jge    1bb47 <<hyperinterval::ieee::Format>::sqrt+0x637>
   1babf:	01 ee                	add    %ebp,%esi
   1bac1:	40 fe ce             	dec    %sil
   1bac4:	89 f1                	mov    %esi,%ecx
   1bac6:	49 d3 e6             	shl    %cl,%r14
   1bac9:	31 c0                	xor    %eax,%eax
   1bacb:	40 f6 c6 40          	test   $0x40,%sil
   1bacf:	49 0f 44 c6          	cmove  %r14,%rax
   1bad3:	e9 be 00 00 00       	jmp    1bb96 <<hyperinterval::ieee::Format>::sqrt+0x686>
   1bad8:	44 89 e9             	mov    %r13d,%ecx
   1badb:	44 29 c9             	sub    %r9d,%ecx
   1bade:	89 ca                	mov    %ecx,%edx
   1bae0:	f7 da                	neg    %edx
   1bae2:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   1bae7:	4c 89 df             	mov    %r11,%rdi
   1baea:	4d 89 e3             	mov    %r12,%r11
   1baed:	49 d3 e3             	shl    %cl,%r11
   1baf0:	31 db                	xor    %ebx,%ebx
   1baf2:	f6 c1 40             	test   $0x40,%cl
   1baf5:	49 0f 44 db          	cmove  %r11,%rbx
   1baf9:	49 89 fb             	mov    %rdi,%r11
   1bafc:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1bb01:	89 d1                	mov    %edx,%ecx
   1bb03:	4d 0f ad c4          	shrd   %cl,%r8,%r12
   1bb07:	49 d3 e8             	shr    %cl,%r8
   1bb0a:	f6 c2 40             	test   $0x40,%dl
   1bb0d:	4d 0f 44 c4          	cmove  %r12,%r8
   1bb11:	45 39 cd             	cmp    %r9d,%r13d
   1bb14:	4c 0f 43 c3          	cmovae %rbx,%r8
   1bb18:	41 01 c2             	add    %eax,%r10d
   1bb1b:	49 63 c2             	movslq %r10d,%rax
   1bb1e:	44 89 e9             	mov    %r13d,%ecx
   1bb21:	48 d3 e0             	shl    %cl,%rax
   1bb24:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1bb2b:	48 d3 e2             	shl    %cl,%rdx
   1bb2e:	48 f7 d2             	not    %rdx
   1bb31:	4c 21 c2             	and    %r8,%rdx
   1bb34:	48 09 c2             	or     %rax,%rdx
   1bb37:	4c 89 f0             	mov    %r14,%rax
   1bb3a:	4c 09 f8             	or     %r15,%rax
   1bb3d:	0f 85 32 ff ff ff    	jne    1ba75 <<hyperinterval::ieee::Format>::sqrt+0x565>
   1bb43:	31 c0                	xor    %eax,%eax
   1bb45:	eb 4f                	jmp    1bb96 <<hyperinterval::ieee::Format>::sqrt+0x686>
   1bb47:	44 89 e9             	mov    %r13d,%ecx
   1bb4a:	44 29 c1             	sub    %r8d,%ecx
   1bb4d:	89 c8                	mov    %ecx,%eax
   1bb4f:	f7 d8                	neg    %eax
   1bb51:	4d 89 f1             	mov    %r14,%r9
   1bb54:	49 d3 e1             	shl    %cl,%r9
   1bb57:	45 31 d2             	xor    %r10d,%r10d
   1bb5a:	f6 c1 40             	test   $0x40,%cl
   1bb5d:	4d 0f 44 d1          	cmove  %r9,%r10
   1bb61:	89 c1                	mov    %eax,%ecx
   1bb63:	4d 0f ad fe          	shrd   %cl,%r15,%r14
   1bb67:	49 d3 ef             	shr    %cl,%r15
   1bb6a:	a8 40                	test   $0x40,%al
   1bb6c:	4d 0f 44 fe          	cmove  %r14,%r15
   1bb70:	45 39 c5             	cmp    %r8d,%r13d
   1bb73:	4d 0f 43 fa          	cmovae %r10,%r15
   1bb77:	41 01 f3             	add    %esi,%r11d
   1bb7a:	49 63 f3             	movslq %r11d,%rsi
   1bb7d:	44 89 e9             	mov    %r13d,%ecx
   1bb80:	48 d3 e6             	shl    %cl,%rsi
   1bb83:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1bb8a:	48 d3 e0             	shl    %cl,%rax
   1bb8d:	48 f7 d0             	not    %rax
   1bb90:	4c 21 f8             	and    %r15,%rax
   1bb93:	48 09 f0             	or     %rsi,%rax
   1bb96:	48 89 57 08          	mov    %rdx,0x8(%rdi)
   1bb9a:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1bb9e:	31 c0                	xor    %eax,%eax
   1bba0:	88 07                	mov    %al,(%rdi)
   1bba2:	48 83 c4 28          	add    $0x28,%rsp
   1bba6:	5b                   	pop    %rbx
   1bba7:	41 5c                	pop    %r12
   1bba9:	41 5d                	pop    %r13
   1bbab:	41 5e                	pop    %r14
   1bbad:	41 5f                	pop    %r15
   1bbaf:	5d                   	pop    %rbp
   1bbb0:	c3                   	ret
   1bbb1:	4c 89 1c 24          	mov    %r11,(%rsp)
   1bbb5:	66 44 0f bd db       	bsr    %bx,%r11w
   1bbba:	41 83 f3 0f          	xor    $0xf,%r11d
   1bbbe:	44 89 d9             	mov    %r11d,%ecx
   1bbc1:	80 e1 0e             	and    $0xe,%cl
   1bbc4:	89 d8                	mov    %ebx,%eax
   1bbc6:	d3 e0                	shl    %cl,%eax
   1bbc8:	41 89 c6             	mov    %eax,%r14d
   1bbcb:	0f b6 cc             	movzbl %ah,%ecx
   1bbce:	48 8d 15 d2 bb fe ff 	lea    -0x1442e(%rip),%rdx        # 77a7 <core::unicode::unicode_data::cf::SHORT_OFFSET_RUNS+0x2d7>
   1bbd5:	44 0f b6 0c 4a       	movzbl (%rdx,%rcx,2),%r9d
   1bbda:	45 89 ca             	mov    %r9d,%r10d
   1bbdd:	45 01 ca             	add    %r9d,%r10d
   1bbe0:	0f b6 4c 4a 01       	movzbl 0x1(%rdx,%rcx,2),%ecx
   1bbe5:	c1 e1 04             	shl    $0x4,%ecx
   1bbe8:	c1 e8 04             	shr    $0x4,%eax
   1bbeb:	83 e0 0f             	and    $0xf,%eax
   1bbee:	09 c8                	or     %ecx,%eax
   1bbf0:	45 31 c0             	xor    %r8d,%r8d
   1bbf3:	31 d2                	xor    %edx,%edx
   1bbf5:	66 41 f7 f2          	div    %r10w
   1bbf9:	41 c0 e1 04          	shl    $0x4,%r9b
   1bbfd:	41 0f b6 c9          	movzbl %r9b,%ecx
   1bc01:	01 c1                	add    %eax,%ecx
   1bc03:	89 c8                	mov    %ecx,%eax
   1bc05:	66 f7 e1             	mul    %cx
   1bc08:	0f 90 c2             	seto   %dl
   1bc0b:	66 44 39 f0          	cmp    %r14w,%ax
   1bc0f:	0f 97 c0             	seta   %al
   1bc12:	08 d0                	or     %dl,%al
   1bc14:	0f b6 c0             	movzbl %al,%eax
   1bc17:	29 c1                	sub    %eax,%ecx
   1bc19:	44 0f b7 e1          	movzwl %cx,%r12d
   1bc1d:	41 d1 eb             	shr    $1,%r11d
   1bc20:	44 89 d9             	mov    %r11d,%ecx
   1bc23:	4c 8b 1c 24          	mov    (%rsp),%r11
   1bc27:	41 d3 ec             	shr    %cl,%r12d
   1bc2a:	e9 a2 fd ff ff       	jmp    1b9d1 <<hyperinterval::ieee::Format>::sqrt+0x4c1>
   1bc2f:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1bc30:	55                   	push   %rbp
   1bc31:	41 57                	push   %r15
   1bc33:	41 56                	push   %r14
   1bc35:	41 55                	push   %r13
   1bc37:	41 54                	push   %r12
   1bc39:	53                   	push   %rbx
   1bc3a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1bc41:	49 89 ca             	mov    %rcx,%r10
   1bc44:	48 89 d3             	mov    %rdx,%rbx
   1bc47:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1bc4c:	4d 89 d4             	mov    %r10,%r12
   1bc4f:	49 21 d4             	and    %rdx,%r12
   1bc52:	49 d3 ec             	shr    %cl,%r12
   1bc55:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1bc5b:	49 d3 e7             	shl    %cl,%r15
   1bc5e:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1bc62:	4c 89 f2             	mov    %r14,%rdx
   1bc65:	4c 21 d2             	and    %r10,%rdx
   1bc68:	48 89 d8             	mov    %rbx,%rax
   1bc6b:	48 d3 e8             	shr    %cl,%rax
   1bc6e:	4d 85 e4             	test   %r12,%r12
   1bc71:	74 0a                	je     1bc7d <<hyperinterval::ieee::Format>::affine+0x4d>
   1bc73:	4c 09 fa             	or     %r15,%rdx
   1bc76:	48 d1 e8             	shr    $1,%rax
   1bc79:	01 c8                	add    %ecx,%eax
   1bc7b:	eb 0b                	jmp    1bc88 <<hyperinterval::ieee::Format>::affine+0x58>
   1bc7d:	48 d1 e8             	shr    $1,%rax
   1bc80:	01 c8                	add    %ecx,%eax
   1bc82:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1bc88:	41 29 c4             	sub    %eax,%r12d
   1bc8b:	4d 89 c3             	mov    %r8,%r11
   1bc8e:	49 21 db             	and    %rbx,%r11
   1bc91:	49 d3 eb             	shr    %cl,%r11
   1bc94:	4c 89 f0             	mov    %r14,%rax
   1bc97:	4c 21 c0             	and    %r8,%rax
   1bc9a:	49 89 dd             	mov    %rbx,%r13
   1bc9d:	49 d3 ed             	shr    %cl,%r13
   1bca0:	4d 85 db             	test   %r11,%r11
   1bca3:	74 0b                	je     1bcb0 <<hyperinterval::ieee::Format>::affine+0x80>
   1bca5:	4c 09 f8             	or     %r15,%rax
   1bca8:	49 d1 ed             	shr    $1,%r13
   1bcab:	41 01 cd             	add    %ecx,%r13d
   1bcae:	eb 0c                	jmp    1bcbc <<hyperinterval::ieee::Format>::affine+0x8c>
   1bcb0:	49 d1 ed             	shr    $1,%r13
   1bcb3:	41 01 cd             	add    %ecx,%r13d
   1bcb6:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1bcbc:	45 29 eb             	sub    %r13d,%r11d
   1bcbf:	49 85 f2             	test   %rsi,%r10
   1bcc2:	41 0f 95 c2          	setne  %r10b
   1bcc6:	49 85 f0             	test   %rsi,%r8
   1bcc9:	41 0f 95 c0          	setne  %r8b
   1bccd:	48 f7 e2             	mul    %rdx
   1bcd0:	45 30 d0             	xor    %r10b,%r8b
   1bcd3:	45 01 e3             	add    %r12d,%r11d
   1bcd6:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1bcdb:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1bce0:	4d 89 ca             	mov    %r9,%r10
   1bce3:	49 21 da             	and    %rbx,%r10
   1bce6:	49 d3 ea             	shr    %cl,%r10
   1bce9:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1bcee:	44 89 5c 24 60       	mov    %r11d,0x60(%rsp)
   1bcf3:	4d 21 ce             	and    %r9,%r14
   1bcf6:	4d 85 d2             	test   %r10,%r10
   1bcf9:	74 14                	je     1bd0f <<hyperinterval::ieee::Format>::affine+0xdf>
   1bcfb:	49 89 dc             	mov    %rbx,%r12
   1bcfe:	49 d3 ec             	shr    %cl,%r12
   1bd01:	4d 09 fe             	or     %r15,%r14
   1bd04:	49 d1 ec             	shr    $1,%r12
   1bd07:	41 01 cc             	add    %ecx,%r12d
   1bd0a:	45 29 e2             	sub    %r12d,%r10d
   1bd0d:	eb 15                	jmp    1bd24 <<hyperinterval::ieee::Format>::affine+0xf4>
   1bd0f:	49 89 df             	mov    %rbx,%r15
   1bd12:	49 d3 ef             	shr    %cl,%r15
   1bd15:	49 d1 ef             	shr    $1,%r15
   1bd18:	41 01 cf             	add    %ecx,%r15d
   1bd1b:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1bd21:	45 29 fa             	sub    %r15d,%r10d
   1bd24:	49 85 f1             	test   %rsi,%r9
   1bd27:	40 0f 95 c5          	setne  %bpl
   1bd2b:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1bd32:	00 
   1bd33:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
   1bd38:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1bd3f:	00 00 
   1bd41:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1bd48:	00 
   1bd49:	48 89 c1             	mov    %rax,%rcx
   1bd4c:	48 09 d1             	or     %rdx,%rcx
   1bd4f:	74 7b                	je     1bdcc <<hyperinterval::ieee::Format>::affine+0x19c>
   1bd51:	4d 85 f6             	test   %r14,%r14
   1bd54:	74 7d                	je     1bdd3 <<hyperinterval::ieee::Format>::affine+0x1a3>
   1bd56:	40 88 6c 24 07       	mov    %bpl,0x7(%rsp)
   1bd5b:	48 0f bd ca          	bsr    %rdx,%rcx
   1bd5f:	83 f1 3f             	xor    $0x3f,%ecx
   1bd62:	4c 0f bd e0          	bsr    %rax,%r12
   1bd66:	41 83 f4 3f          	xor    $0x3f,%r12d
   1bd6a:	41 83 cc 40          	or     $0x40,%r12d
   1bd6e:	48 85 d2             	test   %rdx,%rdx
   1bd71:	44 0f 45 e1          	cmovne %ecx,%r12d
   1bd75:	41 83 f4 7f          	xor    $0x7f,%r12d
   1bd79:	45 01 dc             	add    %r11d,%r12d
   1bd7c:	4d 0f bd fe          	bsr    %r14,%r15
   1bd80:	41 83 f7 3f          	xor    $0x3f,%r15d
   1bd84:	41 83 cf 40          	or     $0x40,%r15d
   1bd88:	41 83 f7 7f          	xor    $0x7f,%r15d
   1bd8c:	45 01 d7             	add    %r10d,%r15d
   1bd8f:	45 39 e7             	cmp    %r12d,%r15d
   1bd92:	45 0f 4e fc          	cmovle %r12d,%r15d
   1bd96:	41 83 c7 82          	add    $0xffffff82,%r15d
   1bd9a:	45 29 fb             	sub    %r15d,%r11d
   1bd9d:	78 46                	js     1bde5 <<hyperinterval::ieee::Format>::affine+0x1b5>
   1bd9f:	44 89 d9             	mov    %r11d,%ecx
   1bda2:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1bda6:	48 d3 e0             	shl    %cl,%rax
   1bda9:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1bdb0:	00 00 
   1bdb2:	41 f6 c3 40          	test   $0x40,%r11b
   1bdb6:	48 0f 45 d0          	cmovne %rax,%rdx
   1bdba:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1bdc0:	4c 0f 44 e8          	cmove  %rax,%r13
   1bdc4:	48 89 d5             	mov    %rdx,%rbp
   1bdc7:	e9 98 00 00 00       	jmp    1be64 <<hyperinterval::ieee::Format>::affine+0x234>
   1bdcc:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1bdd1:	eb 05                	jmp    1bdd8 <<hyperinterval::ieee::Format>::affine+0x1a8>
   1bdd3:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1bdd8:	48 89 da             	mov    %rbx,%rdx
   1bddb:	e8 70 df ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1bde0:	e9 fa 01 00 00       	jmp    1bfdf <<hyperinterval::ieee::Format>::affine+0x3af>
   1bde5:	41 f7 db             	neg    %r11d
   1bde8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1bdee:	bd 00 00 00 00       	mov    $0x0,%ebp
   1bdf3:	41 83 fb 7f          	cmp    $0x7f,%r11d
   1bdf7:	7f 5d                	jg     1be56 <<hyperinterval::ieee::Format>::affine+0x226>
   1bdf9:	49 89 c5             	mov    %rax,%r13
   1bdfc:	44 89 d9             	mov    %r11d,%ecx
   1bdff:	49 0f ad d5          	shrd   %cl,%rdx,%r13
   1be03:	48 89 d5             	mov    %rdx,%rbp
   1be06:	48 d3 ed             	shr    %cl,%rbp
   1be09:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1be10:	49 d3 e4             	shl    %cl,%r12
   1be13:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1be1a:	41 f6 c3 40          	test   $0x40,%r11b
   1be1e:	4c 0f 45 ed          	cmovne %rbp,%r13
   1be22:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1be28:	49 0f 45 eb          	cmovne %r11,%rbp
   1be2c:	49 0f 45 cc          	cmovne %r12,%rcx
   1be30:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1be36:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1be3b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1be41:	4d 0f 45 e3          	cmovne %r11,%r12
   1be45:	49 f7 d4             	not    %r12
   1be48:	48 f7 d1             	not    %rcx
   1be4b:	48 21 d1             	and    %rdx,%rcx
   1be4e:	49 21 c4             	and    %rax,%r12
   1be51:	49 09 cc             	or     %rcx,%r12
   1be54:	74 0e                	je     1be64 <<hyperinterval::ieee::Format>::affine+0x234>
   1be56:	41 0f b6 c0          	movzbl %r8b,%eax
   1be5a:	f7 d8                	neg    %eax
   1be5c:	83 c8 01             	or     $0x1,%eax
   1be5f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1be64:	45 29 fa             	sub    %r15d,%r10d
   1be67:	78 20                	js     1be89 <<hyperinterval::ieee::Format>::affine+0x259>
   1be69:	31 d2                	xor    %edx,%edx
   1be6b:	44 89 d1             	mov    %r10d,%ecx
   1be6e:	4c 0f a5 f2          	shld   %cl,%r14,%rdx
   1be72:	49 d3 e6             	shl    %cl,%r14
   1be75:	45 31 e4             	xor    %r12d,%r12d
   1be78:	41 f6 c2 40          	test   $0x40,%r10b
   1be7c:	49 0f 45 d6          	cmovne %r14,%rdx
   1be80:	4d 0f 45 f4          	cmovne %r12,%r14
   1be84:	4c 89 f0             	mov    %r14,%rax
   1be87:	eb 59                	jmp    1bee2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1be89:	41 f7 da             	neg    %r10d
   1be8c:	45 31 e4             	xor    %r12d,%r12d
   1be8f:	b8 00 00 00 00       	mov    $0x0,%eax
   1be94:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1be98:	7f 2d                	jg     1bec7 <<hyperinterval::ieee::Format>::affine+0x297>
   1be9a:	4c 89 f0             	mov    %r14,%rax
   1be9d:	44 89 d1             	mov    %r10d,%ecx
   1bea0:	4c 0f ad e0          	shrd   %cl,%r12,%rax
   1bea4:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1beab:	49 d3 e3             	shl    %cl,%r11
   1beae:	41 f6 c2 40          	test   $0x40,%r10b
   1beb2:	49 0f 45 c4          	cmovne %r12,%rax
   1beb6:	4d 0f 45 dc          	cmovne %r12,%r11
   1beba:	49 f7 d3             	not    %r11
   1bebd:	ba 00 00 00 00       	mov    $0x0,%edx
   1bec2:	4d 85 f3             	test   %r14,%r11
   1bec5:	74 1b                	je     1bee2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1bec7:	4c 89 e2             	mov    %r12,%rdx
   1beca:	4c 89 c9             	mov    %r9,%rcx
   1becd:	48 21 f1             	and    %rsi,%rcx
   1bed0:	45 31 d2             	xor    %r10d,%r10d
   1bed3:	48 f7 d9             	neg    %rcx
   1bed6:	41 0f 93 c2          	setae  %r10b
   1beda:	46 8d 24 55 ff ff ff 	lea    -0x1(,%r10,2),%r12d
   1bee1:	ff 
   1bee2:	49 85 f1             	test   %rsi,%r9
   1bee5:	0f 95 c1             	setne  %cl
   1bee8:	41 38 c8             	cmp    %cl,%r8b
   1beeb:	49 89 fe             	mov    %rdi,%r14
   1beee:	74 19                	je     1bf09 <<hyperinterval::ieee::Format>::affine+0x2d9>
   1bef0:	49 39 c5             	cmp    %rax,%r13
   1bef3:	48 89 e9             	mov    %rbp,%rcx
   1bef6:	48 19 d1             	sbb    %rdx,%rcx
   1bef9:	73 16                	jae    1bf11 <<hyperinterval::ieee::Format>::affine+0x2e1>
   1befb:	4c 29 e8             	sub    %r13,%rax
   1befe:	48 19 ea             	sbb    %rbp,%rdx
   1bf01:	44 0f b6 44 24 07    	movzbl 0x7(%rsp),%r8d
   1bf07:	eb 14                	jmp    1bf1d <<hyperinterval::ieee::Format>::affine+0x2ed>
   1bf09:	4c 01 e8             	add    %r13,%rax
   1bf0c:	48 11 ea             	adc    %rbp,%rdx
   1bf0f:	eb 0c                	jmp    1bf1d <<hyperinterval::ieee::Format>::affine+0x2ed>
   1bf11:	49 29 c5             	sub    %rax,%r13
   1bf14:	48 19 d5             	sbb    %rdx,%rbp
   1bf17:	4c 89 e8             	mov    %r13,%rax
   1bf1a:	48 89 ea             	mov    %rbp,%rdx
   1bf1d:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1bf22:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1bf27:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1bf2c:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1bf31:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1bf36:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1bf3b:	49 89 f5             	mov    %rsi,%r13
   1bf3e:	48 89 da             	mov    %rbx,%rdx
   1bf41:	e8 0a de ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1bf46:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1bf4b:	75 12                	jne    1bf5f <<hyperinterval::ieee::Format>::affine+0x32f>
   1bf4d:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1bf52:	41 88 46 01          	mov    %al,0x1(%r14)
   1bf56:	41 c6 06 01          	movb   $0x1,(%r14)
   1bf5a:	e9 80 00 00 00       	jmp    1bfdf <<hyperinterval::ieee::Format>::affine+0x3af>
   1bf5f:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1bf64:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1bf69:	49 39 c7             	cmp    %rax,%r15
   1bf6c:	4c 89 f1             	mov    %r14,%rcx
   1bf6f:	75 63                	jne    1bfd4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1bf71:	44 03 64 24 08       	add    0x8(%rsp),%r12d
   1bf76:	41 83 fc 01          	cmp    $0x1,%r12d
   1bf7a:	74 75                	je     1bff1 <<hyperinterval::ieee::Format>::affine+0x3c1>
   1bf7c:	41 83 fc ff          	cmp    $0xffffffff,%r12d
   1bf80:	75 52                	jne    1bfd4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1bf82:	4c 89 f8             	mov    %r15,%rax
   1bf85:	4c 89 ee             	mov    %r13,%rsi
   1bf88:	4c 31 e8             	xor    %r13,%rax
   1bf8b:	4d 85 ff             	test   %r15,%r15
   1bf8e:	49 0f 44 c7          	cmove  %r15,%rax
   1bf92:	48 89 c1             	mov    %rax,%rcx
   1bf95:	4c 21 e9             	and    %r13,%rcx
   1bf98:	31 d2                	xor    %edx,%edx
   1bf9a:	48 f7 d9             	neg    %rcx
   1bf9d:	0f 93 c2             	setae  %dl
   1bfa0:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1bfa4:	48 ff c9             	dec    %rcx
   1bfa7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1bfac:	48 89 da             	mov    %rbx,%rdx
   1bfaf:	e8 1c d9 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1bfb4:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1bfb9:	75 62                	jne    1c01d <<hyperinterval::ieee::Format>::affine+0x3ed>
   1bfbb:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1bfc0:	49 31 c5             	xor    %rax,%r13
   1bfc3:	48 85 c0             	test   %rax,%rax
   1bfc6:	4c 0f 44 e8          	cmove  %rax,%r13
   1bfca:	4d 89 6e 08          	mov    %r13,0x8(%r14)
   1bfce:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1bfd2:	eb 5e                	jmp    1c032 <<hyperinterval::ieee::Format>::affine+0x402>
   1bfd4:	4c 89 79 08          	mov    %r15,0x8(%rcx)
   1bfd8:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1bfdc:	c6 01 00             	movb   $0x0,(%rcx)
   1bfdf:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1bfe6:	5b                   	pop    %rbx
   1bfe7:	41 5c                	pop    %r12
   1bfe9:	41 5d                	pop    %r13
   1bfeb:	41 5e                	pop    %r14
   1bfed:	41 5f                	pop    %r15
   1bfef:	5d                   	pop    %rbp
   1bff0:	c3                   	ret
   1bff1:	4c 89 ee             	mov    %r13,%rsi
   1bff4:	4c 89 f8             	mov    %r15,%rax
   1bff7:	4c 21 e8             	and    %r13,%rax
   1bffa:	31 c9                	xor    %ecx,%ecx
   1bffc:	48 f7 d8             	neg    %rax
   1bfff:	0f 93 c1             	setae  %cl
   1c002:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1c006:	48 ff c9             	dec    %rcx
   1c009:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1c00e:	48 89 da             	mov    %rbx,%rdx
   1c011:	e8 ba d8 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c016:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1c01b:	74 08                	je     1c025 <<hyperinterval::ieee::Format>::affine+0x3f5>
   1c01d:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1c023:	eb ba                	jmp    1bfdf <<hyperinterval::ieee::Format>::affine+0x3af>
   1c025:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1c02a:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1c02e:	49 89 46 10          	mov    %rax,0x10(%r14)
   1c032:	41 c6 06 00          	movb   $0x0,(%r14)
   1c036:	eb a7                	jmp    1bfdf <<hyperinterval::ieee::Format>::affine+0x3af>
   1c038:	cc                   	int3
   1c039:	cc                   	int3
   1c03a:	cc                   	int3
   1c03b:	cc                   	int3
   1c03c:	cc                   	int3
   1c03d:	cc                   	int3
   1c03e:	cc                   	int3
   1c03f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1c040:	83 3f 00             	cmpl   $0x0,(%rdi)
   1c043:	b0 01                	mov    $0x1,%al
   1c045:	0f 84 a3 00 00 00    	je     1c0ee <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1c04b:	8b 0e                	mov    (%rsi),%ecx
   1c04d:	85 c9                	test   %ecx,%ecx
   1c04f:	0f 84 99 00 00 00    	je     1c0ee <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1c055:	f6 c1 01             	test   $0x1,%cl
   1c058:	74 4c                	je     1c0a6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1c05a:	53                   	push   %rbx
   1c05b:	8b 56 04             	mov    0x4(%rsi),%edx
   1c05e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1c062:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1c068:	45 89 c2             	mov    %r8d,%r10d
   1c06b:	45 09 ca             	or     %r9d,%r10d
   1c06e:	45 89 c3             	mov    %r8d,%r11d
   1c071:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1c078:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1c07d:	44 29 db             	sub    %r11d,%ebx
   1c080:	45 85 c0             	test   %r8d,%r8d
   1c083:	49 0f 49 da          	cmovns %r10,%rbx
   1c087:	41 89 d0             	mov    %edx,%r8d
   1c08a:	45 09 c8             	or     %r9d,%r8d
   1c08d:	41 89 d2             	mov    %edx,%r10d
   1c090:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1c097:	45 29 d1             	sub    %r10d,%r9d
   1c09a:	85 d2                	test   %edx,%edx
   1c09c:	4d 0f 49 c8          	cmovns %r8,%r9
   1c0a0:	44 39 cb             	cmp    %r9d,%ebx
   1c0a3:	5b                   	pop    %rbx
   1c0a4:	72 48                	jb     1c0ee <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1c0a6:	f6 c1 01             	test   $0x1,%cl
   1c0a9:	75 03                	jne    1c0ae <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1c0ab:	31 c0                	xor    %eax,%eax
   1c0ad:	c3                   	ret
   1c0ae:	8b 47 04             	mov    0x4(%rdi),%eax
   1c0b1:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1c0b4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1c0b9:	89 ce                	mov    %ecx,%esi
   1c0bb:	09 d6                	or     %edx,%esi
   1c0bd:	89 cf                	mov    %ecx,%edi
   1c0bf:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1c0c5:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1c0cb:	41 29 f8             	sub    %edi,%r8d
   1c0ce:	85 c9                	test   %ecx,%ecx
   1c0d0:	4c 0f 49 c6          	cmovns %rsi,%r8
   1c0d4:	89 c1                	mov    %eax,%ecx
   1c0d6:	09 d1                	or     %edx,%ecx
   1c0d8:	89 c6                	mov    %eax,%esi
   1c0da:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1c0e0:	29 f2                	sub    %esi,%edx
   1c0e2:	85 c0                	test   %eax,%eax
   1c0e4:	48 0f 49 d1          	cmovns %rcx,%rdx
   1c0e8:	41 39 d0             	cmp    %edx,%r8d
   1c0eb:	0f 92 c0             	setb   %al
   1c0ee:	c3                   	ret
   1c0ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1c0f0:	31 c0                	xor    %eax,%eax
   1c0f2:	83 3f 00             	cmpl   $0x0,(%rdi)
   1c0f5:	0f 84 a1 00 00 00    	je     1c19c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1c0fb:	8b 0e                	mov    (%rsi),%ecx
   1c0fd:	85 c9                	test   %ecx,%ecx
   1c0ff:	0f 84 97 00 00 00    	je     1c19c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1c105:	f6 c1 01             	test   $0x1,%cl
   1c108:	74 4b                	je     1c155 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1c10a:	8b 46 04             	mov    0x4(%rsi),%eax
   1c10d:	8b 57 08             	mov    0x8(%rdi),%edx
   1c110:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1c116:	41 89 d1             	mov    %edx,%r9d
   1c119:	45 09 c1             	or     %r8d,%r9d
   1c11c:	41 89 d2             	mov    %edx,%r10d
   1c11f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1c126:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1c12c:	45 29 d3             	sub    %r10d,%r11d
   1c12f:	85 d2                	test   %edx,%edx
   1c131:	4d 0f 49 d9          	cmovns %r9,%r11
   1c135:	89 c2                	mov    %eax,%edx
   1c137:	44 09 c2             	or     %r8d,%edx
   1c13a:	41 89 c1             	mov    %eax,%r9d
   1c13d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1c144:	45 29 c8             	sub    %r9d,%r8d
   1c147:	85 c0                	test   %eax,%eax
   1c149:	4c 0f 49 c2          	cmovns %rdx,%r8
   1c14d:	45 39 c3             	cmp    %r8d,%r11d
   1c150:	73 03                	jae    1c155 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1c152:	31 c0                	xor    %eax,%eax
   1c154:	c3                   	ret
   1c155:	b0 01                	mov    $0x1,%al
   1c157:	f6 c1 01             	test   $0x1,%cl
   1c15a:	74 40                	je     1c19c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1c15c:	8b 47 04             	mov    0x4(%rdi),%eax
   1c15f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1c162:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1c167:	89 ce                	mov    %ecx,%esi
   1c169:	09 d6                	or     %edx,%esi
   1c16b:	89 cf                	mov    %ecx,%edi
   1c16d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1c173:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1c179:	41 29 f8             	sub    %edi,%r8d
   1c17c:	85 c9                	test   %ecx,%ecx
   1c17e:	4c 0f 49 c6          	cmovns %rsi,%r8
   1c182:	89 c1                	mov    %eax,%ecx
   1c184:	09 d1                	or     %edx,%ecx
   1c186:	89 c6                	mov    %eax,%esi
   1c188:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1c18e:	29 f2                	sub    %esi,%edx
   1c190:	85 c0                	test   %eax,%eax
   1c192:	48 0f 49 d1          	cmovns %rcx,%rdx
   1c196:	41 39 d0             	cmp    %edx,%r8d
   1c199:	0f 93 c0             	setae  %al
   1c19c:	c3                   	ret
   1c19d:	cc                   	int3
   1c19e:	cc                   	int3
   1c19f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::max_image:
   1c1a0:	31 c0                	xor    %eax,%eax
   1c1a2:	f6 06 01             	testb  $0x1,(%rsi)
   1c1a5:	0f 84 db 00 00 00    	je     1c286 <<hyperinterval::float::F32Enclosure>::max_image+0xe6>
   1c1ab:	f6 02 01             	testb  $0x1,(%rdx)
   1c1ae:	0f 84 ca 00 00 00    	je     1c27e <<hyperinterval::float::F32Enclosure>::max_image+0xde>
   1c1b4:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1c1b9:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1c1be:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1c1c2:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1c1c6:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1c1ca:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1c1ce:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1c1d2:	66 0f 6f 1d e6 72 fe 	movdqa -0x18d1a(%rip),%xmm3        # 34c0 <__abi_tag+0x31c4>
   1c1d9:	ff 
   1c1da:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1c1de:	66 0f eb f3          	por    %xmm3,%xmm6
   1c1e2:	66 0f 6f 3d a6 70 fe 	movdqa -0x18f5a(%rip),%xmm7        # 3290 <__abi_tag+0x2f94>
   1c1e9:	ff 
   1c1ea:	66 0f db e7          	pand   %xmm7,%xmm4
   1c1ee:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1c1f3:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1c1f8:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1c1fd:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1c202:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1c207:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1c20c:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1c211:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1c216:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1c21a:	66 0f eb e3          	por    %xmm3,%xmm4
   1c21e:	66 0f db ef          	pand   %xmm7,%xmm5
   1c222:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1c226:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1c22a:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1c22f:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1c233:	66 0f db f2          	pand   %xmm2,%xmm6
   1c237:	66 0f df d4          	pandn  %xmm4,%xmm2
   1c23b:	66 0f eb d6          	por    %xmm6,%xmm2
   1c23f:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1c244:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1c248:	66 0f 6f da          	movdqa %xmm2,%xmm3
   1c24c:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   1c251:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1c256:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   1c25b:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   1c260:	66 0f db ec          	pand   %xmm4,%xmm5
   1c264:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1c269:	66 0f eb d5          	por    %xmm5,%xmm2
   1c26d:	66 0f db c2          	pand   %xmm2,%xmm0
   1c271:	66 0f df d1          	pandn  %xmm1,%xmm2
   1c275:	66 0f eb d0          	por    %xmm0,%xmm2
   1c279:	b8 01 00 00 00       	mov    $0x1,%eax
   1c27e:	89 07                	mov    %eax,(%rdi)
   1c280:	66 0f d6 57 04       	movq   %xmm2,0x4(%rdi)
   1c285:	c3                   	ret
   1c286:	89 07                	mov    %eax,(%rdi)
   1c288:	0f 13 57 04          	movlps %xmm2,0x4(%rdi)
   1c28c:	c3                   	ret
   1c28d:	cc                   	int3
   1c28e:	cc                   	int3
   1c28f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::min_image:
   1c290:	31 c0                	xor    %eax,%eax
   1c292:	f6 06 01             	testb  $0x1,(%rsi)
   1c295:	0f 84 dc 00 00 00    	je     1c377 <<hyperinterval::float::F32Enclosure>::min_image+0xe7>
   1c29b:	f6 02 01             	testb  $0x1,(%rdx)
   1c29e:	0f 84 cb 00 00 00    	je     1c36f <<hyperinterval::float::F32Enclosure>::min_image+0xdf>
   1c2a4:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1c2a9:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1c2ae:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1c2b2:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1c2b6:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1c2ba:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1c2be:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1c2c2:	66 0f 6f 1d f6 71 fe 	movdqa -0x18e0a(%rip),%xmm3        # 34c0 <__abi_tag+0x31c4>
   1c2c9:	ff 
   1c2ca:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1c2ce:	66 0f eb f3          	por    %xmm3,%xmm6
   1c2d2:	66 0f 6f 3d b6 6f fe 	movdqa -0x1904a(%rip),%xmm7        # 3290 <__abi_tag+0x2f94>
   1c2d9:	ff 
   1c2da:	66 0f db e7          	pand   %xmm7,%xmm4
   1c2de:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1c2e3:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1c2e8:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1c2ed:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1c2f2:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1c2f7:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1c2fc:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1c301:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1c306:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1c30a:	66 0f eb e3          	por    %xmm3,%xmm4
   1c30e:	66 0f db ef          	pand   %xmm7,%xmm5
   1c312:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1c316:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1c31a:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1c31f:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1c323:	66 0f db f2          	pand   %xmm2,%xmm6
   1c327:	66 0f df d4          	pandn  %xmm4,%xmm2
   1c32b:	66 0f eb d6          	por    %xmm6,%xmm2
   1c32f:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1c333:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1c338:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   1c33d:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   1c341:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1c346:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   1c34b:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   1c351:	66 0f db ec          	pand   %xmm4,%xmm5
   1c355:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1c35a:	66 0f eb d5          	por    %xmm5,%xmm2
   1c35e:	66 0f db c2          	pand   %xmm2,%xmm0
   1c362:	66 0f df d1          	pandn  %xmm1,%xmm2
   1c366:	66 0f eb d0          	por    %xmm0,%xmm2
   1c36a:	b8 01 00 00 00       	mov    $0x1,%eax
   1c36f:	89 07                	mov    %eax,(%rdi)
   1c371:	66 0f d6 57 04       	movq   %xmm2,0x4(%rdi)
   1c376:	c3                   	ret
   1c377:	89 07                	mov    %eax,(%rdi)
   1c379:	0f 13 57 04          	movlps %xmm2,0x4(%rdi)
   1c37d:	c3                   	ret
   1c37e:	cc                   	int3
   1c37f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1c380:	b0 01                	mov    $0x1,%al
   1c382:	f6 07 01             	testb  $0x1,(%rdi)
   1c385:	74 50                	je     1c3d7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1c387:	f6 06 01             	testb  $0x1,(%rsi)
   1c38a:	74 49                	je     1c3d5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1c38c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1c38f:	8b 56 04             	mov    0x4(%rsi),%edx
   1c392:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1c397:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1c39b:	41 89 d1             	mov    %edx,%r9d
   1c39e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1c3a5:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1c3ab:	45 29 ca             	sub    %r9d,%r10d
   1c3ae:	85 d2                	test   %edx,%edx
   1c3b0:	4d 0f 49 d0          	cmovns %r8,%r10
   1c3b4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1c3b7:	41 89 c8             	mov    %ecx,%r8d
   1c3ba:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1c3c1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1c3c7:	45 29 c1             	sub    %r8d,%r9d
   1c3ca:	85 c9                	test   %ecx,%ecx
   1c3cc:	4c 0f 49 ca          	cmovns %rdx,%r9
   1c3d0:	45 39 ca             	cmp    %r9d,%r10d
   1c3d3:	76 03                	jbe    1c3d8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1c3d5:	31 c0                	xor    %eax,%eax
   1c3d7:	c3                   	ret
   1c3d8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1c3db:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1c3de:	89 cf                	mov    %ecx,%edi
   1c3e0:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1c3e6:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1c3ec:	41 29 f8             	sub    %edi,%r8d
   1c3ef:	85 c9                	test   %ecx,%ecx
   1c3f1:	4c 0f 49 c2          	cmovns %rdx,%r8
   1c3f5:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1c3f8:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1c3fb:	89 ce                	mov    %ecx,%esi
   1c3fd:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1c403:	29 f0                	sub    %esi,%eax
   1c405:	85 c9                	test   %ecx,%ecx
   1c407:	48 0f 49 c2          	cmovns %rdx,%rax
   1c40b:	41 39 c0             	cmp    %eax,%r8d
   1c40e:	0f 96 c0             	setbe  %al
   1c411:	c3                   	ret
   1c412:	cc                   	int3
   1c413:	cc                   	int3
   1c414:	cc                   	int3
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

<hyperinterval::float::F64Enclosure>::corner_image:
   1c420:	55                   	push   %rbp
   1c421:	41 57                	push   %r15
   1c423:	41 56                	push   %r14
   1c425:	41 55                	push   %r13
   1c427:	41 54                	push   %r12
   1c429:	53                   	push   %rbx
   1c42a:	48 83 ec 58          	sub    $0x58,%rsp
   1c42e:	48 89 fb             	mov    %rdi,%rbx
   1c431:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c435:	0f 85 ac 00 00 00    	jne    1c4e7 <<hyperinterval::float::F64Enclosure>::corner_image+0xc7>
   1c43b:	f6 02 01             	testb  $0x1,(%rdx)
   1c43e:	0f 84 a3 00 00 00    	je     1c4e7 <<hyperinterval::float::F64Enclosure>::corner_image+0xc7>
   1c444:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1c44b:	00 00 80 
   1c44e:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1c455:	00 f0 7f 
   1c458:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1c45c:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1c460:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1c465:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1c469:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1c46d:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1c472:	48 89 e7             	mov    %rsp,%rdi
   1c475:	48 89 ce             	mov    %rcx,%rsi
   1c478:	4c 89 f2             	mov    %r14,%rdx
   1c47b:	4c 89 e1             	mov    %r12,%rcx
   1c47e:	49 89 e8             	mov    %rbp,%r8
   1c481:	e8 ba db ff ff       	call   1a040 <<hyperinterval::ieee::Format>::div>
   1c486:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c48a:	75 48                	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c48c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1c491:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1c496:	48 89 e7             	mov    %rsp,%rdi
   1c499:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c4a0:	00 00 80 
   1c4a3:	4c 89 f2             	mov    %r14,%rdx
   1c4a6:	e8 25 d4 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c4ab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c4af:	75 23                	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c4b1:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1c4b6:	48 89 e7             	mov    %rsp,%rdi
   1c4b9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c4c0:	00 00 80 
   1c4c3:	4c 89 f2             	mov    %r14,%rdx
   1c4c6:	4c 89 e9             	mov    %r13,%rcx
   1c4c9:	e8 02 d4 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c4ce:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c4d2:	74 29                	je     1c4fd <<hyperinterval::float::F64Enclosure>::corner_image+0xdd>
   1c4d4:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1c4da:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1c4de:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c4e5:	eb 07                	jmp    1c4ee <<hyperinterval::float::F64Enclosure>::corner_image+0xce>
   1c4e7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c4ee:	48 83 c4 58          	add    $0x58,%rsp
   1c4f2:	5b                   	pop    %rbx
   1c4f3:	41 5c                	pop    %r12
   1c4f5:	41 5d                	pop    %r13
   1c4f7:	41 5e                	pop    %r14
   1c4f9:	41 5f                	pop    %r15
   1c4fb:	5d                   	pop    %rbp
   1c4fc:	c3                   	ret
   1c4fd:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c504:	00 00 80 
   1c507:	49 8d 3c 37          	lea    (%r15,%rsi,1),%rdi
   1c50b:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
   1c50f:	4c 89 f8             	mov    %r15,%rax
   1c512:	48 21 d0             	and    %rdx,%rax
   1c515:	49 89 f2             	mov    %rsi,%r10
   1c518:	49 29 c2             	sub    %rax,%r10
   1c51b:	4d 85 ff             	test   %r15,%r15
   1c51e:	48 89 f8             	mov    %rdi,%rax
   1c521:	49 0f 48 c2          	cmovs  %r10,%rax
   1c525:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1c52a:	4d 8d 0c 30          	lea    (%r8,%rsi,1),%r9
   1c52e:	4c 89 c1             	mov    %r8,%rcx
   1c531:	48 21 d1             	and    %rdx,%rcx
   1c534:	48 29 ce             	sub    %rcx,%rsi
   1c537:	4d 85 c0             	test   %r8,%r8
   1c53a:	4c 89 c9             	mov    %r9,%rcx
   1c53d:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1c541:	41 b5 01             	mov    $0x1,%r13b
   1c544:	48 39 c8             	cmp    %rcx,%rax
   1c547:	77 91                	ja     1c4da <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1c549:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1c54e:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
   1c553:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
   1c558:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
   1c55d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1c562:	48 89 e7             	mov    %rsp,%rdi
   1c565:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c56c:	00 00 80 
   1c56f:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1c576:	00 f0 7f 
   1c579:	4c 89 f2             	mov    %r14,%rdx
   1c57c:	4c 89 e1             	mov    %r12,%rcx
   1c57f:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1c584:	e8 b7 da ff ff       	call   1a040 <<hyperinterval::ieee::Format>::div>
   1c589:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c58d:	0f 85 41 ff ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c593:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1c598:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1c59d:	48 89 e7             	mov    %rsp,%rdi
   1c5a0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c5a7:	00 00 80 
   1c5aa:	4c 89 f2             	mov    %r14,%rdx
   1c5ad:	e8 1e d3 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c5b2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c5b6:	0f 84 18 ff ff ff    	je     1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c5bc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c5c1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1c5c6:	48 89 e7             	mov    %rsp,%rdi
   1c5c9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c5d0:	00 00 80 
   1c5d3:	4c 89 f2             	mov    %r14,%rdx
   1c5d6:	4c 89 e1             	mov    %r12,%rcx
   1c5d9:	e8 f2 d2 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c5de:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c5e2:	0f 84 ec fe ff ff    	je     1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c5e8:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c5ed:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1c5f4:	00 00 80 
   1c5f7:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
   1c5fc:	4b 8d 0c 01          	lea    (%r9,%r8,1),%rcx
   1c600:	4c 89 ca             	mov    %r9,%rdx
   1c603:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   1c607:	48 21 fa             	and    %rdi,%rdx
   1c60a:	4c 89 c0             	mov    %r8,%rax
   1c60d:	48 29 d0             	sub    %rdx,%rax
   1c610:	4d 85 c9             	test   %r9,%r9
   1c613:	48 0f 49 c1          	cmovns %rcx,%rax
   1c617:	4b 8d 14 04          	lea    (%r12,%r8,1),%rdx
   1c61b:	4c 89 e6             	mov    %r12,%rsi
   1c61e:	48 21 fe             	and    %rdi,%rsi
   1c621:	4c 89 c1             	mov    %r8,%rcx
   1c624:	48 29 f1             	sub    %rsi,%rcx
   1c627:	4d 85 e4             	test   %r12,%r12
   1c62a:	48 0f 49 ca          	cmovns %rdx,%rcx
   1c62e:	48 39 c8             	cmp    %rcx,%rax
   1c631:	0f 87 a3 fe ff ff    	ja     1c4da <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1c637:	4c 89 ca             	mov    %r9,%rdx
   1c63a:	4d 85 ff             	test   %r15,%r15
   1c63d:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1c642:	48 0f 48 74 24 40    	cmovs  0x40(%rsp),%rsi
   1c648:	48 39 c6             	cmp    %rax,%rsi
   1c64b:	49 0f 46 d7          	cmovbe %r15,%rdx
   1c64f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1c654:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1c659:	48 85 c0             	test   %rax,%rax
   1c65c:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1c661:	48 0f 48 54 24 38    	cmovs  0x38(%rsp),%rdx
   1c667:	48 39 ca             	cmp    %rcx,%rdx
   1c66a:	4c 0f 43 e0          	cmovae %rax,%r12
   1c66e:	48 89 e7             	mov    %rsp,%rdi
   1c671:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c678:	00 00 80 
   1c67b:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1c682:	00 f0 7f 
   1c685:	4c 89 f2             	mov    %r14,%rdx
   1c688:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1c68d:	49 89 e8             	mov    %rbp,%r8
   1c690:	e8 ab d9 ff ff       	call   1a040 <<hyperinterval::ieee::Format>::div>
   1c695:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c699:	0f 85 35 fe ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c69f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1c6a4:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1c6a9:	48 89 e7             	mov    %rsp,%rdi
   1c6ac:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c6b3:	00 00 80 
   1c6b6:	4c 89 f2             	mov    %r14,%rdx
   1c6b9:	e8 12 d2 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c6be:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c6c2:	0f 85 0c fe ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c6c8:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1c6cd:	48 89 e7             	mov    %rsp,%rdi
   1c6d0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c6d7:	00 00 80 
   1c6da:	4c 89 f2             	mov    %r14,%rdx
   1c6dd:	48 89 e9             	mov    %rbp,%rcx
   1c6e0:	e8 eb d1 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c6e5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c6e9:	0f 85 e5 fd ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c6ef:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1c6f4:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1c6fb:	00 00 80 
   1c6fe:	49 8d 04 3f          	lea    (%r15,%rdi,1),%rax
   1c702:	4c 89 fa             	mov    %r15,%rdx
   1c705:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
   1c709:	4c 21 c2             	and    %r8,%rdx
   1c70c:	48 89 f9             	mov    %rdi,%rcx
   1c70f:	48 29 d1             	sub    %rdx,%rcx
   1c712:	4d 85 ff             	test   %r15,%r15
   1c715:	48 0f 49 c8          	cmovns %rax,%rcx
   1c719:	48 8d 14 2f          	lea    (%rdi,%rbp,1),%rdx
   1c71d:	48 89 ee             	mov    %rbp,%rsi
   1c720:	4c 21 c6             	and    %r8,%rsi
   1c723:	48 89 f8             	mov    %rdi,%rax
   1c726:	48 29 f0             	sub    %rsi,%rax
   1c729:	48 85 ed             	test   %rbp,%rbp
   1c72c:	48 0f 49 c2          	cmovns %rdx,%rax
   1c730:	48 39 c1             	cmp    %rax,%rcx
   1c733:	0f 87 a1 fd ff ff    	ja     1c4da <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1c739:	4d 89 f9             	mov    %r15,%r9
   1c73c:	4c 8b 54 24 18       	mov    0x18(%rsp),%r10
   1c741:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c748:	00 00 80 
   1c74b:	49 8d 14 32          	lea    (%r10,%rsi,1),%rdx
   1c74f:	4d 89 d3             	mov    %r10,%r11
   1c752:	4d 21 c3             	and    %r8,%r11
   1c755:	48 89 f7             	mov    %rsi,%rdi
   1c758:	4c 29 df             	sub    %r11,%rdi
   1c75b:	4d 85 d2             	test   %r10,%r10
   1c75e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1c762:	48 39 cf             	cmp    %rcx,%rdi
   1c765:	4d 0f 46 ca          	cmovbe %r10,%r9
   1c769:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   1c76e:	49 8d 0c 34          	lea    (%r12,%rsi,1),%rcx
   1c772:	4c 89 e2             	mov    %r12,%rdx
   1c775:	4c 21 c2             	and    %r8,%rdx
   1c778:	48 89 f7             	mov    %rsi,%rdi
   1c77b:	48 29 d7             	sub    %rdx,%rdi
   1c77e:	4d 85 e4             	test   %r12,%r12
   1c781:	48 0f 49 f9          	cmovns %rcx,%rdi
   1c785:	48 39 c7             	cmp    %rax,%rdi
   1c788:	49 0f 43 ec          	cmovae %r12,%rbp
   1c78c:	48 89 e7             	mov    %rsp,%rdi
   1c78f:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1c796:	00 f0 7f 
   1c799:	4c 89 f2             	mov    %r14,%rdx
   1c79c:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1c7a1:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1c7a6:	e8 95 d8 ff ff       	call   1a040 <<hyperinterval::ieee::Format>::div>
   1c7ab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c7af:	0f 85 1f fd ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c7b5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1c7ba:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1c7bf:	48 89 e7             	mov    %rsp,%rdi
   1c7c2:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c7c9:	00 00 80 
   1c7cc:	4c 89 f2             	mov    %r14,%rdx
   1c7cf:	e8 fc d0 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c7d4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c7d8:	0f 85 f6 fc ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c7de:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c7e3:	48 89 e7             	mov    %rsp,%rdi
   1c7e6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c7ed:	00 00 80 
   1c7f0:	4c 89 f2             	mov    %r14,%rdx
   1c7f3:	4c 89 f9             	mov    %r15,%rcx
   1c7f6:	e8 d5 d0 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1c7fb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1c7ff:	0f 85 cf fc ff ff    	jne    1c4d4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1c805:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c80a:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
   1c811:	00 00 80 
   1c814:	4b 8d 0c 0c          	lea    (%r12,%r9,1),%rcx
   1c818:	4c 89 e6             	mov    %r12,%rsi
   1c81b:	4d 8d 41 ff          	lea    -0x1(%r9),%r8
   1c81f:	4c 21 c6             	and    %r8,%rsi
   1c822:	4c 89 ca             	mov    %r9,%rdx
   1c825:	48 29 f2             	sub    %rsi,%rdx
   1c828:	4d 85 e4             	test   %r12,%r12
   1c82b:	48 0f 49 d1          	cmovns %rcx,%rdx
   1c82f:	4a 8d 34 08          	lea    (%rax,%r9,1),%rsi
   1c833:	48 89 c7             	mov    %rax,%rdi
   1c836:	4c 21 c7             	and    %r8,%rdi
   1c839:	4c 89 c9             	mov    %r9,%rcx
   1c83c:	48 29 f9             	sub    %rdi,%rcx
   1c83f:	48 85 c0             	test   %rax,%rax
   1c842:	48 0f 49 ce          	cmovns %rsi,%rcx
   1c846:	48 39 ca             	cmp    %rcx,%rdx
   1c849:	0f 87 8b fc ff ff    	ja     1c4da <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1c84f:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
   1c854:	49 bb 00 00 00 00 00 	movabs $0x8000000000000000,%r11
   1c85b:	00 00 80 
   1c85e:	4b 8d 34 1a          	lea    (%r10,%r11,1),%rsi
   1c862:	4c 89 d7             	mov    %r10,%rdi
   1c865:	4d 8d 4b ff          	lea    -0x1(%r11),%r9
   1c869:	4c 21 cf             	and    %r9,%rdi
   1c86c:	4d 89 d8             	mov    %r11,%r8
   1c86f:	49 29 f8             	sub    %rdi,%r8
   1c872:	4d 85 d2             	test   %r10,%r10
   1c875:	4c 0f 49 c6          	cmovns %rsi,%r8
   1c879:	49 39 d0             	cmp    %rdx,%r8
   1c87c:	4d 0f 46 e2          	cmovbe %r10,%r12
   1c880:	49 8d 14 2b          	lea    (%r11,%rbp,1),%rdx
   1c884:	49 21 e9             	and    %rbp,%r9
   1c887:	4d 29 cb             	sub    %r9,%r11
   1c88a:	48 85 ed             	test   %rbp,%rbp
   1c88d:	4c 0f 49 da          	cmovns %rdx,%r11
   1c891:	49 39 cb             	cmp    %rcx,%r11
   1c894:	48 0f 43 c5          	cmovae %rbp,%rax
   1c898:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1c89f:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1c8a3:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1c8a7:	e9 42 fc ff ff       	jmp    1c4ee <<hyperinterval::float::F64Enclosure>::corner_image+0xce>
   1c8ac:	cc                   	int3
   1c8ad:	cc                   	int3
   1c8ae:	cc                   	int3
   1c8af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1c8b0:	55                   	push   %rbp
   1c8b1:	41 57                	push   %r15
   1c8b3:	41 56                	push   %r14
   1c8b5:	41 55                	push   %r13
   1c8b7:	41 54                	push   %r12
   1c8b9:	53                   	push   %rbx
   1c8ba:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1c8c1:	48 89 fb             	mov    %rdi,%rbx
   1c8c4:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c8c8:	0f 85 0a 01 00 00    	jne    1c9d8 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1c8ce:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1c8d2:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1c8d9:	00 00 80 
   1c8dc:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1c8e3:	00 f0 7f 
   1c8e6:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1c8ed:	ff 0f 00 
   1c8f0:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1c8f4:	4c 89 e9             	mov    %r13,%rcx
   1c8f7:	48 c1 e9 34          	shr    $0x34,%rcx
   1c8fb:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c901:	4c 89 ea             	mov    %r13,%rdx
   1c904:	4c 21 fa             	and    %r15,%rdx
   1c907:	48 85 c9             	test   %rcx,%rcx
   1c90a:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1c90f:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c916:	48 0f 44 c2          	cmove  %rdx,%rax
   1c91a:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1c91f:	0f 44 cd             	cmove  %ebp,%ecx
   1c922:	48 f7 e0             	mul    %rax
   1c925:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c92a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c92f:	48 89 04 24          	mov    %rax,(%rsp)
   1c933:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c937:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1c93c:	48 89 e1             	mov    %rsp,%rcx
   1c93f:	4c 89 f6             	mov    %r14,%rsi
   1c942:	4c 89 c2             	mov    %r8,%rdx
   1c945:	e8 06 d4 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1c94a:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1c94f:	75 76                	jne    1c9c7 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1c951:	4c 89 e2             	mov    %r12,%rdx
   1c954:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1c959:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1c95e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1c963:	48 89 d1             	mov    %rdx,%rcx
   1c966:	48 c1 e9 34          	shr    $0x34,%rcx
   1c96a:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1c970:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1c975:	4c 21 fa             	and    %r15,%rdx
   1c978:	48 85 c9             	test   %rcx,%rcx
   1c97b:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1c980:	48 0f 44 c2          	cmove  %rdx,%rax
   1c984:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1c98b:	0f 44 cd             	cmove  %ebp,%ecx
   1c98e:	48 f7 e0             	mul    %rax
   1c991:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1c996:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1c99b:	48 89 04 24          	mov    %rax,(%rsp)
   1c99f:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1c9a3:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1c9a8:	48 89 e1             	mov    %rsp,%rcx
   1c9ab:	4c 89 f6             	mov    %r14,%rsi
   1c9ae:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1c9b5:	00 f0 7f 
   1c9b8:	48 89 ea             	mov    %rbp,%rdx
   1c9bb:	e8 90 d3 ff ff       	call   19d50 <<hyperinterval::ieee::Format>::rounded>
   1c9c0:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1c9c5:	75 2a                	jne    1c9f1 <<hyperinterval::float::F64Enclosure>::square+0x141>
   1c9c7:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1c9cc:	88 43 08             	mov    %al,0x8(%rbx)
   1c9cf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1c9d6:	eb 07                	jmp    1c9df <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1c9d8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1c9df:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1c9e6:	5b                   	pop    %rbx
   1c9e7:	41 5c                	pop    %r12
   1c9e9:	41 5d                	pop    %r13
   1c9eb:	41 5e                	pop    %r14
   1c9ed:	41 5f                	pop    %r15
   1c9ef:	5d                   	pop    %rbp
   1c9f0:	c3                   	ret
   1c9f1:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1c9f6:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1c9fb:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1ca00:	48 89 e7             	mov    %rsp,%rdi
   1ca03:	4c 89 f6             	mov    %r14,%rsi
   1ca06:	48 89 ea             	mov    %rbp,%rdx
   1ca09:	4c 89 e1             	mov    %r12,%rcx
   1ca0c:	e8 bf ce ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1ca11:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ca15:	74 23                	je     1ca3a <<hyperinterval::float::F64Enclosure>::square+0x18a>
   1ca17:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1ca1c:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1ca21:	48 89 e7             	mov    %rsp,%rdi
   1ca24:	4c 89 f6             	mov    %r14,%rsi
   1ca27:	48 89 ea             	mov    %rbp,%rdx
   1ca2a:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1ca2f:	e8 9c ce ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1ca34:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1ca38:	75 07                	jne    1ca41 <<hyperinterval::float::F64Enclosure>::square+0x191>
   1ca3a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1ca3f:	eb 8b                	jmp    1c9cc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1ca41:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1ca46:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1ca4a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1ca4e:	4c 89 f9             	mov    %r15,%rcx
   1ca51:	48 21 d1             	and    %rdx,%rcx
   1ca54:	4c 89 f7             	mov    %r14,%rdi
   1ca57:	48 29 cf             	sub    %rcx,%rdi
   1ca5a:	4d 85 ff             	test   %r15,%r15
   1ca5d:	48 0f 49 f8          	cmovns %rax,%rdi
   1ca61:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1ca65:	48 89 f1             	mov    %rsi,%rcx
   1ca68:	48 21 d1             	and    %rdx,%rcx
   1ca6b:	4d 89 f4             	mov    %r14,%r12
   1ca6e:	49 29 cc             	sub    %rcx,%r12
   1ca71:	48 85 f6             	test   %rsi,%rsi
   1ca74:	4c 0f 49 e0          	cmovns %rax,%r12
   1ca78:	b0 01                	mov    $0x1,%al
   1ca7a:	4c 39 e7             	cmp    %r12,%rdi
   1ca7d:	0f 87 49 ff ff ff    	ja     1c9cc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1ca83:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1ca88:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1ca8d:	48 89 e7             	mov    %rsp,%rdi
   1ca90:	4c 89 f6             	mov    %r14,%rsi
   1ca93:	48 89 ea             	mov    %rbp,%rdx
   1ca96:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1ca9b:	e8 30 ce ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1caa0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1caa4:	74 23                	je     1cac9 <<hyperinterval::float::F64Enclosure>::square+0x219>
   1caa6:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1caab:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1cab0:	48 89 e7             	mov    %rsp,%rdi
   1cab3:	4c 89 f6             	mov    %r14,%rsi
   1cab6:	48 89 ea             	mov    %rbp,%rdx
   1cab9:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1cabe:	e8 0d ce ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1cac3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cac7:	75 14                	jne    1cadd <<hyperinterval::float::F64Enclosure>::square+0x22d>
   1cac9:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1cace:	88 53 08             	mov    %dl,0x8(%rbx)
   1cad1:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1cad8:	e9 02 ff ff ff       	jmp    1c9df <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1cadd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1cae2:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1cae6:	4c 89 fe             	mov    %r15,%rsi
   1cae9:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1caed:	48 21 fe             	and    %rdi,%rsi
   1caf0:	4c 89 f1             	mov    %r14,%rcx
   1caf3:	48 29 f1             	sub    %rsi,%rcx
   1caf6:	4d 85 ff             	test   %r15,%r15
   1caf9:	48 0f 49 ca          	cmovns %rdx,%rcx
   1cafd:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1cb01:	48 89 c6             	mov    %rax,%rsi
   1cb04:	48 21 fe             	and    %rdi,%rsi
   1cb07:	49 29 f6             	sub    %rsi,%r14
   1cb0a:	48 85 c0             	test   %rax,%rax
   1cb0d:	4c 0f 49 f2          	cmovns %rdx,%r14
   1cb11:	b2 01                	mov    $0x1,%dl
   1cb13:	4c 39 f1             	cmp    %r14,%rcx
   1cb16:	77 b6                	ja     1cace <<hyperinterval::float::F64Enclosure>::square+0x21e>
   1cb18:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1cb1d:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1cb22:	49 0f 47 cf          	cmova  %r15,%rcx
   1cb26:	4d 39 f4             	cmp    %r14,%r12
   1cb29:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1cb2e:	48 0f 42 d0          	cmovb  %rax,%rdx
   1cb32:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1cb39:	00 00 
   1cb3b:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1cb40:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1cb45:	4d 85 ed             	test   %r13,%r13
   1cb48:	7f 7c                	jg     1cbc6 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1cb4a:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1cb50:	79 07                	jns    1cb59 <<hyperinterval::float::F64Enclosure>::square+0x2a9>
   1cb52:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1cb57:	75 6d                	jne    1cbc6 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1cb59:	48 89 e7             	mov    %rsp,%rdi
   1cb5c:	31 f6                	xor    %esi,%esi
   1cb5e:	31 d2                	xor    %edx,%edx
   1cb60:	e8 eb 01 00 00       	call   1cd50 <<hyperinterval::float::F64Enclosure>::from_bits>
   1cb65:	48 8b 0c 24          	mov    (%rsp),%rcx
   1cb69:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1cb6e:	48 83 f9 02          	cmp    $0x2,%rcx
   1cb72:	0f 84 54 fe ff ff    	je     1c9cc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1cb78:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1cb7d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1cb82:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1cb87:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1cb8c:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1cb91:	88 44 24 30          	mov    %al,0x30(%rsp)
   1cb95:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1cb9c:	00 
   1cb9d:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1cba2:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1cba7:	e8 44 00 00 00       	call   1cbf0 <<hyperinterval::float::F64Enclosure>::hull>
   1cbac:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1cbb3:	00 
   1cbb4:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1cbb9:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1cbc0:	00 
   1cbc1:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1cbc6:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1cbcb:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1cbcf:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1cbd4:	48 89 03             	mov    %rax,(%rbx)
   1cbd7:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1cbdc:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1cbe0:	e9 fa fd ff ff       	jmp    1c9df <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1cbe5:	cc                   	int3
   1cbe6:	cc                   	int3
   1cbe7:	cc                   	int3
   1cbe8:	cc                   	int3
   1cbe9:	cc                   	int3
   1cbea:	cc                   	int3
   1cbeb:	cc                   	int3
   1cbec:	cc                   	int3
   1cbed:	cc                   	int3
   1cbee:	cc                   	int3
   1cbef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1cbf0:	4c 8b 02             	mov    (%rdx),%r8
   1cbf3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   1cbf7:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1cbfb:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1cbff:	0f 85 9f 00 00 00    	jne    1cca4 <<hyperinterval::float::F64Enclosure>::hull+0xb4>
   1cc05:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1cc09:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1cc0d:	ba 01 00 00 00       	mov    $0x1,%edx
   1cc12:	49 83 f8 01          	cmp    $0x1,%r8
   1cc16:	0f 85 97 00 00 00    	jne    1ccb3 <<hyperinterval::float::F64Enclosure>::hull+0xc3>
   1cc1c:	41 57                	push   %r15
   1cc1e:	41 56                	push   %r14
   1cc20:	53                   	push   %rbx
   1cc21:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1cc28:	00 00 80 
   1cc2b:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1cc2f:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1cc33:	4c 89 d3             	mov    %r10,%rbx
   1cc36:	4c 21 cb             	and    %r9,%rbx
   1cc39:	4d 89 c6             	mov    %r8,%r14
   1cc3c:	49 29 de             	sub    %rbx,%r14
   1cc3f:	4d 85 d2             	test   %r10,%r10
   1cc42:	4d 0f 49 f3          	cmovns %r11,%r14
   1cc46:	4e 8d 1c 01          	lea    (%rcx,%r8,1),%r11
   1cc4a:	48 89 cb             	mov    %rcx,%rbx
   1cc4d:	4c 21 cb             	and    %r9,%rbx
   1cc50:	4d 89 c7             	mov    %r8,%r15
   1cc53:	49 29 df             	sub    %rbx,%r15
   1cc56:	48 85 c9             	test   %rcx,%rcx
   1cc59:	4d 0f 49 fb          	cmovns %r11,%r15
   1cc5d:	4d 39 fe             	cmp    %r15,%r14
   1cc60:	49 0f 46 ca          	cmovbe %r10,%rcx
   1cc64:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1cc68:	49 89 f3             	mov    %rsi,%r11
   1cc6b:	4d 21 cb             	and    %r9,%r11
   1cc6e:	4c 89 c3             	mov    %r8,%rbx
   1cc71:	4c 29 db             	sub    %r11,%rbx
   1cc74:	48 85 f6             	test   %rsi,%rsi
   1cc77:	49 0f 49 da          	cmovns %r10,%rbx
   1cc7b:	4e 8d 14 00          	lea    (%rax,%r8,1),%r10
   1cc7f:	49 21 c1             	and    %rax,%r9
   1cc82:	4d 29 c8             	sub    %r9,%r8
   1cc85:	48 85 c0             	test   %rax,%rax
   1cc88:	4d 0f 49 c2          	cmovns %r10,%r8
   1cc8c:	4c 39 c3             	cmp    %r8,%rbx
   1cc8f:	48 0f 43 c6          	cmovae %rsi,%rax
   1cc93:	5b                   	pop    %rbx
   1cc94:	41 5e                	pop    %r14
   1cc96:	41 5f                	pop    %r15
   1cc98:	48 89 17             	mov    %rdx,(%rdi)
   1cc9b:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1cc9f:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1cca3:	c3                   	ret
   1cca4:	4c 89 c2             	mov    %r8,%rdx
   1cca7:	48 89 17             	mov    %rdx,(%rdi)
   1ccaa:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1ccae:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1ccb2:	c3                   	ret
   1ccb3:	48 89 f0             	mov    %rsi,%rax
   1ccb6:	4c 89 d1             	mov    %r10,%rcx
   1ccb9:	48 89 17             	mov    %rdx,(%rdi)
   1ccbc:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1ccc0:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1ccc4:	c3                   	ret
   1ccc5:	cc                   	int3
   1ccc6:	cc                   	int3
   1ccc7:	cc                   	int3
   1ccc8:	cc                   	int3
   1ccc9:	cc                   	int3
   1ccca:	cc                   	int3
   1cccb:	cc                   	int3
   1cccc:	cc                   	int3
   1cccd:	cc                   	int3
   1ccce:	cc                   	int3
   1cccf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1ccd0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1ccd3:	75 69                	jne    1cd3e <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1ccd5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1ccdc:	00 00 80 
   1ccdf:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1cce3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1cce7:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1cceb:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1ccef:	49 89 c9             	mov    %rcx,%r9
   1ccf2:	49 21 f1             	and    %rsi,%r9
   1ccf5:	4c 89 c7             	mov    %r8,%rdi
   1ccf8:	4c 29 cf             	sub    %r9,%rdi
   1ccfb:	48 85 c9             	test   %rcx,%rcx
   1ccfe:	48 0f 49 fa          	cmovns %rdx,%rdi
   1cd02:	31 d2                	xor    %edx,%edx
   1cd04:	48 85 ff             	test   %rdi,%rdi
   1cd07:	0f 99 c1             	setns  %cl
   1cd0a:	4c 39 c7             	cmp    %r8,%rdi
   1cd0d:	77 1f                	ja     1cd2e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1cd0f:	48 85 ff             	test   %rdi,%rdi
   1cd12:	40 0f 99 c7          	setns  %dil
   1cd16:	40 80 cf 02          	or     $0x2,%dil
   1cd1a:	48 85 f0             	test   %rsi,%rax
   1cd1d:	88 ca                	mov    %cl,%dl
   1cd1f:	40 0f b6 cf          	movzbl %dil,%ecx
   1cd23:	0f 44 d1             	cmove  %ecx,%edx
   1cd26:	48 85 c0             	test   %rax,%rax
   1cd29:	0f 49 d1             	cmovns %ecx,%edx
   1cd2c:	89 d1                	mov    %edx,%ecx
   1cd2e:	8d 51 04             	lea    0x4(%rcx),%edx
   1cd31:	48 85 c0             	test   %rax,%rax
   1cd34:	0f b6 c9             	movzbl %cl,%ecx
   1cd37:	0f b6 c2             	movzbl %dl,%eax
   1cd3a:	0f 4e c1             	cmovle %ecx,%eax
   1cd3d:	c3                   	ret
   1cd3e:	31 c0                	xor    %eax,%eax
   1cd40:	c3                   	ret
   1cd41:	cc                   	int3
   1cd42:	cc                   	int3
   1cd43:	cc                   	int3
   1cd44:	cc                   	int3
   1cd45:	cc                   	int3
   1cd46:	cc                   	int3
   1cd47:	cc                   	int3
   1cd48:	cc                   	int3
   1cd49:	cc                   	int3
   1cd4a:	cc                   	int3
   1cd4b:	cc                   	int3
   1cd4c:	cc                   	int3
   1cd4d:	cc                   	int3
   1cd4e:	cc                   	int3
   1cd4f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1cd50:	41 57                	push   %r15
   1cd52:	41 56                	push   %r14
   1cd54:	41 55                	push   %r13
   1cd56:	41 54                	push   %r12
   1cd58:	53                   	push   %rbx
   1cd59:	48 83 ec 10          	sub    $0x10,%rsp
   1cd5d:	49 89 d7             	mov    %rdx,%r15
   1cd60:	48 89 f1             	mov    %rsi,%rcx
   1cd63:	48 89 fb             	mov    %rdi,%rbx
   1cd66:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1cd6d:	00 00 80 
   1cd70:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1cd77:	00 f0 7f 
   1cd7a:	48 89 e7             	mov    %rsp,%rdi
   1cd7d:	4c 89 f6             	mov    %r14,%rsi
   1cd80:	4c 89 e2             	mov    %r12,%rdx
   1cd83:	e8 48 cb ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1cd88:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cd8c:	74 1c                	je     1cdaa <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1cd8e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1cd93:	48 89 e7             	mov    %rsp,%rdi
   1cd96:	4c 89 f6             	mov    %r14,%rsi
   1cd99:	4c 89 e2             	mov    %r12,%rdx
   1cd9c:	4c 89 f9             	mov    %r15,%rcx
   1cd9f:	e8 2c cb ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1cda4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1cda8:	75 1d                	jne    1cdc7 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1cdaa:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1cdaf:	88 43 08             	mov    %al,0x8(%rbx)
   1cdb2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1cdb9:	48 83 c4 10          	add    $0x10,%rsp
   1cdbd:	5b                   	pop    %rbx
   1cdbe:	41 5c                	pop    %r12
   1cdc0:	41 5d                	pop    %r13
   1cdc2:	41 5e                	pop    %r14
   1cdc4:	41 5f                	pop    %r15
   1cdc6:	c3                   	ret
   1cdc7:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1cdcb:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1cdcf:	4c 89 ea             	mov    %r13,%rdx
   1cdd2:	48 21 ca             	and    %rcx,%rdx
   1cdd5:	4c 89 f6             	mov    %r14,%rsi
   1cdd8:	48 29 d6             	sub    %rdx,%rsi
   1cddb:	4d 85 ed             	test   %r13,%r13
   1cdde:	48 0f 49 f0          	cmovns %rax,%rsi
   1cde2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1cde7:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1cdeb:	48 21 c1             	and    %rax,%rcx
   1cdee:	49 29 ce             	sub    %rcx,%r14
   1cdf1:	48 85 c0             	test   %rax,%rax
   1cdf4:	4c 0f 49 f2          	cmovns %rdx,%r14
   1cdf8:	4c 39 f6             	cmp    %r14,%rsi
   1cdfb:	76 06                	jbe    1ce03 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1cdfd:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1ce01:	eb af                	jmp    1cdb2 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1ce03:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ce0a:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1ce0e:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ce12:	eb a5                	jmp    1cdb9 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1ce14:	cc                   	int3
   1ce15:	cc                   	int3
   1ce16:	cc                   	int3
   1ce17:	cc                   	int3
   1ce18:	cc                   	int3
   1ce19:	cc                   	int3
   1ce1a:	cc                   	int3
   1ce1b:	cc                   	int3
   1ce1c:	cc                   	int3
   1ce1d:	cc                   	int3
   1ce1e:	cc                   	int3
   1ce1f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1ce20:	45 31 c0             	xor    %r8d,%r8d
   1ce23:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ce27:	0f 85 d5 00 00 00    	jne    1cf02 <<hyperinterval::float::F64Enclosure>::intersection+0xe2>
   1ce2d:	f6 02 01             	testb  $0x1,(%rdx)
   1ce30:	0f 84 c0 00 00 00    	je     1cef6 <<hyperinterval::float::F64Enclosure>::intersection+0xd6>
   1ce36:	41 56                	push   %r14
   1ce38:	53                   	push   %rbx
   1ce39:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1ce3d:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1ce41:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1ce45:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1ce4c:	00 00 80 
   1ce4f:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   1ce53:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1ce57:	49 89 c3             	mov    %rax,%r11
   1ce5a:	4d 21 c3             	and    %r8,%r11
   1ce5d:	48 89 d3             	mov    %rdx,%rbx
   1ce60:	4c 29 db             	sub    %r11,%rbx
   1ce63:	48 85 c0             	test   %rax,%rax
   1ce66:	48 0f 49 d9          	cmovns %rcx,%rbx
   1ce6a:	49 8d 0c 12          	lea    (%r10,%rdx,1),%rcx
   1ce6e:	4d 89 d3             	mov    %r10,%r11
   1ce71:	4d 21 c3             	and    %r8,%r11
   1ce74:	49 89 d6             	mov    %rdx,%r14
   1ce77:	4d 29 de             	sub    %r11,%r14
   1ce7a:	4d 85 d2             	test   %r10,%r10
   1ce7d:	4c 0f 49 f1          	cmovns %rcx,%r14
   1ce81:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1ce85:	4c 39 f3             	cmp    %r14,%rbx
   1ce88:	49 0f 42 c2          	cmovb  %r10,%rax
   1ce8c:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1ce90:	49 89 ca             	mov    %rcx,%r10
   1ce93:	4d 21 c2             	and    %r8,%r10
   1ce96:	49 89 d3             	mov    %rdx,%r11
   1ce99:	4d 29 d3             	sub    %r10,%r11
   1ce9c:	48 85 c9             	test   %rcx,%rcx
   1ce9f:	4c 0f 49 de          	cmovns %rsi,%r11
   1cea3:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1cea7:	4d 89 ca             	mov    %r9,%r10
   1ceaa:	4d 21 c2             	and    %r8,%r10
   1cead:	48 89 d3             	mov    %rdx,%rbx
   1ceb0:	4c 29 d3             	sub    %r10,%rbx
   1ceb3:	4d 85 c9             	test   %r9,%r9
   1ceb6:	48 0f 49 de          	cmovns %rsi,%rbx
   1ceba:	49 39 db             	cmp    %rbx,%r11
   1cebd:	49 0f 47 c9          	cmova  %r9,%rcx
   1cec1:	48 8d 34 10          	lea    (%rax,%rdx,1),%rsi
   1cec5:	49 89 c1             	mov    %rax,%r9
   1cec8:	4d 21 c1             	and    %r8,%r9
   1cecb:	49 89 d2             	mov    %rdx,%r10
   1cece:	4d 29 ca             	sub    %r9,%r10
   1ced1:	48 85 c0             	test   %rax,%rax
   1ced4:	4c 0f 49 d6          	cmovns %rsi,%r10
   1ced8:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1cedc:	49 21 c8             	and    %rcx,%r8
   1cedf:	4c 29 c2             	sub    %r8,%rdx
   1cee2:	48 85 c9             	test   %rcx,%rcx
   1cee5:	48 0f 49 d6          	cmovns %rsi,%rdx
   1cee9:	45 31 c0             	xor    %r8d,%r8d
   1ceec:	49 39 d2             	cmp    %rdx,%r10
   1ceef:	41 0f 96 c0          	setbe  %r8b
   1cef3:	5b                   	pop    %rbx
   1cef4:	41 5e                	pop    %r14
   1cef6:	4c 89 07             	mov    %r8,(%rdi)
   1cef9:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1cefd:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1cf01:	c3                   	ret
   1cf02:	4c 89 07             	mov    %r8,(%rdi)
   1cf05:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1cf09:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1cf0d:	c3                   	ret
   1cf0e:	cc                   	int3
   1cf0f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1cf10:	41 56                	push   %r14
   1cf12:	53                   	push   %rbx
   1cf13:	48 83 ec 18          	sub    $0x18,%rsp
   1cf17:	49 89 fe             	mov    %rdi,%r14
   1cf1a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1cf21:	00 00 80 
   1cf24:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1cf29:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1cf2e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1cf35:	00 f0 7f 
   1cf38:	48 89 de             	mov    %rbx,%rsi
   1cf3b:	e8 90 c9 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1cf40:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1cf45:	3c 01                	cmp    $0x1,%al
   1cf47:	75 0d                	jne    1cf56 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1cf49:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1cf4e:	48 83 c4 18          	add    $0x18,%rsp
   1cf52:	5b                   	pop    %rbx
   1cf53:	41 5e                	pop    %r14
   1cf55:	c3                   	ret
   1cf56:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1cf5a:	75 40                	jne    1cf9c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1cf5c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1cf61:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1cf65:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1cf69:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1cf6d:	49 89 d0             	mov    %rdx,%r8
   1cf70:	49 21 c8             	and    %rcx,%r8
   1cf73:	49 89 d9             	mov    %rbx,%r9
   1cf76:	4d 29 c1             	sub    %r8,%r9
   1cf79:	48 85 d2             	test   %rdx,%rdx
   1cf7c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1cf80:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1cf84:	49 89 f0             	mov    %rsi,%r8
   1cf87:	49 21 c8             	and    %rcx,%r8
   1cf8a:	48 89 da             	mov    %rbx,%rdx
   1cf8d:	4c 29 c2             	sub    %r8,%rdx
   1cf90:	48 85 f6             	test   %rsi,%rsi
   1cf93:	48 0f 49 d7          	cmovns %rdi,%rdx
   1cf97:	49 39 d1             	cmp    %rdx,%r9
   1cf9a:	76 0a                	jbe    1cfa6 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1cf9c:	31 d2                	xor    %edx,%edx
   1cf9e:	48 83 c4 18          	add    $0x18,%rsp
   1cfa2:	5b                   	pop    %rbx
   1cfa3:	41 5e                	pop    %r14
   1cfa5:	c3                   	ret
   1cfa6:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1cfaa:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1cfae:	48 21 f1             	and    %rsi,%rcx
   1cfb1:	48 29 cb             	sub    %rcx,%rbx
   1cfb4:	48 85 f6             	test   %rsi,%rsi
   1cfb7:	48 0f 49 df          	cmovns %rdi,%rbx
   1cfbb:	48 39 da             	cmp    %rbx,%rdx
   1cfbe:	0f 96 c2             	setbe  %dl
   1cfc1:	48 83 c4 18          	add    $0x18,%rsp
   1cfc5:	5b                   	pop    %rbx
   1cfc6:	41 5e                	pop    %r14
   1cfc8:	c3                   	ret
   1cfc9:	cc                   	int3
   1cfca:	cc                   	int3
   1cfcb:	cc                   	int3
   1cfcc:	cc                   	int3
   1cfcd:	cc                   	int3
   1cfce:	cc                   	int3
   1cfcf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1cfd0:	b0 01                	mov    $0x1,%al
   1cfd2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1cfd6:	0f 85 8b 00 00 00    	jne    1d067 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1cfdc:	f6 06 01             	testb  $0x1,(%rsi)
   1cfdf:	0f 84 80 00 00 00    	je     1d065 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1cfe5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1cfe9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1cfed:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1cff4:	00 00 80 
   1cff7:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1cffb:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1cfff:	4d 89 c2             	mov    %r8,%r10
   1d002:	49 21 ca             	and    %rcx,%r10
   1d005:	49 89 c3             	mov    %rax,%r11
   1d008:	4d 29 d3             	sub    %r10,%r11
   1d00b:	4d 85 c0             	test   %r8,%r8
   1d00e:	4d 0f 49 d9          	cmovns %r9,%r11
   1d012:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1d016:	49 89 d1             	mov    %rdx,%r9
   1d019:	49 21 c9             	and    %rcx,%r9
   1d01c:	49 89 c2             	mov    %rax,%r10
   1d01f:	4d 29 ca             	sub    %r9,%r10
   1d022:	48 85 d2             	test   %rdx,%rdx
   1d025:	4d 0f 49 d0          	cmovns %r8,%r10
   1d029:	4d 39 d3             	cmp    %r10,%r11
   1d02c:	73 37                	jae    1d065 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1d02e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1d032:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1d036:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1d03a:	49 89 d0             	mov    %rdx,%r8
   1d03d:	49 21 c8             	and    %rcx,%r8
   1d040:	49 89 c1             	mov    %rax,%r9
   1d043:	4d 29 c1             	sub    %r8,%r9
   1d046:	48 85 d2             	test   %rdx,%rdx
   1d049:	4c 0f 49 cf          	cmovns %rdi,%r9
   1d04d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1d051:	48 21 f1             	and    %rsi,%rcx
   1d054:	48 29 c8             	sub    %rcx,%rax
   1d057:	48 85 f6             	test   %rsi,%rsi
   1d05a:	48 0f 49 c2          	cmovns %rdx,%rax
   1d05e:	49 39 c1             	cmp    %rax,%r9
   1d061:	0f 92 c0             	setb   %al
   1d064:	c3                   	ret
   1d065:	31 c0                	xor    %eax,%eax
   1d067:	c3                   	ret
   1d068:	cc                   	int3
   1d069:	cc                   	int3
   1d06a:	cc                   	int3
   1d06b:	cc                   	int3
   1d06c:	cc                   	int3
   1d06d:	cc                   	int3
   1d06e:	cc                   	int3
   1d06f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1d070:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1d074:	0f 85 c8 00 00 00    	jne    1d142 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1d07a:	f6 02 01             	testb  $0x1,(%rdx)
   1d07d:	0f 84 bf 00 00 00    	je     1d142 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1d083:	55                   	push   %rbp
   1d084:	41 57                	push   %r15
   1d086:	41 56                	push   %r14
   1d088:	41 55                	push   %r13
   1d08a:	41 54                	push   %r12
   1d08c:	53                   	push   %rbx
   1d08d:	48 83 ec 18          	sub    $0x18,%rsp
   1d091:	48 89 fd             	mov    %rdi,%rbp
   1d094:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1d098:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1d09c:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1d0a0:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1d0a7:	00 00 80 
   1d0aa:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1d0b1:	00 f0 7f 
   1d0b4:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1d0b8:	48 89 e7             	mov    %rsp,%rdi
   1d0bb:	48 89 de             	mov    %rbx,%rsi
   1d0be:	4c 89 f2             	mov    %r14,%rdx
   1d0c1:	e8 2a e1 ff ff       	call   1b1f0 <<hyperinterval::ieee::Format>::add>
   1d0c6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1d0ca:	74 57                	je     1d123 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1d0cc:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1d0d1:	48 89 e7             	mov    %rsp,%rdi
   1d0d4:	48 89 de             	mov    %rbx,%rsi
   1d0d7:	4c 89 f2             	mov    %r14,%rdx
   1d0da:	4c 89 f9             	mov    %r15,%rcx
   1d0dd:	4d 89 e0             	mov    %r12,%r8
   1d0e0:	e8 0b e1 ff ff       	call   1b1f0 <<hyperinterval::ieee::Format>::add>
   1d0e5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1d0e9:	74 38                	je     1d123 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1d0eb:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1d0f0:	48 89 e7             	mov    %rsp,%rdi
   1d0f3:	48 89 de             	mov    %rbx,%rsi
   1d0f6:	4c 89 f2             	mov    %r14,%rdx
   1d0f9:	4c 89 e9             	mov    %r13,%rcx
   1d0fc:	e8 cf c7 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1d101:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1d105:	74 1c                	je     1d123 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1d107:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1d10c:	48 89 e7             	mov    %rsp,%rdi
   1d10f:	48 89 de             	mov    %rbx,%rsi
   1d112:	4c 89 f2             	mov    %r14,%rdx
   1d115:	4c 89 f9             	mov    %r15,%rcx
   1d118:	e8 b3 c7 ff ff       	call   198d0 <<hyperinterval::ieee::Format>::finite>
   1d11d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1d121:	75 27                	jne    1d14a <<hyperinterval::float::F64Enclosure>::add+0xda>
   1d123:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1d128:	88 45 08             	mov    %al,0x8(%rbp)
   1d12b:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1d132:	00 
   1d133:	48 83 c4 18          	add    $0x18,%rsp
   1d137:	5b                   	pop    %rbx
   1d138:	41 5c                	pop    %r12
   1d13a:	41 5d                	pop    %r13
   1d13c:	41 5e                	pop    %r14
   1d13e:	41 5f                	pop    %r15
   1d140:	5d                   	pop    %rbp
   1d141:	c3                   	ret
   1d142:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1d149:	c3                   	ret
   1d14a:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1d14e:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1d152:	4c 89 e2             	mov    %r12,%rdx
   1d155:	48 21 ca             	and    %rcx,%rdx
   1d158:	48 89 de             	mov    %rbx,%rsi
   1d15b:	48 29 d6             	sub    %rdx,%rsi
   1d15e:	4d 85 e4             	test   %r12,%r12
   1d161:	48 0f 49 f0          	cmovns %rax,%rsi
   1d165:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1d16a:	48 8d 14 18          	lea    (%rax,%rbx,1),%rdx
   1d16e:	48 21 c1             	and    %rax,%rcx
   1d171:	48 29 cb             	sub    %rcx,%rbx
   1d174:	48 85 c0             	test   %rax,%rax
   1d177:	48 0f 49 da          	cmovns %rdx,%rbx
   1d17b:	48 39 de             	cmp    %rbx,%rsi
   1d17e:	76 06                	jbe    1d186 <<hyperinterval::float::F64Enclosure>::add+0x116>
   1d180:	c6 45 08 01          	movb   $0x1,0x8(%rbp)
   1d184:	eb a5                	jmp    1d12b <<hyperinterval::float::F64Enclosure>::add+0xbb>
   1d186:	48 c7 45 00 01 00 00 	movq   $0x1,0x0(%rbp)
   1d18d:	00 
   1d18e:	4c 89 65 08          	mov    %r12,0x8(%rbp)
   1d192:	48 89 45 10          	mov    %rax,0x10(%rbp)
   1d196:	eb 9b                	jmp    1d133 <<hyperinterval::float::F64Enclosure>::add+0xc3>
   1d198:	cc                   	int3
   1d199:	cc                   	int3
   1d19a:	cc                   	int3
   1d19b:	cc                   	int3
   1d19c:	cc                   	int3
   1d19d:	cc                   	int3
   1d19e:	cc                   	int3
   1d19f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1d1a0:	83 3a 01             	cmpl   $0x1,(%rdx)
   1d1a3:	0f 85 77 f2 ff ff    	jne    1c420 <<hyperinterval::float::F64Enclosure>::corner_image>
   1d1a9:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1d1ae:	0f 8f 6c f2 ff ff    	jg     1c420 <<hyperinterval::float::F64Enclosure>::corner_image>
   1d1b4:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1d1b8:	48 85 c0             	test   %rax,%rax
   1d1bb:	0f 99 c1             	setns  %cl
   1d1be:	48 d1 e0             	shl    $1,%rax
   1d1c1:	48 85 c0             	test   %rax,%rax
   1d1c4:	0f 94 c0             	sete   %al
   1d1c7:	08 c8                	or     %cl,%al
   1d1c9:	0f 84 51 f2 ff ff    	je     1c420 <<hyperinterval::float::F64Enclosure>::corner_image>
   1d1cf:	c6 47 08 04          	movb   $0x4,0x8(%rdi)
   1d1d3:	48 c7 07 02 00 00 00 	movq   $0x2,(%rdi)
   1d1da:	c3                   	ret
   1d1db:	cc                   	int3
   1d1dc:	cc                   	int3
   1d1dd:	cc                   	int3
   1d1de:	cc                   	int3
   1d1df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sub:
   1d1e0:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1d1e4:	75 30                	jne    1d216 <<hyperinterval::float::F64Enclosure>::sub+0x36>
   1d1e6:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1d1ea:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1d1ee:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1d1f5:	00 00 80 
   1d1f8:	48 89 d1             	mov    %rdx,%rcx
   1d1fb:	48 31 c1             	xor    %rax,%rcx
   1d1fe:	48 85 d2             	test   %rdx,%rdx
   1d201:	48 0f 44 ca          	cmove  %rdx,%rcx
   1d205:	4c 31 c0             	xor    %r8,%rax
   1d208:	4d 85 c0             	test   %r8,%r8
   1d20b:	49 0f 44 c0          	cmove  %r8,%rax
   1d20f:	ba 01 00 00 00       	mov    $0x1,%edx
   1d214:	eb 02                	jmp    1d218 <<hyperinterval::float::F64Enclosure>::sub+0x38>
   1d216:	31 d2                	xor    %edx,%edx
   1d218:	48 83 ec 18          	sub    $0x18,%rsp
   1d21c:	48 89 14 24          	mov    %rdx,(%rsp)
   1d220:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1d225:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1d22a:	48 89 e2             	mov    %rsp,%rdx
   1d22d:	e8 3e fe ff ff       	call   1d070 <<hyperinterval::float::F64Enclosure>::add>
   1d232:	48 83 c4 18          	add    $0x18,%rsp
   1d236:	c3                   	ret
   1d237:	cc                   	int3
   1d238:	cc                   	int3
   1d239:	cc                   	int3
   1d23a:	cc                   	int3
   1d23b:	cc                   	int3
   1d23c:	cc                   	int3
   1d23d:	cc                   	int3
   1d23e:	cc                   	int3
   1d23f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::disjoint:
   1d240:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1d244:	b0 01                	mov    $0x1,%al
   1d246:	0f 84 8b 00 00 00    	je     1d2d7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1d24c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1d250:	0f 84 81 00 00 00    	je     1d2d7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1d256:	53                   	push   %rbx
   1d257:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1d25e:	00 00 80 
   1d261:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1d265:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1d269:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1d26d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1d271:	4d 89 c3             	mov    %r8,%r11
   1d274:	49 21 d3             	and    %rdx,%r11
   1d277:	48 89 cb             	mov    %rcx,%rbx
   1d27a:	4c 29 db             	sub    %r11,%rbx
   1d27d:	4d 85 c0             	test   %r8,%r8
   1d280:	49 0f 49 da          	cmovns %r10,%rbx
   1d284:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1d288:	4d 89 ca             	mov    %r9,%r10
   1d28b:	49 21 d2             	and    %rdx,%r10
   1d28e:	49 89 cb             	mov    %rcx,%r11
   1d291:	4d 29 d3             	sub    %r10,%r11
   1d294:	4d 85 c9             	test   %r9,%r9
   1d297:	4d 0f 49 d8          	cmovns %r8,%r11
   1d29b:	4c 39 db             	cmp    %r11,%rbx
   1d29e:	5b                   	pop    %rbx
   1d29f:	72 36                	jb     1d2d7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1d2a1:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1d2a5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1d2a9:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1d2ad:	49 89 f0             	mov    %rsi,%r8
   1d2b0:	49 21 d0             	and    %rdx,%r8
   1d2b3:	49 89 c9             	mov    %rcx,%r9
   1d2b6:	4d 29 c1             	sub    %r8,%r9
   1d2b9:	48 85 f6             	test   %rsi,%rsi
   1d2bc:	4c 0f 49 cf          	cmovns %rdi,%r9
   1d2c0:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1d2c4:	48 21 c2             	and    %rax,%rdx
   1d2c7:	48 29 d1             	sub    %rdx,%rcx
   1d2ca:	48 85 c0             	test   %rax,%rax
   1d2cd:	48 0f 49 ce          	cmovns %rsi,%rcx
   1d2d1:	49 39 c9             	cmp    %rcx,%r9
   1d2d4:	0f 92 c0             	setb   %al
   1d2d7:	c3                   	ret
   1d2d8:	cc                   	int3
   1d2d9:	cc                   	int3
   1d2da:	cc                   	int3
   1d2db:	cc                   	int3
   1d2dc:	cc                   	int3
   1d2dd:	cc                   	int3
   1d2de:	cc                   	int3
   1d2df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1d2e0:	31 c0                	xor    %eax,%eax
   1d2e2:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1d2e6:	0f 84 8c 00 00 00    	je     1d378 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1d2ec:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1d2f0:	0f 84 82 00 00 00    	je     1d378 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1d2f6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1d2fd:	00 00 80 
   1d300:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1d304:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1d308:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1d30c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1d310:	49 89 d2             	mov    %rdx,%r10
   1d313:	49 21 ca             	and    %rcx,%r10
   1d316:	49 89 c3             	mov    %rax,%r11
   1d319:	4d 29 d3             	sub    %r10,%r11
   1d31c:	48 85 d2             	test   %rdx,%rdx
   1d31f:	4d 0f 49 d9          	cmovns %r9,%r11
   1d323:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1d327:	4d 89 c1             	mov    %r8,%r9
   1d32a:	49 21 c9             	and    %rcx,%r9
   1d32d:	49 89 c2             	mov    %rax,%r10
   1d330:	4d 29 ca             	sub    %r9,%r10
   1d333:	4d 85 c0             	test   %r8,%r8
   1d336:	4c 0f 49 d2          	cmovns %rdx,%r10
   1d33a:	4d 39 d3             	cmp    %r10,%r11
   1d33d:	73 03                	jae    1d342 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1d33f:	31 c0                	xor    %eax,%eax
   1d341:	c3                   	ret
   1d342:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1d346:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1d34a:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1d34e:	49 89 f0             	mov    %rsi,%r8
   1d351:	49 21 c8             	and    %rcx,%r8
   1d354:	49 89 c1             	mov    %rax,%r9
   1d357:	4d 29 c1             	sub    %r8,%r9
   1d35a:	48 85 f6             	test   %rsi,%rsi
   1d35d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1d361:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1d365:	48 21 d1             	and    %rdx,%rcx
   1d368:	48 29 c8             	sub    %rcx,%rax
   1d36b:	48 85 d2             	test   %rdx,%rdx
   1d36e:	48 0f 49 c6          	cmovns %rsi,%rax
   1d372:	49 39 c1             	cmp    %rax,%r9
   1d375:	0f 93 c0             	setae  %al
   1d378:	c3                   	ret
   1d379:	cc                   	int3
   1d37a:	cc                   	int3
   1d37b:	cc                   	int3
   1d37c:	cc                   	int3
   1d37d:	cc                   	int3
   1d37e:	cc                   	int3
   1d37f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::max_image:
   1d380:	45 31 c0             	xor    %r8d,%r8d
   1d383:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1d387:	0f 85 a3 00 00 00    	jne    1d430 <<hyperinterval::float::F64Enclosure>::max_image+0xb0>
   1d38d:	f6 02 01             	testb  $0x1,(%rdx)
   1d390:	0f 84 8e 00 00 00    	je     1d424 <<hyperinterval::float::F64Enclosure>::max_image+0xa4>
   1d396:	41 56                	push   %r14
   1d398:	53                   	push   %rbx
   1d399:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1d39d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1d3a1:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1d3a5:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1d3a9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1d3b0:	00 00 80 
   1d3b3:	4c 8d 14 31          	lea    (%rcx,%rsi,1),%r10
   1d3b7:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1d3bb:	49 89 cb             	mov    %rcx,%r11
   1d3be:	4d 21 c3             	and    %r8,%r11
   1d3c1:	48 89 f3             	mov    %rsi,%rbx
   1d3c4:	4c 29 db             	sub    %r11,%rbx
   1d3c7:	48 85 c9             	test   %rcx,%rcx
   1d3ca:	49 0f 49 da          	cmovns %r10,%rbx
   1d3ce:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1d3d2:	4d 89 cb             	mov    %r9,%r11
   1d3d5:	4d 21 c3             	and    %r8,%r11
   1d3d8:	49 89 f6             	mov    %rsi,%r14
   1d3db:	4d 29 de             	sub    %r11,%r14
   1d3de:	4d 85 c9             	test   %r9,%r9
   1d3e1:	4d 0f 49 f2          	cmovns %r10,%r14
   1d3e5:	4c 39 f3             	cmp    %r14,%rbx
   1d3e8:	49 0f 42 c9          	cmovb  %r9,%rcx
   1d3ec:	4c 8d 0c 30          	lea    (%rax,%rsi,1),%r9
   1d3f0:	49 89 c2             	mov    %rax,%r10
   1d3f3:	4d 21 c2             	and    %r8,%r10
   1d3f6:	49 89 f3             	mov    %rsi,%r11
   1d3f9:	4d 29 d3             	sub    %r10,%r11
   1d3fc:	48 85 c0             	test   %rax,%rax
   1d3ff:	4d 0f 49 d9          	cmovns %r9,%r11
   1d403:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1d407:	49 21 d0             	and    %rdx,%r8
   1d40a:	4c 29 c6             	sub    %r8,%rsi
   1d40d:	48 85 d2             	test   %rdx,%rdx
   1d410:	49 0f 49 f1          	cmovns %r9,%rsi
   1d414:	49 39 f3             	cmp    %rsi,%r11
   1d417:	48 0f 42 c2          	cmovb  %rdx,%rax
   1d41b:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d421:	5b                   	pop    %rbx
   1d422:	41 5e                	pop    %r14
   1d424:	4c 89 07             	mov    %r8,(%rdi)
   1d427:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1d42b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1d42f:	c3                   	ret
   1d430:	4c 89 07             	mov    %r8,(%rdi)
   1d433:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1d437:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1d43b:	c3                   	ret
   1d43c:	cc                   	int3
   1d43d:	cc                   	int3
   1d43e:	cc                   	int3
   1d43f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::min_image:
   1d440:	45 31 c0             	xor    %r8d,%r8d
   1d443:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1d447:	0f 85 a3 00 00 00    	jne    1d4f0 <<hyperinterval::float::F64Enclosure>::min_image+0xb0>
   1d44d:	f6 02 01             	testb  $0x1,(%rdx)
   1d450:	0f 84 8e 00 00 00    	je     1d4e4 <<hyperinterval::float::F64Enclosure>::min_image+0xa4>
   1d456:	41 56                	push   %r14
   1d458:	53                   	push   %rbx
   1d459:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1d45d:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1d461:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1d465:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1d46c:	00 00 80 
   1d46f:	4c 8d 14 31          	lea    (%rcx,%rsi,1),%r10
   1d473:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1d477:	49 89 cb             	mov    %rcx,%r11
   1d47a:	4d 21 c3             	and    %r8,%r11
   1d47d:	48 89 f3             	mov    %rsi,%rbx
   1d480:	4c 29 db             	sub    %r11,%rbx
   1d483:	48 85 c9             	test   %rcx,%rcx
   1d486:	49 0f 49 da          	cmovns %r10,%rbx
   1d48a:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1d48e:	4d 89 cb             	mov    %r9,%r11
   1d491:	4d 21 c3             	and    %r8,%r11
   1d494:	49 89 f6             	mov    %rsi,%r14
   1d497:	4d 29 de             	sub    %r11,%r14
   1d49a:	4d 85 c9             	test   %r9,%r9
   1d49d:	4d 0f 49 f2          	cmovns %r10,%r14
   1d4a1:	4c 39 f3             	cmp    %r14,%rbx
   1d4a4:	49 0f 47 c9          	cmova  %r9,%rcx
   1d4a8:	4c 8d 0c 30          	lea    (%rax,%rsi,1),%r9
   1d4ac:	49 89 c2             	mov    %rax,%r10
   1d4af:	4d 21 c2             	and    %r8,%r10
   1d4b2:	49 89 f3             	mov    %rsi,%r11
   1d4b5:	4d 29 d3             	sub    %r10,%r11
   1d4b8:	48 85 c0             	test   %rax,%rax
   1d4bb:	4d 0f 49 d9          	cmovns %r9,%r11
   1d4bf:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1d4c3:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1d4c7:	49 21 d0             	and    %rdx,%r8
   1d4ca:	4c 29 c6             	sub    %r8,%rsi
   1d4cd:	48 85 d2             	test   %rdx,%rdx
   1d4d0:	49 0f 49 f1          	cmovns %r9,%rsi
   1d4d4:	49 39 f3             	cmp    %rsi,%r11
   1d4d7:	48 0f 47 c2          	cmova  %rdx,%rax
   1d4db:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1d4e1:	5b                   	pop    %rbx
   1d4e2:	41 5e                	pop    %r14
   1d4e4:	4c 89 07             	mov    %r8,(%rdi)
   1d4e7:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1d4eb:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1d4ef:	c3                   	ret
   1d4f0:	4c 89 07             	mov    %r8,(%rdi)
   1d4f3:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1d4f7:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1d4fb:	c3                   	ret
   1d4fc:	cc                   	int3
   1d4fd:	cc                   	int3
   1d4fe:	cc                   	int3
   1d4ff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1d500:	b0 01                	mov    $0x1,%al
   1d502:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1d506:	75 50                	jne    1d558 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1d508:	f6 06 01             	testb  $0x1,(%rsi)
   1d50b:	74 49                	je     1d556 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1d50d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1d511:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1d515:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1d51c:	00 00 80 
   1d51f:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1d523:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1d527:	4d 89 c2             	mov    %r8,%r10
   1d52a:	49 21 ca             	and    %rcx,%r10
   1d52d:	49 89 c3             	mov    %rax,%r11
   1d530:	4d 29 d3             	sub    %r10,%r11
   1d533:	4d 85 c0             	test   %r8,%r8
   1d536:	4d 0f 49 d9          	cmovns %r9,%r11
   1d53a:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1d53e:	49 89 d1             	mov    %rdx,%r9
   1d541:	49 21 c9             	and    %rcx,%r9
   1d544:	49 89 c2             	mov    %rax,%r10
   1d547:	4d 29 ca             	sub    %r9,%r10
   1d54a:	48 85 d2             	test   %rdx,%rdx
   1d54d:	4d 0f 49 d0          	cmovns %r8,%r10
   1d551:	4d 39 d3             	cmp    %r10,%r11
   1d554:	76 03                	jbe    1d559 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1d556:	31 c0                	xor    %eax,%eax
   1d558:	c3                   	ret
   1d559:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1d55d:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1d561:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1d565:	49 89 d0             	mov    %rdx,%r8
   1d568:	49 21 c8             	and    %rcx,%r8
   1d56b:	49 89 c1             	mov    %rax,%r9
   1d56e:	4d 29 c1             	sub    %r8,%r9
   1d571:	48 85 d2             	test   %rdx,%rdx
   1d574:	4c 0f 49 cf          	cmovns %rdi,%r9
   1d578:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1d57c:	48 21 f1             	and    %rsi,%rcx
   1d57f:	48 29 c8             	sub    %rcx,%rax
   1d582:	48 85 f6             	test   %rsi,%rsi
   1d585:	48 0f 49 c2          	cmovns %rdx,%rax
   1d589:	49 39 c1             	cmp    %rax,%r9
   1d58c:	0f 96 c0             	setbe  %al
   1d58f:	c3                   	ret

__udivti3:
   4f000:	49 89 d0             	mov    %rdx,%r8
   4f003:	48 85 c9             	test   %rcx,%rcx
   4f006:	74 76                	je     4f07e <__udivti3+0x7e>
   4f008:	53                   	push   %rbx
   4f009:	4c 0f bd c9          	bsr    %rcx,%r9
   4f00d:	44 89 ca             	mov    %r9d,%edx
   4f010:	83 f2 3f             	xor    $0x3f,%edx
   4f013:	b0 40                	mov    $0x40,%al
   4f015:	28 d0                	sub    %dl,%al
   4f017:	4c 89 c2             	mov    %r8,%rdx
   4f01a:	49 89 cb             	mov    %rcx,%r11
   4f01d:	89 c1                	mov    %eax,%ecx
   4f01f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4f023:	4d 89 da             	mov    %r11,%r10
   4f026:	49 d3 ea             	shr    %cl,%r10
   4f029:	a8 40                	test   $0x40,%al
   4f02b:	4c 0f 44 d2          	cmove  %rdx,%r10
   4f02f:	48 89 f8             	mov    %rdi,%rax
   4f032:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   4f037:	48 89 f2             	mov    %rsi,%rdx
   4f03a:	48 d1 ea             	shr    $1,%rdx
   4f03d:	49 f7 f2             	div    %r10
   4f040:	49 89 c2             	mov    %rax,%r10
   4f043:	44 89 c9             	mov    %r9d,%ecx
   4f046:	49 d3 ea             	shr    %cl,%r10
   4f049:	31 c9                	xor    %ecx,%ecx
   4f04b:	49 83 ea 01          	sub    $0x1,%r10
   4f04f:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4f053:	4c 89 db             	mov    %r11,%rbx
   4f056:	4c 89 c0             	mov    %r8,%rax
   4f059:	49 f7 e2             	mul    %r10
   4f05c:	49 89 c1             	mov    %rax,%r9
   4f05f:	4c 89 d0             	mov    %r10,%rax
   4f062:	49 0f af da          	imul   %r10,%rbx
   4f066:	48 01 da             	add    %rbx,%rdx
   4f069:	4c 29 cf             	sub    %r9,%rdi
   4f06c:	48 19 d6             	sbb    %rdx,%rsi
   4f06f:	4c 39 c7             	cmp    %r8,%rdi
   4f072:	4c 19 de             	sbb    %r11,%rsi
   4f075:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4f079:	5b                   	pop    %rbx
   4f07a:	48 89 ca             	mov    %rcx,%rdx
   4f07d:	c3                   	ret
   4f07e:	4c 39 c6             	cmp    %r8,%rsi
   4f081:	73 0f                	jae    4f092 <__udivti3+0x92>
   4f083:	48 89 f8             	mov    %rdi,%rax
   4f086:	48 89 f2             	mov    %rsi,%rdx
   4f089:	49 f7 f0             	div    %r8
   4f08c:	31 c9                	xor    %ecx,%ecx
   4f08e:	48 89 ca             	mov    %rcx,%rdx
   4f091:	c3                   	ret
   4f092:	48 89 f0             	mov    %rsi,%rax
   4f095:	4c 09 c0             	or     %r8,%rax
   4f098:	48 c1 e8 20          	shr    $0x20,%rax
   4f09c:	74 15                	je     4f0b3 <__udivti3+0xb3>
   4f09e:	48 89 f0             	mov    %rsi,%rax
   4f0a1:	31 d2                	xor    %edx,%edx
   4f0a3:	49 f7 f0             	div    %r8
   4f0a6:	48 89 c1             	mov    %rax,%rcx
   4f0a9:	48 89 f8             	mov    %rdi,%rax
   4f0ac:	49 f7 f0             	div    %r8
   4f0af:	48 89 ca             	mov    %rcx,%rdx
   4f0b2:	c3                   	ret
   4f0b3:	89 f0                	mov    %esi,%eax
   4f0b5:	31 d2                	xor    %edx,%edx
   4f0b7:	41 f7 f0             	div    %r8d
   4f0ba:	89 c1                	mov    %eax,%ecx
   4f0bc:	48 89 f8             	mov    %rdi,%rax
   4f0bf:	49 f7 f0             	div    %r8
   4f0c2:	48 89 ca             	mov    %rcx,%rdx
   4f0c5:	c3                   	ret

Disassembly of section .init:
