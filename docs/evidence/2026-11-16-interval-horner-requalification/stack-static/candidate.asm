
/tmp/interval-refactor/horner-current/artifacts-candidate/certification:     file format elf64-x86-64


Disassembly of section .text:

0000000000997840 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454>:
  997840:	55                   	push   %rbp
  997841:	41 57                	push   %r15
  997843:	41 56                	push   %r14
  997845:	41 55                	push   %r13
  997847:	41 54                	push   %r12
  997849:	53                   	push   %rbx
  99784a:	48 81 ec 08 03 00 00 	sub    $0x308,%rsp
  997851:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
  997856:	48 85 c9             	test   %rcx,%rcx
  997859:	0f 84 46 02 00 00    	je     997aa5 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x265>
  99785f:	44 89 c3             	mov    %r8d,%ebx
  997862:	48 89 cd             	mov    %rcx,%rbp
  997865:	49 89 d7             	mov    %rdx,%r15
  997868:	48 83 f9 01          	cmp    $0x1,%rcx
  99786c:	0f 84 be 00 00 00    	je     997930 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xf0>
  997872:	48 89 b4 24 e8 01 00 	mov    %rsi,0x1e8(%rsp)
  997879:	00 
  99787a:	48 8d 04 6d 00 00 00 	lea    0x0(,%rbp,2),%rax
  997881:	00 
  997882:	48 01 e8             	add    %rbp,%rax
  997885:	48 c1 e0 04          	shl    $0x4,%rax
  997889:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
  99788e:	49 01 c7             	add    %rax,%r15
  997891:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  997895:	4c 8d 6c 24 10       	lea    0x10(%rsp),%r13
  99789a:	89 5c 24 0c          	mov    %ebx,0xc(%rsp)
  99789e:	0f b6 c3             	movzbl %bl,%eax
  9978a1:	89 84 24 e8 00 00 00 	mov    %eax,0xe8(%rsp)
  9978a8:	48 89 eb             	mov    %rbp,%rbx
  9978ab:	eb 1e                	jmp    9978cb <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x8b>
  9978ad:	0f 1f 00             	nopl   (%rax)
  9978b0:	49 8b 47 10          	mov    0x10(%r15),%rax
  9978b4:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  9978b8:	75 59                	jne    997913 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xd3>
  9978ba:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  9978be:	4c 89 f3             	mov    %r14,%rbx
  9978c1:	49 83 fe 01          	cmp    $0x1,%r14
  9978c5:	0f 86 f5 02 00 00    	jbe    997bc0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x380>
  9978cb:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
  9978cf:	49 39 ee             	cmp    %rbp,%r14
  9978d2:	0f 83 a8 12 00 00    	jae    998b80 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1340>
  9978d8:	41 80 3f 00          	cmpb   $0x0,(%r15)
  9978dc:	74 d2                	je     9978b0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x70>
  9978de:	4c 89 ef             	mov    %r13,%rdi
  9978e1:	ff 15 f9 81 35 00    	call   *0x3581f9(%rip)        # cefae0 <_DYNAMIC+0x368>
  9978e7:	4c 89 ff             	mov    %r15,%rdi
  9978ea:	4c 89 ee             	mov    %r13,%rsi
  9978ed:	8b 94 24 e8 00 00 00 	mov    0xe8(%rsp),%edx
  9978f4:	e8 f7 87 00 00       	call   9a00f0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.14820662018926863454>
  9978f9:	41 89 c4             	mov    %eax,%r12d
  9978fc:	41 80 fc fe          	cmp    $0xfe,%r12b
  997900:	0f 84 f3 08 00 00    	je     9981f9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x9b9>
  997906:	4c 89 ef             	mov    %r13,%rdi
  997909:	e8 02 82 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99790e:	45 84 e4             	test   %r12b,%r12b
  997911:	74 a7                	je     9978ba <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x7a>
  997913:	48 39 eb             	cmp    %rbp,%rbx
  997916:	48 8b b4 24 e8 01 00 	mov    0x1e8(%rsp),%rsi
  99791d:	00 
  99791e:	0f 87 47 12 00 00    	ja     998b6b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x132b>
  997924:	48 89 dd             	mov    %rbx,%rbp
  997927:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
  99792b:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
  997930:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  997937:	0f 84 a6 02 00 00    	je     997be3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x3a3>
  99793d:	48 81 c6 98 00 00 00 	add    $0x98,%rsi
  997944:	48 8d bc 24 f0 01 00 	lea    0x1f0(%rsp),%rdi
  99794b:	00 
  99794c:	48 89 f0             	mov    %rsi,%rax
  99794f:	4c 89 fe             	mov    %r15,%rsi
  997952:	48 89 ea             	mov    %rbp,%rdx
  997955:	48 89 c1             	mov    %rax,%rcx
  997958:	e8 c3 43 ff ff       	call   98bd20 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic19evaluate_polynomial>
  99795d:	0f b6 ac 24 f0 01 00 	movzbl 0x1f0(%rsp),%ebp
  997964:	00 
  997965:	40 84 ed             	test   %bpl,%bpl
  997968:	0f 84 f4 01 00 00    	je     997b62 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x322>
  99796e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  997973:	ff 15 67 81 35 00    	call   *0x358167(%rip)        # cefae0 <_DYNAMIC+0x368>
  997979:	0f b6 d3             	movzbl %bl,%edx
  99797c:	48 8d bc 24 f0 01 00 	lea    0x1f0(%rsp),%rdi
  997983:	00 
  997984:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  997989:	e8 62 87 00 00       	call   9a00f0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.14820662018926863454>
  99798e:	89 c3                	mov    %eax,%ebx
  997990:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  997995:	e8 76 81 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99799a:	80 fb fe             	cmp    $0xfe,%bl
  99799d:	0f 85 d4 01 00 00    	jne    997b77 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x337>
  9979a3:	0f 10 84 24 f0 01 00 	movups 0x1f0(%rsp),%xmm0
  9979aa:	00 
  9979ab:	0f 10 8c 24 00 02 00 	movups 0x200(%rsp),%xmm1
  9979b2:	00 
  9979b3:	0f 10 94 24 10 02 00 	movups 0x210(%rsp),%xmm2
  9979ba:	00 
  9979bb:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  9979c2:	00 
  9979c3:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  9979ca:	00 
  9979cb:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  9979d2:	00 
  9979d3:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  9979d8:	ff 15 32 80 35 00    	call   *0x358032(%rip)        # cefa10 <_DYNAMIC+0x298>
  9979de:	bf 28 00 00 00       	mov    $0x28,%edi
  9979e3:	be 01 00 00 00       	mov    $0x1,%esi
  9979e8:	ff 15 2a 80 35 00    	call   *0x35802a(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  9979ee:	48 85 c0             	test   %rax,%rax
  9979f1:	0f 84 c3 11 00 00    	je     998bba <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x137a>
  9979f7:	0f 10 05 22 f9 7c ff 	movups -0x8306de(%rip),%xmm0        # 167320 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x422>
  9979fe:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  997a02:	0f 10 05 07 f9 7c ff 	movups -0x8306f9(%rip),%xmm0        # 167310 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x412>
  997a09:	0f 11 00             	movups %xmm0,(%rax)
  997a0c:	48 b9 6c 75 65 20 73 	movabs $0x6e6769732065756c,%rcx
  997a13:	69 67 6e 
  997a16:	48 89 48 20          	mov    %rcx,0x20(%rax)
  997a1a:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  997a1f:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  997a26:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
  997a2d:	00 
  997a2e:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
  997a35:	00 
  997a36:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
  997a3d:	00 
  997a3e:	0f 11 41 18          	movups %xmm0,0x18(%rcx)
  997a42:	0f 11 49 28          	movups %xmm1,0x28(%rcx)
  997a46:	0f 11 51 38          	movups %xmm2,0x38(%rcx)
  997a4a:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  997a4f:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  997a56:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  997a5b:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  997a62:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  997a67:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  997a6c:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  997a71:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  997a76:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  997a7a:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  997a7e:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  997a82:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  997a86:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  997a8d:	48 c7 01 28 00 00 00 	movq   $0x28,(%rcx)
  997a94:	48 89 41 08          	mov    %rax,0x8(%rcx)
  997a98:	48 c7 41 10 28 00 00 	movq   $0x28,0x10(%rcx)
  997a9f:	00 
  997aa0:	e9 45 0a 00 00       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  997aa5:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  997aaa:	ff 15 60 7f 35 00    	call   *0x357f60(%rip)        # cefa10 <_DYNAMIC+0x298>
  997ab0:	bf 37 00 00 00       	mov    $0x37,%edi
  997ab5:	be 01 00 00 00       	mov    $0x1,%esi
  997aba:	ff 15 58 7f 35 00    	call   *0x357f58(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  997ac0:	48 85 c0             	test   %rax,%rax
  997ac3:	0f 84 cd 10 00 00    	je     998b96 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1356>
  997ac9:	0f 10 05 c0 f8 7c ff 	movups -0x830740(%rip),%xmm0        # 167390 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x492>
  997ad0:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  997ad4:	0f 10 05 a5 f8 7c ff 	movups -0x83075b(%rip),%xmm0        # 167380 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x482>
  997adb:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  997adf:	0f 10 05 8a f8 7c ff 	movups -0x830776(%rip),%xmm0        # 167370 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x472>
  997ae6:	0f 11 00             	movups %xmm0,(%rax)
  997ae9:	48 b9 66 66 69 63 69 	movabs $0x746e656963696666,%rcx
  997af0:	65 6e 74 
  997af3:	48 89 48 2f          	mov    %rcx,0x2f(%rax)
  997af7:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  997afc:	c6 81 a9 00 00 00 06 	movb   $0x6,0xa9(%rcx)
  997b03:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  997b07:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  997b0c:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  997b11:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  997b16:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  997b1b:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  997b1f:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  997b23:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  997b27:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  997b2b:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  997b30:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  997b37:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  997b3c:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  997b43:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  997b4a:	48 c7 01 37 00 00 00 	movq   $0x37,(%rcx)
  997b51:	48 89 41 08          	mov    %rax,0x8(%rcx)
  997b55:	48 c7 41 10 37 00 00 	movq   $0x37,0x10(%rcx)
  997b5c:	00 
  997b5d:	e9 88 09 00 00       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  997b62:	48 8b 84 24 00 02 00 	mov    0x200(%rsp),%rax
  997b69:	00 
  997b6a:	31 db                	xor    %ebx,%ebx
  997b6c:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  997b70:	0f 95 c0             	setne  %al
  997b73:	19 db                	sbb    %ebx,%ebx
  997b75:	08 c3                	or     %al,%bl
  997b77:	40 84 ed             	test   %bpl,%bpl
  997b7a:	0f 10 84 24 f0 01 00 	movups 0x1f0(%rsp),%xmm0
  997b81:	00 
  997b82:	0f 10 8c 24 00 02 00 	movups 0x200(%rsp),%xmm1
  997b89:	00 
  997b8a:	0f 10 94 24 10 02 00 	movups 0x210(%rsp),%xmm2
  997b91:	00 
  997b92:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  997b97:	0f 11 50 38          	movups %xmm2,0x38(%rax)
  997b9b:	0f 11 48 28          	movups %xmm1,0x28(%rax)
  997b9f:	0f 11 40 18          	movups %xmm0,0x18(%rax)
  997ba3:	0f 95 80 a9 00 00 00 	setne  0xa9(%rax)
  997baa:	c6 40 48 ff          	movb   $0xff,0x48(%rax)
  997bae:	88 98 a8 00 00 00    	mov    %bl,0xa8(%rax)
  997bb4:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
  997bbb:	e9 2a 09 00 00       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  997bc0:	bd 01 00 00 00       	mov    $0x1,%ebp
  997bc5:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
  997bc9:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
  997bce:	48 8b b4 24 e8 01 00 	mov    0x1e8(%rsp),%rsi
  997bd5:	00 
  997bd6:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  997bdd:	0f 85 5a fd ff ff    	jne    99793d <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xfd>
  997be3:	89 5c 24 0c          	mov    %ebx,0xc(%rsp)
  997be7:	48 89 f3             	mov    %rsi,%rbx
  997bea:	48 83 c6 38          	add    $0x38,%rsi
  997bee:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  997bf5:	00 
  997bf6:	e8 05 9f 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997bfb:	48 83 c3 68          	add    $0x68,%rbx
  997bff:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  997c04:	48 89 de             	mov    %rbx,%rsi
  997c07:	e8 f4 9e 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997c0c:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  997c13:	00 
  997c14:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  997c1b:	00 
  997c1c:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  997c23:	00 
  997c24:	0f 29 94 24 70 01 00 	movaps %xmm2,0x170(%rsp)
  997c2b:	00 
  997c2c:	0f 29 8c 24 60 01 00 	movaps %xmm1,0x160(%rsp)
  997c33:	00 
  997c34:	0f 29 84 24 50 01 00 	movaps %xmm0,0x150(%rsp)
  997c3b:	00 
  997c3c:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  997c41:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  997c46:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  997c4b:	0f 29 84 24 80 01 00 	movaps %xmm0,0x180(%rsp)
  997c52:	00 
  997c53:	0f 29 8c 24 90 01 00 	movaps %xmm1,0x190(%rsp)
  997c5a:	00 
  997c5b:	0f 29 94 24 a0 01 00 	movaps %xmm2,0x1a0(%rsp)
  997c62:	00 
  997c63:	0f b6 84 24 80 01 00 	movzbl 0x180(%rsp),%eax
  997c6a:	00 
  997c6b:	0a 84 24 50 01 00 00 	or     0x150(%rsp),%al
  997c72:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
  997c77:	75 31                	jne    997caa <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x46a>
  997c79:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  997c80:	00 
  997c81:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  997c88:	00 
  997c89:	ff 15 61 81 35 00    	call   *0x358161(%rip)        # cefdf0 <_DYNAMIC+0x678>
  997c8f:	84 c0                	test   %al,%al
  997c91:	7f 17                	jg     997caa <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x46a>
  997c93:	48 89 e8             	mov    %rbp,%rax
  997c96:	48 c1 e0 04          	shl    $0x4,%rax
  997c9a:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
  997c9e:	43 80 7c 27 d0 00    	cmpb   $0x0,-0x30(%r15,%r12,1)
  997ca4:	0f 84 d1 08 00 00    	je     99857b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xd3b>
  997caa:	48 c1 e5 04          	shl    $0x4,%rbp
  997cae:	4c 8d 34 6d 00 00 00 	lea    0x0(,%rbp,2),%r14
  997cb5:	00 
  997cb6:	49 01 ee             	add    %rbp,%r14
  997cb9:	4b 8d 5c 37 d0       	lea    -0x30(%r15,%r14,1),%rbx
  997cbe:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  997cc5:	00 
  997cc6:	48 89 de             	mov    %rbx,%rsi
  997cc9:	e8 32 9e 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997cce:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  997cd3:	48 89 de             	mov    %rbx,%rsi
  997cd6:	e8 25 9e 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997cdb:	48 8d 04 6d d0 ff ff 	lea    -0x30(,%rbp,2),%rax
  997ce2:	ff 
  997ce3:	48 01 e8             	add    %rbp,%rax
  997ce6:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  997ced:	00 
  997cee:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  997cf5:	00 
  997cf6:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  997cfd:	00 
  997cfe:	0f 29 94 24 10 01 00 	movaps %xmm2,0x110(%rsp)
  997d05:	00 
  997d06:	0f 29 8c 24 00 01 00 	movaps %xmm1,0x100(%rsp)
  997d0d:	00 
  997d0e:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  997d15:	00 
  997d16:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  997d1b:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  997d20:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  997d25:	0f 29 84 24 20 01 00 	movaps %xmm0,0x120(%rsp)
  997d2c:	00 
  997d2d:	0f 29 8c 24 30 01 00 	movaps %xmm1,0x130(%rsp)
  997d34:	00 
  997d35:	0f 29 94 24 40 01 00 	movaps %xmm2,0x140(%rsp)
  997d3c:	00 
  997d3d:	48 85 c0             	test   %rax,%rax
  997d40:	0f 84 c9 02 00 00    	je     99800f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x7cf>
  997d46:	4c 8d 6c 24 40       	lea    0x40(%rsp),%r13
  997d4b:	48 83 44 24 78 a0    	addq   $0xffffffffffffffa0,0x78(%rsp)
  997d51:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
  997d56:	89 84 24 e8 00 00 00 	mov    %eax,0xe8(%rsp)
  997d5d:	4c 8d 64 24 10       	lea    0x10(%rsp),%r12
  997d62:	48 8d 9c 24 b0 01 00 	lea    0x1b0(%rsp),%rbx
  997d69:	00 
  997d6a:	4c 8d bc 24 78 02 00 	lea    0x278(%rsp),%r15
  997d71:	00 
  997d72:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  997d79:	1f 84 00 00 00 00 00 
  997d80:	4c 89 e7             	mov    %r12,%rdi
  997d83:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
  997d8a:	00 
  997d8b:	48 8d 94 24 50 01 00 	lea    0x150(%rsp),%rdx
  997d92:	00 
  997d93:	8b 8c 24 e8 00 00 00 	mov    0xe8(%rsp),%ecx
  997d9a:	e8 a1 34 ff ff       	call   98b240 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic12interval_mul>
  997d9f:	80 7c 24 10 ff       	cmpb   $0xff,0x10(%rsp)
  997da4:	0f 84 16 05 00 00    	je     9982c0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xa80>
  997daa:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  997daf:	4a 8d 2c 30          	lea    (%rax,%r14,1),%rbp
  997db3:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  997db8:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
  997dbf:	00 
  997dc0:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  997dc5:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
  997dcc:	00 
  997dcd:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  997dd2:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  997dd7:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  997ddc:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  997de1:	0f 29 9c 24 b0 00 00 	movaps %xmm3,0xb0(%rsp)
  997de8:	00 
  997de9:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  997df0:	00 
  997df1:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  997df8:	00 
  997df9:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  997e00:	00 
  997e01:	48 89 df             	mov    %rbx,%rdi
  997e04:	48 89 ee             	mov    %rbp,%rsi
  997e07:	e8 f4 9c 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997e0c:	4c 89 ff             	mov    %r15,%rdi
  997e0f:	48 89 ee             	mov    %rbp,%rsi
  997e12:	e8 e9 9c 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997e17:	0f 10 84 24 b0 01 00 	movups 0x1b0(%rsp),%xmm0
  997e1e:	00 
  997e1f:	0f 10 8c 24 c0 01 00 	movups 0x1c0(%rsp),%xmm1
  997e26:	00 
  997e27:	0f 10 94 24 d0 01 00 	movups 0x1d0(%rsp),%xmm2
  997e2e:	00 
  997e2f:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  997e34:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  997e39:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  997e3e:	0f 10 84 24 78 02 00 	movups 0x278(%rsp),%xmm0
  997e45:	00 
  997e46:	0f 10 8c 24 88 02 00 	movups 0x288(%rsp),%xmm1
  997e4d:	00 
  997e4e:	0f 10 94 24 98 02 00 	movups 0x298(%rsp),%xmm2
  997e55:	00 
  997e56:	41 0f 11 55 20       	movups %xmm2,0x20(%r13)
  997e5b:	41 0f 11 4d 10       	movups %xmm1,0x10(%r13)
  997e60:	41 0f 11 45 00       	movups %xmm0,0x0(%r13)
  997e65:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
  997e6c:	00 
  997e6d:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
  997e74:	00 
  997e75:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
  997e7c:	00 
  997e7d:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  997e84:	00 
  997e85:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  997e8c:	00 
  997e8d:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  997e94:	00 
  997e95:	4c 89 ff             	mov    %r15,%rdi
  997e98:	4c 89 e6             	mov    %r12,%rsi
  997e9b:	e8 60 9c 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997ea0:	48 8d bc 24 a8 02 00 	lea    0x2a8(%rsp),%rdi
  997ea7:	00 
  997ea8:	48 89 de             	mov    %rbx,%rsi
  997eab:	4c 89 fa             	mov    %r15,%rdx
  997eae:	e8 dd 3c f0 ff       	call   89bb90 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs1Ga5OsmdBWa_10hypersolve>
  997eb3:	4c 89 ff             	mov    %r15,%rdi
  997eb6:	e8 65 ed ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997ebb:	48 89 df             	mov    %rbx,%rdi
  997ebe:	e8 5d ed ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997ec3:	48 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%rax
  997eca:	00 
  997ecb:	0f 10 00             	movups (%rax),%xmm0
  997ece:	0f 10 48 10          	movups 0x10(%rax),%xmm1
  997ed2:	0f 10 50 20          	movups 0x20(%rax),%xmm2
  997ed6:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  997edd:	00 
  997ede:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  997ee5:	00 
  997ee6:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  997eed:	00 
  997eee:	4c 89 ff             	mov    %r15,%rdi
  997ef1:	4c 89 ee             	mov    %r13,%rsi
  997ef4:	e8 07 9c 00 00       	call   9a1b00 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.14820662018926863454>
  997ef9:	48 8d bc 24 d8 02 00 	lea    0x2d8(%rsp),%rdi
  997f00:	00 
  997f01:	48 89 de             	mov    %rbx,%rsi
  997f04:	4c 89 fa             	mov    %r15,%rdx
  997f07:	e8 84 3c f0 ff       	call   89bb90 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs1Ga5OsmdBWa_10hypersolve>
  997f0c:	4c 89 ff             	mov    %r15,%rdi
  997f0f:	e8 0c ed ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997f14:	48 89 df             	mov    %rbx,%rdi
  997f17:	e8 04 ed ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997f1c:	0f 10 84 24 a8 02 00 	movups 0x2a8(%rsp),%xmm0
  997f23:	00 
  997f24:	0f 10 8c 24 b8 02 00 	movups 0x2b8(%rsp),%xmm1
  997f2b:	00 
  997f2c:	0f 10 94 24 c8 02 00 	movups 0x2c8(%rsp),%xmm2
  997f33:	00 
  997f34:	0f 29 84 24 f0 01 00 	movaps %xmm0,0x1f0(%rsp)
  997f3b:	00 
  997f3c:	0f 29 8c 24 00 02 00 	movaps %xmm1,0x200(%rsp)
  997f43:	00 
  997f44:	0f 29 94 24 10 02 00 	movaps %xmm2,0x210(%rsp)
  997f4b:	00 
  997f4c:	0f 10 84 24 d8 02 00 	movups 0x2d8(%rsp),%xmm0
  997f53:	00 
  997f54:	0f 10 8c 24 e8 02 00 	movups 0x2e8(%rsp),%xmm1
  997f5b:	00 
  997f5c:	0f 10 94 24 f8 02 00 	movups 0x2f8(%rsp),%xmm2
  997f63:	00 
  997f64:	48 8d 84 24 20 02 00 	lea    0x220(%rsp),%rax
  997f6b:	00 
  997f6c:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  997f70:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  997f74:	0f 11 00             	movups %xmm0,(%rax)
  997f77:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  997f7e:	00 
  997f7f:	e8 8c 7b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  997f84:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  997f8b:	00 
  997f8c:	e8 7f 7b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  997f91:	0f 28 84 24 40 02 00 	movaps 0x240(%rsp),%xmm0
  997f98:	00 
  997f99:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  997fa0:	00 
  997fa1:	0f 28 84 24 30 02 00 	movaps 0x230(%rsp),%xmm0
  997fa8:	00 
  997fa9:	0f 29 84 24 30 01 00 	movaps %xmm0,0x130(%rsp)
  997fb0:	00 
  997fb1:	0f 28 84 24 f0 01 00 	movaps 0x1f0(%rsp),%xmm0
  997fb8:	00 
  997fb9:	0f 28 8c 24 00 02 00 	movaps 0x200(%rsp),%xmm1
  997fc0:	00 
  997fc1:	0f 28 94 24 10 02 00 	movaps 0x210(%rsp),%xmm2
  997fc8:	00 
  997fc9:	0f 28 9c 24 20 02 00 	movaps 0x220(%rsp),%xmm3
  997fd0:	00 
  997fd1:	0f 29 9c 24 20 01 00 	movaps %xmm3,0x120(%rsp)
  997fd8:	00 
  997fd9:	0f 29 94 24 10 01 00 	movaps %xmm2,0x110(%rsp)
  997fe0:	00 
  997fe1:	0f 29 8c 24 00 01 00 	movaps %xmm1,0x100(%rsp)
  997fe8:	00 
  997fe9:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  997ff0:	00 
  997ff1:	4c 89 e7             	mov    %r12,%rdi
  997ff4:	e8 17 7b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  997ff9:	4c 89 ef             	mov    %r13,%rdi
  997ffc:	e8 0f 7b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998001:	49 83 c6 d0          	add    $0xffffffffffffffd0,%r14
  998005:	49 83 fe 30          	cmp    $0x30,%r14
  998009:	0f 85 71 fd ff ff    	jne    997d80 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x540>
  99800f:	0f b6 84 24 f0 00 00 	movzbl 0xf0(%rsp),%eax
  998016:	00 
  998017:	48 8b 8c 24 f1 00 00 	mov    0xf1(%rsp),%rcx
  99801e:	00 
  99801f:	48 89 8c 24 68 02 00 	mov    %rcx,0x268(%rsp)
  998026:	00 
  998027:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  99802e:	00 
  99802f:	48 89 8c 24 6f 02 00 	mov    %rcx,0x26f(%rsp)
  998036:	00 
  998037:	4c 8b b4 24 00 01 00 	mov    0x100(%rsp),%r14
  99803e:	00 
  99803f:	48 8b 8c 24 08 01 00 	mov    0x108(%rsp),%rcx
  998046:	00 
  998047:	0f 28 84 24 10 01 00 	movaps 0x110(%rsp),%xmm0
  99804e:	00 
  99804f:	0f b6 94 24 20 01 00 	movzbl 0x120(%rsp),%edx
  998056:	00 
  998057:	48 8b b4 24 21 01 00 	mov    0x121(%rsp),%rsi
  99805e:	00 
  99805f:	48 89 b4 24 58 02 00 	mov    %rsi,0x258(%rsp)
  998066:	00 
  998067:	48 8b b4 24 28 01 00 	mov    0x128(%rsp),%rsi
  99806e:	00 
  99806f:	48 89 b4 24 5f 02 00 	mov    %rsi,0x25f(%rsp)
  998076:	00 
  998077:	3c ff                	cmp    $0xff,%al
  998079:	0f 84 5b 02 00 00    	je     9982da <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xa9a>
  99807f:	4c 8b bc 24 30 01 00 	mov    0x130(%rsp),%r15
  998086:	00 
  998087:	48 8b b4 24 38 01 00 	mov    0x138(%rsp),%rsi
  99808e:	00 
  99808f:	0f 28 8c 24 40 01 00 	movaps 0x140(%rsp),%xmm1
  998096:	00 
  998097:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
  99809e:	48 8b 84 24 68 02 00 	mov    0x268(%rsp),%rax
  9980a5:	00 
  9980a6:	48 8b bc 24 6f 02 00 	mov    0x26f(%rsp),%rdi
  9980ad:	00 
  9980ae:	48 89 84 24 81 00 00 	mov    %rax,0x81(%rsp)
  9980b5:	00 
  9980b6:	48 89 bc 24 88 00 00 	mov    %rdi,0x88(%rsp)
  9980bd:	00 
  9980be:	4c 89 b4 24 90 00 00 	mov    %r14,0x90(%rsp)
  9980c5:	00 
  9980c6:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
  9980cd:	00 
  9980ce:	0f 11 84 24 a0 00 00 	movups %xmm0,0xa0(%rsp)
  9980d5:	00 
  9980d6:	88 94 24 b0 00 00 00 	mov    %dl,0xb0(%rsp)
  9980dd:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
  9980e4:	00 
  9980e5:	48 8b 8c 24 5f 02 00 	mov    0x25f(%rsp),%rcx
  9980ec:	00 
  9980ed:	48 89 84 24 b1 00 00 	mov    %rax,0xb1(%rsp)
  9980f4:	00 
  9980f5:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
  9980fc:	00 
  9980fd:	4c 89 bc 24 c0 00 00 	mov    %r15,0xc0(%rsp)
  998104:	00 
  998105:	48 89 b4 24 c8 00 00 	mov    %rsi,0xc8(%rsp)
  99810c:	00 
  99810d:	0f 11 8c 24 d0 00 00 	movups %xmm1,0xd0(%rsp)
  998114:	00 
  998115:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  99811c:	00 
  99811d:	e8 ee 79 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998122:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  998129:	00 
  99812a:	e8 e1 79 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99812f:	8b 5c 24 0c          	mov    0xc(%rsp),%ebx
  998133:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998138:	ff 15 a2 79 35 00    	call   *0x3579a2(%rip)        # cefae0 <_DYNAMIC+0x368>
  99813e:	0f b6 eb             	movzbl %bl,%ebp
  998141:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998148:	00 
  998149:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  99814e:	89 ea                	mov    %ebp,%edx
  998150:	e8 9b 7f 00 00       	call   9a00f0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.14820662018926863454>
  998155:	89 c3                	mov    %eax,%ebx
  998157:	80 fb fe             	cmp    $0xfe,%bl
  99815a:	0f 85 51 02 00 00    	jne    9983b1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xb71>
  998160:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998165:	e8 a6 79 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99816a:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  998171:	00 
  998172:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  998177:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  99817e:	00 
  99817f:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  998184:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  99818b:	00 
  99818c:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  998193:	00 
  998194:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  99819b:	00 
  99819c:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  9981a3:	00 
  9981a4:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  9981a9:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  9981ae:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  9981b3:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  9981b8:	ff 15 52 78 35 00    	call   *0x357852(%rip)        # cefa10 <_DYNAMIC+0x298>
  9981be:	bf 33 00 00 00       	mov    $0x33,%edi
  9981c3:	be 01 00 00 00       	mov    $0x1,%esi
  9981c8:	ff 15 4a 78 35 00    	call   *0x35784a(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  9981ce:	48 85 c0             	test   %rax,%rax
  9981d1:	0f 84 07 0a 00 00    	je     998bde <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x139e>
  9981d7:	0f 10 05 ea f0 7c ff 	movups -0x830f16(%rip),%xmm0        # 1672c8 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x3ca>
  9981de:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  9981e2:	0f 10 05 cf f0 7c ff 	movups -0x830f31(%rip),%xmm0        # 1672b8 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x3ba>
  9981e9:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  9981ed:	0f 10 05 b4 f0 7c ff 	movups -0x830f4c(%rip),%xmm0        # 1672a8 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x3aa>
  9981f4:	e9 81 02 00 00       	jmp    99847a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xc3a>
  9981f9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9981fe:	e8 0d 79 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998203:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  998208:	ff 15 02 78 35 00    	call   *0x357802(%rip)        # cefa10 <_DYNAMIC+0x298>
  99820e:	bf 38 00 00 00       	mov    $0x38,%edi
  998213:	be 01 00 00 00       	mov    $0x1,%esi
  998218:	ff 15 fa 77 35 00    	call   *0x3577fa(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  99821e:	48 85 c0             	test   %rax,%rax
  998221:	0f 84 a5 09 00 00    	je     998bcc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x138c>
  998227:	0f 10 05 2a f1 7c ff 	movups -0x830ed6(%rip),%xmm0        # 167358 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x45a>
  99822e:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  998232:	0f 10 05 0f f1 7c ff 	movups -0x830ef1(%rip),%xmm0        # 167348 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x44a>
  998239:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  99823d:	0f 10 05 f4 f0 7c ff 	movups -0x830f0c(%rip),%xmm0        # 167338 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x43a>
  998244:	0f 11 00             	movups %xmm0,(%rax)
  998247:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  99824e:	74 6c 79 
  998251:	48 89 48 30          	mov    %rcx,0x30(%rax)
  998255:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  99825a:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  998261:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  998265:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  99826a:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  99826f:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  998274:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  998279:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  99827d:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  998281:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  998285:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  998289:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  99828e:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  998295:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  99829a:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  9982a1:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  9982a8:	48 c7 01 38 00 00 00 	movq   $0x38,(%rcx)
  9982af:	48 89 41 08          	mov    %rax,0x8(%rcx)
  9982b3:	48 c7 41 10 38 00 00 	movq   $0x38,0x10(%rcx)
  9982ba:	00 
  9982bb:	e9 2a 02 00 00       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  9982c0:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  9982c7:	00 
  9982c8:	e8 43 78 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9982cd:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  9982d4:	00 
  9982d5:	e8 36 78 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9982da:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  9982e1:	00 
  9982e2:	e8 29 78 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9982e7:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  9982ee:	00 
  9982ef:	e8 1c 78 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9982f4:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  9982f9:	ff 15 11 77 35 00    	call   *0x357711(%rip)        # cefa10 <_DYNAMIC+0x298>
  9982ff:	bf 35 00 00 00       	mov    $0x35,%edi
  998304:	be 01 00 00 00       	mov    $0x1,%esi
  998309:	ff 15 09 77 35 00    	call   *0x357709(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  99830f:	48 85 c0             	test   %rax,%rax
  998312:	0f 84 90 08 00 00    	je     998ba8 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1368>
  998318:	0f 10 05 dc ef 7c ff 	movups -0x831024(%rip),%xmm0        # 1672fb <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x3fd>
  99831f:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  998323:	0f 10 05 c1 ef 7c ff 	movups -0x83103f(%rip),%xmm0        # 1672eb <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x3ed>
  99832a:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  99832e:	0f 10 05 a6 ef 7c ff 	movups -0x83105a(%rip),%xmm0        # 1672db <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x3dd>
  998335:	0f 11 00             	movups %xmm0,(%rax)
  998338:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  99833f:	74 6c 79 
  998342:	48 89 48 2d          	mov    %rcx,0x2d(%rax)
  998346:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  99834b:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  998352:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  998356:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  99835b:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  998360:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  998365:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  99836a:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  99836e:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  998372:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  998376:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  99837a:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  99837f:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  998386:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  99838b:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  998392:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  998399:	48 c7 01 35 00 00 00 	movq   $0x35,(%rcx)
  9983a0:	48 89 41 08          	mov    %rax,0x8(%rcx)
  9983a4:	48 c7 41 10 35 00 00 	movq   $0x35,0x10(%rcx)
  9983ab:	00 
  9983ac:	e9 39 01 00 00       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  9983b1:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9983b6:	e8 55 77 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9983bb:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9983c0:	ff 15 1a 77 35 00    	call   *0x35771a(%rip)        # cefae0 <_DYNAMIC+0x368>
  9983c6:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  9983cd:	00 
  9983ce:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  9983d3:	89 ea                	mov    %ebp,%edx
  9983d5:	e8 16 7d 00 00       	call   9a00f0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.14820662018926863454>
  9983da:	89 c5                	mov    %eax,%ebp
  9983dc:	40 80 fd fe          	cmp    $0xfe,%bpl
  9983e0:	0f 85 16 01 00 00    	jne    9984fc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcbc>
  9983e6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9983eb:	e8 20 77 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9983f0:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  9983f7:	00 
  9983f8:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  9983fd:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  998404:	00 
  998405:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  99840a:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  998411:	00 
  998412:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  998419:	00 
  99841a:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  998421:	00 
  998422:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  998429:	00 
  99842a:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  99842f:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  998434:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  998439:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  99843e:	ff 15 cc 75 35 00    	call   *0x3575cc(%rip)        # cefa10 <_DYNAMIC+0x298>
  998444:	bf 33 00 00 00       	mov    $0x33,%edi
  998449:	be 01 00 00 00       	mov    $0x1,%esi
  99844e:	ff 15 c4 75 35 00    	call   *0x3575c4(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  998454:	48 85 c0             	test   %rax,%rax
  998457:	0f 84 93 07 00 00    	je     998bf0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13b0>
  99845d:	0f 10 05 31 ee 7c ff 	movups -0x8311cf(%rip),%xmm0        # 167295 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x397>
  998464:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  998468:	0f 10 05 16 ee 7c ff 	movups -0x8311ea(%rip),%xmm0        # 167285 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x387>
  99846f:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  998473:	0f 10 05 fb ed 7c ff 	movups -0x831205(%rip),%xmm0        # 167275 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x377>
  99847a:	0f 11 00             	movups %xmm0,(%rax)
  99847d:	c7 40 2f 7a 65 72 6f 	movl   $0x6f72657a,0x2f(%rax)
  998484:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  998489:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  998490:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  998494:	0f 28 44 24 10       	movaps 0x10(%rsp),%xmm0
  998499:	0f 28 4c 24 20       	movaps 0x20(%rsp),%xmm1
  99849e:	0f 28 54 24 30       	movaps 0x30(%rsp),%xmm2
  9984a3:	0f 28 5c 24 40       	movaps 0x40(%rsp),%xmm3
  9984a8:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  9984ac:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  9984b0:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  9984b4:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  9984b8:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  9984bd:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  9984c4:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
  9984c9:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  9984d0:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  9984d7:	48 c7 01 33 00 00 00 	movq   $0x33,(%rcx)
  9984de:	48 89 41 08          	mov    %rax,0x8(%rcx)
  9984e2:	48 c7 41 10 33 00 00 	movq   $0x33,0x10(%rcx)
  9984e9:	00 
  9984ea:	48 81 c4 08 03 00 00 	add    $0x308,%rsp
  9984f1:	5b                   	pop    %rbx
  9984f2:	41 5c                	pop    %r12
  9984f4:	41 5d                	pop    %r13
  9984f6:	41 5e                	pop    %r14
  9984f8:	41 5f                	pop    %r15
  9984fa:	5d                   	pop    %rbp
  9984fb:	c3                   	ret
  9984fc:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998501:	e8 0a 76 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998506:	80 fb 01             	cmp    $0x1,%bl
  998509:	0f 85 b8 00 00 00    	jne    9985c7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xd87>
  99850f:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  998516:	00 
  998517:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  99851c:	0f 11 80 98 00 00 00 	movups %xmm0,0x98(%rax)
  998523:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  99852a:	00 
  99852b:	0f 11 80 88 00 00 00 	movups %xmm0,0x88(%rax)
  998532:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  998539:	00 
  99853a:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  998541:	00 
  998542:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  998549:	00 
  99854a:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  998551:	00 
  998552:	0f 11 58 78          	movups %xmm3,0x78(%rax)
  998556:	0f 11 50 68          	movups %xmm2,0x68(%rax)
  99855a:	0f 11 48 58          	movups %xmm1,0x58(%rax)
  99855e:	0f 11 40 48          	movups %xmm0,0x48(%rax)
  998562:	c6 40 18 ff          	movb   $0xff,0x18(%rax)
  998566:	66 c7 80 a8 00 00 00 	movw   $0x201,0xa8(%rax)
  99856d:	01 02 
  99856f:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
  998576:	e9 6f ff ff ff       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  99857b:	4b 8b 44 27 e0       	mov    -0x20(%r15,%r12,1),%rax
  998580:	f0 48 ff 00          	lock incq (%rax)
  998584:	0f 8e 88 06 00 00    	jle    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  99858a:	4f 8b 74 27 e0       	mov    -0x20(%r15,%r12,1),%r14
  99858f:	f0 49 ff 06          	lock incq (%r14)
  998593:	0f 8e 79 06 00 00    	jle    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998599:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  99859e:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
  9985a3:	48 83 fd 01          	cmp    $0x1,%rbp
  9985a7:	0f 85 1c 01 00 00    	jne    9986c9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xe89>
  9985ad:	4d 89 f7             	mov    %r14,%r15
  9985b0:	0f 28 05 29 6e 7a ff 	movaps -0x8591d7(%rip),%xmm0        # 13f3e0 <anon.1ddced4fb26376f77bd42a01ac8f11b8.45.llvm.16549145706154455763+0x180>
  9985b7:	31 c0                	xor    %eax,%eax
  9985b9:	31 c9                	xor    %ecx,%ecx
  9985bb:	31 d2                	xor    %edx,%edx
  9985bd:	31 f6                	xor    %esi,%esi
  9985bf:	0f 28 c8             	movaps %xmm0,%xmm1
  9985c2:	e9 d0 fa ff ff       	jmp    998097 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x857>
  9985c7:	40 80 fd ff          	cmp    $0xff,%bpl
  9985cb:	0f 84 1a 05 00 00    	je     998aeb <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x12ab>
  9985d1:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  9985d8:	00 
  9985d9:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  9985de:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  9985e5:	00 
  9985e6:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  9985eb:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  9985f2:	00 
  9985f3:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  9985fa:	00 
  9985fb:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  998602:	00 
  998603:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  99860a:	00 
  99860b:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  998610:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  998615:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  99861a:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  99861f:	ff 15 eb 73 35 00    	call   *0x3573eb(%rip)        # cefa10 <_DYNAMIC+0x298>
  998625:	bf 2b 00 00 00       	mov    $0x2b,%edi
  99862a:	be 01 00 00 00       	mov    $0x1,%esi
  99862f:	ff 15 e3 73 35 00    	call   *0x3573e3(%rip)        # cefa18 <_DYNAMIC+0x2a0>
  998635:	48 85 c0             	test   %rax,%rax
  998638:	0f 84 c4 05 00 00    	je     998c02 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13c2>
  99863e:	0f 10 05 20 ec 7c ff 	movups -0x8313e0(%rip),%xmm0        # 167265 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x367>
  998645:	0f 11 40 1b          	movups %xmm0,0x1b(%rax)
  998649:	0f 10 05 0a ec 7c ff 	movups -0x8313f6(%rip),%xmm0        # 16725a <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x35c>
  998650:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  998654:	0f 10 05 ef eb 7c ff 	movups -0x831411(%rip),%xmm0        # 16724a <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.14820662018926863454+0x34c>
  99865b:	0f 11 00             	movups %xmm0,(%rax)
  99865e:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
  998663:	c6 81 a9 00 00 00 04 	movb   $0x4,0xa9(%rcx)
  99866a:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  99866e:	0f 28 44 24 10       	movaps 0x10(%rsp),%xmm0
  998673:	0f 28 4c 24 20       	movaps 0x20(%rsp),%xmm1
  998678:	0f 28 54 24 30       	movaps 0x30(%rsp),%xmm2
  99867d:	0f 28 5c 24 40       	movaps 0x40(%rsp),%xmm3
  998682:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  998686:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  99868a:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  99868e:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  998692:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  998697:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  99869e:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
  9986a3:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  9986aa:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  9986b1:	48 c7 01 2b 00 00 00 	movq   $0x2b,(%rcx)
  9986b8:	48 89 41 08          	mov    %rax,0x8(%rcx)
  9986bc:	48 c7 41 10 2b 00 00 	movq   $0x2b,0x10(%rcx)
  9986c3:	00 
  9986c4:	e9 21 fe ff ff       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  9986c9:	4c 8d 6c 24 18       	lea    0x18(%rsp),%r13
  9986ce:	49 8d 47 b0          	lea    -0x50(%r15),%rax
  9986d2:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  9986d9:	00 
  9986da:	4d 89 f7             	mov    %r14,%r15
  9986dd:	eb 18                	jmp    9986f7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xeb7>
  9986df:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  9986e4:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
  9986e9:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
  9986ed:	49 83 fc 30          	cmp    $0x30,%r12
  9986f1:	0f 84 b9 fe ff ff    	je     9985b0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xd70>
  9986f7:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  9986fc:	42 80 7c 20 a0 00    	cmpb   $0x0,-0x60(%rax,%r12,1)
  998702:	0f 85 4f 04 00 00    	jne    998b57 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1317>
  998708:	41 80 7e 64 00       	cmpb   $0x0,0x64(%r14)
  99870d:	74 40                	je     99874f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xf0f>
  99870f:	48 8b 84 24 60 01 00 	mov    0x160(%rsp),%rax
  998716:	00 
  998717:	80 78 64 00          	cmpb   $0x0,0x64(%rax)
  99871b:	74 7f                	je     99879c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xf5c>
  99871d:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998722:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  998729:	00 
  99872a:	e8 11 4b f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99872f:	49 89 c6             	mov    %rax,%r14
  998732:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  998739:	00 
  99873a:	4c 89 ef             	mov    %r13,%rdi
  99873d:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  998744:	00 
  998745:	e8 f6 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99874a:	e9 8c 02 00 00       	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  99874f:	41 80 7f 64 02       	cmpb   $0x2,0x64(%r15)
  998754:	48 8b 84 24 60 01 00 	mov    0x160(%rsp),%rax
  99875b:	00 
  99875c:	0f b6 40 64          	movzbl 0x64(%rax),%eax
  998760:	75 78                	jne    9987da <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xf9a>
  998762:	84 c0                	test   %al,%al
  998764:	0f 84 dc 00 00 00    	je     998846 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1006>
  99876a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  99876f:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  998776:	00 
  998777:	e8 c4 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99877c:	49 89 c6             	mov    %rax,%r14
  99877f:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  998786:	00 
  998787:	4c 89 ef             	mov    %r13,%rdi
  99878a:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  998791:	00 
  998792:	e8 a9 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998797:	e9 3f 02 00 00       	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  99879c:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
  9987a3:	00 
  9987a4:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  9987a8:	75 6a                	jne    998814 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xfd4>
  9987aa:	4c 89 ef             	mov    %r13,%rdi
  9987ad:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  9987b4:	00 
  9987b5:	e8 86 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987ba:	49 89 c6             	mov    %rax,%r14
  9987bd:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  9987c4:	00 
  9987c5:	4c 89 ef             	mov    %r13,%rdi
  9987c8:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  9987cf:	00 
  9987d0:	e8 6b 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987d5:	e9 01 02 00 00       	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  9987da:	84 c0                	test   %al,%al
  9987dc:	0f 84 5e 01 00 00    	je     998940 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1100>
  9987e2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9987e7:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  9987ee:	00 
  9987ef:	e8 4c 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987f4:	49 89 c6             	mov    %rax,%r14
  9987f7:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  9987fe:	00 
  9987ff:	4c 89 ef             	mov    %r13,%rdi
  998802:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  998809:	00 
  99880a:	e8 31 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99880f:	e9 c7 01 00 00       	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  998814:	4c 89 ef             	mov    %r13,%rdi
  998817:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  99881e:	00 
  99881f:	e8 1c 4a f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998824:	49 89 c6             	mov    %rax,%r14
  998827:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  99882e:	00 
  99882f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998834:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  99883b:	00 
  99883c:	e8 ff 49 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998841:	e9 95 01 00 00       	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  998846:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
  99884d:	00 
  99884e:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  998852:	0f 85 27 01 00 00    	jne    99897f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x113f>
  998858:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  99885d:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  998864:	00 
  998865:	e8 d6 49 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99886a:	48 89 84 24 b0 01 00 	mov    %rax,0x1b0(%rsp)
  998871:	00 
  998872:	4c 89 ef             	mov    %r13,%rdi
  998875:	48 8d 9c 24 60 01 00 	lea    0x160(%rsp),%rbx
  99887c:	00 
  99887d:	48 89 de             	mov    %rbx,%rsi
  998880:	e8 bb 49 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998885:	48 89 84 24 78 02 00 	mov    %rax,0x278(%rsp)
  99888c:	00 
  99888d:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998892:	48 89 de             	mov    %rbx,%rsi
  998895:	e8 a6 49 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99889a:	4c 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%r14
  9988a1:	00 
  9988a2:	48 8d 9c 24 78 02 00 	lea    0x278(%rsp),%rbx
  9988a9:	00 
  9988aa:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  9988b1:	00 
  9988b2:	4c 89 ef             	mov    %r13,%rdi
  9988b5:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  9988bc:	00 
  9988bd:	e8 7e 49 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9988c2:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
  9988c9:	00 
  9988ca:	4c 89 f7             	mov    %r14,%rdi
  9988cd:	48 89 de             	mov    %rbx,%rsi
  9988d0:	4c 8b 3d 19 75 35 00 	mov    0x357519(%rip),%r15        # cefdf0 <_DYNAMIC+0x678>
  9988d7:	41 ff d7             	call   *%r15
  9988da:	48 89 da             	mov    %rbx,%rdx
  9988dd:	3c fe                	cmp    $0xfe,%al
  9988df:	0f 94 c1             	sete   %cl
  9988e2:	84 c0                	test   %al,%al
  9988e4:	0f 9f c3             	setg   %bl
  9988e7:	08 cb                	or     %cl,%bl
  9988e9:	4c 0f 45 f2          	cmovne %rdx,%r14
  9988ed:	4d 8b 36             	mov    (%r14),%r14
  9988f0:	4c 89 b4 24 80 00 00 	mov    %r14,0x80(%rsp)
  9988f7:	00 
  9988f8:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  9988ff:	00 
  998900:	48 8d b4 24 f0 01 00 	lea    0x1f0(%rsp),%rsi
  998907:	00 
  998908:	41 ff d7             	call   *%r15
  99890b:	84 c0                	test   %al,%al
  99890d:	0f 88 66 01 00 00    	js     998a79 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1239>
  998913:	4c 8b bc 24 f0 00 00 	mov    0xf0(%rsp),%r15
  99891a:	00 
  99891b:	48 8b 84 24 f0 01 00 	mov    0x1f0(%rsp),%rax
  998922:	00 
  998923:	f0 48 ff 08          	lock decq (%rax)
  998927:	0f 85 70 01 00 00    	jne    998a9d <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x125d>
  99892d:	48 8d bc 24 f0 01 00 	lea    0x1f0(%rsp),%rdi
  998934:	00 
  998935:	ff 15 9d 70 35 00    	call   *0x35709d(%rip)        # cef9d8 <_DYNAMIC+0x260>
  99893b:	e9 5d 01 00 00       	jmp    998a9d <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x125d>
  998940:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
  998947:	00 
  998948:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  99894c:	75 60                	jne    9989ae <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x116e>
  99894e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998953:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  99895a:	00 
  99895b:	e8 e0 48 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998960:	49 89 c6             	mov    %rax,%r14
  998963:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  99896a:	00 
  99896b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998970:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  998977:	00 
  998978:	e8 c3 48 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99897d:	eb 5c                	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  99897f:	4c 89 ef             	mov    %r13,%rdi
  998982:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  998989:	00 
  99898a:	e8 b1 48 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99898f:	49 89 c6             	mov    %rax,%r14
  998992:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  998999:	00 
  99899a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  99899f:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  9989a6:	00 
  9989a7:	e8 94 48 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9989ac:	eb 2d                	jmp    9989db <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119b>
  9989ae:	4c 89 ef             	mov    %r13,%rdi
  9989b1:	48 8d b4 24 90 01 00 	lea    0x190(%rsp),%rsi
  9989b8:	00 
  9989b9:	e8 82 48 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9989be:	49 89 c6             	mov    %rax,%r14
  9989c1:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  9989c8:	00 
  9989c9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9989ce:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  9989d5:	00 
  9989d6:	e8 65 48 f4 ff       	call   8dd240 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9989db:	49 89 c7             	mov    %rax,%r15
  9989de:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  9989e3:	f0 48 ff 08          	lock decq (%rax)
  9989e7:	75 0b                	jne    9989f4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x11b4>
  9989e9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  9989ee:	ff 15 e4 6f 35 00    	call   *0x356fe4(%rip)        # cef9d8 <_DYNAMIC+0x260>
  9989f4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  9989f9:	f0 48 ff 08          	lock decq (%rax)
  9989fd:	75 09                	jne    998a08 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x11c8>
  9989ff:	4c 89 ef             	mov    %r13,%rdi
  998a02:	ff 15 d0 6f 35 00    	call   *0x356fd0(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998a08:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  998a0f:	00 
  998a10:	4a 8d 1c 20          	lea    (%rax,%r12,1),%rbx
  998a14:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  998a19:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
  998a1e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998a23:	48 89 de             	mov    %rbx,%rsi
  998a26:	ff 15 44 79 35 00    	call   *0x357944(%rip)        # cf0370 <_DYNAMIC+0xbf8>
  998a2c:	49 89 c6             	mov    %rax,%r14
  998a2f:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  998a36:	00 
  998a37:	4c 89 ef             	mov    %r13,%rdi
  998a3a:	48 89 de             	mov    %rbx,%rsi
  998a3d:	ff 15 2d 79 35 00    	call   *0x35792d(%rip)        # cf0370 <_DYNAMIC+0xbf8>
  998a43:	49 89 c7             	mov    %rax,%r15
  998a46:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  998a4b:	f0 48 ff 08          	lock decq (%rax)
  998a4f:	75 0b                	jne    998a5c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x121c>
  998a51:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998a56:	ff 15 7c 6f 35 00    	call   *0x356f7c(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998a5c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  998a61:	f0 48 ff 08          	lock decq (%rax)
  998a65:	0f 85 74 fc ff ff    	jne    9986df <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xe9f>
  998a6b:	4c 89 ef             	mov    %r13,%rdi
  998a6e:	ff 15 64 6f 35 00    	call   *0x356f64(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998a74:	e9 66 fc ff ff       	jmp    9986df <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xe9f>
  998a79:	4c 8b bc 24 f0 01 00 	mov    0x1f0(%rsp),%r15
  998a80:	00 
  998a81:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  998a88:	00 
  998a89:	f0 48 ff 08          	lock decq (%rax)
  998a8d:	75 0e                	jne    998a9d <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x125d>
  998a8f:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  998a96:	00 
  998a97:	ff 15 3b 6f 35 00    	call   *0x356f3b(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998a9d:	84 db                	test   %bl,%bl
  998a9f:	74 25                	je     998ac6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1286>
  998aa1:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  998aa8:	00 
  998aa9:	f0 48 ff 08          	lock decq (%rax)
  998aad:	0f 85 2b ff ff ff    	jne    9989de <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119e>
  998ab3:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  998aba:	00 
  998abb:	ff 15 17 6f 35 00    	call   *0x356f17(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998ac1:	e9 18 ff ff ff       	jmp    9989de <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119e>
  998ac6:	48 8b 84 24 78 02 00 	mov    0x278(%rsp),%rax
  998acd:	00 
  998ace:	f0 48 ff 08          	lock decq (%rax)
  998ad2:	0f 85 06 ff ff ff    	jne    9989de <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119e>
  998ad8:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
  998adf:	00 
  998ae0:	ff 15 f2 6e 35 00    	call   *0x356ef2(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998ae6:	e9 f3 fe ff ff       	jmp    9989de <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x119e>
  998aeb:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  998af2:	00 
  998af3:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  998af8:	0f 11 80 98 00 00 00 	movups %xmm0,0x98(%rax)
  998aff:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  998b06:	00 
  998b07:	0f 11 80 88 00 00 00 	movups %xmm0,0x88(%rax)
  998b0e:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  998b15:	00 
  998b16:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  998b1d:	00 
  998b1e:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  998b25:	00 
  998b26:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  998b2d:	00 
  998b2e:	0f 11 58 78          	movups %xmm3,0x78(%rax)
  998b32:	0f 11 50 68          	movups %xmm2,0x68(%rax)
  998b36:	0f 11 48 58          	movups %xmm1,0x58(%rax)
  998b3a:	0f 11 40 48          	movups %xmm0,0x48(%rax)
  998b3e:	c6 40 18 ff          	movb   $0xff,0x18(%rax)
  998b42:	66 c7 80 a8 00 00 00 	movw   $0x3ff,0xa8(%rax)
  998b49:	ff 03 
  998b4b:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
  998b52:	e9 93 f9 ff ff       	jmp    9984ea <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0xcaa>
  998b57:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998b5c:	e8 3f 6f fe ff       	call   97faa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  998b61:	4c 8b 7c 24 78       	mov    0x78(%rsp),%r15
  998b66:	e9 3f f1 ff ff       	jmp    997caa <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x46a>
  998b6b:	48 8d 0d 46 a2 31 00 	lea    0x31a246(%rip),%rcx        # cb2db8 <anon.501c3f8f5d047014bdce61b37e107781.110.llvm.14820662018926863454+0x68>
  998b72:	31 ff                	xor    %edi,%edi
  998b74:	48 89 de             	mov    %rbx,%rsi
  998b77:	48 89 ea             	mov    %rbp,%rdx
  998b7a:	ff 15 48 71 35 00    	call   *0x357148(%rip)        # cefcc8 <_DYNAMIC+0x550>
  998b80:	48 ff cb             	dec    %rbx
  998b83:	48 8d 15 16 a2 31 00 	lea    0x31a216(%rip),%rdx        # cb2da0 <anon.501c3f8f5d047014bdce61b37e107781.110.llvm.14820662018926863454+0x50>
  998b8a:	48 89 df             	mov    %rbx,%rdi
  998b8d:	48 89 ee             	mov    %rbp,%rsi
  998b90:	ff 15 ba 6f 35 00    	call   *0x356fba(%rip)        # cefb50 <_DYNAMIC+0x3d8>
  998b96:	bf 01 00 00 00       	mov    $0x1,%edi
  998b9b:	be 37 00 00 00       	mov    $0x37,%esi
  998ba0:	ff 15 da 6e 35 00    	call   *0x356eda(%rip)        # cefa80 <_DYNAMIC+0x308>
  998ba6:	eb 6a                	jmp    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998ba8:	bf 01 00 00 00       	mov    $0x1,%edi
  998bad:	be 35 00 00 00       	mov    $0x35,%esi
  998bb2:	ff 15 c8 6e 35 00    	call   *0x356ec8(%rip)        # cefa80 <_DYNAMIC+0x308>
  998bb8:	eb 58                	jmp    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998bba:	bf 01 00 00 00       	mov    $0x1,%edi
  998bbf:	be 28 00 00 00       	mov    $0x28,%esi
  998bc4:	ff 15 b6 6e 35 00    	call   *0x356eb6(%rip)        # cefa80 <_DYNAMIC+0x308>
  998bca:	eb 46                	jmp    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998bcc:	bf 01 00 00 00       	mov    $0x1,%edi
  998bd1:	be 38 00 00 00       	mov    $0x38,%esi
  998bd6:	ff 15 a4 6e 35 00    	call   *0x356ea4(%rip)        # cefa80 <_DYNAMIC+0x308>
  998bdc:	eb 34                	jmp    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998bde:	bf 01 00 00 00       	mov    $0x1,%edi
  998be3:	be 33 00 00 00       	mov    $0x33,%esi
  998be8:	ff 15 92 6e 35 00    	call   *0x356e92(%rip)        # cefa80 <_DYNAMIC+0x308>
  998bee:	eb 22                	jmp    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998bf0:	bf 01 00 00 00       	mov    $0x1,%edi
  998bf5:	be 33 00 00 00       	mov    $0x33,%esi
  998bfa:	ff 15 80 6e 35 00    	call   *0x356e80(%rip)        # cefa80 <_DYNAMIC+0x308>
  998c00:	eb 10                	jmp    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13d2>
  998c02:	bf 01 00 00 00       	mov    $0x1,%edi
  998c07:	be 2b 00 00 00       	mov    $0x2b,%esi
  998c0c:	ff 15 6e 6e 35 00    	call   *0x356e6e(%rip)        # cefa80 <_DYNAMIC+0x308>
  998c12:	0f 0b                	ud2
  998c14:	49 89 c4             	mov    %rax,%r12
  998c17:	84 db                	test   %bl,%bl
  998c19:	0f 85 ae 00 00 00    	jne    998ccd <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x148d>
  998c1f:	eb 0b                	jmp    998c2c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x13ec>
  998c21:	49 89 c4             	mov    %rax,%r12
  998c24:	84 db                	test   %bl,%bl
  998c26:	0f 85 a1 00 00 00    	jne    998ccd <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x148d>
  998c2c:	31 db                	xor    %ebx,%ebx
  998c2e:	eb 75                	jmp    998ca5 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1465>
  998c30:	49 89 c4             	mov    %rax,%r12
  998c33:	89 dd                	mov    %ebx,%ebp
  998c35:	40 80 f5 01          	xor    $0x1,%bpl
  998c39:	f0 49 ff 0e          	lock decq (%r14)
  998c3d:	75 18                	jne    998c57 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1417>
  998c3f:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998c46:	00 
  998c47:	ff 15 8b 6d 35 00    	call   *0x356d8b(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998c4d:	eb 08                	jmp    998c57 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1417>
  998c4f:	49 89 c4             	mov    %rax,%r12
  998c52:	b3 01                	mov    $0x1,%bl
  998c54:	40 b5 01             	mov    $0x1,%bpl
  998c57:	48 8b 84 24 f0 01 00 	mov    0x1f0(%rsp),%rax
  998c5e:	00 
  998c5f:	f0 48 ff 08          	lock decq (%rax)
  998c63:	75 18                	jne    998c7d <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x143d>
  998c65:	48 8d bc 24 f0 01 00 	lea    0x1f0(%rsp),%rdi
  998c6c:	00 
  998c6d:	ff 15 65 6d 35 00    	call   *0x356d65(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998c73:	eb 08                	jmp    998c7d <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x143d>
  998c75:	49 89 c4             	mov    %rax,%r12
  998c78:	40 b5 01             	mov    $0x1,%bpl
  998c7b:	b3 01                	mov    $0x1,%bl
  998c7d:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  998c84:	00 
  998c85:	f0 48 ff 08          	lock decq (%rax)
  998c89:	75 0e                	jne    998c99 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1459>
  998c8b:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  998c92:	00 
  998c93:	ff 15 3f 6d 35 00    	call   *0x356d3f(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998c99:	40 84 ed             	test   %bpl,%bpl
  998c9c:	75 07                	jne    998ca5 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1465>
  998c9e:	eb 21                	jmp    998cc1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1481>
  998ca0:	49 89 c4             	mov    %rax,%r12
  998ca3:	b3 01                	mov    $0x1,%bl
  998ca5:	48 8b 84 24 78 02 00 	mov    0x278(%rsp),%rax
  998cac:	00 
  998cad:	f0 48 ff 08          	lock decq (%rax)
  998cb1:	75 0e                	jne    998cc1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1481>
  998cb3:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
  998cba:	00 
  998cbb:	ff 15 17 6d 35 00    	call   *0x356d17(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998cc1:	84 db                	test   %bl,%bl
  998cc3:	75 08                	jne    998ccd <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x148d>
  998cc5:	e9 dd 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998cca:	49 89 c4             	mov    %rax,%r12
  998ccd:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  998cd4:	00 
  998cd5:	f0 48 ff 08          	lock decq (%rax)
  998cd9:	0f 85 c8 02 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998cdf:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  998ce6:	00 
  998ce7:	ff 15 eb 6c 35 00    	call   *0x356ceb(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998ced:	e9 b5 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998cf2:	49 89 c4             	mov    %rax,%r12
  998cf5:	f0 49 ff 0e          	lock decq (%r14)
  998cf9:	0f 85 a8 02 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998cff:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998d06:	00 
  998d07:	ff 15 cb 6c 35 00    	call   *0x356ccb(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998d0d:	e9 95 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d12:	49 89 c4             	mov    %rax,%r12
  998d15:	f0 49 ff 0e          	lock decq (%r14)
  998d19:	0f 85 88 02 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d1f:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998d26:	00 
  998d27:	ff 15 ab 6c 35 00    	call   *0x356cab(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998d2d:	e9 75 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d32:	49 89 c4             	mov    %rax,%r12
  998d35:	f0 49 ff 0e          	lock decq (%r14)
  998d39:	0f 85 68 02 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d3f:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998d46:	00 
  998d47:	ff 15 8b 6c 35 00    	call   *0x356c8b(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998d4d:	e9 55 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d52:	49 89 c4             	mov    %rax,%r12
  998d55:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998d5a:	e8 81 4c fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998d5f:	e9 31 04 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998d64:	49 89 c4             	mov    %rax,%r12
  998d67:	f0 49 ff 0e          	lock decq (%r14)
  998d6b:	0f 85 36 02 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d71:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998d78:	00 
  998d79:	ff 15 59 6c 35 00    	call   *0x356c59(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998d7f:	e9 23 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d84:	49 89 c4             	mov    %rax,%r12
  998d87:	f0 49 ff 0e          	lock decq (%r14)
  998d8b:	0f 85 16 02 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998d91:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998d98:	00 
  998d99:	ff 15 39 6c 35 00    	call   *0x356c39(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998d9f:	e9 03 02 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998da4:	49 89 c4             	mov    %rax,%r12
  998da7:	f0 49 ff 0e          	lock decq (%r14)
  998dab:	0f 85 f6 01 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998db1:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998db8:	00 
  998db9:	ff 15 19 6c 35 00    	call   *0x356c19(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998dbf:	e9 e3 01 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998dc4:	49 89 c4             	mov    %rax,%r12
  998dc7:	f0 49 ff 0e          	lock decq (%r14)
  998dcb:	0f 85 d6 01 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998dd1:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998dd8:	00 
  998dd9:	ff 15 f9 6b 35 00    	call   *0x356bf9(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998ddf:	e9 c3 01 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998de4:	49 89 c4             	mov    %rax,%r12
  998de7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998dec:	e8 ef 4b fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998df1:	e9 9f 03 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998df6:	49 89 c4             	mov    %rax,%r12
  998df9:	f0 49 ff 0e          	lock decq (%r14)
  998dfd:	0f 85 a4 01 00 00    	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998e03:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998e0a:	00 
  998e0b:	ff 15 c7 6b 35 00    	call   *0x356bc7(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998e11:	e9 91 01 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998e16:	ff 15 ac 6b 35 00    	call   *0x356bac(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998e1c:	49 89 c4             	mov    %rax,%r12
  998e1f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998e24:	e8 e7 6c fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998e29:	e9 ab 01 00 00       	jmp    998fd9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1799>
  998e2e:	49 89 c4             	mov    %rax,%r12
  998e31:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998e36:	e8 a5 4b fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998e3b:	e9 55 03 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998e40:	49 89 c4             	mov    %rax,%r12
  998e43:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  998e48:	f0 48 ff 08          	lock decq (%rax)
  998e4c:	75 35                	jne    998e83 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1643>
  998e4e:	4c 89 ef             	mov    %r13,%rdi
  998e51:	ff 15 81 6b 35 00    	call   *0x356b81(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998e57:	eb 2a                	jmp    998e83 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1643>
  998e59:	ff 15 69 6b 35 00    	call   *0x356b69(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998e5f:	49 89 c4             	mov    %rax,%r12
  998e62:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  998e67:	f0 48 ff 08          	lock decq (%rax)
  998e6b:	75 16                	jne    998e83 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1643>
  998e6d:	4c 89 ef             	mov    %r13,%rdi
  998e70:	ff 15 62 6b 35 00    	call   *0x356b62(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998e76:	eb 0b                	jmp    998e83 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1643>
  998e78:	ff 15 4a 6b 35 00    	call   *0x356b4a(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998e7e:	eb 00                	jmp    998e80 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1640>
  998e80:	49 89 c4             	mov    %rax,%r12
  998e83:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  998e88:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
  998e8d:	e9 15 01 00 00       	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998e92:	49 89 c4             	mov    %rax,%r12
  998e95:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  998e9c:	00 
  998e9d:	e8 6e 6c fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998ea2:	e9 e1 02 00 00       	jmp    999188 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1948>
  998ea7:	ff 15 1b 6b 35 00    	call   *0x356b1b(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998ead:	49 89 c4             	mov    %rax,%r12
  998eb0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998eb5:	e8 26 4b fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998eba:	e9 d6 02 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998ebf:	49 89 c4             	mov    %rax,%r12
  998ec2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998ec7:	e8 44 6c fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998ecc:	e9 08 01 00 00       	jmp    998fd9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1799>
  998ed1:	49 89 c4             	mov    %rax,%r12
  998ed4:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  998edb:	00 
  998edc:	e8 2f 6c fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998ee1:	e9 f3 00 00 00       	jmp    998fd9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1799>
  998ee6:	ff 15 dc 6a 35 00    	call   *0x356adc(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998eec:	49 89 c4             	mov    %rax,%r12
  998eef:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998ef4:	e8 e7 4a fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998ef9:	80 bc 24 80 00 00 00 	cmpb   $0xff,0x80(%rsp)
  998f00:	ff 
  998f01:	0f 84 8e 02 00 00    	je     999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998f07:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998f0e:	00 
  998f0f:	e8 fc 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998f14:	e9 7c 02 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998f19:	49 89 c4             	mov    %rax,%r12
  998f1c:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998f21:	e8 ba 4a fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998f26:	e9 6a 02 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998f2b:	49 89 c4             	mov    %rax,%r12
  998f2e:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  998f35:	00 
  998f36:	e8 d5 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998f3b:	e9 55 02 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998f40:	ff 15 82 6a 35 00    	call   *0x356a82(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998f46:	49 89 c4             	mov    %rax,%r12
  998f49:	f0 49 ff 0e          	lock decq (%r14)
  998f4d:	75 58                	jne    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998f4f:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998f56:	00 
  998f57:	ff 15 7b 6a 35 00    	call   *0x356a7b(%rip)        # cef9d8 <_DYNAMIC+0x260>
  998f5d:	eb 48                	jmp    998fa7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1767>
  998f5f:	ff 15 63 6a 35 00    	call   *0x356a63(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998f65:	49 89 c4             	mov    %rax,%r12
  998f68:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998f6f:	00 
  998f70:	e8 9b 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998f75:	e9 0e 02 00 00       	jmp    999188 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1948>
  998f7a:	49 89 c4             	mov    %rax,%r12
  998f7d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998f84:	00 
  998f85:	e8 86 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998f8a:	e9 06 02 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998f8f:	49 89 c4             	mov    %rax,%r12
  998f92:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998f97:	e8 74 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998f9c:	eb 50                	jmp    998fee <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x17ae>
  998f9e:	ff 15 24 6a 35 00    	call   *0x356a24(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998fa4:	49 89 c4             	mov    %rax,%r12
  998fa7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998fac:	e8 ef 6a fe ff       	call   97faa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  998fb1:	e9 d2 01 00 00       	jmp    999188 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1948>
  998fb6:	ff 15 0c 6a 35 00    	call   *0x356a0c(%rip)        # cef9c8 <_DYNAMIC+0x250>
  998fbc:	49 89 c4             	mov    %rax,%r12
  998fbf:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  998fc4:	e8 17 4a fe ff       	call   97d9e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.14820662018926863454>
  998fc9:	e9 c7 01 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998fce:	49 89 c4             	mov    %rax,%r12
  998fd1:	e9 b2 01 00 00       	jmp    999188 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1948>
  998fd6:	49 89 c4             	mov    %rax,%r12
  998fd9:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  998fe0:	00 
  998fe1:	e8 fa 66 fe ff       	call   97f6e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  998fe6:	e9 aa 01 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  998feb:	49 89 c4             	mov    %rax,%r12
  998fee:	48 8d bc 24 f0 01 00 	lea    0x1f0(%rsp),%rdi
  998ff5:	00 
  998ff6:	e8 15 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  998ffb:	e9 95 01 00 00       	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  999000:	49 89 c4             	mov    %rax,%r12
  999003:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  99900a:	00 
  99900b:	e8 00 6b fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  999010:	eb 39                	jmp    99904b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x180b>
  999012:	49 89 c4             	mov    %rax,%r12
  999015:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
  99901c:	00 
  99901d:	e8 fe db ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  999022:	eb 4e                	jmp    999072 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1832>
  999024:	49 89 c4             	mov    %rax,%r12
  999027:	eb 56                	jmp    99907f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x183f>
  999029:	49 89 c4             	mov    %rax,%r12
  99902c:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
  999033:	00 
  999034:	e8 e7 db ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  999039:	eb 6b                	jmp    9990a6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1866>
  99903b:	49 89 c4             	mov    %rax,%r12
  99903e:	eb 73                	jmp    9990b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1873>
  999040:	49 89 c4             	mov    %rax,%r12
  999043:	e9 8a 00 00 00       	jmp    9990d2 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1892>
  999048:	49 89 c4             	mov    %rax,%r12
  99904b:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  999052:	00 
  999053:	e8 88 66 fe ff       	call   97f6e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  999058:	e9 1e 01 00 00       	jmp    99917b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x193b>
  99905d:	49 89 c4             	mov    %rax,%r12
  999060:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  999067:	00 
  999068:	e8 a3 6a fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99906d:	eb 10                	jmp    99907f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x183f>
  99906f:	49 89 c4             	mov    %rax,%r12
  999072:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  999079:	00 
  99907a:	e8 a1 db ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  99907f:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  999086:	00 
  999087:	e8 84 6a fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99908c:	e9 a1 00 00 00       	jmp    999132 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x18f2>
  999091:	49 89 c4             	mov    %rax,%r12
  999094:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  99909b:	00 
  99909c:	e8 6f 6a fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9990a1:	eb 10                	jmp    9990b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1873>
  9990a3:	49 89 c4             	mov    %rax,%r12
  9990a6:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  9990ad:	00 
  9990ae:	e8 6d db ee ff       	call   886c20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  9990b3:	48 8d bc 24 a8 02 00 	lea    0x2a8(%rsp),%rdi
  9990ba:	00 
  9990bb:	e8 50 6a fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9990c0:	eb 70                	jmp    999132 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x18f2>
  9990c2:	49 89 c4             	mov    %rax,%r12
  9990c5:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  9990cc:	00 
  9990cd:	e8 3e 6a fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  9990d2:	0f 28 84 24 40 02 00 	movaps 0x240(%rsp),%xmm0
  9990d9:	00 
  9990da:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  9990e1:	00 
  9990e2:	0f 28 84 24 30 02 00 	movaps 0x230(%rsp),%xmm0
  9990e9:	00 
  9990ea:	0f 29 84 24 30 01 00 	movaps %xmm0,0x130(%rsp)
  9990f1:	00 
  9990f2:	0f 28 84 24 f0 01 00 	movaps 0x1f0(%rsp),%xmm0
  9990f9:	00 
  9990fa:	0f 28 8c 24 00 02 00 	movaps 0x200(%rsp),%xmm1
  999101:	00 
  999102:	0f 28 94 24 10 02 00 	movaps 0x210(%rsp),%xmm2
  999109:	00 
  99910a:	0f 28 9c 24 20 02 00 	movaps 0x220(%rsp),%xmm3
  999111:	00 
  999112:	0f 29 9c 24 20 01 00 	movaps %xmm3,0x120(%rsp)
  999119:	00 
  99911a:	0f 29 94 24 10 01 00 	movaps %xmm2,0x110(%rsp)
  999121:	00 
  999122:	0f 29 8c 24 00 01 00 	movaps %xmm1,0x100(%rsp)
  999129:	00 
  99912a:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  999131:	00 
  999132:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  999137:	e8 a4 65 fe ff       	call   97f6e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  99913c:	eb 3d                	jmp    99917b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x193b>
  99913e:	ff 15 84 68 35 00    	call   *0x356884(%rip)        # cef9c8 <_DYNAMIC+0x250>
  999144:	49 89 c4             	mov    %rax,%r12
  999147:	4c 89 ef             	mov    %r13,%rdi
  99914a:	e8 c1 69 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  99914f:	eb 2a                	jmp    99917b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x193b>
  999151:	ff 15 71 68 35 00    	call   *0x356871(%rip)        # cef9c8 <_DYNAMIC+0x250>
  999157:	ff 15 6b 68 35 00    	call   *0x35686b(%rip)        # cef9c8 <_DYNAMIC+0x250>
  99915d:	ff 15 65 68 35 00    	call   *0x356865(%rip)        # cef9c8 <_DYNAMIC+0x250>
  999163:	49 89 c4             	mov    %rax,%r12
  999166:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  99916b:	e8 a0 69 fe ff       	call   97fb10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.14820662018926863454>
  999170:	eb 23                	jmp    999195 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.14820662018926863454+0x1955>
  999172:	ff 15 50 68 35 00    	call   *0x356850(%rip)        # cef9c8 <_DYNAMIC+0x250>
  999178:	49 89 c4             	mov    %rax,%r12
  99917b:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  999182:	00 
  999183:	e8 58 65 fe ff       	call   97f6e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  999188:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  99918f:	00 
  999190:	e8 4b 65 fe ff       	call   97f6e0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  999195:	4c 89 e7             	mov    %r12,%rdi
  999198:	e8 43 87 30 00       	call   ca18e0 <_Unwind_Resume@plt>
  99919d:	ff 15 25 68 35 00    	call   *0x356825(%rip)        # cef9c8 <_DYNAMIC+0x250>
  9991a3:	ff 15 1f 68 35 00    	call   *0x35681f(%rip)        # cef9c8 <_DYNAMIC+0x250>
  9991a9:	ff 15 19 68 35 00    	call   *0x356819(%rip)        # cef9c8 <_DYNAMIC+0x250>
