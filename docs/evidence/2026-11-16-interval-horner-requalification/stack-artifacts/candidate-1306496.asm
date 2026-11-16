
/tmp/interval-refactor/horner-current/stack-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

000000000013ef80 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395>:
  13ef80:	55                   	push   %rbp
  13ef81:	41 57                	push   %r15
  13ef83:	41 56                	push   %r14
  13ef85:	41 55                	push   %r13
  13ef87:	41 54                	push   %r12
  13ef89:	53                   	push   %rbx
  13ef8a:	48 81 ec e8 02 00 00 	sub    $0x2e8,%rsp
  13ef91:	49 89 fe             	mov    %rdi,%r14
  13ef94:	48 85 c9             	test   %rcx,%rcx
  13ef97:	0f 84 4e 02 00 00    	je     13f1eb <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x26b>
  13ef9d:	44 89 c3             	mov    %r8d,%ebx
  13efa0:	48 89 d5             	mov    %rdx,%rbp
  13efa3:	48 83 f9 01          	cmp    $0x1,%rcx
  13efa7:	0f 84 d1 00 00 00    	je     13f07e <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xfe>
  13efad:	48 89 b4 24 30 02 00 	mov    %rsi,0x230(%rsp)
  13efb4:	00 
  13efb5:	4c 89 b4 24 d0 00 00 	mov    %r14,0xd0(%rsp)
  13efbc:	00 
  13efbd:	48 8d 04 49          	lea    (%rcx,%rcx,2),%rax
  13efc1:	48 c1 e0 04          	shl    $0x4,%rax
  13efc5:	48 89 6c 24 68       	mov    %rbp,0x68(%rsp)
  13efca:	4c 8d 3c 28          	lea    (%rax,%rbp,1),%r15
  13efce:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  13efd2:	49 89 e5             	mov    %rsp,%r13
  13efd5:	89 5c 24 64          	mov    %ebx,0x64(%rsp)
  13efd9:	0f b6 c3             	movzbl %bl,%eax
  13efdc:	89 84 24 d8 00 00 00 	mov    %eax,0xd8(%rsp)
  13efe3:	48 89 cb             	mov    %rcx,%rbx
  13efe6:	eb 23                	jmp    13f00b <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x8b>
  13efe8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  13efef:	00 
  13eff0:	49 8b 47 10          	mov    0x10(%r15),%rax
  13eff4:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  13eff8:	75 5f                	jne    13f059 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xd9>
  13effa:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  13effe:	4c 89 f3             	mov    %r14,%rbx
  13f001:	49 83 fe 01          	cmp    $0x1,%r14
  13f005:	0f 86 fe 02 00 00    	jbe    13f309 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x389>
  13f00b:	4c 8d 73 ff          	lea    -0x1(%rbx),%r14
  13f00f:	49 39 ce             	cmp    %rcx,%r14
  13f012:	0f 83 4e 12 00 00    	jae    140266 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x12e6>
  13f018:	41 80 3f 00          	cmpb   $0x0,(%r15)
  13f01c:	74 d2                	je     13eff0 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x70>
  13f01e:	48 89 cd             	mov    %rcx,%rbp
  13f021:	4c 89 ef             	mov    %r13,%rdi
  13f024:	ff 15 8e 6b 16 00    	call   *0x166b8e(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  13f02a:	4c 89 ff             	mov    %r15,%rdi
  13f02d:	4c 89 ee             	mov    %r13,%rsi
  13f030:	8b 94 24 d8 00 00 00 	mov    0xd8(%rsp),%edx
  13f037:	e8 24 1b 00 00       	call   140b60 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.212092998455620395>
  13f03c:	41 89 c4             	mov    %eax,%r12d
  13f03f:	41 80 fc fe          	cmp    $0xfe,%r12b
  13f043:	0f 84 d9 08 00 00    	je     13f922 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x9a2>
  13f049:	4c 89 ef             	mov    %r13,%rdi
  13f04c:	e8 4f 7f ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f051:	45 84 e4             	test   %r12b,%r12b
  13f054:	48 89 e9             	mov    %rbp,%rcx
  13f057:	74 a1                	je     13effa <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x7a>
  13f059:	48 39 cb             	cmp    %rcx,%rbx
  13f05c:	48 8b b4 24 30 02 00 	mov    0x230(%rsp),%rsi
  13f063:	00 
  13f064:	0f 87 e7 11 00 00    	ja     140251 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x12d1>
  13f06a:	48 89 d9             	mov    %rbx,%rcx
  13f06d:	4c 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%r14
  13f074:	00 
  13f075:	8b 5c 24 64          	mov    0x64(%rsp),%ebx
  13f079:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
  13f07e:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  13f085:	0f 84 a9 02 00 00    	je     13f334 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x3b4>
  13f08b:	48 81 c6 98 00 00 00 	add    $0x98,%rsi
  13f092:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  13f099:	00 
  13f09a:	48 89 f0             	mov    %rsi,%rax
  13f09d:	48 89 ee             	mov    %rbp,%rsi
  13f0a0:	48 89 ca             	mov    %rcx,%rdx
  13f0a3:	48 89 c1             	mov    %rax,%rcx
  13f0a6:	e8 d5 a0 ff ff       	call   139180 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic19evaluate_polynomial>
  13f0ab:	0f b6 ac 24 d0 01 00 	movzbl 0x1d0(%rsp),%ebp
  13f0b2:	00 
  13f0b3:	40 84 ed             	test   %bpl,%bpl
  13f0b6:	0f 84 ee 01 00 00    	je     13f2aa <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x32a>
  13f0bc:	48 89 e7             	mov    %rsp,%rdi
  13f0bf:	ff 15 f3 6a 16 00    	call   *0x166af3(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  13f0c5:	0f b6 d3             	movzbl %bl,%edx
  13f0c8:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  13f0cf:	00 
  13f0d0:	48 89 e6             	mov    %rsp,%rsi
  13f0d3:	e8 88 1a 00 00       	call   140b60 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.212092998455620395>
  13f0d8:	89 c3                	mov    %eax,%ebx
  13f0da:	48 89 e7             	mov    %rsp,%rdi
  13f0dd:	e8 be 7e ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f0e2:	80 fb fe             	cmp    $0xfe,%bl
  13f0e5:	0f 85 d4 01 00 00    	jne    13f2bf <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x33f>
  13f0eb:	0f 10 84 24 d0 01 00 	movups 0x1d0(%rsp),%xmm0
  13f0f2:	00 
  13f0f3:	0f 10 8c 24 e0 01 00 	movups 0x1e0(%rsp),%xmm1
  13f0fa:	00 
  13f0fb:	0f 10 94 24 f0 01 00 	movups 0x1f0(%rsp),%xmm2
  13f102:	00 
  13f103:	0f 29 94 24 90 00 00 	movaps %xmm2,0x90(%rsp)
  13f10a:	00 
  13f10b:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
  13f112:	00 
  13f113:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
  13f118:	c6 04 24 ff          	movb   $0xff,(%rsp)
  13f11c:	ff 15 86 6a 16 00    	call   *0x166a86(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13f122:	bf 28 00 00 00       	mov    $0x28,%edi
  13f127:	be 01 00 00 00       	mov    $0x1,%esi
  13f12c:	ff 15 7e 6a 16 00    	call   *0x166a7e(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13f132:	48 85 c0             	test   %rax,%rax
  13f135:	0f 84 65 11 00 00    	je     1402a0 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1320>
  13f13b:	0f 10 05 3a cb f5 ff 	movups -0xa34c6(%rip),%xmm0        # 9bc7c <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x178>
  13f142:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13f146:	0f 10 05 1f cb f5 ff 	movups -0xa34e1(%rip),%xmm0        # 9bc6c <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x168>
  13f14d:	0f 11 00             	movups %xmm0,(%rax)
  13f150:	48 b9 6c 75 65 20 73 	movabs $0x6e6769732065756c,%rcx
  13f157:	69 67 6e 
  13f15a:	48 89 48 20          	mov    %rcx,0x20(%rax)
  13f15e:	41 c6 86 a9 00 00 00 	movb   $0x7,0xa9(%r14)
  13f165:	07 
  13f166:	0f 28 44 24 70       	movaps 0x70(%rsp),%xmm0
  13f16b:	0f 28 8c 24 80 00 00 	movaps 0x80(%rsp),%xmm1
  13f172:	00 
  13f173:	0f 28 94 24 90 00 00 	movaps 0x90(%rsp),%xmm2
  13f17a:	00 
  13f17b:	41 0f 11 46 18       	movups %xmm0,0x18(%r14)
  13f180:	41 0f 11 4e 28       	movups %xmm1,0x28(%r14)
  13f185:	41 0f 11 56 38       	movups %xmm2,0x38(%r14)
  13f18a:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  13f18f:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  13f196:	00 
  13f197:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  13f19c:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  13f1a3:	00 
  13f1a4:	0f 10 04 24          	movups (%rsp),%xmm0
  13f1a8:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13f1ad:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13f1b2:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  13f1b7:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  13f1bc:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  13f1c1:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  13f1c6:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  13f1cb:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  13f1d2:	fe 
  13f1d3:	49 c7 06 28 00 00 00 	movq   $0x28,(%r14)
  13f1da:	49 89 46 08          	mov    %rax,0x8(%r14)
  13f1de:	49 c7 46 10 28 00 00 	movq   $0x28,0x10(%r14)
  13f1e5:	00 
  13f1e6:	e9 1f 0a 00 00       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13f1eb:	c6 04 24 ff          	movb   $0xff,(%rsp)
  13f1ef:	ff 15 b3 69 16 00    	call   *0x1669b3(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13f1f5:	bf 37 00 00 00       	mov    $0x37,%edi
  13f1fa:	be 01 00 00 00       	mov    $0x1,%esi
  13f1ff:	ff 15 ab 69 16 00    	call   *0x1669ab(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13f205:	48 85 c0             	test   %rax,%rax
  13f208:	0f 84 6e 10 00 00    	je     14027c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x12fc>
  13f20e:	0f 10 05 d7 ca f5 ff 	movups -0xa3529(%rip),%xmm0        # 9bcec <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x1e8>
  13f215:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  13f219:	0f 10 05 bc ca f5 ff 	movups -0xa3544(%rip),%xmm0        # 9bcdc <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x1d8>
  13f220:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13f224:	0f 10 05 a1 ca f5 ff 	movups -0xa355f(%rip),%xmm0        # 9bccc <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x1c8>
  13f22b:	0f 11 00             	movups %xmm0,(%rax)
  13f22e:	48 b9 66 66 69 63 69 	movabs $0x746e656963696666,%rcx
  13f235:	65 6e 74 
  13f238:	48 89 48 2f          	mov    %rcx,0x2f(%rax)
  13f23c:	41 c6 86 a9 00 00 00 	movb   $0x6,0xa9(%r14)
  13f243:	06 
  13f244:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  13f249:	0f 10 04 24          	movups (%rsp),%xmm0
  13f24d:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13f252:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13f257:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  13f25c:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  13f261:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  13f266:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  13f26b:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  13f270:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  13f275:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  13f27c:	00 
  13f27d:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  13f282:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  13f289:	00 
  13f28a:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  13f291:	fe 
  13f292:	49 c7 06 37 00 00 00 	movq   $0x37,(%r14)
  13f299:	49 89 46 08          	mov    %rax,0x8(%r14)
  13f29d:	49 c7 46 10 37 00 00 	movq   $0x37,0x10(%r14)
  13f2a4:	00 
  13f2a5:	e9 60 09 00 00       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13f2aa:	48 8b 84 24 e0 01 00 	mov    0x1e0(%rsp),%rax
  13f2b1:	00 
  13f2b2:	31 db                	xor    %ebx,%ebx
  13f2b4:	80 78 64 01          	cmpb   $0x1,0x64(%rax)
  13f2b8:	0f 95 c0             	setne  %al
  13f2bb:	19 db                	sbb    %ebx,%ebx
  13f2bd:	08 c3                	or     %al,%bl
  13f2bf:	40 84 ed             	test   %bpl,%bpl
  13f2c2:	0f 10 84 24 d0 01 00 	movups 0x1d0(%rsp),%xmm0
  13f2c9:	00 
  13f2ca:	0f 10 8c 24 e0 01 00 	movups 0x1e0(%rsp),%xmm1
  13f2d1:	00 
  13f2d2:	0f 10 94 24 f0 01 00 	movups 0x1f0(%rsp),%xmm2
  13f2d9:	00 
  13f2da:	41 0f 11 56 38       	movups %xmm2,0x38(%r14)
  13f2df:	41 0f 11 4e 28       	movups %xmm1,0x28(%r14)
  13f2e4:	41 0f 11 46 18       	movups %xmm0,0x18(%r14)
  13f2e9:	41 0f 95 86 a9 00 00 	setne  0xa9(%r14)
  13f2f0:	00 
  13f2f1:	41 c6 46 48 ff       	movb   $0xff,0x48(%r14)
  13f2f6:	41 88 9e a8 00 00 00 	mov    %bl,0xa8(%r14)
  13f2fd:	49 c7 06 ff ff ff ff 	movq   $0xffffffffffffffff,(%r14)
  13f304:	e9 01 09 00 00       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13f309:	b9 01 00 00 00       	mov    $0x1,%ecx
  13f30e:	4c 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%r14
  13f315:	00 
  13f316:	8b 5c 24 64          	mov    0x64(%rsp),%ebx
  13f31a:	48 8b 6c 24 68       	mov    0x68(%rsp),%rbp
  13f31f:	48 8b b4 24 30 02 00 	mov    0x230(%rsp),%rsi
  13f326:	00 
  13f327:	80 be 98 00 00 00 ff 	cmpb   $0xff,0x98(%rsi)
  13f32e:	0f 85 57 fd ff ff    	jne    13f08b <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x10b>
  13f334:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
  13f339:	89 5c 24 64          	mov    %ebx,0x64(%rsp)
  13f33d:	48 89 f3             	mov    %rsi,%rbx
  13f340:	48 83 c6 38          	add    $0x38,%rsi
  13f344:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13f349:	e8 52 29 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f34e:	48 83 c3 68          	add    $0x68,%rbx
  13f352:	48 89 e7             	mov    %rsp,%rdi
  13f355:	48 89 de             	mov    %rbx,%rsi
  13f358:	e8 43 29 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f35d:	4c 89 b4 24 d0 00 00 	mov    %r14,0xd0(%rsp)
  13f364:	00 
  13f365:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13f36a:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  13f371:	00 
  13f372:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  13f379:	00 
  13f37a:	0f 29 94 24 90 01 00 	movaps %xmm2,0x190(%rsp)
  13f381:	00 
  13f382:	0f 29 8c 24 80 01 00 	movaps %xmm1,0x180(%rsp)
  13f389:	00 
  13f38a:	0f 29 84 24 70 01 00 	movaps %xmm0,0x170(%rsp)
  13f391:	00 
  13f392:	0f 10 04 24          	movups (%rsp),%xmm0
  13f396:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13f39b:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13f3a0:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  13f3a7:	00 
  13f3a8:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  13f3af:	00 
  13f3b0:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  13f3b7:	00 
  13f3b8:	0f b6 84 24 a0 01 00 	movzbl 0x1a0(%rsp),%eax
  13f3bf:	00 
  13f3c0:	0a 84 24 70 01 00 00 	or     0x170(%rsp),%al
  13f3c7:	75 33                	jne    13f3fc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x47c>
  13f3c9:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  13f3d0:	00 
  13f3d1:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13f3d8:	00 
  13f3d9:	ff 15 51 68 16 00    	call   *0x166851(%rip)        # 2a5c30 <_DYNAMIC+0x320>
  13f3df:	84 c0                	test   %al,%al
  13f3e1:	7f 19                	jg     13f3fc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x47c>
  13f3e3:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  13f3e8:	48 c1 e0 04          	shl    $0x4,%rax
  13f3ec:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
  13f3f0:	42 80 7c 25 d0 00    	cmpb   $0x0,-0x30(%rbp,%r12,1)
  13f3f6:	0f 84 9d 08 00 00    	je     13fc99 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xd19>
  13f3fc:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
  13f401:	49 c1 e7 04          	shl    $0x4,%r15
  13f405:	4f 8d 34 7f          	lea    (%r15,%r15,2),%r14
  13f409:	49 8d 1c 2e          	lea    (%r14,%rbp,1),%rbx
  13f40d:	48 83 c3 d0          	add    $0xffffffffffffffd0,%rbx
  13f411:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13f416:	48 89 de             	mov    %rbx,%rsi
  13f419:	e8 82 28 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f41e:	48 89 6c 24 68       	mov    %rbp,0x68(%rsp)
  13f423:	48 89 e7             	mov    %rsp,%rdi
  13f426:	48 89 de             	mov    %rbx,%rsi
  13f429:	e8 72 28 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f42e:	4b 8d 04 7f          	lea    (%r15,%r15,2),%rax
  13f432:	48 83 c0 d0          	add    $0xffffffffffffffd0,%rax
  13f436:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13f43b:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  13f442:	00 
  13f443:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  13f44a:	00 
  13f44b:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  13f452:	00 
  13f453:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  13f45a:	00 
  13f45b:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  13f462:	00 
  13f463:	0f 10 04 24          	movups (%rsp),%xmm0
  13f467:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13f46c:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13f471:	0f 29 84 24 10 01 00 	movaps %xmm0,0x110(%rsp)
  13f478:	00 
  13f479:	0f 29 8c 24 20 01 00 	movaps %xmm1,0x120(%rsp)
  13f480:	00 
  13f481:	0f 29 94 24 30 01 00 	movaps %xmm2,0x130(%rsp)
  13f488:	00 
  13f489:	48 85 c0             	test   %rax,%rax
  13f48c:	0f 84 b4 02 00 00    	je     13f746 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x7c6>
  13f492:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
  13f497:	48 83 44 24 68 a0    	addq   $0xffffffffffffffa0,0x68(%rsp)
  13f49d:	0f b6 44 24 64       	movzbl 0x64(%rsp),%eax
  13f4a2:	89 84 24 d8 00 00 00 	mov    %eax,0xd8(%rsp)
  13f4a9:	49 89 e4             	mov    %rsp,%r12
  13f4ac:	48 8d 9c 24 40 01 00 	lea    0x140(%rsp),%rbx
  13f4b3:	00 
  13f4b4:	4c 8d bc 24 58 02 00 	lea    0x258(%rsp),%r15
  13f4bb:	00 
  13f4bc:	0f 1f 40 00          	nopl   0x0(%rax)
  13f4c0:	4c 89 e7             	mov    %r12,%rdi
  13f4c3:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
  13f4ca:	00 
  13f4cb:	48 8d 94 24 70 01 00 	lea    0x170(%rsp),%rdx
  13f4d2:	00 
  13f4d3:	8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%ecx
  13f4da:	e8 c1 91 ff ff       	call   1386a0 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic12interval_mul>
  13f4df:	80 3c 24 ff          	cmpb   $0xff,(%rsp)
  13f4e3:	0f 84 ff 04 00 00    	je     13f9e8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xa68>
  13f4e9:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  13f4ee:	4a 8d 2c 30          	lea    (%rax,%r14,1),%rbp
  13f4f2:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  13f4f7:	0f 29 84 24 c0 00 00 	movaps %xmm0,0xc0(%rsp)
  13f4fe:	00 
  13f4ff:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  13f504:	0f 29 84 24 b0 00 00 	movaps %xmm0,0xb0(%rsp)
  13f50b:	00 
  13f50c:	0f 10 04 24          	movups (%rsp),%xmm0
  13f510:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13f515:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13f51a:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  13f51f:	0f 29 9c 24 a0 00 00 	movaps %xmm3,0xa0(%rsp)
  13f526:	00 
  13f527:	0f 29 94 24 90 00 00 	movaps %xmm2,0x90(%rsp)
  13f52e:	00 
  13f52f:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
  13f536:	00 
  13f537:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
  13f53c:	48 89 df             	mov    %rbx,%rdi
  13f53f:	48 89 ee             	mov    %rbp,%rsi
  13f542:	e8 59 27 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f547:	4c 89 ff             	mov    %r15,%rdi
  13f54a:	48 89 ee             	mov    %rbp,%rsi
  13f54d:	e8 4e 27 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f552:	0f 10 84 24 40 01 00 	movups 0x140(%rsp),%xmm0
  13f559:	00 
  13f55a:	0f 10 8c 24 50 01 00 	movups 0x150(%rsp),%xmm1
  13f561:	00 
  13f562:	0f 10 94 24 60 01 00 	movups 0x160(%rsp),%xmm2
  13f569:	00 
  13f56a:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  13f56f:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  13f574:	0f 29 04 24          	movaps %xmm0,(%rsp)
  13f578:	0f 10 84 24 58 02 00 	movups 0x258(%rsp),%xmm0
  13f57f:	00 
  13f580:	0f 10 8c 24 68 02 00 	movups 0x268(%rsp),%xmm1
  13f587:	00 
  13f588:	0f 10 94 24 78 02 00 	movups 0x278(%rsp),%xmm2
  13f58f:	00 
  13f590:	41 0f 11 55 20       	movups %xmm2,0x20(%r13)
  13f595:	41 0f 11 4d 10       	movups %xmm1,0x10(%r13)
  13f59a:	41 0f 11 45 00       	movups %xmm0,0x0(%r13)
  13f59f:	0f 28 44 24 70       	movaps 0x70(%rsp),%xmm0
  13f5a4:	0f 28 8c 24 80 00 00 	movaps 0x80(%rsp),%xmm1
  13f5ab:	00 
  13f5ac:	0f 28 94 24 90 00 00 	movaps 0x90(%rsp),%xmm2
  13f5b3:	00 
  13f5b4:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  13f5bb:	00 
  13f5bc:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  13f5c3:	00 
  13f5c4:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  13f5cb:	00 
  13f5cc:	4c 89 ff             	mov    %r15,%rdi
  13f5cf:	4c 89 e6             	mov    %r12,%rsi
  13f5d2:	e8 c9 26 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f5d7:	48 8d bc 24 88 02 00 	lea    0x288(%rsp),%rdi
  13f5de:	00 
  13f5df:	48 89 de             	mov    %rbx,%rsi
  13f5e2:	4c 89 fa             	mov    %r15,%rdx
  13f5e5:	e8 96 a7 fd ff       	call   119d80 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs23PzJKl0dyV_10hypersolve>
  13f5ea:	4c 89 ff             	mov    %r15,%rdi
  13f5ed:	e8 4e 95 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  13f5f2:	48 89 df             	mov    %rbx,%rdi
  13f5f5:	e8 46 95 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  13f5fa:	48 8d 84 24 a0 00 00 	lea    0xa0(%rsp),%rax
  13f601:	00 
  13f602:	0f 10 00             	movups (%rax),%xmm0
  13f605:	0f 10 48 10          	movups 0x10(%rax),%xmm1
  13f609:	0f 10 50 20          	movups 0x20(%rax),%xmm2
  13f60d:	0f 29 94 24 60 01 00 	movaps %xmm2,0x160(%rsp)
  13f614:	00 
  13f615:	0f 29 8c 24 50 01 00 	movaps %xmm1,0x150(%rsp)
  13f61c:	00 
  13f61d:	0f 29 84 24 40 01 00 	movaps %xmm0,0x140(%rsp)
  13f624:	00 
  13f625:	4c 89 ff             	mov    %r15,%rdi
  13f628:	4c 89 ee             	mov    %r13,%rsi
  13f62b:	e8 70 26 00 00       	call   141ca0 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.212092998455620395>
  13f630:	48 8d bc 24 b8 02 00 	lea    0x2b8(%rsp),%rdi
  13f637:	00 
  13f638:	48 89 de             	mov    %rbx,%rsi
  13f63b:	4c 89 fa             	mov    %r15,%rdx
  13f63e:	e8 3d a7 fd ff       	call   119d80 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs23PzJKl0dyV_10hypersolve>
  13f643:	4c 89 ff             	mov    %r15,%rdi
  13f646:	e8 f5 94 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  13f64b:	48 89 df             	mov    %rbx,%rdi
  13f64e:	e8 ed 94 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  13f653:	0f 10 84 24 88 02 00 	movups 0x288(%rsp),%xmm0
  13f65a:	00 
  13f65b:	0f 10 8c 24 98 02 00 	movups 0x298(%rsp),%xmm1
  13f662:	00 
  13f663:	0f 10 94 24 a8 02 00 	movups 0x2a8(%rsp),%xmm2
  13f66a:	00 
  13f66b:	0f 29 84 24 d0 01 00 	movaps %xmm0,0x1d0(%rsp)
  13f672:	00 
  13f673:	0f 29 8c 24 e0 01 00 	movaps %xmm1,0x1e0(%rsp)
  13f67a:	00 
  13f67b:	0f 29 94 24 f0 01 00 	movaps %xmm2,0x1f0(%rsp)
  13f682:	00 
  13f683:	0f 10 84 24 b8 02 00 	movups 0x2b8(%rsp),%xmm0
  13f68a:	00 
  13f68b:	0f 10 8c 24 c8 02 00 	movups 0x2c8(%rsp),%xmm1
  13f692:	00 
  13f693:	0f 10 94 24 d8 02 00 	movups 0x2d8(%rsp),%xmm2
  13f69a:	00 
  13f69b:	48 8d 84 24 00 02 00 	lea    0x200(%rsp),%rax
  13f6a2:	00 
  13f6a3:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  13f6a7:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  13f6ab:	0f 11 00             	movups %xmm0,(%rax)
  13f6ae:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  13f6b5:	00 
  13f6b6:	e8 e5 78 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f6bb:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  13f6c2:	00 
  13f6c3:	e8 d8 78 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f6c8:	0f 28 84 24 20 02 00 	movaps 0x220(%rsp),%xmm0
  13f6cf:	00 
  13f6d0:	0f 29 84 24 30 01 00 	movaps %xmm0,0x130(%rsp)
  13f6d7:	00 
  13f6d8:	0f 28 84 24 10 02 00 	movaps 0x210(%rsp),%xmm0
  13f6df:	00 
  13f6e0:	0f 29 84 24 20 01 00 	movaps %xmm0,0x120(%rsp)
  13f6e7:	00 
  13f6e8:	0f 28 84 24 d0 01 00 	movaps 0x1d0(%rsp),%xmm0
  13f6ef:	00 
  13f6f0:	0f 28 8c 24 e0 01 00 	movaps 0x1e0(%rsp),%xmm1
  13f6f7:	00 
  13f6f8:	0f 28 94 24 f0 01 00 	movaps 0x1f0(%rsp),%xmm2
  13f6ff:	00 
  13f700:	0f 28 9c 24 00 02 00 	movaps 0x200(%rsp),%xmm3
  13f707:	00 
  13f708:	0f 29 9c 24 10 01 00 	movaps %xmm3,0x110(%rsp)
  13f70f:	00 
  13f710:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  13f717:	00 
  13f718:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  13f71f:	00 
  13f720:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  13f727:	00 
  13f728:	4c 89 e7             	mov    %r12,%rdi
  13f72b:	e8 70 78 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f730:	4c 89 ef             	mov    %r13,%rdi
  13f733:	e8 68 78 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f738:	49 83 c6 d0          	add    $0xffffffffffffffd0,%r14
  13f73c:	49 83 fe 30          	cmp    $0x30,%r14
  13f740:	0f 85 7a fd ff ff    	jne    13f4c0 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x540>
  13f746:	0f b6 84 24 e0 00 00 	movzbl 0xe0(%rsp),%eax
  13f74d:	00 
  13f74e:	48 8b 8c 24 e1 00 00 	mov    0xe1(%rsp),%rcx
  13f755:	00 
  13f756:	48 89 8c 24 48 02 00 	mov    %rcx,0x248(%rsp)
  13f75d:	00 
  13f75e:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  13f765:	00 
  13f766:	48 89 8c 24 4f 02 00 	mov    %rcx,0x24f(%rsp)
  13f76d:	00 
  13f76e:	4c 8b bc 24 f0 00 00 	mov    0xf0(%rsp),%r15
  13f775:	00 
  13f776:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  13f77d:	00 
  13f77e:	0f 28 84 24 00 01 00 	movaps 0x100(%rsp),%xmm0
  13f785:	00 
  13f786:	0f b6 94 24 10 01 00 	movzbl 0x110(%rsp),%edx
  13f78d:	00 
  13f78e:	48 8b b4 24 11 01 00 	mov    0x111(%rsp),%rsi
  13f795:	00 
  13f796:	48 89 b4 24 38 02 00 	mov    %rsi,0x238(%rsp)
  13f79d:	00 
  13f79e:	48 8b b4 24 18 01 00 	mov    0x118(%rsp),%rsi
  13f7a5:	00 
  13f7a6:	48 89 b4 24 3f 02 00 	mov    %rsi,0x23f(%rsp)
  13f7ad:	00 
  13f7ae:	3c ff                	cmp    $0xff,%al
  13f7b0:	0f 84 4c 02 00 00    	je     13fa02 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xa82>
  13f7b6:	48 8b 9c 24 20 01 00 	mov    0x120(%rsp),%rbx
  13f7bd:	00 
  13f7be:	48 8b b4 24 28 01 00 	mov    0x128(%rsp),%rsi
  13f7c5:	00 
  13f7c6:	0f 28 8c 24 30 01 00 	movaps 0x130(%rsp),%xmm1
  13f7cd:	00 
  13f7ce:	88 44 24 70          	mov    %al,0x70(%rsp)
  13f7d2:	48 8b 84 24 48 02 00 	mov    0x248(%rsp),%rax
  13f7d9:	00 
  13f7da:	48 8b bc 24 4f 02 00 	mov    0x24f(%rsp),%rdi
  13f7e1:	00 
  13f7e2:	48 89 44 24 71       	mov    %rax,0x71(%rsp)
  13f7e7:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
  13f7ec:	4c 89 bc 24 80 00 00 	mov    %r15,0x80(%rsp)
  13f7f3:	00 
  13f7f4:	48 89 8c 24 88 00 00 	mov    %rcx,0x88(%rsp)
  13f7fb:	00 
  13f7fc:	0f 11 84 24 90 00 00 	movups %xmm0,0x90(%rsp)
  13f803:	00 
  13f804:	88 94 24 a0 00 00 00 	mov    %dl,0xa0(%rsp)
  13f80b:	48 8b 84 24 38 02 00 	mov    0x238(%rsp),%rax
  13f812:	00 
  13f813:	48 8b 8c 24 3f 02 00 	mov    0x23f(%rsp),%rcx
  13f81a:	00 
  13f81b:	48 89 84 24 a1 00 00 	mov    %rax,0xa1(%rsp)
  13f822:	00 
  13f823:	48 89 8c 24 a8 00 00 	mov    %rcx,0xa8(%rsp)
  13f82a:	00 
  13f82b:	48 89 9c 24 b0 00 00 	mov    %rbx,0xb0(%rsp)
  13f832:	00 
  13f833:	48 89 b4 24 b8 00 00 	mov    %rsi,0xb8(%rsp)
  13f83a:	00 
  13f83b:	0f 11 8c 24 c0 00 00 	movups %xmm1,0xc0(%rsp)
  13f842:	00 
  13f843:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  13f84a:	00 
  13f84b:	e8 50 77 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f850:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  13f857:	00 
  13f858:	e8 43 77 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f85d:	4c 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%r14
  13f864:	00 
  13f865:	8b 5c 24 64          	mov    0x64(%rsp),%ebx
  13f869:	48 89 e7             	mov    %rsp,%rdi
  13f86c:	ff 15 46 63 16 00    	call   *0x166346(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  13f872:	0f b6 eb             	movzbl %bl,%ebp
  13f875:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  13f87a:	48 89 e6             	mov    %rsp,%rsi
  13f87d:	89 ea                	mov    %ebp,%edx
  13f87f:	e8 dc 12 00 00       	call   140b60 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.212092998455620395>
  13f884:	89 c3                	mov    %eax,%ebx
  13f886:	80 fb fe             	cmp    $0xfe,%bl
  13f889:	0f 85 4b 02 00 00    	jne    13fada <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xb5a>
  13f88f:	48 89 e7             	mov    %rsp,%rdi
  13f892:	e8 09 77 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f897:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  13f89e:	00 
  13f89f:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  13f8a4:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  13f8ab:	00 
  13f8ac:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  13f8b1:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13f8b6:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  13f8bd:	00 
  13f8be:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  13f8c5:	00 
  13f8c6:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  13f8cd:	00 
  13f8ce:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  13f8d3:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  13f8d8:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  13f8dd:	0f 29 04 24          	movaps %xmm0,(%rsp)
  13f8e1:	ff 15 c1 62 16 00    	call   *0x1662c1(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13f8e7:	bf 33 00 00 00       	mov    $0x33,%edi
  13f8ec:	be 01 00 00 00       	mov    $0x1,%esi
  13f8f1:	ff 15 b9 62 16 00    	call   *0x1662b9(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13f8f7:	48 85 c0             	test   %rax,%rax
  13f8fa:	0f 84 c4 09 00 00    	je     1402c4 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1344>
  13f900:	0f 10 05 1d c3 f5 ff 	movups -0xa3ce3(%rip),%xmm0        # 9bc24 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x120>
  13f907:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  13f90b:	0f 10 05 02 c3 f5 ff 	movups -0xa3cfe(%rip),%xmm0        # 9bc14 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x110>
  13f912:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13f916:	0f 10 05 e7 c2 f5 ff 	movups -0xa3d19(%rip),%xmm0        # 9bc04 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x100>
  13f91d:	e9 75 02 00 00       	jmp    13fb97 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc17>
  13f922:	48 89 e7             	mov    %rsp,%rdi
  13f925:	e8 76 76 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f92a:	c6 04 24 ff          	movb   $0xff,(%rsp)
  13f92e:	ff 15 74 62 16 00    	call   *0x166274(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13f934:	bf 38 00 00 00       	mov    $0x38,%edi
  13f939:	be 01 00 00 00       	mov    $0x1,%esi
  13f93e:	ff 15 6c 62 16 00    	call   *0x16626c(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13f944:	48 85 c0             	test   %rax,%rax
  13f947:	0f 84 65 09 00 00    	je     1402b2 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1332>
  13f94d:	0f 10 05 60 c3 f5 ff 	movups -0xa3ca0(%rip),%xmm0        # 9bcb4 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x1b0>
  13f954:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  13f958:	0f 10 05 45 c3 f5 ff 	movups -0xa3cbb(%rip),%xmm0        # 9bca4 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x1a0>
  13f95f:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13f963:	0f 10 05 2a c3 f5 ff 	movups -0xa3cd6(%rip),%xmm0        # 9bc94 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x190>
  13f96a:	0f 11 00             	movups %xmm0,(%rax)
  13f96d:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  13f974:	74 6c 79 
  13f977:	48 89 48 30          	mov    %rcx,0x30(%rax)
  13f97b:	48 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%rcx
  13f982:	00 
  13f983:	c6 81 a9 00 00 00 07 	movb   $0x7,0xa9(%rcx)
  13f98a:	c6 41 18 ff          	movb   $0xff,0x18(%rcx)
  13f98e:	0f 10 04 24          	movups (%rsp),%xmm0
  13f992:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13f997:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13f99c:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  13f9a1:	0f 11 41 48          	movups %xmm0,0x48(%rcx)
  13f9a5:	0f 11 49 58          	movups %xmm1,0x58(%rcx)
  13f9a9:	0f 11 51 68          	movups %xmm2,0x68(%rcx)
  13f9ad:	0f 11 59 78          	movups %xmm3,0x78(%rcx)
  13f9b1:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  13f9b6:	0f 11 81 88 00 00 00 	movups %xmm0,0x88(%rcx)
  13f9bd:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  13f9c2:	0f 11 81 98 00 00 00 	movups %xmm0,0x98(%rcx)
  13f9c9:	c6 81 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rcx)
  13f9d0:	48 c7 01 38 00 00 00 	movq   $0x38,(%rcx)
  13f9d7:	48 89 41 08          	mov    %rax,0x8(%rcx)
  13f9db:	48 c7 41 10 38 00 00 	movq   $0x38,0x10(%rcx)
  13f9e2:	00 
  13f9e3:	e9 22 02 00 00       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13f9e8:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  13f9ef:	00 
  13f9f0:	e8 ab 75 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13f9f5:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  13f9fc:	00 
  13f9fd:	e8 9e 75 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13fa02:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  13fa09:	00 
  13fa0a:	e8 91 75 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13fa0f:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  13fa16:	00 
  13fa17:	e8 84 75 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13fa1c:	c6 04 24 ff          	movb   $0xff,(%rsp)
  13fa20:	ff 15 82 61 16 00    	call   *0x166182(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13fa26:	bf 35 00 00 00       	mov    $0x35,%edi
  13fa2b:	be 01 00 00 00       	mov    $0x1,%esi
  13fa30:	ff 15 7a 61 16 00    	call   *0x16617a(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13fa36:	48 85 c0             	test   %rax,%rax
  13fa39:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
  13fa40:	00 
  13fa41:	0f 84 47 08 00 00    	je     14028e <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x130e>
  13fa47:	0f 10 05 09 c2 f5 ff 	movups -0xa3df7(%rip),%xmm0        # 9bc57 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x153>
  13fa4e:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  13fa52:	0f 10 05 ee c1 f5 ff 	movups -0xa3e12(%rip),%xmm0        # 9bc47 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x143>
  13fa59:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13fa5d:	0f 10 05 d3 c1 f5 ff 	movups -0xa3e2d(%rip),%xmm0        # 9bc37 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0x133>
  13fa64:	0f 11 00             	movups %xmm0,(%rax)
  13fa67:	48 b9 20 65 78 61 63 	movabs $0x796c746361786520,%rcx
  13fa6e:	74 6c 79 
  13fa71:	48 89 48 2d          	mov    %rcx,0x2d(%rax)
  13fa75:	c6 82 a9 00 00 00 07 	movb   $0x7,0xa9(%rdx)
  13fa7c:	c6 42 18 ff          	movb   $0xff,0x18(%rdx)
  13fa80:	0f 10 04 24          	movups (%rsp),%xmm0
  13fa84:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13fa89:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  13fa8e:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
  13fa93:	0f 11 42 48          	movups %xmm0,0x48(%rdx)
  13fa97:	0f 11 4a 58          	movups %xmm1,0x58(%rdx)
  13fa9b:	0f 11 52 68          	movups %xmm2,0x68(%rdx)
  13fa9f:	0f 11 5a 78          	movups %xmm3,0x78(%rdx)
  13faa3:	0f 10 44 24 40       	movups 0x40(%rsp),%xmm0
  13faa8:	0f 11 82 88 00 00 00 	movups %xmm0,0x88(%rdx)
  13faaf:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  13fab4:	0f 11 82 98 00 00 00 	movups %xmm0,0x98(%rdx)
  13fabb:	c6 82 a8 00 00 00 fe 	movb   $0xfe,0xa8(%rdx)
  13fac2:	48 c7 02 35 00 00 00 	movq   $0x35,(%rdx)
  13fac9:	48 89 42 08          	mov    %rax,0x8(%rdx)
  13facd:	48 c7 42 10 35 00 00 	movq   $0x35,0x10(%rdx)
  13fad4:	00 
  13fad5:	e9 30 01 00 00       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13fada:	48 89 e7             	mov    %rsp,%rdi
  13fadd:	e8 be 74 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13fae2:	48 89 e7             	mov    %rsp,%rdi
  13fae5:	ff 15 cd 60 16 00    	call   *0x1660cd(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  13faeb:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  13faf2:	00 
  13faf3:	48 89 e6             	mov    %rsp,%rsi
  13faf6:	89 ea                	mov    %ebp,%edx
  13faf8:	e8 63 10 00 00       	call   140b60 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.212092998455620395>
  13fafd:	89 c5                	mov    %eax,%ebp
  13faff:	40 80 fd fe          	cmp    $0xfe,%bpl
  13fb03:	0f 85 13 01 00 00    	jne    13fc1c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc9c>
  13fb09:	48 89 e7             	mov    %rsp,%rdi
  13fb0c:	e8 8f 74 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13fb11:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  13fb18:	00 
  13fb19:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  13fb1e:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  13fb25:	00 
  13fb26:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  13fb2b:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13fb30:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  13fb37:	00 
  13fb38:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  13fb3f:	00 
  13fb40:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  13fb47:	00 
  13fb48:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  13fb4d:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  13fb52:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  13fb57:	0f 29 04 24          	movaps %xmm0,(%rsp)
  13fb5b:	ff 15 47 60 16 00    	call   *0x166047(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13fb61:	bf 33 00 00 00       	mov    $0x33,%edi
  13fb66:	be 01 00 00 00       	mov    $0x1,%esi
  13fb6b:	ff 15 3f 60 16 00    	call   *0x16603f(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13fb71:	48 85 c0             	test   %rax,%rax
  13fb74:	0f 84 5c 07 00 00    	je     1402d6 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1356>
  13fb7a:	0f 10 05 70 c0 f5 ff 	movups -0xa3f90(%rip),%xmm0        # 9bbf1 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0xed>
  13fb81:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  13fb85:	0f 10 05 55 c0 f5 ff 	movups -0xa3fab(%rip),%xmm0        # 9bbe1 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0xdd>
  13fb8c:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13fb90:	0f 10 05 3a c0 f5 ff 	movups -0xa3fc6(%rip),%xmm0        # 9bbd1 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0xcd>
  13fb97:	0f 11 00             	movups %xmm0,(%rax)
  13fb9a:	c7 40 2f 7a 65 72 6f 	movl   $0x6f72657a,0x2f(%rax)
  13fba1:	41 c6 86 a9 00 00 00 	movb   $0x7,0xa9(%r14)
  13fba8:	07 
  13fba9:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  13fbae:	0f 28 04 24          	movaps (%rsp),%xmm0
  13fbb2:	0f 28 4c 24 10       	movaps 0x10(%rsp),%xmm1
  13fbb7:	0f 28 54 24 20       	movaps 0x20(%rsp),%xmm2
  13fbbc:	0f 28 5c 24 30       	movaps 0x30(%rsp),%xmm3
  13fbc1:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  13fbc6:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  13fbcb:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  13fbd0:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  13fbd5:	0f 28 44 24 40       	movaps 0x40(%rsp),%xmm0
  13fbda:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  13fbe1:	00 
  13fbe2:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  13fbe7:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  13fbee:	00 
  13fbef:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  13fbf6:	fe 
  13fbf7:	49 c7 06 33 00 00 00 	movq   $0x33,(%r14)
  13fbfe:	49 89 46 08          	mov    %rax,0x8(%r14)
  13fc02:	49 c7 46 10 33 00 00 	movq   $0x33,0x10(%r14)
  13fc09:	00 
  13fc0a:	48 81 c4 e8 02 00 00 	add    $0x2e8,%rsp
  13fc11:	5b                   	pop    %rbx
  13fc12:	41 5c                	pop    %r12
  13fc14:	41 5d                	pop    %r13
  13fc16:	41 5e                	pop    %r14
  13fc18:	41 5f                	pop    %r15
  13fc1a:	5d                   	pop    %rbp
  13fc1b:	c3                   	ret
  13fc1c:	48 89 e7             	mov    %rsp,%rdi
  13fc1f:	e8 7c 73 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  13fc24:	80 fb 01             	cmp    $0x1,%bl
  13fc27:	0f 85 b9 00 00 00    	jne    13fce6 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xd66>
  13fc2d:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  13fc34:	00 
  13fc35:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  13fc3c:	00 
  13fc3d:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  13fc44:	00 
  13fc45:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  13fc4c:	00 
  13fc4d:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13fc52:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  13fc59:	00 
  13fc5a:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  13fc61:	00 
  13fc62:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  13fc69:	00 
  13fc6a:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  13fc6f:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  13fc74:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  13fc79:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  13fc7e:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  13fc83:	66 41 c7 86 a8 00 00 	movw   $0x201,0xa8(%r14)
  13fc8a:	00 01 02 
  13fc8d:	49 c7 06 ff ff ff ff 	movq   $0xffffffffffffffff,(%r14)
  13fc94:	e9 71 ff ff ff       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13fc99:	4a 8b 44 25 e0       	mov    -0x20(%rbp,%r12,1),%rax
  13fc9e:	f0 48 ff 00          	lock incq (%rax)
  13fca2:	0f 8e 50 06 00 00    	jle    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  13fca8:	4e 8b 7c 25 e0       	mov    -0x20(%rbp,%r12,1),%r15
  13fcad:	f0 49 ff 07          	lock incq (%r15)
  13fcb1:	0f 8e 41 06 00 00    	jle    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  13fcb7:	4c 89 3c 24          	mov    %r15,(%rsp)
  13fcbb:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
  13fcc0:	48 83 7c 24 68 01    	cmpq   $0x1,0x68(%rsp)
  13fcc6:	0f 85 1b 01 00 00    	jne    13fde7 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xe67>
  13fccc:	4c 89 fb             	mov    %r15,%rbx
  13fccf:	0f 28 05 fa 4b f5 ff 	movaps -0xab406(%rip),%xmm0        # 948d0 <GCC_except_table0+0x414>
  13fcd6:	31 c0                	xor    %eax,%eax
  13fcd8:	31 c9                	xor    %ecx,%ecx
  13fcda:	31 d2                	xor    %edx,%edx
  13fcdc:	31 f6                	xor    %esi,%esi
  13fcde:	0f 28 c8             	movaps %xmm0,%xmm1
  13fce1:	e9 e8 fa ff ff       	jmp    13f7ce <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x84e>
  13fce6:	40 80 fd ff          	cmp    $0xff,%bpl
  13fcea:	0f 84 e8 04 00 00    	je     1401d8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1258>
  13fcf0:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  13fcf7:	00 
  13fcf8:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
  13fcfd:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  13fd04:	00 
  13fd05:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
  13fd0a:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  13fd0f:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  13fd16:	00 
  13fd17:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  13fd1e:	00 
  13fd1f:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  13fd26:	00 
  13fd27:	0f 29 5c 24 30       	movaps %xmm3,0x30(%rsp)
  13fd2c:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  13fd31:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  13fd36:	0f 29 04 24          	movaps %xmm0,(%rsp)
  13fd3a:	ff 15 68 5e 16 00    	call   *0x165e68(%rip)        # 2a5ba8 <_DYNAMIC+0x298>
  13fd40:	bf 2b 00 00 00       	mov    $0x2b,%edi
  13fd45:	be 01 00 00 00       	mov    $0x1,%esi
  13fd4a:	ff 15 60 5e 16 00    	call   *0x165e60(%rip)        # 2a5bb0 <_DYNAMIC+0x2a0>
  13fd50:	48 85 c0             	test   %rax,%rax
  13fd53:	0f 84 8f 05 00 00    	je     1402e8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1368>
  13fd59:	0f 10 05 61 be f5 ff 	movups -0xa419f(%rip),%xmm0        # 9bbc1 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0xbd>
  13fd60:	0f 11 40 1b          	movups %xmm0,0x1b(%rax)
  13fd64:	0f 10 05 4b be f5 ff 	movups -0xa41b5(%rip),%xmm0        # 9bbb6 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0xb2>
  13fd6b:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  13fd6f:	0f 10 05 30 be f5 ff 	movups -0xa41d0(%rip),%xmm0        # 9bba6 <anon.89bfb806187836e5a95e507ce78f9374.161.llvm.212092998455620395+0xa2>
  13fd76:	0f 11 00             	movups %xmm0,(%rax)
  13fd79:	41 c6 86 a9 00 00 00 	movb   $0x4,0xa9(%r14)
  13fd80:	04 
  13fd81:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  13fd86:	0f 28 04 24          	movaps (%rsp),%xmm0
  13fd8a:	0f 28 4c 24 10       	movaps 0x10(%rsp),%xmm1
  13fd8f:	0f 28 54 24 20       	movaps 0x20(%rsp),%xmm2
  13fd94:	0f 28 5c 24 30       	movaps 0x30(%rsp),%xmm3
  13fd99:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  13fd9e:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  13fda3:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  13fda8:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  13fdad:	0f 28 44 24 40       	movaps 0x40(%rsp),%xmm0
  13fdb2:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  13fdb9:	00 
  13fdba:	0f 28 44 24 50       	movaps 0x50(%rsp),%xmm0
  13fdbf:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  13fdc6:	00 
  13fdc7:	41 c6 86 a8 00 00 00 	movb   $0xfe,0xa8(%r14)
  13fdce:	fe 
  13fdcf:	49 c7 06 2b 00 00 00 	movq   $0x2b,(%r14)
  13fdd6:	49 89 46 08          	mov    %rax,0x8(%r14)
  13fdda:	49 c7 46 10 2b 00 00 	movq   $0x2b,0x10(%r14)
  13fde1:	00 
  13fde2:	e9 23 fe ff ff       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  13fde7:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  13fdeb:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  13fdf2:	00 
  13fdf3:	4c 89 fb             	mov    %r15,%rbx
  13fdf6:	eb 17                	jmp    13fe0f <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xe8f>
  13fdf8:	4c 89 3c 24          	mov    %r15,(%rsp)
  13fdfc:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
  13fe01:	49 83 c4 d0          	add    $0xffffffffffffffd0,%r12
  13fe05:	49 83 fc 30          	cmp    $0x30,%r12
  13fe09:	0f 84 c0 fe ff ff    	je     13fccf <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xd4f>
  13fe0f:	42 80 7c 25 a0 00    	cmpb   $0x0,-0x60(%rbp,%r12,1)
  13fe15:	0f 85 29 04 00 00    	jne    140244 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x12c4>
  13fe1b:	41 80 7f 64 00       	cmpb   $0x0,0x64(%r15)
  13fe20:	74 41                	je     13fe63 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xee3>
  13fe22:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  13fe29:	00 
  13fe2a:	80 78 64 00          	cmpb   $0x0,0x64(%rax)
  13fe2e:	0f 84 80 00 00 00    	je     13feb4 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xf34>
  13fe34:	48 89 e7             	mov    %rsp,%rdi
  13fe37:	48 8d b4 24 80 01 00 	lea    0x180(%rsp),%rsi
  13fe3e:	00 
  13fe3f:	e8 fc 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13fe44:	49 89 c6             	mov    %rax,%r14
  13fe47:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  13fe4c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13fe51:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13fe58:	00 
  13fe59:	e8 e2 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13fe5e:	e9 59 02 00 00       	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  13fe63:	80 7b 64 02          	cmpb   $0x2,0x64(%rbx)
  13fe67:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  13fe6e:	00 
  13fe6f:	0f b6 40 64          	movzbl 0x64(%rax),%eax
  13fe73:	75 7e                	jne    13fef3 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xf73>
  13fe75:	84 c0                	test   %al,%al
  13fe77:	48 8d 9c 24 80 01 00 	lea    0x180(%rsp),%rbx
  13fe7e:	00 
  13fe7f:	0f 84 cf 00 00 00    	je     13ff54 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xfd4>
  13fe85:	48 89 e7             	mov    %rsp,%rdi
  13fe88:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13fe8f:	00 
  13fe90:	e8 ab 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13fe95:	49 89 c6             	mov    %rax,%r14
  13fe98:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  13fe9d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13fea2:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13fea9:	00 
  13feaa:	e8 91 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13feaf:	e9 08 02 00 00       	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  13feb4:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  13febb:	00 
  13febc:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  13fec0:	48 8d b4 24 80 01 00 	lea    0x180(%rsp),%rsi
  13fec7:	00 
  13fec8:	75 63                	jne    13ff2d <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xfad>
  13feca:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13fecf:	e8 6c 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13fed4:	49 89 c6             	mov    %rax,%r14
  13fed7:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  13fedc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13fee1:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13fee8:	00 
  13fee9:	e8 52 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13feee:	e9 c9 01 00 00       	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  13fef3:	84 c0                	test   %al,%al
  13fef5:	48 8d 9c 24 80 01 00 	lea    0x180(%rsp),%rbx
  13fefc:	00 
  13fefd:	0f 84 3f 01 00 00    	je     140042 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x10c2>
  13ff03:	48 89 e7             	mov    %rsp,%rdi
  13ff06:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13ff0d:	00 
  13ff0e:	e8 2d 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff13:	49 89 c6             	mov    %rax,%r14
  13ff16:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  13ff1b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13ff20:	48 89 de             	mov    %rbx,%rsi
  13ff23:	e8 18 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff28:	e9 8f 01 00 00       	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  13ff2d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13ff32:	e8 09 2c ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff37:	49 89 c6             	mov    %rax,%r14
  13ff3a:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  13ff3f:	48 89 e7             	mov    %rsp,%rdi
  13ff42:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13ff49:	00 
  13ff4a:	e8 f1 2b ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff4f:	e9 68 01 00 00       	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  13ff54:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  13ff5b:	00 
  13ff5c:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  13ff60:	0f 85 0f 01 00 00    	jne    140075 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x10f5>
  13ff66:	48 89 e7             	mov    %rsp,%rdi
  13ff69:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13ff70:	00 
  13ff71:	e8 ca 2b ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff76:	48 89 84 24 40 01 00 	mov    %rax,0x140(%rsp)
  13ff7d:	00 
  13ff7e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13ff83:	48 89 de             	mov    %rbx,%rsi
  13ff86:	e8 b5 2b ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff8b:	48 89 84 24 58 02 00 	mov    %rax,0x258(%rsp)
  13ff92:	00 
  13ff93:	48 89 e7             	mov    %rsp,%rdi
  13ff96:	48 89 de             	mov    %rbx,%rsi
  13ff99:	e8 a2 2b ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ff9e:	48 8d 9c 24 40 01 00 	lea    0x140(%rsp),%rbx
  13ffa5:	00 
  13ffa6:	4c 8d b4 24 58 02 00 	lea    0x258(%rsp),%r14
  13ffad:	00 
  13ffae:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  13ffb5:	00 
  13ffb6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  13ffbb:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  13ffc2:	00 
  13ffc3:	e8 78 2b ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  13ffc8:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
  13ffcf:	00 
  13ffd0:	48 89 df             	mov    %rbx,%rdi
  13ffd3:	4c 89 f6             	mov    %r14,%rsi
  13ffd6:	4c 8b 2d 53 5c 16 00 	mov    0x165c53(%rip),%r13        # 2a5c30 <_DYNAMIC+0x320>
  13ffdd:	41 ff d5             	call   *%r13
  13ffe0:	3c fe                	cmp    $0xfe,%al
  13ffe2:	0f 94 c1             	sete   %cl
  13ffe5:	84 c0                	test   %al,%al
  13ffe7:	41 0f 9f c7          	setg   %r15b
  13ffeb:	41 08 cf             	or     %cl,%r15b
  13ffee:	49 0f 45 de          	cmovne %r14,%rbx
  13fff2:	4c 8b 33             	mov    (%rbx),%r14
  13fff5:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
  13fffa:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  140001:	00 
  140002:	48 8d b4 24 d0 01 00 	lea    0x1d0(%rsp),%rsi
  140009:	00 
  14000a:	41 ff d5             	call   *%r13
  14000d:	84 c0                	test   %al,%al
  14000f:	0f 88 50 01 00 00    	js     140165 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x11e5>
  140015:	4c 8b ac 24 e0 00 00 	mov    0xe0(%rsp),%r13
  14001c:	00 
  14001d:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
  140024:	00 
  140025:	f0 48 ff 08          	lock decq (%rax)
  140029:	0f 85 5a 01 00 00    	jne    140189 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1209>
  14002f:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  140036:	00 
  140037:	ff 15 33 5b 16 00    	call   *0x165b33(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  14003d:	e9 47 01 00 00       	jmp    140189 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1209>
  140042:	48 8b 84 24 b0 01 00 	mov    0x1b0(%rsp),%rax
  140049:	00 
  14004a:	80 78 64 02          	cmpb   $0x2,0x64(%rax)
  14004e:	75 47                	jne    140097 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1117>
  140050:	48 89 e7             	mov    %rsp,%rdi
  140053:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  14005a:	00 
  14005b:	e8 e0 2a ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  140060:	49 89 c6             	mov    %rax,%r14
  140063:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  140068:	48 89 e7             	mov    %rsp,%rdi
  14006b:	48 89 de             	mov    %rbx,%rsi
  14006e:	e8 cd 2a ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  140073:	eb 47                	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  140075:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  14007a:	48 89 de             	mov    %rbx,%rsi
  14007d:	e8 be 2a ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  140082:	49 89 c6             	mov    %rax,%r14
  140085:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  14008a:	48 89 e7             	mov    %rsp,%rdi
  14008d:	48 89 de             	mov    %rbx,%rsi
  140090:	e8 ab 2a ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  140095:	eb 25                	jmp    1400bc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113c>
  140097:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  14009c:	48 8d b4 24 b0 01 00 	lea    0x1b0(%rsp),%rsi
  1400a3:	00 
  1400a4:	e8 97 2a ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  1400a9:	49 89 c6             	mov    %rax,%r14
  1400ac:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
  1400b1:	48 89 e7             	mov    %rsp,%rdi
  1400b4:	48 89 de             	mov    %rbx,%rsi
  1400b7:	e8 84 2a ff ff       	call   132b40 <_RNvXs1s_NtNtCs8rd0GMicEM6_9hyperreal8rational10arithmeticRNtB6_8RationalNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs23PzJKl0dyV_10hypersolve>
  1400bc:	49 89 c5             	mov    %rax,%r13
  1400bf:	48 8b 04 24          	mov    (%rsp),%rax
  1400c3:	f0 48 ff 08          	lock decq (%rax)
  1400c7:	75 09                	jne    1400d2 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1152>
  1400c9:	48 89 e7             	mov    %rsp,%rdi
  1400cc:	ff 15 9e 5a 16 00    	call   *0x165a9e(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1400d2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  1400d7:	f0 48 ff 08          	lock decq (%rax)
  1400db:	75 0b                	jne    1400e8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1168>
  1400dd:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  1400e2:	ff 15 88 5a 16 00    	call   *0x165a88(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1400e8:	48 8b 84 24 d8 00 00 	mov    0xd8(%rsp),%rax
  1400ef:	00 
  1400f0:	4a 8d 1c 20          	lea    (%rax,%r12,1),%rbx
  1400f4:	4c 89 34 24          	mov    %r14,(%rsp)
  1400f8:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
  1400fd:	4c 89 ac 24 e0 00 00 	mov    %r13,0xe0(%rsp)
  140104:	00 
  140105:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
  14010a:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  14010f:	48 89 de             	mov    %rbx,%rsi
  140112:	ff 15 20 5b 16 00    	call   *0x165b20(%rip)        # 2a5c38 <_DYNAMIC+0x328>
  140118:	49 89 c7             	mov    %rax,%r15
  14011b:	f0 49 ff 0e          	lock decq (%r14)
  14011f:	75 0b                	jne    14012c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x11ac>
  140121:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140126:	ff 15 44 5a 16 00    	call   *0x165a44(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  14012c:	4c 89 bc 24 d0 01 00 	mov    %r15,0x1d0(%rsp)
  140133:	00 
  140134:	4c 89 6c 24 70       	mov    %r13,0x70(%rsp)
  140139:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  14013e:	48 89 de             	mov    %rbx,%rsi
  140141:	ff 15 f1 5a 16 00    	call   *0x165af1(%rip)        # 2a5c38 <_DYNAMIC+0x328>
  140147:	48 89 c3             	mov    %rax,%rbx
  14014a:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  14014f:	0f 85 a3 fc ff ff    	jne    13fdf8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xe78>
  140155:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  14015a:	ff 15 10 5a 16 00    	call   *0x165a10(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140160:	e9 93 fc ff ff       	jmp    13fdf8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xe78>
  140165:	4c 8b ac 24 d0 01 00 	mov    0x1d0(%rsp),%r13
  14016c:	00 
  14016d:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  140174:	00 
  140175:	f0 48 ff 08          	lock decq (%rax)
  140179:	75 0e                	jne    140189 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1209>
  14017b:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  140182:	00 
  140183:	ff 15 e7 59 16 00    	call   *0x1659e7(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140189:	45 84 ff             	test   %r15b,%r15b
  14018c:	74 25                	je     1401b3 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1233>
  14018e:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  140195:	00 
  140196:	f0 48 ff 08          	lock decq (%rax)
  14019a:	0f 85 1f ff ff ff    	jne    1400bf <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113f>
  1401a0:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  1401a7:	00 
  1401a8:	ff 15 c2 59 16 00    	call   *0x1659c2(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1401ae:	e9 0c ff ff ff       	jmp    1400bf <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113f>
  1401b3:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
  1401ba:	00 
  1401bb:	f0 48 ff 08          	lock decq (%rax)
  1401bf:	0f 85 fa fe ff ff    	jne    1400bf <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113f>
  1401c5:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  1401cc:	00 
  1401cd:	ff 15 9d 59 16 00    	call   *0x16599d(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1401d3:	e9 e7 fe ff ff       	jmp    1400bf <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x113f>
  1401d8:	0f 10 84 24 c0 00 00 	movups 0xc0(%rsp),%xmm0
  1401df:	00 
  1401e0:	41 0f 11 86 98 00 00 	movups %xmm0,0x98(%r14)
  1401e7:	00 
  1401e8:	0f 10 84 24 b0 00 00 	movups 0xb0(%rsp),%xmm0
  1401ef:	00 
  1401f0:	41 0f 11 86 88 00 00 	movups %xmm0,0x88(%r14)
  1401f7:	00 
  1401f8:	0f 10 44 24 70       	movups 0x70(%rsp),%xmm0
  1401fd:	0f 10 8c 24 80 00 00 	movups 0x80(%rsp),%xmm1
  140204:	00 
  140205:	0f 10 94 24 90 00 00 	movups 0x90(%rsp),%xmm2
  14020c:	00 
  14020d:	0f 10 9c 24 a0 00 00 	movups 0xa0(%rsp),%xmm3
  140214:	00 
  140215:	41 0f 11 5e 78       	movups %xmm3,0x78(%r14)
  14021a:	41 0f 11 56 68       	movups %xmm2,0x68(%r14)
  14021f:	41 0f 11 4e 58       	movups %xmm1,0x58(%r14)
  140224:	41 0f 11 46 48       	movups %xmm0,0x48(%r14)
  140229:	41 c6 46 18 ff       	movb   $0xff,0x18(%r14)
  14022e:	66 41 c7 86 a8 00 00 	movw   $0x3ff,0xa8(%r14)
  140235:	00 ff 03 
  140238:	49 c7 06 ff ff ff ff 	movq   $0xffffffffffffffff,(%r14)
  14023f:	e9 c6 f9 ff ff       	jmp    13fc0a <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0xc8a>
  140244:	48 89 e7             	mov    %rsp,%rdi
  140247:	e8 e4 6c ff ff       	call   136f30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  14024c:	e9 ab f1 ff ff       	jmp    13f3fc <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x47c>
  140251:	48 89 ca             	mov    %rcx,%rdx
  140254:	48 8d 0d 05 fb 15 00 	lea    0x15fb05(%rip),%rcx        # 29fd60 <anon.992c3e7d42c7daa20a9a62f28c126f60.5.llvm.3744930979898916264+0x100>
  14025b:	31 ff                	xor    %edi,%edi
  14025d:	48 89 de             	mov    %rbx,%rsi
  140260:	ff 15 0a 5c 16 00    	call   *0x165c0a(%rip)        # 2a5e70 <_DYNAMIC+0x560>
  140266:	48 ff cb             	dec    %rbx
  140269:	48 8d 15 d8 fa 15 00 	lea    0x15fad8(%rip),%rdx        # 29fd48 <anon.992c3e7d42c7daa20a9a62f28c126f60.5.llvm.3744930979898916264+0xe8>
  140270:	48 89 df             	mov    %rbx,%rdi
  140273:	48 89 ce             	mov    %rcx,%rsi
  140276:	ff 15 0c 5c 16 00    	call   *0x165c0c(%rip)        # 2a5e88 <_DYNAMIC+0x578>
  14027c:	bf 01 00 00 00       	mov    $0x1,%edi
  140281:	be 37 00 00 00       	mov    $0x37,%esi
  140286:	ff 15 94 5a 16 00    	call   *0x165a94(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  14028c:	eb 6a                	jmp    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  14028e:	bf 01 00 00 00       	mov    $0x1,%edi
  140293:	be 35 00 00 00       	mov    $0x35,%esi
  140298:	ff 15 82 5a 16 00    	call   *0x165a82(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  14029e:	eb 58                	jmp    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  1402a0:	bf 01 00 00 00       	mov    $0x1,%edi
  1402a5:	be 28 00 00 00       	mov    $0x28,%esi
  1402aa:	ff 15 70 5a 16 00    	call   *0x165a70(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  1402b0:	eb 46                	jmp    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  1402b2:	bf 01 00 00 00       	mov    $0x1,%edi
  1402b7:	be 38 00 00 00       	mov    $0x38,%esi
  1402bc:	ff 15 5e 5a 16 00    	call   *0x165a5e(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  1402c2:	eb 34                	jmp    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  1402c4:	bf 01 00 00 00       	mov    $0x1,%edi
  1402c9:	be 33 00 00 00       	mov    $0x33,%esi
  1402ce:	ff 15 4c 5a 16 00    	call   *0x165a4c(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  1402d4:	eb 22                	jmp    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  1402d6:	bf 01 00 00 00       	mov    $0x1,%edi
  1402db:	be 33 00 00 00       	mov    $0x33,%esi
  1402e0:	ff 15 3a 5a 16 00    	call   *0x165a3a(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  1402e6:	eb 10                	jmp    1402f8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1378>
  1402e8:	bf 01 00 00 00       	mov    $0x1,%edi
  1402ed:	be 2b 00 00 00       	mov    $0x2b,%esi
  1402f2:	ff 15 28 5a 16 00    	call   *0x165a28(%rip)        # 2a5d20 <_DYNAMIC+0x410>
  1402f8:	0f 0b                	ud2
  1402fa:	48 89 c3             	mov    %rax,%rbx
  1402fd:	45 84 ff             	test   %r15b,%r15b
  140300:	0f 85 b2 00 00 00    	jne    1403b8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1438>
  140306:	eb 0c                	jmp    140314 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1394>
  140308:	48 89 c3             	mov    %rax,%rbx
  14030b:	45 84 ff             	test   %r15b,%r15b
  14030e:	0f 85 a4 00 00 00    	jne    1403b8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1438>
  140314:	45 31 ff             	xor    %r15d,%r15d
  140317:	eb 76                	jmp    14038f <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x140f>
  140319:	48 89 c3             	mov    %rax,%rbx
  14031c:	44 89 fd             	mov    %r15d,%ebp
  14031f:	40 80 f5 01          	xor    $0x1,%bpl
  140323:	f0 49 ff 0e          	lock decq (%r14)
  140327:	75 16                	jne    14033f <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x13bf>
  140329:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  14032e:	ff 15 3c 58 16 00    	call   *0x16583c(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140334:	eb 09                	jmp    14033f <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x13bf>
  140336:	48 89 c3             	mov    %rax,%rbx
  140339:	41 b7 01             	mov    $0x1,%r15b
  14033c:	40 b5 01             	mov    $0x1,%bpl
  14033f:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
  140346:	00 
  140347:	f0 48 ff 08          	lock decq (%rax)
  14034b:	75 19                	jne    140366 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x13e6>
  14034d:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  140354:	00 
  140355:	ff 15 15 58 16 00    	call   *0x165815(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  14035b:	eb 09                	jmp    140366 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x13e6>
  14035d:	48 89 c3             	mov    %rax,%rbx
  140360:	40 b5 01             	mov    $0x1,%bpl
  140363:	41 b7 01             	mov    $0x1,%r15b
  140366:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  14036d:	00 
  14036e:	f0 48 ff 08          	lock decq (%rax)
  140372:	75 0e                	jne    140382 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1402>
  140374:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  14037b:	00 
  14037c:	ff 15 ee 57 16 00    	call   *0x1657ee(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140382:	40 84 ed             	test   %bpl,%bpl
  140385:	75 08                	jne    14038f <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x140f>
  140387:	eb 22                	jmp    1403ab <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x142b>
  140389:	48 89 c3             	mov    %rax,%rbx
  14038c:	41 b7 01             	mov    $0x1,%r15b
  14038f:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
  140396:	00 
  140397:	f0 48 ff 08          	lock decq (%rax)
  14039b:	75 0e                	jne    1403ab <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x142b>
  14039d:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  1403a4:	00 
  1403a5:	ff 15 c5 57 16 00    	call   *0x1657c5(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1403ab:	45 84 ff             	test   %r15b,%r15b
  1403ae:	75 08                	jne    1403b8 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1438>
  1403b0:	e9 b7 02 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1403b5:	48 89 c3             	mov    %rax,%rbx
  1403b8:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  1403bf:	00 
  1403c0:	f0 48 ff 08          	lock decq (%rax)
  1403c4:	0f 85 a2 02 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1403ca:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  1403d1:	00 
  1403d2:	ff 15 98 57 16 00    	call   *0x165798(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1403d8:	e9 8f 02 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1403dd:	48 89 c3             	mov    %rax,%rbx
  1403e0:	f0 49 ff 0e          	lock decq (%r14)
  1403e4:	0f 85 82 02 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1403ea:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1403ef:	ff 15 7b 57 16 00    	call   *0x16577b(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1403f5:	e9 72 02 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1403fa:	48 89 c3             	mov    %rax,%rbx
  1403fd:	f0 49 ff 0e          	lock decq (%r14)
  140401:	0f 85 65 02 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140407:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  14040c:	ff 15 5e 57 16 00    	call   *0x16575e(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140412:	e9 55 02 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140417:	48 89 c3             	mov    %rax,%rbx
  14041a:	f0 49 ff 0e          	lock decq (%r14)
  14041e:	0f 85 48 02 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140424:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140429:	ff 15 41 57 16 00    	call   *0x165741(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  14042f:	e9 38 02 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140434:	48 89 c3             	mov    %rax,%rbx
  140437:	48 89 e7             	mov    %rsp,%rdi
  14043a:	e8 81 60 ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  14043f:	e9 3f 04 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  140444:	48 89 c3             	mov    %rax,%rbx
  140447:	f0 49 ff 0e          	lock decq (%r14)
  14044b:	0f 85 1b 02 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140451:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140456:	ff 15 14 57 16 00    	call   *0x165714(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  14045c:	e9 0b 02 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140461:	48 89 c3             	mov    %rax,%rbx
  140464:	f0 49 ff 0e          	lock decq (%r14)
  140468:	0f 85 fe 01 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  14046e:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140473:	ff 15 f7 56 16 00    	call   *0x1656f7(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140479:	e9 ee 01 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  14047e:	48 89 c3             	mov    %rax,%rbx
  140481:	f0 49 ff 0e          	lock decq (%r14)
  140485:	0f 85 e1 01 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  14048b:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140490:	ff 15 da 56 16 00    	call   *0x1656da(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140496:	e9 d1 01 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  14049b:	48 89 c3             	mov    %rax,%rbx
  14049e:	f0 49 ff 0e          	lock decq (%r14)
  1404a2:	0f 85 c4 01 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1404a8:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1404ad:	ff 15 bd 56 16 00    	call   *0x1656bd(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1404b3:	e9 b4 01 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1404b8:	48 89 c3             	mov    %rax,%rbx
  1404bb:	48 89 e7             	mov    %rsp,%rdi
  1404be:	e8 fd 5f ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  1404c3:	e9 bb 03 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1404c8:	48 89 c3             	mov    %rax,%rbx
  1404cb:	f0 49 ff 0e          	lock decq (%r14)
  1404cf:	0f 85 97 01 00 00    	jne    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1404d5:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1404da:	ff 15 90 56 16 00    	call   *0x165690(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  1404e0:	e9 87 01 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  1404e5:	ff 15 65 56 16 00    	call   *0x165665(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  1404eb:	48 89 c3             	mov    %rax,%rbx
  1404ee:	48 89 e7             	mov    %rsp,%rdi
  1404f1:	e8 aa 6a ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1404f6:	e9 d6 01 00 00       	jmp    1406d1 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1751>
  1404fb:	48 89 c3             	mov    %rax,%rbx
  1404fe:	48 89 e7             	mov    %rsp,%rdi
  140501:	e8 ba 5f ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  140506:	e9 78 03 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  14050b:	48 89 c3             	mov    %rax,%rbx
  14050e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  140513:	f0 48 ff 08          	lock decq (%rax)
  140517:	75 1e                	jne    140537 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x15b7>
  140519:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  14051e:	ff 15 4c 56 16 00    	call   *0x16564c(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140524:	eb 11                	jmp    140537 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x15b7>
  140526:	ff 15 24 56 16 00    	call   *0x165624(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  14052c:	48 89 c3             	mov    %rax,%rbx
  14052f:	e9 d3 00 00 00       	jmp    140607 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1687>
  140534:	48 89 c3             	mov    %rax,%rbx
  140537:	4c 89 34 24          	mov    %r14,(%rsp)
  14053b:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
  140540:	e9 27 01 00 00       	jmp    14066c <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16ec>
  140545:	48 89 c3             	mov    %rax,%rbx
  140548:	e9 f3 00 00 00       	jmp    140640 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16c0>
  14054d:	48 89 c3             	mov    %rax,%rbx
  140550:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  140557:	00 
  140558:	e8 43 6a ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14055d:	e9 14 03 00 00       	jmp    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  140562:	ff 15 e8 55 16 00    	call   *0x1655e8(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140568:	48 89 c3             	mov    %rax,%rbx
  14056b:	48 89 e7             	mov    %rsp,%rdi
  14056e:	e8 4d 5f ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  140573:	e9 0b 03 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  140578:	48 89 c3             	mov    %rax,%rbx
  14057b:	48 89 e7             	mov    %rsp,%rdi
  14057e:	e8 1d 6a ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  140583:	e9 49 01 00 00       	jmp    1406d1 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1751>
  140588:	48 89 c3             	mov    %rax,%rbx
  14058b:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  140592:	00 
  140593:	e8 08 6a ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  140598:	e9 34 01 00 00       	jmp    1406d1 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1751>
  14059d:	ff 15 ad 55 16 00    	call   *0x1655ad(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  1405a3:	48 89 c3             	mov    %rax,%rbx
  1405a6:	48 89 e7             	mov    %rsp,%rdi
  1405a9:	e8 12 5f ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  1405ae:	80 7c 24 70 ff       	cmpb   $0xff,0x70(%rsp)
  1405b3:	0f 84 ca 02 00 00    	je     140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1405b9:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1405be:	e8 dd 69 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1405c3:	e9 bb 02 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1405c8:	48 89 c3             	mov    %rax,%rbx
  1405cb:	48 89 e7             	mov    %rsp,%rdi
  1405ce:	e8 ed 5e ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  1405d3:	e9 ab 02 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1405d8:	48 89 c3             	mov    %rax,%rbx
  1405db:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  1405e2:	00 
  1405e3:	e8 b8 69 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1405e8:	e9 96 02 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1405ed:	ff 15 5d 55 16 00    	call   *0x16555d(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  1405f3:	48 89 c3             	mov    %rax,%rbx
  1405f6:	f0 49 ff 0e          	lock decq (%r14)
  1405fa:	75 0b                	jne    140607 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1687>
  1405fc:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140601:	ff 15 69 55 16 00    	call   *0x165569(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140607:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  14060c:	0f 85 64 02 00 00    	jne    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  140612:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  140619:	00 
  14061a:	ff 15 50 55 16 00    	call   *0x165550(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140620:	e9 51 02 00 00       	jmp    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  140625:	ff 15 25 55 16 00    	call   *0x165525(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  14062b:	48 89 c3             	mov    %rax,%rbx
  14062e:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  140633:	75 0b                	jne    140640 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x16c0>
  140635:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  14063a:	ff 15 30 55 16 00    	call   *0x165530(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140640:	f0 49 ff 0f          	lock decq (%r15)
  140644:	0f 85 2c 02 00 00    	jne    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  14064a:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  140651:	00 
  140652:	ff 15 18 55 16 00    	call   *0x165518(%rip)        # 2a5b70 <_DYNAMIC+0x260>
  140658:	e9 19 02 00 00       	jmp    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  14065d:	ff 15 ed 54 16 00    	call   *0x1654ed(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140663:	ff 15 e7 54 16 00    	call   *0x1654e7(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140669:	48 89 c3             	mov    %rax,%rbx
  14066c:	48 89 e7             	mov    %rsp,%rdi
  14066f:	e8 bc 68 ff ff       	call   136f30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs7Oh8zmHsHuv_13hyperinterval8rational24NonEmptyRationalIntervalECs23PzJKl0dyV_10hypersolve>
  140674:	e9 fd 01 00 00       	jmp    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  140679:	ff 15 d1 54 16 00    	call   *0x1654d1(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  14067f:	48 89 c3             	mov    %rax,%rbx
  140682:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140687:	e8 14 69 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14068c:	e9 e5 01 00 00       	jmp    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  140691:	48 89 c3             	mov    %rax,%rbx
  140694:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140699:	e8 02 69 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14069e:	e9 e0 01 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1406a3:	48 89 c3             	mov    %rax,%rbx
  1406a6:	48 89 e7             	mov    %rsp,%rdi
  1406a9:	e8 f2 68 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1406ae:	eb 33                	jmp    1406e3 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1763>
  1406b0:	ff 15 9a 54 16 00    	call   *0x16549a(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  1406b6:	48 89 c3             	mov    %rax,%rbx
  1406b9:	48 89 e7             	mov    %rsp,%rdi
  1406bc:	e8 ff 5d ff ff       	call   1364c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEEB11_.llvm.212092998455620395>
  1406c1:	e9 bd 01 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1406c6:	48 89 c3             	mov    %rax,%rbx
  1406c9:	e9 a8 01 00 00       	jmp    140876 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18f6>
  1406ce:	48 89 c3             	mov    %rax,%rbx
  1406d1:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  1406d6:	e8 55 67 ff ff       	call   136e30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  1406db:	e9 a3 01 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1406e0:	48 89 c3             	mov    %rax,%rbx
  1406e3:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  1406ea:	00 
  1406eb:	e8 b0 68 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1406f0:	e9 8e 01 00 00       	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  1406f5:	48 89 c3             	mov    %rax,%rbx
  1406f8:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  1406ff:	00 
  140700:	e8 9b 68 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  140705:	eb 39                	jmp    140740 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x17c0>
  140707:	48 89 c3             	mov    %rax,%rbx
  14070a:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  140711:	00 
  140712:	e8 29 84 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  140717:	eb 4b                	jmp    140764 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x17e4>
  140719:	48 89 c3             	mov    %rax,%rbx
  14071c:	eb 53                	jmp    140771 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x17f1>
  14071e:	48 89 c3             	mov    %rax,%rbx
  140721:	48 8d bc 24 58 02 00 	lea    0x258(%rsp),%rdi
  140728:	00 
  140729:	e8 12 84 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  14072e:	eb 68                	jmp    140798 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1818>
  140730:	48 89 c3             	mov    %rax,%rbx
  140733:	eb 70                	jmp    1407a5 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1825>
  140735:	48 89 c3             	mov    %rax,%rbx
  140738:	e9 87 00 00 00       	jmp    1407c4 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1844>
  14073d:	48 89 c3             	mov    %rax,%rbx
  140740:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
  140745:	e8 e6 66 ff ff       	call   136e30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  14074a:	e9 1a 01 00 00       	jmp    140869 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18e9>
  14074f:	48 89 c3             	mov    %rax,%rbx
  140752:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  140759:	00 
  14075a:	e8 41 68 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14075f:	eb 10                	jmp    140771 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x17f1>
  140761:	48 89 c3             	mov    %rax,%rbx
  140764:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  14076b:	00 
  14076c:	e8 cf 83 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  140771:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  140778:	00 
  140779:	e8 22 68 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14077e:	e9 a1 00 00 00       	jmp    140824 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18a4>
  140783:	48 89 c3             	mov    %rax,%rbx
  140786:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  14078d:	00 
  14078e:	e8 0d 68 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  140793:	eb 10                	jmp    1407a5 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1825>
  140795:	48 89 c3             	mov    %rax,%rbx
  140798:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  14079f:	00 
  1407a0:	e8 9b 83 fd ff       	call   118b40 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15108003526945345817>
  1407a5:	48 8d bc 24 88 02 00 	lea    0x288(%rsp),%rdi
  1407ac:	00 
  1407ad:	e8 ee 67 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1407b2:	eb 70                	jmp    140824 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18a4>
  1407b4:	48 89 c3             	mov    %rax,%rbx
  1407b7:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  1407be:	00 
  1407bf:	e8 dc 67 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  1407c4:	0f 28 84 24 20 02 00 	movaps 0x220(%rsp),%xmm0
  1407cb:	00 
  1407cc:	0f 29 84 24 30 01 00 	movaps %xmm0,0x130(%rsp)
  1407d3:	00 
  1407d4:	0f 28 84 24 10 02 00 	movaps 0x210(%rsp),%xmm0
  1407db:	00 
  1407dc:	0f 29 84 24 20 01 00 	movaps %xmm0,0x120(%rsp)
  1407e3:	00 
  1407e4:	0f 28 84 24 d0 01 00 	movaps 0x1d0(%rsp),%xmm0
  1407eb:	00 
  1407ec:	0f 28 8c 24 e0 01 00 	movaps 0x1e0(%rsp),%xmm1
  1407f3:	00 
  1407f4:	0f 28 94 24 f0 01 00 	movaps 0x1f0(%rsp),%xmm2
  1407fb:	00 
  1407fc:	0f 28 9c 24 00 02 00 	movaps 0x200(%rsp),%xmm3
  140803:	00 
  140804:	0f 29 9c 24 10 01 00 	movaps %xmm3,0x110(%rsp)
  14080b:	00 
  14080c:	0f 29 94 24 00 01 00 	movaps %xmm2,0x100(%rsp)
  140813:	00 
  140814:	0f 29 8c 24 f0 00 00 	movaps %xmm1,0xf0(%rsp)
  14081b:	00 
  14081c:	0f 29 84 24 e0 00 00 	movaps %xmm0,0xe0(%rsp)
  140823:	00 
  140824:	48 89 e7             	mov    %rsp,%rdi
  140827:	e8 04 66 ff ff       	call   136e30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  14082c:	eb 3b                	jmp    140869 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18e9>
  14082e:	ff 15 1c 53 16 00    	call   *0x16531c(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140834:	48 89 c3             	mov    %rax,%rbx
  140837:	4c 89 ef             	mov    %r13,%rdi
  14083a:	e8 61 67 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14083f:	eb 28                	jmp    140869 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x18e9>
  140841:	ff 15 09 53 16 00    	call   *0x165309(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140847:	ff 15 03 53 16 00    	call   *0x165303(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  14084d:	ff 15 fd 52 16 00    	call   *0x1652fd(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140853:	48 89 c3             	mov    %rax,%rbx
  140856:	48 89 e7             	mov    %rsp,%rdi
  140859:	e8 42 67 ff ff       	call   136fa0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.212092998455620395>
  14085e:	eb 23                	jmp    140883 <_RNvNtCs23PzJKl0dyV_10hypersolve9algebraic46evaluate_polynomial_at_admitted_algebraic_root.llvm.212092998455620395+0x1903>
  140860:	ff 15 ea 52 16 00    	call   *0x1652ea(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140866:	48 89 c3             	mov    %rax,%rbx
  140869:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  140870:	00 
  140871:	e8 ba 65 ff ff       	call   136e30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  140876:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  14087d:	00 
  14087e:	e8 ad 65 ff ff       	call   136e30 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtCs23PzJKl0dyV_10hypersolve9algebraic32AlgebraicPolynomialValueIntervalEBF_>
  140883:	48 89 df             	mov    %rbx,%rdi
  140886:	e8 25 b9 15 00       	call   29c1b0 <_Unwind_Resume@plt>
  14088b:	ff 15 bf 52 16 00    	call   *0x1652bf(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140891:	ff 15 b9 52 16 00    	call   *0x1652b9(%rip)        # 2a5b50 <_DYNAMIC+0x240>
  140897:	ff 15 b3 52 16 00    	call   *0x1652b3(%rip)        # 2a5b50 <_DYNAMIC+0x240>
