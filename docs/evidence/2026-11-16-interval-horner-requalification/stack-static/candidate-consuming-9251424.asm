
/tmp/interval-refactor/horner-current/artifacts-candidate-consuming/certification:     file format elf64-x86-64


Disassembly of section .text:

00000000008d2a60 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership>:
  8d2a60:	55                   	push   %rbp
  8d2a61:	41 57                	push   %r15
  8d2a63:	41 56                	push   %r14
  8d2a65:	41 55                	push   %r13
  8d2a67:	41 54                	push   %r12
  8d2a69:	53                   	push   %rbx
  8d2a6a:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
  8d2a71:	44 89 cd             	mov    %r9d,%ebp
  8d2a74:	45 89 c4             	mov    %r8d,%r12d
  8d2a77:	48 89 cb             	mov    %rcx,%rbx
  8d2a7a:	49 89 d6             	mov    %rdx,%r14
  8d2a7d:	49 89 f7             	mov    %rsi,%r15
  8d2a80:	49 89 fd             	mov    %rdi,%r13
  8d2a83:	48 89 d7             	mov    %rdx,%rdi
  8d2a86:	48 89 ce             	mov    %rcx,%rsi
  8d2a89:	44 89 c2             	mov    %r8d,%edx
  8d2a8c:	e8 3f 8e 00 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8d2a91:	3c fe                	cmp    $0xfe,%al
  8d2a93:	0f 84 ef 03 00 00    	je     8d2e88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x428>
  8d2a99:	0f b6 c0             	movzbl %al,%eax
  8d2a9c:	3d ff 00 00 00       	cmp    $0xff,%eax
  8d2aa1:	75 73                	jne    8d2b16 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xb6>
  8d2aa3:	89 6c 24 78          	mov    %ebp,0x78(%rsp)
  8d2aa7:	4c 89 f1             	mov    %r14,%rcx
  8d2aaa:	48 8b 2d 37 e0 41 00 	mov    0x41e037(%rip),%rbp        # cf0ae8 <_DYNAMIC+0x13f0>
  8d2ab1:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  8d2ab8:	00 
  8d2ab9:	4c 89 ee             	mov    %r13,%rsi
  8d2abc:	4c 89 fa             	mov    %r15,%rdx
  8d2abf:	ff d5                	call   *%rbp
  8d2ac1:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  8d2ac8:	00 
  8d2ac9:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  8d2ace:	4c 89 ee             	mov    %r13,%rsi
  8d2ad1:	4d 89 fd             	mov    %r15,%r13
  8d2ad4:	4c 89 fa             	mov    %r15,%rdx
  8d2ad7:	49 89 df             	mov    %rbx,%r15
  8d2ada:	48 89 d9             	mov    %rbx,%rcx
  8d2add:	ff d5                	call   *%rbp
  8d2adf:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2ae4:	ff 15 76 cf 41 00    	call   *0x41cf76(%rip)        # cefa60 <_DYNAMIC+0x368>
  8d2aea:	4c 89 eb             	mov    %r13,%rbx
  8d2aed:	45 0f b6 ec          	movzbl %r12b,%r13d
  8d2af1:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  8d2af8:	00 
  8d2af9:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  8d2afe:	44 89 ea             	mov    %r13d,%edx
  8d2b01:	e8 ca 8d 00 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8d2b06:	3c fe                	cmp    $0xfe,%al
  8d2b08:	75 14                	jne    8d2b1e <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xbe>
  8d2b0a:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2b0f:	e8 2c 75 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d2b14:	eb 42                	jmp    8d2b58 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xf8>
  8d2b16:	45 31 e4             	xor    %r12d,%r12d
  8d2b19:	e9 6d 03 00 00       	jmp    8d2e8b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  8d2b1e:	89 c5                	mov    %eax,%ebp
  8d2b20:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2b25:	e8 16 75 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d2b2a:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2b2f:	ff 15 2b cf 41 00    	call   *0x41cf2b(%rip)        # cefa60 <_DYNAMIC+0x368>
  8d2b35:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  8d2b3c:	00 
  8d2b3d:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  8d2b42:	44 89 ea             	mov    %r13d,%edx
  8d2b45:	e8 86 8d 00 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8d2b4a:	3c fe                	cmp    $0xfe,%al
  8d2b4c:	75 2c                	jne    8d2b7a <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x11a>
  8d2b4e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2b53:	e8 e8 74 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d2b58:	41 b4 02             	mov    $0x2,%r12b
  8d2b5b:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  8d2b62:	00 
  8d2b63:	e8 d8 74 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d2b68:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  8d2b6f:	00 
  8d2b70:	e8 cb 74 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d2b75:	e9 11 03 00 00       	jmp    8d2e8b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  8d2b7a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  8d2b7e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2b83:	e8 b8 74 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d2b88:	89 ef                	mov    %ebp,%edi
  8d2b8a:	40 84 ff             	test   %dil,%dil
  8d2b8d:	0f 94 c1             	sete   %cl
  8d2b90:	8b 74 24 24          	mov    0x24(%rsp),%esi
  8d2b94:	40 84 f6             	test   %sil,%sil
  8d2b97:	0f 94 c0             	sete   %al
  8d2b9a:	89 ca                	mov    %ecx,%edx
  8d2b9c:	08 c2                	or     %al,%dl
  8d2b9e:	88 54 24 23          	mov    %dl,0x23(%rsp)
  8d2ba2:	80 fa 01             	cmp    $0x1,%dl
  8d2ba5:	74 16                	je     8d2bbd <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x15d>
  8d2ba7:	48 83 fb 04          	cmp    $0x4,%rbx
  8d2bab:	0f 92 c2             	setb   %dl
  8d2bae:	40 38 f7             	cmp    %sil,%dil
  8d2bb1:	40 0f 95 c6          	setne  %sil
  8d2bb5:	41 b4 01             	mov    $0x1,%r12b
  8d2bb8:	40 84 f2             	test   %sil,%dl
  8d2bbb:	75 9e                	jne    8d2b5b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xfb>
  8d2bbd:	8b 54 24 78          	mov    0x78(%rsp),%edx
  8d2bc1:	20 ca                	and    %cl,%dl
  8d2bc3:	0f b6 ca             	movzbl %dl,%ecx
  8d2bc6:	22 84 24 90 01 00 00 	and    0x190(%rsp),%al
  8d2bcd:	0f b6 c0             	movzbl %al,%eax
  8d2bd0:	48 89 8c 24 f0 00 00 	mov    %rcx,0xf0(%rsp)
  8d2bd7:	00 
  8d2bd8:	48 01 c8             	add    %rcx,%rax
  8d2bdb:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  8d2be0:	48 83 fb 03          	cmp    $0x3,%rbx
  8d2be4:	0f 87 bd 00 00 00    	ja     8d2ca7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x247>
  8d2bea:	48 83 fb 02          	cmp    $0x2,%rbx
  8d2bee:	0f 84 b3 00 00 00    	je     8d2ca7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x247>
  8d2bf4:	0f 10 84 24 f8 00 00 	movups 0xf8(%rsp),%xmm0
  8d2bfb:	00 
  8d2bfc:	0f 10 8c 24 08 01 00 	movups 0x108(%rsp),%xmm1
  8d2c03:	00 
  8d2c04:	0f 10 94 24 18 01 00 	movups 0x118(%rsp),%xmm2
  8d2c0b:	00 
  8d2c0c:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  8d2c13:	00 
  8d2c14:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  8d2c1b:	00 
  8d2c1c:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  8d2c23:	00 
  8d2c24:	0f 10 84 24 28 01 00 	movups 0x128(%rsp),%xmm0
  8d2c2b:	00 
  8d2c2c:	0f 10 8c 24 38 01 00 	movups 0x138(%rsp),%xmm1
  8d2c33:	00 
  8d2c34:	0f 10 94 24 48 01 00 	movups 0x148(%rsp),%xmm2
  8d2c3b:	00 
  8d2c3c:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  8d2c41:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  8d2c46:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  8d2c4b:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
  8d2c50:	0f b6 44 24 24       	movzbl 0x24(%rsp),%eax
  8d2c55:	89 44 24 08          	mov    %eax,0x8(%rsp)
  8d2c59:	40 0f b6 c5          	movzbl %bpl,%eax
  8d2c5d:	89 04 24             	mov    %eax,(%rsp)
  8d2c60:	4c 8d 84 24 80 00 00 	lea    0x80(%rsp),%r8
  8d2c67:	00 
  8d2c68:	4c 8d 4c 24 30       	lea    0x30(%rsp),%r9
  8d2c6d:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  8d2c72:	48 89 de             	mov    %rbx,%rsi
  8d2c75:	4c 89 f2             	mov    %r14,%rdx
  8d2c78:	4c 89 f9             	mov    %r15,%rcx
  8d2c7b:	e8 90 9d ff ff       	call   8cca10 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  8d2c80:	41 b4 02             	mov    $0x2,%r12b
  8d2c83:	a8 01                	test   $0x1,%al
  8d2c85:	0f 84 00 02 00 00    	je     8d2e8b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  8d2c8b:	48 83 fa 02          	cmp    $0x2,%rdx
  8d2c8f:	0f 83 c4 00 00 00    	jae    8d2d59 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f9>
  8d2c95:	48 03 54 24 78       	add    0x78(%rsp),%rdx
  8d2c9a:	48 83 fa 01          	cmp    $0x1,%rdx
  8d2c9e:	41 0f 94 c4          	sete   %r12b
  8d2ca2:	e9 e4 01 00 00       	jmp    8d2e8b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  8d2ca7:	41 80 3e 00          	cmpb   $0x0,(%r14)
  8d2cab:	75 1c                	jne    8d2cc9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  8d2cad:	41 80 3f 00          	cmpb   $0x0,(%r15)
  8d2cb1:	75 16                	jne    8d2cc9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  8d2cb3:	49 8d 7e 10          	lea    0x10(%r14),%rdi
  8d2cb7:	49 8d 77 10          	lea    0x10(%r15),%rsi
  8d2cbb:	ff 15 af d0 41 00    	call   *0x41d0af(%rip)        # cefd70 <_DYNAMIC+0x678>
  8d2cc1:	84 c0                	test   %al,%al
  8d2cc3:	0f 8e 5c 02 00 00    	jle    8d2f25 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x4c5>
  8d2cc9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2cce:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  8d2cd3:	48 89 da             	mov    %rbx,%rdx
  8d2cd6:	e8 a5 eb fe ff       	call   8c1880 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation10derivative>
  8d2cdb:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
  8d2ce0:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8d2ce5:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
  8d2cea:	4c 89 f2             	mov    %r14,%rdx
  8d2ced:	4c 89 f9             	mov    %r15,%rcx
  8d2cf0:	45 89 e8             	mov    %r13d,%r8d
  8d2cf3:	e8 c8 75 ff ff       	call   8ca2c0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero>
  8d2cf8:	41 89 c4             	mov    %eax,%r12d
  8d2cfb:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2d00:	e8 0b 0d ee ff       	call   7b3a10 <_RNvXsp_NtCs1C1lLj4PWSY_5alloc3vecINtB5_3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealENtNtNtCsevLNFiNqfJP_4core3ops4drop4Drop4dropCs1Ga5OsmdBWa_10hypersolve>
  8d2d05:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  8d2d0a:	48 85 c0             	test   %rax,%rax
  8d2d0d:	74 18                	je     8d2d27 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2c7>
  8d2d0f:	48 c1 e0 04          	shl    $0x4,%rax
  8d2d13:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  8d2d17:	ba 08 00 00 00       	mov    $0x8,%edx
  8d2d1c:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  8d2d21:	ff 15 29 cc 41 00    	call   *0x41cc29(%rip)        # cef950 <_DYNAMIC+0x258>
  8d2d27:	41 f6 c4 01          	test   $0x1,%r12b
  8d2d2b:	0f 84 c3 fe ff ff    	je     8d2bf4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x194>
  8d2d31:	40 3a 6c 24 24       	cmp    0x24(%rsp),%bpl
  8d2d36:	0f 95 c0             	setne  %al
  8d2d39:	0f b6 4c 24 23       	movzbl 0x23(%rsp),%ecx
  8d2d3e:	80 f1 01             	xor    $0x1,%cl
  8d2d41:	20 c1                	and    %al,%cl
  8d2d43:	0f b6 c1             	movzbl %cl,%eax
  8d2d46:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
  8d2d4b:	01 c1                	add    %eax,%ecx
  8d2d4d:	83 f9 01             	cmp    $0x1,%ecx
  8d2d50:	41 0f 94 c4          	sete   %r12b
  8d2d54:	e9 02 fe ff ff       	jmp    8d2b5b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xfb>
  8d2d59:	48 83 fb 03          	cmp    $0x3,%rbx
  8d2d5d:	75 34                	jne    8d2d93 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x333>
  8d2d5f:	45 31 c0             	xor    %r8d,%r8d
  8d2d62:	80 7c 24 24 00       	cmpb   $0x0,0x24(%rsp)
  8d2d67:	41 0f 94 c0          	sete   %r8b
  8d2d6b:	31 c9                	xor    %ecx,%ecx
  8d2d6d:	40 84 ed             	test   %bpl,%bpl
  8d2d70:	0f 94 c1             	sete   %cl
  8d2d73:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  8d2d78:	48 8d 77 30          	lea    0x30(%rdi),%rsi
  8d2d7c:	48 8d 57 60          	lea    0x60(%rdi),%rdx
  8d2d80:	45 89 e9             	mov    %r13d,%r9d
  8d2d83:	e8 88 08 00 00       	call   8d3610 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation50quadratic_multiple_variation_has_one_distinct_root>
  8d2d88:	41 89 c4             	mov    %eax,%r12d
  8d2d8b:	3c 02                	cmp    $0x2,%al
  8d2d8d:	0f 85 f8 00 00 00    	jne    8d2e8b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  8d2d93:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  8d2d98:	4c 89 e7             	mov    %r12,%rdi
  8d2d9b:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  8d2da0:	48 89 da             	mov    %rbx,%rdx
  8d2da3:	e8 38 75 fe ff       	call   8ba2e0 <_RINvXNvMNtCs1C1lLj4PWSY_5alloc5sliceSp9to_vec_inNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealNtB3_10ConvertVec6to_vecNtNtB8_5alloc6GlobalECs1Ga5OsmdBWa_10hypersolve>
  8d2da8:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d2daf:	00 
  8d2db0:	4c 89 e6             	mov    %r12,%rsi
  8d2db3:	45 89 ec             	mov    %r13d,%r12d
  8d2db6:	44 89 ea             	mov    %r13d,%edx
  8d2db9:	ff 15 19 cd 41 00    	call   *0x41cd19(%rip)        # cefad8 <_DYNAMIC+0x3e0>
  8d2dbf:	48 83 bc 24 80 00 00 	cmpq   $0xffffffffffffffff,0x80(%rsp)
  8d2dc6:	00 ff 
  8d2dc8:	0f 84 ba 00 00 00    	je     8d2e88 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x428>
  8d2dce:	48 8b ac 24 90 00 00 	mov    0x90(%rsp),%rbp
  8d2dd5:	00 
  8d2dd6:	48 89 ac 24 d0 00 00 	mov    %rbp,0xd0(%rsp)
  8d2ddd:	00 
  8d2dde:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  8d2de5:	00 
  8d2de6:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
  8d2ded:	00 
  8d2dee:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
  8d2df5:	00 
  8d2df6:	48 39 dd             	cmp    %rbx,%rbp
  8d2df9:	0f 85 a1 00 00 00    	jne    8d2ea0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x440>
  8d2dff:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2e04:	48 89 da             	mov    %rbx,%rdx
  8d2e07:	44 89 e1             	mov    %r12d,%ecx
  8d2e0a:	ff 15 78 e1 41 00    	call   *0x41e178(%rip)        # cf0f88 <_DYNAMIC+0x1890>
  8d2e10:	48 83 7c 24 30 ff    	cmpq   $0xffffffffffffffff,0x30(%rsp)
  8d2e16:	74 68                	je     8d2e80 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x420>
  8d2e18:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8d2e1d:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
  8d2e24:	00 
  8d2e25:	0f 10 44 24 30       	movups 0x30(%rsp),%xmm0
  8d2e2a:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  8d2e31:	00 
  8d2e32:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
  8d2e39:	00 
  8d2e3a:	4c 89 f2             	mov    %r14,%rdx
  8d2e3d:	4c 89 f9             	mov    %r15,%rcx
  8d2e40:	45 89 e0             	mov    %r12d,%r8d
  8d2e43:	e8 18 eb fe ff       	call   8c1960 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation11sturm_count>
  8d2e48:	48 83 f8 01          	cmp    $0x1,%rax
  8d2e4c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  8d2e50:	75 21                	jne    8d2e73 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x413>
  8d2e52:	48 89 d3             	mov    %rdx,%rbx
  8d2e55:	84 c0                	test   %al,%al
  8d2e57:	0f 94 c0             	sete   %al
  8d2e5a:	0f b6 8c 24 90 01 00 	movzbl 0x190(%rsp),%ecx
  8d2e61:	00 
  8d2e62:	80 f1 01             	xor    $0x1,%cl
  8d2e65:	20 c1                	and    %al,%cl
  8d2e67:	0f b6 c1             	movzbl %cl,%eax
  8d2e6a:	48 29 c3             	sub    %rax,%rbx
  8d2e6d:	0f 83 0b 01 00 00    	jae    8d2f7e <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x51e>
  8d2e73:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d2e7a:	00 
  8d2e7b:	e8 e0 4e fe ff       	call   8b7d60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEEECs1Ga5OsmdBWa_10hypersolve>
  8d2e80:	41 b4 02             	mov    $0x2,%r12b
  8d2e83:	e9 19 01 00 00       	jmp    8d2fa1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x541>
  8d2e88:	41 b4 02             	mov    $0x2,%r12b
  8d2e8b:	44 89 e0             	mov    %r12d,%eax
  8d2e8e:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
  8d2e95:	5b                   	pop    %rbx
  8d2e96:	41 5c                	pop    %r12
  8d2e98:	41 5d                	pop    %r13
  8d2e9a:	41 5e                	pop    %r14
  8d2e9c:	41 5f                	pop    %r15
  8d2e9e:	5d                   	pop    %rbp
  8d2e9f:	c3                   	ret
  8d2ea0:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d2ea7:	00 
  8d2ea8:	48 89 f3             	mov    %rsi,%rbx
  8d2eab:	48 89 ea             	mov    %rbp,%rdx
  8d2eae:	4c 89 f1             	mov    %r14,%rcx
  8d2eb1:	ff 15 31 dc 41 00    	call   *0x41dc31(%rip)        # cf0ae8 <_DYNAMIC+0x13f0>
  8d2eb7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2ebc:	48 89 de             	mov    %rbx,%rsi
  8d2ebf:	48 89 ea             	mov    %rbp,%rdx
  8d2ec2:	4c 89 f9             	mov    %r15,%rcx
  8d2ec5:	ff 15 1d dc 41 00    	call   *0x41dc1d(%rip)        # cf0ae8 <_DYNAMIC+0x13f0>
  8d2ecb:	44 89 64 24 10       	mov    %r12d,0x10(%rsp)
  8d2ed0:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%rsp)
  8d2ed7:	4c 8d 84 24 80 00 00 	lea    0x80(%rsp),%r8
  8d2ede:	00 
  8d2edf:	4c 8d 4c 24 30       	lea    0x30(%rsp),%r9
  8d2ee4:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
  8d2ee9:	48 89 df             	mov    %rbx,%rdi
  8d2eec:	48 89 ee             	mov    %rbp,%rsi
  8d2eef:	4c 89 f2             	mov    %r14,%rdx
  8d2ef2:	4c 89 f9             	mov    %r15,%rcx
  8d2ef5:	e8 16 9b ff ff       	call   8cca10 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  8d2efa:	41 b4 02             	mov    $0x2,%r12b
  8d2efd:	a8 01                	test   $0x1,%al
  8d2eff:	0f 84 9c 00 00 00    	je     8d2fa1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x541>
  8d2f05:	48 89 eb             	mov    %rbp,%rbx
  8d2f08:	48 83 fa 02          	cmp    $0x2,%rdx
  8d2f0c:	45 89 ec             	mov    %r13d,%r12d
  8d2f0f:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  8d2f14:	0f 83 e5 fe ff ff    	jae    8d2dff <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x39f>
  8d2f1a:	48 03 54 24 78       	add    0x78(%rsp),%rdx
  8d2f1f:	48 83 fa 01          	cmp    $0x1,%rdx
  8d2f23:	eb 78                	jmp    8d2f9d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x53d>
  8d2f25:	49 89 dc             	mov    %rbx,%r12
  8d2f28:	49 c1 e4 04          	shl    $0x4,%r12
  8d2f2c:	4b 8d 3c 64          	lea    (%r12,%r12,2),%rdi
  8d2f30:	48 83 c7 d0          	add    $0xffffffffffffffd0,%rdi
  8d2f34:	48 c1 ef 04          	shr    $0x4,%rdi
  8d2f38:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
  8d2f3f:	aa aa aa 
  8d2f42:	48 0f af f8          	imul   %rax,%rdi
  8d2f46:	ff 15 24 cb 41 00    	call   *0x41cb24(%rip)        # cefa70 <_DYNAMIC+0x378>
  8d2f4c:	4f 8d 24 64          	lea    (%r12,%r12,2),%r12
  8d2f50:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  8d2f55:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
  8d2f59:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  8d2f5e:	80 7f d0 00          	cmpb   $0x0,-0x30(%rdi)
  8d2f62:	74 4f                	je     8d2fb3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x553>
  8d2f64:	f0 48 ff 08          	lock decq (%rax)
  8d2f68:	0f 85 5b fd ff ff    	jne    8d2cc9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  8d2f6e:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  8d2f73:	ff 15 df c9 41 00    	call   *0x41c9df(%rip)        # cef958 <_DYNAMIC+0x260>
  8d2f79:	e9 4b fd ff ff       	jmp    8d2cc9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  8d2f7e:	48 03 9c 24 f0 00 00 	add    0xf0(%rsp),%rbx
  8d2f85:	00 
  8d2f86:	0f 82 e7 fe ff ff    	jb     8d2e73 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x413>
  8d2f8c:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d2f93:	00 
  8d2f94:	e8 c7 4d fe ff       	call   8b7d60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEEECs1Ga5OsmdBWa_10hypersolve>
  8d2f99:	48 83 fb 01          	cmp    $0x1,%rbx
  8d2f9d:	41 0f 94 c4          	sete   %r12b
  8d2fa1:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  8d2fa8:	00 
  8d2fa9:	e8 32 5b fe ff       	call   8b8ae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEECs1Ga5OsmdBWa_10hypersolve>
  8d2fae:	e9 d8 fe ff ff       	jmp    8d2e8b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  8d2fb3:	48 83 c7 e0          	add    $0xffffffffffffffe0,%rdi
  8d2fb7:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
  8d2fbc:	e8 4f a2 00 00       	call   8dd210 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  8d2fc1:	f0 48 ff 00          	lock incq (%rax)
  8d2fc5:	0f 8e b2 01 00 00    	jle    8d317d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x71d>
  8d2fcb:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  8d2fd0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  8d2fd5:	48 83 fb 03          	cmp    $0x3,%rbx
  8d2fd9:	0f 82 2d 01 00 00    	jb     8d310c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6ac>
  8d2fdf:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  8d2fe4:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  8d2fe8:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  8d2fef:	00 
  8d2ff0:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d2ff5:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
  8d2ffa:	49 8d 56 10          	lea    0x10(%r14),%rdx
  8d2ffe:	49 8d 4f 10          	lea    0x10(%r15),%rcx
  8d3002:	e8 99 84 00 00       	call   8db4a0 <_RNvNtCs3yvFvlVLaRc_13hyperinterval8rational12product_hull>
  8d3007:	48 89 84 24 b8 00 00 	mov    %rax,0xb8(%rsp)
  8d300e:	00 
  8d300f:	48 89 54 24 70       	mov    %rdx,0x70(%rsp)
  8d3014:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  8d3019:	f0 48 ff 08          	lock decq (%rax)
  8d301d:	75 0b                	jne    8d302a <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x5ca>
  8d301f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d3024:	ff 15 2e c9 41 00    	call   *0x41c92e(%rip)        # cef958 <_DYNAMIC+0x260>
  8d302a:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  8d302f:	f0 48 ff 08          	lock decq (%rax)
  8d3033:	75 0b                	jne    8d3040 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x5e0>
  8d3035:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  8d303a:	ff 15 18 c9 41 00    	call   *0x41c918(%rip)        # cef958 <_DYNAMIC+0x260>
  8d3040:	49 8d 7c 24 a0       	lea    -0x60(%r12),%rdi
  8d3045:	48 89 bc 24 e8 00 00 	mov    %rdi,0xe8(%rsp)
  8d304c:	00 
  8d304d:	48 c1 ef 04          	shr    $0x4,%rdi
  8d3051:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
  8d3058:	aa aa aa 
  8d305b:	48 0f af f8          	imul   %rax,%rdi
  8d305f:	48 8b 84 24 b8 00 00 	mov    0xb8(%rsp),%rax
  8d3066:	00 
  8d3067:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  8d306c:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8d3071:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  8d3076:	ff 15 f4 c9 41 00    	call   *0x41c9f4(%rip)        # cefa70 <_DYNAMIC+0x378>
  8d307c:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
  8d3083:	00 
  8d3084:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  8d3089:	42 80 7c 21 a0 00    	cmpb   $0x0,-0x60(%rcx,%r12,1)
  8d308f:	0f 85 b6 00 00 00    	jne    8d314b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6eb>
  8d3095:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
  8d309c:	00 
  8d309d:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
  8d30a1:	48 89 c6             	mov    %rax,%rsi
  8d30a4:	e8 f7 99 00 00       	call   8dcaa0 <_RNvXs1s_NtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmeticRNtB6_8RationalINtNtNtCsevLNFiNqfJP_4core3ops5arith3MulBU_E3mulCs1Ga5OsmdBWa_10hypersolve>
  8d30a9:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  8d30b0:	00 
  8d30b1:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  8d30b6:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  8d30bb:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
  8d30c2:	00 
  8d30c3:	e8 78 45 fe ff       	call   8b7640 <_RINvNtCs3yvFvlVLaRc_13hyperinterval8rational17translated_boundsNtNtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmetic8RationalECs1Ga5OsmdBWa_10hypersolve>
  8d30c8:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  8d30cd:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
  8d30d2:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  8d30d9:	00 
  8d30da:	f0 48 ff 08          	lock decq (%rax)
  8d30de:	75 0e                	jne    8d30ee <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x68e>
  8d30e0:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d30e7:	00 
  8d30e8:	ff 15 6a c8 41 00    	call   *0x41c86a(%rip)        # cef958 <_DYNAMIC+0x260>
  8d30ee:	49 83 fc 60          	cmp    $0x60,%r12
  8d30f2:	74 13                	je     8d3107 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6a7>
  8d30f4:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
  8d30f8:	48 83 bc 24 e8 00 00 	cmpq   $0x60,0xe8(%rsp)
  8d30ff:	00 60 
  8d3101:	0f 83 e9 fe ff ff    	jae    8d2ff0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x590>
  8d3107:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  8d310c:	41 b4 01             	mov    $0x1,%r12b
  8d310f:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  8d3113:	74 0d                	je     8d3122 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6c2>
  8d3115:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  8d311a:	80 78 64 00          	cmpb   $0x0,0x64(%rax)
  8d311e:	41 0f 94 c4          	sete   %r12b
  8d3122:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d3127:	e8 a4 6e fe ff       	call   8b9fd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  8d312c:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  8d3131:	f0 48 ff 08          	lock decq (%rax)
  8d3135:	0f 85 ec fb ff ff    	jne    8d2d27 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2c7>
  8d313b:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  8d3140:	ff 15 12 c8 41 00    	call   *0x41c812(%rip)        # cef958 <_DYNAMIC+0x260>
  8d3146:	e9 dc fb ff ff       	jmp    8d2d27 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2c7>
  8d314b:	f0 48 ff 08          	lock decq (%rax)
  8d314f:	75 0e                	jne    8d315f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6ff>
  8d3151:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  8d3158:	00 
  8d3159:	ff 15 f9 c7 41 00    	call   *0x41c7f9(%rip)        # cef958 <_DYNAMIC+0x260>
  8d315f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d3164:	e8 67 6e fe ff       	call   8b9fd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  8d3169:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  8d316e:	f0 48 ff 08          	lock decq (%rax)
  8d3172:	0f 85 51 fb ff ff    	jne    8d2cc9 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  8d3178:	e9 f1 fd ff ff       	jmp    8d2f6e <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x50e>
  8d317d:	0f 0b                	ud2
  8d317f:	e9 8c 00 00 00       	jmp    8d3210 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7b0>
  8d3184:	48 89 c3             	mov    %rax,%rbx
  8d3187:	e9 91 00 00 00       	jmp    8d321d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7bd>
  8d318c:	48 89 c3             	mov    %rax,%rbx
  8d318f:	eb 19                	jmp    8d31aa <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x74a>
  8d3191:	48 89 c3             	mov    %rax,%rbx
  8d3194:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  8d3199:	f0 48 ff 08          	lock decq (%rax)
  8d319d:	75 0b                	jne    8d31aa <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x74a>
  8d319f:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  8d31a4:	ff 15 ae c7 41 00    	call   *0x41c7ae(%rip)        # cef958 <_DYNAMIC+0x260>
  8d31aa:	48 8b 84 24 b8 00 00 	mov    0xb8(%rsp),%rax
  8d31b1:	00 
  8d31b2:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  8d31b7:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8d31bc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  8d31c1:	eb 50                	jmp    8d3213 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7b3>
  8d31c3:	ff 15 7f c7 41 00    	call   *0x41c77f(%rip)        # cef948 <_DYNAMIC+0x250>
  8d31c9:	48 89 c3             	mov    %rax,%rbx
  8d31cc:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  8d31d3:	00 
  8d31d4:	f0 48 ff 08          	lock decq (%rax)
  8d31d8:	75 43                	jne    8d321d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7bd>
  8d31da:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d31e1:	00 
  8d31e2:	ff 15 70 c7 41 00    	call   *0x41c770(%rip)        # cef958 <_DYNAMIC+0x260>
  8d31e8:	eb 33                	jmp    8d321d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7bd>
  8d31ea:	48 89 c3             	mov    %rax,%rbx
  8d31ed:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d31f4:	00 
  8d31f5:	e8 66 4b fe ff       	call   8b7d60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEEECs1Ga5OsmdBWa_10hypersolve>
  8d31fa:	eb 46                	jmp    8d3242 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7e2>
  8d31fc:	eb 41                	jmp    8d323f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7df>
  8d31fe:	48 89 c3             	mov    %rax,%rbx
  8d3201:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8d3208:	00 
  8d3209:	e8 32 6e fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d320e:	eb 32                	jmp    8d3242 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7e2>
  8d3210:	48 89 c3             	mov    %rax,%rbx
  8d3213:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d3218:	e8 b3 6d fe ff       	call   8b9fd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  8d321d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  8d3222:	f0 48 ff 08          	lock decq (%rax)
  8d3226:	0f 85 87 00 00 00    	jne    8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d322c:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  8d3231:	ff 15 21 c7 41 00    	call   *0x41c721(%rip)        # cef958 <_DYNAMIC+0x260>
  8d3237:	eb 7a                	jmp    8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d3239:	ff 15 09 c7 41 00    	call   *0x41c709(%rip)        # cef948 <_DYNAMIC+0x250>
  8d323f:	48 89 c3             	mov    %rax,%rbx
  8d3242:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  8d3249:	00 
  8d324a:	e8 91 58 fe ff       	call   8b8ae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEECs1Ga5OsmdBWa_10hypersolve>
  8d324f:	eb 7c                	jmp    8d32cd <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x86d>
  8d3251:	48 89 c3             	mov    %rax,%rbx
  8d3254:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  8d3259:	48 85 c0             	test   %rax,%rax
  8d325c:	74 55                	je     8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d325e:	48 c1 e0 04          	shl    $0x4,%rax
  8d3262:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  8d3266:	ba 08 00 00 00       	mov    $0x8,%edx
  8d326b:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  8d3270:	ff 15 da c6 41 00    	call   *0x41c6da(%rip)        # cef950 <_DYNAMIC+0x258>
  8d3276:	eb 3b                	jmp    8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d3278:	48 89 c3             	mov    %rax,%rbx
  8d327b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d3280:	e8 5b 58 fe ff       	call   8b8ae0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealEECs1Ga5OsmdBWa_10hypersolve>
  8d3285:	eb 2c                	jmp    8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d3287:	ff 15 bb c6 41 00    	call   *0x41c6bb(%rip)        # cef948 <_DYNAMIC+0x250>
  8d328d:	48 89 c3             	mov    %rax,%rbx
  8d3290:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d3295:	e8 a6 6d fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d329a:	eb 17                	jmp    8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d329c:	48 89 c3             	mov    %rax,%rbx
  8d329f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  8d32a4:	e8 97 6d fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d32a9:	eb 08                	jmp    8d32b3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  8d32ab:	48 89 c3             	mov    %rax,%rbx
  8d32ae:	eb 10                	jmp    8d32c0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  8d32b0:	48 89 c3             	mov    %rax,%rbx
  8d32b3:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  8d32ba:	00 
  8d32bb:	e8 80 6d fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d32c0:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  8d32c7:	00 
  8d32c8:	e8 73 6d fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8d32cd:	48 89 df             	mov    %rbx,%rdi
  8d32d0:	e8 8b e5 3c 00       	call   ca1860 <_Unwind_Resume@plt>
  8d32d5:	ff 15 6d c6 41 00    	call   *0x41c66d(%rip)        # cef948 <_DYNAMIC+0x250>
