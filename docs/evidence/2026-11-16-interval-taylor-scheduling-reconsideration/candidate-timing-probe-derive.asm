
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/candidate-timing-probe:     file format elf64-x86-64


Disassembly of section .text:

0000000000112460 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE>:
  112460:	55                   	push   %rbp
  112461:	41 57                	push   %r15
  112463:	41 56                	push   %r14
  112465:	41 55                	push   %r13
  112467:	41 54                	push   %r12
  112469:	53                   	push   %rbx
  11246a:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
  112471:	4c 89 8c 24 c8 00 00 	mov    %r9,0xc8(%rsp)
  112478:	00 
  112479:	89 cd                	mov    %ecx,%ebp
  11247b:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  112482:	00 
  112483:	48 89 fb             	mov    %rdi,%rbx
  112486:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  11248d:	00 
  11248e:	48 8b 48 10          	mov    0x10(%rax),%rcx
  112492:	48 03 8c 24 88 01 00 	add    0x188(%rsp),%rcx
  112499:	00 
  11249a:	0f 82 9b 00 00 00    	jb     11253b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xdb>
  1124a0:	48 8b 46 48          	mov    0x48(%rsi),%rax
  1124a4:	48 3b 08             	cmp    (%rax),%rcx
  1124a7:	0f 83 8e 00 00 00    	jae    11253b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xdb>
  1124ad:	48 8b 48 10          	mov    0x10(%rax),%rcx
  1124b1:	48 85 c9             	test   %rcx,%rcx
  1124b4:	74 0e                	je     1124c4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x64>
  1124b6:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  1124ba:	b1 07                	mov    $0x7,%cl
  1124bc:	84 d2                	test   %dl,%dl
  1124be:	0f 85 eb 09 00 00    	jne    112eaf <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa4f>
  1124c4:	48 8b 48 08          	mov    0x8(%rax),%rcx
  1124c8:	48 85 c9             	test   %rcx,%rcx
  1124cb:	0f 84 dc 09 00 00    	je     112ead <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa4d>
  1124d1:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  1124d6:	4d 89 c6             	mov    %r8,%r14
  1124d9:	48 89 1c 24          	mov    %rbx,(%rsp)
  1124dd:	48 ff c9             	dec    %rcx
  1124e0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  1124e4:	ff 15 7e 97 1a 00    	call   *0x1a977e(%rip)        # 2bbc68 <_DYNAMIC+0x298>
  1124ea:	bf 10 00 00 00       	mov    $0x10,%edi
  1124ef:	be 08 00 00 00       	mov    $0x8,%esi
  1124f4:	ff 15 76 97 1a 00    	call   *0x1a9776(%rip)        # 2bbc70 <_DYNAMIC+0x2a0>
  1124fa:	48 85 c0             	test   %rax,%rax
  1124fd:	0f 84 90 0b 00 00    	je     113093 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc33>
  112503:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
  11250a:	00 
  11250b:	48 89 08             	mov    %rcx,(%rax)
  11250e:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  112512:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
  112519:	00 00 
  11251b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  112520:	bb 01 00 00 00       	mov    $0x1,%ebx
  112525:	48 8d 05 cc 42 1a 00 	lea    0x1a42cc(%rip),%rax        # 2b67f8 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x38>
  11252c:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  112533:	00 
  112534:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
  112539:	eb 33                	jmp    11256e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x10e>
  11253b:	c6 03 05             	movb   $0x5,(%rbx)
  11253e:	48 89 d8             	mov    %rbx,%rax
  112541:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
  112548:	5b                   	pop    %rbx
  112549:	41 5c                	pop    %r12
  11254b:	41 5d                	pop    %r13
  11254d:	41 5e                	pop    %r14
  11254f:	41 5f                	pop    %r15
  112551:	5d                   	pop    %rbp
  112552:	c3                   	ret
  112553:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  11255a:	84 00 00 00 00 00 
  112560:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  112565:	48 85 db             	test   %rbx,%rbx
  112568:	0f 84 b0 09 00 00    	je     112f1e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xabe>
  11256e:	48 ff cb             	dec    %rbx
  112571:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  112576:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  11257b:	48 c1 e3 04          	shl    $0x4,%rbx
  11257f:	4c 8b 34 18          	mov    (%rax,%rbx,1),%r14
  112583:	0f b6 44 18 08       	movzbl 0x8(%rax,%rbx,1),%eax
  112588:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  11258d:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  112591:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  112595:	48 85 d2             	test   %rdx,%rdx
  112598:	74 0c                	je     1125a6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x146>
  11259a:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  11259e:	84 d2                	test   %dl,%dl
  1125a0:	0f 85 1d 0a 00 00    	jne    112fc3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb63>
  1125a6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1125aa:	48 85 d2             	test   %rdx,%rdx
  1125ad:	0f 84 64 09 00 00    	je     112f17 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xab7>
  1125b3:	48 ff ca             	dec    %rdx
  1125b6:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  1125ba:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  1125c1:	00 
  1125c2:	48 8b 09             	mov    (%rcx),%rcx
  1125c5:	48 85 c9             	test   %rcx,%rcx
  1125c8:	0f 84 92 00 00 00    	je     112660 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x200>
  1125ce:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  1125d5:	00 
  1125d6:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  1125da:	0f b7 b9 12 01 00 00 	movzwl 0x112(%rcx),%edi
  1125e1:	41 89 f8             	mov    %edi,%r8d
  1125e4:	41 c1 e0 04          	shl    $0x4,%r8d
  1125e8:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  1125ef:	49 89 c9             	mov    %rcx,%r9
  1125f2:	eb 25                	jmp    112619 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1b9>
  1125f4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
  1125fb:	00 00 00 00 00 
  112600:	41 0f 97 c2          	seta   %r10b
  112604:	41 80 da 00          	sbb    $0x0,%r10b
  112608:	49 83 c1 10          	add    $0x10,%r9
  11260c:	48 ff c6             	inc    %rsi
  11260f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  112613:	41 80 fa 01          	cmp    $0x1,%r10b
  112617:	75 17                	jne    112630 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1d0>
  112619:	4d 85 c0             	test   %r8,%r8
  11261c:	74 22                	je     112640 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e0>
  11261e:	4d 3b 31             	cmp    (%r9),%r14
  112621:	75 dd                	jne    112600 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1a0>
  112623:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  112627:	eb d7                	jmp    112600 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1a0>
  112629:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  112630:	41 0f b6 fa          	movzbl %r10b,%edi
  112634:	85 ff                	test   %edi,%edi
  112636:	0f 84 24 ff ff ff    	je     112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  11263c:	eb 05                	jmp    112643 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e3>
  11263e:	66 90                	xchg   %ax,%ax
  112640:	48 89 fe             	mov    %rdi,%rsi
  112643:	48 83 ea 01          	sub    $0x1,%rdx
  112647:	72 17                	jb     112660 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x200>
  112649:	48 8b 8c f1 18 01 00 	mov    0x118(%rcx,%rsi,8),%rcx
  112650:	00 
  112651:	eb 87                	jmp    1125da <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x17a>
  112653:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  11265a:	84 00 00 00 00 00 
  112660:	84 c0                	test   %al,%al
  112662:	74 6e                	je     1126d2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x272>
  112664:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  112669:	48 8b 70 28          	mov    0x28(%rax),%rsi
  11266d:	49 39 f6             	cmp    %rsi,%r14
  112670:	0f 83 48 0a 00 00    	jae    1130be <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5e>
  112676:	48 8b 40 20          	mov    0x20(%rax),%rax
  11267a:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  11267e:	48 c1 e1 04          	shl    $0x4,%rcx
  112682:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  112686:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  11268a:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  11268e:	48 83 f8 16          	cmp    $0x16,%rax
  112692:	b8 00 00 00 00       	mov    $0x0,%eax
  112697:	48 0f 42 c8          	cmovb  %rax,%rcx
  11269b:	48 8d 15 f6 f1 ef ff 	lea    -0x100e0a(%rip),%rdx        # 11898 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa86>
  1126a2:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  1126a6:	48 01 d0             	add    %rdx,%rax
  1126a9:	ff e0                	jmp    *%rax
  1126ab:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  1126b2:	00 
  1126b3:	e8 f8 0d 00 00       	call   1134b0 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17h1bbed13f28b0ca94E.llvm.4177729589157340265>
  1126b8:	0f b6 84 24 98 00 00 	movzbl 0x98(%rsp),%eax
  1126bf:	00 
  1126c0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  1126c5:	3c 16                	cmp    $0x16,%al
  1126c7:	0f 83 62 02 00 00    	jae    11292f <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4cf>
  1126cd:	e9 e4 05 00 00       	jmp    112cb6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x856>
  1126d2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  1126d7:	48 8b 70 28          	mov    0x28(%rax),%rsi
  1126db:	49 39 f6             	cmp    %rsi,%r14
  1126de:	0f 83 e9 09 00 00    	jae    1130cd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc6d>
  1126e4:	48 8b 40 20          	mov    0x20(%rax),%rax
  1126e8:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  1126ec:	48 c1 e1 04          	shl    $0x4,%rcx
  1126f0:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  1126f4:	48 8d 56 eb          	lea    -0x15(%rsi),%rdx
  1126f8:	48 83 fe 16          	cmp    $0x16,%rsi
  1126fc:	be 00 00 00 00       	mov    $0x0,%esi
  112701:	48 0f 42 d6          	cmovb  %rsi,%rdx
  112705:	48 83 fa 02          	cmp    $0x2,%rdx
  112709:	73 0b                	jae    112716 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2b6>
  11270b:	45 31 e4             	xor    %r12d,%r12d
  11270e:	45 31 ff             	xor    %r15d,%r15d
  112711:	e9 84 00 00 00       	jmp    11279a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x33a>
  112716:	48 01 c8             	add    %rcx,%rax
  112719:	83 fa 02             	cmp    $0x2,%edx
  11271c:	75 58                	jne    112776 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x316>
  11271e:	48 8b 40 18          	mov    0x18(%rax),%rax
  112722:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  112729:	00 
  11272a:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  112730:	45 31 e4             	xor    %r12d,%r12d
  112733:	eb 65                	jmp    11279a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x33a>
  112735:	48 8b 46 18          	mov    0x18(%rsi),%rax
  112739:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  11273e:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  112745:	00 00 
  112747:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  11274e:	00 
  11274f:	b0 17                	mov    $0x17,%al
  112751:	e9 d2 01 00 00       	jmp    112928 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4c8>
  112756:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  11275a:	88 84 24 b0 00 00 00 	mov    %al,0xb0(%rsp)
  112761:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  112766:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  11276d:	00 00 
  11276f:	b0 18                	mov    $0x18,%al
  112771:	e9 b2 01 00 00       	jmp    112928 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4c8>
  112776:	48 8b 48 08          	mov    0x8(%rax),%rcx
  11277a:	48 89 8c 24 d8 00 00 	mov    %rcx,0xd8(%rsp)
  112781:	00 
  112782:	48 8b 40 10          	mov    0x10(%rax),%rax
  112786:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
  11278d:	00 
  11278e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  112794:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  11279a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1127a1:	00 
  1127a2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  1127a6:	48 03 94 24 88 01 00 	add    0x188(%rsp),%rdx
  1127ad:	00 
  1127ae:	0f 82 4a 08 00 00    	jb     112ffe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  1127b4:	48 03 54 24 20       	add    0x20(%rsp),%rdx
  1127b9:	0f 82 3f 08 00 00    	jb     112ffe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  1127bf:	4b 8d 04 27          	lea    (%r15,%r12,1),%rax
  1127c3:	48 ff c0             	inc    %rax
  1127c6:	48 01 c2             	add    %rax,%rdx
  1127c9:	0f 82 2f 08 00 00    	jb     112ffe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  1127cf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  1127d4:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  1127d8:	48 3b 11             	cmp    (%rcx),%rdx
  1127db:	0f 87 1d 08 00 00    	ja     112ffe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  1127e1:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  1127e5:	48 85 d2             	test   %rdx,%rdx
  1127e8:	74 0c                	je     1127f6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x396>
  1127ea:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  1127ee:	84 d2                	test   %dl,%dl
  1127f0:	0f 85 cd 07 00 00    	jne    112fc3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb63>
  1127f6:	4b 8d 34 27          	lea    (%r15,%r12,1),%rsi
  1127fa:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1127fe:	48 39 d6             	cmp    %rdx,%rsi
  112801:	0f 83 10 07 00 00    	jae    112f17 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xab7>
  112807:	48 29 c2             	sub    %rax,%rdx
  11280a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  11280e:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  112813:	4c 3b 6c 24 10       	cmp    0x10(%rsp),%r13
  112818:	75 0b                	jne    112825 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3c5>
  11281a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  11281f:	ff 15 63 96 1a 00    	call   *0x1a9663(%rip)        # 2bbe88 <_DYNAMIC+0x4b8>
  112825:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  11282a:	4c 89 e9             	mov    %r13,%rcx
  11282d:	48 c1 e1 04          	shl    $0x4,%rcx
  112831:	4c 89 34 08          	mov    %r14,(%rax,%rcx,1)
  112835:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  11283a:	49 8d 5d 01          	lea    0x1(%r13),%rbx
  11283e:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  112843:	4d 85 e4             	test   %r12,%r12
  112846:	74 38                	je     112880 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x420>
  112848:	48 3b 5c 24 10       	cmp    0x10(%rsp),%rbx
  11284d:	75 0b                	jne    11285a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3fa>
  11284f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  112854:	ff 15 2e 96 1a 00    	call   *0x1a962e(%rip)        # 2bbe88 <_DYNAMIC+0x4b8>
  11285a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  11285f:	48 c1 e3 04          	shl    $0x4,%rbx
  112863:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  11286a:	00 
  11286b:	48 89 0c 18          	mov    %rcx,(%rax,%rbx,1)
  11286f:	c6 44 18 08 00       	movb   $0x0,0x8(%rax,%rbx,1)
  112874:	49 83 c5 02          	add    $0x2,%r13
  112878:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
  11287d:	4c 89 eb             	mov    %r13,%rbx
  112880:	4d 85 ff             	test   %r15,%r15
  112883:	0f 84 d7 fc ff ff    	je     112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  112889:	48 3b 5c 24 10       	cmp    0x10(%rsp),%rbx
  11288e:	75 0b                	jne    11289b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x43b>
  112890:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  112895:	ff 15 ed 95 1a 00    	call   *0x1a95ed(%rip)        # 2bbe88 <_DYNAMIC+0x4b8>
  11289b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1128a0:	48 89 d9             	mov    %rbx,%rcx
  1128a3:	48 c1 e1 04          	shl    $0x4,%rcx
  1128a7:	48 8b 94 24 d8 00 00 	mov    0xd8(%rsp),%rdx
  1128ae:	00 
  1128af:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  1128b3:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  1128b8:	48 ff c3             	inc    %rbx
  1128bb:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  1128c0:	48 85 db             	test   %rbx,%rbx
  1128c3:	0f 85 a5 fc ff ff    	jne    11256e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x10e>
  1128c9:	e9 50 06 00 00       	jmp    112f1e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xabe>
  1128ce:	8b 5e 20             	mov    0x20(%rsi),%ebx
  1128d1:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  1128d8:	00 00 80 
  1128db:	48 89 c8             	mov    %rcx,%rax
  1128de:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  1128e2:	74 21                	je     112905 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4a5>
  1128e4:	48 83 c6 08          	add    $0x8,%rsi
  1128e8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1128ed:	ff 15 ed 94 1a 00    	call   *0x1a94ed(%rip)        # 2bbde0 <_DYNAMIC+0x410>
  1128f3:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  1128f8:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  1128fd:	0f 10 01             	movups (%rcx),%xmm0
  112900:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  112905:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
  11290c:	00 
  11290d:	66 0f 6f 44 24 60    	movdqa 0x60(%rsp),%xmm0
  112913:	48 8d 84 24 a8 00 00 	lea    0xa8(%rsp),%rax
  11291a:	00 
  11291b:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  11291f:	89 9c 24 b8 00 00 00 	mov    %ebx,0xb8(%rsp)
  112926:	b0 16                	mov    $0x16,%al
  112928:	88 84 24 98 00 00 00 	mov    %al,0x98(%rsp)
  11292f:	3c 18                	cmp    $0x18,%al
  112931:	74 22                	je     112955 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4f5>
  112933:	0f b6 c0             	movzbl %al,%eax
  112936:	83 f8 17             	cmp    $0x17,%eax
  112939:	0f 85 62 03 00 00    	jne    112ca1 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x841>
  11293f:	f3 0f 6f 84 24 b0 00 	movdqu 0xb0(%rsp),%xmm0
  112946:	00 00 
  112948:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  11294d:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  112953:	eb 0f                	jmp    112964 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x504>
  112955:	41 bf 02 00 00 00    	mov    $0x2,%r15d
  11295b:	f3 0f 6f 84 24 a0 00 	movdqu 0xa0(%rsp),%xmm0
  112962:	00 00 
  112964:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  11296b:	00 
  11296c:	66 0f 7f 84 24 00 01 	movdqa %xmm0,0x100(%rsp)
  112973:	00 00 
  112975:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  11297a:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  112981:	00 
  112982:	48 89 8c 24 f0 00 00 	mov    %rcx,0xf0(%rsp)
  112989:	00 
  11298a:	31 db                	xor    %ebx,%ebx
  11298c:	eb 24                	jmp    1129b2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x552>
  11298e:	4c 89 e0             	mov    %r12,%rax
  112991:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  112996:	48 89 84 dc e8 00 00 	mov    %rax,0xe8(%rsp,%rbx,8)
  11299d:	00 
  11299e:	4c 89 eb             	mov    %r13,%rbx
  1129a1:	4d 39 fd             	cmp    %r15,%r13
  1129a4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1129ab:	00 
  1129ac:	0f 84 ae 02 00 00    	je     112c60 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x800>
  1129b2:	48 8b 00             	mov    (%rax),%rax
  1129b5:	48 85 c0             	test   %rax,%rax
  1129b8:	0f 84 e5 06 00 00    	je     1130a3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc43>
  1129be:	4c 8d 6b 01          	lea    0x1(%rbx),%r13
  1129c2:	48 8b 8c dc 00 01 00 	mov    0x100(%rsp,%rbx,8),%rcx
  1129c9:	00 
  1129ca:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  1129d1:	00 
  1129d2:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  1129d6:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  1129dd:	41 89 f8             	mov    %edi,%r8d
  1129e0:	41 c1 e0 04          	shl    $0x4,%r8d
  1129e4:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  1129eb:	49 89 c1             	mov    %rax,%r9
  1129ee:	eb 19                	jmp    112a09 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5a9>
  1129f0:	41 0f 97 c2          	seta   %r10b
  1129f4:	41 80 da 00          	sbb    $0x0,%r10b
  1129f8:	49 83 c1 10          	add    $0x10,%r9
  1129fc:	48 ff c6             	inc    %rsi
  1129ff:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  112a03:	41 80 fa 01          	cmp    $0x1,%r10b
  112a07:	75 17                	jne    112a20 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5c0>
  112a09:	4d 85 c0             	test   %r8,%r8
  112a0c:	74 22                	je     112a30 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5d0>
  112a0e:	49 3b 09             	cmp    (%r9),%rcx
  112a11:	75 dd                	jne    1129f0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x590>
  112a13:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  112a17:	eb d7                	jmp    1129f0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x590>
  112a19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  112a20:	41 0f b6 fa          	movzbl %r10b,%edi
  112a24:	85 ff                	test   %edi,%edi
  112a26:	75 0b                	jne    112a33 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5d3>
  112a28:	eb 26                	jmp    112a50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5f0>
  112a2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  112a30:	48 89 fe             	mov    %rdi,%rsi
  112a33:	48 83 ea 01          	sub    $0x1,%rdx
  112a37:	0f 82 66 06 00 00    	jb     1130a3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc43>
  112a3d:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  112a44:	00 
  112a45:	eb 8f                	jmp    1129d6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x576>
  112a47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  112a4e:	00 00 
  112a50:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  112a57:	00 
  112a58:	4c 3b 64 24 28       	cmp    0x28(%rsp),%r12
  112a5d:	0f 84 3b ff ff ff    	je     11299e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x53e>
  112a63:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  112a6a:	00 
  112a6b:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  112a6f:	48 83 f9 16          	cmp    $0x16,%rcx
  112a73:	b9 00 00 00 00       	mov    $0x0,%ecx
  112a78:	48 0f 42 c1          	cmovb  %rcx,%rax
  112a7c:	48 83 f8 02          	cmp    $0x2,%rax
  112a80:	74 6e                	je     112af0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x690>
  112a82:	83 f8 03             	cmp    $0x3,%eax
  112a85:	0f 85 ed 05 00 00    	jne    113078 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc18>
  112a8b:	0f b6 84 24 b0 00 00 	movzbl 0xb0(%rsp),%eax
  112a92:	00 
  112a93:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  112a9a:	00 00 80 
  112a9d:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
  112aa2:	c7 84 24 80 00 00 00 	movl   $0x0,0x80(%rsp)
  112aa9:	00 00 00 00 
  112aad:	c6 44 24 60 16       	movb   $0x16,0x60(%rsp)
  112ab2:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  112ab7:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  112abe:	00 
  112abf:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  112ac4:	48 8d 0d dd ed ef ff 	lea    -0x101223(%rip),%rcx        # 118a8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa96>
  112acb:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  112acf:	48 01 c8             	add    %rcx,%rax
  112ad2:	ff e0                	jmp    *%rax
  112ad4:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  112adb:	00 
  112adc:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  112ae1:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112ae6:	ff 15 34 93 1a 00    	call   *0x1a9334(%rip)        # 2bbe20 <_DYNAMIC+0x450>
  112aec:	eb 40                	jmp    112b2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  112aee:	66 90                	xchg   %ax,%ax
  112af0:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  112af7:	00 
  112af8:	48 8b 94 24 a8 00 00 	mov    0xa8(%rsp),%rdx
  112aff:	00 
  112b00:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  112b07:	00 00 80 
  112b0a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  112b0f:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  112b16:	00 
  112b17:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  112b1c:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  112b23:	00 
  112b24:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  112b29:	e8 a2 38 fe ff       	call   f63d0 <_ZN10hypersolve18expression_program8jacobian5unary17h2b423a6394b7a769E>
  112b2e:	f3 0f 6f 84 24 18 01 	movdqu 0x118(%rsp),%xmm0
  112b35:	00 00 
  112b37:	0f 10 8c 24 28 01 00 	movups 0x128(%rsp),%xmm1
  112b3e:	00 
  112b3f:	0f 10 94 24 38 01 00 	movups 0x138(%rsp),%xmm2
  112b46:	00 
  112b47:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  112b4c:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  112b51:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  112b57:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112b5c:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  112b61:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112b66:	89 d9                	mov    %ebx,%ecx
  112b68:	4c 8d 84 24 00 01 00 	lea    0x100(%rsp),%r8
  112b6f:	00 
  112b70:	4d 89 f9             	mov    %r15,%r9
  112b73:	ff b4 24 c8 00 00 00 	push   0xc8(%rsp)
  112b7a:	ff 74 24 30          	push   0x30(%rsp)
  112b7e:	e8 2d 3e fe ff       	call   f69b0 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17ha766717089845c05E>
  112b83:	48 83 c4 10          	add    $0x10,%rsp
  112b87:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  112b8c:	80 f9 0d             	cmp    $0xd,%cl
  112b8f:	0f 85 21 03 00 00    	jne    112eb6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa56>
  112b95:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
  112b9a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  112b9f:	48 89 d0             	mov    %rdx,%rax
  112ba2:	48 39 d1             	cmp    %rdx,%rcx
  112ba5:	0f 84 e6 fd ff ff    	je     112991 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x531>
  112bab:	48 8b 84 24 c8 00 00 	mov    0xc8(%rsp),%rax
  112bb2:	00 
  112bb3:	48 39 c1             	cmp    %rax,%rcx
  112bb6:	0f 84 d2 fd ff ff    	je     11298e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x52e>
  112bbc:	49 39 c4             	cmp    %rax,%r12
  112bbf:	75 5f                	jne    112c20 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7c0>
  112bc1:	48 89 c8             	mov    %rcx,%rax
  112bc4:	e9 c8 fd ff ff       	jmp    112991 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x531>
  112bc9:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  112bd0:	00 
  112bd1:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  112bd6:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112bdb:	ff 15 37 92 1a 00    	call   *0x1a9237(%rip)        # 2bbe18 <_DYNAMIC+0x448>
  112be1:	e9 48 ff ff ff       	jmp    112b2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  112be6:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  112bed:	00 
  112bee:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  112bf3:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112bf8:	ff 15 fa 92 1a 00    	call   *0x1a92fa(%rip)        # 2bbef8 <_DYNAMIC+0x528>
  112bfe:	e9 2b ff ff ff       	jmp    112b2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  112c03:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  112c0a:	00 
  112c0b:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  112c10:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112c15:	ff 15 15 92 1a 00    	call   *0x1a9215(%rip)        # 2bbe30 <_DYNAMIC+0x460>
  112c1b:	e9 0e ff ff ff       	jmp    112b2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  112c20:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  112c25:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  112c2a:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  112c2f:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  112c34:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112c39:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  112c3e:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112c43:	e8 28 3c fe ff       	call   f6870 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  112c48:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  112c4d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  112c52:	80 f9 0d             	cmp    $0xd,%cl
  112c55:	0f 84 3b fd ff ff    	je     112996 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x536>
  112c5b:	e9 cc 03 00 00       	jmp    11302c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbcc>
  112c60:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  112c67:	00 
  112c68:	48 8b 94 24 f0 00 00 	mov    0xf0(%rsp),%rdx
  112c6f:	00 
  112c70:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  112c75:	48 39 c8             	cmp    %rcx,%rax
  112c78:	74 3c                	je     112cb6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x856>
  112c7a:	48 39 ca             	cmp    %rcx,%rdx
  112c7d:	0f 85 cd 01 00 00    	jne    112e50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9f0>
  112c83:	48 89 c2             	mov    %rax,%rdx
  112c86:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  112c8d:	00 
  112c8e:	48 8b 40 10          	mov    0x10(%rax),%rax
  112c92:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  112c99:	00 
  112c9a:	73 34                	jae    112cd0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x870>
  112c9c:	e9 03 02 00 00       	jmp    112ea4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  112ca1:	39 ac 24 b8 00 00 00 	cmp    %ebp,0xb8(%rsp)
  112ca8:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  112cad:	48 0f 44 94 24 c8 00 	cmove  0xc8(%rsp),%rdx
  112cb4:	00 00 
  112cb6:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  112cbd:	00 
  112cbe:	48 8b 40 10          	mov    0x10(%rax),%rax
  112cc2:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  112cc9:	00 
  112cca:	0f 82 d4 01 00 00    	jb     112ea4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  112cd0:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  112cd5:	48 01 c1             	add    %rax,%rcx
  112cd8:	48 39 c1             	cmp    %rax,%rcx
  112cdb:	0f 82 c3 01 00 00    	jb     112ea4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  112ce1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  112ce6:	48 8b 40 48          	mov    0x48(%rax),%rax
  112cea:	48 3b 08             	cmp    (%rax),%rcx
  112ced:	0f 83 b1 01 00 00    	jae    112ea4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  112cf3:	48 8b 48 10          	mov    0x10(%rax),%rcx
  112cf7:	48 85 c9             	test   %rcx,%rcx
  112cfa:	74 0c                	je     112d08 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8a8>
  112cfc:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  112d00:	84 c9                	test   %cl,%cl
  112d02:	0f 85 3f 03 00 00    	jne    113047 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbe7>
  112d08:	48 8b 48 08          	mov    0x8(%rax),%rcx
  112d0c:	48 85 c9             	test   %rcx,%rcx
  112d0f:	0f 84 2e 03 00 00    	je     113043 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbe3>
  112d15:	48 ff c9             	dec    %rcx
  112d18:	48 89 48 08          	mov    %rcx,0x8(%rax)
  112d1c:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  112d23:	00 
  112d24:	48 8b 01             	mov    (%rcx),%rax
  112d27:	48 85 c0             	test   %rax,%rax
  112d2a:	74 74                	je     112da0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x940>
  112d2c:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  112d30:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  112d37:	41 89 f8             	mov    %edi,%r8d
  112d3a:	41 c1 e0 04          	shl    $0x4,%r8d
  112d3e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  112d45:	49 89 c1             	mov    %rax,%r9
  112d48:	eb 1f                	jmp    112d69 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x909>
  112d4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  112d50:	41 0f 97 c2          	seta   %r10b
  112d54:	41 80 da 00          	sbb    $0x0,%r10b
  112d58:	49 83 c1 10          	add    $0x10,%r9
  112d5c:	48 ff c1             	inc    %rcx
  112d5f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  112d63:	41 80 fa 01          	cmp    $0x1,%r10b
  112d67:	75 10                	jne    112d79 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x919>
  112d69:	4d 85 c0             	test   %r8,%r8
  112d6c:	74 15                	je     112d83 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x923>
  112d6e:	4d 3b 31             	cmp    (%r9),%r14
  112d71:	75 dd                	jne    112d50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8f0>
  112d73:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  112d77:	eb d7                	jmp    112d50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8f0>
  112d79:	41 0f b6 fa          	movzbl %r10b,%edi
  112d7d:	85 ff                	test   %edi,%edi
  112d7f:	75 05                	jne    112d86 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x926>
  112d81:	eb 13                	jmp    112d96 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x936>
  112d83:	48 89 f9             	mov    %rdi,%rcx
  112d86:	48 83 ee 01          	sub    $0x1,%rsi
  112d8a:	72 16                	jb     112da2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x942>
  112d8c:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  112d93:	00 
  112d94:	eb 9a                	jmp    112d30 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8d0>
  112d96:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  112d9d:	00 
  112d9e:	eb 3a                	jmp    112dda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x97a>
  112da0:	31 c0                	xor    %eax,%eax
  112da2:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
  112da9:	00 
  112daa:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  112daf:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
  112db4:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  112db8:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  112dbd:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  112dc4:	00 00 
  112dc6:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  112dcb:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112dd0:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  112dd5:	e8 c6 09 00 00       	call   1137a0 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h9e96ea47bee8ef08E>
  112dda:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  112de1:	00 
  112de2:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  112de6:	48 83 f9 16          	cmp    $0x16,%rcx
  112dea:	b9 00 00 00 00       	mov    $0x0,%ecx
  112def:	48 0f 42 c1          	cmovb  %rcx,%rax
  112df3:	48 83 f8 01          	cmp    $0x1,%rax
  112df7:	74 1b                	je     112e14 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9b4>
  112df9:	48 85 c0             	test   %rax,%rax
  112dfc:	0f 85 5e f7 ff ff    	jne    112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  112e02:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  112e09:	00 
  112e0a:	e8 41 03 00 00       	call   113150 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.4177729589157340265>
  112e0f:	e9 4c f7 ff ff       	jmp    112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  112e14:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  112e1b:	00 
  112e1c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  112e23:	00 00 80 
  112e26:	48 39 c6             	cmp    %rax,%rsi
  112e29:	0f 84 31 f7 ff ff    	je     112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  112e2f:	48 85 f6             	test   %rsi,%rsi
  112e32:	0f 84 28 f7 ff ff    	je     112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  112e38:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  112e3f:	00 
  112e40:	ba 01 00 00 00       	mov    $0x1,%edx
  112e45:	ff 15 75 8e 1a 00    	call   *0x1a8e75(%rip)        # 2bbcc0 <_DYNAMIC+0x2f0>
  112e4b:	e9 10 f7 ff ff       	jmp    112560 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  112e50:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  112e55:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  112e5a:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  112e5f:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  112e64:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  112e69:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  112e6e:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  112e73:	e8 f8 39 fe ff       	call   f6870 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  112e78:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  112e7d:	3c 0d                	cmp    $0xd,%al
  112e7f:	0f 85 cf 01 00 00    	jne    113054 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbf4>
  112e85:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
  112e8a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  112e91:	00 
  112e92:	48 8b 40 10          	mov    0x10(%rax),%rax
  112e96:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  112e9d:	00 
  112e9e:	0f 83 2c fe ff ff    	jae    112cd0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x870>
  112ea4:	48 8b 1c 24          	mov    (%rsp),%rbx
  112ea8:	c6 03 05             	movb   $0x5,(%rbx)
  112eab:	eb 2f                	jmp    112edc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa7c>
  112ead:	b1 06                	mov    $0x6,%cl
  112eaf:	88 0b                	mov    %cl,(%rbx)
  112eb1:	e9 88 f6 ff ff       	jmp    11253e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xde>
  112eb6:	8b 44 24 61          	mov    0x61(%rsp),%eax
  112eba:	8b 54 24 64          	mov    0x64(%rsp),%edx
  112ebe:	48 8b 1c 24          	mov    (%rsp),%rbx
  112ec2:	89 53 04             	mov    %edx,0x4(%rbx)
  112ec5:	89 43 01             	mov    %eax,0x1(%rbx)
  112ec8:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  112ecd:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  112ed2:	88 0b                	mov    %cl,(%rbx)
  112ed4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  112ed8:	48 89 53 10          	mov    %rdx,0x10(%rbx)
  112edc:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  112ee3:	00 
  112ee4:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  112ee8:	31 c0                	xor    %eax,%eax
  112eea:	48 83 f9 16          	cmp    $0x16,%rcx
  112eee:	48 0f 43 c2          	cmovae %rdx,%rax
  112ef2:	48 83 f8 01          	cmp    $0x1,%rax
  112ef6:	0f 84 d1 00 00 00    	je     112fcd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6d>
  112efc:	48 85 c0             	test   %rax,%rax
  112eff:	0f 85 00 01 00 00    	jne    113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112f05:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  112f0c:	00 
  112f0d:	e8 3e 02 00 00       	call   113150 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.4177729589157340265>
  112f12:	e9 ee 00 00 00       	jmp    113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112f17:	b0 06                	mov    $0x6,%al
  112f19:	e9 a7 00 00 00       	jmp    112fc5 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb65>
  112f1e:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  112f25:	00 
  112f26:	48 8b 01             	mov    (%rcx),%rax
  112f29:	48 85 c0             	test   %rax,%rax
  112f2c:	48 8b 1c 24          	mov    (%rsp),%rbx
  112f30:	0f 84 aa 01 00 00    	je     1130e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc80>
  112f36:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  112f3a:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  112f41:	89 f7                	mov    %esi,%edi
  112f43:	c1 e7 04             	shl    $0x4,%edi
  112f46:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  112f4d:	49 89 c0             	mov    %rax,%r8
  112f50:	eb 27                	jmp    112f79 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb19>
  112f52:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  112f59:	1f 84 00 00 00 00 00 
  112f60:	41 0f 97 c1          	seta   %r9b
  112f64:	41 80 d9 00          	sbb    $0x0,%r9b
  112f68:	49 83 c0 10          	add    $0x10,%r8
  112f6c:	48 ff c2             	inc    %rdx
  112f6f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  112f73:	41 80 f9 01          	cmp    $0x1,%r9b
  112f77:	75 18                	jne    112f91 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb31>
  112f79:	48 85 ff             	test   %rdi,%rdi
  112f7c:	74 1d                	je     112f9b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb3b>
  112f7e:	4c 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%r9
  112f85:	00 
  112f86:	4d 3b 08             	cmp    (%r8),%r9
  112f89:	75 d5                	jne    112f60 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb00>
  112f8b:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  112f8f:	eb cf                	jmp    112f60 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb00>
  112f91:	41 0f b6 f1          	movzbl %r9b,%esi
  112f95:	85 f6                	test   %esi,%esi
  112f97:	75 05                	jne    112f9e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb3e>
  112f99:	eb 17                	jmp    112fb2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb52>
  112f9b:	48 89 f2             	mov    %rsi,%rdx
  112f9e:	48 83 e9 01          	sub    $0x1,%rcx
  112fa2:	0f 82 38 01 00 00    	jb     1130e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc80>
  112fa8:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  112faf:	00 
  112fb0:	eb 88                	jmp    112f3a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xada>
  112fb2:	48 8b 84 d0 b8 00 00 	mov    0xb8(%rax,%rdx,8),%rax
  112fb9:	00 
  112fba:	48 89 43 08          	mov    %rax,0x8(%rbx)
  112fbe:	c6 03 0d             	movb   $0xd,(%rbx)
  112fc1:	eb 42                	jmp    113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112fc3:	b0 07                	mov    $0x7,%al
  112fc5:	48 8b 1c 24          	mov    (%rsp),%rbx
  112fc9:	88 03                	mov    %al,(%rbx)
  112fcb:	eb 38                	jmp    113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112fcd:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  112fd4:	00 
  112fd5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  112fdc:	00 00 80 
  112fdf:	48 39 c6             	cmp    %rax,%rsi
  112fe2:	74 21                	je     113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112fe4:	48 85 f6             	test   %rsi,%rsi
  112fe7:	74 1c                	je     113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112fe9:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  112ff0:	00 
  112ff1:	ba 01 00 00 00       	mov    $0x1,%edx
  112ff6:	ff 15 c4 8c 1a 00    	call   *0x1a8cc4(%rip)        # 2bbcc0 <_DYNAMIC+0x2f0>
  112ffc:	eb 07                	jmp    113005 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  112ffe:	48 8b 1c 24          	mov    (%rsp),%rbx
  113002:	c6 03 05             	movb   $0x5,(%rbx)
  113005:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  11300a:	48 85 f6             	test   %rsi,%rsi
  11300d:	0f 84 2b f5 ff ff    	je     11253e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xde>
  113013:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  113018:	48 c1 e6 04          	shl    $0x4,%rsi
  11301c:	ba 08 00 00 00       	mov    $0x8,%edx
  113021:	ff 15 99 8c 1a 00    	call   *0x1a8c99(%rip)        # 2bbcc0 <_DYNAMIC+0x2f0>
  113027:	e9 12 f5 ff ff       	jmp    11253e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xde>
  11302c:	8b 54 24 61          	mov    0x61(%rsp),%edx
  113030:	8b 74 24 64          	mov    0x64(%rsp),%esi
  113034:	48 8b 1c 24          	mov    (%rsp),%rbx
  113038:	89 73 04             	mov    %esi,0x4(%rbx)
  11303b:	89 53 01             	mov    %edx,0x1(%rbx)
  11303e:	e9 8a fe ff ff       	jmp    112ecd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa6d>
  113043:	b0 06                	mov    $0x6,%al
  113045:	eb 02                	jmp    113049 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbe9>
  113047:	b0 07                	mov    $0x7,%al
  113049:	48 8b 1c 24          	mov    (%rsp),%rbx
  11304d:	88 03                	mov    %al,(%rbx)
  11304f:	e9 88 fe ff ff       	jmp    112edc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa7c>
  113054:	8b 4c 24 61          	mov    0x61(%rsp),%ecx
  113058:	8b 54 24 64          	mov    0x64(%rsp),%edx
  11305c:	48 8b 1c 24          	mov    (%rsp),%rbx
  113060:	89 53 04             	mov    %edx,0x4(%rbx)
  113063:	89 4b 01             	mov    %ecx,0x1(%rbx)
  113066:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  11306c:	88 03                	mov    %al,(%rbx)
  11306e:	f3 0f 7f 43 08       	movdqu %xmm0,0x8(%rbx)
  113073:	e9 64 fe ff ff       	jmp    112edc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa7c>
  113078:	48 8d 3d eb e8 ef ff 	lea    -0x101715(%rip),%rdi        # 1196a <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb58>
  11307f:	48 8d 15 ba 37 1a 00 	lea    0x1a37ba(%rip),%rdx        # 2b6840 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x80>
  113086:	be 85 00 00 00       	mov    $0x85,%esi
  11308b:	ff 15 ef 8d 1a 00    	call   *0x1a8def(%rip)        # 2bbe80 <_DYNAMIC+0x4b0>
  113091:	eb 66                	jmp    1130f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc99>
  113093:	bf 08 00 00 00       	mov    $0x8,%edi
  113098:	be 10 00 00 00       	mov    $0x10,%esi
  11309d:	ff 15 35 8c 1a 00    	call   *0x1a8c35(%rip)        # 2bbcd8 <_DYNAMIC+0x308>
  1130a3:	48 8d 3d aa e8 ef ff 	lea    -0x101756(%rip),%rdi        # 11954 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb42>
  1130aa:	48 8d 15 77 37 1a 00 	lea    0x1a3777(%rip),%rdx        # 2b6828 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x68>
  1130b1:	be 16 00 00 00       	mov    $0x16,%esi
  1130b6:	ff 15 2c 8c 1a 00    	call   *0x1a8c2c(%rip)        # 2bbce8 <_DYNAMIC+0x318>
  1130bc:	eb 3b                	jmp    1130f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc99>
  1130be:	48 8d 05 4b 37 1a 00 	lea    0x1a374b(%rip),%rax        # 2b6810 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x50>
  1130c5:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  1130cc:	00 
  1130cd:	4c 89 f7             	mov    %r14,%rdi
  1130d0:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
  1130d7:	00 
  1130d8:	ff 15 6a 8d 1a 00    	call   *0x1a8d6a(%rip)        # 2bbe48 <_DYNAMIC+0x478>
  1130de:	eb 19                	jmp    1130f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc99>
  1130e0:	48 8d 3d 6d e8 ef ff 	lea    -0x101793(%rip),%rdi        # 11954 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb42>
  1130e7:	48 8d 15 f2 36 1a 00 	lea    0x1a36f2(%rip),%rdx        # 2b67e0 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x20>
  1130ee:	be 16 00 00 00       	mov    $0x16,%esi
  1130f3:	ff 15 ef 8b 1a 00    	call   *0x1a8bef(%rip)        # 2bbce8 <_DYNAMIC+0x318>
  1130f9:	0f 0b                	ud2
  1130fb:	eb 0b                	jmp    113108 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xca8>
  1130fd:	eb 00                	jmp    1130ff <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc9f>
  1130ff:	48 89 c3             	mov    %rax,%rbx
  113102:	eb 14                	jmp    113118 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xcb8>
  113104:	eb 02                	jmp    113108 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xca8>
  113106:	eb 00                	jmp    113108 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xca8>
  113108:	48 89 c3             	mov    %rax,%rbx
  11310b:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  113112:	00 
  113113:	e8 d8 02 00 00       	call   1133f0 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17hf33c9ca44255dc61E>
  113118:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  11311d:	48 85 f6             	test   %rsi,%rsi
  113120:	74 14                	je     113136 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xcd6>
  113122:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  113127:	48 c1 e6 04          	shl    $0x4,%rsi
  11312b:	ba 08 00 00 00       	mov    $0x8,%edx
  113130:	ff 15 8a 8b 1a 00    	call   *0x1a8b8a(%rip)        # 2bbcc0 <_DYNAMIC+0x2f0>
  113136:	48 89 df             	mov    %rbx,%rdi
  113139:	e8 32 19 1a 00       	call   2b4a70 <_Unwind_Resume@plt>
  11313e:	ff 15 84 8b 1a 00    	call   *0x1a8b84(%rip)        # 2bbcc8 <_DYNAMIC+0x2f8>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
