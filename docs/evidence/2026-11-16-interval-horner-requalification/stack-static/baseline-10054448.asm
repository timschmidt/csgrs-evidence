
/tmp/interval-refactor/horner-current/artifacts-baseline/certification:     file format elf64-x86-64


Disassembly of section .text:

0000000000996b30 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership>:
  996b30:	55                   	push   %rbp
  996b31:	41 57                	push   %r15
  996b33:	41 56                	push   %r14
  996b35:	41 55                	push   %r13
  996b37:	41 54                	push   %r12
  996b39:	53                   	push   %rbx
  996b3a:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
  996b41:	44 89 cd             	mov    %r9d,%ebp
  996b44:	45 89 c4             	mov    %r8d,%r12d
  996b47:	48 89 cb             	mov    %rcx,%rbx
  996b4a:	49 89 d6             	mov    %rdx,%r14
  996b4d:	49 89 f7             	mov    %rsi,%r15
  996b50:	49 89 fd             	mov    %rdi,%r13
  996b53:	48 89 d7             	mov    %rdx,%rdi
  996b56:	48 89 ce             	mov    %rcx,%rsi
  996b59:	44 89 c2             	mov    %r8d,%edx
  996b5c:	e8 3f 55 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  996b61:	3c fe                	cmp    $0xfe,%al
  996b63:	0f 84 1e 04 00 00    	je     996f87 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x457>
  996b69:	0f b6 c0             	movzbl %al,%eax
  996b6c:	3d ff 00 00 00       	cmp    $0xff,%eax
  996b71:	0f 85 83 00 00 00    	jne    996bfa <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xca>
  996b77:	4c 89 f1             	mov    %r14,%rcx
  996b7a:	4c 8b 35 e7 7b 35 00 	mov    0x357be7(%rip),%r14        # cee768 <_DYNAMIC+0x1320>
  996b81:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  996b88:	00 
  996b89:	4c 89 ee             	mov    %r13,%rsi
  996b8c:	4c 89 fa             	mov    %r15,%rdx
  996b8f:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
  996b94:	41 ff d6             	call   *%r14
  996b97:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  996b9e:	00 
  996b9f:	4c 89 6c 24 48       	mov    %r13,0x48(%rsp)
  996ba4:	4c 89 ee             	mov    %r13,%rsi
  996ba7:	4c 89 bc 24 a8 00 00 	mov    %r15,0xa8(%rsp)
  996bae:	00 
  996baf:	4c 89 fa             	mov    %r15,%rdx
  996bb2:	49 89 df             	mov    %rbx,%r15
  996bb5:	48 89 d9             	mov    %rbx,%rcx
  996bb8:	41 ff d6             	call   *%r14
  996bbb:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996bc0:	ff 15 ea 6b 35 00    	call   *0x356bea(%rip)        # ced7b0 <_DYNAMIC+0x368>
  996bc6:	48 8b 9c 24 a8 00 00 	mov    0xa8(%rsp),%rbx
  996bcd:	00 
  996bce:	4d 89 fe             	mov    %r15,%r14
  996bd1:	45 0f b6 ec          	movzbl %r12b,%r13d
  996bd5:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  996bdc:	00 
  996bdd:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
  996be2:	44 89 ea             	mov    %r13d,%edx
  996be5:	e8 b6 54 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  996bea:	3c fe                	cmp    $0xfe,%al
  996bec:	75 14                	jne    996c02 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xd2>
  996bee:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996bf3:	e8 38 68 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  996bf8:	eb 44                	jmp    996c3e <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x10e>
  996bfa:	45 31 e4             	xor    %r12d,%r12d
  996bfd:	e9 88 03 00 00       	jmp    996f8a <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  996c02:	89 44 24 44          	mov    %eax,0x44(%rsp)
  996c06:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996c0b:	e8 20 68 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  996c10:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996c15:	ff 15 95 6b 35 00    	call   *0x356b95(%rip)        # ced7b0 <_DYNAMIC+0x368>
  996c1b:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  996c22:	00 
  996c23:	48 8d 74 24 70       	lea    0x70(%rsp),%rsi
  996c28:	44 89 ea             	mov    %r13d,%edx
  996c2b:	e8 70 54 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  996c30:	3c fe                	cmp    $0xfe,%al
  996c32:	75 2c                	jne    996c60 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x130>
  996c34:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996c39:	e8 f2 67 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  996c3e:	41 b4 02             	mov    $0x2,%r12b
  996c41:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  996c48:	00 
  996c49:	e8 e2 67 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  996c4e:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  996c55:	00 
  996c56:	e8 d5 67 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  996c5b:	e9 2a 03 00 00       	jmp    996f8a <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  996c60:	89 44 24 34          	mov    %eax,0x34(%rsp)
  996c64:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996c69:	e8 c2 67 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  996c6e:	8b 7c 24 44          	mov    0x44(%rsp),%edi
  996c72:	40 84 ff             	test   %dil,%dil
  996c75:	0f 94 c1             	sete   %cl
  996c78:	8b 74 24 34          	mov    0x34(%rsp),%esi
  996c7c:	40 84 f6             	test   %sil,%sil
  996c7f:	0f 94 c0             	sete   %al
  996c82:	89 ca                	mov    %ecx,%edx
  996c84:	08 c2                	or     %al,%dl
  996c86:	88 54 24 27          	mov    %dl,0x27(%rsp)
  996c8a:	80 fa 01             	cmp    $0x1,%dl
  996c8d:	74 16                	je     996ca5 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x175>
  996c8f:	48 83 fb 04          	cmp    $0x4,%rbx
  996c93:	0f 92 c2             	setb   %dl
  996c96:	40 38 f7             	cmp    %sil,%dil
  996c99:	40 0f 95 c6          	setne  %sil
  996c9d:	41 b4 01             	mov    $0x1,%r12b
  996ca0:	40 84 f2             	test   %sil,%dl
  996ca3:	75 9c                	jne    996c41 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x111>
  996ca5:	40 20 cd             	and    %cl,%bpl
  996ca8:	40 0f b6 cd          	movzbl %bpl,%ecx
  996cac:	22 84 24 c0 01 00 00 	and    0x1c0(%rsp),%al
  996cb3:	0f b6 e8             	movzbl %al,%ebp
  996cb6:	48 89 8c 24 20 01 00 	mov    %rcx,0x120(%rsp)
  996cbd:	00 
  996cbe:	48 01 cd             	add    %rcx,%rbp
  996cc1:	48 83 fb 03          	cmp    $0x3,%rbx
  996cc5:	0f 87 c4 00 00 00    	ja     996d8f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x25f>
  996ccb:	48 83 fb 02          	cmp    $0x2,%rbx
  996ccf:	0f 84 ba 00 00 00    	je     996d8f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x25f>
  996cd5:	0f 10 84 24 28 01 00 	movups 0x128(%rsp),%xmm0
  996cdc:	00 
  996cdd:	0f 10 8c 24 38 01 00 	movups 0x138(%rsp),%xmm1
  996ce4:	00 
  996ce5:	0f 10 94 24 48 01 00 	movups 0x148(%rsp),%xmm2
  996cec:	00 
  996ced:	0f 29 94 24 d0 00 00 	movaps %xmm2,0xd0(%rsp)
  996cf4:	00 
  996cf5:	0f 29 8c 24 c0 00 00 	movaps %xmm1,0xc0(%rsp)
  996cfc:	00 
  996cfd:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
  996d04:	00 
  996d05:	0f 10 84 24 58 01 00 	movups 0x158(%rsp),%xmm0
  996d0c:	00 
  996d0d:	0f 10 8c 24 68 01 00 	movups 0x168(%rsp),%xmm1
  996d14:	00 
  996d15:	0f 10 94 24 78 01 00 	movups 0x178(%rsp),%xmm2
  996d1c:	00 
  996d1d:	0f 29 94 24 90 00 00 	movaps %xmm2,0x90(%rsp)
  996d24:	00 
  996d25:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
  996d2c:	00 
  996d2d:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
  996d32:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
  996d37:	0f b6 44 24 34       	movzbl 0x34(%rsp),%eax
  996d3c:	89 44 24 08          	mov    %eax,0x8(%rsp)
  996d40:	0f b6 44 24 44       	movzbl 0x44(%rsp),%eax
  996d45:	89 04 24             	mov    %eax,(%rsp)
  996d48:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
  996d4f:	00 
  996d50:	4c 8d 4c 24 70       	lea    0x70(%rsp),%r9
  996d55:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  996d5a:	48 89 de             	mov    %rbx,%rsi
  996d5d:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  996d62:	4c 89 f1             	mov    %r14,%rcx
  996d65:	e8 76 9d ff ff       	call   990ae0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  996d6a:	41 b4 02             	mov    $0x2,%r12b
  996d6d:	a8 01                	test   $0x1,%al
  996d6f:	0f 84 15 02 00 00    	je     996f8a <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  996d75:	48 83 fa 02          	cmp    $0x2,%rdx
  996d79:	0f 83 d2 00 00 00    	jae    996e51 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x321>
  996d7f:	48 01 ea             	add    %rbp,%rdx
  996d82:	48 83 fa 01          	cmp    $0x1,%rdx
  996d86:	41 0f 94 c4          	sete   %r12b
  996d8a:	e9 fb 01 00 00       	jmp    996f8a <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  996d8f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  996d94:	80 38 00             	cmpb   $0x0,(%rax)
  996d97:	75 29                	jne    996dc2 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  996d99:	41 80 3e 00          	cmpb   $0x0,(%r14)
  996d9d:	75 23                	jne    996dc2 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  996d9f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
  996da4:	48 8d 78 10          	lea    0x10(%rax),%rdi
  996da8:	49 8d 76 10          	lea    0x10(%r14),%rsi
  996dac:	48 89 bc 24 10 01 00 	mov    %rdi,0x110(%rsp)
  996db3:	00 
  996db4:	ff 15 06 6d 35 00    	call   *0x356d06(%rip)        # cedac0 <_DYNAMIC+0x678>
  996dba:	84 c0                	test   %al,%al
  996dbc:	0f 8e 6a 02 00 00    	jle    99702c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x4fc>
  996dc2:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996dc7:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
  996dcc:	48 89 da             	mov    %rbx,%rdx
  996dcf:	e8 9c ea fe ff       	call   985870 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation10derivative>
  996dd4:	4c 8b 64 24 78       	mov    0x78(%rsp),%r12
  996dd9:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
  996de0:	00 
  996de1:	4c 89 e7             	mov    %r12,%rdi
  996de4:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  996de9:	4c 89 f1             	mov    %r14,%rcx
  996dec:	45 89 e8             	mov    %r13d,%r8d
  996def:	e8 bc 74 ff ff       	call   98e2b0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero>
  996df4:	41 89 c7             	mov    %eax,%r15d
  996df7:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996dfc:	e8 df 88 e1 ff       	call   7af6e0 <_RNvXsp_NtCs1C1lLj4PWSY_5alloc3vecINtB5_3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealENtNtNtCsevLNFiNqfJP_4core3ops4drop4Drop4dropCsaEGsyZiti5M_10hypersolve>
  996e01:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  996e06:	48 85 c0             	test   %rax,%rax
  996e09:	74 16                	je     996e21 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f1>
  996e0b:	48 c1 e0 04          	shl    $0x4,%rax
  996e0f:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  996e13:	ba 08 00 00 00       	mov    $0x8,%edx
  996e18:	4c 89 e7             	mov    %r12,%rdi
  996e1b:	ff 15 7f 68 35 00    	call   *0x35687f(%rip)        # ced6a0 <_DYNAMIC+0x258>
  996e21:	41 f6 c7 01          	test   $0x1,%r15b
  996e25:	0f 84 aa fe ff ff    	je     996cd5 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x1a5>
  996e2b:	8b 44 24 44          	mov    0x44(%rsp),%eax
  996e2f:	3a 44 24 34          	cmp    0x34(%rsp),%al
  996e33:	0f 95 c0             	setne  %al
  996e36:	0f b6 4c 24 27       	movzbl 0x27(%rsp),%ecx
  996e3b:	80 f1 01             	xor    $0x1,%cl
  996e3e:	20 c1                	and    %al,%cl
  996e40:	0f b6 c1             	movzbl %cl,%eax
  996e43:	01 c5                	add    %eax,%ebp
  996e45:	83 fd 01             	cmp    $0x1,%ebp
  996e48:	41 0f 94 c4          	sete   %r12b
  996e4c:	e9 f0 fd ff ff       	jmp    996c41 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x111>
  996e51:	48 83 fb 03          	cmp    $0x3,%rbx
  996e55:	75 36                	jne    996e8d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x35d>
  996e57:	45 31 c0             	xor    %r8d,%r8d
  996e5a:	80 7c 24 34 00       	cmpb   $0x0,0x34(%rsp)
  996e5f:	41 0f 94 c0          	sete   %r8b
  996e63:	31 c9                	xor    %ecx,%ecx
  996e65:	80 7c 24 44 00       	cmpb   $0x0,0x44(%rsp)
  996e6a:	0f 94 c1             	sete   %cl
  996e6d:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  996e72:	48 8d 77 30          	lea    0x30(%rdi),%rsi
  996e76:	48 8d 57 60          	lea    0x60(%rdi),%rdx
  996e7a:	45 89 e9             	mov    %r13d,%r9d
  996e7d:	e8 be 09 00 00       	call   997840 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation50quadratic_multiple_variation_has_one_distinct_root>
  996e82:	41 89 c4             	mov    %eax,%r12d
  996e85:	3c 02                	cmp    $0x2,%al
  996e87:	0f 85 fd 00 00 00    	jne    996f8a <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  996e8d:	4c 8d 64 24 70       	lea    0x70(%rsp),%r12
  996e92:	4c 89 e7             	mov    %r12,%rdi
  996e95:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
  996e9a:	48 89 da             	mov    %rbx,%rdx
  996e9d:	e8 2e 68 fe ff       	call   97d6d0 <_RINvXNvMNtCs1C1lLj4PWSY_5alloc5sliceSp9to_vec_inNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealNtB3_10ConvertVec6to_vecNtNtB8_5alloc6GlobalECsaEGsyZiti5M_10hypersolve>
  996ea2:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  996ea9:	00 
  996eaa:	4c 89 e6             	mov    %r12,%rsi
  996ead:	45 89 ec             	mov    %r13d,%r12d
  996eb0:	44 89 ea             	mov    %r13d,%edx
  996eb3:	ff 15 6f 69 35 00    	call   *0x35696f(%rip)        # ced828 <_DYNAMIC+0x3e0>
  996eb9:	48 83 bc 24 b0 00 00 	cmpq   $0xffffffffffffffff,0xb0(%rsp)
  996ec0:	00 ff 
  996ec2:	0f 84 bf 00 00 00    	je     996f87 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x457>
  996ec8:	4c 8b bc 24 c0 00 00 	mov    0xc0(%rsp),%r15
  996ecf:	00 
  996ed0:	4c 89 bc 24 00 01 00 	mov    %r15,0x100(%rsp)
  996ed7:	00 
  996ed8:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  996edf:	00 
  996ee0:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  996ee7:	00 
  996ee8:	48 8b b4 24 f8 00 00 	mov    0xf8(%rsp),%rsi
  996eef:	00 
  996ef0:	49 39 df             	cmp    %rbx,%r15
  996ef3:	0f 85 a6 00 00 00    	jne    996f9f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x46f>
  996ef9:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996efe:	48 89 da             	mov    %rbx,%rdx
  996f01:	44 89 e1             	mov    %r12d,%ecx
  996f04:	ff 15 de 7b 35 00    	call   *0x357bde(%rip)        # ceeae8 <_DYNAMIC+0x16a0>
  996f0a:	48 83 7c 24 70 ff    	cmpq   $0xffffffffffffffff,0x70(%rsp)
  996f10:	74 6d                	je     996f7f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x44f>
  996f12:	48 8b b4 24 80 00 00 	mov    0x80(%rsp),%rsi
  996f19:	00 
  996f1a:	48 89 b4 24 c0 00 00 	mov    %rsi,0xc0(%rsp)
  996f21:	00 
  996f22:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  996f27:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
  996f2e:	00 
  996f2f:	48 8b bc 24 b8 00 00 	mov    0xb8(%rsp),%rdi
  996f36:	00 
  996f37:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  996f3c:	4c 89 f1             	mov    %r14,%rcx
  996f3f:	45 89 e0             	mov    %r12d,%r8d
  996f42:	e8 09 ea fe ff       	call   985950 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation11sturm_count>
  996f47:	48 83 f8 01          	cmp    $0x1,%rax
  996f4b:	8b 44 24 34          	mov    0x34(%rsp),%eax
  996f4f:	75 21                	jne    996f72 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x442>
  996f51:	48 89 d3             	mov    %rdx,%rbx
  996f54:	84 c0                	test   %al,%al
  996f56:	0f 94 c0             	sete   %al
  996f59:	0f b6 8c 24 c0 01 00 	movzbl 0x1c0(%rsp),%ecx
  996f60:	00 
  996f61:	80 f1 01             	xor    $0x1,%cl
  996f64:	20 c1                	and    %al,%cl
  996f66:	0f b6 c1             	movzbl %cl,%eax
  996f69:	48 29 c3             	sub    %rax,%rbx
  996f6c:	0f 83 13 01 00 00    	jae    997085 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x555>
  996f72:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  996f79:	00 
  996f7a:	e8 91 39 fe ff       	call   97a910 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEEECsaEGsyZiti5M_10hypersolve>
  996f7f:	41 b4 02             	mov    $0x2,%r12b
  996f82:	e9 21 01 00 00       	jmp    9970a8 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x578>
  996f87:	41 b4 02             	mov    $0x2,%r12b
  996f8a:	44 89 e0             	mov    %r12d,%eax
  996f8d:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
  996f94:	5b                   	pop    %rbx
  996f95:	41 5c                	pop    %r12
  996f97:	41 5d                	pop    %r13
  996f99:	41 5e                	pop    %r14
  996f9b:	41 5f                	pop    %r15
  996f9d:	5d                   	pop    %rbp
  996f9e:	c3                   	ret
  996f9f:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  996fa6:	00 
  996fa7:	48 89 f3             	mov    %rsi,%rbx
  996faa:	4c 89 fa             	mov    %r15,%rdx
  996fad:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
  996fb2:	ff 15 b0 77 35 00    	call   *0x3577b0(%rip)        # cee768 <_DYNAMIC+0x1320>
  996fb8:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  996fbd:	48 89 de             	mov    %rbx,%rsi
  996fc0:	4c 89 fa             	mov    %r15,%rdx
  996fc3:	4c 89 f1             	mov    %r14,%rcx
  996fc6:	ff 15 9c 77 35 00    	call   *0x35779c(%rip)        # cee768 <_DYNAMIC+0x1320>
  996fcc:	44 89 64 24 10       	mov    %r12d,0x10(%rsp)
  996fd1:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%rsp)
  996fd8:	4c 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%r8
  996fdf:	00 
  996fe0:	4c 8d 4c 24 70       	lea    0x70(%rsp),%r9
  996fe5:	48 89 9c 24 a8 00 00 	mov    %rbx,0xa8(%rsp)
  996fec:	00 
  996fed:	48 89 df             	mov    %rbx,%rdi
  996ff0:	4c 89 fe             	mov    %r15,%rsi
  996ff3:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
  996ff8:	4c 89 f1             	mov    %r14,%rcx
  996ffb:	e8 e0 9a ff ff       	call   990ae0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  997000:	41 b4 02             	mov    $0x2,%r12b
  997003:	a8 01                	test   $0x1,%al
  997005:	0f 84 9d 00 00 00    	je     9970a8 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x578>
  99700b:	4c 89 fb             	mov    %r15,%rbx
  99700e:	48 83 fa 02          	cmp    $0x2,%rdx
  997012:	45 89 ec             	mov    %r13d,%r12d
  997015:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
  99701c:	00 
  99701d:	0f 83 d6 fe ff ff    	jae    996ef9 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x3c9>
  997023:	48 01 ea             	add    %rbp,%rdx
  997026:	48 83 fa 01          	cmp    $0x1,%rdx
  99702a:	eb 78                	jmp    9970a4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x574>
  99702c:	49 89 dc             	mov    %rbx,%r12
  99702f:	49 c1 e4 04          	shl    $0x4,%r12
  997033:	4b 8d 3c 64          	lea    (%r12,%r12,2),%rdi
  997037:	48 83 c7 d0          	add    $0xffffffffffffffd0,%rdi
  99703b:	48 c1 ef 04          	shr    $0x4,%rdi
  99703f:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
  997046:	aa aa aa 
  997049:	48 0f af f8          	imul   %rax,%rdi
  99704d:	ff 15 6d 67 35 00    	call   *0x35676d(%rip)        # ced7c0 <_DYNAMIC+0x378>
  997053:	4b 8d 14 64          	lea    (%r12,%r12,2),%rdx
  997057:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  99705c:	48 8d 3c 11          	lea    (%rcx,%rdx,1),%rdi
  997060:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  997065:	80 7f d0 00          	cmpb   $0x0,-0x30(%rdi)
  997069:	74 4f                	je     9970ba <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x58a>
  99706b:	f0 48 ff 08          	lock decq (%rax)
  99706f:	0f 85 4d fd ff ff    	jne    996dc2 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  997075:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  99707a:	ff 15 30 66 35 00    	call   *0x356630(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997080:	e9 3d fd ff ff       	jmp    996dc2 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  997085:	48 03 9c 24 20 01 00 	add    0x120(%rsp),%rbx
  99708c:	00 
  99708d:	0f 82 df fe ff ff    	jb     996f72 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x442>
  997093:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  99709a:	00 
  99709b:	e8 70 38 fe ff       	call   97a910 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEEECsaEGsyZiti5M_10hypersolve>
  9970a0:	48 83 fb 01          	cmp    $0x1,%rbx
  9970a4:	41 0f 94 c4          	sete   %r12b
  9970a8:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  9970af:	00 
  9970b0:	e8 7b 48 fe ff       	call   97b930 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9970b5:	e9 d0 fe ff ff       	jmp    996f8a <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x45a>
  9970ba:	48 89 94 24 a0 00 00 	mov    %rdx,0xa0(%rsp)
  9970c1:	00 
  9970c2:	48 83 c7 e0          	add    $0xffffffffffffffe0,%rdi
  9970c6:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
  9970cb:	e8 10 69 00 00       	call   99d9e0 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCsaEGsyZiti5M_10hypersolve>
  9970d0:	49 89 c4             	mov    %rax,%r12
  9970d3:	f0 48 ff 00          	lock incq (%rax)
  9970d7:	0f 8e 54 02 00 00    	jle    997331 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x801>
  9970dd:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
  9970e2:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
  9970e7:	4c 89 e0             	mov    %r12,%rax
  9970ea:	48 83 fb 03          	cmp    $0x3,%rbx
  9970ee:	0f 82 58 01 00 00    	jb     99724c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x71c>
  9970f4:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  9970f9:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  9970fd:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
  997104:	00 
  997105:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  99710c:	00 
  99710d:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
  997114:	00 
  997115:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  99711a:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
  99711f:	48 8b 94 24 10 01 00 	mov    0x110(%rsp),%rdx
  997126:	00 
  997127:	49 8d 4e 10          	lea    0x10(%r14),%rcx
  99712b:	e8 d0 3b 00 00       	call   99ad00 <_RNvNtCsaEGsyZiti5M_10hypersolve8interval25rational_interval_product>
  997130:	4c 8b a4 24 a0 00 00 	mov    0xa0(%rsp),%r12
  997137:	00 
  997138:	49 8d 7c 24 a0       	lea    -0x60(%r12),%rdi
  99713d:	48 89 bc 24 18 01 00 	mov    %rdi,0x118(%rsp)
  997144:	00 
  997145:	48 c1 ef 04          	shr    $0x4,%rdi
  997149:	48 b9 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rcx
  997150:	aa aa aa 
  997153:	48 0f af f9          	imul   %rcx,%rdi
  997157:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
  99715c:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
  997161:	ff 15 59 66 35 00    	call   *0x356659(%rip)        # ced7c0 <_DYNAMIC+0x378>
  997167:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  99716e:	00 
  99716f:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  997174:	42 80 7c 21 a0 00    	cmpb   $0x0,-0x60(%rcx,%r12,1)
  99717a:	0f 85 26 01 00 00    	jne    9972a6 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x776>
  997180:	48 8b 8c 24 08 01 00 	mov    0x108(%rsp),%rcx
  997187:	00 
  997188:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
  99718c:	48 89 c6             	mov    %rax,%rsi
  99718f:	e8 dc 60 00 00       	call   99d270 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalINtNtNtCsevLNFiNqfJP_4core3ops5arith3MulBU_E3mulCsaEGsyZiti5M_10hypersolve>
  997194:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  99719b:	00 
  99719c:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
  9971a1:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
  9971a6:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9971ab:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  9971b2:	00 
  9971b3:	ff 15 8f 6e 35 00    	call   *0x356e8f(%rip)        # cee048 <_DYNAMIC+0xc00>
  9971b9:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  9971c0:	00 
  9971c1:	f0 49 ff 0c 24       	lock decq (%r12)
  9971c6:	75 0b                	jne    9971d3 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6a3>
  9971c8:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9971cd:	ff 15 dd 64 35 00    	call   *0x3564dd(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9971d3:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  9971d8:	f0 48 ff 08          	lock decq (%rax)
  9971dc:	75 0b                	jne    9971e9 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6b9>
  9971de:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  9971e3:	ff 15 c7 64 35 00    	call   *0x3564c7(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9971e9:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  9971f0:	00 
  9971f1:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  9971f6:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
  9971fb:	48 8b b4 24 b0 00 00 	mov    0xb0(%rsp),%rsi
  997202:	00 
  997203:	e8 d8 55 00 00       	call   99c7e0 <_RNvXs1l_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCsaEGsyZiti5M_10hypersolve>
  997208:	49 89 c4             	mov    %rax,%r12
  99720b:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  997210:	f0 48 ff 08          	lock decq (%rax)
  997214:	75 0b                	jne    997221 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6f1>
  997216:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  99721b:	ff 15 8f 64 35 00    	call   *0x35648f(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997221:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
  997226:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
  99722d:	00 
  99722e:	48 83 f8 60          	cmp    $0x60,%rax
  997232:	74 13                	je     997247 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x717>
  997234:	48 83 c0 d0          	add    $0xffffffffffffffd0,%rax
  997238:	48 83 bc 24 18 01 00 	cmpq   $0x60,0x118(%rsp)
  99723f:	00 60 
  997241:	0f 83 c6 fe ff ff    	jae    99710d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x5dd>
  997247:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  99724c:	41 b7 01             	mov    $0x1,%r15b
  99724f:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  997253:	74 0a                	je     99725f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x72f>
  997255:	41 80 7c 24 64 00    	cmpb   $0x0,0x64(%r12)
  99725b:	41 0f 94 c7          	sete   %r15b
  99725f:	f0 49 ff 0c 24       	lock decq (%r12)
  997264:	75 0b                	jne    997271 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x741>
  997266:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  99726b:	ff 15 3f 64 35 00    	call   *0x35643f(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997271:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  997276:	f0 48 ff 08          	lock decq (%rax)
  99727a:	75 0b                	jne    997287 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x757>
  99727c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  997281:	ff 15 29 64 35 00    	call   *0x356429(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997287:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  99728c:	f0 48 ff 08          	lock decq (%rax)
  997290:	0f 85 8b fb ff ff    	jne    996e21 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f1>
  997296:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  99729b:	ff 15 0f 64 35 00    	call   *0x35640f(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9972a1:	e9 7b fb ff ff       	jmp    996e21 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f1>
  9972a6:	f0 48 ff 08          	lock decq (%rax)
  9972aa:	75 0e                	jne    9972ba <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x78a>
  9972ac:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  9972b3:	00 
  9972b4:	ff 15 f6 63 35 00    	call   *0x3563f6(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9972ba:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  9972bf:	f0 48 ff 08          	lock decq (%rax)
  9972c3:	75 0b                	jne    9972d0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7a0>
  9972c5:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  9972ca:	ff 15 e0 63 35 00    	call   *0x3563e0(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9972d0:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  9972d5:	f0 48 ff 08          	lock decq (%rax)
  9972d9:	75 0b                	jne    9972e6 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7b6>
  9972db:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  9972e0:	ff 15 ca 63 35 00    	call   *0x3563ca(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9972e6:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  9972eb:	f0 48 ff 08          	lock decq (%rax)
  9972ef:	48 8b 9c 24 a8 00 00 	mov    0xa8(%rsp),%rbx
  9972f6:	00 
  9972f7:	4d 89 fe             	mov    %r15,%r14
  9972fa:	75 0b                	jne    997307 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7d7>
  9972fc:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  997301:	ff 15 a9 63 35 00    	call   *0x3563a9(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997307:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  99730c:	f0 48 ff 08          	lock decq (%rax)
  997310:	75 0b                	jne    99731d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7ed>
  997312:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  997317:	ff 15 93 63 35 00    	call   *0x356393(%rip)        # ced6b0 <_DYNAMIC+0x268>
  99731d:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  997322:	f0 48 ff 08          	lock decq (%rax)
  997326:	0f 85 96 fa ff ff    	jne    996dc2 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x292>
  99732c:	e9 44 fd ff ff       	jmp    997075 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x545>
  997331:	0f 0b                	ud2
  997333:	e9 93 00 00 00       	jmp    9973cb <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x89b>
  997338:	48 89 c3             	mov    %rax,%rbx
  99733b:	e9 cb 00 00 00       	jmp    99740b <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8db>
  997340:	e9 a5 00 00 00       	jmp    9973ea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8ba>
  997345:	48 89 c3             	mov    %rax,%rbx
  997348:	e9 ea 00 00 00       	jmp    997437 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x907>
  99734d:	48 89 c3             	mov    %rax,%rbx
  997350:	e9 f8 00 00 00       	jmp    99744d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x91d>
  997355:	48 89 c3             	mov    %rax,%rbx
  997358:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  99735f:	00 
  997360:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  997365:	eb 29                	jmp    997390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  997367:	48 89 c3             	mov    %rax,%rbx
  99736a:	eb 24                	jmp    997390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  99736c:	48 89 c3             	mov    %rax,%rbx
  99736f:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
  997374:	e9 a8 00 00 00       	jmp    997421 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  997379:	eb 50                	jmp    9973cb <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x89b>
  99737b:	48 89 c3             	mov    %rax,%rbx
  99737e:	f0 49 ff 0c 24       	lock decq (%r12)
  997383:	75 0b                	jne    997390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  997385:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  99738a:	ff 15 20 63 35 00    	call   *0x356320(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997390:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
  997397:	00 
  997398:	f0 48 ff 08          	lock decq (%rax)
  99739c:	75 0e                	jne    9973ac <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x87c>
  99739e:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  9973a5:	00 
  9973a6:	ff 15 04 63 35 00    	call   *0x356304(%rip)        # ced6b0 <_DYNAMIC+0x268>
  9973ac:	31 ed                	xor    %ebp,%ebp
  9973ae:	eb 40                	jmp    9973f0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8c0>
  9973b0:	ff 15 e2 62 35 00    	call   *0x3562e2(%rip)        # ced698 <_DYNAMIC+0x250>
  9973b6:	48 89 c3             	mov    %rax,%rbx
  9973b9:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  9973c0:	00 
  9973c1:	e8 4a 35 fe ff       	call   97a910 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEEECsaEGsyZiti5M_10hypersolve>
  9973c6:	e9 a1 00 00 00       	jmp    99746c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x93c>
  9973cb:	48 89 c3             	mov    %rax,%rbx
  9973ce:	eb 51                	jmp    997421 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  9973d0:	e9 94 00 00 00       	jmp    997469 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x939>
  9973d5:	48 89 c3             	mov    %rax,%rbx
  9973d8:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  9973df:	00 
  9973e0:	e8 4b 60 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9973e5:	e9 82 00 00 00       	jmp    99746c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x93c>
  9973ea:	48 89 c3             	mov    %rax,%rbx
  9973ed:	40 b5 01             	mov    $0x1,%bpl
  9973f0:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  9973f5:	f0 48 ff 08          	lock decq (%rax)
  9973f9:	75 0b                	jne    997406 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8d6>
  9973fb:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  997400:	ff 15 aa 62 35 00    	call   *0x3562aa(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997406:	40 84 ed             	test   %bpl,%bpl
  997409:	74 16                	je     997421 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  99740b:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  997410:	f0 48 ff 08          	lock decq (%rax)
  997414:	75 0b                	jne    997421 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x8f1>
  997416:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  99741b:	ff 15 8f 62 35 00    	call   *0x35628f(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997421:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  997426:	f0 48 ff 08          	lock decq (%rax)
  99742a:	75 0b                	jne    997437 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x907>
  99742c:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  997431:	ff 15 79 62 35 00    	call   *0x356279(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997437:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  99743c:	f0 48 ff 08          	lock decq (%rax)
  997440:	75 0b                	jne    99744d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x91d>
  997442:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
  997447:	ff 15 63 62 35 00    	call   *0x356263(%rip)        # ced6b0 <_DYNAMIC+0x268>
  99744d:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  997452:	f0 48 ff 08          	lock decq (%rax)
  997456:	0f 85 88 00 00 00    	jne    9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  99745c:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
  997461:	ff 15 49 62 35 00    	call   *0x356249(%rip)        # ced6b0 <_DYNAMIC+0x268>
  997467:	eb 7b                	jmp    9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  997469:	48 89 c3             	mov    %rax,%rbx
  99746c:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  997473:	00 
  997474:	e8 b7 44 fe ff       	call   97b930 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  997479:	e9 80 00 00 00       	jmp    9974fe <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9ce>
  99747e:	ff 15 14 62 35 00    	call   *0x356214(%rip)        # ced698 <_DYNAMIC+0x250>
  997484:	48 89 c3             	mov    %rax,%rbx
  997487:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  99748c:	48 85 c0             	test   %rax,%rax
  99748f:	74 53                	je     9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  997491:	48 c1 e0 04          	shl    $0x4,%rax
  997495:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  997499:	ba 08 00 00 00       	mov    $0x8,%edx
  99749e:	4c 89 e7             	mov    %r12,%rdi
  9974a1:	ff 15 f9 61 35 00    	call   *0x3561f9(%rip)        # ced6a0 <_DYNAMIC+0x258>
  9974a7:	eb 3b                	jmp    9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  9974a9:	48 89 c3             	mov    %rax,%rbx
  9974ac:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9974b1:	e8 7a 44 fe ff       	call   97b930 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9974b6:	eb 2c                	jmp    9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  9974b8:	ff 15 da 61 35 00    	call   *0x3561da(%rip)        # ced698 <_DYNAMIC+0x250>
  9974be:	48 89 c3             	mov    %rax,%rbx
  9974c1:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9974c6:	e8 65 5f fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9974cb:	eb 17                	jmp    9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  9974cd:	48 89 c3             	mov    %rax,%rbx
  9974d0:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  9974d5:	e8 56 5f fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9974da:	eb 08                	jmp    9974e4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9b4>
  9974dc:	48 89 c3             	mov    %rax,%rbx
  9974df:	eb 10                	jmp    9974f1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x9c1>
  9974e1:	48 89 c3             	mov    %rax,%rbx
  9974e4:	48 8d bc 24 58 01 00 	lea    0x158(%rsp),%rdi
  9974eb:	00 
  9974ec:	e8 3f 5f fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9974f1:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  9974f8:	00 
  9974f9:	e8 32 5f fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  9974fe:	48 89 df             	mov    %rbx,%rdi
  997501:	e8 2a 81 30 00       	call   c9f630 <_Unwind_Resume@plt>
  997506:	ff 15 8c 61 35 00    	call   *0x35618c(%rip)        # ced698 <_DYNAMIC+0x250>
