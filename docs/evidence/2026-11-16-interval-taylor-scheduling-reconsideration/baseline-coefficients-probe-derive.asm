
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/baseline-coefficients-probe:     file format elf64-x86-64


Disassembly of section .text:

000000000012d660 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE>:
  12d660:	55                   	push   %rbp
  12d661:	41 57                	push   %r15
  12d663:	41 56                	push   %r14
  12d665:	41 55                	push   %r13
  12d667:	41 54                	push   %r12
  12d669:	53                   	push   %rbx
  12d66a:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
  12d671:	4c 89 8c 24 c0 00 00 	mov    %r9,0xc0(%rsp)
  12d678:	00 
  12d679:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  12d67e:	89 cd                	mov    %ecx,%ebp
  12d680:	48 89 94 24 d0 00 00 	mov    %rdx,0xd0(%rsp)
  12d687:	00 
  12d688:	49 89 fd             	mov    %rdi,%r13
  12d68b:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  12d692:	00 
  12d693:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12d697:	48 03 8c 24 78 01 00 	add    0x178(%rsp),%rcx
  12d69e:	00 
  12d69f:	72 7b                	jb     12d71c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbc>
  12d6a1:	48 8b 46 48          	mov    0x48(%rsi),%rax
  12d6a5:	48 3b 08             	cmp    (%rax),%rcx
  12d6a8:	73 72                	jae    12d71c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbc>
  12d6aa:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12d6ae:	48 85 c9             	test   %rcx,%rcx
  12d6b1:	74 0e                	je     12d6c1 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x61>
  12d6b3:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  12d6b7:	b1 07                	mov    $0x7,%cl
  12d6b9:	84 d2                	test   %dl,%dl
  12d6bb:	0f 85 b5 09 00 00    	jne    12e076 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa16>
  12d6c1:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12d6c5:	48 85 c9             	test   %rcx,%rcx
  12d6c8:	0f 84 a6 09 00 00    	je     12e074 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa14>
  12d6ce:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  12d6d3:	48 ff c9             	dec    %rcx
  12d6d6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12d6da:	ff 15 f8 41 1b 00    	call   *0x1b41f8(%rip)        # 2e18d8 <_DYNAMIC+0x2e8>
  12d6e0:	bf 10 00 00 00       	mov    $0x10,%edi
  12d6e5:	be 08 00 00 00       	mov    $0x8,%esi
  12d6ea:	ff 15 08 41 1b 00    	call   *0x1b4108(%rip)        # 2e17f8 <_DYNAMIC+0x208>
  12d6f0:	48 85 c0             	test   %rax,%rax
  12d6f3:	0f 84 5e 0b 00 00    	je     12e257 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbf7>
  12d6f9:	48 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%rcx
  12d700:	00 
  12d701:	48 89 08             	mov    %rcx,(%rax)
  12d704:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  12d708:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
  12d70f:	00 
  12d710:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  12d715:	b8 01 00 00 00       	mov    $0x1,%eax
  12d71a:	eb 32                	jmp    12d74e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xee>
  12d71c:	41 c6 45 00 05       	movb   $0x5,0x0(%r13)
  12d721:	4c 89 e8             	mov    %r13,%rax
  12d724:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
  12d72b:	5b                   	pop    %rbx
  12d72c:	41 5c                	pop    %r12
  12d72e:	41 5d                	pop    %r13
  12d730:	41 5e                	pop    %r14
  12d732:	41 5f                	pop    %r15
  12d734:	5d                   	pop    %rbp
  12d735:	c3                   	ret
  12d736:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  12d73d:	00 00 00 
  12d740:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  12d745:	48 85 c0             	test   %rax,%rax
  12d748:	0f 84 7e 09 00 00    	je     12e0cc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa6c>
  12d74e:	48 ff c8             	dec    %rax
  12d751:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  12d756:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  12d75b:	48 c1 e0 04          	shl    $0x4,%rax
  12d75f:	4c 8b 34 01          	mov    (%rcx,%rax,1),%r14
  12d763:	0f b6 5c 01 08       	movzbl 0x8(%rcx,%rax,1),%ebx
  12d768:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12d76d:	48 8b 40 48          	mov    0x48(%rax),%rax
  12d771:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12d775:	48 85 c9             	test   %rcx,%rcx
  12d778:	74 0c                	je     12d786 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x126>
  12d77a:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  12d77e:	84 c9                	test   %cl,%cl
  12d780:	0f 85 df 09 00 00    	jne    12e165 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb05>
  12d786:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12d78a:	48 85 c9             	test   %rcx,%rcx
  12d78d:	0f 84 28 09 00 00    	je     12e0bb <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa5b>
  12d793:	48 ff c9             	dec    %rcx
  12d796:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12d79a:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  12d7a1:	00 
  12d7a2:	48 8b 00             	mov    (%rax),%rax
  12d7a5:	48 85 c0             	test   %rax,%rax
  12d7a8:	0f 84 92 00 00 00    	je     12d840 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e0>
  12d7ae:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12d7b5:	00 
  12d7b6:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  12d7ba:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  12d7c1:	89 f7                	mov    %esi,%edi
  12d7c3:	c1 e7 04             	shl    $0x4,%edi
  12d7c6:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  12d7cd:	49 89 c0             	mov    %rax,%r8
  12d7d0:	eb 27                	jmp    12d7f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x199>
  12d7d2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12d7d9:	1f 84 00 00 00 00 00 
  12d7e0:	41 0f 97 c1          	seta   %r9b
  12d7e4:	41 80 d9 00          	sbb    $0x0,%r9b
  12d7e8:	49 83 c0 10          	add    $0x10,%r8
  12d7ec:	48 ff c2             	inc    %rdx
  12d7ef:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  12d7f3:	41 80 f9 01          	cmp    $0x1,%r9b
  12d7f7:	75 17                	jne    12d810 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1b0>
  12d7f9:	48 85 ff             	test   %rdi,%rdi
  12d7fc:	74 22                	je     12d820 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1c0>
  12d7fe:	4d 3b 30             	cmp    (%r8),%r14
  12d801:	75 dd                	jne    12d7e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x180>
  12d803:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  12d807:	eb d7                	jmp    12d7e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x180>
  12d809:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  12d810:	41 0f b6 f1          	movzbl %r9b,%esi
  12d814:	85 f6                	test   %esi,%esi
  12d816:	75 0b                	jne    12d823 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1c3>
  12d818:	e9 23 ff ff ff       	jmp    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12d81d:	0f 1f 00             	nopl   (%rax)
  12d820:	48 89 f2             	mov    %rsi,%rdx
  12d823:	48 83 e9 01          	sub    $0x1,%rcx
  12d827:	72 17                	jb     12d840 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e0>
  12d829:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  12d830:	00 
  12d831:	eb 87                	jmp    12d7ba <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x15a>
  12d833:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12d83a:	84 00 00 00 00 00 
  12d840:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12d845:	48 8b 70 28          	mov    0x28(%rax),%rsi
  12d849:	49 39 f6             	cmp    %rsi,%r14
  12d84c:	0f 83 30 0a 00 00    	jae    12e282 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc22>
  12d852:	48 8b 40 20          	mov    0x20(%rax),%rax
  12d856:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  12d85a:	48 c1 e1 04          	shl    $0x4,%rcx
  12d85e:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  12d862:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  12d866:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  12d86a:	48 83 f8 16          	cmp    $0x16,%rax
  12d86e:	b8 00 00 00 00       	mov    $0x0,%eax
  12d873:	48 0f 42 c8          	cmovb  %rax,%rcx
  12d877:	48 8d 15 6a 20 f8 ff 	lea    -0x7df96(%rip),%rdx        # af8e8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa86>
  12d87e:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  12d882:	48 01 d0             	add    %rdx,%rax
  12d885:	ff e0                	jmp    *%rax
  12d887:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12d88c:	e8 cf 0d 00 00       	call   12e660 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17h1bbed13f28b0ca94E.llvm.15530680740981780625>
  12d891:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  12d896:	e9 8f 00 00 00       	jmp    12d92a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2ca>
  12d89b:	48 8b 46 18          	mov    0x18(%rsi),%rax
  12d89f:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  12d8a4:	f3 0f 7f 44 24 68    	movdqu %xmm0,0x68(%rsp)
  12d8aa:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  12d8af:	b0 17                	mov    $0x17,%al
  12d8b1:	eb 73                	jmp    12d926 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2c6>
  12d8b3:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  12d8b7:	88 44 24 78          	mov    %al,0x78(%rsp)
  12d8bb:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  12d8c0:	f3 0f 7f 44 24 68    	movdqu %xmm0,0x68(%rsp)
  12d8c6:	b0 18                	mov    $0x18,%al
  12d8c8:	eb 5c                	jmp    12d926 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2c6>
  12d8ca:	44 8b 7e 20          	mov    0x20(%rsi),%r15d
  12d8ce:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12d8d5:	00 00 80 
  12d8d8:	48 89 c8             	mov    %rcx,%rax
  12d8db:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  12d8df:	74 24                	je     12d905 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2a5>
  12d8e1:	48 83 c6 08          	add    $0x8,%rsi
  12d8e5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  12d8ea:	ff 15 10 44 1b 00    	call   *0x1b4410(%rip)        # 2e1d00 <_DYNAMIC+0x710>
  12d8f0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  12d8f5:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  12d8fa:	0f 10 01             	movups (%rcx),%xmm0
  12d8fd:	0f 29 84 24 90 00 00 	movaps %xmm0,0x90(%rsp)
  12d904:	00 
  12d905:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  12d90a:	66 0f 6f 84 24 90 00 	movdqa 0x90(%rsp),%xmm0
  12d911:	00 00 
  12d913:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  12d918:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  12d91c:	44 89 bc 24 80 00 00 	mov    %r15d,0x80(%rsp)
  12d923:	00 
  12d924:	b0 16                	mov    $0x16,%al
  12d926:	88 44 24 60          	mov    %al,0x60(%rsp)
  12d92a:	0f b6 c8             	movzbl %al,%ecx
  12d92d:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12d931:	80 f9 16             	cmp    $0x16,%cl
  12d934:	b9 00 00 00 00       	mov    $0x0,%ecx
  12d939:	48 0f 42 c1          	cmovb  %rcx,%rax
  12d93d:	84 db                	test   %bl,%bl
  12d93f:	74 37                	je     12d978 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x318>
  12d941:	48 8d 0d b0 1f f8 ff 	lea    -0x7e050(%rip),%rcx        # af8f8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa96>
  12d948:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  12d94c:	48 01 c8             	add    %rcx,%rax
  12d94f:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  12d954:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12d95b:	00 
  12d95c:	ff e0                	jmp    *%rax
  12d95e:	39 ac 24 80 00 00 00 	cmp    %ebp,0x80(%rsp)
  12d965:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  12d96a:	48 0f 44 94 24 c0 00 	cmove  0xc0(%rsp),%rdx
  12d971:	00 00 
  12d973:	e9 7f 05 00 00       	jmp    12def7 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x897>
  12d978:	83 f8 02             	cmp    $0x2,%eax
  12d97b:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12d982:	00 
  12d983:	73 0a                	jae    12d98f <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x32f>
  12d985:	45 31 ff             	xor    %r15d,%r15d
  12d988:	31 db                	xor    %ebx,%ebx
  12d98a:	e9 c3 03 00 00       	jmp    12dd52 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6f2>
  12d98f:	83 f8 02             	cmp    $0x2,%eax
  12d992:	0f 85 95 03 00 00    	jne    12dd2d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6cd>
  12d998:	bb 01 00 00 00       	mov    $0x1,%ebx
  12d99d:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  12d9a2:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  12d9a9:	00 
  12d9aa:	45 31 ff             	xor    %r15d,%r15d
  12d9ad:	e9 a0 03 00 00       	jmp    12dd52 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6f2>
  12d9b2:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  12d9b7:	f3 0f 6f 44 24 78    	movdqu 0x78(%rsp),%xmm0
  12d9bd:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  12d9c2:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  12d9c8:	eb 11                	jmp    12d9db <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x37b>
  12d9ca:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  12d9cf:	41 bf 02 00 00 00    	mov    $0x2,%r15d
  12d9d5:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  12d9db:	66 0f 7f 84 24 f0 00 	movdqa %xmm0,0xf0(%rsp)
  12d9e2:	00 00 
  12d9e4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  12d9e9:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  12d9f0:	00 
  12d9f1:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  12d9f8:	00 
  12d9f9:	31 db                	xor    %ebx,%ebx
  12d9fb:	eb 27                	jmp    12da24 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3c4>
  12d9fd:	4c 89 e0             	mov    %r12,%rax
  12da00:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  12da07:	00 
  12da08:	48 89 84 dc d8 00 00 	mov    %rax,0xd8(%rsp,%rbx,8)
  12da0f:	00 
  12da10:	4c 89 eb             	mov    %r13,%rbx
  12da13:	4d 39 fd             	cmp    %r15,%r13
  12da16:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12da1d:	00 
  12da1e:	0f 84 e1 02 00 00    	je     12dd05 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6a5>
  12da24:	48 8b 01             	mov    (%rcx),%rax
  12da27:	48 85 c0             	test   %rax,%rax
  12da2a:	0f 84 37 08 00 00    	je     12e267 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc07>
  12da30:	4c 8d 6b 01          	lea    0x1(%rbx),%r13
  12da34:	48 8b 8c dc f0 00 00 	mov    0xf0(%rsp,%rbx,8),%rcx
  12da3b:	00 
  12da3c:	48 8b 94 24 70 01 00 	mov    0x170(%rsp),%rdx
  12da43:	00 
  12da44:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  12da48:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12da4f:	41 89 f8             	mov    %edi,%r8d
  12da52:	41 c1 e0 04          	shl    $0x4,%r8d
  12da56:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  12da5d:	49 89 c1             	mov    %rax,%r9
  12da60:	eb 27                	jmp    12da89 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x429>
  12da62:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12da69:	1f 84 00 00 00 00 00 
  12da70:	41 0f 97 c2          	seta   %r10b
  12da74:	41 80 da 00          	sbb    $0x0,%r10b
  12da78:	49 83 c1 10          	add    $0x10,%r9
  12da7c:	48 ff c6             	inc    %rsi
  12da7f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  12da83:	41 80 fa 01          	cmp    $0x1,%r10b
  12da87:	75 17                	jne    12daa0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x440>
  12da89:	4d 85 c0             	test   %r8,%r8
  12da8c:	74 22                	je     12dab0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x450>
  12da8e:	49 3b 09             	cmp    (%r9),%rcx
  12da91:	75 dd                	jne    12da70 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x410>
  12da93:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  12da97:	eb d7                	jmp    12da70 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x410>
  12da99:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  12daa0:	41 0f b6 fa          	movzbl %r10b,%edi
  12daa4:	85 ff                	test   %edi,%edi
  12daa6:	75 0b                	jne    12dab3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x453>
  12daa8:	eb 26                	jmp    12dad0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x470>
  12daaa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  12dab0:	48 89 fe             	mov    %rdi,%rsi
  12dab3:	48 83 ea 01          	sub    $0x1,%rdx
  12dab7:	0f 82 aa 07 00 00    	jb     12e267 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc07>
  12dabd:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  12dac4:	00 
  12dac5:	eb 81                	jmp    12da48 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3e8>
  12dac7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  12dace:	00 00 
  12dad0:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  12dad7:	00 
  12dad8:	4c 3b 64 24 20       	cmp    0x20(%rsp),%r12
  12dadd:	0f 84 2d ff ff ff    	je     12da10 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3b0>
  12dae3:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12dae8:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12daec:	48 83 f9 16          	cmp    $0x16,%rcx
  12daf0:	b9 00 00 00 00       	mov    $0x0,%ecx
  12daf5:	48 0f 42 c1          	cmovb  %rcx,%rax
  12daf9:	48 83 f8 02          	cmp    $0x2,%rax
  12dafd:	0f 84 7d 00 00 00    	je     12db80 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x520>
  12db03:	83 f8 03             	cmp    $0x3,%eax
  12db06:	0f 85 30 07 00 00    	jne    12e23c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbdc>
  12db0c:	0f b6 44 24 78       	movzbl 0x78(%rsp),%eax
  12db11:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12db18:	00 00 80 
  12db1b:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
  12db22:	00 
  12db23:	c7 84 24 b0 00 00 00 	movl   $0x0,0xb0(%rsp)
  12db2a:	00 00 00 00 
  12db2e:	c6 84 24 90 00 00 00 	movb   $0x16,0x90(%rsp)
  12db35:	16 
  12db36:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12db3b:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  12db42:	00 
  12db43:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  12db48:	48 8d 0d b9 1d f8 ff 	lea    -0x7e247(%rip),%rcx        # af908 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xaa6>
  12db4f:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  12db53:	48 01 c8             	add    %rcx,%rax
  12db56:	ff e0                	jmp    *%rax
  12db58:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  12db5f:	00 
  12db60:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  12db67:	00 
  12db68:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12db6d:	ff 15 a5 41 1b 00    	call   *0x1b41a5(%rip)        # 2e1d18 <_DYNAMIC+0x728>
  12db73:	eb 43                	jmp    12dbb8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  12db75:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  12db7c:	00 00 00 00 
  12db80:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  12db85:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  12db8a:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  12db91:	00 00 80 
  12db94:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12db99:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  12dba0:	00 
  12dba1:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  12dba6:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  12dbad:	00 
  12dbae:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  12dbb3:	e8 18 3a fe ff       	call   1115d0 <_ZN10hypersolve18expression_program8jacobian5unary17h2b423a6394b7a769E>
  12dbb8:	f3 0f 6f 84 24 08 01 	movdqu 0x108(%rsp),%xmm0
  12dbbf:	00 00 
  12dbc1:	0f 10 8c 24 18 01 00 	movups 0x118(%rsp),%xmm1
  12dbc8:	00 
  12dbc9:	0f 10 94 24 28 01 00 	movups 0x128(%rsp),%xmm2
  12dbd0:	00 
  12dbd1:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  12dbd6:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  12dbdb:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  12dbe1:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  12dbe8:	00 
  12dbe9:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  12dbee:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dbf3:	89 d9                	mov    %ebx,%ecx
  12dbf5:	4c 8d 84 24 f0 00 00 	lea    0xf0(%rsp),%r8
  12dbfc:	00 
  12dbfd:	4d 89 f9             	mov    %r15,%r9
  12dc00:	ff b4 24 c0 00 00 00 	push   0xc0(%rsp)
  12dc07:	ff 74 24 28          	push   0x28(%rsp)
  12dc0b:	e8 a0 3f fe ff       	call   111bb0 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17ha766717089845c05E>
  12dc10:	48 83 c4 10          	add    $0x10,%rsp
  12dc14:	0f b6 8c 24 90 00 00 	movzbl 0x90(%rsp),%ecx
  12dc1b:	00 
  12dc1c:	80 f9 0d             	cmp    $0xd,%cl
  12dc1f:	0f 85 5a 04 00 00    	jne    12e07f <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa1f>
  12dc25:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
  12dc2c:	00 
  12dc2d:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  12dc32:	48 89 d0             	mov    %rdx,%rax
  12dc35:	48 39 d1             	cmp    %rdx,%rcx
  12dc38:	0f 84 c2 fd ff ff    	je     12da00 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3a0>
  12dc3e:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  12dc45:	00 
  12dc46:	48 39 c1             	cmp    %rax,%rcx
  12dc49:	0f 84 ae fd ff ff    	je     12d9fd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x39d>
  12dc4f:	49 39 c4             	cmp    %rax,%r12
  12dc52:	75 68                	jne    12dcbc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x65c>
  12dc54:	48 89 c8             	mov    %rcx,%rax
  12dc57:	e9 a4 fd ff ff       	jmp    12da00 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3a0>
  12dc5c:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  12dc63:	00 
  12dc64:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  12dc6b:	00 
  12dc6c:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dc71:	ff 15 99 40 1b 00    	call   *0x1b4099(%rip)        # 2e1d10 <_DYNAMIC+0x720>
  12dc77:	e9 3c ff ff ff       	jmp    12dbb8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  12dc7c:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  12dc83:	00 
  12dc84:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  12dc8b:	00 
  12dc8c:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dc91:	ff 15 41 41 1b 00    	call   *0x1b4141(%rip)        # 2e1dd8 <_DYNAMIC+0x7e8>
  12dc97:	e9 1c ff ff ff       	jmp    12dbb8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  12dc9c:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  12dca3:	00 
  12dca4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  12dcab:	00 
  12dcac:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dcb1:	ff 15 71 40 1b 00    	call   *0x1b4071(%rip)        # 2e1d28 <_DYNAMIC+0x738>
  12dcb7:	e9 fc fe ff ff       	jmp    12dbb8 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x558>
  12dcbc:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  12dcc1:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12dcc6:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  12dccb:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  12dcd0:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  12dcd7:	00 
  12dcd8:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  12dcdd:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dce2:	e8 89 3d fe ff       	call   111a70 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  12dce7:	0f b6 8c 24 90 00 00 	movzbl 0x90(%rsp),%ecx
  12dcee:	00 
  12dcef:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  12dcf6:	00 
  12dcf7:	80 f9 0d             	cmp    $0xd,%cl
  12dcfa:	0f 84 08 fd ff ff    	je     12da08 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3a8>
  12dd00:	e9 eb 04 00 00       	jmp    12e1f0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb90>
  12dd05:	48 8b 84 24 d8 00 00 	mov    0xd8(%rsp),%rax
  12dd0c:	00 
  12dd0d:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  12dd14:	00 
  12dd15:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  12dd1a:	48 39 f0             	cmp    %rsi,%rax
  12dd1d:	0f 85 7a 01 00 00    	jne    12de9d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x83d>
  12dd23:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  12dd28:	e9 ca 01 00 00       	jmp    12def7 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x897>
  12dd2d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  12dd32:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  12dd39:	00 
  12dd3a:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  12dd3f:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  12dd46:	00 
  12dd47:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  12dd4d:	bb 01 00 00 00       	mov    $0x1,%ebx
  12dd52:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  12dd56:	48 03 94 24 78 01 00 	add    0x178(%rsp),%rdx
  12dd5d:	00 
  12dd5e:	0f 82 5e 03 00 00    	jb     12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12dd64:	48 03 54 24 10       	add    0x10(%rsp),%rdx
  12dd69:	0f 82 53 03 00 00    	jb     12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12dd6f:	4a 8d 04 3b          	lea    (%rbx,%r15,1),%rax
  12dd73:	48 ff c0             	inc    %rax
  12dd76:	48 01 c2             	add    %rax,%rdx
  12dd79:	0f 82 43 03 00 00    	jb     12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12dd7f:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  12dd84:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  12dd88:	48 3b 11             	cmp    (%rcx),%rdx
  12dd8b:	0f 87 31 03 00 00    	ja     12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12dd91:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  12dd95:	48 85 d2             	test   %rdx,%rdx
  12dd98:	74 0c                	je     12dda6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x746>
  12dd9a:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  12dd9e:	84 d2                	test   %dl,%dl
  12dda0:	0f 85 cb 03 00 00    	jne    12e171 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb11>
  12dda6:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
  12ddaa:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  12ddae:	48 39 d6             	cmp    %rdx,%rsi
  12ddb1:	0f 83 b6 03 00 00    	jae    12e16d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb0d>
  12ddb7:	48 29 c2             	sub    %rax,%rdx
  12ddba:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  12ddbe:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  12ddc3:	4c 3b 24 24          	cmp    (%rsp),%r12
  12ddc7:	75 09                	jne    12ddd2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x772>
  12ddc9:	48 89 e7             	mov    %rsp,%rdi
  12ddcc:	ff 15 9e 3f 1b 00    	call   *0x1b3f9e(%rip)        # 2e1d70 <_DYNAMIC+0x780>
  12ddd2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12ddd7:	4c 89 e1             	mov    %r12,%rcx
  12ddda:	48 c1 e1 04          	shl    $0x4,%rcx
  12ddde:	4c 89 34 08          	mov    %r14,(%rax,%rcx,1)
  12dde2:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  12dde7:	4d 8d 74 24 01       	lea    0x1(%r12),%r14
  12ddec:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  12ddf1:	4d 85 ff             	test   %r15,%r15
  12ddf4:	74 36                	je     12de2c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7cc>
  12ddf6:	4c 3b 34 24          	cmp    (%rsp),%r14
  12ddfa:	75 09                	jne    12de05 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7a5>
  12ddfc:	48 89 e7             	mov    %rsp,%rdi
  12ddff:	ff 15 6b 3f 1b 00    	call   *0x1b3f6b(%rip)        # 2e1d70 <_DYNAMIC+0x780>
  12de05:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12de0a:	49 c1 e6 04          	shl    $0x4,%r14
  12de0e:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  12de15:	00 
  12de16:	4a 89 0c 30          	mov    %rcx,(%rax,%r14,1)
  12de1a:	42 c6 44 30 08 00    	movb   $0x0,0x8(%rax,%r14,1)
  12de20:	49 83 c4 02          	add    $0x2,%r12
  12de24:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
  12de29:	4d 89 e6             	mov    %r12,%r14
  12de2c:	48 85 db             	test   %rbx,%rbx
  12de2f:	74 34                	je     12de65 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x805>
  12de31:	4c 3b 34 24          	cmp    (%rsp),%r14
  12de35:	75 09                	jne    12de40 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7e0>
  12de37:	48 89 e7             	mov    %rsp,%rdi
  12de3a:	ff 15 30 3f 1b 00    	call   *0x1b3f30(%rip)        # 2e1d70 <_DYNAMIC+0x780>
  12de40:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12de45:	4c 89 f1             	mov    %r14,%rcx
  12de48:	48 c1 e1 04          	shl    $0x4,%rcx
  12de4c:	48 8b 94 24 c8 00 00 	mov    0xc8(%rsp),%rdx
  12de53:	00 
  12de54:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  12de58:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  12de5d:	49 ff c6             	inc    %r14
  12de60:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  12de65:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12de6a:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12de6e:	48 83 f9 16          	cmp    $0x16,%rcx
  12de72:	b9 00 00 00 00       	mov    $0x0,%ecx
  12de77:	48 0f 42 c1          	cmovb  %rcx,%rax
  12de7b:	48 83 f8 01          	cmp    $0x1,%rax
  12de7f:	0f 84 cc 01 00 00    	je     12e051 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9f1>
  12de85:	48 85 c0             	test   %rax,%rax
  12de88:	0f 85 b2 f8 ff ff    	jne    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12de8e:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12de93:	e8 68 04 00 00       	call   12e300 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.15530680740981780625>
  12de98:	e9 a3 f8 ff ff       	jmp    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12de9d:	48 39 f2             	cmp    %rsi,%rdx
  12dea0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  12dea5:	75 05                	jne    12deac <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x84c>
  12dea7:	48 89 c2             	mov    %rax,%rdx
  12deaa:	eb 4b                	jmp    12def7 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x897>
  12deac:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  12deb1:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12deb6:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  12debb:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  12dec0:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  12dec7:	00 
  12dec8:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  12decd:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12ded2:	e8 99 3b fe ff       	call   111a70 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  12ded7:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
  12dede:	00 
  12dedf:	3c 0d                	cmp    $0xd,%al
  12dee1:	0f 85 29 03 00 00    	jne    12e210 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbb0>
  12dee7:	48 8b 94 24 98 00 00 	mov    0x98(%rsp),%rdx
  12deee:	00 
  12deef:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12def6:	00 
  12def7:	48 8b 41 10          	mov    0x10(%rcx),%rax
  12defb:	48 03 84 24 78 01 00 	add    0x178(%rsp),%rax
  12df02:	00 
  12df03:	0f 82 b9 01 00 00    	jb     12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12df09:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  12df0e:	48 01 c1             	add    %rax,%rcx
  12df11:	48 39 c1             	cmp    %rax,%rcx
  12df14:	0f 82 a8 01 00 00    	jb     12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12df1a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12df1f:	48 8b 40 48          	mov    0x48(%rax),%rax
  12df23:	48 3b 08             	cmp    (%rax),%rcx
  12df26:	0f 83 96 01 00 00    	jae    12e0c2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa62>
  12df2c:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12df30:	48 85 c9             	test   %rcx,%rcx
  12df33:	74 0c                	je     12df41 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8e1>
  12df35:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  12df39:	84 c9                	test   %cl,%cl
  12df3b:	0f 85 30 02 00 00    	jne    12e171 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb11>
  12df41:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12df45:	48 85 c9             	test   %rcx,%rcx
  12df48:	0f 84 1f 02 00 00    	je     12e16d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb0d>
  12df4e:	48 ff c9             	dec    %rcx
  12df51:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12df55:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12df5c:	00 
  12df5d:	48 8b 01             	mov    (%rcx),%rax
  12df60:	48 85 c0             	test   %rax,%rax
  12df63:	74 7b                	je     12dfe0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x980>
  12df65:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  12df69:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12df70:	41 89 f8             	mov    %edi,%r8d
  12df73:	41 c1 e0 04          	shl    $0x4,%r8d
  12df77:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  12df7e:	49 89 c1             	mov    %rax,%r9
  12df81:	eb 26                	jmp    12dfa9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x949>
  12df83:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12df8a:	84 00 00 00 00 00 
  12df90:	41 0f 97 c2          	seta   %r10b
  12df94:	41 80 da 00          	sbb    $0x0,%r10b
  12df98:	49 83 c1 10          	add    $0x10,%r9
  12df9c:	48 ff c1             	inc    %rcx
  12df9f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  12dfa3:	41 80 fa 01          	cmp    $0x1,%r10b
  12dfa7:	75 10                	jne    12dfb9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x959>
  12dfa9:	4d 85 c0             	test   %r8,%r8
  12dfac:	74 15                	je     12dfc3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x963>
  12dfae:	4d 3b 31             	cmp    (%r9),%r14
  12dfb1:	75 dd                	jne    12df90 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x930>
  12dfb3:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  12dfb7:	eb d7                	jmp    12df90 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x930>
  12dfb9:	41 0f b6 fa          	movzbl %r10b,%edi
  12dfbd:	85 ff                	test   %edi,%edi
  12dfbf:	75 05                	jne    12dfc6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x966>
  12dfc1:	eb 13                	jmp    12dfd6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x976>
  12dfc3:	48 89 f9             	mov    %rdi,%rcx
  12dfc6:	48 83 ee 01          	sub    $0x1,%rsi
  12dfca:	72 16                	jb     12dfe2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x982>
  12dfcc:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  12dfd3:	00 
  12dfd4:	eb 93                	jmp    12df69 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x909>
  12dfd6:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  12dfdd:	00 
  12dfde:	eb 3d                	jmp    12e01d <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9bd>
  12dfe0:	31 c0                	xor    %eax,%eax
  12dfe2:	48 8b b4 24 70 01 00 	mov    0x170(%rsp),%rsi
  12dfe9:	00 
  12dfea:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  12dfef:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
  12dff4:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  12dff8:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  12dffd:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  12e004:	00 00 
  12e006:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  12e00b:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  12e012:	00 
  12e013:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  12e018:	e8 33 09 00 00       	call   12e950 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h9e96ea47bee8ef08E>
  12e01d:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12e022:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12e026:	48 83 f9 16          	cmp    $0x16,%rcx
  12e02a:	b9 00 00 00 00       	mov    $0x0,%ecx
  12e02f:	48 0f 42 c1          	cmovb  %rcx,%rax
  12e033:	48 83 f8 01          	cmp    $0x1,%rax
  12e037:	74 18                	je     12e051 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9f1>
  12e039:	48 85 c0             	test   %rax,%rax
  12e03c:	0f 85 fe f6 ff ff    	jne    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12e042:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12e047:	e8 b4 02 00 00       	call   12e300 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.15530680740981780625>
  12e04c:	e9 ef f6 ff ff       	jmp    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12e051:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  12e056:	48 85 f6             	test   %rsi,%rsi
  12e059:	0f 8e e1 f6 ff ff    	jle    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12e05f:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  12e064:	ba 01 00 00 00       	mov    $0x1,%edx
  12e069:	ff 15 91 37 1b 00    	call   *0x1b3791(%rip)        # 2e1800 <_DYNAMIC+0x210>
  12e06f:	e9 cc f6 ff ff       	jmp    12d740 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xe0>
  12e074:	b1 06                	mov    $0x6,%cl
  12e076:	41 88 4d 00          	mov    %cl,0x0(%r13)
  12e07a:	e9 a2 f6 ff ff       	jmp    12d721 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc1>
  12e07f:	8b 84 24 91 00 00 00 	mov    0x91(%rsp),%eax
  12e086:	8b 94 24 94 00 00 00 	mov    0x94(%rsp),%edx
  12e08d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  12e092:	41 89 55 04          	mov    %edx,0x4(%r13)
  12e096:	41 89 45 01          	mov    %eax,0x1(%r13)
  12e09a:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  12e0a1:	00 
  12e0a2:	48 8b 94 24 a0 00 00 	mov    0xa0(%rsp),%rdx
  12e0a9:	00 
  12e0aa:	41 88 4d 00          	mov    %cl,0x0(%r13)
  12e0ae:	49 89 45 08          	mov    %rax,0x8(%r13)
  12e0b2:	49 89 55 10          	mov    %rdx,0x10(%r13)
  12e0b6:	e9 bc 00 00 00       	jmp    12e177 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb17>
  12e0bb:	b0 06                	mov    $0x6,%al
  12e0bd:	e9 a5 00 00 00       	jmp    12e167 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb07>
  12e0c2:	41 c6 45 00 05       	movb   $0x5,0x0(%r13)
  12e0c7:	e9 ab 00 00 00       	jmp    12e177 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb17>
  12e0cc:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12e0d3:	00 
  12e0d4:	48 8b 01             	mov    (%rcx),%rax
  12e0d7:	48 85 c0             	test   %rax,%rax
  12e0da:	0f 84 b4 01 00 00    	je     12e294 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc34>
  12e0e0:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  12e0e4:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  12e0eb:	89 f7                	mov    %esi,%edi
  12e0ed:	c1 e7 04             	shl    $0x4,%edi
  12e0f0:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  12e0f7:	49 89 c0             	mov    %rax,%r8
  12e0fa:	eb 1d                	jmp    12e119 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xab9>
  12e0fc:	0f 1f 40 00          	nopl   0x0(%rax)
  12e100:	41 0f 97 c1          	seta   %r9b
  12e104:	41 80 d9 00          	sbb    $0x0,%r9b
  12e108:	49 83 c0 10          	add    $0x10,%r8
  12e10c:	48 ff c2             	inc    %rdx
  12e10f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  12e113:	41 80 f9 01          	cmp    $0x1,%r9b
  12e117:	75 18                	jne    12e131 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xad1>
  12e119:	48 85 ff             	test   %rdi,%rdi
  12e11c:	74 1d                	je     12e13b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xadb>
  12e11e:	4c 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%r9
  12e125:	00 
  12e126:	4d 3b 08             	cmp    (%r8),%r9
  12e129:	75 d5                	jne    12e100 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xaa0>
  12e12b:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  12e12f:	eb cf                	jmp    12e100 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xaa0>
  12e131:	41 0f b6 f1          	movzbl %r9b,%esi
  12e135:	85 f6                	test   %esi,%esi
  12e137:	75 05                	jne    12e13e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xade>
  12e139:	eb 17                	jmp    12e152 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xaf2>
  12e13b:	48 89 f2             	mov    %rsi,%rdx
  12e13e:	48 83 e9 01          	sub    $0x1,%rcx
  12e142:	0f 82 4c 01 00 00    	jb     12e294 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc34>
  12e148:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  12e14f:	00 
  12e150:	eb 92                	jmp    12e0e4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa84>
  12e152:	48 8b 84 d0 b8 00 00 	mov    0xb8(%rax,%rdx,8),%rax
  12e159:	00 
  12e15a:	49 89 45 08          	mov    %rax,0x8(%r13)
  12e15e:	41 c6 45 00 0d       	movb   $0xd,0x0(%r13)
  12e163:	eb 65                	jmp    12e1ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  12e165:	b0 07                	mov    $0x7,%al
  12e167:	41 88 45 00          	mov    %al,0x0(%r13)
  12e16b:	eb 5d                	jmp    12e1ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  12e16d:	b0 06                	mov    $0x6,%al
  12e16f:	eb 02                	jmp    12e173 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb13>
  12e171:	b0 07                	mov    $0x7,%al
  12e173:	41 88 45 00          	mov    %al,0x0(%r13)
  12e177:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12e17c:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  12e180:	31 c0                	xor    %eax,%eax
  12e182:	48 83 f9 16          	cmp    $0x16,%rcx
  12e186:	48 0f 43 c2          	cmovae %rdx,%rax
  12e18a:	48 83 f8 01          	cmp    $0x1,%rax
  12e18e:	74 11                	je     12e1a1 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb41>
  12e190:	48 85 c0             	test   %rax,%rax
  12e193:	75 35                	jne    12e1ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  12e195:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12e19a:	e8 61 01 00 00       	call   12e300 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.15530680740981780625>
  12e19f:	eb 29                	jmp    12e1ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  12e1a1:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  12e1a6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  12e1ad:	00 00 80 
  12e1b0:	48 39 c6             	cmp    %rax,%rsi
  12e1b3:	74 15                	je     12e1ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  12e1b5:	48 85 f6             	test   %rsi,%rsi
  12e1b8:	74 10                	je     12e1ca <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6a>
  12e1ba:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  12e1bf:	ba 01 00 00 00       	mov    $0x1,%edx
  12e1c4:	ff 15 36 36 1b 00    	call   *0x1b3636(%rip)        # 2e1800 <_DYNAMIC+0x210>
  12e1ca:	48 8b 34 24          	mov    (%rsp),%rsi
  12e1ce:	48 85 f6             	test   %rsi,%rsi
  12e1d1:	0f 84 4a f5 ff ff    	je     12d721 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc1>
  12e1d7:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  12e1dc:	48 c1 e6 04          	shl    $0x4,%rsi
  12e1e0:	ba 08 00 00 00       	mov    $0x8,%edx
  12e1e5:	ff 15 15 36 1b 00    	call   *0x1b3615(%rip)        # 2e1800 <_DYNAMIC+0x210>
  12e1eb:	e9 31 f5 ff ff       	jmp    12d721 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc1>
  12e1f0:	8b 94 24 91 00 00 00 	mov    0x91(%rsp),%edx
  12e1f7:	8b b4 24 94 00 00 00 	mov    0x94(%rsp),%esi
  12e1fe:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  12e203:	41 89 75 04          	mov    %esi,0x4(%r13)
  12e207:	41 89 55 01          	mov    %edx,0x1(%r13)
  12e20b:	e9 92 fe ff ff       	jmp    12e0a2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa42>
  12e210:	8b 8c 24 91 00 00 00 	mov    0x91(%rsp),%ecx
  12e217:	8b 94 24 94 00 00 00 	mov    0x94(%rsp),%edx
  12e21e:	41 89 55 04          	mov    %edx,0x4(%r13)
  12e222:	41 89 4d 01          	mov    %ecx,0x1(%r13)
  12e226:	0f 10 84 24 98 00 00 	movups 0x98(%rsp),%xmm0
  12e22d:	00 
  12e22e:	41 88 45 00          	mov    %al,0x0(%r13)
  12e232:	41 0f 11 45 08       	movups %xmm0,0x8(%r13)
  12e237:	e9 3b ff ff ff       	jmp    12e177 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb17>
  12e23c:	48 8d 3d 87 17 f8 ff 	lea    -0x7e879(%rip),%rdi        # af9ca <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb68>
  12e243:	48 8d 15 36 db 1a 00 	lea    0x1adb36(%rip),%rdx        # 2dbd80 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x68>
  12e24a:	be 85 00 00 00       	mov    $0x85,%esi
  12e24f:	ff 15 43 36 1b 00    	call   *0x1b3643(%rip)        # 2e1898 <_DYNAMIC+0x2a8>
  12e255:	eb 56                	jmp    12e2ad <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc4d>
  12e257:	bf 08 00 00 00       	mov    $0x8,%edi
  12e25c:	be 10 00 00 00       	mov    $0x10,%esi
  12e261:	ff 15 81 36 1b 00    	call   *0x1b3681(%rip)        # 2e18e8 <_DYNAMIC+0x2f8>
  12e267:	48 8d 3d 46 17 f8 ff 	lea    -0x7e8ba(%rip),%rdi        # af9b4 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb52>
  12e26e:	48 8d 15 f3 da 1a 00 	lea    0x1adaf3(%rip),%rdx        # 2dbd68 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x50>
  12e275:	be 16 00 00 00       	mov    $0x16,%esi
  12e27a:	ff 15 b0 38 1b 00    	call   *0x1b38b0(%rip)        # 2e1b30 <_DYNAMIC+0x540>
  12e280:	eb 2b                	jmp    12e2ad <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc4d>
  12e282:	48 8d 15 c7 da 1a 00 	lea    0x1adac7(%rip),%rdx        # 2dbd50 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x38>
  12e289:	4c 89 f7             	mov    %r14,%rdi
  12e28c:	ff 15 a6 3a 1b 00    	call   *0x1b3aa6(%rip)        # 2e1d38 <_DYNAMIC+0x748>
  12e292:	eb 19                	jmp    12e2ad <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc4d>
  12e294:	48 8d 3d 19 17 f8 ff 	lea    -0x7e8e7(%rip),%rdi        # af9b4 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb52>
  12e29b:	48 8d 15 96 da 1a 00 	lea    0x1ada96(%rip),%rdx        # 2dbd38 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x20>
  12e2a2:	be 16 00 00 00       	mov    $0x16,%esi
  12e2a7:	ff 15 83 38 1b 00    	call   *0x1b3883(%rip)        # 2e1b30 <_DYNAMIC+0x540>
  12e2ad:	0f 0b                	ud2
  12e2af:	eb 0b                	jmp    12e2bc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5c>
  12e2b1:	eb 00                	jmp    12e2b3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc53>
  12e2b3:	48 89 c3             	mov    %rax,%rbx
  12e2b6:	eb 11                	jmp    12e2c9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc69>
  12e2b8:	eb 02                	jmp    12e2bc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5c>
  12e2ba:	eb 00                	jmp    12e2bc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5c>
  12e2bc:	48 89 c3             	mov    %rax,%rbx
  12e2bf:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12e2c4:	e8 d7 02 00 00       	call   12e5a0 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17hf33c9ca44255dc61E>
  12e2c9:	48 8b 34 24          	mov    (%rsp),%rsi
  12e2cd:	48 85 f6             	test   %rsi,%rsi
  12e2d0:	74 14                	je     12e2e6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc86>
  12e2d2:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  12e2d7:	48 c1 e6 04          	shl    $0x4,%rsi
  12e2db:	ba 08 00 00 00       	mov    $0x8,%edx
  12e2e0:	ff 15 1a 35 1b 00    	call   *0x1b351a(%rip)        # 2e1800 <_DYNAMIC+0x210>
  12e2e6:	48 89 df             	mov    %rbx,%rdi
  12e2e9:	e8 72 b0 1a 00       	call   2d9360 <_Unwind_Resume@plt>
  12e2ee:	ff 15 ac 35 1b 00    	call   *0x1b35ac(%rip)        # 2e18a0 <_DYNAMIC+0x2b0>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
