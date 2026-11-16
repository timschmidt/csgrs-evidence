
/tmp/interval-refactor/horner-current/stack-artifacts/baseline:     file format elf64-x86-64


Disassembly of section .text:

000000000013d520 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval>:
  13d520:	55                   	push   %rbp
  13d521:	41 57                	push   %r15
  13d523:	41 56                	push   %r14
  13d525:	41 55                	push   %r13
  13d527:	41 54                	push   %r12
  13d529:	53                   	push   %rbx
  13d52a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  13d531:	45 89 c5             	mov    %r8d,%r13d
  13d534:	49 89 ce             	mov    %rcx,%r14
  13d537:	48 89 d3             	mov    %rdx,%rbx
  13d53a:	49 89 f7             	mov    %rsi,%r15
  13d53d:	49 89 fc             	mov    %rdi,%r12
  13d540:	48 89 d7             	mov    %rdx,%rdi
  13d543:	48 89 ce             	mov    %rcx,%rsi
  13d546:	44 89 c2             	mov    %r8d,%edx
  13d549:	e8 32 09 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13d54e:	0f b6 c0             	movzbl %al,%eax
  13d551:	40 b5 02             	mov    $0x2,%bpl
  13d554:	3d fd 00 00 00       	cmp    $0xfd,%eax
  13d559:	7f 60                	jg     13d5bb <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x9b>
  13d55b:	40 b5 02             	mov    $0x2,%bpl
  13d55e:	85 c0                	test   %eax,%eax
  13d560:	0f 85 0d 01 00 00    	jne    13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d566:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d56b:	4c 89 e6             	mov    %r12,%rsi
  13d56e:	4c 89 fa             	mov    %r15,%rdx
  13d571:	48 89 d9             	mov    %rbx,%rcx
  13d574:	ff 15 0e 86 16 00    	call   *0x16860e(%rip)        # 2a5b88 <_DYNAMIC+0x660>
  13d57a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d57f:	ff 15 4b 82 16 00    	call   *0x16824b(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  13d585:	41 0f b6 d5          	movzbl %r13b,%edx
  13d589:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d58e:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  13d593:	e8 e8 08 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13d598:	89 c3                	mov    %eax,%ebx
  13d59a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d59f:	e8 5c 1f ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d5a4:	31 c0                	xor    %eax,%eax
  13d5a6:	84 db                	test   %bl,%bl
  13d5a8:	0f 95 c0             	setne  %al
  13d5ab:	80 fb fe             	cmp    $0xfe,%bl
  13d5ae:	bd 02 00 00 00       	mov    $0x2,%ebp
  13d5b3:	0f 45 e8             	cmovne %eax,%ebp
  13d5b6:	e9 ae 00 00 00       	jmp    13d669 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x149>
  13d5bb:	3d fe 00 00 00       	cmp    $0xfe,%eax
  13d5c0:	0f 84 ad 00 00 00    	je     13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d5c6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d5cb:	4c 89 e6             	mov    %r12,%rsi
  13d5ce:	4c 89 fa             	mov    %r15,%rdx
  13d5d1:	48 89 d9             	mov    %rbx,%rcx
  13d5d4:	ff 15 ae 85 16 00    	call   *0x1685ae(%rip)        # 2a5b88 <_DYNAMIC+0x660>
  13d5da:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d5df:	ff 15 eb 81 16 00    	call   *0x1681eb(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  13d5e5:	41 0f b6 d5          	movzbl %r13b,%edx
  13d5e9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d5ee:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  13d5f3:	89 54 24 0c          	mov    %edx,0xc(%rsp)
  13d5f7:	e8 84 08 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13d5fc:	41 89 c5             	mov    %eax,%r13d
  13d5ff:	41 80 fd fe          	cmp    $0xfe,%r13b
  13d603:	75 0c                	jne    13d611 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0xf1>
  13d605:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d60a:	e8 f1 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d60f:	eb 58                	jmp    13d669 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x149>
  13d611:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d616:	e8 e5 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d61b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d620:	e8 db 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d625:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d62a:	4c 89 e6             	mov    %r12,%rsi
  13d62d:	4c 89 fa             	mov    %r15,%rdx
  13d630:	4c 89 f1             	mov    %r14,%rcx
  13d633:	ff 15 4f 85 16 00    	call   *0x16854f(%rip)        # 2a5b88 <_DYNAMIC+0x660>
  13d639:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d63e:	ff 15 8c 81 16 00    	call   *0x16818c(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  13d644:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d649:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  13d64e:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  13d652:	e8 29 08 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13d657:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
  13d65b:	3c fe                	cmp    $0xfe,%al
  13d65d:	75 28                	jne    13d687 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x167>
  13d65f:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d664:	e8 97 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d669:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d66e:	e8 8d 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d673:	89 e8                	mov    %ebp,%eax
  13d675:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
  13d67c:	5b                   	pop    %rbx
  13d67d:	41 5c                	pop    %r12
  13d67f:	41 5d                	pop    %r13
  13d681:	41 5e                	pop    %r14
  13d683:	41 5f                	pop    %r15
  13d685:	5d                   	pop    %rbp
  13d686:	c3                   	ret
  13d687:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d68c:	e8 6f 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d691:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d696:	e8 65 1e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d69b:	31 ed                	xor    %ebp,%ebp
  13d69d:	45 84 ed             	test   %r13b,%r13b
  13d6a0:	74 d1                	je     13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d6a2:	80 7c 24 4c 00       	cmpb   $0x0,0x4c(%rsp)
  13d6a7:	74 ca                	je     13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d6a9:	4c 89 e7             	mov    %r12,%rdi
  13d6ac:	4c 89 fe             	mov    %r15,%rsi
  13d6af:	48 89 da             	mov    %rbx,%rdx
  13d6b2:	4c 89 f1             	mov    %r14,%rcx
  13d6b5:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
  13d6ba:	e8 d1 96 ff ff       	call   136d90 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero>
  13d6bf:	40 b5 01             	mov    $0x1,%bpl
  13d6c2:	a8 01                	test   $0x1,%al
  13d6c4:	75 ad                	jne    13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d6c6:	4c 8d 6c 24 50       	lea    0x50(%rsp),%r13
  13d6cb:	4c 89 ef             	mov    %r13,%rdi
  13d6ce:	4c 89 e6             	mov    %r12,%rsi
  13d6d1:	4c 89 fa             	mov    %r15,%rdx
  13d6d4:	e8 c7 20 ff ff       	call   12f7a0 <_RINvXNvMNtCs1C1lLj4PWSY_5alloc5sliceSp9to_vec_inNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealNtB3_10ConvertVec6to_vecNtNtB8_5alloc6GlobalECs6IjHMNHnq5H_10hypersolve>
  13d6d9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d6de:	4c 89 ee             	mov    %r13,%rsi
  13d6e1:	8b 6c 24 0c          	mov    0xc(%rsp),%ebp
  13d6e5:	89 ea                	mov    %ebp,%edx
  13d6e7:	ff 15 bb 84 16 00    	call   *0x1684bb(%rip)        # 2a5ba8 <_DYNAMIC+0x680>
  13d6ed:	48 83 7c 24 10 ff    	cmpq   $0xffffffffffffffff,0x10(%rsp)
  13d6f3:	0f 84 a1 00 00 00    	je     13d79a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x27a>
  13d6f9:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  13d6fe:	48 89 94 24 90 00 00 	mov    %rdx,0x90(%rsp)
  13d705:	00 
  13d706:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  13d70b:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  13d712:	00 
  13d713:	48 8b b4 24 88 00 00 	mov    0x88(%rsp),%rsi
  13d71a:	00 
  13d71b:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d720:	89 e9                	mov    %ebp,%ecx
  13d722:	ff 15 20 86 16 00    	call   *0x168620(%rip)        # 2a5d48 <_DYNAMIC+0x820>
  13d728:	48 83 7c 24 50 ff    	cmpq   $0xffffffffffffffff,0x50(%rsp)
  13d72e:	74 5d                	je     13d78d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x26d>
  13d730:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
  13d735:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  13d73a:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  13d73f:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  13d744:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  13d749:	48 89 da             	mov    %rbx,%rdx
  13d74c:	4c 89 f1             	mov    %r14,%rcx
  13d74f:	41 89 e8             	mov    %ebp,%r8d
  13d752:	e8 a9 45 ff ff       	call   131d00 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation11sturm_count>
  13d757:	48 83 f8 01          	cmp    $0x1,%rax
  13d75b:	75 26                	jne    13d783 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x263>
  13d75d:	48 89 d3             	mov    %rdx,%rbx
  13d760:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d765:	e8 a6 16 ff ff       	call   12ee10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs6IjHMNHnq5H_10hypersolve>
  13d76a:	48 85 db             	test   %rbx,%rbx
  13d76d:	40 0f 94 c5          	sete   %bpl
  13d771:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  13d778:	00 
  13d779:	e8 92 17 ff ff       	call   12ef10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d77e:	e9 f0 fe ff ff       	jmp    13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d783:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d788:	e8 83 16 ff ff       	call   12ee10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs6IjHMNHnq5H_10hypersolve>
  13d78d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  13d794:	00 
  13d795:	e8 76 17 ff ff       	call   12ef10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d79a:	40 b5 02             	mov    $0x2,%bpl
  13d79d:	e9 d1 fe ff ff       	jmp    13d673 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  13d7a2:	48 89 c3             	mov    %rax,%rbx
  13d7a5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d7aa:	e8 61 16 ff ff       	call   12ee10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs6IjHMNHnq5H_10hypersolve>
  13d7af:	eb 03                	jmp    13d7b4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x294>
  13d7b1:	48 89 c3             	mov    %rax,%rbx
  13d7b4:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  13d7bb:	00 
  13d7bc:	e8 4f 17 ff ff       	call   12ef10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d7c1:	eb 58                	jmp    13d81b <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2fb>
  13d7c3:	48 89 c3             	mov    %rax,%rbx
  13d7c6:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d7cb:	e8 30 1d ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d7d0:	eb 03                	jmp    13d7d5 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2b5>
  13d7d2:	48 89 c3             	mov    %rax,%rbx
  13d7d5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d7da:	e8 21 1d ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d7df:	eb 3a                	jmp    13d81b <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2fb>
  13d7e1:	48 89 c3             	mov    %rax,%rbx
  13d7e4:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d7e9:	e8 12 1d ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d7ee:	eb 12                	jmp    13d802 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2e2>
  13d7f0:	48 89 c3             	mov    %rax,%rbx
  13d7f3:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13d7f8:	e8 03 1d ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d7fd:	eb 12                	jmp    13d811 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2f1>
  13d7ff:	48 89 c3             	mov    %rax,%rbx
  13d802:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d807:	e8 f4 1c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d80c:	eb 0d                	jmp    13d81b <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2fb>
  13d80e:	48 89 c3             	mov    %rax,%rbx
  13d811:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13d816:	e8 e5 1c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d81b:	48 89 df             	mov    %rbx,%rdi
  13d81e:	e8 2d e5 15 00       	call   29bd50 <_Unwind_Resume@plt>
  13d823:	ff 15 3f 7f 16 00    	call   *0x167f3f(%rip)        # 2a5768 <_DYNAMIC+0x240>
