
/tmp/interval-refactor/horner-current/stack-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

00000000000d8f30 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke>:
   d8f30:	55                   	push   %rbp
   d8f31:	41 57                	push   %r15
   d8f33:	41 56                	push   %r14
   d8f35:	41 55                	push   %r13
   d8f37:	41 54                	push   %r12
   d8f39:	53                   	push   %rbx
   d8f3a:	48 81 ec f8 06 00 00 	sub    $0x6f8,%rsp
   d8f41:	48 89 fb             	mov    %rdi,%rbx
   d8f44:	49 bf 00 00 00 00 00 	movabs $0x8000000000000000,%r15
   d8f4b:	00 00 80 
   d8f4e:	48 8b 47 18          	mov    0x18(%rdi),%rax
   d8f52:	48 89 c1             	mov    %rax,%rcx
   d8f55:	4c 31 f9             	xor    %r15,%rcx
   d8f58:	48 85 c0             	test   %rax,%rax
   d8f5b:	b8 02 00 00 00       	mov    $0x2,%eax
   d8f60:	48 0f 48 c1          	cmovs  %rcx,%rax
   d8f64:	48 85 c0             	test   %rax,%rax
   d8f67:	74 58                	je     d8fc1 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x91>
   d8f69:	48 83 f8 01          	cmp    $0x1,%rax
   d8f6d:	0f 85 d1 00 00 00    	jne    d9044 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x114>
   d8f73:	48 8d 53 38          	lea    0x38(%rbx),%rdx
   d8f77:	48 8d 4b 68          	lea    0x68(%rbx),%rcx
   d8f7b:	48 8b 7b 28          	mov    0x28(%rbx),%rdi
   d8f7f:	48 8b 73 30          	mov    0x30(%rbx),%rsi
   d8f83:	44 8b 83 98 00 00 00 	mov    0x98(%rbx),%r8d
   d8f8a:	ff 15 28 cd 1c 00    	call   *0x1ccd28(%rip)        # 2a5cb8 <_DYNAMIC+0x3a8>
   d8f90:	88 84 24 e0 00 00 00 	mov    %al,0xe0(%rsp)
   d8f97:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
   d8f9e:	00 
   d8f9f:	0f b6 ac 24 e0 00 00 	movzbl 0xe0(%rsp),%ebp
   d8fa6:	00 
   d8fa7:	4d 8d 67 01          	lea    0x1(%r15),%r12
   d8fab:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
   d8fb2:	48 83 f8 fe          	cmp    $0xfffffffffffffffe,%rax
   d8fb6:	0f 85 08 02 00 00    	jne    d91c4 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x294>
   d8fbc:	e9 49 02 00 00       	jmp    d920a <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2da>
   d8fc1:	48 8d 73 20          	lea    0x20(%rbx),%rsi
   d8fc5:	48 8b 93 10 01 00 00 	mov    0x110(%rbx),%rdx
   d8fcc:	48 8b 8b 18 01 00 00 	mov    0x118(%rbx),%rcx
   d8fd3:	44 0f b6 83 31 01 00 	movzbl 0x131(%rbx),%r8d
   d8fda:	00 
   d8fdb:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   d8fe2:	00 
   d8fe3:	ff 15 d7 cc 1c 00    	call   *0x1cccd7(%rip)        # 2a5cc0 <_DYNAMIC+0x3b0>
   d8fe9:	4c 8d b4 24 78 02 00 	lea    0x278(%rsp),%r14
   d8ff0:	00 
   d8ff1:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
   d8ff8:	00 
   d8ff9:	4c 8b 25 90 cb 1c 00 	mov    0x1ccb90(%rip),%r12        # 2a5b90 <memcpy@GLIBC_2.14>
   d9000:	ba b0 00 00 00       	mov    $0xb0,%edx
   d9005:	4c 89 f7             	mov    %r14,%rdi
   d9008:	41 ff d4             	call   *%r12
   d900b:	0f b6 ac 24 78 02 00 	movzbl 0x278(%rsp),%ebp
   d9012:	00 
   d9013:	48 8d b4 24 79 02 00 	lea    0x279(%rsp),%rsi
   d901a:	00 
   d901b:	48 8d bc 24 b9 04 00 	lea    0x4b9(%rsp),%rdi
   d9022:	00 
   d9023:	ba af 00 00 00       	mov    $0xaf,%edx
   d9028:	41 ff d4             	call   *%r12
   d902b:	4d 89 fc             	mov    %r15,%r12
   d902e:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
   d9035:	48 83 f8 fe          	cmp    $0xfffffffffffffffe,%rax
   d9039:	0f 85 85 01 00 00    	jne    d91c4 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x294>
   d903f:	e9 c6 01 00 00       	jmp    d920a <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2da>
   d9044:	48 8d 73 18          	lea    0x18(%rbx),%rsi
   d9048:	4c 8d 83 30 01 00 00 	lea    0x130(%rbx),%r8
   d904f:	48 8d 53 48          	lea    0x48(%rbx),%rdx
   d9053:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
   d905a:	00 
   d905b:	b9 01 00 00 00       	mov    $0x1,%ecx
   d9060:	ff 15 62 cc 1c 00    	call   *0x1ccc62(%rip)        # 2a5cc8 <_DYNAMIC+0x3b8>
   d9066:	48 83 bc 24 00 03 00 	cmpq   $0xffffffffffffffff,0x300(%rsp)
   d906d:	00 ff 
   d906f:	0f 84 bf 00 00 00    	je     d9134 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x204>
   d9075:	48 89 e7             	mov    %rsp,%rdi
   d9078:	ff 15 42 cb 1c 00    	call   *0x1ccb42(%rip)        # 2a5bc0 <_DYNAMIC+0x2b0>
   d907e:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   d9085:	00 
   d9086:	ff 15 34 cb 1c 00    	call   *0x1ccb34(%rip)        # 2a5bc0 <_DYNAMIC+0x2b0>
   d908c:	48 8d b4 24 00 03 00 	lea    0x300(%rsp),%rsi
   d9093:	00 
   d9094:	0f 10 04 24          	movups (%rsp),%xmm0
   d9098:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
   d909d:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
   d90a2:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
   d90a7:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
   d90ac:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
   d90b1:	0f 10 84 24 e0 00 00 	movups 0xe0(%rsp),%xmm0
   d90b8:	00 
   d90b9:	0f 10 8c 24 f0 00 00 	movups 0xf0(%rsp),%xmm1
   d90c0:	00 
   d90c1:	0f 10 94 24 00 01 00 	movups 0x100(%rsp),%xmm2
   d90c8:	00 
   d90c9:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
   d90ce:	0f 29 4c 24 70       	movaps %xmm1,0x70(%rsp)
   d90d3:	0f 29 94 24 80 00 00 	movaps %xmm2,0x80(%rsp)
   d90da:	00 
   d90db:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   d90e2:	00 
   d90e3:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   d90e8:	b9 02 00 00 00       	mov    $0x2,%ecx
   d90ed:	45 31 c0             	xor    %r8d,%r8d
   d90f0:	ff 15 ca cb 1c 00    	call   *0x1ccbca(%rip)        # 2a5cc0 <_DYNAMIC+0x3b0>
   d90f6:	4c 8d 74 24 60       	lea    0x60(%rsp),%r14
   d90fb:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   d9100:	e8 7b b4 ff ff       	call   d4580 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECseVteb3pHKyv_20horner_stack_harness>
   d9105:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
   d910a:	e8 71 b4 ff ff       	call   d4580 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECseVteb3pHKyv_20horner_stack_harness>
   d910f:	4c 8b a4 24 e0 00 00 	mov    0xe0(%rsp),%r12
   d9116:	00 
   d9117:	48 8d b4 24 e8 00 00 	lea    0xe8(%rsp),%rsi
   d911e:	00 
   d911f:	48 8d bc 24 10 04 00 	lea    0x410(%rsp),%rdi
   d9126:	00 
   d9127:	ba a8 00 00 00       	mov    $0xa8,%edx
   d912c:	ff 15 5e ca 1c 00    	call   *0x1cca5e(%rip)        # 2a5b90 <memcpy@GLIBC_2.14>
   d9132:	eb 07                	jmp    d913b <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x20b>
   d9134:	49 c7 c4 fe ff ff ff 	mov    $0xfffffffffffffffe,%r12
   d913b:	4c 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%r14
   d9142:	00 
   d9143:	48 8d b4 24 78 02 00 	lea    0x278(%rsp),%rsi
   d914a:	00 
   d914b:	4c 8b 2d 3e ca 1c 00 	mov    0x1cca3e(%rip),%r13        # 2a5b90 <memcpy@GLIBC_2.14>
   d9152:	ba 98 01 00 00       	mov    $0x198,%edx
   d9157:	4c 89 f7             	mov    %r14,%rdi
   d915a:	41 ff d5             	call   *%r13
   d915d:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
   d9162:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   d9167:	48 8d b4 24 10 04 00 	lea    0x410(%rsp),%rsi
   d916e:	00 
   d916f:	ba a8 00 00 00       	mov    $0xa8,%edx
   d9174:	41 ff d5             	call   *%r13
   d9177:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
   d917c:	4c 8b a4 24 e0 00 00 	mov    0xe0(%rsp),%r12
   d9183:	00 
   d9184:	0f b6 ac 24 e8 00 00 	movzbl 0xe8(%rsp),%ebp
   d918b:	00 
   d918c:	48 8d b4 24 e9 00 00 	lea    0xe9(%rsp),%rsi
   d9193:	00 
   d9194:	48 8d bc 24 b9 04 00 	lea    0x4b9(%rsp),%rdi
   d919b:	00 
   d919c:	ba 8f 01 00 00       	mov    $0x18f,%edx
   d91a1:	41 ff d5             	call   *%r13
   d91a4:	48 8d bc 24 48 06 00 	lea    0x648(%rsp),%rdi
   d91ab:	00 
   d91ac:	ba b0 00 00 00       	mov    $0xb0,%edx
   d91b1:	4c 89 f6             	mov    %r14,%rsi
   d91b4:	41 ff d5             	call   *%r13
   d91b7:	48 8b 83 d0 01 00 00 	mov    0x1d0(%rbx),%rax
   d91be:	48 83 f8 fe          	cmp    $0xfffffffffffffffe,%rax
   d91c2:	74 46                	je     d920a <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2da>
   d91c4:	4c 31 f8             	xor    %r15,%rax
   d91c7:	48 83 f8 02          	cmp    $0x2,%rax
   d91cb:	b9 02 00 00 00       	mov    $0x2,%ecx
   d91d0:	48 0f 42 c8          	cmovb  %rax,%rcx
   d91d4:	48 85 c9             	test   %rcx,%rcx
   d91d7:	74 25                	je     d91fe <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2ce>
   d91d9:	48 83 f9 01          	cmp    $0x1,%rcx
   d91dd:	74 2b                	je     d920a <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2da>
   d91df:	48 8d bb d0 01 00 00 	lea    0x1d0(%rbx),%rdi
   d91e6:	e8 55 b0 ff ff       	call   d4240 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve22algebraic_tensor_image26AlgebraicTensorImageReportECseVteb3pHKyv_20horner_stack_harness>
   d91eb:	48 83 bb 68 03 00 00 	cmpq   $0xfffffffffffffffe,0x368(%rbx)
   d91f2:	fe 
   d91f3:	74 15                	je     d920a <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2da>
   d91f5:	48 8d bb 68 03 00 00 	lea    0x368(%rbx),%rdi
   d91fc:	eb 07                	jmp    d9205 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x2d5>
   d91fe:	48 8d bb d8 01 00 00 	lea    0x1d8(%rbx),%rdi
   d9205:	e8 c6 b2 ff ff       	call   d44d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic39AlgebraicRootPolynomialEvaluationReportECseVteb3pHKyv_20horner_stack_harness>
   d920a:	4c 89 a3 d0 01 00 00 	mov    %r12,0x1d0(%rbx)
   d9211:	40 88 ab d8 01 00 00 	mov    %bpl,0x1d8(%rbx)
   d9218:	48 81 c3 d9 01 00 00 	add    $0x1d9,%rbx
   d921f:	48 8d b4 24 b9 04 00 	lea    0x4b9(%rsp),%rsi
   d9226:	00 
   d9227:	ba 3f 02 00 00       	mov    $0x23f,%edx
   d922c:	48 89 df             	mov    %rbx,%rdi
   d922f:	ff 15 5b c9 1c 00    	call   *0x1cc95b(%rip)        # 2a5b90 <memcpy@GLIBC_2.14>
   d9235:	48 81 c4 f8 06 00 00 	add    $0x6f8,%rsp
   d923c:	5b                   	pop    %rbx
   d923d:	41 5c                	pop    %r12
   d923f:	41 5d                	pop    %r13
   d9241:	41 5e                	pop    %r14
   d9243:	41 5f                	pop    %r15
   d9245:	5d                   	pop    %rbp
   d9246:	c3                   	ret
   d9247:	48 83 bb 68 03 00 00 	cmpq   $0xfffffffffffffffe,0x368(%rbx)
   d924e:	fe 
   d924f:	74 40                	je     d9291 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x361>
   d9251:	48 8d bb 68 03 00 00 	lea    0x368(%rbx),%rdi
   d9258:	e8 73 b2 ff ff       	call   d44d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic39AlgebraicRootPolynomialEvaluationReportECseVteb3pHKyv_20horner_stack_harness>
   d925d:	eb 32                	jmp    d9291 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x361>
   d925f:	ff 15 eb c8 1c 00    	call   *0x1cc8eb(%rip)        # 2a5b50 <_DYNAMIC+0x240>
   d9265:	4c 89 f7             	mov    %r14,%rdi
   d9268:	e8 13 b3 ff ff       	call   d4580 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECseVteb3pHKyv_20horner_stack_harness>
   d926d:	eb 53                	jmp    d92c2 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x392>
   d926f:	ff 15 db c8 1c 00    	call   *0x1cc8db(%rip)        # 2a5b50 <_DYNAMIC+0x240>
   d9275:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   d927a:	e8 d1 a4 ff ff       	call   d3750 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueANtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4Realj2_ECseVteb3pHKyv_20horner_stack_harness>
   d927f:	eb 41                	jmp    d92c2 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x392>
   d9281:	48 89 e7             	mov    %rsp,%rdi
   d9284:	e8 f7 b2 ff ff       	call   d4580 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECseVteb3pHKyv_20horner_stack_harness>
   d9289:	eb 37                	jmp    d92c2 <_RNvCseVteb3pHKyv_20horner_stack_harness6invoke+0x392>
   d928b:	ff 15 bf c8 1c 00    	call   *0x1cc8bf(%rip)        # 2a5b50 <_DYNAMIC+0x240>
   d9291:	4c 89 a3 d0 01 00 00 	mov    %r12,0x1d0(%rbx)
   d9298:	40 88 ab d8 01 00 00 	mov    %bpl,0x1d8(%rbx)
   d929f:	48 81 c3 d9 01 00 00 	add    $0x1d9,%rbx
   d92a6:	48 8d b4 24 b9 04 00 	lea    0x4b9(%rsp),%rsi
   d92ad:	00 
   d92ae:	ba 3f 02 00 00       	mov    $0x23f,%edx
   d92b3:	48 89 df             	mov    %rbx,%rdi
   d92b6:	ff 15 d4 c8 1c 00    	call   *0x1cc8d4(%rip)        # 2a5b90 <memcpy@GLIBC_2.14>
   d92bc:	ff 15 0e ca 1c 00    	call   *0x1cca0e(%rip)        # 2a5cd0 <_DYNAMIC+0x3c0>
   d92c2:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
   d92c9:	00 
   d92ca:	e8 71 af ff ff       	call   d4240 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve22algebraic_tensor_image26AlgebraicTensorImageReportECseVteb3pHKyv_20horner_stack_harness>
   d92cf:	ff 15 fb c9 1c 00    	call   *0x1cc9fb(%rip)        # 2a5cd0 <_DYNAMIC+0x3c0>
   d92d5:	ff 15 75 c8 1c 00    	call   *0x1cc875(%rip)        # 2a5b50 <_DYNAMIC+0x240>
   d92db:	ff 15 ef c9 1c 00    	call   *0x1cc9ef(%rip)        # 2a5cd0 <_DYNAMIC+0x3c0>
