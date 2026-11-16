
/tmp/interval-refactor/horner-current/stack-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

0000000000130060 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership>:
  130060:	55                   	push   %rbp
  130061:	41 57                	push   %r15
  130063:	41 56                	push   %r14
  130065:	41 55                	push   %r13
  130067:	41 54                	push   %r12
  130069:	53                   	push   %rbx
  13006a:	48 81 ec 58 01 00 00 	sub    $0x158,%rsp
  130071:	44 89 cd             	mov    %r9d,%ebp
  130074:	45 89 c4             	mov    %r8d,%r12d
  130077:	48 89 cb             	mov    %rcx,%rbx
  13007a:	49 89 d6             	mov    %rdx,%r14
  13007d:	49 89 f7             	mov    %rsi,%r15
  130080:	49 89 fd             	mov    %rdi,%r13
  130083:	48 89 d7             	mov    %rdx,%rdi
  130086:	48 89 ce             	mov    %rcx,%rsi
  130089:	44 89 c2             	mov    %r8d,%edx
  13008c:	e8 cf 11 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  130091:	3c fe                	cmp    $0xfe,%al
  130093:	0f 84 ef 03 00 00    	je     130488 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x428>
  130099:	0f b6 c0             	movzbl %al,%eax
  13009c:	3d ff 00 00 00       	cmp    $0xff,%eax
  1300a1:	75 73                	jne    130116 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xb6>
  1300a3:	89 6c 24 78          	mov    %ebp,0x78(%rsp)
  1300a7:	4c 89 f1             	mov    %r14,%rcx
  1300aa:	48 8b 2d 47 5f 17 00 	mov    0x175f47(%rip),%rbp        # 2a5ff8 <_DYNAMIC+0x6e8>
  1300b1:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  1300b8:	00 
  1300b9:	4c 89 ee             	mov    %r13,%rsi
  1300bc:	4c 89 fa             	mov    %r15,%rdx
  1300bf:	ff d5                	call   *%rbp
  1300c1:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  1300c8:	00 
  1300c9:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  1300ce:	4c 89 ee             	mov    %r13,%rsi
  1300d1:	4d 89 fd             	mov    %r15,%r13
  1300d4:	4c 89 fa             	mov    %r15,%rdx
  1300d7:	49 89 df             	mov    %rbx,%r15
  1300da:	48 89 d9             	mov    %rbx,%rcx
  1300dd:	ff d5                	call   *%rbp
  1300df:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1300e4:	ff 15 ce 5a 17 00    	call   *0x175ace(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  1300ea:	4c 89 eb             	mov    %r13,%rbx
  1300ed:	45 0f b6 ec          	movzbl %r12b,%r13d
  1300f1:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  1300f8:	00 
  1300f9:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  1300fe:	44 89 ea             	mov    %r13d,%edx
  130101:	e8 5a 11 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  130106:	3c fe                	cmp    $0xfe,%al
  130108:	75 14                	jne    13011e <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xbe>
  13010a:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  13010f:	e8 0c 2a ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130114:	eb 42                	jmp    130158 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xf8>
  130116:	45 31 e4             	xor    %r12d,%r12d
  130119:	e9 6d 03 00 00       	jmp    13048b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  13011e:	89 c5                	mov    %eax,%ebp
  130120:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130125:	e8 f6 29 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  13012a:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  13012f:	ff 15 83 5a 17 00    	call   *0x175a83(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  130135:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  13013c:	00 
  13013d:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  130142:	44 89 ea             	mov    %r13d,%edx
  130145:	e8 16 11 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  13014a:	3c fe                	cmp    $0xfe,%al
  13014c:	75 2c                	jne    13017a <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x11a>
  13014e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130153:	e8 c8 29 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130158:	41 b4 02             	mov    $0x2,%r12b
  13015b:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  130162:	00 
  130163:	e8 b8 29 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130168:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  13016f:	00 
  130170:	e8 ab 29 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130175:	e9 11 03 00 00       	jmp    13048b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  13017a:	89 44 24 24          	mov    %eax,0x24(%rsp)
  13017e:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130183:	e8 98 29 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130188:	89 ef                	mov    %ebp,%edi
  13018a:	40 84 ff             	test   %dil,%dil
  13018d:	0f 94 c1             	sete   %cl
  130190:	8b 74 24 24          	mov    0x24(%rsp),%esi
  130194:	40 84 f6             	test   %sil,%sil
  130197:	0f 94 c0             	sete   %al
  13019a:	89 ca                	mov    %ecx,%edx
  13019c:	08 c2                	or     %al,%dl
  13019e:	88 54 24 23          	mov    %dl,0x23(%rsp)
  1301a2:	80 fa 01             	cmp    $0x1,%dl
  1301a5:	74 16                	je     1301bd <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x15d>
  1301a7:	48 83 fb 04          	cmp    $0x4,%rbx
  1301ab:	0f 92 c2             	setb   %dl
  1301ae:	40 38 f7             	cmp    %sil,%dil
  1301b1:	40 0f 95 c6          	setne  %sil
  1301b5:	41 b4 01             	mov    $0x1,%r12b
  1301b8:	40 84 f2             	test   %sil,%dl
  1301bb:	75 9e                	jne    13015b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xfb>
  1301bd:	8b 54 24 78          	mov    0x78(%rsp),%edx
  1301c1:	20 ca                	and    %cl,%dl
  1301c3:	0f b6 ca             	movzbl %dl,%ecx
  1301c6:	22 84 24 90 01 00 00 	and    0x190(%rsp),%al
  1301cd:	0f b6 c0             	movzbl %al,%eax
  1301d0:	48 89 8c 24 f0 00 00 	mov    %rcx,0xf0(%rsp)
  1301d7:	00 
  1301d8:	48 01 c8             	add    %rcx,%rax
  1301db:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  1301e0:	48 83 fb 03          	cmp    $0x3,%rbx
  1301e4:	0f 87 bd 00 00 00    	ja     1302a7 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x247>
  1301ea:	48 83 fb 02          	cmp    $0x2,%rbx
  1301ee:	0f 84 b3 00 00 00    	je     1302a7 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x247>
  1301f4:	0f 10 84 24 f8 00 00 	movups 0xf8(%rsp),%xmm0
  1301fb:	00 
  1301fc:	0f 10 8c 24 08 01 00 	movups 0x108(%rsp),%xmm1
  130203:	00 
  130204:	0f 10 94 24 18 01 00 	movups 0x118(%rsp),%xmm2
  13020b:	00 
  13020c:	0f 29 94 24 a0 00 00 	movaps %xmm2,0xa0(%rsp)
  130213:	00 
  130214:	0f 29 8c 24 90 00 00 	movaps %xmm1,0x90(%rsp)
  13021b:	00 
  13021c:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  130223:	00 
  130224:	0f 10 84 24 28 01 00 	movups 0x128(%rsp),%xmm0
  13022b:	00 
  13022c:	0f 10 8c 24 38 01 00 	movups 0x138(%rsp),%xmm1
  130233:	00 
  130234:	0f 10 94 24 48 01 00 	movups 0x148(%rsp),%xmm2
  13023b:	00 
  13023c:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  130241:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  130246:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  13024b:	44 89 6c 24 10       	mov    %r13d,0x10(%rsp)
  130250:	0f b6 44 24 24       	movzbl 0x24(%rsp),%eax
  130255:	89 44 24 08          	mov    %eax,0x8(%rsp)
  130259:	40 0f b6 c5          	movzbl %bpl,%eax
  13025d:	89 04 24             	mov    %eax,(%rsp)
  130260:	4c 8d 84 24 80 00 00 	lea    0x80(%rsp),%r8
  130267:	00 
  130268:	4c 8d 4c 24 30       	lea    0x30(%rsp),%r9
  13026d:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  130272:	48 89 de             	mov    %rbx,%rsi
  130275:	4c 89 f2             	mov    %r14,%rdx
  130278:	4c 89 f9             	mov    %r15,%rcx
  13027b:	e8 70 ba ff ff       	call   12bcf0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  130280:	41 b4 02             	mov    $0x2,%r12b
  130283:	a8 01                	test   $0x1,%al
  130285:	0f 84 00 02 00 00    	je     13048b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  13028b:	48 83 fa 02          	cmp    $0x2,%rdx
  13028f:	0f 83 c4 00 00 00    	jae    130359 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2f9>
  130295:	48 03 54 24 78       	add    0x78(%rsp),%rdx
  13029a:	48 83 fa 01          	cmp    $0x1,%rdx
  13029e:	41 0f 94 c4          	sete   %r12b
  1302a2:	e9 e4 01 00 00       	jmp    13048b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  1302a7:	41 80 3e 00          	cmpb   $0x0,(%r14)
  1302ab:	75 1c                	jne    1302c9 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  1302ad:	41 80 3f 00          	cmpb   $0x0,(%r15)
  1302b1:	75 16                	jne    1302c9 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  1302b3:	49 8d 7e 10          	lea    0x10(%r14),%rdi
  1302b7:	49 8d 77 10          	lea    0x10(%r15),%rsi
  1302bb:	ff 15 6f 59 17 00    	call   *0x17596f(%rip)        # 2a5c30 <_DYNAMIC+0x320>
  1302c1:	84 c0                	test   %al,%al
  1302c3:	0f 8e 5c 02 00 00    	jle    130525 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x4c5>
  1302c9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1302ce:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  1302d3:	48 89 da             	mov    %rbx,%rdx
  1302d6:	e8 65 4f ff ff       	call   125240 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation10derivative>
  1302db:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
  1302e0:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  1302e5:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
  1302ea:	4c 89 f2             	mov    %r14,%rdx
  1302ed:	4c 89 f9             	mov    %r15,%rcx
  1302f0:	45 89 e8             	mov    %r13d,%r8d
  1302f3:	e8 b8 a0 ff ff       	call   12a3b0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero>
  1302f8:	41 89 c4             	mov    %eax,%r12d
  1302fb:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130300:	e8 0b 33 fc ff       	call   f3610 <_RNvXsp_NtCs1C1lLj4PWSY_5alloc3vecINtB5_3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealENtNtNtCsevLNFiNqfJP_4core3ops4drop4Drop4dropCs23PzJKl0dyV_10hypersolve>
  130305:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  13030a:	48 85 c0             	test   %rax,%rax
  13030d:	74 18                	je     130327 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2c7>
  13030f:	48 c1 e0 04          	shl    $0x4,%rax
  130313:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  130317:	ba 08 00 00 00       	mov    $0x8,%edx
  13031c:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  130321:	ff 15 31 58 17 00    	call   *0x175831(%rip)        # 2a5b58 <_DYNAMIC+0x248>
  130327:	41 f6 c4 01          	test   $0x1,%r12b
  13032b:	0f 84 c3 fe ff ff    	je     1301f4 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x194>
  130331:	40 3a 6c 24 24       	cmp    0x24(%rsp),%bpl
  130336:	0f 95 c0             	setne  %al
  130339:	0f b6 4c 24 23       	movzbl 0x23(%rsp),%ecx
  13033e:	80 f1 01             	xor    $0x1,%cl
  130341:	20 c1                	and    %al,%cl
  130343:	0f b6 c1             	movzbl %cl,%eax
  130346:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
  13034b:	01 c1                	add    %eax,%ecx
  13034d:	83 f9 01             	cmp    $0x1,%ecx
  130350:	41 0f 94 c4          	sete   %r12b
  130354:	e9 02 fe ff ff       	jmp    13015b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0xfb>
  130359:	48 83 fb 03          	cmp    $0x3,%rbx
  13035d:	75 34                	jne    130393 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x333>
  13035f:	45 31 c0             	xor    %r8d,%r8d
  130362:	80 7c 24 24 00       	cmpb   $0x0,0x24(%rsp)
  130367:	41 0f 94 c0          	sete   %r8b
  13036b:	31 c9                	xor    %ecx,%ecx
  13036d:	40 84 ed             	test   %bpl,%bpl
  130370:	0f 94 c1             	sete   %cl
  130373:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  130378:	48 8d 77 30          	lea    0x30(%rdi),%rsi
  13037c:	48 8d 57 60          	lea    0x60(%rdi),%rdx
  130380:	45 89 e9             	mov    %r13d,%r9d
  130383:	e8 88 08 00 00       	call   130c10 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50quadratic_multiple_variation_has_one_distinct_root>
  130388:	41 89 c4             	mov    %eax,%r12d
  13038b:	3c 02                	cmp    $0x2,%al
  13038d:	0f 85 f8 00 00 00    	jne    13048b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  130393:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
  130398:	4c 89 e7             	mov    %r12,%rdi
  13039b:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  1303a0:	48 89 da             	mov    %rbx,%rdx
  1303a3:	e8 18 2a ff ff       	call   122dc0 <_RINvXNvMNtCs1C1lLj4PWSY_5alloc5sliceSp9to_vec_inNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealNtB3_10ConvertVec6to_vecNtNtB8_5alloc6GlobalECs23PzJKl0dyV_10hypersolve>
  1303a8:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  1303af:	00 
  1303b0:	4c 89 e6             	mov    %r12,%rsi
  1303b3:	45 89 ec             	mov    %r13d,%r12d
  1303b6:	44 89 ea             	mov    %r13d,%edx
  1303b9:	ff 15 b1 5b 17 00    	call   *0x175bb1(%rip)        # 2a5f70 <_DYNAMIC+0x660>
  1303bf:	48 83 bc 24 80 00 00 	cmpq   $0xffffffffffffffff,0x80(%rsp)
  1303c6:	00 ff 
  1303c8:	0f 84 ba 00 00 00    	je     130488 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x428>
  1303ce:	48 8b ac 24 90 00 00 	mov    0x90(%rsp),%rbp
  1303d5:	00 
  1303d6:	48 89 ac 24 d0 00 00 	mov    %rbp,0xd0(%rsp)
  1303dd:	00 
  1303de:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
  1303e5:	00 
  1303e6:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
  1303ed:	00 
  1303ee:	48 8b b4 24 c8 00 00 	mov    0xc8(%rsp),%rsi
  1303f5:	00 
  1303f6:	48 39 dd             	cmp    %rbx,%rbp
  1303f9:	0f 85 a1 00 00 00    	jne    1304a0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x440>
  1303ff:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130404:	48 89 da             	mov    %rbx,%rdx
  130407:	44 89 e1             	mov    %r12d,%ecx
  13040a:	ff 15 e8 5e 17 00    	call   *0x175ee8(%rip)        # 2a62f8 <_DYNAMIC+0x9e8>
  130410:	48 83 7c 24 30 ff    	cmpq   $0xffffffffffffffff,0x30(%rsp)
  130416:	74 68                	je     130480 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x420>
  130418:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  13041d:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
  130424:	00 
  130425:	0f 10 44 24 30       	movups 0x30(%rsp),%xmm0
  13042a:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  130431:	00 
  130432:	48 8b bc 24 88 00 00 	mov    0x88(%rsp),%rdi
  130439:	00 
  13043a:	4c 89 f2             	mov    %r14,%rdx
  13043d:	4c 89 f9             	mov    %r15,%rcx
  130440:	45 89 e0             	mov    %r12d,%r8d
  130443:	e8 d8 4e ff ff       	call   125320 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation11sturm_count>
  130448:	48 83 f8 01          	cmp    $0x1,%rax
  13044c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  130450:	75 21                	jne    130473 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x413>
  130452:	48 89 d3             	mov    %rdx,%rbx
  130455:	84 c0                	test   %al,%al
  130457:	0f 94 c0             	sete   %al
  13045a:	0f b6 8c 24 90 01 00 	movzbl 0x190(%rsp),%ecx
  130461:	00 
  130462:	80 f1 01             	xor    $0x1,%cl
  130465:	20 c1                	and    %al,%cl
  130467:	0f b6 c1             	movzbl %cl,%eax
  13046a:	48 29 c3             	sub    %rax,%rbx
  13046d:	0f 83 0b 01 00 00    	jae    13057e <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x51e>
  130473:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  13047a:	00 
  13047b:	e8 40 1f ff ff       	call   1223c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs23PzJKl0dyV_10hypersolve>
  130480:	41 b4 02             	mov    $0x2,%r12b
  130483:	e9 19 01 00 00       	jmp    1305a1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x541>
  130488:	41 b4 02             	mov    $0x2,%r12b
  13048b:	44 89 e0             	mov    %r12d,%eax
  13048e:	48 81 c4 58 01 00 00 	add    $0x158,%rsp
  130495:	5b                   	pop    %rbx
  130496:	41 5c                	pop    %r12
  130498:	41 5d                	pop    %r13
  13049a:	41 5e                	pop    %r14
  13049c:	41 5f                	pop    %r15
  13049e:	5d                   	pop    %rbp
  13049f:	c3                   	ret
  1304a0:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  1304a7:	00 
  1304a8:	48 89 f3             	mov    %rsi,%rbx
  1304ab:	48 89 ea             	mov    %rbp,%rdx
  1304ae:	4c 89 f1             	mov    %r14,%rcx
  1304b1:	ff 15 41 5b 17 00    	call   *0x175b41(%rip)        # 2a5ff8 <_DYNAMIC+0x6e8>
  1304b7:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1304bc:	48 89 de             	mov    %rbx,%rsi
  1304bf:	48 89 ea             	mov    %rbp,%rdx
  1304c2:	4c 89 f9             	mov    %r15,%rcx
  1304c5:	ff 15 2d 5b 17 00    	call   *0x175b2d(%rip)        # 2a5ff8 <_DYNAMIC+0x6e8>
  1304cb:	44 89 64 24 10       	mov    %r12d,0x10(%rsp)
  1304d0:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%rsp)
  1304d7:	4c 8d 84 24 80 00 00 	lea    0x80(%rsp),%r8
  1304de:	00 
  1304df:	4c 8d 4c 24 30       	lea    0x30(%rsp),%r9
  1304e4:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
  1304e9:	48 89 df             	mov    %rbx,%rdi
  1304ec:	48 89 ee             	mov    %rbp,%rsi
  1304ef:	4c 89 f2             	mov    %r14,%rdx
  1304f2:	4c 89 f9             	mov    %r15,%rcx
  1304f5:	e8 f6 b7 ff ff       	call   12bcf0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation40polynomial_interval_bernstein_variations>
  1304fa:	41 b4 02             	mov    $0x2,%r12b
  1304fd:	a8 01                	test   $0x1,%al
  1304ff:	0f 84 9c 00 00 00    	je     1305a1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x541>
  130505:	48 89 eb             	mov    %rbp,%rbx
  130508:	48 83 fa 02          	cmp    $0x2,%rdx
  13050c:	45 89 ec             	mov    %r13d,%r12d
  13050f:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  130514:	0f 83 e5 fe ff ff    	jae    1303ff <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x39f>
  13051a:	48 03 54 24 78       	add    0x78(%rsp),%rdx
  13051f:	48 83 fa 01          	cmp    $0x1,%rdx
  130523:	eb 78                	jmp    13059d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x53d>
  130525:	49 89 dc             	mov    %rbx,%r12
  130528:	49 c1 e4 04          	shl    $0x4,%r12
  13052c:	4b 8d 3c 64          	lea    (%r12,%r12,2),%rdi
  130530:	48 83 c7 d0          	add    $0xffffffffffffffd0,%rdi
  130534:	48 c1 ef 04          	shr    $0x4,%rdi
  130538:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
  13053f:	aa aa aa 
  130542:	48 0f af f8          	imul   %rax,%rdi
  130546:	ff 15 94 5a 17 00    	call   *0x175a94(%rip)        # 2a5fe0 <_DYNAMIC+0x6d0>
  13054c:	4f 8d 24 64          	lea    (%r12,%r12,2),%r12
  130550:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  130555:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
  130559:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  13055e:	80 7f d0 00          	cmpb   $0x0,-0x30(%rdi)
  130562:	74 4f                	je     1305b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x553>
  130564:	f0 48 ff 08          	lock decq (%rax)
  130568:	0f 85 5b fd ff ff    	jne    1302c9 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  13056e:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  130573:	ff 15 f7 55 17 00    	call   *0x1755f7(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  130579:	e9 4b fd ff ff       	jmp    1302c9 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  13057e:	48 03 9c 24 f0 00 00 	add    0xf0(%rsp),%rbx
  130585:	00 
  130586:	0f 82 e7 fe ff ff    	jb     130473 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x413>
  13058c:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  130593:	00 
  130594:	e8 27 1e ff ff       	call   1223c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs23PzJKl0dyV_10hypersolve>
  130599:	48 83 fb 01          	cmp    $0x1,%rbx
  13059d:	41 0f 94 c4          	sete   %r12b
  1305a1:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  1305a8:	00 
  1305a9:	e8 12 1f ff ff       	call   1224c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs23PzJKl0dyV_10hypersolve>
  1305ae:	e9 d8 fe ff ff       	jmp    13048b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x42b>
  1305b3:	48 83 c7 e0          	add    $0xffffffffffffffe0,%rdi
  1305b7:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
  1305bc:	e8 7f 25 00 00       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  1305c1:	f0 48 ff 00          	lock incq (%rax)
  1305c5:	0f 8e b2 01 00 00    	jle    13077d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x71d>
  1305cb:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  1305d0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  1305d5:	48 83 fb 03          	cmp    $0x3,%rbx
  1305d9:	0f 82 2d 01 00 00    	jb     13070c <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6ac>
  1305df:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  1305e4:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  1305e8:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  1305ef:	00 
  1305f0:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1305f5:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
  1305fa:	49 8d 56 10          	lea    0x10(%r14),%rdx
  1305fe:	49 8d 4f 10          	lea    0x10(%r15),%rcx
  130602:	e8 29 08 00 00       	call   130e30 <_RNvNtCs7Oh8zmHsHuv_13hyperinterval8rational12product_hull>
  130607:	48 89 84 24 b8 00 00 	mov    %rax,0xb8(%rsp)
  13060e:	00 
  13060f:	48 89 54 24 70       	mov    %rdx,0x70(%rsp)
  130614:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  130619:	f0 48 ff 08          	lock decq (%rax)
  13061d:	75 0b                	jne    13062a <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x5ca>
  13061f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130624:	ff 15 46 55 17 00    	call   *0x175546(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  13062a:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  13062f:	f0 48 ff 08          	lock decq (%rax)
  130633:	75 0b                	jne    130640 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x5e0>
  130635:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  13063a:	ff 15 30 55 17 00    	call   *0x175530(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  130640:	49 8d 7c 24 a0       	lea    -0x60(%r12),%rdi
  130645:	48 89 bc 24 e8 00 00 	mov    %rdi,0xe8(%rsp)
  13064c:	00 
  13064d:	48 c1 ef 04          	shr    $0x4,%rdi
  130651:	48 b8 ab aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaab,%rax
  130658:	aa aa aa 
  13065b:	48 0f af f8          	imul   %rax,%rdi
  13065f:	48 8b 84 24 b8 00 00 	mov    0xb8(%rsp),%rax
  130666:	00 
  130667:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  13066c:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  130671:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  130676:	ff 15 64 59 17 00    	call   *0x175964(%rip)        # 2a5fe0 <_DYNAMIC+0x6d0>
  13067c:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
  130683:	00 
  130684:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  130689:	42 80 7c 21 a0 00    	cmpb   $0x0,-0x60(%rcx,%r12,1)
  13068f:	0f 85 b6 00 00 00    	jne    13074b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6eb>
  130695:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
  13069c:	00 
  13069d:	4a 8d 3c 21          	lea    (%rcx,%r12,1),%rdi
  1306a1:	48 89 c6             	mov    %rax,%rsi
  1306a4:	e8 27 1d 00 00       	call   1323d0 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalINtNtNtCsevLNFiNqfJP_4core3ops5arith3MulBU_E3mulCs23PzJKl0dyV_10hypersolve>
  1306a9:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  1306b0:	00 
  1306b1:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
  1306b6:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  1306bb:	48 8d 94 24 80 00 00 	lea    0x80(%rsp),%rdx
  1306c2:	00 
  1306c3:	e8 38 19 ff ff       	call   122000 <_RINvNtCs7Oh8zmHsHuv_13hyperinterval8rational17translated_boundsNtNtNtCs8rd0GMicEM6_9hyperreal8rational10arithmetic8RationalECs23PzJKl0dyV_10hypersolve>
  1306c8:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  1306cd:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
  1306d2:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  1306d9:	00 
  1306da:	f0 48 ff 08          	lock decq (%rax)
  1306de:	75 0e                	jne    1306ee <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x68e>
  1306e0:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  1306e7:	00 
  1306e8:	ff 15 82 54 17 00    	call   *0x175482(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1306ee:	49 83 fc 60          	cmp    $0x60,%r12
  1306f2:	74 13                	je     130707 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6a7>
  1306f4:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
  1306f8:	48 83 bc 24 e8 00 00 	cmpq   $0x60,0xe8(%rsp)
  1306ff:	00 60 
  130701:	0f 83 e9 fe ff ff    	jae    1305f0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x590>
  130707:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  13070c:	41 b4 01             	mov    $0x1,%r12b
  13070f:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  130713:	74 0d                	je     130722 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6c2>
  130715:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  13071a:	80 78 64 00          	cmpb   $0x0,0x64(%rax)
  13071e:	41 0f 94 c4          	sete   %r12b
  130722:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130727:	e8 84 23 ff ff       	call   122ab0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  13072c:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  130731:	f0 48 ff 08          	lock decq (%rax)
  130735:	0f 85 ec fb ff ff    	jne    130327 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2c7>
  13073b:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  130740:	ff 15 2a 54 17 00    	call   *0x17542a(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  130746:	e9 dc fb ff ff       	jmp    130327 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x2c7>
  13074b:	f0 48 ff 08          	lock decq (%rax)
  13074f:	75 0e                	jne    13075f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x6ff>
  130751:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  130758:	00 
  130759:	ff 15 11 54 17 00    	call   *0x175411(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  13075f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130764:	e8 47 23 ff ff       	call   122ab0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  130769:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  13076e:	f0 48 ff 08          	lock decq (%rax)
  130772:	0f 85 51 fb ff ff    	jne    1302c9 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x269>
  130778:	e9 f1 fd ff ff       	jmp    13056e <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x50e>
  13077d:	0f 0b                	ud2
  13077f:	e9 8c 00 00 00       	jmp    130810 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7b0>
  130784:	48 89 c3             	mov    %rax,%rbx
  130787:	e9 91 00 00 00       	jmp    13081d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7bd>
  13078c:	48 89 c3             	mov    %rax,%rbx
  13078f:	eb 19                	jmp    1307aa <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x74a>
  130791:	48 89 c3             	mov    %rax,%rbx
  130794:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  130799:	f0 48 ff 08          	lock decq (%rax)
  13079d:	75 0b                	jne    1307aa <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x74a>
  13079f:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  1307a4:	ff 15 c6 53 17 00    	call   *0x1753c6(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1307aa:	48 8b 84 24 b8 00 00 	mov    0xb8(%rsp),%rax
  1307b1:	00 
  1307b2:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  1307b7:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  1307bc:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  1307c1:	eb 50                	jmp    130813 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7b3>
  1307c3:	ff 15 87 53 17 00    	call   *0x175387(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  1307c9:	48 89 c3             	mov    %rax,%rbx
  1307cc:	48 8b 84 24 80 00 00 	mov    0x80(%rsp),%rax
  1307d3:	00 
  1307d4:	f0 48 ff 08          	lock decq (%rax)
  1307d8:	75 43                	jne    13081d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7bd>
  1307da:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  1307e1:	00 
  1307e2:	ff 15 88 53 17 00    	call   *0x175388(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1307e8:	eb 33                	jmp    13081d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7bd>
  1307ea:	48 89 c3             	mov    %rax,%rbx
  1307ed:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  1307f4:	00 
  1307f5:	e8 c6 1b ff ff       	call   1223c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs23PzJKl0dyV_10hypersolve>
  1307fa:	eb 46                	jmp    130842 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7e2>
  1307fc:	eb 41                	jmp    13083f <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7df>
  1307fe:	48 89 c3             	mov    %rax,%rbx
  130801:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  130808:	00 
  130809:	e8 12 23 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  13080e:	eb 32                	jmp    130842 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x7e2>
  130810:	48 89 c3             	mov    %rax,%rbx
  130813:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130818:	e8 93 22 ff ff       	call   122ab0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  13081d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  130822:	f0 48 ff 08          	lock decq (%rax)
  130826:	0f 85 87 00 00 00    	jne    1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  13082c:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  130831:	ff 15 39 53 17 00    	call   *0x175339(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  130837:	eb 7a                	jmp    1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  130839:	ff 15 11 53 17 00    	call   *0x175311(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  13083f:	48 89 c3             	mov    %rax,%rbx
  130842:	48 8d bc 24 c0 00 00 	lea    0xc0(%rsp),%rdi
  130849:	00 
  13084a:	e8 71 1c ff ff       	call   1224c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs23PzJKl0dyV_10hypersolve>
  13084f:	eb 7c                	jmp    1308cd <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x86d>
  130851:	48 89 c3             	mov    %rax,%rbx
  130854:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  130859:	48 85 c0             	test   %rax,%rax
  13085c:	74 55                	je     1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  13085e:	48 c1 e0 04          	shl    $0x4,%rax
  130862:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
  130866:	ba 08 00 00 00       	mov    $0x8,%edx
  13086b:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  130870:	ff 15 e2 52 17 00    	call   *0x1752e2(%rip)        # 2a5b58 <_DYNAMIC+0x248>
  130876:	eb 3b                	jmp    1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  130878:	48 89 c3             	mov    %rax,%rbx
  13087b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130880:	e8 3b 1c ff ff       	call   1224c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs23PzJKl0dyV_10hypersolve>
  130885:	eb 2c                	jmp    1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  130887:	ff 15 c3 52 17 00    	call   *0x1752c3(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  13088d:	48 89 c3             	mov    %rax,%rbx
  130890:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  130895:	e8 86 22 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  13089a:	eb 17                	jmp    1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  13089c:	48 89 c3             	mov    %rax,%rbx
  13089f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1308a4:	e8 77 22 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  1308a9:	eb 08                	jmp    1308b3 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x853>
  1308ab:	48 89 c3             	mov    %rax,%rbx
  1308ae:	eb 10                	jmp    1308c0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation47polynomial_has_one_distinct_root_with_ownership+0x860>
  1308b0:	48 89 c3             	mov    %rax,%rbx
  1308b3:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  1308ba:	00 
  1308bb:	e8 60 22 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  1308c0:	48 8d bc 24 f8 00 00 	lea    0xf8(%rsp),%rdi
  1308c7:	00 
  1308c8:	e8 53 22 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  1308cd:	48 89 df             	mov    %rbx,%rdi
  1308d0:	e8 db b8 16 00       	call   29c1b0 <_Unwind_Resume@plt>
  1308d5:	ff 15 75 52 17 00    	call   *0x175275(%rip)        # 2a5b50 <_DYNAMIC+0x240>
