
/tmp/interval-refactor/horner-current/artifacts-candidate-consuming/certification:     file format elf64-x86-64


Disassembly of section .text:

0000000000997810 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882>:
  997810:	55                   	push   %rbp
  997811:	41 57                	push   %r15
  997813:	41 56                	push   %r14
  997815:	41 55                	push   %r13
  997817:	41 54                	push   %r12
  997819:	53                   	push   %rbx
  99781a:	48 81 ec e8 02 00 00 	sub    $0x2e8,%rsp
  997821:	49 89 fe             	mov    %rdi,%r14
  997824:	48 85 c9             	test   %rcx,%rcx
  997827:	0f 84 4e 02 00 00    	je     997a7b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x26b>
  99782d:	44 89 c3             	mov    %r8d,%ebx
  997830:	48 89 d5             	mov    %rdx,%rbp
  997833:	48 83 f9 01          	cmp    $0x1,%rcx
  997837:	0f 84 d1 00 00 00    	je     99790e <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xfe>
  99783d:	48 89 b4 24 30 02 00 	mov    %rsi,0x230(%rsp)
  997844:	00 
  997845:	4c 89 b4 24 d0 00 00 	mov    %r14,0xd0(%rsp)
  99784c:	00 
  99784d:	48 8d 04 49          	lea    (%rcx,%rcx,2),%rax
  997851:	48 c1 e0 04          	shl    $0x4,%rax
  997855:	48 89 6c 24 68       	mov    %rbp,0x68(%rsp)
  99785a:	4c 8d 3c 28          	lea    (%rax,%rbp,1),%r15
  99785e:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  997862:	49 89 e5             	mov    %rsp,%r13
  997865:	89 5c 24 64          	mov    %ebx,0x64(%rsp)
  997869:	0f b6 c3             	movzbl %bl,%eax
  99786c:	89 84 24 d8 00 00 00 	mov    %eax,0xd8(%rsp)
  997873:	48 89 cb             	mov    %rcx,%rbx
  997876:	eb 23                	jmp    99789b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x8b>
  997878:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  99787f:	00 
  997880:	49 8b 47 10          	mov    0x10(%r15),%rax
  997884:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  997888:	75 5f                	jne    9978e9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xd9>
  99788a:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  99788e:	4c 89 f3             	mov    %r14,%rbx
  997891:	49 83 fe 01          	cmp    $0x1,%r14
  997895:	0f 86 fe 02 00 00    	jbe    997b99 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x389>
  99789b:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
  99789f:	49 39 ce             	cmp    %rcx,%r14
  9978a2:	0f 83 4e 12 00 00    	jae    998af6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x12e6>
  9978a8:	41 80 3f 00          	cmpb   $0x0,(%r15)
  9978ac:	74 d2                	je     997880 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x70>
  9978ae:	48 89 cd             	mov    %rcx,%rbp
  9978b1:	4c 89 ef             	mov    %r13,%rdi
  9978b4:	ff 15 a6 81 35 00    	call   *0x3581a6(%rip)        # cefa60 <_DYNAMIC+0x368>
  9978ba:	4c 89 ff             	mov    %r15,%rdi
  9978bd:	4c 89 ee             	mov    %r13,%rsi
  9978c0:	8b 94 24 d8 00 00 00 	mov    0xd8(%rsp),%edx
  9978c7:	e8 a4 87 00 00       	call   9a0070 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.6388444206278278882>
  9978cc:	41 89 c4             	mov    %eax,%r12d
  9978cf:	41 80 fc fe          	cmp    $0xfe,%r12b
  9978d3:	0f 84 d9 08 00 00    	je     9981b2 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x9a2>
  9978d9:	4c 89 ef             	mov    %r13,%rdi
  9978dc:	e8 ff 81 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9978e1:	45 84 e4             	test   %r12b,%r12b
  9978e4:	48 89 e9             	mov    %rbp,%rcx
  9978e7:	74 a1                	je     99788a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x7a>
  9978e9:	48 39 cb             	cmp    %rcx,%rbx
  9978ec:	48 8b b4 24 30 02 00 	mov    0x230(%rsp),%rsi
  9978f3:	00 
  9978f4:	0f 87 e7 11 00 00    	ja     998ae1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x12d1>
  9978fa:	48 89 d9             	mov    %rbx,%rcx
  9978fd:	4c 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%r14
  997904:	00 
  997905:	8b 5c 24 64          	mov    0x64(%rsp),%ebx
  997909:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
  99790e:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  997915:	0f 84 a9 02 00 00    	je     997bc4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x3b4>
  99791b:	48 81 c6 98 00 00 00 	add    $0x98,%rsi
  997922:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  997929:	00 
  99792a:	48 89 f0             	mov    %rsi,%rax
  99792d:	48 89 ee             	mov    %rbp,%rsi
  997930:	48 89 ca             	mov    %rcx,%rdx
  997933:	48 89 c1             	mov    %rax,%rcx
  997936:	e8 b5 43 ff ff       	call   98bcf0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic19evaluate_polynomial>
  99793b:	0f b6 ac 24 d0 01 00 	movzbl 0x1d0(%rsp),%ebp
  997942:	00 
  997943:	40 84 ed             	test   %bpl,%bpl
  997946:	0f 84 ee 01 00 00    	je     997b3a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x32a>
  99794c:	48 89 e7             	mov    %rsp,%rdi
  99794f:	ff 15 0b 81 35 00    	call   *0x35810b(%rip)        # cefa60 <_DYNAMIC+0x368>
  997955:	0f b6 d3             	movzbl %bl,%edx
  997958:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  99795f:	00 
  997960:	48 89 e6             	mov    %rsp,%rsi
  997963:	e8 08 87 00 00       	call   9a0070 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.6388444206278278882>
  997968:	89 c3                	mov    %eax,%ebx
  99796a:	48 89 e7             	mov    %rsp,%rdi
  99796d:	e8 6e 81 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  997972:	80 fb fe             	cmp    $0xfe,%bl
  997975:	0f 85 d4 01 00 00    	jne    997b4f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x33f>
  99797b:	0f 10 84 24 d0 01 00 	movups 0x1d0(%rsp),%xmm0
  997982:	00 
  997983:	0f 10 8c 24 e0 01 00 	movups 0x1e0(%rsp),%xmm1
  99798a:	00 
  99798b:	0f 10 94 24 f0 01 00 	movups 0x1f0(%rsp),%xmm2
  997992:	00 
  997993:	0f 29 94 24 90 00 00 	movaps %xmm2,0x90(%rsp)
  99799a:	00 
  99799b:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
  9979a2:	00 
  9979a3:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
  9979a8:	c6 04 24 ff          	movb   $0xff,(%rsp)
  9979ac:	ff 15 de 7f 35 00    	call   *0x357fde(%rip)        # cef990 <_DYNAMIC+0x298>
  9979b2:	bf 28 00 00 00       	mov    $0x28,%edi
  9979b7:	be 01 00 00 00       	mov    $0x1,%esi
  9979bc:	ff 15 d6 7f 35 00    	call   *0x357fd6(%rip)        # cef998 <_DYNAMIC+0x2a0>
  9979c2:	48 85 c0             	test   %rax,%rax
  9979c5:	0f 84 65 11 00 00    	je     998b30 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1320>
  9979cb:	0f 10 05 4e f9 7c ff 	movups -0x8306b2(%rip),%xmm0        # 167320 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x422>
  9979d2:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  9979d6:	0f 10 05 33 f9 7c ff 	movups -0x8306cd(%rip),%xmm0        # 167310 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x412>
  9979dd:	0f 11 00             	movups %xmm0,(%rax)
  9979e0:	48 b9 6c 75 65 20 73 	movabs $0x6e6769732065756c,%rcx
  9979e7:	69 67 6e 
  9979ea:	48 89 48 20          	mov    %rcx,0x20(%rax)
  9979ee:	41 c6 86 a9 00 00 00 	movb   $0x7,0xa9(%r14)
  9979f5:	07 
  9979f6:	0f 28 44 24 70       	movaps 0x70(%rsp),%xmm0
  9979fb:	0f 28 8c 24 80 00 00 	movaps 0x80(%rsp),%xmm1
  997a02:	00 
  997a03:	0f 28 94 24 90 00 00 	movaps 0x90(%rsp),%xmm2
  997a0a:	00 
  997a0b:	41 0f 11 46 18       	movups %xmm0,0x18(%r14)
  997a10:	41 0f 11 4e 28       	movups %xmm1,0x28(%r14)
  997a15:	41 0f 11 56 38       	movups %xmm2,0x38(%r14)
  997a1a:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  997a1f:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  997a26:	00 
  997a27:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  997a2c:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  997a33:	00 
  997a34:	0f 10 04 24          	movups (%rsp),%xmm0
  997a38:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  997a3d:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  997a42:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  997a47:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  997a4c:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  997a51:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  997a56:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  997a5b:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  997a62:	fe 
  997a63:	49 c7 06 28 00 00 00 	movq   $0x28,(%r14)
  997a6a:	49 89 46 08          	mov    %rax,0x8(%r14)
  997a6e:	49 c7 46 10 28 00 00 	movq   $0x28,0x10(%r14)
  997a75:	00 
  997a76:	e9 1f 0a 00 00       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  997a7b:	c6 04 24 ff          	movb   $0xff,(%rsp)
  997a7f:	ff 15 0b 7f 35 00    	call   *0x357f0b(%rip)        # cef990 <_DYNAMIC+0x298>
  997a85:	bf 37 00 00 00       	mov    $0x37,%edi
  997a8a:	be 01 00 00 00       	mov    $0x1,%esi
  997a8f:	ff 15 03 7f 35 00    	call   *0x357f03(%rip)        # cef998 <_DYNAMIC+0x2a0>
  997a95:	48 85 c0             	test   %rax,%rax
  997a98:	0f 84 6e 10 00 00    	je     998b0c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x12fc>
  997a9e:	0f 10 05 eb f8 7c ff 	movups -0x830715(%rip),%xmm0        # 167390 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x492>
  997aa5:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  997aa9:	0f 10 05 d0 f8 7c ff 	movups -0x830730(%rip),%xmm0        # 167380 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x482>
  997ab0:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  997ab4:	0f 10 05 b5 f8 7c ff 	movups -0x83074b(%rip),%xmm0        # 167370 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x472>
  997abb:	0f 11 00             	movups %xmm0,(%rax)
  997abe:	48 b9 66 66 69 63 69 	movabs $0x746e656963696666,%rcx
  997ac5:	65 6e 74 
  997ac8:	48 89 48 2f          	mov    %rcx,0x2f(%rax)
  997acc:	41 c6 86 a9 00 00 00 	movb   $0x6,0xa9(%r14)
  997ad3:	06 
  997ad4:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  997ad9:	0f 10 04 24          	movups (%rsp),%xmm0
  997add:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  997ae2:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  997ae7:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  997aec:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  997af1:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  997af6:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  997afb:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  997b00:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  997b05:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  997b0c:	00 
  997b0d:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  997b12:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  997b19:	00 
  997b1a:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  997b21:	fe 
  997b22:	49 c7 06 37 00 00 00 	movq   $0x37,(%r14)
  997b29:	49 89 46 08          	mov    %rax,0x8(%r14)
  997b2d:	49 c7 46 10 37 00 00 	movq   $0x37,0x10(%r14)
  997b34:	00 
  997b35:	e9 60 09 00 00       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  997b3a:	48 8b 84 24 e0 01 00 	mov    0x1e0(%rsp),%rax
  997b41:	00 
  997b42:	31 db                	xor    %ebx,%ebx
  997b44:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  997b48:	0f 95 c0             	setne  %al
  997b4b:	19 db                	sbb    %ebx,%ebx
  997b4d:	08 c3                	or     %al,%bl
  997b4f:	40 84 ed             	test   %bpl,%bpl
  997b52:	0f 10 84 24 d0 01 00 	movups 0x1d0(%rsp),%xmm0
  997b59:	00 
  997b5a:	0f 10 8c 24 e0 01 00 	movups 0x1e0(%rsp),%xmm1
  997b61:	00 
  997b62:	0f 10 94 24 f0 01 00 	movups 0x1f0(%rsp),%xmm2
  997b69:	00 
  997b6a:	41 0f 11 56 38       	movups %xmm2,0x38(%r14)
  997b6f:	41 0f 11 4e 28       	movups %xmm1,0x28(%r14)
  997b74:	41 0f 11 46 18       	movups %xmm0,0x18(%r14)
  997b79:	41 0f 95 86 a9 00 00 	setne  0xa9(%r14)
  997b80:	00 
  997b81:	41 c6 46 48 ff       	movb   $0xff,0x48(%r14)
  997b86:	41 88 9e a8 00 00 00 	mov    %bl,0xa8(%r14)
  997b8d:	49 c7 06 ff ff ff ff 	movq   $0xffffffffffffffff,(%r14)
  997b94:	e9 01 09 00 00       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  997b99:	b9 01 00 00 00       	mov    $0x1,%ecx
  997b9e:	4c 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%r14
  997ba5:	00 
  997ba6:	8b 5c 24 64          	mov    0x64(%rsp),%ebx
  997baa:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
  997baf:	48 8b b4 24 30 02 00 	mov    0x230(%rsp),%rsi
  997bb6:	00 
  997bb7:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  997bbe:	0f 85 57 fd ff ff    	jne    99791b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x10b>
  997bc4:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
  997bc9:	89 5c 24 64          	mov    %ebx,0x64(%rsp)
  997bcd:	48 89 f3             	mov    %rsi,%rbx
  997bd0:	48 83 c6 38          	add    $0x38,%rsi
  997bd4:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  997bd9:	e8 a2 9e 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997bde:	48 83 c3 68          	add    $0x68,%rbx
  997be2:	48 89 e7             	mov    %rsp,%rdi
  997be5:	48 89 de             	mov    %rbx,%rsi
  997be8:	e8 93 9e 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997bed:	4c 89 b4 24 d0 00 00 	mov    %r14,0xd0(%rsp)
  997bf4:	00 
  997bf5:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  997bfa:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  997c01:	00 
  997c02:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  997c09:	00 
  997c0a:	0f 29 94 24 90 01 00 	movaps %xmm2,0x190(%rsp)
  997c11:	00 
  997c12:	0f 29 8c 24 80 01 00 	movaps %xmm1,0x180(%rsp)
  997c19:	00 
  997c1a:	0f 29 84 24 70 01 00 	movaps %xmm0,0x170(%rsp)
  997c21:	00 
  997c22:	0f 10 04 24          	movups (%rsp),%xmm0
  997c26:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  997c2b:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  997c30:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  997c37:	00 
  997c38:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  997c3f:	00 
  997c40:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  997c47:	00 
  997c48:	0f b6 84 24 a0 01 00 	movzbl 0x1a0(%rsp),%eax
  997c4f:	00 
  997c50:	0a 84 24 70 01 00 00 	or     0x170(%rsp),%al
  997c57:	75 33                	jne    997c8c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x47c>
  997c59:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  997c60:	00 
  997c61:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  997c68:	00 
  997c69:	ff 15 01 81 35 00    	call   *0x358101(%rip)        # cefd70 <_DYNAMIC+0x678>
  997c6f:	84 c0                	test   %al,%al
  997c71:	7f 19                	jg     997c8c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x47c>
  997c73:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  997c78:	48 c1 e0 04          	shl    $0x4,%rax
  997c7c:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
  997c80:	42 80 7c 25 d0 00    	cmpb   $0x0,-0x30(%rbp,%r12,1)
  997c86:	0f 84 9d 08 00 00    	je     998529 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xd19>
  997c8c:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
  997c91:	49 c1 e7 04          	shl    $0x4,%r15
  997c95:	4f 8d 34 7f          	lea    (%r15,%r15,2),%r14
  997c99:	49 8d 1c 2e          	lea    (%r14,%rbp,1),%rbx
  997c9d:	48 83 c3 d0          	add    $0xffffffffffffffd0,%rbx
  997ca1:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  997ca6:	48 89 de             	mov    %rbx,%rsi
  997ca9:	e8 d2 9d 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997cae:	48 89 6c 24 68       	mov    %rbp,0x68(%rsp)
  997cb3:	48 89 e7             	mov    %rsp,%rdi
  997cb6:	48 89 de             	mov    %rbx,%rsi
  997cb9:	e8 c2 9d 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997cbe:	4b 8d 04 7f          	lea    (%r15,%r15,2),%rax
  997cc2:	48 83 c0 d0          	add    $0xffffffffffffffd0,%rax
  997cc6:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  997ccb:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  997cd2:	00 
  997cd3:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  997cda:	00 
  997cdb:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  997ce2:	00 
  997ce3:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  997cea:	00 
  997ceb:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  997cf2:	00 
  997cf3:	0f 10 04 24          	movups (%rsp),%xmm0
  997cf7:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  997cfc:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  997d01:	0f 29 84 24 10 01 00 	movaps %xmm0,0x110(%rsp)
  997d08:	00 
  997d09:	0f 29 8c 24 20 01 00 	movaps %xmm1,0x120(%rsp)
  997d10:	00 
  997d11:	0f 29 94 24 30 01 00 	movaps %xmm2,0x130(%rsp)
  997d18:	00 
  997d19:	48 85 c0             	test   %rax,%rax
  997d1c:	0f 84 b4 02 00 00    	je     997fd6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x7c6>
  997d22:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
  997d27:	48 83 44 24 68 a0    	addq   $0xffffffffffffffa0,0x68(%rsp)
  997d2d:	0f b6 44 24 64       	movzbl 0x64(%rsp),%eax
  997d32:	89 84 24 d8 00 00 00 	mov    %eax,0xd8(%rsp)
  997d39:	49 89 e4             	mov    %rsp,%r12
  997d3c:	48 8d 9c 24 40 01 00 	lea    0x140(%rsp),%rbx
  997d43:	00 
  997d44:	4c 8d bc 24 58 02 00 	lea    0x258(%rsp),%r15
  997d4b:	00 
  997d4c:	0f 1f 40 00          	nopl   0x0(%rax)
  997d50:	4c 89 e7             	mov    %r12,%rdi
  997d53:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
  997d5a:	00 
  997d5b:	48 8d 94 24 70 01 00 	lea    0x170(%rsp),%rdx
  997d62:	00 
  997d63:	8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%ecx
  997d6a:	e8 a1 34 ff ff       	call   98b210 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic12interval_mul>
  997d6f:	80 3c 24 ff          	cmpb   $0xff,(%rsp)
  997d73:	0f 84 ff 04 00 00    	je     998278 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xa68>
  997d79:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  997d7e:	4a 8d 2c 30          	lea    (%rax,%r14,1),%rbp
  997d82:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  997d87:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
  997d8e:	00 
  997d8f:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  997d94:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
  997d9b:	00 
  997d9c:	0f 10 04 24          	movups (%rsp),%xmm0
  997da0:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  997da5:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  997daa:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  997daf:	0f 29 9c 24 a0 00 00 	movaps %xmm3,0xa0(%rsp)
  997db6:	00 
  997db7:	0f 29 94 24 90 00 00 	movaps %xmm2,0x90(%rsp)
  997dbe:	00 
  997dbf:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
  997dc6:	00 
  997dc7:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
  997dcc:	48 89 df             	mov    %rbx,%rdi
  997dcf:	48 89 ee             	mov    %rbp,%rsi
  997dd2:	e8 a9 9c 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997dd7:	4c 89 ff             	mov    %r15,%rdi
  997dda:	48 89 ee             	mov    %rbp,%rsi
  997ddd:	e8 9e 9c 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997de2:	0f 10 84 24 40 01 00 	movups 0x140(%rsp),%xmm0
  997de9:	00 
  997dea:	0f 10 8c 24 50 01 00 	movups 0x150(%rsp),%xmm1
  997df1:	00 
  997df2:	0f 10 94 24 60 01 00 	movups 0x160(%rsp),%xmm2
  997df9:	00 
  997dfa:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  997dff:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  997e04:	0f 29 04 24          	movaps %xmm0,(%rsp)
  997e08:	0f 10 84 24 58 02 00 	movups 0x258(%rsp),%xmm0
  997e0f:	00 
  997e10:	0f 10 8c 24 68 02 00 	movups 0x268(%rsp),%xmm1
  997e17:	00 
  997e18:	0f 10 94 24 78 02 00 	movups 0x278(%rsp),%xmm2
  997e1f:	00 
  997e20:	41 0f 11 55 20       	movups %xmm2,0x20(%r13)
  997e25:	41 0f 11 4d 10       	movups %xmm1,0x10(%r13)
  997e2a:	41 0f 11 45 00       	movups %xmm0,0x0(%r13)
  997e2f:	0f 28 44 24 70       	movaps 0x70(%rsp),%xmm0
  997e34:	0f 28 8c 24 80 00 00 	movaps 0x80(%rsp),%xmm1
  997e3b:	00 
  997e3c:	0f 28 94 24 90 00 00 	movaps 0x90(%rsp),%xmm2
  997e43:	00 
  997e44:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  997e4b:	00 
  997e4c:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  997e53:	00 
  997e54:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  997e5b:	00 
  997e5c:	4c 89 ff             	mov    %r15,%rdi
  997e5f:	4c 89 e6             	mov    %r12,%rsi
  997e62:	e8 19 9c 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997e67:	48 8d bc 24 88 02 00 	lea    0x288(%rsp),%rdi
  997e6e:	00 
  997e6f:	48 89 de             	mov    %rbx,%rsi
  997e72:	4c 89 fa             	mov    %r15,%rdx
  997e75:	e8 56 3d f0 ff       	call   89bbd0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs1Ga5OsmdBWa_10hypersolve>
  997e7a:	4c 89 ff             	mov    %r15,%rdi
  997e7d:	e8 de ed ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997e82:	48 89 df             	mov    %rbx,%rdi
  997e85:	e8 d6 ed ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997e8a:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
  997e91:	00 
  997e92:	0f 10 00             	movups (%rax),%xmm0
  997e95:	0f 10 48 10          	movups 0x10(%rax),%xmm1
  997e99:	0f 10 50 20          	movups 0x20(%rax),%xmm2
  997e9d:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  997ea4:	00 
  997ea5:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  997eac:	00 
  997ead:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  997eb4:	00 
  997eb5:	4c 89 ff             	mov    %r15,%rdi
  997eb8:	4c 89 ee             	mov    %r13,%rsi
  997ebb:	e8 c0 9b 00 00       	call   9a1a80 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.6388444206278278882>
  997ec0:	48 8d bc 24 b8 02 00 	lea    0x2b8(%rsp),%rdi
  997ec7:	00 
  997ec8:	48 89 de             	mov    %rbx,%rsi
  997ecb:	4c 89 fa             	mov    %r15,%rdx
  997ece:	e8 fd 3c f0 ff       	call   89bbd0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs1Ga5OsmdBWa_10hypersolve>
  997ed3:	4c 89 ff             	mov    %r15,%rdi
  997ed6:	e8 85 ed ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997edb:	48 89 df             	mov    %rbx,%rdi
  997ede:	e8 7d ed ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  997ee3:	0f 10 84 24 88 02 00 	movups 0x288(%rsp),%xmm0
  997eea:	00 
  997eeb:	0f 10 8c 24 98 02 00 	movups 0x298(%rsp),%xmm1
  997ef2:	00 
  997ef3:	0f 10 94 24 a8 02 00 	movups 0x2a8(%rsp),%xmm2
  997efa:	00 
  997efb:	0f 29 84 24 d0 01 00 	movaps %xmm0,0x1d0(%rsp)
  997f02:	00 
  997f03:	0f 29 8c 24 e0 01 00 	movaps %xmm1,0x1e0(%rsp)
  997f0a:	00 
  997f0b:	0f 29 94 24 f0 01 00 	movaps %xmm2,0x1f0(%rsp)
  997f12:	00 
  997f13:	0f 10 84 24 b8 02 00 	movups 0x2b8(%rsp),%xmm0
  997f1a:	00 
  997f1b:	0f 10 8c 24 c8 02 00 	movups 0x2c8(%rsp),%xmm1
  997f22:	00 
  997f23:	0f 10 94 24 d8 02 00 	movups 0x2d8(%rsp),%xmm2
  997f2a:	00 
  997f2b:	48 8d 84 24 00 02 00 	lea    0x200(%rsp),%rax
  997f32:	00 
  997f33:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  997f37:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  997f3b:	0f 11 00             	movups %xmm0,(%rax)
  997f3e:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  997f45:	00 
  997f46:	e8 95 7b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  997f4b:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  997f52:	00 
  997f53:	e8 88 7b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  997f58:	0f 28 84 24 20 02 00 	movaps 0x220(%rsp),%xmm0
  997f5f:	00 
  997f60:	0f 29 84 24 30 01 00 	movaps %xmm0,0x130(%rsp)
  997f67:	00 
  997f68:	0f 28 84 24 10 02 00 	movaps 0x210(%rsp),%xmm0
  997f6f:	00 
  997f70:	0f 29 84 24 20 01 00 	movaps %xmm0,0x120(%rsp)
  997f77:	00 
  997f78:	0f 28 84 24 d0 01 00 	movaps 0x1d0(%rsp),%xmm0
  997f7f:	00 
  997f80:	0f 28 8c 24 e0 01 00 	movaps 0x1e0(%rsp),%xmm1
  997f87:	00 
  997f88:	0f 28 94 24 f0 01 00 	movaps 0x1f0(%rsp),%xmm2
  997f8f:	00 
  997f90:	0f 28 9c 24 00 02 00 	movaps 0x200(%rsp),%xmm3
  997f97:	00 
  997f98:	0f 29 9c 24 10 01 00 	movaps %xmm3,0x110(%rsp)
  997f9f:	00 
  997fa0:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  997fa7:	00 
  997fa8:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  997faf:	00 
  997fb0:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  997fb7:	00 
  997fb8:	4c 89 e7             	mov    %r12,%rdi
  997fbb:	e8 20 7b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  997fc0:	4c 89 ef             	mov    %r13,%rdi
  997fc3:	e8 18 7b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  997fc8:	49 83 c6 d0          	add    $0xffffffffffffffd0,%r14
  997fcc:	49 83 fe 30          	cmp    $0x30,%r14
  997fd0:	0f 85 7a fd ff ff    	jne    997d50 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x540>
  997fd6:	0f b6 84 24 e0 00 00 	movzbl 0xe0(%rsp),%eax
  997fdd:	00 
  997fde:	48 8b 8c 24 e1 00 00 	mov    0xe1(%rsp),%rcx
  997fe5:	00 
  997fe6:	48 89 8c 24 48 02 00 	mov    %rcx,0x248(%rsp)
  997fed:	00 
  997fee:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  997ff5:	00 
  997ff6:	48 89 8c 24 4f 02 00 	mov    %rcx,0x24f(%rsp)
  997ffd:	00 
  997ffe:	4c 8b bc 24 f0 00 00 	mov    0xf0(%rsp),%r15
  998005:	00 
  998006:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  99800d:	00 
  99800e:	0f 28 84 24 00 01 00 	movaps 0x100(%rsp),%xmm0
  998015:	00 
  998016:	0f b6 94 24 10 01 00 	movzbl 0x110(%rsp),%edx
  99801d:	00 
  99801e:	48 8b b4 24 11 01 00 	mov    0x111(%rsp),%rsi
  998025:	00 
  998026:	48 89 b4 24 38 02 00 	mov    %rsi,0x238(%rsp)
  99802d:	00 
  99802e:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
  998035:	00 
  998036:	48 89 b4 24 3f 02 00 	mov    %rsi,0x23f(%rsp)
  99803d:	00 
  99803e:	3c ff                	cmp    $0xff,%al
  998040:	0f 84 4c 02 00 00    	je     998292 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xa82>
  998046:	48 8b 9c 24 20 01 00 	mov    0x120(%rsp),%rbx
  99804d:	00 
  99804e:	48 8b b4 24 28 01 00 	mov    0x128(%rsp),%rsi
  998055:	00 
  998056:	0f 28 8c 24 30 01 00 	movaps 0x130(%rsp),%xmm1
  99805d:	00 
  99805e:	88 44 24 70          	mov    %al,0x70(%rsp)
  998062:	48 8b 84 24 48 02 00 	mov    0x248(%rsp),%rax
  998069:	00 
  99806a:	48 8b bc 24 4f 02 00 	mov    0x24f(%rsp),%rdi
  998071:	00 
  998072:	48 89 44 24 71       	mov    %rax,0x71(%rsp)
  998077:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
  99807c:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
  998083:	00 
  998084:	48 89 8c 24 88 00 00 	mov    %rcx,0x88(%rsp)
  99808b:	00 
  99808c:	0f 11 84 24 90 00 00 	movups %xmm0,0x90(%rsp)
  998093:	00 
  998094:	88 94 24 a0 00 00 00 	mov    %dl,0xa0(%rsp)
  99809b:	48 8b 84 24 38 02 00 	mov    0x238(%rsp),%rax
  9980a2:	00 
  9980a3:	48 8b 8c 24 3f 02 00 	mov    0x23f(%rsp),%rcx
  9980aa:	00 
  9980ab:	48 89 84 24 a1 00 00 	mov    %rax,0xa1(%rsp)
  9980b2:	00 
  9980b3:	48 89 8c 24 a8 00 00 	mov    %rcx,0xa8(%rsp)
  9980ba:	00 
  9980bb:	48 89 9c 24 b0 00 00 	mov    %rbx,0xb0(%rsp)
  9980c2:	00 
  9980c3:	48 89 b4 24 b8 00 00 	mov    %rsi,0xb8(%rsp)
  9980ca:	00 
  9980cb:	0f 11 8c 24 c0 00 00 	movups %xmm1,0xc0(%rsp)
  9980d2:	00 
  9980d3:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  9980da:	00 
  9980db:	e8 00 7a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9980e0:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  9980e7:	00 
  9980e8:	e8 f3 79 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9980ed:	4c 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%r14
  9980f4:	00 
  9980f5:	8b 5c 24 64          	mov    0x64(%rsp),%ebx
  9980f9:	48 89 e7             	mov    %rsp,%rdi
  9980fc:	ff 15 5e 79 35 00    	call   *0x35795e(%rip)        # cefa60 <_DYNAMIC+0x368>
  998102:	0f b6 eb             	movzbl %bl,%ebp
  998105:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  99810a:	48 89 e6             	mov    %rsp,%rsi
  99810d:	89 ea                	mov    %ebp,%edx
  99810f:	e8 5c 7f 00 00       	call   9a0070 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.6388444206278278882>
  998114:	89 c3                	mov    %eax,%ebx
  998116:	80 fb fe             	cmp    $0xfe,%bl
  998119:	0f 85 4b 02 00 00    	jne    99836a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xb5a>
  99811f:	48 89 e7             	mov    %rsp,%rdi
  998122:	e8 b9 79 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998127:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  99812e:	00 
  99812f:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  998134:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  99813b:	00 
  99813c:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  998141:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  998146:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  99814d:	00 
  99814e:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  998155:	00 
  998156:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  99815d:	00 
  99815e:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  998163:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  998168:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  99816d:	0f 29 04 24          	movaps %xmm0,(%rsp)
  998171:	ff 15 19 78 35 00    	call   *0x357819(%rip)        # cef990 <_DYNAMIC+0x298>
  998177:	bf 33 00 00 00       	mov    $0x33,%edi
  99817c:	be 01 00 00 00       	mov    $0x1,%esi
  998181:	ff 15 11 78 35 00    	call   *0x357811(%rip)        # cef998 <_DYNAMIC+0x2a0>
  998187:	48 85 c0             	test   %rax,%rax
  99818a:	0f 84 c4 09 00 00    	je     998b54 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1344>
  998190:	0f 10 05 31 f1 7c ff 	movups -0x830ecf(%rip),%xmm0        # 1672c8 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x3ca>
  998197:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  99819b:	0f 10 05 16 f1 7c ff 	movups -0x830eea(%rip),%xmm0        # 1672b8 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x3ba>
  9981a2:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  9981a6:	0f 10 05 fb f0 7c ff 	movups -0x830f05(%rip),%xmm0        # 1672a8 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x3aa>
  9981ad:	e9 75 02 00 00       	jmp    998427 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc17>
  9981b2:	48 89 e7             	mov    %rsp,%rdi
  9981b5:	e8 26 79 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9981ba:	c6 04 24 ff          	movb   $0xff,(%rsp)
  9981be:	ff 15 cc 77 35 00    	call   *0x3577cc(%rip)        # cef990 <_DYNAMIC+0x298>
  9981c4:	bf 38 00 00 00       	mov    $0x38,%edi
  9981c9:	be 01 00 00 00       	mov    $0x1,%esi
  9981ce:	ff 15 c4 77 35 00    	call   *0x3577c4(%rip)        # cef998 <_DYNAMIC+0x2a0>
  9981d4:	48 85 c0             	test   %rax,%rax
  9981d7:	0f 84 65 09 00 00    	je     998b42 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1332>
  9981dd:	0f 10 05 74 f1 7c ff 	movups -0x830e8c(%rip),%xmm0        # 167358 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x45a>
  9981e4:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  9981e8:	0f 10 05 59 f1 7c ff 	movups -0x830ea7(%rip),%xmm0        # 167348 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x44a>
  9981ef:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  9981f3:	0f 10 05 3e f1 7c ff 	movups -0x830ec2(%rip),%xmm0        # 167338 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x43a>
  9981fa:	0f 11 00             	movups %xmm0,(%rax)
  9981fd:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  998204:	74 6c 79 
  998207:	48 89 48 30          	mov    %rcx,0x30(%rax)
  99820b:	48 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%rcx
  998212:	00 
  998213:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  99821a:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  99821e:	0f 10 04 24          	movups (%rsp),%xmm0
  998222:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  998227:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  99822c:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  998231:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  998235:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  998239:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  99823d:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  998241:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  998246:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  99824d:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  998252:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  998259:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  998260:	48 c7 01 38 00 00 00 	movq   $0x38,(%rcx)
  998267:	48 89 41 08          	mov    %rax,0x8(%rcx)
  99826b:	48 c7 41 10 38 00 00 	movq   $0x38,0x10(%rcx)
  998272:	00 
  998273:	e9 22 02 00 00       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  998278:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  99827f:	00 
  998280:	e8 5b 78 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998285:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  99828c:	00 
  99828d:	e8 4e 78 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998292:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  998299:	00 
  99829a:	e8 41 78 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  99829f:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  9982a6:	00 
  9982a7:	e8 34 78 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9982ac:	c6 04 24 ff          	movb   $0xff,(%rsp)
  9982b0:	ff 15 da 76 35 00    	call   *0x3576da(%rip)        # cef990 <_DYNAMIC+0x298>
  9982b6:	bf 35 00 00 00       	mov    $0x35,%edi
  9982bb:	be 01 00 00 00       	mov    $0x1,%esi
  9982c0:	ff 15 d2 76 35 00    	call   *0x3576d2(%rip)        # cef998 <_DYNAMIC+0x2a0>
  9982c6:	48 85 c0             	test   %rax,%rax
  9982c9:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
  9982d0:	00 
  9982d1:	0f 84 47 08 00 00    	je     998b1e <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x130e>
  9982d7:	0f 10 05 1d f0 7c ff 	movups -0x830fe3(%rip),%xmm0        # 1672fb <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x3fd>
  9982de:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  9982e2:	0f 10 05 02 f0 7c ff 	movups -0x830ffe(%rip),%xmm0        # 1672eb <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x3ed>
  9982e9:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  9982ed:	0f 10 05 e7 ef 7c ff 	movups -0x831019(%rip),%xmm0        # 1672db <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x3dd>
  9982f4:	0f 11 00             	movups %xmm0,(%rax)
  9982f7:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  9982fe:	74 6c 79 
  998301:	48 89 48 2d          	mov    %rcx,0x2d(%rax)
  998305:	c6 82 a9 00 00 00 07 	movb   $0x7,0xa9(%rdx)
  99830c:	c6 42 18 ff          	movb   $0xff,0x18(%rdx)
  998310:	0f 10 04 24          	movups (%rsp),%xmm0
  998314:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  998319:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  99831e:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  998323:	0f 11 42 48          	movups %xmm0,0x48(%rdx)
  998327:	0f 11 4a 58          	movups %xmm1,0x58(%rdx)
  99832b:	0f 11 52 68          	movups %xmm2,0x68(%rdx)
  99832f:	0f 11 5a 78          	movups %xmm3,0x78(%rdx)
  998333:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  998338:	0f 11 82 88 00 00 00 	movups %xmm0,0x88(%rdx)
  99833f:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  998344:	0f 11 82 98 00 00 00 	movups %xmm0,0x98(%rdx)
  99834b:	c6 82 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rdx)
  998352:	48 c7 02 35 00 00 00 	movq   $0x35,(%rdx)
  998359:	48 89 42 08          	mov    %rax,0x8(%rdx)
  99835d:	48 c7 42 10 35 00 00 	movq   $0x35,0x10(%rdx)
  998364:	00 
  998365:	e9 30 01 00 00       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  99836a:	48 89 e7             	mov    %rsp,%rdi
  99836d:	e8 6e 77 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998372:	48 89 e7             	mov    %rsp,%rdi
  998375:	ff 15 e5 76 35 00    	call   *0x3576e5(%rip)        # cefa60 <_DYNAMIC+0x368>
  99837b:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  998382:	00 
  998383:	48 89 e6             	mov    %rsp,%rsi
  998386:	89 ea                	mov    %ebp,%edx
  998388:	e8 e3 7c 00 00       	call   9a0070 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.6388444206278278882>
  99838d:	89 c5                	mov    %eax,%ebp
  99838f:	40 80 fd fe          	cmp    $0xfe,%bpl
  998393:	0f 85 13 01 00 00    	jne    9984ac <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc9c>
  998399:	48 89 e7             	mov    %rsp,%rdi
  99839c:	e8 3f 77 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9983a1:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  9983a8:	00 
  9983a9:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  9983ae:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  9983b5:	00 
  9983b6:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  9983bb:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  9983c0:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  9983c7:	00 
  9983c8:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  9983cf:	00 
  9983d0:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  9983d7:	00 
  9983d8:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  9983dd:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  9983e2:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  9983e7:	0f 29 04 24          	movaps %xmm0,(%rsp)
  9983eb:	ff 15 9f 75 35 00    	call   *0x35759f(%rip)        # cef990 <_DYNAMIC+0x298>
  9983f1:	bf 33 00 00 00       	mov    $0x33,%edi
  9983f6:	be 01 00 00 00       	mov    $0x1,%esi
  9983fb:	ff 15 97 75 35 00    	call   *0x357597(%rip)        # cef998 <_DYNAMIC+0x2a0>
  998401:	48 85 c0             	test   %rax,%rax
  998404:	0f 84 5c 07 00 00    	je     998b66 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1356>
  99840a:	0f 10 05 84 ee 7c ff 	movups -0x83117c(%rip),%xmm0        # 167295 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x397>
  998411:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  998415:	0f 10 05 69 ee 7c ff 	movups -0x831197(%rip),%xmm0        # 167285 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x387>
  99841c:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  998420:	0f 10 05 4e ee 7c ff 	movups -0x8311b2(%rip),%xmm0        # 167275 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x377>
  998427:	0f 11 00             	movups %xmm0,(%rax)
  99842a:	c7 40 2f 7a 65 72 6f 	movl   $0x6f72657a,0x2f(%rax)
  998431:	41 c6 86 a9 00 00 00 	movb   $0x7,0xa9(%r14)
  998438:	07 
  998439:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  99843e:	0f 28 04 24          	movaps (%rsp),%xmm0
  998442:	0f 28 4c 24 10       	movaps 0x10(%rsp),%xmm1
  998447:	0f 28 54 24 20       	movaps 0x20(%rsp),%xmm2
  99844c:	0f 28 5c 24 30       	movaps 0x30(%rsp),%xmm3
  998451:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  998456:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  99845b:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  998460:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  998465:	0f 28 44 24 40       	movaps 0x40(%rsp),%xmm0
  99846a:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  998471:	00 
  998472:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  998477:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  99847e:	00 
  99847f:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  998486:	fe 
  998487:	49 c7 06 33 00 00 00 	movq   $0x33,(%r14)
  99848e:	49 89 46 08          	mov    %rax,0x8(%r14)
  998492:	49 c7 46 10 33 00 00 	movq   $0x33,0x10(%r14)
  998499:	00 
  99849a:	48 81 c4 e8 02 00 00 	add    $0x2e8,%rsp
  9984a1:	5b                   	pop    %rbx
  9984a2:	41 5c                	pop    %r12
  9984a4:	41 5d                	pop    %r13
  9984a6:	41 5e                	pop    %r14
  9984a8:	41 5f                	pop    %r15
  9984aa:	5d                   	pop    %rbp
  9984ab:	c3                   	ret
  9984ac:	48 89 e7             	mov    %rsp,%rdi
  9984af:	e8 2c 76 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9984b4:	80 fb 01             	cmp    $0x1,%bl
  9984b7:	0f 85 b9 00 00 00    	jne    998576 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xd66>
  9984bd:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  9984c4:	00 
  9984c5:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  9984cc:	00 
  9984cd:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  9984d4:	00 
  9984d5:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  9984dc:	00 
  9984dd:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  9984e2:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  9984e9:	00 
  9984ea:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  9984f1:	00 
  9984f2:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  9984f9:	00 
  9984fa:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  9984ff:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  998504:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  998509:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  99850e:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  998513:	66 41 c7 86 a8 00 00 	movw   $0x201,0xa8(%r14)
  99851a:	00 01 02 
  99851d:	49 c7 06 ff ff ff ff 	movq   $0xffffffffffffffff,(%r14)
  998524:	e9 71 ff ff ff       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  998529:	4a 8b 44 25 e0       	mov    -0x20(%rbp,%r12,1),%rax
  99852e:	f0 48 ff 00          	lock incq (%rax)
  998532:	0f 8e 50 06 00 00    	jle    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998538:	4e 8b 7c 25 e0       	mov    -0x20(%rbp,%r12,1),%r15
  99853d:	f0 49 ff 07          	lock incq (%r15)
  998541:	0f 8e 41 06 00 00    	jle    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998547:	4c 89 3c 24          	mov    %r15,(%rsp)
  99854b:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
  998550:	48 83 7c 24 68 01    	cmpq   $0x1,0x68(%rsp)
  998556:	0f 85 1b 01 00 00    	jne    998677 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xe67>
  99855c:	4c 89 fb             	mov    %r15,%rbx
  99855f:	0f 28 05 7a 6e 7a ff 	movaps -0x859186(%rip),%xmm0        # 13f3e0 <anon.1ddced4fb26376f77bd42a01ac8f11b8.45.llvm.16549145706154455763+0x180>
  998566:	31 c0                	xor    %eax,%eax
  998568:	31 c9                	xor    %ecx,%ecx
  99856a:	31 d2                	xor    %edx,%edx
  99856c:	31 f6                	xor    %esi,%esi
  99856e:	0f 28 c8             	movaps %xmm0,%xmm1
  998571:	e9 e8 fa ff ff       	jmp    99805e <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x84e>
  998576:	40 80 fd ff          	cmp    $0xff,%bpl
  99857a:	0f 84 e8 04 00 00    	je     998a68 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1258>
  998580:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  998587:	00 
  998588:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  99858d:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  998594:	00 
  998595:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  99859a:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  99859f:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  9985a6:	00 
  9985a7:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  9985ae:	00 
  9985af:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  9985b6:	00 
  9985b7:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  9985bc:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  9985c1:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  9985c6:	0f 29 04 24          	movaps %xmm0,(%rsp)
  9985ca:	ff 15 c0 73 35 00    	call   *0x3573c0(%rip)        # cef990 <_DYNAMIC+0x298>
  9985d0:	bf 2b 00 00 00       	mov    $0x2b,%edi
  9985d5:	be 01 00 00 00       	mov    $0x1,%esi
  9985da:	ff 15 b8 73 35 00    	call   *0x3573b8(%rip)        # cef998 <_DYNAMIC+0x2a0>
  9985e0:	48 85 c0             	test   %rax,%rax
  9985e3:	0f 84 8f 05 00 00    	je     998b78 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1368>
  9985e9:	0f 10 05 75 ec 7c ff 	movups -0x83138b(%rip),%xmm0        # 167265 <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x367>
  9985f0:	0f 11 40 1b          	movups %xmm0,0x1b(%rax)
  9985f4:	0f 10 05 5f ec 7c ff 	movups -0x8313a1(%rip),%xmm0        # 16725a <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x35c>
  9985fb:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  9985ff:	0f 10 05 44 ec 7c ff 	movups -0x8313bc(%rip),%xmm0        # 16724a <anon.501c3f8f5d047014bdce61b37e107781.161.llvm.6388444206278278882+0x34c>
  998606:	0f 11 00             	movups %xmm0,(%rax)
  998609:	41 c6 86 a9 00 00 00 	movb   $0x4,0xa9(%r14)
  998610:	04 
  998611:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  998616:	0f 28 04 24          	movaps (%rsp),%xmm0
  99861a:	0f 28 4c 24 10       	movaps 0x10(%rsp),%xmm1
  99861f:	0f 28 54 24 20       	movaps 0x20(%rsp),%xmm2
  998624:	0f 28 5c 24 30       	movaps 0x30(%rsp),%xmm3
  998629:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  99862e:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  998633:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  998638:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  99863d:	0f 28 44 24 40       	movaps 0x40(%rsp),%xmm0
  998642:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  998649:	00 
  99864a:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  99864f:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  998656:	00 
  998657:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  99865e:	fe 
  99865f:	49 c7 06 2b 00 00 00 	movq   $0x2b,(%r14)
  998666:	49 89 46 08          	mov    %rax,0x8(%r14)
  99866a:	49 c7 46 10 2b 00 00 	movq   $0x2b,0x10(%r14)
  998671:	00 
  998672:	e9 23 fe ff ff       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  998677:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  99867b:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  998682:	00 
  998683:	4c 89 fb             	mov    %r15,%rbx
  998686:	eb 17                	jmp    99869f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xe8f>
  998688:	4c 89 3c 24          	mov    %r15,(%rsp)
  99868c:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
  998691:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
  998695:	49 83 fc 30          	cmp    $0x30,%r12
  998699:	0f 84 c0 fe ff ff    	je     99855f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xd4f>
  99869f:	42 80 7c 25 a0 00    	cmpb   $0x0,-0x60(%rbp,%r12,1)
  9986a5:	0f 85 29 04 00 00    	jne    998ad4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x12c4>
  9986ab:	41 80 7f 64 00       	cmpb   $0x0,0x64(%r15)
  9986b0:	74 41                	je     9986f3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xee3>
  9986b2:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  9986b9:	00 
  9986ba:	80 78 64 00          	cmpb   $0x0,0x64(%rax)
  9986be:	0f 84 80 00 00 00    	je     998744 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xf34>
  9986c4:	48 89 e7             	mov    %rsp,%rdi
  9986c7:	48 8d b4 24 80 01 00 	lea    0x180(%rsp),%rsi
  9986ce:	00 
  9986cf:	e8 3c 4b f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9986d4:	49 89 c6             	mov    %rax,%r14
  9986d7:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  9986dc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  9986e1:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  9986e8:	00 
  9986e9:	e8 22 4b f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9986ee:	e9 59 02 00 00       	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  9986f3:	80 7b 64 02          	cmpb   $0x2,0x64(%rbx)
  9986f7:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  9986fe:	00 
  9986ff:	0f b6 40 64          	movzbl 0x64(%rax),%eax
  998703:	75 7e                	jne    998783 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xf73>
  998705:	84 c0                	test   %al,%al
  998707:	48 8d 9c 24 80 01 00 	lea    0x180(%rsp),%rbx
  99870e:	00 
  99870f:	0f 84 cf 00 00 00    	je     9987e4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xfd4>
  998715:	48 89 e7             	mov    %rsp,%rdi
  998718:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  99871f:	00 
  998720:	e8 eb 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998725:	49 89 c6             	mov    %rax,%r14
  998728:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  99872d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  998732:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  998739:	00 
  99873a:	e8 d1 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99873f:	e9 08 02 00 00       	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  998744:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  99874b:	00 
  99874c:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  998750:	48 8d b4 24 80 01 00 	lea    0x180(%rsp),%rsi
  998757:	00 
  998758:	75 63                	jne    9987bd <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xfad>
  99875a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  99875f:	e8 ac 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998764:	49 89 c6             	mov    %rax,%r14
  998767:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  99876c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  998771:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  998778:	00 
  998779:	e8 92 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99877e:	e9 c9 01 00 00       	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  998783:	84 c0                	test   %al,%al
  998785:	48 8d 9c 24 80 01 00 	lea    0x180(%rsp),%rbx
  99878c:	00 
  99878d:	0f 84 3f 01 00 00    	je     9988d2 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x10c2>
  998793:	48 89 e7             	mov    %rsp,%rdi
  998796:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  99879d:	00 
  99879e:	e8 6d 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987a3:	49 89 c6             	mov    %rax,%r14
  9987a6:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  9987ab:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  9987b0:	48 89 de             	mov    %rbx,%rsi
  9987b3:	e8 58 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987b8:	e9 8f 01 00 00       	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  9987bd:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  9987c2:	e8 49 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987c7:	49 89 c6             	mov    %rax,%r14
  9987ca:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  9987cf:	48 89 e7             	mov    %rsp,%rdi
  9987d2:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  9987d9:	00 
  9987da:	e8 31 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9987df:	e9 68 01 00 00       	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  9987e4:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  9987eb:	00 
  9987ec:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  9987f0:	0f 85 0f 01 00 00    	jne    998905 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x10f5>
  9987f6:	48 89 e7             	mov    %rsp,%rdi
  9987f9:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  998800:	00 
  998801:	e8 0a 4a f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998806:	48 89 84 24 40 01 00 	mov    %rax,0x140(%rsp)
  99880d:	00 
  99880e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  998813:	48 89 de             	mov    %rbx,%rsi
  998816:	e8 f5 49 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99881b:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
  998822:	00 
  998823:	48 89 e7             	mov    %rsp,%rdi
  998826:	48 89 de             	mov    %rbx,%rsi
  998829:	e8 e2 49 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99882e:	48 8d 9c 24 40 01 00 	lea    0x140(%rsp),%rbx
  998835:	00 
  998836:	4c 8d b4 24 58 02 00 	lea    0x258(%rsp),%r14
  99883d:	00 
  99883e:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  998845:	00 
  998846:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  99884b:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  998852:	00 
  998853:	e8 b8 49 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998858:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
  99885f:	00 
  998860:	48 89 df             	mov    %rbx,%rdi
  998863:	4c 89 f6             	mov    %r14,%rsi
  998866:	4c 8b 2d 03 75 35 00 	mov    0x357503(%rip),%r13        # cefd70 <_DYNAMIC+0x678>
  99886d:	41 ff d5             	call   *%r13
  998870:	3c fe                	cmp    $0xfe,%al
  998872:	0f 94 c1             	sete   %cl
  998875:	84 c0                	test   %al,%al
  998877:	41 0f 9f c7          	setg   %r15b
  99887b:	41 08 cf             	or     %cl,%r15b
  99887e:	49 0f 45 de          	cmovne %r14,%rbx
  998882:	4c 8b 33             	mov    (%rbx),%r14
  998885:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
  99888a:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  998891:	00 
  998892:	48 8d b4 24 d0 01 00 	lea    0x1d0(%rsp),%rsi
  998899:	00 
  99889a:	41 ff d5             	call   *%r13
  99889d:	84 c0                	test   %al,%al
  99889f:	0f 88 50 01 00 00    	js     9989f5 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x11e5>
  9988a5:	4c 8b ac 24 e0 00 00 	mov    0xe0(%rsp),%r13
  9988ac:	00 
  9988ad:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
  9988b4:	00 
  9988b5:	f0 48 ff 08          	lock decq (%rax)
  9988b9:	0f 85 5a 01 00 00    	jne    998a19 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1209>
  9988bf:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  9988c6:	00 
  9988c7:	ff 15 8b 70 35 00    	call   *0x35708b(%rip)        # cef958 <_DYNAMIC+0x260>
  9988cd:	e9 47 01 00 00       	jmp    998a19 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1209>
  9988d2:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  9988d9:	00 
  9988da:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  9988de:	75 47                	jne    998927 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1117>
  9988e0:	48 89 e7             	mov    %rsp,%rdi
  9988e3:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  9988ea:	00 
  9988eb:	e8 20 49 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  9988f0:	49 89 c6             	mov    %rax,%r14
  9988f3:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  9988f8:	48 89 e7             	mov    %rsp,%rdi
  9988fb:	48 89 de             	mov    %rbx,%rsi
  9988fe:	e8 0d 49 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998903:	eb 47                	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  998905:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  99890a:	48 89 de             	mov    %rbx,%rsi
  99890d:	e8 fe 48 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998912:	49 89 c6             	mov    %rax,%r14
  998915:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  99891a:	48 89 e7             	mov    %rsp,%rdi
  99891d:	48 89 de             	mov    %rbx,%rsi
  998920:	e8 eb 48 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998925:	eb 25                	jmp    99894c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113c>
  998927:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  99892c:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  998933:	00 
  998934:	e8 d7 48 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  998939:	49 89 c6             	mov    %rax,%r14
  99893c:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  998941:	48 89 e7             	mov    %rsp,%rdi
  998944:	48 89 de             	mov    %rbx,%rsi
  998947:	e8 c4 48 f4 ff       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  99894c:	49 89 c5             	mov    %rax,%r13
  99894f:	48 8b 04 24          	mov    (%rsp),%rax
  998953:	f0 48 ff 08          	lock decq (%rax)
  998957:	75 09                	jne    998962 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1152>
  998959:	48 89 e7             	mov    %rsp,%rdi
  99895c:	ff 15 f6 6f 35 00    	call   *0x356ff6(%rip)        # cef958 <_DYNAMIC+0x260>
  998962:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  998967:	f0 48 ff 08          	lock decq (%rax)
  99896b:	75 0b                	jne    998978 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1168>
  99896d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  998972:	ff 15 e0 6f 35 00    	call   *0x356fe0(%rip)        # cef958 <_DYNAMIC+0x260>
  998978:	48 8b 84 24 d8 00 00 	mov    0xd8(%rsp),%rax
  99897f:	00 
  998980:	4a 8d 1c 20          	lea    (%rax,%r12,1),%rbx
  998984:	4c 89 34 24          	mov    %r14,(%rsp)
  998988:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
  99898d:	4c 89 ac 24 e0 00 00 	mov    %r13,0xe0(%rsp)
  998994:	00 
  998995:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
  99899a:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  99899f:	48 89 de             	mov    %rbx,%rsi
  9989a2:	ff 15 48 79 35 00    	call   *0x357948(%rip)        # cf02f0 <_DYNAMIC+0xbf8>
  9989a8:	49 89 c7             	mov    %rax,%r15
  9989ab:	f0 49 ff 0e          	lock decq (%r14)
  9989af:	75 0b                	jne    9989bc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x11ac>
  9989b1:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9989b6:	ff 15 9c 6f 35 00    	call   *0x356f9c(%rip)        # cef958 <_DYNAMIC+0x260>
  9989bc:	4c 89 bc 24 d0 01 00 	mov    %r15,0x1d0(%rsp)
  9989c3:	00 
  9989c4:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
  9989c9:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9989ce:	48 89 de             	mov    %rbx,%rsi
  9989d1:	ff 15 19 79 35 00    	call   *0x357919(%rip)        # cf02f0 <_DYNAMIC+0xbf8>
  9989d7:	48 89 c3             	mov    %rax,%rbx
  9989da:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  9989df:	0f 85 a3 fc ff ff    	jne    998688 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xe78>
  9989e5:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9989ea:	ff 15 68 6f 35 00    	call   *0x356f68(%rip)        # cef958 <_DYNAMIC+0x260>
  9989f0:	e9 93 fc ff ff       	jmp    998688 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xe78>
  9989f5:	4c 8b ac 24 d0 01 00 	mov    0x1d0(%rsp),%r13
  9989fc:	00 
  9989fd:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  998a04:	00 
  998a05:	f0 48 ff 08          	lock decq (%rax)
  998a09:	75 0e                	jne    998a19 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1209>
  998a0b:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  998a12:	00 
  998a13:	ff 15 3f 6f 35 00    	call   *0x356f3f(%rip)        # cef958 <_DYNAMIC+0x260>
  998a19:	45 84 ff             	test   %r15b,%r15b
  998a1c:	74 25                	je     998a43 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1233>
  998a1e:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  998a25:	00 
  998a26:	f0 48 ff 08          	lock decq (%rax)
  998a2a:	0f 85 1f ff ff ff    	jne    99894f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113f>
  998a30:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  998a37:	00 
  998a38:	ff 15 1a 6f 35 00    	call   *0x356f1a(%rip)        # cef958 <_DYNAMIC+0x260>
  998a3e:	e9 0c ff ff ff       	jmp    99894f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113f>
  998a43:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
  998a4a:	00 
  998a4b:	f0 48 ff 08          	lock decq (%rax)
  998a4f:	0f 85 fa fe ff ff    	jne    99894f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113f>
  998a55:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  998a5c:	00 
  998a5d:	ff 15 f5 6e 35 00    	call   *0x356ef5(%rip)        # cef958 <_DYNAMIC+0x260>
  998a63:	e9 e7 fe ff ff       	jmp    99894f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x113f>
  998a68:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  998a6f:	00 
  998a70:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  998a77:	00 
  998a78:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  998a7f:	00 
  998a80:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  998a87:	00 
  998a88:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  998a8d:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  998a94:	00 
  998a95:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  998a9c:	00 
  998a9d:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  998aa4:	00 
  998aa5:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  998aaa:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  998aaf:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  998ab4:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  998ab9:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  998abe:	66 41 c7 86 a8 00 00 	movw   $0x3ff,0xa8(%r14)
  998ac5:	00 ff 03 
  998ac8:	49 c7 06 ff ff ff ff 	movq   $0xffffffffffffffff,(%r14)
  998acf:	e9 c6 f9 ff ff       	jmp    99849a <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0xc8a>
  998ad4:	48 89 e7             	mov    %rsp,%rdi
  998ad7:	e8 94 6f fe ff       	call   97fa70 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  998adc:	e9 ab f1 ff ff       	jmp    997c8c <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x47c>
  998ae1:	48 89 ca             	mov    %rcx,%rdx
  998ae4:	48 8d 0d 4d a2 31 00 	lea    0x31a24d(%rip),%rcx        # cb2d38 <anon.501c3f8f5d047014bdce61b37e107781.110.llvm.6388444206278278882+0x68>
  998aeb:	31 ff                	xor    %edi,%edi
  998aed:	48 89 de             	mov    %rbx,%rsi
  998af0:	ff 15 52 71 35 00    	call   *0x357152(%rip)        # cefc48 <_DYNAMIC+0x550>
  998af6:	48 ff cb             	dec    %rbx
  998af9:	48 8d 15 20 a2 31 00 	lea    0x31a220(%rip),%rdx        # cb2d20 <anon.501c3f8f5d047014bdce61b37e107781.110.llvm.6388444206278278882+0x50>
  998b00:	48 89 df             	mov    %rbx,%rdi
  998b03:	48 89 ce             	mov    %rcx,%rsi
  998b06:	ff 15 c4 6f 35 00    	call   *0x356fc4(%rip)        # cefad0 <_DYNAMIC+0x3d8>
  998b0c:	bf 01 00 00 00       	mov    $0x1,%edi
  998b11:	be 37 00 00 00       	mov    $0x37,%esi
  998b16:	ff 15 e4 6e 35 00    	call   *0x356ee4(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b1c:	eb 6a                	jmp    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998b1e:	bf 01 00 00 00       	mov    $0x1,%edi
  998b23:	be 35 00 00 00       	mov    $0x35,%esi
  998b28:	ff 15 d2 6e 35 00    	call   *0x356ed2(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b2e:	eb 58                	jmp    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998b30:	bf 01 00 00 00       	mov    $0x1,%edi
  998b35:	be 28 00 00 00       	mov    $0x28,%esi
  998b3a:	ff 15 c0 6e 35 00    	call   *0x356ec0(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b40:	eb 46                	jmp    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998b42:	bf 01 00 00 00       	mov    $0x1,%edi
  998b47:	be 38 00 00 00       	mov    $0x38,%esi
  998b4c:	ff 15 ae 6e 35 00    	call   *0x356eae(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b52:	eb 34                	jmp    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998b54:	bf 01 00 00 00       	mov    $0x1,%edi
  998b59:	be 33 00 00 00       	mov    $0x33,%esi
  998b5e:	ff 15 9c 6e 35 00    	call   *0x356e9c(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b64:	eb 22                	jmp    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998b66:	bf 01 00 00 00       	mov    $0x1,%edi
  998b6b:	be 33 00 00 00       	mov    $0x33,%esi
  998b70:	ff 15 8a 6e 35 00    	call   *0x356e8a(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b76:	eb 10                	jmp    998b88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1378>
  998b78:	bf 01 00 00 00       	mov    $0x1,%edi
  998b7d:	be 2b 00 00 00       	mov    $0x2b,%esi
  998b82:	ff 15 78 6e 35 00    	call   *0x356e78(%rip)        # cefa00 <_DYNAMIC+0x308>
  998b88:	0f 0b                	ud2
  998b8a:	48 89 c3             	mov    %rax,%rbx
  998b8d:	45 84 ff             	test   %r15b,%r15b
  998b90:	0f 85 b2 00 00 00    	jne    998c48 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1438>
  998b96:	eb 0c                	jmp    998ba4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1394>
  998b98:	48 89 c3             	mov    %rax,%rbx
  998b9b:	45 84 ff             	test   %r15b,%r15b
  998b9e:	0f 85 a4 00 00 00    	jne    998c48 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1438>
  998ba4:	45 31 ff             	xor    %r15d,%r15d
  998ba7:	eb 76                	jmp    998c1f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x140f>
  998ba9:	48 89 c3             	mov    %rax,%rbx
  998bac:	44 89 fd             	mov    %r15d,%ebp
  998baf:	40 80 f5 01          	xor    $0x1,%bpl
  998bb3:	f0 49 ff 0e          	lock decq (%r14)
  998bb7:	75 16                	jne    998bcf <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x13bf>
  998bb9:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998bbe:	ff 15 94 6d 35 00    	call   *0x356d94(%rip)        # cef958 <_DYNAMIC+0x260>
  998bc4:	eb 09                	jmp    998bcf <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x13bf>
  998bc6:	48 89 c3             	mov    %rax,%rbx
  998bc9:	41 b7 01             	mov    $0x1,%r15b
  998bcc:	40 b5 01             	mov    $0x1,%bpl
  998bcf:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
  998bd6:	00 
  998bd7:	f0 48 ff 08          	lock decq (%rax)
  998bdb:	75 19                	jne    998bf6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x13e6>
  998bdd:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  998be4:	00 
  998be5:	ff 15 6d 6d 35 00    	call   *0x356d6d(%rip)        # cef958 <_DYNAMIC+0x260>
  998beb:	eb 09                	jmp    998bf6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x13e6>
  998bed:	48 89 c3             	mov    %rax,%rbx
  998bf0:	40 b5 01             	mov    $0x1,%bpl
  998bf3:	41 b7 01             	mov    $0x1,%r15b
  998bf6:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  998bfd:	00 
  998bfe:	f0 48 ff 08          	lock decq (%rax)
  998c02:	75 0e                	jne    998c12 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1402>
  998c04:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  998c0b:	00 
  998c0c:	ff 15 46 6d 35 00    	call   *0x356d46(%rip)        # cef958 <_DYNAMIC+0x260>
  998c12:	40 84 ed             	test   %bpl,%bpl
  998c15:	75 08                	jne    998c1f <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x140f>
  998c17:	eb 22                	jmp    998c3b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x142b>
  998c19:	48 89 c3             	mov    %rax,%rbx
  998c1c:	41 b7 01             	mov    $0x1,%r15b
  998c1f:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
  998c26:	00 
  998c27:	f0 48 ff 08          	lock decq (%rax)
  998c2b:	75 0e                	jne    998c3b <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x142b>
  998c2d:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  998c34:	00 
  998c35:	ff 15 1d 6d 35 00    	call   *0x356d1d(%rip)        # cef958 <_DYNAMIC+0x260>
  998c3b:	45 84 ff             	test   %r15b,%r15b
  998c3e:	75 08                	jne    998c48 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1438>
  998c40:	e9 b7 02 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998c45:	48 89 c3             	mov    %rax,%rbx
  998c48:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  998c4f:	00 
  998c50:	f0 48 ff 08          	lock decq (%rax)
  998c54:	0f 85 a2 02 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998c5a:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  998c61:	00 
  998c62:	ff 15 f0 6c 35 00    	call   *0x356cf0(%rip)        # cef958 <_DYNAMIC+0x260>
  998c68:	e9 8f 02 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998c6d:	48 89 c3             	mov    %rax,%rbx
  998c70:	f0 49 ff 0e          	lock decq (%r14)
  998c74:	0f 85 82 02 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998c7a:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998c7f:	ff 15 d3 6c 35 00    	call   *0x356cd3(%rip)        # cef958 <_DYNAMIC+0x260>
  998c85:	e9 72 02 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998c8a:	48 89 c3             	mov    %rax,%rbx
  998c8d:	f0 49 ff 0e          	lock decq (%r14)
  998c91:	0f 85 65 02 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998c97:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998c9c:	ff 15 b6 6c 35 00    	call   *0x356cb6(%rip)        # cef958 <_DYNAMIC+0x260>
  998ca2:	e9 55 02 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998ca7:	48 89 c3             	mov    %rax,%rbx
  998caa:	f0 49 ff 0e          	lock decq (%r14)
  998cae:	0f 85 48 02 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998cb4:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998cb9:	ff 15 99 6c 35 00    	call   *0x356c99(%rip)        # cef958 <_DYNAMIC+0x260>
  998cbf:	e9 38 02 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998cc4:	48 89 c3             	mov    %rax,%rbx
  998cc7:	48 89 e7             	mov    %rsp,%rdi
  998cca:	e8 e1 4c fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998ccf:	e9 3f 04 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998cd4:	48 89 c3             	mov    %rax,%rbx
  998cd7:	f0 49 ff 0e          	lock decq (%r14)
  998cdb:	0f 85 1b 02 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998ce1:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998ce6:	ff 15 6c 6c 35 00    	call   *0x356c6c(%rip)        # cef958 <_DYNAMIC+0x260>
  998cec:	e9 0b 02 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998cf1:	48 89 c3             	mov    %rax,%rbx
  998cf4:	f0 49 ff 0e          	lock decq (%r14)
  998cf8:	0f 85 fe 01 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998cfe:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998d03:	ff 15 4f 6c 35 00    	call   *0x356c4f(%rip)        # cef958 <_DYNAMIC+0x260>
  998d09:	e9 ee 01 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d0e:	48 89 c3             	mov    %rax,%rbx
  998d11:	f0 49 ff 0e          	lock decq (%r14)
  998d15:	0f 85 e1 01 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d1b:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998d20:	ff 15 32 6c 35 00    	call   *0x356c32(%rip)        # cef958 <_DYNAMIC+0x260>
  998d26:	e9 d1 01 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d2b:	48 89 c3             	mov    %rax,%rbx
  998d2e:	f0 49 ff 0e          	lock decq (%r14)
  998d32:	0f 85 c4 01 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d38:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998d3d:	ff 15 15 6c 35 00    	call   *0x356c15(%rip)        # cef958 <_DYNAMIC+0x260>
  998d43:	e9 b4 01 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d48:	48 89 c3             	mov    %rax,%rbx
  998d4b:	48 89 e7             	mov    %rsp,%rdi
  998d4e:	e8 5d 4c fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998d53:	e9 bb 03 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998d58:	48 89 c3             	mov    %rax,%rbx
  998d5b:	f0 49 ff 0e          	lock decq (%r14)
  998d5f:	0f 85 97 01 00 00    	jne    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d65:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998d6a:	ff 15 e8 6b 35 00    	call   *0x356be8(%rip)        # cef958 <_DYNAMIC+0x260>
  998d70:	e9 87 01 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998d75:	ff 15 cd 6b 35 00    	call   *0x356bcd(%rip)        # cef948 <_DYNAMIC+0x250>
  998d7b:	48 89 c3             	mov    %rax,%rbx
  998d7e:	48 89 e7             	mov    %rsp,%rdi
  998d81:	e8 5a 6d fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998d86:	e9 d6 01 00 00       	jmp    998f61 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1751>
  998d8b:	48 89 c3             	mov    %rax,%rbx
  998d8e:	48 89 e7             	mov    %rsp,%rdi
  998d91:	e8 1a 4c fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998d96:	e9 78 03 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998d9b:	48 89 c3             	mov    %rax,%rbx
  998d9e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  998da3:	f0 48 ff 08          	lock decq (%rax)
  998da7:	75 1e                	jne    998dc7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x15b7>
  998da9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  998dae:	ff 15 a4 6b 35 00    	call   *0x356ba4(%rip)        # cef958 <_DYNAMIC+0x260>
  998db4:	eb 11                	jmp    998dc7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x15b7>
  998db6:	ff 15 8c 6b 35 00    	call   *0x356b8c(%rip)        # cef948 <_DYNAMIC+0x250>
  998dbc:	48 89 c3             	mov    %rax,%rbx
  998dbf:	e9 d3 00 00 00       	jmp    998e97 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1687>
  998dc4:	48 89 c3             	mov    %rax,%rbx
  998dc7:	4c 89 34 24          	mov    %r14,(%rsp)
  998dcb:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
  998dd0:	e9 27 01 00 00       	jmp    998efc <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16ec>
  998dd5:	48 89 c3             	mov    %rax,%rbx
  998dd8:	e9 f3 00 00 00       	jmp    998ed0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16c0>
  998ddd:	48 89 c3             	mov    %rax,%rbx
  998de0:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  998de7:	00 
  998de8:	e8 f3 6c fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998ded:	e9 14 03 00 00       	jmp    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998df2:	ff 15 50 6b 35 00    	call   *0x356b50(%rip)        # cef948 <_DYNAMIC+0x250>
  998df8:	48 89 c3             	mov    %rax,%rbx
  998dfb:	48 89 e7             	mov    %rsp,%rdi
  998dfe:	e8 ad 4b fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998e03:	e9 0b 03 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998e08:	48 89 c3             	mov    %rax,%rbx
  998e0b:	48 89 e7             	mov    %rsp,%rdi
  998e0e:	e8 cd 6c fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998e13:	e9 49 01 00 00       	jmp    998f61 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1751>
  998e18:	48 89 c3             	mov    %rax,%rbx
  998e1b:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  998e22:	00 
  998e23:	e8 b8 6c fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998e28:	e9 34 01 00 00       	jmp    998f61 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1751>
  998e2d:	ff 15 15 6b 35 00    	call   *0x356b15(%rip)        # cef948 <_DYNAMIC+0x250>
  998e33:	48 89 c3             	mov    %rax,%rbx
  998e36:	48 89 e7             	mov    %rsp,%rdi
  998e39:	e8 72 4b fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998e3e:	80 7c 24 70 ff       	cmpb   $0xff,0x70(%rsp)
  998e43:	0f 84 ca 02 00 00    	je     999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998e49:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998e4e:	e8 8d 6c fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998e53:	e9 bb 02 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998e58:	48 89 c3             	mov    %rax,%rbx
  998e5b:	48 89 e7             	mov    %rsp,%rdi
  998e5e:	e8 4d 4b fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998e63:	e9 ab 02 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998e68:	48 89 c3             	mov    %rax,%rbx
  998e6b:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  998e72:	00 
  998e73:	e8 68 6c fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998e78:	e9 96 02 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998e7d:	ff 15 c5 6a 35 00    	call   *0x356ac5(%rip)        # cef948 <_DYNAMIC+0x250>
  998e83:	48 89 c3             	mov    %rax,%rbx
  998e86:	f0 49 ff 0e          	lock decq (%r14)
  998e8a:	75 0b                	jne    998e97 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1687>
  998e8c:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998e91:	ff 15 c1 6a 35 00    	call   *0x356ac1(%rip)        # cef958 <_DYNAMIC+0x260>
  998e97:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  998e9c:	0f 85 64 02 00 00    	jne    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998ea2:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  998ea9:	00 
  998eaa:	ff 15 a8 6a 35 00    	call   *0x356aa8(%rip)        # cef958 <_DYNAMIC+0x260>
  998eb0:	e9 51 02 00 00       	jmp    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998eb5:	ff 15 8d 6a 35 00    	call   *0x356a8d(%rip)        # cef948 <_DYNAMIC+0x250>
  998ebb:	48 89 c3             	mov    %rax,%rbx
  998ebe:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  998ec3:	75 0b                	jne    998ed0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x16c0>
  998ec5:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998eca:	ff 15 88 6a 35 00    	call   *0x356a88(%rip)        # cef958 <_DYNAMIC+0x260>
  998ed0:	f0 49 ff 0f          	lock decq (%r15)
  998ed4:	0f 85 2c 02 00 00    	jne    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998eda:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  998ee1:	00 
  998ee2:	ff 15 70 6a 35 00    	call   *0x356a70(%rip)        # cef958 <_DYNAMIC+0x260>
  998ee8:	e9 19 02 00 00       	jmp    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998eed:	ff 15 55 6a 35 00    	call   *0x356a55(%rip)        # cef948 <_DYNAMIC+0x250>
  998ef3:	ff 15 4f 6a 35 00    	call   *0x356a4f(%rip)        # cef948 <_DYNAMIC+0x250>
  998ef9:	48 89 c3             	mov    %rax,%rbx
  998efc:	48 89 e7             	mov    %rsp,%rdi
  998eff:	e8 6c 6b fe ff       	call   97fa70 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  998f04:	e9 fd 01 00 00       	jmp    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998f09:	ff 15 39 6a 35 00    	call   *0x356a39(%rip)        # cef948 <_DYNAMIC+0x250>
  998f0f:	48 89 c3             	mov    %rax,%rbx
  998f12:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998f17:	e8 c4 6b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998f1c:	e9 e5 01 00 00       	jmp    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998f21:	48 89 c3             	mov    %rax,%rbx
  998f24:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998f29:	e8 b2 6b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998f2e:	e9 e0 01 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998f33:	48 89 c3             	mov    %rax,%rbx
  998f36:	48 89 e7             	mov    %rsp,%rdi
  998f39:	e8 a2 6b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998f3e:	eb 33                	jmp    998f73 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1763>
  998f40:	ff 15 02 6a 35 00    	call   *0x356a02(%rip)        # cef948 <_DYNAMIC+0x250>
  998f46:	48 89 c3             	mov    %rax,%rbx
  998f49:	48 89 e7             	mov    %rsp,%rdi
  998f4c:	e8 5f 4a fe ff       	call   97d9b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.6388444206278278882>
  998f51:	e9 bd 01 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998f56:	48 89 c3             	mov    %rax,%rbx
  998f59:	e9 a8 01 00 00       	jmp    999106 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18f6>
  998f5e:	48 89 c3             	mov    %rax,%rbx
  998f61:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998f66:	e8 45 67 fe ff       	call   97f6b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  998f6b:	e9 a3 01 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998f70:	48 89 c3             	mov    %rax,%rbx
  998f73:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  998f7a:	00 
  998f7b:	e8 60 6b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998f80:	e9 8e 01 00 00       	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  998f85:	48 89 c3             	mov    %rax,%rbx
  998f88:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  998f8f:	00 
  998f90:	e8 4b 6b fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998f95:	eb 39                	jmp    998fd0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x17c0>
  998f97:	48 89 c3             	mov    %rax,%rbx
  998f9a:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  998fa1:	00 
  998fa2:	e8 b9 dc ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  998fa7:	eb 4b                	jmp    998ff4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x17e4>
  998fa9:	48 89 c3             	mov    %rax,%rbx
  998fac:	eb 53                	jmp    999001 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x17f1>
  998fae:	48 89 c3             	mov    %rax,%rbx
  998fb1:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  998fb8:	00 
  998fb9:	e8 a2 dc ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  998fbe:	eb 68                	jmp    999028 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1818>
  998fc0:	48 89 c3             	mov    %rax,%rbx
  998fc3:	eb 70                	jmp    999035 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1825>
  998fc5:	48 89 c3             	mov    %rax,%rbx
  998fc8:	e9 87 00 00 00       	jmp    999054 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1844>
  998fcd:	48 89 c3             	mov    %rax,%rbx
  998fd0:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  998fd5:	e8 d6 66 fe ff       	call   97f6b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  998fda:	e9 1a 01 00 00       	jmp    9990f9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18e9>
  998fdf:	48 89 c3             	mov    %rax,%rbx
  998fe2:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  998fe9:	00 
  998fea:	e8 f1 6a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  998fef:	eb 10                	jmp    999001 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x17f1>
  998ff1:	48 89 c3             	mov    %rax,%rbx
  998ff4:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  998ffb:	00 
  998ffc:	e8 5f dc ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  999001:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  999008:	00 
  999009:	e8 d2 6a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  99900e:	e9 a1 00 00 00       	jmp    9990b4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18a4>
  999013:	48 89 c3             	mov    %rax,%rbx
  999016:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  99901d:	00 
  99901e:	e8 bd 6a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  999023:	eb 10                	jmp    999035 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1825>
  999025:	48 89 c3             	mov    %rax,%rbx
  999028:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  99902f:	00 
  999030:	e8 2b dc ee ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  999035:	48 8d bc 24 88 02 00 	lea    0x288(%rsp),%rdi
  99903c:	00 
  99903d:	e8 9e 6a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  999042:	eb 70                	jmp    9990b4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18a4>
  999044:	48 89 c3             	mov    %rax,%rbx
  999047:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  99904e:	00 
  99904f:	e8 8c 6a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  999054:	0f 28 84 24 20 02 00 	movaps 0x220(%rsp),%xmm0
  99905b:	00 
  99905c:	0f 29 84 24 30 01 00 	movaps %xmm0,0x130(%rsp)
  999063:	00 
  999064:	0f 28 84 24 10 02 00 	movaps 0x210(%rsp),%xmm0
  99906b:	00 
  99906c:	0f 29 84 24 20 01 00 	movaps %xmm0,0x120(%rsp)
  999073:	00 
  999074:	0f 28 84 24 d0 01 00 	movaps 0x1d0(%rsp),%xmm0
  99907b:	00 
  99907c:	0f 28 8c 24 e0 01 00 	movaps 0x1e0(%rsp),%xmm1
  999083:	00 
  999084:	0f 28 94 24 f0 01 00 	movaps 0x1f0(%rsp),%xmm2
  99908b:	00 
  99908c:	0f 28 9c 24 00 02 00 	movaps 0x200(%rsp),%xmm3
  999093:	00 
  999094:	0f 29 9c 24 10 01 00 	movaps %xmm3,0x110(%rsp)
  99909b:	00 
  99909c:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  9990a3:	00 
  9990a4:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  9990ab:	00 
  9990ac:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  9990b3:	00 
  9990b4:	48 89 e7             	mov    %rsp,%rdi
  9990b7:	e8 f4 65 fe ff       	call   97f6b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  9990bc:	eb 3b                	jmp    9990f9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18e9>
  9990be:	ff 15 84 68 35 00    	call   *0x356884(%rip)        # cef948 <_DYNAMIC+0x250>
  9990c4:	48 89 c3             	mov    %rax,%rbx
  9990c7:	4c 89 ef             	mov    %r13,%rdi
  9990ca:	e8 11 6a fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9990cf:	eb 28                	jmp    9990f9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x18e9>
  9990d1:	ff 15 71 68 35 00    	call   *0x356871(%rip)        # cef948 <_DYNAMIC+0x250>
  9990d7:	ff 15 6b 68 35 00    	call   *0x35686b(%rip)        # cef948 <_DYNAMIC+0x250>
  9990dd:	ff 15 65 68 35 00    	call   *0x356865(%rip)        # cef948 <_DYNAMIC+0x250>
  9990e3:	48 89 c3             	mov    %rax,%rbx
  9990e6:	48 89 e7             	mov    %rsp,%rdi
  9990e9:	e8 f2 69 fe ff       	call   97fae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.6388444206278278882>
  9990ee:	eb 23                	jmp    999113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.6388444206278278882+0x1903>
  9990f0:	ff 15 52 68 35 00    	call   *0x356852(%rip)        # cef948 <_DYNAMIC+0x250>
  9990f6:	48 89 c3             	mov    %rax,%rbx
  9990f9:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  999100:	00 
  999101:	e8 aa 65 fe ff       	call   97f6b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  999106:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  99910d:	00 
  99910e:	e8 9d 65 fe ff       	call   97f6b0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs1Ga5OsmdBWa_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  999113:	48 89 df             	mov    %rbx,%rdi
  999116:	e8 45 87 30 00       	call   ca1860 <_Unwind_Resume@plt>
  99911b:	ff 15 27 68 35 00    	call   *0x356827(%rip)        # cef948 <_DYNAMIC+0x250>
  999121:	ff 15 21 68 35 00    	call   *0x356821(%rip)        # cef948 <_DYNAMIC+0x250>
  999127:	ff 15 1b 68 35 00    	call   *0x35681b(%rip)        # cef948 <_DYNAMIC+0x250>
