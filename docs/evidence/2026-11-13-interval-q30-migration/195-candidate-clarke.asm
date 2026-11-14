0000000000010f82 <alumina_foc::clarke>:
   10f82:	55                   	push   %rbp
   10f83:	41 57                	push   %r15
   10f85:	41 56                	push   %r14
   10f87:	41 55                	push   %r13
   10f89:	41 54                	push   %r12
   10f8b:	53                   	push   %rbx
   10f8c:	4c 63 16             	movslq (%rsi),%r10
   10f8f:	4c 63 6e 08          	movslq 0x8(%rsi),%r13
   10f93:	4c 63 5e 10          	movslq 0x10(%rsi),%r11
   10f97:	4b 8d 1c 2b          	lea    (%r11,%r13,1),%rbx
   10f9b:	4e 8d 0c 13          	lea    (%rbx,%r10,1),%r9
   10f9f:	48 63 4e 04          	movslq 0x4(%rsi),%rcx
   10fa3:	4c 63 46 0c          	movslq 0xc(%rsi),%r8
   10fa7:	48 63 76 14          	movslq 0x14(%rsi),%rsi
   10fab:	4a 8d 04 06          	lea    (%rsi,%r8,1),%rax
   10faf:	4c 8d 34 08          	lea    (%rax,%rcx,1),%r14
   10fb3:	4d 89 cf             	mov    %r9,%r15
   10fb6:	49 f7 df             	neg    %r15
   10fb9:	4d 0f 48 f9          	cmovs  %r9,%r15
   10fbd:	4d 89 f1             	mov    %r14,%r9
   10fc0:	49 f7 d9             	neg    %r9
   10fc3:	4d 0f 48 ce          	cmovs  %r14,%r9
   10fc7:	4d 39 f9             	cmp    %r15,%r9
   10fca:	4d 0f 46 cf          	cmovbe %r15,%r9
   10fce:	89 d2                	mov    %edx,%edx
   10fd0:	49 39 d1             	cmp    %rdx,%r9
   10fd3:	76 09                	jbe    10fde <alumina_foc::clarke+0x5c>
   10fd5:	c6 47 01 0c          	movb   $0xc,0x1(%rdi)
   10fd9:	e9 9b 00 00 00       	jmp    11079 <alumina_foc::clarke+0xf7>
   10fde:	4d 01 d2             	add    %r10,%r10
   10fe1:	49 29 c2             	sub    %rax,%r10
   10fe4:	49 bf 56 55 55 55 55 	movabs $0x5555555555555556,%r15
   10feb:	55 55 55 
   10fee:	4c 89 d0             	mov    %r10,%rax
   10ff1:	49 f7 ef             	imul   %r15
   10ff4:	48 89 d0             	mov    %rdx,%rax
   10ff7:	48 c1 e8 3f          	shr    $0x3f,%rax
   10ffb:	48 01 d0             	add    %rdx,%rax
   10ffe:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   11002:	49 29 d2             	sub    %rdx,%r10
   11005:	49 c1 fa 3f          	sar    $0x3f,%r10
   11009:	49 01 c2             	add    %rax,%r10
   1100c:	49 63 c2             	movslq %r10d,%rax
   1100f:	4d 89 d6             	mov    %r10,%r14
   11012:	49 c1 e6 20          	shl    $0x20,%r14
   11016:	4c 39 d0             	cmp    %r10,%rax
   11019:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1101f:	4d 0f 45 f2          	cmovne %r10,%r14
   11023:	45 84 f6             	test   %r14b,%r14b
   11026:	75 4d                	jne    11075 <alumina_foc::clarke+0xf3>
   11028:	49 b9 00 00 00 00 ff 	movabs $0xffffffff00000000,%r9
   1102f:	ff ff ff 
   11032:	48 01 c9             	add    %rcx,%rcx
   11035:	48 29 d9             	sub    %rbx,%rcx
   11038:	48 89 c8             	mov    %rcx,%rax
   1103b:	49 f7 ef             	imul   %r15
   1103e:	48 89 d0             	mov    %rdx,%rax
   11041:	48 c1 e8 3f          	shr    $0x3f,%rax
   11045:	48 01 d0             	add    %rdx,%rax
   11048:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   1104c:	48 29 d1             	sub    %rdx,%rcx
   1104f:	31 d2                	xor    %edx,%edx
   11051:	48 85 c9             	test   %rcx,%rcx
   11054:	0f 9f c2             	setg   %dl
   11057:	4c 8d 3c 10          	lea    (%rax,%rdx,1),%r15
   1105b:	48 01 d0             	add    %rdx,%rax
   1105e:	48 05 00 00 00 80    	add    $0xffffffff80000000,%rax
   11064:	49 c1 e7 20          	shl    $0x20,%r15
   11068:	4c 39 c8             	cmp    %r9,%rax
   1106b:	4d 0f 42 fa          	cmovb  %r10,%r15
   1106f:	41 80 ff 01          	cmp    $0x1,%r15b
   11073:	75 13                	jne    11088 <alumina_foc::clarke+0x106>
   11075:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   11079:	b0 01                	mov    $0x1,%al
   1107b:	88 07                	mov    %al,(%rdi)
   1107d:	5b                   	pop    %rbx
   1107e:	41 5c                	pop    %r12
   11080:	41 5d                	pop    %r13
   11082:	41 5e                	pop    %r14
   11084:	41 5f                	pop    %r15
   11086:	5d                   	pop    %rbp
   11087:	c3                   	ret
   11088:	49 c1 ee 20          	shr    $0x20,%r14
   1108c:	49 c1 ef 20          	shr    $0x20,%r15
   11090:	45 39 f7             	cmp    %r14d,%r15d
   11093:	7d 06                	jge    1109b <alumina_foc::clarke+0x119>
   11095:	c6 47 01 01          	movb   $0x1,0x1(%rdi)
   11099:	eb de                	jmp    11079 <alumina_foc::clarke+0xf7>
   1109b:	49 29 f5             	sub    %rsi,%r13
   1109e:	4d 29 d8             	sub    %r11,%r8
   110a1:	b9 8b 4e f3 24       	mov    $0x24f34e8b,%ecx
   110a6:	4c 89 e8             	mov    %r13,%rax
   110a9:	48 f7 e9             	imul   %rcx
   110ac:	49 89 c4             	mov    %rax,%r12
   110af:	49 89 d2             	mov    %rdx,%r10
   110b2:	be 8c 4e f3 24       	mov    $0x24f34e8c,%esi
   110b7:	4c 89 e8             	mov    %r13,%rax
   110ba:	48 f7 ee             	imul   %rsi
   110bd:	49 89 d5             	mov    %rdx,%r13
   110c0:	49 89 c1             	mov    %rax,%r9
   110c3:	4c 89 c0             	mov    %r8,%rax
   110c6:	48 f7 e9             	imul   %rcx
   110c9:	48 89 d3             	mov    %rdx,%rbx
   110cc:	49 89 c3             	mov    %rax,%r11
   110cf:	4c 89 c0             	mov    %r8,%rax
   110d2:	48 f7 ee             	imul   %rsi
   110d5:	4c 89 6c 24 98       	mov    %r13,-0x68(%rsp)
   110da:	4c 89 6c 24 d0       	mov    %r13,-0x30(%rsp)
   110df:	4c 89 4c 24 a0       	mov    %r9,-0x60(%rsp)
   110e4:	4c 89 4c 24 c8       	mov    %r9,-0x38(%rsp)
   110e9:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
   110ee:	4c 89 5c 24 d8       	mov    %r11,-0x28(%rsp)
   110f3:	48 89 54 24 f0       	mov    %rdx,-0x10(%rsp)
   110f8:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
   110fd:	31 ed                	xor    %ebp,%ebp
   110ff:	4c 89 e1             	mov    %r12,%rcx
   11102:	4d 89 d1             	mov    %r10,%r9
   11105:	4c 8b 6c 2c c8       	mov    -0x38(%rsp,%rbp,1),%r13
   1110a:	4c 8b 44 2c d0       	mov    -0x30(%rsp,%rbp,1),%r8
   1110f:	4c 39 e9             	cmp    %r13,%rcx
   11112:	4c 89 ce             	mov    %r9,%rsi
   11115:	4c 19 c6             	sbb    %r8,%rsi
   11118:	7c 06                	jl     11120 <alumina_foc::clarke+0x19e>
   1111a:	4d 89 c1             	mov    %r8,%r9
   1111d:	4c 89 e9             	mov    %r13,%rcx
   11120:	48 83 c5 10          	add    $0x10,%rbp
   11124:	48 83 fd 30          	cmp    $0x30,%rbp
   11128:	75 db                	jne    11105 <alumina_foc::clarke+0x183>
   1112a:	48 8b 74 24 98       	mov    -0x68(%rsp),%rsi
   1112f:	48 89 74 24 d0       	mov    %rsi,-0x30(%rsp)
   11134:	48 8b 74 24 a0       	mov    -0x60(%rsp),%rsi
   11139:	48 89 74 24 c8       	mov    %rsi,-0x38(%rsp)
   1113e:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
   11143:	4c 89 5c 24 d8       	mov    %r11,-0x28(%rsp)
   11148:	48 89 54 24 f0       	mov    %rdx,-0x10(%rsp)
   1114d:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
   11152:	31 c0                	xor    %eax,%eax
   11154:	48 bb 00 00 00 00 ff 	movabs $0xffffffff00000000,%rbx
   1115b:	ff ff ff 
   1115e:	48 8b 54 04 c8       	mov    -0x38(%rsp,%rax,1),%rdx
   11163:	4c 8b 44 04 d0       	mov    -0x30(%rsp,%rax,1),%r8
   11168:	4c 39 e2             	cmp    %r12,%rdx
   1116b:	4c 89 c6             	mov    %r8,%rsi
   1116e:	4c 19 d6             	sbb    %r10,%rsi
   11171:	7c 06                	jl     11179 <alumina_foc::clarke+0x1f7>
   11173:	4d 89 c2             	mov    %r8,%r10
   11176:	49 89 d4             	mov    %rdx,%r12
   11179:	48 83 c0 10          	add    $0x10,%rax
   1117d:	48 83 f8 30          	cmp    $0x30,%rax
   11181:	75 db                	jne    1115e <alumina_foc::clarke+0x1dc>
   11183:	4c 89 ca             	mov    %r9,%rdx
   11186:	48 c1 fa 3f          	sar    $0x3f,%rdx
   1118a:	48 c1 ea 22          	shr    $0x22,%rdx
   1118e:	48 01 ca             	add    %rcx,%rdx
   11191:	4c 89 ce             	mov    %r9,%rsi
   11194:	48 83 d6 00          	adc    $0x0,%rsi
   11198:	48 89 f0             	mov    %rsi,%rax
   1119b:	48 0f a4 d0 22       	shld   $0x22,%rdx,%rax
   111a0:	49 89 f0             	mov    %rsi,%r8
   111a3:	49 c1 f8 1e          	sar    $0x1e,%r8
   111a7:	48 81 e2 00 00 00 c0 	and    $0xffffffffc0000000,%rdx
   111ae:	48 39 d1             	cmp    %rdx,%rcx
   111b1:	49 19 f1             	sbb    %rsi,%r9
   111b4:	49 c1 f9 3f          	sar    $0x3f,%r9
   111b8:	4c 01 c8             	add    %r9,%rax
   111bb:	4d 11 c1             	adc    %r8,%r9
   111be:	48 89 c1             	mov    %rax,%rcx
   111c1:	48 81 c1 00 00 00 80 	add    $0xffffffff80000000,%rcx
   111c8:	49 83 d1 ff          	adc    $0xffffffffffffffff,%r9
   111cc:	48 c1 e0 20          	shl    $0x20,%rax
   111d0:	48 39 d9             	cmp    %rbx,%rcx
   111d3:	49 83 d9 ff          	sbb    $0xffffffffffffffff,%r9
   111d7:	ba 01 00 00 00       	mov    $0x1,%edx
   111dc:	48 0f 42 c2          	cmovb  %rdx,%rax
   111e0:	84 c0                	test   %al,%al
   111e2:	74 07                	je     111eb <alumina_foc::clarke+0x269>
   111e4:	31 f6                	xor    %esi,%esi
   111e6:	e9 83 00 00 00       	jmp    1126e <alumina_foc::clarke+0x2ec>
   111eb:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
   111f2:	4d 89 d3             	mov    %r10,%r11
   111f5:	49 c1 fb 3f          	sar    $0x3f,%r11
   111f9:	49 c1 eb 22          	shr    $0x22,%r11
   111fd:	4d 01 e3             	add    %r12,%r11
   11200:	4d 89 d1             	mov    %r10,%r9
   11203:	49 83 d1 00          	adc    $0x0,%r9
   11207:	4d 0f ac cb 1e       	shrd   $0x1e,%r9,%r11
   1120c:	49 c1 f9 1e          	sar    $0x1e,%r9
   11210:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   11217:	00 00 80 
   1121a:	4c 21 d1             	and    %r10,%rcx
   1121d:	41 81 e4 ff ff ff 3f 	and    $0x3fffffff,%r12d
   11224:	31 f6                	xor    %esi,%esi
   11226:	49 f7 dc             	neg    %r12
   11229:	41 ba 00 00 00 00    	mov    $0x0,%r10d
   1122f:	49 19 ca             	sbb    %rcx,%r10
   11232:	0f 9c c1             	setl   %cl
   11235:	0f b6 c9             	movzbl %cl,%ecx
   11238:	4c 01 d9             	add    %r11,%rcx
   1123b:	49 83 d1 00          	adc    $0x0,%r9
   1123f:	49 89 ca             	mov    %rcx,%r10
   11242:	49 81 c2 00 00 00 80 	add    $0xffffffff80000000,%r10
   11249:	49 83 d1 ff          	adc    $0xffffffffffffffff,%r9
   1124d:	48 c1 e1 20          	shl    $0x20,%rcx
   11251:	49 39 da             	cmp    %rbx,%r10
   11254:	4d 19 c1             	sbb    %r8,%r9
   11257:	48 0f 42 ca          	cmovb  %rdx,%rcx
   1125b:	84 c9                	test   %cl,%cl
   1125d:	75 0f                	jne    1126e <alumina_foc::clarke+0x2ec>
   1125f:	48 c1 e8 20          	shr    $0x20,%rax
   11263:	48 c1 e9 20          	shr    $0x20,%rcx
   11267:	40 b6 01             	mov    $0x1,%sil
   1126a:	39 c1                	cmp    %eax,%ecx
   1126c:	7d 09                	jge    11277 <alumina_foc::clarke+0x2f5>
   1126e:	40 88 77 01          	mov    %sil,0x1(%rdi)
   11272:	e9 02 fe ff ff       	jmp    11079 <alumina_foc::clarke+0xf7>
   11277:	44 89 77 04          	mov    %r14d,0x4(%rdi)
   1127b:	44 89 7f 08          	mov    %r15d,0x8(%rdi)
   1127f:	89 47 0c             	mov    %eax,0xc(%rdi)
   11282:	89 4f 10             	mov    %ecx,0x10(%rdi)
   11285:	31 c0                	xor    %eax,%eax
   11287:	e9 ef fd ff ff       	jmp    1107b <alumina_foc::clarke+0xf9>

