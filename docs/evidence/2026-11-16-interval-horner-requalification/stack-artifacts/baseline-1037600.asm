
/tmp/interval-refactor/horner-current/stack-artifacts/baseline:     file format elf64-x86-64


Disassembly of section .text:

00000000000fd520 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898>:
   fd520:	55                   	push   %rbp
   fd521:	41 57                	push   %r15
   fd523:	41 56                	push   %r14
   fd525:	41 55                	push   %r13
   fd527:	41 54                	push   %r12
   fd529:	53                   	push   %rbx
   fd52a:	48 81 ec f8 02 00 00 	sub    $0x2f8,%rsp
   fd531:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
   fd536:	48 85 c9             	test   %rcx,%rcx
   fd539:	0f 84 43 02 00 00    	je     fd782 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x262>
   fd53f:	44 89 c3             	mov    %r8d,%ebx
   fd542:	48 89 cd             	mov    %rcx,%rbp
   fd545:	49 89 d5             	mov    %rdx,%r13
   fd548:	48 83 f9 01          	cmp    $0x1,%rcx
   fd54c:	0f 84 bb 00 00 00    	je     fd60d <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xed>
   fd552:	48 89 b4 24 a8 01 00 	mov    %rsi,0x1a8(%rsp)
   fd559:	00 
   fd55a:	48 8d 04 6d 00 00 00 	lea    0x0(,%rbp,2),%rax
   fd561:	00 
   fd562:	48 01 e8             	add    %rbp,%rax
   fd565:	48 c1 e0 04          	shl    $0x4,%rax
   fd569:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
   fd56e:	4e 8d 3c 28          	lea    (%rax,%r13,1),%r15
   fd572:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
   fd576:	4c 8d 6c 24 10       	lea    0x10(%rsp),%r13
   fd57b:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   fd57f:	0f b6 c3             	movzbl %bl,%eax
   fd582:	89 44 24 7c          	mov    %eax,0x7c(%rsp)
   fd586:	48 89 eb             	mov    %rbp,%rbx
   fd589:	eb 20                	jmp    fd5ab <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x8b>
   fd58b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   fd590:	49 8b 47 10          	mov    0x10(%r15),%rax
   fd594:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
   fd598:	75 56                	jne    fd5f0 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xd0>
   fd59a:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
   fd59e:	4c 89 f3             	mov    %r14,%rbx
   fd5a1:	49 83 fe 01          	cmp    $0x1,%r14
   fd5a5:	0f 86 f2 02 00 00    	jbe    fd89d <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x37d>
   fd5ab:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
   fd5af:	49 39 ee             	cmp    %rbp,%r14
   fd5b2:	0f 83 e2 0f 00 00    	jae    fe59a <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x107a>
   fd5b8:	41 80 3f 00          	cmpb   $0x0,(%r15)
   fd5bc:	74 d2                	je     fd590 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x70>
   fd5be:	4c 89 ef             	mov    %r13,%rdi
   fd5c1:	ff 15 09 82 1a 00    	call   *0x1a8209(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
   fd5c7:	4c 89 ff             	mov    %r15,%rdi
   fd5ca:	4c 89 ee             	mov    %r13,%rsi
   fd5cd:	8b 54 24 7c          	mov    0x7c(%rsp),%edx
   fd5d1:	e8 1a 17 00 00       	call   fecf0 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1953345100934301898>
   fd5d6:	41 89 c4             	mov    %eax,%r12d
   fd5d9:	41 80 fc fe          	cmp    $0xfe,%r12b
   fd5dd:	0f 84 f4 08 00 00    	je     fded7 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x9b7>
   fd5e3:	4c 89 ef             	mov    %r13,%rdi
   fd5e6:	e8 55 80 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fd5eb:	45 84 e4             	test   %r12b,%r12b
   fd5ee:	74 aa                	je     fd59a <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x7a>
   fd5f0:	48 39 eb             	cmp    %rbp,%rbx
   fd5f3:	48 8b b4 24 a8 01 00 	mov    0x1a8(%rsp),%rsi
   fd5fa:	00 
   fd5fb:	0f 87 84 0f 00 00    	ja     fe585 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1065>
   fd601:	48 89 dd             	mov    %rbx,%rbp
   fd604:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   fd608:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
   fd60d:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
   fd614:	0f 84 a6 02 00 00    	je     fd8c0 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x3a0>
   fd61a:	48 81 c6 98 00 00 00 	add    $0x98,%rsi
   fd621:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fd628:	00 
   fd629:	48 89 f0             	mov    %rsi,%rax
   fd62c:	4c 89 ee             	mov    %r13,%rsi
   fd62f:	48 89 ea             	mov    %rbp,%rdx
   fd632:	48 89 c1             	mov    %rax,%rcx
   fd635:	e8 e6 a1 ff ff       	call   f7820 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic19evaluate_polynomial>
   fd63a:	0f b6 ac 24 e0 00 00 	movzbl 0xe0(%rsp),%ebp
   fd641:	00 
   fd642:	40 84 ed             	test   %bpl,%bpl
   fd645:	0f 84 f4 01 00 00    	je     fd83f <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x31f>
   fd64b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fd650:	ff 15 7a 81 1a 00    	call   *0x1a817a(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
   fd656:	0f b6 d3             	movzbl %bl,%edx
   fd659:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fd660:	00 
   fd661:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   fd666:	e8 85 16 00 00       	call   fecf0 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1953345100934301898>
   fd66b:	89 c3                	mov    %eax,%ebx
   fd66d:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fd672:	e8 c9 7f ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fd677:	80 fb fe             	cmp    $0xfe,%bl
   fd67a:	0f 85 d4 01 00 00    	jne    fd854 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x334>
   fd680:	0f 10 84 24 e0 00 00 	movups 0xe0(%rsp),%xmm0
   fd687:	00 
   fd688:	0f 10 8c 24 f0 00 00 	movups 0xf0(%rsp),%xmm1
   fd68f:	00 
   fd690:	0f 10 94 24 00 01 00 	movups 0x100(%rsp),%xmm2
   fd697:	00 
   fd698:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
   fd69f:	00 
   fd6a0:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
   fd6a7:	00 
   fd6a8:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
   fd6af:	00 
   fd6b0:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
   fd6b5:	ff 15 05 81 1a 00    	call   *0x1a8105(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fd6bb:	bf 28 00 00 00       	mov    $0x28,%edi
   fd6c0:	be 01 00 00 00       	mov    $0x1,%esi
   fd6c5:	ff 15 fd 80 1a 00    	call   *0x1a80fd(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fd6cb:	48 85 c0             	test   %rax,%rax
   fd6ce:	0f 84 00 0f 00 00    	je     fe5d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x10b4>
   fd6d4:	0f 10 05 f5 d0 f9 ff 	movups -0x62f0b(%rip),%xmm0        # 9a7d0 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x178>
   fd6db:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fd6df:	0f 10 05 da d0 f9 ff 	movups -0x62f26(%rip),%xmm0        # 9a7c0 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x168>
   fd6e6:	0f 11 00             	movups %xmm0,(%rax)
   fd6e9:	48 b9 6c 75 65 20 73 	movabs $0x6e6769732065756c,%rcx
   fd6f0:	69 67 6e 
   fd6f3:	48 89 48 20          	mov    %rcx,0x20(%rax)
   fd6f7:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   fd6fc:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
   fd703:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
   fd70a:	00 
   fd70b:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
   fd712:	00 
   fd713:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
   fd71a:	00 
   fd71b:	0f 11 41 18          	movups %xmm0,0x18(%rcx)
   fd71f:	0f 11 49 28          	movups %xmm1,0x28(%rcx)
   fd723:	0f 11 51 38          	movups %xmm2,0x38(%rcx)
   fd727:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
   fd72c:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
   fd733:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
   fd738:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
   fd73f:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fd744:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fd749:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fd74e:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   fd753:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
   fd757:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
   fd75b:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
   fd75f:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
   fd763:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
   fd76a:	48 c7 01 28 00 00 00 	movq   $0x28,(%rcx)
   fd771:	48 89 41 08          	mov    %rax,0x8(%rcx)
   fd775:	48 c7 41 10 28 00 00 	movq   $0x28,0x10(%rcx)
   fd77c:	00 
   fd77d:	e9 46 0a 00 00       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fd782:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
   fd787:	ff 15 33 80 1a 00    	call   *0x1a8033(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fd78d:	bf 37 00 00 00       	mov    $0x37,%edi
   fd792:	be 01 00 00 00       	mov    $0x1,%esi
   fd797:	ff 15 2b 80 1a 00    	call   *0x1a802b(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fd79d:	48 85 c0             	test   %rax,%rax
   fd7a0:	0f 84 0a 0e 00 00    	je     fe5b0 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1090>
   fd7a6:	0f 10 05 93 d0 f9 ff 	movups -0x62f6d(%rip),%xmm0        # 9a840 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x1e8>
   fd7ad:	0f 11 40 20          	movups %xmm0,0x20(%rax)
   fd7b1:	0f 10 05 78 d0 f9 ff 	movups -0x62f88(%rip),%xmm0        # 9a830 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x1d8>
   fd7b8:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fd7bc:	0f 10 05 5d d0 f9 ff 	movups -0x62fa3(%rip),%xmm0        # 9a820 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x1c8>
   fd7c3:	0f 11 00             	movups %xmm0,(%rax)
   fd7c6:	48 b9 66 66 69 63 69 	movabs $0x746e656963696666,%rcx
   fd7cd:	65 6e 74 
   fd7d0:	48 89 48 2f          	mov    %rcx,0x2f(%rax)
   fd7d4:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   fd7d9:	c6 81 a9 00 00 00 06 	movb   $0x6,0xa9(%rcx)
   fd7e0:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
   fd7e4:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fd7e9:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fd7ee:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fd7f3:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   fd7f8:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
   fd7fc:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
   fd800:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
   fd804:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
   fd808:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
   fd80d:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
   fd814:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
   fd819:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
   fd820:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
   fd827:	48 c7 01 37 00 00 00 	movq   $0x37,(%rcx)
   fd82e:	48 89 41 08          	mov    %rax,0x8(%rcx)
   fd832:	48 c7 41 10 37 00 00 	movq   $0x37,0x10(%rcx)
   fd839:	00 
   fd83a:	e9 89 09 00 00       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fd83f:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
   fd846:	00 
   fd847:	31 db                	xor    %ebx,%ebx
   fd849:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
   fd84d:	0f 95 c0             	setne  %al
   fd850:	19 db                	sbb    %ebx,%ebx
   fd852:	08 c3                	or     %al,%bl
   fd854:	40 84 ed             	test   %bpl,%bpl
   fd857:	0f 10 84 24 e0 00 00 	movups 0xe0(%rsp),%xmm0
   fd85e:	00 
   fd85f:	0f 10 8c 24 f0 00 00 	movups 0xf0(%rsp),%xmm1
   fd866:	00 
   fd867:	0f 10 94 24 00 01 00 	movups 0x100(%rsp),%xmm2
   fd86e:	00 
   fd86f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   fd874:	0f 11 50 38          	movups %xmm2,0x38(%rax)
   fd878:	0f 11 48 28          	movups %xmm1,0x28(%rax)
   fd87c:	0f 11 40 18          	movups %xmm0,0x18(%rax)
   fd880:	0f 95 80 a9 00 00 00 	setne  0xa9(%rax)
   fd887:	c6 40 48 ff          	movb   $0xff,0x48(%rax)
   fd88b:	88 98 a8 00 00 00    	mov    %bl,0xa8(%rax)
   fd891:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
   fd898:	e9 2b 09 00 00       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fd89d:	bd 01 00 00 00       	mov    $0x1,%ebp
   fd8a2:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   fd8a6:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
   fd8ab:	48 8b b4 24 a8 01 00 	mov    0x1a8(%rsp),%rsi
   fd8b2:	00 
   fd8b3:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
   fd8ba:	0f 85 5a fd ff ff    	jne    fd61a <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xfa>
   fd8c0:	49 89 ee             	mov    %rbp,%r14
   fd8c3:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
   fd8c7:	48 89 f3             	mov    %rsi,%rbx
   fd8ca:	48 83 c6 38          	add    $0x38,%rsi
   fd8ce:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fd8d5:	00 
   fd8d6:	e8 55 26 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fd8db:	48 83 c3 68          	add    $0x68,%rbx
   fd8df:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fd8e4:	48 89 de             	mov    %rbx,%rsi
   fd8e7:	e8 44 26 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fd8ec:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fd8f3:	00 
   fd8f4:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fd8fb:	00 
   fd8fc:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fd903:	00 
   fd904:	0f 29 94 24 20 02 00 	movaps %xmm2,0x220(%rsp)
   fd90b:	00 
   fd90c:	0f 29 8c 24 10 02 00 	movaps %xmm1,0x210(%rsp)
   fd913:	00 
   fd914:	0f 29 84 24 00 02 00 	movaps %xmm0,0x200(%rsp)
   fd91b:	00 
   fd91c:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fd921:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fd926:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fd92b:	0f 29 84 24 30 02 00 	movaps %xmm0,0x230(%rsp)
   fd932:	00 
   fd933:	0f 29 8c 24 40 02 00 	movaps %xmm1,0x240(%rsp)
   fd93a:	00 
   fd93b:	0f 29 94 24 50 02 00 	movaps %xmm2,0x250(%rsp)
   fd942:	00 
   fd943:	80 bc 24 00 02 00 00 	cmpb   $0x0,0x200(%rsp)
   fd94a:	00 
   fd94b:	75 3b                	jne    fd988 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x468>
   fd94d:	80 bc 24 30 02 00 00 	cmpb   $0x0,0x230(%rsp)
   fd954:	00 
   fd955:	75 31                	jne    fd988 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x468>
   fd957:	48 8d bc 24 10 02 00 	lea    0x210(%rsp),%rdi
   fd95e:	00 
   fd95f:	48 8d b4 24 40 02 00 	lea    0x240(%rsp),%rsi
   fd966:	00 
   fd967:	ff 15 db 7e 1a 00    	call   *0x1a7edb(%rip)        # 2a5848 <_DYNAMIC+0x320>
   fd96d:	84 c0                	test   %al,%al
   fd96f:	7f 17                	jg     fd988 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x468>
   fd971:	4c 89 f0             	mov    %r14,%rax
   fd974:	48 c1 e0 04          	shl    $0x4,%rax
   fd978:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
   fd97c:	43 80 7c 25 d0 00    	cmpb   $0x0,-0x30(%r13,%r12,1)
   fd982:	0f 84 3b 0a 00 00    	je     fe3c3 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xea3>
   fd988:	4c 89 f0             	mov    %r14,%rax
   fd98b:	48 c1 e0 04          	shl    $0x4,%rax
   fd98f:	49 89 c6             	mov    %rax,%r14
   fd992:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
   fd996:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
   fd99a:	48 83 c3 d0          	add    $0xffffffffffffffd0,%rbx
   fd99e:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fd9a5:	00 
   fd9a6:	48 89 de             	mov    %rbx,%rsi
   fd9a9:	e8 82 25 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fd9ae:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
   fd9b3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fd9b8:	48 89 de             	mov    %rbx,%rsi
   fd9bb:	e8 70 25 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fd9c0:	4b 8d 04 76          	lea    (%r14,%r14,2),%rax
   fd9c4:	48 83 c0 d0          	add    $0xffffffffffffffd0,%rax
   fd9c8:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fd9cf:	00 
   fd9d0:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fd9d7:	00 
   fd9d8:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fd9df:	00 
   fd9e0:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
   fd9e7:	00 
   fd9e8:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
   fd9ef:	00 
   fd9f0:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
   fd9f7:	00 
   fd9f8:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fd9fd:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fda02:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fda07:	0f 29 84 24 70 01 00 	movaps %xmm0,0x170(%rsp)
   fda0e:	00 
   fda0f:	0f 29 8c 24 80 01 00 	movaps %xmm1,0x180(%rsp)
   fda16:	00 
   fda17:	0f 29 94 24 90 01 00 	movaps %xmm2,0x190(%rsp)
   fda1e:	00 
   fda1f:	48 85 c0             	test   %rax,%rax
   fda22:	0f 84 c3 02 00 00    	je     fdceb <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x7cb>
   fda28:	4c 8d 74 24 40       	lea    0x40(%rsp),%r14
   fda2d:	48 83 44 24 70 a0    	addq   $0xffffffffffffffa0,0x70(%rsp)
   fda33:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   fda38:	89 44 24 7c          	mov    %eax,0x7c(%rsp)
   fda3c:	4c 8d 6c 24 10       	lea    0x10(%rsp),%r13
   fda41:	48 8d 9c 24 b0 01 00 	lea    0x1b0(%rsp),%rbx
   fda48:	00 
   fda49:	4c 8d bc 24 68 02 00 	lea    0x268(%rsp),%r15
   fda50:	00 
   fda51:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   fda58:	0f 1f 84 00 00 00 00 
   fda5f:	00 
   fda60:	4c 89 ef             	mov    %r13,%rdi
   fda63:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
   fda6a:	00 
   fda6b:	48 8d 94 24 00 02 00 	lea    0x200(%rsp),%rdx
   fda72:	00 
   fda73:	8b 4c 24 7c          	mov    0x7c(%rsp),%ecx
   fda77:	e8 c4 92 ff ff       	call   f6d40 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic12interval_mul>
   fda7c:	80 7c 24 10 ff       	cmpb   $0xff,0x10(%rsp)
   fda81:	0f 84 17 05 00 00    	je     fdf9e <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xa7e>
   fda87:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   fda8c:	4a 8d 2c 20          	lea    (%rax,%r12,1),%rbp
   fda90:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
   fda95:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
   fda9c:	00 
   fda9d:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
   fdaa2:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
   fdaa9:	00 
   fdaaa:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fdaaf:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fdab4:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fdab9:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   fdabe:	0f 29 9c 24 b0 00 00 	movaps %xmm3,0xb0(%rsp)
   fdac5:	00 
   fdac6:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
   fdacd:	00 
   fdace:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
   fdad5:	00 
   fdad6:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
   fdadd:	00 
   fdade:	48 89 df             	mov    %rbx,%rdi
   fdae1:	48 89 ee             	mov    %rbp,%rsi
   fdae4:	e8 47 24 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fdae9:	4c 89 ff             	mov    %r15,%rdi
   fdaec:	48 89 ee             	mov    %rbp,%rsi
   fdaef:	e8 3c 24 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fdaf4:	0f 10 84 24 b0 01 00 	movups 0x1b0(%rsp),%xmm0
   fdafb:	00 
   fdafc:	0f 10 8c 24 c0 01 00 	movups 0x1c0(%rsp),%xmm1
   fdb03:	00 
   fdb04:	0f 10 94 24 d0 01 00 	movups 0x1d0(%rsp),%xmm2
   fdb0b:	00 
   fdb0c:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
   fdb11:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
   fdb16:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
   fdb1b:	0f 10 84 24 68 02 00 	movups 0x268(%rsp),%xmm0
   fdb22:	00 
   fdb23:	0f 10 8c 24 78 02 00 	movups 0x278(%rsp),%xmm1
   fdb2a:	00 
   fdb2b:	0f 10 94 24 88 02 00 	movups 0x288(%rsp),%xmm2
   fdb32:	00 
   fdb33:	41 0f 11 56 20       	movups %xmm2,0x20(%r14)
   fdb38:	41 0f 11 4e 10       	movups %xmm1,0x10(%r14)
   fdb3d:	41 0f 11 06          	movups %xmm0,(%r14)
   fdb41:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
   fdb48:	00 
   fdb49:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
   fdb50:	00 
   fdb51:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
   fdb58:	00 
   fdb59:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
   fdb60:	00 
   fdb61:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
   fdb68:	00 
   fdb69:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
   fdb70:	00 
   fdb71:	4c 89 ff             	mov    %r15,%rdi
   fdb74:	4c 89 ee             	mov    %r13,%rsi
   fdb77:	e8 b4 23 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fdb7c:	48 8d bc 24 98 02 00 	lea    0x298(%rsp),%rdi
   fdb83:	00 
   fdb84:	48 89 de             	mov    %rbx,%rsi
   fdb87:	4c 89 fa             	mov    %r15,%rdx
   fdb8a:	e8 01 64 01 00       	call   113f90 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs6IjHMNHnq5H_10hypersolve>
   fdb8f:	4c 89 ff             	mov    %r15,%rdi
   fdb92:	e8 b9 51 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fdb97:	48 89 df             	mov    %rbx,%rdi
   fdb9a:	e8 b1 51 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fdb9f:	48 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%rax
   fdba6:	00 
   fdba7:	0f 10 00             	movups (%rax),%xmm0
   fdbaa:	0f 10 48 10          	movups 0x10(%rax),%xmm1
   fdbae:	0f 10 50 20          	movups 0x20(%rax),%xmm2
   fdbb2:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
   fdbb9:	00 
   fdbba:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
   fdbc1:	00 
   fdbc2:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
   fdbc9:	00 
   fdbca:	4c 89 ff             	mov    %r15,%rdi
   fdbcd:	4c 89 f6             	mov    %r14,%rsi
   fdbd0:	e8 5b 23 00 00       	call   fff30 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
   fdbd5:	48 8d bc 24 c8 02 00 	lea    0x2c8(%rsp),%rdi
   fdbdc:	00 
   fdbdd:	48 89 de             	mov    %rbx,%rsi
   fdbe0:	4c 89 fa             	mov    %r15,%rdx
   fdbe3:	e8 a8 63 01 00       	call   113f90 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs6IjHMNHnq5H_10hypersolve>
   fdbe8:	4c 89 ff             	mov    %r15,%rdi
   fdbeb:	e8 60 51 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fdbf0:	48 89 df             	mov    %rbx,%rdi
   fdbf3:	e8 58 51 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fdbf8:	0f 10 84 24 98 02 00 	movups 0x298(%rsp),%xmm0
   fdbff:	00 
   fdc00:	0f 10 8c 24 a8 02 00 	movups 0x2a8(%rsp),%xmm1
   fdc07:	00 
   fdc08:	0f 10 94 24 b8 02 00 	movups 0x2b8(%rsp),%xmm2
   fdc0f:	00 
   fdc10:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
   fdc17:	00 
   fdc18:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
   fdc1f:	00 
   fdc20:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
   fdc27:	00 
   fdc28:	0f 10 84 24 c8 02 00 	movups 0x2c8(%rsp),%xmm0
   fdc2f:	00 
   fdc30:	0f 10 8c 24 d8 02 00 	movups 0x2d8(%rsp),%xmm1
   fdc37:	00 
   fdc38:	0f 10 94 24 e8 02 00 	movups 0x2e8(%rsp),%xmm2
   fdc3f:	00 
   fdc40:	48 8d 84 24 10 01 00 	lea    0x110(%rsp),%rax
   fdc47:	00 
   fdc48:	0f 11 50 20          	movups %xmm2,0x20(%rax)
   fdc4c:	0f 11 48 10          	movups %xmm1,0x10(%rax)
   fdc50:	0f 11 00             	movups %xmm0,(%rax)
   fdc53:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
   fdc5a:	00 
   fdc5b:	e8 e0 79 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdc60:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
   fdc67:	00 
   fdc68:	e8 d3 79 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdc6d:	0f 28 84 24 30 01 00 	movaps 0x130(%rsp),%xmm0
   fdc74:	00 
   fdc75:	0f 29 84 24 90 01 00 	movaps %xmm0,0x190(%rsp)
   fdc7c:	00 
   fdc7d:	0f 28 84 24 20 01 00 	movaps 0x120(%rsp),%xmm0
   fdc84:	00 
   fdc85:	0f 29 84 24 80 01 00 	movaps %xmm0,0x180(%rsp)
   fdc8c:	00 
   fdc8d:	0f 28 84 24 e0 00 00 	movaps 0xe0(%rsp),%xmm0
   fdc94:	00 
   fdc95:	0f 28 8c 24 f0 00 00 	movaps 0xf0(%rsp),%xmm1
   fdc9c:	00 
   fdc9d:	0f 28 94 24 00 01 00 	movaps 0x100(%rsp),%xmm2
   fdca4:	00 
   fdca5:	0f 28 9c 24 10 01 00 	movaps 0x110(%rsp),%xmm3
   fdcac:	00 
   fdcad:	0f 29 9c 24 70 01 00 	movaps %xmm3,0x170(%rsp)
   fdcb4:	00 
   fdcb5:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
   fdcbc:	00 
   fdcbd:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
   fdcc4:	00 
   fdcc5:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
   fdccc:	00 
   fdccd:	4c 89 ef             	mov    %r13,%rdi
   fdcd0:	e8 6b 79 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdcd5:	4c 89 f7             	mov    %r14,%rdi
   fdcd8:	e8 63 79 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdcdd:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
   fdce1:	49 83 fc 30          	cmp    $0x30,%r12
   fdce5:	0f 85 75 fd ff ff    	jne    fda60 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x540>
   fdceb:	0f b6 8c 24 40 01 00 	movzbl 0x140(%rsp),%ecx
   fdcf2:	00 
   fdcf3:	48 8b 84 24 41 01 00 	mov    0x141(%rsp),%rax
   fdcfa:	00 
   fdcfb:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
   fdd02:	00 
   fdd03:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
   fdd0a:	00 
   fdd0b:	48 89 84 24 f7 01 00 	mov    %rax,0x1f7(%rsp)
   fdd12:	00 
   fdd13:	48 8b 84 24 50 01 00 	mov    0x150(%rsp),%rax
   fdd1a:	00 
   fdd1b:	48 8b 94 24 58 01 00 	mov    0x158(%rsp),%rdx
   fdd22:	00 
   fdd23:	0f 28 84 24 60 01 00 	movaps 0x160(%rsp),%xmm0
   fdd2a:	00 
   fdd2b:	0f b6 b4 24 70 01 00 	movzbl 0x170(%rsp),%esi
   fdd32:	00 
   fdd33:	48 8b bc 24 71 01 00 	mov    0x171(%rsp),%rdi
   fdd3a:	00 
   fdd3b:	48 89 bc 24 e0 01 00 	mov    %rdi,0x1e0(%rsp)
   fdd42:	00 
   fdd43:	48 8b bc 24 78 01 00 	mov    0x178(%rsp),%rdi
   fdd4a:	00 
   fdd4b:	48 89 bc 24 e7 01 00 	mov    %rdi,0x1e7(%rsp)
   fdd52:	00 
   fdd53:	80 f9 ff             	cmp    $0xff,%cl
   fdd56:	0f 84 5c 02 00 00    	je     fdfb8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xa98>
   fdd5c:	4c 8b bc 24 80 01 00 	mov    0x180(%rsp),%r15
   fdd63:	00 
   fdd64:	48 8b bc 24 88 01 00 	mov    0x188(%rsp),%rdi
   fdd6b:	00 
   fdd6c:	0f 28 8c 24 90 01 00 	movaps 0x190(%rsp),%xmm1
   fdd73:	00 
   fdd74:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
   fdd78:	88 8c 24 80 00 00 00 	mov    %cl,0x80(%rsp)
   fdd7f:	48 8b 8c 24 f0 01 00 	mov    0x1f0(%rsp),%rcx
   fdd86:	00 
   fdd87:	4c 8b 84 24 f7 01 00 	mov    0x1f7(%rsp),%r8
   fdd8e:	00 
   fdd8f:	48 89 8c 24 81 00 00 	mov    %rcx,0x81(%rsp)
   fdd96:	00 
   fdd97:	4c 89 84 24 88 00 00 	mov    %r8,0x88(%rsp)
   fdd9e:	00 
   fdd9f:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   fdda6:	00 
   fdda7:	48 89 94 24 98 00 00 	mov    %rdx,0x98(%rsp)
   fddae:	00 
   fddaf:	0f 11 84 24 a0 00 00 	movups %xmm0,0xa0(%rsp)
   fddb6:	00 
   fddb7:	40 88 b4 24 b0 00 00 	mov    %sil,0xb0(%rsp)
   fddbe:	00 
   fddbf:	48 8b 84 24 e0 01 00 	mov    0x1e0(%rsp),%rax
   fddc6:	00 
   fddc7:	48 8b 8c 24 e7 01 00 	mov    0x1e7(%rsp),%rcx
   fddce:	00 
   fddcf:	48 89 84 24 b1 00 00 	mov    %rax,0xb1(%rsp)
   fddd6:	00 
   fddd7:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
   fddde:	00 
   fdddf:	4c 89 bc 24 c0 00 00 	mov    %r15,0xc0(%rsp)
   fdde6:	00 
   fdde7:	48 89 bc 24 c8 00 00 	mov    %rdi,0xc8(%rsp)
   fddee:	00 
   fddef:	0f 11 8c 24 d0 00 00 	movups %xmm1,0xd0(%rsp)
   fddf6:	00 
   fddf7:	48 8d bc 24 00 02 00 	lea    0x200(%rsp),%rdi
   fddfe:	00 
   fddff:	e8 3c 78 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fde04:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
   fde0b:	00 
   fde0c:	e8 2f 78 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fde11:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fde16:	ff 15 b4 79 1a 00    	call   *0x1a79b4(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
   fde1c:	0f b6 eb             	movzbl %bl,%ebp
   fde1f:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fde26:	00 
   fde27:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   fde2c:	89 ea                	mov    %ebp,%edx
   fde2e:	e8 bd 0e 00 00       	call   fecf0 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1953345100934301898>
   fde33:	89 c3                	mov    %eax,%ebx
   fde35:	80 fb fe             	cmp    $0xfe,%bl
   fde38:	0f 85 51 02 00 00    	jne    fe08f <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xb6f>
   fde3e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fde43:	e8 f8 77 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fde48:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
   fde4f:	00 
   fde50:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
   fde55:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
   fde5c:	00 
   fde5d:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   fde62:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fde69:	00 
   fde6a:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fde71:	00 
   fde72:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fde79:	00 
   fde7a:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
   fde81:	00 
   fde82:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
   fde87:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
   fde8c:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
   fde91:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
   fde96:	ff 15 24 79 1a 00    	call   *0x1a7924(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fde9c:	bf 33 00 00 00       	mov    $0x33,%edi
   fdea1:	be 01 00 00 00       	mov    $0x1,%esi
   fdea6:	ff 15 1c 79 1a 00    	call   *0x1a791c(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fdeac:	48 85 c0             	test   %rax,%rax
   fdeaf:	0f 84 43 07 00 00    	je     fe5f8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x10d8>
   fdeb5:	0f 10 05 bc c8 f9 ff 	movups -0x63744(%rip),%xmm0        # 9a778 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x120>
   fdebc:	0f 11 40 20          	movups %xmm0,0x20(%rax)
   fdec0:	0f 10 05 a1 c8 f9 ff 	movups -0x6375f(%rip),%xmm0        # 9a768 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x110>
   fdec7:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fdecb:	0f 10 05 86 c8 f9 ff 	movups -0x6377a(%rip),%xmm0        # 9a758 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x100>
   fded2:	e9 81 02 00 00       	jmp    fe158 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xc38>
   fded7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fdedc:	e8 5f 77 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdee1:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
   fdee6:	ff 15 d4 78 1a 00    	call   *0x1a78d4(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fdeec:	bf 38 00 00 00       	mov    $0x38,%edi
   fdef1:	be 01 00 00 00       	mov    $0x1,%esi
   fdef6:	ff 15 cc 78 1a 00    	call   *0x1a78cc(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fdefc:	48 85 c0             	test   %rax,%rax
   fdeff:	0f 84 e1 06 00 00    	je     fe5e6 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x10c6>
   fdf05:	0f 10 05 fc c8 f9 ff 	movups -0x63704(%rip),%xmm0        # 9a808 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x1b0>
   fdf0c:	0f 11 40 20          	movups %xmm0,0x20(%rax)
   fdf10:	0f 10 05 e1 c8 f9 ff 	movups -0x6371f(%rip),%xmm0        # 9a7f8 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x1a0>
   fdf17:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fdf1b:	0f 10 05 c6 c8 f9 ff 	movups -0x6373a(%rip),%xmm0        # 9a7e8 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x190>
   fdf22:	0f 11 00             	movups %xmm0,(%rax)
   fdf25:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
   fdf2c:	74 6c 79 
   fdf2f:	48 89 48 30          	mov    %rcx,0x30(%rax)
   fdf33:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   fdf38:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
   fdf3f:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
   fdf43:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fdf48:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fdf4d:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fdf52:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   fdf57:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
   fdf5b:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
   fdf5f:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
   fdf63:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
   fdf67:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
   fdf6c:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
   fdf73:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
   fdf78:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
   fdf7f:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
   fdf86:	48 c7 01 38 00 00 00 	movq   $0x38,(%rcx)
   fdf8d:	48 89 41 08          	mov    %rax,0x8(%rcx)
   fdf91:	48 c7 41 10 38 00 00 	movq   $0x38,0x10(%rcx)
   fdf98:	00 
   fdf99:	e9 2a 02 00 00       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fdf9e:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
   fdfa5:	00 
   fdfa6:	e8 95 76 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdfab:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
   fdfb2:	00 
   fdfb3:	e8 88 76 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdfb8:	48 8d bc 24 00 02 00 	lea    0x200(%rsp),%rdi
   fdfbf:	00 
   fdfc0:	e8 7b 76 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdfc5:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
   fdfcc:	00 
   fdfcd:	e8 6e 76 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fdfd2:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
   fdfd7:	ff 15 e3 77 1a 00    	call   *0x1a77e3(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fdfdd:	bf 35 00 00 00       	mov    $0x35,%edi
   fdfe2:	be 01 00 00 00       	mov    $0x1,%esi
   fdfe7:	ff 15 db 77 1a 00    	call   *0x1a77db(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fdfed:	48 85 c0             	test   %rax,%rax
   fdff0:	0f 84 cc 05 00 00    	je     fe5c2 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x10a2>
   fdff6:	0f 10 05 ae c7 f9 ff 	movups -0x63852(%rip),%xmm0        # 9a7ab <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x153>
   fdffd:	0f 11 40 20          	movups %xmm0,0x20(%rax)
   fe001:	0f 10 05 93 c7 f9 ff 	movups -0x6386d(%rip),%xmm0        # 9a79b <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x143>
   fe008:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fe00c:	0f 10 05 78 c7 f9 ff 	movups -0x63888(%rip),%xmm0        # 9a78b <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0x133>
   fe013:	0f 11 00             	movups %xmm0,(%rax)
   fe016:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
   fe01d:	74 6c 79 
   fe020:	48 89 48 2d          	mov    %rcx,0x2d(%rax)
   fe024:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   fe029:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
   fe030:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
   fe034:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
   fe039:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
   fe03e:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
   fe043:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
   fe048:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
   fe04c:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
   fe050:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
   fe054:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
   fe058:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
   fe05d:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
   fe064:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
   fe069:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
   fe070:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
   fe077:	48 c7 01 35 00 00 00 	movq   $0x35,(%rcx)
   fe07e:	48 89 41 08          	mov    %rax,0x8(%rcx)
   fe082:	48 c7 41 10 35 00 00 	movq   $0x35,0x10(%rcx)
   fe089:	00 
   fe08a:	e9 39 01 00 00       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fe08f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe094:	e8 a7 75 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe099:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe09e:	ff 15 2c 77 1a 00    	call   *0x1a772c(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
   fe0a4:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
   fe0ab:	00 
   fe0ac:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
   fe0b1:	89 ea                	mov    %ebp,%edx
   fe0b3:	e8 38 0c 00 00       	call   fecf0 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1953345100934301898>
   fe0b8:	89 c5                	mov    %eax,%ebp
   fe0ba:	40 80 fd fe          	cmp    $0xfe,%bpl
   fe0be:	0f 85 16 01 00 00    	jne    fe1da <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xcba>
   fe0c4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe0c9:	e8 72 75 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe0ce:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
   fe0d5:	00 
   fe0d6:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
   fe0db:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
   fe0e2:	00 
   fe0e3:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   fe0e8:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fe0ef:	00 
   fe0f0:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fe0f7:	00 
   fe0f8:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fe0ff:	00 
   fe100:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
   fe107:	00 
   fe108:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
   fe10d:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
   fe112:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
   fe117:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
   fe11c:	ff 15 9e 76 1a 00    	call   *0x1a769e(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fe122:	bf 33 00 00 00       	mov    $0x33,%edi
   fe127:	be 01 00 00 00       	mov    $0x1,%esi
   fe12c:	ff 15 96 76 1a 00    	call   *0x1a7696(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fe132:	48 85 c0             	test   %rax,%rax
   fe135:	0f 84 cf 04 00 00    	je     fe60a <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x10ea>
   fe13b:	0f 10 05 03 c6 f9 ff 	movups -0x639fd(%rip),%xmm0        # 9a745 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0xed>
   fe142:	0f 11 40 20          	movups %xmm0,0x20(%rax)
   fe146:	0f 10 05 e8 c5 f9 ff 	movups -0x63a18(%rip),%xmm0        # 9a735 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0xdd>
   fe14d:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fe151:	0f 10 05 cd c5 f9 ff 	movups -0x63a33(%rip),%xmm0        # 9a725 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0xcd>
   fe158:	0f 11 00             	movups %xmm0,(%rax)
   fe15b:	c7 40 2f 7a 65 72 6f 	movl   $0x6f72657a,0x2f(%rax)
   fe162:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   fe167:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
   fe16e:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
   fe172:	0f 28 44 24 10       	movaps 0x10(%rsp),%xmm0
   fe177:	0f 28 4c 24 20       	movaps 0x20(%rsp),%xmm1
   fe17c:	0f 28 54 24 30       	movaps 0x30(%rsp),%xmm2
   fe181:	0f 28 5c 24 40       	movaps 0x40(%rsp),%xmm3
   fe186:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
   fe18a:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
   fe18e:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
   fe192:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
   fe196:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
   fe19b:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
   fe1a2:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
   fe1a7:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
   fe1ae:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
   fe1b5:	48 c7 01 33 00 00 00 	movq   $0x33,(%rcx)
   fe1bc:	48 89 41 08          	mov    %rax,0x8(%rcx)
   fe1c0:	48 c7 41 10 33 00 00 	movq   $0x33,0x10(%rcx)
   fe1c7:	00 
   fe1c8:	48 81 c4 f8 02 00 00 	add    $0x2f8,%rsp
   fe1cf:	5b                   	pop    %rbx
   fe1d0:	41 5c                	pop    %r12
   fe1d2:	41 5d                	pop    %r13
   fe1d4:	41 5e                	pop    %r14
   fe1d6:	41 5f                	pop    %r15
   fe1d8:	5d                   	pop    %rbp
   fe1d9:	c3                   	ret
   fe1da:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe1df:	e8 5c 74 ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe1e4:	80 fb 01             	cmp    $0x1,%bl
   fe1e7:	75 6c                	jne    fe255 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xd35>
   fe1e9:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
   fe1f0:	00 
   fe1f1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   fe1f6:	0f 11 80 98 00 00 00 	movups %xmm0,0x98(%rax)
   fe1fd:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
   fe204:	00 
   fe205:	0f 11 80 88 00 00 00 	movups %xmm0,0x88(%rax)
   fe20c:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fe213:	00 
   fe214:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fe21b:	00 
   fe21c:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fe223:	00 
   fe224:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
   fe22b:	00 
   fe22c:	0f 11 58 78          	movups %xmm3,0x78(%rax)
   fe230:	0f 11 50 68          	movups %xmm2,0x68(%rax)
   fe234:	0f 11 48 58          	movups %xmm1,0x58(%rax)
   fe238:	0f 11 40 48          	movups %xmm0,0x48(%rax)
   fe23c:	c6 40 18 ff          	movb   $0xff,0x18(%rax)
   fe240:	66 c7 80 a8 00 00 00 	movw   $0x201,0xa8(%rax)
   fe247:	01 02 
   fe249:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
   fe250:	e9 73 ff ff ff       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fe255:	40 80 fd ff          	cmp    $0xff,%bpl
   fe259:	0f 84 f8 00 00 00    	je     fe357 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xe37>
   fe25f:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
   fe266:	00 
   fe267:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
   fe26c:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
   fe273:	00 
   fe274:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   fe279:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fe280:	00 
   fe281:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fe288:	00 
   fe289:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fe290:	00 
   fe291:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
   fe298:	00 
   fe299:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
   fe29e:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
   fe2a3:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
   fe2a8:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
   fe2ad:	ff 15 0d 75 1a 00    	call   *0x1a750d(%rip)        # 2a57c0 <_DYNAMIC+0x298>
   fe2b3:	bf 2b 00 00 00       	mov    $0x2b,%edi
   fe2b8:	be 01 00 00 00       	mov    $0x1,%esi
   fe2bd:	ff 15 05 75 1a 00    	call   *0x1a7505(%rip)        # 2a57c8 <_DYNAMIC+0x2a0>
   fe2c3:	48 85 c0             	test   %rax,%rax
   fe2c6:	0f 84 50 03 00 00    	je     fe61c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x10fc>
   fe2cc:	0f 10 05 42 c4 f9 ff 	movups -0x63bbe(%rip),%xmm0        # 9a715 <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0xbd>
   fe2d3:	0f 11 40 1b          	movups %xmm0,0x1b(%rax)
   fe2d7:	0f 10 05 2c c4 f9 ff 	movups -0x63bd4(%rip),%xmm0        # 9a70a <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0xb2>
   fe2de:	0f 11 40 10          	movups %xmm0,0x10(%rax)
   fe2e2:	0f 10 05 11 c4 f9 ff 	movups -0x63bef(%rip),%xmm0        # 9a6fa <anon.d8c654ab87f8c92a29e51d87b0ded1ea.158.llvm.1953345100934301898+0xa2>
   fe2e9:	0f 11 00             	movups %xmm0,(%rax)
   fe2ec:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   fe2f1:	c6 81 a9 00 00 00 04 	movb   $0x4,0xa9(%rcx)
   fe2f8:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
   fe2fc:	0f 28 44 24 10       	movaps 0x10(%rsp),%xmm0
   fe301:	0f 28 4c 24 20       	movaps 0x20(%rsp),%xmm1
   fe306:	0f 28 54 24 30       	movaps 0x30(%rsp),%xmm2
   fe30b:	0f 28 5c 24 40       	movaps 0x40(%rsp),%xmm3
   fe310:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
   fe314:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
   fe318:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
   fe31c:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
   fe320:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
   fe325:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
   fe32c:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
   fe331:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
   fe338:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
   fe33f:	48 c7 01 2b 00 00 00 	movq   $0x2b,(%rcx)
   fe346:	48 89 41 08          	mov    %rax,0x8(%rcx)
   fe34a:	48 c7 41 10 2b 00 00 	movq   $0x2b,0x10(%rcx)
   fe351:	00 
   fe352:	e9 71 fe ff ff       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fe357:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
   fe35e:	00 
   fe35f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   fe364:	0f 11 80 98 00 00 00 	movups %xmm0,0x98(%rax)
   fe36b:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
   fe372:	00 
   fe373:	0f 11 80 88 00 00 00 	movups %xmm0,0x88(%rax)
   fe37a:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   fe381:	00 
   fe382:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
   fe389:	00 
   fe38a:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
   fe391:	00 
   fe392:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
   fe399:	00 
   fe39a:	0f 11 58 78          	movups %xmm3,0x78(%rax)
   fe39e:	0f 11 50 68          	movups %xmm2,0x68(%rax)
   fe3a2:	0f 11 48 58          	movups %xmm1,0x58(%rax)
   fe3a6:	0f 11 40 48          	movups %xmm0,0x48(%rax)
   fe3aa:	c6 40 18 ff          	movb   $0xff,0x18(%rax)
   fe3ae:	66 c7 80 a8 00 00 00 	movw   $0x3ff,0xa8(%rax)
   fe3b5:	ff 03 
   fe3b7:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
   fe3be:	e9 05 fe ff ff       	jmp    fe1c8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xca8>
   fe3c3:	4b 8b 44 25 e0       	mov    -0x20(%r13,%r12,1),%rax
   fe3c8:	f0 48 ff 00          	lock incq (%rax)
   fe3cc:	0f 8e 5a 02 00 00    	jle    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe3d2:	4b 8b 44 25 e0       	mov    -0x20(%r13,%r12,1),%rax
   fe3d7:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   fe3de:	00 
   fe3df:	f0 48 ff 00          	lock incq (%rax)
   fe3e3:	0f 8e 43 02 00 00    	jle    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe3e9:	4f 8b 7c 25 e0       	mov    -0x20(%r13,%r12,1),%r15
   fe3ee:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
   fe3f5:	00 
   fe3f6:	49 83 fe 01          	cmp    $0x1,%r14
   fe3fa:	75 1f                	jne    fe41b <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xefb>
   fe3fc:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
   fe403:	00 
   fe404:	0f 28 05 45 63 f9 ff 	movaps -0x69cbb(%rip),%xmm0        # 94750 <GCC_except_table0+0x410>
   fe40b:	31 c9                	xor    %ecx,%ecx
   fe40d:	31 d2                	xor    %edx,%edx
   fe40f:	31 f6                	xor    %esi,%esi
   fe411:	31 ff                	xor    %edi,%edi
   fe413:	0f 28 c8             	movaps %xmm0,%xmm1
   fe416:	e9 59 f9 ff ff       	jmp    fdd74 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x854>
   fe41b:	43 80 7c 25 a0 00    	cmpb   $0x0,-0x60(%r13,%r12,1)
   fe421:	0f 85 25 01 00 00    	jne    fe54c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x102c>
   fe427:	49 8d 45 b0          	lea    -0x50(%r13),%rax
   fe42b:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   fe430:	4c 89 eb             	mov    %r13,%rbx
   fe433:	40 b5 01             	mov    $0x1,%bpl
   fe436:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fe43d:	00 
   fe43e:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   fe445:	00 
   fe446:	48 8d 94 24 10 02 00 	lea    0x210(%rsp),%rdx
   fe44d:	00 
   fe44e:	48 8d 8c 24 40 02 00 	lea    0x240(%rsp),%rcx
   fe455:	00 
   fe456:	e8 35 83 ff ff       	call   f6790 <_RNvNtCs6IjHMNHnq5H_10hypersolve8interval25rational_interval_product>
   fe45b:	49 89 c7             	mov    %rax,%r15
   fe45e:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
   fe463:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
   fe46a:	00 
   fe46b:	f0 48 ff 08          	lock decq (%rax)
   fe46f:	75 0e                	jne    fe47f <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xf5f>
   fe471:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fe478:	00 
   fe479:	ff 15 09 73 1a 00    	call   *0x1a7309(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe47f:	4c 89 bc 24 e0 00 00 	mov    %r15,0xe0(%rsp)
   fe486:	00 
   fe487:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   fe48c:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
   fe493:	00 
   fe494:	f0 48 ff 08          	lock decq (%rax)
   fe498:	75 0e                	jne    fe4a8 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xf88>
   fe49a:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe4a1:	00 
   fe4a2:	ff 15 e0 72 1a 00    	call   *0x1a72e0(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe4a8:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   fe4ad:	4e 8d 3c 20          	lea    (%rax,%r12,1),%r15
   fe4b1:	4c 89 ac 24 80 00 00 	mov    %r13,0x80(%rsp)
   fe4b8:	00 
   fe4b9:	48 8b ac 24 e0 00 00 	mov    0xe0(%rsp),%rbp
   fe4c0:	00 
   fe4c1:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
   fe4c6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe4cb:	4c 89 fe             	mov    %r15,%rsi
   fe4ce:	ff 15 7c 73 1a 00    	call   *0x1a737c(%rip)        # 2a5850 <_DYNAMIC+0x328>
   fe4d4:	49 89 c5             	mov    %rax,%r13
   fe4d7:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
   fe4dc:	75 0d                	jne    fe4eb <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xfcb>
   fe4de:	31 ed                	xor    %ebp,%ebp
   fe4e0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe4e5:	ff 15 9d 72 1a 00    	call   *0x1a729d(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe4eb:	4c 89 ac 24 e0 00 00 	mov    %r13,0xe0(%rsp)
   fe4f2:	00 
   fe4f3:	4c 8b ac 24 80 00 00 	mov    0x80(%rsp),%r13
   fe4fa:	00 
   fe4fb:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
   fe500:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe505:	4c 89 fe             	mov    %r15,%rsi
   fe508:	ff 15 42 73 1a 00    	call   *0x1a7342(%rip)        # 2a5850 <_DYNAMIC+0x328>
   fe50e:	49 89 c7             	mov    %rax,%r15
   fe511:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
   fe516:	75 0b                	jne    fe523 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1003>
   fe518:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe51d:	ff 15 65 72 1a 00    	call   *0x1a7265(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe523:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
   fe52a:	00 
   fe52b:	49 83 fc 60          	cmp    $0x60,%r12
   fe52f:	0f 84 c7 fe ff ff    	je     fe3fc <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xedc>
   fe535:	49 89 dd             	mov    %rbx,%r13
   fe538:	42 80 bc 23 70 ff ff 	cmpb   $0x0,-0x90(%rbx,%r12,1)
   fe53f:	ff 00 
   fe541:	4d 8d 64 24 d0       	lea    -0x30(%r12),%r12
   fe546:	0f 84 e4 fe ff ff    	je     fe430 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0xf10>
   fe54c:	f0 49 ff 0f          	lock decq (%r15)
   fe550:	75 0e                	jne    fe560 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1040>
   fe552:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe559:	00 
   fe55a:	ff 15 28 72 1a 00    	call   *0x1a7228(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe560:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
   fe567:	00 
   fe568:	f0 48 ff 08          	lock decq (%rax)
   fe56c:	0f 85 16 f4 ff ff    	jne    fd988 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x468>
   fe572:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fe579:	00 
   fe57a:	ff 15 08 72 1a 00    	call   *0x1a7208(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe580:	e9 03 f4 ff ff       	jmp    fd988 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x468>
   fe585:	48 8d 0d fc 03 1a 00 	lea    0x1a03fc(%rip),%rcx        # 29e988 <anon.d0bea20e32cad2f18f0f061abb2c7c3c.48.llvm.4766092793697344236+0x130>
   fe58c:	31 ff                	xor    %edi,%edi
   fe58e:	48 89 de             	mov    %rbx,%rsi
   fe591:	48 89 ea             	mov    %rbp,%rdx
   fe594:	ff 15 fe 74 1a 00    	call   *0x1a74fe(%rip)        # 2a5a98 <_DYNAMIC+0x570>
   fe59a:	48 ff cb             	dec    %rbx
   fe59d:	48 8d 15 cc 03 1a 00 	lea    0x1a03cc(%rip),%rdx        # 29e970 <anon.d0bea20e32cad2f18f0f061abb2c7c3c.48.llvm.4766092793697344236+0x118>
   fe5a4:	48 89 df             	mov    %rbx,%rdi
   fe5a7:	48 89 ee             	mov    %rbp,%rsi
   fe5aa:	ff 15 00 75 1a 00    	call   *0x1a7500(%rip)        # 2a5ab0 <_DYNAMIC+0x588>
   fe5b0:	bf 01 00 00 00       	mov    $0x1,%edi
   fe5b5:	be 37 00 00 00       	mov    $0x37,%esi
   fe5ba:	ff 15 78 73 1a 00    	call   *0x1a7378(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe5c0:	eb 6a                	jmp    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe5c2:	bf 01 00 00 00       	mov    $0x1,%edi
   fe5c7:	be 35 00 00 00       	mov    $0x35,%esi
   fe5cc:	ff 15 66 73 1a 00    	call   *0x1a7366(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe5d2:	eb 58                	jmp    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe5d4:	bf 01 00 00 00       	mov    $0x1,%edi
   fe5d9:	be 28 00 00 00       	mov    $0x28,%esi
   fe5de:	ff 15 54 73 1a 00    	call   *0x1a7354(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe5e4:	eb 46                	jmp    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe5e6:	bf 01 00 00 00       	mov    $0x1,%edi
   fe5eb:	be 38 00 00 00       	mov    $0x38,%esi
   fe5f0:	ff 15 42 73 1a 00    	call   *0x1a7342(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe5f6:	eb 34                	jmp    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe5f8:	bf 01 00 00 00       	mov    $0x1,%edi
   fe5fd:	be 33 00 00 00       	mov    $0x33,%esi
   fe602:	ff 15 30 73 1a 00    	call   *0x1a7330(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe608:	eb 22                	jmp    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe60a:	bf 01 00 00 00       	mov    $0x1,%edi
   fe60f:	be 33 00 00 00       	mov    $0x33,%esi
   fe614:	ff 15 1e 73 1a 00    	call   *0x1a731e(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe61a:	eb 10                	jmp    fe62c <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x110c>
   fe61c:	bf 01 00 00 00       	mov    $0x1,%edi
   fe621:	be 2b 00 00 00       	mov    $0x2b,%esi
   fe626:	ff 15 0c 73 1a 00    	call   *0x1a730c(%rip)        # 2a5938 <_DYNAMIC+0x410>
   fe62c:	0f 0b                	ud2
   fe62e:	eb 00                	jmp    fe630 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1110>
   fe630:	48 89 c3             	mov    %rax,%rbx
   fe633:	e9 ac 00 00 00       	jmp    fe6e4 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x11c4>
   fe638:	48 89 c3             	mov    %rax,%rbx
   fe63b:	4c 89 ac 24 80 00 00 	mov    %r13,0x80(%rsp)
   fe642:	00 
   fe643:	40 b5 01             	mov    $0x1,%bpl
   fe646:	eb 77                	jmp    fe6bf <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x119f>
   fe648:	48 89 c3             	mov    %rax,%rbx
   fe64b:	4c 89 bc 24 e0 00 00 	mov    %r15,0xe0(%rsp)
   fe652:	00 
   fe653:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   fe658:	f0 48 ff 08          	lock decq (%rax)
   fe65c:	40 b5 01             	mov    $0x1,%bpl
   fe65f:	75 5e                	jne    fe6bf <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x119f>
   fe661:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe666:	ff 15 1c 71 1a 00    	call   *0x1a711c(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe66c:	eb 51                	jmp    fe6bf <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x119f>
   fe66e:	48 89 c3             	mov    %rax,%rbx
   fe671:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe676:	e8 55 65 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe67b:	e9 91 03 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe680:	48 89 c3             	mov    %rax,%rbx
   fe683:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
   fe688:	75 0b                	jne    fe695 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1175>
   fe68a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe68f:	ff 15 f3 70 1a 00    	call   *0x1a70f3(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe695:	31 ed                	xor    %ebp,%ebp
   fe697:	eb 26                	jmp    fe6bf <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x119f>
   fe699:	ff 15 c9 70 1a 00    	call   *0x1a70c9(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe69f:	48 89 c3             	mov    %rax,%rbx
   fe6a2:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
   fe6a7:	75 3b                	jne    fe6e4 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x11c4>
   fe6a9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe6ae:	ff 15 d4 70 1a 00    	call   *0x1a70d4(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe6b4:	eb 2e                	jmp    fe6e4 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x11c4>
   fe6b6:	ff 15 ac 70 1a 00    	call   *0x1a70ac(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe6bc:	48 89 c3             	mov    %rax,%rbx
   fe6bf:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
   fe6c6:	00 
   fe6c7:	f0 48 ff 08          	lock decq (%rax)
   fe6cb:	75 0e                	jne    fe6db <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x11bb>
   fe6cd:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe6d4:	00 
   fe6d5:	ff 15 ad 70 1a 00    	call   *0x1a70ad(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe6db:	40 84 ed             	test   %bpl,%bpl
   fe6de:	0f 84 20 03 00 00    	je     fea04 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14e4>
   fe6e4:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
   fe6eb:	00 
   fe6ec:	f0 48 ff 08          	lock decq (%rax)
   fe6f0:	0f 85 0e 03 00 00    	jne    fea04 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14e4>
   fe6f6:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fe6fd:	00 
   fe6fe:	ff 15 84 70 1a 00    	call   *0x1a7084(%rip)        # 2a5788 <_DYNAMIC+0x260>
   fe704:	e9 fb 02 00 00       	jmp    fea04 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14e4>
   fe709:	ff 15 59 70 1a 00    	call   *0x1a7059(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe70f:	48 89 c3             	mov    %rax,%rbx
   fe712:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe717:	e8 b4 64 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe71c:	e9 f0 02 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe721:	48 89 c3             	mov    %rax,%rbx
   fe724:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe729:	e8 12 6f ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe72e:	e9 22 01 00 00       	jmp    fe855 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1335>
   fe733:	48 89 c3             	mov    %rax,%rbx
   fe736:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe73b:	e8 90 64 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe740:	e9 cc 02 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe745:	48 89 c3             	mov    %rax,%rbx
   fe748:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
   fe74f:	00 
   fe750:	e8 eb 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe755:	e9 aa 02 00 00       	jmp    fea04 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14e4>
   fe75a:	ff 15 08 70 1a 00    	call   *0x1a7008(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe760:	48 89 c3             	mov    %rax,%rbx
   fe763:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe768:	e8 63 64 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe76d:	e9 9f 02 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe772:	48 89 c3             	mov    %rax,%rbx
   fe775:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe77a:	e8 c1 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe77f:	e9 d1 00 00 00       	jmp    fe855 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1335>
   fe784:	48 89 c3             	mov    %rax,%rbx
   fe787:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
   fe78e:	00 
   fe78f:	e8 ac 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe794:	e9 bc 00 00 00       	jmp    fe855 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1335>
   fe799:	ff 15 c9 6f 1a 00    	call   *0x1a6fc9(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe79f:	48 89 c3             	mov    %rax,%rbx
   fe7a2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe7a7:	e8 24 64 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe7ac:	80 bc 24 80 00 00 00 	cmpb   $0xff,0x80(%rsp)
   fe7b3:	ff 
   fe7b4:	0f 84 57 02 00 00    	je     fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe7ba:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe7c1:	00 
   fe7c2:	e8 79 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe7c7:	e9 45 02 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe7cc:	48 89 c3             	mov    %rax,%rbx
   fe7cf:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe7d4:	e8 f7 63 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe7d9:	e9 33 02 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe7de:	48 89 c3             	mov    %rax,%rbx
   fe7e1:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
   fe7e8:	00 
   fe7e9:	e8 52 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe7ee:	e9 1e 02 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe7f3:	ff 15 6f 6f 1a 00    	call   *0x1a6f6f(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe7f9:	48 89 c3             	mov    %rax,%rbx
   fe7fc:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe803:	00 
   fe804:	e8 37 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe809:	e9 f6 01 00 00       	jmp    fea04 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14e4>
   fe80e:	48 89 c3             	mov    %rax,%rbx
   fe811:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe818:	00 
   fe819:	e8 22 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe81e:	e9 ee 01 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe823:	48 89 c3             	mov    %rax,%rbx
   fe826:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe82b:	e8 10 6e ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe830:	eb 38                	jmp    fe86a <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x134a>
   fe832:	ff 15 30 6f 1a 00    	call   *0x1a6f30(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe838:	48 89 c3             	mov    %rax,%rbx
   fe83b:	e9 c4 01 00 00       	jmp    fea04 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14e4>
   fe840:	48 89 c3             	mov    %rax,%rbx
   fe843:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe848:	e8 83 63 ff ff       	call   f4bd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs6IjHMNHnq5H_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.1953345100934301898>
   fe84d:	e9 bf 01 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe852:	48 89 c3             	mov    %rax,%rbx
   fe855:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe85c:	00 
   fe85d:	e8 ee 6a ff ff       	call   f5350 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve13real_interval12RealIntervalEBF_>
   fe862:	e9 aa 01 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe867:	48 89 c3             	mov    %rax,%rbx
   fe86a:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   fe871:	00 
   fe872:	e8 c9 6d ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe877:	e9 95 01 00 00       	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe87c:	48 89 c3             	mov    %rax,%rbx
   fe87f:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
   fe886:	00 
   fe887:	e8 b4 6d ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe88c:	eb 39                	jmp    fe8c7 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x13a7>
   fe88e:	48 89 c3             	mov    %rax,%rbx
   fe891:	48 8d bc 24 68 02 00 	lea    0x268(%rsp),%rdi
   fe898:	00 
   fe899:	e8 b2 44 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fe89e:	eb 4e                	jmp    fe8ee <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x13ce>
   fe8a0:	48 89 c3             	mov    %rax,%rbx
   fe8a3:	eb 56                	jmp    fe8fb <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x13db>
   fe8a5:	48 89 c3             	mov    %rax,%rbx
   fe8a8:	48 8d bc 24 68 02 00 	lea    0x268(%rsp),%rdi
   fe8af:	00 
   fe8b0:	e8 9b 44 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fe8b5:	eb 6b                	jmp    fe922 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x1402>
   fe8b7:	48 89 c3             	mov    %rax,%rbx
   fe8ba:	eb 73                	jmp    fe92f <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x140f>
   fe8bc:	48 89 c3             	mov    %rax,%rbx
   fe8bf:	e9 8a 00 00 00       	jmp    fe94e <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x142e>
   fe8c4:	48 89 c3             	mov    %rax,%rbx
   fe8c7:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   fe8ce:	00 
   fe8cf:	e8 7c 6a ff ff       	call   f5350 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve13real_interval12RealIntervalEBF_>
   fe8d4:	e9 1e 01 00 00       	jmp    fe9f7 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14d7>
   fe8d9:	48 89 c3             	mov    %rax,%rbx
   fe8dc:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
   fe8e3:	00 
   fe8e4:	e8 57 6d ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe8e9:	eb 10                	jmp    fe8fb <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x13db>
   fe8eb:	48 89 c3             	mov    %rax,%rbx
   fe8ee:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
   fe8f5:	00 
   fe8f6:	e8 55 44 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fe8fb:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
   fe902:	00 
   fe903:	e8 38 6d ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe908:	e9 a1 00 00 00       	jmp    fe9ae <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x148e>
   fe90d:	48 89 c3             	mov    %rax,%rbx
   fe910:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
   fe917:	00 
   fe918:	e8 23 6d ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe91d:	eb 10                	jmp    fe92f <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x140f>
   fe91f:	48 89 c3             	mov    %rax,%rbx
   fe922:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
   fe929:	00 
   fe92a:	e8 21 44 01 00       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
   fe92f:	48 8d bc 24 98 02 00 	lea    0x298(%rsp),%rdi
   fe936:	00 
   fe937:	e8 04 6d ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe93c:	eb 70                	jmp    fe9ae <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x148e>
   fe93e:	48 89 c3             	mov    %rax,%rbx
   fe941:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
   fe948:	00 
   fe949:	e8 f2 6c ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe94e:	0f 28 84 24 30 01 00 	movaps 0x130(%rsp),%xmm0
   fe955:	00 
   fe956:	0f 29 84 24 90 01 00 	movaps %xmm0,0x190(%rsp)
   fe95d:	00 
   fe95e:	0f 28 84 24 20 01 00 	movaps 0x120(%rsp),%xmm0
   fe965:	00 
   fe966:	0f 29 84 24 80 01 00 	movaps %xmm0,0x180(%rsp)
   fe96d:	00 
   fe96e:	0f 28 84 24 e0 00 00 	movaps 0xe0(%rsp),%xmm0
   fe975:	00 
   fe976:	0f 28 8c 24 f0 00 00 	movaps 0xf0(%rsp),%xmm1
   fe97d:	00 
   fe97e:	0f 28 94 24 00 01 00 	movaps 0x100(%rsp),%xmm2
   fe985:	00 
   fe986:	0f 28 9c 24 10 01 00 	movaps 0x110(%rsp),%xmm3
   fe98d:	00 
   fe98e:	0f 29 9c 24 70 01 00 	movaps %xmm3,0x170(%rsp)
   fe995:	00 
   fe996:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
   fe99d:	00 
   fe99e:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
   fe9a5:	00 
   fe9a6:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
   fe9ad:	00 
   fe9ae:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe9b3:	e8 98 69 ff ff       	call   f5350 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve13real_interval12RealIntervalEBF_>
   fe9b8:	eb 3d                	jmp    fe9f7 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14d7>
   fe9ba:	ff 15 a8 6d 1a 00    	call   *0x1a6da8(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe9c0:	48 89 c3             	mov    %rax,%rbx
   fe9c3:	4c 89 f7             	mov    %r14,%rdi
   fe9c6:	e8 75 6c ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe9cb:	eb 2a                	jmp    fe9f7 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14d7>
   fe9cd:	ff 15 95 6d 1a 00    	call   *0x1a6d95(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe9d3:	48 89 c3             	mov    %rax,%rbx
   fe9d6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   fe9db:	e8 60 6c ff ff       	call   f5640 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.1953345100934301898>
   fe9e0:	eb 2f                	jmp    fea11 <_RNvNtCs6IjHMNHnq5H_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.1953345100934301898+0x14f1>
   fe9e2:	ff 15 80 6d 1a 00    	call   *0x1a6d80(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe9e8:	ff 15 7a 6d 1a 00    	call   *0x1a6d7a(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe9ee:	ff 15 74 6d 1a 00    	call   *0x1a6d74(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fe9f4:	48 89 c3             	mov    %rax,%rbx
   fe9f7:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
   fe9fe:	00 
   fe9ff:	e8 4c 69 ff ff       	call   f5350 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve13real_interval12RealIntervalEBF_>
   fea04:	48 8d bc 24 00 02 00 	lea    0x200(%rsp),%rdi
   fea0b:	00 
   fea0c:	e8 3f 69 ff ff       	call   f5350 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve13real_interval12RealIntervalEBF_>
   fea11:	48 89 df             	mov    %rbx,%rdi
   fea14:	e8 37 d3 19 00       	call   29bd50 <_Unwind_Resume@plt>
   fea19:	ff 15 49 6d 1a 00    	call   *0x1a6d49(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fea1f:	ff 15 43 6d 1a 00    	call   *0x1a6d43(%rip)        # 2a5768 <_DYNAMIC+0x240>
   fea25:	ff 15 3d 6d 1a 00    	call   *0x1a6d3d(%rip)        # 2a5768 <_DYNAMIC+0x240>
