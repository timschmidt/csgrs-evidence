
/tmp/interval-refactor/horner-current/artifacts-baseline/certification:     file format elf64-x86-64


Disassembly of section .text:

00000000007e4120 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776>:
  7e4120:	55                   	push   %rbp
  7e4121:	41 57                	push   %r15
  7e4123:	41 56                	push   %r14
  7e4125:	41 55                	push   %r13
  7e4127:	41 54                	push   %r12
  7e4129:	53                   	push   %rbx
  7e412a:	48 81 ec f8 02 00 00 	sub    $0x2f8,%rsp
  7e4131:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  7e4136:	48 85 c9             	test   %rcx,%rcx
  7e4139:	0f 84 43 02 00 00    	je     7e4382 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x262>
  7e413f:	44 89 c3             	mov    %r8d,%ebx
  7e4142:	48 89 cd             	mov    %rcx,%rbp
  7e4145:	49 89 d5             	mov    %rdx,%r13
  7e4148:	48 83 f9 01          	cmp    $0x1,%rcx
  7e414c:	0f 84 bb 00 00 00    	je     7e420d <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xed>
  7e4152:	48 89 b4 24 a8 01 00 	mov    %rsi,0x1a8(%rsp)
  7e4159:	00 
  7e415a:	48 8d 04 6d 00 00 00 	lea    0x0(,%rbp,2),%rax
  7e4161:	00 
  7e4162:	48 01 e8             	add    %rbp,%rax
  7e4165:	48 c1 e0 04          	shl    $0x4,%rax
  7e4169:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
  7e416e:	4e 8d 3c 28          	lea    (%rax,%r13,1),%r15
  7e4172:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  7e4176:	4c 8d 6c 24 10       	lea    0x10(%rsp),%r13
  7e417b:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  7e417f:	0f b6 c3             	movzbl %bl,%eax
  7e4182:	89 44 24 7c          	mov    %eax,0x7c(%rsp)
  7e4186:	48 89 eb             	mov    %rbp,%rbx
  7e4189:	eb 20                	jmp    7e41ab <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x8b>
  7e418b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  7e4190:	49 8b 47 10          	mov    0x10(%r15),%rax
  7e4194:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  7e4198:	75 56                	jne    7e41f0 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xd0>
  7e419a:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  7e419e:	4c 89 f3             	mov    %r14,%rbx
  7e41a1:	49 83 fe 01          	cmp    $0x1,%r14
  7e41a5:	0f 86 f2 02 00 00    	jbe    7e449d <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x37d>
  7e41ab:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
  7e41af:	49 39 ee             	cmp    %rbp,%r14
  7e41b2:	0f 83 e2 0f 00 00    	jae    7e519a <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x107a>
  7e41b8:	41 80 3f 00          	cmpb   $0x0,(%r15)
  7e41bc:	74 d2                	je     7e4190 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x70>
  7e41be:	4c 89 ef             	mov    %r13,%rdi
  7e41c1:	ff 15 e9 95 50 00    	call   *0x5095e9(%rip)        # ced7b0 <_DYNAMIC+0x368>
  7e41c7:	4c 89 ff             	mov    %r15,%rdi
  7e41ca:	4c 89 ee             	mov    %r13,%rsi
  7e41cd:	8b 54 24 7c          	mov    0x7c(%rsp),%edx
  7e41d1:	e8 fa 4b 00 00       	call   7e8dd0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.2904400372509067776>
  7e41d6:	41 89 c4             	mov    %eax,%r12d
  7e41d9:	41 80 fc fe          	cmp    $0xfe,%r12b
  7e41dd:	0f 84 f4 08 00 00    	je     7e4ad7 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x9b7>
  7e41e3:	4c 89 ef             	mov    %r13,%rdi
  7e41e6:	e8 a5 ab fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e41eb:	45 84 e4             	test   %r12b,%r12b
  7e41ee:	74 aa                	je     7e419a <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x7a>
  7e41f0:	48 39 eb             	cmp    %rbp,%rbx
  7e41f3:	48 8b b4 24 a8 01 00 	mov    0x1a8(%rsp),%rsi
  7e41fa:	00 
  7e41fb:	0f 87 84 0f 00 00    	ja     7e5185 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1065>
  7e4201:	48 89 dd             	mov    %rbx,%rbp
  7e4204:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
  7e4208:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
  7e420d:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  7e4214:	0f 84 a6 02 00 00    	je     7e44c0 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x3a0>
  7e421a:	48 81 c6 98 00 00 00 	add    $0x98,%rsi
  7e4221:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e4228:	00 
  7e4229:	48 89 f0             	mov    %rsi,%rax
  7e422c:	4c 89 ee             	mov    %r13,%rsi
  7e422f:	48 89 ea             	mov    %rbp,%rdx
  7e4232:	48 89 c1             	mov    %rax,%rcx
  7e4235:	e8 c6 44 ff ff       	call   7d8700 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic19evaluate_polynomial>
  7e423a:	0f b6 ac 24 e0 00 00 	movzbl 0xe0(%rsp),%ebp
  7e4241:	00 
  7e4242:	40 84 ed             	test   %bpl,%bpl
  7e4245:	0f 84 f4 01 00 00    	je     7e443f <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x31f>
  7e424b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4250:	ff 15 5a 95 50 00    	call   *0x50955a(%rip)        # ced7b0 <_DYNAMIC+0x368>
  7e4256:	0f b6 d3             	movzbl %bl,%edx
  7e4259:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e4260:	00 
  7e4261:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  7e4266:	e8 65 4b 00 00       	call   7e8dd0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.2904400372509067776>
  7e426b:	89 c3                	mov    %eax,%ebx
  7e426d:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4272:	e8 19 ab fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4277:	80 fb fe             	cmp    $0xfe,%bl
  7e427a:	0f 85 d4 01 00 00    	jne    7e4454 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x334>
  7e4280:	0f 10 84 24 e0 00 00 	movups 0xe0(%rsp),%xmm0
  7e4287:	00 
  7e4288:	0f 10 8c 24 f0 00 00 	movups 0xf0(%rsp),%xmm1
  7e428f:	00 
  7e4290:	0f 10 94 24 00 01 00 	movups 0x100(%rsp),%xmm2
  7e4297:	00 
  7e4298:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  7e429f:	00 
  7e42a0:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  7e42a7:	00 
  7e42a8:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  7e42af:	00 
  7e42b0:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  7e42b5:	ff 15 25 94 50 00    	call   *0x509425(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e42bb:	bf 28 00 00 00       	mov    $0x28,%edi
  7e42c0:	be 01 00 00 00       	mov    $0x1,%esi
  7e42c5:	ff 15 1d 94 50 00    	call   *0x50941d(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e42cb:	48 85 c0             	test   %rax,%rax
  7e42ce:	0f 84 00 0f 00 00    	je     7e51d4 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x10b4>
  7e42d4:	0f 10 05 68 c3 97 ff 	movups -0x683c98(%rip),%xmm0        # 160643 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x422>
  7e42db:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e42df:	0f 10 05 4d c3 97 ff 	movups -0x683cb3(%rip),%xmm0        # 160633 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x412>
  7e42e6:	0f 11 00             	movups %xmm0,(%rax)
  7e42e9:	48 b9 6c 75 65 20 73 	movabs $0x6e6769732065756c,%rcx
  7e42f0:	69 67 6e 
  7e42f3:	48 89 48 20          	mov    %rcx,0x20(%rax)
  7e42f7:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  7e42fc:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  7e4303:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
  7e430a:	00 
  7e430b:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
  7e4312:	00 
  7e4313:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
  7e431a:	00 
  7e431b:	0f 11 41 18          	movups %xmm0,0x18(%rcx)
  7e431f:	0f 11 49 28          	movups %xmm1,0x28(%rcx)
  7e4323:	0f 11 51 38          	movups %xmm2,0x38(%rcx)
  7e4327:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  7e432c:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  7e4333:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  7e4338:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  7e433f:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e4344:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e4349:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e434e:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  7e4353:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  7e4357:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  7e435b:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  7e435f:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  7e4363:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  7e436a:	48 c7 01 28 00 00 00 	movq   $0x28,(%rcx)
  7e4371:	48 89 41 08          	mov    %rax,0x8(%rcx)
  7e4375:	48 c7 41 10 28 00 00 	movq   $0x28,0x10(%rcx)
  7e437c:	00 
  7e437d:	e9 46 0a 00 00       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e4382:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  7e4387:	ff 15 53 93 50 00    	call   *0x509353(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e438d:	bf 37 00 00 00       	mov    $0x37,%edi
  7e4392:	be 01 00 00 00       	mov    $0x1,%esi
  7e4397:	ff 15 4b 93 50 00    	call   *0x50934b(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e439d:	48 85 c0             	test   %rax,%rax
  7e43a0:	0f 84 0a 0e 00 00    	je     7e51b0 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1090>
  7e43a6:	0f 10 05 06 c3 97 ff 	movups -0x683cfa(%rip),%xmm0        # 1606b3 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x492>
  7e43ad:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  7e43b1:	0f 10 05 eb c2 97 ff 	movups -0x683d15(%rip),%xmm0        # 1606a3 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x482>
  7e43b8:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e43bc:	0f 10 05 d0 c2 97 ff 	movups -0x683d30(%rip),%xmm0        # 160693 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x472>
  7e43c3:	0f 11 00             	movups %xmm0,(%rax)
  7e43c6:	48 b9 66 66 69 63 69 	movabs $0x746e656963696666,%rcx
  7e43cd:	65 6e 74 
  7e43d0:	48 89 48 2f          	mov    %rcx,0x2f(%rax)
  7e43d4:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  7e43d9:	c6 81 a9 00 00 00 06 	movb   $0x6,0xa9(%rcx)
  7e43e0:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  7e43e4:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e43e9:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e43ee:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e43f3:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  7e43f8:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  7e43fc:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  7e4400:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  7e4404:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  7e4408:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  7e440d:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  7e4414:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  7e4419:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  7e4420:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  7e4427:	48 c7 01 37 00 00 00 	movq   $0x37,(%rcx)
  7e442e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  7e4432:	48 c7 41 10 37 00 00 	movq   $0x37,0x10(%rcx)
  7e4439:	00 
  7e443a:	e9 89 09 00 00       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e443f:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  7e4446:	00 
  7e4447:	31 db                	xor    %ebx,%ebx
  7e4449:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  7e444d:	0f 95 c0             	setne  %al
  7e4450:	19 db                	sbb    %ebx,%ebx
  7e4452:	08 c3                	or     %al,%bl
  7e4454:	40 84 ed             	test   %bpl,%bpl
  7e4457:	0f 10 84 24 e0 00 00 	movups 0xe0(%rsp),%xmm0
  7e445e:	00 
  7e445f:	0f 10 8c 24 f0 00 00 	movups 0xf0(%rsp),%xmm1
  7e4466:	00 
  7e4467:	0f 10 94 24 00 01 00 	movups 0x100(%rsp),%xmm2
  7e446e:	00 
  7e446f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  7e4474:	0f 11 50 38          	movups %xmm2,0x38(%rax)
  7e4478:	0f 11 48 28          	movups %xmm1,0x28(%rax)
  7e447c:	0f 11 40 18          	movups %xmm0,0x18(%rax)
  7e4480:	0f 95 80 a9 00 00 00 	setne  0xa9(%rax)
  7e4487:	c6 40 48 ff          	movb   $0xff,0x48(%rax)
  7e448b:	88 98 a8 00 00 00    	mov    %bl,0xa8(%rax)
  7e4491:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
  7e4498:	e9 2b 09 00 00       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e449d:	bd 01 00 00 00       	mov    $0x1,%ebp
  7e44a2:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
  7e44a6:	4c 8b 6c 24 70       	mov    0x70(%rsp),%r13
  7e44ab:	48 8b b4 24 a8 01 00 	mov    0x1a8(%rsp),%rsi
  7e44b2:	00 
  7e44b3:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  7e44ba:	0f 85 5a fd ff ff    	jne    7e421a <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xfa>
  7e44c0:	49 89 ee             	mov    %rbp,%r14
  7e44c3:	89 5c 24 04          	mov    %ebx,0x4(%rsp)
  7e44c7:	48 89 f3             	mov    %rsi,%rbx
  7e44ca:	48 83 c6 38          	add    $0x38,%rsi
  7e44ce:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e44d5:	00 
  7e44d6:	e8 25 60 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e44db:	48 83 c3 68          	add    $0x68,%rbx
  7e44df:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e44e4:	48 89 de             	mov    %rbx,%rsi
  7e44e7:	e8 14 60 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e44ec:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e44f3:	00 
  7e44f4:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e44fb:	00 
  7e44fc:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e4503:	00 
  7e4504:	0f 29 94 24 20 02 00 	movaps %xmm2,0x220(%rsp)
  7e450b:	00 
  7e450c:	0f 29 8c 24 10 02 00 	movaps %xmm1,0x210(%rsp)
  7e4513:	00 
  7e4514:	0f 29 84 24 00 02 00 	movaps %xmm0,0x200(%rsp)
  7e451b:	00 
  7e451c:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e4521:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e4526:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e452b:	0f 29 84 24 30 02 00 	movaps %xmm0,0x230(%rsp)
  7e4532:	00 
  7e4533:	0f 29 8c 24 40 02 00 	movaps %xmm1,0x240(%rsp)
  7e453a:	00 
  7e453b:	0f 29 94 24 50 02 00 	movaps %xmm2,0x250(%rsp)
  7e4542:	00 
  7e4543:	80 bc 24 00 02 00 00 	cmpb   $0x0,0x200(%rsp)
  7e454a:	00 
  7e454b:	75 3b                	jne    7e4588 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x468>
  7e454d:	80 bc 24 30 02 00 00 	cmpb   $0x0,0x230(%rsp)
  7e4554:	00 
  7e4555:	75 31                	jne    7e4588 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x468>
  7e4557:	48 8d bc 24 10 02 00 	lea    0x210(%rsp),%rdi
  7e455e:	00 
  7e455f:	48 8d b4 24 40 02 00 	lea    0x240(%rsp),%rsi
  7e4566:	00 
  7e4567:	ff 15 53 95 50 00    	call   *0x509553(%rip)        # cedac0 <_DYNAMIC+0x678>
  7e456d:	84 c0                	test   %al,%al
  7e456f:	7f 17                	jg     7e4588 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x468>
  7e4571:	4c 89 f0             	mov    %r14,%rax
  7e4574:	48 c1 e0 04          	shl    $0x4,%rax
  7e4578:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
  7e457c:	43 80 7c 25 d0 00    	cmpb   $0x0,-0x30(%r13,%r12,1)
  7e4582:	0f 84 3b 0a 00 00    	je     7e4fc3 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xea3>
  7e4588:	4c 89 f0             	mov    %r14,%rax
  7e458b:	48 c1 e0 04          	shl    $0x4,%rax
  7e458f:	49 89 c6             	mov    %rax,%r14
  7e4592:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
  7e4596:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
  7e459a:	48 83 c3 d0          	add    $0xffffffffffffffd0,%rbx
  7e459e:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e45a5:	00 
  7e45a6:	48 89 de             	mov    %rbx,%rsi
  7e45a9:	e8 52 5f 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e45ae:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
  7e45b3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e45b8:	48 89 de             	mov    %rbx,%rsi
  7e45bb:	e8 40 5f 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e45c0:	4b 8d 04 76          	lea    (%r14,%r14,2),%rax
  7e45c4:	48 83 c0 d0          	add    $0xffffffffffffffd0,%rax
  7e45c8:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e45cf:	00 
  7e45d0:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e45d7:	00 
  7e45d8:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e45df:	00 
  7e45e0:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  7e45e7:	00 
  7e45e8:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  7e45ef:	00 
  7e45f0:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  7e45f7:	00 
  7e45f8:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e45fd:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e4602:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e4607:	0f 29 84 24 70 01 00 	movaps %xmm0,0x170(%rsp)
  7e460e:	00 
  7e460f:	0f 29 8c 24 80 01 00 	movaps %xmm1,0x180(%rsp)
  7e4616:	00 
  7e4617:	0f 29 94 24 90 01 00 	movaps %xmm2,0x190(%rsp)
  7e461e:	00 
  7e461f:	48 85 c0             	test   %rax,%rax
  7e4622:	0f 84 c3 02 00 00    	je     7e48eb <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x7cb>
  7e4628:	4c 8d 74 24 40       	lea    0x40(%rsp),%r14
  7e462d:	48 83 44 24 70 a0    	addq   $0xffffffffffffffa0,0x70(%rsp)
  7e4633:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
  7e4638:	89 44 24 7c          	mov    %eax,0x7c(%rsp)
  7e463c:	4c 8d 6c 24 10       	lea    0x10(%rsp),%r13
  7e4641:	48 8d 9c 24 b0 01 00 	lea    0x1b0(%rsp),%rbx
  7e4648:	00 
  7e4649:	4c 8d bc 24 68 02 00 	lea    0x268(%rsp),%r15
  7e4650:	00 
  7e4651:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  7e4658:	0f 1f 84 00 00 00 00 
  7e465f:	00 
  7e4660:	4c 89 ef             	mov    %r13,%rdi
  7e4663:	48 8d b4 24 40 01 00 	lea    0x140(%rsp),%rsi
  7e466a:	00 
  7e466b:	48 8d 94 24 00 02 00 	lea    0x200(%rsp),%rdx
  7e4672:	00 
  7e4673:	8b 4c 24 7c          	mov    0x7c(%rsp),%ecx
  7e4677:	e8 a4 35 ff ff       	call   7d7c20 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic12interval_mul>
  7e467c:	80 7c 24 10 ff       	cmpb   $0xff,0x10(%rsp)
  7e4681:	0f 84 17 05 00 00    	je     7e4b9e <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xa7e>
  7e4687:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  7e468c:	4a 8d 2c 20          	lea    (%rax,%r12,1),%rbp
  7e4690:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  7e4695:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
  7e469c:	00 
  7e469d:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  7e46a2:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
  7e46a9:	00 
  7e46aa:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e46af:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e46b4:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e46b9:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  7e46be:	0f 29 9c 24 b0 00 00 	movaps %xmm3,0xb0(%rsp)
  7e46c5:	00 
  7e46c6:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  7e46cd:	00 
  7e46ce:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  7e46d5:	00 
  7e46d6:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  7e46dd:	00 
  7e46de:	48 89 df             	mov    %rbx,%rdi
  7e46e1:	48 89 ee             	mov    %rbp,%rsi
  7e46e4:	e8 17 5e 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e46e9:	4c 89 ff             	mov    %r15,%rdi
  7e46ec:	48 89 ee             	mov    %rbp,%rsi
  7e46ef:	e8 0c 5e 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e46f4:	0f 10 84 24 b0 01 00 	movups 0x1b0(%rsp),%xmm0
  7e46fb:	00 
  7e46fc:	0f 10 8c 24 c0 01 00 	movups 0x1c0(%rsp),%xmm1
  7e4703:	00 
  7e4704:	0f 10 94 24 d0 01 00 	movups 0x1d0(%rsp),%xmm2
  7e470b:	00 
  7e470c:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  7e4711:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  7e4716:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  7e471b:	0f 10 84 24 68 02 00 	movups 0x268(%rsp),%xmm0
  7e4722:	00 
  7e4723:	0f 10 8c 24 78 02 00 	movups 0x278(%rsp),%xmm1
  7e472a:	00 
  7e472b:	0f 10 94 24 88 02 00 	movups 0x288(%rsp),%xmm2
  7e4732:	00 
  7e4733:	41 0f 11 56 20       	movups %xmm2,0x20(%r14)
  7e4738:	41 0f 11 4e 10       	movups %xmm1,0x10(%r14)
  7e473d:	41 0f 11 06          	movups %xmm0,(%r14)
  7e4741:	0f 28 84 24 80 00 00 	movaps 0x80(%rsp),%xmm0
  7e4748:	00 
  7e4749:	0f 28 8c 24 90 00 00 	movaps 0x90(%rsp),%xmm1
  7e4750:	00 
  7e4751:	0f 28 94 24 a0 00 00 	movaps 0xa0(%rsp),%xmm2
  7e4758:	00 
  7e4759:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  7e4760:	00 
  7e4761:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  7e4768:	00 
  7e4769:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  7e4770:	00 
  7e4771:	4c 89 ff             	mov    %r15,%rdi
  7e4774:	4c 89 ee             	mov    %r13,%rsi
  7e4777:	e8 84 5d 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e477c:	48 8d bc 24 98 02 00 	lea    0x298(%rsp),%rdi
  7e4783:	00 
  7e4784:	48 89 de             	mov    %rbx,%rsi
  7e4787:	4c 89 fa             	mov    %r15,%rdx
  7e478a:	e8 11 42 0d 00       	call   8b89a0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCsaEGsyZiti5M_10hypersolve>
  7e478f:	4c 89 ff             	mov    %r15,%rdi
  7e4792:	e8 29 30 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e4797:	48 89 df             	mov    %rbx,%rdi
  7e479a:	e8 21 30 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e479f:	48 8d 84 24 b0 00 00 	lea    0xb0(%rsp),%rax
  7e47a6:	00 
  7e47a7:	0f 10 00             	movups (%rax),%xmm0
  7e47aa:	0f 10 48 10          	movups 0x10(%rax),%xmm1
  7e47ae:	0f 10 50 20          	movups 0x20(%rax),%xmm2
  7e47b2:	0f 29 94 24 d0 01 00 	movaps %xmm2,0x1d0(%rsp)
  7e47b9:	00 
  7e47ba:	0f 29 8c 24 c0 01 00 	movaps %xmm1,0x1c0(%rsp)
  7e47c1:	00 
  7e47c2:	0f 29 84 24 b0 01 00 	movaps %xmm0,0x1b0(%rsp)
  7e47c9:	00 
  7e47ca:	4c 89 ff             	mov    %r15,%rdi
  7e47cd:	4c 89 f6             	mov    %r14,%rsi
  7e47d0:	e8 2b 5d 00 00       	call   7ea500 <_RNvXsn_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone>
  7e47d5:	48 8d bc 24 c8 02 00 	lea    0x2c8(%rsp),%rdi
  7e47dc:	00 
  7e47dd:	48 89 de             	mov    %rbx,%rsi
  7e47e0:	4c 89 fa             	mov    %r15,%rdx
  7e47e3:	e8 b8 41 0d 00       	call   8b89a0 <_RNvXs1W_NtNtCs5gUtMYV5hV5_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCsaEGsyZiti5M_10hypersolve>
  7e47e8:	4c 89 ff             	mov    %r15,%rdi
  7e47eb:	e8 d0 2f 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e47f0:	48 89 df             	mov    %rbx,%rdi
  7e47f3:	e8 c8 2f 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e47f8:	0f 10 84 24 98 02 00 	movups 0x298(%rsp),%xmm0
  7e47ff:	00 
  7e4800:	0f 10 8c 24 a8 02 00 	movups 0x2a8(%rsp),%xmm1
  7e4807:	00 
  7e4808:	0f 10 94 24 b8 02 00 	movups 0x2b8(%rsp),%xmm2
  7e480f:	00 
  7e4810:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  7e4817:	00 
  7e4818:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  7e481f:	00 
  7e4820:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  7e4827:	00 
  7e4828:	0f 10 84 24 c8 02 00 	movups 0x2c8(%rsp),%xmm0
  7e482f:	00 
  7e4830:	0f 10 8c 24 d8 02 00 	movups 0x2d8(%rsp),%xmm1
  7e4837:	00 
  7e4838:	0f 10 94 24 e8 02 00 	movups 0x2e8(%rsp),%xmm2
  7e483f:	00 
  7e4840:	48 8d 84 24 10 01 00 	lea    0x110(%rsp),%rax
  7e4847:	00 
  7e4848:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  7e484c:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  7e4850:	0f 11 00             	movups %xmm0,(%rax)
  7e4853:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  7e485a:	00 
  7e485b:	e8 30 a5 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4860:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  7e4867:	00 
  7e4868:	e8 23 a5 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e486d:	0f 28 84 24 30 01 00 	movaps 0x130(%rsp),%xmm0
  7e4874:	00 
  7e4875:	0f 29 84 24 90 01 00 	movaps %xmm0,0x190(%rsp)
  7e487c:	00 
  7e487d:	0f 28 84 24 20 01 00 	movaps 0x120(%rsp),%xmm0
  7e4884:	00 
  7e4885:	0f 29 84 24 80 01 00 	movaps %xmm0,0x180(%rsp)
  7e488c:	00 
  7e488d:	0f 28 84 24 e0 00 00 	movaps 0xe0(%rsp),%xmm0
  7e4894:	00 
  7e4895:	0f 28 8c 24 f0 00 00 	movaps 0xf0(%rsp),%xmm1
  7e489c:	00 
  7e489d:	0f 28 94 24 00 01 00 	movaps 0x100(%rsp),%xmm2
  7e48a4:	00 
  7e48a5:	0f 28 9c 24 10 01 00 	movaps 0x110(%rsp),%xmm3
  7e48ac:	00 
  7e48ad:	0f 29 9c 24 70 01 00 	movaps %xmm3,0x170(%rsp)
  7e48b4:	00 
  7e48b5:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  7e48bc:	00 
  7e48bd:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  7e48c4:	00 
  7e48c5:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  7e48cc:	00 
  7e48cd:	4c 89 ef             	mov    %r13,%rdi
  7e48d0:	e8 bb a4 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e48d5:	4c 89 f7             	mov    %r14,%rdi
  7e48d8:	e8 b3 a4 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e48dd:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
  7e48e1:	49 83 fc 30          	cmp    $0x30,%r12
  7e48e5:	0f 85 75 fd ff ff    	jne    7e4660 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x540>
  7e48eb:	0f b6 8c 24 40 01 00 	movzbl 0x140(%rsp),%ecx
  7e48f2:	00 
  7e48f3:	48 8b 84 24 41 01 00 	mov    0x141(%rsp),%rax
  7e48fa:	00 
  7e48fb:	48 89 84 24 f0 01 00 	mov    %rax,0x1f0(%rsp)
  7e4902:	00 
  7e4903:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
  7e490a:	00 
  7e490b:	48 89 84 24 f7 01 00 	mov    %rax,0x1f7(%rsp)
  7e4912:	00 
  7e4913:	48 8b 84 24 50 01 00 	mov    0x150(%rsp),%rax
  7e491a:	00 
  7e491b:	48 8b 94 24 58 01 00 	mov    0x158(%rsp),%rdx
  7e4922:	00 
  7e4923:	0f 28 84 24 60 01 00 	movaps 0x160(%rsp),%xmm0
  7e492a:	00 
  7e492b:	0f b6 b4 24 70 01 00 	movzbl 0x170(%rsp),%esi
  7e4932:	00 
  7e4933:	48 8b bc 24 71 01 00 	mov    0x171(%rsp),%rdi
  7e493a:	00 
  7e493b:	48 89 bc 24 e0 01 00 	mov    %rdi,0x1e0(%rsp)
  7e4942:	00 
  7e4943:	48 8b bc 24 78 01 00 	mov    0x178(%rsp),%rdi
  7e494a:	00 
  7e494b:	48 89 bc 24 e7 01 00 	mov    %rdi,0x1e7(%rsp)
  7e4952:	00 
  7e4953:	80 f9 ff             	cmp    $0xff,%cl
  7e4956:	0f 84 5c 02 00 00    	je     7e4bb8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xa98>
  7e495c:	4c 8b bc 24 80 01 00 	mov    0x180(%rsp),%r15
  7e4963:	00 
  7e4964:	48 8b bc 24 88 01 00 	mov    0x188(%rsp),%rdi
  7e496b:	00 
  7e496c:	0f 28 8c 24 90 01 00 	movaps 0x190(%rsp),%xmm1
  7e4973:	00 
  7e4974:	8b 5c 24 04          	mov    0x4(%rsp),%ebx
  7e4978:	88 8c 24 80 00 00 00 	mov    %cl,0x80(%rsp)
  7e497f:	48 8b 8c 24 f0 01 00 	mov    0x1f0(%rsp),%rcx
  7e4986:	00 
  7e4987:	4c 8b 84 24 f7 01 00 	mov    0x1f7(%rsp),%r8
  7e498e:	00 
  7e498f:	48 89 8c 24 81 00 00 	mov    %rcx,0x81(%rsp)
  7e4996:	00 
  7e4997:	4c 89 84 24 88 00 00 	mov    %r8,0x88(%rsp)
  7e499e:	00 
  7e499f:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
  7e49a6:	00 
  7e49a7:	48 89 94 24 98 00 00 	mov    %rdx,0x98(%rsp)
  7e49ae:	00 
  7e49af:	0f 11 84 24 a0 00 00 	movups %xmm0,0xa0(%rsp)
  7e49b6:	00 
  7e49b7:	40 88 b4 24 b0 00 00 	mov    %sil,0xb0(%rsp)
  7e49be:	00 
  7e49bf:	48 8b 84 24 e0 01 00 	mov    0x1e0(%rsp),%rax
  7e49c6:	00 
  7e49c7:	48 8b 8c 24 e7 01 00 	mov    0x1e7(%rsp),%rcx
  7e49ce:	00 
  7e49cf:	48 89 84 24 b1 00 00 	mov    %rax,0xb1(%rsp)
  7e49d6:	00 
  7e49d7:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
  7e49de:	00 
  7e49df:	4c 89 bc 24 c0 00 00 	mov    %r15,0xc0(%rsp)
  7e49e6:	00 
  7e49e7:	48 89 bc 24 c8 00 00 	mov    %rdi,0xc8(%rsp)
  7e49ee:	00 
  7e49ef:	0f 11 8c 24 d0 00 00 	movups %xmm1,0xd0(%rsp)
  7e49f6:	00 
  7e49f7:	48 8d bc 24 00 02 00 	lea    0x200(%rsp),%rdi
  7e49fe:	00 
  7e49ff:	e8 8c a3 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4a04:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
  7e4a0b:	00 
  7e4a0c:	e8 7f a3 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4a11:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4a16:	ff 15 94 8d 50 00    	call   *0x508d94(%rip)        # ced7b0 <_DYNAMIC+0x368>
  7e4a1c:	0f b6 eb             	movzbl %bl,%ebp
  7e4a1f:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e4a26:	00 
  7e4a27:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  7e4a2c:	89 ea                	mov    %ebp,%edx
  7e4a2e:	e8 9d 43 00 00       	call   7e8dd0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.2904400372509067776>
  7e4a33:	89 c3                	mov    %eax,%ebx
  7e4a35:	80 fb fe             	cmp    $0xfe,%bl
  7e4a38:	0f 85 51 02 00 00    	jne    7e4c8f <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xb6f>
  7e4a3e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4a43:	e8 48 a3 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4a48:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  7e4a4f:	00 
  7e4a50:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  7e4a55:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  7e4a5c:	00 
  7e4a5d:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  7e4a62:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e4a69:	00 
  7e4a6a:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e4a71:	00 
  7e4a72:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e4a79:	00 
  7e4a7a:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  7e4a81:	00 
  7e4a82:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  7e4a87:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  7e4a8c:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  7e4a91:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  7e4a96:	ff 15 44 8c 50 00    	call   *0x508c44(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e4a9c:	bf 33 00 00 00       	mov    $0x33,%edi
  7e4aa1:	be 01 00 00 00       	mov    $0x1,%esi
  7e4aa6:	ff 15 3c 8c 50 00    	call   *0x508c3c(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e4aac:	48 85 c0             	test   %rax,%rax
  7e4aaf:	0f 84 43 07 00 00    	je     7e51f8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x10d8>
  7e4ab5:	0f 10 05 2f bb 97 ff 	movups -0x6844d1(%rip),%xmm0        # 1605eb <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x3ca>
  7e4abc:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  7e4ac0:	0f 10 05 14 bb 97 ff 	movups -0x6844ec(%rip),%xmm0        # 1605db <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x3ba>
  7e4ac7:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e4acb:	0f 10 05 f9 ba 97 ff 	movups -0x684507(%rip),%xmm0        # 1605cb <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x3aa>
  7e4ad2:	e9 81 02 00 00       	jmp    7e4d58 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xc38>
  7e4ad7:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4adc:	e8 af a2 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4ae1:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  7e4ae6:	ff 15 f4 8b 50 00    	call   *0x508bf4(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e4aec:	bf 38 00 00 00       	mov    $0x38,%edi
  7e4af1:	be 01 00 00 00       	mov    $0x1,%esi
  7e4af6:	ff 15 ec 8b 50 00    	call   *0x508bec(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e4afc:	48 85 c0             	test   %rax,%rax
  7e4aff:	0f 84 e1 06 00 00    	je     7e51e6 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x10c6>
  7e4b05:	0f 10 05 6f bb 97 ff 	movups -0x684491(%rip),%xmm0        # 16067b <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x45a>
  7e4b0c:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  7e4b10:	0f 10 05 54 bb 97 ff 	movups -0x6844ac(%rip),%xmm0        # 16066b <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x44a>
  7e4b17:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e4b1b:	0f 10 05 39 bb 97 ff 	movups -0x6844c7(%rip),%xmm0        # 16065b <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x43a>
  7e4b22:	0f 11 00             	movups %xmm0,(%rax)
  7e4b25:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  7e4b2c:	74 6c 79 
  7e4b2f:	48 89 48 30          	mov    %rcx,0x30(%rax)
  7e4b33:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  7e4b38:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  7e4b3f:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  7e4b43:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e4b48:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e4b4d:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e4b52:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  7e4b57:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  7e4b5b:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  7e4b5f:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  7e4b63:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  7e4b67:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  7e4b6c:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  7e4b73:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  7e4b78:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  7e4b7f:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  7e4b86:	48 c7 01 38 00 00 00 	movq   $0x38,(%rcx)
  7e4b8d:	48 89 41 08          	mov    %rax,0x8(%rcx)
  7e4b91:	48 c7 41 10 38 00 00 	movq   $0x38,0x10(%rcx)
  7e4b98:	00 
  7e4b99:	e9 2a 02 00 00       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e4b9e:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  7e4ba5:	00 
  7e4ba6:	e8 e5 a1 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4bab:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  7e4bb2:	00 
  7e4bb3:	e8 d8 a1 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4bb8:	48 8d bc 24 00 02 00 	lea    0x200(%rsp),%rdi
  7e4bbf:	00 
  7e4bc0:	e8 cb a1 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4bc5:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
  7e4bcc:	00 
  7e4bcd:	e8 be a1 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4bd2:	c6 44 24 10 ff       	movb   $0xff,0x10(%rsp)
  7e4bd7:	ff 15 03 8b 50 00    	call   *0x508b03(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e4bdd:	bf 35 00 00 00       	mov    $0x35,%edi
  7e4be2:	be 01 00 00 00       	mov    $0x1,%esi
  7e4be7:	ff 15 fb 8a 50 00    	call   *0x508afb(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e4bed:	48 85 c0             	test   %rax,%rax
  7e4bf0:	0f 84 cc 05 00 00    	je     7e51c2 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x10a2>
  7e4bf6:	0f 10 05 21 ba 97 ff 	movups -0x6845df(%rip),%xmm0        # 16061e <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x3fd>
  7e4bfd:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  7e4c01:	0f 10 05 06 ba 97 ff 	movups -0x6845fa(%rip),%xmm0        # 16060e <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x3ed>
  7e4c08:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e4c0c:	0f 10 05 eb b9 97 ff 	movups -0x684615(%rip),%xmm0        # 1605fe <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x3dd>
  7e4c13:	0f 11 00             	movups %xmm0,(%rax)
  7e4c16:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  7e4c1d:	74 6c 79 
  7e4c20:	48 89 48 2d          	mov    %rcx,0x2d(%rax)
  7e4c24:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  7e4c29:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  7e4c30:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  7e4c34:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  7e4c39:	0f 10 4c 24 20       	movups 0x20(%rsp),%xmm1
  7e4c3e:	0f 10 54 24 30       	movups 0x30(%rsp),%xmm2
  7e4c43:	0f 10 5c 24 40       	movups 0x40(%rsp),%xmm3
  7e4c48:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  7e4c4c:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  7e4c50:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  7e4c54:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  7e4c58:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  7e4c5d:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  7e4c64:	0f 10 44 24 60       	movups 0x60(%rsp),%xmm0
  7e4c69:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  7e4c70:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  7e4c77:	48 c7 01 35 00 00 00 	movq   $0x35,(%rcx)
  7e4c7e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  7e4c82:	48 c7 41 10 35 00 00 	movq   $0x35,0x10(%rcx)
  7e4c89:	00 
  7e4c8a:	e9 39 01 00 00       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e4c8f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4c94:	e8 f7 a0 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4c99:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4c9e:	ff 15 0c 8b 50 00    	call   *0x508b0c(%rip)        # ced7b0 <_DYNAMIC+0x368>
  7e4ca4:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  7e4cab:	00 
  7e4cac:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  7e4cb1:	89 ea                	mov    %ebp,%edx
  7e4cb3:	e8 18 41 00 00       	call   7e8dd0 <_RNvNtNtCs9SNMu4s066s_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.2904400372509067776>
  7e4cb8:	89 c5                	mov    %eax,%ebp
  7e4cba:	40 80 fd fe          	cmp    $0xfe,%bpl
  7e4cbe:	0f 85 16 01 00 00    	jne    7e4dda <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xcba>
  7e4cc4:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4cc9:	e8 c2 a0 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4cce:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  7e4cd5:	00 
  7e4cd6:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  7e4cdb:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  7e4ce2:	00 
  7e4ce3:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  7e4ce8:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e4cef:	00 
  7e4cf0:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e4cf7:	00 
  7e4cf8:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e4cff:	00 
  7e4d00:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  7e4d07:	00 
  7e4d08:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  7e4d0d:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  7e4d12:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  7e4d17:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  7e4d1c:	ff 15 be 89 50 00    	call   *0x5089be(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e4d22:	bf 33 00 00 00       	mov    $0x33,%edi
  7e4d27:	be 01 00 00 00       	mov    $0x1,%esi
  7e4d2c:	ff 15 b6 89 50 00    	call   *0x5089b6(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e4d32:	48 85 c0             	test   %rax,%rax
  7e4d35:	0f 84 cf 04 00 00    	je     7e520a <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x10ea>
  7e4d3b:	0f 10 05 76 b8 97 ff 	movups -0x68478a(%rip),%xmm0        # 1605b8 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x397>
  7e4d42:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  7e4d46:	0f 10 05 5b b8 97 ff 	movups -0x6847a5(%rip),%xmm0        # 1605a8 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x387>
  7e4d4d:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e4d51:	0f 10 05 40 b8 97 ff 	movups -0x6847c0(%rip),%xmm0        # 160598 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x377>
  7e4d58:	0f 11 00             	movups %xmm0,(%rax)
  7e4d5b:	c7 40 2f 7a 65 72 6f 	movl   $0x6f72657a,0x2f(%rax)
  7e4d62:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  7e4d67:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  7e4d6e:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  7e4d72:	0f 28 44 24 10       	movaps 0x10(%rsp),%xmm0
  7e4d77:	0f 28 4c 24 20       	movaps 0x20(%rsp),%xmm1
  7e4d7c:	0f 28 54 24 30       	movaps 0x30(%rsp),%xmm2
  7e4d81:	0f 28 5c 24 40       	movaps 0x40(%rsp),%xmm3
  7e4d86:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  7e4d8a:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  7e4d8e:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  7e4d92:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  7e4d96:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  7e4d9b:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  7e4da2:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
  7e4da7:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  7e4dae:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  7e4db5:	48 c7 01 33 00 00 00 	movq   $0x33,(%rcx)
  7e4dbc:	48 89 41 08          	mov    %rax,0x8(%rcx)
  7e4dc0:	48 c7 41 10 33 00 00 	movq   $0x33,0x10(%rcx)
  7e4dc7:	00 
  7e4dc8:	48 81 c4 f8 02 00 00 	add    $0x2f8,%rsp
  7e4dcf:	5b                   	pop    %rbx
  7e4dd0:	41 5c                	pop    %r12
  7e4dd2:	41 5d                	pop    %r13
  7e4dd4:	41 5e                	pop    %r14
  7e4dd6:	41 5f                	pop    %r15
  7e4dd8:	5d                   	pop    %rbp
  7e4dd9:	c3                   	ret
  7e4dda:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e4ddf:	e8 ac 9f fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e4de4:	80 fb 01             	cmp    $0x1,%bl
  7e4de7:	75 6c                	jne    7e4e55 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xd35>
  7e4de9:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  7e4df0:	00 
  7e4df1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  7e4df6:	0f 11 80 98 00 00 00 	movups %xmm0,0x98(%rax)
  7e4dfd:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  7e4e04:	00 
  7e4e05:	0f 11 80 88 00 00 00 	movups %xmm0,0x88(%rax)
  7e4e0c:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e4e13:	00 
  7e4e14:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e4e1b:	00 
  7e4e1c:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e4e23:	00 
  7e4e24:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  7e4e2b:	00 
  7e4e2c:	0f 11 58 78          	movups %xmm3,0x78(%rax)
  7e4e30:	0f 11 50 68          	movups %xmm2,0x68(%rax)
  7e4e34:	0f 11 48 58          	movups %xmm1,0x58(%rax)
  7e4e38:	0f 11 40 48          	movups %xmm0,0x48(%rax)
  7e4e3c:	c6 40 18 ff          	movb   $0xff,0x18(%rax)
  7e4e40:	66 c7 80 a8 00 00 00 	movw   $0x201,0xa8(%rax)
  7e4e47:	01 02 
  7e4e49:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
  7e4e50:	e9 73 ff ff ff       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e4e55:	40 80 fd ff          	cmp    $0xff,%bpl
  7e4e59:	0f 84 f8 00 00 00    	je     7e4f57 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xe37>
  7e4e5f:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  7e4e66:	00 
  7e4e67:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  7e4e6c:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  7e4e73:	00 
  7e4e74:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  7e4e79:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e4e80:	00 
  7e4e81:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e4e88:	00 
  7e4e89:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e4e90:	00 
  7e4e91:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  7e4e98:	00 
  7e4e99:	0f 29 5c 24 40       	movaps %xmm3,0x40(%rsp)
  7e4e9e:	0f 29 54 24 30       	movaps %xmm2,0x30(%rsp)
  7e4ea3:	0f 29 4c 24 20       	movaps %xmm1,0x20(%rsp)
  7e4ea8:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  7e4ead:	ff 15 2d 88 50 00    	call   *0x50882d(%rip)        # ced6e0 <_DYNAMIC+0x298>
  7e4eb3:	bf 2b 00 00 00       	mov    $0x2b,%edi
  7e4eb8:	be 01 00 00 00       	mov    $0x1,%esi
  7e4ebd:	ff 15 25 88 50 00    	call   *0x508825(%rip)        # ced6e8 <_DYNAMIC+0x2a0>
  7e4ec3:	48 85 c0             	test   %rax,%rax
  7e4ec6:	0f 84 50 03 00 00    	je     7e521c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x10fc>
  7e4ecc:	0f 10 05 b5 b6 97 ff 	movups -0x68494b(%rip),%xmm0        # 160588 <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x367>
  7e4ed3:	0f 11 40 1b          	movups %xmm0,0x1b(%rax)
  7e4ed7:	0f 10 05 9f b6 97 ff 	movups -0x684961(%rip),%xmm0        # 16057d <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x35c>
  7e4ede:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  7e4ee2:	0f 10 05 84 b6 97 ff 	movups -0x68497c(%rip),%xmm0        # 16056d <anon.ee211463ec7582cb2e58f8d251aa1d79.158.llvm.2904400372509067776+0x34c>
  7e4ee9:	0f 11 00             	movups %xmm0,(%rax)
  7e4eec:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  7e4ef1:	c6 81 a9 00 00 00 04 	movb   $0x4,0xa9(%rcx)
  7e4ef8:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  7e4efc:	0f 28 44 24 10       	movaps 0x10(%rsp),%xmm0
  7e4f01:	0f 28 4c 24 20       	movaps 0x20(%rsp),%xmm1
  7e4f06:	0f 28 54 24 30       	movaps 0x30(%rsp),%xmm2
  7e4f0b:	0f 28 5c 24 40       	movaps 0x40(%rsp),%xmm3
  7e4f10:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  7e4f14:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  7e4f18:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  7e4f1c:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  7e4f20:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  7e4f25:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  7e4f2c:	0f 28 44 24 60       	movaps 0x60(%rsp),%xmm0
  7e4f31:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  7e4f38:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  7e4f3f:	48 c7 01 2b 00 00 00 	movq   $0x2b,(%rcx)
  7e4f46:	48 89 41 08          	mov    %rax,0x8(%rcx)
  7e4f4a:	48 c7 41 10 2b 00 00 	movq   $0x2b,0x10(%rcx)
  7e4f51:	00 
  7e4f52:	e9 71 fe ff ff       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e4f57:	0f 10 84 24 d0 00 00 	movups 0xd0(%rsp),%xmm0
  7e4f5e:	00 
  7e4f5f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  7e4f64:	0f 11 80 98 00 00 00 	movups %xmm0,0x98(%rax)
  7e4f6b:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  7e4f72:	00 
  7e4f73:	0f 11 80 88 00 00 00 	movups %xmm0,0x88(%rax)
  7e4f7a:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  7e4f81:	00 
  7e4f82:	0f 10 8c 24 90 00 00 	movups 0x90(%rsp),%xmm1
  7e4f89:	00 
  7e4f8a:	0f 10 94 24 a0 00 00 	movups 0xa0(%rsp),%xmm2
  7e4f91:	00 
  7e4f92:	0f 10 9c 24 b0 00 00 	movups 0xb0(%rsp),%xmm3
  7e4f99:	00 
  7e4f9a:	0f 11 58 78          	movups %xmm3,0x78(%rax)
  7e4f9e:	0f 11 50 68          	movups %xmm2,0x68(%rax)
  7e4fa2:	0f 11 48 58          	movups %xmm1,0x58(%rax)
  7e4fa6:	0f 11 40 48          	movups %xmm0,0x48(%rax)
  7e4faa:	c6 40 18 ff          	movb   $0xff,0x18(%rax)
  7e4fae:	66 c7 80 a8 00 00 00 	movw   $0x3ff,0xa8(%rax)
  7e4fb5:	ff 03 
  7e4fb7:	48 c7 00 ff ff ff ff 	movq   $0xffffffffffffffff,(%rax)
  7e4fbe:	e9 05 fe ff ff       	jmp    7e4dc8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xca8>
  7e4fc3:	4b 8b 44 25 e0       	mov    -0x20(%r13,%r12,1),%rax
  7e4fc8:	f0 48 ff 00          	lock incq (%rax)
  7e4fcc:	0f 8e 5a 02 00 00    	jle    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e4fd2:	4b 8b 44 25 e0       	mov    -0x20(%r13,%r12,1),%rax
  7e4fd7:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  7e4fde:	00 
  7e4fdf:	f0 48 ff 00          	lock incq (%rax)
  7e4fe3:	0f 8e 43 02 00 00    	jle    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e4fe9:	4f 8b 7c 25 e0       	mov    -0x20(%r13,%r12,1),%r15
  7e4fee:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
  7e4ff5:	00 
  7e4ff6:	49 83 fe 01          	cmp    $0x1,%r14
  7e4ffa:	75 1f                	jne    7e501b <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xefb>
  7e4ffc:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  7e5003:	00 
  7e5004:	0f 28 05 d5 a0 95 ff 	movaps -0x6a5f2b(%rip),%xmm0        # 13f0e0 <anon.1ddced4fb26376f77bd42a01ac8f11b8.45.llvm.16549145706154455763+0x180>
  7e500b:	31 c9                	xor    %ecx,%ecx
  7e500d:	31 d2                	xor    %edx,%edx
  7e500f:	31 f6                	xor    %esi,%esi
  7e5011:	31 ff                	xor    %edi,%edi
  7e5013:	0f 28 c8             	movaps %xmm0,%xmm1
  7e5016:	e9 59 f9 ff ff       	jmp    7e4974 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x854>
  7e501b:	43 80 7c 25 a0 00    	cmpb   $0x0,-0x60(%r13,%r12,1)
  7e5021:	0f 85 25 01 00 00    	jne    7e514c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x102c>
  7e5027:	49 8d 45 b0          	lea    -0x50(%r13),%rax
  7e502b:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  7e5030:	4c 89 eb             	mov    %r13,%rbx
  7e5033:	40 b5 01             	mov    $0x1,%bpl
  7e5036:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e503d:	00 
  7e503e:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
  7e5045:	00 
  7e5046:	48 8d 94 24 10 02 00 	lea    0x210(%rsp),%rdx
  7e504d:	00 
  7e504e:	48 8d 8c 24 40 02 00 	lea    0x240(%rsp),%rcx
  7e5055:	00 
  7e5056:	e8 15 26 ff ff       	call   7d7670 <_RNvNtCsaEGsyZiti5M_10hypersolve8interval25rational_interval_product>
  7e505b:	49 89 c7             	mov    %rax,%r15
  7e505e:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  7e5063:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  7e506a:	00 
  7e506b:	f0 48 ff 08          	lock decq (%rax)
  7e506f:	75 0e                	jne    7e507f <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xf5f>
  7e5071:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e5078:	00 
  7e5079:	ff 15 31 86 50 00    	call   *0x508631(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e507f:	4c 89 bc 24 e0 00 00 	mov    %r15,0xe0(%rsp)
  7e5086:	00 
  7e5087:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  7e508c:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  7e5093:	00 
  7e5094:	f0 48 ff 08          	lock decq (%rax)
  7e5098:	75 0e                	jne    7e50a8 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xf88>
  7e509a:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e50a1:	00 
  7e50a2:	ff 15 08 86 50 00    	call   *0x508608(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e50a8:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  7e50ad:	4e 8d 3c 20          	lea    (%rax,%r12,1),%r15
  7e50b1:	4c 89 ac 24 80 00 00 	mov    %r13,0x80(%rsp)
  7e50b8:	00 
  7e50b9:	48 8b ac 24 e0 00 00 	mov    0xe0(%rsp),%rbp
  7e50c0:	00 
  7e50c1:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
  7e50c6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e50cb:	4c 89 fe             	mov    %r15,%rsi
  7e50ce:	ff 15 74 8f 50 00    	call   *0x508f74(%rip)        # cee048 <_DYNAMIC+0xc00>
  7e50d4:	49 89 c5             	mov    %rax,%r13
  7e50d7:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
  7e50dc:	75 0d                	jne    7e50eb <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xfcb>
  7e50de:	31 ed                	xor    %ebp,%ebp
  7e50e0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e50e5:	ff 15 c5 85 50 00    	call   *0x5085c5(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e50eb:	4c 89 ac 24 e0 00 00 	mov    %r13,0xe0(%rsp)
  7e50f2:	00 
  7e50f3:	4c 8b ac 24 80 00 00 	mov    0x80(%rsp),%r13
  7e50fa:	00 
  7e50fb:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
  7e5100:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5105:	4c 89 fe             	mov    %r15,%rsi
  7e5108:	ff 15 3a 8f 50 00    	call   *0x508f3a(%rip)        # cee048 <_DYNAMIC+0xc00>
  7e510e:	49 89 c7             	mov    %rax,%r15
  7e5111:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  7e5116:	75 0b                	jne    7e5123 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1003>
  7e5118:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e511d:	ff 15 8d 85 50 00    	call   *0x50858d(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e5123:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
  7e512a:	00 
  7e512b:	49 83 fc 60          	cmp    $0x60,%r12
  7e512f:	0f 84 c7 fe ff ff    	je     7e4ffc <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xedc>
  7e5135:	49 89 dd             	mov    %rbx,%r13
  7e5138:	42 80 bc 23 70 ff ff 	cmpb   $0x0,-0x90(%rbx,%r12,1)
  7e513f:	ff 00 
  7e5141:	4d 8d 64 24 d0       	lea    -0x30(%r12),%r12
  7e5146:	0f 84 e4 fe ff ff    	je     7e5030 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0xf10>
  7e514c:	f0 49 ff 0f          	lock decq (%r15)
  7e5150:	75 0e                	jne    7e5160 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1040>
  7e5152:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e5159:	00 
  7e515a:	ff 15 50 85 50 00    	call   *0x508550(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e5160:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  7e5167:	00 
  7e5168:	f0 48 ff 08          	lock decq (%rax)
  7e516c:	0f 85 16 f4 ff ff    	jne    7e4588 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x468>
  7e5172:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e5179:	00 
  7e517a:	ff 15 30 85 50 00    	call   *0x508530(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e5180:	e9 03 f4 ff ff       	jmp    7e4588 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x468>
  7e5185:	48 8d 0d fc 5e 4c 00 	lea    0x4c5efc(%rip),%rcx        # cab088 <anon.d1b54e47abafedc417b7ea0be443ea38.65.llvm.7986224628981680295+0x510>
  7e518c:	31 ff                	xor    %edi,%edi
  7e518e:	48 89 de             	mov    %rbx,%rsi
  7e5191:	48 89 ea             	mov    %rbp,%rdx
  7e5194:	ff 15 fe 87 50 00    	call   *0x5087fe(%rip)        # ced998 <_DYNAMIC+0x550>
  7e519a:	48 ff cb             	dec    %rbx
  7e519d:	48 8d 15 cc 5e 4c 00 	lea    0x4c5ecc(%rip),%rdx        # cab070 <anon.d1b54e47abafedc417b7ea0be443ea38.65.llvm.7986224628981680295+0x4f8>
  7e51a4:	48 89 df             	mov    %rbx,%rdi
  7e51a7:	48 89 ee             	mov    %rbp,%rsi
  7e51aa:	ff 15 70 86 50 00    	call   *0x508670(%rip)        # ced820 <_DYNAMIC+0x3d8>
  7e51b0:	bf 01 00 00 00       	mov    $0x1,%edi
  7e51b5:	be 37 00 00 00       	mov    $0x37,%esi
  7e51ba:	ff 15 90 85 50 00    	call   *0x508590(%rip)        # ced750 <_DYNAMIC+0x308>
  7e51c0:	eb 6a                	jmp    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e51c2:	bf 01 00 00 00       	mov    $0x1,%edi
  7e51c7:	be 35 00 00 00       	mov    $0x35,%esi
  7e51cc:	ff 15 7e 85 50 00    	call   *0x50857e(%rip)        # ced750 <_DYNAMIC+0x308>
  7e51d2:	eb 58                	jmp    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e51d4:	bf 01 00 00 00       	mov    $0x1,%edi
  7e51d9:	be 28 00 00 00       	mov    $0x28,%esi
  7e51de:	ff 15 6c 85 50 00    	call   *0x50856c(%rip)        # ced750 <_DYNAMIC+0x308>
  7e51e4:	eb 46                	jmp    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e51e6:	bf 01 00 00 00       	mov    $0x1,%edi
  7e51eb:	be 38 00 00 00       	mov    $0x38,%esi
  7e51f0:	ff 15 5a 85 50 00    	call   *0x50855a(%rip)        # ced750 <_DYNAMIC+0x308>
  7e51f6:	eb 34                	jmp    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e51f8:	bf 01 00 00 00       	mov    $0x1,%edi
  7e51fd:	be 33 00 00 00       	mov    $0x33,%esi
  7e5202:	ff 15 48 85 50 00    	call   *0x508548(%rip)        # ced750 <_DYNAMIC+0x308>
  7e5208:	eb 22                	jmp    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e520a:	bf 01 00 00 00       	mov    $0x1,%edi
  7e520f:	be 33 00 00 00       	mov    $0x33,%esi
  7e5214:	ff 15 36 85 50 00    	call   *0x508536(%rip)        # ced750 <_DYNAMIC+0x308>
  7e521a:	eb 10                	jmp    7e522c <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x110c>
  7e521c:	bf 01 00 00 00       	mov    $0x1,%edi
  7e5221:	be 2b 00 00 00       	mov    $0x2b,%esi
  7e5226:	ff 15 24 85 50 00    	call   *0x508524(%rip)        # ced750 <_DYNAMIC+0x308>
  7e522c:	0f 0b                	ud2
  7e522e:	eb 00                	jmp    7e5230 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1110>
  7e5230:	48 89 c3             	mov    %rax,%rbx
  7e5233:	e9 ac 00 00 00       	jmp    7e52e4 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x11c4>
  7e5238:	48 89 c3             	mov    %rax,%rbx
  7e523b:	4c 89 ac 24 80 00 00 	mov    %r13,0x80(%rsp)
  7e5242:	00 
  7e5243:	40 b5 01             	mov    $0x1,%bpl
  7e5246:	eb 77                	jmp    7e52bf <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x119f>
  7e5248:	48 89 c3             	mov    %rax,%rbx
  7e524b:	4c 89 bc 24 e0 00 00 	mov    %r15,0xe0(%rsp)
  7e5252:	00 
  7e5253:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  7e5258:	f0 48 ff 08          	lock decq (%rax)
  7e525c:	40 b5 01             	mov    $0x1,%bpl
  7e525f:	75 5e                	jne    7e52bf <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x119f>
  7e5261:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5266:	ff 15 44 84 50 00    	call   *0x508444(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e526c:	eb 51                	jmp    7e52bf <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x119f>
  7e526e:	48 89 c3             	mov    %rax,%rbx
  7e5271:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5276:	e8 55 81 fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e527b:	e9 91 03 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5280:	48 89 c3             	mov    %rax,%rbx
  7e5283:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
  7e5288:	75 0b                	jne    7e5295 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1175>
  7e528a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e528f:	ff 15 1b 84 50 00    	call   *0x50841b(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e5295:	31 ed                	xor    %ebp,%ebp
  7e5297:	eb 26                	jmp    7e52bf <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x119f>
  7e5299:	ff 15 f9 83 50 00    	call   *0x5083f9(%rip)        # ced698 <_DYNAMIC+0x250>
  7e529f:	48 89 c3             	mov    %rax,%rbx
  7e52a2:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  7e52a7:	75 3b                	jne    7e52e4 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x11c4>
  7e52a9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e52ae:	ff 15 fc 83 50 00    	call   *0x5083fc(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e52b4:	eb 2e                	jmp    7e52e4 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x11c4>
  7e52b6:	ff 15 dc 83 50 00    	call   *0x5083dc(%rip)        # ced698 <_DYNAMIC+0x250>
  7e52bc:	48 89 c3             	mov    %rax,%rbx
  7e52bf:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  7e52c6:	00 
  7e52c7:	f0 48 ff 08          	lock decq (%rax)
  7e52cb:	75 0e                	jne    7e52db <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x11bb>
  7e52cd:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e52d4:	00 
  7e52d5:	ff 15 d5 83 50 00    	call   *0x5083d5(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e52db:	40 84 ed             	test   %bpl,%bpl
  7e52de:	0f 84 20 03 00 00    	je     7e5604 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14e4>
  7e52e4:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  7e52eb:	00 
  7e52ec:	f0 48 ff 08          	lock decq (%rax)
  7e52f0:	0f 85 0e 03 00 00    	jne    7e5604 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14e4>
  7e52f6:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e52fd:	00 
  7e52fe:	ff 15 ac 83 50 00    	call   *0x5083ac(%rip)        # ced6b0 <_DYNAMIC+0x268>
  7e5304:	e9 fb 02 00 00       	jmp    7e5604 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14e4>
  7e5309:	ff 15 89 83 50 00    	call   *0x508389(%rip)        # ced698 <_DYNAMIC+0x250>
  7e530f:	48 89 c3             	mov    %rax,%rbx
  7e5312:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5317:	e8 b4 80 fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e531c:	e9 f0 02 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5321:	48 89 c3             	mov    %rax,%rbx
  7e5324:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5329:	e8 62 9a fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e532e:	e9 22 01 00 00       	jmp    7e5455 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1335>
  7e5333:	48 89 c3             	mov    %rax,%rbx
  7e5336:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e533b:	e8 90 80 fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e5340:	e9 cc 02 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5345:	48 89 c3             	mov    %rax,%rbx
  7e5348:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  7e534f:	00 
  7e5350:	e8 3b 9a fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e5355:	e9 aa 02 00 00       	jmp    7e5604 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14e4>
  7e535a:	ff 15 38 83 50 00    	call   *0x508338(%rip)        # ced698 <_DYNAMIC+0x250>
  7e5360:	48 89 c3             	mov    %rax,%rbx
  7e5363:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5368:	e8 63 80 fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e536d:	e9 9f 02 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5372:	48 89 c3             	mov    %rax,%rbx
  7e5375:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e537a:	e8 11 9a fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e537f:	e9 d1 00 00 00       	jmp    7e5455 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1335>
  7e5384:	48 89 c3             	mov    %rax,%rbx
  7e5387:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
  7e538e:	00 
  7e538f:	e8 fc 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e5394:	e9 bc 00 00 00       	jmp    7e5455 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1335>
  7e5399:	ff 15 f9 82 50 00    	call   *0x5082f9(%rip)        # ced698 <_DYNAMIC+0x250>
  7e539f:	48 89 c3             	mov    %rax,%rbx
  7e53a2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e53a7:	e8 24 80 fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e53ac:	80 bc 24 80 00 00 00 	cmpb   $0xff,0x80(%rsp)
  7e53b3:	ff 
  7e53b4:	0f 84 57 02 00 00    	je     7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e53ba:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e53c1:	00 
  7e53c2:	e8 c9 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e53c7:	e9 45 02 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e53cc:	48 89 c3             	mov    %rax,%rbx
  7e53cf:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e53d4:	e8 f7 7f fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e53d9:	e9 33 02 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e53de:	48 89 c3             	mov    %rax,%rbx
  7e53e1:	48 8d bc 24 30 02 00 	lea    0x230(%rsp),%rdi
  7e53e8:	00 
  7e53e9:	e8 a2 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e53ee:	e9 1e 02 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e53f3:	ff 15 9f 82 50 00    	call   *0x50829f(%rip)        # ced698 <_DYNAMIC+0x250>
  7e53f9:	48 89 c3             	mov    %rax,%rbx
  7e53fc:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e5403:	00 
  7e5404:	e8 87 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e5409:	e9 f6 01 00 00       	jmp    7e5604 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14e4>
  7e540e:	48 89 c3             	mov    %rax,%rbx
  7e5411:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e5418:	00 
  7e5419:	e8 72 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e541e:	e9 ee 01 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5423:	48 89 c3             	mov    %rax,%rbx
  7e5426:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e542b:	e8 60 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e5430:	eb 38                	jmp    7e546a <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x134a>
  7e5432:	ff 15 60 82 50 00    	call   *0x508260(%rip)        # ced698 <_DYNAMIC+0x250>
  7e5438:	48 89 c3             	mov    %rax,%rbx
  7e543b:	e9 c4 01 00 00       	jmp    7e5604 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14e4>
  7e5440:	48 89 c3             	mov    %rax,%rbx
  7e5443:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e5448:	e8 83 7f fd ff       	call   7bd3d0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCsaEGsyZiti5M_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.2904400372509067776>
  7e544d:	e9 bf 01 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5452:	48 89 c3             	mov    %rax,%rbx
  7e5455:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e545c:	00 
  7e545d:	e8 3e 8f fd ff       	call   7be3a0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCsaEGsyZiti5M_10hypersolve13real_interval12RealIntervalEBF_>
  7e5462:	e9 aa 01 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e5467:	48 89 c3             	mov    %rax,%rbx
  7e546a:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  7e5471:	00 
  7e5472:	e8 19 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e5477:	e9 95 01 00 00       	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e547c:	48 89 c3             	mov    %rax,%rbx
  7e547f:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  7e5486:	00 
  7e5487:	e8 04 99 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e548c:	eb 39                	jmp    7e54c7 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x13a7>
  7e548e:	48 89 c3             	mov    %rax,%rbx
  7e5491:	48 8d bc 24 68 02 00 	lea    0x268(%rsp),%rdi
  7e5498:	00 
  7e5499:	e8 22 23 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e549e:	eb 4e                	jmp    7e54ee <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x13ce>
  7e54a0:	48 89 c3             	mov    %rax,%rbx
  7e54a3:	eb 56                	jmp    7e54fb <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x13db>
  7e54a5:	48 89 c3             	mov    %rax,%rbx
  7e54a8:	48 8d bc 24 68 02 00 	lea    0x268(%rsp),%rdi
  7e54af:	00 
  7e54b0:	e8 0b 23 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e54b5:	eb 6b                	jmp    7e5522 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x1402>
  7e54b7:	48 89 c3             	mov    %rax,%rbx
  7e54ba:	eb 73                	jmp    7e552f <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x140f>
  7e54bc:	48 89 c3             	mov    %rax,%rbx
  7e54bf:	e9 8a 00 00 00       	jmp    7e554e <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x142e>
  7e54c4:	48 89 c3             	mov    %rax,%rbx
  7e54c7:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  7e54ce:	00 
  7e54cf:	e8 cc 8e fd ff       	call   7be3a0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCsaEGsyZiti5M_10hypersolve13real_interval12RealIntervalEBF_>
  7e54d4:	e9 1e 01 00 00       	jmp    7e55f7 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14d7>
  7e54d9:	48 89 c3             	mov    %rax,%rbx
  7e54dc:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  7e54e3:	00 
  7e54e4:	e8 a7 98 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e54e9:	eb 10                	jmp    7e54fb <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x13db>
  7e54eb:	48 89 c3             	mov    %rax,%rbx
  7e54ee:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  7e54f5:	00 
  7e54f6:	e8 c5 22 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e54fb:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  7e5502:	00 
  7e5503:	e8 88 98 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e5508:	e9 a1 00 00 00       	jmp    7e55ae <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x148e>
  7e550d:	48 89 c3             	mov    %rax,%rbx
  7e5510:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  7e5517:	00 
  7e5518:	e8 73 98 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e551d:	eb 10                	jmp    7e552f <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x140f>
  7e551f:	48 89 c3             	mov    %rax,%rbx
  7e5522:	48 8d bc 24 b0 01 00 	lea    0x1b0(%rsp),%rdi
  7e5529:	00 
  7e552a:	e8 91 22 0c 00       	call   8a77c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.9862486585408550560>
  7e552f:	48 8d bc 24 98 02 00 	lea    0x298(%rsp),%rdi
  7e5536:	00 
  7e5537:	e8 54 98 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e553c:	eb 70                	jmp    7e55ae <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x148e>
  7e553e:	48 89 c3             	mov    %rax,%rbx
  7e5541:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  7e5548:	00 
  7e5549:	e8 42 98 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e554e:	0f 28 84 24 30 01 00 	movaps 0x130(%rsp),%xmm0
  7e5555:	00 
  7e5556:	0f 29 84 24 90 01 00 	movaps %xmm0,0x190(%rsp)
  7e555d:	00 
  7e555e:	0f 28 84 24 20 01 00 	movaps 0x120(%rsp),%xmm0
  7e5565:	00 
  7e5566:	0f 29 84 24 80 01 00 	movaps %xmm0,0x180(%rsp)
  7e556d:	00 
  7e556e:	0f 28 84 24 e0 00 00 	movaps 0xe0(%rsp),%xmm0
  7e5575:	00 
  7e5576:	0f 28 8c 24 f0 00 00 	movaps 0xf0(%rsp),%xmm1
  7e557d:	00 
  7e557e:	0f 28 94 24 00 01 00 	movaps 0x100(%rsp),%xmm2
  7e5585:	00 
  7e5586:	0f 28 9c 24 10 01 00 	movaps 0x110(%rsp),%xmm3
  7e558d:	00 
  7e558e:	0f 29 9c 24 70 01 00 	movaps %xmm3,0x170(%rsp)
  7e5595:	00 
  7e5596:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  7e559d:	00 
  7e559e:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  7e55a5:	00 
  7e55a6:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  7e55ad:	00 
  7e55ae:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e55b3:	e8 e8 8d fd ff       	call   7be3a0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCsaEGsyZiti5M_10hypersolve13real_interval12RealIntervalEBF_>
  7e55b8:	eb 3d                	jmp    7e55f7 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14d7>
  7e55ba:	ff 15 d8 80 50 00    	call   *0x5080d8(%rip)        # ced698 <_DYNAMIC+0x250>
  7e55c0:	48 89 c3             	mov    %rax,%rbx
  7e55c3:	4c 89 f7             	mov    %r14,%rdi
  7e55c6:	e8 c5 97 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e55cb:	eb 2a                	jmp    7e55f7 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14d7>
  7e55cd:	ff 15 c5 80 50 00    	call   *0x5080c5(%rip)        # ced698 <_DYNAMIC+0x250>
  7e55d3:	48 89 c3             	mov    %rax,%rbx
  7e55d6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  7e55db:	e8 b0 97 fd ff       	call   7bed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs5gUtMYV5hV5_9hyperreal4real10arithmetic4RealECsaEGsyZiti5M_10hypersolve.llvm.2904400372509067776>
  7e55e0:	eb 2f                	jmp    7e5611 <_RNvNtCsaEGsyZiti5M_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.2904400372509067776+0x14f1>
  7e55e2:	ff 15 b0 80 50 00    	call   *0x5080b0(%rip)        # ced698 <_DYNAMIC+0x250>
  7e55e8:	ff 15 aa 80 50 00    	call   *0x5080aa(%rip)        # ced698 <_DYNAMIC+0x250>
  7e55ee:	ff 15 a4 80 50 00    	call   *0x5080a4(%rip)        # ced698 <_DYNAMIC+0x250>
  7e55f4:	48 89 c3             	mov    %rax,%rbx
  7e55f7:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  7e55fe:	00 
  7e55ff:	e8 9c 8d fd ff       	call   7be3a0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCsaEGsyZiti5M_10hypersolve13real_interval12RealIntervalEBF_>
  7e5604:	48 8d bc 24 00 02 00 	lea    0x200(%rsp),%rdi
  7e560b:	00 
  7e560c:	e8 8f 8d fd ff       	call   7be3a0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCsaEGsyZiti5M_10hypersolve13real_interval12RealIntervalEBF_>
  7e5611:	48 89 df             	mov    %rbx,%rdi
  7e5614:	e8 17 a0 4b 00       	call   c9f630 <_Unwind_Resume@plt>
  7e5619:	ff 15 79 80 50 00    	call   *0x508079(%rip)        # ced698 <_DYNAMIC+0x250>
  7e561f:	ff 15 73 80 50 00    	call   *0x508073(%rip)        # ced698 <_DYNAMIC+0x250>
  7e5625:	ff 15 6d 80 50 00    	call   *0x50806d(%rip)        # ced698 <_DYNAMIC+0x250>
