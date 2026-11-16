
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/baseline-timing-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000112470 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE>:
  112470:	55                   	push   %rbp
  112471:	41 57                	push   %r15
  112473:	41 56                	push   %r14
  112475:	41 55                	push   %r13
  112477:	41 54                	push   %r12
  112479:	53                   	push   %rbx
  11247a:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
  112481:	4c 89 8c 24 c0 00 00 	mov    %r9,0xc0(%rsp)
  112488:	00 
  112489:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  11248e:	89 cd                	mov    %ecx,%ebp
  112490:	48 89 94 24 d0 00 00 	mov    %rdx,0xd0(%rsp)
  112497:	00 
  112498:	49 89 fd             	mov    %rdi,%r13
  11249b:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  1124a2:	00 
  1124a3:	48 8b 48 10          	mov    0x10(%rax),%rcx
  1124a7:	48 03 8c 24 78 01 00 	add    0x178(%rsp),%rcx
  1124ae:	00 
  1124af:	72 7b                	jb     11252c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbc>
  1124b1:	48 8b 46 48          	mov    0x48(%rsi),%rax
  1124b5:	48 3b 08             	cmp    (%rax),%rcx
  1124b8:	73 72                	jae    11252c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbc>
  1124ba:	48 8b 48 10          	mov    0x10(%rax),%rcx
  1124be:	48 85 c9             	test   %rcx,%rcx
  1124c1:	74 0e                	je     1124d1 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x61>
  1124c3:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  1124c7:	b1 07                	mov    $0x7,%cl
  1124c9:	84 d2                	test   %dl,%dl
  1124cb:	0f 85 b5 09 00 00    	jne    112e86 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa16>
  1124d1:	48 8b 48 08          	mov    0x8(%rax),%rcx
  1124d5:	48 85 c9             	test   %rcx,%rcx
  1124d8:	0f 84 a6 09 00 00    	je     112e84 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa14>
  1124de:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  1124e3:	48 ff c9             	dec    %rcx
  1124e6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  1124ea:	ff 15 20 97 1a 00    	call   *0x1a9720(%rip)        # 2bbc10 <_DYNAMIC+0x298>
  1124f0:	bf 10 00 00 00       	mov    $0x10,%edi
  1124f5:	be 08 00 00 00       	mov    $0x8,%esi
  1124fa:	ff 15 18 97 1a 00    	call   *0x1a9718(%rip)        # 2bbc18 <_DYNAMIC+0x2a0>
  112500:	48 85 c0             	test   %rax,%rax
  112503:	0f 84 5e 0b 00 00    	je     113067 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbf7>
  112509:	48 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%rcx
  112510:	00 
  112511:	48 89 08             	mov    %rcx,(%rax)
  112514:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  112518:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
  11251f:	00 
  112520:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  112525:	b8 01 00 00 00       	mov    $0x1,%eax
  11252a:	eb 32                	jmp    11255e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xee>
  11252c:	41 c6 45 00 05       	movb   $0x5,0x0(%r13)
  112531:	4c 89 e8             	mov    %r13,%rax
  112534:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
  11253b:	5b                   	pop    %rbx
  11253c:	41 5c                	pop    %r12
  11253e:	41 5d                	pop    %r13
  112540:	41 5e                	pop    %r14
  112542:	41 5f                	pop    %r15
  112544:	5d                   	pop    %rbp
  112545:	c3                   	ret
  112546:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  11254d:	00 00 00 
  112550:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  112555:	48 85 c0             	test   %rax,%rax
  112558:	0f 84 7e 09 00 00    	je     112edc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa6c>
  11255e:	48 ff c8             	dec    %rax
  112561:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  112566:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  11256b:	48 c1 e0 04          	shl    $0x4,%rax
  11256f:	4c 8b 34 01          	mov    (%rcx,%rax,1),%r14
  112573:	0f b6 5c 01 08       	movzbl 0x8(%rcx,%rax,1),%ebx
  112578:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  11257d:	48 8b 40 48          	mov    0x48(%rax),%rax
  112581:	48 8b 48 10          	mov    0x10(%rax),%rcx
  112585:	48 85 c9             	test   %rcx,%rcx
  112588:	74 0c                	je     112596 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x126>
  11258a:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  11258e:	84 c9                	test   %cl,%cl
  112590:	0f 85 df 09 00 00    	jne    112f75 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb05>
  112596:	48 8b 48 08          	mov    0x8(%rax),%rcx
  11259a:	48 85 c9             	test   %rcx,%rcx
  11259d:	0f 84 28 09 00 00    	je     112ecb <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa5b>
  1125a3:	48 ff c9             	dec    %rcx
  1125a6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  1125aa:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  1125b1:	00 
  1125b2:	48 8b 00             	mov    (%rax),%rax
  1125b5:	48 85 c0             	test   %rax,%rax
  1125b8:	0f 84 92 00 00 00    	je     112650 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e0>
  1125be:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  1125c5:	00 
  1125c6:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  1125ca:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  1125d1:	89 f7                	mov    %esi,%edi
  1125d3:	c1 e7 04             	shl    $0x4,%edi
  1125d6:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  1125dd:	49 89 c0             	mov    %rax,%r8
  1125e0:	eb 27                	jmp    112609 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x199>
  1125e2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1125e9:	1f 84 00 00 00 00 00 
  1125f0:	41 0f 97 c1          	seta   %r9b
  1125f4:	41 80 d9 00          	sbb    $0x0,%r9b
  1125f8:	49 83 c0 10          	add    $0x10,%r8
  1125fc:	48 ff c2             	inc    %rdx
  1125ff:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  112603:	41 80 f9 01          	cmp    $0x1,%r9b
  112607:	75 17                	jne    112620 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1b0>
  112609:	48 85 ff             	test   %rdi,%rdi
  11260c:	74 22                	je     112630 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1c0>
  11260e:	4d 3b 30             	cmp    (%r8),%r14
  112611:	75 dd                	jne    1125f0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x180>
  112613:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  112617:	eb d7                	jmp    1125f0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x180>
  112619:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  112620:	41 0f b6 f1          	movzbl %r9b,%esi
  112624:	85 f6                	test   %esi,%esi
  112626:	75 0b                	jne    112633 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1c3>
  112628:	e9 23 ff ff ff       	jmp    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  11262d:	0f 1f 00             	nopl   (%rax)
  112630:	48 89 f2             	mov    %rsi,%rdx
  112633:	48 83 e9 01          	sub    $0x1,%rcx
  112637:	72 17                	jb     112650 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e0>
  112639:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  112640:	00 
  112641:	eb 87                	jmp    1125ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x15a>
  112643:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  11264a:	84 00 00 00 00 00 
  112650:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  112655:	48 8b 70 28          	mov    0x28(%rax),%rsi
  112659:	49 39 f6             	cmp    %rsi,%r14
  11265c:	0f 83 30 0a 00 00    	jae    113092 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc22>
  112662:	48 8b 40 20          	mov    0x20(%rax),%rax
  112666:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  11266a:	48 c1 e1 04          	shl    $0x4,%rcx
  11266e:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  112672:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  112676:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  11267a:	48 83 f8 16          	cmp    $0x16,%rax
  11267e:	b8 00 00 00 00       	mov    $0x0,%eax
  112683:	48 0f 42 c8          	cmovb  %rax,%rcx
  112687:	48 8d 15 0a f2 ef ff 	lea    -0x100df6(%rip),%rdx        # 11898 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa86>
  11268e:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  112692:	48 01 d0             	add    %rdx,%rax
  112695:	ff e0                	jmp    *%rax
  112697:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  11269c:	e8 cf 0d 00 00       	call   113470 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17h1bbed13f28b0ca94E.llvm.15530680740981780625>
  1126a1:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  1126a6:	e9 8f 00 00 00       	jmp    11273a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2ca>
  1126ab:	48 8b 46 18          	mov    0x18(%rsi),%rax
  1126af:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  1126b4:	f3 0f 7f 44 24 68    	movdqu %xmm0,0x68(%rsp)
  1126ba:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  1126bf:	b0 17                	mov    $0x17,%al
  1126c1:	eb 73                	jmp    112736 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2c6>
  1126c3:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  1126c7:	88 44 24 78          	mov    %al,0x78(%rsp)
  1126cb:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  1126d0:	f3 0f 7f 44 24 68    	movdqu %xmm0,0x68(%rsp)
  1126d6:	b0 18                	mov    $0x18,%al
  1126d8:	eb 5c                	jmp    112736 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2c6>
  1126da:	44 8b 7e 20          	mov    0x20(%rsi),%r15d
  1126de:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  1126e5:	00 00 80 
  1126e8:	48 89 c8             	mov    %rcx,%rax
  1126eb:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  1126ef:	74 24                	je     112715 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2a5>
  1126f1:	48 83 c6 08          	add    $0x8,%rsi
  1126f5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1126fa:	ff 15 88 96 1a 00    	call   *0x1a9688(%rip)        # 2bbd88 <_DYNAMIC+0x410>
  112700:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  112705:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  11270a:	0f 10 01             	movups (%rcx),%xmm0
  11270d:	0f 29 84 24 90 00 00 	movaps %xmm0,0x90(%rsp)
  112714:	00 
  112715:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  11271a:	66 0f 6f 84 24 90 00 	movdqa 0x90(%rsp),%xmm0
  112721:	00 00 
  112723:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  112728:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  11272c:	44 89 bc 24 80 00 00 	mov    %r15d,0x80(%rsp)
  112733:	00 
  112734:	b0 16                	mov    $0x16,%al
  112736:	88 44 24 60          	mov    %al,0x60(%rsp)
  11273a:	0f b6 c8             	movzbl %al,%ecx
  11273d:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  112741:	80 f9 16             	cmp    $0x16,%cl
  112744:	b9 00 00 00 00       	mov    $0x0,%ecx
  112749:	48 0f 42 c1          	cmovb  %rcx,%rax
  11274d:	84 db                	test   %bl,%bl
  11274f:	74 37                	je     112788 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x318>
  112751:	48 8d 0d 50 f1 ef ff 	lea    -0x100eb0(%rip),%rcx        # 118a8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa96>
  112758:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  11275c:	48 01 c8             	add    %rcx,%rax
  11275f:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  112764:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  11276b:	00 
  11276c:	ff e0                	jmp    *%rax
  11276e:	39 ac 24 80 00 00 00 	cmp    %ebp,0x80(%rsp)
  112775:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  11277a:	48 0f 44 94 24 c0 00 	cmove  0xc0(%rsp),%rdx
  112781:	00 00 
  112783:	e9 7f 05 00 00       	jmp    112d07 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x897>
  112788:	83 f8 02             	cmp    $0x2,%eax
  11278b:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  112792:	00 
  112793:	73 0a                	jae    11279f <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x32f>
  112795:	45 31 ff             	xor    %r15d,%r15d
  112798:	31 db                	xor    %ebx,%ebx
  11279a:	e9 c3 03 00 00       	jmp    112b62 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6f2>
  11279f:	83 f8 02             	cmp    $0x2,%eax
  1127a2:	0f 85 95 03 00 00    	jne    112b3d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6cd>
  1127a8:	bb 01 00 00 00       	mov    $0x1,%ebx
  1127ad:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  1127b2:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  1127b9:	00 
  1127ba:	45 31 ff             	xor    %r15d,%r15d
  1127bd:	e9 a0 03 00 00       	jmp    112b62 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6f2>
  1127c2:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  1127c7:	f3 0f 6f 44 24 78    	movdqu 0x78(%rsp),%xmm0
  1127cd:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  1127d2:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  1127d8:	eb 11                	jmp    1127eb <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x37b>
  1127da:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  1127df:	41 bf 02 00 00 00    	mov    $0x2,%r15d
  1127e5:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  1127eb:	66 0f 7f 84 24 f0 00 	movdqa %xmm0,0xf0(%rsp)
  1127f2:	00 00 
  1127f4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  1127f9:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  112800:	00 
  112801:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  112808:	00 
  112809:	31 db                	xor    %ebx,%ebx
  11280b:	eb 27                	jmp    112834 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3c4>
  11280d:	4c 89 e0             	mov    %r12,%rax
  112810:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  112817:	00 
  112818:	48 89 84 dc d8 00 00 	mov    %rax,0xd8(%rsp,%rbx,8)
  11281f:	00 
  112820:	4c 89 eb             	mov    %r13,%rbx
  112823:	4d 39 fd             	cmp    %r15,%r13
  112826:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  11282d:	00 
  11282e:	0f 84 e1 02 00 00    	je     112b15 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6a5>
  112834:	48 8b 01             	mov    (%rcx),%rax
  112837:	48 85 c0             	test   %rax,%rax
  11283a:	0f 84 37 08 00 00    	je     113077 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc07>
  112840:	4c 8d 6b 01          	lea    0x1(%rbx),%r13
  112844:	48 8b 8c dc f0 00 00 	mov    0xf0(%rsp,%rbx,8),%rcx
  11284b:	00 
  11284c:	48 8b 94 24 70 01 00 	mov    0x170(%rsp),%rdx
  112853:	00 
  112854:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  112858:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  11285f:	41 89 f8             	mov    %edi,%r8d
  112862:	41 c1 e0 04          	shl    $0x4,%r8d
  112866:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  11286d:	49 89 c1             	mov    %rax,%r9
  112870:	eb 27                	jmp    112899 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x429>
  112872:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  112879:	1f 84 00 00 00 00 00 
  112880:	41 0f 97 c2          	seta   %r10b
  112884:	41 80 da 00          	sbb    $0x0,%r10b
  112888:	49 83 c1 10          	add    $0x10,%r9
  11288c:	48 ff c6             	inc    %rsi
  11288f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  112893:	41 80 fa 01          	cmp    $0x1,%r10b
  112897:	75 17                	jne    1128b0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x440>
  112899:	4d 85 c0             	test   %r8,%r8
  11289c:	74 22                	je     1128c0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x450>
  11289e:	49 3b 09             	cmp    (%r9),%rcx
  1128a1:	75 dd                	jne    112880 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x410>
  1128a3:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  1128a7:	eb d7                	jmp    112880 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x410>
  1128a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  1128b0:	41 0f b6 fa          	movzbl %r10b,%edi
  1128b4:	85 ff                	test   %edi,%edi
  1128b6:	75 0b                	jne    1128c3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x453>
  1128b8:	eb 26                	jmp    1128e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x470>
  1128ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  1128c0:	48 89 fe             	mov    %rdi,%rsi
  1128c3:	48 83 ea 01          	sub    $0x1,%rdx
  1128c7:	0f 82 aa 07 00 00    	jb     113077 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc07>
  1128cd:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  1128d4:	00 
  1128d5:	eb 81                	jmp    112858 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3e8>
  1128d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  1128de:	00 00 
  1128e0:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  1128e7:	00 
  1128e8:	4c 3b 64 24 20       	cmp    0x20(%rsp),%r12
  1128ed:	0f 84 2d ff ff ff    	je     112820 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3b0>
  1128f3:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  1128f8:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  1128fc:	48 83 f9 16          	cmp    $0x16,%rcx
  112900:	b9 00 00 00 00       	mov    $0x0,%ecx
  112905:	48 0f 42 c1          	cmovb  %rcx,%rax
  112909:	48 83 f8 02          	cmp    $0x2,%rax
  11290d:	0f 84 7d 00 00 00    	je     112990 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x520>
  112913:	83 f8 03             	cmp    $0x3,%eax
  112916:	0f 85 30 07 00 00    	jne    11304c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbdc>
  11291c:	0f b6 44 24 78       	movzbl 0x78(%rsp),%eax
  112921:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  112928:	00 00 80 
  11292b:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
  112932:	00 
  112933:	c7 84 24 b0 00 00 00 	movl   $0x0,0xb0(%rsp)
  11293a:	00 00 00 00 
  11293e:	c6 84 24 90 00 00 00 	movb   $0x16,0x90(%rsp)
  112945:	16 
  112946:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  11294b:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  112952:	00 
  112953:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  112958:	48 8d 0d 59 ef ef ff 	lea    -0x1010a7(%rip),%rcx        # 118b8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xaa6>
  11295f:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  112963:	48 01 c8             	add    %rcx,%rax
  112966:	ff e0                	jmp    *%rax
  112968:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  11296f:	00 
  112970:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  112977:	00 
  112978:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  11297d:	ff 15 45 94 1a 00    	call   *0x1a9445(%rip)        # 2bbdc8 <_DYNAMIC+0x450>
  112983:	eb 43                	jmp    1129c8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  112985:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  11298c:	00 00 00 00 
  112990:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  112995:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  11299a:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  1129a1:	00 00 80 
  1129a4:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  1129a9:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  1129b0:	00 
  1129b1:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  1129b6:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  1129bd:	00 
  1129be:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  1129c3:	e8 18 3a fe ff       	call   f63e0 <_ZN10hypersolve18expression_program8jacobian5unary17h2b423a6394b7a769E>
  1129c8:	f3 0f 6f 84 24 08 01 	movdqu 0x108(%rsp),%xmm0
  1129cf:	00 00 
  1129d1:	0f 10 8c 24 18 01 00 	movups 0x118(%rsp),%xmm1
  1129d8:	00 
  1129d9:	0f 10 94 24 28 01 00 	movups 0x128(%rsp),%xmm2
  1129e0:	00 
  1129e1:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  1129e6:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  1129eb:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  1129f1:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  1129f8:	00 
  1129f9:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  1129fe:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112a03:	89 d9                	mov    %ebx,%ecx
  112a05:	4c 8d 84 24 f0 00 00 	lea    0xf0(%rsp),%r8
  112a0c:	00 
  112a0d:	4d 89 f9             	mov    %r15,%r9
  112a10:	ff b4 24 c0 00 00 00 	push   0xc0(%rsp)
  112a17:	ff 74 24 28          	push   0x28(%rsp)
  112a1b:	e8 a0 3f fe ff       	call   f69c0 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17ha766717089845c05E>
  112a20:	48 83 c4 10          	add    $0x10,%rsp
  112a24:	0f b6 8c 24 90 00 00 	movzbl 0x90(%rsp),%ecx
  112a2b:	00 
  112a2c:	80 f9 0d             	cmp    $0xd,%cl
  112a2f:	0f 85 5a 04 00 00    	jne    112e8f <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa1f>
  112a35:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
  112a3c:	00 
  112a3d:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  112a42:	48 89 d0             	mov    %rdx,%rax
  112a45:	48 39 d1             	cmp    %rdx,%rcx
  112a48:	0f 84 c2 fd ff ff    	je     112810 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3a0>
  112a4e:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  112a55:	00 
  112a56:	48 39 c1             	cmp    %rax,%rcx
  112a59:	0f 84 ae fd ff ff    	je     11280d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x39d>
  112a5f:	49 39 c4             	cmp    %rax,%r12
  112a62:	75 68                	jne    112acc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x65c>
  112a64:	48 89 c8             	mov    %rcx,%rax
  112a67:	e9 a4 fd ff ff       	jmp    112810 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3a0>
  112a6c:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  112a73:	00 
  112a74:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  112a7b:	00 
  112a7c:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112a81:	ff 15 39 93 1a 00    	call   *0x1a9339(%rip)        # 2bbdc0 <_DYNAMIC+0x448>
  112a87:	e9 3c ff ff ff       	jmp    1129c8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  112a8c:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  112a93:	00 
  112a94:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  112a9b:	00 
  112a9c:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112aa1:	ff 15 f9 93 1a 00    	call   *0x1a93f9(%rip)        # 2bbea0 <_DYNAMIC+0x528>
  112aa7:	e9 1c ff ff ff       	jmp    1129c8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  112aac:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  112ab3:	00 
  112ab4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  112abb:	00 
  112abc:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112ac1:	ff 15 11 93 1a 00    	call   *0x1a9311(%rip)        # 2bbdd8 <_DYNAMIC+0x460>
  112ac7:	e9 fc fe ff ff       	jmp    1129c8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  112acc:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  112ad1:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  112ad6:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  112adb:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  112ae0:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  112ae7:	00 
  112ae8:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  112aed:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112af2:	e8 89 3d fe ff       	call   f6880 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  112af7:	0f b6 8c 24 90 00 00 	movzbl 0x90(%rsp),%ecx
  112afe:	00 
  112aff:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  112b06:	00 
  112b07:	80 f9 0d             	cmp    $0xd,%cl
  112b0a:	0f 84 08 fd ff ff    	je     112818 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3a8>
  112b10:	e9 eb 04 00 00       	jmp    113000 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb90>
  112b15:	48 8b 84 24 d8 00 00 	mov    0xd8(%rsp),%rax
  112b1c:	00 
  112b1d:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  112b24:	00 
  112b25:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  112b2a:	48 39 f0             	cmp    %rsi,%rax
  112b2d:	0f 85 7a 01 00 00    	jne    112cad <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x83d>
  112b33:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  112b38:	e9 ca 01 00 00       	jmp    112d07 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x897>
  112b3d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  112b42:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  112b49:	00 
  112b4a:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  112b4f:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  112b56:	00 
  112b57:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  112b5d:	bb 01 00 00 00       	mov    $0x1,%ebx
  112b62:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  112b66:	48 03 94 24 78 01 00 	add    0x178(%rsp),%rdx
  112b6d:	00 
  112b6e:	0f 82 5e 03 00 00    	jb     112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112b74:	48 03 54 24 10       	add    0x10(%rsp),%rdx
  112b79:	0f 82 53 03 00 00    	jb     112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112b7f:	4a 8d 04 3b          	lea    (%rbx,%r15,1),%rax
  112b83:	48 ff c0             	inc    %rax
  112b86:	48 01 c2             	add    %rax,%rdx
  112b89:	0f 82 43 03 00 00    	jb     112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112b8f:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  112b94:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  112b98:	48 3b 11             	cmp    (%rcx),%rdx
  112b9b:	0f 87 31 03 00 00    	ja     112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112ba1:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  112ba5:	48 85 d2             	test   %rdx,%rdx
  112ba8:	74 0c                	je     112bb6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x746>
  112baa:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  112bae:	84 d2                	test   %dl,%dl
  112bb0:	0f 85 cb 03 00 00    	jne    112f81 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb11>
  112bb6:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
  112bba:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  112bbe:	48 39 d6             	cmp    %rdx,%rsi
  112bc1:	0f 83 b6 03 00 00    	jae    112f7d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb0d>
  112bc7:	48 29 c2             	sub    %rax,%rdx
  112bca:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  112bce:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  112bd3:	4c 3b 24 24          	cmp    (%rsp),%r12
  112bd7:	75 09                	jne    112be2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x772>
  112bd9:	48 89 e7             	mov    %rsp,%rdi
  112bdc:	ff 15 4e 92 1a 00    	call   *0x1a924e(%rip)        # 2bbe30 <_DYNAMIC+0x4b8>
  112be2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  112be7:	4c 89 e1             	mov    %r12,%rcx
  112bea:	48 c1 e1 04          	shl    $0x4,%rcx
  112bee:	4c 89 34 08          	mov    %r14,(%rax,%rcx,1)
  112bf2:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  112bf7:	4d 8d 74 24 01       	lea    0x1(%r12),%r14
  112bfc:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  112c01:	4d 85 ff             	test   %r15,%r15
  112c04:	74 36                	je     112c3c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7cc>
  112c06:	4c 3b 34 24          	cmp    (%rsp),%r14
  112c0a:	75 09                	jne    112c15 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7a5>
  112c0c:	48 89 e7             	mov    %rsp,%rdi
  112c0f:	ff 15 1b 92 1a 00    	call   *0x1a921b(%rip)        # 2bbe30 <_DYNAMIC+0x4b8>
  112c15:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  112c1a:	49 c1 e6 04          	shl    $0x4,%r14
  112c1e:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  112c25:	00 
  112c26:	4a 89 0c 30          	mov    %rcx,(%rax,%r14,1)
  112c2a:	42 c6 44 30 08 00    	movb   $0x0,0x8(%rax,%r14,1)
  112c30:	49 83 c4 02          	add    $0x2,%r12
  112c34:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
  112c39:	4d 89 e6             	mov    %r12,%r14
  112c3c:	48 85 db             	test   %rbx,%rbx
  112c3f:	74 34                	je     112c75 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x805>
  112c41:	4c 3b 34 24          	cmp    (%rsp),%r14
  112c45:	75 09                	jne    112c50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7e0>
  112c47:	48 89 e7             	mov    %rsp,%rdi
  112c4a:	ff 15 e0 91 1a 00    	call   *0x1a91e0(%rip)        # 2bbe30 <_DYNAMIC+0x4b8>
  112c50:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  112c55:	4c 89 f1             	mov    %r14,%rcx
  112c58:	48 c1 e1 04          	shl    $0x4,%rcx
  112c5c:	48 8b 94 24 c8 00 00 	mov    0xc8(%rsp),%rdx
  112c63:	00 
  112c64:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  112c68:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  112c6d:	49 ff c6             	inc    %r14
  112c70:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  112c75:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  112c7a:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  112c7e:	48 83 f9 16          	cmp    $0x16,%rcx
  112c82:	b9 00 00 00 00       	mov    $0x0,%ecx
  112c87:	48 0f 42 c1          	cmovb  %rcx,%rax
  112c8b:	48 83 f8 01          	cmp    $0x1,%rax
  112c8f:	0f 84 cc 01 00 00    	je     112e61 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9f1>
  112c95:	48 85 c0             	test   %rax,%rax
  112c98:	0f 85 b2 f8 ff ff    	jne    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  112c9e:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112ca3:	e8 68 04 00 00       	call   113110 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.15530680740981780625>
  112ca8:	e9 a3 f8 ff ff       	jmp    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  112cad:	48 39 f2             	cmp    %rsi,%rdx
  112cb0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  112cb5:	75 05                	jne    112cbc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x84c>
  112cb7:	48 89 c2             	mov    %rax,%rdx
  112cba:	eb 4b                	jmp    112d07 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x897>
  112cbc:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  112cc1:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  112cc6:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  112ccb:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  112cd0:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  112cd7:	00 
  112cd8:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  112cdd:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112ce2:	e8 99 3b fe ff       	call   f6880 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  112ce7:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
  112cee:	00 
  112cef:	3c 0d                	cmp    $0xd,%al
  112cf1:	0f 85 29 03 00 00    	jne    113020 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbb0>
  112cf7:	48 8b 94 24 98 00 00 	mov    0x98(%rsp),%rdx
  112cfe:	00 
  112cff:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  112d06:	00 
  112d07:	48 8b 41 10          	mov    0x10(%rcx),%rax
  112d0b:	48 03 84 24 78 01 00 	add    0x178(%rsp),%rax
  112d12:	00 
  112d13:	0f 82 b9 01 00 00    	jb     112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112d19:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  112d1e:	48 01 c1             	add    %rax,%rcx
  112d21:	48 39 c1             	cmp    %rax,%rcx
  112d24:	0f 82 a8 01 00 00    	jb     112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112d2a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  112d2f:	48 8b 40 48          	mov    0x48(%rax),%rax
  112d33:	48 3b 08             	cmp    (%rax),%rcx
  112d36:	0f 83 96 01 00 00    	jae    112ed2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  112d3c:	48 8b 48 10          	mov    0x10(%rax),%rcx
  112d40:	48 85 c9             	test   %rcx,%rcx
  112d43:	74 0c                	je     112d51 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8e1>
  112d45:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  112d49:	84 c9                	test   %cl,%cl
  112d4b:	0f 85 30 02 00 00    	jne    112f81 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb11>
  112d51:	48 8b 48 08          	mov    0x8(%rax),%rcx
  112d55:	48 85 c9             	test   %rcx,%rcx
  112d58:	0f 84 1f 02 00 00    	je     112f7d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb0d>
  112d5e:	48 ff c9             	dec    %rcx
  112d61:	48 89 48 08          	mov    %rcx,0x8(%rax)
  112d65:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  112d6c:	00 
  112d6d:	48 8b 01             	mov    (%rcx),%rax
  112d70:	48 85 c0             	test   %rax,%rax
  112d73:	74 7b                	je     112df0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x980>
  112d75:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  112d79:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  112d80:	41 89 f8             	mov    %edi,%r8d
  112d83:	41 c1 e0 04          	shl    $0x4,%r8d
  112d87:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  112d8e:	49 89 c1             	mov    %rax,%r9
  112d91:	eb 26                	jmp    112db9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x949>
  112d93:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  112d9a:	84 00 00 00 00 00 
  112da0:	41 0f 97 c2          	seta   %r10b
  112da4:	41 80 da 00          	sbb    $0x0,%r10b
  112da8:	49 83 c1 10          	add    $0x10,%r9
  112dac:	48 ff c1             	inc    %rcx
  112daf:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  112db3:	41 80 fa 01          	cmp    $0x1,%r10b
  112db7:	75 10                	jne    112dc9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x959>
  112db9:	4d 85 c0             	test   %r8,%r8
  112dbc:	74 15                	je     112dd3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x963>
  112dbe:	4d 3b 31             	cmp    (%r9),%r14
  112dc1:	75 dd                	jne    112da0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x930>
  112dc3:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  112dc7:	eb d7                	jmp    112da0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x930>
  112dc9:	41 0f b6 fa          	movzbl %r10b,%edi
  112dcd:	85 ff                	test   %edi,%edi
  112dcf:	75 05                	jne    112dd6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x966>
  112dd1:	eb 13                	jmp    112de6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x976>
  112dd3:	48 89 f9             	mov    %rdi,%rcx
  112dd6:	48 83 ee 01          	sub    $0x1,%rsi
  112dda:	72 16                	jb     112df2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x982>
  112ddc:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  112de3:	00 
  112de4:	eb 93                	jmp    112d79 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x909>
  112de6:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  112ded:	00 
  112dee:	eb 3d                	jmp    112e2d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9bd>
  112df0:	31 c0                	xor    %eax,%eax
  112df2:	48 8b b4 24 70 01 00 	mov    0x170(%rsp),%rsi
  112df9:	00 
  112dfa:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  112dff:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
  112e04:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  112e08:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  112e0d:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  112e14:	00 00 
  112e16:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  112e1b:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  112e22:	00 
  112e23:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  112e28:	e8 33 09 00 00       	call   113760 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h9e96ea47bee8ef08E>
  112e2d:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  112e32:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  112e36:	48 83 f9 16          	cmp    $0x16,%rcx
  112e3a:	b9 00 00 00 00       	mov    $0x0,%ecx
  112e3f:	48 0f 42 c1          	cmovb  %rcx,%rax
  112e43:	48 83 f8 01          	cmp    $0x1,%rax
  112e47:	74 18                	je     112e61 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9f1>
  112e49:	48 85 c0             	test   %rax,%rax
  112e4c:	0f 85 fe f6 ff ff    	jne    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  112e52:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112e57:	e8 b4 02 00 00       	call   113110 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.15530680740981780625>
  112e5c:	e9 ef f6 ff ff       	jmp    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  112e61:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  112e66:	48 85 f6             	test   %rsi,%rsi
  112e69:	0f 8e e1 f6 ff ff    	jle    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  112e6f:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  112e74:	ba 01 00 00 00       	mov    $0x1,%edx
  112e79:	ff 15 e9 8d 1a 00    	call   *0x1a8de9(%rip)        # 2bbc68 <_DYNAMIC+0x2f0>
  112e7f:	e9 cc f6 ff ff       	jmp    112550 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  112e84:	b1 06                	mov    $0x6,%cl
  112e86:	41 88 4d 00          	mov    %cl,0x0(%r13)
  112e8a:	e9 a2 f6 ff ff       	jmp    112531 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc1>
  112e8f:	8b 84 24 91 00 00 00 	mov    0x91(%rsp),%eax
  112e96:	8b 94 24 94 00 00 00 	mov    0x94(%rsp),%edx
  112e9d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  112ea2:	41 89 55 04          	mov    %edx,0x4(%r13)
  112ea6:	41 89 45 01          	mov    %eax,0x1(%r13)
  112eaa:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  112eb1:	00 
  112eb2:	48 8b 94 24 a0 00 00 	mov    0xa0(%rsp),%rdx
  112eb9:	00 
  112eba:	41 88 4d 00          	mov    %cl,0x0(%r13)
  112ebe:	49 89 45 08          	mov    %rax,0x8(%r13)
  112ec2:	49 89 55 10          	mov    %rdx,0x10(%r13)
  112ec6:	e9 bc 00 00 00       	jmp    112f87 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb17>
  112ecb:	b0 06                	mov    $0x6,%al
  112ecd:	e9 a5 00 00 00       	jmp    112f77 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb07>
  112ed2:	41 c6 45 00 05       	movb   $0x5,0x0(%r13)
  112ed7:	e9 ab 00 00 00       	jmp    112f87 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb17>
  112edc:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  112ee3:	00 
  112ee4:	48 8b 01             	mov    (%rcx),%rax
  112ee7:	48 85 c0             	test   %rax,%rax
  112eea:	0f 84 b4 01 00 00    	je     1130a4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc34>
  112ef0:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  112ef4:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  112efb:	89 f7                	mov    %esi,%edi
  112efd:	c1 e7 04             	shl    $0x4,%edi
  112f00:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  112f07:	49 89 c0             	mov    %rax,%r8
  112f0a:	eb 1d                	jmp    112f29 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xab9>
  112f0c:	0f 1f 40 00          	nopl   0x0(%rax)
  112f10:	41 0f 97 c1          	seta   %r9b
  112f14:	41 80 d9 00          	sbb    $0x0,%r9b
  112f18:	49 83 c0 10          	add    $0x10,%r8
  112f1c:	48 ff c2             	inc    %rdx
  112f1f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  112f23:	41 80 f9 01          	cmp    $0x1,%r9b
  112f27:	75 18                	jne    112f41 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xad1>
  112f29:	48 85 ff             	test   %rdi,%rdi
  112f2c:	74 1d                	je     112f4b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xadb>
  112f2e:	4c 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%r9
  112f35:	00 
  112f36:	4d 3b 08             	cmp    (%r8),%r9
  112f39:	75 d5                	jne    112f10 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xaa0>
  112f3b:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  112f3f:	eb cf                	jmp    112f10 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xaa0>
  112f41:	41 0f b6 f1          	movzbl %r9b,%esi
  112f45:	85 f6                	test   %esi,%esi
  112f47:	75 05                	jne    112f4e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xade>
  112f49:	eb 17                	jmp    112f62 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xaf2>
  112f4b:	48 89 f2             	mov    %rsi,%rdx
  112f4e:	48 83 e9 01          	sub    $0x1,%rcx
  112f52:	0f 82 4c 01 00 00    	jb     1130a4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc34>
  112f58:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  112f5f:	00 
  112f60:	eb 92                	jmp    112ef4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa84>
  112f62:	48 8b 84 d0 b8 00 00 	mov    0xb8(%rax,%rdx,8),%rax
  112f69:	00 
  112f6a:	49 89 45 08          	mov    %rax,0x8(%r13)
  112f6e:	41 c6 45 00 0d       	movb   $0xd,0x0(%r13)
  112f73:	eb 65                	jmp    112fda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  112f75:	b0 07                	mov    $0x7,%al
  112f77:	41 88 45 00          	mov    %al,0x0(%r13)
  112f7b:	eb 5d                	jmp    112fda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  112f7d:	b0 06                	mov    $0x6,%al
  112f7f:	eb 02                	jmp    112f83 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb13>
  112f81:	b0 07                	mov    $0x7,%al
  112f83:	41 88 45 00          	mov    %al,0x0(%r13)
  112f87:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  112f8c:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  112f90:	31 c0                	xor    %eax,%eax
  112f92:	48 83 f9 16          	cmp    $0x16,%rcx
  112f96:	48 0f 43 c2          	cmovae %rdx,%rax
  112f9a:	48 83 f8 01          	cmp    $0x1,%rax
  112f9e:	74 11                	je     112fb1 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb41>
  112fa0:	48 85 c0             	test   %rax,%rax
  112fa3:	75 35                	jne    112fda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  112fa5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112faa:	e8 61 01 00 00       	call   113110 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.15530680740981780625>
  112faf:	eb 29                	jmp    112fda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  112fb1:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  112fb6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  112fbd:	00 00 80 
  112fc0:	48 39 c6             	cmp    %rax,%rsi
  112fc3:	74 15                	je     112fda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  112fc5:	48 85 f6             	test   %rsi,%rsi
  112fc8:	74 10                	je     112fda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  112fca:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  112fcf:	ba 01 00 00 00       	mov    $0x1,%edx
  112fd4:	ff 15 8e 8c 1a 00    	call   *0x1a8c8e(%rip)        # 2bbc68 <_DYNAMIC+0x2f0>
  112fda:	48 8b 34 24          	mov    (%rsp),%rsi
  112fde:	48 85 f6             	test   %rsi,%rsi
  112fe1:	0f 84 4a f5 ff ff    	je     112531 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc1>
  112fe7:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  112fec:	48 c1 e6 04          	shl    $0x4,%rsi
  112ff0:	ba 08 00 00 00       	mov    $0x8,%edx
  112ff5:	ff 15 6d 8c 1a 00    	call   *0x1a8c6d(%rip)        # 2bbc68 <_DYNAMIC+0x2f0>
  112ffb:	e9 31 f5 ff ff       	jmp    112531 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc1>
  113000:	8b 94 24 91 00 00 00 	mov    0x91(%rsp),%edx
  113007:	8b b4 24 94 00 00 00 	mov    0x94(%rsp),%esi
  11300e:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  113013:	41 89 75 04          	mov    %esi,0x4(%r13)
  113017:	41 89 55 01          	mov    %edx,0x1(%r13)
  11301b:	e9 92 fe ff ff       	jmp    112eb2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa42>
  113020:	8b 8c 24 91 00 00 00 	mov    0x91(%rsp),%ecx
  113027:	8b 94 24 94 00 00 00 	mov    0x94(%rsp),%edx
  11302e:	41 89 55 04          	mov    %edx,0x4(%r13)
  113032:	41 89 4d 01          	mov    %ecx,0x1(%r13)
  113036:	0f 10 84 24 98 00 00 	movups 0x98(%rsp),%xmm0
  11303d:	00 
  11303e:	41 88 45 00          	mov    %al,0x0(%r13)
  113042:	41 0f 11 45 08       	movups %xmm0,0x8(%r13)
  113047:	e9 3b ff ff ff       	jmp    112f87 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb17>
  11304c:	48 8d 3d 27 e9 ef ff 	lea    -0x1016d9(%rip),%rdi        # 1197a <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb68>
  113053:	48 8d 15 8e 37 1a 00 	lea    0x1a378e(%rip),%rdx        # 2b67e8 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x68>
  11305a:	be 85 00 00 00       	mov    $0x85,%esi
  11305f:	ff 15 c3 8d 1a 00    	call   *0x1a8dc3(%rip)        # 2bbe28 <_DYNAMIC+0x4b0>
  113065:	eb 56                	jmp    1130bd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc4d>
  113067:	bf 08 00 00 00       	mov    $0x8,%edi
  11306c:	be 10 00 00 00       	mov    $0x10,%esi
  113071:	ff 15 09 8c 1a 00    	call   *0x1a8c09(%rip)        # 2bbc80 <_DYNAMIC+0x308>
  113077:	48 8d 3d e6 e8 ef ff 	lea    -0x10171a(%rip),%rdi        # 11964 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb52>
  11307e:	48 8d 15 4b 37 1a 00 	lea    0x1a374b(%rip),%rdx        # 2b67d0 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x50>
  113085:	be 16 00 00 00       	mov    $0x16,%esi
  11308a:	ff 15 00 8c 1a 00    	call   *0x1a8c00(%rip)        # 2bbc90 <_DYNAMIC+0x318>
  113090:	eb 2b                	jmp    1130bd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc4d>
  113092:	48 8d 15 1f 37 1a 00 	lea    0x1a371f(%rip),%rdx        # 2b67b8 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x38>
  113099:	4c 89 f7             	mov    %r14,%rdi
  11309c:	ff 15 4e 8d 1a 00    	call   *0x1a8d4e(%rip)        # 2bbdf0 <_DYNAMIC+0x478>
  1130a2:	eb 19                	jmp    1130bd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc4d>
  1130a4:	48 8d 3d b9 e8 ef ff 	lea    -0x101747(%rip),%rdi        # 11964 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb52>
  1130ab:	48 8d 15 ee 36 1a 00 	lea    0x1a36ee(%rip),%rdx        # 2b67a0 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x20>
  1130b2:	be 16 00 00 00       	mov    $0x16,%esi
  1130b7:	ff 15 d3 8b 1a 00    	call   *0x1a8bd3(%rip)        # 2bbc90 <_DYNAMIC+0x318>
  1130bd:	0f 0b                	ud2
  1130bf:	eb 0b                	jmp    1130cc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5c>
  1130c1:	eb 00                	jmp    1130c3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc53>
  1130c3:	48 89 c3             	mov    %rax,%rbx
  1130c6:	eb 11                	jmp    1130d9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc69>
  1130c8:	eb 02                	jmp    1130cc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5c>
  1130ca:	eb 00                	jmp    1130cc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5c>
  1130cc:	48 89 c3             	mov    %rax,%rbx
  1130cf:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1130d4:	e8 d7 02 00 00       	call   1133b0 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17hf33c9ca44255dc61E>
  1130d9:	48 8b 34 24          	mov    (%rsp),%rsi
  1130dd:	48 85 f6             	test   %rsi,%rsi
  1130e0:	74 14                	je     1130f6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc86>
  1130e2:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  1130e7:	48 c1 e6 04          	shl    $0x4,%rsi
  1130eb:	ba 08 00 00 00       	mov    $0x8,%edx
  1130f0:	ff 15 72 8b 1a 00    	call   *0x1a8b72(%rip)        # 2bbc68 <_DYNAMIC+0x2f0>
  1130f6:	48 89 df             	mov    %rbx,%rdi
  1130f9:	e8 32 19 1a 00       	call   2b4a30 <_Unwind_Resume@plt>
  1130fe:	ff 15 6c 8b 1a 00    	call   *0x1a8b6c(%rip)        # 2bbc70 <_DYNAMIC+0x2f8>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
