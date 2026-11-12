<hyperinterval::float::F64Enclosure>::abs:
   10e30:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   10e34:	75 33                	jne    10e69 <<hyperinterval::float::F64Enclosure>::abs+0x39>
   10e36:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   10e3a:	48 ba ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rdx
   10e41:	ff ff 7f 
   10e44:	48 85 c9             	test   %rcx,%rcx
   10e47:	41 0f 99 c0          	setns  %r8b
   10e4b:	48 89 c8             	mov    %rcx,%rax
   10e4e:	48 21 d0             	and    %rdx,%rax
   10e51:	41 0f 94 c1          	sete   %r9b
   10e55:	45 08 c1             	or     %r8b,%r9b
   10e58:	74 17                	je     10e71 <<hyperinterval::float::F64Enclosure>::abs+0x41>
   10e5a:	48 8b 46 10          	mov    0x10(%rsi),%rax
   10e5e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   10e62:	0f 10 06             	movups (%rsi),%xmm0
   10e65:	0f 11 07             	movups %xmm0,(%rdi)
   10e68:	c3                   	ret
   10e69:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   10e70:	c3                   	ret
   10e71:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   10e75:	48 85 f6             	test   %rsi,%rsi
   10e78:	41 0f 98 c1          	sets   %r9b
   10e7c:	49 89 f0             	mov    %rsi,%r8
   10e7f:	49 21 d0             	and    %rdx,%r8
   10e82:	41 0f 95 c2          	setne  %r10b
   10e86:	45 84 d1             	test   %r10b,%r9b
   10e89:	74 10                	je     10e9b <<hyperinterval::float::F64Enclosure>::abs+0x6b>
   10e8b:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   10e92:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   10e96:	48 89 47 10          	mov    %rax,0x10(%rdi)
   10e9a:	c3                   	ret
   10e9b:	49 f7 d8             	neg    %r8
   10e9e:	48 85 f6             	test   %rsi,%rsi
   10ea1:	4c 8d 4c 16 01       	lea    0x1(%rsi,%rdx,1),%r9
   10ea6:	4a 8d 54 02 01       	lea    0x1(%rdx,%r8,1),%rdx
   10eab:	49 0f 49 d1          	cmovns %r9,%rdx
   10eaf:	48 39 d1             	cmp    %rdx,%rcx
   10eb2:	48 0f 46 c6          	cmovbe %rsi,%rax
   10eb6:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   10ebd:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   10ec4:	00 
   10ec5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   10ec9:	c3                   	ret
   10eca:	cc                   	int3
   10ecb:	cc                   	int3
   10ecc:	cc                   	int3
   10ecd:	cc                   	int3
   10ece:	cc                   	int3
   10ecf:	cc                   	int3

hyperinterval_strict_chain32:
   10f00:	55                   	push   %rbp
   10f01:	41 57                	push   %r15
   10f03:	41 56                	push   %r14
   10f05:	41 55                	push   %r13
   10f07:	41 54                	push   %r12
   10f09:	53                   	push   %rbx
   10f0a:	48 83 ec 68          	sub    $0x68,%rsp
   10f0e:	f3 0f 11 4c 24 4c    	movss  %xmm1,0x4c(%rsp)
   10f14:	48 89 fb             	mov    %rdi,%rbx
   10f17:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   10f1d:	66 0f 7e c1          	movd   %xmm0,%ecx
   10f21:	48 89 e7             	mov    %rsp,%rdi
   10f24:	be 00 00 00 80       	mov    $0x80000000,%esi
   10f29:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10f2e:	e8 6d 81 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   10f33:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10f37:	74 27                	je     10f60 <hyperinterval_strict_chain32+0x60>
   10f39:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   10f3e:	66 0f 6e 44 24 4c    	movd   0x4c(%rsp),%xmm0
   10f44:	66 0f 7e c1          	movd   %xmm0,%ecx
   10f48:	48 89 e7             	mov    %rsp,%rdi
   10f4b:	be 00 00 00 80       	mov    $0x80000000,%esi
   10f50:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10f55:	e8 46 81 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   10f5a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10f5e:	75 20                	jne    10f80 <hyperinterval_strict_chain32+0x80>
   10f60:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   10f65:	88 43 04             	mov    %al,0x4(%rbx)
   10f68:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   10f6e:	48 89 d8             	mov    %rbx,%rax
   10f71:	48 83 c4 68          	add    $0x68,%rsp
   10f75:	5b                   	pop    %rbx
   10f76:	41 5c                	pop    %r12
   10f78:	41 5d                	pop    %r13
   10f7a:	41 5e                	pop    %r14
   10f7c:	41 5f                	pop    %r15
   10f7e:	5d                   	pop    %rbp
   10f7f:	c3                   	ret
   10f80:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   10f85:	44 89 f0             	mov    %r14d,%eax
   10f88:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   10f8d:	89 e9                	mov    %ebp,%ecx
   10f8f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   10f95:	ba 00 00 00 80       	mov    $0x80000000,%edx
   10f9a:	29 c2                	sub    %eax,%edx
   10f9c:	44 09 e0             	or     %r12d,%eax
   10f9f:	45 85 f6             	test   %r14d,%r14d
   10fa2:	48 0f 49 d0          	cmovns %rax,%rdx
   10fa6:	be 00 00 00 80       	mov    $0x80000000,%esi
   10fab:	29 ce                	sub    %ecx,%esi
   10fad:	89 c8                	mov    %ecx,%eax
   10faf:	44 09 e0             	or     %r12d,%eax
   10fb2:	85 ed                	test   %ebp,%ebp
   10fb4:	48 0f 49 f0          	cmovns %rax,%rsi
   10fb8:	b0 01                	mov    $0x1,%al
   10fba:	39 f2                	cmp    %esi,%edx
   10fbc:	77 a7                	ja     10f65 <hyperinterval_strict_chain32+0x65>
   10fbe:	49 8d 8c 24 00 00 00 	lea    0x3f000000(%r12),%rcx
   10fc5:	3f 
   10fc6:	48 89 e7             	mov    %rsp,%rdi
   10fc9:	be 00 00 00 80       	mov    $0x80000000,%esi
   10fce:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10fd3:	e8 c8 80 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   10fd8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10fdc:	74 82                	je     10f60 <hyperinterval_strict_chain32+0x60>
   10fde:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   10fe3:	48 89 e7             	mov    %rsp,%rdi
   10fe6:	be 00 00 00 80       	mov    $0x80000000,%esi
   10feb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10ff0:	b9 00 00 80 3e       	mov    $0x3e800000,%ecx
   10ff5:	e8 a6 80 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   10ffa:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10ffe:	0f 84 5c ff ff ff    	je     10f60 <hyperinterval_strict_chain32+0x60>
   11004:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   11009:	48 89 e7             	mov    %rsp,%rdi
   1100c:	be 00 00 00 80       	mov    $0x80000000,%esi
   11011:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11016:	4c 89 f1             	mov    %r14,%rcx
   11019:	4d 89 f8             	mov    %r15,%r8
   1101c:	4d 89 e9             	mov    %r13,%r9
   1101f:	e8 bc 9c 00 00       	call   1ace0 <<hyperinterval::ieee::Format>::affine>
   11024:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11028:	0f 84 32 ff ff ff    	je     10f60 <hyperinterval_strict_chain32+0x60>
   1102e:	89 e9                	mov    %ebp,%ecx
   11030:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   11034:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   11039:	48 89 e7             	mov    %rsp,%rdi
   1103c:	be 00 00 00 80       	mov    $0x80000000,%esi
   11041:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11046:	4d 89 f8             	mov    %r15,%r8
   11049:	4d 89 e9             	mov    %r13,%r9
   1104c:	e8 8f 9c 00 00       	call   1ace0 <<hyperinterval::ieee::Format>::affine>
   11051:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11055:	0f 84 05 ff ff ff    	je     10f60 <hyperinterval_strict_chain32+0x60>
   1105b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   11060:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   11065:	48 89 e7             	mov    %rsp,%rdi
   11068:	be 00 00 00 80       	mov    $0x80000000,%esi
   1106d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11072:	48 89 e9             	mov    %rbp,%rcx
   11075:	e8 26 80 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1107a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1107e:	74 20                	je     110a0 <hyperinterval_strict_chain32+0x1a0>
   11080:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   11085:	48 89 e7             	mov    %rsp,%rdi
   11088:	be 00 00 00 80       	mov    $0x80000000,%esi
   1108d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11092:	4c 89 f1             	mov    %r14,%rcx
   11095:	e8 06 80 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1109a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1109e:	75 13                	jne    110b3 <hyperinterval_strict_chain32+0x1b3>
   110a0:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   110a5:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   110a9:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   110ae:	e9 b2 fe ff ff       	jmp    10f65 <hyperinterval_strict_chain32+0x65>
   110b3:	8b 44 24 08          	mov    0x8(%rsp),%eax
   110b7:	89 e9                	mov    %ebp,%ecx
   110b9:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   110bf:	89 c2                	mov    %eax,%edx
   110c1:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   110c7:	be 00 00 00 80       	mov    $0x80000000,%esi
   110cc:	29 ce                	sub    %ecx,%esi
   110ce:	44 09 e1             	or     %r12d,%ecx
   110d1:	85 ed                	test   %ebp,%ebp
   110d3:	48 0f 49 f1          	cmovns %rcx,%rsi
   110d7:	bf 00 00 00 80       	mov    $0x80000000,%edi
   110dc:	29 d7                	sub    %edx,%edi
   110de:	89 d1                	mov    %edx,%ecx
   110e0:	44 09 e1             	or     %r12d,%ecx
   110e3:	85 c0                	test   %eax,%eax
   110e5:	48 0f 49 f9          	cmovns %rcx,%rdi
   110e9:	b1 01                	mov    $0x1,%cl
   110eb:	39 fe                	cmp    %edi,%esi
   110ed:	77 b6                	ja     110a5 <hyperinterval_strict_chain32+0x1a5>
   110ef:	89 e9                	mov    %ebp,%ecx
   110f1:	c1 e9 08             	shr    $0x8,%ecx
   110f4:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   110fb:	00 
   110fc:	40 88 6c 24 38       	mov    %bpl,0x38(%rsp)
   11101:	c1 ed 18             	shr    $0x18,%ebp
   11104:	40 88 6c 24 3b       	mov    %bpl,0x3b(%rsp)
   11109:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   1110e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   11112:	48 89 e7             	mov    %rsp,%rdi
   11115:	4c 89 ee             	mov    %r13,%rsi
   11118:	4c 89 fa             	mov    %r15,%rdx
   1111b:	e8 a0 93 00 00       	call   1a4c0 <<hyperinterval::float::F32Enclosure>::from_bits>
   11120:	8b 0c 24             	mov    (%rsp),%ecx
   11123:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   11128:	83 f9 02             	cmp    $0x2,%ecx
   1112b:	75 09                	jne    11136 <hyperinterval_strict_chain32+0x236>
   1112d:	88 44 24 20          	mov    %al,0x20(%rsp)
   11131:	e9 73 ff ff ff       	jmp    110a9 <hyperinterval_strict_chain32+0x1a9>
   11136:	8b 54 24 05          	mov    0x5(%rsp),%edx
   1113a:	8b 74 24 08          	mov    0x8(%rsp),%esi
   1113e:	89 74 24 48          	mov    %esi,0x48(%rsp)
   11142:	89 54 24 45          	mov    %edx,0x45(%rsp)
   11146:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1114a:	88 44 24 44          	mov    %al,0x44(%rsp)
   1114e:	48 8d 7c 24 1c       	lea    0x1c(%rsp),%rdi
   11153:	48 8d 74 24 34       	lea    0x34(%rsp),%rsi
   11158:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   1115d:	e8 0e 92 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::hull>
   11162:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
   11166:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   1116b:	83 f9 02             	cmp    $0x2,%ecx
   1116e:	0f 84 f1 fd ff ff    	je     10f65 <hyperinterval_strict_chain32+0x65>
   11174:	8b 54 24 21          	mov    0x21(%rsp),%edx
   11178:	8b 74 24 24          	mov    0x24(%rsp),%esi
   1117c:	89 74 24 64          	mov    %esi,0x64(%rsp)
   11180:	89 54 24 61          	mov    %edx,0x61(%rsp)
   11184:	89 4c 24 5c          	mov    %ecx,0x5c(%rsp)
   11188:	88 44 24 60          	mov    %al,0x60(%rsp)
   1118c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   11191:	48 8d 74 24 5c       	lea    0x5c(%rsp),%rsi
   11196:	e8 b5 8a 00 00       	call   19c50 <<hyperinterval::float::F32Enclosure>::square>
   1119b:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1119f:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   111a4:	83 f9 02             	cmp    $0x2,%ecx
   111a7:	0f 84 b8 fd ff ff    	je     10f65 <hyperinterval_strict_chain32+0x65>
   111ad:	8b 54 24 2d          	mov    0x2d(%rsp),%edx
   111b1:	8b 74 24 30          	mov    0x30(%rsp),%esi
   111b5:	89 74 24 24          	mov    %esi,0x24(%rsp)
   111b9:	89 54 24 21          	mov    %edx,0x21(%rsp)
   111bd:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
   111c1:	88 44 24 20          	mov    %al,0x20(%rsp)
   111c5:	48 89 e7             	mov    %rsp,%rdi
   111c8:	be 00 00 00 80       	mov    $0x80000000,%esi
   111cd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   111d2:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   111d7:	e8 c4 7e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   111dc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   111e0:	0f 84 7a fd ff ff    	je     10f60 <hyperinterval_strict_chain32+0x60>
   111e6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   111eb:	89 c1                	mov    %eax,%ecx
   111ed:	c1 e9 08             	shr    $0x8,%ecx
   111f0:	89 c2                	mov    %eax,%edx
   111f2:	c1 ea 18             	shr    $0x18,%edx
   111f5:	88 54 24 3b          	mov    %dl,0x3b(%rsp)
   111f9:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   111fe:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   11202:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   11209:	00 
   1120a:	88 44 24 38          	mov    %al,0x38(%rsp)
   1120e:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   11213:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   11218:	48 8d 54 24 34       	lea    0x34(%rsp),%rdx
   1121d:	e8 5e 96 00 00       	call   1a880 <<hyperinterval::float::F32Enclosure>::add>
   11222:	8b 44 24 50          	mov    0x50(%rsp),%eax
   11226:	0f b6 4c 24 54       	movzbl 0x54(%rsp),%ecx
   1122b:	83 f8 02             	cmp    $0x2,%eax
   1122e:	75 08                	jne    11238 <hyperinterval_strict_chain32+0x338>
   11230:	88 4b 04             	mov    %cl,0x4(%rbx)
   11233:	e9 30 fd ff ff       	jmp    10f68 <hyperinterval_strict_chain32+0x68>
   11238:	8b 54 24 55          	mov    0x55(%rsp),%edx
   1123c:	8b 74 24 58          	mov    0x58(%rsp),%esi
   11240:	89 74 24 30          	mov    %esi,0x30(%rsp)
   11244:	89 54 24 2d          	mov    %edx,0x2d(%rsp)
   11248:	89 44 24 28          	mov    %eax,0x28(%rsp)
   1124c:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
   11250:	85 c0                	test   %eax,%eax
   11252:	74 4c                	je     112a0 <hyperinterval_strict_chain32+0x3a0>
   11254:	48 89 e7             	mov    %rsp,%rdi
   11257:	be 00 00 00 80       	mov    $0x80000000,%esi
   1125c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11261:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11266:	e8 35 7e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1126b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1126f:	74 22                	je     11293 <hyperinterval_strict_chain32+0x393>
   11271:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   11276:	48 89 e7             	mov    %rsp,%rdi
   11279:	be 00 00 00 80       	mov    $0x80000000,%esi
   1127e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11283:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11288:	e8 13 7e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1128d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11291:	75 18                	jne    112ab <hyperinterval_strict_chain32+0x3ab>
   11293:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   11298:	88 4b 04             	mov    %cl,0x4(%rbx)
   1129b:	e9 c8 fc ff ff       	jmp    10f68 <hyperinterval_strict_chain32+0x68>
   112a0:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   112a6:	e9 c3 fc ff ff       	jmp    10f6e <hyperinterval_strict_chain32+0x6e>
   112ab:	8b 44 24 08          	mov    0x8(%rsp),%eax
   112af:	44 89 f1             	mov    %r14d,%ecx
   112b2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   112b8:	89 c2                	mov    %eax,%edx
   112ba:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   112c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   112c5:	29 ce                	sub    %ecx,%esi
   112c7:	44 09 e1             	or     %r12d,%ecx
   112ca:	45 85 f6             	test   %r14d,%r14d
   112cd:	48 0f 49 f1          	cmovns %rcx,%rsi
   112d1:	89 d1                	mov    %edx,%ecx
   112d3:	44 09 e1             	or     %r12d,%ecx
   112d6:	41 29 d4             	sub    %edx,%r12d
   112d9:	85 c0                	test   %eax,%eax
   112db:	4c 0f 49 e1          	cmovns %rcx,%r12
   112df:	b1 01                	mov    $0x1,%cl
   112e1:	44 39 e6             	cmp    %r12d,%esi
   112e4:	0f 87 46 ff ff ff    	ja     11230 <hyperinterval_strict_chain32+0x330>
   112ea:	44 89 f1             	mov    %r14d,%ecx
   112ed:	c1 e9 08             	shr    $0x8,%ecx
   112f0:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%rsp)
   112f7:	00 
   112f8:	44 88 74 24 44       	mov    %r14b,0x44(%rsp)
   112fd:	41 c1 ee 18          	shr    $0x18,%r14d
   11301:	44 88 74 24 47       	mov    %r14b,0x47(%rsp)
   11306:	66 89 4c 24 45       	mov    %cx,0x45(%rsp)
   1130b:	89 44 24 48          	mov    %eax,0x48(%rsp)
   1130f:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%rsp)
   11314:	7f 15                	jg     1132b <hyperinterval_strict_chain32+0x42b>
   11316:	8b 44 24 30          	mov    0x30(%rsp),%eax
   1131a:	85 c0                	test   %eax,%eax
   1131c:	0f 99 c1             	setns  %cl
   1131f:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   11324:	0f 94 c0             	sete   %al
   11327:	08 c8                	or     %cl,%al
   11329:	75 17                	jne    11342 <hyperinterval_strict_chain32+0x442>
   1132b:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   11330:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   11335:	48 89 df             	mov    %rbx,%rdi
   11338:	e8 a3 7d 00 00       	call   190e0 <<hyperinterval::float::F32Enclosure>::corner_image>
   1133d:	e9 2c fc ff ff       	jmp    10f6e <hyperinterval_strict_chain32+0x6e>
   11342:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   11346:	e9 1d fc ff ff       	jmp    10f68 <hyperinterval_strict_chain32+0x68>
   1134b:	cc                   	int3
   1134c:	cc                   	int3
   1134d:	cc                   	int3
   1134e:	cc                   	int3
   1134f:	cc                   	int3

hyperinterval_strict_chain64:
   11350:	55                   	push   %rbp
   11351:	41 57                	push   %r15
   11353:	41 56                	push   %r14
   11355:	41 55                	push   %r13
   11357:	41 54                	push   %r12
   11359:	53                   	push   %rbx
   1135a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   11361:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   11367:	48 89 fb             	mov    %rdi,%rbx
   1136a:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   11371:	00 00 80 
   11374:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1137b:	00 f0 7f 
   1137e:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   11383:	48 89 e7             	mov    %rsp,%rdi
   11386:	4c 89 f6             	mov    %r14,%rsi
   11389:	4c 89 fa             	mov    %r15,%rdx
   1138c:	e8 0f 7d 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11391:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11395:	74 24                	je     113bb <hyperinterval_strict_chain64+0x6b>
   11397:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1139c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   113a2:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   113a7:	48 89 e7             	mov    %rsp,%rdi
   113aa:	4c 89 f6             	mov    %r14,%rsi
   113ad:	4c 89 fa             	mov    %r15,%rdx
   113b0:	e8 eb 7c 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   113b5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   113b9:	75 24                	jne    113df <hyperinterval_strict_chain64+0x8f>
   113bb:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   113c0:	88 43 08             	mov    %al,0x8(%rbx)
   113c3:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   113ca:	48 89 d8             	mov    %rbx,%rax
   113cd:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   113d4:	5b                   	pop    %rbx
   113d5:	41 5c                	pop    %r12
   113d7:	41 5d                	pop    %r13
   113d9:	41 5e                	pop    %r14
   113db:	41 5f                	pop    %r15
   113dd:	5d                   	pop    %rbp
   113de:	c3                   	ret
   113df:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   113e4:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   113e8:	49 8d 6e ff          	lea    -0x1(%r14),%rbp
   113ec:	4c 89 e9             	mov    %r13,%rcx
   113ef:	48 21 e9             	and    %rbp,%rcx
   113f2:	4c 89 f2             	mov    %r14,%rdx
   113f5:	48 29 ca             	sub    %rcx,%rdx
   113f8:	4d 85 ed             	test   %r13,%r13
   113fb:	48 0f 49 d0          	cmovns %rax,%rdx
   113ff:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   11403:	4c 89 e1             	mov    %r12,%rcx
   11406:	48 21 e9             	and    %rbp,%rcx
   11409:	4c 89 f6             	mov    %r14,%rsi
   1140c:	48 29 ce             	sub    %rcx,%rsi
   1140f:	4d 85 e4             	test   %r12,%r12
   11412:	48 0f 49 f0          	cmovns %rax,%rsi
   11416:	b0 01                	mov    $0x1,%al
   11418:	48 39 f2             	cmp    %rsi,%rdx
   1141b:	77 a3                	ja     113c0 <hyperinterval_strict_chain64+0x70>
   1141d:	48 89 e7             	mov    %rsp,%rdi
   11420:	48 b9 00 00 00 00 00 	movabs $0xbfe0000000000000,%rcx
   11427:	00 e0 bf 
   1142a:	4c 89 f6             	mov    %r14,%rsi
   1142d:	4c 89 fa             	mov    %r15,%rdx
   11430:	e8 6b 7c 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11435:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11439:	74 80                	je     113bb <hyperinterval_strict_chain64+0x6b>
   1143b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11440:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   11445:	48 89 e7             	mov    %rsp,%rdi
   11448:	48 b9 00 00 00 00 00 	movabs $0x3fd0000000000000,%rcx
   1144f:	00 d0 3f 
   11452:	4c 89 f6             	mov    %r14,%rsi
   11455:	4c 89 fa             	mov    %r15,%rdx
   11458:	e8 43 7c 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1145d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11461:	0f 84 54 ff ff ff    	je     113bb <hyperinterval_strict_chain64+0x6b>
   11467:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   1146c:	48 89 e7             	mov    %rsp,%rdi
   1146f:	4c 89 f6             	mov    %r14,%rsi
   11472:	4c 89 fa             	mov    %r15,%rdx
   11475:	4c 89 e9             	mov    %r13,%rcx
   11478:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   1147d:	4d 89 cd             	mov    %r9,%r13
   11480:	e8 5b 98 00 00       	call   1ace0 <<hyperinterval::ieee::Format>::affine>
   11485:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11489:	0f 84 2c ff ff ff    	je     113bb <hyperinterval_strict_chain64+0x6b>
   1148f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11494:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   1149b:	00 
   1149c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   114a1:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   114a8:	00 
   114a9:	48 89 e7             	mov    %rsp,%rdi
   114ac:	4c 89 f6             	mov    %r14,%rsi
   114af:	4c 89 fa             	mov    %r15,%rdx
   114b2:	4c 89 e1             	mov    %r12,%rcx
   114b5:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   114ba:	4d 89 e9             	mov    %r13,%r9
   114bd:	e8 1e 98 00 00       	call   1ace0 <<hyperinterval::ieee::Format>::affine>
   114c2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   114c6:	0f 84 ef fe ff ff    	je     113bb <hyperinterval_strict_chain64+0x6b>
   114cc:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   114d1:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   114d6:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   114db:	48 89 e7             	mov    %rsp,%rdi
   114de:	4c 89 f6             	mov    %r14,%rsi
   114e1:	4c 89 fa             	mov    %r15,%rdx
   114e4:	48 8b 8c 24 a0 00 00 	mov    0xa0(%rsp),%rcx
   114eb:	00 
   114ec:	e8 af 7b 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   114f1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   114f5:	74 21                	je     11518 <hyperinterval_strict_chain64+0x1c8>
   114f7:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   114fc:	48 89 e7             	mov    %rsp,%rdi
   114ff:	4c 89 f6             	mov    %r14,%rsi
   11502:	4c 89 fa             	mov    %r15,%rdx
   11505:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   1150c:	00 
   1150d:	e8 8e 7b 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11512:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11516:	75 13                	jne    1152b <hyperinterval_strict_chain64+0x1db>
   11518:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1151d:	88 4c 24 28          	mov    %cl,0x28(%rsp)
   11521:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   11526:	e9 95 fe ff ff       	jmp    113c0 <hyperinterval_strict_chain64+0x70>
   1152b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11530:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   11534:	4c 89 ea             	mov    %r13,%rdx
   11537:	48 21 ea             	and    %rbp,%rdx
   1153a:	4c 89 f6             	mov    %r14,%rsi
   1153d:	48 29 d6             	sub    %rdx,%rsi
   11540:	4d 85 ed             	test   %r13,%r13
   11543:	48 0f 49 f1          	cmovns %rcx,%rsi
   11547:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1154b:	48 89 c2             	mov    %rax,%rdx
   1154e:	48 21 ea             	and    %rbp,%rdx
   11551:	4c 89 f7             	mov    %r14,%rdi
   11554:	48 29 d7             	sub    %rdx,%rdi
   11557:	48 85 c0             	test   %rax,%rax
   1155a:	48 0f 49 f9          	cmovns %rcx,%rdi
   1155e:	b1 01                	mov    $0x1,%cl
   11560:	48 39 fe             	cmp    %rdi,%rsi
   11563:	77 b8                	ja     1151d <hyperinterval_strict_chain64+0x1cd>
   11565:	48 c7 84 24 80 00 00 	movq   $0x1,0x80(%rsp)
   1156c:	00 01 00 00 00 
   11571:	4c 89 ac 24 88 00 00 	mov    %r13,0x88(%rsp)
   11578:	00 
   11579:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   11580:	00 
   11581:	48 89 e7             	mov    %rsp,%rdi
   11584:	4c 89 e6             	mov    %r12,%rsi
   11587:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
   1158c:	e8 6f a8 00 00       	call   1be00 <<hyperinterval::float::F64Enclosure>::from_bits>
   11591:	48 8b 0c 24          	mov    (%rsp),%rcx
   11595:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1159a:	48 83 f9 02          	cmp    $0x2,%rcx
   1159e:	75 09                	jne    115a9 <hyperinterval_strict_chain64+0x259>
   115a0:	88 44 24 28          	mov    %al,0x28(%rsp)
   115a4:	e9 78 ff ff ff       	jmp    11521 <hyperinterval_strict_chain64+0x1d1>
   115a9:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   115ae:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   115b3:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   115b8:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   115bd:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   115c2:	88 44 24 70          	mov    %al,0x70(%rsp)
   115c6:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   115cb:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   115d2:	00 
   115d3:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   115d8:	e8 c3 a6 00 00       	call   1bca0 <<hyperinterval::float::F64Enclosure>::hull>
   115dd:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   115e2:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   115e7:	48 83 f9 02          	cmp    $0x2,%rcx
   115eb:	0f 84 cf fd ff ff    	je     113c0 <hyperinterval_strict_chain64+0x70>
   115f1:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   115f6:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   115fb:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   11602:	00 
   11603:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   1160a:	00 
   1160b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   11612:	00 
   11613:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   1161a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   1161f:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   11626:	00 
   11627:	e8 34 a3 00 00       	call   1b960 <<hyperinterval::float::F64Enclosure>::square>
   1162c:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   11631:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   11636:	48 83 f9 02          	cmp    $0x2,%rcx
   1163a:	0f 84 80 fd ff ff    	je     113c0 <hyperinterval_strict_chain64+0x70>
   11640:	49 bc 00 00 00 00 00 	movabs $0x3ff0000000000000,%r12
   11647:	00 f0 3f 
   1164a:	48 8b 54 24 59       	mov    0x59(%rsp),%rdx
   1164f:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   11654:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   11659:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   1165e:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   11663:	88 44 24 28          	mov    %al,0x28(%rsp)
   11667:	48 89 e7             	mov    %rsp,%rdi
   1166a:	4c 89 f6             	mov    %r14,%rsi
   1166d:	4c 89 fa             	mov    %r15,%rdx
   11670:	4c 89 e1             	mov    %r12,%rcx
   11673:	e8 28 7a 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11678:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1167c:	0f 84 39 fd ff ff    	je     113bb <hyperinterval_strict_chain64+0x6b>
   11682:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11687:	48 89 c1             	mov    %rax,%rcx
   1168a:	48 c1 e9 08          	shr    $0x8,%rcx
   1168e:	48 89 c2             	mov    %rax,%rdx
   11691:	48 c1 ea 38          	shr    $0x38,%rdx
   11695:	88 54 24 77          	mov    %dl,0x77(%rsp)
   11699:	48 89 c2             	mov    %rax,%rdx
   1169c:	48 c1 ea 28          	shr    $0x28,%rdx
   116a0:	66 89 54 24 75       	mov    %dx,0x75(%rsp)
   116a5:	89 4c 24 71          	mov    %ecx,0x71(%rsp)
   116a9:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   116ae:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   116b5:	00 00 
   116b7:	88 44 24 70          	mov    %al,0x70(%rsp)
   116bb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   116c0:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   116c5:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   116ca:	e8 51 aa 00 00       	call   1c120 <<hyperinterval::float::F64Enclosure>::add>
   116cf:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   116d4:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
   116d9:	48 83 f8 02          	cmp    $0x2,%rax
   116dd:	75 08                	jne    116e7 <hyperinterval_strict_chain64+0x397>
   116df:	88 4b 08             	mov    %cl,0x8(%rbx)
   116e2:	e9 dc fc ff ff       	jmp    113c3 <hyperinterval_strict_chain64+0x73>
   116e7:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   116ec:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   116f1:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   116f6:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   116fb:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   11700:	88 4c 24 58          	mov    %cl,0x58(%rsp)
   11704:	48 85 c0             	test   %rax,%rax
   11707:	74 46                	je     1174f <hyperinterval_strict_chain64+0x3ff>
   11709:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1170e:	4c 89 f6             	mov    %r14,%rsi
   11711:	4c 89 fa             	mov    %r15,%rdx
   11714:	4c 89 e1             	mov    %r12,%rcx
   11717:	e8 84 79 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1171c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   11721:	74 1f                	je     11742 <hyperinterval_strict_chain64+0x3f2>
   11723:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
   11728:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1172d:	4c 89 f6             	mov    %r14,%rsi
   11730:	4c 89 fa             	mov    %r15,%rdx
   11733:	4c 89 e1             	mov    %r12,%rcx
   11736:	e8 65 79 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1173b:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   11740:	75 19                	jne    1175b <hyperinterval_strict_chain64+0x40b>
   11742:	0f b6 4c 24 39       	movzbl 0x39(%rsp),%ecx
   11747:	88 4b 08             	mov    %cl,0x8(%rbx)
   1174a:	e9 74 fc ff ff       	jmp    113c3 <hyperinterval_strict_chain64+0x73>
   1174f:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   11756:	e9 6f fc ff ff       	jmp    113ca <hyperinterval_strict_chain64+0x7a>
   1175b:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   11760:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   11764:	4c 89 ea             	mov    %r13,%rdx
   11767:	48 21 ea             	and    %rbp,%rdx
   1176a:	4c 89 f6             	mov    %r14,%rsi
   1176d:	48 29 d6             	sub    %rdx,%rsi
   11770:	4d 85 ed             	test   %r13,%r13
   11773:	48 0f 49 f1          	cmovns %rcx,%rsi
   11777:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1177b:	48 89 c2             	mov    %rax,%rdx
   1177e:	48 21 ea             	and    %rbp,%rdx
   11781:	49 29 d6             	sub    %rdx,%r14
   11784:	48 85 c0             	test   %rax,%rax
   11787:	4c 0f 49 f1          	cmovns %rcx,%r14
   1178b:	b1 01                	mov    $0x1,%cl
   1178d:	4c 39 f6             	cmp    %r14,%rsi
   11790:	0f 87 49 ff ff ff    	ja     116df <hyperinterval_strict_chain64+0x38f>
   11796:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1179d:	00 
   1179e:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
   117a3:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   117a8:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
   117ae:	7f 0f                	jg     117bf <hyperinterval_strict_chain64+0x46f>
   117b0:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   117b5:	48 85 c0             	test   %rax,%rax
   117b8:	79 1a                	jns    117d4 <hyperinterval_strict_chain64+0x484>
   117ba:	48 21 e8             	and    %rbp,%rax
   117bd:	74 15                	je     117d4 <hyperinterval_strict_chain64+0x484>
   117bf:	48 89 e6             	mov    %rsp,%rsi
   117c2:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
   117c7:	48 89 df             	mov    %rbx,%rdi
   117ca:	e8 01 9d 00 00       	call   1b4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   117cf:	e9 f6 fb ff ff       	jmp    113ca <hyperinterval_strict_chain64+0x7a>
   117d4:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   117d8:	e9 e6 fb ff ff       	jmp    113c3 <hyperinterval_strict_chain64+0x73>
   117dd:	cc                   	int3
   117de:	cc                   	int3
   117df:	cc                   	int3

hyperinterval_strict_surface32:
   117e0:	55                   	push   %rbp
   117e1:	41 57                	push   %r15
   117e3:	41 56                	push   %r14
   117e5:	41 55                	push   %r13
   117e7:	41 54                	push   %r12
   117e9:	53                   	push   %rbx
   117ea:	48 81 ec c8 00 00 00 	sub    $0xc8,%rsp
   117f1:	41 89 f7             	mov    %esi,%r15d
   117f4:	66 0f 7e 4c 24 58    	movd   %xmm1,0x58(%rsp)
   117fa:	48 89 fd             	mov    %rdi,%rbp
   117fd:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   11803:	66 0f 7e 84 24 94 00 	movd   %xmm0,0x94(%rsp)
   1180a:	00 00 
   1180c:	66 0f 7e c3          	movd   %xmm0,%ebx
   11810:	48 89 e7             	mov    %rsp,%rdi
   11813:	be 00 00 00 80       	mov    $0x80000000,%esi
   11818:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1181d:	48 89 d9             	mov    %rbx,%rcx
   11820:	e8 7b 78 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11825:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11829:	74 2b                	je     11856 <hyperinterval_strict_surface32+0x76>
   1182b:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   11830:	66 0f 6e 44 24 58    	movd   0x58(%rsp),%xmm0
   11836:	66 41 0f 7e c6       	movd   %xmm0,%r14d
   1183b:	48 89 e7             	mov    %rsp,%rdi
   1183e:	be 00 00 00 80       	mov    $0x80000000,%esi
   11843:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11848:	4c 89 f1             	mov    %r14,%rcx
   1184b:	e8 50 78 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11850:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11854:	75 24                	jne    1187a <hyperinterval_strict_surface32+0x9a>
   11856:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1185b:	88 45 04             	mov    %al,0x4(%rbp)
   1185e:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   11865:	48 89 e8             	mov    %rbp,%rax
   11868:	48 81 c4 c8 00 00 00 	add    $0xc8,%rsp
   1186f:	5b                   	pop    %rbx
   11870:	41 5c                	pop    %r12
   11872:	41 5d                	pop    %r13
   11874:	41 5e                	pop    %r14
   11876:	41 5f                	pop    %r15
   11878:	5d                   	pop    %rbp
   11879:	c3                   	ret
   1187a:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1187f:	44 89 e0             	mov    %r12d,%eax
   11882:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   11887:	89 f9                	mov    %edi,%ecx
   11889:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1188f:	ba 00 00 00 80       	mov    $0x80000000,%edx
   11894:	29 c2                	sub    %eax,%edx
   11896:	44 09 e8             	or     %r13d,%eax
   11899:	45 85 e4             	test   %r12d,%r12d
   1189c:	48 0f 49 d0          	cmovns %rax,%rdx
   118a0:	be 00 00 00 80       	mov    $0x80000000,%esi
   118a5:	29 ce                	sub    %ecx,%esi
   118a7:	89 c8                	mov    %ecx,%eax
   118a9:	44 09 e8             	or     %r13d,%eax
   118ac:	85 ff                	test   %edi,%edi
   118ae:	48 0f 49 f0          	cmovns %rax,%rsi
   118b2:	b0 01                	mov    $0x1,%al
   118b4:	39 f2                	cmp    %esi,%edx
   118b6:	77 a3                	ja     1185b <hyperinterval_strict_surface32+0x7b>
   118b8:	44 89 e0             	mov    %r12d,%eax
   118bb:	44 89 e1             	mov    %r12d,%ecx
   118be:	c1 e9 08             	shr    $0x8,%ecx
   118c1:	41 c1 ec 18          	shr    $0x18,%r12d
   118c5:	44 88 64 24 53       	mov    %r12b,0x53(%rsp)
   118ca:	66 89 4c 24 51       	mov    %cx,0x51(%rsp)
   118cf:	49 89 fc             	mov    %rdi,%r12
   118d2:	89 7c 24 54          	mov    %edi,0x54(%rsp)
   118d6:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%rsp)
   118dd:	00 
   118de:	88 44 24 50          	mov    %al,0x50(%rsp)
   118e2:	48 89 e7             	mov    %rsp,%rdi
   118e5:	be 00 00 00 80       	mov    $0x80000000,%esi
   118ea:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   118ef:	48 89 d9             	mov    %rbx,%rcx
   118f2:	e8 a9 77 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   118f7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   118fb:	75 12                	jne    1190f <hyperinterval_strict_surface32+0x12f>
   118fd:	0f b6 5c 24 01       	movzbl 0x1(%rsp),%ebx
   11902:	c1 e3 08             	shl    $0x8,%ebx
   11905:	48 ff c3             	inc    %rbx
   11908:	f6 c3 01             	test   $0x1,%bl
   1190b:	75 5e                	jne    1196b <hyperinterval_strict_surface32+0x18b>
   1190d:	eb 64                	jmp    11973 <hyperinterval_strict_surface32+0x193>
   1190f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11914:	48 89 c1             	mov    %rax,%rcx
   11917:	4c 31 e9             	xor    %r13,%rcx
   1191a:	48 85 c0             	test   %rax,%rax
   1191d:	48 0f 44 c8          	cmove  %rax,%rcx
   11921:	31 c0                	xor    %eax,%eax
   11923:	85 c9                	test   %ecx,%ecx
   11925:	0f 99 c0             	setns  %al
   11928:	48 8d 4c 41 ff       	lea    -0x1(%rcx,%rax,2),%rcx
   1192d:	48 89 e7             	mov    %rsp,%rdi
   11930:	be 00 00 00 80       	mov    $0x80000000,%esi
   11935:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1193a:	e8 61 77 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1193f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11943:	75 07                	jne    1194c <hyperinterval_strict_surface32+0x16c>
   11945:	bb 01 03 00 00       	mov    $0x301,%ebx
   1194a:	eb 1f                	jmp    1196b <hyperinterval_strict_surface32+0x18b>
   1194c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11951:	48 89 c3             	mov    %rax,%rbx
   11954:	48 81 f3 00 00 00 80 	xor    $0xffffffff80000000,%rbx
   1195b:	48 c1 e3 20          	shl    $0x20,%rbx
   1195f:	48 85 c0             	test   %rax,%rax
   11962:	48 0f 44 d8          	cmove  %rax,%rbx
   11966:	f6 c3 01             	test   $0x1,%bl
   11969:	74 08                	je     11973 <hyperinterval_strict_surface32+0x193>
   1196b:	88 7d 04             	mov    %bh,0x4(%rbp)
   1196e:	e9 eb fe ff ff       	jmp    1185e <hyperinterval_strict_surface32+0x7e>
   11973:	48 89 e7             	mov    %rsp,%rdi
   11976:	be 00 00 00 80       	mov    $0x80000000,%esi
   1197b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11980:	4c 89 f1             	mov    %r14,%rcx
   11983:	e8 18 77 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11988:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1198c:	75 11                	jne    1199f <hyperinterval_strict_surface32+0x1bf>
   1198e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11993:	c1 e0 08             	shl    $0x8,%eax
   11996:	48 ff c0             	inc    %rax
   11999:	a8 01                	test   $0x1,%al
   1199b:	75 3f                	jne    119dc <hyperinterval_strict_surface32+0x1fc>
   1199d:	eb 45                	jmp    119e4 <hyperinterval_strict_surface32+0x204>
   1199f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   119a4:	31 c9                	xor    %ecx,%ecx
   119a6:	85 c0                	test   %eax,%eax
   119a8:	0f 99 c1             	setns  %cl
   119ab:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   119b0:	48 89 e7             	mov    %rsp,%rdi
   119b3:	be 00 00 00 80       	mov    $0x80000000,%esi
   119b8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   119bd:	e8 de 76 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   119c2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   119c6:	75 07                	jne    119cf <hyperinterval_strict_surface32+0x1ef>
   119c8:	b8 01 03 00 00       	mov    $0x301,%eax
   119cd:	eb 0d                	jmp    119dc <hyperinterval_strict_surface32+0x1fc>
   119cf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   119d4:	48 c1 e0 20          	shl    $0x20,%rax
   119d8:	a8 01                	test   $0x1,%al
   119da:	74 08                	je     119e4 <hyperinterval_strict_surface32+0x204>
   119dc:	88 65 04             	mov    %ah,0x4(%rbp)
   119df:	e9 7a fe ff ff       	jmp    1185e <hyperinterval_strict_surface32+0x7e>
   119e4:	49 89 c6             	mov    %rax,%r14
   119e7:	48 c1 eb 20          	shr    $0x20,%rbx
   119eb:	48 89 e7             	mov    %rsp,%rdi
   119ee:	be 00 00 00 80       	mov    $0x80000000,%esi
   119f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   119f8:	48 89 d9             	mov    %rbx,%rcx
   119fb:	e8 a0 76 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11a00:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11a04:	74 24                	je     11a2a <hyperinterval_strict_surface32+0x24a>
   11a06:	4c 89 f1             	mov    %r14,%rcx
   11a09:	48 c1 e9 20          	shr    $0x20,%rcx
   11a0d:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   11a12:	48 89 e7             	mov    %rsp,%rdi
   11a15:	be 00 00 00 80       	mov    $0x80000000,%esi
   11a1a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11a1f:	e8 7c 76 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11a24:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11a28:	75 0d                	jne    11a37 <hyperinterval_strict_surface32+0x257>
   11a2a:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   11a2f:	88 4d 04             	mov    %cl,0x4(%rbp)
   11a32:	e9 27 fe ff ff       	jmp    1185e <hyperinterval_strict_surface32+0x7e>
   11a37:	8b 44 24 08          	mov    0x8(%rsp),%eax
   11a3b:	89 d9                	mov    %ebx,%ecx
   11a3d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11a43:	89 c2                	mov    %eax,%edx
   11a45:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11a4b:	be 00 00 00 80       	mov    $0x80000000,%esi
   11a50:	29 ce                	sub    %ecx,%esi
   11a52:	44 09 e9             	or     %r13d,%ecx
   11a55:	85 db                	test   %ebx,%ebx
   11a57:	48 0f 49 f1          	cmovns %rcx,%rsi
   11a5b:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11a60:	29 d7                	sub    %edx,%edi
   11a62:	89 d1                	mov    %edx,%ecx
   11a64:	44 09 e9             	or     %r13d,%ecx
   11a67:	85 c0                	test   %eax,%eax
   11a69:	48 0f 49 f9          	cmovns %rcx,%rdi
   11a6d:	b1 01                	mov    $0x1,%cl
   11a6f:	39 fe                	cmp    %edi,%esi
   11a71:	77 bc                	ja     11a2f <hyperinterval_strict_surface32+0x24f>
   11a73:	89 d9                	mov    %ebx,%ecx
   11a75:	89 da                	mov    %ebx,%edx
   11a77:	c1 ea 08             	shr    $0x8,%edx
   11a7a:	c1 eb 18             	shr    $0x18,%ebx
   11a7d:	88 5c 24 6b          	mov    %bl,0x6b(%rsp)
   11a81:	66 89 54 24 69       	mov    %dx,0x69(%rsp)
   11a86:	89 44 24 6c          	mov    %eax,0x6c(%rsp)
   11a8a:	c7 44 24 64 01 00 00 	movl   $0x1,0x64(%rsp)
   11a91:	00 
   11a92:	88 4c 24 68          	mov    %cl,0x68(%rsp)
   11a96:	41 83 ff 02          	cmp    $0x2,%r15d
   11a9a:	0f 85 a9 00 00 00    	jne    11b49 <hyperinterval_strict_surface32+0x369>
   11aa0:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   11aa5:	48 8d 74 24 4c       	lea    0x4c(%rsp),%rsi
   11aaa:	e8 a1 81 00 00       	call   19c50 <<hyperinterval::float::F32Enclosure>::square>
   11aaf:	8b 44 24 28          	mov    0x28(%rsp),%eax
   11ab3:	0f b6 4c 24 2c       	movzbl 0x2c(%rsp),%ecx
   11ab8:	83 f8 02             	cmp    $0x2,%eax
   11abb:	0f 84 6e ff ff ff    	je     11a2f <hyperinterval_strict_surface32+0x24f>
   11ac1:	a8 01                	test   $0x1,%al
   11ac3:	0f 84 38 01 00 00    	je     11c01 <hyperinterval_strict_surface32+0x421>
   11ac9:	0f b6 c1             	movzbl %cl,%eax
   11acc:	0f b6 4c 24 2f       	movzbl 0x2f(%rsp),%ecx
   11ad1:	c1 e1 10             	shl    $0x10,%ecx
   11ad4:	0f b7 54 24 2d       	movzwl 0x2d(%rsp),%edx
   11ad9:	09 ca                	or     %ecx,%edx
   11adb:	8b 5c 24 30          	mov    0x30(%rsp),%ebx
   11adf:	c1 e2 08             	shl    $0x8,%edx
   11ae2:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   11ae5:	85 c9                	test   %ecx,%ecx
   11ae7:	8d 84 02 00 00 00 80 	lea    -0x80000000(%rdx,%rax,1),%eax
   11aee:	0f 44 c1             	cmove  %ecx,%eax
   11af1:	31 c9                	xor    %ecx,%ecx
   11af3:	85 c0                	test   %eax,%eax
   11af5:	0f 99 c1             	setns  %cl
   11af8:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   11afd:	48 89 e7             	mov    %rsp,%rdi
   11b00:	be 00 00 00 80       	mov    $0x80000000,%esi
   11b05:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11b0a:	e8 91 75 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11b0f:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11b13:	74 2d                	je     11b42 <hyperinterval_strict_surface32+0x362>
   11b15:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   11b1a:	31 c0                	xor    %eax,%eax
   11b1c:	85 db                	test   %ebx,%ebx
   11b1e:	0f 99 c0             	setns  %al
   11b21:	48 8d 4c 43 ff       	lea    -0x1(%rbx,%rax,2),%rcx
   11b26:	48 89 e7             	mov    %rsp,%rdi
   11b29:	be 00 00 00 80       	mov    $0x80000000,%esi
   11b2e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11b33:	e8 68 75 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11b38:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11b3c:	0f 85 21 03 00 00    	jne    11e63 <hyperinterval_strict_surface32+0x683>
   11b42:	b1 03                	mov    $0x3,%cl
   11b44:	e9 e6 fe ff ff       	jmp    11a2f <hyperinterval_strict_surface32+0x24f>
   11b49:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
   11b4d:	48 89 e7             	mov    %rsp,%rdi
   11b50:	be 00 00 00 80       	mov    $0x80000000,%esi
   11b55:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11b5a:	45 89 f8             	mov    %r15d,%r8d
   11b5d:	e8 fe 83 00 00       	call   19f60 <<hyperinterval::ieee::Format>::power>
   11b62:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11b66:	0f 84 be fe ff ff    	je     11a2a <hyperinterval_strict_surface32+0x24a>
   11b6c:	44 89 e1             	mov    %r12d,%ecx
   11b6f:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
   11b73:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   11b78:	48 89 e7             	mov    %rsp,%rdi
   11b7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   11b80:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11b85:	45 89 f8             	mov    %r15d,%r8d
   11b88:	e8 d3 83 00 00       	call   19f60 <<hyperinterval::ieee::Format>::power>
   11b8d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11b91:	0f 84 93 fe ff ff    	je     11a2a <hyperinterval_strict_surface32+0x24a>
   11b97:	8b 44 24 08          	mov    0x8(%rsp),%eax
   11b9b:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   11ba0:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11ba4:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
   11bab:	00 
   11bac:	48 89 e7             	mov    %rsp,%rdi
   11baf:	be 00 00 00 80       	mov    $0x80000000,%esi
   11bb4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11bb9:	48 89 d9             	mov    %rbx,%rcx
   11bbc:	e8 df 74 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11bc1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11bc5:	74 24                	je     11beb <hyperinterval_strict_surface32+0x40b>
   11bc7:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   11bcc:	48 89 e7             	mov    %rsp,%rdi
   11bcf:	be 00 00 00 80       	mov    $0x80000000,%esi
   11bd4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11bd9:	4c 89 f1             	mov    %r14,%rcx
   11bdc:	e8 bf 74 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11be1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11be5:	0f 85 18 03 00 00    	jne    11f03 <hyperinterval_strict_surface32+0x723>
   11beb:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   11bf0:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
   11bf4:	c7 44 24 28 02 00 00 	movl   $0x2,0x28(%rsp)
   11bfb:	00 
   11bfc:	e9 ae fe ff ff       	jmp    11aaf <hyperinterval_strict_surface32+0x2cf>
   11c01:	31 d2                	xor    %edx,%edx
   11c03:	66 89 8c 24 a9 00 00 	mov    %cx,0xa9(%rsp)
   11c0a:	00 
   11c0b:	c1 e9 10             	shr    $0x10,%ecx
   11c0e:	88 8c 24 ab 00 00 00 	mov    %cl,0xab(%rsp)
   11c15:	89 84 24 ac 00 00 00 	mov    %eax,0xac(%rsp)
   11c1c:	89 94 24 a4 00 00 00 	mov    %edx,0xa4(%rsp)
   11c23:	44 88 b4 24 a8 00 00 	mov    %r14b,0xa8(%rsp)
   11c2a:	00 
   11c2b:	4c 8d bc 24 bc 00 00 	lea    0xbc(%rsp),%r15
   11c32:	00 
   11c33:	48 8d b4 24 a4 00 00 	lea    0xa4(%rsp),%rsi
   11c3a:	00 
   11c3b:	4c 8d 74 24 64       	lea    0x64(%rsp),%r14
   11c40:	4c 89 ff             	mov    %r15,%rdi
   11c43:	4c 89 f2             	mov    %r14,%rdx
   11c46:	e8 35 89 00 00       	call   1a580 <<hyperinterval::float::F32Enclosure>::intersection>
   11c4b:	48 8d 9c 24 98 00 00 	lea    0x98(%rsp),%rbx
   11c52:	00 
   11c53:	48 8d 54 24 4c       	lea    0x4c(%rsp),%rdx
   11c58:	48 89 df             	mov    %rbx,%rdi
   11c5b:	4c 89 fe             	mov    %r15,%rsi
   11c5e:	e8 0d 87 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::hull>
   11c63:	48 89 e7             	mov    %rsp,%rdi
   11c66:	48 89 de             	mov    %rbx,%rsi
   11c69:	e8 82 8b 00 00       	call   1a7f0 <<hyperinterval::float::F32Enclosure>::abs>
   11c6e:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
   11c73:	48 89 de             	mov    %rbx,%rsi
   11c76:	4c 89 f2             	mov    %r14,%rdx
   11c79:	e8 c2 96 00 00       	call   1b340 <<hyperinterval::float::F32Enclosure>::min_image>
   11c7e:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   11c83:	48 89 de             	mov    %rbx,%rsi
   11c86:	4c 89 f2             	mov    %r14,%rdx
   11c89:	e8 c2 95 00 00       	call   1b250 <<hyperinterval::float::F32Enclosure>::max_image>
   11c8e:	8b 44 24 20          	mov    0x20(%rsp),%eax
   11c92:	89 84 24 90 00 00 00 	mov    %eax,0x90(%rsp)
   11c99:	0f 10 04 24          	movups (%rsp),%xmm0
   11c9d:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
   11ca2:	0f 29 8c 24 80 00 00 	movaps %xmm1,0x80(%rsp)
   11ca9:	00 
   11caa:	0f 29 44 24 70       	movaps %xmm0,0x70(%rsp)
   11caf:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
   11cb4:	48 89 df             	mov    %rbx,%rdi
   11cb7:	e8 94 87 00 00       	call   1a450 <<hyperinterval::float::F32Enclosure>::signs>
   11cbc:	8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%ecx
   11cc3:	83 f9 01             	cmp    $0x1,%ecx
   11cc6:	75 22                	jne    11cea <hyperinterval_strict_surface32+0x50a>
   11cc8:	8b b4 24 9c 00 00 00 	mov    0x9c(%rsp),%esi
   11ccf:	8b bc 24 a0 00 00 00 	mov    0xa0(%rsp),%edi
   11cd6:	39 fe                	cmp    %edi,%esi
   11cd8:	0f 94 c2             	sete   %dl
   11cdb:	66 0f 6e ce          	movd   %esi,%xmm1
   11cdf:	66 0f 6e c7          	movd   %edi,%xmm0
   11ce3:	be 01 00 00 00       	mov    $0x1,%esi
   11ce8:	eb 04                	jmp    11cee <hyperinterval_strict_surface32+0x50e>
   11cea:	31 d2                	xor    %edx,%edx
   11cec:	31 f6                	xor    %esi,%esi
   11cee:	80 f1 01             	xor    $0x1,%cl
   11cf1:	89 34 24             	mov    %esi,(%rsp)
   11cf4:	66 0f 7e 4c 24 04    	movd   %xmm1,0x4(%rsp)
   11cfa:	88 4c 24 08          	mov    %cl,0x8(%rsp)
   11cfe:	88 54 24 09          	mov    %dl,0x9(%rsp)
   11d02:	88 44 24 0a          	mov    %al,0xa(%rsp)
   11d06:	89 74 24 0c          	mov    %esi,0xc(%rsp)
   11d0a:	66 0f 7e 44 24 10    	movd   %xmm0,0x10(%rsp)
   11d10:	48 89 e0             	mov    %rsp,%rax
   11d13:	48 8d bc 24 98 00 00 	lea    0x98(%rsp),%rdi
   11d1a:	00 
   11d1b:	66 0f 6e 84 24 94 00 	movd   0x94(%rsp),%xmm0
   11d22:	00 00 
   11d24:	e8 67 89 00 00       	call   1a690 <<hyperinterval::float::F32Enclosure>::contains_point>
   11d29:	41 89 d6             	mov    %edx,%r14d
   11d2c:	a8 01                	test   $0x1,%al
   11d2e:	74 09                	je     11d39 <hyperinterval_strict_surface32+0x559>
   11d30:	44 88 75 04          	mov    %r14b,0x4(%rbp)
   11d34:	e9 25 fb ff ff       	jmp    1185e <hyperinterval_strict_surface32+0x7e>
   11d39:	4c 8d ac 24 98 00 00 	lea    0x98(%rsp),%r13
   11d40:	00 
   11d41:	4c 8d 7c 24 4c       	lea    0x4c(%rsp),%r15
   11d46:	4c 89 ef             	mov    %r13,%rdi
   11d49:	4c 89 fe             	mov    %r15,%rsi
   11d4c:	e8 4f 94 00 00       	call   1b1a0 <<hyperinterval::float::F32Enclosure>::overlaps>
   11d51:	88 44 24 58          	mov    %al,0x58(%rsp)
   11d55:	4c 89 ef             	mov    %r13,%rdi
   11d58:	4c 89 fe             	mov    %r15,%rsi
   11d5b:	e8 90 93 00 00       	call   1b0f0 <<hyperinterval::float::F32Enclosure>::disjoint>
   11d60:	41 89 c7             	mov    %eax,%r15d
   11d63:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   11d68:	4c 89 ef             	mov    %r13,%rdi
   11d6b:	e8 e0 89 00 00       	call   1a750 <<hyperinterval::float::F32Enclosure>::interior_subset_of>
   11d70:	89 c3                	mov    %eax,%ebx
   11d72:	4c 89 ef             	mov    %r13,%rdi
   11d75:	48 8d 74 24 64       	lea    0x64(%rsp),%rsi
   11d7a:	e8 b1 96 00 00       	call   1b430 <<hyperinterval::float::F32Enclosure>::subset_of>
   11d7f:	88 04 24             	mov    %al,(%rsp)
   11d82:	88 5c 24 01          	mov    %bl,0x1(%rsp)
   11d86:	44 88 7c 24 02       	mov    %r15b,0x2(%rsp)
   11d8b:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   11d90:	88 44 24 03          	mov    %al,0x3(%rsp)
   11d94:	44 88 74 24 04       	mov    %r14b,0x4(%rsp)
   11d99:	48 89 e0             	mov    %rsp,%rax
   11d9c:	8b 44 24 50          	mov    0x50(%rsp),%eax
   11da0:	41 8d 8c 24 00 00 00 	lea    -0x80000000(%r12),%ecx
   11da7:	80 
   11da8:	45 85 e4             	test   %r12d,%r12d
   11dab:	41 0f 44 cc          	cmove  %r12d,%ecx
   11daf:	8d 90 00 00 00 80    	lea    -0x80000000(%rax),%edx
   11db5:	85 c0                	test   %eax,%eax
   11db7:	0f 44 d0             	cmove  %eax,%edx
   11dba:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   11dc1:	00 
   11dc2:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   11dc6:	89 54 24 3c          	mov    %edx,0x3c(%rsp)
   11dca:	48 89 e7             	mov    %rsp,%rdi
   11dcd:	48 8d 54 24 34       	lea    0x34(%rsp),%rdx
   11dd2:	4c 89 ee             	mov    %r13,%rsi
   11dd5:	e8 b6 8e 00 00       	call   1ac90 <<hyperinterval::float::F32Enclosure>::sub>
   11dda:	8b 0c 24             	mov    (%rsp),%ecx
   11ddd:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   11de2:	83 f9 02             	cmp    $0x2,%ecx
   11de5:	0f 84 70 fa ff ff    	je     1185b <hyperinterval_strict_surface32+0x7b>
   11deb:	8b 54 24 05          	mov    0x5(%rsp),%edx
   11def:	8b 74 24 08          	mov    0x8(%rsp),%esi
   11df3:	89 74 24 48          	mov    %esi,0x48(%rsp)
   11df7:	89 54 24 45          	mov    %edx,0x45(%rsp)
   11dfb:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   11dff:	88 44 24 44          	mov    %al,0x44(%rsp)
   11e03:	48 89 e7             	mov    %rsp,%rdi
   11e06:	be 00 00 00 80       	mov    $0x80000000,%esi
   11e0b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11e10:	b9 00 00 00 40       	mov    $0x40000000,%ecx
   11e15:	e8 86 72 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11e1a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11e1e:	0f 84 32 fa ff ff    	je     11856 <hyperinterval_strict_surface32+0x76>
   11e24:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11e29:	89 c1                	mov    %eax,%ecx
   11e2b:	c1 e9 08             	shr    $0x8,%ecx
   11e2e:	89 c2                	mov    %eax,%edx
   11e30:	c1 ea 18             	shr    $0x18,%edx
   11e33:	88 54 24 77          	mov    %dl,0x77(%rsp)
   11e37:	66 89 4c 24 75       	mov    %cx,0x75(%rsp)
   11e3c:	89 44 24 78          	mov    %eax,0x78(%rsp)
   11e40:	c7 44 24 70 01 00 00 	movl   $0x1,0x70(%rsp)
   11e47:	00 
   11e48:	88 44 24 74          	mov    %al,0x74(%rsp)
   11e4c:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   11e51:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   11e56:	48 89 ef             	mov    %rbp,%rdi
   11e59:	e8 f2 8d 00 00       	call   1ac50 <<hyperinterval::float::F32Enclosure>::div>
   11e5e:	e9 02 fa ff ff       	jmp    11865 <hyperinterval_strict_surface32+0x85>
   11e63:	44 89 f1             	mov    %r14d,%ecx
   11e66:	4c 31 e9             	xor    %r13,%rcx
   11e69:	4d 85 f6             	test   %r14,%r14
   11e6c:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
   11e70:	49 0f 44 ce          	cmove  %r14,%rcx
   11e74:	48 89 e7             	mov    %rsp,%rdi
   11e77:	be 00 00 00 80       	mov    $0x80000000,%esi
   11e7c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11e81:	e8 1a 72 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11e86:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11e8a:	0f 84 9a fb ff ff    	je     11a2a <hyperinterval_strict_surface32+0x24a>
   11e90:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   11e95:	48 89 e7             	mov    %rsp,%rdi
   11e98:	be 00 00 00 80       	mov    $0x80000000,%esi
   11e9d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11ea2:	48 89 d9             	mov    %rbx,%rcx
   11ea5:	e8 f6 71 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11eaa:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11eae:	0f 84 76 fb ff ff    	je     11a2a <hyperinterval_strict_surface32+0x24a>
   11eb4:	8b 44 24 08          	mov    0x8(%rsp),%eax
   11eb8:	44 89 f1             	mov    %r14d,%ecx
   11ebb:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11ec1:	89 c2                	mov    %eax,%edx
   11ec3:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11ec9:	be 00 00 00 80       	mov    $0x80000000,%esi
   11ece:	29 ce                	sub    %ecx,%esi
   11ed0:	44 09 e9             	or     %r13d,%ecx
   11ed3:	45 85 f6             	test   %r14d,%r14d
   11ed6:	48 0f 49 f1          	cmovns %rcx,%rsi
   11eda:	89 d1                	mov    %edx,%ecx
   11edc:	44 09 e9             	or     %r13d,%ecx
   11edf:	41 29 d5             	sub    %edx,%r13d
   11ee2:	85 c0                	test   %eax,%eax
   11ee4:	4c 0f 49 e9          	cmovns %rcx,%r13
   11ee8:	b1 01                	mov    $0x1,%cl
   11eea:	44 39 ee             	cmp    %r13d,%esi
   11eed:	0f 87 3c fb ff ff    	ja     11a2f <hyperinterval_strict_surface32+0x24f>
   11ef3:	44 89 f1             	mov    %r14d,%ecx
   11ef6:	c1 e9 08             	shr    $0x8,%ecx
   11ef9:	ba 01 00 00 00       	mov    $0x1,%edx
   11efe:	e9 00 fd ff ff       	jmp    11c03 <hyperinterval_strict_surface32+0x423>
   11f03:	8b 44 24 08          	mov    0x8(%rsp),%eax
   11f07:	89 d9                	mov    %ebx,%ecx
   11f09:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11f0f:	89 c2                	mov    %eax,%edx
   11f11:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11f17:	be 00 00 00 80       	mov    $0x80000000,%esi
   11f1c:	29 ce                	sub    %ecx,%esi
   11f1e:	44 09 e9             	or     %r13d,%ecx
   11f21:	85 db                	test   %ebx,%ebx
   11f23:	48 0f 49 f1          	cmovns %rcx,%rsi
   11f27:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11f2c:	29 d7                	sub    %edx,%edi
   11f2e:	89 d1                	mov    %edx,%ecx
   11f30:	44 09 e9             	or     %r13d,%ecx
   11f33:	85 c0                	test   %eax,%eax
   11f35:	48 0f 49 f9          	cmovns %rcx,%rdi
   11f39:	b1 01                	mov    $0x1,%cl
   11f3b:	39 fe                	cmp    %edi,%esi
   11f3d:	0f 87 ad fc ff ff    	ja     11bf0 <hyperinterval_strict_surface32+0x410>
   11f43:	89 d9                	mov    %ebx,%ecx
   11f45:	c1 e9 08             	shr    $0x8,%ecx
   11f48:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   11f4f:	00 
   11f50:	88 5c 24 38          	mov    %bl,0x38(%rsp)
   11f54:	c1 eb 18             	shr    $0x18,%ebx
   11f57:	88 5c 24 3b          	mov    %bl,0x3b(%rsp)
   11f5b:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   11f60:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   11f64:	48 89 e7             	mov    %rsp,%rdi
   11f67:	be 00 00 00 80       	mov    $0x80000000,%esi
   11f6c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11f71:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   11f76:	e8 25 71 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11f7b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11f7f:	0f 84 66 fc ff ff    	je     11beb <hyperinterval_strict_surface32+0x40b>
   11f85:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
   11f8a:	48 89 e7             	mov    %rsp,%rdi
   11f8d:	be 00 00 00 80       	mov    $0x80000000,%esi
   11f92:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11f97:	48 8b 8c 24 b0 00 00 	mov    0xb0(%rsp),%rcx
   11f9e:	00 
   11f9f:	e8 fc 70 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   11fa4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11fa8:	0f 84 3d fc ff ff    	je     11beb <hyperinterval_strict_surface32+0x40b>
   11fae:	8b 44 24 08          	mov    0x8(%rsp),%eax
   11fb2:	89 d9                	mov    %ebx,%ecx
   11fb4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11fba:	89 c2                	mov    %eax,%edx
   11fbc:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11fc2:	be 00 00 00 80       	mov    $0x80000000,%esi
   11fc7:	29 ce                	sub    %ecx,%esi
   11fc9:	44 09 e9             	or     %r13d,%ecx
   11fcc:	85 db                	test   %ebx,%ebx
   11fce:	48 0f 49 f1          	cmovns %rcx,%rsi
   11fd2:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11fd7:	29 d7                	sub    %edx,%edi
   11fd9:	89 d1                	mov    %edx,%ecx
   11fdb:	44 09 e9             	or     %r13d,%ecx
   11fde:	85 c0                	test   %eax,%eax
   11fe0:	48 0f 49 f9          	cmovns %rcx,%rdi
   11fe4:	b1 01                	mov    $0x1,%cl
   11fe6:	39 fe                	cmp    %edi,%esi
   11fe8:	0f 87 02 fc ff ff    	ja     11bf0 <hyperinterval_strict_surface32+0x410>
   11fee:	89 d9                	mov    %ebx,%ecx
   11ff0:	c1 e9 08             	shr    $0x8,%ecx
   11ff3:	c7 44 24 70 01 00 00 	movl   $0x1,0x70(%rsp)
   11ffa:	00 
   11ffb:	88 5c 24 74          	mov    %bl,0x74(%rsp)
   11fff:	c1 eb 18             	shr    $0x18,%ebx
   12002:	88 5c 24 77          	mov    %bl,0x77(%rsp)
   12006:	66 89 4c 24 75       	mov    %cx,0x75(%rsp)
   1200b:	89 44 24 78          	mov    %eax,0x78(%rsp)
   1200f:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
   12014:	48 8d 74 24 34       	lea    0x34(%rsp),%rsi
   12019:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   1201e:	e8 4d 83 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::hull>
   12023:	45 85 ff             	test   %r15d,%r15d
   12026:	0f 95 c0             	setne  %al
   12029:	41 f6 c7 01          	test   $0x1,%r15b
   1202d:	0f 94 c1             	sete   %cl
   12030:	84 c8                	test   %cl,%al
   12032:	74 76                	je     120aa <hyperinterval_strict_surface32+0x8ca>
   12034:	48 8d 7c 24 4c       	lea    0x4c(%rsp),%rdi
   12039:	e8 12 84 00 00       	call   1a450 <<hyperinterval::float::F32Enclosure>::signs>
   1203e:	a8 02                	test   $0x2,%al
   12040:	74 68                	je     120aa <hyperinterval_strict_surface32+0x8ca>
   12042:	48 89 e7             	mov    %rsp,%rdi
   12045:	31 f6                	xor    %esi,%esi
   12047:	31 d2                	xor    %edx,%edx
   12049:	e8 72 84 00 00       	call   1a4c0 <<hyperinterval::float::F32Enclosure>::from_bits>
   1204e:	8b 0c 24             	mov    (%rsp),%ecx
   12051:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   12056:	83 f9 02             	cmp    $0x2,%ecx
   12059:	75 11                	jne    1206c <hyperinterval_strict_surface32+0x88c>
   1205b:	88 44 24 2c          	mov    %al,0x2c(%rsp)
   1205f:	c7 44 24 28 02 00 00 	movl   $0x2,0x28(%rsp)
   12066:	00 
   12067:	e9 43 fa ff ff       	jmp    11aaf <hyperinterval_strict_surface32+0x2cf>
   1206c:	8b 54 24 05          	mov    0x5(%rsp),%edx
   12070:	8b 74 24 08          	mov    0x8(%rsp),%esi
   12074:	89 74 24 78          	mov    %esi,0x78(%rsp)
   12078:	89 54 24 75          	mov    %edx,0x75(%rsp)
   1207c:	89 4c 24 70          	mov    %ecx,0x70(%rsp)
   12080:	88 44 24 74          	mov    %al,0x74(%rsp)
   12084:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
   12089:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   1208e:	48 8d 54 24 70       	lea    0x70(%rsp),%rdx
   12093:	e8 d8 82 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::hull>
   12098:	8b 44 24 3c          	mov    0x3c(%rsp),%eax
   1209c:	89 44 24 48          	mov    %eax,0x48(%rsp)
   120a0:	48 8b 44 24 34       	mov    0x34(%rsp),%rax
   120a5:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   120aa:	8b 44 24 48          	mov    0x48(%rsp),%eax
   120ae:	89 44 24 30          	mov    %eax,0x30(%rsp)
   120b2:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   120b7:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   120bc:	e9 ee f9 ff ff       	jmp    11aaf <hyperinterval_strict_surface32+0x2cf>
   120c1:	cc                   	int3
   120c2:	cc                   	int3
   120c3:	cc                   	int3
   120c4:	cc                   	int3
   120c5:	cc                   	int3
   120c6:	cc                   	int3
   120c7:	cc                   	int3
   120c8:	cc                   	int3
   120c9:	cc                   	int3
   120ca:	cc                   	int3
   120cb:	cc                   	int3
   120cc:	cc                   	int3
   120cd:	cc                   	int3
   120ce:	cc                   	int3
   120cf:	cc                   	int3

hyperinterval_strict_surface64:
   120d0:	55                   	push   %rbp
   120d1:	41 57                	push   %r15
   120d3:	41 56                	push   %r14
   120d5:	41 55                	push   %r13
   120d7:	41 54                	push   %r12
   120d9:	53                   	push   %rbx
   120da:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
   120e1:	41 89 f6             	mov    %esi,%r14d
   120e4:	66 0f d6 4c 24 48    	movq   %xmm1,0x48(%rsp)
   120ea:	48 89 fb             	mov    %rdi,%rbx
   120ed:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
   120f4:	00 00 80 
   120f7:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   120fe:	00 f0 7f 
   12101:	66 0f d6 84 24 68 01 	movq   %xmm0,0x168(%rsp)
   12108:	00 00 
   1210a:	66 49 0f 7e c7       	movq   %xmm0,%r15
   1210f:	48 89 e7             	mov    %rsp,%rdi
   12112:	48 89 ee             	mov    %rbp,%rsi
   12115:	4c 89 e2             	mov    %r12,%rdx
   12118:	4c 89 f9             	mov    %r15,%rcx
   1211b:	e8 80 6f 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12120:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12124:	74 2c                	je     12152 <hyperinterval_strict_surface64+0x82>
   12126:	44 89 74 24 50       	mov    %r14d,0x50(%rsp)
   1212b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   12130:	f3 0f 7e 44 24 48    	movq   0x48(%rsp),%xmm0
   12136:	66 49 0f 7e c5       	movq   %xmm0,%r13
   1213b:	48 89 e7             	mov    %rsp,%rdi
   1213e:	48 89 ee             	mov    %rbp,%rsi
   12141:	4c 89 e2             	mov    %r12,%rdx
   12144:	4c 89 e9             	mov    %r13,%rcx
   12147:	e8 54 6f 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1214c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12150:	75 24                	jne    12176 <hyperinterval_strict_surface64+0xa6>
   12152:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   12157:	88 43 08             	mov    %al,0x8(%rbx)
   1215a:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   12161:	48 89 d8             	mov    %rbx,%rax
   12164:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
   1216b:	5b                   	pop    %rbx
   1216c:	41 5c                	pop    %r12
   1216e:	41 5d                	pop    %r13
   12170:	41 5e                	pop    %r14
   12172:	41 5f                	pop    %r15
   12174:	5d                   	pop    %rbp
   12175:	c3                   	ret
   12176:	48 89 ee             	mov    %rbp,%rsi
   12179:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1217e:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   12182:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   12186:	4c 89 f1             	mov    %r14,%rcx
   12189:	4c 21 c1             	and    %r8,%rcx
   1218c:	48 89 f2             	mov    %rsi,%rdx
   1218f:	48 29 ca             	sub    %rcx,%rdx
   12192:	4d 85 f6             	test   %r14,%r14
   12195:	48 0f 49 d0          	cmovns %rax,%rdx
   12199:	48 8d 04 2e          	lea    (%rsi,%rbp,1),%rax
   1219d:	48 89 e9             	mov    %rbp,%rcx
   121a0:	4c 21 c1             	and    %r8,%rcx
   121a3:	48 89 f7             	mov    %rsi,%rdi
   121a6:	48 29 cf             	sub    %rcx,%rdi
   121a9:	48 85 ed             	test   %rbp,%rbp
   121ac:	48 0f 49 f8          	cmovns %rax,%rdi
   121b0:	b0 01                	mov    $0x1,%al
   121b2:	48 39 fa             	cmp    %rdi,%rdx
   121b5:	77 a0                	ja     12157 <hyperinterval_strict_surface64+0x87>
   121b7:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   121bc:	48 c7 84 24 c8 00 00 	movq   $0x1,0xc8(%rsp)
   121c3:	00 01 00 00 00 
   121c8:	4c 89 b4 24 a8 00 00 	mov    %r14,0xa8(%rsp)
   121cf:	00 
   121d0:	4c 89 b4 24 d0 00 00 	mov    %r14,0xd0(%rsp)
   121d7:	00 
   121d8:	48 89 ac 24 d8 00 00 	mov    %rbp,0xd8(%rsp)
   121df:	00 
   121e0:	48 89 e7             	mov    %rsp,%rdi
   121e3:	49 89 f6             	mov    %rsi,%r14
   121e6:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   121ed:	00 f0 7f 
   121f0:	4c 89 e2             	mov    %r12,%rdx
   121f3:	4c 89 f9             	mov    %r15,%rcx
   121f6:	e8 a5 6e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   121fb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   121ff:	0f 84 4d ff ff ff    	je     12152 <hyperinterval_strict_surface64+0x82>
   12205:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1220a:	48 89 c2             	mov    %rax,%rdx
   1220d:	4c 31 f2             	xor    %r14,%rdx
   12210:	48 85 c0             	test   %rax,%rax
   12213:	48 0f 44 d0          	cmove  %rax,%rdx
   12217:	48 89 d1             	mov    %rdx,%rcx
   1221a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1221e:	48 83 c9 01          	or     $0x1,%rcx
   12222:	48 01 d1             	add    %rdx,%rcx
   12225:	48 89 e7             	mov    %rsp,%rdi
   12228:	4c 89 f6             	mov    %r14,%rsi
   1222b:	4c 89 e2             	mov    %r12,%rdx
   1222e:	e8 6d 6e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12233:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12237:	75 07                	jne    12240 <hyperinterval_strict_surface64+0x170>
   12239:	b0 03                	mov    $0x3,%al
   1223b:	e9 17 ff ff ff       	jmp    12157 <hyperinterval_strict_surface64+0x87>
   12240:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12245:	49 89 c7             	mov    %rax,%r15
   12248:	4d 31 f7             	xor    %r14,%r15
   1224b:	48 85 c0             	test   %rax,%rax
   1224e:	4c 0f 44 f8          	cmove  %rax,%r15
   12252:	48 89 e7             	mov    %rsp,%rdi
   12255:	4c 89 f6             	mov    %r14,%rsi
   12258:	4c 89 e2             	mov    %r12,%rdx
   1225b:	4c 89 e9             	mov    %r13,%rcx
   1225e:	e8 3d 6e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12263:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12267:	0f 84 e5 fe ff ff    	je     12152 <hyperinterval_strict_surface64+0x82>
   1226d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12272:	48 89 c1             	mov    %rax,%rcx
   12275:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12279:	48 83 c9 01          	or     $0x1,%rcx
   1227d:	48 01 c1             	add    %rax,%rcx
   12280:	48 89 e7             	mov    %rsp,%rdi
   12283:	4c 89 f6             	mov    %r14,%rsi
   12286:	4c 89 e2             	mov    %r12,%rdx
   12289:	e8 12 6e 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1228e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12292:	74 a5                	je     12239 <hyperinterval_strict_surface64+0x169>
   12294:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   12299:	48 89 e7             	mov    %rsp,%rdi
   1229c:	4c 89 f6             	mov    %r14,%rsi
   1229f:	4c 89 e2             	mov    %r12,%rdx
   122a2:	4c 89 f9             	mov    %r15,%rcx
   122a5:	e8 f6 6d 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   122aa:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   122ae:	74 1c                	je     122cc <hyperinterval_strict_surface64+0x1fc>
   122b0:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   122b5:	48 89 e7             	mov    %rsp,%rdi
   122b8:	4c 89 f6             	mov    %r14,%rsi
   122bb:	4c 89 e2             	mov    %r12,%rdx
   122be:	4c 89 e9             	mov    %r13,%rcx
   122c1:	e8 da 6d 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   122c6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   122ca:	75 0d                	jne    122d9 <hyperinterval_strict_surface64+0x209>
   122cc:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   122d1:	88 4b 08             	mov    %cl,0x8(%rbx)
   122d4:	e9 81 fe ff ff       	jmp    1215a <hyperinterval_strict_surface64+0x8a>
   122d9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   122de:	4b 8d 0c 37          	lea    (%r15,%r14,1),%rcx
   122e2:	4c 89 fa             	mov    %r15,%rdx
   122e5:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
   122ea:	48 21 fa             	and    %rdi,%rdx
   122ed:	4c 89 f6             	mov    %r14,%rsi
   122f0:	48 29 d6             	sub    %rdx,%rsi
   122f3:	4d 85 ff             	test   %r15,%r15
   122f6:	48 0f 49 f1          	cmovns %rcx,%rsi
   122fa:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   122fe:	48 89 c2             	mov    %rax,%rdx
   12301:	48 21 fa             	and    %rdi,%rdx
   12304:	4c 89 f7             	mov    %r14,%rdi
   12307:	48 29 d7             	sub    %rdx,%rdi
   1230a:	48 85 c0             	test   %rax,%rax
   1230d:	48 0f 49 f9          	cmovns %rcx,%rdi
   12311:	b1 01                	mov    $0x1,%cl
   12313:	48 39 fe             	cmp    %rdi,%rsi
   12316:	77 b9                	ja     122d1 <hyperinterval_strict_surface64+0x201>
   12318:	44 89 f9             	mov    %r15d,%ecx
   1231b:	4c 89 fa             	mov    %r15,%rdx
   1231e:	48 c1 ea 08          	shr    $0x8,%rdx
   12322:	4c 89 fe             	mov    %r15,%rsi
   12325:	48 c1 ee 38          	shr    $0x38,%rsi
   12329:	40 88 b4 24 bf 00 00 	mov    %sil,0xbf(%rsp)
   12330:	00 
   12331:	49 c1 ef 28          	shr    $0x28,%r15
   12335:	66 44 89 bc 24 bd 00 	mov    %r15w,0xbd(%rsp)
   1233c:	00 00 
   1233e:	89 94 24 b9 00 00 00 	mov    %edx,0xb9(%rsp)
   12345:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
   1234c:	00 
   1234d:	48 c7 84 24 b0 00 00 	movq   $0x1,0xb0(%rsp)
   12354:	00 01 00 00 00 
   12359:	88 8c 24 b8 00 00 00 	mov    %cl,0xb8(%rsp)
   12360:	44 8b 6c 24 50       	mov    0x50(%rsp),%r13d
   12365:	41 83 fd 02          	cmp    $0x2,%r13d
   12369:	0f 85 d6 00 00 00    	jne    12445 <hyperinterval_strict_surface64+0x375>
   1236f:	48 8d 7c 24 70       	lea    0x70(%rsp),%rdi
   12374:	48 8d b4 24 c8 00 00 	lea    0xc8(%rsp),%rsi
   1237b:	00 
   1237c:	e8 df 95 00 00       	call   1b960 <<hyperinterval::float::F64Enclosure>::square>
   12381:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   12388:	00 f0 7f 
   1238b:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
   12390:	0f b6 4c 24 78       	movzbl 0x78(%rsp),%ecx
   12395:	48 83 f8 02          	cmp    $0x2,%rax
   12399:	0f 84 32 ff ff ff    	je     122d1 <hyperinterval_strict_surface64+0x201>
   1239f:	48 83 f8 01          	cmp    $0x1,%rax
   123a3:	0f 85 67 01 00 00    	jne    12510 <hyperinterval_strict_surface64+0x440>
   123a9:	0f b6 c1             	movzbl %cl,%eax
   123ac:	0f b6 4c 24 7f       	movzbl 0x7f(%rsp),%ecx
   123b1:	c1 e1 10             	shl    $0x10,%ecx
   123b4:	0f b7 54 24 7d       	movzwl 0x7d(%rsp),%edx
   123b9:	09 ca                	or     %ecx,%edx
   123bb:	48 c1 e2 20          	shl    $0x20,%rdx
   123bf:	8b 4c 24 79          	mov    0x79(%rsp),%ecx
   123c3:	48 09 d1             	or     %rdx,%rcx
   123c6:	4c 8b bc 24 80 00 00 	mov    0x80(%rsp),%r15
   123cd:	00 
   123ce:	48 c1 e1 08          	shl    $0x8,%rcx
   123d2:	48 09 c1             	or     %rax,%rcx
   123d5:	48 89 c8             	mov    %rcx,%rax
   123d8:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   123df:	00 00 80 
   123e2:	4c 31 f0             	xor    %r14,%rax
   123e5:	48 85 c9             	test   %rcx,%rcx
   123e8:	48 0f 44 c1          	cmove  %rcx,%rax
   123ec:	48 89 c1             	mov    %rax,%rcx
   123ef:	48 c1 f9 3f          	sar    $0x3f,%rcx
   123f3:	48 83 c9 01          	or     $0x1,%rcx
   123f7:	48 01 c1             	add    %rax,%rcx
   123fa:	48 89 e7             	mov    %rsp,%rdi
   123fd:	4c 89 f6             	mov    %r14,%rsi
   12400:	4c 89 e2             	mov    %r12,%rdx
   12403:	e8 98 6c 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12408:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1240c:	74 30                	je     1243e <hyperinterval_strict_surface64+0x36e>
   1240e:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
   12413:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   12418:	4c 89 f9             	mov    %r15,%rcx
   1241b:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1241f:	48 83 c9 01          	or     $0x1,%rcx
   12423:	4c 01 f9             	add    %r15,%rcx
   12426:	48 89 e7             	mov    %rsp,%rdi
   12429:	4c 89 f6             	mov    %r14,%rsi
   1242c:	4c 89 e2             	mov    %r12,%rdx
   1242f:	e8 6c 6c 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12434:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12438:	0f 85 94 03 00 00    	jne    127d2 <hyperinterval_strict_surface64+0x702>
   1243e:	b1 03                	mov    $0x3,%cl
   12440:	e9 8c fe ff ff       	jmp    122d1 <hyperinterval_strict_surface64+0x201>
   12445:	48 89 e7             	mov    %rsp,%rdi
   12448:	4c 89 f6             	mov    %r14,%rsi
   1244b:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   12452:	00 f0 7f 
   12455:	4c 89 e2             	mov    %r12,%rdx
   12458:	48 8b 8c 24 a8 00 00 	mov    0xa8(%rsp),%rcx
   1245f:	00 
   12460:	45 89 e8             	mov    %r13d,%r8d
   12463:	e8 f8 7a 00 00       	call   19f60 <<hyperinterval::ieee::Format>::power>
   12468:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1246c:	0f 84 5a fe ff ff    	je     122cc <hyperinterval_strict_surface64+0x1fc>
   12472:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12477:	45 89 e8             	mov    %r13d,%r8d
   1247a:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1247f:	48 89 e7             	mov    %rsp,%rdi
   12482:	4c 89 f6             	mov    %r14,%rsi
   12485:	4c 89 e2             	mov    %r12,%rdx
   12488:	48 89 e9             	mov    %rbp,%rcx
   1248b:	e8 d0 7a 00 00       	call   19f60 <<hyperinterval::ieee::Format>::power>
   12490:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12494:	0f 84 32 fe ff ff    	je     122cc <hyperinterval_strict_surface64+0x1fc>
   1249a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1249f:	48 89 84 24 60 01 00 	mov    %rax,0x160(%rsp)
   124a6:	00 
   124a7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   124ac:	48 89 84 24 58 01 00 	mov    %rax,0x158(%rsp)
   124b3:	00 
   124b4:	48 89 e7             	mov    %rsp,%rdi
   124b7:	4c 89 f6             	mov    %r14,%rsi
   124ba:	4c 89 e2             	mov    %r12,%rdx
   124bd:	4c 89 f9             	mov    %r15,%rcx
   124c0:	e8 db 6b 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   124c5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   124c9:	74 2e                	je     124f9 <hyperinterval_strict_surface64+0x429>
   124cb:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   124d0:	48 89 e7             	mov    %rsp,%rdi
   124d3:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   124da:	00 00 80 
   124dd:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   124e4:	00 f0 7f 
   124e7:	4c 89 e9             	mov    %r13,%rcx
   124ea:	e8 b1 6b 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   124ef:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   124f3:	0f 85 9a 03 00 00    	jne    12893 <hyperinterval_strict_surface64+0x7c3>
   124f9:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   124fe:	88 4c 24 78          	mov    %cl,0x78(%rsp)
   12502:	48 c7 44 24 70 02 00 	movq   $0x2,0x70(%rsp)
   12509:	00 00 
   1250b:	e9 71 fe ff ff       	jmp    12381 <hyperinterval_strict_surface64+0x2b1>
   12510:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
   12515:	31 c9                	xor    %ecx,%ecx
   12517:	89 94 24 01 01 00 00 	mov    %edx,0x101(%rsp)
   1251e:	48 89 d6             	mov    %rdx,%rsi
   12521:	48 c1 ee 30          	shr    $0x30,%rsi
   12525:	40 88 b4 24 07 01 00 	mov    %sil,0x107(%rsp)
   1252c:	00 
   1252d:	48 c1 ea 20          	shr    $0x20,%rdx
   12531:	66 89 94 24 05 01 00 	mov    %dx,0x105(%rsp)
   12538:	00 
   12539:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
   12540:	00 
   12541:	48 89 8c 24 f8 00 00 	mov    %rcx,0xf8(%rsp)
   12548:	00 
   12549:	44 88 ac 24 00 01 00 	mov    %r13b,0x100(%rsp)
   12550:	00 
   12551:	48 8d ac 24 70 01 00 	lea    0x170(%rsp),%rbp
   12558:	00 
   12559:	48 8d b4 24 f8 00 00 	lea    0xf8(%rsp),%rsi
   12560:	00 
   12561:	4c 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%r13
   12568:	00 
   12569:	48 89 ef             	mov    %rbp,%rdi
   1256c:	4c 89 ea             	mov    %r13,%rdx
   1256f:	e8 5c 99 00 00       	call   1bed0 <<hyperinterval::float::F64Enclosure>::intersection>
   12574:	4c 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%r15
   1257b:	00 
   1257c:	48 8d 94 24 c8 00 00 	lea    0xc8(%rsp),%rdx
   12583:	00 
   12584:	4c 89 ff             	mov    %r15,%rdi
   12587:	48 89 ee             	mov    %rbp,%rsi
   1258a:	e8 11 97 00 00       	call   1bca0 <<hyperinterval::float::F64Enclosure>::hull>
   1258f:	48 89 e7             	mov    %rsp,%rdi
   12592:	4c 89 fe             	mov    %r15,%rsi
   12595:	e8 96 e8 ff ff       	call   10e30 <<hyperinterval::float::F64Enclosure>::abs>
   1259a:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1259f:	4c 89 fe             	mov    %r15,%rsi
   125a2:	4c 89 ea             	mov    %r13,%rdx
   125a5:	e8 46 9f 00 00       	call   1c4f0 <<hyperinterval::float::F64Enclosure>::min_image>
   125aa:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   125af:	4c 89 fe             	mov    %r15,%rsi
   125b2:	4c 89 ea             	mov    %r13,%rdx
   125b5:	e8 76 9e 00 00       	call   1c430 <<hyperinterval::float::F64Enclosure>::max_image>
   125ba:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   125bf:	48 89 84 24 50 01 00 	mov    %rax,0x150(%rsp)
   125c6:	00 
   125c7:	0f 10 04 24          	movups (%rsp),%xmm0
   125cb:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
   125d0:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
   125d5:	0f 10 5c 24 30       	movups 0x30(%rsp),%xmm3
   125da:	0f 29 9c 24 40 01 00 	movaps %xmm3,0x140(%rsp)
   125e1:	00 
   125e2:	0f 29 94 24 30 01 00 	movaps %xmm2,0x130(%rsp)
   125e9:	00 
   125ea:	0f 29 8c 24 20 01 00 	movaps %xmm1,0x120(%rsp)
   125f1:	00 
   125f2:	0f 29 84 24 10 01 00 	movaps %xmm0,0x110(%rsp)
   125f9:	00 
   125fa:	48 8d 84 24 10 01 00 	lea    0x110(%rsp),%rax
   12601:	00 
   12602:	4c 89 ff             	mov    %r15,%rdi
   12605:	e8 76 97 00 00       	call   1bd80 <<hyperinterval::float::F64Enclosure>::signs>
   1260a:	48 8b 8c 24 e0 00 00 	mov    0xe0(%rsp),%rcx
   12611:	00 
   12612:	48 83 f9 01          	cmp    $0x1,%rcx
   12616:	75 27                	jne    1263f <hyperinterval_strict_surface64+0x56f>
   12618:	48 8b b4 24 e8 00 00 	mov    0xe8(%rsp),%rsi
   1261f:	00 
   12620:	48 8b bc 24 f0 00 00 	mov    0xf0(%rsp),%rdi
   12627:	00 
   12628:	48 39 fe             	cmp    %rdi,%rsi
   1262b:	0f 94 c2             	sete   %dl
   1262e:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   12633:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   12638:	be 01 00 00 00       	mov    $0x1,%esi
   1263d:	eb 04                	jmp    12643 <hyperinterval_strict_surface64+0x573>
   1263f:	31 d2                	xor    %edx,%edx
   12641:	31 f6                	xor    %esi,%esi
   12643:	80 f1 01             	xor    $0x1,%cl
   12646:	48 89 34 24          	mov    %rsi,(%rsp)
   1264a:	66 0f d6 4c 24 08    	movq   %xmm1,0x8(%rsp)
   12650:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   12654:	88 54 24 11          	mov    %dl,0x11(%rsp)
   12658:	88 44 24 12          	mov    %al,0x12(%rsp)
   1265c:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   12661:	66 0f d6 44 24 20    	movq   %xmm0,0x20(%rsp)
   12667:	48 89 e0             	mov    %rsp,%rax
   1266a:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
   12671:	00 
   12672:	f3 0f 7e 84 24 68 01 	movq   0x168(%rsp),%xmm0
   12679:	00 00 
   1267b:	e8 40 99 00 00       	call   1bfc0 <<hyperinterval::float::F64Enclosure>::contains_point>
   12680:	89 d5                	mov    %edx,%ebp
   12682:	a8 01                	test   $0x1,%al
   12684:	74 09                	je     1268f <hyperinterval_strict_surface64+0x5bf>
   12686:	40 88 6b 08          	mov    %bpl,0x8(%rbx)
   1268a:	e9 cb fa ff ff       	jmp    1215a <hyperinterval_strict_surface64+0x8a>
   1268f:	4c 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%r14
   12696:	00 
   12697:	4c 8d ac 24 c8 00 00 	lea    0xc8(%rsp),%r13
   1269e:	00 
   1269f:	4c 89 f7             	mov    %r14,%rdi
   126a2:	4c 89 ee             	mov    %r13,%rsi
   126a5:	e8 e6 9c 00 00       	call   1c390 <<hyperinterval::float::F64Enclosure>::overlaps>
   126aa:	88 44 24 48          	mov    %al,0x48(%rsp)
   126ae:	4c 89 f7             	mov    %r14,%rdi
   126b1:	4c 89 ee             	mov    %r13,%rsi
   126b4:	e8 37 9c 00 00       	call   1c2f0 <<hyperinterval::float::F64Enclosure>::disjoint>
   126b9:	41 89 c5             	mov    %eax,%r13d
   126bc:	4c 8d a4 24 b0 00 00 	lea    0xb0(%rsp),%r12
   126c3:	00 
   126c4:	4c 89 f7             	mov    %r14,%rdi
   126c7:	4c 89 e6             	mov    %r12,%rsi
   126ca:	e8 b1 99 00 00       	call   1c080 <<hyperinterval::float::F64Enclosure>::interior_subset_of>
   126cf:	41 89 c7             	mov    %eax,%r15d
   126d2:	4c 89 f7             	mov    %r14,%rdi
   126d5:	4c 89 e6             	mov    %r12,%rsi
   126d8:	e8 d3 9e 00 00       	call   1c5b0 <<hyperinterval::float::F64Enclosure>::subset_of>
   126dd:	88 04 24             	mov    %al,(%rsp)
   126e0:	44 88 7c 24 01       	mov    %r15b,0x1(%rsp)
   126e5:	44 88 6c 24 02       	mov    %r13b,0x2(%rsp)
   126ea:	0f b6 44 24 48       	movzbl 0x48(%rsp),%eax
   126ef:	88 44 24 03          	mov    %al,0x3(%rsp)
   126f3:	40 88 6c 24 04       	mov    %bpl,0x4(%rsp)
   126f8:	48 89 e0             	mov    %rsp,%rax
   126fb:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
   12700:	48 89 f1             	mov    %rsi,%rcx
   12703:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1270a:	00 00 80 
   1270d:	48 31 f9             	xor    %rdi,%rcx
   12710:	48 85 f6             	test   %rsi,%rsi
   12713:	48 0f 44 ce          	cmove  %rsi,%rcx
   12717:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
   1271e:	00 
   1271f:	48 89 f2             	mov    %rsi,%rdx
   12722:	49 89 fe             	mov    %rdi,%r14
   12725:	48 31 fa             	xor    %rdi,%rdx
   12728:	48 85 f6             	test   %rsi,%rsi
   1272b:	48 0f 44 d6          	cmove  %rsi,%rdx
   1272f:	48 c7 84 24 10 01 00 	movq   $0x1,0x110(%rsp)
   12736:	00 01 00 00 00 
   1273b:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
   12742:	00 
   12743:	48 89 94 24 20 01 00 	mov    %rdx,0x120(%rsp)
   1274a:	00 
   1274b:	48 89 e7             	mov    %rsp,%rdi
   1274e:	48 8d 94 24 10 01 00 	lea    0x110(%rsp),%rdx
   12755:	00 
   12756:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
   1275d:	00 
   1275e:	e8 2d 9b 00 00       	call   1c290 <<hyperinterval::float::F64Enclosure>::sub>
   12763:	48 8b 0c 24          	mov    (%rsp),%rcx
   12767:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1276c:	48 83 f9 02          	cmp    $0x2,%rcx
   12770:	0f 84 e1 f9 ff ff    	je     12157 <hyperinterval_strict_surface64+0x87>
   12776:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1277b:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12780:	48 89 74 24 68       	mov    %rsi,0x68(%rsp)
   12785:	48 89 54 24 61       	mov    %rdx,0x61(%rsp)
   1278a:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1278f:	88 44 24 60          	mov    %al,0x60(%rsp)
   12793:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
   1279a:	00 
   1279b:	48 b9 00 00 00 00 00 	movabs $0x4000000000000000,%rcx
   127a2:	00 00 40 
   127a5:	4c 89 f6             	mov    %r14,%rsi
   127a8:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   127af:	00 f0 7f 
   127b2:	e8 e9 68 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   127b7:	80 bc 24 90 00 00 00 	cmpb   $0x1,0x90(%rsp)
   127be:	01 
   127bf:	0f 85 9d 01 00 00    	jne    12962 <hyperinterval_strict_surface64+0x892>
   127c5:	0f b6 84 24 91 00 00 	movzbl 0x91(%rsp),%eax
   127cc:	00 
   127cd:	e9 85 f9 ff ff       	jmp    12157 <hyperinterval_strict_surface64+0x87>
   127d2:	4c 89 e9             	mov    %r13,%rcx
   127d5:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   127dc:	00 00 80 
   127df:	48 31 f1             	xor    %rsi,%rcx
   127e2:	4d 85 ed             	test   %r13,%r13
   127e5:	49 0f 44 cd          	cmove  %r13,%rcx
   127e9:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   127ee:	48 89 e7             	mov    %rsp,%rdi
   127f1:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   127f8:	00 f0 7f 
   127fb:	e8 a0 68 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12800:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12804:	0f 84 c2 fa ff ff    	je     122cc <hyperinterval_strict_surface64+0x1fc>
   1280a:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1280f:	48 89 e7             	mov    %rsp,%rdi
   12812:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12819:	00 00 80 
   1281c:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   12823:	00 f0 7f 
   12826:	4c 89 f9             	mov    %r15,%rcx
   12829:	e8 72 68 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1282e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12832:	0f 84 94 fa ff ff    	je     122cc <hyperinterval_strict_surface64+0x1fc>
   12838:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1283d:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   12844:	00 00 80 
   12847:	4a 8d 0c 2f          	lea    (%rdi,%r13,1),%rcx
   1284b:	4c 89 ea             	mov    %r13,%rdx
   1284e:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   12853:	4c 21 c2             	and    %r8,%rdx
   12856:	48 89 fe             	mov    %rdi,%rsi
   12859:	48 29 d6             	sub    %rdx,%rsi
   1285c:	4d 85 ed             	test   %r13,%r13
   1285f:	48 0f 49 f1          	cmovns %rcx,%rsi
   12863:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   12867:	49 21 c0             	and    %rax,%r8
   1286a:	48 89 fa             	mov    %rdi,%rdx
   1286d:	4c 29 c2             	sub    %r8,%rdx
   12870:	48 85 c0             	test   %rax,%rax
   12873:	48 0f 49 d1          	cmovns %rcx,%rdx
   12877:	b1 01                	mov    $0x1,%cl
   12879:	48 39 d6             	cmp    %rdx,%rsi
   1287c:	0f 87 4f fa ff ff    	ja     122d1 <hyperinterval_strict_surface64+0x201>
   12882:	4c 89 ea             	mov    %r13,%rdx
   12885:	48 c1 ea 08          	shr    $0x8,%rdx
   12889:	b9 01 00 00 00       	mov    $0x1,%ecx
   1288e:	e9 84 fc ff ff       	jmp    12517 <hyperinterval_strict_surface64+0x447>
   12893:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12898:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1289f:	00 00 80 
   128a2:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   128a6:	4c 89 fa             	mov    %r15,%rdx
   128a9:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   128ae:	4c 21 c2             	and    %r8,%rdx
   128b1:	48 89 fe             	mov    %rdi,%rsi
   128b4:	48 29 d6             	sub    %rdx,%rsi
   128b7:	4d 85 ff             	test   %r15,%r15
   128ba:	48 0f 49 f1          	cmovns %rcx,%rsi
   128be:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   128c2:	48 89 c2             	mov    %rax,%rdx
   128c5:	4c 21 c2             	and    %r8,%rdx
   128c8:	48 29 d7             	sub    %rdx,%rdi
   128cb:	48 85 c0             	test   %rax,%rax
   128ce:	48 0f 49 f9          	cmovns %rcx,%rdi
   128d2:	b1 01                	mov    $0x1,%cl
   128d4:	48 39 fe             	cmp    %rdi,%rsi
   128d7:	0f 87 21 fc ff ff    	ja     124fe <hyperinterval_strict_surface64+0x42e>
   128dd:	48 c7 84 24 10 01 00 	movq   $0x1,0x110(%rsp)
   128e4:	00 01 00 00 00 
   128e9:	4c 89 bc 24 18 01 00 	mov    %r15,0x118(%rsp)
   128f0:	00 
   128f1:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
   128f8:	00 
   128f9:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
   128fe:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12905:	00 00 80 
   12908:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1290f:	00 f0 7f 
   12912:	48 8b 8c 24 60 01 00 	mov    0x160(%rsp),%rcx
   12919:	00 
   1291a:	e8 81 67 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1291f:	80 7c 24 58 01       	cmpb   $0x1,0x58(%rsp)
   12924:	74 32                	je     12958 <hyperinterval_strict_surface64+0x888>
   12926:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
   1292b:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
   12930:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12937:	00 00 80 
   1293a:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   12941:	00 f0 7f 
   12944:	48 8b 8c 24 58 01 00 	mov    0x158(%rsp),%rcx
   1294b:	00 
   1294c:	e8 4f 67 00 00       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   12951:	80 7c 24 58 01       	cmpb   $0x1,0x58(%rsp)
   12956:	75 5a                	jne    129b2 <hyperinterval_strict_surface64+0x8e2>
   12958:	0f b6 4c 24 59       	movzbl 0x59(%rsp),%ecx
   1295d:	e9 9c fb ff ff       	jmp    124fe <hyperinterval_strict_surface64+0x42e>
   12962:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
   12969:	00 
   1296a:	48 89 c1             	mov    %rax,%rcx
   1296d:	48 c1 e9 08          	shr    $0x8,%rcx
   12971:	48 89 c2             	mov    %rax,%rdx
   12974:	48 c1 ea 38          	shr    $0x38,%rdx
   12978:	88 54 24 0f          	mov    %dl,0xf(%rsp)
   1297c:	48 89 c2             	mov    %rax,%rdx
   1297f:	48 c1 ea 28          	shr    $0x28,%rdx
   12983:	66 89 54 24 0d       	mov    %dx,0xd(%rsp)
   12988:	89 4c 24 09          	mov    %ecx,0x9(%rsp)
   1298c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   12991:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   12998:	00 
   12999:	88 44 24 08          	mov    %al,0x8(%rsp)
   1299d:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
   129a2:	48 89 e2             	mov    %rsp,%rdx
   129a5:	48 89 df             	mov    %rbx,%rdi
   129a8:	e8 a3 98 00 00       	call   1c250 <<hyperinterval::float::F64Enclosure>::div>
   129ad:	e9 af f7 ff ff       	jmp    12161 <hyperinterval_strict_surface64+0x91>
   129b2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   129b7:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   129be:	00 00 80 
   129c1:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   129c5:	4c 89 fa             	mov    %r15,%rdx
   129c8:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   129cd:	4c 21 c2             	and    %r8,%rdx
   129d0:	48 89 fe             	mov    %rdi,%rsi
   129d3:	48 29 d6             	sub    %rdx,%rsi
   129d6:	4d 85 ff             	test   %r15,%r15
   129d9:	48 0f 49 f1          	cmovns %rcx,%rsi
   129dd:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   129e1:	48 89 c2             	mov    %rax,%rdx
   129e4:	4c 21 c2             	and    %r8,%rdx
   129e7:	48 29 d7             	sub    %rdx,%rdi
   129ea:	48 85 c0             	test   %rax,%rax
   129ed:	48 0f 49 f9          	cmovns %rcx,%rdi
   129f1:	b1 01                	mov    $0x1,%cl
   129f3:	48 39 fe             	cmp    %rdi,%rsi
   129f6:	0f 87 02 fb ff ff    	ja     124fe <hyperinterval_strict_surface64+0x42e>
   129fc:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   12a03:	00 
   12a04:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
   12a09:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   12a0e:	48 8d bc 24 90 00 00 	lea    0x90(%rsp),%rdi
   12a15:	00 
   12a16:	48 8d b4 24 10 01 00 	lea    0x110(%rsp),%rsi
   12a1d:	00 
   12a1e:	48 89 e2             	mov    %rsp,%rdx
   12a21:	e8 7a 92 00 00       	call   1bca0 <<hyperinterval::float::F64Enclosure>::hull>
   12a26:	8b 4c 24 50          	mov    0x50(%rsp),%ecx
   12a2a:	85 c9                	test   %ecx,%ecx
   12a2c:	0f 95 c0             	setne  %al
   12a2f:	f6 c1 01             	test   $0x1,%cl
   12a32:	0f 94 c1             	sete   %cl
   12a35:	84 c8                	test   %cl,%al
   12a37:	0f 84 98 00 00 00    	je     12ad5 <hyperinterval_strict_surface64+0xa05>
   12a3d:	48 8d bc 24 c8 00 00 	lea    0xc8(%rsp),%rdi
   12a44:	00 
   12a45:	e8 36 93 00 00       	call   1bd80 <<hyperinterval::float::F64Enclosure>::signs>
   12a4a:	a8 02                	test   $0x2,%al
   12a4c:	0f 84 83 00 00 00    	je     12ad5 <hyperinterval_strict_surface64+0xa05>
   12a52:	48 89 e7             	mov    %rsp,%rdi
   12a55:	31 f6                	xor    %esi,%esi
   12a57:	31 d2                	xor    %edx,%edx
   12a59:	e8 a2 93 00 00       	call   1be00 <<hyperinterval::float::F64Enclosure>::from_bits>
   12a5e:	48 8b 0c 24          	mov    (%rsp),%rcx
   12a62:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   12a67:	48 83 f9 02          	cmp    $0x2,%rcx
   12a6b:	75 09                	jne    12a76 <hyperinterval_strict_surface64+0x9a6>
   12a6d:	88 44 24 78          	mov    %al,0x78(%rsp)
   12a71:	e9 8c fa ff ff       	jmp    12502 <hyperinterval_strict_surface64+0x432>
   12a76:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   12a7b:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12a80:	48 89 b4 24 20 01 00 	mov    %rsi,0x120(%rsp)
   12a87:	00 
   12a88:	48 89 94 24 19 01 00 	mov    %rdx,0x119(%rsp)
   12a8f:	00 
   12a90:	48 89 8c 24 10 01 00 	mov    %rcx,0x110(%rsp)
   12a97:	00 
   12a98:	88 84 24 18 01 00 00 	mov    %al,0x118(%rsp)
   12a9f:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
   12aa4:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
   12aab:	00 
   12aac:	48 8d 94 24 10 01 00 	lea    0x110(%rsp),%rdx
   12ab3:	00 
   12ab4:	e8 e7 91 00 00       	call   1bca0 <<hyperinterval::float::F64Enclosure>::hull>
   12ab9:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
   12abe:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   12ac5:	00 
   12ac6:	f3 0f 6f 44 24 58    	movdqu 0x58(%rsp),%xmm0
   12acc:	66 0f 7f 84 24 90 00 	movdqa %xmm0,0x90(%rsp)
   12ad3:	00 00 
   12ad5:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
   12adc:	00 
   12add:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   12ae4:	00 
   12ae5:	66 0f 6f 84 24 90 00 	movdqa 0x90(%rsp),%xmm0
   12aec:	00 00 
   12aee:	66 0f 7f 44 24 70    	movdqa %xmm0,0x70(%rsp)
   12af4:	e9 88 f8 ff ff       	jmp    12381 <hyperinterval_strict_surface64+0x2b1>
   12af9:	cc                   	int3
   12afa:	cc                   	int3
   12afb:	cc                   	int3
   12afc:	cc                   	int3
   12afd:	cc                   	int3
   12afe:	cc                   	int3
   12aff:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   190a0:	48 89 c8             	mov    %rcx,%rax
   190a3:	48 f7 d0             	not    %rax
   190a6:	48 85 d0             	test   %rdx,%rax
   190a9:	75 09                	jne    190b4 <<hyperinterval::ieee::Format>::finite+0x14>
   190ab:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   190af:	b0 01                	mov    $0x1,%al
   190b1:	88 07                	mov    %al,(%rdi)
   190b3:	c3                   	ret
   190b4:	48 ff ce             	dec    %rsi
   190b7:	48 85 f1             	test   %rsi,%rcx
   190ba:	74 09                	je     190c5 <<hyperinterval::ieee::Format>::finite+0x25>
   190bc:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   190c0:	31 c0                	xor    %eax,%eax
   190c2:	88 07                	mov    %al,(%rdi)
   190c4:	c3                   	ret
   190c5:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   190cc:	00 
   190cd:	31 c0                	xor    %eax,%eax
   190cf:	88 07                	mov    %al,(%rdi)
   190d1:	c3                   	ret
   190d2:	cc                   	int3
   190d3:	cc                   	int3
   190d4:	cc                   	int3
   190d5:	cc                   	int3
   190d6:	cc                   	int3
   190d7:	cc                   	int3
   190d8:	cc                   	int3
   190d9:	cc                   	int3
   190da:	cc                   	int3
   190db:	cc                   	int3
   190dc:	cc                   	int3
   190dd:	cc                   	int3
   190de:	cc                   	int3
   190df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   190e0:	55                   	push   %rbp
   190e1:	41 57                	push   %r15
   190e3:	41 56                	push   %r14
   190e5:	41 55                	push   %r13
   190e7:	41 54                	push   %r12
   190e9:	53                   	push   %rbx
   190ea:	48 83 ec 38          	sub    $0x38,%rsp
   190ee:	48 89 fb             	mov    %rdi,%rbx
   190f1:	f6 06 01             	testb  $0x1,(%rsi)
   190f4:	0f 84 95 00 00 00    	je     1918f <<hyperinterval::float::F32Enclosure>::corner_image+0xaf>
   190fa:	f6 02 01             	testb  $0x1,(%rdx)
   190fd:	0f 84 8c 00 00 00    	je     1918f <<hyperinterval::float::F32Enclosure>::corner_image+0xaf>
   19103:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   19107:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   1910b:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   1910f:	8b 46 08             	mov    0x8(%rsi),%eax
   19112:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19117:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1911c:	be 00 00 00 80       	mov    $0x80000000,%esi
   19121:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19126:	4c 89 e9             	mov    %r13,%rcx
   19129:	4d 89 e0             	mov    %r12,%r8
   1912c:	e8 df 06 00 00       	call   19810 <<hyperinterval::ieee::Format>::div>
   19131:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19136:	75 46                	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19138:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1913c:	8b 6c 24 18          	mov    0x18(%rsp),%ebp
   19140:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19145:	be 00 00 00 80       	mov    $0x80000000,%esi
   1914a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1914f:	e8 4c ff ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19154:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19159:	75 23                	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   1915b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19160:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19165:	be 00 00 00 80       	mov    $0x80000000,%esi
   1916a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1916f:	48 89 e9             	mov    %rbp,%rcx
   19172:	e8 29 ff ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19177:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1917c:	74 26                	je     191a4 <<hyperinterval::float::F32Enclosure>::corner_image+0xc4>
   1917e:	0f b6 6c 24 09       	movzbl 0x9(%rsp),%ebp
   19183:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   19187:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1918d:	eb 06                	jmp    19195 <<hyperinterval::float::F32Enclosure>::corner_image+0xb5>
   1918f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19195:	48 83 c4 38          	add    $0x38,%rsp
   19199:	5b                   	pop    %rbx
   1919a:	41 5c                	pop    %r12
   1919c:	41 5d                	pop    %r13
   1919e:	41 5e                	pop    %r14
   191a0:	41 5f                	pop    %r15
   191a2:	5d                   	pop    %rbp
   191a3:	c3                   	ret
   191a4:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   191a9:	44 89 f8             	mov    %r15d,%eax
   191ac:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   191b1:	89 f9                	mov    %edi,%ecx
   191b3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   191b9:	ba 00 00 00 80       	mov    $0x80000000,%edx
   191be:	29 c2                	sub    %eax,%edx
   191c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   191c5:	09 f0                	or     %esi,%eax
   191c7:	45 85 ff             	test   %r15d,%r15d
   191ca:	48 0f 49 d0          	cmovns %rax,%rdx
   191ce:	b8 00 00 00 80       	mov    $0x80000000,%eax
   191d3:	29 c8                	sub    %ecx,%eax
   191d5:	09 f1                	or     %esi,%ecx
   191d7:	85 ff                	test   %edi,%edi
   191d9:	48 0f 49 c1          	cmovns %rcx,%rax
   191dd:	40 b5 01             	mov    $0x1,%bpl
   191e0:	39 c2                	cmp    %eax,%edx
   191e2:	77 9f                	ja     19183 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   191e4:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   191e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   191ee:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191f3:	4c 89 e9             	mov    %r13,%rcx
   191f6:	4d 89 f0             	mov    %r14,%r8
   191f9:	e8 12 06 00 00       	call   19810 <<hyperinterval::ieee::Format>::div>
   191fe:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19203:	0f 85 75 ff ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19209:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1920d:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   19212:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19217:	be 00 00 00 80       	mov    $0x80000000,%esi
   1921c:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19221:	e8 7a fe ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19226:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1922b:	0f 84 4d ff ff ff    	je     1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19231:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19236:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   1923b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19240:	be 00 00 00 80       	mov    $0x80000000,%esi
   19245:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1924a:	4c 89 e9             	mov    %r13,%rcx
   1924d:	e8 4e fe ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19252:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19257:	0f 84 21 ff ff ff    	je     1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   1925d:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   19262:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
   19267:	44 89 c1             	mov    %r8d,%ecx
   1926a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19270:	44 89 e8             	mov    %r13d,%eax
   19273:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19278:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1927d:	48 29 ca             	sub    %rcx,%rdx
   19280:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19285:	48 09 f9             	or     %rdi,%rcx
   19288:	45 85 c0             	test   %r8d,%r8d
   1928b:	48 0f 48 ca          	cmovs  %rdx,%rcx
   1928f:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19294:	48 29 c2             	sub    %rax,%rdx
   19297:	48 09 f8             	or     %rdi,%rax
   1929a:	45 85 ed             	test   %r13d,%r13d
   1929d:	48 0f 48 c2          	cmovs  %rdx,%rax
   192a1:	48 39 c1             	cmp    %rax,%rcx
   192a4:	0f 87 d9 fe ff ff    	ja     19183 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   192aa:	44 89 fa             	mov    %r15d,%edx
   192ad:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   192b3:	be 00 00 00 80       	mov    $0x80000000,%esi
   192b8:	29 d6                	sub    %edx,%esi
   192ba:	09 fa                	or     %edi,%edx
   192bc:	45 85 ff             	test   %r15d,%r15d
   192bf:	48 0f 49 f2          	cmovns %rdx,%rsi
   192c3:	39 ce                	cmp    %ecx,%esi
   192c5:	45 0f 46 c7          	cmovbe %r15d,%r8d
   192c9:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
   192ce:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   192d3:	89 f1                	mov    %esi,%ecx
   192d5:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   192db:	ba 00 00 00 80       	mov    $0x80000000,%edx
   192e0:	29 ca                	sub    %ecx,%edx
   192e2:	09 f9                	or     %edi,%ecx
   192e4:	85 f6                	test   %esi,%esi
   192e6:	48 0f 49 d1          	cmovns %rcx,%rdx
   192ea:	39 c2                	cmp    %eax,%edx
   192ec:	44 0f 43 ee          	cmovae %esi,%r13d
   192f0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   192f5:	be 00 00 00 80       	mov    $0x80000000,%esi
   192fa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   192ff:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   19304:	4d 89 e0             	mov    %r12,%r8
   19307:	e8 04 05 00 00       	call   19810 <<hyperinterval::ieee::Format>::div>
   1930c:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19311:	0f 85 67 fe ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19317:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   1931b:	44 8b 64 24 18       	mov    0x18(%rsp),%r12d
   19320:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19325:	be 00 00 00 80       	mov    $0x80000000,%esi
   1932a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1932f:	e8 6c fd ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19334:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19339:	0f 85 3f fe ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   1933f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   19344:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19349:	be 00 00 00 80       	mov    $0x80000000,%esi
   1934e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19353:	4c 89 e1             	mov    %r12,%rcx
   19356:	e8 45 fd ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1935b:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19360:	0f 85 18 fe ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19366:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1936b:	44 89 f9             	mov    %r15d,%ecx
   1936e:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19374:	44 89 e0             	mov    %r12d,%eax
   19377:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1937c:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19381:	48 29 ca             	sub    %rcx,%rdx
   19384:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1938a:	4c 09 c1             	or     %r8,%rcx
   1938d:	45 85 ff             	test   %r15d,%r15d
   19390:	48 0f 48 ca          	cmovs  %rdx,%rcx
   19394:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19399:	48 29 c2             	sub    %rax,%rdx
   1939c:	4c 09 c0             	or     %r8,%rax
   1939f:	45 85 e4             	test   %r12d,%r12d
   193a2:	48 0f 48 c2          	cmovs  %rdx,%rax
   193a6:	48 39 c1             	cmp    %rax,%rcx
   193a9:	0f 87 d4 fd ff ff    	ja     19183 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   193af:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
   193b4:	44 89 ca             	mov    %r9d,%edx
   193b7:	44 09 c2             	or     %r8d,%edx
   193ba:	44 89 ce             	mov    %r9d,%esi
   193bd:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   193c3:	bf 00 00 00 80       	mov    $0x80000000,%edi
   193c8:	29 f7                	sub    %esi,%edi
   193ca:	45 85 c9             	test   %r9d,%r9d
   193cd:	48 0f 49 fa          	cmovns %rdx,%rdi
   193d1:	39 cf                	cmp    %ecx,%edi
   193d3:	45 0f 46 f9          	cmovbe %r9d,%r15d
   193d7:	44 89 e9             	mov    %r13d,%ecx
   193da:	44 09 c1             	or     %r8d,%ecx
   193dd:	44 89 ea             	mov    %r13d,%edx
   193e0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   193e6:	be 00 00 00 80       	mov    $0x80000000,%esi
   193eb:	29 d6                	sub    %edx,%esi
   193ed:	45 85 ed             	test   %r13d,%r13d
   193f0:	48 0f 49 f1          	cmovns %rcx,%rsi
   193f4:	39 c6                	cmp    %eax,%esi
   193f6:	45 0f 43 e5          	cmovae %r13d,%r12d
   193fa:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   193ff:	be 00 00 00 80       	mov    $0x80000000,%esi
   19404:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19409:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1940e:	4d 89 f0             	mov    %r14,%r8
   19411:	e8 fa 03 00 00       	call   19810 <<hyperinterval::ieee::Format>::div>
   19416:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1941b:	0f 85 5d fd ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19421:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   19425:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   1942a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1942f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19434:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19439:	e8 62 fc ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1943e:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19443:	0f 85 35 fd ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19449:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1944e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19453:	be 00 00 00 80       	mov    $0x80000000,%esi
   19458:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1945d:	4c 89 f1             	mov    %r14,%rcx
   19460:	e8 3b fc ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19465:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1946a:	0f 85 0e fd ff ff    	jne    1917e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19470:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19475:	44 89 ea             	mov    %r13d,%edx
   19478:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1947e:	89 c1                	mov    %eax,%ecx
   19480:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19486:	be 00 00 00 80       	mov    $0x80000000,%esi
   1948b:	48 29 d6             	sub    %rdx,%rsi
   1948e:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19493:	48 09 fa             	or     %rdi,%rdx
   19496:	45 85 ed             	test   %r13d,%r13d
   19499:	48 0f 48 d6          	cmovs  %rsi,%rdx
   1949d:	be 00 00 00 80       	mov    $0x80000000,%esi
   194a2:	48 29 ce             	sub    %rcx,%rsi
   194a5:	48 09 f9             	or     %rdi,%rcx
   194a8:	85 c0                	test   %eax,%eax
   194aa:	48 0f 48 ce          	cmovs  %rsi,%rcx
   194ae:	48 39 ca             	cmp    %rcx,%rdx
   194b1:	0f 87 cc fc ff ff    	ja     19183 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   194b7:	44 89 fe             	mov    %r15d,%esi
   194ba:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   194c0:	44 09 ce             	or     %r9d,%esi
   194c3:	44 89 ff             	mov    %r15d,%edi
   194c6:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   194cc:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   194d2:	41 29 f8             	sub    %edi,%r8d
   194d5:	45 85 ff             	test   %r15d,%r15d
   194d8:	4c 0f 49 c6          	cmovns %rsi,%r8
   194dc:	41 39 d0             	cmp    %edx,%r8d
   194df:	45 0f 46 ef          	cmovbe %r15d,%r13d
   194e3:	44 89 e2             	mov    %r12d,%edx
   194e6:	44 09 ca             	or     %r9d,%edx
   194e9:	44 89 e6             	mov    %r12d,%esi
   194ec:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   194f2:	41 29 f1             	sub    %esi,%r9d
   194f5:	45 85 e4             	test   %r12d,%r12d
   194f8:	4c 0f 49 ca          	cmovns %rdx,%r9
   194fc:	41 39 c9             	cmp    %ecx,%r9d
   194ff:	41 0f 43 c4          	cmovae %r12d,%eax
   19503:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19509:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   1950d:	89 43 08             	mov    %eax,0x8(%rbx)
   19510:	e9 80 fc ff ff       	jmp    19195 <<hyperinterval::float::F32Enclosure>::corner_image+0xb5>
   19515:	cc                   	int3
   19516:	cc                   	int3
   19517:	cc                   	int3
   19518:	cc                   	int3
   19519:	cc                   	int3
   1951a:	cc                   	int3
   1951b:	cc                   	int3
   1951c:	cc                   	int3
   1951d:	cc                   	int3
   1951e:	cc                   	int3
   1951f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   19520:	48 89 c8             	mov    %rcx,%rax
   19523:	4c 8b 11             	mov    (%rcx),%r10
   19526:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1952a:	4c 89 d1             	mov    %r10,%rcx
   1952d:	4c 09 d9             	or     %r11,%rcx
   19530:	0f 84 dd 00 00 00    	je     19613 <<hyperinterval::ieee::Format>::rounded+0xf3>
   19536:	55                   	push   %rbp
   19537:	41 57                	push   %r15
   19539:	41 56                	push   %r14
   1953b:	41 55                	push   %r13
   1953d:	41 54                	push   %r12
   1953f:	53                   	push   %rbx
   19540:	8b 68 10             	mov    0x10(%rax),%ebp
   19543:	49 0f bd cb          	bsr    %r11,%rcx
   19547:	83 f1 3f             	xor    $0x3f,%ecx
   1954a:	49 0f bd da          	bsr    %r10,%rbx
   1954e:	83 f3 3f             	xor    $0x3f,%ebx
   19551:	83 cb 40             	or     $0x40,%ebx
   19554:	4d 85 db             	test   %r11,%r11
   19557:	0f 45 d9             	cmovne %ecx,%ebx
   1955a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1955f:	44 89 c1             	mov    %r8d,%ecx
   19562:	48 d3 ea             	shr    %cl,%rdx
   19565:	83 f3 7f             	xor    $0x7f,%ebx
   19568:	01 eb                	add    %ebp,%ebx
   1956a:	48 d1 ea             	shr    $1,%rdx
   1956d:	39 d3                	cmp    %edx,%ebx
   1956f:	0f 8f 88 01 00 00    	jg     196fd <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19575:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   19579:	b9 01 00 00 00       	mov    $0x1,%ecx
   1957e:	44 29 c9             	sub    %r9d,%ecx
   19581:	44 29 c3             	sub    %r8d,%ebx
   19584:	39 cb                	cmp    %ecx,%ebx
   19586:	0f 4e d9             	cmovle %ecx,%ebx
   19589:	89 d9                	mov    %ebx,%ecx
   1958b:	29 e9                	sub    %ebp,%ecx
   1958d:	83 f9 7f             	cmp    $0x7f,%ecx
   19590:	0f 8e 88 00 00 00    	jle    1961e <<hyperinterval::ieee::Format>::rounded+0xfe>
   19596:	41 b7 01             	mov    $0x1,%r15b
   19599:	45 31 f6             	xor    %r14d,%r14d
   1959c:	45 31 db             	xor    %r11d,%r11d
   1959f:	45 31 d2             	xor    %r10d,%r10d
   195a2:	45 0f b6 ff          	movzbl %r15b,%r15d
   195a6:	4d 01 f7             	add    %r14,%r15
   195a9:	49 83 d3 00          	adc    $0x0,%r11
   195ad:	4c 89 f9             	mov    %r15,%rcx
   195b0:	4c 09 d9             	or     %r11,%rcx
   195b3:	0f 84 c3 00 00 00    	je     1967c <<hyperinterval::ieee::Format>::rounded+0x15c>
   195b9:	49 0f bd cb          	bsr    %r11,%rcx
   195bd:	83 f1 3f             	xor    $0x3f,%ecx
   195c0:	4d 0f bd f7          	bsr    %r15,%r14
   195c4:	41 83 f6 3f          	xor    $0x3f,%r14d
   195c8:	41 83 ce 40          	or     $0x40,%r14d
   195cc:	4d 85 db             	test   %r11,%r11
   195cf:	44 0f 45 f1          	cmovne %ecx,%r14d
   195d3:	41 83 f6 7f          	xor    $0x7f,%r14d
   195d7:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   195db:	39 d5                	cmp    %edx,%ebp
   195dd:	0f 8f 1a 01 00 00    	jg     196fd <<hyperinterval::ieee::Format>::rounded+0x1dd>
   195e3:	b9 01 00 00 00       	mov    $0x1,%ecx
   195e8:	29 d1                	sub    %edx,%ecx
   195ea:	39 cd                	cmp    %ecx,%ebp
   195ec:	0f 8d 41 01 00 00    	jge    19733 <<hyperinterval::ieee::Format>::rounded+0x213>
   195f2:	41 01 d9             	add    %ebx,%r9d
   195f5:	41 fe c9             	dec    %r9b
   195f8:	44 89 c9             	mov    %r9d,%ecx
   195fb:	49 d3 e7             	shl    %cl,%r15
   195fe:	31 d2                	xor    %edx,%edx
   19600:	41 f6 c1 40          	test   $0x40,%r9b
   19604:	49 0f 44 d7          	cmove  %r15,%rdx
   19608:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1960c:	74 76                	je     19684 <<hyperinterval::ieee::Format>::rounded+0x164>
   1960e:	e9 8e 00 00 00       	jmp    196a1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19613:	c6 07 00             	movb   $0x0,(%rdi)
   19616:	0f 57 c0             	xorps  %xmm0,%xmm0
   19619:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1961d:	c3                   	ret
   1961e:	85 c9                	test   %ecx,%ecx
   19620:	0f 8e 88 00 00 00    	jle    196ae <<hyperinterval::ieee::Format>::rounded+0x18e>
   19626:	4d 89 d6             	mov    %r10,%r14
   19629:	4d 0f ad de          	shrd   %cl,%r11,%r14
   1962d:	4d 89 dc             	mov    %r11,%r12
   19630:	49 d3 ec             	shr    %cl,%r12
   19633:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1963a:	49 d3 e7             	shl    %cl,%r15
   1963d:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   19644:	31 ed                	xor    %ebp,%ebp
   19646:	f6 c1 40             	test   $0x40,%cl
   19649:	4d 0f 45 f4          	cmovne %r12,%r14
   1964d:	4c 0f 45 e5          	cmovne %rbp,%r12
   19651:	4d 0f 45 ef          	cmovne %r15,%r13
   19655:	4c 0f 45 fd          	cmovne %rbp,%r15
   19659:	49 f7 d7             	not    %r15
   1965c:	49 f7 d5             	not    %r13
   1965f:	4d 21 dd             	and    %r11,%r13
   19662:	4d 21 d7             	and    %r10,%r15
   19665:	4d 09 ef             	or     %r13,%r15
   19668:	41 0f 95 c7          	setne  %r15b
   1966c:	4d 89 e3             	mov    %r12,%r11
   1966f:	4c 89 f1             	mov    %r14,%rcx
   19672:	4c 09 d9             	or     %r11,%rcx
   19675:	75 60                	jne    196d7 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   19677:	e9 1d ff ff ff       	jmp    19599 <<hyperinterval::ieee::Format>::rounded+0x79>
   1967c:	31 d2                	xor    %edx,%edx
   1967e:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   19682:	75 1d                	jne    196a1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19684:	48 89 d0             	mov    %rdx,%rax
   19687:	48 31 f0             	xor    %rsi,%rax
   1968a:	48 85 d2             	test   %rdx,%rdx
   1968d:	48 0f 44 c2          	cmove  %rdx,%rax
   19691:	4c 31 d6             	xor    %r10,%rsi
   19694:	4d 85 d2             	test   %r10,%r10
   19697:	49 0f 44 f2          	cmove  %r10,%rsi
   1969b:	49 89 c2             	mov    %rax,%r10
   1969e:	48 89 f2             	mov    %rsi,%rdx
   196a1:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   196a5:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   196a9:	c6 07 00             	movb   $0x0,(%rdi)
   196ac:	eb 54                	jmp    19702 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   196ae:	f6 d9                	neg    %cl
   196b0:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   196b4:	49 d3 e2             	shl    %cl,%r10
   196b7:	45 31 ff             	xor    %r15d,%r15d
   196ba:	f6 c1 40             	test   $0x40,%cl
   196bd:	4d 0f 45 da          	cmovne %r10,%r11
   196c1:	41 be 00 00 00 00    	mov    $0x0,%r14d
   196c7:	4d 0f 44 f2          	cmove  %r10,%r14
   196cb:	4c 89 f1             	mov    %r14,%rcx
   196ce:	4c 09 d9             	or     %r11,%rcx
   196d1:	0f 84 c2 fe ff ff    	je     19599 <<hyperinterval::ieee::Format>::rounded+0x79>
   196d7:	49 0f bd cb          	bsr    %r11,%rcx
   196db:	83 f1 3f             	xor    $0x3f,%ecx
   196de:	4d 0f bd e6          	bsr    %r14,%r12
   196e2:	41 83 f4 3f          	xor    $0x3f,%r12d
   196e6:	41 83 cc 40          	or     $0x40,%r12d
   196ea:	4d 85 db             	test   %r11,%r11
   196ed:	44 0f 45 e1          	cmovne %ecx,%r12d
   196f1:	41 83 f4 7f          	xor    $0x7f,%r12d
   196f5:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   196f9:	39 d5                	cmp    %edx,%ebp
   196fb:	7e 10                	jle    1970d <<hyperinterval::ieee::Format>::rounded+0x1ed>
   196fd:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   19702:	5b                   	pop    %rbx
   19703:	41 5c                	pop    %r12
   19705:	41 5d                	pop    %r13
   19707:	41 5e                	pop    %r14
   19709:	41 5f                	pop    %r15
   1970b:	5d                   	pop    %rbp
   1970c:	c3                   	ret
   1970d:	b9 01 00 00 00       	mov    $0x1,%ecx
   19712:	29 d1                	sub    %edx,%ecx
   19714:	39 cd                	cmp    %ecx,%ebp
   19716:	7d 7d                	jge    19795 <<hyperinterval::ieee::Format>::rounded+0x275>
   19718:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   1971c:	fe c9                	dec    %cl
   1971e:	4d 89 f4             	mov    %r14,%r12
   19721:	49 d3 e4             	shl    %cl,%r12
   19724:	45 31 d2             	xor    %r10d,%r10d
   19727:	f6 c1 40             	test   $0x40,%cl
   1972a:	4d 0f 44 d4          	cmove  %r12,%r10
   1972e:	e9 6f fe ff ff       	jmp    195a2 <<hyperinterval::ieee::Format>::rounded+0x82>
   19733:	44 89 c1             	mov    %r8d,%ecx
   19736:	44 29 f1             	sub    %r14d,%ecx
   19739:	41 89 c9             	mov    %ecx,%r9d
   1973c:	41 f7 d9             	neg    %r9d
   1973f:	4c 89 fb             	mov    %r15,%rbx
   19742:	48 d3 e3             	shl    %cl,%rbx
   19745:	45 31 e4             	xor    %r12d,%r12d
   19748:	f6 c1 40             	test   $0x40,%cl
   1974b:	4c 0f 44 e3          	cmove  %rbx,%r12
   1974f:	44 89 c9             	mov    %r9d,%ecx
   19752:	4d 0f ad df          	shrd   %cl,%r11,%r15
   19756:	49 d3 eb             	shr    %cl,%r11
   19759:	41 f6 c1 40          	test   $0x40,%r9b
   1975d:	4d 0f 44 df          	cmove  %r15,%r11
   19761:	45 39 f0             	cmp    %r14d,%r8d
   19764:	4d 0f 43 dc          	cmovae %r12,%r11
   19768:	01 d5                	add    %edx,%ebp
   1976a:	4c 63 cd             	movslq %ebp,%r9
   1976d:	44 89 c1             	mov    %r8d,%ecx
   19770:	49 d3 e1             	shl    %cl,%r9
   19773:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1977a:	48 d3 e2             	shl    %cl,%rdx
   1977d:	48 f7 d2             	not    %rdx
   19780:	4c 21 da             	and    %r11,%rdx
   19783:	4c 09 ca             	or     %r9,%rdx
   19786:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1978a:	0f 85 11 ff ff ff    	jne    196a1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19790:	e9 ef fe ff ff       	jmp    19684 <<hyperinterval::ieee::Format>::rounded+0x164>
   19795:	44 89 c1             	mov    %r8d,%ecx
   19798:	44 29 e1             	sub    %r12d,%ecx
   1979b:	4d 89 f5             	mov    %r14,%r13
   1979e:	49 d3 e5             	shl    %cl,%r13
   197a1:	41 89 ca             	mov    %ecx,%r10d
   197a4:	41 f7 da             	neg    %r10d
   197a7:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   197ae:	00 00 
   197b0:	f6 c1 40             	test   $0x40,%cl
   197b3:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   197b8:	49 0f 44 cd          	cmove  %r13,%rcx
   197bc:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   197c1:	4d 89 f5             	mov    %r14,%r13
   197c4:	44 89 d1             	mov    %r10d,%ecx
   197c7:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   197cb:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   197d0:	4d 89 dd             	mov    %r11,%r13
   197d3:	49 d3 ed             	shr    %cl,%r13
   197d6:	41 f6 c2 40          	test   $0x40,%r10b
   197da:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   197e0:	45 39 e0             	cmp    %r12d,%r8d
   197e3:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   197e9:	01 d5                	add    %edx,%ebp
   197eb:	4c 63 e5             	movslq %ebp,%r12
   197ee:	44 89 c1             	mov    %r8d,%ecx
   197f1:	49 d3 e4             	shl    %cl,%r12
   197f4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   197fb:	49 d3 e2             	shl    %cl,%r10
   197fe:	49 f7 d2             	not    %r10
   19801:	4d 21 ea             	and    %r13,%r10
   19804:	4d 09 e2             	or     %r12,%r10
   19807:	e9 96 fd ff ff       	jmp    195a2 <<hyperinterval::ieee::Format>::rounded+0x82>
   1980c:	cc                   	int3
   1980d:	cc                   	int3
   1980e:	cc                   	int3
   1980f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   19810:	55                   	push   %rbp
   19811:	41 57                	push   %r15
   19813:	41 56                	push   %r14
   19815:	41 55                	push   %r13
   19817:	41 54                	push   %r12
   19819:	53                   	push   %rbx
   1981a:	48 83 ec 38          	sub    $0x38,%rsp
   1981e:	4d 85 c0             	test   %r8,%r8
   19821:	74 47                	je     1986a <<hyperinterval::ieee::Format>::div+0x5a>
   19823:	48 85 c9             	test   %rcx,%rcx
   19826:	74 4c                	je     19874 <<hyperinterval::ieee::Format>::div+0x64>
   19828:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1982d:	49 89 c9             	mov    %rcx,%r9
   19830:	49 21 d1             	and    %rdx,%r9
   19833:	48 89 c8             	mov    %rcx,%rax
   19836:	44 89 f1             	mov    %r14d,%ecx
   19839:	49 d3 e9             	shr    %cl,%r9
   1983c:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19842:	49 d3 e2             	shl    %cl,%r10
   19845:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   19849:	49 89 ec             	mov    %rbp,%r12
   1984c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19851:	49 21 c4             	and    %rax,%r12
   19854:	48 89 d0             	mov    %rdx,%rax
   19857:	48 d3 e8             	shr    %cl,%rax
   1985a:	4d 85 c9             	test   %r9,%r9
   1985d:	74 24                	je     19883 <<hyperinterval::ieee::Format>::div+0x73>
   1985f:	4d 09 d4             	or     %r10,%r12
   19862:	48 d1 e8             	shr    $1,%rax
   19865:	44 01 f0             	add    %r14d,%eax
   19868:	eb 25                	jmp    1988f <<hyperinterval::ieee::Format>::div+0x7f>
   1986a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1986f:	e9 ae 03 00 00       	jmp    19c22 <<hyperinterval::ieee::Format>::div+0x412>
   19874:	c6 07 00             	movb   $0x0,(%rdi)
   19877:	0f 57 c0             	xorps  %xmm0,%xmm0
   1987a:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1987e:	e9 9f 03 00 00       	jmp    19c22 <<hyperinterval::ieee::Format>::div+0x412>
   19883:	48 d1 e8             	shr    $1,%rax
   19886:	44 01 f0             	add    %r14d,%eax
   19889:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1988f:	41 29 c1             	sub    %eax,%r9d
   19892:	4d 89 c3             	mov    %r8,%r11
   19895:	49 21 d3             	and    %rdx,%r11
   19898:	44 89 f1             	mov    %r14d,%ecx
   1989b:	49 d3 eb             	shr    %cl,%r11
   1989e:	4c 21 c5             	and    %r8,%rbp
   198a1:	48 89 d0             	mov    %rdx,%rax
   198a4:	48 d3 e8             	shr    %cl,%rax
   198a7:	4d 85 db             	test   %r11,%r11
   198aa:	74 0e                	je     198ba <<hyperinterval::ieee::Format>::div+0xaa>
   198ac:	4c 09 d5             	or     %r10,%rbp
   198af:	48 d1 e8             	shr    $1,%rax
   198b2:	44 01 f0             	add    %r14d,%eax
   198b5:	44 29 d8             	sub    %r11d,%eax
   198b8:	eb 08                	jmp    198c2 <<hyperinterval::ieee::Format>::div+0xb2>
   198ba:	48 d1 e8             	shr    $1,%rax
   198bd:	44 01 f0             	add    %r14d,%eax
   198c0:	ff c8                	dec    %eax
   198c2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   198c7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   198cd:	4c 0f bd d5          	bsr    %rbp,%r10
   198d1:	41 83 f2 3f          	xor    $0x3f,%r10d
   198d5:	41 83 c2 40          	add    $0x40,%r10d
   198d9:	49 0f bd cc          	bsr    %r12,%rcx
   198dd:	83 f1 3f             	xor    $0x3f,%ecx
   198e0:	45 89 d7             	mov    %r10d,%r15d
   198e3:	41 29 cf             	sub    %ecx,%r15d
   198e6:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   198ea:	78 26                	js     19912 <<hyperinterval::ieee::Format>::div+0x102>
   198ec:	45 31 db             	xor    %r11d,%r11d
   198ef:	44 89 f9             	mov    %r15d,%ecx
   198f2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   198f6:	31 db                	xor    %ebx,%ebx
   198f8:	49 89 ed             	mov    %rbp,%r13
   198fb:	49 d3 e5             	shl    %cl,%r13
   198fe:	41 f6 c7 40          	test   $0x40,%r15b
   19902:	4d 0f 45 dd          	cmovne %r13,%r11
   19906:	4c 0f 45 eb          	cmovne %rbx,%r13
   1990a:	4d 39 ec             	cmp    %r13,%r12
   1990d:	4c 19 db             	sbb    %r11,%rbx
   19910:	eb 26                	jmp    19938 <<hyperinterval::ieee::Format>::div+0x128>
   19912:	44 89 f9             	mov    %r15d,%ecx
   19915:	f6 d9                	neg    %cl
   19917:	45 31 db             	xor    %r11d,%r11d
   1991a:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   1991e:	31 db                	xor    %ebx,%ebx
   19920:	4d 89 e5             	mov    %r12,%r13
   19923:	49 d3 e5             	shl    %cl,%r13
   19926:	f6 c1 40             	test   $0x40,%cl
   19929:	4d 0f 45 dd          	cmovne %r13,%r11
   1992d:	4c 0f 45 eb          	cmovne %rbx,%r13
   19931:	49 39 ed             	cmp    %rbp,%r13
   19934:	49 83 db 00          	sbb    $0x0,%r11
   19938:	41 0f 92 c3          	setb   %r11b
   1993c:	44 89 f1             	mov    %r14d,%ecx
   1993f:	48 d3 ea             	shr    %cl,%rdx
   19942:	44 01 c8             	add    %r9d,%eax
   19945:	41 01 c7             	add    %eax,%r15d
   19948:	41 0f b6 cb          	movzbl %r11b,%ecx
   1994c:	41 29 cf             	sub    %ecx,%r15d
   1994f:	48 d1 ea             	shr    $1,%rdx
   19952:	41 39 d7             	cmp    %edx,%r15d
   19955:	0f 8f 0e 02 00 00    	jg     19b69 <<hyperinterval::ieee::Format>::div+0x359>
   1995b:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   1995f:	b9 01 00 00 00       	mov    $0x1,%ecx
   19964:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   19969:	44 29 c9             	sub    %r9d,%ecx
   1996c:	45 29 f7             	sub    %r14d,%r15d
   1996f:	41 39 cf             	cmp    %ecx,%r15d
   19972:	44 0f 4e f9          	cmovle %ecx,%r15d
   19976:	44 29 f8             	sub    %r15d,%eax
   19979:	78 61                	js     199dc <<hyperinterval::ieee::Format>::div+0x1cc>
   1997b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19980:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19985:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1998a:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1998f:	48 85 ed             	test   %rbp,%rbp
   19992:	0f 84 99 02 00 00    	je     19c31 <<hyperinterval::ieee::Format>::div+0x421>
   19998:	45 31 ed             	xor    %r13d,%r13d
   1999b:	89 c1                	mov    %eax,%ecx
   1999d:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   199a1:	31 d2                	xor    %edx,%edx
   199a3:	49 d3 e4             	shl    %cl,%r12
   199a6:	a8 40                	test   $0x40,%al
   199a8:	4d 0f 45 ec          	cmovne %r12,%r13
   199ac:	4c 0f 45 e2          	cmovne %rdx,%r12
   199b0:	4c 89 e7             	mov    %r12,%rdi
   199b3:	4c 89 ee             	mov    %r13,%rsi
   199b6:	48 89 ea             	mov    %rbp,%rdx
   199b9:	31 c9                	xor    %ecx,%ecx
   199bb:	ff 15 5f 73 03 00    	call   *0x3735f(%rip)        # 50d20 <_DYNAMIC+0x298>
   199c1:	49 89 c2             	mov    %rax,%r10
   199c4:	49 89 d1             	mov    %rdx,%r9
   199c7:	48 89 d1             	mov    %rdx,%rcx
   199ca:	48 0f af cd          	imul   %rbp,%rcx
   199ce:	48 f7 e5             	mul    %rbp
   199d1:	48 01 ca             	add    %rcx,%rdx
   199d4:	49 29 c4             	sub    %rax,%r12
   199d7:	49 19 d5             	sbb    %rdx,%r13
   199da:	eb 79                	jmp    19a55 <<hyperinterval::ieee::Format>::div+0x245>
   199dc:	f7 d8                	neg    %eax
   199de:	44 39 d0             	cmp    %r10d,%eax
   199e1:	7e 07                	jle    199ea <<hyperinterval::ieee::Format>::div+0x1da>
   199e3:	b3 01                	mov    $0x1,%bl
   199e5:	e9 df 00 00 00       	jmp    19ac9 <<hyperinterval::ieee::Format>::div+0x2b9>
   199ea:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   199ef:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   199f4:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   199f9:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   199fe:	31 db                	xor    %ebx,%ebx
   19a00:	89 c1                	mov    %eax,%ecx
   19a02:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   19a06:	48 d3 e5             	shl    %cl,%rbp
   19a09:	31 c9                	xor    %ecx,%ecx
   19a0b:	a8 40                	test   $0x40,%al
   19a0d:	48 0f 45 dd          	cmovne %rbp,%rbx
   19a11:	48 0f 45 e9          	cmovne %rcx,%rbp
   19a15:	48 89 e8             	mov    %rbp,%rax
   19a18:	48 09 d8             	or     %rbx,%rax
   19a1b:	0f 84 1c 02 00 00    	je     19c3d <<hyperinterval::ieee::Format>::div+0x42d>
   19a21:	45 31 ed             	xor    %r13d,%r13d
   19a24:	4c 89 e7             	mov    %r12,%rdi
   19a27:	31 f6                	xor    %esi,%esi
   19a29:	48 89 ea             	mov    %rbp,%rdx
   19a2c:	48 89 d9             	mov    %rbx,%rcx
   19a2f:	ff 15 eb 72 03 00    	call   *0x372eb(%rip)        # 50d20 <_DYNAMIC+0x298>
   19a35:	49 89 c2             	mov    %rax,%r10
   19a38:	49 89 d1             	mov    %rdx,%r9
   19a3b:	48 0f af d8          	imul   %rax,%rbx
   19a3f:	48 f7 e5             	mul    %rbp
   19a42:	48 01 da             	add    %rbx,%rdx
   19a45:	4c 89 c9             	mov    %r9,%rcx
   19a48:	48 0f af cd          	imul   %rbp,%rcx
   19a4c:	48 01 d1             	add    %rdx,%rcx
   19a4f:	49 29 c4             	sub    %rax,%r12
   19a52:	49 19 cd             	sbb    %rcx,%r13
   19a55:	4d 09 ec             	or     %r13,%r12
   19a58:	0f 95 c3             	setne  %bl
   19a5b:	4c 89 d0             	mov    %r10,%rax
   19a5e:	4c 09 c8             	or     %r9,%rax
   19a61:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19a66:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   19a6b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   19a70:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19a75:	74 52                	je     19ac9 <<hyperinterval::ieee::Format>::div+0x2b9>
   19a77:	49 0f bd c1          	bsr    %r9,%rax
   19a7b:	83 f0 3f             	xor    $0x3f,%eax
   19a7e:	4d 0f bd da          	bsr    %r10,%r11
   19a82:	41 83 f3 3f          	xor    $0x3f,%r11d
   19a86:	41 83 cb 40          	or     $0x40,%r11d
   19a8a:	4d 85 c9             	test   %r9,%r9
   19a8d:	44 0f 45 d8          	cmovne %eax,%r11d
   19a91:	41 83 f3 7f          	xor    $0x7f,%r11d
   19a95:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   19a99:	39 d5                	cmp    %edx,%ebp
   19a9b:	0f 8f c8 00 00 00    	jg     19b69 <<hyperinterval::ieee::Format>::div+0x359>
   19aa1:	b8 01 00 00 00       	mov    $0x1,%eax
   19aa6:	29 d0                	sub    %edx,%eax
   19aa8:	39 c5                	cmp    %eax,%ebp
   19aaa:	7d 28                	jge    19ad4 <<hyperinterval::ieee::Format>::div+0x2c4>
   19aac:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19ab1:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   19ab5:	fe c9                	dec    %cl
   19ab7:	4c 89 d0             	mov    %r10,%rax
   19aba:	48 d3 e0             	shl    %cl,%rax
   19abd:	45 31 db             	xor    %r11d,%r11d
   19ac0:	f6 c1 40             	test   $0x40,%cl
   19ac3:	4c 0f 44 d8          	cmove  %rax,%r11
   19ac7:	eb 68                	jmp    19b31 <<hyperinterval::ieee::Format>::div+0x321>
   19ac9:	45 31 d2             	xor    %r10d,%r10d
   19acc:	45 31 c9             	xor    %r9d,%r9d
   19acf:	45 31 db             	xor    %r11d,%r11d
   19ad2:	eb 5d                	jmp    19b31 <<hyperinterval::ieee::Format>::div+0x321>
   19ad4:	44 89 f1             	mov    %r14d,%ecx
   19ad7:	44 29 d9             	sub    %r11d,%ecx
   19ada:	4d 89 d4             	mov    %r10,%r12
   19add:	49 d3 e4             	shl    %cl,%r12
   19ae0:	89 c8                	mov    %ecx,%eax
   19ae2:	f7 d8                	neg    %eax
   19ae4:	45 31 ed             	xor    %r13d,%r13d
   19ae7:	f6 c1 40             	test   $0x40,%cl
   19aea:	4d 0f 44 ec          	cmove  %r12,%r13
   19aee:	4d 89 d4             	mov    %r10,%r12
   19af1:	89 c1                	mov    %eax,%ecx
   19af3:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   19af7:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   19afb:	4c 89 cb             	mov    %r9,%rbx
   19afe:	48 d3 eb             	shr    %cl,%rbx
   19b01:	a8 40                	test   $0x40,%al
   19b03:	49 0f 44 dc          	cmove  %r12,%rbx
   19b07:	45 39 de             	cmp    %r11d,%r14d
   19b0a:	49 0f 43 dd          	cmovae %r13,%rbx
   19b0e:	01 d5                	add    %edx,%ebp
   19b10:	48 63 c5             	movslq %ebp,%rax
   19b13:	44 89 f1             	mov    %r14d,%ecx
   19b16:	48 d3 e0             	shl    %cl,%rax
   19b19:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   19b20:	49 d3 e3             	shl    %cl,%r11
   19b23:	49 f7 d3             	not    %r11
   19b26:	49 21 db             	and    %rbx,%r11
   19b29:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   19b2e:	49 09 c3             	or     %rax,%r11
   19b31:	0f b6 db             	movzbl %bl,%ebx
   19b34:	4c 01 d3             	add    %r10,%rbx
   19b37:	49 83 d1 00          	adc    $0x0,%r9
   19b3b:	48 89 d8             	mov    %rbx,%rax
   19b3e:	4c 09 c8             	or     %r9,%rax
   19b41:	74 30                	je     19b73 <<hyperinterval::ieee::Format>::div+0x363>
   19b43:	49 0f bd c1          	bsr    %r9,%rax
   19b47:	83 f0 3f             	xor    $0x3f,%eax
   19b4a:	4c 0f bd d3          	bsr    %rbx,%r10
   19b4e:	41 83 f2 3f          	xor    $0x3f,%r10d
   19b52:	41 83 ca 40          	or     $0x40,%r10d
   19b56:	4d 85 c9             	test   %r9,%r9
   19b59:	44 0f 45 d0          	cmovne %eax,%r10d
   19b5d:	41 83 f2 7f          	xor    $0x7f,%r10d
   19b61:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   19b65:	39 d5                	cmp    %edx,%ebp
   19b67:	7e 0e                	jle    19b77 <<hyperinterval::ieee::Format>::div+0x367>
   19b69:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   19b6e:	e9 af 00 00 00       	jmp    19c22 <<hyperinterval::ieee::Format>::div+0x412>
   19b73:	31 c0                	xor    %eax,%eax
   19b75:	eb 71                	jmp    19be8 <<hyperinterval::ieee::Format>::div+0x3d8>
   19b77:	b8 01 00 00 00       	mov    $0x1,%eax
   19b7c:	29 d0                	sub    %edx,%eax
   19b7e:	39 c5                	cmp    %eax,%ebp
   19b80:	7d 18                	jge    19b9a <<hyperinterval::ieee::Format>::div+0x38a>
   19b82:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19b87:	44 01 f9             	add    %r15d,%ecx
   19b8a:	fe c9                	dec    %cl
   19b8c:	48 d3 e3             	shl    %cl,%rbx
   19b8f:	31 c0                	xor    %eax,%eax
   19b91:	f6 c1 40             	test   $0x40,%cl
   19b94:	48 0f 44 c3          	cmove  %rbx,%rax
   19b98:	eb 4e                	jmp    19be8 <<hyperinterval::ieee::Format>::div+0x3d8>
   19b9a:	44 89 f1             	mov    %r14d,%ecx
   19b9d:	44 29 d1             	sub    %r10d,%ecx
   19ba0:	89 c8                	mov    %ecx,%eax
   19ba2:	f7 d8                	neg    %eax
   19ba4:	49 89 df             	mov    %rbx,%r15
   19ba7:	49 d3 e7             	shl    %cl,%r15
   19baa:	45 31 e4             	xor    %r12d,%r12d
   19bad:	f6 c1 40             	test   $0x40,%cl
   19bb0:	4d 0f 44 e7          	cmove  %r15,%r12
   19bb4:	89 c1                	mov    %eax,%ecx
   19bb6:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   19bba:	49 d3 e9             	shr    %cl,%r9
   19bbd:	a8 40                	test   $0x40,%al
   19bbf:	4c 0f 44 cb          	cmove  %rbx,%r9
   19bc3:	45 39 d6             	cmp    %r10d,%r14d
   19bc6:	4d 0f 43 cc          	cmovae %r12,%r9
   19bca:	01 d5                	add    %edx,%ebp
   19bcc:	48 63 d5             	movslq %ebp,%rdx
   19bcf:	44 89 f1             	mov    %r14d,%ecx
   19bd2:	48 d3 e2             	shl    %cl,%rdx
   19bd5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   19bdc:	48 d3 e0             	shl    %cl,%rax
   19bdf:	48 f7 d0             	not    %rax
   19be2:	4c 21 c8             	and    %r9,%rax
   19be5:	48 09 d0             	or     %rdx,%rax
   19be8:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   19bed:	0f 95 c1             	setne  %cl
   19bf0:	49 85 f0             	test   %rsi,%r8
   19bf3:	0f 94 c2             	sete   %dl
   19bf6:	30 ca                	xor    %cl,%dl
   19bf8:	75 1d                	jne    19c17 <<hyperinterval::ieee::Format>::div+0x407>
   19bfa:	48 89 c1             	mov    %rax,%rcx
   19bfd:	48 31 f1             	xor    %rsi,%rcx
   19c00:	48 85 c0             	test   %rax,%rax
   19c03:	48 0f 44 c8          	cmove  %rax,%rcx
   19c07:	4c 31 de             	xor    %r11,%rsi
   19c0a:	4d 85 db             	test   %r11,%r11
   19c0d:	49 0f 44 f3          	cmove  %r11,%rsi
   19c11:	48 89 f0             	mov    %rsi,%rax
   19c14:	49 89 cb             	mov    %rcx,%r11
   19c17:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   19c1b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   19c1f:	c6 07 00             	movb   $0x0,(%rdi)
   19c22:	48 83 c4 38          	add    $0x38,%rsp
   19c26:	5b                   	pop    %rbx
   19c27:	41 5c                	pop    %r12
   19c29:	41 5d                	pop    %r13
   19c2b:	41 5e                	pop    %r14
   19c2d:	41 5f                	pop    %r15
   19c2f:	5d                   	pop    %rbp
   19c30:	c3                   	ret
   19c31:	48 8d 3d f8 59 03 00 	lea    0x359f8(%rip),%rdi        # 4f630 <__frame_dummy_init_array_entry+0x450>
   19c38:	e8 93 cc ff ff       	call   168d0 <core::panicking::panic_const::panic_const_div_by_zero>
   19c3d:	48 8d 3d d4 59 03 00 	lea    0x359d4(%rip),%rdi        # 4f618 <__frame_dummy_init_array_entry+0x438>
   19c44:	e8 87 cc ff ff       	call   168d0 <core::panicking::panic_const::panic_const_div_by_zero>
   19c49:	cc                   	int3
   19c4a:	cc                   	int3
   19c4b:	cc                   	int3
   19c4c:	cc                   	int3
   19c4d:	cc                   	int3
   19c4e:	cc                   	int3
   19c4f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19c50:	55                   	push   %rbp
   19c51:	41 57                	push   %r15
   19c53:	41 56                	push   %r14
   19c55:	41 55                	push   %r13
   19c57:	41 54                	push   %r12
   19c59:	53                   	push   %rbx
   19c5a:	48 83 ec 78          	sub    $0x78,%rsp
   19c5e:	48 89 fb             	mov    %rdi,%rbx
   19c61:	f6 06 01             	testb  $0x1,(%rsi)
   19c64:	0f 84 e9 00 00 00    	je     19d53 <<hyperinterval::float::F32Enclosure>::square+0x103>
   19c6a:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   19c6e:	8b 6e 08             	mov    0x8(%rsi),%ebp
   19c71:	44 89 f0             	mov    %r14d,%eax
   19c74:	c1 e8 17             	shr    $0x17,%eax
   19c77:	0f b6 c0             	movzbl %al,%eax
   19c7a:	44 89 f1             	mov    %r14d,%ecx
   19c7d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19c83:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19c8a:	85 c0                	test   %eax,%eax
   19c8c:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19c93:	48 0f 44 d1          	cmove  %rcx,%rdx
   19c97:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   19c9d:	41 0f 44 c7          	cmove  %r15d,%eax
   19ca1:	48 0f af d2          	imul   %rdx,%rdx
   19ca5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19caa:	48 89 14 24          	mov    %rdx,(%rsp)
   19cae:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19cb5:	00 00 
   19cb7:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19cbb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19cc0:	48 89 e1             	mov    %rsp,%rcx
   19cc3:	be 00 00 00 80       	mov    $0x80000000,%esi
   19cc8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ccd:	e8 4e f8 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   19cd2:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   19cd7:	75 6a                	jne    19d43 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   19cd9:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   19cde:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   19ce3:	89 e8                	mov    %ebp,%eax
   19ce5:	c1 e8 17             	shr    $0x17,%eax
   19ce8:	0f b6 c0             	movzbl %al,%eax
   19ceb:	89 e9                	mov    %ebp,%ecx
   19ced:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19cf3:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19cfa:	85 c0                	test   %eax,%eax
   19cfc:	48 0f 44 d1          	cmove  %rcx,%rdx
   19d00:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19d07:	41 0f 44 c7          	cmove  %r15d,%eax
   19d0b:	48 0f af d2          	imul   %rdx,%rdx
   19d0f:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19d14:	48 89 14 24          	mov    %rdx,(%rsp)
   19d18:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19d1f:	00 00 
   19d21:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19d25:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19d2a:	48 89 e1             	mov    %rsp,%rcx
   19d2d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d32:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d37:	e8 e4 f7 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   19d3c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   19d41:	75 25                	jne    19d68 <<hyperinterval::float::F32Enclosure>::square+0x118>
   19d43:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   19d48:	88 43 04             	mov    %al,0x4(%rbx)
   19d4b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19d51:	eb 06                	jmp    19d59 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19d53:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19d59:	48 83 c4 78          	add    $0x78,%rsp
   19d5d:	5b                   	pop    %rbx
   19d5e:	41 5c                	pop    %r12
   19d60:	41 5d                	pop    %r13
   19d62:	41 5e                	pop    %r14
   19d64:	41 5f                	pop    %r15
   19d66:	5d                   	pop    %rbp
   19d67:	c3                   	ret
   19d68:	8b 44 24 40          	mov    0x40(%rsp),%eax
   19d6c:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19d71:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   19d76:	48 89 e7             	mov    %rsp,%rdi
   19d79:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d7e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d83:	4c 89 e9             	mov    %r13,%rcx
   19d86:	e8 15 f3 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19d8b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d8f:	74 25                	je     19db6 <<hyperinterval::float::F32Enclosure>::square+0x166>
   19d91:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   19d96:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19d9b:	48 89 e7             	mov    %rsp,%rdi
   19d9e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19da3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19da8:	4c 89 e1             	mov    %r12,%rcx
   19dab:	e8 f0 f2 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19db0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19db4:	75 07                	jne    19dbd <<hyperinterval::float::F32Enclosure>::square+0x16d>
   19db6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19dbb:	eb 8b                	jmp    19d48 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19dbd:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   19dc2:	45 89 fd             	mov    %r15d,%r13d
   19dc5:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   19dcc:	41 89 d4             	mov    %edx,%r12d
   19dcf:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   19dd6:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19ddb:	4c 29 e8             	sub    %r13,%rax
   19dde:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19de3:	49 09 cd             	or     %rcx,%r13
   19de6:	45 85 ff             	test   %r15d,%r15d
   19de9:	4c 0f 48 e8          	cmovs  %rax,%r13
   19ded:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19df2:	4c 29 e0             	sub    %r12,%rax
   19df5:	49 09 cc             	or     %rcx,%r12
   19df8:	85 d2                	test   %edx,%edx
   19dfa:	4c 0f 48 e0          	cmovs  %rax,%r12
   19dfe:	b0 01                	mov    $0x1,%al
   19e00:	4d 39 e5             	cmp    %r12,%r13
   19e03:	0f 87 3f ff ff ff    	ja     19d48 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19e09:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19e0e:	48 89 e7             	mov    %rsp,%rdi
   19e11:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e16:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e1b:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   19e20:	e8 7b f2 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19e25:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e29:	74 27                	je     19e52 <<hyperinterval::float::F32Enclosure>::square+0x202>
   19e2b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19e30:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19e35:	48 89 e7             	mov    %rsp,%rdi
   19e38:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e3d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19e42:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   19e47:	e8 54 f2 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   19e4c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19e50:	75 13                	jne    19e65 <<hyperinterval::float::F32Enclosure>::square+0x215>
   19e52:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19e57:	88 53 04             	mov    %dl,0x4(%rbx)
   19e5a:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19e60:	e9 f4 fe ff ff       	jmp    19d59 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19e65:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19e6a:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   19e6f:	44 89 c1             	mov    %r8d,%ecx
   19e72:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19e78:	89 c2                	mov    %eax,%edx
   19e7a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19e80:	be 00 00 00 80       	mov    $0x80000000,%esi
   19e85:	48 29 ce             	sub    %rcx,%rsi
   19e88:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19e8d:	48 09 f9             	or     %rdi,%rcx
   19e90:	45 85 c0             	test   %r8d,%r8d
   19e93:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19e97:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   19e9b:	48 29 d7             	sub    %rdx,%rdi
   19e9e:	85 c0                	test   %eax,%eax
   19ea0:	48 0f 49 fe          	cmovns %rsi,%rdi
   19ea4:	b2 01                	mov    $0x1,%dl
   19ea6:	48 39 f9             	cmp    %rdi,%rcx
   19ea9:	77 ac                	ja     19e57 <<hyperinterval::float::F32Enclosure>::square+0x207>
   19eab:	41 39 cd             	cmp    %ecx,%r13d
   19eae:	45 0f 47 f8          	cmova  %r8d,%r15d
   19eb2:	41 39 fc             	cmp    %edi,%r12d
   19eb5:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19eba:	0f 42 c8             	cmovb  %eax,%ecx
   19ebd:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   19ec4:	00 
   19ec5:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   19eca:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   19ece:	45 85 f6             	test   %r14d,%r14d
   19ed1:	7f 6d                	jg     19f40 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   19ed3:	85 ed                	test   %ebp,%ebp
   19ed5:	0f 98 c0             	sets   %al
   19ed8:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   19ede:	0f 95 c1             	setne  %cl
   19ee1:	84 c8                	test   %cl,%al
   19ee3:	75 5b                	jne    19f40 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   19ee5:	48 89 e7             	mov    %rsp,%rdi
   19ee8:	31 f6                	xor    %esi,%esi
   19eea:	31 d2                	xor    %edx,%edx
   19eec:	e8 cf 05 00 00       	call   1a4c0 <<hyperinterval::float::F32Enclosure>::from_bits>
   19ef1:	8b 0c 24             	mov    (%rsp),%ecx
   19ef4:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19ef9:	83 f9 02             	cmp    $0x2,%ecx
   19efc:	0f 84 46 fe ff ff    	je     19d48 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19f02:	8b 54 24 05          	mov    0x5(%rsp),%edx
   19f06:	8b 74 24 08          	mov    0x8(%rsp),%esi
   19f0a:	89 74 24 40          	mov    %esi,0x40(%rsp)
   19f0e:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   19f12:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   19f16:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   19f1a:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   19f1f:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   19f24:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   19f29:	e8 42 04 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::hull>
   19f2e:	8b 44 24 74          	mov    0x74(%rsp),%eax
   19f32:	89 44 24 30          	mov    %eax,0x30(%rsp)
   19f36:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   19f3b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19f40:	8b 44 24 30          	mov    0x30(%rsp),%eax
   19f44:	89 43 08             	mov    %eax,0x8(%rbx)
   19f47:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   19f4c:	48 89 03             	mov    %rax,(%rbx)
   19f4f:	e9 05 fe ff ff       	jmp    19d59 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19f54:	cc                   	int3
   19f55:	cc                   	int3
   19f56:	cc                   	int3
   19f57:	cc                   	int3
   19f58:	cc                   	int3
   19f59:	cc                   	int3
   19f5a:	cc                   	int3
   19f5b:	cc                   	int3
   19f5c:	cc                   	int3
   19f5d:	cc                   	int3
   19f5e:	cc                   	int3
   19f5f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   19f60:	55                   	push   %rbp
   19f61:	41 57                	push   %r15
   19f63:	41 56                	push   %r14
   19f65:	41 55                	push   %r13
   19f67:	41 54                	push   %r12
   19f69:	53                   	push   %rbx
   19f6a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   19f71:	49 89 ca             	mov    %rcx,%r10
   19f74:	49 89 d6             	mov    %rdx,%r14
   19f77:	48 85 f1             	test   %rsi,%rcx
   19f7a:	0f 95 c0             	setne  %al
   19f7d:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   19f82:	49 89 d3             	mov    %rdx,%r11
   19f85:	44 89 c9             	mov    %r9d,%ecx
   19f88:	49 d3 eb             	shr    %cl,%r11
   19f8b:	49 d1 eb             	shr    $1,%r11
   19f8e:	49 63 d3             	movslq %r11d,%rdx
   19f91:	48 d3 e2             	shl    %cl,%rdx
   19f94:	45 85 c0             	test   %r8d,%r8d
   19f97:	0f 84 65 03 00 00    	je     1a302 <<hyperinterval::ieee::Format>::power+0x3a2>
   19f9d:	88 44 24 07          	mov    %al,0x7(%rsp)
   19fa1:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   19fa6:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   19faa:	49 21 c2             	and    %rax,%r10
   19fad:	bb 01 00 00 00       	mov    $0x1,%ebx
   19fb2:	44 89 c9             	mov    %r9d,%ecx
   19fb5:	48 d3 e3             	shl    %cl,%rbx
   19fb8:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   19fbc:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   19fc1:	45 01 cb             	add    %r9d,%r11d
   19fc4:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19fca:	45 29 df             	sub    %r11d,%r15d
   19fcd:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   19fd2:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   19fd7:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   19fdc:	44 89 c5             	mov    %r8d,%ebp
   19fdf:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   19fe4:	4d 89 d5             	mov    %r10,%r13
   19fe7:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19fec:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   19ff1:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   19ff8:	00 
   19ff9:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   19ffe:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   1a003:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   1a00a:	00 
   1a00b:	40 f6 c5 01          	test   $0x1,%bpl
   1a00f:	75 2f                	jne    1a040 <<hyperinterval::ieee::Format>::power+0xe0>
   1a011:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a018:	0f 1f 84 00 00 00 00 
   1a01f:	00 
   1a020:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a025:	d1 ed                	shr    $1,%ebp
   1a027:	0f 85 b6 01 00 00    	jne    1a1e3 <<hyperinterval::ieee::Format>::power+0x283>
   1a02d:	e9 13 03 00 00       	jmp    1a345 <<hyperinterval::ieee::Format>::power+0x3e5>
   1a032:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   1a039:	1f 84 00 00 00 00 00 
   1a040:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a044:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   1a049:	4c 89 c2             	mov    %r8,%rdx
   1a04c:	4c 21 f2             	and    %r14,%rdx
   1a04f:	44 89 c9             	mov    %r9d,%ecx
   1a052:	48 d3 ea             	shr    %cl,%rdx
   1a055:	4c 89 c0             	mov    %r8,%rax
   1a058:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a05d:	48 21 e8             	and    %rbp,%rax
   1a060:	41 89 d2             	mov    %edx,%r10d
   1a063:	45 29 da             	sub    %r11d,%r10d
   1a066:	48 85 d2             	test   %rdx,%rdx
   1a069:	45 0f 44 d7          	cmove  %r15d,%r10d
   1a06d:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a071:	48 09 c2             	or     %rax,%rdx
   1a074:	4c 89 e8             	mov    %r13,%rax
   1a077:	4c 21 f0             	and    %r14,%rax
   1a07a:	48 d3 e8             	shr    %cl,%rax
   1a07d:	4c 89 e9             	mov    %r13,%rcx
   1a080:	48 21 e9             	and    %rbp,%rcx
   1a083:	89 c5                	mov    %eax,%ebp
   1a085:	44 29 dd             	sub    %r11d,%ebp
   1a088:	48 85 c0             	test   %rax,%rax
   1a08b:	41 0f 44 ef          	cmove  %r15d,%ebp
   1a08f:	48 0f 45 c3          	cmovne %rbx,%rax
   1a093:	48 09 c8             	or     %rcx,%rax
   1a096:	49 85 f0             	test   %rsi,%r8
   1a099:	0f 95 c1             	setne  %cl
   1a09c:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   1a0a3:	00 
   1a0a4:	49 85 f5             	test   %rsi,%r13
   1a0a7:	41 0f 95 c0          	setne  %r8b
   1a0ab:	48 f7 e2             	mul    %rdx
   1a0ae:	41 30 c8             	xor    %cl,%r8b
   1a0b1:	44 01 d5             	add    %r10d,%ebp
   1a0b4:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a0b9:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a0be:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a0c3:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   1a0c7:	4c 89 f2             	mov    %r14,%rdx
   1a0ca:	4c 89 e1             	mov    %r12,%rcx
   1a0cd:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1a0d2:	4d 89 dd             	mov    %r11,%r13
   1a0d5:	4d 89 cc             	mov    %r9,%r12
   1a0d8:	e8 43 f4 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1a0dd:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a0e2:	0f 85 09 02 00 00    	jne    1a2f1 <<hyperinterval::ieee::Format>::power+0x391>
   1a0e8:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   1a0ed:	4c 89 c2             	mov    %r8,%rdx
   1a0f0:	4c 21 f2             	and    %r14,%rdx
   1a0f3:	4d 89 f2             	mov    %r14,%r10
   1a0f6:	44 89 e1             	mov    %r12d,%ecx
   1a0f9:	48 d3 ea             	shr    %cl,%rdx
   1a0fc:	4c 89 c7             	mov    %r8,%rdi
   1a0ff:	48 21 ef             	and    %rbp,%rdi
   1a102:	89 d6                	mov    %edx,%esi
   1a104:	4d 89 ee             	mov    %r13,%r14
   1a107:	44 29 f6             	sub    %r14d,%esi
   1a10a:	48 85 d2             	test   %rdx,%rdx
   1a10d:	41 0f 44 f7          	cmove  %r15d,%esi
   1a111:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a115:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
   1a11a:	4c 89 c8             	mov    %r9,%rax
   1a11d:	4c 21 d0             	and    %r10,%rax
   1a120:	4d 89 d5             	mov    %r10,%r13
   1a123:	48 d3 e8             	shr    %cl,%rax
   1a126:	48 09 fa             	or     %rdi,%rdx
   1a129:	4c 89 c9             	mov    %r9,%rcx
   1a12c:	48 21 e9             	and    %rbp,%rcx
   1a12f:	89 c7                	mov    %eax,%edi
   1a131:	44 29 f7             	sub    %r14d,%edi
   1a134:	48 85 c0             	test   %rax,%rax
   1a137:	41 0f 44 ff          	cmove  %r15d,%edi
   1a13b:	48 0f 45 c3          	cmovne %rbx,%rax
   1a13f:	48 09 c8             	or     %rcx,%rax
   1a142:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   1a149:	00 
   1a14a:	4d 85 f8             	test   %r15,%r8
   1a14d:	0f 95 c1             	setne  %cl
   1a150:	4d 85 f9             	test   %r15,%r9
   1a153:	41 0f 95 c0          	setne  %r8b
   1a157:	41 30 c8             	xor    %cl,%r8b
   1a15a:	48 f7 e2             	mul    %rdx
   1a15d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   1a162:	01 f7                	add    %esi,%edi
   1a164:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a169:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a16e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a173:	89 7c 24 40          	mov    %edi,0x40(%rsp)
   1a177:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a17c:	48 89 fd             	mov    %rdi,%rbp
   1a17f:	4c 89 fe             	mov    %r15,%rsi
   1a182:	4c 89 d2             	mov    %r10,%rdx
   1a185:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   1a18a:	49 89 cc             	mov    %rcx,%r12
   1a18d:	e8 8e f3 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1a192:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a197:	0f 84 54 01 00 00    	je     1a2f1 <<hyperinterval::ieee::Format>::power+0x391>
   1a19d:	4c 89 fe             	mov    %r15,%rsi
   1a1a0:	4d 89 f3             	mov    %r14,%r11
   1a1a3:	4d 89 ee             	mov    %r13,%r14
   1a1a6:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   1a1ab:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a1b0:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a1b5:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a1bc:	00 
   1a1bd:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a1c2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a1c7:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a1cc:	48 89 ef             	mov    %rbp,%rdi
   1a1cf:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a1d3:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   1a1da:	00 
   1a1db:	d1 ed                	shr    $1,%ebp
   1a1dd:	0f 84 62 01 00 00    	je     1a345 <<hyperinterval::ieee::Format>::power+0x3e5>
   1a1e3:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a1e7:	4c 89 e8             	mov    %r13,%rax
   1a1ea:	4c 21 f0             	and    %r14,%rax
   1a1ed:	44 89 c9             	mov    %r9d,%ecx
   1a1f0:	48 d3 e8             	shr    %cl,%rax
   1a1f3:	49 21 d5             	and    %rdx,%r13
   1a1f6:	89 c1                	mov    %eax,%ecx
   1a1f8:	44 29 d9             	sub    %r11d,%ecx
   1a1fb:	48 85 c0             	test   %rax,%rax
   1a1fe:	48 0f 45 c3          	cmovne %rbx,%rax
   1a202:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a206:	4c 09 e8             	or     %r13,%rax
   1a209:	48 89 d5             	mov    %rdx,%rbp
   1a20c:	48 f7 e0             	mul    %rax
   1a20f:	01 c9                	add    %ecx,%ecx
   1a211:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a216:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a21b:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a220:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a224:	4c 89 f2             	mov    %r14,%rdx
   1a227:	4c 89 e1             	mov    %r12,%rcx
   1a22a:	49 89 dd             	mov    %rbx,%r13
   1a22d:	4c 89 db             	mov    %r11,%rbx
   1a230:	4d 89 f4             	mov    %r14,%r12
   1a233:	4d 89 ce             	mov    %r9,%r14
   1a236:	e8 e5 f2 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1a23b:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a240:	0f 85 ab 00 00 00    	jne    1a2f1 <<hyperinterval::ieee::Format>::power+0x391>
   1a246:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   1a24b:	48 89 d0             	mov    %rdx,%rax
   1a24e:	4c 21 e0             	and    %r12,%rax
   1a251:	44 89 f1             	mov    %r14d,%ecx
   1a254:	48 d3 e8             	shr    %cl,%rax
   1a257:	48 21 ea             	and    %rbp,%rdx
   1a25a:	89 c1                	mov    %eax,%ecx
   1a25c:	29 d9                	sub    %ebx,%ecx
   1a25e:	48 85 c0             	test   %rax,%rax
   1a261:	49 0f 45 c5          	cmovne %r13,%rax
   1a265:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a269:	48 09 d0             	or     %rdx,%rax
   1a26c:	48 f7 e0             	mul    %rax
   1a26f:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1a274:	01 c9                	add    %ecx,%ecx
   1a276:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a27b:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a280:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a285:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a289:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1a28e:	48 89 ef             	mov    %rbp,%rdi
   1a291:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1a298:	00 
   1a299:	4c 89 f6             	mov    %r14,%rsi
   1a29c:	4c 89 e2             	mov    %r12,%rdx
   1a29f:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1a2a4:	4c 89 f9             	mov    %r15,%rcx
   1a2a7:	e8 74 f2 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1a2ac:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a2b1:	74 3e                	je     1a2f1 <<hyperinterval::ieee::Format>::power+0x391>
   1a2b3:	4c 89 f6             	mov    %r14,%rsi
   1a2b6:	49 89 db             	mov    %rbx,%r11
   1a2b9:	4d 89 e6             	mov    %r12,%r14
   1a2bc:	48 89 ef             	mov    %rbp,%rdi
   1a2bf:	4d 89 fc             	mov    %r15,%r12
   1a2c2:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a2c7:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1a2cc:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a2d3:	00 
   1a2d4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a2d9:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a2de:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a2e2:	40 f6 c5 01          	test   $0x1,%bpl
   1a2e6:	0f 85 54 fd ff ff    	jne    1a040 <<hyperinterval::ieee::Format>::power+0xe0>
   1a2ec:	e9 2f fd ff ff       	jmp    1a020 <<hyperinterval::ieee::Format>::power+0xc0>
   1a2f1:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1a2f6:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a2fb:	88 47 01             	mov    %al,0x1(%rdi)
   1a2fe:	b0 01                	mov    $0x1,%al
   1a300:	eb 2f                	jmp    1a331 <<hyperinterval::ieee::Format>::power+0x3d1>
   1a302:	48 89 d1             	mov    %rdx,%rcx
   1a305:	44 20 c0             	and    %r8b,%al
   1a308:	74 1d                	je     1a327 <<hyperinterval::ieee::Format>::power+0x3c7>
   1a30a:	48 89 d0             	mov    %rdx,%rax
   1a30d:	48 31 f0             	xor    %rsi,%rax
   1a310:	48 85 d2             	test   %rdx,%rdx
   1a313:	48 0f 44 c2          	cmove  %rdx,%rax
   1a317:	48 31 ce             	xor    %rcx,%rsi
   1a31a:	48 85 c9             	test   %rcx,%rcx
   1a31d:	48 0f 44 f1          	cmove  %rcx,%rsi
   1a321:	48 89 c1             	mov    %rax,%rcx
   1a324:	48 89 f2             	mov    %rsi,%rdx
   1a327:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1a32b:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a32f:	31 c0                	xor    %eax,%eax
   1a331:	88 07                	mov    %al,(%rdi)
   1a333:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1a33a:	5b                   	pop    %rbx
   1a33b:	41 5c                	pop    %r12
   1a33d:	41 5d                	pop    %r13
   1a33f:	41 5e                	pop    %r14
   1a341:	41 5f                	pop    %r15
   1a343:	5d                   	pop    %rbp
   1a344:	c3                   	ret
   1a345:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a34a:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1a34f:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1a354:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1a359:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1a35e:	44 20 c0             	and    %r8b,%al
   1a361:	75 a7                	jne    1a30a <<hyperinterval::ieee::Format>::power+0x3aa>
   1a363:	eb c2                	jmp    1a327 <<hyperinterval::ieee::Format>::power+0x3c7>
   1a365:	cc                   	int3
   1a366:	cc                   	int3
   1a367:	cc                   	int3
   1a368:	cc                   	int3
   1a369:	cc                   	int3
   1a36a:	cc                   	int3
   1a36b:	cc                   	int3
   1a36c:	cc                   	int3
   1a36d:	cc                   	int3
   1a36e:	cc                   	int3
   1a36f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   1a370:	44 8b 16             	mov    (%rsi),%r10d
   1a373:	44 8b 0a             	mov    (%rdx),%r9d
   1a376:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a37a:	8b 42 08             	mov    0x8(%rdx),%eax
   1a37d:	41 f6 c2 01          	test   $0x1,%r10b
   1a381:	0f 84 9d 00 00 00    	je     1a424 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   1a387:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1a38a:	8b 56 08             	mov    0x8(%rsi),%edx
   1a38d:	41 f6 c1 01          	test   $0x1,%r9b
   1a391:	0f 84 98 00 00 00    	je     1a42f <<hyperinterval::float::F32Enclosure>::hull+0xbf>
   1a397:	53                   	push   %rbx
   1a398:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a39d:	44 8d 0c 31          	lea    (%rcx,%rsi,1),%r9d
   1a3a1:	41 89 ca             	mov    %ecx,%r10d
   1a3a4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a3ab:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a3b1:	45 29 d3             	sub    %r10d,%r11d
   1a3b4:	85 c9                	test   %ecx,%ecx
   1a3b6:	4d 0f 49 d9          	cmovns %r9,%r11
   1a3ba:	45 8d 0c 30          	lea    (%r8,%rsi,1),%r9d
   1a3be:	45 89 c2             	mov    %r8d,%r10d
   1a3c1:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a3c8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a3cd:	44 29 d3             	sub    %r10d,%ebx
   1a3d0:	45 85 c0             	test   %r8d,%r8d
   1a3d3:	49 0f 49 d9          	cmovns %r9,%rbx
   1a3d7:	41 39 db             	cmp    %ebx,%r11d
   1a3da:	41 0f 47 c8          	cmova  %r8d,%ecx
   1a3de:	44 8d 04 32          	lea    (%rdx,%rsi,1),%r8d
   1a3e2:	41 89 d1             	mov    %edx,%r9d
   1a3e5:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a3ec:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a3f2:	45 29 ca             	sub    %r9d,%r10d
   1a3f5:	85 d2                	test   %edx,%edx
   1a3f7:	4d 0f 49 d0          	cmovns %r8,%r10
   1a3fb:	44 8d 04 30          	lea    (%rax,%rsi,1),%r8d
   1a3ff:	41 89 c1             	mov    %eax,%r9d
   1a402:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a409:	44 29 ce             	sub    %r9d,%esi
   1a40c:	85 c0                	test   %eax,%eax
   1a40e:	49 0f 49 f0          	cmovns %r8,%rsi
   1a412:	41 39 f2             	cmp    %esi,%r10d
   1a415:	0f 42 d0             	cmovb  %eax,%edx
   1a418:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1a41e:	89 d0                	mov    %edx,%eax
   1a420:	41 89 c8             	mov    %ecx,%r8d
   1a423:	5b                   	pop    %rbx
   1a424:	44 89 0f             	mov    %r9d,(%rdi)
   1a427:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1a42b:	89 47 08             	mov    %eax,0x8(%rdi)
   1a42e:	c3                   	ret
   1a42f:	89 d0                	mov    %edx,%eax
   1a431:	41 89 c8             	mov    %ecx,%r8d
   1a434:	45 89 d1             	mov    %r10d,%r9d
   1a437:	44 89 0f             	mov    %r9d,(%rdi)
   1a43a:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1a43e:	89 47 08             	mov    %eax,0x8(%rdi)
   1a441:	c3                   	ret
   1a442:	cc                   	int3
   1a443:	cc                   	int3
   1a444:	cc                   	int3
   1a445:	cc                   	int3
   1a446:	cc                   	int3
   1a447:	cc                   	int3
   1a448:	cc                   	int3
   1a449:	cc                   	int3
   1a44a:	cc                   	int3
   1a44b:	cc                   	int3
   1a44c:	cc                   	int3
   1a44d:	cc                   	int3
   1a44e:	cc                   	int3
   1a44f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   1a450:	83 3f 01             	cmpl   $0x1,(%rdi)
   1a453:	75 65                	jne    1a4ba <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   1a455:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a45a:	8b 57 04             	mov    0x4(%rdi),%edx
   1a45d:	8b 47 08             	mov    0x8(%rdi),%eax
   1a460:	48 89 d6             	mov    %rdx,%rsi
   1a463:	48 09 ce             	or     %rcx,%rsi
   1a466:	41 89 d0             	mov    %edx,%r8d
   1a469:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a470:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1a475:	4c 29 c7             	sub    %r8,%rdi
   1a478:	85 d2                	test   %edx,%edx
   1a47a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1a47e:	31 f6                	xor    %esi,%esi
   1a480:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   1a486:	0f 94 c2             	sete   %dl
   1a489:	48 39 cf             	cmp    %rcx,%rdi
   1a48c:	77 1d                	ja     1a4ab <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   1a48e:	39 cf                	cmp    %ecx,%edi
   1a490:	0f 92 c1             	setb   %cl
   1a493:	80 c9 02             	or     $0x2,%cl
   1a496:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1a49b:	0f b6 c9             	movzbl %cl,%ecx
   1a49e:	40 88 d6             	mov    %dl,%sil
   1a4a1:	0f 44 f1             	cmove  %ecx,%esi
   1a4a4:	85 c0                	test   %eax,%eax
   1a4a6:	0f 49 f1             	cmovns %ecx,%esi
   1a4a9:	89 f2                	mov    %esi,%edx
   1a4ab:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1a4ae:	85 c0                	test   %eax,%eax
   1a4b0:	0f b6 d2             	movzbl %dl,%edx
   1a4b3:	0f b6 c1             	movzbl %cl,%eax
   1a4b6:	0f 4e c2             	cmovle %edx,%eax
   1a4b9:	c3                   	ret
   1a4ba:	31 c0                	xor    %eax,%eax
   1a4bc:	c3                   	ret
   1a4bd:	cc                   	int3
   1a4be:	cc                   	int3
   1a4bf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1a4c0:	41 57                	push   %r15
   1a4c2:	41 56                	push   %r14
   1a4c4:	41 54                	push   %r12
   1a4c6:	53                   	push   %rbx
   1a4c7:	48 83 ec 18          	sub    $0x18,%rsp
   1a4cb:	49 89 d6             	mov    %rdx,%r14
   1a4ce:	48 89 fb             	mov    %rdi,%rbx
   1a4d1:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a4d7:	89 f1                	mov    %esi,%ecx
   1a4d9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a4de:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a4e3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a4e8:	e8 b3 eb ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1a4ed:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a4f2:	74 23                	je     1a517 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   1a4f4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a4f9:	44 89 f1             	mov    %r14d,%ecx
   1a4fc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a501:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a506:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a50b:	e8 90 eb ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1a510:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a515:	75 1a                	jne    1a531 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   1a517:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a51c:	88 43 04             	mov    %al,0x4(%rbx)
   1a51f:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a525:	48 83 c4 18          	add    $0x18,%rsp
   1a529:	5b                   	pop    %rbx
   1a52a:	41 5c                	pop    %r12
   1a52c:	41 5e                	pop    %r14
   1a52e:	41 5f                	pop    %r15
   1a530:	c3                   	ret
   1a531:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a535:	44 89 e1             	mov    %r12d,%ecx
   1a538:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a53e:	89 c2                	mov    %eax,%edx
   1a540:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a546:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a54b:	29 ce                	sub    %ecx,%esi
   1a54d:	44 09 f9             	or     %r15d,%ecx
   1a550:	45 85 e4             	test   %r12d,%r12d
   1a553:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a557:	89 d1                	mov    %edx,%ecx
   1a559:	44 09 f9             	or     %r15d,%ecx
   1a55c:	41 29 d7             	sub    %edx,%r15d
   1a55f:	85 c0                	test   %eax,%eax
   1a561:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a565:	44 39 fe             	cmp    %r15d,%esi
   1a568:	76 06                	jbe    1a570 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   1a56a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a56e:	eb af                	jmp    1a51f <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   1a570:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a576:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a57a:	89 43 08             	mov    %eax,0x8(%rbx)
   1a57d:	eb a6                	jmp    1a525 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   1a57f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   1a580:	45 31 c9             	xor    %r9d,%r9d
   1a583:	f6 06 01             	testb  $0x1,(%rsi)
   1a586:	0f 84 ed 00 00 00    	je     1a679 <<hyperinterval::float::F32Enclosure>::intersection+0xf9>
   1a58c:	f6 02 01             	testb  $0x1,(%rdx)
   1a58f:	0f 84 d9 00 00 00    	je     1a66e <<hyperinterval::float::F32Enclosure>::intersection+0xee>
   1a595:	53                   	push   %rbx
   1a596:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a59a:	8b 46 04             	mov    0x4(%rsi),%eax
   1a59d:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a5a2:	41 89 c1             	mov    %eax,%r9d
   1a5a5:	41 09 c9             	or     %ecx,%r9d
   1a5a8:	41 89 c2             	mov    %eax,%r10d
   1a5ab:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a5b2:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a5b8:	45 29 d3             	sub    %r10d,%r11d
   1a5bb:	85 c0                	test   %eax,%eax
   1a5bd:	4d 0f 49 d9          	cmovns %r9,%r11
   1a5c1:	45 89 c1             	mov    %r8d,%r9d
   1a5c4:	41 09 c9             	or     %ecx,%r9d
   1a5c7:	45 89 c2             	mov    %r8d,%r10d
   1a5ca:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a5d1:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a5d6:	44 29 d3             	sub    %r10d,%ebx
   1a5d9:	45 85 c0             	test   %r8d,%r8d
   1a5dc:	49 0f 49 d9          	cmovns %r9,%rbx
   1a5e0:	8b 52 08             	mov    0x8(%rdx),%edx
   1a5e3:	41 39 db             	cmp    %ebx,%r11d
   1a5e6:	41 0f 42 c0          	cmovb  %r8d,%eax
   1a5ea:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   1a5ee:	44 89 c6             	mov    %r8d,%esi
   1a5f1:	09 ce                	or     %ecx,%esi
   1a5f3:	45 89 c1             	mov    %r8d,%r9d
   1a5f6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a5fd:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a603:	45 29 ca             	sub    %r9d,%r10d
   1a606:	45 85 c0             	test   %r8d,%r8d
   1a609:	4c 0f 49 d6          	cmovns %rsi,%r10
   1a60d:	89 d6                	mov    %edx,%esi
   1a60f:	09 ce                	or     %ecx,%esi
   1a611:	41 89 d1             	mov    %edx,%r9d
   1a614:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a61b:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a621:	45 29 cb             	sub    %r9d,%r11d
   1a624:	85 d2                	test   %edx,%edx
   1a626:	4c 0f 49 de          	cmovns %rsi,%r11
   1a62a:	45 39 da             	cmp    %r11d,%r10d
   1a62d:	44 0f 47 c2          	cmova  %edx,%r8d
   1a631:	89 c2                	mov    %eax,%edx
   1a633:	09 ca                	or     %ecx,%edx
   1a635:	89 c6                	mov    %eax,%esi
   1a637:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a63d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a643:	41 29 f2             	sub    %esi,%r10d
   1a646:	85 c0                	test   %eax,%eax
   1a648:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a64c:	44 89 c2             	mov    %r8d,%edx
   1a64f:	09 ca                	or     %ecx,%edx
   1a651:	44 89 c6             	mov    %r8d,%esi
   1a654:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a65a:	29 f1                	sub    %esi,%ecx
   1a65c:	45 85 c0             	test   %r8d,%r8d
   1a65f:	48 0f 49 ca          	cmovns %rdx,%rcx
   1a663:	45 31 c9             	xor    %r9d,%r9d
   1a666:	41 39 ca             	cmp    %ecx,%r10d
   1a669:	41 0f 96 c1          	setbe  %r9b
   1a66d:	5b                   	pop    %rbx
   1a66e:	44 89 0f             	mov    %r9d,(%rdi)
   1a671:	89 47 04             	mov    %eax,0x4(%rdi)
   1a674:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1a678:	c3                   	ret
   1a679:	44 89 0f             	mov    %r9d,(%rdi)
   1a67c:	89 47 04             	mov    %eax,0x4(%rdi)
   1a67f:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1a683:	c3                   	ret
   1a684:	cc                   	int3
   1a685:	cc                   	int3
   1a686:	cc                   	int3
   1a687:	cc                   	int3
   1a688:	cc                   	int3
   1a689:	cc                   	int3
   1a68a:	cc                   	int3
   1a68b:	cc                   	int3
   1a68c:	cc                   	int3
   1a68d:	cc                   	int3
   1a68e:	cc                   	int3
   1a68f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   1a690:	41 56                	push   %r14
   1a692:	53                   	push   %rbx
   1a693:	48 83 ec 18          	sub    $0x18,%rsp
   1a697:	48 89 fb             	mov    %rdi,%rbx
   1a69a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   1a6a0:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a6a4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a6a9:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a6ae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a6b3:	e8 e8 e9 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1a6b8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a6bd:	3c 01                	cmp    $0x1,%al
   1a6bf:	75 0d                	jne    1a6ce <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   1a6c1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1a6c6:	48 83 c4 18          	add    $0x18,%rsp
   1a6ca:	5b                   	pop    %rbx
   1a6cb:	41 5e                	pop    %r14
   1a6cd:	c3                   	ret
   1a6ce:	f6 03 01             	testb  $0x1,(%rbx)
   1a6d1:	74 44                	je     1a717 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   1a6d3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a6d8:	8b 73 04             	mov    0x4(%rbx),%esi
   1a6db:	89 d1                	mov    %edx,%ecx
   1a6dd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a6e3:	89 f7                	mov    %esi,%edi
   1a6e5:	44 09 f7             	or     %r14d,%edi
   1a6e8:	41 89 f0             	mov    %esi,%r8d
   1a6eb:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a6f2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a6f8:	45 29 c1             	sub    %r8d,%r9d
   1a6fb:	85 f6                	test   %esi,%esi
   1a6fd:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a701:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a706:	48 29 ce             	sub    %rcx,%rsi
   1a709:	4c 09 f1             	or     %r14,%rcx
   1a70c:	85 d2                	test   %edx,%edx
   1a70e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1a712:	41 39 c9             	cmp    %ecx,%r9d
   1a715:	76 0a                	jbe    1a721 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   1a717:	31 d2                	xor    %edx,%edx
   1a719:	48 83 c4 18          	add    $0x18,%rsp
   1a71d:	5b                   	pop    %rbx
   1a71e:	41 5e                	pop    %r14
   1a720:	c3                   	ret
   1a721:	8b 53 08             	mov    0x8(%rbx),%edx
   1a724:	89 d6                	mov    %edx,%esi
   1a726:	44 09 f6             	or     %r14d,%esi
   1a729:	89 d7                	mov    %edx,%edi
   1a72b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a731:	41 29 fe             	sub    %edi,%r14d
   1a734:	85 d2                	test   %edx,%edx
   1a736:	4c 0f 49 f6          	cmovns %rsi,%r14
   1a73a:	44 39 f1             	cmp    %r14d,%ecx
   1a73d:	0f 96 c2             	setbe  %dl
   1a740:	48 83 c4 18          	add    $0x18,%rsp
   1a744:	5b                   	pop    %rbx
   1a745:	41 5e                	pop    %r14
   1a747:	c3                   	ret
   1a748:	cc                   	int3
   1a749:	cc                   	int3
   1a74a:	cc                   	int3
   1a74b:	cc                   	int3
   1a74c:	cc                   	int3
   1a74d:	cc                   	int3
   1a74e:	cc                   	int3
   1a74f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   1a750:	b0 01                	mov    $0x1,%al
   1a752:	f6 07 01             	testb  $0x1,(%rdi)
   1a755:	0f 84 8e 00 00 00    	je     1a7e9 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1a75b:	f6 06 01             	testb  $0x1,(%rsi)
   1a75e:	0f 84 83 00 00 00    	je     1a7e7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1a764:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a767:	8b 56 04             	mov    0x4(%rsi),%edx
   1a76a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a76f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a773:	41 89 d1             	mov    %edx,%r9d
   1a776:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a77d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a783:	45 29 ca             	sub    %r9d,%r10d
   1a786:	85 d2                	test   %edx,%edx
   1a788:	4d 0f 49 d0          	cmovns %r8,%r10
   1a78c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a78f:	41 89 c8             	mov    %ecx,%r8d
   1a792:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a799:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a79f:	45 29 c1             	sub    %r8d,%r9d
   1a7a2:	85 c9                	test   %ecx,%ecx
   1a7a4:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a7a8:	45 39 ca             	cmp    %r9d,%r10d
   1a7ab:	73 3a                	jae    1a7e7 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1a7ad:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a7b0:	8b 56 08             	mov    0x8(%rsi),%edx
   1a7b3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   1a7b6:	89 cf                	mov    %ecx,%edi
   1a7b8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a7be:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a7c4:	41 29 f8             	sub    %edi,%r8d
   1a7c7:	85 c9                	test   %ecx,%ecx
   1a7c9:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a7cd:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   1a7d0:	89 d6                	mov    %edx,%esi
   1a7d2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a7d8:	29 f0                	sub    %esi,%eax
   1a7da:	85 d2                	test   %edx,%edx
   1a7dc:	48 0f 49 c1          	cmovns %rcx,%rax
   1a7e0:	41 39 c0             	cmp    %eax,%r8d
   1a7e3:	0f 92 c0             	setb   %al
   1a7e6:	c3                   	ret
   1a7e7:	31 c0                	xor    %eax,%eax
   1a7e9:	c3                   	ret
   1a7ea:	cc                   	int3
   1a7eb:	cc                   	int3
   1a7ec:	cc                   	int3
   1a7ed:	cc                   	int3
   1a7ee:	cc                   	int3
   1a7ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::abs:
   1a7f0:	f6 06 01             	testb  $0x1,(%rsi)
   1a7f3:	74 21                	je     1a816 <<hyperinterval::float::F32Enclosure>::abs+0x26>
   1a7f5:	8b 46 04             	mov    0x4(%rsi),%eax
   1a7f8:	85 c0                	test   %eax,%eax
   1a7fa:	0f 99 c1             	setns  %cl
   1a7fd:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1a802:	0f 94 c2             	sete   %dl
   1a805:	08 ca                	or     %cl,%dl
   1a807:	74 14                	je     1a81d <<hyperinterval::float::F32Enclosure>::abs+0x2d>
   1a809:	8b 46 08             	mov    0x8(%rsi),%eax
   1a80c:	89 47 08             	mov    %eax,0x8(%rdi)
   1a80f:	48 8b 06             	mov    (%rsi),%rax
   1a812:	48 89 07             	mov    %rax,(%rdi)
   1a815:	c3                   	ret
   1a816:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
   1a81c:	c3                   	ret
   1a81d:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1a820:	85 c9                	test   %ecx,%ecx
   1a822:	40 0f 98 c6          	sets   %sil
   1a826:	48 89 ca             	mov    %rcx,%rdx
   1a829:	48 81 e2 ff ff ff 7f 	and    $0x7fffffff,%rdx
   1a830:	41 0f 95 c0          	setne  %r8b
   1a834:	44 84 c6             	test   %r8b,%sil
   1a837:	74 18                	je     1a851 <<hyperinterval::float::F32Enclosure>::abs+0x61>
   1a839:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a83f:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1a844:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
   1a84a:	89 4f 04             	mov    %ecx,0x4(%rdi)
   1a84d:	89 47 08             	mov    %eax,0x8(%rdi)
   1a850:	c3                   	ret
   1a851:	89 c6                	mov    %eax,%esi
   1a853:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a859:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a85f:	46 8d 0c 01          	lea    (%rcx,%r8,1),%r9d
   1a863:	41 29 d0             	sub    %edx,%r8d
   1a866:	85 c9                	test   %ecx,%ecx
   1a868:	4d 0f 49 c1          	cmovns %r9,%r8
   1a86c:	41 39 c0             	cmp    %eax,%r8d
   1a86f:	0f 43 f1             	cmovae %ecx,%esi
   1a872:	48 c7 07 01 00 00 00 	movq   $0x1,(%rdi)
   1a879:	89 77 08             	mov    %esi,0x8(%rdi)
   1a87c:	c3                   	ret
   1a87d:	cc                   	int3
   1a87e:	cc                   	int3
   1a87f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   1a880:	f6 06 01             	testb  $0x1,(%rsi)
   1a883:	0f 84 d3 00 00 00    	je     1a95c <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1a889:	f6 02 01             	testb  $0x1,(%rdx)
   1a88c:	0f 84 ca 00 00 00    	je     1a95c <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1a892:	41 57                	push   %r15
   1a894:	41 56                	push   %r14
   1a896:	41 55                	push   %r13
   1a898:	41 54                	push   %r12
   1a89a:	53                   	push   %rbx
   1a89b:	48 83 ec 20          	sub    $0x20,%rsp
   1a89f:	49 89 fc             	mov    %rdi,%r12
   1a8a2:	8b 5e 08             	mov    0x8(%rsi),%ebx
   1a8a5:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1a8ab:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a8af:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   1a8b3:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1a8b6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a8c0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a8c5:	e8 f6 00 00 00       	call   1a9c0 <<hyperinterval::ieee::Format>::add>
   1a8ca:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a8cf:	74 6b                	je     1a93c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a8d1:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1a8d6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a8db:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a8e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a8e5:	48 89 d9             	mov    %rbx,%rcx
   1a8e8:	4d 89 f0             	mov    %r14,%r8
   1a8eb:	e8 d0 00 00 00       	call   1a9c0 <<hyperinterval::ieee::Format>::add>
   1a8f0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a8f5:	74 45                	je     1a93c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a8f7:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1a8fb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a900:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a905:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a90a:	4c 89 f9             	mov    %r15,%rcx
   1a90d:	e8 8e e7 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1a912:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a917:	74 23                	je     1a93c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a919:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a91e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a923:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a928:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a92d:	48 89 d9             	mov    %rbx,%rcx
   1a930:	e8 6b e7 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1a935:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a93a:	75 27                	jne    1a963 <<hyperinterval::float::F32Enclosure>::add+0xe3>
   1a93c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a941:	41 88 44 24 04       	mov    %al,0x4(%r12)
   1a946:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   1a94d:	00 
   1a94e:	48 83 c4 20          	add    $0x20,%rsp
   1a952:	5b                   	pop    %rbx
   1a953:	41 5c                	pop    %r12
   1a955:	41 5d                	pop    %r13
   1a957:	41 5e                	pop    %r14
   1a959:	41 5f                	pop    %r15
   1a95b:	c3                   	ret
   1a95c:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
   1a962:	c3                   	ret
   1a963:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a967:	44 89 f1             	mov    %r14d,%ecx
   1a96a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a970:	89 c2                	mov    %eax,%edx
   1a972:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a978:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a97d:	29 ce                	sub    %ecx,%esi
   1a97f:	44 09 e9             	or     %r13d,%ecx
   1a982:	45 85 f6             	test   %r14d,%r14d
   1a985:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a989:	89 d1                	mov    %edx,%ecx
   1a98b:	44 09 e9             	or     %r13d,%ecx
   1a98e:	41 29 d5             	sub    %edx,%r13d
   1a991:	85 c0                	test   %eax,%eax
   1a993:	4c 0f 49 e9          	cmovns %rcx,%r13
   1a997:	44 39 ee             	cmp    %r13d,%esi
   1a99a:	76 08                	jbe    1a9a4 <<hyperinterval::float::F32Enclosure>::add+0x124>
   1a99c:	41 c6 44 24 04 01    	movb   $0x1,0x4(%r12)
   1a9a2:	eb a2                	jmp    1a946 <<hyperinterval::float::F32Enclosure>::add+0xc6>
   1a9a4:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
   1a9ab:	00 
   1a9ac:	45 89 74 24 04       	mov    %r14d,0x4(%r12)
   1a9b1:	41 89 44 24 08       	mov    %eax,0x8(%r12)
   1a9b6:	eb 96                	jmp    1a94e <<hyperinterval::float::F32Enclosure>::add+0xce>
   1a9b8:	cc                   	int3
   1a9b9:	cc                   	int3
   1a9ba:	cc                   	int3
   1a9bb:	cc                   	int3
   1a9bc:	cc                   	int3
   1a9bd:	cc                   	int3
   1a9be:	cc                   	int3
   1a9bf:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1a9c0:	48 85 c9             	test   %rcx,%rcx
   1a9c3:	74 50                	je     1aa15 <<hyperinterval::ieee::Format>::add+0x55>
   1a9c5:	48 89 c8             	mov    %rcx,%rax
   1a9c8:	4d 85 c0             	test   %r8,%r8
   1a9cb:	74 54                	je     1aa21 <<hyperinterval::ieee::Format>::add+0x61>
   1a9cd:	55                   	push   %rbp
   1a9ce:	41 57                	push   %r15
   1a9d0:	41 56                	push   %r14
   1a9d2:	41 55                	push   %r13
   1a9d4:	41 54                	push   %r12
   1a9d6:	53                   	push   %rbx
   1a9d7:	48 83 ec 38          	sub    $0x38,%rsp
   1a9db:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a9e0:	49 89 c7             	mov    %rax,%r15
   1a9e3:	49 21 d7             	and    %rdx,%r15
   1a9e6:	44 89 c9             	mov    %r9d,%ecx
   1a9e9:	49 d3 ef             	shr    %cl,%r15
   1a9ec:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   1a9f2:	49 d3 e5             	shl    %cl,%r13
   1a9f5:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   1a9f9:	49 89 de             	mov    %rbx,%r14
   1a9fc:	49 21 c6             	and    %rax,%r14
   1a9ff:	49 89 d2             	mov    %rdx,%r10
   1aa02:	49 d3 ea             	shr    %cl,%r10
   1aa05:	4d 85 ff             	test   %r15,%r15
   1aa08:	74 23                	je     1aa2d <<hyperinterval::ieee::Format>::add+0x6d>
   1aa0a:	4d 09 ee             	or     %r13,%r14
   1aa0d:	49 d1 ea             	shr    $1,%r10
   1aa10:	45 01 ca             	add    %r9d,%r10d
   1aa13:	eb 24                	jmp    1aa39 <<hyperinterval::ieee::Format>::add+0x79>
   1aa15:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   1aa19:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   1aa1d:	c6 07 00             	movb   $0x0,(%rdi)
   1aa20:	c3                   	ret
   1aa21:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1aa25:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1aa29:	c6 07 00             	movb   $0x0,(%rdi)
   1aa2c:	c3                   	ret
   1aa2d:	49 d1 ea             	shr    $1,%r10
   1aa30:	45 01 ca             	add    %r9d,%r10d
   1aa33:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1aa39:	45 29 d7             	sub    %r10d,%r15d
   1aa3c:	48 85 f0             	test   %rsi,%rax
   1aa3f:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1aa44:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1aa49:	49 0f bd ce          	bsr    %r14,%rcx
   1aa4d:	83 f1 3f             	xor    $0x3f,%ecx
   1aa50:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   1aa54:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   1aa58:	45 31 e4             	xor    %r12d,%r12d
   1aa5b:	44 89 d9             	mov    %r11d,%ecx
   1aa5e:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   1aa62:	49 d3 e6             	shl    %cl,%r14
   1aa65:	31 c9                	xor    %ecx,%ecx
   1aa67:	41 f6 c3 40          	test   $0x40,%r11b
   1aa6b:	4d 0f 45 e6          	cmovne %r14,%r12
   1aa6f:	4c 0f 45 f1          	cmovne %rcx,%r14
   1aa73:	4d 89 c2             	mov    %r8,%r10
   1aa76:	49 21 d2             	and    %rdx,%r10
   1aa79:	44 89 c9             	mov    %r9d,%ecx
   1aa7c:	49 d3 ea             	shr    %cl,%r10
   1aa7f:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   1aa83:	45 29 df             	sub    %r11d,%r15d
   1aa86:	4c 21 c3             	and    %r8,%rbx
   1aa89:	49 89 d3             	mov    %rdx,%r11
   1aa8c:	49 d3 eb             	shr    %cl,%r11
   1aa8f:	4d 85 d2             	test   %r10,%r10
   1aa92:	74 0b                	je     1aa9f <<hyperinterval::ieee::Format>::add+0xdf>
   1aa94:	4c 09 eb             	or     %r13,%rbx
   1aa97:	49 d1 eb             	shr    $1,%r11
   1aa9a:	45 01 cb             	add    %r9d,%r11d
   1aa9d:	eb 0c                	jmp    1aaab <<hyperinterval::ieee::Format>::add+0xeb>
   1aa9f:	49 d1 eb             	shr    $1,%r11
   1aaa2:	45 01 cb             	add    %r9d,%r11d
   1aaa5:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1aaab:	45 29 da             	sub    %r11d,%r10d
   1aaae:	49 85 f0             	test   %rsi,%r8
   1aab1:	41 0f 95 c3          	setne  %r11b
   1aab5:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1aaba:	48 0f bd cb          	bsr    %rbx,%rcx
   1aabe:	83 f1 3f             	xor    $0x3f,%ecx
   1aac1:	01 e9                	add    %ebp,%ecx
   1aac3:	83 c1 40             	add    $0x40,%ecx
   1aac6:	45 31 ed             	xor    %r13d,%r13d
   1aac9:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1aacd:	48 d3 e3             	shl    %cl,%rbx
   1aad0:	45 31 c9             	xor    %r9d,%r9d
   1aad3:	f6 c1 40             	test   $0x40,%cl
   1aad6:	4c 0f 45 eb          	cmovne %rbx,%r13
   1aada:	49 0f 45 d9          	cmovne %r9,%rbx
   1aade:	41 29 ca             	sub    %ecx,%r10d
   1aae1:	45 39 d7             	cmp    %r10d,%r15d
   1aae4:	7d 6d                	jge    1ab53 <<hyperinterval::ieee::Format>::add+0x193>
   1aae6:	44 89 f9             	mov    %r15d,%ecx
   1aae9:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   1aaef:	4c 89 f5             	mov    %r14,%rbp
   1aaf2:	4d 89 e1             	mov    %r12,%r9
   1aaf5:	4d 89 c6             	mov    %r8,%r14
   1aaf8:	45 89 dc             	mov    %r11d,%r12d
   1aafb:	41 29 ca             	sub    %ecx,%r10d
   1aafe:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1ab02:	7f 76                	jg     1ab7a <<hyperinterval::ieee::Format>::add+0x1ba>
   1ab04:	41 89 cb             	mov    %ecx,%r11d
   1ab07:	49 85 f0             	test   %rsi,%r8
   1ab0a:	41 0f 95 c0          	setne  %r8b
   1ab0e:	48 85 f0             	test   %rsi,%rax
   1ab11:	41 0f 95 c6          	setne  %r14b
   1ab15:	44 89 d1             	mov    %r10d,%ecx
   1ab18:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1ab1c:	48 d3 e3             	shl    %cl,%rbx
   1ab1f:	31 c0                	xor    %eax,%eax
   1ab21:	41 f6 c2 40          	test   $0x40,%r10b
   1ab25:	4c 0f 45 eb          	cmovne %rbx,%r13
   1ab29:	48 0f 44 c3          	cmove  %rbx,%rax
   1ab2d:	45 30 c6             	xor    %r8b,%r14b
   1ab30:	0f 84 95 00 00 00    	je     1abcb <<hyperinterval::ieee::Format>::add+0x20b>
   1ab36:	48 39 e8             	cmp    %rbp,%rax
   1ab39:	4c 89 e9             	mov    %r13,%rcx
   1ab3c:	4c 19 c9             	sbb    %r9,%rcx
   1ab3f:	0f 83 b8 00 00 00    	jae    1abfd <<hyperinterval::ieee::Format>::add+0x23d>
   1ab45:	48 29 c5             	sub    %rax,%rbp
   1ab48:	4d 19 e9             	sbb    %r13,%r9
   1ab4b:	45 89 fc             	mov    %r15d,%r12d
   1ab4e:	e9 b6 00 00 00       	jmp    1ac09 <<hyperinterval::ieee::Format>::add+0x249>
   1ab53:	44 89 d1             	mov    %r10d,%ecx
   1ab56:	48 89 dd             	mov    %rbx,%rbp
   1ab59:	4d 89 e9             	mov    %r13,%r9
   1ab5c:	4d 89 e5             	mov    %r12,%r13
   1ab5f:	4c 89 f3             	mov    %r14,%rbx
   1ab62:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   1ab68:	45 89 fa             	mov    %r15d,%r10d
   1ab6b:	45 89 df             	mov    %r11d,%r15d
   1ab6e:	49 89 c6             	mov    %rax,%r14
   1ab71:	41 29 ca             	sub    %ecx,%r10d
   1ab74:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1ab78:	7e 8a                	jle    1ab04 <<hyperinterval::ieee::Format>::add+0x144>
   1ab7a:	48 89 fb             	mov    %rdi,%rbx
   1ab7d:	4c 89 f0             	mov    %r14,%rax
   1ab80:	45 84 ff             	test   %r15b,%r15b
   1ab83:	74 4e                	je     1abd3 <<hyperinterval::ieee::Format>::add+0x213>
   1ab85:	48 31 f0             	xor    %rsi,%rax
   1ab88:	48 89 c1             	mov    %rax,%rcx
   1ab8b:	48 21 f1             	and    %rsi,%rcx
   1ab8e:	31 ff                	xor    %edi,%edi
   1ab90:	48 f7 d9             	neg    %rcx
   1ab93:	40 0f 93 c7          	setae  %dil
   1ab97:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1ab9b:	48 ff c9             	dec    %rcx
   1ab9e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1aba3:	49 89 f7             	mov    %rsi,%r15
   1aba6:	e8 f5 e4 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1abab:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1abb0:	75 44                	jne    1abf6 <<hyperinterval::ieee::Format>::add+0x236>
   1abb2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1abb7:	49 31 c7             	xor    %rax,%r15
   1abba:	48 85 c0             	test   %rax,%rax
   1abbd:	4c 0f 44 f8          	cmove  %rax,%r15
   1abc1:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1abc5:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1abc9:	eb 6b                	jmp    1ac36 <<hyperinterval::ieee::Format>::add+0x276>
   1abcb:	48 01 c5             	add    %rax,%rbp
   1abce:	4d 11 e9             	adc    %r13,%r9
   1abd1:	eb 36                	jmp    1ac09 <<hyperinterval::ieee::Format>::add+0x249>
   1abd3:	48 21 f0             	and    %rsi,%rax
   1abd6:	31 c9                	xor    %ecx,%ecx
   1abd8:	48 f7 d8             	neg    %rax
   1abdb:	0f 93 c1             	setae  %cl
   1abde:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   1abe2:	48 ff c9             	dec    %rcx
   1abe5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1abea:	e8 b1 e4 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1abef:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1abf4:	74 33                	je     1ac29 <<hyperinterval::ieee::Format>::add+0x269>
   1abf6:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1abfb:	eb 3c                	jmp    1ac39 <<hyperinterval::ieee::Format>::add+0x279>
   1abfd:	48 29 e8             	sub    %rbp,%rax
   1ac00:	4d 19 cd             	sbb    %r9,%r13
   1ac03:	48 89 c5             	mov    %rax,%rbp
   1ac06:	4d 89 e9             	mov    %r13,%r9
   1ac09:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   1ac0e:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
   1ac13:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1ac18:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
   1ac1d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1ac22:	e8 f9 e8 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1ac27:	eb 10                	jmp    1ac39 <<hyperinterval::ieee::Format>::add+0x279>
   1ac29:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ac2e:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1ac32:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ac36:	c6 03 00             	movb   $0x0,(%rbx)
   1ac39:	48 83 c4 38          	add    $0x38,%rsp
   1ac3d:	5b                   	pop    %rbx
   1ac3e:	41 5c                	pop    %r12
   1ac40:	41 5d                	pop    %r13
   1ac42:	41 5e                	pop    %r14
   1ac44:	41 5f                	pop    %r15
   1ac46:	5d                   	pop    %rbp
   1ac47:	c3                   	ret
   1ac48:	cc                   	int3
   1ac49:	cc                   	int3
   1ac4a:	cc                   	int3
   1ac4b:	cc                   	int3
   1ac4c:	cc                   	int3
   1ac4d:	cc                   	int3
   1ac4e:	cc                   	int3
   1ac4f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   1ac50:	83 3a 01             	cmpl   $0x1,(%rdx)
   1ac53:	0f 85 87 e4 ff ff    	jne    190e0 <<hyperinterval::float::F32Enclosure>::corner_image>
   1ac59:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1ac5d:	0f 8f 7d e4 ff ff    	jg     190e0 <<hyperinterval::float::F32Enclosure>::corner_image>
   1ac63:	8b 42 08             	mov    0x8(%rdx),%eax
   1ac66:	85 c0                	test   %eax,%eax
   1ac68:	0f 99 c1             	setns  %cl
   1ac6b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1ac70:	0f 94 c0             	sete   %al
   1ac73:	08 c8                	or     %cl,%al
   1ac75:	0f 84 65 e4 ff ff    	je     190e0 <<hyperinterval::float::F32Enclosure>::corner_image>
   1ac7b:	c6 47 04 04          	movb   $0x4,0x4(%rdi)
   1ac7f:	c7 07 02 00 00 00    	movl   $0x2,(%rdi)
   1ac85:	c3                   	ret
   1ac86:	cc                   	int3
   1ac87:	cc                   	int3
   1ac88:	cc                   	int3
   1ac89:	cc                   	int3
   1ac8a:	cc                   	int3
   1ac8b:	cc                   	int3
   1ac8c:	cc                   	int3
   1ac8d:	cc                   	int3
   1ac8e:	cc                   	int3
   1ac8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   1ac90:	f6 02 01             	testb  $0x1,(%rdx)
   1ac93:	74 29                	je     1acbe <<hyperinterval::float::F32Enclosure>::sub+0x2e>
   1ac95:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1ac9a:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1ac9e:	66 0f 6f 15 1a 86 fe 	movdqa -0x179e6(%rip),%xmm2        # 32c0 <__abi_tag+0x2fc4>
   1aca5:	ff 
   1aca6:	66 0f ef d0          	pxor   %xmm0,%xmm2
   1acaa:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   1acae:	66 0f df ca          	pandn  %xmm2,%xmm1
   1acb2:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1acb7:	b8 01 00 00 00       	mov    $0x1,%eax
   1acbc:	eb 02                	jmp    1acc0 <<hyperinterval::float::F32Enclosure>::sub+0x30>
   1acbe:	31 c0                	xor    %eax,%eax
   1acc0:	48 83 ec 18          	sub    $0x18,%rsp
   1acc4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
   1acc8:	66 0f d6 44 24 10    	movq   %xmm0,0x10(%rsp)
   1acce:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
   1acd3:	e8 a8 fb ff ff       	call   1a880 <<hyperinterval::float::F32Enclosure>::add>
   1acd8:	48 83 c4 18          	add    $0x18,%rsp
   1acdc:	c3                   	ret
   1acdd:	cc                   	int3
   1acde:	cc                   	int3
   1acdf:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1ace0:	55                   	push   %rbp
   1ace1:	41 57                	push   %r15
   1ace3:	41 56                	push   %r14
   1ace5:	41 55                	push   %r13
   1ace7:	41 54                	push   %r12
   1ace9:	53                   	push   %rbx
   1acea:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1acf1:	49 89 ca             	mov    %rcx,%r10
   1acf4:	48 89 d3             	mov    %rdx,%rbx
   1acf7:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1acfc:	4d 89 d4             	mov    %r10,%r12
   1acff:	49 21 d4             	and    %rdx,%r12
   1ad02:	49 d3 ec             	shr    %cl,%r12
   1ad05:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1ad0b:	49 d3 e7             	shl    %cl,%r15
   1ad0e:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1ad12:	4c 89 f2             	mov    %r14,%rdx
   1ad15:	4c 21 d2             	and    %r10,%rdx
   1ad18:	48 89 d8             	mov    %rbx,%rax
   1ad1b:	48 d3 e8             	shr    %cl,%rax
   1ad1e:	4d 85 e4             	test   %r12,%r12
   1ad21:	74 0a                	je     1ad2d <<hyperinterval::ieee::Format>::affine+0x4d>
   1ad23:	4c 09 fa             	or     %r15,%rdx
   1ad26:	48 d1 e8             	shr    $1,%rax
   1ad29:	01 c8                	add    %ecx,%eax
   1ad2b:	eb 0b                	jmp    1ad38 <<hyperinterval::ieee::Format>::affine+0x58>
   1ad2d:	48 d1 e8             	shr    $1,%rax
   1ad30:	01 c8                	add    %ecx,%eax
   1ad32:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1ad38:	41 29 c4             	sub    %eax,%r12d
   1ad3b:	4d 89 c3             	mov    %r8,%r11
   1ad3e:	49 21 db             	and    %rbx,%r11
   1ad41:	49 d3 eb             	shr    %cl,%r11
   1ad44:	4c 89 f0             	mov    %r14,%rax
   1ad47:	4c 21 c0             	and    %r8,%rax
   1ad4a:	49 89 dd             	mov    %rbx,%r13
   1ad4d:	49 d3 ed             	shr    %cl,%r13
   1ad50:	4d 85 db             	test   %r11,%r11
   1ad53:	74 0b                	je     1ad60 <<hyperinterval::ieee::Format>::affine+0x80>
   1ad55:	4c 09 f8             	or     %r15,%rax
   1ad58:	49 d1 ed             	shr    $1,%r13
   1ad5b:	41 01 cd             	add    %ecx,%r13d
   1ad5e:	eb 0c                	jmp    1ad6c <<hyperinterval::ieee::Format>::affine+0x8c>
   1ad60:	49 d1 ed             	shr    $1,%r13
   1ad63:	41 01 cd             	add    %ecx,%r13d
   1ad66:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1ad6c:	45 29 eb             	sub    %r13d,%r11d
   1ad6f:	49 85 f2             	test   %rsi,%r10
   1ad72:	41 0f 95 c2          	setne  %r10b
   1ad76:	49 85 f0             	test   %rsi,%r8
   1ad79:	41 0f 95 c0          	setne  %r8b
   1ad7d:	48 f7 e2             	mul    %rdx
   1ad80:	45 30 d0             	xor    %r10b,%r8b
   1ad83:	45 01 e3             	add    %r12d,%r11d
   1ad86:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1ad8b:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1ad90:	4d 89 ca             	mov    %r9,%r10
   1ad93:	49 21 da             	and    %rbx,%r10
   1ad96:	49 d3 ea             	shr    %cl,%r10
   1ad99:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1ad9e:	44 89 5c 24 60       	mov    %r11d,0x60(%rsp)
   1ada3:	4d 21 ce             	and    %r9,%r14
   1ada6:	4d 85 d2             	test   %r10,%r10
   1ada9:	74 14                	je     1adbf <<hyperinterval::ieee::Format>::affine+0xdf>
   1adab:	49 89 dc             	mov    %rbx,%r12
   1adae:	49 d3 ec             	shr    %cl,%r12
   1adb1:	4d 09 fe             	or     %r15,%r14
   1adb4:	49 d1 ec             	shr    $1,%r12
   1adb7:	41 01 cc             	add    %ecx,%r12d
   1adba:	45 29 e2             	sub    %r12d,%r10d
   1adbd:	eb 15                	jmp    1add4 <<hyperinterval::ieee::Format>::affine+0xf4>
   1adbf:	49 89 df             	mov    %rbx,%r15
   1adc2:	49 d3 ef             	shr    %cl,%r15
   1adc5:	49 d1 ef             	shr    $1,%r15
   1adc8:	41 01 cf             	add    %ecx,%r15d
   1adcb:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1add1:	45 29 fa             	sub    %r15d,%r10d
   1add4:	49 85 f1             	test   %rsi,%r9
   1add7:	40 0f 95 c5          	setne  %bpl
   1addb:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1ade2:	00 
   1ade3:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
   1ade8:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1adef:	00 00 
   1adf1:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1adf8:	00 
   1adf9:	48 89 c1             	mov    %rax,%rcx
   1adfc:	48 09 d1             	or     %rdx,%rcx
   1adff:	74 7b                	je     1ae7c <<hyperinterval::ieee::Format>::affine+0x19c>
   1ae01:	4d 85 f6             	test   %r14,%r14
   1ae04:	74 7d                	je     1ae83 <<hyperinterval::ieee::Format>::affine+0x1a3>
   1ae06:	40 88 6c 24 07       	mov    %bpl,0x7(%rsp)
   1ae0b:	48 0f bd ca          	bsr    %rdx,%rcx
   1ae0f:	83 f1 3f             	xor    $0x3f,%ecx
   1ae12:	4c 0f bd e0          	bsr    %rax,%r12
   1ae16:	41 83 f4 3f          	xor    $0x3f,%r12d
   1ae1a:	41 83 cc 40          	or     $0x40,%r12d
   1ae1e:	48 85 d2             	test   %rdx,%rdx
   1ae21:	44 0f 45 e1          	cmovne %ecx,%r12d
   1ae25:	41 83 f4 7f          	xor    $0x7f,%r12d
   1ae29:	45 01 dc             	add    %r11d,%r12d
   1ae2c:	4d 0f bd fe          	bsr    %r14,%r15
   1ae30:	41 83 f7 3f          	xor    $0x3f,%r15d
   1ae34:	41 83 cf 40          	or     $0x40,%r15d
   1ae38:	41 83 f7 7f          	xor    $0x7f,%r15d
   1ae3c:	45 01 d7             	add    %r10d,%r15d
   1ae3f:	45 39 e7             	cmp    %r12d,%r15d
   1ae42:	45 0f 4e fc          	cmovle %r12d,%r15d
   1ae46:	41 83 c7 82          	add    $0xffffff82,%r15d
   1ae4a:	45 29 fb             	sub    %r15d,%r11d
   1ae4d:	78 46                	js     1ae95 <<hyperinterval::ieee::Format>::affine+0x1b5>
   1ae4f:	44 89 d9             	mov    %r11d,%ecx
   1ae52:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1ae56:	48 d3 e0             	shl    %cl,%rax
   1ae59:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1ae60:	00 00 
   1ae62:	41 f6 c3 40          	test   $0x40,%r11b
   1ae66:	48 0f 45 d0          	cmovne %rax,%rdx
   1ae6a:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1ae70:	4c 0f 44 e8          	cmove  %rax,%r13
   1ae74:	48 89 d5             	mov    %rdx,%rbp
   1ae77:	e9 98 00 00 00       	jmp    1af14 <<hyperinterval::ieee::Format>::affine+0x234>
   1ae7c:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1ae81:	eb 05                	jmp    1ae88 <<hyperinterval::ieee::Format>::affine+0x1a8>
   1ae83:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1ae88:	48 89 da             	mov    %rbx,%rdx
   1ae8b:	e8 90 e6 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1ae90:	e9 fa 01 00 00       	jmp    1b08f <<hyperinterval::ieee::Format>::affine+0x3af>
   1ae95:	41 f7 db             	neg    %r11d
   1ae98:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1ae9e:	bd 00 00 00 00       	mov    $0x0,%ebp
   1aea3:	41 83 fb 7f          	cmp    $0x7f,%r11d
   1aea7:	7f 5d                	jg     1af06 <<hyperinterval::ieee::Format>::affine+0x226>
   1aea9:	49 89 c5             	mov    %rax,%r13
   1aeac:	44 89 d9             	mov    %r11d,%ecx
   1aeaf:	49 0f ad d5          	shrd   %cl,%rdx,%r13
   1aeb3:	48 89 d5             	mov    %rdx,%rbp
   1aeb6:	48 d3 ed             	shr    %cl,%rbp
   1aeb9:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1aec0:	49 d3 e4             	shl    %cl,%r12
   1aec3:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1aeca:	41 f6 c3 40          	test   $0x40,%r11b
   1aece:	4c 0f 45 ed          	cmovne %rbp,%r13
   1aed2:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1aed8:	49 0f 45 eb          	cmovne %r11,%rbp
   1aedc:	49 0f 45 cc          	cmovne %r12,%rcx
   1aee0:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1aee6:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1aeeb:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1aef1:	4d 0f 45 e3          	cmovne %r11,%r12
   1aef5:	49 f7 d4             	not    %r12
   1aef8:	48 f7 d1             	not    %rcx
   1aefb:	48 21 d1             	and    %rdx,%rcx
   1aefe:	49 21 c4             	and    %rax,%r12
   1af01:	49 09 cc             	or     %rcx,%r12
   1af04:	74 0e                	je     1af14 <<hyperinterval::ieee::Format>::affine+0x234>
   1af06:	41 0f b6 c0          	movzbl %r8b,%eax
   1af0a:	f7 d8                	neg    %eax
   1af0c:	83 c8 01             	or     $0x1,%eax
   1af0f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1af14:	45 29 fa             	sub    %r15d,%r10d
   1af17:	78 20                	js     1af39 <<hyperinterval::ieee::Format>::affine+0x259>
   1af19:	31 d2                	xor    %edx,%edx
   1af1b:	44 89 d1             	mov    %r10d,%ecx
   1af1e:	4c 0f a5 f2          	shld   %cl,%r14,%rdx
   1af22:	49 d3 e6             	shl    %cl,%r14
   1af25:	45 31 e4             	xor    %r12d,%r12d
   1af28:	41 f6 c2 40          	test   $0x40,%r10b
   1af2c:	49 0f 45 d6          	cmovne %r14,%rdx
   1af30:	4d 0f 45 f4          	cmovne %r12,%r14
   1af34:	4c 89 f0             	mov    %r14,%rax
   1af37:	eb 59                	jmp    1af92 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1af39:	41 f7 da             	neg    %r10d
   1af3c:	45 31 e4             	xor    %r12d,%r12d
   1af3f:	b8 00 00 00 00       	mov    $0x0,%eax
   1af44:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1af48:	7f 2d                	jg     1af77 <<hyperinterval::ieee::Format>::affine+0x297>
   1af4a:	4c 89 f0             	mov    %r14,%rax
   1af4d:	44 89 d1             	mov    %r10d,%ecx
   1af50:	4c 0f ad e0          	shrd   %cl,%r12,%rax
   1af54:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1af5b:	49 d3 e3             	shl    %cl,%r11
   1af5e:	41 f6 c2 40          	test   $0x40,%r10b
   1af62:	49 0f 45 c4          	cmovne %r12,%rax
   1af66:	4d 0f 45 dc          	cmovne %r12,%r11
   1af6a:	49 f7 d3             	not    %r11
   1af6d:	ba 00 00 00 00       	mov    $0x0,%edx
   1af72:	4d 85 f3             	test   %r14,%r11
   1af75:	74 1b                	je     1af92 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1af77:	4c 89 e2             	mov    %r12,%rdx
   1af7a:	4c 89 c9             	mov    %r9,%rcx
   1af7d:	48 21 f1             	and    %rsi,%rcx
   1af80:	45 31 d2             	xor    %r10d,%r10d
   1af83:	48 f7 d9             	neg    %rcx
   1af86:	41 0f 93 c2          	setae  %r10b
   1af8a:	46 8d 24 55 ff ff ff 	lea    -0x1(,%r10,2),%r12d
   1af91:	ff 
   1af92:	49 85 f1             	test   %rsi,%r9
   1af95:	0f 95 c1             	setne  %cl
   1af98:	41 38 c8             	cmp    %cl,%r8b
   1af9b:	49 89 fe             	mov    %rdi,%r14
   1af9e:	74 19                	je     1afb9 <<hyperinterval::ieee::Format>::affine+0x2d9>
   1afa0:	49 39 c5             	cmp    %rax,%r13
   1afa3:	48 89 e9             	mov    %rbp,%rcx
   1afa6:	48 19 d1             	sbb    %rdx,%rcx
   1afa9:	73 16                	jae    1afc1 <<hyperinterval::ieee::Format>::affine+0x2e1>
   1afab:	4c 29 e8             	sub    %r13,%rax
   1afae:	48 19 ea             	sbb    %rbp,%rdx
   1afb1:	44 0f b6 44 24 07    	movzbl 0x7(%rsp),%r8d
   1afb7:	eb 14                	jmp    1afcd <<hyperinterval::ieee::Format>::affine+0x2ed>
   1afb9:	4c 01 e8             	add    %r13,%rax
   1afbc:	48 11 ea             	adc    %rbp,%rdx
   1afbf:	eb 0c                	jmp    1afcd <<hyperinterval::ieee::Format>::affine+0x2ed>
   1afc1:	49 29 c5             	sub    %rax,%r13
   1afc4:	48 19 d5             	sbb    %rdx,%rbp
   1afc7:	4c 89 e8             	mov    %r13,%rax
   1afca:	48 89 ea             	mov    %rbp,%rdx
   1afcd:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1afd2:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1afd7:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1afdc:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1afe1:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1afe6:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1afeb:	49 89 f5             	mov    %rsi,%r13
   1afee:	48 89 da             	mov    %rbx,%rdx
   1aff1:	e8 2a e5 ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1aff6:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1affb:	75 12                	jne    1b00f <<hyperinterval::ieee::Format>::affine+0x32f>
   1affd:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1b002:	41 88 46 01          	mov    %al,0x1(%r14)
   1b006:	41 c6 06 01          	movb   $0x1,(%r14)
   1b00a:	e9 80 00 00 00       	jmp    1b08f <<hyperinterval::ieee::Format>::affine+0x3af>
   1b00f:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1b014:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1b019:	49 39 c7             	cmp    %rax,%r15
   1b01c:	4c 89 f1             	mov    %r14,%rcx
   1b01f:	75 63                	jne    1b084 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1b021:	44 03 64 24 08       	add    0x8(%rsp),%r12d
   1b026:	41 83 fc 01          	cmp    $0x1,%r12d
   1b02a:	74 75                	je     1b0a1 <<hyperinterval::ieee::Format>::affine+0x3c1>
   1b02c:	41 83 fc ff          	cmp    $0xffffffff,%r12d
   1b030:	75 52                	jne    1b084 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1b032:	4c 89 f8             	mov    %r15,%rax
   1b035:	4c 89 ee             	mov    %r13,%rsi
   1b038:	4c 31 e8             	xor    %r13,%rax
   1b03b:	4d 85 ff             	test   %r15,%r15
   1b03e:	49 0f 44 c7          	cmove  %r15,%rax
   1b042:	48 89 c1             	mov    %rax,%rcx
   1b045:	4c 21 e9             	and    %r13,%rcx
   1b048:	31 d2                	xor    %edx,%edx
   1b04a:	48 f7 d9             	neg    %rcx
   1b04d:	0f 93 c2             	setae  %dl
   1b050:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1b054:	48 ff c9             	dec    %rcx
   1b057:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1b05c:	48 89 da             	mov    %rbx,%rdx
   1b05f:	e8 3c e0 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b064:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1b069:	75 62                	jne    1b0cd <<hyperinterval::ieee::Format>::affine+0x3ed>
   1b06b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b070:	49 31 c5             	xor    %rax,%r13
   1b073:	48 85 c0             	test   %rax,%rax
   1b076:	4c 0f 44 e8          	cmove  %rax,%r13
   1b07a:	4d 89 6e 08          	mov    %r13,0x8(%r14)
   1b07e:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1b082:	eb 5e                	jmp    1b0e2 <<hyperinterval::ieee::Format>::affine+0x402>
   1b084:	4c 89 79 08          	mov    %r15,0x8(%rcx)
   1b088:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1b08c:	c6 01 00             	movb   $0x0,(%rcx)
   1b08f:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1b096:	5b                   	pop    %rbx
   1b097:	41 5c                	pop    %r12
   1b099:	41 5d                	pop    %r13
   1b09b:	41 5e                	pop    %r14
   1b09d:	41 5f                	pop    %r15
   1b09f:	5d                   	pop    %rbp
   1b0a0:	c3                   	ret
   1b0a1:	4c 89 ee             	mov    %r13,%rsi
   1b0a4:	4c 89 f8             	mov    %r15,%rax
   1b0a7:	4c 21 e8             	and    %r13,%rax
   1b0aa:	31 c9                	xor    %ecx,%ecx
   1b0ac:	48 f7 d8             	neg    %rax
   1b0af:	0f 93 c1             	setae  %cl
   1b0b2:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1b0b6:	48 ff c9             	dec    %rcx
   1b0b9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1b0be:	48 89 da             	mov    %rbx,%rdx
   1b0c1:	e8 da df ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b0c6:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1b0cb:	74 08                	je     1b0d5 <<hyperinterval::ieee::Format>::affine+0x3f5>
   1b0cd:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1b0d3:	eb ba                	jmp    1b08f <<hyperinterval::ieee::Format>::affine+0x3af>
   1b0d5:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1b0da:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1b0de:	49 89 46 10          	mov    %rax,0x10(%r14)
   1b0e2:	41 c6 06 00          	movb   $0x0,(%r14)
   1b0e6:	eb a7                	jmp    1b08f <<hyperinterval::ieee::Format>::affine+0x3af>
   1b0e8:	cc                   	int3
   1b0e9:	cc                   	int3
   1b0ea:	cc                   	int3
   1b0eb:	cc                   	int3
   1b0ec:	cc                   	int3
   1b0ed:	cc                   	int3
   1b0ee:	cc                   	int3
   1b0ef:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1b0f0:	83 3f 00             	cmpl   $0x0,(%rdi)
   1b0f3:	b0 01                	mov    $0x1,%al
   1b0f5:	0f 84 a3 00 00 00    	je     1b19e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1b0fb:	8b 0e                	mov    (%rsi),%ecx
   1b0fd:	85 c9                	test   %ecx,%ecx
   1b0ff:	0f 84 99 00 00 00    	je     1b19e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1b105:	f6 c1 01             	test   $0x1,%cl
   1b108:	74 4c                	je     1b156 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1b10a:	53                   	push   %rbx
   1b10b:	8b 56 04             	mov    0x4(%rsi),%edx
   1b10e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1b112:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1b118:	45 89 c2             	mov    %r8d,%r10d
   1b11b:	45 09 ca             	or     %r9d,%r10d
   1b11e:	45 89 c3             	mov    %r8d,%r11d
   1b121:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1b128:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1b12d:	44 29 db             	sub    %r11d,%ebx
   1b130:	45 85 c0             	test   %r8d,%r8d
   1b133:	49 0f 49 da          	cmovns %r10,%rbx
   1b137:	41 89 d0             	mov    %edx,%r8d
   1b13a:	45 09 c8             	or     %r9d,%r8d
   1b13d:	41 89 d2             	mov    %edx,%r10d
   1b140:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1b147:	45 29 d1             	sub    %r10d,%r9d
   1b14a:	85 d2                	test   %edx,%edx
   1b14c:	4d 0f 49 c8          	cmovns %r8,%r9
   1b150:	44 39 cb             	cmp    %r9d,%ebx
   1b153:	5b                   	pop    %rbx
   1b154:	72 48                	jb     1b19e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1b156:	f6 c1 01             	test   $0x1,%cl
   1b159:	75 03                	jne    1b15e <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1b15b:	31 c0                	xor    %eax,%eax
   1b15d:	c3                   	ret
   1b15e:	8b 47 04             	mov    0x4(%rdi),%eax
   1b161:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1b164:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1b169:	89 ce                	mov    %ecx,%esi
   1b16b:	09 d6                	or     %edx,%esi
   1b16d:	89 cf                	mov    %ecx,%edi
   1b16f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1b175:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1b17b:	41 29 f8             	sub    %edi,%r8d
   1b17e:	85 c9                	test   %ecx,%ecx
   1b180:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b184:	89 c1                	mov    %eax,%ecx
   1b186:	09 d1                	or     %edx,%ecx
   1b188:	89 c6                	mov    %eax,%esi
   1b18a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1b190:	29 f2                	sub    %esi,%edx
   1b192:	85 c0                	test   %eax,%eax
   1b194:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b198:	41 39 d0             	cmp    %edx,%r8d
   1b19b:	0f 92 c0             	setb   %al
   1b19e:	c3                   	ret
   1b19f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1b1a0:	31 c0                	xor    %eax,%eax
   1b1a2:	83 3f 00             	cmpl   $0x0,(%rdi)
   1b1a5:	0f 84 a1 00 00 00    	je     1b24c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1b1ab:	8b 0e                	mov    (%rsi),%ecx
   1b1ad:	85 c9                	test   %ecx,%ecx
   1b1af:	0f 84 97 00 00 00    	je     1b24c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1b1b5:	f6 c1 01             	test   $0x1,%cl
   1b1b8:	74 4b                	je     1b205 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1b1ba:	8b 46 04             	mov    0x4(%rsi),%eax
   1b1bd:	8b 57 08             	mov    0x8(%rdi),%edx
   1b1c0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1b1c6:	41 89 d1             	mov    %edx,%r9d
   1b1c9:	45 09 c1             	or     %r8d,%r9d
   1b1cc:	41 89 d2             	mov    %edx,%r10d
   1b1cf:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1b1d6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1b1dc:	45 29 d3             	sub    %r10d,%r11d
   1b1df:	85 d2                	test   %edx,%edx
   1b1e1:	4d 0f 49 d9          	cmovns %r9,%r11
   1b1e5:	89 c2                	mov    %eax,%edx
   1b1e7:	44 09 c2             	or     %r8d,%edx
   1b1ea:	41 89 c1             	mov    %eax,%r9d
   1b1ed:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1b1f4:	45 29 c8             	sub    %r9d,%r8d
   1b1f7:	85 c0                	test   %eax,%eax
   1b1f9:	4c 0f 49 c2          	cmovns %rdx,%r8
   1b1fd:	45 39 c3             	cmp    %r8d,%r11d
   1b200:	73 03                	jae    1b205 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1b202:	31 c0                	xor    %eax,%eax
   1b204:	c3                   	ret
   1b205:	b0 01                	mov    $0x1,%al
   1b207:	f6 c1 01             	test   $0x1,%cl
   1b20a:	74 40                	je     1b24c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1b20c:	8b 47 04             	mov    0x4(%rdi),%eax
   1b20f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1b212:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1b217:	89 ce                	mov    %ecx,%esi
   1b219:	09 d6                	or     %edx,%esi
   1b21b:	89 cf                	mov    %ecx,%edi
   1b21d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1b223:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1b229:	41 29 f8             	sub    %edi,%r8d
   1b22c:	85 c9                	test   %ecx,%ecx
   1b22e:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b232:	89 c1                	mov    %eax,%ecx
   1b234:	09 d1                	or     %edx,%ecx
   1b236:	89 c6                	mov    %eax,%esi
   1b238:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1b23e:	29 f2                	sub    %esi,%edx
   1b240:	85 c0                	test   %eax,%eax
   1b242:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b246:	41 39 d0             	cmp    %edx,%r8d
   1b249:	0f 93 c0             	setae  %al
   1b24c:	c3                   	ret
   1b24d:	cc                   	int3
   1b24e:	cc                   	int3
   1b24f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::max_image:
   1b250:	31 c0                	xor    %eax,%eax
   1b252:	f6 06 01             	testb  $0x1,(%rsi)
   1b255:	0f 84 db 00 00 00    	je     1b336 <<hyperinterval::float::F32Enclosure>::max_image+0xe6>
   1b25b:	f6 02 01             	testb  $0x1,(%rdx)
   1b25e:	0f 84 ca 00 00 00    	je     1b32e <<hyperinterval::float::F32Enclosure>::max_image+0xde>
   1b264:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1b269:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1b26e:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1b272:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1b276:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1b27a:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1b27e:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1b282:	66 0f 6f 1d 06 82 fe 	movdqa -0x17dfa(%rip),%xmm3        # 3490 <__abi_tag+0x3194>
   1b289:	ff 
   1b28a:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1b28e:	66 0f eb f3          	por    %xmm3,%xmm6
   1b292:	66 0f 6f 3d c6 7f fe 	movdqa -0x1803a(%rip),%xmm7        # 3260 <__abi_tag+0x2f64>
   1b299:	ff 
   1b29a:	66 0f db e7          	pand   %xmm7,%xmm4
   1b29e:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1b2a3:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1b2a8:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1b2ad:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1b2b2:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1b2b7:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1b2bc:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1b2c1:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1b2c6:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1b2ca:	66 0f eb e3          	por    %xmm3,%xmm4
   1b2ce:	66 0f db ef          	pand   %xmm7,%xmm5
   1b2d2:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1b2d6:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1b2da:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1b2df:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1b2e3:	66 0f db f2          	pand   %xmm2,%xmm6
   1b2e7:	66 0f df d4          	pandn  %xmm4,%xmm2
   1b2eb:	66 0f eb d6          	por    %xmm6,%xmm2
   1b2ef:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1b2f4:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1b2f8:	66 0f 6f da          	movdqa %xmm2,%xmm3
   1b2fc:	66 41 0f 66 d9       	pcmpgtd %xmm9,%xmm3
   1b301:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1b306:	66 41 0f 76 d1       	pcmpeqd %xmm9,%xmm2
   1b30b:	66 0f 70 ea fd       	pshufd $0xfd,%xmm2,%xmm5
   1b310:	66 0f db ec          	pand   %xmm4,%xmm5
   1b314:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1b319:	66 0f eb d5          	por    %xmm5,%xmm2
   1b31d:	66 0f db c2          	pand   %xmm2,%xmm0
   1b321:	66 0f df d1          	pandn  %xmm1,%xmm2
   1b325:	66 0f eb d0          	por    %xmm0,%xmm2
   1b329:	b8 01 00 00 00       	mov    $0x1,%eax
   1b32e:	89 07                	mov    %eax,(%rdi)
   1b330:	66 0f d6 57 04       	movq   %xmm2,0x4(%rdi)
   1b335:	c3                   	ret
   1b336:	89 07                	mov    %eax,(%rdi)
   1b338:	0f 13 57 04          	movlps %xmm2,0x4(%rdi)
   1b33c:	c3                   	ret
   1b33d:	cc                   	int3
   1b33e:	cc                   	int3
   1b33f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::min_image:
   1b340:	31 c0                	xor    %eax,%eax
   1b342:	f6 06 01             	testb  $0x1,(%rsi)
   1b345:	0f 84 dc 00 00 00    	je     1b427 <<hyperinterval::float::F32Enclosure>::min_image+0xe7>
   1b34b:	f6 02 01             	testb  $0x1,(%rdx)
   1b34e:	0f 84 cb 00 00 00    	je     1b41f <<hyperinterval::float::F32Enclosure>::min_image+0xdf>
   1b354:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1b359:	f3 0f 7e 4e 04       	movq   0x4(%rsi),%xmm1
   1b35e:	66 0f ef d2          	pxor   %xmm2,%xmm2
   1b362:	66 0f 6f e1          	movdqa %xmm1,%xmm4
   1b366:	66 0f 62 e2          	punpckldq %xmm2,%xmm4
   1b36a:	66 0f 6f e8          	movdqa %xmm0,%xmm5
   1b36e:	66 0f 62 ea          	punpckldq %xmm2,%xmm5
   1b372:	66 0f 6f 1d 16 81 fe 	movdqa -0x17eea(%rip),%xmm3        # 3490 <__abi_tag+0x3194>
   1b379:	ff 
   1b37a:	66 0f 6f f4          	movdqa %xmm4,%xmm6
   1b37e:	66 0f eb f3          	por    %xmm3,%xmm6
   1b382:	66 0f 6f 3d d6 7e fe 	movdqa -0x1812a(%rip),%xmm7        # 3260 <__abi_tag+0x2f64>
   1b389:	ff 
   1b38a:	66 0f db e7          	pand   %xmm7,%xmm4
   1b38e:	66 44 0f 6f c3       	movdqa %xmm3,%xmm8
   1b393:	66 44 0f fb c4       	psubq  %xmm4,%xmm8
   1b398:	66 0f 70 e1 50       	pshufd $0x50,%xmm1,%xmm4
   1b39d:	66 45 0f ef c9       	pxor   %xmm9,%xmm9
   1b3a2:	66 44 0f 66 cc       	pcmpgtd %xmm4,%xmm9
   1b3a7:	66 45 0f db c1       	pand   %xmm9,%xmm8
   1b3ac:	66 44 0f df ce       	pandn  %xmm6,%xmm9
   1b3b1:	66 45 0f eb c8       	por    %xmm8,%xmm9
   1b3b6:	66 0f 6f e5          	movdqa %xmm5,%xmm4
   1b3ba:	66 0f eb e3          	por    %xmm3,%xmm4
   1b3be:	66 0f db ef          	pand   %xmm7,%xmm5
   1b3c2:	66 0f 6f f3          	movdqa %xmm3,%xmm6
   1b3c6:	66 0f fb f5          	psubq  %xmm5,%xmm6
   1b3ca:	66 0f 70 e8 50       	pshufd $0x50,%xmm0,%xmm5
   1b3cf:	66 0f 66 d5          	pcmpgtd %xmm5,%xmm2
   1b3d3:	66 0f db f2          	pand   %xmm2,%xmm6
   1b3d7:	66 0f df d4          	pandn  %xmm4,%xmm2
   1b3db:	66 0f eb d6          	por    %xmm6,%xmm2
   1b3df:	66 0f ef d3          	pxor   %xmm3,%xmm2
   1b3e3:	66 44 0f ef cb       	pxor   %xmm3,%xmm9
   1b3e8:	66 41 0f 6f d9       	movdqa %xmm9,%xmm3
   1b3ed:	66 0f 66 da          	pcmpgtd %xmm2,%xmm3
   1b3f1:	66 0f 70 e3 e8       	pshufd $0xe8,%xmm3,%xmm4
   1b3f6:	66 44 0f 76 ca       	pcmpeqd %xmm2,%xmm9
   1b3fb:	66 41 0f 70 e9 fd    	pshufd $0xfd,%xmm9,%xmm5
   1b401:	66 0f db ec          	pand   %xmm4,%xmm5
   1b405:	66 0f 70 d3 fd       	pshufd $0xfd,%xmm3,%xmm2
   1b40a:	66 0f eb d5          	por    %xmm5,%xmm2
   1b40e:	66 0f db c2          	pand   %xmm2,%xmm0
   1b412:	66 0f df d1          	pandn  %xmm1,%xmm2
   1b416:	66 0f eb d0          	por    %xmm0,%xmm2
   1b41a:	b8 01 00 00 00       	mov    $0x1,%eax
   1b41f:	89 07                	mov    %eax,(%rdi)
   1b421:	66 0f d6 57 04       	movq   %xmm2,0x4(%rdi)
   1b426:	c3                   	ret
   1b427:	89 07                	mov    %eax,(%rdi)
   1b429:	0f 13 57 04          	movlps %xmm2,0x4(%rdi)
   1b42d:	c3                   	ret
   1b42e:	cc                   	int3
   1b42f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1b430:	b0 01                	mov    $0x1,%al
   1b432:	f6 07 01             	testb  $0x1,(%rdi)
   1b435:	74 50                	je     1b487 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1b437:	f6 06 01             	testb  $0x1,(%rsi)
   1b43a:	74 49                	je     1b485 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1b43c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1b43f:	8b 56 04             	mov    0x4(%rsi),%edx
   1b442:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1b447:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1b44b:	41 89 d1             	mov    %edx,%r9d
   1b44e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1b455:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1b45b:	45 29 ca             	sub    %r9d,%r10d
   1b45e:	85 d2                	test   %edx,%edx
   1b460:	4d 0f 49 d0          	cmovns %r8,%r10
   1b464:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1b467:	41 89 c8             	mov    %ecx,%r8d
   1b46a:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1b471:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1b477:	45 29 c1             	sub    %r8d,%r9d
   1b47a:	85 c9                	test   %ecx,%ecx
   1b47c:	4c 0f 49 ca          	cmovns %rdx,%r9
   1b480:	45 39 ca             	cmp    %r9d,%r10d
   1b483:	76 03                	jbe    1b488 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1b485:	31 c0                	xor    %eax,%eax
   1b487:	c3                   	ret
   1b488:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1b48b:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1b48e:	89 cf                	mov    %ecx,%edi
   1b490:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1b496:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1b49c:	41 29 f8             	sub    %edi,%r8d
   1b49f:	85 c9                	test   %ecx,%ecx
   1b4a1:	4c 0f 49 c2          	cmovns %rdx,%r8
   1b4a5:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1b4a8:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1b4ab:	89 ce                	mov    %ecx,%esi
   1b4ad:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1b4b3:	29 f0                	sub    %esi,%eax
   1b4b5:	85 c9                	test   %ecx,%ecx
   1b4b7:	48 0f 49 c2          	cmovns %rdx,%rax
   1b4bb:	41 39 c0             	cmp    %eax,%r8d
   1b4be:	0f 96 c0             	setbe  %al
   1b4c1:	c3                   	ret
   1b4c2:	cc                   	int3
   1b4c3:	cc                   	int3
   1b4c4:	cc                   	int3
   1b4c5:	cc                   	int3
   1b4c6:	cc                   	int3
   1b4c7:	cc                   	int3
   1b4c8:	cc                   	int3
   1b4c9:	cc                   	int3
   1b4ca:	cc                   	int3
   1b4cb:	cc                   	int3
   1b4cc:	cc                   	int3
   1b4cd:	cc                   	int3
   1b4ce:	cc                   	int3
   1b4cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1b4d0:	55                   	push   %rbp
   1b4d1:	41 57                	push   %r15
   1b4d3:	41 56                	push   %r14
   1b4d5:	41 55                	push   %r13
   1b4d7:	41 54                	push   %r12
   1b4d9:	53                   	push   %rbx
   1b4da:	48 83 ec 58          	sub    $0x58,%rsp
   1b4de:	48 89 fb             	mov    %rdi,%rbx
   1b4e1:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b4e5:	0f 85 ac 00 00 00    	jne    1b597 <<hyperinterval::float::F64Enclosure>::corner_image+0xc7>
   1b4eb:	f6 02 01             	testb  $0x1,(%rdx)
   1b4ee:	0f 84 a3 00 00 00    	je     1b597 <<hyperinterval::float::F64Enclosure>::corner_image+0xc7>
   1b4f4:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1b4fb:	00 00 80 
   1b4fe:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b505:	00 f0 7f 
   1b508:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1b50c:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1b510:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b515:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1b519:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b51d:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1b522:	48 89 e7             	mov    %rsp,%rdi
   1b525:	48 89 ce             	mov    %rcx,%rsi
   1b528:	4c 89 f2             	mov    %r14,%rdx
   1b52b:	4c 89 e1             	mov    %r12,%rcx
   1b52e:	49 89 e8             	mov    %rbp,%r8
   1b531:	e8 da e2 ff ff       	call   19810 <<hyperinterval::ieee::Format>::div>
   1b536:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b53a:	75 48                	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b53c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b541:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1b546:	48 89 e7             	mov    %rsp,%rdi
   1b549:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b550:	00 00 80 
   1b553:	4c 89 f2             	mov    %r14,%rdx
   1b556:	e8 45 db ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b55b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b55f:	75 23                	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b561:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b566:	48 89 e7             	mov    %rsp,%rdi
   1b569:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b570:	00 00 80 
   1b573:	4c 89 f2             	mov    %r14,%rdx
   1b576:	4c 89 e9             	mov    %r13,%rcx
   1b579:	e8 22 db ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b57e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b582:	74 29                	je     1b5ad <<hyperinterval::float::F64Enclosure>::corner_image+0xdd>
   1b584:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1b58a:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1b58e:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b595:	eb 07                	jmp    1b59e <<hyperinterval::float::F64Enclosure>::corner_image+0xce>
   1b597:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b59e:	48 83 c4 58          	add    $0x58,%rsp
   1b5a2:	5b                   	pop    %rbx
   1b5a3:	41 5c                	pop    %r12
   1b5a5:	41 5d                	pop    %r13
   1b5a7:	41 5e                	pop    %r14
   1b5a9:	41 5f                	pop    %r15
   1b5ab:	5d                   	pop    %rbp
   1b5ac:	c3                   	ret
   1b5ad:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b5b4:	00 00 80 
   1b5b7:	49 8d 3c 37          	lea    (%r15,%rsi,1),%rdi
   1b5bb:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
   1b5bf:	4c 89 f8             	mov    %r15,%rax
   1b5c2:	48 21 d0             	and    %rdx,%rax
   1b5c5:	49 89 f2             	mov    %rsi,%r10
   1b5c8:	49 29 c2             	sub    %rax,%r10
   1b5cb:	4d 85 ff             	test   %r15,%r15
   1b5ce:	48 89 f8             	mov    %rdi,%rax
   1b5d1:	49 0f 48 c2          	cmovs  %r10,%rax
   1b5d5:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1b5da:	4d 8d 0c 30          	lea    (%r8,%rsi,1),%r9
   1b5de:	4c 89 c1             	mov    %r8,%rcx
   1b5e1:	48 21 d1             	and    %rdx,%rcx
   1b5e4:	48 29 ce             	sub    %rcx,%rsi
   1b5e7:	4d 85 c0             	test   %r8,%r8
   1b5ea:	4c 89 c9             	mov    %r9,%rcx
   1b5ed:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1b5f1:	41 b5 01             	mov    $0x1,%r13b
   1b5f4:	48 39 c8             	cmp    %rcx,%rax
   1b5f7:	77 91                	ja     1b58a <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b5f9:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1b5fe:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
   1b603:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
   1b608:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
   1b60d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b612:	48 89 e7             	mov    %rsp,%rdi
   1b615:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b61c:	00 00 80 
   1b61f:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b626:	00 f0 7f 
   1b629:	4c 89 f2             	mov    %r14,%rdx
   1b62c:	4c 89 e1             	mov    %r12,%rcx
   1b62f:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b634:	e8 d7 e1 ff ff       	call   19810 <<hyperinterval::ieee::Format>::div>
   1b639:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b63d:	0f 85 41 ff ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b643:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b648:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b64d:	48 89 e7             	mov    %rsp,%rdi
   1b650:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b657:	00 00 80 
   1b65a:	4c 89 f2             	mov    %r14,%rdx
   1b65d:	e8 3e da ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b662:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b666:	0f 84 18 ff ff ff    	je     1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b66c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b671:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b676:	48 89 e7             	mov    %rsp,%rdi
   1b679:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b680:	00 00 80 
   1b683:	4c 89 f2             	mov    %r14,%rdx
   1b686:	4c 89 e1             	mov    %r12,%rcx
   1b689:	e8 12 da ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b68e:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b692:	0f 84 ec fe ff ff    	je     1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b698:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b69d:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b6a4:	00 00 80 
   1b6a7:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
   1b6ac:	4b 8d 0c 01          	lea    (%r9,%r8,1),%rcx
   1b6b0:	4c 89 ca             	mov    %r9,%rdx
   1b6b3:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   1b6b7:	48 21 fa             	and    %rdi,%rdx
   1b6ba:	4c 89 c0             	mov    %r8,%rax
   1b6bd:	48 29 d0             	sub    %rdx,%rax
   1b6c0:	4d 85 c9             	test   %r9,%r9
   1b6c3:	48 0f 49 c1          	cmovns %rcx,%rax
   1b6c7:	4b 8d 14 04          	lea    (%r12,%r8,1),%rdx
   1b6cb:	4c 89 e6             	mov    %r12,%rsi
   1b6ce:	48 21 fe             	and    %rdi,%rsi
   1b6d1:	4c 89 c1             	mov    %r8,%rcx
   1b6d4:	48 29 f1             	sub    %rsi,%rcx
   1b6d7:	4d 85 e4             	test   %r12,%r12
   1b6da:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b6de:	48 39 c8             	cmp    %rcx,%rax
   1b6e1:	0f 87 a3 fe ff ff    	ja     1b58a <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b6e7:	4c 89 ca             	mov    %r9,%rdx
   1b6ea:	4d 85 ff             	test   %r15,%r15
   1b6ed:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b6f2:	48 0f 48 74 24 40    	cmovs  0x40(%rsp),%rsi
   1b6f8:	48 39 c6             	cmp    %rax,%rsi
   1b6fb:	49 0f 46 d7          	cmovbe %r15,%rdx
   1b6ff:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b704:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1b709:	48 85 c0             	test   %rax,%rax
   1b70c:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1b711:	48 0f 48 54 24 38    	cmovs  0x38(%rsp),%rdx
   1b717:	48 39 ca             	cmp    %rcx,%rdx
   1b71a:	4c 0f 43 e0          	cmovae %rax,%r12
   1b71e:	48 89 e7             	mov    %rsp,%rdi
   1b721:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b728:	00 00 80 
   1b72b:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b732:	00 f0 7f 
   1b735:	4c 89 f2             	mov    %r14,%rdx
   1b738:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1b73d:	49 89 e8             	mov    %rbp,%r8
   1b740:	e8 cb e0 ff ff       	call   19810 <<hyperinterval::ieee::Format>::div>
   1b745:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b749:	0f 85 35 fe ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b74f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b754:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1b759:	48 89 e7             	mov    %rsp,%rdi
   1b75c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b763:	00 00 80 
   1b766:	4c 89 f2             	mov    %r14,%rdx
   1b769:	e8 32 d9 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b76e:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b772:	0f 85 0c fe ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b778:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b77d:	48 89 e7             	mov    %rsp,%rdi
   1b780:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b787:	00 00 80 
   1b78a:	4c 89 f2             	mov    %r14,%rdx
   1b78d:	48 89 e9             	mov    %rbp,%rcx
   1b790:	e8 0b d9 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b795:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b799:	0f 85 e5 fd ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b79f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b7a4:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1b7ab:	00 00 80 
   1b7ae:	49 8d 04 3f          	lea    (%r15,%rdi,1),%rax
   1b7b2:	4c 89 fa             	mov    %r15,%rdx
   1b7b5:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
   1b7b9:	4c 21 c2             	and    %r8,%rdx
   1b7bc:	48 89 f9             	mov    %rdi,%rcx
   1b7bf:	48 29 d1             	sub    %rdx,%rcx
   1b7c2:	4d 85 ff             	test   %r15,%r15
   1b7c5:	48 0f 49 c8          	cmovns %rax,%rcx
   1b7c9:	48 8d 14 2f          	lea    (%rdi,%rbp,1),%rdx
   1b7cd:	48 89 ee             	mov    %rbp,%rsi
   1b7d0:	4c 21 c6             	and    %r8,%rsi
   1b7d3:	48 89 f8             	mov    %rdi,%rax
   1b7d6:	48 29 f0             	sub    %rsi,%rax
   1b7d9:	48 85 ed             	test   %rbp,%rbp
   1b7dc:	48 0f 49 c2          	cmovns %rdx,%rax
   1b7e0:	48 39 c1             	cmp    %rax,%rcx
   1b7e3:	0f 87 a1 fd ff ff    	ja     1b58a <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b7e9:	4d 89 f9             	mov    %r15,%r9
   1b7ec:	4c 8b 54 24 18       	mov    0x18(%rsp),%r10
   1b7f1:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b7f8:	00 00 80 
   1b7fb:	49 8d 14 32          	lea    (%r10,%rsi,1),%rdx
   1b7ff:	4d 89 d3             	mov    %r10,%r11
   1b802:	4d 21 c3             	and    %r8,%r11
   1b805:	48 89 f7             	mov    %rsi,%rdi
   1b808:	4c 29 df             	sub    %r11,%rdi
   1b80b:	4d 85 d2             	test   %r10,%r10
   1b80e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b812:	48 39 cf             	cmp    %rcx,%rdi
   1b815:	4d 0f 46 ca          	cmovbe %r10,%r9
   1b819:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   1b81e:	49 8d 0c 34          	lea    (%r12,%rsi,1),%rcx
   1b822:	4c 89 e2             	mov    %r12,%rdx
   1b825:	4c 21 c2             	and    %r8,%rdx
   1b828:	48 89 f7             	mov    %rsi,%rdi
   1b82b:	48 29 d7             	sub    %rdx,%rdi
   1b82e:	4d 85 e4             	test   %r12,%r12
   1b831:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b835:	48 39 c7             	cmp    %rax,%rdi
   1b838:	49 0f 43 ec          	cmovae %r12,%rbp
   1b83c:	48 89 e7             	mov    %rsp,%rdi
   1b83f:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b846:	00 f0 7f 
   1b849:	4c 89 f2             	mov    %r14,%rdx
   1b84c:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1b851:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b856:	e8 b5 df ff ff       	call   19810 <<hyperinterval::ieee::Format>::div>
   1b85b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b85f:	0f 85 1f fd ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b865:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b86a:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b86f:	48 89 e7             	mov    %rsp,%rdi
   1b872:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b879:	00 00 80 
   1b87c:	4c 89 f2             	mov    %r14,%rdx
   1b87f:	e8 1c d8 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b884:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b888:	0f 85 f6 fc ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b88e:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b893:	48 89 e7             	mov    %rsp,%rdi
   1b896:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b89d:	00 00 80 
   1b8a0:	4c 89 f2             	mov    %r14,%rdx
   1b8a3:	4c 89 f9             	mov    %r15,%rcx
   1b8a6:	e8 f5 d7 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1b8ab:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b8af:	0f 85 cf fc ff ff    	jne    1b584 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b8b5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b8ba:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
   1b8c1:	00 00 80 
   1b8c4:	4b 8d 0c 0c          	lea    (%r12,%r9,1),%rcx
   1b8c8:	4c 89 e6             	mov    %r12,%rsi
   1b8cb:	4d 8d 41 ff          	lea    -0x1(%r9),%r8
   1b8cf:	4c 21 c6             	and    %r8,%rsi
   1b8d2:	4c 89 ca             	mov    %r9,%rdx
   1b8d5:	48 29 f2             	sub    %rsi,%rdx
   1b8d8:	4d 85 e4             	test   %r12,%r12
   1b8db:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b8df:	4a 8d 34 08          	lea    (%rax,%r9,1),%rsi
   1b8e3:	48 89 c7             	mov    %rax,%rdi
   1b8e6:	4c 21 c7             	and    %r8,%rdi
   1b8e9:	4c 89 c9             	mov    %r9,%rcx
   1b8ec:	48 29 f9             	sub    %rdi,%rcx
   1b8ef:	48 85 c0             	test   %rax,%rax
   1b8f2:	48 0f 49 ce          	cmovns %rsi,%rcx
   1b8f6:	48 39 ca             	cmp    %rcx,%rdx
   1b8f9:	0f 87 8b fc ff ff    	ja     1b58a <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b8ff:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
   1b904:	49 bb 00 00 00 00 00 	movabs $0x8000000000000000,%r11
   1b90b:	00 00 80 
   1b90e:	4b 8d 34 1a          	lea    (%r10,%r11,1),%rsi
   1b912:	4c 89 d7             	mov    %r10,%rdi
   1b915:	4d 8d 4b ff          	lea    -0x1(%r11),%r9
   1b919:	4c 21 cf             	and    %r9,%rdi
   1b91c:	4d 89 d8             	mov    %r11,%r8
   1b91f:	49 29 f8             	sub    %rdi,%r8
   1b922:	4d 85 d2             	test   %r10,%r10
   1b925:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b929:	49 39 d0             	cmp    %rdx,%r8
   1b92c:	4d 0f 46 e2          	cmovbe %r10,%r12
   1b930:	49 8d 14 2b          	lea    (%r11,%rbp,1),%rdx
   1b934:	49 21 e9             	and    %rbp,%r9
   1b937:	4d 29 cb             	sub    %r9,%r11
   1b93a:	48 85 ed             	test   %rbp,%rbp
   1b93d:	4c 0f 49 da          	cmovns %rdx,%r11
   1b941:	49 39 cb             	cmp    %rcx,%r11
   1b944:	48 0f 43 c5          	cmovae %rbp,%rax
   1b948:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b94f:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b953:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b957:	e9 42 fc ff ff       	jmp    1b59e <<hyperinterval::float::F64Enclosure>::corner_image+0xce>
   1b95c:	cc                   	int3
   1b95d:	cc                   	int3
   1b95e:	cc                   	int3
   1b95f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1b960:	55                   	push   %rbp
   1b961:	41 57                	push   %r15
   1b963:	41 56                	push   %r14
   1b965:	41 55                	push   %r13
   1b967:	41 54                	push   %r12
   1b969:	53                   	push   %rbx
   1b96a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1b971:	48 89 fb             	mov    %rdi,%rbx
   1b974:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b978:	0f 85 0a 01 00 00    	jne    1ba88 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1b97e:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1b982:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b989:	00 00 80 
   1b98c:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1b993:	00 f0 7f 
   1b996:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1b99d:	ff 0f 00 
   1b9a0:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b9a4:	4c 89 e9             	mov    %r13,%rcx
   1b9a7:	48 c1 e9 34          	shr    $0x34,%rcx
   1b9ab:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b9b1:	4c 89 ea             	mov    %r13,%rdx
   1b9b4:	4c 21 fa             	and    %r15,%rdx
   1b9b7:	48 85 c9             	test   %rcx,%rcx
   1b9ba:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1b9bf:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b9c6:	48 0f 44 c2          	cmove  %rdx,%rax
   1b9ca:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1b9cf:	0f 44 cd             	cmove  %ebp,%ecx
   1b9d2:	48 f7 e0             	mul    %rax
   1b9d5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b9da:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b9df:	48 89 04 24          	mov    %rax,(%rsp)
   1b9e3:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b9e7:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b9ec:	48 89 e1             	mov    %rsp,%rcx
   1b9ef:	4c 89 f6             	mov    %r14,%rsi
   1b9f2:	4c 89 c2             	mov    %r8,%rdx
   1b9f5:	e8 26 db ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1b9fa:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b9ff:	75 76                	jne    1ba77 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1ba01:	4c 89 e2             	mov    %r12,%rdx
   1ba04:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1ba09:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1ba0e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1ba13:	48 89 d1             	mov    %rdx,%rcx
   1ba16:	48 c1 e9 34          	shr    $0x34,%rcx
   1ba1a:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1ba20:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1ba25:	4c 21 fa             	and    %r15,%rdx
   1ba28:	48 85 c9             	test   %rcx,%rcx
   1ba2b:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1ba30:	48 0f 44 c2          	cmove  %rdx,%rax
   1ba34:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1ba3b:	0f 44 cd             	cmove  %ebp,%ecx
   1ba3e:	48 f7 e0             	mul    %rax
   1ba41:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1ba46:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ba4b:	48 89 04 24          	mov    %rax,(%rsp)
   1ba4f:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1ba53:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1ba58:	48 89 e1             	mov    %rsp,%rcx
   1ba5b:	4c 89 f6             	mov    %r14,%rsi
   1ba5e:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1ba65:	00 f0 7f 
   1ba68:	48 89 ea             	mov    %rbp,%rdx
   1ba6b:	e8 b0 da ff ff       	call   19520 <<hyperinterval::ieee::Format>::rounded>
   1ba70:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1ba75:	75 2a                	jne    1baa1 <<hyperinterval::float::F64Enclosure>::square+0x141>
   1ba77:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1ba7c:	88 43 08             	mov    %al,0x8(%rbx)
   1ba7f:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1ba86:	eb 07                	jmp    1ba8f <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1ba88:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1ba8f:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1ba96:	5b                   	pop    %rbx
   1ba97:	41 5c                	pop    %r12
   1ba99:	41 5d                	pop    %r13
   1ba9b:	41 5e                	pop    %r14
   1ba9d:	41 5f                	pop    %r15
   1ba9f:	5d                   	pop    %rbp
   1baa0:	c3                   	ret
   1baa1:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1baa6:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1baab:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1bab0:	48 89 e7             	mov    %rsp,%rdi
   1bab3:	4c 89 f6             	mov    %r14,%rsi
   1bab6:	48 89 ea             	mov    %rbp,%rdx
   1bab9:	4c 89 e1             	mov    %r12,%rcx
   1babc:	e8 df d5 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1bac1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bac5:	74 23                	je     1baea <<hyperinterval::float::F64Enclosure>::square+0x18a>
   1bac7:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1bacc:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bad1:	48 89 e7             	mov    %rsp,%rdi
   1bad4:	4c 89 f6             	mov    %r14,%rsi
   1bad7:	48 89 ea             	mov    %rbp,%rdx
   1bada:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1badf:	e8 bc d5 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1bae4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bae8:	75 07                	jne    1baf1 <<hyperinterval::float::F64Enclosure>::square+0x191>
   1baea:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1baef:	eb 8b                	jmp    1ba7c <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1baf1:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1baf6:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1bafa:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1bafe:	4c 89 f9             	mov    %r15,%rcx
   1bb01:	48 21 d1             	and    %rdx,%rcx
   1bb04:	4c 89 f7             	mov    %r14,%rdi
   1bb07:	48 29 cf             	sub    %rcx,%rdi
   1bb0a:	4d 85 ff             	test   %r15,%r15
   1bb0d:	48 0f 49 f8          	cmovns %rax,%rdi
   1bb11:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1bb15:	48 89 f1             	mov    %rsi,%rcx
   1bb18:	48 21 d1             	and    %rdx,%rcx
   1bb1b:	4d 89 f4             	mov    %r14,%r12
   1bb1e:	49 29 cc             	sub    %rcx,%r12
   1bb21:	48 85 f6             	test   %rsi,%rsi
   1bb24:	4c 0f 49 e0          	cmovns %rax,%r12
   1bb28:	b0 01                	mov    $0x1,%al
   1bb2a:	4c 39 e7             	cmp    %r12,%rdi
   1bb2d:	0f 87 49 ff ff ff    	ja     1ba7c <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1bb33:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1bb38:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1bb3d:	48 89 e7             	mov    %rsp,%rdi
   1bb40:	4c 89 f6             	mov    %r14,%rsi
   1bb43:	48 89 ea             	mov    %rbp,%rdx
   1bb46:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1bb4b:	e8 50 d5 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1bb50:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb54:	74 23                	je     1bb79 <<hyperinterval::float::F64Enclosure>::square+0x219>
   1bb56:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1bb5b:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1bb60:	48 89 e7             	mov    %rsp,%rdi
   1bb63:	4c 89 f6             	mov    %r14,%rsi
   1bb66:	48 89 ea             	mov    %rbp,%rdx
   1bb69:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1bb6e:	e8 2d d5 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1bb73:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bb77:	75 14                	jne    1bb8d <<hyperinterval::float::F64Enclosure>::square+0x22d>
   1bb79:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1bb7e:	88 53 08             	mov    %dl,0x8(%rbx)
   1bb81:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1bb88:	e9 02 ff ff ff       	jmp    1ba8f <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1bb8d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bb92:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1bb96:	4c 89 fe             	mov    %r15,%rsi
   1bb99:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1bb9d:	48 21 fe             	and    %rdi,%rsi
   1bba0:	4c 89 f1             	mov    %r14,%rcx
   1bba3:	48 29 f1             	sub    %rsi,%rcx
   1bba6:	4d 85 ff             	test   %r15,%r15
   1bba9:	48 0f 49 ca          	cmovns %rdx,%rcx
   1bbad:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1bbb1:	48 89 c6             	mov    %rax,%rsi
   1bbb4:	48 21 fe             	and    %rdi,%rsi
   1bbb7:	49 29 f6             	sub    %rsi,%r14
   1bbba:	48 85 c0             	test   %rax,%rax
   1bbbd:	4c 0f 49 f2          	cmovns %rdx,%r14
   1bbc1:	b2 01                	mov    $0x1,%dl
   1bbc3:	4c 39 f1             	cmp    %r14,%rcx
   1bbc6:	77 b6                	ja     1bb7e <<hyperinterval::float::F64Enclosure>::square+0x21e>
   1bbc8:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1bbcd:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1bbd2:	49 0f 47 cf          	cmova  %r15,%rcx
   1bbd6:	4d 39 f4             	cmp    %r14,%r12
   1bbd9:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1bbde:	48 0f 42 d0          	cmovb  %rax,%rdx
   1bbe2:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1bbe9:	00 00 
   1bbeb:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1bbf0:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1bbf5:	4d 85 ed             	test   %r13,%r13
   1bbf8:	7f 7c                	jg     1bc76 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1bbfa:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1bc00:	79 07                	jns    1bc09 <<hyperinterval::float::F64Enclosure>::square+0x2a9>
   1bc02:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1bc07:	75 6d                	jne    1bc76 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1bc09:	48 89 e7             	mov    %rsp,%rdi
   1bc0c:	31 f6                	xor    %esi,%esi
   1bc0e:	31 d2                	xor    %edx,%edx
   1bc10:	e8 eb 01 00 00       	call   1be00 <<hyperinterval::float::F64Enclosure>::from_bits>
   1bc15:	48 8b 0c 24          	mov    (%rsp),%rcx
   1bc19:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bc1e:	48 83 f9 02          	cmp    $0x2,%rcx
   1bc22:	0f 84 54 fe ff ff    	je     1ba7c <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1bc28:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1bc2d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1bc32:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1bc37:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1bc3c:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1bc41:	88 44 24 30          	mov    %al,0x30(%rsp)
   1bc45:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1bc4c:	00 
   1bc4d:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1bc52:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1bc57:	e8 44 00 00 00       	call   1bca0 <<hyperinterval::float::F64Enclosure>::hull>
   1bc5c:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1bc63:	00 
   1bc64:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1bc69:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1bc70:	00 
   1bc71:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1bc76:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1bc7b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1bc7f:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1bc84:	48 89 03             	mov    %rax,(%rbx)
   1bc87:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1bc8c:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1bc90:	e9 fa fd ff ff       	jmp    1ba8f <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1bc95:	cc                   	int3
   1bc96:	cc                   	int3
   1bc97:	cc                   	int3
   1bc98:	cc                   	int3
   1bc99:	cc                   	int3
   1bc9a:	cc                   	int3
   1bc9b:	cc                   	int3
   1bc9c:	cc                   	int3
   1bc9d:	cc                   	int3
   1bc9e:	cc                   	int3
   1bc9f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1bca0:	4c 8b 02             	mov    (%rdx),%r8
   1bca3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   1bca7:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1bcab:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bcaf:	0f 85 9f 00 00 00    	jne    1bd54 <<hyperinterval::float::F64Enclosure>::hull+0xb4>
   1bcb5:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1bcb9:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bcbd:	ba 01 00 00 00       	mov    $0x1,%edx
   1bcc2:	49 83 f8 01          	cmp    $0x1,%r8
   1bcc6:	0f 85 97 00 00 00    	jne    1bd63 <<hyperinterval::float::F64Enclosure>::hull+0xc3>
   1bccc:	41 57                	push   %r15
   1bcce:	41 56                	push   %r14
   1bcd0:	53                   	push   %rbx
   1bcd1:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1bcd8:	00 00 80 
   1bcdb:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1bcdf:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1bce3:	4c 89 d3             	mov    %r10,%rbx
   1bce6:	4c 21 cb             	and    %r9,%rbx
   1bce9:	4d 89 c6             	mov    %r8,%r14
   1bcec:	49 29 de             	sub    %rbx,%r14
   1bcef:	4d 85 d2             	test   %r10,%r10
   1bcf2:	4d 0f 49 f3          	cmovns %r11,%r14
   1bcf6:	4e 8d 1c 01          	lea    (%rcx,%r8,1),%r11
   1bcfa:	48 89 cb             	mov    %rcx,%rbx
   1bcfd:	4c 21 cb             	and    %r9,%rbx
   1bd00:	4d 89 c7             	mov    %r8,%r15
   1bd03:	49 29 df             	sub    %rbx,%r15
   1bd06:	48 85 c9             	test   %rcx,%rcx
   1bd09:	4d 0f 49 fb          	cmovns %r11,%r15
   1bd0d:	4d 39 fe             	cmp    %r15,%r14
   1bd10:	49 0f 46 ca          	cmovbe %r10,%rcx
   1bd14:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1bd18:	49 89 f3             	mov    %rsi,%r11
   1bd1b:	4d 21 cb             	and    %r9,%r11
   1bd1e:	4c 89 c3             	mov    %r8,%rbx
   1bd21:	4c 29 db             	sub    %r11,%rbx
   1bd24:	48 85 f6             	test   %rsi,%rsi
   1bd27:	49 0f 49 da          	cmovns %r10,%rbx
   1bd2b:	4e 8d 14 00          	lea    (%rax,%r8,1),%r10
   1bd2f:	49 21 c1             	and    %rax,%r9
   1bd32:	4d 29 c8             	sub    %r9,%r8
   1bd35:	48 85 c0             	test   %rax,%rax
   1bd38:	4d 0f 49 c2          	cmovns %r10,%r8
   1bd3c:	4c 39 c3             	cmp    %r8,%rbx
   1bd3f:	48 0f 43 c6          	cmovae %rsi,%rax
   1bd43:	5b                   	pop    %rbx
   1bd44:	41 5e                	pop    %r14
   1bd46:	41 5f                	pop    %r15
   1bd48:	48 89 17             	mov    %rdx,(%rdi)
   1bd4b:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1bd4f:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1bd53:	c3                   	ret
   1bd54:	4c 89 c2             	mov    %r8,%rdx
   1bd57:	48 89 17             	mov    %rdx,(%rdi)
   1bd5a:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1bd5e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1bd62:	c3                   	ret
   1bd63:	48 89 f0             	mov    %rsi,%rax
   1bd66:	4c 89 d1             	mov    %r10,%rcx
   1bd69:	48 89 17             	mov    %rdx,(%rdi)
   1bd6c:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1bd70:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1bd74:	c3                   	ret
   1bd75:	cc                   	int3
   1bd76:	cc                   	int3
   1bd77:	cc                   	int3
   1bd78:	cc                   	int3
   1bd79:	cc                   	int3
   1bd7a:	cc                   	int3
   1bd7b:	cc                   	int3
   1bd7c:	cc                   	int3
   1bd7d:	cc                   	int3
   1bd7e:	cc                   	int3
   1bd7f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1bd80:	83 3f 01             	cmpl   $0x1,(%rdi)
   1bd83:	75 69                	jne    1bdee <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1bd85:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1bd8c:	00 00 80 
   1bd8f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1bd93:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1bd97:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1bd9b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1bd9f:	49 89 c9             	mov    %rcx,%r9
   1bda2:	49 21 f1             	and    %rsi,%r9
   1bda5:	4c 89 c7             	mov    %r8,%rdi
   1bda8:	4c 29 cf             	sub    %r9,%rdi
   1bdab:	48 85 c9             	test   %rcx,%rcx
   1bdae:	48 0f 49 fa          	cmovns %rdx,%rdi
   1bdb2:	31 d2                	xor    %edx,%edx
   1bdb4:	48 85 ff             	test   %rdi,%rdi
   1bdb7:	0f 99 c1             	setns  %cl
   1bdba:	4c 39 c7             	cmp    %r8,%rdi
   1bdbd:	77 1f                	ja     1bdde <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1bdbf:	48 85 ff             	test   %rdi,%rdi
   1bdc2:	40 0f 99 c7          	setns  %dil
   1bdc6:	40 80 cf 02          	or     $0x2,%dil
   1bdca:	48 85 f0             	test   %rsi,%rax
   1bdcd:	88 ca                	mov    %cl,%dl
   1bdcf:	40 0f b6 cf          	movzbl %dil,%ecx
   1bdd3:	0f 44 d1             	cmove  %ecx,%edx
   1bdd6:	48 85 c0             	test   %rax,%rax
   1bdd9:	0f 49 d1             	cmovns %ecx,%edx
   1bddc:	89 d1                	mov    %edx,%ecx
   1bdde:	8d 51 04             	lea    0x4(%rcx),%edx
   1bde1:	48 85 c0             	test   %rax,%rax
   1bde4:	0f b6 c9             	movzbl %cl,%ecx
   1bde7:	0f b6 c2             	movzbl %dl,%eax
   1bdea:	0f 4e c1             	cmovle %ecx,%eax
   1bded:	c3                   	ret
   1bdee:	31 c0                	xor    %eax,%eax
   1bdf0:	c3                   	ret
   1bdf1:	cc                   	int3
   1bdf2:	cc                   	int3
   1bdf3:	cc                   	int3
   1bdf4:	cc                   	int3
   1bdf5:	cc                   	int3
   1bdf6:	cc                   	int3
   1bdf7:	cc                   	int3
   1bdf8:	cc                   	int3
   1bdf9:	cc                   	int3
   1bdfa:	cc                   	int3
   1bdfb:	cc                   	int3
   1bdfc:	cc                   	int3
   1bdfd:	cc                   	int3
   1bdfe:	cc                   	int3
   1bdff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1be00:	41 57                	push   %r15
   1be02:	41 56                	push   %r14
   1be04:	41 55                	push   %r13
   1be06:	41 54                	push   %r12
   1be08:	53                   	push   %rbx
   1be09:	48 83 ec 10          	sub    $0x10,%rsp
   1be0d:	49 89 d7             	mov    %rdx,%r15
   1be10:	48 89 f1             	mov    %rsi,%rcx
   1be13:	48 89 fb             	mov    %rdi,%rbx
   1be16:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1be1d:	00 00 80 
   1be20:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1be27:	00 f0 7f 
   1be2a:	48 89 e7             	mov    %rsp,%rdi
   1be2d:	4c 89 f6             	mov    %r14,%rsi
   1be30:	4c 89 e2             	mov    %r12,%rdx
   1be33:	e8 68 d2 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1be38:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be3c:	74 1c                	je     1be5a <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1be3e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1be43:	48 89 e7             	mov    %rsp,%rdi
   1be46:	4c 89 f6             	mov    %r14,%rsi
   1be49:	4c 89 e2             	mov    %r12,%rdx
   1be4c:	4c 89 f9             	mov    %r15,%rcx
   1be4f:	e8 4c d2 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1be54:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1be58:	75 1d                	jne    1be77 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1be5a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1be5f:	88 43 08             	mov    %al,0x8(%rbx)
   1be62:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1be69:	48 83 c4 10          	add    $0x10,%rsp
   1be6d:	5b                   	pop    %rbx
   1be6e:	41 5c                	pop    %r12
   1be70:	41 5d                	pop    %r13
   1be72:	41 5e                	pop    %r14
   1be74:	41 5f                	pop    %r15
   1be76:	c3                   	ret
   1be77:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1be7b:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1be7f:	4c 89 ea             	mov    %r13,%rdx
   1be82:	48 21 ca             	and    %rcx,%rdx
   1be85:	4c 89 f6             	mov    %r14,%rsi
   1be88:	48 29 d6             	sub    %rdx,%rsi
   1be8b:	4d 85 ed             	test   %r13,%r13
   1be8e:	48 0f 49 f0          	cmovns %rax,%rsi
   1be92:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1be97:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1be9b:	48 21 c1             	and    %rax,%rcx
   1be9e:	49 29 ce             	sub    %rcx,%r14
   1bea1:	48 85 c0             	test   %rax,%rax
   1bea4:	4c 0f 49 f2          	cmovns %rdx,%r14
   1bea8:	4c 39 f6             	cmp    %r14,%rsi
   1beab:	76 06                	jbe    1beb3 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1bead:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1beb1:	eb af                	jmp    1be62 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1beb3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1beba:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1bebe:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1bec2:	eb a5                	jmp    1be69 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1bec4:	cc                   	int3
   1bec5:	cc                   	int3
   1bec6:	cc                   	int3
   1bec7:	cc                   	int3
   1bec8:	cc                   	int3
   1bec9:	cc                   	int3
   1beca:	cc                   	int3
   1becb:	cc                   	int3
   1becc:	cc                   	int3
   1becd:	cc                   	int3
   1bece:	cc                   	int3
   1becf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1bed0:	45 31 c0             	xor    %r8d,%r8d
   1bed3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bed7:	0f 85 d5 00 00 00    	jne    1bfb2 <<hyperinterval::float::F64Enclosure>::intersection+0xe2>
   1bedd:	f6 02 01             	testb  $0x1,(%rdx)
   1bee0:	0f 84 c0 00 00 00    	je     1bfa6 <<hyperinterval::float::F64Enclosure>::intersection+0xd6>
   1bee6:	41 56                	push   %r14
   1bee8:	53                   	push   %rbx
   1bee9:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1beed:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1bef1:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1bef5:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1befc:	00 00 80 
   1beff:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   1bf03:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1bf07:	49 89 c3             	mov    %rax,%r11
   1bf0a:	4d 21 c3             	and    %r8,%r11
   1bf0d:	48 89 d3             	mov    %rdx,%rbx
   1bf10:	4c 29 db             	sub    %r11,%rbx
   1bf13:	48 85 c0             	test   %rax,%rax
   1bf16:	48 0f 49 d9          	cmovns %rcx,%rbx
   1bf1a:	49 8d 0c 12          	lea    (%r10,%rdx,1),%rcx
   1bf1e:	4d 89 d3             	mov    %r10,%r11
   1bf21:	4d 21 c3             	and    %r8,%r11
   1bf24:	49 89 d6             	mov    %rdx,%r14
   1bf27:	4d 29 de             	sub    %r11,%r14
   1bf2a:	4d 85 d2             	test   %r10,%r10
   1bf2d:	4c 0f 49 f1          	cmovns %rcx,%r14
   1bf31:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1bf35:	4c 39 f3             	cmp    %r14,%rbx
   1bf38:	49 0f 42 c2          	cmovb  %r10,%rax
   1bf3c:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1bf40:	49 89 ca             	mov    %rcx,%r10
   1bf43:	4d 21 c2             	and    %r8,%r10
   1bf46:	49 89 d3             	mov    %rdx,%r11
   1bf49:	4d 29 d3             	sub    %r10,%r11
   1bf4c:	48 85 c9             	test   %rcx,%rcx
   1bf4f:	4c 0f 49 de          	cmovns %rsi,%r11
   1bf53:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1bf57:	4d 89 ca             	mov    %r9,%r10
   1bf5a:	4d 21 c2             	and    %r8,%r10
   1bf5d:	48 89 d3             	mov    %rdx,%rbx
   1bf60:	4c 29 d3             	sub    %r10,%rbx
   1bf63:	4d 85 c9             	test   %r9,%r9
   1bf66:	48 0f 49 de          	cmovns %rsi,%rbx
   1bf6a:	49 39 db             	cmp    %rbx,%r11
   1bf6d:	49 0f 47 c9          	cmova  %r9,%rcx
   1bf71:	48 8d 34 10          	lea    (%rax,%rdx,1),%rsi
   1bf75:	49 89 c1             	mov    %rax,%r9
   1bf78:	4d 21 c1             	and    %r8,%r9
   1bf7b:	49 89 d2             	mov    %rdx,%r10
   1bf7e:	4d 29 ca             	sub    %r9,%r10
   1bf81:	48 85 c0             	test   %rax,%rax
   1bf84:	4c 0f 49 d6          	cmovns %rsi,%r10
   1bf88:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1bf8c:	49 21 c8             	and    %rcx,%r8
   1bf8f:	4c 29 c2             	sub    %r8,%rdx
   1bf92:	48 85 c9             	test   %rcx,%rcx
   1bf95:	48 0f 49 d6          	cmovns %rsi,%rdx
   1bf99:	45 31 c0             	xor    %r8d,%r8d
   1bf9c:	49 39 d2             	cmp    %rdx,%r10
   1bf9f:	41 0f 96 c0          	setbe  %r8b
   1bfa3:	5b                   	pop    %rbx
   1bfa4:	41 5e                	pop    %r14
   1bfa6:	4c 89 07             	mov    %r8,(%rdi)
   1bfa9:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1bfad:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1bfb1:	c3                   	ret
   1bfb2:	4c 89 07             	mov    %r8,(%rdi)
   1bfb5:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1bfb9:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1bfbd:	c3                   	ret
   1bfbe:	cc                   	int3
   1bfbf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1bfc0:	41 56                	push   %r14
   1bfc2:	53                   	push   %rbx
   1bfc3:	48 83 ec 18          	sub    $0x18,%rsp
   1bfc7:	49 89 fe             	mov    %rdi,%r14
   1bfca:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bfd1:	00 00 80 
   1bfd4:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bfd9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1bfde:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1bfe5:	00 f0 7f 
   1bfe8:	48 89 de             	mov    %rbx,%rsi
   1bfeb:	e8 b0 d0 ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1bff0:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bff5:	3c 01                	cmp    $0x1,%al
   1bff7:	75 0d                	jne    1c006 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1bff9:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1bffe:	48 83 c4 18          	add    $0x18,%rsp
   1c002:	5b                   	pop    %rbx
   1c003:	41 5e                	pop    %r14
   1c005:	c3                   	ret
   1c006:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1c00a:	75 40                	jne    1c04c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1c00c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1c011:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1c015:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1c019:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1c01d:	49 89 d0             	mov    %rdx,%r8
   1c020:	49 21 c8             	and    %rcx,%r8
   1c023:	49 89 d9             	mov    %rbx,%r9
   1c026:	4d 29 c1             	sub    %r8,%r9
   1c029:	48 85 d2             	test   %rdx,%rdx
   1c02c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c030:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1c034:	49 89 f0             	mov    %rsi,%r8
   1c037:	49 21 c8             	and    %rcx,%r8
   1c03a:	48 89 da             	mov    %rbx,%rdx
   1c03d:	4c 29 c2             	sub    %r8,%rdx
   1c040:	48 85 f6             	test   %rsi,%rsi
   1c043:	48 0f 49 d7          	cmovns %rdi,%rdx
   1c047:	49 39 d1             	cmp    %rdx,%r9
   1c04a:	76 0a                	jbe    1c056 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1c04c:	31 d2                	xor    %edx,%edx
   1c04e:	48 83 c4 18          	add    $0x18,%rsp
   1c052:	5b                   	pop    %rbx
   1c053:	41 5e                	pop    %r14
   1c055:	c3                   	ret
   1c056:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1c05a:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1c05e:	48 21 f1             	and    %rsi,%rcx
   1c061:	48 29 cb             	sub    %rcx,%rbx
   1c064:	48 85 f6             	test   %rsi,%rsi
   1c067:	48 0f 49 df          	cmovns %rdi,%rbx
   1c06b:	48 39 da             	cmp    %rbx,%rdx
   1c06e:	0f 96 c2             	setbe  %dl
   1c071:	48 83 c4 18          	add    $0x18,%rsp
   1c075:	5b                   	pop    %rbx
   1c076:	41 5e                	pop    %r14
   1c078:	c3                   	ret
   1c079:	cc                   	int3
   1c07a:	cc                   	int3
   1c07b:	cc                   	int3
   1c07c:	cc                   	int3
   1c07d:	cc                   	int3
   1c07e:	cc                   	int3
   1c07f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1c080:	b0 01                	mov    $0x1,%al
   1c082:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c086:	0f 85 8b 00 00 00    	jne    1c117 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1c08c:	f6 06 01             	testb  $0x1,(%rsi)
   1c08f:	0f 84 80 00 00 00    	je     1c115 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1c095:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c099:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c09d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c0a4:	00 00 80 
   1c0a7:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c0ab:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c0af:	4d 89 c2             	mov    %r8,%r10
   1c0b2:	49 21 ca             	and    %rcx,%r10
   1c0b5:	49 89 c3             	mov    %rax,%r11
   1c0b8:	4d 29 d3             	sub    %r10,%r11
   1c0bb:	4d 85 c0             	test   %r8,%r8
   1c0be:	4d 0f 49 d9          	cmovns %r9,%r11
   1c0c2:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c0c6:	49 89 d1             	mov    %rdx,%r9
   1c0c9:	49 21 c9             	and    %rcx,%r9
   1c0cc:	49 89 c2             	mov    %rax,%r10
   1c0cf:	4d 29 ca             	sub    %r9,%r10
   1c0d2:	48 85 d2             	test   %rdx,%rdx
   1c0d5:	4d 0f 49 d0          	cmovns %r8,%r10
   1c0d9:	4d 39 d3             	cmp    %r10,%r11
   1c0dc:	73 37                	jae    1c115 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1c0de:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c0e2:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c0e6:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c0ea:	49 89 d0             	mov    %rdx,%r8
   1c0ed:	49 21 c8             	and    %rcx,%r8
   1c0f0:	49 89 c1             	mov    %rax,%r9
   1c0f3:	4d 29 c1             	sub    %r8,%r9
   1c0f6:	48 85 d2             	test   %rdx,%rdx
   1c0f9:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c0fd:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c101:	48 21 f1             	and    %rsi,%rcx
   1c104:	48 29 c8             	sub    %rcx,%rax
   1c107:	48 85 f6             	test   %rsi,%rsi
   1c10a:	48 0f 49 c2          	cmovns %rdx,%rax
   1c10e:	49 39 c1             	cmp    %rax,%r9
   1c111:	0f 92 c0             	setb   %al
   1c114:	c3                   	ret
   1c115:	31 c0                	xor    %eax,%eax
   1c117:	c3                   	ret
   1c118:	cc                   	int3
   1c119:	cc                   	int3
   1c11a:	cc                   	int3
   1c11b:	cc                   	int3
   1c11c:	cc                   	int3
   1c11d:	cc                   	int3
   1c11e:	cc                   	int3
   1c11f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1c120:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c124:	0f 85 c8 00 00 00    	jne    1c1f2 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1c12a:	f6 02 01             	testb  $0x1,(%rdx)
   1c12d:	0f 84 bf 00 00 00    	je     1c1f2 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1c133:	55                   	push   %rbp
   1c134:	41 57                	push   %r15
   1c136:	41 56                	push   %r14
   1c138:	41 55                	push   %r13
   1c13a:	41 54                	push   %r12
   1c13c:	53                   	push   %rbx
   1c13d:	48 83 ec 18          	sub    $0x18,%rsp
   1c141:	48 89 fd             	mov    %rdi,%rbp
   1c144:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1c148:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1c14c:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1c150:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1c157:	00 00 80 
   1c15a:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1c161:	00 f0 7f 
   1c164:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1c168:	48 89 e7             	mov    %rsp,%rdi
   1c16b:	48 89 de             	mov    %rbx,%rsi
   1c16e:	4c 89 f2             	mov    %r14,%rdx
   1c171:	e8 4a e8 ff ff       	call   1a9c0 <<hyperinterval::ieee::Format>::add>
   1c176:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c17a:	74 57                	je     1c1d3 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1c17c:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1c181:	48 89 e7             	mov    %rsp,%rdi
   1c184:	48 89 de             	mov    %rbx,%rsi
   1c187:	4c 89 f2             	mov    %r14,%rdx
   1c18a:	4c 89 f9             	mov    %r15,%rcx
   1c18d:	4d 89 e0             	mov    %r12,%r8
   1c190:	e8 2b e8 ff ff       	call   1a9c0 <<hyperinterval::ieee::Format>::add>
   1c195:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c199:	74 38                	je     1c1d3 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1c19b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1c1a0:	48 89 e7             	mov    %rsp,%rdi
   1c1a3:	48 89 de             	mov    %rbx,%rsi
   1c1a6:	4c 89 f2             	mov    %r14,%rdx
   1c1a9:	4c 89 e9             	mov    %r13,%rcx
   1c1ac:	e8 ef ce ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1c1b1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1b5:	74 1c                	je     1c1d3 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1c1b7:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1c1bc:	48 89 e7             	mov    %rsp,%rdi
   1c1bf:	48 89 de             	mov    %rbx,%rsi
   1c1c2:	4c 89 f2             	mov    %r14,%rdx
   1c1c5:	4c 89 f9             	mov    %r15,%rcx
   1c1c8:	e8 d3 ce ff ff       	call   190a0 <<hyperinterval::ieee::Format>::finite>
   1c1cd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1c1d1:	75 27                	jne    1c1fa <<hyperinterval::float::F64Enclosure>::add+0xda>
   1c1d3:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1c1d8:	88 45 08             	mov    %al,0x8(%rbp)
   1c1db:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1c1e2:	00 
   1c1e3:	48 83 c4 18          	add    $0x18,%rsp
   1c1e7:	5b                   	pop    %rbx
   1c1e8:	41 5c                	pop    %r12
   1c1ea:	41 5d                	pop    %r13
   1c1ec:	41 5e                	pop    %r14
   1c1ee:	41 5f                	pop    %r15
   1c1f0:	5d                   	pop    %rbp
   1c1f1:	c3                   	ret
   1c1f2:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1c1f9:	c3                   	ret
   1c1fa:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1c1fe:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1c202:	4c 89 e2             	mov    %r12,%rdx
   1c205:	48 21 ca             	and    %rcx,%rdx
   1c208:	48 89 de             	mov    %rbx,%rsi
   1c20b:	48 29 d6             	sub    %rdx,%rsi
   1c20e:	4d 85 e4             	test   %r12,%r12
   1c211:	48 0f 49 f0          	cmovns %rax,%rsi
   1c215:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1c21a:	48 8d 14 18          	lea    (%rax,%rbx,1),%rdx
   1c21e:	48 21 c1             	and    %rax,%rcx
   1c221:	48 29 cb             	sub    %rcx,%rbx
   1c224:	48 85 c0             	test   %rax,%rax
   1c227:	48 0f 49 da          	cmovns %rdx,%rbx
   1c22b:	48 39 de             	cmp    %rbx,%rsi
   1c22e:	76 06                	jbe    1c236 <<hyperinterval::float::F64Enclosure>::add+0x116>
   1c230:	c6 45 08 01          	movb   $0x1,0x8(%rbp)
   1c234:	eb a5                	jmp    1c1db <<hyperinterval::float::F64Enclosure>::add+0xbb>
   1c236:	48 c7 45 00 01 00 00 	movq   $0x1,0x0(%rbp)
   1c23d:	00 
   1c23e:	4c 89 65 08          	mov    %r12,0x8(%rbp)
   1c242:	48 89 45 10          	mov    %rax,0x10(%rbp)
   1c246:	eb 9b                	jmp    1c1e3 <<hyperinterval::float::F64Enclosure>::add+0xc3>
   1c248:	cc                   	int3
   1c249:	cc                   	int3
   1c24a:	cc                   	int3
   1c24b:	cc                   	int3
   1c24c:	cc                   	int3
   1c24d:	cc                   	int3
   1c24e:	cc                   	int3
   1c24f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1c250:	83 3a 01             	cmpl   $0x1,(%rdx)
   1c253:	0f 85 77 f2 ff ff    	jne    1b4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1c259:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1c25e:	0f 8f 6c f2 ff ff    	jg     1b4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1c264:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1c268:	48 85 c0             	test   %rax,%rax
   1c26b:	0f 99 c1             	setns  %cl
   1c26e:	48 d1 e0             	shl    $1,%rax
   1c271:	48 85 c0             	test   %rax,%rax
   1c274:	0f 94 c0             	sete   %al
   1c277:	08 c8                	or     %cl,%al
   1c279:	0f 84 51 f2 ff ff    	je     1b4d0 <<hyperinterval::float::F64Enclosure>::corner_image>
   1c27f:	c6 47 08 04          	movb   $0x4,0x8(%rdi)
   1c283:	48 c7 07 02 00 00 00 	movq   $0x2,(%rdi)
   1c28a:	c3                   	ret
   1c28b:	cc                   	int3
   1c28c:	cc                   	int3
   1c28d:	cc                   	int3
   1c28e:	cc                   	int3
   1c28f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sub:
   1c290:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1c294:	75 30                	jne    1c2c6 <<hyperinterval::float::F64Enclosure>::sub+0x36>
   1c296:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1c29a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c29e:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c2a5:	00 00 80 
   1c2a8:	48 89 d1             	mov    %rdx,%rcx
   1c2ab:	48 31 c1             	xor    %rax,%rcx
   1c2ae:	48 85 d2             	test   %rdx,%rdx
   1c2b1:	48 0f 44 ca          	cmove  %rdx,%rcx
   1c2b5:	4c 31 c0             	xor    %r8,%rax
   1c2b8:	4d 85 c0             	test   %r8,%r8
   1c2bb:	49 0f 44 c0          	cmove  %r8,%rax
   1c2bf:	ba 01 00 00 00       	mov    $0x1,%edx
   1c2c4:	eb 02                	jmp    1c2c8 <<hyperinterval::float::F64Enclosure>::sub+0x38>
   1c2c6:	31 d2                	xor    %edx,%edx
   1c2c8:	48 83 ec 18          	sub    $0x18,%rsp
   1c2cc:	48 89 14 24          	mov    %rdx,(%rsp)
   1c2d0:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1c2d5:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1c2da:	48 89 e2             	mov    %rsp,%rdx
   1c2dd:	e8 3e fe ff ff       	call   1c120 <<hyperinterval::float::F64Enclosure>::add>
   1c2e2:	48 83 c4 18          	add    $0x18,%rsp
   1c2e6:	c3                   	ret
   1c2e7:	cc                   	int3
   1c2e8:	cc                   	int3
   1c2e9:	cc                   	int3
   1c2ea:	cc                   	int3
   1c2eb:	cc                   	int3
   1c2ec:	cc                   	int3
   1c2ed:	cc                   	int3
   1c2ee:	cc                   	int3
   1c2ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::disjoint:
   1c2f0:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c2f4:	b0 01                	mov    $0x1,%al
   1c2f6:	0f 84 8b 00 00 00    	je     1c387 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c2fc:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c300:	0f 84 81 00 00 00    	je     1c387 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c306:	53                   	push   %rbx
   1c307:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1c30e:	00 00 80 
   1c311:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1c315:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1c319:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1c31d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1c321:	4d 89 c3             	mov    %r8,%r11
   1c324:	49 21 d3             	and    %rdx,%r11
   1c327:	48 89 cb             	mov    %rcx,%rbx
   1c32a:	4c 29 db             	sub    %r11,%rbx
   1c32d:	4d 85 c0             	test   %r8,%r8
   1c330:	49 0f 49 da          	cmovns %r10,%rbx
   1c334:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1c338:	4d 89 ca             	mov    %r9,%r10
   1c33b:	49 21 d2             	and    %rdx,%r10
   1c33e:	49 89 cb             	mov    %rcx,%r11
   1c341:	4d 29 d3             	sub    %r10,%r11
   1c344:	4d 85 c9             	test   %r9,%r9
   1c347:	4d 0f 49 d8          	cmovns %r8,%r11
   1c34b:	4c 39 db             	cmp    %r11,%rbx
   1c34e:	5b                   	pop    %rbx
   1c34f:	72 36                	jb     1c387 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1c351:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1c355:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c359:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1c35d:	49 89 f0             	mov    %rsi,%r8
   1c360:	49 21 d0             	and    %rdx,%r8
   1c363:	49 89 c9             	mov    %rcx,%r9
   1c366:	4d 29 c1             	sub    %r8,%r9
   1c369:	48 85 f6             	test   %rsi,%rsi
   1c36c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c370:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1c374:	48 21 c2             	and    %rax,%rdx
   1c377:	48 29 d1             	sub    %rdx,%rcx
   1c37a:	48 85 c0             	test   %rax,%rax
   1c37d:	48 0f 49 ce          	cmovns %rsi,%rcx
   1c381:	49 39 c9             	cmp    %rcx,%r9
   1c384:	0f 92 c0             	setb   %al
   1c387:	c3                   	ret
   1c388:	cc                   	int3
   1c389:	cc                   	int3
   1c38a:	cc                   	int3
   1c38b:	cc                   	int3
   1c38c:	cc                   	int3
   1c38d:	cc                   	int3
   1c38e:	cc                   	int3
   1c38f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1c390:	31 c0                	xor    %eax,%eax
   1c392:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1c396:	0f 84 8c 00 00 00    	je     1c428 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c39c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1c3a0:	0f 84 82 00 00 00    	je     1c428 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1c3a6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c3ad:	00 00 80 
   1c3b0:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c3b4:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c3b8:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1c3bc:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c3c0:	49 89 d2             	mov    %rdx,%r10
   1c3c3:	49 21 ca             	and    %rcx,%r10
   1c3c6:	49 89 c3             	mov    %rax,%r11
   1c3c9:	4d 29 d3             	sub    %r10,%r11
   1c3cc:	48 85 d2             	test   %rdx,%rdx
   1c3cf:	4d 0f 49 d9          	cmovns %r9,%r11
   1c3d3:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1c3d7:	4d 89 c1             	mov    %r8,%r9
   1c3da:	49 21 c9             	and    %rcx,%r9
   1c3dd:	49 89 c2             	mov    %rax,%r10
   1c3e0:	4d 29 ca             	sub    %r9,%r10
   1c3e3:	4d 85 c0             	test   %r8,%r8
   1c3e6:	4c 0f 49 d2          	cmovns %rdx,%r10
   1c3ea:	4d 39 d3             	cmp    %r10,%r11
   1c3ed:	73 03                	jae    1c3f2 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1c3ef:	31 c0                	xor    %eax,%eax
   1c3f1:	c3                   	ret
   1c3f2:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c3f6:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c3fa:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1c3fe:	49 89 f0             	mov    %rsi,%r8
   1c401:	49 21 c8             	and    %rcx,%r8
   1c404:	49 89 c1             	mov    %rax,%r9
   1c407:	4d 29 c1             	sub    %r8,%r9
   1c40a:	48 85 f6             	test   %rsi,%rsi
   1c40d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c411:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1c415:	48 21 d1             	and    %rdx,%rcx
   1c418:	48 29 c8             	sub    %rcx,%rax
   1c41b:	48 85 d2             	test   %rdx,%rdx
   1c41e:	48 0f 49 c6          	cmovns %rsi,%rax
   1c422:	49 39 c1             	cmp    %rax,%r9
   1c425:	0f 93 c0             	setae  %al
   1c428:	c3                   	ret
   1c429:	cc                   	int3
   1c42a:	cc                   	int3
   1c42b:	cc                   	int3
   1c42c:	cc                   	int3
   1c42d:	cc                   	int3
   1c42e:	cc                   	int3
   1c42f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::max_image:
   1c430:	45 31 c0             	xor    %r8d,%r8d
   1c433:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c437:	0f 85 a3 00 00 00    	jne    1c4e0 <<hyperinterval::float::F64Enclosure>::max_image+0xb0>
   1c43d:	f6 02 01             	testb  $0x1,(%rdx)
   1c440:	0f 84 8e 00 00 00    	je     1c4d4 <<hyperinterval::float::F64Enclosure>::max_image+0xa4>
   1c446:	41 56                	push   %r14
   1c448:	53                   	push   %rbx
   1c449:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c44d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c451:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1c455:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1c459:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c460:	00 00 80 
   1c463:	4c 8d 14 31          	lea    (%rcx,%rsi,1),%r10
   1c467:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c46b:	49 89 cb             	mov    %rcx,%r11
   1c46e:	4d 21 c3             	and    %r8,%r11
   1c471:	48 89 f3             	mov    %rsi,%rbx
   1c474:	4c 29 db             	sub    %r11,%rbx
   1c477:	48 85 c9             	test   %rcx,%rcx
   1c47a:	49 0f 49 da          	cmovns %r10,%rbx
   1c47e:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c482:	4d 89 cb             	mov    %r9,%r11
   1c485:	4d 21 c3             	and    %r8,%r11
   1c488:	49 89 f6             	mov    %rsi,%r14
   1c48b:	4d 29 de             	sub    %r11,%r14
   1c48e:	4d 85 c9             	test   %r9,%r9
   1c491:	4d 0f 49 f2          	cmovns %r10,%r14
   1c495:	4c 39 f3             	cmp    %r14,%rbx
   1c498:	49 0f 42 c9          	cmovb  %r9,%rcx
   1c49c:	4c 8d 0c 30          	lea    (%rax,%rsi,1),%r9
   1c4a0:	49 89 c2             	mov    %rax,%r10
   1c4a3:	4d 21 c2             	and    %r8,%r10
   1c4a6:	49 89 f3             	mov    %rsi,%r11
   1c4a9:	4d 29 d3             	sub    %r10,%r11
   1c4ac:	48 85 c0             	test   %rax,%rax
   1c4af:	4d 0f 49 d9          	cmovns %r9,%r11
   1c4b3:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c4b7:	49 21 d0             	and    %rdx,%r8
   1c4ba:	4c 29 c6             	sub    %r8,%rsi
   1c4bd:	48 85 d2             	test   %rdx,%rdx
   1c4c0:	49 0f 49 f1          	cmovns %r9,%rsi
   1c4c4:	49 39 f3             	cmp    %rsi,%r11
   1c4c7:	48 0f 42 c2          	cmovb  %rdx,%rax
   1c4cb:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c4d1:	5b                   	pop    %rbx
   1c4d2:	41 5e                	pop    %r14
   1c4d4:	4c 89 07             	mov    %r8,(%rdi)
   1c4d7:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1c4db:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1c4df:	c3                   	ret
   1c4e0:	4c 89 07             	mov    %r8,(%rdi)
   1c4e3:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1c4e7:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1c4eb:	c3                   	ret
   1c4ec:	cc                   	int3
   1c4ed:	cc                   	int3
   1c4ee:	cc                   	int3
   1c4ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::min_image:
   1c4f0:	45 31 c0             	xor    %r8d,%r8d
   1c4f3:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1c4f7:	0f 85 a3 00 00 00    	jne    1c5a0 <<hyperinterval::float::F64Enclosure>::min_image+0xb0>
   1c4fd:	f6 02 01             	testb  $0x1,(%rdx)
   1c500:	0f 84 8e 00 00 00    	je     1c594 <<hyperinterval::float::F64Enclosure>::min_image+0xa4>
   1c506:	41 56                	push   %r14
   1c508:	53                   	push   %rbx
   1c509:	4c 8b 4a 08          	mov    0x8(%rdx),%r9
   1c50d:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1c511:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1c515:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1c51c:	00 00 80 
   1c51f:	4c 8d 14 31          	lea    (%rcx,%rsi,1),%r10
   1c523:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   1c527:	49 89 cb             	mov    %rcx,%r11
   1c52a:	4d 21 c3             	and    %r8,%r11
   1c52d:	48 89 f3             	mov    %rsi,%rbx
   1c530:	4c 29 db             	sub    %r11,%rbx
   1c533:	48 85 c9             	test   %rcx,%rcx
   1c536:	49 0f 49 da          	cmovns %r10,%rbx
   1c53a:	4d 8d 14 31          	lea    (%r9,%rsi,1),%r10
   1c53e:	4d 89 cb             	mov    %r9,%r11
   1c541:	4d 21 c3             	and    %r8,%r11
   1c544:	49 89 f6             	mov    %rsi,%r14
   1c547:	4d 29 de             	sub    %r11,%r14
   1c54a:	4d 85 c9             	test   %r9,%r9
   1c54d:	4d 0f 49 f2          	cmovns %r10,%r14
   1c551:	4c 39 f3             	cmp    %r14,%rbx
   1c554:	49 0f 47 c9          	cmova  %r9,%rcx
   1c558:	4c 8d 0c 30          	lea    (%rax,%rsi,1),%r9
   1c55c:	49 89 c2             	mov    %rax,%r10
   1c55f:	4d 21 c2             	and    %r8,%r10
   1c562:	49 89 f3             	mov    %rsi,%r11
   1c565:	4d 29 d3             	sub    %r10,%r11
   1c568:	48 85 c0             	test   %rax,%rax
   1c56b:	4d 0f 49 d9          	cmovns %r9,%r11
   1c56f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1c573:	4c 8d 0c 32          	lea    (%rdx,%rsi,1),%r9
   1c577:	49 21 d0             	and    %rdx,%r8
   1c57a:	4c 29 c6             	sub    %r8,%rsi
   1c57d:	48 85 d2             	test   %rdx,%rdx
   1c580:	49 0f 49 f1          	cmovns %r9,%rsi
   1c584:	49 39 f3             	cmp    %rsi,%r11
   1c587:	48 0f 47 c2          	cmova  %rdx,%rax
   1c58b:	41 b8 01 00 00 00    	mov    $0x1,%r8d
   1c591:	5b                   	pop    %rbx
   1c592:	41 5e                	pop    %r14
   1c594:	4c 89 07             	mov    %r8,(%rdi)
   1c597:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1c59b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1c59f:	c3                   	ret
   1c5a0:	4c 89 07             	mov    %r8,(%rdi)
   1c5a3:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1c5a7:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1c5ab:	c3                   	ret
   1c5ac:	cc                   	int3
   1c5ad:	cc                   	int3
   1c5ae:	cc                   	int3
   1c5af:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1c5b0:	b0 01                	mov    $0x1,%al
   1c5b2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1c5b6:	75 50                	jne    1c608 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1c5b8:	f6 06 01             	testb  $0x1,(%rsi)
   1c5bb:	74 49                	je     1c606 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1c5bd:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1c5c1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1c5c5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1c5cc:	00 00 80 
   1c5cf:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1c5d3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1c5d7:	4d 89 c2             	mov    %r8,%r10
   1c5da:	49 21 ca             	and    %rcx,%r10
   1c5dd:	49 89 c3             	mov    %rax,%r11
   1c5e0:	4d 29 d3             	sub    %r10,%r11
   1c5e3:	4d 85 c0             	test   %r8,%r8
   1c5e6:	4d 0f 49 d9          	cmovns %r9,%r11
   1c5ea:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1c5ee:	49 89 d1             	mov    %rdx,%r9
   1c5f1:	49 21 c9             	and    %rcx,%r9
   1c5f4:	49 89 c2             	mov    %rax,%r10
   1c5f7:	4d 29 ca             	sub    %r9,%r10
   1c5fa:	48 85 d2             	test   %rdx,%rdx
   1c5fd:	4d 0f 49 d0          	cmovns %r8,%r10
   1c601:	4d 39 d3             	cmp    %r10,%r11
   1c604:	76 03                	jbe    1c609 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1c606:	31 c0                	xor    %eax,%eax
   1c608:	c3                   	ret
   1c609:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1c60d:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c611:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c615:	49 89 d0             	mov    %rdx,%r8
   1c618:	49 21 c8             	and    %rcx,%r8
   1c61b:	49 89 c1             	mov    %rax,%r9
   1c61e:	4d 29 c1             	sub    %r8,%r9
   1c621:	48 85 d2             	test   %rdx,%rdx
   1c624:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c628:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c62c:	48 21 f1             	and    %rsi,%rcx
   1c62f:	48 29 c8             	sub    %rcx,%rax
   1c632:	48 85 f6             	test   %rsi,%rsi
   1c635:	48 0f 49 c2          	cmovns %rdx,%rax
   1c639:	49 39 c1             	cmp    %rax,%r9
   1c63c:	0f 96 c0             	setbe  %al
   1c63f:	c3                   	ret

__udivti3:
   4e0b0:	49 89 d0             	mov    %rdx,%r8
   4e0b3:	48 85 c9             	test   %rcx,%rcx
   4e0b6:	74 76                	je     4e12e <__udivti3+0x7e>
   4e0b8:	53                   	push   %rbx
   4e0b9:	4c 0f bd c9          	bsr    %rcx,%r9
   4e0bd:	44 89 ca             	mov    %r9d,%edx
   4e0c0:	83 f2 3f             	xor    $0x3f,%edx
   4e0c3:	b0 40                	mov    $0x40,%al
   4e0c5:	28 d0                	sub    %dl,%al
   4e0c7:	4c 89 c2             	mov    %r8,%rdx
   4e0ca:	49 89 cb             	mov    %rcx,%r11
   4e0cd:	89 c1                	mov    %eax,%ecx
   4e0cf:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4e0d3:	4d 89 da             	mov    %r11,%r10
   4e0d6:	49 d3 ea             	shr    %cl,%r10
   4e0d9:	a8 40                	test   $0x40,%al
   4e0db:	4c 0f 44 d2          	cmove  %rdx,%r10
   4e0df:	48 89 f8             	mov    %rdi,%rax
   4e0e2:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   4e0e7:	48 89 f2             	mov    %rsi,%rdx
   4e0ea:	48 d1 ea             	shr    $1,%rdx
   4e0ed:	49 f7 f2             	div    %r10
   4e0f0:	49 89 c2             	mov    %rax,%r10
   4e0f3:	44 89 c9             	mov    %r9d,%ecx
   4e0f6:	49 d3 ea             	shr    %cl,%r10
   4e0f9:	31 c9                	xor    %ecx,%ecx
   4e0fb:	49 83 ea 01          	sub    $0x1,%r10
   4e0ff:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4e103:	4c 89 db             	mov    %r11,%rbx
   4e106:	4c 89 c0             	mov    %r8,%rax
   4e109:	49 f7 e2             	mul    %r10
   4e10c:	49 89 c1             	mov    %rax,%r9
   4e10f:	4c 89 d0             	mov    %r10,%rax
   4e112:	49 0f af da          	imul   %r10,%rbx
   4e116:	48 01 da             	add    %rbx,%rdx
   4e119:	4c 29 cf             	sub    %r9,%rdi
   4e11c:	48 19 d6             	sbb    %rdx,%rsi
   4e11f:	4c 39 c7             	cmp    %r8,%rdi
   4e122:	4c 19 de             	sbb    %r11,%rsi
   4e125:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4e129:	5b                   	pop    %rbx
   4e12a:	48 89 ca             	mov    %rcx,%rdx
   4e12d:	c3                   	ret
   4e12e:	4c 39 c6             	cmp    %r8,%rsi
   4e131:	73 0f                	jae    4e142 <__udivti3+0x92>
   4e133:	48 89 f8             	mov    %rdi,%rax
   4e136:	48 89 f2             	mov    %rsi,%rdx
   4e139:	49 f7 f0             	div    %r8
   4e13c:	31 c9                	xor    %ecx,%ecx
   4e13e:	48 89 ca             	mov    %rcx,%rdx
   4e141:	c3                   	ret
   4e142:	48 89 f0             	mov    %rsi,%rax
   4e145:	4c 09 c0             	or     %r8,%rax
   4e148:	48 c1 e8 20          	shr    $0x20,%rax
   4e14c:	74 15                	je     4e163 <__udivti3+0xb3>
   4e14e:	48 89 f0             	mov    %rsi,%rax
   4e151:	31 d2                	xor    %edx,%edx
   4e153:	49 f7 f0             	div    %r8
   4e156:	48 89 c1             	mov    %rax,%rcx
   4e159:	48 89 f8             	mov    %rdi,%rax
   4e15c:	49 f7 f0             	div    %r8
   4e15f:	48 89 ca             	mov    %rcx,%rdx
   4e162:	c3                   	ret
   4e163:	89 f0                	mov    %esi,%eax
   4e165:	31 d2                	xor    %edx,%edx
   4e167:	41 f7 f0             	div    %r8d
   4e16a:	89 c1                	mov    %eax,%ecx
   4e16c:	48 89 f8             	mov    %rdi,%rax
   4e16f:	49 f7 f0             	div    %r8
   4e172:	48 89 ca             	mov    %rcx,%rdx
   4e175:	c3                   	ret

Disassembly of section .init:
