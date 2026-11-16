
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/candidate-coefficients-probe:     file format elf64-x86-64


Disassembly of section .text:

000000000012d660 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE>:
  12d660:	55                   	push   %rbp
  12d661:	41 57                	push   %r15
  12d663:	41 56                	push   %r14
  12d665:	41 55                	push   %r13
  12d667:	41 54                	push   %r12
  12d669:	53                   	push   %rbx
  12d66a:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
  12d671:	4c 89 8c 24 c8 00 00 	mov    %r9,0xc8(%rsp)
  12d678:	00 
  12d679:	89 cd                	mov    %ecx,%ebp
  12d67b:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  12d682:	00 
  12d683:	48 89 fb             	mov    %rdi,%rbx
  12d686:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12d68d:	00 
  12d68e:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12d692:	48 03 8c 24 88 01 00 	add    0x188(%rsp),%rcx
  12d699:	00 
  12d69a:	0f 82 9b 00 00 00    	jb     12d73b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xdb>
  12d6a0:	48 8b 46 48          	mov    0x48(%rsi),%rax
  12d6a4:	48 3b 08             	cmp    (%rax),%rcx
  12d6a7:	0f 83 8e 00 00 00    	jae    12d73b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xdb>
  12d6ad:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12d6b1:	48 85 c9             	test   %rcx,%rcx
  12d6b4:	74 0e                	je     12d6c4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x64>
  12d6b6:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  12d6ba:	b1 07                	mov    $0x7,%cl
  12d6bc:	84 d2                	test   %dl,%dl
  12d6be:	0f 85 eb 09 00 00    	jne    12e0af <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa4f>
  12d6c4:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12d6c8:	48 85 c9             	test   %rcx,%rcx
  12d6cb:	0f 84 dc 09 00 00    	je     12e0ad <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa4d>
  12d6d1:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  12d6d6:	4d 89 c6             	mov    %r8,%r14
  12d6d9:	48 89 1c 24          	mov    %rbx,(%rsp)
  12d6dd:	48 ff c9             	dec    %rcx
  12d6e0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12d6e4:	ff 15 56 42 1b 00    	call   *0x1b4256(%rip)        # 2e1940 <_DYNAMIC+0x2e8>
  12d6ea:	bf 10 00 00 00       	mov    $0x10,%edi
  12d6ef:	be 08 00 00 00       	mov    $0x8,%esi
  12d6f4:	ff 15 66 41 1b 00    	call   *0x1b4166(%rip)        # 2e1860 <_DYNAMIC+0x208>
  12d6fa:	48 85 c0             	test   %rax,%rax
  12d6fd:	0f 84 90 0b 00 00    	je     12e293 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc33>
  12d703:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
  12d70a:	00 
  12d70b:	48 89 08             	mov    %rcx,(%rax)
  12d70e:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  12d712:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
  12d719:	00 00 
  12d71b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  12d720:	bb 01 00 00 00       	mov    $0x1,%ebx
  12d725:	48 8d 05 74 e6 1a 00 	lea    0x1ae674(%rip),%rax        # 2dbda0 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x38>
  12d72c:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  12d733:	00 
  12d734:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
  12d739:	eb 33                	jmp    12d76e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x10e>
  12d73b:	c6 03 05             	movb   $0x5,(%rbx)
  12d73e:	48 89 d8             	mov    %rbx,%rax
  12d741:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
  12d748:	5b                   	pop    %rbx
  12d749:	41 5c                	pop    %r12
  12d74b:	41 5d                	pop    %r13
  12d74d:	41 5e                	pop    %r14
  12d74f:	41 5f                	pop    %r15
  12d751:	5d                   	pop    %rbp
  12d752:	c3                   	ret
  12d753:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12d75a:	84 00 00 00 00 00 
  12d760:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  12d765:	48 85 db             	test   %rbx,%rbx
  12d768:	0f 84 b0 09 00 00    	je     12e11e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xabe>
  12d76e:	48 ff cb             	dec    %rbx
  12d771:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  12d776:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12d77b:	48 c1 e3 04          	shl    $0x4,%rbx
  12d77f:	4c 8b 34 18          	mov    (%rax,%rbx,1),%r14
  12d783:	0f b6 44 18 08       	movzbl 0x8(%rax,%rbx,1),%eax
  12d788:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  12d78d:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  12d791:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  12d795:	48 85 d2             	test   %rdx,%rdx
  12d798:	74 0c                	je     12d7a6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x146>
  12d79a:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  12d79e:	84 d2                	test   %dl,%dl
  12d7a0:	0f 85 1d 0a 00 00    	jne    12e1c3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb63>
  12d7a6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  12d7aa:	48 85 d2             	test   %rdx,%rdx
  12d7ad:	0f 84 64 09 00 00    	je     12e117 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xab7>
  12d7b3:	48 ff ca             	dec    %rdx
  12d7b6:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  12d7ba:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  12d7c1:	00 
  12d7c2:	48 8b 09             	mov    (%rcx),%rcx
  12d7c5:	48 85 c9             	test   %rcx,%rcx
  12d7c8:	0f 84 92 00 00 00    	je     12d860 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x200>
  12d7ce:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  12d7d5:	00 
  12d7d6:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  12d7da:	0f b7 b9 12 01 00 00 	movzwl 0x112(%rcx),%edi
  12d7e1:	41 89 f8             	mov    %edi,%r8d
  12d7e4:	41 c1 e0 04          	shl    $0x4,%r8d
  12d7e8:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  12d7ef:	49 89 c9             	mov    %rcx,%r9
  12d7f2:	eb 25                	jmp    12d819 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1b9>
  12d7f4:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
  12d7fb:	00 00 00 00 00 
  12d800:	41 0f 97 c2          	seta   %r10b
  12d804:	41 80 da 00          	sbb    $0x0,%r10b
  12d808:	49 83 c1 10          	add    $0x10,%r9
  12d80c:	48 ff c6             	inc    %rsi
  12d80f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  12d813:	41 80 fa 01          	cmp    $0x1,%r10b
  12d817:	75 17                	jne    12d830 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1d0>
  12d819:	4d 85 c0             	test   %r8,%r8
  12d81c:	74 22                	je     12d840 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e0>
  12d81e:	4d 3b 31             	cmp    (%r9),%r14
  12d821:	75 dd                	jne    12d800 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1a0>
  12d823:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  12d827:	eb d7                	jmp    12d800 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1a0>
  12d829:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  12d830:	41 0f b6 fa          	movzbl %r10b,%edi
  12d834:	85 ff                	test   %edi,%edi
  12d836:	0f 84 24 ff ff ff    	je     12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12d83c:	eb 05                	jmp    12d843 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x1e3>
  12d83e:	66 90                	xchg   %ax,%ax
  12d840:	48 89 fe             	mov    %rdi,%rsi
  12d843:	48 83 ea 01          	sub    $0x1,%rdx
  12d847:	72 17                	jb     12d860 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x200>
  12d849:	48 8b 8c f1 18 01 00 	mov    0x118(%rcx,%rsi,8),%rcx
  12d850:	00 
  12d851:	eb 87                	jmp    12d7da <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x17a>
  12d853:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12d85a:	84 00 00 00 00 00 
  12d860:	84 c0                	test   %al,%al
  12d862:	74 6e                	je     12d8d2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x272>
  12d864:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12d869:	48 8b 70 28          	mov    0x28(%rax),%rsi
  12d86d:	49 39 f6             	cmp    %rsi,%r14
  12d870:	0f 83 48 0a 00 00    	jae    12e2be <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc5e>
  12d876:	48 8b 40 20          	mov    0x20(%rax),%rax
  12d87a:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  12d87e:	48 c1 e1 04          	shl    $0x4,%rcx
  12d882:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  12d886:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  12d88a:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  12d88e:	48 83 f8 16          	cmp    $0x16,%rax
  12d892:	b8 00 00 00 00       	mov    $0x0,%eax
  12d897:	48 0f 42 c8          	cmovb  %rax,%rcx
  12d89b:	48 8d 15 46 20 f8 ff 	lea    -0x7dfba(%rip),%rdx        # af8e8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa86>
  12d8a2:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  12d8a6:	48 01 d0             	add    %rdx,%rax
  12d8a9:	ff e0                	jmp    *%rax
  12d8ab:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  12d8b2:	00 
  12d8b3:	e8 f8 0d 00 00       	call   12e6b0 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17h1bbed13f28b0ca94E.llvm.4177729589157340265>
  12d8b8:	0f b6 84 24 98 00 00 	movzbl 0x98(%rsp),%eax
  12d8bf:	00 
  12d8c0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  12d8c5:	3c 16                	cmp    $0x16,%al
  12d8c7:	0f 83 62 02 00 00    	jae    12db2f <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4cf>
  12d8cd:	e9 e4 05 00 00       	jmp    12deb6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x856>
  12d8d2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12d8d7:	48 8b 70 28          	mov    0x28(%rax),%rsi
  12d8db:	49 39 f6             	cmp    %rsi,%r14
  12d8de:	0f 83 e9 09 00 00    	jae    12e2cd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc6d>
  12d8e4:	48 8b 40 20          	mov    0x20(%rax),%rax
  12d8e8:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  12d8ec:	48 c1 e1 04          	shl    $0x4,%rcx
  12d8f0:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  12d8f4:	48 8d 56 eb          	lea    -0x15(%rsi),%rdx
  12d8f8:	48 83 fe 16          	cmp    $0x16,%rsi
  12d8fc:	be 00 00 00 00       	mov    $0x0,%esi
  12d901:	48 0f 42 d6          	cmovb  %rsi,%rdx
  12d905:	48 83 fa 02          	cmp    $0x2,%rdx
  12d909:	73 0b                	jae    12d916 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x2b6>
  12d90b:	45 31 e4             	xor    %r12d,%r12d
  12d90e:	45 31 ff             	xor    %r15d,%r15d
  12d911:	e9 84 00 00 00       	jmp    12d99a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x33a>
  12d916:	48 01 c8             	add    %rcx,%rax
  12d919:	83 fa 02             	cmp    $0x2,%edx
  12d91c:	75 58                	jne    12d976 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x316>
  12d91e:	48 8b 40 18          	mov    0x18(%rax),%rax
  12d922:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  12d929:	00 
  12d92a:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  12d930:	45 31 e4             	xor    %r12d,%r12d
  12d933:	eb 65                	jmp    12d99a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x33a>
  12d935:	48 8b 46 18          	mov    0x18(%rsi),%rax
  12d939:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  12d93e:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  12d945:	00 00 
  12d947:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  12d94e:	00 
  12d94f:	b0 17                	mov    $0x17,%al
  12d951:	e9 d2 01 00 00       	jmp    12db28 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4c8>
  12d956:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  12d95a:	88 84 24 b0 00 00 00 	mov    %al,0xb0(%rsp)
  12d961:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  12d966:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  12d96d:	00 00 
  12d96f:	b0 18                	mov    $0x18,%al
  12d971:	e9 b2 01 00 00       	jmp    12db28 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4c8>
  12d976:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12d97a:	48 89 8c 24 d8 00 00 	mov    %rcx,0xd8(%rsp)
  12d981:	00 
  12d982:	48 8b 40 10          	mov    0x10(%rax),%rax
  12d986:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
  12d98d:	00 
  12d98e:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  12d994:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  12d99a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12d9a1:	00 
  12d9a2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  12d9a6:	48 03 94 24 88 01 00 	add    0x188(%rsp),%rdx
  12d9ad:	00 
  12d9ae:	0f 82 4a 08 00 00    	jb     12e1fe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  12d9b4:	48 03 54 24 20       	add    0x20(%rsp),%rdx
  12d9b9:	0f 82 3f 08 00 00    	jb     12e1fe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  12d9bf:	4b 8d 04 27          	lea    (%r15,%r12,1),%rax
  12d9c3:	48 ff c0             	inc    %rax
  12d9c6:	48 01 c2             	add    %rax,%rdx
  12d9c9:	0f 82 2f 08 00 00    	jb     12e1fe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  12d9cf:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  12d9d4:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  12d9d8:	48 3b 11             	cmp    (%rcx),%rdx
  12d9db:	0f 87 1d 08 00 00    	ja     12e1fe <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb9e>
  12d9e1:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  12d9e5:	48 85 d2             	test   %rdx,%rdx
  12d9e8:	74 0c                	je     12d9f6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x396>
  12d9ea:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  12d9ee:	84 d2                	test   %dl,%dl
  12d9f0:	0f 85 cd 07 00 00    	jne    12e1c3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb63>
  12d9f6:	4b 8d 34 27          	lea    (%r15,%r12,1),%rsi
  12d9fa:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  12d9fe:	48 39 d6             	cmp    %rdx,%rsi
  12da01:	0f 83 10 07 00 00    	jae    12e117 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xab7>
  12da07:	48 29 c2             	sub    %rax,%rdx
  12da0a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  12da0e:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  12da13:	4c 3b 6c 24 10       	cmp    0x10(%rsp),%r13
  12da18:	75 0b                	jne    12da25 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3c5>
  12da1a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12da1f:	ff 15 b3 43 1b 00    	call   *0x1b43b3(%rip)        # 2e1dd8 <_DYNAMIC+0x780>
  12da25:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12da2a:	4c 89 e9             	mov    %r13,%rcx
  12da2d:	48 c1 e1 04          	shl    $0x4,%rcx
  12da31:	4c 89 34 08          	mov    %r14,(%rax,%rcx,1)
  12da35:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  12da3a:	49 8d 5d 01          	lea    0x1(%r13),%rbx
  12da3e:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  12da43:	4d 85 e4             	test   %r12,%r12
  12da46:	74 38                	je     12da80 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x420>
  12da48:	48 3b 5c 24 10       	cmp    0x10(%rsp),%rbx
  12da4d:	75 0b                	jne    12da5a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x3fa>
  12da4f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12da54:	ff 15 7e 43 1b 00    	call   *0x1b437e(%rip)        # 2e1dd8 <_DYNAMIC+0x780>
  12da5a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12da5f:	48 c1 e3 04          	shl    $0x4,%rbx
  12da63:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  12da6a:	00 
  12da6b:	48 89 0c 18          	mov    %rcx,(%rax,%rbx,1)
  12da6f:	c6 44 18 08 00       	movb   $0x0,0x8(%rax,%rbx,1)
  12da74:	49 83 c5 02          	add    $0x2,%r13
  12da78:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
  12da7d:	4c 89 eb             	mov    %r13,%rbx
  12da80:	4d 85 ff             	test   %r15,%r15
  12da83:	0f 84 d7 fc ff ff    	je     12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12da89:	48 3b 5c 24 10       	cmp    0x10(%rsp),%rbx
  12da8e:	75 0b                	jne    12da9b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x43b>
  12da90:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12da95:	ff 15 3d 43 1b 00    	call   *0x1b433d(%rip)        # 2e1dd8 <_DYNAMIC+0x780>
  12da9b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12daa0:	48 89 d9             	mov    %rbx,%rcx
  12daa3:	48 c1 e1 04          	shl    $0x4,%rcx
  12daa7:	48 8b 94 24 d8 00 00 	mov    0xd8(%rsp),%rdx
  12daae:	00 
  12daaf:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  12dab3:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  12dab8:	48 ff c3             	inc    %rbx
  12dabb:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  12dac0:	48 85 db             	test   %rbx,%rbx
  12dac3:	0f 85 a5 fc ff ff    	jne    12d76e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x10e>
  12dac9:	e9 50 06 00 00       	jmp    12e11e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xabe>
  12dace:	8b 5e 20             	mov    0x20(%rsi),%ebx
  12dad1:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12dad8:	00 00 80 
  12dadb:	48 89 c8             	mov    %rcx,%rax
  12dade:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  12dae2:	74 21                	je     12db05 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4a5>
  12dae4:	48 83 c6 08          	add    $0x8,%rsi
  12dae8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  12daed:	ff 15 75 42 1b 00    	call   *0x1b4275(%rip)        # 2e1d68 <_DYNAMIC+0x710>
  12daf3:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  12daf8:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  12dafd:	0f 10 01             	movups (%rcx),%xmm0
  12db00:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  12db05:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
  12db0c:	00 
  12db0d:	66 0f 6f 44 24 60    	movdqa 0x60(%rsp),%xmm0
  12db13:	48 8d 84 24 a8 00 00 	lea    0xa8(%rsp),%rax
  12db1a:	00 
  12db1b:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  12db1f:	89 9c 24 b8 00 00 00 	mov    %ebx,0xb8(%rsp)
  12db26:	b0 16                	mov    $0x16,%al
  12db28:	88 84 24 98 00 00 00 	mov    %al,0x98(%rsp)
  12db2f:	3c 18                	cmp    $0x18,%al
  12db31:	74 22                	je     12db55 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x4f5>
  12db33:	0f b6 c0             	movzbl %al,%eax
  12db36:	83 f8 17             	cmp    $0x17,%eax
  12db39:	0f 85 62 03 00 00    	jne    12dea1 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x841>
  12db3f:	f3 0f 6f 84 24 b0 00 	movdqu 0xb0(%rsp),%xmm0
  12db46:	00 00 
  12db48:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  12db4d:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  12db53:	eb 0f                	jmp    12db64 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x504>
  12db55:	41 bf 02 00 00 00    	mov    $0x2,%r15d
  12db5b:	f3 0f 6f 84 24 a0 00 	movdqu 0xa0(%rsp),%xmm0
  12db62:	00 00 
  12db64:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12db6b:	00 
  12db6c:	66 0f 7f 84 24 00 01 	movdqa %xmm0,0x100(%rsp)
  12db73:	00 00 
  12db75:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  12db7a:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  12db81:	00 
  12db82:	48 89 8c 24 f0 00 00 	mov    %rcx,0xf0(%rsp)
  12db89:	00 
  12db8a:	31 db                	xor    %ebx,%ebx
  12db8c:	eb 24                	jmp    12dbb2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x552>
  12db8e:	4c 89 e0             	mov    %r12,%rax
  12db91:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  12db96:	48 89 84 dc e8 00 00 	mov    %rax,0xe8(%rsp,%rbx,8)
  12db9d:	00 
  12db9e:	4c 89 eb             	mov    %r13,%rbx
  12dba1:	4d 39 fd             	cmp    %r15,%r13
  12dba4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12dbab:	00 
  12dbac:	0f 84 ae 02 00 00    	je     12de60 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x800>
  12dbb2:	48 8b 00             	mov    (%rax),%rax
  12dbb5:	48 85 c0             	test   %rax,%rax
  12dbb8:	0f 84 e5 06 00 00    	je     12e2a3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc43>
  12dbbe:	4c 8d 6b 01          	lea    0x1(%rbx),%r13
  12dbc2:	48 8b 8c dc 00 01 00 	mov    0x100(%rsp,%rbx,8),%rcx
  12dbc9:	00 
  12dbca:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  12dbd1:	00 
  12dbd2:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  12dbd6:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12dbdd:	41 89 f8             	mov    %edi,%r8d
  12dbe0:	41 c1 e0 04          	shl    $0x4,%r8d
  12dbe4:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  12dbeb:	49 89 c1             	mov    %rax,%r9
  12dbee:	eb 19                	jmp    12dc09 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5a9>
  12dbf0:	41 0f 97 c2          	seta   %r10b
  12dbf4:	41 80 da 00          	sbb    $0x0,%r10b
  12dbf8:	49 83 c1 10          	add    $0x10,%r9
  12dbfc:	48 ff c6             	inc    %rsi
  12dbff:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  12dc03:	41 80 fa 01          	cmp    $0x1,%r10b
  12dc07:	75 17                	jne    12dc20 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5c0>
  12dc09:	4d 85 c0             	test   %r8,%r8
  12dc0c:	74 22                	je     12dc30 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5d0>
  12dc0e:	49 3b 09             	cmp    (%r9),%rcx
  12dc11:	75 dd                	jne    12dbf0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x590>
  12dc13:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  12dc17:	eb d7                	jmp    12dbf0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x590>
  12dc19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  12dc20:	41 0f b6 fa          	movzbl %r10b,%edi
  12dc24:	85 ff                	test   %edi,%edi
  12dc26:	75 0b                	jne    12dc33 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5d3>
  12dc28:	eb 26                	jmp    12dc50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x5f0>
  12dc2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  12dc30:	48 89 fe             	mov    %rdi,%rsi
  12dc33:	48 83 ea 01          	sub    $0x1,%rdx
  12dc37:	0f 82 66 06 00 00    	jb     12e2a3 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc43>
  12dc3d:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  12dc44:	00 
  12dc45:	eb 8f                	jmp    12dbd6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x576>
  12dc47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  12dc4e:	00 00 
  12dc50:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  12dc57:	00 
  12dc58:	4c 3b 64 24 28       	cmp    0x28(%rsp),%r12
  12dc5d:	0f 84 3b ff ff ff    	je     12db9e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x53e>
  12dc63:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  12dc6a:	00 
  12dc6b:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12dc6f:	48 83 f9 16          	cmp    $0x16,%rcx
  12dc73:	b9 00 00 00 00       	mov    $0x0,%ecx
  12dc78:	48 0f 42 c1          	cmovb  %rcx,%rax
  12dc7c:	48 83 f8 02          	cmp    $0x2,%rax
  12dc80:	74 6e                	je     12dcf0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x690>
  12dc82:	83 f8 03             	cmp    $0x3,%eax
  12dc85:	0f 85 ed 05 00 00    	jne    12e278 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc18>
  12dc8b:	0f b6 84 24 b0 00 00 	movzbl 0xb0(%rsp),%eax
  12dc92:	00 
  12dc93:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  12dc9a:	00 00 80 
  12dc9d:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
  12dca2:	c7 84 24 80 00 00 00 	movl   $0x0,0x80(%rsp)
  12dca9:	00 00 00 00 
  12dcad:	c6 44 24 60 16       	movb   $0x16,0x60(%rsp)
  12dcb2:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12dcb7:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  12dcbe:	00 
  12dcbf:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  12dcc4:	48 8d 0d 2d 1c f8 ff 	lea    -0x7e3d3(%rip),%rcx        # af8f8 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xa96>
  12dccb:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  12dccf:	48 01 c8             	add    %rcx,%rax
  12dcd2:	ff e0                	jmp    *%rax
  12dcd4:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12dcdb:	00 
  12dcdc:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  12dce1:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dce6:	ff 15 94 40 1b 00    	call   *0x1b4094(%rip)        # 2e1d80 <_DYNAMIC+0x728>
  12dcec:	eb 40                	jmp    12dd2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  12dcee:	66 90                	xchg   %ax,%ax
  12dcf0:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  12dcf7:	00 
  12dcf8:	48 8b 94 24 a8 00 00 	mov    0xa8(%rsp),%rdx
  12dcff:	00 
  12dd00:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  12dd07:	00 00 80 
  12dd0a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12dd0f:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  12dd16:	00 
  12dd17:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  12dd1c:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12dd23:	00 
  12dd24:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  12dd29:	e8 a2 38 fe ff       	call   1115d0 <_ZN10hypersolve18expression_program8jacobian5unary17h2b423a6394b7a769E>
  12dd2e:	f3 0f 6f 84 24 18 01 	movdqu 0x118(%rsp),%xmm0
  12dd35:	00 00 
  12dd37:	0f 10 8c 24 28 01 00 	movups 0x128(%rsp),%xmm1
  12dd3e:	00 
  12dd3f:	0f 10 94 24 38 01 00 	movups 0x138(%rsp),%xmm2
  12dd46:	00 
  12dd47:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  12dd4c:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  12dd51:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  12dd57:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12dd5c:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  12dd61:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dd66:	89 d9                	mov    %ebx,%ecx
  12dd68:	4c 8d 84 24 00 01 00 	lea    0x100(%rsp),%r8
  12dd6f:	00 
  12dd70:	4d 89 f9             	mov    %r15,%r9
  12dd73:	ff b4 24 c8 00 00 00 	push   0xc8(%rsp)
  12dd7a:	ff 74 24 30          	push   0x30(%rsp)
  12dd7e:	e8 2d 3e fe ff       	call   111bb0 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17ha766717089845c05E>
  12dd83:	48 83 c4 10          	add    $0x10,%rsp
  12dd87:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12dd8c:	80 f9 0d             	cmp    $0xd,%cl
  12dd8f:	0f 85 21 03 00 00    	jne    12e0b6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa56>
  12dd95:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
  12dd9a:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  12dd9f:	48 89 d0             	mov    %rdx,%rax
  12dda2:	48 39 d1             	cmp    %rdx,%rcx
  12dda5:	0f 84 e6 fd ff ff    	je     12db91 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x531>
  12ddab:	48 8b 84 24 c8 00 00 	mov    0xc8(%rsp),%rax
  12ddb2:	00 
  12ddb3:	48 39 c1             	cmp    %rax,%rcx
  12ddb6:	0f 84 d2 fd ff ff    	je     12db8e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x52e>
  12ddbc:	49 39 c4             	cmp    %rax,%r12
  12ddbf:	75 5f                	jne    12de20 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x7c0>
  12ddc1:	48 89 c8             	mov    %rcx,%rax
  12ddc4:	e9 c8 fd ff ff       	jmp    12db91 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x531>
  12ddc9:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12ddd0:	00 
  12ddd1:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  12ddd6:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12dddb:	ff 15 97 3f 1b 00    	call   *0x1b3f97(%rip)        # 2e1d78 <_DYNAMIC+0x720>
  12dde1:	e9 48 ff ff ff       	jmp    12dd2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  12dde6:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12dded:	00 
  12ddee:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  12ddf3:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12ddf8:	ff 15 42 40 1b 00    	call   *0x1b4042(%rip)        # 2e1e40 <_DYNAMIC+0x7e8>
  12ddfe:	e9 2b ff ff ff       	jmp    12dd2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  12de03:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12de0a:	00 
  12de0b:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  12de10:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12de15:	ff 15 75 3f 1b 00    	call   *0x1b3f75(%rip)        # 2e1d90 <_DYNAMIC+0x738>
  12de1b:	e9 0e ff ff ff       	jmp    12dd2e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x6ce>
  12de20:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  12de25:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12de2a:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  12de2f:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  12de34:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12de39:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  12de3e:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12de43:	e8 28 3c fe ff       	call   111a70 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  12de48:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12de4d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  12de52:	80 f9 0d             	cmp    $0xd,%cl
  12de55:	0f 84 3b fd ff ff    	je     12db96 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x536>
  12de5b:	e9 cc 03 00 00       	jmp    12e22c <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbcc>
  12de60:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  12de67:	00 
  12de68:	48 8b 94 24 f0 00 00 	mov    0xf0(%rsp),%rdx
  12de6f:	00 
  12de70:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  12de75:	48 39 c8             	cmp    %rcx,%rax
  12de78:	74 3c                	je     12deb6 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x856>
  12de7a:	48 39 ca             	cmp    %rcx,%rdx
  12de7d:	0f 85 cd 01 00 00    	jne    12e050 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9f0>
  12de83:	48 89 c2             	mov    %rax,%rdx
  12de86:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12de8d:	00 
  12de8e:	48 8b 40 10          	mov    0x10(%rax),%rax
  12de92:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12de99:	00 
  12de9a:	73 34                	jae    12ded0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x870>
  12de9c:	e9 03 02 00 00       	jmp    12e0a4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  12dea1:	39 ac 24 b8 00 00 00 	cmp    %ebp,0xb8(%rsp)
  12dea8:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  12dead:	48 0f 44 94 24 c8 00 	cmove  0xc8(%rsp),%rdx
  12deb4:	00 00 
  12deb6:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12debd:	00 
  12debe:	48 8b 40 10          	mov    0x10(%rax),%rax
  12dec2:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12dec9:	00 
  12deca:	0f 82 d4 01 00 00    	jb     12e0a4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  12ded0:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  12ded5:	48 01 c1             	add    %rax,%rcx
  12ded8:	48 39 c1             	cmp    %rax,%rcx
  12dedb:	0f 82 c3 01 00 00    	jb     12e0a4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  12dee1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12dee6:	48 8b 40 48          	mov    0x48(%rax),%rax
  12deea:	48 3b 08             	cmp    (%rax),%rcx
  12deed:	0f 83 b1 01 00 00    	jae    12e0a4 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa44>
  12def3:	48 8b 48 10          	mov    0x10(%rax),%rcx
  12def7:	48 85 c9             	test   %rcx,%rcx
  12defa:	74 0c                	je     12df08 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8a8>
  12defc:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  12df00:	84 c9                	test   %cl,%cl
  12df02:	0f 85 3f 03 00 00    	jne    12e247 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbe7>
  12df08:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12df0c:	48 85 c9             	test   %rcx,%rcx
  12df0f:	0f 84 2e 03 00 00    	je     12e243 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbe3>
  12df15:	48 ff c9             	dec    %rcx
  12df18:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12df1c:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  12df23:	00 
  12df24:	48 8b 01             	mov    (%rcx),%rax
  12df27:	48 85 c0             	test   %rax,%rax
  12df2a:	74 74                	je     12dfa0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x940>
  12df2c:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  12df30:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12df37:	41 89 f8             	mov    %edi,%r8d
  12df3a:	41 c1 e0 04          	shl    $0x4,%r8d
  12df3e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  12df45:	49 89 c1             	mov    %rax,%r9
  12df48:	eb 1f                	jmp    12df69 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x909>
  12df4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  12df50:	41 0f 97 c2          	seta   %r10b
  12df54:	41 80 da 00          	sbb    $0x0,%r10b
  12df58:	49 83 c1 10          	add    $0x10,%r9
  12df5c:	48 ff c1             	inc    %rcx
  12df5f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  12df63:	41 80 fa 01          	cmp    $0x1,%r10b
  12df67:	75 10                	jne    12df79 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x919>
  12df69:	4d 85 c0             	test   %r8,%r8
  12df6c:	74 15                	je     12df83 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x923>
  12df6e:	4d 3b 31             	cmp    (%r9),%r14
  12df71:	75 dd                	jne    12df50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8f0>
  12df73:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  12df77:	eb d7                	jmp    12df50 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8f0>
  12df79:	41 0f b6 fa          	movzbl %r10b,%edi
  12df7d:	85 ff                	test   %edi,%edi
  12df7f:	75 05                	jne    12df86 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x926>
  12df81:	eb 13                	jmp    12df96 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x936>
  12df83:	48 89 f9             	mov    %rdi,%rcx
  12df86:	48 83 ee 01          	sub    $0x1,%rsi
  12df8a:	72 16                	jb     12dfa2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x942>
  12df8c:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  12df93:	00 
  12df94:	eb 9a                	jmp    12df30 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x8d0>
  12df96:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  12df9d:	00 
  12df9e:	eb 3a                	jmp    12dfda <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x97a>
  12dfa0:	31 c0                	xor    %eax,%eax
  12dfa2:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
  12dfa9:	00 
  12dfaa:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  12dfaf:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
  12dfb4:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  12dfb8:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  12dfbd:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  12dfc4:	00 00 
  12dfc6:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  12dfcb:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12dfd0:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  12dfd5:	e8 c6 09 00 00       	call   12e9a0 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h9e96ea47bee8ef08E>
  12dfda:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  12dfe1:	00 
  12dfe2:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12dfe6:	48 83 f9 16          	cmp    $0x16,%rcx
  12dfea:	b9 00 00 00 00       	mov    $0x0,%ecx
  12dfef:	48 0f 42 c1          	cmovb  %rcx,%rax
  12dff3:	48 83 f8 01          	cmp    $0x1,%rax
  12dff7:	74 1b                	je     12e014 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x9b4>
  12dff9:	48 85 c0             	test   %rax,%rax
  12dffc:	0f 85 5e f7 ff ff    	jne    12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12e002:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  12e009:	00 
  12e00a:	e8 41 03 00 00       	call   12e350 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.4177729589157340265>
  12e00f:	e9 4c f7 ff ff       	jmp    12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12e014:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  12e01b:	00 
  12e01c:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  12e023:	00 00 80 
  12e026:	48 39 c6             	cmp    %rax,%rsi
  12e029:	0f 84 31 f7 ff ff    	je     12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12e02f:	48 85 f6             	test   %rsi,%rsi
  12e032:	0f 84 28 f7 ff ff    	je     12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12e038:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  12e03f:	00 
  12e040:	ba 01 00 00 00       	mov    $0x1,%edx
  12e045:	ff 15 1d 38 1b 00    	call   *0x1b381d(%rip)        # 2e1868 <_DYNAMIC+0x210>
  12e04b:	e9 10 f7 ff ff       	jmp    12d760 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x100>
  12e050:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  12e055:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12e05a:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  12e05f:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  12e064:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  12e069:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  12e06e:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12e073:	e8 f8 39 fe ff       	call   111a70 <_ZN10hypersolve18expression_program8jacobian7Builder4push17h93e8d879874d8cafE>
  12e078:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  12e07d:	3c 0d                	cmp    $0xd,%al
  12e07f:	0f 85 cf 01 00 00    	jne    12e254 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbf4>
  12e085:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
  12e08a:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12e091:	00 
  12e092:	48 8b 40 10          	mov    0x10(%rax),%rax
  12e096:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  12e09d:	00 
  12e09e:	0f 83 2c fe ff ff    	jae    12ded0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0x870>
  12e0a4:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e0a8:	c6 03 05             	movb   $0x5,(%rbx)
  12e0ab:	eb 2f                	jmp    12e0dc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa7c>
  12e0ad:	b1 06                	mov    $0x6,%cl
  12e0af:	88 0b                	mov    %cl,(%rbx)
  12e0b1:	e9 88 f6 ff ff       	jmp    12d73e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xde>
  12e0b6:	8b 44 24 61          	mov    0x61(%rsp),%eax
  12e0ba:	8b 54 24 64          	mov    0x64(%rsp),%edx
  12e0be:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e0c2:	89 53 04             	mov    %edx,0x4(%rbx)
  12e0c5:	89 43 01             	mov    %eax,0x1(%rbx)
  12e0c8:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  12e0cd:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  12e0d2:	88 0b                	mov    %cl,(%rbx)
  12e0d4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  12e0d8:	48 89 53 10          	mov    %rdx,0x10(%rbx)
  12e0dc:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  12e0e3:	00 
  12e0e4:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  12e0e8:	31 c0                	xor    %eax,%eax
  12e0ea:	48 83 f9 16          	cmp    $0x16,%rcx
  12e0ee:	48 0f 43 c2          	cmovae %rdx,%rax
  12e0f2:	48 83 f8 01          	cmp    $0x1,%rax
  12e0f6:	0f 84 d1 00 00 00    	je     12e1cd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb6d>
  12e0fc:	48 85 c0             	test   %rax,%rax
  12e0ff:	0f 85 00 01 00 00    	jne    12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e105:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  12e10c:	00 
  12e10d:	e8 3e 02 00 00       	call   12e350 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17hdf0aa2814d4dd91aE.llvm.4177729589157340265>
  12e112:	e9 ee 00 00 00       	jmp    12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e117:	b0 06                	mov    $0x6,%al
  12e119:	e9 a7 00 00 00       	jmp    12e1c5 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb65>
  12e11e:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  12e125:	00 
  12e126:	48 8b 01             	mov    (%rcx),%rax
  12e129:	48 85 c0             	test   %rax,%rax
  12e12c:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e130:	0f 84 aa 01 00 00    	je     12e2e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc80>
  12e136:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  12e13a:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  12e141:	89 f7                	mov    %esi,%edi
  12e143:	c1 e7 04             	shl    $0x4,%edi
  12e146:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  12e14d:	49 89 c0             	mov    %rax,%r8
  12e150:	eb 27                	jmp    12e179 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb19>
  12e152:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12e159:	1f 84 00 00 00 00 00 
  12e160:	41 0f 97 c1          	seta   %r9b
  12e164:	41 80 d9 00          	sbb    $0x0,%r9b
  12e168:	49 83 c0 10          	add    $0x10,%r8
  12e16c:	48 ff c2             	inc    %rdx
  12e16f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  12e173:	41 80 f9 01          	cmp    $0x1,%r9b
  12e177:	75 18                	jne    12e191 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb31>
  12e179:	48 85 ff             	test   %rdi,%rdi
  12e17c:	74 1d                	je     12e19b <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb3b>
  12e17e:	4c 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%r9
  12e185:	00 
  12e186:	4d 3b 08             	cmp    (%r8),%r9
  12e189:	75 d5                	jne    12e160 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb00>
  12e18b:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  12e18f:	eb cf                	jmp    12e160 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb00>
  12e191:	41 0f b6 f1          	movzbl %r9b,%esi
  12e195:	85 f6                	test   %esi,%esi
  12e197:	75 05                	jne    12e19e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb3e>
  12e199:	eb 17                	jmp    12e1b2 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xb52>
  12e19b:	48 89 f2             	mov    %rsi,%rdx
  12e19e:	48 83 e9 01          	sub    $0x1,%rcx
  12e1a2:	0f 82 38 01 00 00    	jb     12e2e0 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc80>
  12e1a8:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  12e1af:	00 
  12e1b0:	eb 88                	jmp    12e13a <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xada>
  12e1b2:	48 8b 84 d0 b8 00 00 	mov    0xb8(%rax,%rdx,8),%rax
  12e1b9:	00 
  12e1ba:	48 89 43 08          	mov    %rax,0x8(%rbx)
  12e1be:	c6 03 0d             	movb   $0xd,(%rbx)
  12e1c1:	eb 42                	jmp    12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e1c3:	b0 07                	mov    $0x7,%al
  12e1c5:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e1c9:	88 03                	mov    %al,(%rbx)
  12e1cb:	eb 38                	jmp    12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e1cd:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  12e1d4:	00 
  12e1d5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  12e1dc:	00 00 80 
  12e1df:	48 39 c6             	cmp    %rax,%rsi
  12e1e2:	74 21                	je     12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e1e4:	48 85 f6             	test   %rsi,%rsi
  12e1e7:	74 1c                	je     12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e1e9:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  12e1f0:	00 
  12e1f1:	ba 01 00 00 00       	mov    $0x1,%edx
  12e1f6:	ff 15 6c 36 1b 00    	call   *0x1b366c(%rip)        # 2e1868 <_DYNAMIC+0x210>
  12e1fc:	eb 07                	jmp    12e205 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xba5>
  12e1fe:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e202:	c6 03 05             	movb   $0x5,(%rbx)
  12e205:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  12e20a:	48 85 f6             	test   %rsi,%rsi
  12e20d:	0f 84 2b f5 ff ff    	je     12d73e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xde>
  12e213:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  12e218:	48 c1 e6 04          	shl    $0x4,%rsi
  12e21c:	ba 08 00 00 00       	mov    $0x8,%edx
  12e221:	ff 15 41 36 1b 00    	call   *0x1b3641(%rip)        # 2e1868 <_DYNAMIC+0x210>
  12e227:	e9 12 f5 ff ff       	jmp    12d73e <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xde>
  12e22c:	8b 54 24 61          	mov    0x61(%rsp),%edx
  12e230:	8b 74 24 64          	mov    0x64(%rsp),%esi
  12e234:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e238:	89 73 04             	mov    %esi,0x4(%rbx)
  12e23b:	89 53 01             	mov    %edx,0x1(%rbx)
  12e23e:	e9 8a fe ff ff       	jmp    12e0cd <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa6d>
  12e243:	b0 06                	mov    $0x6,%al
  12e245:	eb 02                	jmp    12e249 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xbe9>
  12e247:	b0 07                	mov    $0x7,%al
  12e249:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e24d:	88 03                	mov    %al,(%rbx)
  12e24f:	e9 88 fe ff ff       	jmp    12e0dc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa7c>
  12e254:	8b 4c 24 61          	mov    0x61(%rsp),%ecx
  12e258:	8b 54 24 64          	mov    0x64(%rsp),%edx
  12e25c:	48 8b 1c 24          	mov    (%rsp),%rbx
  12e260:	89 53 04             	mov    %edx,0x4(%rbx)
  12e263:	89 4b 01             	mov    %ecx,0x1(%rbx)
  12e266:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  12e26c:	88 03                	mov    %al,(%rbx)
  12e26e:	f3 0f 7f 43 08       	movdqu %xmm0,0x8(%rbx)
  12e273:	e9 64 fe ff ff       	jmp    12e0dc <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xa7c>
  12e278:	48 8d 3d 3b 17 f8 ff 	lea    -0x7e8c5(%rip),%rdi        # af9ba <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb58>
  12e27f:	48 8d 15 62 db 1a 00 	lea    0x1adb62(%rip),%rdx        # 2dbde8 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x80>
  12e286:	be 85 00 00 00       	mov    $0x85,%esi
  12e28b:	ff 15 6f 36 1b 00    	call   *0x1b366f(%rip)        # 2e1900 <_DYNAMIC+0x2a8>
  12e291:	eb 66                	jmp    12e2f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc99>
  12e293:	bf 08 00 00 00       	mov    $0x8,%edi
  12e298:	be 10 00 00 00       	mov    $0x10,%esi
  12e29d:	ff 15 ad 36 1b 00    	call   *0x1b36ad(%rip)        # 2e1950 <_DYNAMIC+0x2f8>
  12e2a3:	48 8d 3d fa 16 f8 ff 	lea    -0x7e906(%rip),%rdi        # af9a4 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb42>
  12e2aa:	48 8d 15 1f db 1a 00 	lea    0x1adb1f(%rip),%rdx        # 2dbdd0 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x68>
  12e2b1:	be 16 00 00 00       	mov    $0x16,%esi
  12e2b6:	ff 15 dc 38 1b 00    	call   *0x1b38dc(%rip)        # 2e1b98 <_DYNAMIC+0x540>
  12e2bc:	eb 3b                	jmp    12e2f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc99>
  12e2be:	48 8d 05 f3 da 1a 00 	lea    0x1adaf3(%rip),%rax        # 2dbdb8 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x50>
  12e2c5:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  12e2cc:	00 
  12e2cd:	4c 89 f7             	mov    %r14,%rdi
  12e2d0:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
  12e2d7:	00 
  12e2d8:	ff 15 c2 3a 1b 00    	call   *0x1b3ac2(%rip)        # 2e1da0 <_DYNAMIC+0x748>
  12e2de:	eb 19                	jmp    12e2f9 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc99>
  12e2e0:	48 8d 3d bd 16 f8 ff 	lea    -0x7e943(%rip),%rdi        # af9a4 <anon.1d4684509f1becedbac6ced666faa48e.9.llvm.3829854595302779352+0xb42>
  12e2e7:	48 8d 15 9a da 1a 00 	lea    0x1ada9a(%rip),%rdx        # 2dbd88 <anon.4aba3d9f9bfe30a52279b6b9315bd6f2.237.llvm.6875837429876331669+0x20>
  12e2ee:	be 16 00 00 00       	mov    $0x16,%esi
  12e2f3:	ff 15 9f 38 1b 00    	call   *0x1b389f(%rip)        # 2e1b98 <_DYNAMIC+0x540>
  12e2f9:	0f 0b                	ud2
  12e2fb:	eb 0b                	jmp    12e308 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xca8>
  12e2fd:	eb 00                	jmp    12e2ff <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xc9f>
  12e2ff:	48 89 c3             	mov    %rax,%rbx
  12e302:	eb 14                	jmp    12e318 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xcb8>
  12e304:	eb 02                	jmp    12e308 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xca8>
  12e306:	eb 00                	jmp    12e308 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xca8>
  12e308:	48 89 c3             	mov    %rax,%rbx
  12e30b:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  12e312:	00 
  12e313:	e8 d8 02 00 00       	call   12e5f0 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17hf33c9ca44255dc61E>
  12e318:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  12e31d:	48 85 f6             	test   %rsi,%rsi
  12e320:	74 14                	je     12e336 <_ZN10hypersolve18expression_program6taylor6derive17h52afc536a832e69dE+0xcd6>
  12e322:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  12e327:	48 c1 e6 04          	shl    $0x4,%rsi
  12e32b:	ba 08 00 00 00       	mov    $0x8,%edx
  12e330:	ff 15 32 35 1b 00    	call   *0x1b3532(%rip)        # 2e1868 <_DYNAMIC+0x210>
  12e336:	48 89 df             	mov    %rbx,%rdi
  12e339:	e8 72 b0 1a 00       	call   2d93b0 <_Unwind_Resume@plt>
  12e33e:	ff 15 c4 35 1b 00    	call   *0x1b35c4(%rip)        # 2e1908 <_DYNAMIC+0x2b0>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
