
/mnt/development/.interval-refactor-build/taylor-scheduling-reconsideration/artifacts/baseline-flow_noise-ee6f4bf07111:     file format elf64-x86-64


Disassembly of section .text:

000000000011ffb0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE>:
  11ffb0:	55                   	push   %rbp
  11ffb1:	41 57                	push   %r15
  11ffb3:	41 56                	push   %r14
  11ffb5:	41 55                	push   %r13
  11ffb7:	41 54                	push   %r12
  11ffb9:	53                   	push   %rbx
  11ffba:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
  11ffc1:	4c 89 8c 24 c0 00 00 	mov    %r9,0xc0(%rsp)
  11ffc8:	00 
  11ffc9:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
  11ffce:	89 cd                	mov    %ecx,%ebp
  11ffd0:	48 89 94 24 d0 00 00 	mov    %rdx,0xd0(%rsp)
  11ffd7:	00 
  11ffd8:	49 89 fd             	mov    %rdi,%r13
  11ffdb:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  11ffe2:	00 
  11ffe3:	48 8b 48 10          	mov    0x10(%rax),%rcx
  11ffe7:	48 03 8c 24 78 01 00 	add    0x178(%rsp),%rcx
  11ffee:	00 
  11ffef:	72 7b                	jb     12006c <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbc>
  11fff1:	48 8b 46 48          	mov    0x48(%rsi),%rax
  11fff5:	48 3b 08             	cmp    (%rax),%rcx
  11fff8:	73 72                	jae    12006c <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbc>
  11fffa:	48 8b 48 10          	mov    0x10(%rax),%rcx
  11fffe:	48 85 c9             	test   %rcx,%rcx
  120001:	74 0e                	je     120011 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x61>
  120003:	0f b6 51 10          	movzbl 0x10(%rcx),%edx
  120007:	b1 12                	mov    $0x12,%cl
  120009:	84 d2                	test   %dl,%dl
  12000b:	0f 85 b5 09 00 00    	jne    1209c6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa16>
  120011:	48 8b 48 08          	mov    0x8(%rax),%rcx
  120015:	48 85 c9             	test   %rcx,%rcx
  120018:	0f 84 a6 09 00 00    	je     1209c4 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa14>
  12001e:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  120023:	48 ff c9             	dec    %rcx
  120026:	48 89 48 08          	mov    %rcx,0x8(%rax)
  12002a:	ff 15 f8 21 1d 00    	call   *0x1d21f8(%rip)        # 2f2228 <_DYNAMIC+0x240>
  120030:	bf 10 00 00 00       	mov    $0x10,%edi
  120035:	be 08 00 00 00       	mov    $0x8,%esi
  12003a:	ff 15 f0 21 1d 00    	call   *0x1d21f0(%rip)        # 2f2230 <_DYNAMIC+0x248>
  120040:	48 85 c0             	test   %rax,%rax
  120043:	0f 84 4f 0b 00 00    	je     120b98 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbe8>
  120049:	48 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%rcx
  120050:	00 
  120051:	48 89 08             	mov    %rcx,(%rax)
  120054:	c6 40 08 00          	movb   $0x0,0x8(%rax)
  120058:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
  12005f:	00 
  120060:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  120065:	b8 01 00 00 00       	mov    $0x1,%eax
  12006a:	eb 32                	jmp    12009e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xee>
  12006c:	41 c6 45 00 10       	movb   $0x10,0x0(%r13)
  120071:	4c 89 e8             	mov    %r13,%rax
  120074:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
  12007b:	5b                   	pop    %rbx
  12007c:	41 5c                	pop    %r12
  12007e:	41 5d                	pop    %r13
  120080:	41 5e                	pop    %r14
  120082:	41 5f                	pop    %r15
  120084:	5d                   	pop    %rbp
  120085:	c3                   	ret
  120086:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  12008d:	00 00 00 
  120090:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  120095:	48 85 c0             	test   %rax,%rax
  120098:	0f 84 7e 09 00 00    	je     120a1c <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa6c>
  12009e:	48 ff c8             	dec    %rax
  1200a1:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  1200a6:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  1200ab:	48 c1 e0 04          	shl    $0x4,%rax
  1200af:	4c 8b 34 01          	mov    (%rcx,%rax,1),%r14
  1200b3:	0f b6 5c 01 08       	movzbl 0x8(%rcx,%rax,1),%ebx
  1200b8:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1200bd:	48 8b 40 48          	mov    0x48(%rax),%rax
  1200c1:	48 8b 48 10          	mov    0x10(%rax),%rcx
  1200c5:	48 85 c9             	test   %rcx,%rcx
  1200c8:	74 0c                	je     1200d6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x126>
  1200ca:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  1200ce:	84 c9                	test   %cl,%cl
  1200d0:	0f 85 df 09 00 00    	jne    120ab5 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb05>
  1200d6:	48 8b 48 08          	mov    0x8(%rax),%rcx
  1200da:	48 85 c9             	test   %rcx,%rcx
  1200dd:	0f 84 28 09 00 00    	je     120a0b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa5b>
  1200e3:	48 ff c9             	dec    %rcx
  1200e6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  1200ea:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  1200f1:	00 
  1200f2:	48 8b 00             	mov    (%rax),%rax
  1200f5:	48 85 c0             	test   %rax,%rax
  1200f8:	0f 84 92 00 00 00    	je     120190 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1e0>
  1200fe:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  120105:	00 
  120106:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  12010a:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  120111:	89 f7                	mov    %esi,%edi
  120113:	c1 e7 04             	shl    $0x4,%edi
  120116:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  12011d:	49 89 c0             	mov    %rax,%r8
  120120:	eb 27                	jmp    120149 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x199>
  120122:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  120129:	1f 84 00 00 00 00 00 
  120130:	41 0f 97 c1          	seta   %r9b
  120134:	41 80 d9 00          	sbb    $0x0,%r9b
  120138:	49 83 c0 10          	add    $0x10,%r8
  12013c:	48 ff c2             	inc    %rdx
  12013f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  120143:	41 80 f9 01          	cmp    $0x1,%r9b
  120147:	75 17                	jne    120160 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1b0>
  120149:	48 85 ff             	test   %rdi,%rdi
  12014c:	74 22                	je     120170 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1c0>
  12014e:	4d 3b 30             	cmp    (%r8),%r14
  120151:	75 dd                	jne    120130 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x180>
  120153:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  120157:	eb d7                	jmp    120130 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x180>
  120159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  120160:	41 0f b6 f1          	movzbl %r9b,%esi
  120164:	85 f6                	test   %esi,%esi
  120166:	75 0b                	jne    120173 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1c3>
  120168:	e9 23 ff ff ff       	jmp    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  12016d:	0f 1f 00             	nopl   (%rax)
  120170:	48 89 f2             	mov    %rsi,%rdx
  120173:	48 83 e9 01          	sub    $0x1,%rcx
  120177:	72 17                	jb     120190 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x1e0>
  120179:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  120180:	00 
  120181:	eb 87                	jmp    12010a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x15a>
  120183:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  12018a:	84 00 00 00 00 00 
  120190:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  120195:	48 8b 70 28          	mov    0x28(%rax),%rsi
  120199:	49 39 f6             	cmp    %rsi,%r14
  12019c:	0f 83 21 0a 00 00    	jae    120bc3 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc13>
  1201a2:	48 8b 40 20          	mov    0x20(%rax),%rax
  1201a6:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
  1201aa:	48 c1 e1 04          	shl    $0x4,%rcx
  1201ae:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
  1201b2:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
  1201b6:	48 8d 48 eb          	lea    -0x15(%rax),%rcx
  1201ba:	48 83 f8 16          	cmp    $0x16,%rax
  1201be:	b8 00 00 00 00       	mov    $0x0,%eax
  1201c3:	48 0f 42 c8          	cmovb  %rax,%rcx
  1201c7:	48 8d 15 1e 46 f9 ff 	lea    -0x6b9e2(%rip),%rdx        # b47ec <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x878>
  1201ce:	48 63 04 8a          	movslq (%rdx,%rcx,4),%rax
  1201d2:	48 01 d0             	add    %rdx,%rax
  1201d5:	ff e0                	jmp    *%rax
  1201d7:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1201dc:	e8 cf 16 00 00       	call   1218b0 <_ZN72_$LT$hyperreal..real..arithmetic..Real$u20$as$u20$core..clone..Clone$GT$5clone17h9f16100dc643f807E.llvm.1190106385817124988>
  1201e1:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
  1201e6:	e9 8f 00 00 00       	jmp    12027a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x2ca>
  1201eb:	48 8b 46 18          	mov    0x18(%rsi),%rax
  1201ef:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  1201f4:	f3 0f 7f 44 24 68    	movdqu %xmm0,0x68(%rsp)
  1201fa:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  1201ff:	b0 17                	mov    $0x17,%al
  120201:	eb 73                	jmp    120276 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x2c6>
  120203:	0f b6 46 18          	movzbl 0x18(%rsi),%eax
  120207:	88 44 24 78          	mov    %al,0x78(%rsp)
  12020b:	f3 0f 6f 46 08       	movdqu 0x8(%rsi),%xmm0
  120210:	f3 0f 7f 44 24 68    	movdqu %xmm0,0x68(%rsp)
  120216:	b0 18                	mov    $0x18,%al
  120218:	eb 5c                	jmp    120276 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x2c6>
  12021a:	44 8b 7e 20          	mov    0x20(%rsi),%r15d
  12021e:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  120225:	00 00 80 
  120228:	48 89 c8             	mov    %rcx,%rax
  12022b:	48 39 4e 08          	cmp    %rcx,0x8(%rsi)
  12022f:	74 24                	je     120255 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x2a5>
  120231:	48 83 c6 08          	add    $0x8,%rsi
  120235:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  12023a:	ff 15 68 20 1d 00    	call   *0x1d2068(%rip)        # 2f22a8 <_DYNAMIC+0x2c0>
  120240:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  120245:	48 8d 4c 24 38       	lea    0x38(%rsp),%rcx
  12024a:	0f 10 01             	movups (%rcx),%xmm0
  12024d:	0f 29 84 24 90 00 00 	movaps %xmm0,0x90(%rsp)
  120254:	00 
  120255:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  12025a:	66 0f 6f 84 24 90 00 	movdqa 0x90(%rsp),%xmm0
  120261:	00 00 
  120263:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  120268:	f3 0f 7f 00          	movdqu %xmm0,(%rax)
  12026c:	44 89 bc 24 80 00 00 	mov    %r15d,0x80(%rsp)
  120273:	00 
  120274:	b0 16                	mov    $0x16,%al
  120276:	88 44 24 60          	mov    %al,0x60(%rsp)
  12027a:	0f b6 c8             	movzbl %al,%ecx
  12027d:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  120281:	80 f9 16             	cmp    $0x16,%cl
  120284:	b9 00 00 00 00       	mov    $0x0,%ecx
  120289:	48 0f 42 c1          	cmovb  %rcx,%rax
  12028d:	84 db                	test   %bl,%bl
  12028f:	74 37                	je     1202c8 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x318>
  120291:	48 8d 0d 64 45 f9 ff 	lea    -0x6ba9c(%rip),%rcx        # b47fc <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x888>
  120298:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  12029c:	48 01 c8             	add    %rcx,%rax
  12029f:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  1202a4:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  1202ab:	00 
  1202ac:	ff e0                	jmp    *%rax
  1202ae:	39 ac 24 80 00 00 00 	cmp    %ebp,0x80(%rsp)
  1202b5:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  1202ba:	48 0f 44 94 24 c0 00 	cmove  0xc0(%rsp),%rdx
  1202c1:	00 00 
  1202c3:	e9 7f 05 00 00       	jmp    120847 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x897>
  1202c8:	83 f8 02             	cmp    $0x2,%eax
  1202cb:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  1202d2:	00 
  1202d3:	73 0a                	jae    1202df <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x32f>
  1202d5:	45 31 ff             	xor    %r15d,%r15d
  1202d8:	31 db                	xor    %ebx,%ebx
  1202da:	e9 c3 03 00 00       	jmp    1206a2 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6f2>
  1202df:	83 f8 02             	cmp    $0x2,%eax
  1202e2:	0f 85 95 03 00 00    	jne    12067d <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6cd>
  1202e8:	bb 01 00 00 00       	mov    $0x1,%ebx
  1202ed:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
  1202f2:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  1202f9:	00 
  1202fa:	45 31 ff             	xor    %r15d,%r15d
  1202fd:	e9 a0 03 00 00       	jmp    1206a2 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6f2>
  120302:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  120307:	f3 0f 6f 44 24 78    	movdqu 0x78(%rsp),%xmm0
  12030d:	66 0f 70 c0 44       	pshufd $0x44,%xmm0,%xmm0
  120312:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  120318:	eb 11                	jmp    12032b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x37b>
  12031a:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
  12031f:	41 bf 02 00 00 00    	mov    $0x2,%r15d
  120325:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  12032b:	66 0f 7f 84 24 f0 00 	movdqa %xmm0,0xf0(%rsp)
  120332:	00 00 
  120334:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  120339:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
  120340:	00 
  120341:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  120348:	00 
  120349:	31 db                	xor    %ebx,%ebx
  12034b:	eb 27                	jmp    120374 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3c4>
  12034d:	4c 89 e0             	mov    %r12,%rax
  120350:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  120357:	00 
  120358:	48 89 84 dc d8 00 00 	mov    %rax,0xd8(%rsp,%rbx,8)
  12035f:	00 
  120360:	4c 89 eb             	mov    %r13,%rbx
  120363:	4d 39 fd             	cmp    %r15,%r13
  120366:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  12036d:	00 
  12036e:	0f 84 e1 02 00 00    	je     120655 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x6a5>
  120374:	48 8b 01             	mov    (%rcx),%rax
  120377:	48 85 c0             	test   %rax,%rax
  12037a:	0f 84 28 08 00 00    	je     120ba8 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbf8>
  120380:	4c 8d 6b 01          	lea    0x1(%rbx),%r13
  120384:	48 8b 8c dc f0 00 00 	mov    0xf0(%rsp,%rbx,8),%rcx
  12038b:	00 
  12038c:	48 8b 94 24 70 01 00 	mov    0x170(%rsp),%rdx
  120393:	00 
  120394:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  120398:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  12039f:	41 89 f8             	mov    %edi,%r8d
  1203a2:	41 c1 e0 04          	shl    $0x4,%r8d
  1203a6:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  1203ad:	49 89 c1             	mov    %rax,%r9
  1203b0:	eb 27                	jmp    1203d9 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x429>
  1203b2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1203b9:	1f 84 00 00 00 00 00 
  1203c0:	41 0f 97 c2          	seta   %r10b
  1203c4:	41 80 da 00          	sbb    $0x0,%r10b
  1203c8:	49 83 c1 10          	add    $0x10,%r9
  1203cc:	48 ff c6             	inc    %rsi
  1203cf:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  1203d3:	41 80 fa 01          	cmp    $0x1,%r10b
  1203d7:	75 17                	jne    1203f0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x440>
  1203d9:	4d 85 c0             	test   %r8,%r8
  1203dc:	74 22                	je     120400 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x450>
  1203de:	49 3b 09             	cmp    (%r9),%rcx
  1203e1:	75 dd                	jne    1203c0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x410>
  1203e3:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  1203e7:	eb d7                	jmp    1203c0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x410>
  1203e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  1203f0:	41 0f b6 fa          	movzbl %r10b,%edi
  1203f4:	85 ff                	test   %edi,%edi
  1203f6:	75 0b                	jne    120403 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x453>
  1203f8:	eb 26                	jmp    120420 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x470>
  1203fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  120400:	48 89 fe             	mov    %rdi,%rsi
  120403:	48 83 ea 01          	sub    $0x1,%rdx
  120407:	0f 82 9b 07 00 00    	jb     120ba8 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbf8>
  12040d:	48 8b 84 f0 18 01 00 	mov    0x118(%rax,%rsi,8),%rax
  120414:	00 
  120415:	eb 81                	jmp    120398 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3e8>
  120417:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  12041e:	00 00 
  120420:	4c 8b a4 f0 b8 00 00 	mov    0xb8(%rax,%rsi,8),%r12
  120427:	00 
  120428:	4c 3b 64 24 20       	cmp    0x20(%rsp),%r12
  12042d:	0f 84 2d ff ff ff    	je     120360 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3b0>
  120433:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  120438:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  12043c:	48 83 f9 16          	cmp    $0x16,%rcx
  120440:	b9 00 00 00 00       	mov    $0x0,%ecx
  120445:	48 0f 42 c1          	cmovb  %rcx,%rax
  120449:	48 83 f8 02          	cmp    $0x2,%rax
  12044d:	0f 84 7d 00 00 00    	je     1204d0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x520>
  120453:	83 f8 03             	cmp    $0x3,%eax
  120456:	0f 85 21 07 00 00    	jne    120b7d <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xbcd>
  12045c:	0f b6 44 24 78       	movzbl 0x78(%rsp),%eax
  120461:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
  120468:	00 00 80 
  12046b:	48 89 8c 24 98 00 00 	mov    %rcx,0x98(%rsp)
  120472:	00 
  120473:	c7 84 24 b0 00 00 00 	movl   $0x0,0xb0(%rsp)
  12047a:	00 00 00 00 
  12047e:	c6 84 24 90 00 00 00 	movb   $0x16,0x90(%rsp)
  120485:	16 
  120486:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  12048b:	c7 44 24 50 01 00 00 	movl   $0x1,0x50(%rsp)
  120492:	00 
  120493:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  120498:	48 8d 0d 6d 43 f9 ff 	lea    -0x6bc93(%rip),%rcx        # b480c <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x898>
  12049f:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  1204a3:	48 01 c8             	add    %rcx,%rax
  1204a6:	ff e0                	jmp    *%rax
  1204a8:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  1204af:	00 
  1204b0:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  1204b7:	00 
  1204b8:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1204bd:	ff 15 65 21 1d 00    	call   *0x1d2165(%rip)        # 2f2628 <_DYNAMIC+0x640>
  1204c3:	eb 43                	jmp    120508 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x558>
  1204c5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  1204cc:	00 00 00 00 
  1204d0:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  1204d5:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
  1204da:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
  1204e1:	00 00 80 
  1204e4:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  1204e9:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%rsp)
  1204f0:	00 
  1204f1:	c6 44 24 30 16       	movb   $0x16,0x30(%rsp)
  1204f6:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  1204fd:	00 
  1204fe:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
  120503:	e8 78 3a 02 00       	call   143f80 <_ZN10hypersolve18expression_program8jacobian5unary17hdb6730d84700a311E>
  120508:	f3 0f 6f 84 24 08 01 	movdqu 0x108(%rsp),%xmm0
  12050f:	00 00 
  120511:	0f 10 8c 24 18 01 00 	movups 0x118(%rsp),%xmm1
  120518:	00 
  120519:	0f 10 94 24 28 01 00 	movups 0x128(%rsp),%xmm2
  120520:	00 
  120521:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  120526:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  12052b:	66 0f 7f 44 24 30    	movdqa %xmm0,0x30(%rsp)
  120531:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  120538:	00 
  120539:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  12053e:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120543:	89 d9                	mov    %ebx,%ecx
  120545:	4c 8d 84 24 f0 00 00 	lea    0xf0(%rsp),%r8
  12054c:	00 
  12054d:	4d 89 f9             	mov    %r15,%r9
  120550:	ff b4 24 c0 00 00 00 	push   0xc0(%rsp)
  120557:	ff 74 24 28          	push   0x28(%rsp)
  12055b:	e8 c0 53 02 00       	call   145920 <_ZN10hypersolve18expression_program8jacobian7Builder7partial17h7595def89b272616E>
  120560:	48 83 c4 10          	add    $0x10,%rsp
  120564:	0f b6 8c 24 90 00 00 	movzbl 0x90(%rsp),%ecx
  12056b:	00 
  12056c:	80 f9 18             	cmp    $0x18,%cl
  12056f:	0f 85 5a 04 00 00    	jne    1209cf <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa1f>
  120575:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
  12057c:	00 
  12057d:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  120582:	48 89 d0             	mov    %rdx,%rax
  120585:	48 39 d1             	cmp    %rdx,%rcx
  120588:	0f 84 c2 fd ff ff    	je     120350 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3a0>
  12058e:	48 8b 84 24 c0 00 00 	mov    0xc0(%rsp),%rax
  120595:	00 
  120596:	48 39 c1             	cmp    %rax,%rcx
  120599:	0f 84 ae fd ff ff    	je     12034d <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x39d>
  12059f:	49 39 c4             	cmp    %rax,%r12
  1205a2:	75 68                	jne    12060c <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x65c>
  1205a4:	48 89 c8             	mov    %rcx,%rax
  1205a7:	e9 a4 fd ff ff       	jmp    120350 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3a0>
  1205ac:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  1205b3:	00 
  1205b4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  1205bb:	00 
  1205bc:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1205c1:	ff 15 c1 1e 1d 00    	call   *0x1d1ec1(%rip)        # 2f2488 <_DYNAMIC+0x4a0>
  1205c7:	e9 3c ff ff ff       	jmp    120508 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x558>
  1205cc:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  1205d3:	00 
  1205d4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  1205db:	00 
  1205dc:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  1205e1:	ff 15 59 20 1d 00    	call   *0x1d2059(%rip)        # 2f2640 <_DYNAMIC+0x658>
  1205e7:	e9 1c ff ff ff       	jmp    120508 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x558>
  1205ec:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
  1205f3:	00 
  1205f4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
  1205fb:	00 
  1205fc:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120601:	ff 15 31 20 1d 00    	call   *0x1d2031(%rip)        # 2f2638 <_DYNAMIC+0x650>
  120607:	e9 fc fe ff ff       	jmp    120508 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x558>
  12060c:	c6 44 24 48 02       	movb   $0x2,0x48(%rsp)
  120611:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
  120616:	4c 89 64 24 40       	mov    %r12,0x40(%rsp)
  12061b:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  120620:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  120627:	00 
  120628:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  12062d:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120632:	e8 49 51 02 00       	call   145780 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hadc081b85dabefa7E>
  120637:	0f b6 8c 24 90 00 00 	movzbl 0x90(%rsp),%ecx
  12063e:	00 
  12063f:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  120646:	00 
  120647:	80 f9 18             	cmp    $0x18,%cl
  12064a:	0f 84 08 fd ff ff    	je     120358 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x3a8>
  120650:	e9 dc 04 00 00       	jmp    120b31 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb81>
  120655:	48 8b 84 24 d8 00 00 	mov    0xd8(%rsp),%rax
  12065c:	00 
  12065d:	48 8b 94 24 e0 00 00 	mov    0xe0(%rsp),%rdx
  120664:	00 
  120665:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  12066a:	48 39 f0             	cmp    %rsi,%rax
  12066d:	0f 85 7a 01 00 00    	jne    1207ed <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x83d>
  120673:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  120678:	e9 ca 01 00 00       	jmp    120847 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x897>
  12067d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  120682:	48 89 84 24 c8 00 00 	mov    %rax,0xc8(%rsp)
  120689:	00 
  12068a:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  12068f:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
  120696:	00 
  120697:	41 bf 01 00 00 00    	mov    $0x1,%r15d
  12069d:	bb 01 00 00 00       	mov    $0x1,%ebx
  1206a2:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  1206a6:	48 03 94 24 78 01 00 	add    0x178(%rsp),%rdx
  1206ad:	00 
  1206ae:	0f 82 5e 03 00 00    	jb     120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  1206b4:	48 03 54 24 10       	add    0x10(%rsp),%rdx
  1206b9:	0f 82 53 03 00 00    	jb     120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  1206bf:	4a 8d 04 3b          	lea    (%rbx,%r15,1),%rax
  1206c3:	48 ff c0             	inc    %rax
  1206c6:	48 01 c2             	add    %rax,%rdx
  1206c9:	0f 82 43 03 00 00    	jb     120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  1206cf:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  1206d4:	48 8b 49 48          	mov    0x48(%rcx),%rcx
  1206d8:	48 3b 11             	cmp    (%rcx),%rdx
  1206db:	0f 87 31 03 00 00    	ja     120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  1206e1:	48 8b 51 10          	mov    0x10(%rcx),%rdx
  1206e5:	48 85 d2             	test   %rdx,%rdx
  1206e8:	74 0c                	je     1206f6 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x746>
  1206ea:	0f b6 52 10          	movzbl 0x10(%rdx),%edx
  1206ee:	84 d2                	test   %dl,%dl
  1206f0:	0f 85 cb 03 00 00    	jne    120ac1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb11>
  1206f6:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
  1206fa:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1206fe:	48 39 d6             	cmp    %rdx,%rsi
  120701:	0f 83 b6 03 00 00    	jae    120abd <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb0d>
  120707:	48 29 c2             	sub    %rax,%rdx
  12070a:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  12070e:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  120713:	4c 3b 24 24          	cmp    (%rsp),%r12
  120717:	75 09                	jne    120722 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x772>
  120719:	48 89 e7             	mov    %rsp,%rdi
  12071c:	ff 15 8e 1e 1d 00    	call   *0x1d1e8e(%rip)        # 2f25b0 <_DYNAMIC+0x5c8>
  120722:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  120727:	4c 89 e1             	mov    %r12,%rcx
  12072a:	48 c1 e1 04          	shl    $0x4,%rcx
  12072e:	4c 89 34 08          	mov    %r14,(%rax,%rcx,1)
  120732:	c6 44 08 08 01       	movb   $0x1,0x8(%rax,%rcx,1)
  120737:	4d 8d 74 24 01       	lea    0x1(%r12),%r14
  12073c:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  120741:	4d 85 ff             	test   %r15,%r15
  120744:	74 36                	je     12077c <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x7cc>
  120746:	4c 3b 34 24          	cmp    (%rsp),%r14
  12074a:	75 0e                	jne    12075a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x7aa>
  12074c:	48 89 e7             	mov    %rsp,%rdi
  12074f:	ff 15 5b 1e 1d 00    	call   *0x1d1e5b(%rip)        # 2f25b0 <_DYNAMIC+0x5c8>
  120755:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  12075a:	49 c1 e6 04          	shl    $0x4,%r14
  12075e:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
  120765:	00 
  120766:	4a 89 0c 30          	mov    %rcx,(%rax,%r14,1)
  12076a:	42 c6 44 30 08 00    	movb   $0x0,0x8(%rax,%r14,1)
  120770:	49 83 c4 02          	add    $0x2,%r12
  120774:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
  120779:	4d 89 e6             	mov    %r12,%r14
  12077c:	48 85 db             	test   %rbx,%rbx
  12077f:	74 34                	je     1207b5 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x805>
  120781:	4c 3b 34 24          	cmp    (%rsp),%r14
  120785:	75 0e                	jne    120795 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x7e5>
  120787:	48 89 e7             	mov    %rsp,%rdi
  12078a:	ff 15 20 1e 1d 00    	call   *0x1d1e20(%rip)        # 2f25b0 <_DYNAMIC+0x5c8>
  120790:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  120795:	4c 89 f1             	mov    %r14,%rcx
  120798:	48 c1 e1 04          	shl    $0x4,%rcx
  12079c:	48 8b 94 24 c8 00 00 	mov    0xc8(%rsp),%rdx
  1207a3:	00 
  1207a4:	48 89 14 08          	mov    %rdx,(%rax,%rcx,1)
  1207a8:	c6 44 08 08 00       	movb   $0x0,0x8(%rax,%rcx,1)
  1207ad:	49 ff c6             	inc    %r14
  1207b0:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
  1207b5:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  1207ba:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  1207be:	48 83 f9 16          	cmp    $0x16,%rcx
  1207c2:	b9 00 00 00 00       	mov    $0x0,%ecx
  1207c7:	48 0f 42 c1          	cmovb  %rcx,%rax
  1207cb:	48 83 f8 01          	cmp    $0x1,%rax
  1207cf:	0f 84 cc 01 00 00    	je     1209a1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x9f1>
  1207d5:	48 85 c0             	test   %rax,%rax
  1207d8:	0f 85 b2 f8 ff ff    	jne    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  1207de:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  1207e3:	e8 08 08 00 00       	call   120ff0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h067c67ce55b55a21E.llvm.1190106385817124988>
  1207e8:	e9 a3 f8 ff ff       	jmp    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  1207ed:	48 39 f2             	cmp    %rsi,%rdx
  1207f0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  1207f5:	75 05                	jne    1207fc <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x84c>
  1207f7:	48 89 c2             	mov    %rax,%rdx
  1207fa:	eb 4b                	jmp    120847 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x897>
  1207fc:	c6 44 24 48 00       	movb   $0x0,0x48(%rsp)
  120801:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  120806:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  12080b:	c6 44 24 30 18       	movb   $0x18,0x30(%rsp)
  120810:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  120817:	00 
  120818:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  12081d:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  120822:	e8 59 4f 02 00       	call   145780 <_ZN10hypersolve18expression_program8jacobian7Builder4push17hadc081b85dabefa7E>
  120827:	0f b6 84 24 90 00 00 	movzbl 0x90(%rsp),%eax
  12082e:	00 
  12082f:	3c 18                	cmp    $0x18,%al
  120831:	0f 85 1a 03 00 00    	jne    120b51 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xba1>
  120837:	48 8b 94 24 98 00 00 	mov    0x98(%rsp),%rdx
  12083e:	00 
  12083f:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  120846:	00 
  120847:	48 8b 41 10          	mov    0x10(%rcx),%rax
  12084b:	48 03 84 24 78 01 00 	add    0x178(%rsp),%rax
  120852:	00 
  120853:	0f 82 b9 01 00 00    	jb     120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  120859:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  12085e:	48 01 c1             	add    %rax,%rcx
  120861:	48 39 c1             	cmp    %rax,%rcx
  120864:	0f 82 a8 01 00 00    	jb     120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  12086a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  12086f:	48 8b 40 48          	mov    0x48(%rax),%rax
  120873:	48 3b 08             	cmp    (%rax),%rcx
  120876:	0f 83 96 01 00 00    	jae    120a12 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa62>
  12087c:	48 8b 48 10          	mov    0x10(%rax),%rcx
  120880:	48 85 c9             	test   %rcx,%rcx
  120883:	74 0c                	je     120891 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x8e1>
  120885:	0f b6 49 10          	movzbl 0x10(%rcx),%ecx
  120889:	84 c9                	test   %cl,%cl
  12088b:	0f 85 30 02 00 00    	jne    120ac1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb11>
  120891:	48 8b 48 08          	mov    0x8(%rax),%rcx
  120895:	48 85 c9             	test   %rcx,%rcx
  120898:	0f 84 1f 02 00 00    	je     120abd <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb0d>
  12089e:	48 ff c9             	dec    %rcx
  1208a1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  1208a5:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  1208ac:	00 
  1208ad:	48 8b 01             	mov    (%rcx),%rax
  1208b0:	48 85 c0             	test   %rax,%rax
  1208b3:	74 7b                	je     120930 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x980>
  1208b5:	48 8b 71 08          	mov    0x8(%rcx),%rsi
  1208b9:	0f b7 b8 12 01 00 00 	movzwl 0x112(%rax),%edi
  1208c0:	41 89 f8             	mov    %edi,%r8d
  1208c3:	41 c1 e0 04          	shl    $0x4,%r8d
  1208c7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  1208ce:	49 89 c1             	mov    %rax,%r9
  1208d1:	eb 26                	jmp    1208f9 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x949>
  1208d3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1208da:	84 00 00 00 00 00 
  1208e0:	41 0f 97 c2          	seta   %r10b
  1208e4:	41 80 da 00          	sbb    $0x0,%r10b
  1208e8:	49 83 c1 10          	add    $0x10,%r9
  1208ec:	48 ff c1             	inc    %rcx
  1208ef:	49 83 c0 f0          	add    $0xfffffffffffffff0,%r8
  1208f3:	41 80 fa 01          	cmp    $0x1,%r10b
  1208f7:	75 10                	jne    120909 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x959>
  1208f9:	4d 85 c0             	test   %r8,%r8
  1208fc:	74 15                	je     120913 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x963>
  1208fe:	4d 3b 31             	cmp    (%r9),%r14
  120901:	75 dd                	jne    1208e0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x930>
  120903:	41 3b 69 08          	cmp    0x8(%r9),%ebp
  120907:	eb d7                	jmp    1208e0 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x930>
  120909:	41 0f b6 fa          	movzbl %r10b,%edi
  12090d:	85 ff                	test   %edi,%edi
  12090f:	75 05                	jne    120916 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x966>
  120911:	eb 13                	jmp    120926 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x976>
  120913:	48 89 f9             	mov    %rdi,%rcx
  120916:	48 83 ee 01          	sub    $0x1,%rsi
  12091a:	72 16                	jb     120932 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x982>
  12091c:	48 8b 84 c8 18 01 00 	mov    0x118(%rax,%rcx,8),%rax
  120923:	00 
  120924:	eb 93                	jmp    1208b9 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x909>
  120926:	48 89 94 c8 b8 00 00 	mov    %rdx,0xb8(%rax,%rcx,8)
  12092d:	00 
  12092e:	eb 3d                	jmp    12096d <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x9bd>
  120930:	31 c0                	xor    %eax,%eax
  120932:	48 8b b4 24 70 01 00 	mov    0x170(%rsp),%rsi
  120939:	00 
  12093a:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
  12093f:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
  120944:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
  120948:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  12094d:	48 c7 44 24 50 00 00 	movq   $0x0,0x50(%rsp)
  120954:	00 00 
  120956:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
  12095b:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
  120962:	00 
  120963:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  120968:	e8 83 16 01 00       	call   131ff0 <_ZN5alloc11collections5btree3map5entry28VacantEntry$LT$K$C$V$C$A$GT$12insert_entry17h7f4cb0d8e615b631E>
  12096d:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  120972:	48 8d 41 eb          	lea    -0x15(%rcx),%rax
  120976:	48 83 f9 16          	cmp    $0x16,%rcx
  12097a:	b9 00 00 00 00       	mov    $0x0,%ecx
  12097f:	48 0f 42 c1          	cmovb  %rcx,%rax
  120983:	48 83 f8 01          	cmp    $0x1,%rax
  120987:	74 18                	je     1209a1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0x9f1>
  120989:	48 85 c0             	test   %rax,%rax
  12098c:	0f 85 fe f6 ff ff    	jne    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  120992:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  120997:	e8 54 06 00 00       	call   120ff0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h067c67ce55b55a21E.llvm.1190106385817124988>
  12099c:	e9 ef f6 ff ff       	jmp    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  1209a1:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  1209a6:	48 85 f6             	test   %rsi,%rsi
  1209a9:	0f 8e e1 f6 ff ff    	jle    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  1209af:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  1209b4:	ba 01 00 00 00       	mov    $0x1,%edx
  1209b9:	ff 15 a1 18 1d 00    	call   *0x1d18a1(%rip)        # 2f2260 <_DYNAMIC+0x278>
  1209bf:	e9 cc f6 ff ff       	jmp    120090 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xe0>
  1209c4:	b1 11                	mov    $0x11,%cl
  1209c6:	41 88 4d 00          	mov    %cl,0x0(%r13)
  1209ca:	e9 a2 f6 ff ff       	jmp    120071 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc1>
  1209cf:	8b 84 24 91 00 00 00 	mov    0x91(%rsp),%eax
  1209d6:	8b 94 24 94 00 00 00 	mov    0x94(%rsp),%edx
  1209dd:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  1209e2:	41 89 55 04          	mov    %edx,0x4(%r13)
  1209e6:	41 89 45 01          	mov    %eax,0x1(%r13)
  1209ea:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  1209f1:	00 
  1209f2:	48 8b 94 24 a0 00 00 	mov    0xa0(%rsp),%rdx
  1209f9:	00 
  1209fa:	41 88 4d 00          	mov    %cl,0x0(%r13)
  1209fe:	49 89 45 08          	mov    %rax,0x8(%r13)
  120a02:	49 89 55 10          	mov    %rdx,0x10(%r13)
  120a06:	e9 bc 00 00 00       	jmp    120ac7 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb17>
  120a0b:	b0 11                	mov    $0x11,%al
  120a0d:	e9 a5 00 00 00       	jmp    120ab7 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb07>
  120a12:	41 c6 45 00 10       	movb   $0x10,0x0(%r13)
  120a17:	e9 ab 00 00 00       	jmp    120ac7 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb17>
  120a1c:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
  120a23:	00 
  120a24:	48 8b 01             	mov    (%rcx),%rax
  120a27:	48 85 c0             	test   %rax,%rax
  120a2a:	0f 84 a5 01 00 00    	je     120bd5 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc25>
  120a30:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  120a34:	0f b7 b0 12 01 00 00 	movzwl 0x112(%rax),%esi
  120a3b:	89 f7                	mov    %esi,%edi
  120a3d:	c1 e7 04             	shl    $0x4,%edi
  120a40:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  120a47:	49 89 c0             	mov    %rax,%r8
  120a4a:	eb 1d                	jmp    120a69 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xab9>
  120a4c:	0f 1f 40 00          	nopl   0x0(%rax)
  120a50:	41 0f 97 c1          	seta   %r9b
  120a54:	41 80 d9 00          	sbb    $0x0,%r9b
  120a58:	49 83 c0 10          	add    $0x10,%r8
  120a5c:	48 ff c2             	inc    %rdx
  120a5f:	48 83 c7 f0          	add    $0xfffffffffffffff0,%rdi
  120a63:	41 80 f9 01          	cmp    $0x1,%r9b
  120a67:	75 18                	jne    120a81 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xad1>
  120a69:	48 85 ff             	test   %rdi,%rdi
  120a6c:	74 1d                	je     120a8b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xadb>
  120a6e:	4c 8b 8c 24 d0 00 00 	mov    0xd0(%rsp),%r9
  120a75:	00 
  120a76:	4d 3b 08             	cmp    (%r8),%r9
  120a79:	75 d5                	jne    120a50 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaa0>
  120a7b:	41 3b 68 08          	cmp    0x8(%r8),%ebp
  120a7f:	eb cf                	jmp    120a50 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaa0>
  120a81:	41 0f b6 f1          	movzbl %r9b,%esi
  120a85:	85 f6                	test   %esi,%esi
  120a87:	75 05                	jne    120a8e <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xade>
  120a89:	eb 17                	jmp    120aa2 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xaf2>
  120a8b:	48 89 f2             	mov    %rsi,%rdx
  120a8e:	48 83 e9 01          	sub    $0x1,%rcx
  120a92:	0f 82 3d 01 00 00    	jb     120bd5 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc25>
  120a98:	48 8b 84 d0 18 01 00 	mov    0x118(%rax,%rdx,8),%rax
  120a9f:	00 
  120aa0:	eb 92                	jmp    120a34 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa84>
  120aa2:	48 8b 84 d0 b8 00 00 	mov    0xb8(%rax,%rdx,8),%rax
  120aa9:	00 
  120aaa:	49 89 45 08          	mov    %rax,0x8(%r13)
  120aae:	41 c6 45 00 18       	movb   $0x18,0x0(%r13)
  120ab3:	eb 56                	jmp    120b0b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb5b>
  120ab5:	b0 12                	mov    $0x12,%al
  120ab7:	41 88 45 00          	mov    %al,0x0(%r13)
  120abb:	eb 4e                	jmp    120b0b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb5b>
  120abd:	b0 11                	mov    $0x11,%al
  120abf:	eb 02                	jmp    120ac3 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb13>
  120ac1:	b0 12                	mov    $0x12,%al
  120ac3:	41 88 45 00          	mov    %al,0x0(%r13)
  120ac7:	0f b6 4c 24 60       	movzbl 0x60(%rsp),%ecx
  120acc:	48 8d 51 eb          	lea    -0x15(%rcx),%rdx
  120ad0:	31 c0                	xor    %eax,%eax
  120ad2:	48 83 f9 16          	cmp    $0x16,%rcx
  120ad6:	48 0f 43 c2          	cmovae %rdx,%rax
  120ada:	48 83 f8 01          	cmp    $0x1,%rax
  120ade:	74 11                	je     120af1 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb41>
  120ae0:	48 85 c0             	test   %rax,%rax
  120ae3:	75 26                	jne    120b0b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb5b>
  120ae5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  120aea:	e8 01 05 00 00       	call   120ff0 <_ZN4core3ptr54drop_in_place$LT$hyperreal..real..arithmetic..Real$GT$17h067c67ce55b55a21E.llvm.1190106385817124988>
  120aef:	eb 1a                	jmp    120b0b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb5b>
  120af1:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
  120af6:	48 85 f6             	test   %rsi,%rsi
  120af9:	7e 10                	jle    120b0b <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb5b>
  120afb:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
  120b00:	ba 01 00 00 00       	mov    $0x1,%edx
  120b05:	ff 15 55 17 1d 00    	call   *0x1d1755(%rip)        # 2f2260 <_DYNAMIC+0x278>
  120b0b:	48 8b 34 24          	mov    (%rsp),%rsi
  120b0f:	48 85 f6             	test   %rsi,%rsi
  120b12:	0f 84 59 f5 ff ff    	je     120071 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc1>
  120b18:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  120b1d:	48 c1 e6 04          	shl    $0x4,%rsi
  120b21:	ba 08 00 00 00       	mov    $0x8,%edx
  120b26:	ff 15 34 17 1d 00    	call   *0x1d1734(%rip)        # 2f2260 <_DYNAMIC+0x278>
  120b2c:	e9 40 f5 ff ff       	jmp    120071 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc1>
  120b31:	8b 94 24 91 00 00 00 	mov    0x91(%rsp),%edx
  120b38:	8b b4 24 94 00 00 00 	mov    0x94(%rsp),%esi
  120b3f:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
  120b44:	41 89 75 04          	mov    %esi,0x4(%r13)
  120b48:	41 89 55 01          	mov    %edx,0x1(%r13)
  120b4c:	e9 a1 fe ff ff       	jmp    1209f2 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xa42>
  120b51:	8b 8c 24 91 00 00 00 	mov    0x91(%rsp),%ecx
  120b58:	8b 94 24 94 00 00 00 	mov    0x94(%rsp),%edx
  120b5f:	41 89 55 04          	mov    %edx,0x4(%r13)
  120b63:	41 89 4d 01          	mov    %ecx,0x1(%r13)
  120b67:	0f 10 84 24 98 00 00 	movups 0x98(%rsp),%xmm0
  120b6e:	00 
  120b6f:	41 88 45 00          	mov    %al,0x0(%r13)
  120b73:	41 0f 11 45 08       	movups %xmm0,0x8(%r13)
  120b78:	e9 4a ff ff ff       	jmp    120ac7 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xb17>
  120b7d:	48 8d 3d 76 3d f9 ff 	lea    -0x6c28a(%rip),%rdi        # b48fa <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x986>
  120b84:	48 8d 15 ad ae 1c 00 	lea    0x1caead(%rip),%rdx        # 2eba38 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x370>
  120b8b:	be 85 00 00 00       	mov    $0x85,%esi
  120b90:	ff 15 32 17 1d 00    	call   *0x1d1732(%rip)        # 2f22c8 <_DYNAMIC+0x2e0>
  120b96:	eb 56                	jmp    120bee <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc3e>
  120b98:	bf 08 00 00 00       	mov    $0x8,%edi
  120b9d:	be 10 00 00 00       	mov    $0x10,%esi
  120ba2:	ff 15 90 16 1d 00    	call   *0x1d1690(%rip)        # 2f2238 <_DYNAMIC+0x250>
  120ba8:	48 8d 3d 35 3d f9 ff 	lea    -0x6c2cb(%rip),%rdi        # b48e4 <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x970>
  120baf:	48 8d 15 6a ae 1c 00 	lea    0x1cae6a(%rip),%rdx        # 2eba20 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x358>
  120bb6:	be 16 00 00 00       	mov    $0x16,%esi
  120bbb:	ff 15 7f 17 1d 00    	call   *0x1d177f(%rip)        # 2f2340 <_DYNAMIC+0x358>
  120bc1:	eb 2b                	jmp    120bee <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc3e>
  120bc3:	48 8d 15 3e ae 1c 00 	lea    0x1cae3e(%rip),%rdx        # 2eba08 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x340>
  120bca:	4c 89 f7             	mov    %r14,%rdi
  120bcd:	ff 15 fd 16 1d 00    	call   *0x1d16fd(%rip)        # 2f22d0 <_DYNAMIC+0x2e8>
  120bd3:	eb 19                	jmp    120bee <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc3e>
  120bd5:	48 8d 3d 08 3d f9 ff 	lea    -0x6c2f8(%rip),%rdi        # b48e4 <anon.8e7e3338d986d91670d65330ea1130df.15.llvm.3153888639199399543+0x970>
  120bdc:	48 8d 15 0d ae 1c 00 	lea    0x1cae0d(%rip),%rdx        # 2eb9f0 <anon.8e7e3338d986d91670d65330ea1130df.17.llvm.3153888639199399543+0x328>
  120be3:	be 16 00 00 00       	mov    $0x16,%esi
  120be8:	ff 15 52 17 1d 00    	call   *0x1d1752(%rip)        # 2f2340 <_DYNAMIC+0x358>
  120bee:	0f 0b                	ud2
  120bf0:	eb 0b                	jmp    120bfd <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc4d>
  120bf2:	eb 00                	jmp    120bf4 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc44>
  120bf4:	48 89 c3             	mov    %rax,%rbx
  120bf7:	eb 11                	jmp    120c0a <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc5a>
  120bf9:	eb 02                	jmp    120bfd <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc4d>
  120bfb:	eb 00                	jmp    120bfd <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc4d>
  120bfd:	48 89 c3             	mov    %rax,%rbx
  120c00:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  120c05:	e8 86 06 00 00       	call   121290 <_ZN4core3ptr67drop_in_place$LT$hypersolve..expression_program..ExpressionNode$GT$17h6003a6b70b56c940E>
  120c0a:	48 8b 34 24          	mov    (%rsp),%rsi
  120c0e:	48 85 f6             	test   %rsi,%rsi
  120c11:	74 14                	je     120c27 <_ZN10hypersolve18expression_program6taylor6derive17h40bc5f86eecb7e7eE+0xc77>
  120c13:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  120c18:	48 c1 e6 04          	shl    $0x4,%rsi
  120c1c:	ba 08 00 00 00       	mov    $0x8,%edx
  120c21:	ff 15 39 16 1d 00    	call   *0x1d1639(%rip)        # 2f2260 <_DYNAMIC+0x278>
  120c27:	48 89 df             	mov    %rbx,%rdi
  120c2a:	e8 01 74 1c 00       	call   2e8030 <_Unwind_Resume@plt>
  120c2f:	ff 15 43 16 1d 00    	call   *0x1d1643(%rip)        # 2f2278 <_DYNAMIC+0x290>

Disassembly of section .init:

Disassembly of section .fini:

Disassembly of section .plt:
