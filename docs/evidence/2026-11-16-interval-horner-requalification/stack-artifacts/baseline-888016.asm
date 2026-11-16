
/tmp/interval-refactor/horner-current/stack-artifacts/baseline:     file format elf64-x86-64


Disassembly of section .text:

00000000000d8cd0 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke>:
   d8cd0:	55                   	push   %rbp
   d8cd1:	41 57                	push   %r15
   d8cd3:	41 56                	push   %r14
   d8cd5:	41 55                	push   %r13
   d8cd7:	41 54                	push   %r12
   d8cd9:	53                   	push   %rbx
   d8cda:	48 81 ec f8 06 00 00 	sub    $0x6f8,%rsp
   d8ce1:	48 89 fb             	mov    %rdi,%rbx
   d8ce4:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   d8ceb:	00 00 80 
   d8cee:	48 8b 47 18          	mov    0x18(%rdi),%rax
   d8cf2:	48 89 c1             	mov    %rax,%rcx
   d8cf5:	4c 31 f9             	xor    %r15,%rcx
   d8cf8:	48 85 c0             	test   %rax,%rax
   d8cfb:	b8 02 00 00 00       	mov    $0x2,%eax
   d8d00:	48 0f 48 c1          	cmovs  %rcx,%rax
   d8d04:	48 85 c0             	test   %rax,%rax
   d8d07:	74 58                	je     d8d61 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x91>
   d8d09:	48 83 f8 01          	cmp    $0x1,%rax
   d8d0d:	0f 85 d1 00 00 00    	jne    d8de4 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x114>
   d8d13:	48 8d 53 38          	lea    0x38(%rbx),%rdx
   d8d17:	48 8d 4b 68          	lea    0x68(%rbx),%rcx
   d8d1b:	48 8b 7b 28          	mov    0x28(%rbx),%rdi
   d8d1f:	48 8b 73 30          	mov    0x30(%rbx),%rsi
   d8d23:	44 8b 83 98 00 00 00 	mov    0x98(%rbx),%r8d
   d8d2a:	ff 15 a0 cb 1c 00    	call   *0x1ccba0(%rip)        # 2a58d0 <_DYNAMIC+0x3a8>
   d8d30:	88 84 24 e0 00 00 00 	mov    %al,0xe0(%rsp)
   d8d37:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
   d8d3e:	00 
   d8d3f:	0f b6 ac 24 e0 00 00 	movzbl 0xe0(%rsp),%ebp
   d8d46:	00 
   d8d47:	4d 8d 67 01          	lea    0x1(%r15),%r12
   d8d4b:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
   d8d52:	48 83 f8 fe          	cmp    $0xfffffffffffffffe,%rax
   d8d56:	0f 85 08 02 00 00    	jne    d8f64 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x294>
   d8d5c:	e9 49 02 00 00       	jmp    d8faa <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2da>
   d8d61:	48 8d 73 20          	lea    0x20(%rbx),%rsi
   d8d65:	48 8b 93 10 01 00 00 	mov    0x110(%rbx),%rdx
   d8d6c:	48 8b 8b 18 01 00 00 	mov    0x118(%rbx),%rcx
   d8d73:	44 0f b6 83 31 01 00 	movzbl 0x131(%rbx),%r8d
   d8d7a:	00 
   d8d7b:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   d8d82:	00 
   d8d83:	ff 15 4f cb 1c 00    	call   *0x1ccb4f(%rip)        # 2a58d8 <_DYNAMIC+0x3b0>
   d8d89:	4c 8d b4 24 78 02 00 	lea    0x278(%rsp),%r14
   d8d90:	00 
   d8d91:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
   d8d98:	00 
   d8d99:	4c 8b 25 08 ca 1c 00 	mov    0x1cca08(%rip),%r12        # 2a57a8 <memcpy@GLIBC_2.14>
   d8da0:	ba b0 00 00 00       	mov    $0xb0,%edx
   d8da5:	4c 89 f7             	mov    %r14,%rdi
   d8da8:	41 ff d4             	call   *%r12
   d8dab:	0f b6 ac 24 78 02 00 	movzbl 0x278(%rsp),%ebp
   d8db2:	00 
   d8db3:	48 8d b4 24 79 02 00 	lea    0x279(%rsp),%rsi
   d8dba:	00 
   d8dbb:	48 8d bc 24 b9 04 00 	lea    0x4b9(%rsp),%rdi
   d8dc2:	00 
   d8dc3:	ba af 00 00 00       	mov    $0xaf,%edx
   d8dc8:	41 ff d4             	call   *%r12
   d8dcb:	4d 89 fc             	mov    %r15,%r12
   d8dce:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
   d8dd5:	48 83 f8 fe          	cmp    $0xfffffffffffffffe,%rax
   d8dd9:	0f 85 85 01 00 00    	jne    d8f64 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x294>
   d8ddf:	e9 c6 01 00 00       	jmp    d8faa <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2da>
   d8de4:	48 8d 73 18          	lea    0x18(%rbx),%rsi
   d8de8:	4c 8d 83 30 01 00 00 	lea    0x130(%rbx),%r8
   d8def:	48 8d 53 48          	lea    0x48(%rbx),%rdx
   d8df3:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
   d8dfa:	00 
   d8dfb:	b9 01 00 00 00       	mov    $0x1,%ecx
   d8e00:	ff 15 da ca 1c 00    	call   *0x1ccada(%rip)        # 2a58e0 <_DYNAMIC+0x3b8>
   d8e06:	48 83 bc 24 00 03 00 	cmpq   $0xffffffffffffffff,0x300(%rsp)
   d8e0d:	00 ff 
   d8e0f:	0f 84 bf 00 00 00    	je     d8ed4 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x204>
   d8e15:	48 89 e7             	mov    %rsp,%rdi
   d8e18:	ff 15 ba c9 1c 00    	call   *0x1cc9ba(%rip)        # 2a57d8 <_DYNAMIC+0x2b0>
   d8e1e:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   d8e25:	00 
   d8e26:	ff 15 ac c9 1c 00    	call   *0x1cc9ac(%rip)        # 2a57d8 <_DYNAMIC+0x2b0>
   d8e2c:	48 8d b4 24 00 03 00 	lea    0x300(%rsp),%rsi
   d8e33:	00 
   d8e34:	0f 10 04 24          	movups (%rsp),%xmm0
   d8e38:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
   d8e3d:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
   d8e42:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
   d8e47:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
   d8e4c:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
   d8e51:	0f 10 84 24 e0 00 00 	movups 0xe0(%rsp),%xmm0
   d8e58:	00 
   d8e59:	0f 10 8c 24 f0 00 00 	movups 0xf0(%rsp),%xmm1
   d8e60:	00 
   d8e61:	0f 10 94 24 00 01 00 	movups 0x100(%rsp),%xmm2
   d8e68:	00 
   d8e69:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
   d8e6e:	0f 29 4c 24 70       	movaps %xmm1,0x70(%rsp)
   d8e73:	0f 29 94 24 80 00 00 	movaps %xmm2,0x80(%rsp)
   d8e7a:	00 
   d8e7b:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   d8e82:	00 
   d8e83:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   d8e88:	b9 02 00 00 00       	mov    $0x2,%ecx
   d8e8d:	45 31 c0             	xor    %r8d,%r8d
   d8e90:	ff 15 42 ca 1c 00    	call   *0x1cca42(%rip)        # 2a58d8 <_DYNAMIC+0x3b0>
   d8e96:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
   d8e9b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   d8ea0:	e8 7b b4 ff ff       	call   d4320 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6iCIOCR9ySL_20horner_stack_harness>
   d8ea5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
   d8eaa:	e8 71 b4 ff ff       	call   d4320 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6iCIOCR9ySL_20horner_stack_harness>
   d8eaf:	4c 8b a4 24 e0 00 00 	mov    0xe0(%rsp),%r12
   d8eb6:	00 
   d8eb7:	48 8d b4 24 e8 00 00 	lea    0xe8(%rsp),%rsi
   d8ebe:	00 
   d8ebf:	48 8d bc 24 10 04 00 	lea    0x410(%rsp),%rdi
   d8ec6:	00 
   d8ec7:	ba a8 00 00 00       	mov    $0xa8,%edx
   d8ecc:	ff 15 d6 c8 1c 00    	call   *0x1cc8d6(%rip)        # 2a57a8 <memcpy@GLIBC_2.14>
   d8ed2:	eb 07                	jmp    d8edb <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x20b>
   d8ed4:	49 c7 c4 fe ff ff ff 	mov    $0xfffffffffffffffe,%r12
   d8edb:	4c 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%r14
   d8ee2:	00 
   d8ee3:	48 8d b4 24 78 02 00 	lea    0x278(%rsp),%rsi
   d8eea:	00 
   d8eeb:	4c 8b 2d b6 c8 1c 00 	mov    0x1cc8b6(%rip),%r13        # 2a57a8 <memcpy@GLIBC_2.14>
   d8ef2:	ba 98 01 00 00       	mov    $0x198,%edx
   d8ef7:	4c 89 f7             	mov    %r14,%rdi
   d8efa:	41 ff d5             	call   *%r13
   d8efd:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
   d8f02:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   d8f07:	48 8d b4 24 10 04 00 	lea    0x410(%rsp),%rsi
   d8f0e:	00 
   d8f0f:	ba a8 00 00 00       	mov    $0xa8,%edx
   d8f14:	41 ff d5             	call   *%r13
   d8f17:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
   d8f1c:	4c 8b a4 24 e0 00 00 	mov    0xe0(%rsp),%r12
   d8f23:	00 
   d8f24:	0f b6 ac 24 e8 00 00 	movzbl 0xe8(%rsp),%ebp
   d8f2b:	00 
   d8f2c:	48 8d b4 24 e9 00 00 	lea    0xe9(%rsp),%rsi
   d8f33:	00 
   d8f34:	48 8d bc 24 b9 04 00 	lea    0x4b9(%rsp),%rdi
   d8f3b:	00 
   d8f3c:	ba 8f 01 00 00       	mov    $0x18f,%edx
   d8f41:	41 ff d5             	call   *%r13
   d8f44:	48 8d bc 24 48 06 00 	lea    0x648(%rsp),%rdi
   d8f4b:	00 
   d8f4c:	ba b0 00 00 00       	mov    $0xb0,%edx
   d8f51:	4c 89 f6             	mov    %r14,%rsi
   d8f54:	41 ff d5             	call   *%r13
   d8f57:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
   d8f5e:	48 83 f8 fe          	cmp    $0xfffffffffffffffe,%rax
   d8f62:	74 46                	je     d8faa <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2da>
   d8f64:	4c 31 f8             	xor    %r15,%rax
   d8f67:	48 83 f8 02          	cmp    $0x2,%rax
   d8f6b:	b9 02 00 00 00       	mov    $0x2,%ecx
   d8f70:	48 0f 42 c8          	cmovb  %rax,%rcx
   d8f74:	48 85 c9             	test   %rcx,%rcx
   d8f77:	74 25                	je     d8f9e <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2ce>
   d8f79:	48 83 f9 01          	cmp    $0x1,%rcx
   d8f7d:	74 2b                	je     d8faa <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2da>
   d8f7f:	48 8d bb d0 01 00 00 	lea    0x1d0(%rbx),%rdi
   d8f86:	e8 55 b0 ff ff       	call   d3fe0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve22algebraic_tensor_image26AlgebraicTensorImageReportECs6iCIOCR9ySL_20horner_stack_harness>
   d8f8b:	48 83 bb 68 03 00 00 	cmpq   $0xfffffffffffffffe,0x368(%rbx)
   d8f92:	fe 
   d8f93:	74 15                	je     d8faa <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2da>
   d8f95:	48 8d bb 68 03 00 00 	lea    0x368(%rbx),%rdi
   d8f9c:	eb 07                	jmp    d8fa5 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x2d5>
   d8f9e:	48 8d bb d8 01 00 00 	lea    0x1d8(%rbx),%rdi
   d8fa5:	e8 c6 b2 ff ff       	call   d4270 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve9algebraic39AlgebraicRootPolynomialEvaluationReportECs6iCIOCR9ySL_20horner_stack_harness>
   d8faa:	4c 89 a3 d0 01 00 00 	mov    %r12,0x1d0(%rbx)
   d8fb1:	40 88 ab d8 01 00 00 	mov    %bpl,0x1d8(%rbx)
   d8fb8:	48 81 c3 d9 01 00 00 	add    $0x1d9,%rbx
   d8fbf:	48 8d b4 24 b9 04 00 	lea    0x4b9(%rsp),%rsi
   d8fc6:	00 
   d8fc7:	ba 3f 02 00 00       	mov    $0x23f,%edx
   d8fcc:	48 89 df             	mov    %rbx,%rdi
   d8fcf:	ff 15 d3 c7 1c 00    	call   *0x1cc7d3(%rip)        # 2a57a8 <memcpy@GLIBC_2.14>
   d8fd5:	48 81 c4 f8 06 00 00 	add    $0x6f8,%rsp
   d8fdc:	5b                   	pop    %rbx
   d8fdd:	41 5c                	pop    %r12
   d8fdf:	41 5d                	pop    %r13
   d8fe1:	41 5e                	pop    %r14
   d8fe3:	41 5f                	pop    %r15
   d8fe5:	5d                   	pop    %rbp
   d8fe6:	c3                   	ret
   d8fe7:	48 83 bb 68 03 00 00 	cmpq   $0xfffffffffffffffe,0x368(%rbx)
   d8fee:	fe 
   d8fef:	74 40                	je     d9031 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x361>
   d8ff1:	48 8d bb 68 03 00 00 	lea    0x368(%rbx),%rdi
   d8ff8:	e8 73 b2 ff ff       	call   d4270 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve9algebraic39AlgebraicRootPolynomialEvaluationReportECs6iCIOCR9ySL_20horner_stack_harness>
   d8ffd:	eb 32                	jmp    d9031 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x361>
   d8fff:	ff 15 63 c7 1c 00    	call   *0x1cc763(%rip)        # 2a5768 <_DYNAMIC+0x240>
   d9005:	4c 89 f7             	mov    %r14,%rdi
   d9008:	e8 13 b3 ff ff       	call   d4320 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6iCIOCR9ySL_20horner_stack_harness>
   d900d:	eb 53                	jmp    d9062 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x392>
   d900f:	ff 15 53 c7 1c 00    	call   *0x1cc753(%rip)        # 2a5768 <_DYNAMIC+0x240>
   d9015:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   d901a:	e8 d1 a4 ff ff       	call   d34f0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueANtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4Realj2_ECs6iCIOCR9ySL_20horner_stack_harness>
   d901f:	eb 41                	jmp    d9062 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x392>
   d9021:	48 89 e7             	mov    %rsp,%rdi
   d9024:	e8 f7 b2 ff ff       	call   d4320 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6iCIOCR9ySL_20horner_stack_harness>
   d9029:	eb 37                	jmp    d9062 <_RNvCs6iCIOCR9ySL_20horner_stack_harness6invoke+0x392>
   d902b:	ff 15 37 c7 1c 00    	call   *0x1cc737(%rip)        # 2a5768 <_DYNAMIC+0x240>
   d9031:	4c 89 a3 d0 01 00 00 	mov    %r12,0x1d0(%rbx)
   d9038:	40 88 ab d8 01 00 00 	mov    %bpl,0x1d8(%rbx)
   d903f:	48 81 c3 d9 01 00 00 	add    $0x1d9,%rbx
   d9046:	48 8d b4 24 b9 04 00 	lea    0x4b9(%rsp),%rsi
   d904d:	00 
   d904e:	ba 3f 02 00 00       	mov    $0x23f,%edx
   d9053:	48 89 df             	mov    %rbx,%rdi
   d9056:	ff 15 4c c7 1c 00    	call   *0x1cc74c(%rip)        # 2a57a8 <memcpy@GLIBC_2.14>
   d905c:	ff 15 86 c8 1c 00    	call   *0x1cc886(%rip)        # 2a58e8 <_DYNAMIC+0x3c0>
   d9062:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
   d9069:	00 
   d906a:	e8 71 af ff ff       	call   d3fe0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs6IjHMNHnq5H_10hypersolve22algebraic_tensor_image26AlgebraicTensorImageReportECs6iCIOCR9ySL_20horner_stack_harness>
   d906f:	ff 15 73 c8 1c 00    	call   *0x1cc873(%rip)        # 2a58e8 <_DYNAMIC+0x3c0>
   d9075:	ff 15 ed c6 1c 00    	call   *0x1cc6ed(%rip)        # 2a5768 <_DYNAMIC+0x240>
   d907b:	ff 15 67 c8 1c 00    	call   *0x1cc867(%rip)        # 2a58e8 <_DYNAMIC+0x3c0>
