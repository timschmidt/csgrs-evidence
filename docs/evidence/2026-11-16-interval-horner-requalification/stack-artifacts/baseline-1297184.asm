
/tmp/interval-refactor/horner-current/stack-artifacts/baseline:     file format elf64-x86-64


Disassembly of section .text:

000000000013cb20 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership>:
  13cb20:	55                   	push   %rbp
  13cb21:	41 57                	push   %r15
  13cb23:	41 56                	push   %r14
  13cb25:	41 55                	push   %r13
  13cb27:	41 54                	push   %r12
  13cb29:	53                   	push   %rbx
  13cb2a:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
  13cb31:	44 89 cd             	mov    %r9d,%ebp
  13cb34:	45 89 c4             	mov    %r8d,%r12d
  13cb37:	48 89 cb             	mov    %rcx,%rbx
  13cb3a:	49 89 d6             	mov    %rdx,%r14
  13cb3d:	49 89 f7             	mov    %rsi,%r15
  13cb40:	49 89 fd             	mov    %rdi,%r13
  13cb43:	48 89 d7             	mov    %rdx,%rdi
  13cb46:	48 89 ce             	mov    %rcx,%rsi
  13cb49:	44 89 c2             	mov    %r8d,%edx
  13cb4c:	e8 2f 13 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13cb51:	3c fe                	cmp    $0xfe,%al
  13cb53:	0f 84 1e 04 00 00    	je     13cf77 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x457>
  13cb59:	0f b6 c0             	movzbl %al,%eax
  13cb5c:	3d ff 00 00 00       	cmp    $0xff,%eax
  13cb61:	0f 85 83 00 00 00    	jne    13cbea <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xca>
  13cb67:	4c 89 f1             	mov    %r14,%rcx
  13cb6a:	4c 8b 35 17 90 16 00 	mov    0x169017(%rip),%r14        # 2a5b88 <_DYNAMIC+0x660>
  13cb71:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  13cb78:	00 
  13cb79:	4c 89 ee             	mov    %r13,%rsi
  13cb7c:	4c 89 fa             	mov    %r15,%rdx
  13cb7f:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
  13cb84:	41 ff d6             	call   *%r14
  13cb87:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  13cb8e:	00 
  13cb8f:	4c 89 6c 24 48       	mov    %r13,0x48(%rsp)
  13cb94:	4c 89 ee             	mov    %r13,%rsi
  13cb97:	4c 89 bc 24 a8 00 00 	mov    %r15,0xa8(%rsp)
  13cb9e:	00 
  13cb9f:	4c 89 fa             	mov    %r15,%rdx
  13cba2:	49 89 df             	mov    %rbx,%r15
  13cba5:	48 89 d9             	mov    %rbx,%rcx
  13cba8:	41 ff d6             	call   *%r14
  13cbab:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cbb0:	ff 15 1a 8c 16 00    	call   *0x168c1a(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  13cbb6:	48 8b 9c 24 a8 00 00 	mov    0xa8(%rsp),%rbx
  13cbbd:	00 
  13cbbe:	4d 89 fe             	mov    %r15,%r14
  13cbc1:	45 0f b6 ec          	movzbl %r12b,%r13d
  13cbc5:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  13cbcc:	00 
  13cbcd:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
  13cbd2:	44 89 ea             	mov    %r13d,%edx
  13cbd5:	e8 a6 12 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13cbda:	3c fe                	cmp    $0xfe,%al
  13cbdc:	75 14                	jne    13cbf2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xd2>
  13cbde:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cbe3:	e8 18 29 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13cbe8:	eb 44                	jmp    13cc2e <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x10e>
  13cbea:	45 31 e4             	xor    %r12d,%r12d
  13cbed:	e9 88 03 00 00       	jmp    13cf7a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  13cbf2:	89 44 24 44          	mov    %eax,0x44(%rsp)
  13cbf6:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cbfb:	e8 00 29 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13cc00:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cc05:	ff 15 c5 8b 16 00    	call   *0x168bc5(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  13cc0b:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  13cc12:	00 
  13cc13:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
  13cc18:	44 89 ea             	mov    %r13d,%edx
  13cc1b:	e8 60 12 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13cc20:	3c fe                	cmp    $0xfe,%al
  13cc22:	75 2c                	jne    13cc50 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x130>
  13cc24:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cc29:	e8 d2 28 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13cc2e:	41 b4 02             	mov    $0x2,%r12b
  13cc31:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  13cc38:	00 
  13cc39:	e8 c2 28 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13cc3e:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  13cc45:	00 
  13cc46:	e8 b5 28 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13cc4b:	e9 2a 03 00 00       	jmp    13cf7a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  13cc50:	89 44 24 34          	mov    %eax,0x34(%rsp)
  13cc54:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cc59:	e8 a2 28 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13cc5e:	8b 7c 24 44          	mov    0x44(%rsp),%edi
  13cc62:	40 84 ff             	test   %dil,%dil
  13cc65:	0f 94 c1             	sete   %cl
  13cc68:	8b 74 24 34          	mov    0x34(%rsp),%esi
  13cc6c:	40 84 f6             	test   %sil,%sil
  13cc6f:	0f 94 c0             	sete   %al
  13cc72:	89 ca                	mov    %ecx,%edx
  13cc74:	08 c2                	or     %al,%dl
  13cc76:	88 54 24 27          	mov    %dl,0x27(%rsp)
  13cc7a:	80 fa 01             	cmp    $0x1,%dl
  13cc7d:	74 16                	je     13cc95 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x175>
  13cc7f:	48 83 fb 04          	cmp    $0x4,%rbx
  13cc83:	0f 92 c2             	setb   %dl
  13cc86:	40 38 f7             	cmp    %sil,%dil
  13cc89:	40 0f 95 c6          	setne  %sil
  13cc8d:	41 b4 01             	mov    $0x1,%r12b
  13cc90:	40 84 f2             	test   %sil,%dl
  13cc93:	75 9c                	jne    13cc31 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x111>
  13cc95:	40 20 cd             	and    %cl,%bpl
  13cc98:	40 0f b6 cd          	movzbl %bpl,%ecx
  13cc9c:	22 84 24 c0 01 00 00 	and    0x1c0(%rsp),%al
  13cca3:	0f b6 e8             	movzbl %al,%ebp
  13cca6:	48 89 8c 24 20 01 00 	mov    %rcx,0x120(%rsp)
  13ccad:	00 
  13ccae:	48 01 cd             	add    %rcx,%rbp
  13ccb1:	48 83 fb 03          	cmp    $0x3,%rbx
  13ccb5:	0f 87 c4 00 00 00    	ja     13cd7f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x25f>
  13ccbb:	48 83 fb 02          	cmp    $0x2,%rbx
  13ccbf:	0f 84 ba 00 00 00    	je     13cd7f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x25f>
  13ccc5:	0f 10 84 24 28 01 00 	movups 0x128(%rsp),%xmm0
  13cccc:	00 
  13cccd:	0f 10 8c 24 38 01 00 	movups 0x138(%rsp),%xmm1
  13ccd4:	00 
  13ccd5:	0f 10 94 24 48 01 00 	movups 0x148(%rsp),%xmm2
  13ccdc:	00 
  13ccdd:	0f 29 94 24 d0 00 00 	movaps %xmm2,0xd0(%rsp)
  13cce4:	00 
  13cce5:	0f 29 8c 24 c0 00 00 	movaps %xmm1,0xc0(%rsp)
  13ccec:	00 
  13cced:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
  13ccf4:	00 
  13ccf5:	0f 10 84 24 58 01 00 	movups 0x158(%rsp),%xmm0
  13ccfc:	00 
  13ccfd:	0f 10 8c 24 68 01 00 	movups 0x168(%rsp),%xmm1
  13cd04:	00 
  13cd05:	0f 10 94 24 78 01 00 	movups 0x178(%rsp),%xmm2
  13cd0c:	00 
  13cd0d:	0f 29 94 24 90 00 00 	movaps %xmm2,0x90(%rsp)
  13cd14:	00 
  13cd15:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
  13cd1c:	00 
  13cd1d:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
  13cd22:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
  13cd27:	0f b6 44 24 34       	movzbl 0x34(%rsp),%eax
  13cd2c:	89 44 24 08          	mov    %eax,0x8(%rsp)
  13cd30:	0f b6 44 24 44       	movzbl 0x44(%rsp),%eax
  13cd35:	89 04 24             	mov    %eax,(%rsp)
  13cd38:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
  13cd3f:	00 
  13cd40:	4c 8d 4c 24 70       	lea    0x70(%rsp),%r9
  13cd45:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  13cd4a:	48 89 de             	mov    %rbx,%rsi
  13cd4d:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  13cd52:	4c 89 f1             	mov    %r14,%rcx
  13cd55:	e8 56 ba ff ff       	call   1387b0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  13cd5a:	41 b4 02             	mov    $0x2,%r12b
  13cd5d:	a8 01                	test   $0x1,%al
  13cd5f:	0f 84 15 02 00 00    	je     13cf7a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  13cd65:	48 83 fa 02          	cmp    $0x2,%rdx
  13cd69:	0f 83 d2 00 00 00    	jae    13ce41 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x321>
  13cd6f:	48 01 ea             	add    %rbp,%rdx
  13cd72:	48 83 fa 01          	cmp    $0x1,%rdx
  13cd76:	41 0f 94 c4          	sete   %r12b
  13cd7a:	e9 fb 01 00 00       	jmp    13cf7a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  13cd7f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  13cd84:	80 38 00             	cmpb   $0x0,(%rax)
  13cd87:	75 29                	jne    13cdb2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  13cd89:	41 80 3e 00          	cmpb   $0x0,(%r14)
  13cd8d:	75 23                	jne    13cdb2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  13cd8f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  13cd94:	48 8d 78 10          	lea    0x10(%rax),%rdi
  13cd98:	49 8d 76 10          	lea    0x10(%r14),%rsi
  13cd9c:	48 89 bc 24 10 01 00 	mov    %rdi,0x110(%rsp)
  13cda3:	00 
  13cda4:	ff 15 9e 8a 16 00    	call   *0x168a9e(%rip)        # 2a5848 <_DYNAMIC+0x320>
  13cdaa:	84 c0                	test   %al,%al
  13cdac:	0f 8e 6a 02 00 00    	jle    13d01c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x4fc>
  13cdb2:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cdb7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
  13cdbc:	48 89 da             	mov    %rbx,%rdx
  13cdbf:	e8 5c 4e ff ff       	call   131c20 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation10derivative>
  13cdc4:	4c 8b 64 24 78       	mov    0x78(%rsp),%r12
  13cdc9:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
  13cdd0:	00 
  13cdd1:	4c 89 e7             	mov    %r12,%rdi
  13cdd4:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  13cdd9:	4c 89 f1             	mov    %r14,%rcx
  13cddc:	45 89 e8             	mov    %r13d,%r8d
  13cddf:	e8 ac 9f ff ff       	call   136d90 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero>
  13cde4:	41 89 c7             	mov    %eax,%r15d
  13cde7:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cdec:	e8 8f 68 fb ff       	call   f3680 <_RNvXsp_NtCs1C1lLj4PWSY_5alloc3vecINtB5_3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealENtNtNtCsevLNFiNqfJP_4core3ops4drop4Drop4dropCs6IjHMNHnq5H_10hypersolve>
  13cdf1:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  13cdf6:	48 85 c0             	test   %rax,%rax
  13cdf9:	74 16                	je     13ce11 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f1>
  13cdfb:	48 c1 e0 04          	shl    $0x4,%rax
  13cdff:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  13ce03:	ba 08 00 00 00       	mov    $0x8,%edx
  13ce08:	4c 89 e7             	mov    %r12,%rdi
  13ce0b:	ff 15 5f 89 16 00    	call   *0x16895f(%rip)        # 2a5770 <_DYNAMIC+0x248>
  13ce11:	41 f6 c7 01          	test   $0x1,%r15b
  13ce15:	0f 84 aa fe ff ff    	je     13ccc5 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x1a5>
  13ce1b:	8b 44 24 44          	mov    0x44(%rsp),%eax
  13ce1f:	3a 44 24 34          	cmp    0x34(%rsp),%al
  13ce23:	0f 95 c0             	setne  %al
  13ce26:	0f b6 4c 24 27       	movzbl 0x27(%rsp),%ecx
  13ce2b:	80 f1 01             	xor    $0x1,%cl
  13ce2e:	20 c1                	and    %al,%cl
  13ce30:	0f b6 c1             	movzbl %cl,%eax
  13ce33:	01 c5                	add    %eax,%ebp
  13ce35:	83 fd 01             	cmp    $0x1,%ebp
  13ce38:	41 0f 94 c4          	sete   %r12b
  13ce3c:	e9 f0 fd ff ff       	jmp    13cc31 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x111>
  13ce41:	48 83 fb 03          	cmp    $0x3,%rbx
  13ce45:	75 36                	jne    13ce7d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x35d>
  13ce47:	45 31 c0             	xor    %r8d,%r8d
  13ce4a:	80 7c 24 34 00       	cmpb   $0x0,0x34(%rsp)
  13ce4f:	41 0f 94 c0          	sete   %r8b
  13ce53:	31 c9                	xor    %ecx,%ecx
  13ce55:	80 7c 24 44 00       	cmpb   $0x0,0x44(%rsp)
  13ce5a:	0f 94 c1             	sete   %cl
  13ce5d:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  13ce62:	48 8d 77 30          	lea    0x30(%rdi),%rsi
  13ce66:	48 8d 57 60          	lea    0x60(%rdi),%rdx
  13ce6a:	45 89 e9             	mov    %r13d,%r9d
  13ce6d:	e8 be 09 00 00       	call   13d830 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation50quadratic_multiple_variation_has_one_distinct_root>
  13ce72:	41 89 c4             	mov    %eax,%r12d
  13ce75:	3c 02                	cmp    $0x2,%al
  13ce77:	0f 85 fd 00 00 00    	jne    13cf7a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  13ce7d:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
  13ce82:	4c 89 e7             	mov    %r12,%rdi
  13ce85:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
  13ce8a:	48 89 da             	mov    %rbx,%rdx
  13ce8d:	e8 0e 29 ff ff       	call   12f7a0 <_RINvXNvMNtCs1C1lLj4PWSY_5alloc5sliceSp9to_vec_inNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealNtB3_10ConvertVec6to_vecNtNtB8_5alloc6GlobalECs6IjHMNHnq5H_10hypersolve>
  13ce92:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13ce99:	00 
  13ce9a:	4c 89 e6             	mov    %r12,%rsi
  13ce9d:	45 89 ec             	mov    %r13d,%r12d
  13cea0:	44 89 ea             	mov    %r13d,%edx
  13cea3:	ff 15 ff 8c 16 00    	call   *0x168cff(%rip)        # 2a5ba8 <_DYNAMIC+0x680>
  13cea9:	48 83 bc 24 b0 00 00 	cmpq   $0xffffffffffffffff,0xb0(%rsp)
  13ceb0:	00 ff 
  13ceb2:	0f 84 bf 00 00 00    	je     13cf77 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x457>
  13ceb8:	4c 8b bc 24 c0 00 00 	mov    0xc0(%rsp),%r15
  13cebf:	00 
  13cec0:	4c 89 bc 24 00 01 00 	mov    %r15,0x100(%rsp)
  13cec7:	00 
  13cec8:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  13cecf:	00 
  13ced0:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  13ced7:	00 
  13ced8:	48 8b b4 24 f8 00 00 	mov    0xf8(%rsp),%rsi
  13cedf:	00 
  13cee0:	49 39 df             	cmp    %rbx,%r15
  13cee3:	0f 85 a6 00 00 00    	jne    13cf8f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x46f>
  13cee9:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13ceee:	48 89 da             	mov    %rbx,%rdx
  13cef1:	44 89 e1             	mov    %r12d,%ecx
  13cef4:	ff 15 4e 8e 16 00    	call   *0x168e4e(%rip)        # 2a5d48 <_DYNAMIC+0x820>
  13cefa:	48 83 7c 24 70 ff    	cmpq   $0xffffffffffffffff,0x70(%rsp)
  13cf00:	74 6d                	je     13cf6f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x44f>
  13cf02:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
  13cf09:	00 
  13cf0a:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
  13cf11:	00 
  13cf12:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13cf17:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
  13cf1e:	00 
  13cf1f:	48 8b bc 24 b8 00 00 	mov    0xb8(%rsp),%rdi
  13cf26:	00 
  13cf27:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  13cf2c:	4c 89 f1             	mov    %r14,%rcx
  13cf2f:	45 89 e0             	mov    %r12d,%r8d
  13cf32:	e8 c9 4d ff ff       	call   131d00 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation11sturm_count>
  13cf37:	48 83 f8 01          	cmp    $0x1,%rax
  13cf3b:	8b 44 24 34          	mov    0x34(%rsp),%eax
  13cf3f:	75 21                	jne    13cf62 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x442>
  13cf41:	48 89 d3             	mov    %rdx,%rbx
  13cf44:	84 c0                	test   %al,%al
  13cf46:	0f 94 c0             	sete   %al
  13cf49:	0f b6 8c 24 c0 01 00 	movzbl 0x1c0(%rsp),%ecx
  13cf50:	00 
  13cf51:	80 f1 01             	xor    $0x1,%cl
  13cf54:	20 c1                	and    %al,%cl
  13cf56:	0f b6 c1             	movzbl %cl,%eax
  13cf59:	48 29 c3             	sub    %rax,%rbx
  13cf5c:	0f 83 13 01 00 00    	jae    13d075 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x555>
  13cf62:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13cf69:	00 
  13cf6a:	e8 a1 1e ff ff       	call   12ee10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs6IjHMNHnq5H_10hypersolve>
  13cf6f:	41 b4 02             	mov    $0x2,%r12b
  13cf72:	e9 21 01 00 00       	jmp    13d098 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x578>
  13cf77:	41 b4 02             	mov    $0x2,%r12b
  13cf7a:	44 89 e0             	mov    %r12d,%eax
  13cf7d:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
  13cf84:	5b                   	pop    %rbx
  13cf85:	41 5c                	pop    %r12
  13cf87:	41 5d                	pop    %r13
  13cf89:	41 5e                	pop    %r14
  13cf8b:	41 5f                	pop    %r15
  13cf8d:	5d                   	pop    %rbp
  13cf8e:	c3                   	ret
  13cf8f:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13cf96:	00 
  13cf97:	48 89 f3             	mov    %rsi,%rbx
  13cf9a:	4c 89 fa             	mov    %r15,%rdx
  13cf9d:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
  13cfa2:	ff 15 e0 8b 16 00    	call   *0x168be0(%rip)        # 2a5b88 <_DYNAMIC+0x660>
  13cfa8:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13cfad:	48 89 de             	mov    %rbx,%rsi
  13cfb0:	4c 89 fa             	mov    %r15,%rdx
  13cfb3:	4c 89 f1             	mov    %r14,%rcx
  13cfb6:	ff 15 cc 8b 16 00    	call   *0x168bcc(%rip)        # 2a5b88 <_DYNAMIC+0x660>
  13cfbc:	44 89 64 24 10       	mov    %r12d,0x10(%rsp)
  13cfc1:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%rsp)
  13cfc8:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
  13cfcf:	00 
  13cfd0:	4c 8d 4c 24 70       	lea    0x70(%rsp),%r9
  13cfd5:	48 89 9c 24 a8 00 00 	mov    %rbx,0xa8(%rsp)
  13cfdc:	00 
  13cfdd:	48 89 df             	mov    %rbx,%rdi
  13cfe0:	4c 89 fe             	mov    %r15,%rsi
  13cfe3:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  13cfe8:	4c 89 f1             	mov    %r14,%rcx
  13cfeb:	e8 c0 b7 ff ff       	call   1387b0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  13cff0:	41 b4 02             	mov    $0x2,%r12b
  13cff3:	a8 01                	test   $0x1,%al
  13cff5:	0f 84 9d 00 00 00    	je     13d098 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x578>
  13cffb:	4c 89 fb             	mov    %r15,%rbx
  13cffe:	48 83 fa 02          	cmp    $0x2,%rdx
  13d002:	45 89 ec             	mov    %r13d,%r12d
  13d005:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
  13d00c:	00 
  13d00d:	0f 83 d6 fe ff ff    	jae    13cee9 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x3c9>
  13d013:	48 01 ea             	add    %rbp,%rdx
  13d016:	48 83 fa 01          	cmp    $0x1,%rdx
  13d01a:	eb 78                	jmp    13d094 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x574>
  13d01c:	49 89 dc             	mov    %rbx,%r12
  13d01f:	49 c1 e4 04          	shl    $0x4,%r12
  13d023:	4b 8d 3c 64          	lea    (%r12,%r12,2),%rdi
  13d027:	48 83 c7 d0          	add    $0xffffffffffffffd0,%rdi
  13d02b:	48 c1 ef 04          	shr    $0x4,%rdi
  13d02f:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
  13d036:	aa aa aa 
  13d039:	48 0f af f8          	imul   %rax,%rdi
  13d03d:	ff 15 e5 8b 16 00    	call   *0x168be5(%rip)        # 2a5c28 <_DYNAMIC+0x700>
  13d043:	4b 8d 14 64          	lea    (%r12,%r12,2),%rdx
  13d047:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  13d04c:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
  13d050:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  13d055:	80 7f d0 00          	cmpb   $0x0,-0x30(%rdi)
  13d059:	74 4f                	je     13d0aa <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x58a>
  13d05b:	f0 48 ff 08          	lock decq (%rax)
  13d05f:	0f 85 4d fd ff ff    	jne    13cdb2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  13d065:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  13d06a:	ff 15 18 87 16 00    	call   *0x168718(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d070:	e9 3d fd ff ff       	jmp    13cdb2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  13d075:	48 03 9c 24 20 01 00 	add    0x120(%rsp),%rbx
  13d07c:	00 
  13d07d:	0f 82 df fe ff ff    	jb     13cf62 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x442>
  13d083:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13d08a:	00 
  13d08b:	e8 80 1d ff ff       	call   12ee10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs6IjHMNHnq5H_10hypersolve>
  13d090:	48 83 fb 01          	cmp    $0x1,%rbx
  13d094:	41 0f 94 c4          	sete   %r12b
  13d098:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  13d09f:	00 
  13d0a0:	e8 6b 1e ff ff       	call   12ef10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d0a5:	e9 d0 fe ff ff       	jmp    13cf7a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  13d0aa:	48 89 94 24 a0 00 00 	mov    %rdx,0xa0(%rsp)
  13d0b1:	00 
  13d0b2:	48 83 c7 e0          	add    $0xffffffffffffffe0,%rdi
  13d0b6:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
  13d0bb:	e8 a0 26 00 00       	call   13f760 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs6IjHMNHnq5H_10hypersolve>
  13d0c0:	49 89 c4             	mov    %rax,%r12
  13d0c3:	f0 48 ff 00          	lock incq (%rax)
  13d0c7:	0f 8e 54 02 00 00    	jle    13d321 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x801>
  13d0cd:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
  13d0d2:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
  13d0d7:	4c 89 e0             	mov    %r12,%rax
  13d0da:	48 83 fb 03          	cmp    $0x3,%rbx
  13d0de:	0f 82 58 01 00 00    	jb     13d23c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x71c>
  13d0e4:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  13d0e9:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  13d0ed:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
  13d0f4:	00 
  13d0f5:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  13d0fc:	00 
  13d0fd:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
  13d104:	00 
  13d105:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  13d10a:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
  13d10f:	48 8b 94 24 10 01 00 	mov    0x110(%rsp),%rdx
  13d116:	00 
  13d117:	49 8d 4e 10          	lea    0x10(%r14),%rcx
  13d11b:	e8 30 09 00 00       	call   13da50 <_RNvNtCs6IjHMNHnq5H_10hypersolve8interval25rational_interval_product>
  13d120:	4c 8b a4 24 a0 00 00 	mov    0xa0(%rsp),%r12
  13d127:	00 
  13d128:	49 8d 7c 24 a0       	lea    -0x60(%r12),%rdi
  13d12d:	48 89 bc 24 18 01 00 	mov    %rdi,0x118(%rsp)
  13d134:	00 
  13d135:	48 c1 ef 04          	shr    $0x4,%rdi
  13d139:	48 b9 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
  13d140:	aa aa aa 
  13d143:	48 0f af f9          	imul   %rcx,%rdi
  13d147:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
  13d14c:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
  13d151:	ff 15 d1 8a 16 00    	call   *0x168ad1(%rip)        # 2a5c28 <_DYNAMIC+0x700>
  13d157:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  13d15e:	00 
  13d15f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  13d164:	42 80 7c 21 a0 00    	cmpb   $0x0,-0x60(%rcx,%r12,1)
  13d16a:	0f 85 26 01 00 00    	jne    13d296 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x776>
  13d170:	48 8b 8c 24 08 01 00 	mov    0x108(%rsp),%rcx
  13d177:	00 
  13d178:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
  13d17c:	48 89 c6             	mov    %rax,%rsi
  13d17f:	e8 6c 1e 00 00       	call   13eff0 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalINtNtNtCsevLNFiNqfJP_4core3ops5arith3MulBU_E3mulCs6IjHMNHnq5H_10hypersolve>
  13d184:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  13d18b:	00 
  13d18c:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
  13d191:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
  13d196:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13d19b:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  13d1a2:	00 
  13d1a3:	ff 15 a7 86 16 00    	call   *0x1686a7(%rip)        # 2a5850 <_DYNAMIC+0x328>
  13d1a9:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  13d1b0:	00 
  13d1b1:	f0 49 ff 0c 24       	lock decq (%r12)
  13d1b6:	75 0b                	jne    13d1c3 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6a3>
  13d1b8:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13d1bd:	ff 15 c5 85 16 00    	call   *0x1685c5(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d1c3:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  13d1c8:	f0 48 ff 08          	lock decq (%rax)
  13d1cc:	75 0b                	jne    13d1d9 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6b9>
  13d1ce:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  13d1d3:	ff 15 af 85 16 00    	call   *0x1685af(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d1d9:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  13d1e0:	00 
  13d1e1:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  13d1e6:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
  13d1eb:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
  13d1f2:	00 
  13d1f3:	e8 68 13 00 00       	call   13e560 <_RNvXs1l_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs6IjHMNHnq5H_10hypersolve>
  13d1f8:	49 89 c4             	mov    %rax,%r12
  13d1fb:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  13d200:	f0 48 ff 08          	lock decq (%rax)
  13d204:	75 0b                	jne    13d211 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6f1>
  13d206:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  13d20b:	ff 15 77 85 16 00    	call   *0x168577(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d211:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
  13d216:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  13d21d:	00 
  13d21e:	48 83 f8 60          	cmp    $0x60,%rax
  13d222:	74 13                	je     13d237 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x717>
  13d224:	48 83 c0 d0          	add    $0xffffffffffffffd0,%rax
  13d228:	48 83 bc 24 18 01 00 	cmpq   $0x60,0x118(%rsp)
  13d22f:	00 60 
  13d231:	0f 83 c6 fe ff ff    	jae    13d0fd <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x5dd>
  13d237:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  13d23c:	41 b7 01             	mov    $0x1,%r15b
  13d23f:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  13d243:	74 0a                	je     13d24f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x72f>
  13d245:	41 80 7c 24 64 00    	cmpb   $0x0,0x64(%r12)
  13d24b:	41 0f 94 c7          	sete   %r15b
  13d24f:	f0 49 ff 0c 24       	lock decq (%r12)
  13d254:	75 0b                	jne    13d261 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x741>
  13d256:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  13d25b:	ff 15 27 85 16 00    	call   *0x168527(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d261:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  13d266:	f0 48 ff 08          	lock decq (%rax)
  13d26a:	75 0b                	jne    13d277 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x757>
  13d26c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  13d271:	ff 15 11 85 16 00    	call   *0x168511(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d277:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  13d27c:	f0 48 ff 08          	lock decq (%rax)
  13d280:	0f 85 8b fb ff ff    	jne    13ce11 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f1>
  13d286:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  13d28b:	ff 15 f7 84 16 00    	call   *0x1684f7(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d291:	e9 7b fb ff ff       	jmp    13ce11 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f1>
  13d296:	f0 48 ff 08          	lock decq (%rax)
  13d29a:	75 0e                	jne    13d2aa <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x78a>
  13d29c:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  13d2a3:	00 
  13d2a4:	ff 15 de 84 16 00    	call   *0x1684de(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d2aa:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  13d2af:	f0 48 ff 08          	lock decq (%rax)
  13d2b3:	75 0b                	jne    13d2c0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7a0>
  13d2b5:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  13d2ba:	ff 15 c8 84 16 00    	call   *0x1684c8(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d2c0:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  13d2c5:	f0 48 ff 08          	lock decq (%rax)
  13d2c9:	75 0b                	jne    13d2d6 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7b6>
  13d2cb:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  13d2d0:	ff 15 b2 84 16 00    	call   *0x1684b2(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d2d6:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  13d2db:	f0 48 ff 08          	lock decq (%rax)
  13d2df:	48 8b 9c 24 a8 00 00 	mov    0xa8(%rsp),%rbx
  13d2e6:	00 
  13d2e7:	4d 89 fe             	mov    %r15,%r14
  13d2ea:	75 0b                	jne    13d2f7 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7d7>
  13d2ec:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  13d2f1:	ff 15 91 84 16 00    	call   *0x168491(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d2f7:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  13d2fc:	f0 48 ff 08          	lock decq (%rax)
  13d300:	75 0b                	jne    13d30d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7ed>
  13d302:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  13d307:	ff 15 7b 84 16 00    	call   *0x16847b(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d30d:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  13d312:	f0 48 ff 08          	lock decq (%rax)
  13d316:	0f 85 96 fa ff ff    	jne    13cdb2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  13d31c:	e9 44 fd ff ff       	jmp    13d065 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x545>
  13d321:	0f 0b                	ud2
  13d323:	e9 93 00 00 00       	jmp    13d3bb <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x89b>
  13d328:	48 89 c3             	mov    %rax,%rbx
  13d32b:	e9 cb 00 00 00       	jmp    13d3fb <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8db>
  13d330:	e9 a5 00 00 00       	jmp    13d3da <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8ba>
  13d335:	48 89 c3             	mov    %rax,%rbx
  13d338:	e9 ea 00 00 00       	jmp    13d427 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x907>
  13d33d:	48 89 c3             	mov    %rax,%rbx
  13d340:	e9 f8 00 00 00       	jmp    13d43d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x91d>
  13d345:	48 89 c3             	mov    %rax,%rbx
  13d348:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  13d34f:	00 
  13d350:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  13d355:	eb 29                	jmp    13d380 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  13d357:	48 89 c3             	mov    %rax,%rbx
  13d35a:	eb 24                	jmp    13d380 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  13d35c:	48 89 c3             	mov    %rax,%rbx
  13d35f:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
  13d364:	e9 a8 00 00 00       	jmp    13d411 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  13d369:	eb 50                	jmp    13d3bb <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x89b>
  13d36b:	48 89 c3             	mov    %rax,%rbx
  13d36e:	f0 49 ff 0c 24       	lock decq (%r12)
  13d373:	75 0b                	jne    13d380 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  13d375:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13d37a:	ff 15 08 84 16 00    	call   *0x168408(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d380:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  13d387:	00 
  13d388:	f0 48 ff 08          	lock decq (%rax)
  13d38c:	75 0e                	jne    13d39c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x87c>
  13d38e:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13d395:	00 
  13d396:	ff 15 ec 83 16 00    	call   *0x1683ec(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d39c:	31 ed                	xor    %ebp,%ebp
  13d39e:	eb 40                	jmp    13d3e0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8c0>
  13d3a0:	ff 15 c2 83 16 00    	call   *0x1683c2(%rip)        # 2a5768 <_DYNAMIC+0x240>
  13d3a6:	48 89 c3             	mov    %rax,%rbx
  13d3a9:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13d3b0:	00 
  13d3b1:	e8 5a 1a ff ff       	call   12ee10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs6IjHMNHnq5H_10hypersolve>
  13d3b6:	e9 a1 00 00 00       	jmp    13d45c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x93c>
  13d3bb:	48 89 c3             	mov    %rax,%rbx
  13d3be:	eb 51                	jmp    13d411 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  13d3c0:	e9 94 00 00 00       	jmp    13d459 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x939>
  13d3c5:	48 89 c3             	mov    %rax,%rbx
  13d3c8:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  13d3cf:	00 
  13d3d0:	e8 2b 21 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d3d5:	e9 82 00 00 00       	jmp    13d45c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x93c>
  13d3da:	48 89 c3             	mov    %rax,%rbx
  13d3dd:	40 b5 01             	mov    $0x1,%bpl
  13d3e0:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  13d3e5:	f0 48 ff 08          	lock decq (%rax)
  13d3e9:	75 0b                	jne    13d3f6 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8d6>
  13d3eb:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  13d3f0:	ff 15 92 83 16 00    	call   *0x168392(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d3f6:	40 84 ed             	test   %bpl,%bpl
  13d3f9:	74 16                	je     13d411 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  13d3fb:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  13d400:	f0 48 ff 08          	lock decq (%rax)
  13d404:	75 0b                	jne    13d411 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  13d406:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  13d40b:	ff 15 77 83 16 00    	call   *0x168377(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d411:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  13d416:	f0 48 ff 08          	lock decq (%rax)
  13d41a:	75 0b                	jne    13d427 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x907>
  13d41c:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  13d421:	ff 15 61 83 16 00    	call   *0x168361(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d427:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  13d42c:	f0 48 ff 08          	lock decq (%rax)
  13d430:	75 0b                	jne    13d43d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x91d>
  13d432:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  13d437:	ff 15 4b 83 16 00    	call   *0x16834b(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d43d:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  13d442:	f0 48 ff 08          	lock decq (%rax)
  13d446:	0f 85 88 00 00 00    	jne    13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d44c:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  13d451:	ff 15 31 83 16 00    	call   *0x168331(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13d457:	eb 7b                	jmp    13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d459:	48 89 c3             	mov    %rax,%rbx
  13d45c:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  13d463:	00 
  13d464:	e8 a7 1a ff ff       	call   12ef10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d469:	e9 80 00 00 00       	jmp    13d4ee <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9ce>
  13d46e:	ff 15 f4 82 16 00    	call   *0x1682f4(%rip)        # 2a5768 <_DYNAMIC+0x240>
  13d474:	48 89 c3             	mov    %rax,%rbx
  13d477:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  13d47c:	48 85 c0             	test   %rax,%rax
  13d47f:	74 53                	je     13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d481:	48 c1 e0 04          	shl    $0x4,%rax
  13d485:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  13d489:	ba 08 00 00 00       	mov    $0x8,%edx
  13d48e:	4c 89 e7             	mov    %r12,%rdi
  13d491:	ff 15 d9 82 16 00    	call   *0x1682d9(%rip)        # 2a5770 <_DYNAMIC+0x248>
  13d497:	eb 3b                	jmp    13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d499:	48 89 c3             	mov    %rax,%rbx
  13d49c:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13d4a1:	e8 6a 1a ff ff       	call   12ef10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d4a6:	eb 2c                	jmp    13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d4a8:	ff 15 ba 82 16 00    	call   *0x1682ba(%rip)        # 2a5768 <_DYNAMIC+0x240>
  13d4ae:	48 89 c3             	mov    %rax,%rbx
  13d4b1:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13d4b6:	e8 45 20 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d4bb:	eb 17                	jmp    13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d4bd:	48 89 c3             	mov    %rax,%rbx
  13d4c0:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13d4c5:	e8 36 20 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d4ca:	eb 08                	jmp    13d4d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  13d4cc:	48 89 c3             	mov    %rax,%rbx
  13d4cf:	eb 10                	jmp    13d4e1 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9c1>
  13d4d1:	48 89 c3             	mov    %rax,%rbx
  13d4d4:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  13d4db:	00 
  13d4dc:	e8 1f 20 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d4e1:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  13d4e8:	00 
  13d4e9:	e8 12 20 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13d4ee:	48 89 df             	mov    %rbx,%rdi
  13d4f1:	e8 5a e8 15 00       	call   29bd50 <_Unwind_Resume@plt>
  13d4f6:	ff 15 6c 82 16 00    	call   *0x16826c(%rip)        # 2a5768 <_DYNAMIC+0x240>
