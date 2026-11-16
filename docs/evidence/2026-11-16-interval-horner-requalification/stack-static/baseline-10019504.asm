
/tmp/interval-refactor/horner-current/artifacts-baseline/certification:     file format elf64-x86-64


Disassembly of section .text:

000000000098e2b0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero>:
  98e2b0:	55                   	push   %rbp
  98e2b1:	41 57                	push   %r15
  98e2b3:	41 56                	push   %r14
  98e2b5:	41 55                	push   %r13
  98e2b7:	41 54                	push   %r12
  98e2b9:	53                   	push   %rbx
  98e2ba:	48 81 ec a8 02 00 00 	sub    $0x2a8,%rsp
  98e2c1:	44 89 84 24 9c 00 00 	mov    %r8d,0x9c(%rsp)
  98e2c8:	00 
  98e2c9:	49 89 cd             	mov    %rcx,%r13
  98e2cc:	48 89 f3             	mov    %rsi,%rbx
  98e2cf:	48 89 94 24 98 01 00 	mov    %rdx,0x198(%rsp)
  98e2d6:	00 
  98e2d7:	80 3a 00             	cmpb   $0x0,(%rdx)
  98e2da:	48 89 8c 24 90 01 00 	mov    %rcx,0x190(%rsp)
  98e2e1:	00 
  98e2e2:	75 0b                	jne    98e2ef <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  98e2e4:	41 80 7d 00 00       	cmpb   $0x0,0x0(%r13)
  98e2e9:	0f 84 44 09 00 00    	je     98ec33 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x983>
  98e2ef:	48 85 db             	test   %rbx,%rbx
  98e2f2:	0f 84 59 0a 00 00    	je     98ed51 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa1>
  98e2f8:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  98e2fc:	48 c1 e0 04          	shl    $0x4,%rax
  98e300:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
  98e305:	48 8d 34 07          	lea    (%rdi,%rax,1),%rsi
  98e309:	48 83 c6 d0          	add    $0xffffffffffffffd0,%rsi
  98e30d:	4c 8d b4 24 78 02 00 	lea    0x278(%rsp),%r14
  98e314:	00 
  98e315:	4c 89 f7             	mov    %r14,%rdi
  98e318:	e8 23 1e 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e31d:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  98e324:	00 
  98e325:	4c 89 f6             	mov    %r14,%rsi
  98e328:	e8 13 1e 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e32d:	0f 10 84 24 78 02 00 	movups 0x278(%rsp),%xmm0
  98e334:	00 
  98e335:	0f 10 8c 24 88 02 00 	movups 0x288(%rsp),%xmm1
  98e33c:	00 
  98e33d:	0f 10 94 24 98 02 00 	movups 0x298(%rsp),%xmm2
  98e344:	00 
  98e345:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  98e34c:	00 
  98e34d:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  98e354:	00 
  98e355:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  98e35c:	00 
  98e35d:	48 c1 e3 04          	shl    $0x4,%rbx
  98e361:	4c 8d 3c 5b          	lea    (%rbx,%rbx,2),%r15
  98e365:	49 83 ff 30          	cmp    $0x30,%r15
  98e369:	0f 84 34 07 00 00    	je     98eaa3 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7f3>
  98e36f:	4c 8d a4 24 00 01 00 	lea    0x100(%rsp),%r12
  98e376:	00 
  98e377:	48 83 44 24 60 a0    	addq   $0xffffffffffffffa0,0x60(%rsp)
  98e37d:	44 0f b6 b4 24 9c 00 	movzbl 0x9c(%rsp),%r14d
  98e384:	00 00 
  98e386:	eb 1e                	jmp    98e3a6 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf6>
  98e388:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  98e38f:	00 
  98e390:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  98e394:	49 83 ff 30          	cmp    $0x30,%r15
  98e398:	4c 8b ac 24 90 01 00 	mov    0x190(%rsp),%r13
  98e39f:	00 
  98e3a0:	0f 84 fd 06 00 00    	je     98eaa3 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7f3>
  98e3a6:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98e3ad:	00 
  98e3ae:	48 8d ac 24 d0 01 00 	lea    0x1d0(%rsp),%rbp
  98e3b5:	00 
  98e3b6:	48 89 ee             	mov    %rbp,%rsi
  98e3b9:	48 8b 9c 24 98 01 00 	mov    0x198(%rsp),%rbx
  98e3c0:	00 
  98e3c1:	48 89 da             	mov    %rbx,%rdx
  98e3c4:	e8 d7 df f2 ff       	call   8bc3a0 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCsaEGsyZiti5M_10hypersolve>
  98e3c9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98e3ce:	48 89 ee             	mov    %rbp,%rsi
  98e3d1:	4c 89 ea             	mov    %r13,%rdx
  98e3d4:	e8 c7 df f2 ff       	call   8bc3a0 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCsaEGsyZiti5M_10hypersolve>
  98e3d9:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98e3de:	48 8d ac 24 a0 01 00 	lea    0x1a0(%rsp),%rbp
  98e3e5:	00 
  98e3e6:	48 89 ee             	mov    %rbp,%rsi
  98e3e9:	48 89 da             	mov    %rbx,%rdx
  98e3ec:	e8 af df f2 ff       	call   8bc3a0 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCsaEGsyZiti5M_10hypersolve>
  98e3f1:	48 89 e7             	mov    %rsp,%rdi
  98e3f4:	48 89 ee             	mov    %rbp,%rsi
  98e3f7:	4c 89 ea             	mov    %r13,%rdx
  98e3fa:	e8 a1 df f2 ff       	call   8bc3a0 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCsaEGsyZiti5M_10hypersolve>
  98e3ff:	0f 10 84 24 a0 00 00 	movups 0xa0(%rsp),%xmm0
  98e406:	00 
  98e407:	0f 10 8c 24 b0 00 00 	movups 0xb0(%rsp),%xmm1
  98e40e:	00 
  98e40f:	0f 10 94 24 c0 00 00 	movups 0xc0(%rsp),%xmm2
  98e416:	00 
  98e417:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
  98e41e:	00 
  98e41f:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
  98e426:	00 
  98e427:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
  98e42e:	00 
  98e42f:	0f 10 44 24 30       	movups 0x30(%rsp),%xmm0
  98e434:	0f 10 4c 24 40       	movups 0x40(%rsp),%xmm1
  98e439:	0f 10 54 24 50       	movups 0x50(%rsp),%xmm2
  98e43e:	41 0f 11 54 24 20    	movups %xmm2,0x20(%r12)
  98e444:	41 0f 11 4c 24 10    	movups %xmm1,0x10(%r12)
  98e44a:	41 0f 11 04 24       	movups %xmm0,(%r12)
  98e44f:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  98e454:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  98e459:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  98e460:	00 
  98e461:	48 8d 84 24 30 01 00 	lea    0x130(%rsp),%rax
  98e468:	00 
  98e469:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  98e46d:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  98e471:	0f 11 00             	movups %xmm0,(%rax)
  98e474:	0f 10 04 24          	movups (%rsp),%xmm0
  98e478:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e47d:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e482:	48 8d 84 24 60 01 00 	lea    0x160(%rsp),%rax
  98e489:	00 
  98e48a:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  98e48e:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  98e492:	0f 11 00             	movups %xmm0,(%rax)
  98e495:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98e49c:	00 
  98e49d:	48 8d 9c 24 d0 00 00 	lea    0xd0(%rsp),%rbx
  98e4a4:	00 
  98e4a5:	48 89 de             	mov    %rbx,%rsi
  98e4a8:	e8 93 1c 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e4ad:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98e4b2:	48 89 de             	mov    %rbx,%rsi
  98e4b5:	e8 86 1c 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e4ba:	48 89 e3             	mov    %rsp,%rbx
  98e4bd:	4c 89 e7             	mov    %r12,%rdi
  98e4c0:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  98e4c7:	00 
  98e4c8:	44 89 f2             	mov    %r14d,%edx
  98e4cb:	e8 d0 db 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98e4d0:	3c ff                	cmp    $0xff,%al
  98e4d2:	74 1c                	je     98e4f0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x240>
  98e4d4:	0f b6 c0             	movzbl %al,%eax
  98e4d7:	3d fe 00 00 00       	cmp    $0xfe,%eax
  98e4dc:	75 50                	jne    98e52e <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x27e>
  98e4de:	e9 ce 06 00 00       	jmp    98ebb1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  98e4e3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  98e4ea:	84 00 00 00 00 00 
  98e4f0:	48 89 df             	mov    %rbx,%rdi
  98e4f3:	4c 89 e6             	mov    %r12,%rsi
  98e4f6:	e8 45 1c 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e4fb:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98e502:	00 
  98e503:	e8 28 ef fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e508:	0f 10 04 24          	movups (%rsp),%xmm0
  98e50c:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e511:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e516:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  98e51d:	00 
  98e51e:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  98e525:	00 
  98e526:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  98e52d:	00 
  98e52e:	4c 89 e7             	mov    %r12,%rdi
  98e531:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  98e536:	44 89 f2             	mov    %r14d,%edx
  98e539:	e8 62 db 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98e53e:	3c 01                	cmp    $0x1,%al
  98e540:	74 1e                	je     98e560 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2b0>
  98e542:	0f b6 c0             	movzbl %al,%eax
  98e545:	3d fe 00 00 00       	cmp    $0xfe,%eax
  98e54a:	75 46                	jne    98e592 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2e2>
  98e54c:	e9 60 06 00 00       	jmp    98ebb1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  98e551:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  98e558:	0f 1f 84 00 00 00 00 
  98e55f:	00 
  98e560:	48 89 df             	mov    %rbx,%rdi
  98e563:	4c 89 e6             	mov    %r12,%rsi
  98e566:	e8 d5 1b 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e56b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98e570:	e8 bb ee fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e575:	0f 10 04 24          	movups (%rsp),%xmm0
  98e579:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e57e:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e583:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  98e588:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  98e58d:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  98e592:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  98e599:	00 
  98e59a:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  98e5a1:	00 
  98e5a2:	44 89 f2             	mov    %r14d,%edx
  98e5a5:	e8 f6 da 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98e5aa:	3c ff                	cmp    $0xff,%al
  98e5ac:	74 12                	je     98e5c0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x310>
  98e5ae:	0f b6 c0             	movzbl %al,%eax
  98e5b1:	3d fe 00 00 00       	cmp    $0xfe,%eax
  98e5b6:	75 4b                	jne    98e603 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x353>
  98e5b8:	e9 f4 05 00 00       	jmp    98ebb1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  98e5bd:	0f 1f 00             	nopl   (%rax)
  98e5c0:	48 89 df             	mov    %rbx,%rdi
  98e5c3:	48 8d b4 24 30 01 00 	lea    0x130(%rsp),%rsi
  98e5ca:	00 
  98e5cb:	e8 70 1b 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e5d0:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98e5d7:	00 
  98e5d8:	e8 53 ee fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e5dd:	0f 10 04 24          	movups (%rsp),%xmm0
  98e5e1:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e5e6:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e5eb:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  98e5f2:	00 
  98e5f3:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  98e5fa:	00 
  98e5fb:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  98e602:	00 
  98e603:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  98e60a:	00 
  98e60b:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  98e610:	44 89 f2             	mov    %r14d,%edx
  98e613:	e8 88 da 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98e618:	3c 01                	cmp    $0x1,%al
  98e61a:	74 14                	je     98e630 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x380>
  98e61c:	0f b6 c0             	movzbl %al,%eax
  98e61f:	3d fe 00 00 00       	cmp    $0xfe,%eax
  98e624:	75 41                	jne    98e667 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3b7>
  98e626:	e9 86 05 00 00       	jmp    98ebb1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  98e62b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  98e630:	48 89 df             	mov    %rbx,%rdi
  98e633:	48 8d b4 24 30 01 00 	lea    0x130(%rsp),%rsi
  98e63a:	00 
  98e63b:	e8 00 1b 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e640:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98e645:	e8 e6 ed fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e64a:	0f 10 04 24          	movups (%rsp),%xmm0
  98e64e:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e653:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e658:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  98e65d:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  98e662:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  98e667:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  98e66e:	00 
  98e66f:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  98e676:	00 
  98e677:	44 89 f2             	mov    %r14d,%edx
  98e67a:	e8 21 da 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98e67f:	3c ff                	cmp    $0xff,%al
  98e681:	74 1d                	je     98e6a0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f0>
  98e683:	0f b6 c0             	movzbl %al,%eax
  98e686:	3d fe 00 00 00       	cmp    $0xfe,%eax
  98e68b:	75 56                	jne    98e6e3 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x433>
  98e68d:	e9 1f 05 00 00       	jmp    98ebb1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  98e692:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  98e699:	1f 84 00 00 00 00 00 
  98e6a0:	48 89 df             	mov    %rbx,%rdi
  98e6a3:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  98e6aa:	00 
  98e6ab:	e8 90 1a 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e6b0:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98e6b7:	00 
  98e6b8:	e8 73 ed fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e6bd:	0f 10 04 24          	movups (%rsp),%xmm0
  98e6c1:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e6c6:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e6cb:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  98e6d2:	00 
  98e6d3:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  98e6da:	00 
  98e6db:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  98e6e2:	00 
  98e6e3:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  98e6ea:	00 
  98e6eb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  98e6f0:	44 89 f2             	mov    %r14d,%edx
  98e6f3:	e8 a8 d9 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98e6f8:	3c 01                	cmp    $0x1,%al
  98e6fa:	74 14                	je     98e710 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x460>
  98e6fc:	0f b6 c0             	movzbl %al,%eax
  98e6ff:	3d fe 00 00 00       	cmp    $0xfe,%eax
  98e704:	75 41                	jne    98e747 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x497>
  98e706:	e9 a6 04 00 00       	jmp    98ebb1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  98e70b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  98e710:	48 89 df             	mov    %rbx,%rdi
  98e713:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  98e71a:	00 
  98e71b:	e8 20 1a 01 00       	call   9a0140 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.5367743222342133306>
  98e720:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98e725:	e8 06 ed fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e72a:	0f 10 04 24          	movups (%rsp),%xmm0
  98e72e:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98e733:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98e738:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  98e73d:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  98e742:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  98e747:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  98e74c:	4e 8d 2c 38          	lea    (%rax,%r15,1),%r13
  98e750:	0f 28 84 24 a0 00 00 	movaps 0xa0(%rsp),%xmm0
  98e757:	00 
  98e758:	0f 28 8c 24 b0 00 00 	movaps 0xb0(%rsp),%xmm1
  98e75f:	00 
  98e760:	0f 28 94 24 c0 00 00 	movaps 0xc0(%rsp),%xmm2
  98e767:	00 
  98e768:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  98e76d:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  98e772:	0f 29 04 24          	movaps %xmm0,(%rsp)
  98e776:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98e77b:	48 89 de             	mov    %rbx,%rsi
  98e77e:	4c 89 ea             	mov    %r13,%rdx
  98e781:	e8 1a a2 f2 ff       	call   8b89a0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCsaEGsyZiti5M_10hypersolve>
  98e786:	48 89 df             	mov    %rbx,%rdi
  98e789:	e8 32 90 f1 ff       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  98e78e:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  98e795:	00 
  98e796:	e8 95 ec fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e79b:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  98e7a0:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  98e7a5:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  98e7ac:	00 
  98e7ad:	0f 29 94 24 f0 01 00 	movaps %xmm2,0x1f0(%rsp)
  98e7b4:	00 
  98e7b5:	0f 29 8c 24 e0 01 00 	movaps %xmm1,0x1e0(%rsp)
  98e7bc:	00 
  98e7bd:	0f 29 84 24 d0 01 00 	movaps %xmm0,0x1d0(%rsp)
  98e7c4:	00 
  98e7c5:	0f 28 44 24 30       	movaps 0x30(%rsp),%xmm0
  98e7ca:	0f 28 4c 24 40       	movaps 0x40(%rsp),%xmm1
  98e7cf:	0f 28 54 24 50       	movaps 0x50(%rsp),%xmm2
  98e7d4:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  98e7d9:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  98e7de:	0f 29 04 24          	movaps %xmm0,(%rsp)
  98e7e2:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98e7e7:	48 89 e3             	mov    %rsp,%rbx
  98e7ea:	48 89 de             	mov    %rbx,%rsi
  98e7ed:	4c 89 ea             	mov    %r13,%rdx
  98e7f0:	e8 ab a1 f2 ff       	call   8b89a0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCsaEGsyZiti5M_10hypersolve>
  98e7f5:	48 89 df             	mov    %rbx,%rdi
  98e7f8:	e8 c3 8f f1 ff       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  98e7fd:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  98e804:	00 
  98e805:	e8 26 ec fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e80a:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  98e80f:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  98e814:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  98e81b:	00 
  98e81c:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  98e823:	00 
  98e824:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  98e82b:	00 
  98e82c:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  98e833:	00 
  98e834:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  98e83b:	00 
  98e83c:	f0 48 ff 08          	lock decq (%rax)
  98e840:	75 1b                	jne    98e85d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5ad>
  98e842:	bb 01 00 00 00       	mov    $0x1,%ebx
  98e847:	4c 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%r13
  98e84e:	00 
  98e84f:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  98e856:	00 
  98e857:	ff 15 53 ee 35 00    	call   *0x35ee53(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98e85d:	bb 01 00 00 00       	mov    $0x1,%ebx
  98e862:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98e869:	00 
  98e86a:	49 89 fd             	mov    %rdi,%r13
  98e86d:	e8 7e ec fe ff       	call   97d4f0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e872:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  98e879:	00 
  98e87a:	48 85 c0             	test   %rax,%rax
  98e87d:	74 51                	je     98e8d0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x620>
  98e87f:	f0 48 ff 08          	lock decq (%rax)
  98e883:	75 1b                	jne    98e8a0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5f0>
  98e885:	bb 01 00 00 00       	mov    $0x1,%ebx
  98e88a:	4c 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%r13
  98e891:	00 
  98e892:	48 8d bc 24 e8 00 00 	lea    0xe8(%rsp),%rdi
  98e899:	00 
  98e89a:	ff 15 e8 ed 35 00    	call   *0x35ede8(%rip)        # ced688 <_DYNAMIC+0x240>
  98e8a0:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  98e8a7:	00 
  98e8a8:	48 85 c0             	test   %rax,%rax
  98e8ab:	74 23                	je     98e8d0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x620>
  98e8ad:	f0 48 ff 08          	lock decq (%rax)
  98e8b1:	75 1d                	jne    98e8d0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x620>
  98e8b3:	bb 01 00 00 00       	mov    $0x1,%ebx
  98e8b8:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  98e8bf:	00 
  98e8c0:	ff 15 ca ed 35 00    	call   *0x35edca(%rip)        # ced690 <_DYNAMIC+0x248>
  98e8c6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  98e8cd:	00 00 00 
  98e8d0:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
  98e8d7:	00 
  98e8d8:	f0 48 ff 08          	lock decq (%rax)
  98e8dc:	75 16                	jne    98e8f4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x644>
  98e8de:	bb 02 00 00 00       	mov    $0x2,%ebx
  98e8e3:	4d 89 e5             	mov    %r12,%r13
  98e8e6:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  98e8ed:	00 
  98e8ee:	ff 15 bc ed 35 00    	call   *0x35edbc(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98e8f4:	bb 02 00 00 00       	mov    $0x2,%ebx
  98e8f9:	4d 89 e5             	mov    %r12,%r13
  98e8fc:	4c 89 e7             	mov    %r12,%rdi
  98e8ff:	e8 ec eb fe ff       	call   97d4f0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e904:	48 8b 84 24 18 01 00 	mov    0x118(%rsp),%rax
  98e90b:	00 
  98e90c:	48 85 c0             	test   %rax,%rax
  98e90f:	74 4f                	je     98e960 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6b0>
  98e911:	f0 48 ff 08          	lock decq (%rax)
  98e915:	75 16                	jne    98e92d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x67d>
  98e917:	bb 02 00 00 00       	mov    $0x2,%ebx
  98e91c:	4d 89 e5             	mov    %r12,%r13
  98e91f:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  98e926:	00 
  98e927:	ff 15 5b ed 35 00    	call   *0x35ed5b(%rip)        # ced688 <_DYNAMIC+0x240>
  98e92d:	48 8b 84 24 20 01 00 	mov    0x120(%rsp),%rax
  98e934:	00 
  98e935:	48 85 c0             	test   %rax,%rax
  98e938:	74 26                	je     98e960 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6b0>
  98e93a:	f0 48 ff 08          	lock decq (%rax)
  98e93e:	75 20                	jne    98e960 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6b0>
  98e940:	bb 02 00 00 00       	mov    $0x2,%ebx
  98e945:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  98e94c:	00 
  98e94d:	ff 15 3d ed 35 00    	call   *0x35ed3d(%rip)        # ced690 <_DYNAMIC+0x248>
  98e953:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  98e95a:	84 00 00 00 00 00 
  98e960:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  98e967:	00 
  98e968:	f0 48 ff 08          	lock decq (%rax)
  98e96c:	75 1b                	jne    98e989 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6d9>
  98e96e:	bb 03 00 00 00       	mov    $0x3,%ebx
  98e973:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
  98e97a:	00 
  98e97b:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  98e982:	00 
  98e983:	ff 15 27 ed 35 00    	call   *0x35ed27(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98e989:	bb 03 00 00 00       	mov    $0x3,%ebx
  98e98e:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  98e995:	00 
  98e996:	49 89 fd             	mov    %rdi,%r13
  98e999:	e8 52 eb fe ff       	call   97d4f0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98e99e:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
  98e9a5:	00 
  98e9a6:	48 85 c0             	test   %rax,%rax
  98e9a9:	74 55                	je     98ea00 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x750>
  98e9ab:	f0 48 ff 08          	lock decq (%rax)
  98e9af:	75 1b                	jne    98e9cc <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x71c>
  98e9b1:	bb 03 00 00 00       	mov    $0x3,%ebx
  98e9b6:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
  98e9bd:	00 
  98e9be:	48 8d bc 24 48 01 00 	lea    0x148(%rsp),%rdi
  98e9c5:	00 
  98e9c6:	ff 15 bc ec 35 00    	call   *0x35ecbc(%rip)        # ced688 <_DYNAMIC+0x240>
  98e9cc:	48 8b 84 24 50 01 00 	mov    0x150(%rsp),%rax
  98e9d3:	00 
  98e9d4:	48 85 c0             	test   %rax,%rax
  98e9d7:	74 27                	je     98ea00 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x750>
  98e9d9:	f0 48 ff 08          	lock decq (%rax)
  98e9dd:	75 21                	jne    98ea00 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x750>
  98e9df:	bb 03 00 00 00       	mov    $0x3,%ebx
  98e9e4:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  98e9eb:	00 
  98e9ec:	ff 15 9e ec 35 00    	call   *0x35ec9e(%rip)        # ced690 <_DYNAMIC+0x248>
  98e9f2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  98e9f9:	1f 84 00 00 00 00 00 
  98ea00:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  98ea07:	00 
  98ea08:	f0 48 ff 08          	lock decq (%rax)
  98ea0c:	75 1b                	jne    98ea29 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x779>
  98ea0e:	bb 04 00 00 00       	mov    $0x4,%ebx
  98ea13:	4c 8d ac 24 60 01 00 	lea    0x160(%rsp),%r13
  98ea1a:	00 
  98ea1b:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  98ea22:	00 
  98ea23:	ff 15 87 ec 35 00    	call   *0x35ec87(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ea29:	bb 04 00 00 00       	mov    $0x4,%ebx
  98ea2e:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  98ea35:	00 
  98ea36:	49 89 fd             	mov    %rdi,%r13
  98ea39:	e8 b2 ea fe ff       	call   97d4f0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ea3e:	48 8b 84 24 78 01 00 	mov    0x178(%rsp),%rax
  98ea45:	00 
  98ea46:	48 85 c0             	test   %rax,%rax
  98ea49:	0f 84 41 f9 ff ff    	je     98e390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  98ea4f:	f0 48 ff 08          	lock decq (%rax)
  98ea53:	75 1b                	jne    98ea70 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7c0>
  98ea55:	bb 04 00 00 00       	mov    $0x4,%ebx
  98ea5a:	4c 8d ac 24 60 01 00 	lea    0x160(%rsp),%r13
  98ea61:	00 
  98ea62:	48 8d bc 24 78 01 00 	lea    0x178(%rsp),%rdi
  98ea69:	00 
  98ea6a:	ff 15 18 ec 35 00    	call   *0x35ec18(%rip)        # ced688 <_DYNAMIC+0x240>
  98ea70:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  98ea77:	00 
  98ea78:	48 85 c0             	test   %rax,%rax
  98ea7b:	0f 84 0f f9 ff ff    	je     98e390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  98ea81:	f0 48 ff 08          	lock decq (%rax)
  98ea85:	0f 85 05 f9 ff ff    	jne    98e390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  98ea8b:	bb 04 00 00 00       	mov    $0x4,%ebx
  98ea90:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  98ea97:	00 
  98ea98:	ff 15 f2 eb 35 00    	call   *0x35ebf2(%rip)        # ced690 <_DYNAMIC+0x248>
  98ea9e:	e9 ed f8 ff ff       	jmp    98e390 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  98eaa3:	0f b6 8c 24 d0 01 00 	movzbl 0x1d0(%rsp),%ecx
  98eaaa:	00 
  98eaab:	0f 10 84 24 d1 01 00 	movups 0x1d1(%rsp),%xmm0
  98eab2:	00 
  98eab3:	0f 29 84 24 10 02 00 	movaps %xmm0,0x210(%rsp)
  98eaba:	00 
  98eabb:	0f 10 84 24 e1 01 00 	movups 0x1e1(%rsp),%xmm0
  98eac2:	00 
  98eac3:	0f 29 84 24 20 02 00 	movaps %xmm0,0x220(%rsp)
  98eaca:	00 
  98eacb:	0f 10 84 24 f0 01 00 	movups 0x1f0(%rsp),%xmm0
  98ead2:	00 
  98ead3:	0f 11 84 24 2f 02 00 	movups %xmm0,0x22f(%rsp)
  98eada:	00 
  98eadb:	0f 28 84 24 a0 01 00 	movaps 0x1a0(%rsp),%xmm0
  98eae2:	00 
  98eae3:	0f 28 8c 24 b0 01 00 	movaps 0x1b0(%rsp),%xmm1
  98eaea:	00 
  98eaeb:	0f 28 94 24 c0 01 00 	movaps 0x1c0(%rsp),%xmm2
  98eaf2:	00 
  98eaf3:	0f 29 84 24 40 02 00 	movaps %xmm0,0x240(%rsp)
  98eafa:	00 
  98eafb:	0f 29 8c 24 50 02 00 	movaps %xmm1,0x250(%rsp)
  98eb02:	00 
  98eb03:	0f 29 94 24 60 02 00 	movaps %xmm2,0x260(%rsp)
  98eb0a:	00 
  98eb0b:	b0 02                	mov    $0x2,%al
  98eb0d:	80 f9 ff             	cmp    $0xff,%cl
  98eb10:	0f 84 3d 02 00 00    	je     98ed53 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa3>
  98eb16:	0f 10 84 24 2f 02 00 	movups 0x22f(%rsp),%xmm0
  98eb1d:	00 
  98eb1e:	0f 11 84 24 88 00 00 	movups %xmm0,0x88(%rsp)
  98eb25:	00 
  98eb26:	0f 28 84 24 10 02 00 	movaps 0x210(%rsp),%xmm0
  98eb2d:	00 
  98eb2e:	0f 28 8c 24 20 02 00 	movaps 0x220(%rsp),%xmm1
  98eb35:	00 
  98eb36:	0f 11 4c 24 79       	movups %xmm1,0x79(%rsp)
  98eb3b:	0f 11 44 24 69       	movups %xmm0,0x69(%rsp)
  98eb40:	0f 28 84 24 40 02 00 	movaps 0x240(%rsp),%xmm0
  98eb47:	00 
  98eb48:	0f 28 8c 24 50 02 00 	movaps 0x250(%rsp),%xmm1
  98eb4f:	00 
  98eb50:	0f 28 94 24 60 02 00 	movaps 0x260(%rsp),%xmm2
  98eb57:	00 
  98eb58:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  98eb5d:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  98eb62:	0f 29 04 24          	movaps %xmm0,(%rsp)
  98eb66:	88 4c 24 68          	mov    %cl,0x68(%rsp)
  98eb6a:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98eb71:	00 
  98eb72:	ff 15 38 ec 35 00    	call   *0x35ec38(%rip)        # ced7b0 <_DYNAMIC+0x368>
  98eb78:	0f b6 ac 24 9c 00 00 	movzbl 0x9c(%rsp),%ebp
  98eb7f:	00 
  98eb80:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98eb85:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
  98eb8c:	00 
  98eb8d:	89 ea                	mov    %ebp,%edx
  98eb8f:	e8 0c d5 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98eb94:	89 c3                	mov    %eax,%ebx
  98eb96:	80 fb fe             	cmp    $0xfe,%bl
  98eb99:	0f 85 5e 01 00 00    	jne    98ecfd <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa4d>
  98eb9f:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98eba6:	00 
  98eba7:	e8 84 e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ebac:	e9 8e 01 00 00       	jmp    98ed3f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa8f>
  98ebb1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98ebb6:	e8 75 e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ebbb:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98ebc2:	00 
  98ebc3:	e8 68 e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ebc8:	bb 01 00 00 00       	mov    $0x1,%ebx
  98ebcd:	31 ed                	xor    %ebp,%ebp
  98ebcf:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ebd6:	00 
  98ebd7:	e8 54 e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ebdc:	bb 02 00 00 00       	mov    $0x2,%ebx
  98ebe1:	31 ed                	xor    %ebp,%ebp
  98ebe3:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  98ebea:	00 
  98ebeb:	e8 40 e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ebf0:	bb 03 00 00 00       	mov    $0x3,%ebx
  98ebf5:	31 ed                	xor    %ebp,%ebp
  98ebf7:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  98ebfe:	00 
  98ebff:	e8 2c e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ec04:	bb 04 00 00 00       	mov    $0x4,%ebx
  98ec09:	40 b5 01             	mov    $0x1,%bpl
  98ec0c:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  98ec13:	00 
  98ec14:	e8 17 e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ec19:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  98ec20:	00 
  98ec21:	e8 0a e8 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ec26:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  98ec2d:	00 
  98ec2e:	e9 19 01 00 00       	jmp    98ed4c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa9c>
  98ec33:	48 8b 84 24 98 01 00 	mov    0x198(%rsp),%rax
  98ec3a:	00 
  98ec3b:	48 8d 68 10          	lea    0x10(%rax),%rbp
  98ec3f:	4d 8d 7d 10          	lea    0x10(%r13),%r15
  98ec43:	49 89 fe             	mov    %rdi,%r14
  98ec46:	48 89 ef             	mov    %rbp,%rdi
  98ec49:	4c 89 fe             	mov    %r15,%rsi
  98ec4c:	ff 15 6e ee 35 00    	call   *0x35ee6e(%rip)        # cedac0 <_DYNAMIC+0x678>
  98ec52:	4c 89 f7             	mov    %r14,%rdi
  98ec55:	48 85 db             	test   %rbx,%rbx
  98ec58:	0f 84 91 f6 ff ff    	je     98e2ef <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  98ec5e:	84 c0                	test   %al,%al
  98ec60:	0f 8f 89 f6 ff ff    	jg     98e2ef <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  98ec66:	48 89 d8             	mov    %rbx,%rax
  98ec69:	48 c1 e0 04          	shl    $0x4,%rax
  98ec6d:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
  98ec71:	42 80 7c 37 d0 00    	cmpb   $0x0,-0x30(%rdi,%r14,1)
  98ec77:	0f 85 7b f6 ff ff    	jne    98e2f8 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x48>
  98ec7d:	4a 8b 44 37 e0       	mov    -0x20(%rdi,%r14,1),%rax
  98ec82:	f0 48 ff 00          	lock incq (%rax)
  98ec86:	0f 8e 6a 02 00 00    	jle    98eef6 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc46>
  98ec8c:	4a 8b 44 37 e0       	mov    -0x20(%rdi,%r14,1),%rax
  98ec91:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  98ec96:	f0 48 ff 00          	lock incq (%rax)
  98ec9a:	0f 8e 56 02 00 00    	jle    98eef6 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc46>
  98eca0:	4e 8b 64 37 e0       	mov    -0x20(%rdi,%r14,1),%r12
  98eca5:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
  98ecaa:	48 83 fb 01          	cmp    $0x1,%rbx
  98ecae:	0f 85 e3 00 00 00    	jne    98ed97 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae7>
  98ecb4:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
  98ecb9:	b0 01                	mov    $0x1,%al
  98ecbb:	80 79 64 02          	cmpb   $0x2,0x64(%rcx)
  98ecbf:	74 09                	je     98ecca <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa1a>
  98ecc1:	41 80 7c 24 64 00    	cmpb   $0x0,0x64(%r12)
  98ecc7:	0f 94 c0             	sete   %al
  98ecca:	f0 49 ff 0c 24       	lock decq (%r12)
  98eccf:	75 0f                	jne    98ece0 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa30>
  98ecd1:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98ecd6:	89 c3                	mov    %eax,%ebx
  98ecd8:	ff 15 d2 e9 35 00    	call   *0x35e9d2(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ecde:	89 d8                	mov    %ebx,%eax
  98ece0:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
  98ece5:	f0 48 ff 09          	lock decq (%rcx)
  98ece9:	75 68                	jne    98ed53 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa3>
  98eceb:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98ecf0:	89 c3                	mov    %eax,%ebx
  98ecf2:	ff 15 b8 e9 35 00    	call   *0x35e9b8(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ecf8:	e9 96 00 00 00       	jmp    98ed93 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae3>
  98ecfd:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ed04:	00 
  98ed05:	e8 26 e7 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed0a:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ed11:	00 
  98ed12:	ff 15 98 ea 35 00    	call   *0x35ea98(%rip)        # ced7b0 <_DYNAMIC+0x368>
  98ed18:	48 89 e7             	mov    %rsp,%rdi
  98ed1b:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
  98ed22:	00 
  98ed23:	89 ea                	mov    %ebp,%edx
  98ed25:	e8 76 d3 00 00       	call   99c0a0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.5367743222342133306>
  98ed2a:	89 c5                	mov    %eax,%ebp
  98ed2c:	40 80 fd fe          	cmp    $0xfe,%bpl
  98ed30:	75 33                	jne    98ed65 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xab5>
  98ed32:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ed39:	00 
  98ed3a:	e8 f1 e6 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed3f:	48 89 e7             	mov    %rsp,%rdi
  98ed42:	e8 e9 e6 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed47:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98ed4c:	e8 df e6 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed51:	b0 02                	mov    $0x2,%al
  98ed53:	48 81 c4 a8 02 00 00 	add    $0x2a8,%rsp
  98ed5a:	5b                   	pop    %rbx
  98ed5b:	41 5c                	pop    %r12
  98ed5d:	41 5d                	pop    %r13
  98ed5f:	41 5e                	pop    %r14
  98ed61:	41 5f                	pop    %r15
  98ed63:	5d                   	pop    %rbp
  98ed64:	c3                   	ret
  98ed65:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ed6c:	00 
  98ed6d:	e8 be e6 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed72:	48 89 e7             	mov    %rsp,%rdi
  98ed75:	e8 b6 e6 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed7a:	80 fb 01             	cmp    $0x1,%bl
  98ed7d:	0f 94 c0             	sete   %al
  98ed80:	40 80 fd ff          	cmp    $0xff,%bpl
  98ed84:	0f 94 c3             	sete   %bl
  98ed87:	08 c3                	or     %al,%bl
  98ed89:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98ed8e:	e8 9d e6 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98ed93:	89 d8                	mov    %ebx,%eax
  98ed95:	eb bc                	jmp    98ed53 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa3>
  98ed97:	4c 89 bc 24 08 02 00 	mov    %r15,0x208(%rsp)
  98ed9e:	00 
  98ed9f:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
  98eda4:	42 80 7c 37 a0 00    	cmpb   $0x0,-0x60(%rdi,%r14,1)
  98edaa:	0f 85 0a 01 00 00    	jne    98eeba <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc0a>
  98edb0:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  98edb5:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  98edb9:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
  98edc0:	00 
  98edc1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98edc6:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
  98edcb:	49 89 ef             	mov    %rbp,%r15
  98edce:	48 89 ea             	mov    %rbp,%rdx
  98edd1:	48 8b 8c 24 08 02 00 	mov    0x208(%rsp),%rcx
  98edd8:	00 
  98edd9:	e8 22 bf 00 00       	call   99ad00 <_RNvNtCsaEGsyZiti5M_10hypersolve8interval25rational_interval_product>
  98edde:	48 89 c5             	mov    %rax,%rbp
  98ede1:	48 8b 84 24 00 02 00 	mov    0x200(%rsp),%rax
  98ede8:	00 
  98ede9:	4e 8d 24 30          	lea    (%rax,%r14,1),%r12
  98eded:	48 89 14 24          	mov    %rdx,(%rsp)
  98edf1:	48 89 ac 24 d0 00 00 	mov    %rbp,0xd0(%rsp)
  98edf8:	00 
  98edf9:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ee00:	00 
  98ee01:	4c 89 e6             	mov    %r12,%rsi
  98ee04:	ff 15 3e f2 35 00    	call   *0x35f23e(%rip)        # cee048 <_DYNAMIC+0xc00>
  98ee0a:	49 89 c5             	mov    %rax,%r13
  98ee0d:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
  98ee12:	75 0e                	jne    98ee22 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb72>
  98ee14:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ee1b:	00 
  98ee1c:	ff 15 8e e8 35 00    	call   *0x35e88e(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ee22:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  98ee27:	f0 48 ff 08          	lock decq (%rax)
  98ee2b:	4c 89 fd             	mov    %r15,%rbp
  98ee2e:	75 0b                	jne    98ee3b <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb8b>
  98ee30:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98ee35:	ff 15 75 e8 35 00    	call   *0x35e875(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ee3b:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
  98ee40:	4c 8b 2c 24          	mov    (%rsp),%r13
  98ee44:	4c 89 ac 24 d0 00 00 	mov    %r13,0xd0(%rsp)
  98ee4b:	00 
  98ee4c:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ee53:	00 
  98ee54:	4c 89 e6             	mov    %r12,%rsi
  98ee57:	ff 15 eb f1 35 00    	call   *0x35f1eb(%rip)        # cee048 <_DYNAMIC+0xc00>
  98ee5d:	49 89 c4             	mov    %rax,%r12
  98ee60:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  98ee65:	75 0e                	jne    98ee75 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbc5>
  98ee67:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ee6e:	00 
  98ee6f:	ff 15 3b e8 35 00    	call   *0x35e83b(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ee75:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  98ee7a:	f0 48 ff 08          	lock decq (%rax)
  98ee7e:	4c 8b ac 24 90 01 00 	mov    0x190(%rsp),%r13
  98ee85:	00 
  98ee86:	75 0b                	jne    98ee93 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbe3>
  98ee88:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98ee8d:	ff 15 1d e8 35 00    	call   *0x35e81d(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ee93:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
  98ee98:	49 83 fe 60          	cmp    $0x60,%r14
  98ee9c:	0f 84 12 fe ff ff    	je     98ecb4 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa04>
  98eea2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  98eea7:	42 80 bc 30 70 ff ff 	cmpb   $0x0,-0x90(%rax,%r14,1)
  98eeae:	ff 00 
  98eeb0:	4d 8d 76 d0          	lea    -0x30(%r14),%r14
  98eeb4:	0f 84 07 ff ff ff    	je     98edc1 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb11>
  98eeba:	f0 49 ff 0c 24       	lock decq (%r12)
  98eebf:	75 0b                	jne    98eecc <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc1c>
  98eec1:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98eec6:	ff 15 e4 e7 35 00    	call   *0x35e7e4(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98eecc:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  98eed1:	f0 48 ff 08          	lock decq (%rax)
  98eed5:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
  98eeda:	0f 85 0f f4 ff ff    	jne    98e2ef <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  98eee0:	49 89 fe             	mov    %rdi,%r14
  98eee3:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98eee8:	ff 15 c2 e7 35 00    	call   *0x35e7c2(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98eeee:	4c 89 f7             	mov    %r14,%rdi
  98eef1:	e9 f9 f3 ff ff       	jmp    98e2ef <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  98eef6:	0f 0b                	ud2
  98eef8:	49 89 c7             	mov    %rax,%r15
  98eefb:	e9 87 00 00 00       	jmp    98ef87 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcd7>
  98ef00:	49 89 c7             	mov    %rax,%r15
  98ef03:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
  98ef08:	eb 49                	jmp    98ef53 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca3>
  98ef0a:	49 89 c7             	mov    %rax,%r15
  98ef0d:	eb 44                	jmp    98ef53 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca3>
  98ef0f:	49 89 c7             	mov    %rax,%r15
  98ef12:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
  98ef17:	eb 58                	jmp    98ef71 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  98ef19:	eb 53                	jmp    98ef6e <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcbe>
  98ef1b:	49 89 c7             	mov    %rax,%r15
  98ef1e:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  98ef23:	75 4c                	jne    98ef71 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  98ef25:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ef2c:	00 
  98ef2d:	ff 15 7d e7 35 00    	call   *0x35e77d(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ef33:	eb 3c                	jmp    98ef71 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  98ef35:	ff 15 5d e7 35 00    	call   *0x35e75d(%rip)        # ced698 <_DYNAMIC+0x250>
  98ef3b:	49 89 c7             	mov    %rax,%r15
  98ef3e:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
  98ef43:	75 0e                	jne    98ef53 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca3>
  98ef45:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98ef4c:	00 
  98ef4d:	ff 15 5d e7 35 00    	call   *0x35e75d(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ef53:	48 8b 04 24          	mov    (%rsp),%rax
  98ef57:	f0 48 ff 08          	lock decq (%rax)
  98ef5b:	75 14                	jne    98ef71 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  98ef5d:	48 89 e7             	mov    %rsp,%rdi
  98ef60:	ff 15 4a e7 35 00    	call   *0x35e74a(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ef66:	eb 09                	jmp    98ef71 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  98ef68:	ff 15 2a e7 35 00    	call   *0x35e72a(%rip)        # ced698 <_DYNAMIC+0x250>
  98ef6e:	49 89 c7             	mov    %rax,%r15
  98ef71:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  98ef76:	f0 48 ff 08          	lock decq (%rax)
  98ef7a:	75 0b                	jne    98ef87 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcd7>
  98ef7c:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98ef81:	ff 15 29 e7 35 00    	call   *0x35e729(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98ef87:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  98ef8c:	f0 48 ff 08          	lock decq (%rax)
  98ef90:	0f 85 e0 02 00 00    	jne    98f276 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  98ef96:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98ef9b:	ff 15 0f e7 35 00    	call   *0x35e70f(%rip)        # ced6b0 <_DYNAMIC+0x268>
  98efa1:	e9 d0 02 00 00       	jmp    98f276 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  98efa6:	49 89 c7             	mov    %rax,%r15
  98efa9:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98efb0:	00 
  98efb1:	e8 7a e4 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98efb6:	eb 32                	jmp    98efea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd3a>
  98efb8:	ff 15 da e6 35 00    	call   *0x35e6da(%rip)        # ced698 <_DYNAMIC+0x250>
  98efbe:	49 89 c7             	mov    %rax,%r15
  98efc1:	eb 2f                	jmp    98eff2 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd42>
  98efc3:	49 89 c7             	mov    %rax,%r15
  98efc6:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98efcd:	00 
  98efce:	e8 5d e4 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98efd3:	eb 15                	jmp    98efea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd3a>
  98efd5:	49 89 c7             	mov    %rax,%r15
  98efd8:	e9 8c 02 00 00       	jmp    98f269 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfb9>
  98efdd:	e9 3c 01 00 00       	jmp    98f11e <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe6e>
  98efe2:	e9 2f 01 00 00       	jmp    98f116 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe66>
  98efe7:	49 89 c7             	mov    %rax,%r15
  98efea:	48 89 e7             	mov    %rsp,%rdi
  98efed:	e8 3e e4 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98eff2:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98eff7:	e8 34 e4 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98effc:	e9 75 02 00 00       	jmp    98f276 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  98f001:	49 89 c7             	mov    %rax,%r15
  98f004:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
  98f00b:	00 
  98f00c:	e8 1f e4 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f011:	e9 60 02 00 00       	jmp    98f276 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  98f016:	ff 15 7c e6 35 00    	call   *0x35e67c(%rip)        # ced698 <_DYNAMIC+0x250>
  98f01c:	49 89 c7             	mov    %rax,%r15
  98f01f:	40 84 ed             	test   %bpl,%bpl
  98f022:	0f 85 34 02 00 00    	jne    98f25c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  98f028:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  98f02c:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  98f030:	c1 e0 04             	shl    $0x4,%eax
  98f033:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  98f037:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
  98f03e:	66 90                	xchg   %ax,%ax
  98f040:	4c 89 f7             	mov    %r14,%rdi
  98f043:	e8 e8 e3 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f048:	49 83 c6 30          	add    $0x30,%r14
  98f04c:	48 ff c3             	inc    %rbx
  98f04f:	75 ef                	jne    98f040 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd90>
  98f051:	e9 06 02 00 00       	jmp    98f25c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  98f056:	ff 15 3c e6 35 00    	call   *0x35e63c(%rip)        # ced698 <_DYNAMIC+0x250>
  98f05c:	49 89 c7             	mov    %rax,%r15
  98f05f:	e9 86 01 00 00       	jmp    98f1ea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  98f064:	49 89 c7             	mov    %rax,%r15
  98f067:	48 89 e7             	mov    %rsp,%rdi
  98f06a:	e8 51 87 f1 ff       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  98f06f:	b3 01                	mov    $0x1,%bl
  98f071:	e9 be 01 00 00       	jmp    98f234 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf84>
  98f076:	ff 15 1c e6 35 00    	call   *0x35e61c(%rip)        # ced698 <_DYNAMIC+0x250>
  98f07c:	49 89 c7             	mov    %rax,%r15
  98f07f:	b3 01                	mov    $0x1,%bl
  98f081:	e9 ae 01 00 00       	jmp    98f234 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf84>
  98f086:	49 89 c7             	mov    %rax,%r15
  98f089:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  98f08e:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  98f093:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  98f09a:	00 
  98f09b:	0f 29 94 24 f0 01 00 	movaps %xmm2,0x1f0(%rsp)
  98f0a2:	00 
  98f0a3:	0f 29 8c 24 e0 01 00 	movaps %xmm1,0x1e0(%rsp)
  98f0aa:	00 
  98f0ab:	0f 29 84 24 d0 01 00 	movaps %xmm0,0x1d0(%rsp)
  98f0b2:	00 
  98f0b3:	b3 01                	mov    $0x1,%bl
  98f0b5:	e9 7a 01 00 00       	jmp    98f234 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf84>
  98f0ba:	49 89 c7             	mov    %rax,%r15
  98f0bd:	48 89 e7             	mov    %rsp,%rdi
  98f0c0:	e8 fb 86 f1 ff       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  98f0c5:	e9 85 01 00 00       	jmp    98f24f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  98f0ca:	ff 15 c8 e5 35 00    	call   *0x35e5c8(%rip)        # ced698 <_DYNAMIC+0x250>
  98f0d0:	eb 4c                	jmp    98f11e <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe6e>
  98f0d2:	49 89 c7             	mov    %rax,%r15
  98f0d5:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  98f0da:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  98f0df:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  98f0e6:	00 
  98f0e7:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  98f0ee:	00 
  98f0ef:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  98f0f6:	00 
  98f0f7:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  98f0fe:	00 
  98f0ff:	e9 4b 01 00 00       	jmp    98f24f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  98f104:	49 89 c7             	mov    %rax,%r15
  98f107:	eb 2a                	jmp    98f133 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe83>
  98f109:	49 89 c7             	mov    %rax,%r15
  98f10c:	eb 2f                	jmp    98f13d <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe8d>
  98f10e:	49 89 c7             	mov    %rax,%r15
  98f111:	e9 46 01 00 00       	jmp    98f25c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  98f116:	49 89 c7             	mov    %rax,%r15
  98f119:	e9 24 01 00 00       	jmp    98f242 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf92>
  98f11e:	49 89 c7             	mov    %rax,%r15
  98f121:	e9 29 01 00 00       	jmp    98f24f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  98f126:	49 89 c7             	mov    %rax,%r15
  98f129:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  98f12e:	e8 fd e2 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f133:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98f138:	e8 f3 e2 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f13d:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98f144:	00 
  98f145:	e8 e6 e2 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f14a:	e9 0d 01 00 00       	jmp    98f25c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  98f14f:	49 89 c7             	mov    %rax,%r15
  98f152:	49 8b 45 20          	mov    0x20(%r13),%rax
  98f156:	48 85 c0             	test   %rax,%rax
  98f159:	0f 84 8b 00 00 00    	je     98f1ea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  98f15f:	f0 48 ff 08          	lock decq (%rax)
  98f163:	0f 85 81 00 00 00    	jne    98f1ea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  98f169:	49 83 c5 20          	add    $0x20,%r13
  98f16d:	4c 89 ef             	mov    %r13,%rdi
  98f170:	ff 15 1a e5 35 00    	call   *0x35e51a(%rip)        # ced690 <_DYNAMIC+0x248>
  98f176:	eb 72                	jmp    98f1ea <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  98f178:	ff 15 1a e5 35 00    	call   *0x35e51a(%rip)        # ced698 <_DYNAMIC+0x250>
  98f17e:	49 89 c7             	mov    %rax,%r15
  98f181:	0f 10 04 24          	movups (%rsp),%xmm0
  98f185:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98f18a:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98f18f:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  98f194:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  98f199:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  98f19e:	e9 8f 00 00 00       	jmp    98f232 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf82>
  98f1a3:	49 89 c7             	mov    %rax,%r15
  98f1a6:	0f 10 04 24          	movups (%rsp),%xmm0
  98f1aa:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  98f1af:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  98f1b4:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  98f1bb:	00 
  98f1bc:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  98f1c3:	00 
  98f1c4:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  98f1cb:	00 
  98f1cc:	eb 64                	jmp    98f232 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf82>
  98f1ce:	49 89 c7             	mov    %rax,%r15
  98f1d1:	4c 89 ef             	mov    %r13,%rdi
  98f1d4:	e8 17 e3 fe ff       	call   97d4f0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f1d9:	eb 03                	jmp    98f1de <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf2e>
  98f1db:	49 89 c7             	mov    %rax,%r15
  98f1de:	49 83 c5 18          	add    $0x18,%r13
  98f1e2:	4c 89 ef             	mov    %r13,%rdi
  98f1e5:	e8 a6 b6 fe ff       	call   97a890 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtNtCs5gUtMYV5hV5_9hyperreal10computable4node10ComputableEECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f1ea:	83 fb 04             	cmp    $0x4,%ebx
  98f1ed:	74 6d                	je     98f25c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  98f1ef:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  98f1f3:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  98f1f7:	c1 e0 04             	shl    $0x4,%eax
  98f1fa:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  98f1fe:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
  98f205:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  98f20c:	00 00 00 00 
  98f210:	4c 89 f7             	mov    %r14,%rdi
  98f213:	e8 18 e2 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f218:	49 83 c6 30          	add    $0x30,%r14
  98f21c:	48 ff c3             	inc    %rbx
  98f21f:	75 ef                	jne    98f210 <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf60>
  98f221:	eb 39                	jmp    98f25c <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  98f223:	ff 15 6f e4 35 00    	call   *0x35e46f(%rip)        # ced698 <_DYNAMIC+0x250>
  98f229:	ff 15 69 e4 35 00    	call   *0x35e469(%rip)        # ced698 <_DYNAMIC+0x250>
  98f22f:	49 89 c7             	mov    %rax,%r15
  98f232:	31 db                	xor    %ebx,%ebx
  98f234:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  98f239:	e8 f2 e1 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f23e:	84 db                	test   %bl,%bl
  98f240:	75 0d                	jne    98f24f <_RNvNtCsaEGsyZiti5M_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  98f242:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  98f249:	00 
  98f24a:	e8 e1 e1 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f24f:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  98f256:	00 
  98f257:	e8 f4 b3 fe ff       	call   97a650 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueANtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4Realj4_ECsaEGsyZiti5M_10hypersolve>
  98f25c:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  98f263:	00 
  98f264:	e8 c7 e1 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f269:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  98f270:	00 
  98f271:	e8 ba e1 fe ff       	call   97d430 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.5367743222342133306>
  98f276:	4c 89 ff             	mov    %r15,%rdi
  98f279:	e8 b2 03 31 00       	call   c9f630 <_Unwind_Resume@plt>
  98f27e:	ff 15 14 e4 35 00    	call   *0x35e414(%rip)        # ced698 <_DYNAMIC+0x250>
