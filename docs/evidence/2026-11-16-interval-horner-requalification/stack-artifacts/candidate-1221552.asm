
/tmp/interval-refactor/horner-current/stack-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

000000000012a3b0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero>:
  12a3b0:	55                   	push   %rbp
  12a3b1:	41 57                	push   %r15
  12a3b3:	41 56                	push   %r14
  12a3b5:	41 55                	push   %r13
  12a3b7:	41 54                	push   %r12
  12a3b9:	53                   	push   %rbx
  12a3ba:	48 81 ec b8 02 00 00 	sub    $0x2b8,%rsp
  12a3c1:	44 89 44 24 4c       	mov    %r8d,0x4c(%rsp)
  12a3c6:	48 89 f3             	mov    %rsi,%rbx
  12a3c9:	49 89 fd             	mov    %rdi,%r13
  12a3cc:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  12a3d3:	00 
  12a3d4:	80 3a 00             	cmpb   $0x0,(%rdx)
  12a3d7:	48 89 8c 24 18 02 00 	mov    %rcx,0x218(%rsp)
  12a3de:	00 
  12a3df:	75 29                	jne    12a40a <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5a>
  12a3e1:	80 39 00             	cmpb   $0x0,(%rcx)
  12a3e4:	75 24                	jne    12a40a <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5a>
  12a3e6:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  12a3ed:	00 
  12a3ee:	4c 8d 70 10          	lea    0x10(%rax),%r14
  12a3f2:	4c 8d 79 10          	lea    0x10(%rcx),%r15
  12a3f6:	4c 89 f7             	mov    %r14,%rdi
  12a3f9:	4c 89 fe             	mov    %r15,%rsi
  12a3fc:	ff 15 2e b8 17 00    	call   *0x17b82e(%rip)        # 2a5c30 <_DYNAMIC+0x320>
  12a402:	84 c0                	test   %al,%al
  12a404:	0f 8e c0 09 00 00    	jle    12adca <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa1a>
  12a40a:	48 85 db             	test   %rbx,%rbx
  12a40d:	0f 84 a3 09 00 00    	je     12adb6 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa06>
  12a413:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  12a417:	48 c1 e0 04          	shl    $0x4,%rax
  12a41b:	4a 8d 34 28          	lea    (%rax,%r13,1),%rsi
  12a41f:	48 83 c6 d0          	add    $0xffffffffffffffd0,%rsi
  12a423:	4c 8d b4 24 88 02 00 	lea    0x288(%rsp),%r14
  12a42a:	00 
  12a42b:	4c 89 f7             	mov    %r14,%rdi
  12a42e:	e8 0d a9 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a433:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  12a43a:	00 
  12a43b:	4c 89 f6             	mov    %r14,%rsi
  12a43e:	e8 fd a8 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a443:	0f 10 84 24 88 02 00 	movups 0x288(%rsp),%xmm0
  12a44a:	00 
  12a44b:	0f 10 8c 24 98 02 00 	movups 0x298(%rsp),%xmm1
  12a452:	00 
  12a453:	0f 10 94 24 a8 02 00 	movups 0x2a8(%rsp),%xmm2
  12a45a:	00 
  12a45b:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  12a462:	00 
  12a463:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  12a46a:	00 
  12a46b:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  12a472:	00 
  12a473:	48 c1 e3 04          	shl    $0x4,%rbx
  12a477:	48 8d 0c 5b          	lea    (%rbx,%rbx,2),%rcx
  12a47b:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  12a482:	00 
  12a483:	48 83 f9 30          	cmp    $0x30,%rcx
  12a487:	0f 84 37 07 00 00    	je     12abc4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x814>
  12a48d:	4c 8d a4 24 20 01 00 	lea    0x120(%rsp),%r12
  12a494:	00 
  12a495:	48 8d ac 24 50 01 00 	lea    0x150(%rsp),%rbp
  12a49c:	00 
  12a49d:	4c 8d b4 24 80 01 00 	lea    0x180(%rsp),%r14
  12a4a4:	00 
  12a4a5:	49 83 c5 a0          	add    $0xffffffffffffffa0,%r13
  12a4a9:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
  12a4ae:	89 44 24 08          	mov    %eax,0x8(%rsp)
  12a4b2:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
  12a4b7:	eb 2a                	jmp    12a4e3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x133>
  12a4b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  12a4c0:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  12a4c7:	00 
  12a4c8:	48 83 c1 d0          	add    $0xffffffffffffffd0,%rcx
  12a4cc:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  12a4d3:	00 
  12a4d4:	48 83 f9 30          	cmp    $0x30,%rcx
  12a4d8:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
  12a4dd:	0f 84 e1 06 00 00    	je     12abc4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x814>
  12a4e3:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12a4e8:	48 8d 9c 24 e0 01 00 	lea    0x1e0(%rsp),%rbx
  12a4ef:	00 
  12a4f0:	48 89 de             	mov    %rbx,%rsi
  12a4f3:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  12a4fa:	00 
  12a4fb:	e8 20 30 ff ff       	call   11d520 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  12a500:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12a507:	00 
  12a508:	48 89 de             	mov    %rbx,%rsi
  12a50b:	48 8b 9c 24 18 02 00 	mov    0x218(%rsp),%rbx
  12a512:	00 
  12a513:	48 89 da             	mov    %rbx,%rdx
  12a516:	e8 05 30 ff ff       	call   11d520 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  12a51b:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12a522:	00 
  12a523:	4c 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%r15
  12a52a:	00 
  12a52b:	4c 89 fe             	mov    %r15,%rsi
  12a52e:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  12a535:	00 
  12a536:	e8 e5 2f ff ff       	call   11d520 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  12a53b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a540:	4c 89 fe             	mov    %r15,%rsi
  12a543:	48 89 da             	mov    %rbx,%rdx
  12a546:	e8 d5 2f ff ff       	call   11d520 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  12a54b:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  12a550:	0f 10 4c 24 60       	movups 0x60(%rsp),%xmm1
  12a555:	0f 10 54 24 70       	movups 0x70(%rsp),%xmm2
  12a55a:	0f 29 94 24 10 01 00 	movaps %xmm2,0x110(%rsp)
  12a561:	00 
  12a562:	0f 29 8c 24 00 01 00 	movaps %xmm1,0x100(%rsp)
  12a569:	00 
  12a56a:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  12a571:	00 
  12a572:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  12a579:	00 
  12a57a:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  12a581:	00 
  12a582:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  12a589:	00 
  12a58a:	41 0f 11 54 24 20    	movups %xmm2,0x20(%r12)
  12a590:	41 0f 11 4c 24 10    	movups %xmm1,0x10(%r12)
  12a596:	41 0f 11 04 24       	movups %xmm0,(%r12)
  12a59b:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  12a5a2:	00 
  12a5a3:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  12a5aa:	00 
  12a5ab:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  12a5b2:	00 
  12a5b3:	0f 11 55 20          	movups %xmm2,0x20(%rbp)
  12a5b7:	0f 11 4d 10          	movups %xmm1,0x10(%rbp)
  12a5bb:	0f 11 45 00          	movups %xmm0,0x0(%rbp)
  12a5bf:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a5c4:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a5c9:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a5ce:	41 0f 11 56 20       	movups %xmm2,0x20(%r14)
  12a5d3:	41 0f 11 4e 10       	movups %xmm1,0x10(%r14)
  12a5d8:	41 0f 11 06          	movups %xmm0,(%r14)
  12a5dc:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12a5e1:	48 8d 9c 24 f0 00 00 	lea    0xf0(%rsp),%rbx
  12a5e8:	00 
  12a5e9:	48 89 de             	mov    %rbx,%rsi
  12a5ec:	e8 4f a7 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a5f1:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12a5f8:	00 
  12a5f9:	48 89 de             	mov    %rbx,%rsi
  12a5fc:	e8 3f a7 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a601:	4c 89 e7             	mov    %r12,%rdi
  12a604:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  12a609:	8b 54 24 08          	mov    0x8(%rsp),%edx
  12a60d:	e8 4e 6c 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12a612:	3c ff                	cmp    $0xff,%al
  12a614:	74 1a                	je     12a630 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x280>
  12a616:	0f b6 c0             	movzbl %al,%eax
  12a619:	3d fe 00 00 00       	cmp    $0xfe,%eax
  12a61e:	75 45                	jne    12a665 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2b5>
  12a620:	e9 b7 06 00 00       	jmp    12acdc <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  12a625:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  12a62c:	00 00 00 00 
  12a630:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a635:	4c 89 e6             	mov    %r12,%rsi
  12a638:	e8 03 a7 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a63d:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12a642:	e8 d9 84 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a647:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a64c:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a651:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a656:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  12a65b:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  12a660:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  12a665:	4c 89 e7             	mov    %r12,%rdi
  12a668:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  12a66f:	00 
  12a670:	8b 54 24 08          	mov    0x8(%rsp),%edx
  12a674:	e8 e7 6b 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12a679:	3c 01                	cmp    $0x1,%al
  12a67b:	74 13                	je     12a690 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2e0>
  12a67d:	0f b6 c0             	movzbl %al,%eax
  12a680:	3d fe 00 00 00       	cmp    $0xfe,%eax
  12a685:	75 4a                	jne    12a6d1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x321>
  12a687:	e9 50 06 00 00       	jmp    12acdc <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  12a68c:	0f 1f 40 00          	nopl   0x0(%rax)
  12a690:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a695:	4c 89 e6             	mov    %r12,%rsi
  12a698:	e8 a3 a6 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a69d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12a6a4:	00 
  12a6a5:	e8 76 84 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a6aa:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a6af:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a6b4:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a6b9:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  12a6c0:	00 
  12a6c1:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  12a6c8:	00 
  12a6c9:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  12a6d0:	00 
  12a6d1:	48 89 ef             	mov    %rbp,%rdi
  12a6d4:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  12a6d9:	8b 54 24 08          	mov    0x8(%rsp),%edx
  12a6dd:	e8 7e 6b 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12a6e2:	3c ff                	cmp    $0xff,%al
  12a6e4:	74 1a                	je     12a700 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x350>
  12a6e6:	0f b6 c0             	movzbl %al,%eax
  12a6e9:	3d fe 00 00 00       	cmp    $0xfe,%eax
  12a6ee:	75 45                	jne    12a735 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x385>
  12a6f0:	e9 e7 05 00 00       	jmp    12acdc <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  12a6f5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  12a6fc:	00 00 00 00 
  12a700:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a705:	48 89 ee             	mov    %rbp,%rsi
  12a708:	e8 33 a6 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a70d:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12a712:	e8 09 84 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a717:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a71c:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a721:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a726:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  12a72b:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  12a730:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  12a735:	48 89 ef             	mov    %rbp,%rdi
  12a738:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  12a73f:	00 
  12a740:	8b 54 24 08          	mov    0x8(%rsp),%edx
  12a744:	e8 17 6b 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12a749:	3c 01                	cmp    $0x1,%al
  12a74b:	74 13                	je     12a760 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3b0>
  12a74d:	0f b6 c0             	movzbl %al,%eax
  12a750:	3d fe 00 00 00       	cmp    $0xfe,%eax
  12a755:	75 4a                	jne    12a7a1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f1>
  12a757:	e9 80 05 00 00       	jmp    12acdc <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  12a75c:	0f 1f 40 00          	nopl   0x0(%rax)
  12a760:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a765:	48 89 ee             	mov    %rbp,%rsi
  12a768:	e8 d3 a5 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a76d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12a774:	00 
  12a775:	e8 a6 83 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a77a:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a77f:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a784:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a789:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  12a790:	00 
  12a791:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  12a798:	00 
  12a799:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  12a7a0:	00 
  12a7a1:	4c 89 f7             	mov    %r14,%rdi
  12a7a4:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  12a7a9:	8b 54 24 08          	mov    0x8(%rsp),%edx
  12a7ad:	e8 ae 6a 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12a7b2:	3c ff                	cmp    $0xff,%al
  12a7b4:	74 1a                	je     12a7d0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x420>
  12a7b6:	0f b6 c0             	movzbl %al,%eax
  12a7b9:	3d fe 00 00 00       	cmp    $0xfe,%eax
  12a7be:	75 45                	jne    12a805 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x455>
  12a7c0:	e9 17 05 00 00       	jmp    12acdc <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  12a7c5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  12a7cc:	00 00 00 00 
  12a7d0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a7d5:	4c 89 f6             	mov    %r14,%rsi
  12a7d8:	e8 63 a5 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a7dd:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12a7e2:	e8 39 83 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a7e7:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a7ec:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a7f1:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a7f6:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  12a7fb:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  12a800:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  12a805:	4c 89 f7             	mov    %r14,%rdi
  12a808:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  12a80f:	00 
  12a810:	8b 54 24 08          	mov    0x8(%rsp),%edx
  12a814:	e8 47 6a 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12a819:	3c 01                	cmp    $0x1,%al
  12a81b:	74 13                	je     12a830 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x480>
  12a81d:	0f b6 c0             	movzbl %al,%eax
  12a820:	3d fe 00 00 00       	cmp    $0xfe,%eax
  12a825:	75 4a                	jne    12a871 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x4c1>
  12a827:	e9 b0 04 00 00       	jmp    12acdc <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  12a82c:	0f 1f 40 00          	nopl   0x0(%rax)
  12a830:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12a835:	4c 89 f6             	mov    %r14,%rsi
  12a838:	e8 03 a5 00 00       	call   134d40 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.15342522632802571574>
  12a83d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12a844:	00 
  12a845:	e8 d6 82 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a84a:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12a84f:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12a854:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12a859:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  12a860:	00 
  12a861:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  12a868:	00 
  12a869:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  12a870:	00 
  12a871:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  12a878:	00 
  12a879:	49 01 c5             	add    %rax,%r13
  12a87c:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  12a881:	0f 28 4c 24 60       	movaps 0x60(%rsp),%xmm1
  12a886:	0f 28 54 24 70       	movaps 0x70(%rsp),%xmm2
  12a88b:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  12a890:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  12a895:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  12a89a:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12a8a1:	00 
  12a8a2:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  12a8a7:	48 89 de             	mov    %rbx,%rsi
  12a8aa:	4c 89 ea             	mov    %r13,%rdx
  12a8ad:	e8 ce f4 fe ff       	call   119d80 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs23PzJKl0dyV_10hypersolve>
  12a8b2:	48 89 df             	mov    %rbx,%rdi
  12a8b5:	e8 86 e2 fe ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  12a8ba:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  12a8c1:	00 
  12a8c2:	e8 59 82 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a8c7:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  12a8ce:	00 
  12a8cf:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  12a8d6:	00 
  12a8d7:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  12a8de:	00 
  12a8df:	0f 29 94 24 00 02 00 	movaps %xmm2,0x200(%rsp)
  12a8e6:	00 
  12a8e7:	0f 29 8c 24 f0 01 00 	movaps %xmm1,0x1f0(%rsp)
  12a8ee:	00 
  12a8ef:	0f 29 84 24 e0 01 00 	movaps %xmm0,0x1e0(%rsp)
  12a8f6:	00 
  12a8f7:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
  12a8fe:	00 
  12a8ff:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
  12a906:	00 
  12a907:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
  12a90e:	00 
  12a90f:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  12a914:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  12a919:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  12a91e:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12a925:	00 
  12a926:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  12a92b:	48 89 de             	mov    %rbx,%rsi
  12a92e:	4c 89 ea             	mov    %r13,%rdx
  12a931:	e8 4a f4 fe ff       	call   119d80 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs23PzJKl0dyV_10hypersolve>
  12a936:	48 89 df             	mov    %rbx,%rdi
  12a939:	e8 02 e2 fe ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  12a93e:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  12a945:	00 
  12a946:	e8 d5 81 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a94b:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  12a952:	00 
  12a953:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  12a95a:	00 
  12a95b:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  12a962:	00 
  12a963:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  12a96a:	00 
  12a96b:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  12a972:	00 
  12a973:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  12a97a:	00 
  12a97b:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
  12a982:	00 
  12a983:	f0 48 ff 08          	lock decq (%rax)
  12a987:	75 1b                	jne    12a9a4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5f4>
  12a989:	bb 01 00 00 00       	mov    $0x1,%ebx
  12a98e:	4c 8d ac 24 f0 00 00 	lea    0xf0(%rsp),%r13
  12a995:	00 
  12a996:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  12a99d:	00 
  12a99e:	ff 15 cc b1 17 00    	call   *0x17b1cc(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12a9a4:	bb 01 00 00 00       	mov    $0x1,%ebx
  12a9a9:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12a9b0:	00 
  12a9b1:	49 89 fd             	mov    %rdi,%r13
  12a9b4:	e8 27 82 ff ff       	call   122be0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12a9b9:	48 8b 84 24 08 01 00 	mov    0x108(%rsp),%rax
  12a9c0:	00 
  12a9c1:	48 85 c0             	test   %rax,%rax
  12a9c4:	74 4a                	je     12aa10 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x660>
  12a9c6:	f0 48 ff 08          	lock decq (%rax)
  12a9ca:	75 1b                	jne    12a9e7 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x637>
  12a9cc:	bb 01 00 00 00       	mov    $0x1,%ebx
  12a9d1:	4c 8d ac 24 f0 00 00 	lea    0xf0(%rsp),%r13
  12a9d8:	00 
  12a9d9:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  12a9e0:	00 
  12a9e1:	ff 15 79 b1 17 00    	call   *0x17b179(%rip)        # 2a5b60 <_DYNAMIC+0x250>
  12a9e7:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
  12a9ee:	00 
  12a9ef:	48 85 c0             	test   %rax,%rax
  12a9f2:	74 1c                	je     12aa10 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x660>
  12a9f4:	f0 48 ff 08          	lock decq (%rax)
  12a9f8:	75 16                	jne    12aa10 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x660>
  12a9fa:	bb 01 00 00 00       	mov    $0x1,%ebx
  12a9ff:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  12aa06:	00 
  12aa07:	ff 15 5b b1 17 00    	call   *0x17b15b(%rip)        # 2a5b68 <_DYNAMIC+0x258>
  12aa0d:	0f 1f 00             	nopl   (%rax)
  12aa10:	48 8b 84 24 30 01 00 	mov    0x130(%rsp),%rax
  12aa17:	00 
  12aa18:	f0 48 ff 08          	lock decq (%rax)
  12aa1c:	75 16                	jne    12aa34 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x684>
  12aa1e:	bb 02 00 00 00       	mov    $0x2,%ebx
  12aa23:	4d 89 e5             	mov    %r12,%r13
  12aa26:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  12aa2d:	00 
  12aa2e:	ff 15 3c b1 17 00    	call   *0x17b13c(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12aa34:	bb 02 00 00 00       	mov    $0x2,%ebx
  12aa39:	4c 89 e7             	mov    %r12,%rdi
  12aa3c:	4d 89 e5             	mov    %r12,%r13
  12aa3f:	e8 9c 81 ff ff       	call   122be0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12aa44:	48 8b 84 24 38 01 00 	mov    0x138(%rsp),%rax
  12aa4b:	00 
  12aa4c:	48 85 c0             	test   %rax,%rax
  12aa4f:	74 4f                	je     12aaa0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6f0>
  12aa51:	f0 48 ff 08          	lock decq (%rax)
  12aa55:	75 16                	jne    12aa6d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6bd>
  12aa57:	bb 02 00 00 00       	mov    $0x2,%ebx
  12aa5c:	4d 89 e5             	mov    %r12,%r13
  12aa5f:	48 8d bc 24 38 01 00 	lea    0x138(%rsp),%rdi
  12aa66:	00 
  12aa67:	ff 15 f3 b0 17 00    	call   *0x17b0f3(%rip)        # 2a5b60 <_DYNAMIC+0x250>
  12aa6d:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  12aa74:	00 
  12aa75:	48 85 c0             	test   %rax,%rax
  12aa78:	74 26                	je     12aaa0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6f0>
  12aa7a:	f0 48 ff 08          	lock decq (%rax)
  12aa7e:	75 20                	jne    12aaa0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6f0>
  12aa80:	bb 02 00 00 00       	mov    $0x2,%ebx
  12aa85:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  12aa8c:	00 
  12aa8d:	ff 15 d5 b0 17 00    	call   *0x17b0d5(%rip)        # 2a5b68 <_DYNAMIC+0x258>
  12aa93:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12aa9a:	84 00 00 00 00 00 
  12aaa0:	48 8b 84 24 60 01 00 	mov    0x160(%rsp),%rax
  12aaa7:	00 
  12aaa8:	f0 48 ff 08          	lock decq (%rax)
  12aaac:	75 16                	jne    12aac4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x714>
  12aaae:	bb 03 00 00 00       	mov    $0x3,%ebx
  12aab3:	49 89 ed             	mov    %rbp,%r13
  12aab6:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  12aabd:	00 
  12aabe:	ff 15 ac b0 17 00    	call   *0x17b0ac(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12aac4:	bb 03 00 00 00       	mov    $0x3,%ebx
  12aac9:	48 89 ef             	mov    %rbp,%rdi
  12aacc:	49 89 ed             	mov    %rbp,%r13
  12aacf:	e8 0c 81 ff ff       	call   122be0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12aad4:	48 8b 84 24 68 01 00 	mov    0x168(%rsp),%rax
  12aadb:	00 
  12aadc:	48 85 c0             	test   %rax,%rax
  12aadf:	74 4f                	je     12ab30 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x780>
  12aae1:	f0 48 ff 08          	lock decq (%rax)
  12aae5:	75 16                	jne    12aafd <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x74d>
  12aae7:	bb 03 00 00 00       	mov    $0x3,%ebx
  12aaec:	49 89 ed             	mov    %rbp,%r13
  12aaef:	48 8d bc 24 68 01 00 	lea    0x168(%rsp),%rdi
  12aaf6:	00 
  12aaf7:	ff 15 63 b0 17 00    	call   *0x17b063(%rip)        # 2a5b60 <_DYNAMIC+0x250>
  12aafd:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  12ab04:	00 
  12ab05:	48 85 c0             	test   %rax,%rax
  12ab08:	74 26                	je     12ab30 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x780>
  12ab0a:	f0 48 ff 08          	lock decq (%rax)
  12ab0e:	75 20                	jne    12ab30 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x780>
  12ab10:	bb 03 00 00 00       	mov    $0x3,%ebx
  12ab15:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  12ab1c:	00 
  12ab1d:	ff 15 45 b0 17 00    	call   *0x17b045(%rip)        # 2a5b68 <_DYNAMIC+0x258>
  12ab23:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12ab2a:	84 00 00 00 00 00 
  12ab30:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
  12ab37:	00 
  12ab38:	f0 48 ff 08          	lock decq (%rax)
  12ab3c:	75 16                	jne    12ab54 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7a4>
  12ab3e:	bb 04 00 00 00       	mov    $0x4,%ebx
  12ab43:	4d 89 f5             	mov    %r14,%r13
  12ab46:	48 8d bc 24 90 01 00 	lea    0x190(%rsp),%rdi
  12ab4d:	00 
  12ab4e:	ff 15 1c b0 17 00    	call   *0x17b01c(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12ab54:	bb 04 00 00 00       	mov    $0x4,%ebx
  12ab59:	4c 89 f7             	mov    %r14,%rdi
  12ab5c:	4d 89 f5             	mov    %r14,%r13
  12ab5f:	e8 7c 80 ff ff       	call   122be0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ab64:	48 8b 84 24 98 01 00 	mov    0x198(%rsp),%rax
  12ab6b:	00 
  12ab6c:	48 85 c0             	test   %rax,%rax
  12ab6f:	0f 84 4b f9 ff ff    	je     12a4c0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  12ab75:	f0 48 ff 08          	lock decq (%rax)
  12ab79:	75 16                	jne    12ab91 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7e1>
  12ab7b:	bb 04 00 00 00       	mov    $0x4,%ebx
  12ab80:	4d 89 f5             	mov    %r14,%r13
  12ab83:	48 8d bc 24 98 01 00 	lea    0x198(%rsp),%rdi
  12ab8a:	00 
  12ab8b:	ff 15 cf af 17 00    	call   *0x17afcf(%rip)        # 2a5b60 <_DYNAMIC+0x250>
  12ab91:	48 8b 84 24 a0 01 00 	mov    0x1a0(%rsp),%rax
  12ab98:	00 
  12ab99:	48 85 c0             	test   %rax,%rax
  12ab9c:	0f 84 1e f9 ff ff    	je     12a4c0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  12aba2:	f0 48 ff 08          	lock decq (%rax)
  12aba6:	0f 85 14 f9 ff ff    	jne    12a4c0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  12abac:	bb 04 00 00 00       	mov    $0x4,%ebx
  12abb1:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  12abb8:	00 
  12abb9:	ff 15 a9 af 17 00    	call   *0x17afa9(%rip)        # 2a5b68 <_DYNAMIC+0x258>
  12abbf:	e9 fc f8 ff ff       	jmp    12a4c0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  12abc4:	0f b6 8c 24 e0 01 00 	movzbl 0x1e0(%rsp),%ecx
  12abcb:	00 
  12abcc:	0f 10 84 24 e1 01 00 	movups 0x1e1(%rsp),%xmm0
  12abd3:	00 
  12abd4:	0f 29 84 24 20 02 00 	movaps %xmm0,0x220(%rsp)
  12abdb:	00 
  12abdc:	0f 10 84 24 f1 01 00 	movups 0x1f1(%rsp),%xmm0
  12abe3:	00 
  12abe4:	0f 29 84 24 30 02 00 	movaps %xmm0,0x230(%rsp)
  12abeb:	00 
  12abec:	0f 10 84 24 00 02 00 	movups 0x200(%rsp),%xmm0
  12abf3:	00 
  12abf4:	0f 11 84 24 3f 02 00 	movups %xmm0,0x23f(%rsp)
  12abfb:	00 
  12abfc:	0f 28 84 24 b0 01 00 	movaps 0x1b0(%rsp),%xmm0
  12ac03:	00 
  12ac04:	0f 28 8c 24 c0 01 00 	movaps 0x1c0(%rsp),%xmm1
  12ac0b:	00 
  12ac0c:	0f 28 94 24 d0 01 00 	movaps 0x1d0(%rsp),%xmm2
  12ac13:	00 
  12ac14:	0f 29 84 24 50 02 00 	movaps %xmm0,0x250(%rsp)
  12ac1b:	00 
  12ac1c:	0f 29 8c 24 60 02 00 	movaps %xmm1,0x260(%rsp)
  12ac23:	00 
  12ac24:	0f 29 94 24 70 02 00 	movaps %xmm2,0x270(%rsp)
  12ac2b:	00 
  12ac2c:	b0 02                	mov    $0x2,%al
  12ac2e:	80 f9 ff             	cmp    $0xff,%cl
  12ac31:	0f 84 81 01 00 00    	je     12adb8 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa08>
  12ac37:	0f 10 84 24 3f 02 00 	movups 0x23f(%rsp),%xmm0
  12ac3e:	00 
  12ac3f:	0f 11 84 24 d0 00 00 	movups %xmm0,0xd0(%rsp)
  12ac46:	00 
  12ac47:	0f 28 84 24 20 02 00 	movaps 0x220(%rsp),%xmm0
  12ac4e:	00 
  12ac4f:	0f 28 8c 24 30 02 00 	movaps 0x230(%rsp),%xmm1
  12ac56:	00 
  12ac57:	0f 11 8c 24 c1 00 00 	movups %xmm1,0xc1(%rsp)
  12ac5e:	00 
  12ac5f:	0f 11 84 24 b1 00 00 	movups %xmm0,0xb1(%rsp)
  12ac66:	00 
  12ac67:	0f 28 84 24 50 02 00 	movaps 0x250(%rsp),%xmm0
  12ac6e:	00 
  12ac6f:	0f 28 8c 24 60 02 00 	movaps 0x260(%rsp),%xmm1
  12ac76:	00 
  12ac77:	0f 28 94 24 70 02 00 	movaps 0x270(%rsp),%xmm2
  12ac7e:	00 
  12ac7f:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  12ac84:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  12ac89:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  12ac8e:	88 8c 24 b0 00 00 00 	mov    %cl,0xb0(%rsp)
  12ac95:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12ac9c:	00 
  12ac9d:	ff 15 15 af 17 00    	call   *0x17af15(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  12aca3:	0f b6 6c 24 4c       	movzbl 0x4c(%rsp),%ebp
  12aca8:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12acaf:	00 
  12acb0:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
  12acb7:	00 
  12acb8:	89 ea                	mov    %ebp,%edx
  12acba:	e8 a1 65 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12acbf:	89 c3                	mov    %eax,%ebx
  12acc1:	80 fb fe             	cmp    $0xfe,%bl
  12acc4:	0f 85 91 00 00 00    	jne    12ad5b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x9ab>
  12acca:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12acd1:	00 
  12acd2:	e8 49 7e ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12acd7:	e9 c3 00 00 00       	jmp    12ad9f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x9ef>
  12acdc:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12ace3:	00 
  12ace4:	e8 37 7e ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ace9:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12acee:	e8 2d 7e ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12acf3:	bb 01 00 00 00       	mov    $0x1,%ebx
  12acf8:	31 ed                	xor    %ebp,%ebp
  12acfa:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12ad01:	00 
  12ad02:	e8 19 7e ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad07:	bb 02 00 00 00       	mov    $0x2,%ebx
  12ad0c:	31 ed                	xor    %ebp,%ebp
  12ad0e:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  12ad15:	00 
  12ad16:	e8 05 7e ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad1b:	bb 03 00 00 00       	mov    $0x3,%ebx
  12ad20:	31 ed                	xor    %ebp,%ebp
  12ad22:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  12ad29:	00 
  12ad2a:	e8 f1 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad2f:	bb 04 00 00 00       	mov    $0x4,%ebx
  12ad34:	40 b5 01             	mov    $0x1,%bpl
  12ad37:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  12ad3e:	00 
  12ad3f:	e8 dc 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad44:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  12ad4b:	00 
  12ad4c:	e8 cf 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad51:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  12ad58:	00 
  12ad59:	eb 56                	jmp    12adb1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa01>
  12ad5b:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12ad62:	00 
  12ad63:	e8 b8 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad68:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12ad6f:	00 
  12ad70:	ff 15 42 ae 17 00    	call   *0x17ae42(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  12ad76:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12ad7b:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
  12ad82:	00 
  12ad83:	89 ea                	mov    %ebp,%edx
  12ad85:	e8 d6 64 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  12ad8a:	89 c5                	mov    %eax,%ebp
  12ad8c:	40 80 fd fe          	cmp    $0xfe,%bpl
  12ad90:	75 5b                	jne    12aded <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa3d>
  12ad92:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12ad99:	00 
  12ad9a:	e8 81 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ad9f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12ada4:	e8 77 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ada9:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12adb0:	00 
  12adb1:	e8 6a 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12adb6:	b0 02                	mov    $0x2,%al
  12adb8:	48 81 c4 b8 02 00 00 	add    $0x2b8,%rsp
  12adbf:	5b                   	pop    %rbx
  12adc0:	41 5c                	pop    %r12
  12adc2:	41 5d                	pop    %r13
  12adc4:	41 5e                	pop    %r14
  12adc6:	41 5f                	pop    %r15
  12adc8:	5d                   	pop    %rbp
  12adc9:	c3                   	ret
  12adca:	48 85 db             	test   %rbx,%rbx
  12adcd:	74 e7                	je     12adb6 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa06>
  12adcf:	48 89 d8             	mov    %rbx,%rax
  12add2:	48 c1 e0 04          	shl    $0x4,%rax
  12add6:	4c 89 e9             	mov    %r13,%rcx
  12add9:	4c 8d 2c 40          	lea    (%rax,%rax,2),%r13
  12addd:	42 80 7c 29 d0 00    	cmpb   $0x0,-0x30(%rcx,%r13,1)
  12ade3:	74 3f                	je     12ae24 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa74>
  12ade5:	49 89 cd             	mov    %rcx,%r13
  12ade8:	e9 26 f6 ff ff       	jmp    12a413 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x63>
  12aded:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12adf4:	00 
  12adf5:	e8 26 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12adfa:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12adff:	e8 1c 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ae04:	80 fb 01             	cmp    $0x1,%bl
  12ae07:	0f 94 c0             	sete   %al
  12ae0a:	40 80 fd ff          	cmp    $0xff,%bpl
  12ae0e:	0f 94 c3             	sete   %bl
  12ae11:	08 c3                	or     %al,%bl
  12ae13:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12ae1a:	00 
  12ae1b:	e8 00 7d ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12ae20:	89 d8                	mov    %ebx,%eax
  12ae22:	eb 94                	jmp    12adb8 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa08>
  12ae24:	4a 8b 44 29 e0       	mov    -0x20(%rcx,%r13,1),%rax
  12ae29:	f0 48 ff 00          	lock incq (%rax)
  12ae2d:	0f 8e 2a 01 00 00    	jle    12af5d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbad>
  12ae33:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
  12ae38:	4a 8b 44 29 e0       	mov    -0x20(%rcx,%r13,1),%rax
  12ae3d:	f0 48 ff 00          	lock incq (%rax)
  12ae41:	0f 8e 16 01 00 00    	jle    12af5d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbad>
  12ae47:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  12ae4e:	00 
  12ae4f:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
  12ae56:	00 
  12ae57:	48 89 c2             	mov    %rax,%rdx
  12ae5a:	48 83 fb 01          	cmp    $0x1,%rbx
  12ae5e:	75 20                	jne    12ae80 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xad0>
  12ae60:	b1 01                	mov    $0x1,%cl
  12ae62:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  12ae66:	74 07                	je     12ae6f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xabf>
  12ae68:	80 7a 64 00          	cmpb   $0x0,0x64(%rdx)
  12ae6c:	0f 94 c1             	sete   %cl
  12ae6f:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12ae76:	00 
  12ae77:	89 cb                	mov    %ecx,%ebx
  12ae79:	e8 32 7c ff ff       	call   122ab0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  12ae7e:	eb a0                	jmp    12ae20 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa70>
  12ae80:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  12ae85:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  12ae89:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  12ae8e:	eb 3e                	jmp    12aece <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb1e>
  12ae90:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12ae95:	4a 8d 14 28          	lea    (%rax,%r13,1),%rdx
  12ae99:	4c 89 a4 24 f0 00 00 	mov    %r12,0xf0(%rsp)
  12aea0:	00 
  12aea1:	48 89 ac 24 f8 00 00 	mov    %rbp,0xf8(%rsp)
  12aea8:	00 
  12aea9:	4c 89 e7             	mov    %r12,%rdi
  12aeac:	48 89 ee             	mov    %rbp,%rsi
  12aeaf:	e8 4c 71 ff ff       	call   122000 <_RINvNtCs7Oh8zmHsHuv_13hyperinterval8rational17translated_boundsNtNtNtCs8rd0GMicEM6_9hyperreal8rational10arithmetic8RationalECs23PzJKl0dyV_10hypersolve>
  12aeb4:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  12aebb:	00 
  12aebc:	48 89 94 24 f8 00 00 	mov    %rdx,0xf8(%rsp)
  12aec3:	00 
  12aec4:	49 83 c5 d0          	add    $0xffffffffffffffd0,%r13
  12aec8:	49 83 fd 30          	cmp    $0x30,%r13
  12aecc:	74 92                	je     12ae60 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xab0>
  12aece:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  12aed3:	42 80 7c 28 a0 00    	cmpb   $0x0,-0x60(%rax,%r13,1)
  12aed9:	75 62                	jne    12af3d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb8d>
  12aedb:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12aee2:	00 
  12aee3:	48 8d b4 24 f8 00 00 	lea    0xf8(%rsp),%rsi
  12aeea:	00 
  12aeeb:	4c 89 f2             	mov    %r14,%rdx
  12aeee:	4c 89 f9             	mov    %r15,%rcx
  12aef1:	e8 3a 5f 00 00       	call   130e30 <_RNvNtCs7Oh8zmHsHuv_13hyperinterval8rational12product_hull>
  12aef6:	49 89 c4             	mov    %rax,%r12
  12aef9:	48 89 d5             	mov    %rdx,%rbp
  12aefc:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  12af03:	00 
  12af04:	f0 48 ff 08          	lock decq (%rax)
  12af08:	75 0e                	jne    12af18 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb68>
  12af0a:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12af11:	00 
  12af12:	ff 15 58 ac 17 00    	call   *0x17ac58(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12af18:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
  12af1f:	00 
  12af20:	f0 48 ff 08          	lock decq (%rax)
  12af24:	0f 85 66 ff ff ff    	jne    12ae90 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae0>
  12af2a:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  12af31:	00 
  12af32:	ff 15 38 ac 17 00    	call   *0x17ac38(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12af38:	e9 53 ff ff ff       	jmp    12ae90 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae0>
  12af3d:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12af44:	00 
  12af45:	e8 66 7b ff ff       	call   122ab0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  12af4a:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
  12af4f:	48 85 db             	test   %rbx,%rbx
  12af52:	0f 85 bb f4 ff ff    	jne    12a413 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x63>
  12af58:	e9 59 fe ff ff       	jmp    12adb6 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa06>
  12af5d:	0f 0b                	ud2
  12af5f:	49 89 c7             	mov    %rax,%r15
  12af62:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
  12af69:	00 
  12af6a:	f0 48 ff 08          	lock decq (%rax)
  12af6e:	75 19                	jne    12af89 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbd9>
  12af70:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  12af77:	00 
  12af78:	ff 15 f2 ab 17 00    	call   *0x17abf2(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  12af7e:	eb 09                	jmp    12af89 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbd9>
  12af80:	ff 15 ca ab 17 00    	call   *0x17abca(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12af86:	49 89 c7             	mov    %rax,%r15
  12af89:	4c 89 a4 24 f0 00 00 	mov    %r12,0xf0(%rsp)
  12af90:	00 
  12af91:	48 89 ac 24 f8 00 00 	mov    %rbp,0xf8(%rsp)
  12af98:	00 
  12af99:	eb 03                	jmp    12af9e <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbee>
  12af9b:	49 89 c7             	mov    %rax,%r15
  12af9e:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12afa5:	00 
  12afa6:	e8 05 7b ff ff       	call   122ab0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  12afab:	e9 e6 02 00 00       	jmp    12b296 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xee6>
  12afb0:	ff 15 9a ab 17 00    	call   *0x17ab9a(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12afb6:	49 89 c7             	mov    %rax,%r15
  12afb9:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12afc0:	00 
  12afc1:	e8 5a 7b ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12afc6:	eb 2c                	jmp    12aff4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc44>
  12afc8:	49 89 c7             	mov    %rax,%r15
  12afcb:	eb 31                	jmp    12affe <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc4e>
  12afcd:	49 89 c7             	mov    %rax,%r15
  12afd0:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12afd7:	00 
  12afd8:	e8 43 7b ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12afdd:	eb 15                	jmp    12aff4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc44>
  12afdf:	49 89 c7             	mov    %rax,%r15
  12afe2:	e9 a2 02 00 00       	jmp    12b289 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xed9>
  12afe7:	e9 52 01 00 00       	jmp    12b13e <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd8e>
  12afec:	e9 45 01 00 00       	jmp    12b136 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd86>
  12aff1:	49 89 c7             	mov    %rax,%r15
  12aff4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12aff9:	e8 22 7b ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12affe:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12b005:	00 
  12b006:	e8 15 7b ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b00b:	e9 86 02 00 00       	jmp    12b296 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xee6>
  12b010:	49 89 c7             	mov    %rax,%r15
  12b013:	48 8d bc 24 88 02 00 	lea    0x288(%rsp),%rdi
  12b01a:	00 
  12b01b:	e8 00 7b ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b020:	e9 71 02 00 00       	jmp    12b296 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xee6>
  12b025:	ff 15 25 ab 17 00    	call   *0x17ab25(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b02b:	49 89 c7             	mov    %rax,%r15
  12b02e:	40 84 ed             	test   %bpl,%bpl
  12b031:	0f 85 45 02 00 00    	jne    12b27c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  12b037:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  12b03b:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  12b03f:	c1 e0 04             	shl    $0x4,%eax
  12b042:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  12b046:	49 81 c6 f0 00 00 00 	add    $0xf0,%r14
  12b04d:	0f 1f 00             	nopl   (%rax)
  12b050:	4c 89 f7             	mov    %r14,%rdi
  12b053:	e8 c8 7a ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b058:	49 83 c6 30          	add    $0x30,%r14
  12b05c:	48 ff c3             	inc    %rbx
  12b05f:	75 ef                	jne    12b050 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca0>
  12b061:	e9 16 02 00 00       	jmp    12b27c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  12b066:	ff 15 e4 aa 17 00    	call   *0x17aae4(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b06c:	49 89 c7             	mov    %rax,%r15
  12b06f:	e9 9b 01 00 00       	jmp    12b20f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  12b074:	49 89 c7             	mov    %rax,%r15
  12b077:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12b07c:	e8 bf da fe ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  12b081:	b3 01                	mov    $0x1,%bl
  12b083:	e9 cc 01 00 00       	jmp    12b254 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea4>
  12b088:	ff 15 c2 aa 17 00    	call   *0x17aac2(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b08e:	49 89 c7             	mov    %rax,%r15
  12b091:	b3 01                	mov    $0x1,%bl
  12b093:	e9 bc 01 00 00       	jmp    12b254 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea4>
  12b098:	49 89 c7             	mov    %rax,%r15
  12b09b:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  12b0a2:	00 
  12b0a3:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  12b0aa:	00 
  12b0ab:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  12b0b2:	00 
  12b0b3:	0f 29 94 24 00 02 00 	movaps %xmm2,0x200(%rsp)
  12b0ba:	00 
  12b0bb:	0f 29 8c 24 f0 01 00 	movaps %xmm1,0x1f0(%rsp)
  12b0c2:	00 
  12b0c3:	0f 29 84 24 e0 01 00 	movaps %xmm0,0x1e0(%rsp)
  12b0ca:	00 
  12b0cb:	b3 01                	mov    $0x1,%bl
  12b0cd:	e9 82 01 00 00       	jmp    12b254 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea4>
  12b0d2:	49 89 c7             	mov    %rax,%r15
  12b0d5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12b0da:	e8 61 da fe ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  12b0df:	e9 8b 01 00 00       	jmp    12b26f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  12b0e4:	ff 15 66 aa 17 00    	call   *0x17aa66(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b0ea:	eb 52                	jmp    12b13e <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd8e>
  12b0ec:	49 89 c7             	mov    %rax,%r15
  12b0ef:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  12b0f6:	00 
  12b0f7:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  12b0fe:	00 
  12b0ff:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  12b106:	00 
  12b107:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  12b10e:	00 
  12b10f:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  12b116:	00 
  12b117:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  12b11e:	00 
  12b11f:	e9 4b 01 00 00       	jmp    12b26f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  12b124:	49 89 c7             	mov    %rax,%r15
  12b127:	eb 2d                	jmp    12b156 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xda6>
  12b129:	49 89 c7             	mov    %rax,%r15
  12b12c:	eb 35                	jmp    12b163 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xdb3>
  12b12e:	49 89 c7             	mov    %rax,%r15
  12b131:	e9 46 01 00 00       	jmp    12b27c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  12b136:	49 89 c7             	mov    %rax,%r15
  12b139:	e9 27 01 00 00       	jmp    12b265 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xeb5>
  12b13e:	49 89 c7             	mov    %rax,%r15
  12b141:	e9 29 01 00 00       	jmp    12b26f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  12b146:	49 89 c7             	mov    %rax,%r15
  12b149:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  12b150:	00 
  12b151:	e8 ca 79 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b156:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12b15d:	00 
  12b15e:	e8 bd 79 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b163:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12b168:	e8 b3 79 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b16d:	e9 0a 01 00 00       	jmp    12b27c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  12b172:	49 89 c7             	mov    %rax,%r15
  12b175:	49 8b 45 20          	mov    0x20(%r13),%rax
  12b179:	48 85 c0             	test   %rax,%rax
  12b17c:	0f 84 8d 00 00 00    	je     12b20f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  12b182:	f0 48 ff 08          	lock decq (%rax)
  12b186:	0f 85 83 00 00 00    	jne    12b20f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  12b18c:	49 83 c5 20          	add    $0x20,%r13
  12b190:	4c 89 ef             	mov    %r13,%rdi
  12b193:	ff 15 cf a9 17 00    	call   *0x17a9cf(%rip)        # 2a5b68 <_DYNAMIC+0x258>
  12b199:	eb 74                	jmp    12b20f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  12b19b:	ff 15 af a9 17 00    	call   *0x17a9af(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b1a1:	49 89 c7             	mov    %rax,%r15
  12b1a4:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12b1a9:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12b1ae:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12b1b3:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  12b1ba:	00 
  12b1bb:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  12b1c2:	00 
  12b1c3:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  12b1ca:	00 
  12b1cb:	e9 82 00 00 00       	jmp    12b252 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea2>
  12b1d0:	49 89 c7             	mov    %rax,%r15
  12b1d3:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  12b1d8:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  12b1dd:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  12b1e2:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  12b1e7:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  12b1ec:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  12b1f1:	eb 5f                	jmp    12b252 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea2>
  12b1f3:	49 89 c7             	mov    %rax,%r15
  12b1f6:	4c 89 ef             	mov    %r13,%rdi
  12b1f9:	e8 e2 79 ff ff       	call   122be0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b1fe:	eb 03                	jmp    12b203 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe53>
  12b200:	49 89 c7             	mov    %rax,%r15
  12b203:	49 83 c5 18          	add    $0x18,%r13
  12b207:	4c 89 ef             	mov    %r13,%rdi
  12b20a:	e8 31 71 ff ff       	call   122340 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtNtCs8rd0GMicEM6_9hyperreal10computable4node10ComputableEECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b20f:	83 fb 04             	cmp    $0x4,%ebx
  12b212:	74 68                	je     12b27c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  12b214:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  12b218:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  12b21c:	c1 e0 04             	shl    $0x4,%eax
  12b21f:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  12b223:	49 81 c6 f0 00 00 00 	add    $0xf0,%r14
  12b22a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  12b230:	4c 89 f7             	mov    %r14,%rdi
  12b233:	e8 e8 78 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b238:	49 83 c6 30          	add    $0x30,%r14
  12b23c:	48 ff c3             	inc    %rbx
  12b23f:	75 ef                	jne    12b230 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe80>
  12b241:	eb 39                	jmp    12b27c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  12b243:	ff 15 07 a9 17 00    	call   *0x17a907(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b249:	ff 15 01 a9 17 00    	call   *0x17a901(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  12b24f:	49 89 c7             	mov    %rax,%r15
  12b252:	31 db                	xor    %ebx,%ebx
  12b254:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  12b25b:	00 
  12b25c:	e8 bf 78 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b261:	84 db                	test   %bl,%bl
  12b263:	75 0a                	jne    12b26f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  12b265:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  12b26a:	e8 b1 78 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b26f:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  12b276:	00 
  12b277:	e8 84 6e ff ff       	call   122100 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueANtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4Realj4_ECs23PzJKl0dyV_10hypersolve>
  12b27c:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  12b283:	00 
  12b284:	e8 97 78 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b289:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  12b290:	00 
  12b291:	e8 8a 78 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  12b296:	4c 89 ff             	mov    %r15,%rdi
  12b299:	e8 12 0f 17 00       	call   29c1b0 <_Unwind_Resume@plt>
  12b29e:	ff 15 ac a8 17 00    	call   *0x17a8ac(%rip)        # 2a5b50 <_DYNAMIC+0x240>
