00000000000110cf <alumina_foc::clarke>:
   110cf:	55                   	push   %rbp
   110d0:	41 57                	push   %r15
   110d2:	41 56                	push   %r14
   110d4:	41 55                	push   %r13
   110d6:	41 54                	push   %r12
   110d8:	53                   	push   %rbx
   110d9:	4c 63 16             	movslq (%rsi),%r10
   110dc:	4c 63 4e 08          	movslq 0x8(%rsi),%r9
   110e0:	4c 63 5e 10          	movslq 0x10(%rsi),%r11
   110e4:	4b 8d 1c 0b          	lea    (%r11,%r9,1),%rbx
   110e8:	4e 8d 34 13          	lea    (%rbx,%r10,1),%r14
   110ec:	48 63 4e 04          	movslq 0x4(%rsi),%rcx
   110f0:	4c 63 46 0c          	movslq 0xc(%rsi),%r8
   110f4:	48 63 76 14          	movslq 0x14(%rsi),%rsi
   110f8:	4a 8d 04 06          	lea    (%rsi,%r8,1),%rax
   110fc:	4c 8d 3c 08          	lea    (%rax,%rcx,1),%r15
   11100:	4d 89 f4             	mov    %r14,%r12
   11103:	49 f7 dc             	neg    %r12
   11106:	4d 0f 48 e6          	cmovs  %r14,%r12
   1110a:	4d 89 fe             	mov    %r15,%r14
   1110d:	49 f7 de             	neg    %r14
   11110:	4d 0f 48 f7          	cmovs  %r15,%r14
   11114:	4d 39 e6             	cmp    %r12,%r14
   11117:	4d 0f 46 f4          	cmovbe %r12,%r14
   1111b:	89 d2                	mov    %edx,%edx
   1111d:	49 39 d6             	cmp    %rdx,%r14
   11120:	76 09                	jbe    1112b <alumina_foc::clarke+0x5c>
   11122:	c6 47 01 0c          	movb   $0xc,0x1(%rdi)
   11126:	e9 9b 00 00 00       	jmp    111c6 <alumina_foc::clarke+0xf7>
   1112b:	4d 01 d2             	add    %r10,%r10
   1112e:	49 29 c2             	sub    %rax,%r10
   11131:	49 bf 56 55 55 55 55 	movabs $0x5555555555555556,%r15
   11138:	55 55 55 
   1113b:	4c 89 d0             	mov    %r10,%rax
   1113e:	49 f7 ef             	imul   %r15
   11141:	48 89 d0             	mov    %rdx,%rax
   11144:	48 c1 e8 3f          	shr    $0x3f,%rax
   11148:	48 01 d0             	add    %rdx,%rax
   1114b:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   1114f:	49 29 d2             	sub    %rdx,%r10
   11152:	49 c1 fa 3f          	sar    $0x3f,%r10
   11156:	49 01 c2             	add    %rax,%r10
   11159:	49 63 c2             	movslq %r10d,%rax
   1115c:	4d 89 d6             	mov    %r10,%r14
   1115f:	49 c1 e6 20          	shl    $0x20,%r14
   11163:	4c 39 d0             	cmp    %r10,%rax
   11166:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1116c:	4d 0f 45 f2          	cmovne %r10,%r14
   11170:	45 84 f6             	test   %r14b,%r14b
   11173:	75 4d                	jne    111c2 <alumina_foc::clarke+0xf3>
   11175:	49 bc 00 00 00 00 ff 	movabs $0xffffffff00000000,%r12
   1117c:	ff ff ff 
   1117f:	48 01 c9             	add    %rcx,%rcx
   11182:	48 29 d9             	sub    %rbx,%rcx
   11185:	48 89 c8             	mov    %rcx,%rax
   11188:	49 f7 ef             	imul   %r15
   1118b:	48 89 d0             	mov    %rdx,%rax
   1118e:	48 c1 e8 3f          	shr    $0x3f,%rax
   11192:	48 01 d0             	add    %rdx,%rax
   11195:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   11199:	48 29 d1             	sub    %rdx,%rcx
   1119c:	31 d2                	xor    %edx,%edx
   1119e:	48 85 c9             	test   %rcx,%rcx
   111a1:	0f 9f c2             	setg   %dl
   111a4:	4c 8d 3c 10          	lea    (%rax,%rdx,1),%r15
   111a8:	48 01 d0             	add    %rdx,%rax
   111ab:	48 05 00 00 00 80    	add    $0xffffffff80000000,%rax
   111b1:	49 c1 e7 20          	shl    $0x20,%r15
   111b5:	4c 39 e0             	cmp    %r12,%rax
   111b8:	4d 0f 42 fa          	cmovb  %r10,%r15
   111bc:	41 80 ff 01          	cmp    $0x1,%r15b
   111c0:	75 13                	jne    111d5 <alumina_foc::clarke+0x106>
   111c2:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   111c6:	b0 01                	mov    $0x1,%al
   111c8:	88 07                	mov    %al,(%rdi)
   111ca:	5b                   	pop    %rbx
   111cb:	41 5c                	pop    %r12
   111cd:	41 5d                	pop    %r13
   111cf:	41 5e                	pop    %r14
   111d1:	41 5f                	pop    %r15
   111d3:	5d                   	pop    %rbp
   111d4:	c3                   	ret
   111d5:	49 c1 ee 20          	shr    $0x20,%r14
   111d9:	49 c1 ef 20          	shr    $0x20,%r15
   111dd:	45 39 f7             	cmp    %r14d,%r15d
   111e0:	7d 06                	jge    111e8 <alumina_foc::clarke+0x119>
   111e2:	c6 47 01 01          	movb   $0x1,0x1(%rdi)
   111e6:	eb de                	jmp    111c6 <alumina_foc::clarke+0xf7>
   111e8:	49 29 f1             	sub    %rsi,%r9
   111eb:	4d 29 d8             	sub    %r11,%r8
   111ee:	b9 8b 4e f3 24       	mov    $0x24f34e8b,%ecx
   111f3:	4c 89 c8             	mov    %r9,%rax
   111f6:	48 f7 e9             	imul   %rcx
   111f9:	49 89 c4             	mov    %rax,%r12
   111fc:	49 89 d3             	mov    %rdx,%r11
   111ff:	be 8c 4e f3 24       	mov    $0x24f34e8c,%esi
   11204:	4c 89 c8             	mov    %r9,%rax
   11207:	48 f7 ee             	imul   %rsi
   1120a:	49 89 d5             	mov    %rdx,%r13
   1120d:	49 89 c2             	mov    %rax,%r10
   11210:	4c 89 c0             	mov    %r8,%rax
   11213:	48 f7 e9             	imul   %rcx
   11216:	48 89 d3             	mov    %rdx,%rbx
   11219:	49 89 c1             	mov    %rax,%r9
   1121c:	4c 89 c0             	mov    %r8,%rax
   1121f:	48 f7 ee             	imul   %rsi
   11222:	4c 89 6c 24 98       	mov    %r13,-0x68(%rsp)
   11227:	4c 89 6c 24 d0       	mov    %r13,-0x30(%rsp)
   1122c:	4c 89 54 24 a0       	mov    %r10,-0x60(%rsp)
   11231:	4c 89 54 24 c8       	mov    %r10,-0x38(%rsp)
   11236:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
   1123b:	4c 89 4c 24 d8       	mov    %r9,-0x28(%rsp)
   11240:	48 89 54 24 f0       	mov    %rdx,-0x10(%rsp)
   11245:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
   1124a:	31 ed                	xor    %ebp,%ebp
   1124c:	4c 89 e1             	mov    %r12,%rcx
   1124f:	4d 89 da             	mov    %r11,%r10
   11252:	4c 8b 6c 2c c8       	mov    -0x38(%rsp,%rbp,1),%r13
   11257:	4c 8b 44 2c d0       	mov    -0x30(%rsp,%rbp,1),%r8
   1125c:	4c 39 e9             	cmp    %r13,%rcx
   1125f:	4c 89 d6             	mov    %r10,%rsi
   11262:	4c 19 c6             	sbb    %r8,%rsi
   11265:	7c 06                	jl     1126d <alumina_foc::clarke+0x19e>
   11267:	4d 89 c2             	mov    %r8,%r10
   1126a:	4c 89 e9             	mov    %r13,%rcx
   1126d:	48 83 c5 10          	add    $0x10,%rbp
   11271:	48 83 fd 30          	cmp    $0x30,%rbp
   11275:	75 db                	jne    11252 <alumina_foc::clarke+0x183>
   11277:	48 8b 74 24 98       	mov    -0x68(%rsp),%rsi
   1127c:	48 89 74 24 d0       	mov    %rsi,-0x30(%rsp)
   11281:	48 8b 74 24 a0       	mov    -0x60(%rsp),%rsi
   11286:	48 89 74 24 c8       	mov    %rsi,-0x38(%rsp)
   1128b:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
   11290:	4c 89 4c 24 d8       	mov    %r9,-0x28(%rsp)
   11295:	48 89 54 24 f0       	mov    %rdx,-0x10(%rsp)
   1129a:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
   1129f:	31 c0                	xor    %eax,%eax
   112a1:	48 bb 00 00 00 00 ff 	movabs $0xffffffff00000000,%rbx
   112a8:	ff ff ff 
   112ab:	48 8b 54 04 c8       	mov    -0x38(%rsp,%rax,1),%rdx
   112b0:	4c 8b 44 04 d0       	mov    -0x30(%rsp,%rax,1),%r8
   112b5:	4c 39 e2             	cmp    %r12,%rdx
   112b8:	4c 89 c6             	mov    %r8,%rsi
   112bb:	4c 19 de             	sbb    %r11,%rsi
   112be:	7c 06                	jl     112c6 <alumina_foc::clarke+0x1f7>
   112c0:	4d 89 c3             	mov    %r8,%r11
   112c3:	49 89 d4             	mov    %rdx,%r12
   112c6:	48 83 c0 10          	add    $0x10,%rax
   112ca:	48 83 f8 30          	cmp    $0x30,%rax
   112ce:	75 db                	jne    112ab <alumina_foc::clarke+0x1dc>
   112d0:	4c 89 d2             	mov    %r10,%rdx
   112d3:	48 c1 fa 3f          	sar    $0x3f,%rdx
   112d7:	48 c1 ea 22          	shr    $0x22,%rdx
   112db:	48 01 ca             	add    %rcx,%rdx
   112de:	4c 89 d6             	mov    %r10,%rsi
   112e1:	48 83 d6 00          	adc    $0x0,%rsi
   112e5:	48 89 f0             	mov    %rsi,%rax
   112e8:	48 0f a4 d0 22       	shld   $0x22,%rdx,%rax
   112ed:	49 89 f0             	mov    %rsi,%r8
   112f0:	49 c1 f8 1e          	sar    $0x1e,%r8
   112f4:	48 81 e2 00 00 00 c0 	and    $0xffffffffc0000000,%rdx
   112fb:	48 39 d1             	cmp    %rdx,%rcx
   112fe:	49 19 f2             	sbb    %rsi,%r10
   11301:	49 c1 fa 3f          	sar    $0x3f,%r10
   11305:	4c 01 d0             	add    %r10,%rax
   11308:	4d 11 c2             	adc    %r8,%r10
   1130b:	48 89 c1             	mov    %rax,%rcx
   1130e:	48 81 c1 00 00 00 80 	add    $0xffffffff80000000,%rcx
   11315:	49 83 d2 ff          	adc    $0xffffffffffffffff,%r10
   11319:	48 c1 e0 20          	shl    $0x20,%rax
   1131d:	48 39 d9             	cmp    %rbx,%rcx
   11320:	49 83 da ff          	sbb    $0xffffffffffffffff,%r10
   11324:	ba 01 00 00 00       	mov    $0x1,%edx
   11329:	48 0f 42 c2          	cmovb  %rdx,%rax
   1132d:	84 c0                	test   %al,%al
   1132f:	74 07                	je     11338 <alumina_foc::clarke+0x269>
   11331:	31 f6                	xor    %esi,%esi
   11333:	e9 90 00 00 00       	jmp    113c8 <alumina_foc::clarke+0x2f9>
   11338:	4d 89 d9             	mov    %r11,%r9
   1133b:	49 c1 f9 3f          	sar    $0x3f,%r9
   1133f:	49 c1 e9 22          	shr    $0x22,%r9
   11343:	4d 01 e1             	add    %r12,%r9
   11346:	4d 89 d8             	mov    %r11,%r8
   11349:	49 83 d0 00          	adc    $0x0,%r8
   1134d:	4d 0f ac c1 1e       	shrd   $0x1e,%r8,%r9
   11352:	49 c1 f8 1e          	sar    $0x1e,%r8
   11356:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1135d:	00 00 80 
   11360:	4c 21 d9             	and    %r11,%rcx
   11363:	41 81 e4 ff ff ff 3f 	and    $0x3fffffff,%r12d
   1136a:	31 f6                	xor    %esi,%esi
   1136c:	49 f7 dc             	neg    %r12
   1136f:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   11375:	49 19 ca             	sbb    %rcx,%r10
   11378:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1137f:	0f 9c c1             	setl   %cl
   11382:	0f b6 c9             	movzbl %cl,%ecx
   11385:	4c 01 c9             	add    %r9,%rcx
   11388:	49 83 d0 00          	adc    $0x0,%r8
   1138c:	49 b9 ff ff ff 7f ff 	movabs $0xffffffff7fffffff,%r9
   11393:	ff ff ff 
   11396:	49 29 c9             	sub    %rcx,%r9
   11399:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   113a0:	4d 19 c3             	sbb    %r8,%r11
   113a3:	48 f7 d9             	neg    %rcx
   113a6:	48 0f af cb          	imul   %rbx,%rcx
   113aa:	49 39 d9             	cmp    %rbx,%r9
   113ad:	4d 19 d3             	sbb    %r10,%r11
   113b0:	48 0f 42 ca          	cmovb  %rdx,%rcx
   113b4:	f6 c1 01             	test   $0x1,%cl
   113b7:	75 0f                	jne    113c8 <alumina_foc::clarke+0x2f9>
   113b9:	48 c1 e8 20          	shr    $0x20,%rax
   113bd:	48 c1 e9 20          	shr    $0x20,%rcx
   113c1:	40 b6 01             	mov    $0x1,%sil
   113c4:	39 c1                	cmp    %eax,%ecx
   113c6:	7d 09                	jge    113d1 <alumina_foc::clarke+0x302>
   113c8:	40 88 77 01          	mov    %sil,0x1(%rdi)
   113cc:	e9 f5 fd ff ff       	jmp    111c6 <alumina_foc::clarke+0xf7>
   113d1:	44 89 77 04          	mov    %r14d,0x4(%rdi)
   113d5:	44 89 7f 08          	mov    %r15d,0x8(%rdi)
   113d9:	89 47 0c             	mov    %eax,0xc(%rdi)
   113dc:	89 4f 10             	mov    %ecx,0x10(%rdi)
   113df:	31 c0                	xor    %eax,%eax
   113e1:	e9 e2 fd ff ff       	jmp    111c8 <alumina_foc::clarke+0xf9>

