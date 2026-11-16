
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/candidate-flow_noise-ee6f4bf07111:     file format elf64-x86-64


Disassembly of section .text:

000000000011ffb0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE>:
  11ffb0:	55                   	push   %rbp
  11ffb1:	41 57                	push   %r15
  11ffb3:	41 56                	push   %r14
  11ffb5:	41 55                	push   %r13
  11ffb7:	41 54                	push   %r12
  11ffb9:	53                   	push   %rbx
  11ffba:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
  11ffc1:	4c 89 8c 24 c8 00 00 	mov    %r9,0xc8(%rsp)
  11ffc8:	00 
  11ffc9:	89 cd                	mov    %ecx,%ebp
  11ffcb:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
  11ffd2:	00 
  11ffd3:	48 89 fb             	mov    %rdi,%rbx
  11ffd6:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  11ffdd:	00 
  11ffde:	48 8b 48 10          	mov    0x10(%rax),%rcx
  11ffe2:	48 03 8c 24 88 01 00 	add    0x188(%rsp),%rcx
  11ffe9:	00 
  11ffea:	0f 82 9b 00 00 00    	jb     12008b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xdb>
  11fff0:	48 8b 46 48          	mov    0x48(%rsi),%rax
  11fff4:	48 3b 08             	cmp    (%rax),%rcx
  11fff7:	0f 83 8e 00 00 00    	jae    12008b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xdb>
  11fffd:	48 8b 48 10          	mov    0x10(%rax),%rcx
  120001:	48 85 c9             	test   %rcx,%rcx
  120004:	74 0e                	je     120014 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x64>
  120006:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  12000a:	b1 12                	mov    $0x12,%cl
  12000c:	84 d2                	test   %dl,%dl
  12000e:	0f 85 d8 09 00 00    	jne    1209ec <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa3c>
  120014:	48 8b 48 08          	mov    0x8(%rax),%rcx
  120018:	48 85 c9             	test   %rcx,%rcx
  12001b:	0f 84 c9 09 00 00    	je     1209ea <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa3a>
  120021:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  120026:	4d 89 c6             	mov    %r8,%r14
  120029:	48 89 1c 24          	mov    %rbx,(%rsp)
  12002d:	48 ff c9             	dec    %rcx
  120030:	48 89 48 08          	mov    %rcx,0x8(%rax)
  120034:	ff 15 36 22 1d 00    	call   *0x1d2236(%rip)        # 2f2270 <_DYNAMIC+0x240>
  12003a:	bf 10 00 00 00       	mov    $0x10,%edi
  12003f:	be 08 00 00 00       	mov    $0x8,%esi
  120044:	ff 15 2e 22 1d 00    	call   *0x1d222e(%rip)        # 2f2278 <_DYNAMIC+0x248>
  12004a:	48 85 c0             	test   %rax,%rax
  12004d:	0f 84 61 0b 00 00    	je     120bb4 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc04>
  120053:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
  12005a:	00 
  12005b:	48 89 08             	mov    %rcx,(%rax)
  12005e:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  120062:	48 c7 44 24 10 01 00 	movq   $0x1,0x10(%rsp)
  120069:	00 00 
  12006b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  120070:	bb 01 00 00 00       	mov    $0x1,%ebx
  120075:	48 8d 05 bc b9 1c 00 	lea    0x1cb9bc(%rip),%rax        # 2eba38 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x340>
  12007c:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  120083:	00 
  120084:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
  120089:	eb 33                	jmp    1200be <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x10e>
  12008b:	c6 03 10             	movb   $0x10,(%rbx)
  12008e:	48 89 d8             	mov    %rbx,%rax
  120091:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
  120098:	5b                   	pop    %rbx
  120099:	41 5c                	pop    %r12
  12009b:	41 5d                	pop    %r13
  12009d:	41 5e                	pop    %r14
  12009f:	41 5f                	pop    %r15
  1200a1:	5d                   	pop    %rbp
  1200a2:	c3                   	ret
  1200a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1200aa:	84 00 00 00 00 00 
  1200b0:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  1200b5:	48 85 db             	test   %rbx,%rbx
  1200b8:	0f 84 9d 09 00 00    	je     120a5b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaab>
  1200be:	48 ff cb             	dec    %rbx
  1200c1:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  1200c6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1200cb:	48 c1 e3 04          	shl    $0x4,%rbx
  1200cf:	4c 8b 34 18          	mov    (%rax,%rbx,1),%r14
  1200d3:	0f b6 44 18 08       	movzbl 0x8(%rax,%rbx,1),%eax
  1200d8:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  1200dd:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  1200e1:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  1200e5:	48 85 d2             	test   %rdx,%rdx
  1200e8:	74 0c                	je     1200f6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x146>
  1200ea:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  1200ee:	84 d2                	test   %dl,%dl
  1200f0:	0f 85 fd 09 00 00    	jne    120af3 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb43>
  1200f6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1200fa:	48 85 d2             	test   %rdx,%rdx
  1200fd:	0f 84 51 09 00 00    	je     120a54 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaa4>
  120103:	48 ff ca             	dec    %rdx
  120106:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  12010a:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  120111:	00 
  120112:	48 8b 09             	mov    (%rcx),%rcx
  120115:	48 85 c9             	test   %rcx,%rcx
  120118:	0f 84 92 00 00 00    	je     1201b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x200>
  12011e:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  120125:	00 
  120126:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  12012a:	0f b7 b9 12 01 00 00 	movzwl 0x112(%rcx),%edi
  120131:	41 89 f8             	mov    %edi,%r8d
  120134:	41 c1 e0 04          	shl    $0x4,%r8d
  120138:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  12013f:	49 89 c9             	mov    %rcx,%r9
  120142:	eb 25                	jmp    120169 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1b9>
  120144:	66 66 66 2e 0f 1f 84 	data16 data16 cs nopw 0x0(%rax,%rax,1)
  12014b:	00 00 00 00 00 
  120150:	41 0f 97 c2          	seta   %r10b
  120154:	41 80 da 00          	sbb    $0x0,%r10b
  120158:	49 83 c1 10          	add    $0x10,%r9
  12015c:	48 ff c6             	inc    %rsi
  12015f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  120163:	41 80 fa 01          	cmp    $0x1,%r10b
  120167:	75 17                	jne    120180 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1d0>
  120169:	4d 85 c0             	test   %r8,%r8
  12016c:	74 22                	je     120190 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1e0>
  12016e:	4d 3b 31             	cmp    (%r9),%r14
  120171:	75 dd                	jne    120150 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1a0>
  120173:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  120177:	eb d7                	jmp    120150 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1a0>
  120179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  120180:	41 0f b6 fa          	movzbl %r10b,%edi
  120184:	85 ff                	test   %edi,%edi
  120186:	0f 84 24 ff ff ff    	je     1200b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x100>
  12018c:	eb 05                	jmp    120193 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1e3>
  12018e:	66 90                	xchg   %ax,%ax
  120190:	48 89 fe             	mov    %rdi,%rsi
  120193:	48 83 ea 01          	sub    $0x1,%rdx
  120197:	72 17                	jb     1201b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x200>
  120199:	48 8b 8c f1 18 01 00 	mov    0x118(%rcx,%rsi,8),%rcx
  1201a0:	00 
  1201a1:	eb 87                	jmp    12012a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x17a>
  1201a3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1201aa:	84 00 00 00 00 00 
  1201b0:	84 c0                	test   %al,%al
  1201b2:	74 6e                	je     120222 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x272>
  1201b4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  1201b9:	48 8b 70 28          	mov    0x28(%rax),%rsi
  1201bd:	49 39 f6             	cmp    %rsi,%r14
  1201c0:	0f 83 19 0a 00 00    	jae    120bdf <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc2f>
  1201c6:	48 8b 40 20          	mov    0x20(%rax),%rax
  1201ca:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  1201ce:	48 c1 e1 04          	shl    $0x4,%rcx
  1201d2:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  1201d6:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  1201da:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  1201de:	48 83 f8 16          	cmp    $0x16,%rax
  1201e2:	b8 00 00 00 00       	mov    $0x0,%eax
  1201e7:	48 0f 42 c8          	cmovb  %rax,%rcx
  1201eb:	48 8d 15 0a 46 f9 ff 	lea    -0x6b9f6(%rip),%rdx        # b47fc <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x878>
  1201f2:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  1201f6:	48 01 d0             	add    %rdx,%rax
  1201f9:	ff e0                	jmp    *%rax
  1201fb:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  120202:	00 
  120203:	e8 d8 16 00 00       	call   1218e0 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17h9f16100dc643f807E.llvm.9576406186078755599>
  120208:	0f b6 84 24 98 00 00 	movzbl 0x98(%rsp),%eax
  12020f:	00 
  120210:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  120215:	3c 16                	cmp    $0x16,%al
  120217:	0f 83 62 02 00 00    	jae    12047f <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x4cf>
  12021d:	e9 e4 05 00 00       	jmp    120806 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x856>
  120222:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  120227:	48 8b 70 28          	mov    0x28(%rax),%rsi
  12022b:	49 39 f6             	cmp    %rsi,%r14
  12022e:	0f 83 ba 09 00 00    	jae    120bee <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc3e>
  120234:	48 8b 40 20          	mov    0x20(%rax),%rax
  120238:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  12023c:	48 c1 e1 04          	shl    $0x4,%rcx
  120240:	0f b6 34 08          	movzbl (%rax,%rcx,1),%esi
  120244:	48 8d 56 eb          	lea    -0x15(%rsi),%rdx
  120248:	48 83 fe 16          	cmp    $0x16,%rsi
  12024c:	be 00 00 00 00       	mov    $0x0,%esi
  120251:	48 0f 42 d6          	cmovb  %rsi,%rdx
  120255:	48 83 fa 02          	cmp    $0x2,%rdx
  120259:	73 0b                	jae    120266 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x2b6>
  12025b:	45 31 e4             	xor    %r12d,%r12d
  12025e:	45 31 ff             	xor    %r15d,%r15d
  120261:	e9 84 00 00 00       	jmp    1202ea <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x33a>
  120266:	48 01 c8             	add    %rcx,%rax
  120269:	83 fa 02             	cmp    $0x2,%edx
  12026c:	75 58                	jne    1202c6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x316>
  12026e:	48 8b 40 18          	mov    0x18(%rax),%rax
  120272:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  120279:	00 
  12027a:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  120280:	45 31 e4             	xor    %r12d,%r12d
  120283:	eb 65                	jmp    1202ea <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x33a>
  120285:	48 8b 46 18          	mov    0x18(%rsi),%rax
  120289:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  12028e:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  120295:	00 00 
  120297:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  12029e:	00 
  12029f:	b0 17                	mov    $0x17,%al
  1202a1:	e9 d2 01 00 00       	jmp    120478 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x4c8>
  1202a6:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  1202aa:	88 84 24 b0 00 00 00 	mov    %al,0xb0(%rsp)
  1202b1:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  1202b6:	f3 0f 7f 84 24 a0 00 	movdqu %xmm0,0xa0(%rsp)
  1202bd:	00 00 
  1202bf:	b0 18                	mov    $0x18,%al
  1202c1:	e9 b2 01 00 00       	jmp    120478 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x4c8>
  1202c6:	48 8b 48 08          	mov    0x8(%rax),%rcx
  1202ca:	48 89 8c 24 d8 00 00 	mov    %rcx,0xd8(%rsp)
  1202d1:	00 
  1202d2:	48 8b 40 10          	mov    0x10(%rax),%rax
  1202d6:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
  1202dd:	00 
  1202de:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  1202e4:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  1202ea:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1202f1:	00 
  1202f2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  1202f6:	48 03 94 24 88 01 00 	add    0x188(%rsp),%rdx
  1202fd:	00 
  1202fe:	0f 82 1b 08 00 00    	jb     120b1f <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb6f>
  120304:	48 03 54 24 20       	add    0x20(%rsp),%rdx
  120309:	0f 82 10 08 00 00    	jb     120b1f <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb6f>
  12030f:	4b 8d 04 27          	lea    (%r15,%r12,1),%rax
  120313:	48 ff c0             	inc    %rax
  120316:	48 01 c2             	add    %rax,%rdx
  120319:	0f 82 00 08 00 00    	jb     120b1f <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb6f>
  12031f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  120324:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  120328:	48 3b 11             	cmp    (%rcx),%rdx
  12032b:	0f 87 ee 07 00 00    	ja     120b1f <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb6f>
  120331:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  120335:	48 85 d2             	test   %rdx,%rdx
  120338:	74 0c                	je     120346 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x396>
  12033a:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  12033e:	84 d2                	test   %dl,%dl
  120340:	0f 85 ad 07 00 00    	jne    120af3 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb43>
  120346:	4b 8d 34 27          	lea    (%r15,%r12,1),%rsi
  12034a:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  12034e:	48 39 d6             	cmp    %rdx,%rsi
  120351:	0f 83 fd 06 00 00    	jae    120a54 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaa4>
  120357:	48 29 c2             	sub    %rax,%rdx
  12035a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  12035e:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  120363:	4c 3b 6c 24 10       	cmp    0x10(%rsp),%r13
  120368:	75 0b                	jne    120375 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3c5>
  12036a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  12036f:	ff 15 83 22 1d 00    	call   *0x1d2283(%rip)        # 2f25f8 <_DYNAMIC+0x5c8>
  120375:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12037a:	4c 89 e9             	mov    %r13,%rcx
  12037d:	48 c1 e1 04          	shl    $0x4,%rcx
  120381:	4c 89 34 08          	mov    %r14,(%rax,%rcx,1)
  120385:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  12038a:	49 8d 5d 01          	lea    0x1(%r13),%rbx
  12038e:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  120393:	4d 85 e4             	test   %r12,%r12
  120396:	74 38                	je     1203d0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x420>
  120398:	48 3b 5c 24 10       	cmp    0x10(%rsp),%rbx
  12039d:	75 10                	jne    1203af <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3ff>
  12039f:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  1203a4:	ff 15 4e 22 1d 00    	call   *0x1d224e(%rip)        # 2f25f8 <_DYNAMIC+0x5c8>
  1203aa:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1203af:	48 c1 e3 04          	shl    $0x4,%rbx
  1203b3:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
  1203ba:	00 
  1203bb:	48 89 0c 18          	mov    %rcx,(%rax,%rbx,1)
  1203bf:	c6 44 18 08 00       	movb   $0x0,0x8(%rax,%rbx,1)
  1203c4:	49 83 c5 02          	add    $0x2,%r13
  1203c8:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
  1203cd:	4c 89 eb             	mov    %r13,%rbx
  1203d0:	4d 85 ff             	test   %r15,%r15
  1203d3:	0f 84 d7 fc ff ff    	je     1200b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x100>
  1203d9:	48 3b 5c 24 10       	cmp    0x10(%rsp),%rbx
  1203de:	75 10                	jne    1203f0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x440>
  1203e0:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  1203e5:	ff 15 0d 22 1d 00    	call   *0x1d220d(%rip)        # 2f25f8 <_DYNAMIC+0x5c8>
  1203eb:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1203f0:	48 89 d9             	mov    %rbx,%rcx
  1203f3:	48 c1 e1 04          	shl    $0x4,%rcx
  1203f7:	48 8b b4 24 d8 00 00 	mov    0xd8(%rsp),%rsi
  1203fe:	00 
  1203ff:	48 89 34 08          	mov    %rsi,(%rax,%rcx,1)
  120403:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  120408:	48 ff c3             	inc    %rbx
  12040b:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
  120410:	48 85 db             	test   %rbx,%rbx
  120413:	0f 85 a5 fc ff ff    	jne    1200be <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x10e>
  120419:	e9 3d 06 00 00       	jmp    120a5b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaab>
  12041e:	8b 5e 20             	mov    0x20(%rsi),%ebx
  120421:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  120428:	00 00 80 
  12042b:	48 89 c8             	mov    %rcx,%rax
  12042e:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  120432:	74 21                	je     120455 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x4a5>
  120434:	48 83 c6 08          	add    $0x8,%rsi
  120438:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  12043d:	ff 15 ad 1e 1d 00    	call   *0x1d1ead(%rip)        # 2f22f0 <_DYNAMIC+0x2c0>
  120443:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  120448:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  12044d:	0f 10 01             	movups (%rcx),%xmm0
  120450:	0f 29 44 24 60       	movaps %xmm0,0x60(%rsp)
  120455:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
  12045c:	00 
  12045d:	66 0f 6f 44 24 60    	movdqa 0x60(%rsp),%xmm0
  120463:	48 8d 84 24 a8 00 00 	lea    0xa8(%rsp),%rax
  12046a:	00 
  12046b:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  12046f:	89 9c 24 b8 00 00 00 	mov    %ebx,0xb8(%rsp)
  120476:	b0 16                	mov    $0x16,%al
  120478:	88 84 24 98 00 00 00 	mov    %al,0x98(%rsp)
  12047f:	3c 18                	cmp    $0x18,%al
  120481:	74 22                	je     1204a5 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x4f5>
  120483:	0f b6 c0             	movzbl %al,%eax
  120486:	83 f8 17             	cmp    $0x17,%eax
  120489:	0f 85 62 03 00 00    	jne    1207f1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x841>
  12048f:	f3 0f 6f 84 24 b0 00 	movdqu 0xb0(%rsp),%xmm0
  120496:	00 00 
  120498:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  12049d:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  1204a3:	eb 0f                	jmp    1204b4 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x504>
  1204a5:	41 bf 02 00 00 00    	mov    $0x2,%r15d
  1204ab:	f3 0f 6f 84 24 a0 00 	movdqu 0xa0(%rsp),%xmm0
  1204b2:	00 00 
  1204b4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1204bb:	00 
  1204bc:	66 0f 7f 84 24 00 01 	movdqa %xmm0,0x100(%rsp)
  1204c3:	00 00 
  1204c5:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  1204ca:	48 89 8c 24 e8 00 00 	mov    %rcx,0xe8(%rsp)
  1204d1:	00 
  1204d2:	48 89 8c 24 f0 00 00 	mov    %rcx,0xf0(%rsp)
  1204d9:	00 
  1204da:	31 db                	xor    %ebx,%ebx
  1204dc:	eb 24                	jmp    120502 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x552>
  1204de:	4c 89 e0             	mov    %r12,%rax
  1204e1:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  1204e6:	48 89 84 dc e8 00 00 	mov    %rax,0xe8(%rsp,%rbx,8)
  1204ed:	00 
  1204ee:	4c 89 eb             	mov    %r13,%rbx
  1204f1:	4d 39 fd             	cmp    %r15,%r13
  1204f4:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1204fb:	00 
  1204fc:	0f 84 ae 02 00 00    	je     1207b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x800>
  120502:	48 8b 00             	mov    (%rax),%rax
  120505:	48 85 c0             	test   %rax,%rax
  120508:	0f 84 b6 06 00 00    	je     120bc4 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc14>
  12050e:	4c 8d 6b 01          	lea    0x1(%rbx),%r13
  120512:	48 8b 8c dc 00 01 00 	mov    0x100(%rsp,%rbx,8),%rcx
  120519:	00 
  12051a:	48 8b 94 24 80 01 00 	mov    0x180(%rsp),%rdx
  120521:	00 
  120522:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  120526:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12052d:	41 89 f8             	mov    %edi,%r8d
  120530:	41 c1 e0 04          	shl    $0x4,%r8d
  120534:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  12053b:	49 89 c1             	mov    %rax,%r9
  12053e:	eb 19                	jmp    120559 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x5a9>
  120540:	41 0f 97 c2          	seta   %r10b
  120544:	41 80 da 00          	sbb    $0x0,%r10b
  120548:	49 83 c1 10          	add    $0x10,%r9
  12054c:	48 ff c6             	inc    %rsi
  12054f:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  120553:	41 80 fa 01          	cmp    $0x1,%r10b
  120557:	75 17                	jne    120570 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x5c0>
  120559:	4d 85 c0             	test   %r8,%r8
  12055c:	74 22                	je     120580 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x5d0>
  12055e:	49 3b 09             	cmp    (%r9),%rcx
  120561:	75 dd                	jne    120540 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x590>
  120563:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  120567:	eb d7                	jmp    120540 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x590>
  120569:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  120570:	41 0f b6 fa          	movzbl %r10b,%edi
  120574:	85 ff                	test   %edi,%edi
  120576:	75 0b                	jne    120583 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x5d3>
  120578:	eb 26                	jmp    1205a0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x5f0>
  12057a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  120580:	48 89 fe             	mov    %rdi,%rsi
  120583:	48 83 ea 01          	sub    $0x1,%rdx
  120587:	0f 82 37 06 00 00    	jb     120bc4 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc14>
  12058d:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  120594:	00 
  120595:	eb 8f                	jmp    120526 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x576>
  120597:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  12059e:	00 00 
  1205a0:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  1205a7:	00 
  1205a8:	4c 3b 64 24 28       	cmp    0x28(%rsp),%r12
  1205ad:	0f 84 3b ff ff ff    	je     1204ee <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x53e>
  1205b3:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  1205ba:	00 
  1205bb:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  1205bf:	48 83 f9 16          	cmp    $0x16,%rcx
  1205c3:	b9 00 00 00 00       	mov    $0x0,%ecx
  1205c8:	48 0f 42 c1          	cmovb  %rcx,%rax
  1205cc:	48 83 f8 02          	cmp    $0x2,%rax
  1205d0:	74 6e                	je     120640 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x690>
  1205d2:	83 f8 03             	cmp    $0x3,%eax
  1205d5:	0f 85 be 05 00 00    	jne    120b99 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbe9>
  1205db:	0f b6 84 24 b0 00 00 	movzbl 0xb0(%rsp),%eax
  1205e2:	00 
  1205e3:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  1205ea:	00 00 80 
  1205ed:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
  1205f2:	c7 84 24 80 00 00 00 	movl   $0x0,0x80(%rsp)
  1205f9:	00 00 00 00 
  1205fd:	c6 44 24 60 16       	movb   $0x16,0x60(%rsp)
  120602:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  120607:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  12060e:	00 
  12060f:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  120614:	48 8d 0d f1 41 f9 ff 	lea    -0x6be0f(%rip),%rcx        # b480c <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x888>
  12061b:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  12061f:	48 01 c8             	add    %rcx,%rax
  120622:	ff e0                	jmp    *%rax
  120624:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12062b:	00 
  12062c:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  120631:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120636:	ff 15 34 20 1d 00    	call   *0x1d2034(%rip)        # 2f2670 <_DYNAMIC+0x640>
  12063c:	eb 40                	jmp    12067e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6ce>
  12063e:	66 90                	xchg   %ax,%ax
  120640:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  120647:	00 
  120648:	48 8b 94 24 a8 00 00 	mov    0xa8(%rsp),%rdx
  12064f:	00 
  120650:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  120657:	00 00 80 
  12065a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  12065f:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  120666:	00 
  120667:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  12066c:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  120673:	00 
  120674:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  120679:	e8 32 39 02 00       	call   143fb0 <_ZN10hypersolve18expression_program8jacobian5unary17hdb6730d84700a311E>
  12067e:	f3 0f 6f 84 24 18 01 	movdqu 0x118(%rsp),%xmm0
  120685:	00 00 
  120687:	0f 10 8c 24 28 01 00 	movups 0x128(%rsp),%xmm1
  12068e:	00 
  12068f:	0f 10 94 24 38 01 00 	movups 0x138(%rsp),%xmm2
  120696:	00 
  120697:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  12069c:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  1206a1:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  1206a7:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1206ac:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1206b1:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1206b6:	89 d9                	mov    %ebx,%ecx
  1206b8:	4c 8d 84 24 00 01 00 	lea    0x100(%rsp),%r8
  1206bf:	00 
  1206c0:	4d 89 f9             	mov    %r15,%r9
  1206c3:	ff b4 24 c8 00 00 00 	push   0xc8(%rsp)
  1206ca:	ff 74 24 30          	push   0x30(%rsp)
  1206ce:	e8 7d 52 02 00       	call   145950 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17h7595def89b272616E>
  1206d3:	48 83 c4 10          	add    $0x10,%rsp
  1206d7:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  1206dc:	80 f9 18             	cmp    $0x18,%cl
  1206df:	0f 85 0e 03 00 00    	jne    1209f3 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa43>
  1206e5:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
  1206ea:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  1206ef:	48 89 d0             	mov    %rdx,%rax
  1206f2:	48 39 d1             	cmp    %rdx,%rcx
  1206f5:	0f 84 e6 fd ff ff    	je     1204e1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x531>
  1206fb:	48 8b 84 24 c8 00 00 	mov    0xc8(%rsp),%rax
  120702:	00 
  120703:	48 39 c1             	cmp    %rax,%rcx
  120706:	0f 84 d2 fd ff ff    	je     1204de <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x52e>
  12070c:	49 39 c4             	cmp    %rax,%r12
  12070f:	75 5f                	jne    120770 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x7c0>
  120711:	48 89 c8             	mov    %rcx,%rax
  120714:	e9 c8 fd ff ff       	jmp    1204e1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x531>
  120719:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  120720:	00 
  120721:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  120726:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  12072b:	ff 15 9f 1d 1d 00    	call   *0x1d1d9f(%rip)        # 2f24d0 <_DYNAMIC+0x4a0>
  120731:	e9 48 ff ff ff       	jmp    12067e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6ce>
  120736:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12073d:	00 
  12073e:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  120743:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120748:	ff 15 3a 1f 1d 00    	call   *0x1d1f3a(%rip)        # 2f2688 <_DYNAMIC+0x658>
  12074e:	e9 2b ff ff ff       	jmp    12067e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6ce>
  120753:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  12075a:	00 
  12075b:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
  120760:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120765:	ff 15 15 1f 1d 00    	call   *0x1d1f15(%rip)        # 2f2680 <_DYNAMIC+0x650>
  12076b:	e9 0e ff ff ff       	jmp    12067e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6ce>
  120770:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  120775:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12077a:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  12077f:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  120784:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  120789:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  12078e:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120793:	e8 18 50 02 00       	call   1457b0 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hadc081b85dabefa7E>
  120798:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  12079d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  1207a2:	80 f9 18             	cmp    $0x18,%cl
  1207a5:	0f 84 3b fd ff ff    	je     1204e6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x536>
  1207ab:	e9 9d 03 00 00       	jmp    120b4d <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb9d>
  1207b0:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  1207b7:	00 
  1207b8:	48 8b 94 24 f0 00 00 	mov    0xf0(%rsp),%rdx
  1207bf:	00 
  1207c0:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  1207c5:	48 39 c8             	cmp    %rcx,%rax
  1207c8:	74 3c                	je     120806 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x856>
  1207ca:	48 39 ca             	cmp    %rcx,%rdx
  1207cd:	0f 85 ba 01 00 00    	jne    12098d <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x9dd>
  1207d3:	48 89 c2             	mov    %rax,%rdx
  1207d6:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1207dd:	00 
  1207de:	48 8b 40 10          	mov    0x10(%rax),%rax
  1207e2:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  1207e9:	00 
  1207ea:	73 34                	jae    120820 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x870>
  1207ec:	e9 f0 01 00 00       	jmp    1209e1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa31>
  1207f1:	39 ac 24 b8 00 00 00 	cmp    %ebp,0xb8(%rsp)
  1207f8:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  1207fd:	48 0f 44 94 24 c8 00 	cmove  0xc8(%rsp),%rdx
  120804:	00 00 
  120806:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  12080d:	00 
  12080e:	48 8b 40 10          	mov    0x10(%rax),%rax
  120812:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  120819:	00 
  12081a:	0f 82 c1 01 00 00    	jb     1209e1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa31>
  120820:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
  120825:	48 01 c1             	add    %rax,%rcx
  120828:	48 39 c1             	cmp    %rax,%rcx
  12082b:	0f 82 b0 01 00 00    	jb     1209e1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa31>
  120831:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  120836:	48 8b 40 48          	mov    0x48(%rax),%rax
  12083a:	48 3b 08             	cmp    (%rax),%rcx
  12083d:	0f 83 9e 01 00 00    	jae    1209e1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa31>
  120843:	48 8b 48 10          	mov    0x10(%rax),%rcx
  120847:	48 85 c9             	test   %rcx,%rcx
  12084a:	74 0c                	je     120858 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x8a8>
  12084c:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  120850:	84 c9                	test   %cl,%cl
  120852:	0f 85 10 03 00 00    	jne    120b68 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbb8>
  120858:	48 8b 48 08          	mov    0x8(%rax),%rcx
  12085c:	48 85 c9             	test   %rcx,%rcx
  12085f:	0f 84 ff 02 00 00    	je     120b64 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbb4>
  120865:	48 ff c9             	dec    %rcx
  120868:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12086c:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  120873:	00 
  120874:	48 8b 01             	mov    (%rcx),%rax
  120877:	48 85 c0             	test   %rax,%rax
  12087a:	74 74                	je     1208f0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x940>
  12087c:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  120880:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  120887:	41 89 f8             	mov    %edi,%r8d
  12088a:	41 c1 e0 04          	shl    $0x4,%r8d
  12088e:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  120895:	49 89 c1             	mov    %rax,%r9
  120898:	eb 1f                	jmp    1208b9 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x909>
  12089a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  1208a0:	41 0f 97 c2          	seta   %r10b
  1208a4:	41 80 da 00          	sbb    $0x0,%r10b
  1208a8:	49 83 c1 10          	add    $0x10,%r9
  1208ac:	48 ff c1             	inc    %rcx
  1208af:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  1208b3:	41 80 fa 01          	cmp    $0x1,%r10b
  1208b7:	75 10                	jne    1208c9 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x919>
  1208b9:	4d 85 c0             	test   %r8,%r8
  1208bc:	74 15                	je     1208d3 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x923>
  1208be:	4d 3b 31             	cmp    (%r9),%r14
  1208c1:	75 dd                	jne    1208a0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x8f0>
  1208c3:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  1208c7:	eb d7                	jmp    1208a0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x8f0>
  1208c9:	41 0f b6 fa          	movzbl %r10b,%edi
  1208cd:	85 ff                	test   %edi,%edi
  1208cf:	75 05                	jne    1208d6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x926>
  1208d1:	eb 13                	jmp    1208e6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x936>
  1208d3:	48 89 f9             	mov    %rdi,%rcx
  1208d6:	48 83 ee 01          	sub    $0x1,%rsi
  1208da:	72 16                	jb     1208f2 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x942>
  1208dc:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  1208e3:	00 
  1208e4:	eb 9a                	jmp    120880 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x8d0>
  1208e6:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  1208ed:	00 
  1208ee:	eb 3a                	jmp    12092a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x97a>
  1208f0:	31 c0                	xor    %eax,%eax
  1208f2:	48 8b b4 24 80 01 00 	mov    0x180(%rsp),%rsi
  1208f9:	00 
  1208fa:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  1208ff:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
  120904:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  120908:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  12090d:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  120914:	00 00 
  120916:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  12091b:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  120920:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  120925:	e8 f6 16 01 00       	call   132020 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h7f4cb0d8e615b631E>
  12092a:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  120931:	00 
  120932:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  120936:	48 83 f9 16          	cmp    $0x16,%rcx
  12093a:	b9 00 00 00 00       	mov    $0x0,%ecx
  12093f:	48 0f 42 c1          	cmovb  %rcx,%rax
  120943:	48 83 f8 01          	cmp    $0x1,%rax
  120947:	74 1b                	je     120964 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x9b4>
  120949:	48 85 c0             	test   %rax,%rax
  12094c:	0f 85 5e f7 ff ff    	jne    1200b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x100>
  120952:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  120959:	00 
  12095a:	e8 c1 06 00 00       	call   121020 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h067c67ce55b55a21E.llvm.9576406186078755599>
  12095f:	e9 4c f7 ff ff       	jmp    1200b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x100>
  120964:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  12096b:	00 
  12096c:	48 85 f6             	test   %rsi,%rsi
  12096f:	0f 8e 3b f7 ff ff    	jle    1200b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x100>
  120975:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  12097c:	00 
  12097d:	ba 01 00 00 00       	mov    $0x1,%edx
  120982:	ff 15 20 19 1d 00    	call   *0x1d1920(%rip)        # 2f22a8 <_DYNAMIC+0x278>
  120988:	e9 23 f7 ff ff       	jmp    1200b0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x100>
  12098d:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  120992:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  120997:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  12099c:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  1209a1:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1209a6:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  1209ab:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1209b0:	e8 fb 4d 02 00       	call   1457b0 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hadc081b85dabefa7E>
  1209b5:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  1209ba:	3c 18                	cmp    $0x18,%al
  1209bc:	0f 85 b3 01 00 00    	jne    120b75 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbc5>
  1209c2:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
  1209c7:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  1209ce:	00 
  1209cf:	48 8b 40 10          	mov    0x10(%rax),%rax
  1209d3:	48 03 84 24 88 01 00 	add    0x188(%rsp),%rax
  1209da:	00 
  1209db:	0f 83 3f fe ff ff    	jae    120820 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x870>
  1209e1:	48 8b 1c 24          	mov    (%rsp),%rbx
  1209e5:	c6 03 10             	movb   $0x10,(%rbx)
  1209e8:	eb 2f                	jmp    120a19 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa69>
  1209ea:	b1 11                	mov    $0x11,%cl
  1209ec:	88 0b                	mov    %cl,(%rbx)
  1209ee:	e9 9b f6 ff ff       	jmp    12008e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xde>
  1209f3:	8b 44 24 61          	mov    0x61(%rsp),%eax
  1209f7:	8b 54 24 64          	mov    0x64(%rsp),%edx
  1209fb:	48 8b 1c 24          	mov    (%rsp),%rbx
  1209ff:	89 53 04             	mov    %edx,0x4(%rbx)
  120a02:	89 43 01             	mov    %eax,0x1(%rbx)
  120a05:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  120a0a:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  120a0f:	88 0b                	mov    %cl,(%rbx)
  120a11:	48 89 43 08          	mov    %rax,0x8(%rbx)
  120a15:	48 89 53 10          	mov    %rdx,0x10(%rbx)
  120a19:	0f b6 8c 24 98 00 00 	movzbl 0x98(%rsp),%ecx
  120a20:	00 
  120a21:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  120a25:	31 c0                	xor    %eax,%eax
  120a27:	48 83 f9 16          	cmp    $0x16,%rcx
  120a2b:	48 0f 43 c2          	cmovae %rdx,%rax
  120a2f:	48 83 f8 01          	cmp    $0x1,%rax
  120a33:	0f 84 c4 00 00 00    	je     120afd <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb4d>
  120a39:	48 85 c0             	test   %rax,%rax
  120a3c:	0f 85 e4 00 00 00    	jne    120b26 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb76>
  120a42:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  120a49:	00 
  120a4a:	e8 d1 05 00 00       	call   121020 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h067c67ce55b55a21E.llvm.9576406186078755599>
  120a4f:	e9 d2 00 00 00       	jmp    120b26 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb76>
  120a54:	b0 11                	mov    $0x11,%al
  120a56:	e9 9a 00 00 00       	jmp    120af5 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb45>
  120a5b:	48 8b 8c 24 80 01 00 	mov    0x180(%rsp),%rcx
  120a62:	00 
  120a63:	48 8b 01             	mov    (%rcx),%rax
  120a66:	48 85 c0             	test   %rax,%rax
  120a69:	48 8b 1c 24          	mov    (%rsp),%rbx
  120a6d:	0f 84 8e 01 00 00    	je     120c01 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc51>
  120a73:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  120a77:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  120a7e:	89 f7                	mov    %esi,%edi
  120a80:	c1 e7 04             	shl    $0x4,%edi
  120a83:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  120a8a:	49 89 c0             	mov    %rax,%r8
  120a8d:	eb 1a                	jmp    120aa9 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaf9>
  120a8f:	90                   	nop
  120a90:	41 0f 97 c1          	seta   %r9b
  120a94:	41 80 d9 00          	sbb    $0x0,%r9b
  120a98:	49 83 c0 10          	add    $0x10,%r8
  120a9c:	48 ff c2             	inc    %rdx
  120a9f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  120aa3:	41 80 f9 01          	cmp    $0x1,%r9b
  120aa7:	75 18                	jne    120ac1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb11>
  120aa9:	48 85 ff             	test   %rdi,%rdi
  120aac:	74 1d                	je     120acb <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb1b>
  120aae:	4c 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%r9
  120ab5:	00 
  120ab6:	4d 3b 08             	cmp    (%r8),%r9
  120ab9:	75 d5                	jne    120a90 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xae0>
  120abb:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  120abf:	eb cf                	jmp    120a90 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xae0>
  120ac1:	41 0f b6 f1          	movzbl %r9b,%esi
  120ac5:	85 f6                	test   %esi,%esi
  120ac7:	75 05                	jne    120ace <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb1e>
  120ac9:	eb 17                	jmp    120ae2 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb32>
  120acb:	48 89 f2             	mov    %rsi,%rdx
  120ace:	48 83 e9 01          	sub    $0x1,%rcx
  120ad2:	0f 82 29 01 00 00    	jb     120c01 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc51>
  120ad8:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  120adf:	00 
  120ae0:	eb 95                	jmp    120a77 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xac7>
  120ae2:	48 8b 84 d0 b8 00 00 	mov    0xb8(%rax,%rdx,8),%rax
  120ae9:	00 
  120aea:	48 89 43 08          	mov    %rax,0x8(%rbx)
  120aee:	c6 03 18             	movb   $0x18,(%rbx)
  120af1:	eb 33                	jmp    120b26 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb76>
  120af3:	b0 12                	mov    $0x12,%al
  120af5:	48 8b 1c 24          	mov    (%rsp),%rbx
  120af9:	88 03                	mov    %al,(%rbx)
  120afb:	eb 29                	jmp    120b26 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb76>
  120afd:	48 8b b4 24 a0 00 00 	mov    0xa0(%rsp),%rsi
  120b04:	00 
  120b05:	48 85 f6             	test   %rsi,%rsi
  120b08:	7e 1c                	jle    120b26 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb76>
  120b0a:	48 8b bc 24 a8 00 00 	mov    0xa8(%rsp),%rdi
  120b11:	00 
  120b12:	ba 01 00 00 00       	mov    $0x1,%edx
  120b17:	ff 15 8b 17 1d 00    	call   *0x1d178b(%rip)        # 2f22a8 <_DYNAMIC+0x278>
  120b1d:	eb 07                	jmp    120b26 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb76>
  120b1f:	48 8b 1c 24          	mov    (%rsp),%rbx
  120b23:	c6 03 10             	movb   $0x10,(%rbx)
  120b26:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  120b2b:	48 85 f6             	test   %rsi,%rsi
  120b2e:	0f 84 5a f5 ff ff    	je     12008e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xde>
  120b34:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  120b39:	48 c1 e6 04          	shl    $0x4,%rsi
  120b3d:	ba 08 00 00 00       	mov    $0x8,%edx
  120b42:	ff 15 60 17 1d 00    	call   *0x1d1760(%rip)        # 2f22a8 <_DYNAMIC+0x278>
  120b48:	e9 41 f5 ff ff       	jmp    12008e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xde>
  120b4d:	8b 54 24 61          	mov    0x61(%rsp),%edx
  120b51:	8b 74 24 64          	mov    0x64(%rsp),%esi
  120b55:	48 8b 1c 24          	mov    (%rsp),%rbx
  120b59:	89 73 04             	mov    %esi,0x4(%rbx)
  120b5c:	89 53 01             	mov    %edx,0x1(%rbx)
  120b5f:	e9 a6 fe ff ff       	jmp    120a0a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa5a>
  120b64:	b0 11                	mov    $0x11,%al
  120b66:	eb 02                	jmp    120b6a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbba>
  120b68:	b0 12                	mov    $0x12,%al
  120b6a:	48 8b 1c 24          	mov    (%rsp),%rbx
  120b6e:	88 03                	mov    %al,(%rbx)
  120b70:	e9 a4 fe ff ff       	jmp    120a19 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa69>
  120b75:	8b 4c 24 61          	mov    0x61(%rsp),%ecx
  120b79:	8b 54 24 64          	mov    0x64(%rsp),%edx
  120b7d:	48 8b 1c 24          	mov    (%rsp),%rbx
  120b81:	89 53 04             	mov    %edx,0x4(%rbx)
  120b84:	89 4b 01             	mov    %ecx,0x1(%rbx)
  120b87:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  120b8d:	88 03                	mov    %al,(%rbx)
  120b8f:	f3 0f 7f 43 08       	movdqu %xmm0,0x8(%rbx)
  120b94:	e9 80 fe ff ff       	jmp    120a19 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa69>
  120b99:	48 8d 3d 5a 3d f9 ff 	lea    -0x6c2a6(%rip),%rdi        # b48fa <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x976>
  120ba0:	48 8d 15 d9 ae 1c 00 	lea    0x1caed9(%rip),%rdx        # 2eba80 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x388>
  120ba7:	be 85 00 00 00       	mov    $0x85,%esi
  120bac:	ff 15 5e 17 1d 00    	call   *0x1d175e(%rip)        # 2f2310 <_DYNAMIC+0x2e0>
  120bb2:	eb 66                	jmp    120c1a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc6a>
  120bb4:	bf 08 00 00 00       	mov    $0x8,%edi
  120bb9:	be 10 00 00 00       	mov    $0x10,%esi
  120bbe:	ff 15 bc 16 1d 00    	call   *0x1d16bc(%rip)        # 2f2280 <_DYNAMIC+0x250>
  120bc4:	48 8d 3d 19 3d f9 ff 	lea    -0x6c2e7(%rip),%rdi        # b48e4 <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x960>
  120bcb:	48 8d 15 96 ae 1c 00 	lea    0x1cae96(%rip),%rdx        # 2eba68 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x370>
  120bd2:	be 16 00 00 00       	mov    $0x16,%esi
  120bd7:	ff 15 ab 17 1d 00    	call   *0x1d17ab(%rip)        # 2f2388 <_DYNAMIC+0x358>
  120bdd:	eb 3b                	jmp    120c1a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc6a>
  120bdf:	48 8d 05 6a ae 1c 00 	lea    0x1cae6a(%rip),%rax        # 2eba50 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x358>
  120be6:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  120bed:	00 
  120bee:	4c 89 f7             	mov    %r14,%rdi
  120bf1:	48 8b 94 24 d0 00 00 	mov    0xd0(%rsp),%rdx
  120bf8:	00 
  120bf9:	ff 15 19 17 1d 00    	call   *0x1d1719(%rip)        # 2f2318 <_DYNAMIC+0x2e8>
  120bff:	eb 19                	jmp    120c1a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc6a>
  120c01:	48 8d 3d dc 3c f9 ff 	lea    -0x6c324(%rip),%rdi        # b48e4 <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x960>
  120c08:	48 8d 15 11 ae 1c 00 	lea    0x1cae11(%rip),%rdx        # 2eba20 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x328>
  120c0f:	be 16 00 00 00       	mov    $0x16,%esi
  120c14:	ff 15 6e 17 1d 00    	call   *0x1d176e(%rip)        # 2f2388 <_DYNAMIC+0x358>
  120c1a:	0f 0b                	ud2
  120c1c:	eb 0b                	jmp    120c29 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc79>
  120c1e:	eb 00                	jmp    120c20 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc70>
  120c20:	48 89 c3             	mov    %rax,%rbx
  120c23:	eb 14                	jmp    120c39 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc89>
  120c25:	eb 02                	jmp    120c29 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc79>
  120c27:	eb 00                	jmp    120c29 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc79>
  120c29:	48 89 c3             	mov    %rax,%rbx
  120c2c:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
  120c33:	00 
  120c34:	e8 87 06 00 00       	call   1212c0 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17h6003a6b70b56c940E>
  120c39:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
  120c3e:	48 85 f6             	test   %rsi,%rsi
  120c41:	74 14                	je     120c57 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xca7>
  120c43:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  120c48:	48 c1 e6 04          	shl    $0x4,%rsi
  120c4c:	ba 08 00 00 00       	mov    $0x8,%edx
  120c51:	ff 15 51 16 1d 00    	call   *0x1d1651(%rip)        # 2f22a8 <_DYNAMIC+0x278>
  120c57:	48 89 df             	mov    %rbx,%rdi
  120c5a:	e8 01 74 1c 00       	call   2e8060 <_Unwind_Resume@plt>
  120c5f:	ff 15 5b 16 1d 00    	call   *0x1d165b(%rip)        # 2f22c0 <_DYNAMIC+0x290>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
