
/tmp/interval-refactor/horner-current/artifacts-candidate-consuming/certification:     file format elf64-x86-64


Disassembly of section .text:

00000000008ca2c0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero>:
  8ca2c0:	55                   	push   %rbp
  8ca2c1:	41 57                	push   %r15
  8ca2c3:	41 56                	push   %r14
  8ca2c5:	41 55                	push   %r13
  8ca2c7:	41 54                	push   %r12
  8ca2c9:	53                   	push   %rbx
  8ca2ca:	48 81 ec b8 02 00 00 	sub    $0x2b8,%rsp
  8ca2d1:	44 89 44 24 4c       	mov    %r8d,0x4c(%rsp)
  8ca2d6:	48 89 f3             	mov    %rsi,%rbx
  8ca2d9:	49 89 fd             	mov    %rdi,%r13
  8ca2dc:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  8ca2e3:	00 
  8ca2e4:	80 3a 00             	cmpb   $0x0,(%rdx)
  8ca2e7:	48 89 8c 24 18 02 00 	mov    %rcx,0x218(%rsp)
  8ca2ee:	00 
  8ca2ef:	75 29                	jne    8ca31a <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5a>
  8ca2f1:	80 39 00             	cmpb   $0x0,(%rcx)
  8ca2f4:	75 24                	jne    8ca31a <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5a>
  8ca2f6:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  8ca2fd:	00 
  8ca2fe:	4c 8d 70 10          	lea    0x10(%rax),%r14
  8ca302:	4c 8d 79 10          	lea    0x10(%rcx),%r15
  8ca306:	4c 89 f7             	mov    %r14,%rdi
  8ca309:	4c 89 fe             	mov    %r15,%rsi
  8ca30c:	ff 15 5e 5a 42 00    	call   *0x425a5e(%rip)        # cefd70 <_DYNAMIC+0x678>
  8ca312:	84 c0                	test   %al,%al
  8ca314:	0f 8e c0 09 00 00    	jle    8cacda <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa1a>
  8ca31a:	48 85 db             	test   %rbx,%rbx
  8ca31d:	0f 84 a3 09 00 00    	je     8cacc6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa06>
  8ca323:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  8ca327:	48 c1 e0 04          	shl    $0x4,%rax
  8ca32b:	4a 8d 34 28          	lea    (%rax,%r13,1),%rsi
  8ca32f:	48 83 c6 d0          	add    $0xffffffffffffffd0,%rsi
  8ca333:	4c 8d b4 24 88 02 00 	lea    0x288(%rsp),%r14
  8ca33a:	00 
  8ca33b:	4c 89 f7             	mov    %r14,%rdi
  8ca33e:	e8 dd 55 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca343:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  8ca34a:	00 
  8ca34b:	4c 89 f6             	mov    %r14,%rsi
  8ca34e:	e8 cd 55 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca353:	0f 10 84 24 88 02 00 	movups 0x288(%rsp),%xmm0
  8ca35a:	00 
  8ca35b:	0f 10 8c 24 98 02 00 	movups 0x298(%rsp),%xmm1
  8ca362:	00 
  8ca363:	0f 10 94 24 a8 02 00 	movups 0x2a8(%rsp),%xmm2
  8ca36a:	00 
  8ca36b:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  8ca372:	00 
  8ca373:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  8ca37a:	00 
  8ca37b:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  8ca382:	00 
  8ca383:	48 c1 e3 04          	shl    $0x4,%rbx
  8ca387:	48 8d 0c 5b          	lea    (%rbx,%rbx,2),%rcx
  8ca38b:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  8ca392:	00 
  8ca393:	48 83 f9 30          	cmp    $0x30,%rcx
  8ca397:	0f 84 37 07 00 00    	je     8caad4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x814>
  8ca39d:	4c 8d a4 24 20 01 00 	lea    0x120(%rsp),%r12
  8ca3a4:	00 
  8ca3a5:	48 8d ac 24 50 01 00 	lea    0x150(%rsp),%rbp
  8ca3ac:	00 
  8ca3ad:	4c 8d b4 24 80 01 00 	lea    0x180(%rsp),%r14
  8ca3b4:	00 
  8ca3b5:	49 83 c5 a0          	add    $0xffffffffffffffa0,%r13
  8ca3b9:	0f b6 44 24 4c       	movzbl 0x4c(%rsp),%eax
  8ca3be:	89 44 24 08          	mov    %eax,0x8(%rsp)
  8ca3c2:	4c 89 6c 24 40       	mov    %r13,0x40(%rsp)
  8ca3c7:	eb 2a                	jmp    8ca3f3 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x133>
  8ca3c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  8ca3d0:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  8ca3d7:	00 
  8ca3d8:	48 83 c1 d0          	add    $0xffffffffffffffd0,%rcx
  8ca3dc:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  8ca3e3:	00 
  8ca3e4:	48 83 f9 30          	cmp    $0x30,%rcx
  8ca3e8:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
  8ca3ed:	0f 84 e1 06 00 00    	je     8caad4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x814>
  8ca3f3:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8ca3f8:	48 8d 9c 24 e0 01 00 	lea    0x1e0(%rsp),%rbx
  8ca3ff:	00 
  8ca400:	48 89 de             	mov    %rbx,%rsi
  8ca403:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  8ca40a:	00 
  8ca40b:	e8 f0 51 fd ff       	call   89f600 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  8ca410:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8ca417:	00 
  8ca418:	48 89 de             	mov    %rbx,%rsi
  8ca41b:	48 8b 9c 24 18 02 00 	mov    0x218(%rsp),%rbx
  8ca422:	00 
  8ca423:	48 89 da             	mov    %rbx,%rdx
  8ca426:	e8 d5 51 fd ff       	call   89f600 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  8ca42b:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8ca432:	00 
  8ca433:	4c 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%r15
  8ca43a:	00 
  8ca43b:	4c 89 fe             	mov    %r15,%rsi
  8ca43e:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  8ca445:	00 
  8ca446:	e8 b5 51 fd ff       	call   89f600 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  8ca44b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca450:	4c 89 fe             	mov    %r15,%rsi
  8ca453:	48 89 da             	mov    %rbx,%rdx
  8ca456:	e8 a5 51 fd ff       	call   89f600 <_RNvXs2f_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs1Ga5OsmdBWa_10hypersolve>
  8ca45b:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  8ca460:	0f 10 4c 24 60       	movups 0x60(%rsp),%xmm1
  8ca465:	0f 10 54 24 70       	movups 0x70(%rsp),%xmm2
  8ca46a:	0f 29 94 24 10 01 00 	movaps %xmm2,0x110(%rsp)
  8ca471:	00 
  8ca472:	0f 29 8c 24 00 01 00 	movaps %xmm1,0x100(%rsp)
  8ca479:	00 
  8ca47a:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
  8ca481:	00 
  8ca482:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  8ca489:	00 
  8ca48a:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  8ca491:	00 
  8ca492:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  8ca499:	00 
  8ca49a:	41 0f 11 54 24 20    	movups %xmm2,0x20(%r12)
  8ca4a0:	41 0f 11 4c 24 10    	movups %xmm1,0x10(%r12)
  8ca4a6:	41 0f 11 04 24       	movups %xmm0,(%r12)
  8ca4ab:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  8ca4b2:	00 
  8ca4b3:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  8ca4ba:	00 
  8ca4bb:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  8ca4c2:	00 
  8ca4c3:	0f 11 55 20          	movups %xmm2,0x20(%rbp)
  8ca4c7:	0f 11 4d 10          	movups %xmm1,0x10(%rbp)
  8ca4cb:	0f 11 45 00          	movups %xmm0,0x0(%rbp)
  8ca4cf:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca4d4:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca4d9:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca4de:	41 0f 11 56 20       	movups %xmm2,0x20(%r14)
  8ca4e3:	41 0f 11 4e 10       	movups %xmm1,0x10(%r14)
  8ca4e8:	41 0f 11 06          	movups %xmm0,(%r14)
  8ca4ec:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8ca4f1:	48 8d 9c 24 f0 00 00 	lea    0xf0(%rsp),%rbx
  8ca4f8:	00 
  8ca4f9:	48 89 de             	mov    %rbx,%rsi
  8ca4fc:	e8 1f 54 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca501:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8ca508:	00 
  8ca509:	48 89 de             	mov    %rbx,%rsi
  8ca50c:	e8 0f 54 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca511:	4c 89 e7             	mov    %r12,%rdi
  8ca514:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  8ca519:	8b 54 24 08          	mov    0x8(%rsp),%edx
  8ca51d:	e8 ae 13 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8ca522:	3c ff                	cmp    $0xff,%al
  8ca524:	74 1a                	je     8ca540 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x280>
  8ca526:	0f b6 c0             	movzbl %al,%eax
  8ca529:	3d fe 00 00 00       	cmp    $0xfe,%eax
  8ca52e:	75 45                	jne    8ca575 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2b5>
  8ca530:	e9 b7 06 00 00       	jmp    8cabec <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  8ca535:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  8ca53c:	00 00 00 00 
  8ca540:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca545:	4c 89 e6             	mov    %r12,%rsi
  8ca548:	e8 d3 53 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca54d:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8ca552:	e8 e9 fa fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca557:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca55c:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca561:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca566:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  8ca56b:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  8ca570:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  8ca575:	4c 89 e7             	mov    %r12,%rdi
  8ca578:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  8ca57f:	00 
  8ca580:	8b 54 24 08          	mov    0x8(%rsp),%edx
  8ca584:	e8 47 13 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8ca589:	3c 01                	cmp    $0x1,%al
  8ca58b:	74 13                	je     8ca5a0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2e0>
  8ca58d:	0f b6 c0             	movzbl %al,%eax
  8ca590:	3d fe 00 00 00       	cmp    $0xfe,%eax
  8ca595:	75 4a                	jne    8ca5e1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x321>
  8ca597:	e9 50 06 00 00       	jmp    8cabec <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  8ca59c:	0f 1f 40 00          	nopl   0x0(%rax)
  8ca5a0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca5a5:	4c 89 e6             	mov    %r12,%rsi
  8ca5a8:	e8 73 53 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca5ad:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8ca5b4:	00 
  8ca5b5:	e8 86 fa fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca5ba:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca5bf:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca5c4:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca5c9:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  8ca5d0:	00 
  8ca5d1:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  8ca5d8:	00 
  8ca5d9:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  8ca5e0:	00 
  8ca5e1:	48 89 ef             	mov    %rbp,%rdi
  8ca5e4:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  8ca5e9:	8b 54 24 08          	mov    0x8(%rsp),%edx
  8ca5ed:	e8 de 12 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8ca5f2:	3c ff                	cmp    $0xff,%al
  8ca5f4:	74 1a                	je     8ca610 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x350>
  8ca5f6:	0f b6 c0             	movzbl %al,%eax
  8ca5f9:	3d fe 00 00 00       	cmp    $0xfe,%eax
  8ca5fe:	75 45                	jne    8ca645 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x385>
  8ca600:	e9 e7 05 00 00       	jmp    8cabec <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  8ca605:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  8ca60c:	00 00 00 00 
  8ca610:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca615:	48 89 ee             	mov    %rbp,%rsi
  8ca618:	e8 03 53 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca61d:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8ca622:	e8 19 fa fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca627:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca62c:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca631:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca636:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  8ca63b:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  8ca640:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  8ca645:	48 89 ef             	mov    %rbp,%rdi
  8ca648:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  8ca64f:	00 
  8ca650:	8b 54 24 08          	mov    0x8(%rsp),%edx
  8ca654:	e8 77 12 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8ca659:	3c 01                	cmp    $0x1,%al
  8ca65b:	74 13                	je     8ca670 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3b0>
  8ca65d:	0f b6 c0             	movzbl %al,%eax
  8ca660:	3d fe 00 00 00       	cmp    $0xfe,%eax
  8ca665:	75 4a                	jne    8ca6b1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f1>
  8ca667:	e9 80 05 00 00       	jmp    8cabec <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  8ca66c:	0f 1f 40 00          	nopl   0x0(%rax)
  8ca670:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca675:	48 89 ee             	mov    %rbp,%rsi
  8ca678:	e8 a3 52 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca67d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8ca684:	00 
  8ca685:	e8 b6 f9 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca68a:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca68f:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca694:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca699:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  8ca6a0:	00 
  8ca6a1:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  8ca6a8:	00 
  8ca6a9:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  8ca6b0:	00 
  8ca6b1:	4c 89 f7             	mov    %r14,%rdi
  8ca6b4:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  8ca6b9:	8b 54 24 08          	mov    0x8(%rsp),%edx
  8ca6bd:	e8 0e 12 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8ca6c2:	3c ff                	cmp    $0xff,%al
  8ca6c4:	74 1a                	je     8ca6e0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x420>
  8ca6c6:	0f b6 c0             	movzbl %al,%eax
  8ca6c9:	3d fe 00 00 00       	cmp    $0xfe,%eax
  8ca6ce:	75 45                	jne    8ca715 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x455>
  8ca6d0:	e9 17 05 00 00       	jmp    8cabec <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  8ca6d5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  8ca6dc:	00 00 00 00 
  8ca6e0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca6e5:	4c 89 f6             	mov    %r14,%rsi
  8ca6e8:	e8 33 52 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca6ed:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8ca6f2:	e8 49 f9 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca6f7:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca6fc:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca701:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca706:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  8ca70b:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  8ca710:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  8ca715:	4c 89 f7             	mov    %r14,%rdi
  8ca718:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  8ca71f:	00 
  8ca720:	8b 54 24 08          	mov    0x8(%rsp),%edx
  8ca724:	e8 a7 11 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8ca729:	3c 01                	cmp    $0x1,%al
  8ca72b:	74 13                	je     8ca740 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x480>
  8ca72d:	0f b6 c0             	movzbl %al,%eax
  8ca730:	3d fe 00 00 00       	cmp    $0xfe,%eax
  8ca735:	75 4a                	jne    8ca781 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x4c1>
  8ca737:	e9 b0 04 00 00       	jmp    8cabec <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x92c>
  8ca73c:	0f 1f 40 00          	nopl   0x0(%rax)
  8ca740:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8ca745:	4c 89 f6             	mov    %r14,%rsi
  8ca748:	e8 d3 51 01 00       	call   8df920 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.1920840814064448650>
  8ca74d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8ca754:	00 
  8ca755:	e8 e6 f8 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca75a:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8ca75f:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8ca764:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8ca769:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  8ca770:	00 
  8ca771:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  8ca778:	00 
  8ca779:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  8ca780:	00 
  8ca781:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  8ca788:	00 
  8ca789:	49 01 c5             	add    %rax,%r13
  8ca78c:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  8ca791:	0f 28 4c 24 60       	movaps 0x60(%rsp),%xmm1
  8ca796:	0f 28 54 24 70       	movaps 0x70(%rsp),%xmm2
  8ca79b:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  8ca7a0:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  8ca7a5:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  8ca7aa:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8ca7b1:	00 
  8ca7b2:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  8ca7b7:	48 89 de             	mov    %rbx,%rsi
  8ca7ba:	4c 89 ea             	mov    %r13,%rdx
  8ca7bd:	e8 0e 14 fd ff       	call   89bbd0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs1Ga5OsmdBWa_10hypersolve>
  8ca7c2:	48 89 df             	mov    %rbx,%rdi
  8ca7c5:	e8 96 c4 fb ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  8ca7ca:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  8ca7d1:	00 
  8ca7d2:	e8 69 f8 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca7d7:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  8ca7de:	00 
  8ca7df:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  8ca7e6:	00 
  8ca7e7:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  8ca7ee:	00 
  8ca7ef:	0f 29 94 24 00 02 00 	movaps %xmm2,0x200(%rsp)
  8ca7f6:	00 
  8ca7f7:	0f 29 8c 24 f0 01 00 	movaps %xmm1,0x1f0(%rsp)
  8ca7fe:	00 
  8ca7ff:	0f 29 84 24 e0 01 00 	movaps %xmm0,0x1e0(%rsp)
  8ca806:	00 
  8ca807:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
  8ca80e:	00 
  8ca80f:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
  8ca816:	00 
  8ca817:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
  8ca81e:	00 
  8ca81f:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  8ca824:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  8ca829:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  8ca82e:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8ca835:	00 
  8ca836:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  8ca83b:	48 89 de             	mov    %rbx,%rsi
  8ca83e:	4c 89 ea             	mov    %r13,%rdx
  8ca841:	e8 8a 13 fd ff       	call   89bbd0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs1Ga5OsmdBWa_10hypersolve>
  8ca846:	48 89 df             	mov    %rbx,%rdi
  8ca849:	e8 12 c4 fb ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  8ca84e:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  8ca855:	00 
  8ca856:	e8 e5 f7 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca85b:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  8ca862:	00 
  8ca863:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  8ca86a:	00 
  8ca86b:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  8ca872:	00 
  8ca873:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  8ca87a:	00 
  8ca87b:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  8ca882:	00 
  8ca883:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  8ca88a:	00 
  8ca88b:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
  8ca892:	00 
  8ca893:	f0 48 ff 08          	lock decq (%rax)
  8ca897:	75 1b                	jne    8ca8b4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5f4>
  8ca899:	bb 01 00 00 00       	mov    $0x1,%ebx
  8ca89e:	4c 8d ac 24 f0 00 00 	lea    0xf0(%rsp),%r13
  8ca8a5:	00 
  8ca8a6:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  8ca8ad:	00 
  8ca8ae:	ff 15 a4 50 42 00    	call   *0x4250a4(%rip)        # cef958 <_DYNAMIC+0x260>
  8ca8b4:	bb 01 00 00 00       	mov    $0x1,%ebx
  8ca8b9:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8ca8c0:	00 
  8ca8c1:	49 89 fd             	mov    %rdi,%r13
  8ca8c4:	e8 37 f8 fe ff       	call   8ba100 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca8c9:	48 8b 84 24 08 01 00 	mov    0x108(%rsp),%rax
  8ca8d0:	00 
  8ca8d1:	48 85 c0             	test   %rax,%rax
  8ca8d4:	74 4a                	je     8ca920 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x660>
  8ca8d6:	f0 48 ff 08          	lock decq (%rax)
  8ca8da:	75 1b                	jne    8ca8f7 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x637>
  8ca8dc:	bb 01 00 00 00       	mov    $0x1,%ebx
  8ca8e1:	4c 8d ac 24 f0 00 00 	lea    0xf0(%rsp),%r13
  8ca8e8:	00 
  8ca8e9:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  8ca8f0:	00 
  8ca8f1:	ff 15 41 50 42 00    	call   *0x425041(%rip)        # cef938 <_DYNAMIC+0x240>
  8ca8f7:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
  8ca8fe:	00 
  8ca8ff:	48 85 c0             	test   %rax,%rax
  8ca902:	74 1c                	je     8ca920 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x660>
  8ca904:	f0 48 ff 08          	lock decq (%rax)
  8ca908:	75 16                	jne    8ca920 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x660>
  8ca90a:	bb 01 00 00 00       	mov    $0x1,%ebx
  8ca90f:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  8ca916:	00 
  8ca917:	ff 15 23 50 42 00    	call   *0x425023(%rip)        # cef940 <_DYNAMIC+0x248>
  8ca91d:	0f 1f 00             	nopl   (%rax)
  8ca920:	48 8b 84 24 30 01 00 	mov    0x130(%rsp),%rax
  8ca927:	00 
  8ca928:	f0 48 ff 08          	lock decq (%rax)
  8ca92c:	75 16                	jne    8ca944 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x684>
  8ca92e:	bb 02 00 00 00       	mov    $0x2,%ebx
  8ca933:	4d 89 e5             	mov    %r12,%r13
  8ca936:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  8ca93d:	00 
  8ca93e:	ff 15 14 50 42 00    	call   *0x425014(%rip)        # cef958 <_DYNAMIC+0x260>
  8ca944:	bb 02 00 00 00       	mov    $0x2,%ebx
  8ca949:	4c 89 e7             	mov    %r12,%rdi
  8ca94c:	4d 89 e5             	mov    %r12,%r13
  8ca94f:	e8 ac f7 fe ff       	call   8ba100 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca954:	48 8b 84 24 38 01 00 	mov    0x138(%rsp),%rax
  8ca95b:	00 
  8ca95c:	48 85 c0             	test   %rax,%rax
  8ca95f:	74 4f                	je     8ca9b0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6f0>
  8ca961:	f0 48 ff 08          	lock decq (%rax)
  8ca965:	75 16                	jne    8ca97d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6bd>
  8ca967:	bb 02 00 00 00       	mov    $0x2,%ebx
  8ca96c:	4d 89 e5             	mov    %r12,%r13
  8ca96f:	48 8d bc 24 38 01 00 	lea    0x138(%rsp),%rdi
  8ca976:	00 
  8ca977:	ff 15 bb 4f 42 00    	call   *0x424fbb(%rip)        # cef938 <_DYNAMIC+0x240>
  8ca97d:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  8ca984:	00 
  8ca985:	48 85 c0             	test   %rax,%rax
  8ca988:	74 26                	je     8ca9b0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6f0>
  8ca98a:	f0 48 ff 08          	lock decq (%rax)
  8ca98e:	75 20                	jne    8ca9b0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6f0>
  8ca990:	bb 02 00 00 00       	mov    $0x2,%ebx
  8ca995:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  8ca99c:	00 
  8ca99d:	ff 15 9d 4f 42 00    	call   *0x424f9d(%rip)        # cef940 <_DYNAMIC+0x248>
  8ca9a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  8ca9aa:	84 00 00 00 00 00 
  8ca9b0:	48 8b 84 24 60 01 00 	mov    0x160(%rsp),%rax
  8ca9b7:	00 
  8ca9b8:	f0 48 ff 08          	lock decq (%rax)
  8ca9bc:	75 16                	jne    8ca9d4 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x714>
  8ca9be:	bb 03 00 00 00       	mov    $0x3,%ebx
  8ca9c3:	49 89 ed             	mov    %rbp,%r13
  8ca9c6:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  8ca9cd:	00 
  8ca9ce:	ff 15 84 4f 42 00    	call   *0x424f84(%rip)        # cef958 <_DYNAMIC+0x260>
  8ca9d4:	bb 03 00 00 00       	mov    $0x3,%ebx
  8ca9d9:	48 89 ef             	mov    %rbp,%rdi
  8ca9dc:	49 89 ed             	mov    %rbp,%r13
  8ca9df:	e8 1c f7 fe ff       	call   8ba100 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8ca9e4:	48 8b 84 24 68 01 00 	mov    0x168(%rsp),%rax
  8ca9eb:	00 
  8ca9ec:	48 85 c0             	test   %rax,%rax
  8ca9ef:	74 4f                	je     8caa40 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x780>
  8ca9f1:	f0 48 ff 08          	lock decq (%rax)
  8ca9f5:	75 16                	jne    8caa0d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x74d>
  8ca9f7:	bb 03 00 00 00       	mov    $0x3,%ebx
  8ca9fc:	49 89 ed             	mov    %rbp,%r13
  8ca9ff:	48 8d bc 24 68 01 00 	lea    0x168(%rsp),%rdi
  8caa06:	00 
  8caa07:	ff 15 2b 4f 42 00    	call   *0x424f2b(%rip)        # cef938 <_DYNAMIC+0x240>
  8caa0d:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  8caa14:	00 
  8caa15:	48 85 c0             	test   %rax,%rax
  8caa18:	74 26                	je     8caa40 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x780>
  8caa1a:	f0 48 ff 08          	lock decq (%rax)
  8caa1e:	75 20                	jne    8caa40 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x780>
  8caa20:	bb 03 00 00 00       	mov    $0x3,%ebx
  8caa25:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  8caa2c:	00 
  8caa2d:	ff 15 0d 4f 42 00    	call   *0x424f0d(%rip)        # cef940 <_DYNAMIC+0x248>
  8caa33:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  8caa3a:	84 00 00 00 00 00 
  8caa40:	48 8b 84 24 90 01 00 	mov    0x190(%rsp),%rax
  8caa47:	00 
  8caa48:	f0 48 ff 08          	lock decq (%rax)
  8caa4c:	75 16                	jne    8caa64 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7a4>
  8caa4e:	bb 04 00 00 00       	mov    $0x4,%ebx
  8caa53:	4d 89 f5             	mov    %r14,%r13
  8caa56:	48 8d bc 24 90 01 00 	lea    0x190(%rsp),%rdi
  8caa5d:	00 
  8caa5e:	ff 15 f4 4e 42 00    	call   *0x424ef4(%rip)        # cef958 <_DYNAMIC+0x260>
  8caa64:	bb 04 00 00 00       	mov    $0x4,%ebx
  8caa69:	4c 89 f7             	mov    %r14,%rdi
  8caa6c:	4d 89 f5             	mov    %r14,%r13
  8caa6f:	e8 8c f6 fe ff       	call   8ba100 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caa74:	48 8b 84 24 98 01 00 	mov    0x198(%rsp),%rax
  8caa7b:	00 
  8caa7c:	48 85 c0             	test   %rax,%rax
  8caa7f:	0f 84 4b f9 ff ff    	je     8ca3d0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  8caa85:	f0 48 ff 08          	lock decq (%rax)
  8caa89:	75 16                	jne    8caaa1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7e1>
  8caa8b:	bb 04 00 00 00       	mov    $0x4,%ebx
  8caa90:	4d 89 f5             	mov    %r14,%r13
  8caa93:	48 8d bc 24 98 01 00 	lea    0x198(%rsp),%rdi
  8caa9a:	00 
  8caa9b:	ff 15 97 4e 42 00    	call   *0x424e97(%rip)        # cef938 <_DYNAMIC+0x240>
  8caaa1:	48 8b 84 24 a0 01 00 	mov    0x1a0(%rsp),%rax
  8caaa8:	00 
  8caaa9:	48 85 c0             	test   %rax,%rax
  8caaac:	0f 84 1e f9 ff ff    	je     8ca3d0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  8caab2:	f0 48 ff 08          	lock decq (%rax)
  8caab6:	0f 85 14 f9 ff ff    	jne    8ca3d0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  8caabc:	bb 04 00 00 00       	mov    $0x4,%ebx
  8caac1:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  8caac8:	00 
  8caac9:	ff 15 71 4e 42 00    	call   *0x424e71(%rip)        # cef940 <_DYNAMIC+0x248>
  8caacf:	e9 fc f8 ff ff       	jmp    8ca3d0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x110>
  8caad4:	0f b6 8c 24 e0 01 00 	movzbl 0x1e0(%rsp),%ecx
  8caadb:	00 
  8caadc:	0f 10 84 24 e1 01 00 	movups 0x1e1(%rsp),%xmm0
  8caae3:	00 
  8caae4:	0f 29 84 24 20 02 00 	movaps %xmm0,0x220(%rsp)
  8caaeb:	00 
  8caaec:	0f 10 84 24 f1 01 00 	movups 0x1f1(%rsp),%xmm0
  8caaf3:	00 
  8caaf4:	0f 29 84 24 30 02 00 	movaps %xmm0,0x230(%rsp)
  8caafb:	00 
  8caafc:	0f 10 84 24 00 02 00 	movups 0x200(%rsp),%xmm0
  8cab03:	00 
  8cab04:	0f 11 84 24 3f 02 00 	movups %xmm0,0x23f(%rsp)
  8cab0b:	00 
  8cab0c:	0f 28 84 24 b0 01 00 	movaps 0x1b0(%rsp),%xmm0
  8cab13:	00 
  8cab14:	0f 28 8c 24 c0 01 00 	movaps 0x1c0(%rsp),%xmm1
  8cab1b:	00 
  8cab1c:	0f 28 94 24 d0 01 00 	movaps 0x1d0(%rsp),%xmm2
  8cab23:	00 
  8cab24:	0f 29 84 24 50 02 00 	movaps %xmm0,0x250(%rsp)
  8cab2b:	00 
  8cab2c:	0f 29 8c 24 60 02 00 	movaps %xmm1,0x260(%rsp)
  8cab33:	00 
  8cab34:	0f 29 94 24 70 02 00 	movaps %xmm2,0x270(%rsp)
  8cab3b:	00 
  8cab3c:	b0 02                	mov    $0x2,%al
  8cab3e:	80 f9 ff             	cmp    $0xff,%cl
  8cab41:	0f 84 81 01 00 00    	je     8cacc8 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa08>
  8cab47:	0f 10 84 24 3f 02 00 	movups 0x23f(%rsp),%xmm0
  8cab4e:	00 
  8cab4f:	0f 11 84 24 d0 00 00 	movups %xmm0,0xd0(%rsp)
  8cab56:	00 
  8cab57:	0f 28 84 24 20 02 00 	movaps 0x220(%rsp),%xmm0
  8cab5e:	00 
  8cab5f:	0f 28 8c 24 30 02 00 	movaps 0x230(%rsp),%xmm1
  8cab66:	00 
  8cab67:	0f 11 8c 24 c1 00 00 	movups %xmm1,0xc1(%rsp)
  8cab6e:	00 
  8cab6f:	0f 11 84 24 b1 00 00 	movups %xmm0,0xb1(%rsp)
  8cab76:	00 
  8cab77:	0f 28 84 24 50 02 00 	movaps 0x250(%rsp),%xmm0
  8cab7e:	00 
  8cab7f:	0f 28 8c 24 60 02 00 	movaps 0x260(%rsp),%xmm1
  8cab86:	00 
  8cab87:	0f 28 94 24 70 02 00 	movaps 0x270(%rsp),%xmm2
  8cab8e:	00 
  8cab8f:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  8cab94:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  8cab99:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  8cab9e:	88 8c 24 b0 00 00 00 	mov    %cl,0xb0(%rsp)
  8caba5:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cabac:	00 
  8cabad:	ff 15 ad 4e 42 00    	call   *0x424ead(%rip)        # cefa60 <_DYNAMIC+0x368>
  8cabb3:	0f b6 6c 24 4c       	movzbl 0x4c(%rsp),%ebp
  8cabb8:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8cabbf:	00 
  8cabc0:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
  8cabc7:	00 
  8cabc8:	89 ea                	mov    %ebp,%edx
  8cabca:	e8 01 0d 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8cabcf:	89 c3                	mov    %eax,%ebx
  8cabd1:	80 fb fe             	cmp    $0xfe,%bl
  8cabd4:	0f 85 91 00 00 00    	jne    8cac6b <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x9ab>
  8cabda:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cabe1:	00 
  8cabe2:	e8 59 f4 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cabe7:	e9 c3 00 00 00       	jmp    8cacaf <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x9ef>
  8cabec:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8cabf3:	00 
  8cabf4:	e8 47 f4 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cabf9:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8cabfe:	e8 3d f4 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac03:	bb 01 00 00 00       	mov    $0x1,%ebx
  8cac08:	31 ed                	xor    %ebp,%ebp
  8cac0a:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cac11:	00 
  8cac12:	e8 29 f4 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac17:	bb 02 00 00 00       	mov    $0x2,%ebx
  8cac1c:	31 ed                	xor    %ebp,%ebp
  8cac1e:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  8cac25:	00 
  8cac26:	e8 15 f4 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac2b:	bb 03 00 00 00       	mov    $0x3,%ebx
  8cac30:	31 ed                	xor    %ebp,%ebp
  8cac32:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  8cac39:	00 
  8cac3a:	e8 01 f4 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac3f:	bb 04 00 00 00       	mov    $0x4,%ebx
  8cac44:	40 b5 01             	mov    $0x1,%bpl
  8cac47:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  8cac4e:	00 
  8cac4f:	e8 ec f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac54:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  8cac5b:	00 
  8cac5c:	e8 df f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac61:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  8cac68:	00 
  8cac69:	eb 56                	jmp    8cacc1 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa01>
  8cac6b:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cac72:	00 
  8cac73:	e8 c8 f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cac78:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cac7f:	00 
  8cac80:	ff 15 da 4d 42 00    	call   *0x424dda(%rip)        # cefa60 <_DYNAMIC+0x368>
  8cac86:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8cac8b:	48 8d b4 24 f0 00 00 	lea    0xf0(%rsp),%rsi
  8cac92:	00 
  8cac93:	89 ea                	mov    %ebp,%edx
  8cac95:	e8 36 0c 01 00       	call   8db8d0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.1920840814064448650>
  8cac9a:	89 c5                	mov    %eax,%ebp
  8cac9c:	40 80 fd fe          	cmp    $0xfe,%bpl
  8caca0:	75 5b                	jne    8cacfd <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa3d>
  8caca2:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8caca9:	00 
  8cacaa:	e8 91 f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cacaf:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8cacb4:	e8 87 f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cacb9:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8cacc0:	00 
  8cacc1:	e8 7a f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cacc6:	b0 02                	mov    $0x2,%al
  8cacc8:	48 81 c4 b8 02 00 00 	add    $0x2b8,%rsp
  8caccf:	5b                   	pop    %rbx
  8cacd0:	41 5c                	pop    %r12
  8cacd2:	41 5d                	pop    %r13
  8cacd4:	41 5e                	pop    %r14
  8cacd6:	41 5f                	pop    %r15
  8cacd8:	5d                   	pop    %rbp
  8cacd9:	c3                   	ret
  8cacda:	48 85 db             	test   %rbx,%rbx
  8cacdd:	74 e7                	je     8cacc6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa06>
  8cacdf:	48 89 d8             	mov    %rbx,%rax
  8cace2:	48 c1 e0 04          	shl    $0x4,%rax
  8cace6:	4c 89 e9             	mov    %r13,%rcx
  8cace9:	4c 8d 2c 40          	lea    (%rax,%rax,2),%r13
  8caced:	42 80 7c 29 d0 00    	cmpb   $0x0,-0x30(%rcx,%r13,1)
  8cacf3:	74 3f                	je     8cad34 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa74>
  8cacf5:	49 89 cd             	mov    %rcx,%r13
  8cacf8:	e9 26 f6 ff ff       	jmp    8ca323 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x63>
  8cacfd:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cad04:	00 
  8cad05:	e8 36 f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cad0a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8cad0f:	e8 2c f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cad14:	80 fb 01             	cmp    $0x1,%bl
  8cad17:	0f 94 c0             	sete   %al
  8cad1a:	40 80 fd ff          	cmp    $0xff,%bpl
  8cad1e:	0f 94 c3             	sete   %bl
  8cad21:	08 c3                	or     %al,%bl
  8cad23:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8cad2a:	00 
  8cad2b:	e8 10 f3 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cad30:	89 d8                	mov    %ebx,%eax
  8cad32:	eb 94                	jmp    8cacc8 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa08>
  8cad34:	4a 8b 44 29 e0       	mov    -0x20(%rcx,%r13,1),%rax
  8cad39:	f0 48 ff 00          	lock incq (%rax)
  8cad3d:	0f 8e 2a 01 00 00    	jle    8cae6d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbad>
  8cad43:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
  8cad48:	4a 8b 44 29 e0       	mov    -0x20(%rcx,%r13,1),%rax
  8cad4d:	f0 48 ff 00          	lock incq (%rax)
  8cad51:	0f 8e 16 01 00 00    	jle    8cae6d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbad>
  8cad57:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  8cad5e:	00 
  8cad5f:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
  8cad66:	00 
  8cad67:	48 89 c2             	mov    %rax,%rdx
  8cad6a:	48 83 fb 01          	cmp    $0x1,%rbx
  8cad6e:	75 20                	jne    8cad90 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xad0>
  8cad70:	b1 01                	mov    $0x1,%cl
  8cad72:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  8cad76:	74 07                	je     8cad7f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xabf>
  8cad78:	80 7a 64 00          	cmpb   $0x0,0x64(%rdx)
  8cad7c:	0f 94 c1             	sete   %cl
  8cad7f:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cad86:	00 
  8cad87:	89 cb                	mov    %ecx,%ebx
  8cad89:	e8 42 f2 fe ff       	call   8b9fd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  8cad8e:	eb a0                	jmp    8cad30 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa70>
  8cad90:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  8cad95:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  8cad99:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  8cad9e:	eb 3e                	jmp    8cadde <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb1e>
  8cada0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  8cada5:	4a 8d 14 28          	lea    (%rax,%r13,1),%rdx
  8cada9:	4c 89 a4 24 f0 00 00 	mov    %r12,0xf0(%rsp)
  8cadb0:	00 
  8cadb1:	48 89 ac 24 f8 00 00 	mov    %rbp,0xf8(%rsp)
  8cadb8:	00 
  8cadb9:	4c 89 e7             	mov    %r12,%rdi
  8cadbc:	48 89 ee             	mov    %rbp,%rsi
  8cadbf:	e8 7c c8 fe ff       	call   8b7640 <_RINvNtCs3yvFvlVLaRc_13hyperinterval8rational17translated_boundsNtNtNtCs5gUtMYV5hV5_9hyperreal8rational10arithmetic8RationalECs1Ga5OsmdBWa_10hypersolve>
  8cadc4:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
  8cadcb:	00 
  8cadcc:	48 89 94 24 f8 00 00 	mov    %rdx,0xf8(%rsp)
  8cadd3:	00 
  8cadd4:	49 83 c5 d0          	add    $0xffffffffffffffd0,%r13
  8cadd8:	49 83 fd 30          	cmp    $0x30,%r13
  8caddc:	74 92                	je     8cad70 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xab0>
  8cadde:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
  8cade3:	42 80 7c 28 a0 00    	cmpb   $0x0,-0x60(%rax,%r13,1)
  8cade9:	75 62                	jne    8cae4d <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb8d>
  8cadeb:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cadf2:	00 
  8cadf3:	48 8d b4 24 f8 00 00 	lea    0xf8(%rsp),%rsi
  8cadfa:	00 
  8cadfb:	4c 89 f2             	mov    %r14,%rdx
  8cadfe:	4c 89 f9             	mov    %r15,%rcx
  8cae01:	e8 9a 06 01 00       	call   8db4a0 <_RNvNtCs3yvFvlVLaRc_13hyperinterval8rational12product_hull>
  8cae06:	49 89 c4             	mov    %rax,%r12
  8cae09:	48 89 d5             	mov    %rdx,%rbp
  8cae0c:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  8cae13:	00 
  8cae14:	f0 48 ff 08          	lock decq (%rax)
  8cae18:	75 0e                	jne    8cae28 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb68>
  8cae1a:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cae21:	00 
  8cae22:	ff 15 30 4b 42 00    	call   *0x424b30(%rip)        # cef958 <_DYNAMIC+0x260>
  8cae28:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
  8cae2f:	00 
  8cae30:	f0 48 ff 08          	lock decq (%rax)
  8cae34:	0f 85 66 ff ff ff    	jne    8cada0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae0>
  8cae3a:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  8cae41:	00 
  8cae42:	ff 15 10 4b 42 00    	call   *0x424b10(%rip)        # cef958 <_DYNAMIC+0x260>
  8cae48:	e9 53 ff ff ff       	jmp    8cada0 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae0>
  8cae4d:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cae54:	00 
  8cae55:	e8 76 f1 fe ff       	call   8b9fd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  8cae5a:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
  8cae5f:	48 85 db             	test   %rbx,%rbx
  8cae62:	0f 85 bb f4 ff ff    	jne    8ca323 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x63>
  8cae68:	e9 59 fe ff ff       	jmp    8cacc6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa06>
  8cae6d:	0f 0b                	ud2
  8cae6f:	49 89 c7             	mov    %rax,%r15
  8cae72:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
  8cae79:	00 
  8cae7a:	f0 48 ff 08          	lock decq (%rax)
  8cae7e:	75 19                	jne    8cae99 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbd9>
  8cae80:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  8cae87:	00 
  8cae88:	ff 15 ca 4a 42 00    	call   *0x424aca(%rip)        # cef958 <_DYNAMIC+0x260>
  8cae8e:	eb 09                	jmp    8cae99 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbd9>
  8cae90:	ff 15 b2 4a 42 00    	call   *0x424ab2(%rip)        # cef948 <_DYNAMIC+0x250>
  8cae96:	49 89 c7             	mov    %rax,%r15
  8cae99:	4c 89 a4 24 f0 00 00 	mov    %r12,0xf0(%rsp)
  8caea0:	00 
  8caea1:	48 89 ac 24 f8 00 00 	mov    %rbp,0xf8(%rsp)
  8caea8:	00 
  8caea9:	eb 03                	jmp    8caeae <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbee>
  8caeab:	49 89 c7             	mov    %rax,%r15
  8caeae:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8caeb5:	00 
  8caeb6:	e8 15 f1 fe ff       	call   8b9fd0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs3yvFvlVLaRc_13hyperinterval8rational24NonEmptyRationalIntervalECs1Ga5OsmdBWa_10hypersolve>
  8caebb:	e9 e6 02 00 00       	jmp    8cb1a6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xee6>
  8caec0:	ff 15 82 4a 42 00    	call   *0x424a82(%rip)        # cef948 <_DYNAMIC+0x250>
  8caec6:	49 89 c7             	mov    %rax,%r15
  8caec9:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8caed0:	00 
  8caed1:	e8 6a f1 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caed6:	eb 2c                	jmp    8caf04 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc44>
  8caed8:	49 89 c7             	mov    %rax,%r15
  8caedb:	eb 31                	jmp    8caf0e <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc4e>
  8caedd:	49 89 c7             	mov    %rax,%r15
  8caee0:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8caee7:	00 
  8caee8:	e8 53 f1 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caeed:	eb 15                	jmp    8caf04 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc44>
  8caeef:	49 89 c7             	mov    %rax,%r15
  8caef2:	e9 a2 02 00 00       	jmp    8cb199 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xed9>
  8caef7:	e9 52 01 00 00       	jmp    8cb04e <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd8e>
  8caefc:	e9 45 01 00 00       	jmp    8cb046 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd86>
  8caf01:	49 89 c7             	mov    %rax,%r15
  8caf04:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8caf09:	e8 32 f1 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caf0e:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8caf15:	00 
  8caf16:	e8 25 f1 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caf1b:	e9 86 02 00 00       	jmp    8cb1a6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xee6>
  8caf20:	49 89 c7             	mov    %rax,%r15
  8caf23:	48 8d bc 24 88 02 00 	lea    0x288(%rsp),%rdi
  8caf2a:	00 
  8caf2b:	e8 10 f1 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caf30:	e9 71 02 00 00       	jmp    8cb1a6 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xee6>
  8caf35:	ff 15 0d 4a 42 00    	call   *0x424a0d(%rip)        # cef948 <_DYNAMIC+0x250>
  8caf3b:	49 89 c7             	mov    %rax,%r15
  8caf3e:	40 84 ed             	test   %bpl,%bpl
  8caf41:	0f 85 45 02 00 00    	jne    8cb18c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  8caf47:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  8caf4b:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  8caf4f:	c1 e0 04             	shl    $0x4,%eax
  8caf52:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  8caf56:	49 81 c6 f0 00 00 00 	add    $0xf0,%r14
  8caf5d:	0f 1f 00             	nopl   (%rax)
  8caf60:	4c 89 f7             	mov    %r14,%rdi
  8caf63:	e8 d8 f0 fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8caf68:	49 83 c6 30          	add    $0x30,%r14
  8caf6c:	48 ff c3             	inc    %rbx
  8caf6f:	75 ef                	jne    8caf60 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca0>
  8caf71:	e9 16 02 00 00       	jmp    8cb18c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  8caf76:	ff 15 cc 49 42 00    	call   *0x4249cc(%rip)        # cef948 <_DYNAMIC+0x250>
  8caf7c:	49 89 c7             	mov    %rax,%r15
  8caf7f:	e9 9b 01 00 00       	jmp    8cb11f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  8caf84:	49 89 c7             	mov    %rax,%r15
  8caf87:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8caf8c:	e8 cf bc fb ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  8caf91:	b3 01                	mov    $0x1,%bl
  8caf93:	e9 cc 01 00 00       	jmp    8cb164 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea4>
  8caf98:	ff 15 aa 49 42 00    	call   *0x4249aa(%rip)        # cef948 <_DYNAMIC+0x250>
  8caf9e:	49 89 c7             	mov    %rax,%r15
  8cafa1:	b3 01                	mov    $0x1,%bl
  8cafa3:	e9 bc 01 00 00       	jmp    8cb164 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea4>
  8cafa8:	49 89 c7             	mov    %rax,%r15
  8cafab:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  8cafb2:	00 
  8cafb3:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  8cafba:	00 
  8cafbb:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  8cafc2:	00 
  8cafc3:	0f 29 94 24 00 02 00 	movaps %xmm2,0x200(%rsp)
  8cafca:	00 
  8cafcb:	0f 29 8c 24 f0 01 00 	movaps %xmm1,0x1f0(%rsp)
  8cafd2:	00 
  8cafd3:	0f 29 84 24 e0 01 00 	movaps %xmm0,0x1e0(%rsp)
  8cafda:	00 
  8cafdb:	b3 01                	mov    $0x1,%bl
  8cafdd:	e9 82 01 00 00       	jmp    8cb164 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea4>
  8cafe2:	49 89 c7             	mov    %rax,%r15
  8cafe5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  8cafea:	e8 71 bc fb ff       	call   886c60 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.10868294379668001578>
  8cafef:	e9 8b 01 00 00       	jmp    8cb17f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  8caff4:	ff 15 4e 49 42 00    	call   *0x42494e(%rip)        # cef948 <_DYNAMIC+0x250>
  8caffa:	eb 52                	jmp    8cb04e <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd8e>
  8caffc:	49 89 c7             	mov    %rax,%r15
  8cafff:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  8cb006:	00 
  8cb007:	0f 10 8c 24 c0 00 00 	movups 0xc0(%rsp),%xmm1
  8cb00e:	00 
  8cb00f:	0f 10 94 24 d0 00 00 	movups 0xd0(%rsp),%xmm2
  8cb016:	00 
  8cb017:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  8cb01e:	00 
  8cb01f:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  8cb026:	00 
  8cb027:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  8cb02e:	00 
  8cb02f:	e9 4b 01 00 00       	jmp    8cb17f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  8cb034:	49 89 c7             	mov    %rax,%r15
  8cb037:	eb 2d                	jmp    8cb066 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xda6>
  8cb039:	49 89 c7             	mov    %rax,%r15
  8cb03c:	eb 35                	jmp    8cb073 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xdb3>
  8cb03e:	49 89 c7             	mov    %rax,%r15
  8cb041:	e9 46 01 00 00       	jmp    8cb18c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  8cb046:	49 89 c7             	mov    %rax,%r15
  8cb049:	e9 27 01 00 00       	jmp    8cb175 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xeb5>
  8cb04e:	49 89 c7             	mov    %rax,%r15
  8cb051:	e9 29 01 00 00       	jmp    8cb17f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  8cb056:	49 89 c7             	mov    %rax,%r15
  8cb059:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  8cb060:	00 
  8cb061:	e8 da ef fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb066:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8cb06d:	00 
  8cb06e:	e8 cd ef fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb073:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8cb078:	e8 c3 ef fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb07d:	e9 0a 01 00 00       	jmp    8cb18c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  8cb082:	49 89 c7             	mov    %rax,%r15
  8cb085:	49 8b 45 20          	mov    0x20(%r13),%rax
  8cb089:	48 85 c0             	test   %rax,%rax
  8cb08c:	0f 84 8d 00 00 00    	je     8cb11f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  8cb092:	f0 48 ff 08          	lock decq (%rax)
  8cb096:	0f 85 83 00 00 00    	jne    8cb11f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  8cb09c:	49 83 c5 20          	add    $0x20,%r13
  8cb0a0:	4c 89 ef             	mov    %r13,%rdi
  8cb0a3:	ff 15 97 48 42 00    	call   *0x424897(%rip)        # cef940 <_DYNAMIC+0x248>
  8cb0a9:	eb 74                	jmp    8cb11f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe5f>
  8cb0ab:	ff 15 97 48 42 00    	call   *0x424897(%rip)        # cef948 <_DYNAMIC+0x250>
  8cb0b1:	49 89 c7             	mov    %rax,%r15
  8cb0b4:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8cb0b9:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8cb0be:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8cb0c3:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  8cb0ca:	00 
  8cb0cb:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  8cb0d2:	00 
  8cb0d3:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  8cb0da:	00 
  8cb0db:	e9 82 00 00 00       	jmp    8cb162 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea2>
  8cb0e0:	49 89 c7             	mov    %rax,%r15
  8cb0e3:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  8cb0e8:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  8cb0ed:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  8cb0f2:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
  8cb0f7:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
  8cb0fc:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  8cb101:	eb 5f                	jmp    8cb162 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xea2>
  8cb103:	49 89 c7             	mov    %rax,%r15
  8cb106:	4c 89 ef             	mov    %r13,%rdi
  8cb109:	e8 f2 ef fe ff       	call   8ba100 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic5ClassECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb10e:	eb 03                	jmp    8cb113 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe53>
  8cb110:	49 89 c7             	mov    %rax,%r15
  8cb113:	49 83 c5 18          	add    $0x18,%r13
  8cb117:	4c 89 ef             	mov    %r13,%rdi
  8cb11a:	e8 f1 ca fe ff       	call   8b7c10 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtNtCs5gUtMYV5hV5_9hyperreal10computable4node10ComputableEECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb11f:	83 fb 04             	cmp    $0x4,%ebx
  8cb122:	74 68                	je     8cb18c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  8cb124:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  8cb128:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  8cb12c:	c1 e0 04             	shl    $0x4,%eax
  8cb12f:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  8cb133:	49 81 c6 f0 00 00 00 	add    $0xf0,%r14
  8cb13a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  8cb140:	4c 89 f7             	mov    %r14,%rdi
  8cb143:	e8 f8 ee fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb148:	49 83 c6 30          	add    $0x30,%r14
  8cb14c:	48 ff c3             	inc    %rbx
  8cb14f:	75 ef                	jne    8cb140 <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe80>
  8cb151:	eb 39                	jmp    8cb18c <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xecc>
  8cb153:	ff 15 ef 47 42 00    	call   *0x4247ef(%rip)        # cef948 <_DYNAMIC+0x250>
  8cb159:	ff 15 e9 47 42 00    	call   *0x4247e9(%rip)        # cef948 <_DYNAMIC+0x250>
  8cb15f:	49 89 c7             	mov    %rax,%r15
  8cb162:	31 db                	xor    %ebx,%ebx
  8cb164:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  8cb16b:	00 
  8cb16c:	e8 cf ee fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb171:	84 db                	test   %bl,%bl
  8cb173:	75 0a                	jne    8cb17f <_RNvNtCs1Ga5OsmdBWa_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xebf>
  8cb175:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  8cb17a:	e8 c1 ee fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb17f:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  8cb186:	00 
  8cb187:	e8 44 c8 fe ff       	call   8b79d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueANtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4Realj4_ECs1Ga5OsmdBWa_10hypersolve>
  8cb18c:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  8cb193:	00 
  8cb194:	e8 a7 ee fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb199:	48 8d bc 24 e0 01 00 	lea    0x1e0(%rsp),%rdi
  8cb1a0:	00 
  8cb1a1:	e8 9a ee fe ff       	call   8ba040 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECs1Ga5OsmdBWa_10hypersolve.llvm.1920840814064448650>
  8cb1a6:	4c 89 ff             	mov    %r15,%rdi
  8cb1a9:	e8 b2 66 3d 00       	call   ca1860 <_Unwind_Resume@plt>
  8cb1ae:	ff 15 94 47 42 00    	call   *0x424794(%rip)        # cef948 <_DYNAMIC+0x250>
