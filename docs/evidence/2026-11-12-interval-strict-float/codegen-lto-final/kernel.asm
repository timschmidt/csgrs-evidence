hyperinterval_strict_chain32:
   10d80:	55                   	push   %rbp
   10d81:	41 57                	push   %r15
   10d83:	41 56                	push   %r14
   10d85:	41 55                	push   %r13
   10d87:	41 54                	push   %r12
   10d89:	53                   	push   %rbx
   10d8a:	48 83 ec 68          	sub    $0x68,%rsp
   10d8e:	f3 0f 11 4c 24 4c    	movss  %xmm1,0x4c(%rsp)
   10d94:	48 89 fb             	mov    %rdi,%rbx
   10d97:	41 bc 00 00 00 80    	mov    $0x80000000,%r12d
   10d9d:	66 0f 7e c1          	movd   %xmm0,%ecx
   10da1:	48 89 e7             	mov    %rsp,%rdi
   10da4:	be 00 00 00 80       	mov    $0x80000000,%esi
   10da9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10dae:	e8 9d 80 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   10db3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10db7:	74 27                	je     10de0 <hyperinterval_strict_chain32+0x60>
   10db9:	44 8b 74 24 08       	mov    0x8(%rsp),%r14d
   10dbe:	66 0f 6e 44 24 4c    	movd   0x4c(%rsp),%xmm0
   10dc4:	66 0f 7e c1          	movd   %xmm0,%ecx
   10dc8:	48 89 e7             	mov    %rsp,%rdi
   10dcb:	be 00 00 00 80       	mov    $0x80000000,%esi
   10dd0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10dd5:	e8 76 80 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   10dda:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10dde:	75 20                	jne    10e00 <hyperinterval_strict_chain32+0x80>
   10de0:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   10de5:	88 43 04             	mov    %al,0x4(%rbx)
   10de8:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   10dee:	48 89 d8             	mov    %rbx,%rax
   10df1:	48 83 c4 68          	add    $0x68,%rsp
   10df5:	5b                   	pop    %rbx
   10df6:	41 5c                	pop    %r12
   10df8:	41 5d                	pop    %r13
   10dfa:	41 5e                	pop    %r14
   10dfc:	41 5f                	pop    %r15
   10dfe:	5d                   	pop    %rbp
   10dff:	c3                   	ret
   10e00:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   10e05:	44 89 f0             	mov    %r14d,%eax
   10e08:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   10e0d:	89 e9                	mov    %ebp,%ecx
   10e0f:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   10e15:	ba 00 00 00 80       	mov    $0x80000000,%edx
   10e1a:	29 c2                	sub    %eax,%edx
   10e1c:	44 09 e0             	or     %r12d,%eax
   10e1f:	45 85 f6             	test   %r14d,%r14d
   10e22:	48 0f 49 d0          	cmovns %rax,%rdx
   10e26:	be 00 00 00 80       	mov    $0x80000000,%esi
   10e2b:	29 ce                	sub    %ecx,%esi
   10e2d:	89 c8                	mov    %ecx,%eax
   10e2f:	44 09 e0             	or     %r12d,%eax
   10e32:	85 ed                	test   %ebp,%ebp
   10e34:	48 0f 49 f0          	cmovns %rax,%rsi
   10e38:	b0 01                	mov    $0x1,%al
   10e3a:	39 f2                	cmp    %esi,%edx
   10e3c:	77 a7                	ja     10de5 <hyperinterval_strict_chain32+0x65>
   10e3e:	49 8d 8c 24 00 00 00 	lea    0x3f000000(%r12),%rcx
   10e45:	3f 
   10e46:	48 89 e7             	mov    %rsp,%rdi
   10e49:	be 00 00 00 80       	mov    $0x80000000,%esi
   10e4e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10e53:	e8 f8 7f 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   10e58:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10e5c:	74 82                	je     10de0 <hyperinterval_strict_chain32+0x60>
   10e5e:	44 8b 7c 24 08       	mov    0x8(%rsp),%r15d
   10e63:	48 89 e7             	mov    %rsp,%rdi
   10e66:	be 00 00 00 80       	mov    $0x80000000,%esi
   10e6b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10e70:	b9 00 00 80 3e       	mov    $0x3e800000,%ecx
   10e75:	e8 d6 7f 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   10e7a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10e7e:	0f 84 5c ff ff ff    	je     10de0 <hyperinterval_strict_chain32+0x60>
   10e84:	44 8b 6c 24 08       	mov    0x8(%rsp),%r13d
   10e89:	48 89 e7             	mov    %rsp,%rdi
   10e8c:	be 00 00 00 80       	mov    $0x80000000,%esi
   10e91:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10e96:	4c 89 f1             	mov    %r14,%rcx
   10e99:	4d 89 f8             	mov    %r15,%r8
   10e9c:	4d 89 e9             	mov    %r13,%r9
   10e9f:	e8 5c 9b 00 00       	call   1aa00 <<hyperinterval::ieee::Format>::affine>
   10ea4:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10ea8:	0f 84 32 ff ff ff    	je     10de0 <hyperinterval_strict_chain32+0x60>
   10eae:	89 e9                	mov    %ebp,%ecx
   10eb0:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   10eb4:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   10eb9:	48 89 e7             	mov    %rsp,%rdi
   10ebc:	be 00 00 00 80       	mov    $0x80000000,%esi
   10ec1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10ec6:	4d 89 f8             	mov    %r15,%r8
   10ec9:	4d 89 e9             	mov    %r13,%r9
   10ecc:	e8 2f 9b 00 00       	call   1aa00 <<hyperinterval::ieee::Format>::affine>
   10ed1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10ed5:	0f 84 05 ff ff ff    	je     10de0 <hyperinterval_strict_chain32+0x60>
   10edb:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   10ee0:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   10ee5:	48 89 e7             	mov    %rsp,%rdi
   10ee8:	be 00 00 00 80       	mov    $0x80000000,%esi
   10eed:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10ef2:	48 89 e9             	mov    %rbp,%rcx
   10ef5:	e8 56 7f 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   10efa:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10efe:	74 20                	je     10f20 <hyperinterval_strict_chain32+0x1a0>
   10f00:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   10f05:	48 89 e7             	mov    %rsp,%rdi
   10f08:	be 00 00 00 80       	mov    $0x80000000,%esi
   10f0d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10f12:	4c 89 f1             	mov    %r14,%rcx
   10f15:	e8 36 7f 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   10f1a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   10f1e:	75 13                	jne    10f33 <hyperinterval_strict_chain32+0x1b3>
   10f20:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   10f25:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   10f29:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   10f2e:	e9 b2 fe ff ff       	jmp    10de5 <hyperinterval_strict_chain32+0x65>
   10f33:	8b 44 24 08          	mov    0x8(%rsp),%eax
   10f37:	89 e9                	mov    %ebp,%ecx
   10f39:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   10f3f:	89 c2                	mov    %eax,%edx
   10f41:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   10f47:	be 00 00 00 80       	mov    $0x80000000,%esi
   10f4c:	29 ce                	sub    %ecx,%esi
   10f4e:	44 09 e1             	or     %r12d,%ecx
   10f51:	85 ed                	test   %ebp,%ebp
   10f53:	48 0f 49 f1          	cmovns %rcx,%rsi
   10f57:	bf 00 00 00 80       	mov    $0x80000000,%edi
   10f5c:	29 d7                	sub    %edx,%edi
   10f5e:	89 d1                	mov    %edx,%ecx
   10f60:	44 09 e1             	or     %r12d,%ecx
   10f63:	85 c0                	test   %eax,%eax
   10f65:	48 0f 49 f9          	cmovns %rcx,%rdi
   10f69:	b1 01                	mov    $0x1,%cl
   10f6b:	39 fe                	cmp    %edi,%esi
   10f6d:	77 b6                	ja     10f25 <hyperinterval_strict_chain32+0x1a5>
   10f6f:	89 e9                	mov    %ebp,%ecx
   10f71:	c1 e9 08             	shr    $0x8,%ecx
   10f74:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   10f7b:	00 
   10f7c:	40 88 6c 24 38       	mov    %bpl,0x38(%rsp)
   10f81:	c1 ed 18             	shr    $0x18,%ebp
   10f84:	40 88 6c 24 3b       	mov    %bpl,0x3b(%rsp)
   10f89:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   10f8e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   10f92:	48 89 e7             	mov    %rsp,%rdi
   10f95:	4c 89 ee             	mov    %r13,%rsi
   10f98:	4c 89 fa             	mov    %r15,%rdx
   10f9b:	e8 d0 92 00 00       	call   1a270 <<hyperinterval::float::F32Enclosure>::from_bits>
   10fa0:	8b 0c 24             	mov    (%rsp),%ecx
   10fa3:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   10fa8:	83 f9 02             	cmp    $0x2,%ecx
   10fab:	75 09                	jne    10fb6 <hyperinterval_strict_chain32+0x236>
   10fad:	88 44 24 20          	mov    %al,0x20(%rsp)
   10fb1:	e9 73 ff ff ff       	jmp    10f29 <hyperinterval_strict_chain32+0x1a9>
   10fb6:	8b 54 24 05          	mov    0x5(%rsp),%edx
   10fba:	8b 74 24 08          	mov    0x8(%rsp),%esi
   10fbe:	89 74 24 48          	mov    %esi,0x48(%rsp)
   10fc2:	89 54 24 45          	mov    %edx,0x45(%rsp)
   10fc6:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   10fca:	88 44 24 44          	mov    %al,0x44(%rsp)
   10fce:	48 8d 7c 24 1c       	lea    0x1c(%rsp),%rdi
   10fd3:	48 8d 74 24 34       	lea    0x34(%rsp),%rsi
   10fd8:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
   10fdd:	e8 3e 91 00 00       	call   1a120 <<hyperinterval::float::F32Enclosure>::hull>
   10fe2:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
   10fe6:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   10feb:	83 f9 02             	cmp    $0x2,%ecx
   10fee:	0f 84 f1 fd ff ff    	je     10de5 <hyperinterval_strict_chain32+0x65>
   10ff4:	8b 54 24 21          	mov    0x21(%rsp),%edx
   10ff8:	8b 74 24 24          	mov    0x24(%rsp),%esi
   10ffc:	89 74 24 64          	mov    %esi,0x64(%rsp)
   11000:	89 54 24 61          	mov    %edx,0x61(%rsp)
   11004:	89 4c 24 5c          	mov    %ecx,0x5c(%rsp)
   11008:	88 44 24 60          	mov    %al,0x60(%rsp)
   1100c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   11011:	48 8d 74 24 5c       	lea    0x5c(%rsp),%rsi
   11016:	e8 e5 89 00 00       	call   19a00 <<hyperinterval::float::F32Enclosure>::square>
   1101b:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1101f:	0f b6 44 24 2c       	movzbl 0x2c(%rsp),%eax
   11024:	83 f9 02             	cmp    $0x2,%ecx
   11027:	0f 84 b8 fd ff ff    	je     10de5 <hyperinterval_strict_chain32+0x65>
   1102d:	8b 54 24 2d          	mov    0x2d(%rsp),%edx
   11031:	8b 74 24 30          	mov    0x30(%rsp),%esi
   11035:	89 74 24 24          	mov    %esi,0x24(%rsp)
   11039:	89 54 24 21          	mov    %edx,0x21(%rsp)
   1103d:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
   11041:	88 44 24 20          	mov    %al,0x20(%rsp)
   11045:	48 89 e7             	mov    %rsp,%rdi
   11048:	be 00 00 00 80       	mov    $0x80000000,%esi
   1104d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11052:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11057:	e8 f4 7d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1105c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11060:	0f 84 7a fd ff ff    	je     10de0 <hyperinterval_strict_chain32+0x60>
   11066:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1106b:	89 c1                	mov    %eax,%ecx
   1106d:	c1 e9 08             	shr    $0x8,%ecx
   11070:	89 c2                	mov    %eax,%edx
   11072:	c1 ea 18             	shr    $0x18,%edx
   11075:	88 54 24 3b          	mov    %dl,0x3b(%rsp)
   11079:	66 89 4c 24 39       	mov    %cx,0x39(%rsp)
   1107e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
   11082:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%rsp)
   11089:	00 
   1108a:	88 44 24 38          	mov    %al,0x38(%rsp)
   1108e:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   11093:	48 8d 74 24 1c       	lea    0x1c(%rsp),%rsi
   11098:	48 8d 54 24 34       	lea    0x34(%rsp),%rdx
   1109d:	e8 fe 94 00 00       	call   1a5a0 <<hyperinterval::float::F32Enclosure>::add>
   110a2:	8b 44 24 50          	mov    0x50(%rsp),%eax
   110a6:	0f b6 4c 24 54       	movzbl 0x54(%rsp),%ecx
   110ab:	83 f8 02             	cmp    $0x2,%eax
   110ae:	75 08                	jne    110b8 <hyperinterval_strict_chain32+0x338>
   110b0:	88 4b 04             	mov    %cl,0x4(%rbx)
   110b3:	e9 30 fd ff ff       	jmp    10de8 <hyperinterval_strict_chain32+0x68>
   110b8:	8b 54 24 55          	mov    0x55(%rsp),%edx
   110bc:	8b 74 24 58          	mov    0x58(%rsp),%esi
   110c0:	89 74 24 30          	mov    %esi,0x30(%rsp)
   110c4:	89 54 24 2d          	mov    %edx,0x2d(%rsp)
   110c8:	89 44 24 28          	mov    %eax,0x28(%rsp)
   110cc:	88 4c 24 2c          	mov    %cl,0x2c(%rsp)
   110d0:	85 c0                	test   %eax,%eax
   110d2:	74 4c                	je     11120 <hyperinterval_strict_chain32+0x3a0>
   110d4:	48 89 e7             	mov    %rsp,%rdi
   110d7:	be 00 00 00 80       	mov    $0x80000000,%esi
   110dc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   110e1:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   110e6:	e8 65 7d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   110eb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   110ef:	74 22                	je     11113 <hyperinterval_strict_chain32+0x393>
   110f1:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   110f6:	48 89 e7             	mov    %rsp,%rdi
   110f9:	be 00 00 00 80       	mov    $0x80000000,%esi
   110fe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11103:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11108:	e8 43 7d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1110d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11111:	75 18                	jne    1112b <hyperinterval_strict_chain32+0x3ab>
   11113:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   11118:	88 4b 04             	mov    %cl,0x4(%rbx)
   1111b:	e9 c8 fc ff ff       	jmp    10de8 <hyperinterval_strict_chain32+0x68>
   11120:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   11126:	e9 c3 fc ff ff       	jmp    10dee <hyperinterval_strict_chain32+0x6e>
   1112b:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1112f:	44 89 f1             	mov    %r14d,%ecx
   11132:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11138:	89 c2                	mov    %eax,%edx
   1113a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11140:	be 00 00 00 80       	mov    $0x80000000,%esi
   11145:	29 ce                	sub    %ecx,%esi
   11147:	44 09 e1             	or     %r12d,%ecx
   1114a:	45 85 f6             	test   %r14d,%r14d
   1114d:	48 0f 49 f1          	cmovns %rcx,%rsi
   11151:	89 d1                	mov    %edx,%ecx
   11153:	44 09 e1             	or     %r12d,%ecx
   11156:	41 29 d4             	sub    %edx,%r12d
   11159:	85 c0                	test   %eax,%eax
   1115b:	4c 0f 49 e1          	cmovns %rcx,%r12
   1115f:	b1 01                	mov    $0x1,%cl
   11161:	44 39 e6             	cmp    %r12d,%esi
   11164:	0f 87 46 ff ff ff    	ja     110b0 <hyperinterval_strict_chain32+0x330>
   1116a:	44 89 f1             	mov    %r14d,%ecx
   1116d:	c1 e9 08             	shr    $0x8,%ecx
   11170:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%rsp)
   11177:	00 
   11178:	44 88 74 24 44       	mov    %r14b,0x44(%rsp)
   1117d:	41 c1 ee 18          	shr    $0x18,%r14d
   11181:	44 88 74 24 47       	mov    %r14b,0x47(%rsp)
   11186:	66 89 4c 24 45       	mov    %cx,0x45(%rsp)
   1118b:	89 44 24 48          	mov    %eax,0x48(%rsp)
   1118f:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%rsp)
   11194:	7f 15                	jg     111ab <hyperinterval_strict_chain32+0x42b>
   11196:	8b 44 24 30          	mov    0x30(%rsp),%eax
   1119a:	85 c0                	test   %eax,%eax
   1119c:	0f 99 c1             	setns  %cl
   1119f:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   111a4:	0f 94 c0             	sete   %al
   111a7:	08 c8                	or     %cl,%al
   111a9:	75 17                	jne    111c2 <hyperinterval_strict_chain32+0x442>
   111ab:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
   111b0:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   111b5:	48 89 df             	mov    %rbx,%rdi
   111b8:	e8 d3 7c 00 00       	call   18e90 <<hyperinterval::float::F32Enclosure>::corner_image>
   111bd:	e9 2c fc ff ff       	jmp    10dee <hyperinterval_strict_chain32+0x6e>
   111c2:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   111c6:	e9 1d fc ff ff       	jmp    10de8 <hyperinterval_strict_chain32+0x68>
   111cb:	cc                   	int3
   111cc:	cc                   	int3
   111cd:	cc                   	int3
   111ce:	cc                   	int3
   111cf:	cc                   	int3

hyperinterval_strict_chain64:
   111d0:	55                   	push   %rbp
   111d1:	41 57                	push   %r15
   111d3:	41 56                	push   %r14
   111d5:	41 55                	push   %r13
   111d7:	41 54                	push   %r12
   111d9:	53                   	push   %rbx
   111da:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   111e1:	f2 0f 11 4c 24 18    	movsd  %xmm1,0x18(%rsp)
   111e7:	48 89 fb             	mov    %rdi,%rbx
   111ea:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   111f1:	00 00 80 
   111f4:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   111fb:	00 f0 7f 
   111fe:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   11203:	48 89 e7             	mov    %rsp,%rdi
   11206:	4c 89 f6             	mov    %r14,%rsi
   11209:	4c 89 fa             	mov    %r15,%rdx
   1120c:	e8 3f 7c 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11211:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11215:	74 24                	je     1123b <hyperinterval_strict_chain64+0x6b>
   11217:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1121c:	f3 0f 7e 44 24 18    	movq   0x18(%rsp),%xmm0
   11222:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   11227:	48 89 e7             	mov    %rsp,%rdi
   1122a:	4c 89 f6             	mov    %r14,%rsi
   1122d:	4c 89 fa             	mov    %r15,%rdx
   11230:	e8 1b 7c 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11235:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11239:	75 24                	jne    1125f <hyperinterval_strict_chain64+0x8f>
   1123b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11240:	88 43 08             	mov    %al,0x8(%rbx)
   11243:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1124a:	48 89 d8             	mov    %rbx,%rax
   1124d:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   11254:	5b                   	pop    %rbx
   11255:	41 5c                	pop    %r12
   11257:	41 5d                	pop    %r13
   11259:	41 5e                	pop    %r14
   1125b:	41 5f                	pop    %r15
   1125d:	5d                   	pop    %rbp
   1125e:	c3                   	ret
   1125f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   11264:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   11268:	49 8d 6e ff          	lea    -0x1(%r14),%rbp
   1126c:	4c 89 e9             	mov    %r13,%rcx
   1126f:	48 21 e9             	and    %rbp,%rcx
   11272:	4c 89 f2             	mov    %r14,%rdx
   11275:	48 29 ca             	sub    %rcx,%rdx
   11278:	4d 85 ed             	test   %r13,%r13
   1127b:	48 0f 49 d0          	cmovns %rax,%rdx
   1127f:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   11283:	4c 89 e1             	mov    %r12,%rcx
   11286:	48 21 e9             	and    %rbp,%rcx
   11289:	4c 89 f6             	mov    %r14,%rsi
   1128c:	48 29 ce             	sub    %rcx,%rsi
   1128f:	4d 85 e4             	test   %r12,%r12
   11292:	48 0f 49 f0          	cmovns %rax,%rsi
   11296:	b0 01                	mov    $0x1,%al
   11298:	48 39 f2             	cmp    %rsi,%rdx
   1129b:	77 a3                	ja     11240 <hyperinterval_strict_chain64+0x70>
   1129d:	48 89 e7             	mov    %rsp,%rdi
   112a0:	48 b9 00 00 00 00 00 	movabs $0xbfe0000000000000,%rcx
   112a7:	00 e0 bf 
   112aa:	4c 89 f6             	mov    %r14,%rsi
   112ad:	4c 89 fa             	mov    %r15,%rdx
   112b0:	e8 9b 7b 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   112b5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   112b9:	74 80                	je     1123b <hyperinterval_strict_chain64+0x6b>
   112bb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   112c0:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   112c5:	48 89 e7             	mov    %rsp,%rdi
   112c8:	48 b9 00 00 00 00 00 	movabs $0x3fd0000000000000,%rcx
   112cf:	00 d0 3f 
   112d2:	4c 89 f6             	mov    %r14,%rsi
   112d5:	4c 89 fa             	mov    %r15,%rdx
   112d8:	e8 73 7b 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   112dd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   112e1:	0f 84 54 ff ff ff    	je     1123b <hyperinterval_strict_chain64+0x6b>
   112e7:	4c 8b 4c 24 08       	mov    0x8(%rsp),%r9
   112ec:	48 89 e7             	mov    %rsp,%rdi
   112ef:	4c 89 f6             	mov    %r14,%rsi
   112f2:	4c 89 fa             	mov    %r15,%rdx
   112f5:	4c 89 e9             	mov    %r13,%rcx
   112f8:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   112fd:	4d 89 cd             	mov    %r9,%r13
   11300:	e8 fb 96 00 00       	call   1aa00 <<hyperinterval::ieee::Format>::affine>
   11305:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11309:	0f 84 2c ff ff ff    	je     1123b <hyperinterval_strict_chain64+0x6b>
   1130f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11314:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   1131b:	00 
   1131c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11321:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
   11328:	00 
   11329:	48 89 e7             	mov    %rsp,%rdi
   1132c:	4c 89 f6             	mov    %r14,%rsi
   1132f:	4c 89 fa             	mov    %r15,%rdx
   11332:	4c 89 e1             	mov    %r12,%rcx
   11335:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   1133a:	4d 89 e9             	mov    %r13,%r9
   1133d:	e8 be 96 00 00       	call   1aa00 <<hyperinterval::ieee::Format>::affine>
   11342:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11346:	0f 84 ef fe ff ff    	je     1123b <hyperinterval_strict_chain64+0x6b>
   1134c:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   11351:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11356:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1135b:	48 89 e7             	mov    %rsp,%rdi
   1135e:	4c 89 f6             	mov    %r14,%rsi
   11361:	4c 89 fa             	mov    %r15,%rdx
   11364:	48 8b 8c 24 a0 00 00 	mov    0xa0(%rsp),%rcx
   1136b:	00 
   1136c:	e8 df 7a 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11371:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11375:	74 21                	je     11398 <hyperinterval_strict_chain64+0x1c8>
   11377:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1137c:	48 89 e7             	mov    %rsp,%rdi
   1137f:	4c 89 f6             	mov    %r14,%rsi
   11382:	4c 89 fa             	mov    %r15,%rdx
   11385:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   1138c:	00 
   1138d:	e8 be 7a 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11392:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11396:	75 13                	jne    113ab <hyperinterval_strict_chain64+0x1db>
   11398:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   1139d:	88 4c 24 28          	mov    %cl,0x28(%rsp)
   113a1:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   113a6:	e9 95 fe ff ff       	jmp    11240 <hyperinterval_strict_chain64+0x70>
   113ab:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   113b0:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   113b4:	4c 89 ea             	mov    %r13,%rdx
   113b7:	48 21 ea             	and    %rbp,%rdx
   113ba:	4c 89 f6             	mov    %r14,%rsi
   113bd:	48 29 d6             	sub    %rdx,%rsi
   113c0:	4d 85 ed             	test   %r13,%r13
   113c3:	48 0f 49 f1          	cmovns %rcx,%rsi
   113c7:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   113cb:	48 89 c2             	mov    %rax,%rdx
   113ce:	48 21 ea             	and    %rbp,%rdx
   113d1:	4c 89 f7             	mov    %r14,%rdi
   113d4:	48 29 d7             	sub    %rdx,%rdi
   113d7:	48 85 c0             	test   %rax,%rax
   113da:	48 0f 49 f9          	cmovns %rcx,%rdi
   113de:	b1 01                	mov    $0x1,%cl
   113e0:	48 39 fe             	cmp    %rdi,%rsi
   113e3:	77 b8                	ja     1139d <hyperinterval_strict_chain64+0x1cd>
   113e5:	48 c7 84 24 80 00 00 	movq   $0x1,0x80(%rsp)
   113ec:	00 01 00 00 00 
   113f1:	4c 89 ac 24 88 00 00 	mov    %r13,0x88(%rsp)
   113f8:	00 
   113f9:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   11400:	00 
   11401:	48 89 e7             	mov    %rsp,%rdi
   11404:	4c 89 e6             	mov    %r12,%rsi
   11407:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
   1140c:	e8 2f a5 00 00       	call   1b940 <<hyperinterval::float::F64Enclosure>::from_bits>
   11411:	48 8b 0c 24          	mov    (%rsp),%rcx
   11415:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1141a:	48 83 f9 02          	cmp    $0x2,%rcx
   1141e:	75 09                	jne    11429 <hyperinterval_strict_chain64+0x259>
   11420:	88 44 24 28          	mov    %al,0x28(%rsp)
   11424:	e9 78 ff ff ff       	jmp    113a1 <hyperinterval_strict_chain64+0x1d1>
   11429:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1142e:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   11433:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   11438:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   1143d:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   11442:	88 44 24 70          	mov    %al,0x70(%rsp)
   11446:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1144b:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   11452:	00 
   11453:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   11458:	e8 83 a3 00 00       	call   1b7e0 <<hyperinterval::float::F64Enclosure>::hull>
   1145d:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
   11462:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   11467:	48 83 f9 02          	cmp    $0x2,%rcx
   1146b:	0f 84 cf fd ff ff    	je     11240 <hyperinterval_strict_chain64+0x70>
   11471:	48 8b 54 24 29       	mov    0x29(%rsp),%rdx
   11476:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   1147b:	48 89 b4 24 90 00 00 	mov    %rsi,0x90(%rsp)
   11482:	00 
   11483:	48 89 94 24 89 00 00 	mov    %rdx,0x89(%rsp)
   1148a:	00 
   1148b:	48 89 8c 24 80 00 00 	mov    %rcx,0x80(%rsp)
   11492:	00 
   11493:	88 84 24 88 00 00 00 	mov    %al,0x88(%rsp)
   1149a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   1149f:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   114a6:	00 
   114a7:	e8 f4 9f 00 00       	call   1b4a0 <<hyperinterval::float::F64Enclosure>::square>
   114ac:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   114b1:	0f b6 44 24 58       	movzbl 0x58(%rsp),%eax
   114b6:	48 83 f9 02          	cmp    $0x2,%rcx
   114ba:	0f 84 80 fd ff ff    	je     11240 <hyperinterval_strict_chain64+0x70>
   114c0:	49 bc 00 00 00 00 00 	movabs $0x3ff0000000000000,%r12
   114c7:	00 f0 3f 
   114ca:	48 8b 54 24 59       	mov    0x59(%rsp),%rdx
   114cf:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
   114d4:	48 89 74 24 30       	mov    %rsi,0x30(%rsp)
   114d9:	48 89 54 24 29       	mov    %rdx,0x29(%rsp)
   114de:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
   114e3:	88 44 24 28          	mov    %al,0x28(%rsp)
   114e7:	48 89 e7             	mov    %rsp,%rdi
   114ea:	4c 89 f6             	mov    %r14,%rsi
   114ed:	4c 89 fa             	mov    %r15,%rdx
   114f0:	4c 89 e1             	mov    %r12,%rcx
   114f3:	e8 58 79 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   114f8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   114fc:	0f 84 39 fd ff ff    	je     1123b <hyperinterval_strict_chain64+0x6b>
   11502:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11507:	48 89 c1             	mov    %rax,%rcx
   1150a:	48 c1 e9 08          	shr    $0x8,%rcx
   1150e:	48 89 c2             	mov    %rax,%rdx
   11511:	48 c1 ea 38          	shr    $0x38,%rdx
   11515:	88 54 24 77          	mov    %dl,0x77(%rsp)
   11519:	48 89 c2             	mov    %rax,%rdx
   1151c:	48 c1 ea 28          	shr    $0x28,%rdx
   11520:	66 89 54 24 75       	mov    %dx,0x75(%rsp)
   11525:	89 4c 24 71          	mov    %ecx,0x71(%rsp)
   11529:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   1152e:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   11535:	00 00 
   11537:	88 44 24 70          	mov    %al,0x70(%rsp)
   1153b:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   11540:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
   11545:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   1154a:	e8 11 a7 00 00       	call   1bc60 <<hyperinterval::float::F64Enclosure>::add>
   1154f:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   11554:	0f b6 4c 24 40       	movzbl 0x40(%rsp),%ecx
   11559:	48 83 f8 02          	cmp    $0x2,%rax
   1155d:	75 08                	jne    11567 <hyperinterval_strict_chain64+0x397>
   1155f:	88 4b 08             	mov    %cl,0x8(%rbx)
   11562:	e9 dc fc ff ff       	jmp    11243 <hyperinterval_strict_chain64+0x73>
   11567:	48 8b 54 24 41       	mov    0x41(%rsp),%rdx
   1156c:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
   11571:	48 89 74 24 60       	mov    %rsi,0x60(%rsp)
   11576:	48 89 54 24 59       	mov    %rdx,0x59(%rsp)
   1157b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   11580:	88 4c 24 58          	mov    %cl,0x58(%rsp)
   11584:	48 85 c0             	test   %rax,%rax
   11587:	74 46                	je     115cf <hyperinterval_strict_chain64+0x3ff>
   11589:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1158e:	4c 89 f6             	mov    %r14,%rsi
   11591:	4c 89 fa             	mov    %r15,%rdx
   11594:	4c 89 e1             	mov    %r12,%rcx
   11597:	e8 b4 78 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1159c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   115a1:	74 1f                	je     115c2 <hyperinterval_strict_chain64+0x3f2>
   115a3:	4c 8b 6c 24 40       	mov    0x40(%rsp),%r13
   115a8:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   115ad:	4c 89 f6             	mov    %r14,%rsi
   115b0:	4c 89 fa             	mov    %r15,%rdx
   115b3:	4c 89 e1             	mov    %r12,%rcx
   115b6:	e8 95 78 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   115bb:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   115c0:	75 19                	jne    115db <hyperinterval_strict_chain64+0x40b>
   115c2:	0f b6 4c 24 39       	movzbl 0x39(%rsp),%ecx
   115c7:	88 4b 08             	mov    %cl,0x8(%rbx)
   115ca:	e9 74 fc ff ff       	jmp    11243 <hyperinterval_strict_chain64+0x73>
   115cf:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   115d6:	e9 6f fc ff ff       	jmp    1124a <hyperinterval_strict_chain64+0x7a>
   115db:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   115e0:	4b 8d 0c 2e          	lea    (%r14,%r13,1),%rcx
   115e4:	4c 89 ea             	mov    %r13,%rdx
   115e7:	48 21 ea             	and    %rbp,%rdx
   115ea:	4c 89 f6             	mov    %r14,%rsi
   115ed:	48 29 d6             	sub    %rdx,%rsi
   115f0:	4d 85 ed             	test   %r13,%r13
   115f3:	48 0f 49 f1          	cmovns %rcx,%rsi
   115f7:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   115fb:	48 89 c2             	mov    %rax,%rdx
   115fe:	48 21 ea             	and    %rbp,%rdx
   11601:	49 29 d6             	sub    %rdx,%r14
   11604:	48 85 c0             	test   %rax,%rax
   11607:	4c 0f 49 f1          	cmovns %rcx,%r14
   1160b:	b1 01                	mov    $0x1,%cl
   1160d:	4c 39 f6             	cmp    %r14,%rsi
   11610:	0f 87 49 ff ff ff    	ja     1155f <hyperinterval_strict_chain64+0x38f>
   11616:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   1161d:	00 
   1161e:	4c 89 6c 24 08       	mov    %r13,0x8(%rsp)
   11623:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   11628:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
   1162e:	7f 0f                	jg     1163f <hyperinterval_strict_chain64+0x46f>
   11630:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   11635:	48 85 c0             	test   %rax,%rax
   11638:	79 1a                	jns    11654 <hyperinterval_strict_chain64+0x484>
   1163a:	48 21 e8             	and    %rbp,%rax
   1163d:	74 15                	je     11654 <hyperinterval_strict_chain64+0x484>
   1163f:	48 89 e6             	mov    %rsp,%rsi
   11642:	48 8d 54 24 50       	lea    0x50(%rsp),%rdx
   11647:	48 89 df             	mov    %rbx,%rdi
   1164a:	e8 c1 99 00 00       	call   1b010 <<hyperinterval::float::F64Enclosure>::corner_image>
   1164f:	e9 f6 fb ff ff       	jmp    1124a <hyperinterval_strict_chain64+0x7a>
   11654:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   11658:	e9 e6 fb ff ff       	jmp    11243 <hyperinterval_strict_chain64+0x73>
   1165d:	cc                   	int3
   1165e:	cc                   	int3
   1165f:	cc                   	int3

hyperinterval_strict_surface32:
   11660:	55                   	push   %rbp
   11661:	41 57                	push   %r15
   11663:	41 56                	push   %r14
   11665:	41 55                	push   %r13
   11667:	41 54                	push   %r12
   11669:	53                   	push   %rbx
   1166a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   11671:	41 89 f7             	mov    %esi,%r15d
   11674:	66 0f 7e 4c 24 60    	movd   %xmm1,0x60(%rsp)
   1167a:	48 89 fd             	mov    %rdi,%rbp
   1167d:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   11683:	66 0f 7e 44 24 74    	movd   %xmm0,0x74(%rsp)
   11689:	66 0f 7e c3          	movd   %xmm0,%ebx
   1168d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11692:	be 00 00 00 80       	mov    $0x80000000,%esi
   11697:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1169c:	48 89 d9             	mov    %rbx,%rcx
   1169f:	e8 ac 77 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   116a4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   116a9:	74 2e                	je     116d9 <hyperinterval_strict_surface32+0x79>
   116ab:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   116b0:	66 0f 6e 44 24 60    	movd   0x60(%rsp),%xmm0
   116b6:	66 41 0f 7e c6       	movd   %xmm0,%r14d
   116bb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   116c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   116c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   116ca:	4c 89 f1             	mov    %r14,%rcx
   116cd:	e8 7e 77 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   116d2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   116d7:	75 24                	jne    116fd <hyperinterval_strict_surface32+0x9d>
   116d9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   116de:	88 45 04             	mov    %al,0x4(%rbp)
   116e1:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   116e8:	48 89 e8             	mov    %rbp,%rax
   116eb:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   116f2:	5b                   	pop    %rbx
   116f3:	41 5c                	pop    %r12
   116f5:	41 5d                	pop    %r13
   116f7:	41 5e                	pop    %r14
   116f9:	41 5f                	pop    %r15
   116fb:	5d                   	pop    %rbp
   116fc:	c3                   	ret
   116fd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   11702:	44 89 e0             	mov    %r12d,%eax
   11705:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1170a:	89 f9                	mov    %edi,%ecx
   1170c:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11712:	ba 00 00 00 80       	mov    $0x80000000,%edx
   11717:	29 c2                	sub    %eax,%edx
   11719:	44 09 e8             	or     %r13d,%eax
   1171c:	45 85 e4             	test   %r12d,%r12d
   1171f:	48 0f 49 d0          	cmovns %rax,%rdx
   11723:	be 00 00 00 80       	mov    $0x80000000,%esi
   11728:	29 ce                	sub    %ecx,%esi
   1172a:	89 c8                	mov    %ecx,%eax
   1172c:	44 09 e8             	or     %r13d,%eax
   1172f:	85 ff                	test   %edi,%edi
   11731:	48 0f 49 f0          	cmovns %rax,%rsi
   11735:	b0 01                	mov    $0x1,%al
   11737:	39 f2                	cmp    %esi,%edx
   11739:	77 a3                	ja     116de <hyperinterval_strict_surface32+0x7e>
   1173b:	44 89 e0             	mov    %r12d,%eax
   1173e:	44 89 e1             	mov    %r12d,%ecx
   11741:	c1 e9 08             	shr    $0x8,%ecx
   11744:	41 c1 ec 18          	shr    $0x18,%r12d
   11748:	44 88 64 24 5b       	mov    %r12b,0x5b(%rsp)
   1174d:	66 89 4c 24 59       	mov    %cx,0x59(%rsp)
   11752:	49 89 fc             	mov    %rdi,%r12
   11755:	89 7c 24 5c          	mov    %edi,0x5c(%rsp)
   11759:	c7 44 24 54 01 00 00 	movl   $0x1,0x54(%rsp)
   11760:	00 
   11761:	88 44 24 58          	mov    %al,0x58(%rsp)
   11765:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1176a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1176f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11774:	48 89 d9             	mov    %rbx,%rcx
   11777:	e8 d4 76 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1177c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11781:	75 12                	jne    11795 <hyperinterval_strict_surface32+0x135>
   11783:	0f b6 5c 24 09       	movzbl 0x9(%rsp),%ebx
   11788:	c1 e3 08             	shl    $0x8,%ebx
   1178b:	48 ff c3             	inc    %rbx
   1178e:	f6 c3 01             	test   $0x1,%bl
   11791:	75 61                	jne    117f4 <hyperinterval_strict_surface32+0x194>
   11793:	eb 67                	jmp    117fc <hyperinterval_strict_surface32+0x19c>
   11795:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1179a:	48 89 c1             	mov    %rax,%rcx
   1179d:	4c 31 e9             	xor    %r13,%rcx
   117a0:	48 85 c0             	test   %rax,%rax
   117a3:	48 0f 44 c8          	cmove  %rax,%rcx
   117a7:	31 c0                	xor    %eax,%eax
   117a9:	85 c9                	test   %ecx,%ecx
   117ab:	0f 99 c0             	setns  %al
   117ae:	48 8d 4c 41 ff       	lea    -0x1(%rcx,%rax,2),%rcx
   117b3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   117b8:	be 00 00 00 80       	mov    $0x80000000,%esi
   117bd:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   117c2:	e8 89 76 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   117c7:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   117cc:	75 07                	jne    117d5 <hyperinterval_strict_surface32+0x175>
   117ce:	bb 01 03 00 00       	mov    $0x301,%ebx
   117d3:	eb 1f                	jmp    117f4 <hyperinterval_strict_surface32+0x194>
   117d5:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   117da:	48 89 c3             	mov    %rax,%rbx
   117dd:	48 81 f3 00 00 00 80 	xor    $0xffffffff80000000,%rbx
   117e4:	48 c1 e3 20          	shl    $0x20,%rbx
   117e8:	48 85 c0             	test   %rax,%rax
   117eb:	48 0f 44 d8          	cmove  %rax,%rbx
   117ef:	f6 c3 01             	test   $0x1,%bl
   117f2:	74 08                	je     117fc <hyperinterval_strict_surface32+0x19c>
   117f4:	88 7d 04             	mov    %bh,0x4(%rbp)
   117f7:	e9 e5 fe ff ff       	jmp    116e1 <hyperinterval_strict_surface32+0x81>
   117fc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11801:	be 00 00 00 80       	mov    $0x80000000,%esi
   11806:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1180b:	4c 89 f1             	mov    %r14,%rcx
   1180e:	e8 3d 76 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11813:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11818:	75 11                	jne    1182b <hyperinterval_strict_surface32+0x1cb>
   1181a:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1181f:	c1 e0 08             	shl    $0x8,%eax
   11822:	48 ff c0             	inc    %rax
   11825:	a8 01                	test   $0x1,%al
   11827:	75 42                	jne    1186b <hyperinterval_strict_surface32+0x20b>
   11829:	eb 48                	jmp    11873 <hyperinterval_strict_surface32+0x213>
   1182b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11830:	31 c9                	xor    %ecx,%ecx
   11832:	85 c0                	test   %eax,%eax
   11834:	0f 99 c1             	setns  %cl
   11837:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   1183c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11841:	be 00 00 00 80       	mov    $0x80000000,%esi
   11846:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1184b:	e8 00 76 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11850:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11855:	75 07                	jne    1185e <hyperinterval_strict_surface32+0x1fe>
   11857:	b8 01 03 00 00       	mov    $0x301,%eax
   1185c:	eb 0d                	jmp    1186b <hyperinterval_strict_surface32+0x20b>
   1185e:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11863:	48 c1 e0 20          	shl    $0x20,%rax
   11867:	a8 01                	test   $0x1,%al
   11869:	74 08                	je     11873 <hyperinterval_strict_surface32+0x213>
   1186b:	88 65 04             	mov    %ah,0x4(%rbp)
   1186e:	e9 6e fe ff ff       	jmp    116e1 <hyperinterval_strict_surface32+0x81>
   11873:	49 89 c6             	mov    %rax,%r14
   11876:	48 c1 eb 20          	shr    $0x20,%rbx
   1187a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1187f:	be 00 00 00 80       	mov    $0x80000000,%esi
   11884:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11889:	48 89 d9             	mov    %rbx,%rcx
   1188c:	e8 bf 75 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11891:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11896:	74 27                	je     118bf <hyperinterval_strict_surface32+0x25f>
   11898:	4c 89 f1             	mov    %r14,%rcx
   1189b:	48 c1 e9 20          	shr    $0x20,%rcx
   1189f:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   118a4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   118a9:	be 00 00 00 80       	mov    $0x80000000,%esi
   118ae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   118b3:	e8 98 75 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   118b8:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   118bd:	75 0d                	jne    118cc <hyperinterval_strict_surface32+0x26c>
   118bf:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   118c4:	88 4d 04             	mov    %cl,0x4(%rbp)
   118c7:	e9 15 fe ff ff       	jmp    116e1 <hyperinterval_strict_surface32+0x81>
   118cc:	8b 44 24 10          	mov    0x10(%rsp),%eax
   118d0:	89 d9                	mov    %ebx,%ecx
   118d2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   118d8:	89 c2                	mov    %eax,%edx
   118da:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   118e0:	be 00 00 00 80       	mov    $0x80000000,%esi
   118e5:	29 ce                	sub    %ecx,%esi
   118e7:	44 09 e9             	or     %r13d,%ecx
   118ea:	85 db                	test   %ebx,%ebx
   118ec:	48 0f 49 f1          	cmovns %rcx,%rsi
   118f0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   118f5:	29 d7                	sub    %edx,%edi
   118f7:	89 d1                	mov    %edx,%ecx
   118f9:	44 09 e9             	or     %r13d,%ecx
   118fc:	85 c0                	test   %eax,%eax
   118fe:	48 0f 49 f9          	cmovns %rcx,%rdi
   11902:	b1 01                	mov    $0x1,%cl
   11904:	39 fe                	cmp    %edi,%esi
   11906:	77 bc                	ja     118c4 <hyperinterval_strict_surface32+0x264>
   11908:	89 d9                	mov    %ebx,%ecx
   1190a:	89 da                	mov    %ebx,%edx
   1190c:	c1 ea 08             	shr    $0x8,%edx
   1190f:	c1 eb 18             	shr    $0x18,%ebx
   11912:	88 5c 24 6f          	mov    %bl,0x6f(%rsp)
   11916:	66 89 54 24 6d       	mov    %dx,0x6d(%rsp)
   1191b:	89 44 24 70          	mov    %eax,0x70(%rsp)
   1191f:	c7 44 24 68 01 00 00 	movl   $0x1,0x68(%rsp)
   11926:	00 
   11927:	88 4c 24 6c          	mov    %cl,0x6c(%rsp)
   1192b:	41 83 ff 02          	cmp    $0x2,%r15d
   1192f:	0f 85 b2 00 00 00    	jne    119e7 <hyperinterval_strict_surface32+0x387>
   11935:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1193a:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   1193f:	e8 bc 80 00 00       	call   19a00 <<hyperinterval::float::F32Enclosure>::square>
   11944:	8b 44 24 30          	mov    0x30(%rsp),%eax
   11948:	0f b6 4c 24 34       	movzbl 0x34(%rsp),%ecx
   1194d:	83 f8 02             	cmp    $0x2,%eax
   11950:	0f 84 6e ff ff ff    	je     118c4 <hyperinterval_strict_surface32+0x264>
   11956:	45 31 ff             	xor    %r15d,%r15d
   11959:	a8 01                	test   $0x1,%al
   1195b:	0f 84 4a 01 00 00    	je     11aab <hyperinterval_strict_surface32+0x44b>
   11961:	0f b6 c1             	movzbl %cl,%eax
   11964:	0f b6 4c 24 37       	movzbl 0x37(%rsp),%ecx
   11969:	c1 e1 10             	shl    $0x10,%ecx
   1196c:	0f b7 54 24 35       	movzwl 0x35(%rsp),%edx
   11971:	09 ca                	or     %ecx,%edx
   11973:	8b 5c 24 38          	mov    0x38(%rsp),%ebx
   11977:	c1 e2 08             	shl    $0x8,%edx
   1197a:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   1197d:	85 c9                	test   %ecx,%ecx
   1197f:	8d 84 02 00 00 00 80 	lea    -0x80000000(%rdx,%rax,1),%eax
   11986:	0f 44 c1             	cmove  %ecx,%eax
   11989:	31 c9                	xor    %ecx,%ecx
   1198b:	85 c0                	test   %eax,%eax
   1198d:	0f 99 c1             	setns  %cl
   11990:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   11995:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1199a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1199f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   119a4:	e8 a7 74 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   119a9:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   119ae:	74 30                	je     119e0 <hyperinterval_strict_surface32+0x380>
   119b0:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   119b5:	31 c0                	xor    %eax,%eax
   119b7:	85 db                	test   %ebx,%ebx
   119b9:	0f 99 c0             	setns  %al
   119bc:	48 8d 4c 43 ff       	lea    -0x1(%rbx,%rax,2),%rcx
   119c1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   119c6:	be 00 00 00 80       	mov    $0x80000000,%esi
   119cb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   119d0:	e8 7b 74 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   119d5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   119da:	0f 85 d4 02 00 00    	jne    11cb4 <hyperinterval_strict_surface32+0x654>
   119e0:	b1 03                	mov    $0x3,%cl
   119e2:	e9 dd fe ff ff       	jmp    118c4 <hyperinterval_strict_surface32+0x264>
   119e7:	8b 4c 24 58          	mov    0x58(%rsp),%ecx
   119eb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   119f0:	be 00 00 00 80       	mov    $0x80000000,%esi
   119f5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   119fa:	45 89 f8             	mov    %r15d,%r8d
   119fd:	e8 0e 83 00 00       	call   19d10 <<hyperinterval::ieee::Format>::power>
   11a02:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11a07:	0f 84 b2 fe ff ff    	je     118bf <hyperinterval_strict_surface32+0x25f>
   11a0d:	44 89 e1             	mov    %r12d,%ecx
   11a10:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   11a14:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   11a19:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11a1e:	be 00 00 00 80       	mov    $0x80000000,%esi
   11a23:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11a28:	45 89 f8             	mov    %r15d,%r8d
   11a2b:	e8 e0 82 00 00       	call   19d10 <<hyperinterval::ieee::Format>::power>
   11a30:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11a35:	0f 84 84 fe ff ff    	je     118bf <hyperinterval_strict_surface32+0x25f>
   11a3b:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11a3f:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   11a44:	8b 44 24 18          	mov    0x18(%rsp),%eax
   11a48:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   11a4f:	00 
   11a50:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11a55:	be 00 00 00 80       	mov    $0x80000000,%esi
   11a5a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11a5f:	48 89 d9             	mov    %rbx,%rcx
   11a62:	e8 e9 73 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11a67:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11a6c:	74 27                	je     11a95 <hyperinterval_strict_surface32+0x435>
   11a6e:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   11a73:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11a78:	be 00 00 00 80       	mov    $0x80000000,%esi
   11a7d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11a82:	4c 89 f1             	mov    %r14,%rcx
   11a85:	e8 c6 73 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11a8a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11a8f:	0f 85 c5 02 00 00    	jne    11d5a <hyperinterval_strict_surface32+0x6fa>
   11a95:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   11a9a:	88 4c 24 34          	mov    %cl,0x34(%rsp)
   11a9e:	c7 44 24 30 02 00 00 	movl   $0x2,0x30(%rsp)
   11aa5:	00 
   11aa6:	e9 99 fe ff ff       	jmp    11944 <hyperinterval_strict_surface32+0x2e4>
   11aab:	31 d2                	xor    %edx,%edx
   11aad:	66 89 8c 24 89 00 00 	mov    %cx,0x89(%rsp)
   11ab4:	00 
   11ab5:	c1 e9 10             	shr    $0x10,%ecx
   11ab8:	88 8c 24 8b 00 00 00 	mov    %cl,0x8b(%rsp)
   11abf:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%rsp)
   11ac6:	89 94 24 84 00 00 00 	mov    %edx,0x84(%rsp)
   11acd:	44 88 b4 24 88 00 00 	mov    %r14b,0x88(%rsp)
   11ad4:	00 
   11ad5:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   11adc:	00 
   11add:	48 8d b4 24 84 00 00 	lea    0x84(%rsp),%rsi
   11ae4:	00 
   11ae5:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   11aea:	48 89 df             	mov    %rbx,%rdi
   11aed:	e8 3e 88 00 00       	call   1a330 <<hyperinterval::float::F32Enclosure>::intersection>
   11af2:	4c 8d 74 24 78       	lea    0x78(%rsp),%r14
   11af7:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   11afc:	4c 89 f7             	mov    %r14,%rdi
   11aff:	48 89 de             	mov    %rbx,%rsi
   11b02:	e8 19 86 00 00       	call   1a120 <<hyperinterval::float::F32Enclosure>::hull>
   11b07:	4c 89 f7             	mov    %r14,%rdi
   11b0a:	e8 f1 86 00 00       	call   1a200 <<hyperinterval::float::F32Enclosure>::signs>
   11b0f:	8b 4c 24 78          	mov    0x78(%rsp),%ecx
   11b13:	83 f9 01             	cmp    $0x1,%ecx
   11b16:	75 20                	jne    11b38 <hyperinterval_strict_surface32+0x4d8>
   11b18:	8b 74 24 7c          	mov    0x7c(%rsp),%esi
   11b1c:	8b bc 24 80 00 00 00 	mov    0x80(%rsp),%edi
   11b23:	39 fe                	cmp    %edi,%esi
   11b25:	0f 94 c2             	sete   %dl
   11b28:	66 0f 6e ce          	movd   %esi,%xmm1
   11b2c:	66 0f 6e c7          	movd   %edi,%xmm0
   11b30:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   11b36:	eb 02                	jmp    11b3a <hyperinterval_strict_surface32+0x4da>
   11b38:	31 d2                	xor    %edx,%edx
   11b3a:	80 f1 01             	xor    $0x1,%cl
   11b3d:	44 89 7c 24 08       	mov    %r15d,0x8(%rsp)
   11b42:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   11b48:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   11b4c:	88 54 24 11          	mov    %dl,0x11(%rsp)
   11b50:	88 44 24 12          	mov    %al,0x12(%rsp)
   11b54:	44 89 7c 24 14       	mov    %r15d,0x14(%rsp)
   11b59:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   11b5f:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   11b64:	48 8d 7c 24 78       	lea    0x78(%rsp),%rdi
   11b69:	66 0f 6e 44 24 74    	movd   0x74(%rsp),%xmm0
   11b6f:	e8 cc 88 00 00       	call   1a440 <<hyperinterval::float::F32Enclosure>::contains_point>
   11b74:	41 89 d6             	mov    %edx,%r14d
   11b77:	a8 01                	test   $0x1,%al
   11b79:	74 09                	je     11b84 <hyperinterval_strict_surface32+0x524>
   11b7b:	44 88 75 04          	mov    %r14b,0x4(%rbp)
   11b7f:	e9 5d fb ff ff       	jmp    116e1 <hyperinterval_strict_surface32+0x81>
   11b84:	4c 8d 6c 24 78       	lea    0x78(%rsp),%r13
   11b89:	4c 8d 7c 24 54       	lea    0x54(%rsp),%r15
   11b8e:	4c 89 ef             	mov    %r13,%rdi
   11b91:	4c 89 fe             	mov    %r15,%rsi
   11b94:	e8 27 93 00 00       	call   1aec0 <<hyperinterval::float::F32Enclosure>::overlaps>
   11b99:	88 44 24 60          	mov    %al,0x60(%rsp)
   11b9d:	4c 89 ef             	mov    %r13,%rdi
   11ba0:	4c 89 fe             	mov    %r15,%rsi
   11ba3:	e8 68 92 00 00       	call   1ae10 <<hyperinterval::float::F32Enclosure>::disjoint>
   11ba8:	41 89 c7             	mov    %eax,%r15d
   11bab:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   11bb0:	4c 89 ef             	mov    %r13,%rdi
   11bb3:	e8 48 89 00 00       	call   1a500 <<hyperinterval::float::F32Enclosure>::interior_subset_of>
   11bb8:	89 c3                	mov    %eax,%ebx
   11bba:	4c 89 ef             	mov    %r13,%rdi
   11bbd:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   11bc2:	e8 a9 93 00 00       	call   1af70 <<hyperinterval::float::F32Enclosure>::subset_of>
   11bc7:	88 44 24 08          	mov    %al,0x8(%rsp)
   11bcb:	88 5c 24 09          	mov    %bl,0x9(%rsp)
   11bcf:	44 88 7c 24 0a       	mov    %r15b,0xa(%rsp)
   11bd4:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   11bd9:	88 44 24 0b          	mov    %al,0xb(%rsp)
   11bdd:	44 88 74 24 0c       	mov    %r14b,0xc(%rsp)
   11be2:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   11be7:	8b 44 24 58          	mov    0x58(%rsp),%eax
   11beb:	41 8d 8c 24 00 00 00 	lea    -0x80000000(%r12),%ecx
   11bf2:	80 
   11bf3:	45 85 e4             	test   %r12d,%r12d
   11bf6:	41 0f 44 cc          	cmove  %r12d,%ecx
   11bfa:	8d 90 00 00 00 80    	lea    -0x80000000(%rax),%edx
   11c00:	85 c0                	test   %eax,%eax
   11c02:	0f 44 d0             	cmove  %eax,%edx
   11c05:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%rsp)
   11c0c:	00 
   11c0d:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   11c11:	89 54 24 44          	mov    %edx,0x44(%rsp)
   11c15:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11c1a:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   11c1f:	4c 89 ee             	mov    %r13,%rsi
   11c22:	e8 89 8d 00 00       	call   1a9b0 <<hyperinterval::float::F32Enclosure>::sub>
   11c27:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   11c2b:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   11c30:	83 f9 02             	cmp    $0x2,%ecx
   11c33:	0f 84 a5 fa ff ff    	je     116de <hyperinterval_strict_surface32+0x7e>
   11c39:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   11c3d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   11c41:	89 74 24 50          	mov    %esi,0x50(%rsp)
   11c45:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   11c49:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   11c4d:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   11c51:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11c56:	be 00 00 00 80       	mov    $0x80000000,%esi
   11c5b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11c60:	b9 00 00 00 40       	mov    $0x40000000,%ecx
   11c65:	e8 e6 71 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11c6a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11c6f:	0f 84 64 fa ff ff    	je     116d9 <hyperinterval_strict_surface32+0x79>
   11c75:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11c7a:	89 c1                	mov    %eax,%ecx
   11c7c:	c1 e9 08             	shr    $0x8,%ecx
   11c7f:	89 c2                	mov    %eax,%edx
   11c81:	c1 ea 18             	shr    $0x18,%edx
   11c84:	88 54 24 2b          	mov    %dl,0x2b(%rsp)
   11c88:	66 89 4c 24 29       	mov    %cx,0x29(%rsp)
   11c8d:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   11c91:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%rsp)
   11c98:	00 
   11c99:	88 44 24 28          	mov    %al,0x28(%rsp)
   11c9d:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   11ca2:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   11ca7:	48 89 ef             	mov    %rbp,%rdi
   11caa:	e8 c1 8c 00 00       	call   1a970 <<hyperinterval::float::F32Enclosure>::div>
   11caf:	e9 34 fa ff ff       	jmp    116e8 <hyperinterval_strict_surface32+0x88>
   11cb4:	44 89 f1             	mov    %r14d,%ecx
   11cb7:	4c 31 e9             	xor    %r13,%rcx
   11cba:	4d 85 f6             	test   %r14,%r14
   11cbd:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   11cc1:	49 0f 44 ce          	cmove  %r14,%rcx
   11cc5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11cca:	be 00 00 00 80       	mov    $0x80000000,%esi
   11ccf:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11cd4:	e8 77 71 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11cd9:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11cde:	0f 84 db fb ff ff    	je     118bf <hyperinterval_strict_surface32+0x25f>
   11ce4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   11ce9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11cee:	be 00 00 00 80       	mov    $0x80000000,%esi
   11cf3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11cf8:	48 89 d9             	mov    %rbx,%rcx
   11cfb:	e8 50 71 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11d00:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11d05:	0f 84 b4 fb ff ff    	je     118bf <hyperinterval_strict_surface32+0x25f>
   11d0b:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11d0f:	44 89 f1             	mov    %r14d,%ecx
   11d12:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11d18:	89 c2                	mov    %eax,%edx
   11d1a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11d20:	be 00 00 00 80       	mov    $0x80000000,%esi
   11d25:	29 ce                	sub    %ecx,%esi
   11d27:	44 09 e9             	or     %r13d,%ecx
   11d2a:	45 85 f6             	test   %r14d,%r14d
   11d2d:	48 0f 49 f1          	cmovns %rcx,%rsi
   11d31:	89 d1                	mov    %edx,%ecx
   11d33:	44 09 e9             	or     %r13d,%ecx
   11d36:	41 29 d5             	sub    %edx,%r13d
   11d39:	85 c0                	test   %eax,%eax
   11d3b:	4c 0f 49 e9          	cmovns %rcx,%r13
   11d3f:	b1 01                	mov    $0x1,%cl
   11d41:	44 39 ee             	cmp    %r13d,%esi
   11d44:	0f 87 7a fb ff ff    	ja     118c4 <hyperinterval_strict_surface32+0x264>
   11d4a:	44 89 f1             	mov    %r14d,%ecx
   11d4d:	c1 e9 08             	shr    $0x8,%ecx
   11d50:	ba 01 00 00 00       	mov    $0x1,%edx
   11d55:	e9 53 fd ff ff       	jmp    11aad <hyperinterval_strict_surface32+0x44d>
   11d5a:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11d5e:	89 d9                	mov    %ebx,%ecx
   11d60:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11d66:	89 c2                	mov    %eax,%edx
   11d68:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11d6e:	be 00 00 00 80       	mov    $0x80000000,%esi
   11d73:	29 ce                	sub    %ecx,%esi
   11d75:	44 09 e9             	or     %r13d,%ecx
   11d78:	85 db                	test   %ebx,%ebx
   11d7a:	48 0f 49 f1          	cmovns %rcx,%rsi
   11d7e:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11d83:	29 d7                	sub    %edx,%edi
   11d85:	89 d1                	mov    %edx,%ecx
   11d87:	44 09 e9             	or     %r13d,%ecx
   11d8a:	85 c0                	test   %eax,%eax
   11d8c:	48 0f 49 f9          	cmovns %rcx,%rdi
   11d90:	b1 01                	mov    $0x1,%cl
   11d92:	39 fe                	cmp    %edi,%esi
   11d94:	0f 87 00 fd ff ff    	ja     11a9a <hyperinterval_strict_surface32+0x43a>
   11d9a:	89 d9                	mov    %ebx,%ecx
   11d9c:	c1 e9 08             	shr    $0x8,%ecx
   11d9f:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%rsp)
   11da6:	00 
   11da7:	88 5c 24 40          	mov    %bl,0x40(%rsp)
   11dab:	c1 eb 18             	shr    $0x18,%ebx
   11dae:	88 5c 24 43          	mov    %bl,0x43(%rsp)
   11db2:	66 89 4c 24 41       	mov    %cx,0x41(%rsp)
   11db7:	89 44 24 44          	mov    %eax,0x44(%rsp)
   11dbb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11dc0:	be 00 00 00 80       	mov    $0x80000000,%esi
   11dc5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11dca:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   11dcf:	e8 7c 70 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11dd4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11dd9:	0f 84 b6 fc ff ff    	je     11a95 <hyperinterval_strict_surface32+0x435>
   11ddf:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   11de4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11de9:	be 00 00 00 80       	mov    $0x80000000,%esi
   11dee:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11df3:	48 8b 8c 24 90 00 00 	mov    0x90(%rsp),%rcx
   11dfa:	00 
   11dfb:	e8 50 70 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11e00:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11e05:	0f 84 8a fc ff ff    	je     11a95 <hyperinterval_strict_surface32+0x435>
   11e0b:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11e0f:	89 d9                	mov    %ebx,%ecx
   11e11:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11e17:	89 c2                	mov    %eax,%edx
   11e19:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11e1f:	be 00 00 00 80       	mov    $0x80000000,%esi
   11e24:	29 ce                	sub    %ecx,%esi
   11e26:	44 09 e9             	or     %r13d,%ecx
   11e29:	85 db                	test   %ebx,%ebx
   11e2b:	48 0f 49 f1          	cmovns %rcx,%rsi
   11e2f:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11e34:	29 d7                	sub    %edx,%edi
   11e36:	89 d1                	mov    %edx,%ecx
   11e38:	44 09 e9             	or     %r13d,%ecx
   11e3b:	85 c0                	test   %eax,%eax
   11e3d:	48 0f 49 f9          	cmovns %rcx,%rdi
   11e41:	b1 01                	mov    $0x1,%cl
   11e43:	39 fe                	cmp    %edi,%esi
   11e45:	0f 87 4f fc ff ff    	ja     11a9a <hyperinterval_strict_surface32+0x43a>
   11e4b:	89 d9                	mov    %ebx,%ecx
   11e4d:	c1 e9 08             	shr    $0x8,%ecx
   11e50:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%rsp)
   11e57:	00 
   11e58:	88 5c 24 28          	mov    %bl,0x28(%rsp)
   11e5c:	c1 eb 18             	shr    $0x18,%ebx
   11e5f:	88 5c 24 2b          	mov    %bl,0x2b(%rsp)
   11e63:	66 89 4c 24 29       	mov    %cx,0x29(%rsp)
   11e68:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   11e6c:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   11e71:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   11e76:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   11e7b:	e8 a0 82 00 00       	call   1a120 <<hyperinterval::float::F32Enclosure>::hull>
   11e80:	45 85 ff             	test   %r15d,%r15d
   11e83:	0f 95 c0             	setne  %al
   11e86:	41 f6 c7 01          	test   $0x1,%r15b
   11e8a:	0f 94 c1             	sete   %cl
   11e8d:	84 c8                	test   %cl,%al
   11e8f:	74 79                	je     11f0a <hyperinterval_strict_surface32+0x8aa>
   11e91:	48 8d 7c 24 54       	lea    0x54(%rsp),%rdi
   11e96:	e8 65 83 00 00       	call   1a200 <<hyperinterval::float::F32Enclosure>::signs>
   11e9b:	a8 02                	test   $0x2,%al
   11e9d:	74 6b                	je     11f0a <hyperinterval_strict_surface32+0x8aa>
   11e9f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11ea4:	31 f6                	xor    %esi,%esi
   11ea6:	31 d2                	xor    %edx,%edx
   11ea8:	e8 c3 83 00 00       	call   1a270 <<hyperinterval::float::F32Enclosure>::from_bits>
   11ead:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   11eb1:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   11eb6:	83 f9 02             	cmp    $0x2,%ecx
   11eb9:	75 11                	jne    11ecc <hyperinterval_strict_surface32+0x86c>
   11ebb:	88 44 24 34          	mov    %al,0x34(%rsp)
   11ebf:	c7 44 24 30 02 00 00 	movl   $0x2,0x30(%rsp)
   11ec6:	00 
   11ec7:	e9 78 fa ff ff       	jmp    11944 <hyperinterval_strict_surface32+0x2e4>
   11ecc:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   11ed0:	8b 74 24 10          	mov    0x10(%rsp),%esi
   11ed4:	89 74 24 2c          	mov    %esi,0x2c(%rsp)
   11ed8:	89 54 24 29          	mov    %edx,0x29(%rsp)
   11edc:	89 4c 24 24          	mov    %ecx,0x24(%rsp)
   11ee0:	88 44 24 28          	mov    %al,0x28(%rsp)
   11ee4:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   11ee9:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   11eee:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   11ef3:	e8 28 82 00 00       	call   1a120 <<hyperinterval::float::F32Enclosure>::hull>
   11ef8:	8b 44 24 44          	mov    0x44(%rsp),%eax
   11efc:	89 44 24 50          	mov    %eax,0x50(%rsp)
   11f00:	48 8b 44 24 3c       	mov    0x3c(%rsp),%rax
   11f05:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   11f0a:	8b 44 24 50          	mov    0x50(%rsp),%eax
   11f0e:	89 44 24 38          	mov    %eax,0x38(%rsp)
   11f12:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   11f17:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   11f1c:	e9 23 fa ff ff       	jmp    11944 <hyperinterval_strict_surface32+0x2e4>
   11f21:	cc                   	int3
   11f22:	cc                   	int3
   11f23:	cc                   	int3
   11f24:	cc                   	int3
   11f25:	cc                   	int3
   11f26:	cc                   	int3
   11f27:	cc                   	int3
   11f28:	cc                   	int3
   11f29:	cc                   	int3
   11f2a:	cc                   	int3
   11f2b:	cc                   	int3
   11f2c:	cc                   	int3
   11f2d:	cc                   	int3
   11f2e:	cc                   	int3
   11f2f:	cc                   	int3

hyperinterval_strict_surface64:
   11f30:	55                   	push   %rbp
   11f31:	41 57                	push   %r15
   11f33:	41 56                	push   %r14
   11f35:	41 55                	push   %r13
   11f37:	41 54                	push   %r12
   11f39:	53                   	push   %rbx
   11f3a:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
   11f41:	41 89 f6             	mov    %esi,%r14d
   11f44:	66 0f d6 4c 24 28    	movq   %xmm1,0x28(%rsp)
   11f4a:	48 89 fb             	mov    %rdi,%rbx
   11f4d:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
   11f54:	00 00 80 
   11f57:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   11f5e:	00 f0 7f 
   11f61:	66 0f d6 84 24 00 01 	movq   %xmm0,0x100(%rsp)
   11f68:	00 00 
   11f6a:	66 49 0f 7e c7       	movq   %xmm0,%r15
   11f6f:	48 89 e7             	mov    %rsp,%rdi
   11f72:	48 89 ee             	mov    %rbp,%rsi
   11f75:	4c 89 e2             	mov    %r12,%rdx
   11f78:	4c 89 f9             	mov    %r15,%rcx
   11f7b:	e8 d0 6e 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11f80:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11f84:	74 2c                	je     11fb2 <hyperinterval_strict_surface64+0x82>
   11f86:	44 89 74 24 34       	mov    %r14d,0x34(%rsp)
   11f8b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   11f90:	f3 0f 7e 44 24 28    	movq   0x28(%rsp),%xmm0
   11f96:	66 49 0f 7e c5       	movq   %xmm0,%r13
   11f9b:	48 89 e7             	mov    %rsp,%rdi
   11f9e:	48 89 ee             	mov    %rbp,%rsi
   11fa1:	4c 89 e2             	mov    %r12,%rdx
   11fa4:	4c 89 e9             	mov    %r13,%rcx
   11fa7:	e8 a4 6e 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   11fac:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11fb0:	75 24                	jne    11fd6 <hyperinterval_strict_surface64+0xa6>
   11fb2:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11fb7:	88 43 08             	mov    %al,0x8(%rbx)
   11fba:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   11fc1:	48 89 d8             	mov    %rbx,%rax
   11fc4:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
   11fcb:	5b                   	pop    %rbx
   11fcc:	41 5c                	pop    %r12
   11fce:	41 5d                	pop    %r13
   11fd0:	41 5e                	pop    %r14
   11fd2:	41 5f                	pop    %r15
   11fd4:	5d                   	pop    %rbp
   11fd5:	c3                   	ret
   11fd6:	48 89 ee             	mov    %rbp,%rsi
   11fd9:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   11fde:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   11fe2:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   11fe6:	4c 89 f1             	mov    %r14,%rcx
   11fe9:	4c 21 c1             	and    %r8,%rcx
   11fec:	48 89 f2             	mov    %rsi,%rdx
   11fef:	48 29 ca             	sub    %rcx,%rdx
   11ff2:	4d 85 f6             	test   %r14,%r14
   11ff5:	48 0f 49 d0          	cmovns %rax,%rdx
   11ff9:	48 8d 04 2e          	lea    (%rsi,%rbp,1),%rax
   11ffd:	48 89 e9             	mov    %rbp,%rcx
   12000:	4c 21 c1             	and    %r8,%rcx
   12003:	48 89 f7             	mov    %rsi,%rdi
   12006:	48 29 cf             	sub    %rcx,%rdi
   12009:	48 85 ed             	test   %rbp,%rbp
   1200c:	48 0f 49 f8          	cmovns %rax,%rdi
   12010:	b0 01                	mov    $0x1,%al
   12012:	48 39 fa             	cmp    %rdi,%rdx
   12015:	77 a0                	ja     11fb7 <hyperinterval_strict_surface64+0x87>
   12017:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   1201c:	48 c7 84 24 b8 00 00 	movq   $0x1,0xb8(%rsp)
   12023:	00 01 00 00 00 
   12028:	4c 89 b4 24 98 00 00 	mov    %r14,0x98(%rsp)
   1202f:	00 
   12030:	4c 89 b4 24 c0 00 00 	mov    %r14,0xc0(%rsp)
   12037:	00 
   12038:	48 89 ac 24 c8 00 00 	mov    %rbp,0xc8(%rsp)
   1203f:	00 
   12040:	48 89 e7             	mov    %rsp,%rdi
   12043:	49 89 f6             	mov    %rsi,%r14
   12046:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1204d:	00 f0 7f 
   12050:	4c 89 e2             	mov    %r12,%rdx
   12053:	4c 89 f9             	mov    %r15,%rcx
   12056:	e8 f5 6d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1205b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1205f:	0f 84 4d ff ff ff    	je     11fb2 <hyperinterval_strict_surface64+0x82>
   12065:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1206a:	48 89 c2             	mov    %rax,%rdx
   1206d:	4c 31 f2             	xor    %r14,%rdx
   12070:	48 85 c0             	test   %rax,%rax
   12073:	48 0f 44 d0          	cmove  %rax,%rdx
   12077:	48 89 d1             	mov    %rdx,%rcx
   1207a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   1207e:	48 83 c9 01          	or     $0x1,%rcx
   12082:	48 01 d1             	add    %rdx,%rcx
   12085:	48 89 e7             	mov    %rsp,%rdi
   12088:	4c 89 f6             	mov    %r14,%rsi
   1208b:	4c 89 e2             	mov    %r12,%rdx
   1208e:	e8 bd 6d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   12093:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12097:	75 07                	jne    120a0 <hyperinterval_strict_surface64+0x170>
   12099:	b0 03                	mov    $0x3,%al
   1209b:	e9 17 ff ff ff       	jmp    11fb7 <hyperinterval_strict_surface64+0x87>
   120a0:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   120a5:	49 89 c7             	mov    %rax,%r15
   120a8:	4d 31 f7             	xor    %r14,%r15
   120ab:	48 85 c0             	test   %rax,%rax
   120ae:	4c 0f 44 f8          	cmove  %rax,%r15
   120b2:	48 89 e7             	mov    %rsp,%rdi
   120b5:	4c 89 f6             	mov    %r14,%rsi
   120b8:	4c 89 e2             	mov    %r12,%rdx
   120bb:	4c 89 e9             	mov    %r13,%rcx
   120be:	e8 8d 6d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   120c3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   120c7:	0f 84 e5 fe ff ff    	je     11fb2 <hyperinterval_strict_surface64+0x82>
   120cd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   120d2:	48 89 c1             	mov    %rax,%rcx
   120d5:	48 c1 f9 3f          	sar    $0x3f,%rcx
   120d9:	48 83 c9 01          	or     $0x1,%rcx
   120dd:	48 01 c1             	add    %rax,%rcx
   120e0:	48 89 e7             	mov    %rsp,%rdi
   120e3:	4c 89 f6             	mov    %r14,%rsi
   120e6:	4c 89 e2             	mov    %r12,%rdx
   120e9:	e8 62 6d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   120ee:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   120f2:	74 a5                	je     12099 <hyperinterval_strict_surface64+0x169>
   120f4:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   120f9:	48 89 e7             	mov    %rsp,%rdi
   120fc:	4c 89 f6             	mov    %r14,%rsi
   120ff:	4c 89 e2             	mov    %r12,%rdx
   12102:	4c 89 f9             	mov    %r15,%rcx
   12105:	e8 46 6d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1210a:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1210e:	74 1c                	je     1212c <hyperinterval_strict_surface64+0x1fc>
   12110:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12115:	48 89 e7             	mov    %rsp,%rdi
   12118:	4c 89 f6             	mov    %r14,%rsi
   1211b:	4c 89 e2             	mov    %r12,%rdx
   1211e:	4c 89 e9             	mov    %r13,%rcx
   12121:	e8 2a 6d 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   12126:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1212a:	75 0d                	jne    12139 <hyperinterval_strict_surface64+0x209>
   1212c:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   12131:	88 4b 08             	mov    %cl,0x8(%rbx)
   12134:	e9 81 fe ff ff       	jmp    11fba <hyperinterval_strict_surface64+0x8a>
   12139:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1213e:	4b 8d 0c 37          	lea    (%r15,%r14,1),%rcx
   12142:	4c 89 fa             	mov    %r15,%rdx
   12145:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1214a:	48 21 fa             	and    %rdi,%rdx
   1214d:	4c 89 f6             	mov    %r14,%rsi
   12150:	48 29 d6             	sub    %rdx,%rsi
   12153:	4d 85 ff             	test   %r15,%r15
   12156:	48 0f 49 f1          	cmovns %rcx,%rsi
   1215a:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1215e:	48 89 c2             	mov    %rax,%rdx
   12161:	48 21 fa             	and    %rdi,%rdx
   12164:	4c 89 f7             	mov    %r14,%rdi
   12167:	48 29 d7             	sub    %rdx,%rdi
   1216a:	48 85 c0             	test   %rax,%rax
   1216d:	48 0f 49 f9          	cmovns %rcx,%rdi
   12171:	b1 01                	mov    $0x1,%cl
   12173:	48 39 fe             	cmp    %rdi,%rsi
   12176:	77 b9                	ja     12131 <hyperinterval_strict_surface64+0x201>
   12178:	44 89 f9             	mov    %r15d,%ecx
   1217b:	4c 89 fa             	mov    %r15,%rdx
   1217e:	48 c1 ea 08          	shr    $0x8,%rdx
   12182:	4c 89 fe             	mov    %r15,%rsi
   12185:	48 c1 ee 38          	shr    $0x38,%rsi
   12189:	40 88 b4 24 af 00 00 	mov    %sil,0xaf(%rsp)
   12190:	00 
   12191:	49 c1 ef 28          	shr    $0x28,%r15
   12195:	66 44 89 bc 24 ad 00 	mov    %r15w,0xad(%rsp)
   1219c:	00 00 
   1219e:	89 94 24 a9 00 00 00 	mov    %edx,0xa9(%rsp)
   121a5:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
   121ac:	00 
   121ad:	48 c7 84 24 a0 00 00 	movq   $0x1,0xa0(%rsp)
   121b4:	00 01 00 00 00 
   121b9:	88 8c 24 a8 00 00 00 	mov    %cl,0xa8(%rsp)
   121c0:	44 8b 6c 24 34       	mov    0x34(%rsp),%r13d
   121c5:	41 83 fd 02          	cmp    $0x2,%r13d
   121c9:	0f 85 ce 00 00 00    	jne    1229d <hyperinterval_strict_surface64+0x36d>
   121cf:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   121d4:	48 8d b4 24 b8 00 00 	lea    0xb8(%rsp),%rsi
   121db:	00 
   121dc:	e8 bf 92 00 00       	call   1b4a0 <<hyperinterval::float::F64Enclosure>::square>
   121e1:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   121e8:	00 f0 7f 
   121eb:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   121f0:	0f b6 4c 24 58       	movzbl 0x58(%rsp),%ecx
   121f5:	48 83 f8 02          	cmp    $0x2,%rax
   121f9:	0f 84 32 ff ff ff    	je     12131 <hyperinterval_strict_surface64+0x201>
   121ff:	48 83 f8 01          	cmp    $0x1,%rax
   12203:	0f 85 5f 01 00 00    	jne    12368 <hyperinterval_strict_surface64+0x438>
   12209:	0f b6 c1             	movzbl %cl,%eax
   1220c:	0f b6 4c 24 5f       	movzbl 0x5f(%rsp),%ecx
   12211:	c1 e1 10             	shl    $0x10,%ecx
   12214:	0f b7 54 24 5d       	movzwl 0x5d(%rsp),%edx
   12219:	09 ca                	or     %ecx,%edx
   1221b:	48 c1 e2 20          	shl    $0x20,%rdx
   1221f:	8b 4c 24 59          	mov    0x59(%rsp),%ecx
   12223:	48 09 d1             	or     %rdx,%rcx
   12226:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
   1222b:	48 c1 e1 08          	shl    $0x8,%rcx
   1222f:	48 09 c1             	or     %rax,%rcx
   12232:	48 89 c8             	mov    %rcx,%rax
   12235:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1223c:	00 00 80 
   1223f:	4c 31 f0             	xor    %r14,%rax
   12242:	48 85 c9             	test   %rcx,%rcx
   12245:	48 0f 44 c1          	cmove  %rcx,%rax
   12249:	48 89 c1             	mov    %rax,%rcx
   1224c:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12250:	48 83 c9 01          	or     $0x1,%rcx
   12254:	48 01 c1             	add    %rax,%rcx
   12257:	48 89 e7             	mov    %rsp,%rdi
   1225a:	4c 89 f6             	mov    %r14,%rsi
   1225d:	4c 89 e2             	mov    %r12,%rdx
   12260:	e8 eb 6b 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   12265:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12269:	74 2b                	je     12296 <hyperinterval_strict_surface64+0x366>
   1226b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   12270:	4c 89 f9             	mov    %r15,%rcx
   12273:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12277:	48 83 c9 01          	or     $0x1,%rcx
   1227b:	4c 01 f9             	add    %r15,%rcx
   1227e:	48 89 e7             	mov    %rsp,%rdi
   12281:	4c 89 f6             	mov    %r14,%rsi
   12284:	4c 89 e2             	mov    %r12,%rdx
   12287:	e8 c4 6b 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1228c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12290:	0f 85 13 03 00 00    	jne    125a9 <hyperinterval_strict_surface64+0x679>
   12296:	b1 03                	mov    $0x3,%cl
   12298:	e9 94 fe ff ff       	jmp    12131 <hyperinterval_strict_surface64+0x201>
   1229d:	48 89 e7             	mov    %rsp,%rdi
   122a0:	4c 89 f6             	mov    %r14,%rsi
   122a3:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   122aa:	00 f0 7f 
   122ad:	4c 89 e2             	mov    %r12,%rdx
   122b0:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   122b7:	00 
   122b8:	45 89 e8             	mov    %r13d,%r8d
   122bb:	e8 50 7a 00 00       	call   19d10 <<hyperinterval::ieee::Format>::power>
   122c0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   122c4:	0f 84 62 fe ff ff    	je     1212c <hyperinterval_strict_surface64+0x1fc>
   122ca:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   122cf:	45 89 e8             	mov    %r13d,%r8d
   122d2:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   122d7:	48 89 e7             	mov    %rsp,%rdi
   122da:	4c 89 f6             	mov    %r14,%rsi
   122dd:	4c 89 e2             	mov    %r12,%rdx
   122e0:	48 89 e9             	mov    %rbp,%rcx
   122e3:	e8 28 7a 00 00       	call   19d10 <<hyperinterval::ieee::Format>::power>
   122e8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   122ec:	0f 84 3a fe ff ff    	je     1212c <hyperinterval_strict_surface64+0x1fc>
   122f2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   122f7:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
   122fe:	00 
   122ff:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   12304:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
   1230b:	00 
   1230c:	48 89 e7             	mov    %rsp,%rdi
   1230f:	4c 89 f6             	mov    %r14,%rsi
   12312:	4c 89 e2             	mov    %r12,%rdx
   12315:	4c 89 f9             	mov    %r15,%rcx
   12318:	e8 33 6b 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1231d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12321:	74 2e                	je     12351 <hyperinterval_strict_surface64+0x421>
   12323:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12328:	48 89 e7             	mov    %rsp,%rdi
   1232b:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12332:	00 00 80 
   12335:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1233c:	00 f0 7f 
   1233f:	4c 89 e9             	mov    %r13,%rcx
   12342:	e8 09 6b 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   12347:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1234b:	0f 85 19 03 00 00    	jne    1266a <hyperinterval_strict_surface64+0x73a>
   12351:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   12356:	88 4c 24 58          	mov    %cl,0x58(%rsp)
   1235a:	48 c7 44 24 50 02 00 	movq   $0x2,0x50(%rsp)
   12361:	00 00 
   12363:	e9 79 fe ff ff       	jmp    121e1 <hyperinterval_strict_surface64+0x2b1>
   12368:	31 c9                	xor    %ecx,%ecx
   1236a:	89 94 24 d9 00 00 00 	mov    %edx,0xd9(%rsp)
   12371:	48 89 d6             	mov    %rdx,%rsi
   12374:	48 c1 ee 30          	shr    $0x30,%rsi
   12378:	40 88 b4 24 df 00 00 	mov    %sil,0xdf(%rsp)
   1237f:	00 
   12380:	48 c1 ea 20          	shr    $0x20,%rdx
   12384:	66 89 94 24 dd 00 00 	mov    %dx,0xdd(%rsp)
   1238b:	00 
   1238c:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   12393:	00 
   12394:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   1239b:	00 
   1239c:	44 88 ac 24 d8 00 00 	mov    %r13b,0xd8(%rsp)
   123a3:	00 
   123a4:	4c 8d bc 24 20 01 00 	lea    0x120(%rsp),%r15
   123ab:	00 
   123ac:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
   123b3:	00 
   123b4:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   123bb:	00 
   123bc:	4c 89 ff             	mov    %r15,%rdi
   123bf:	e8 4c 96 00 00       	call   1ba10 <<hyperinterval::float::F64Enclosure>::intersection>
   123c4:	4c 8d ac 24 08 01 00 	lea    0x108(%rsp),%r13
   123cb:	00 
   123cc:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
   123d3:	00 
   123d4:	4c 89 ef             	mov    %r13,%rdi
   123d7:	4c 89 fe             	mov    %r15,%rsi
   123da:	e8 01 94 00 00       	call   1b7e0 <<hyperinterval::float::F64Enclosure>::hull>
   123df:	4c 89 ef             	mov    %r13,%rdi
   123e2:	e8 d9 94 00 00       	call   1b8c0 <<hyperinterval::float::F64Enclosure>::signs>
   123e7:	48 8b 8c 24 08 01 00 	mov    0x108(%rsp),%rcx
   123ee:	00 
   123ef:	48 83 f9 01          	cmp    $0x1,%rcx
   123f3:	48 89 ac 24 f8 00 00 	mov    %rbp,0xf8(%rsp)
   123fa:	00 
   123fb:	75 27                	jne    12424 <hyperinterval_strict_surface64+0x4f4>
   123fd:	48 8b b4 24 10 01 00 	mov    0x110(%rsp),%rsi
   12404:	00 
   12405:	48 8b bc 24 18 01 00 	mov    0x118(%rsp),%rdi
   1240c:	00 
   1240d:	48 39 fe             	cmp    %rdi,%rsi
   12410:	0f 94 c2             	sete   %dl
   12413:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   12418:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   1241d:	be 01 00 00 00       	mov    $0x1,%esi
   12422:	eb 04                	jmp    12428 <hyperinterval_strict_surface64+0x4f8>
   12424:	31 d2                	xor    %edx,%edx
   12426:	31 f6                	xor    %esi,%esi
   12428:	80 f1 01             	xor    $0x1,%cl
   1242b:	48 89 34 24          	mov    %rsi,(%rsp)
   1242f:	66 0f d6 4c 24 08    	movq   %xmm1,0x8(%rsp)
   12435:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   12439:	88 54 24 11          	mov    %dl,0x11(%rsp)
   1243d:	88 44 24 12          	mov    %al,0x12(%rsp)
   12441:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   12446:	66 0f d6 44 24 20    	movq   %xmm0,0x20(%rsp)
   1244c:	48 89 e0             	mov    %rsp,%rax
   1244f:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
   12456:	00 
   12457:	f3 0f 7e 84 24 00 01 	movq   0x100(%rsp),%xmm0
   1245e:	00 00 
   12460:	e8 9b 96 00 00       	call   1bb00 <<hyperinterval::float::F64Enclosure>::contains_point>
   12465:	89 d5                	mov    %edx,%ebp
   12467:	a8 01                	test   $0x1,%al
   12469:	74 09                	je     12474 <hyperinterval_strict_surface64+0x544>
   1246b:	40 88 6b 08          	mov    %bpl,0x8(%rbx)
   1246f:	e9 46 fb ff ff       	jmp    11fba <hyperinterval_strict_surface64+0x8a>
   12474:	4c 8d a4 24 08 01 00 	lea    0x108(%rsp),%r12
   1247b:	00 
   1247c:	4c 8d ac 24 b8 00 00 	lea    0xb8(%rsp),%r13
   12483:	00 
   12484:	4c 89 e7             	mov    %r12,%rdi
   12487:	4c 89 ee             	mov    %r13,%rsi
   1248a:	e8 41 9a 00 00       	call   1bed0 <<hyperinterval::float::F64Enclosure>::overlaps>
   1248f:	88 44 24 28          	mov    %al,0x28(%rsp)
   12493:	4c 89 e7             	mov    %r12,%rdi
   12496:	4c 89 ee             	mov    %r13,%rsi
   12499:	e8 92 99 00 00       	call   1be30 <<hyperinterval::float::F64Enclosure>::disjoint>
   1249e:	41 89 c5             	mov    %eax,%r13d
   124a1:	4c 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%r14
   124a8:	00 
   124a9:	4c 89 e7             	mov    %r12,%rdi
   124ac:	4c 89 f6             	mov    %r14,%rsi
   124af:	e8 0c 97 00 00       	call   1bbc0 <<hyperinterval::float::F64Enclosure>::interior_subset_of>
   124b4:	41 89 c7             	mov    %eax,%r15d
   124b7:	4c 89 e7             	mov    %r12,%rdi
   124ba:	4c 89 f6             	mov    %r14,%rsi
   124bd:	e8 ae 9a 00 00       	call   1bf70 <<hyperinterval::float::F64Enclosure>::subset_of>
   124c2:	88 04 24             	mov    %al,(%rsp)
   124c5:	44 88 7c 24 01       	mov    %r15b,0x1(%rsp)
   124ca:	44 88 6c 24 02       	mov    %r13b,0x2(%rsp)
   124cf:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   124d4:	88 44 24 03          	mov    %al,0x3(%rsp)
   124d8:	40 88 6c 24 04       	mov    %bpl,0x4(%rsp)
   124dd:	48 89 e0             	mov    %rsp,%rax
   124e0:	48 8b b4 24 f8 00 00 	mov    0xf8(%rsp),%rsi
   124e7:	00 
   124e8:	48 89 f1             	mov    %rsi,%rcx
   124eb:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   124f2:	00 00 80 
   124f5:	48 31 f9             	xor    %rdi,%rcx
   124f8:	48 85 f6             	test   %rsi,%rsi
   124fb:	48 0f 44 ce          	cmove  %rsi,%rcx
   124ff:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
   12506:	00 
   12507:	48 89 f2             	mov    %rsi,%rdx
   1250a:	49 89 fe             	mov    %rdi,%r14
   1250d:	48 31 fa             	xor    %rdi,%rdx
   12510:	48 85 f6             	test   %rsi,%rsi
   12513:	48 0f 44 d6          	cmove  %rsi,%rdx
   12517:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   1251e:	00 00 
   12520:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
   12525:	48 89 54 24 78       	mov    %rdx,0x78(%rsp)
   1252a:	48 89 e7             	mov    %rsp,%rdi
   1252d:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   12532:	4c 89 e6             	mov    %r12,%rsi
   12535:	e8 96 98 00 00       	call   1bdd0 <<hyperinterval::float::F64Enclosure>::sub>
   1253a:	48 8b 0c 24          	mov    (%rsp),%rcx
   1253e:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   12543:	48 83 f9 02          	cmp    $0x2,%rcx
   12547:	0f 84 6a fa ff ff    	je     11fb7 <hyperinterval_strict_surface64+0x87>
   1254d:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   12552:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12557:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1255c:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   12561:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   12566:	88 44 24 40          	mov    %al,0x40(%rsp)
   1256a:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   12571:	00 
   12572:	48 b9 00 00 00 00 00 	movabs $0x4000000000000000,%rcx
   12579:	00 00 40 
   1257c:	4c 89 f6             	mov    %r14,%rsi
   1257f:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   12586:	00 f0 7f 
   12589:	e8 c2 68 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1258e:	80 bc 24 80 00 00 00 	cmpb   $0x1,0x80(%rsp)
   12595:	01 
   12596:	0f 85 94 01 00 00    	jne    12730 <hyperinterval_strict_surface64+0x800>
   1259c:	0f b6 84 24 81 00 00 	movzbl 0x81(%rsp),%eax
   125a3:	00 
   125a4:	e9 0e fa ff ff       	jmp    11fb7 <hyperinterval_strict_surface64+0x87>
   125a9:	4c 89 e9             	mov    %r13,%rcx
   125ac:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   125b3:	00 00 80 
   125b6:	48 31 f1             	xor    %rsi,%rcx
   125b9:	4d 85 ed             	test   %r13,%r13
   125bc:	49 0f 44 cd          	cmove  %r13,%rcx
   125c0:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   125c5:	48 89 e7             	mov    %rsp,%rdi
   125c8:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   125cf:	00 f0 7f 
   125d2:	e8 79 68 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   125d7:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   125db:	0f 84 4b fb ff ff    	je     1212c <hyperinterval_strict_surface64+0x1fc>
   125e1:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   125e6:	48 89 e7             	mov    %rsp,%rdi
   125e9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   125f0:	00 00 80 
   125f3:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   125fa:	00 f0 7f 
   125fd:	4c 89 f9             	mov    %r15,%rcx
   12600:	e8 4b 68 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   12605:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12609:	0f 84 1d fb ff ff    	je     1212c <hyperinterval_strict_surface64+0x1fc>
   1260f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   12614:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1261b:	00 00 80 
   1261e:	4a 8d 0c 2f          	lea    (%rdi,%r13,1),%rcx
   12622:	4c 89 ea             	mov    %r13,%rdx
   12625:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1262a:	4c 21 c2             	and    %r8,%rdx
   1262d:	48 89 fe             	mov    %rdi,%rsi
   12630:	48 29 d6             	sub    %rdx,%rsi
   12633:	4d 85 ed             	test   %r13,%r13
   12636:	48 0f 49 f1          	cmovns %rcx,%rsi
   1263a:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   1263e:	49 21 c0             	and    %rax,%r8
   12641:	48 89 fa             	mov    %rdi,%rdx
   12644:	4c 29 c2             	sub    %r8,%rdx
   12647:	48 85 c0             	test   %rax,%rax
   1264a:	48 0f 49 d1          	cmovns %rcx,%rdx
   1264e:	b1 01                	mov    $0x1,%cl
   12650:	48 39 d6             	cmp    %rdx,%rsi
   12653:	0f 87 d8 fa ff ff    	ja     12131 <hyperinterval_strict_surface64+0x201>
   12659:	4c 89 ea             	mov    %r13,%rdx
   1265c:	48 c1 ea 08          	shr    $0x8,%rdx
   12660:	b9 01 00 00 00       	mov    $0x1,%ecx
   12665:	e9 00 fd ff ff       	jmp    1236a <hyperinterval_strict_surface64+0x43a>
   1266a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1266f:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   12676:	00 00 80 
   12679:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   1267d:	4c 89 fa             	mov    %r15,%rdx
   12680:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   12685:	4c 21 c2             	and    %r8,%rdx
   12688:	48 89 fe             	mov    %rdi,%rsi
   1268b:	48 29 d6             	sub    %rdx,%rsi
   1268e:	4d 85 ff             	test   %r15,%r15
   12691:	48 0f 49 f1          	cmovns %rcx,%rsi
   12695:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   12699:	48 89 c2             	mov    %rax,%rdx
   1269c:	4c 21 c2             	and    %r8,%rdx
   1269f:	48 29 d7             	sub    %rdx,%rdi
   126a2:	48 85 c0             	test   %rax,%rax
   126a5:	48 0f 49 f9          	cmovns %rcx,%rdi
   126a9:	b1 01                	mov    $0x1,%cl
   126ab:	48 39 fe             	cmp    %rdi,%rsi
   126ae:	0f 87 a2 fc ff ff    	ja     12356 <hyperinterval_strict_surface64+0x426>
   126b4:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   126bb:	00 00 
   126bd:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   126c2:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   126c7:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   126cc:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   126d3:	00 00 80 
   126d6:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   126dd:	00 f0 7f 
   126e0:	48 8b 8c 24 f0 00 00 	mov    0xf0(%rsp),%rcx
   126e7:	00 
   126e8:	e8 63 67 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   126ed:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   126f2:	74 32                	je     12726 <hyperinterval_strict_surface64+0x7f6>
   126f4:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   126f9:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   126fe:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12705:	00 00 80 
   12708:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1270f:	00 f0 7f 
   12712:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
   12719:	00 
   1271a:	e8 31 67 00 00       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1271f:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   12724:	75 5a                	jne    12780 <hyperinterval_strict_surface64+0x850>
   12726:	0f b6 4c 24 39       	movzbl 0x39(%rsp),%ecx
   1272b:	e9 26 fc ff ff       	jmp    12356 <hyperinterval_strict_surface64+0x426>
   12730:	48 8b 84 24 88 00 00 	mov    0x88(%rsp),%rax
   12737:	00 
   12738:	48 89 c1             	mov    %rax,%rcx
   1273b:	48 c1 e9 08          	shr    $0x8,%rcx
   1273f:	48 89 c2             	mov    %rax,%rdx
   12742:	48 c1 ea 38          	shr    $0x38,%rdx
   12746:	88 54 24 0f          	mov    %dl,0xf(%rsp)
   1274a:	48 89 c2             	mov    %rax,%rdx
   1274d:	48 c1 ea 28          	shr    $0x28,%rdx
   12751:	66 89 54 24 0d       	mov    %dx,0xd(%rsp)
   12756:	89 4c 24 09          	mov    %ecx,0x9(%rsp)
   1275a:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1275f:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   12766:	00 
   12767:	88 44 24 08          	mov    %al,0x8(%rsp)
   1276b:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   12770:	48 89 e2             	mov    %rsp,%rdx
   12773:	48 89 df             	mov    %rbx,%rdi
   12776:	e8 15 96 00 00       	call   1bd90 <<hyperinterval::float::F64Enclosure>::div>
   1277b:	e9 41 f8 ff ff       	jmp    11fc1 <hyperinterval_strict_surface64+0x91>
   12780:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   12785:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1278c:	00 00 80 
   1278f:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   12793:	4c 89 fa             	mov    %r15,%rdx
   12796:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1279b:	4c 21 c2             	and    %r8,%rdx
   1279e:	48 89 fe             	mov    %rdi,%rsi
   127a1:	48 29 d6             	sub    %rdx,%rsi
   127a4:	4d 85 ff             	test   %r15,%r15
   127a7:	48 0f 49 f1          	cmovns %rcx,%rsi
   127ab:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   127af:	48 89 c2             	mov    %rax,%rdx
   127b2:	4c 21 c2             	and    %r8,%rdx
   127b5:	48 29 d7             	sub    %rdx,%rdi
   127b8:	48 85 c0             	test   %rax,%rax
   127bb:	48 0f 49 f9          	cmovns %rcx,%rdi
   127bf:	b1 01                	mov    $0x1,%cl
   127c1:	48 39 fe             	cmp    %rdi,%rsi
   127c4:	0f 87 8c fb ff ff    	ja     12356 <hyperinterval_strict_surface64+0x426>
   127ca:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   127d1:	00 
   127d2:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
   127d7:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   127dc:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   127e3:	00 
   127e4:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   127e9:	48 89 e2             	mov    %rsp,%rdx
   127ec:	e8 ef 8f 00 00       	call   1b7e0 <<hyperinterval::float::F64Enclosure>::hull>
   127f1:	8b 4c 24 34          	mov    0x34(%rsp),%ecx
   127f5:	85 c9                	test   %ecx,%ecx
   127f7:	0f 95 c0             	setne  %al
   127fa:	f6 c1 01             	test   $0x1,%cl
   127fd:	0f 94 c1             	sete   %cl
   12800:	84 c8                	test   %cl,%al
   12802:	0f 84 85 00 00 00    	je     1288d <hyperinterval_strict_surface64+0x95d>
   12808:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
   1280f:	00 
   12810:	e8 ab 90 00 00       	call   1b8c0 <<hyperinterval::float::F64Enclosure>::signs>
   12815:	a8 02                	test   $0x2,%al
   12817:	74 74                	je     1288d <hyperinterval_strict_surface64+0x95d>
   12819:	48 89 e7             	mov    %rsp,%rdi
   1281c:	31 f6                	xor    %esi,%esi
   1281e:	31 d2                	xor    %edx,%edx
   12820:	e8 1b 91 00 00       	call   1b940 <<hyperinterval::float::F64Enclosure>::from_bits>
   12825:	48 8b 0c 24          	mov    (%rsp),%rcx
   12829:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1282e:	48 83 f9 02          	cmp    $0x2,%rcx
   12832:	75 09                	jne    1283d <hyperinterval_strict_surface64+0x90d>
   12834:	88 44 24 58          	mov    %al,0x58(%rsp)
   12838:	e9 1d fb ff ff       	jmp    1235a <hyperinterval_strict_surface64+0x42a>
   1283d:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   12842:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12847:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   1284c:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   12851:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   12856:	88 44 24 70          	mov    %al,0x70(%rsp)
   1285a:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1285f:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   12866:	00 
   12867:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   1286c:	e8 6f 8f 00 00       	call   1b7e0 <<hyperinterval::float::F64Enclosure>::hull>
   12871:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   12876:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   1287d:	00 
   1287e:	f3 0f 6f 44 24 38    	movdqu 0x38(%rsp),%xmm0
   12884:	66 0f 7f 84 24 80 00 	movdqa %xmm0,0x80(%rsp)
   1288b:	00 00 
   1288d:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   12894:	00 
   12895:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1289a:	66 0f 6f 84 24 80 00 	movdqa 0x80(%rsp),%xmm0
   128a1:	00 00 
   128a3:	66 0f 7f 44 24 50    	movdqa %xmm0,0x50(%rsp)
   128a9:	e9 33 f9 ff ff       	jmp    121e1 <hyperinterval_strict_surface64+0x2b1>
   128ae:	cc                   	int3
   128af:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   18e50:	48 89 c8             	mov    %rcx,%rax
   18e53:	48 f7 d0             	not    %rax
   18e56:	48 85 d0             	test   %rdx,%rax
   18e59:	75 09                	jne    18e64 <<hyperinterval::ieee::Format>::finite+0x14>
   18e5b:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   18e5f:	b0 01                	mov    $0x1,%al
   18e61:	88 07                	mov    %al,(%rdi)
   18e63:	c3                   	ret
   18e64:	48 ff ce             	dec    %rsi
   18e67:	48 85 f1             	test   %rsi,%rcx
   18e6a:	74 09                	je     18e75 <<hyperinterval::ieee::Format>::finite+0x25>
   18e6c:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   18e70:	31 c0                	xor    %eax,%eax
   18e72:	88 07                	mov    %al,(%rdi)
   18e74:	c3                   	ret
   18e75:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   18e7c:	00 
   18e7d:	31 c0                	xor    %eax,%eax
   18e7f:	88 07                	mov    %al,(%rdi)
   18e81:	c3                   	ret
   18e82:	cc                   	int3
   18e83:	cc                   	int3
   18e84:	cc                   	int3
   18e85:	cc                   	int3
   18e86:	cc                   	int3
   18e87:	cc                   	int3
   18e88:	cc                   	int3
   18e89:	cc                   	int3
   18e8a:	cc                   	int3
   18e8b:	cc                   	int3
   18e8c:	cc                   	int3
   18e8d:	cc                   	int3
   18e8e:	cc                   	int3
   18e8f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18e90:	55                   	push   %rbp
   18e91:	41 57                	push   %r15
   18e93:	41 56                	push   %r14
   18e95:	41 55                	push   %r13
   18e97:	41 54                	push   %r12
   18e99:	53                   	push   %rbx
   18e9a:	48 83 ec 38          	sub    $0x38,%rsp
   18e9e:	48 89 fb             	mov    %rdi,%rbx
   18ea1:	f6 06 01             	testb  $0x1,(%rsi)
   18ea4:	0f 84 95 00 00 00    	je     18f3f <<hyperinterval::float::F32Enclosure>::corner_image+0xaf>
   18eaa:	f6 02 01             	testb  $0x1,(%rdx)
   18ead:	0f 84 8c 00 00 00    	je     18f3f <<hyperinterval::float::F32Enclosure>::corner_image+0xaf>
   18eb3:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   18eb7:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   18ebb:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18ebf:	8b 46 08             	mov    0x8(%rsi),%eax
   18ec2:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   18ec7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ecc:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ed1:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ed6:	4c 89 e9             	mov    %r13,%rcx
   18ed9:	4d 89 e0             	mov    %r12,%r8
   18edc:	e8 df 06 00 00       	call   195c0 <<hyperinterval::ieee::Format>::div>
   18ee1:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18ee6:	75 46                	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   18ee8:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18eec:	8b 6c 24 18          	mov    0x18(%rsp),%ebp
   18ef0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ef5:	be 00 00 00 80       	mov    $0x80000000,%esi
   18efa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18eff:	e8 4c ff ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   18f04:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18f09:	75 23                	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   18f0b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   18f10:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18f15:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f1a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f1f:	48 89 e9             	mov    %rbp,%rcx
   18f22:	e8 29 ff ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   18f27:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18f2c:	74 26                	je     18f54 <<hyperinterval::float::F32Enclosure>::corner_image+0xc4>
   18f2e:	0f b6 6c 24 09       	movzbl 0x9(%rsp),%ebp
   18f33:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   18f37:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18f3d:	eb 06                	jmp    18f45 <<hyperinterval::float::F32Enclosure>::corner_image+0xb5>
   18f3f:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18f45:	48 83 c4 38          	add    $0x38,%rsp
   18f49:	5b                   	pop    %rbx
   18f4a:	41 5c                	pop    %r12
   18f4c:	41 5d                	pop    %r13
   18f4e:	41 5e                	pop    %r14
   18f50:	41 5f                	pop    %r15
   18f52:	5d                   	pop    %rbp
   18f53:	c3                   	ret
   18f54:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   18f59:	44 89 f8             	mov    %r15d,%eax
   18f5c:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18f61:	89 f9                	mov    %edi,%ecx
   18f63:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18f69:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18f6e:	29 c2                	sub    %eax,%edx
   18f70:	be 00 00 00 80       	mov    $0x80000000,%esi
   18f75:	09 f0                	or     %esi,%eax
   18f77:	45 85 ff             	test   %r15d,%r15d
   18f7a:	48 0f 49 d0          	cmovns %rax,%rdx
   18f7e:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18f83:	29 c8                	sub    %ecx,%eax
   18f85:	09 f1                	or     %esi,%ecx
   18f87:	85 ff                	test   %edi,%edi
   18f89:	48 0f 49 c1          	cmovns %rcx,%rax
   18f8d:	40 b5 01             	mov    $0x1,%bpl
   18f90:	39 c2                	cmp    %eax,%edx
   18f92:	77 9f                	ja     18f33 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   18f94:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
   18f99:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18f9e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fa3:	4c 89 e9             	mov    %r13,%rcx
   18fa6:	4d 89 f0             	mov    %r14,%r8
   18fa9:	e8 12 06 00 00       	call   195c0 <<hyperinterval::ieee::Format>::div>
   18fae:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   18fb3:	0f 85 75 ff ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   18fb9:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   18fbd:	44 8b 6c 24 18       	mov    0x18(%rsp),%r13d
   18fc2:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18fc7:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fcc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fd1:	e8 7a fe ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   18fd6:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   18fdb:	0f 84 4d ff ff ff    	je     18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   18fe1:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   18fe6:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
   18feb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   18ff0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ff5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ffa:	4c 89 e9             	mov    %r13,%rcx
   18ffd:	e8 4e fe ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   19002:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   19007:	0f 84 21 ff ff ff    	je     18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   1900d:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   19012:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
   19017:	44 89 c1             	mov    %r8d,%ecx
   1901a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19020:	44 89 e8             	mov    %r13d,%eax
   19023:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19028:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1902d:	48 29 ca             	sub    %rcx,%rdx
   19030:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19035:	48 09 f9             	or     %rdi,%rcx
   19038:	45 85 c0             	test   %r8d,%r8d
   1903b:	48 0f 48 ca          	cmovs  %rdx,%rcx
   1903f:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19044:	48 29 c2             	sub    %rax,%rdx
   19047:	48 09 f8             	or     %rdi,%rax
   1904a:	45 85 ed             	test   %r13d,%r13d
   1904d:	48 0f 48 c2          	cmovs  %rdx,%rax
   19051:	48 39 c1             	cmp    %rax,%rcx
   19054:	0f 87 d9 fe ff ff    	ja     18f33 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   1905a:	44 89 fa             	mov    %r15d,%edx
   1905d:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19063:	be 00 00 00 80       	mov    $0x80000000,%esi
   19068:	29 d6                	sub    %edx,%esi
   1906a:	09 fa                	or     %edi,%edx
   1906c:	45 85 ff             	test   %r15d,%r15d
   1906f:	48 0f 49 f2          	cmovns %rdx,%rsi
   19073:	39 ce                	cmp    %ecx,%esi
   19075:	45 0f 46 c7          	cmovbe %r15d,%r8d
   19079:	4c 89 44 24 20       	mov    %r8,0x20(%rsp)
   1907e:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
   19083:	89 f1                	mov    %esi,%ecx
   19085:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1908b:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19090:	29 ca                	sub    %ecx,%edx
   19092:	09 f9                	or     %edi,%ecx
   19094:	85 f6                	test   %esi,%esi
   19096:	48 0f 49 d1          	cmovns %rcx,%rdx
   1909a:	39 c2                	cmp    %eax,%edx
   1909c:	44 0f 43 ee          	cmovae %esi,%r13d
   190a0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   190a5:	be 00 00 00 80       	mov    $0x80000000,%esi
   190aa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190af:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   190b4:	4d 89 e0             	mov    %r12,%r8
   190b7:	e8 04 05 00 00       	call   195c0 <<hyperinterval::ieee::Format>::div>
   190bc:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   190c1:	0f 85 67 fe ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   190c7:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   190cb:	44 8b 64 24 18       	mov    0x18(%rsp),%r12d
   190d0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   190d5:	be 00 00 00 80       	mov    $0x80000000,%esi
   190da:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190df:	e8 6c fd ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   190e4:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   190e9:	0f 85 3f fe ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   190ef:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   190f4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   190f9:	be 00 00 00 80       	mov    $0x80000000,%esi
   190fe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19103:	4c 89 e1             	mov    %r12,%rcx
   19106:	e8 45 fd ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1910b:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   19110:	0f 85 18 fe ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19116:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1911b:	44 89 f9             	mov    %r15d,%ecx
   1911e:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19124:	44 89 e0             	mov    %r12d,%eax
   19127:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   1912c:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19131:	48 29 ca             	sub    %rcx,%rdx
   19134:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1913a:	4c 09 c1             	or     %r8,%rcx
   1913d:	45 85 ff             	test   %r15d,%r15d
   19140:	48 0f 48 ca          	cmovs  %rdx,%rcx
   19144:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19149:	48 29 c2             	sub    %rax,%rdx
   1914c:	4c 09 c0             	or     %r8,%rax
   1914f:	45 85 e4             	test   %r12d,%r12d
   19152:	48 0f 48 c2          	cmovs  %rdx,%rax
   19156:	48 39 c1             	cmp    %rax,%rcx
   19159:	0f 87 d4 fd ff ff    	ja     18f33 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   1915f:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
   19164:	44 89 ca             	mov    %r9d,%edx
   19167:	44 09 c2             	or     %r8d,%edx
   1916a:	44 89 ce             	mov    %r9d,%esi
   1916d:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   19173:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19178:	29 f7                	sub    %esi,%edi
   1917a:	45 85 c9             	test   %r9d,%r9d
   1917d:	48 0f 49 fa          	cmovns %rdx,%rdi
   19181:	39 cf                	cmp    %ecx,%edi
   19183:	45 0f 46 f9          	cmovbe %r9d,%r15d
   19187:	44 89 e9             	mov    %r13d,%ecx
   1918a:	44 09 c1             	or     %r8d,%ecx
   1918d:	44 89 ea             	mov    %r13d,%edx
   19190:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19196:	be 00 00 00 80       	mov    $0x80000000,%esi
   1919b:	29 d6                	sub    %edx,%esi
   1919d:	45 85 ed             	test   %r13d,%r13d
   191a0:	48 0f 49 f1          	cmovns %rcx,%rsi
   191a4:	39 c6                	cmp    %eax,%esi
   191a6:	45 0f 43 e5          	cmovae %r13d,%r12d
   191aa:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   191af:	be 00 00 00 80       	mov    $0x80000000,%esi
   191b4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191b9:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   191be:	4d 89 f0             	mov    %r14,%r8
   191c1:	e8 fa 03 00 00       	call   195c0 <<hyperinterval::ieee::Format>::div>
   191c6:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   191cb:	0f 85 5d fd ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   191d1:	8b 4c 24 10          	mov    0x10(%rsp),%ecx
   191d5:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   191da:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   191df:	be 00 00 00 80       	mov    $0x80000000,%esi
   191e4:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191e9:	e8 62 fc ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   191ee:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   191f3:	0f 85 35 fd ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   191f9:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   191fe:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   19203:	be 00 00 00 80       	mov    $0x80000000,%esi
   19208:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1920d:	4c 89 f1             	mov    %r14,%rcx
   19210:	e8 3b fc ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   19215:	80 7c 24 08 00       	cmpb   $0x0,0x8(%rsp)
   1921a:	0f 85 0e fd ff ff    	jne    18f2e <<hyperinterval::float::F32Enclosure>::corner_image+0x9e>
   19220:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   19225:	44 89 ea             	mov    %r13d,%edx
   19228:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1922e:	89 c1                	mov    %eax,%ecx
   19230:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19236:	be 00 00 00 80       	mov    $0x80000000,%esi
   1923b:	48 29 d6             	sub    %rdx,%rsi
   1923e:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19243:	48 09 fa             	or     %rdi,%rdx
   19246:	45 85 ed             	test   %r13d,%r13d
   19249:	48 0f 48 d6          	cmovs  %rsi,%rdx
   1924d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19252:	48 29 ce             	sub    %rcx,%rsi
   19255:	48 09 f9             	or     %rdi,%rcx
   19258:	85 c0                	test   %eax,%eax
   1925a:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1925e:	48 39 ca             	cmp    %rcx,%rdx
   19261:	0f 87 cc fc ff ff    	ja     18f33 <<hyperinterval::float::F32Enclosure>::corner_image+0xa3>
   19267:	44 89 fe             	mov    %r15d,%esi
   1926a:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   19270:	44 09 ce             	or     %r9d,%esi
   19273:	44 89 ff             	mov    %r15d,%edi
   19276:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1927c:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19282:	41 29 f8             	sub    %edi,%r8d
   19285:	45 85 ff             	test   %r15d,%r15d
   19288:	4c 0f 49 c6          	cmovns %rsi,%r8
   1928c:	41 39 d0             	cmp    %edx,%r8d
   1928f:	45 0f 46 ef          	cmovbe %r15d,%r13d
   19293:	44 89 e2             	mov    %r12d,%edx
   19296:	44 09 ca             	or     %r9d,%edx
   19299:	44 89 e6             	mov    %r12d,%esi
   1929c:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   192a2:	41 29 f1             	sub    %esi,%r9d
   192a5:	45 85 e4             	test   %r12d,%r12d
   192a8:	4c 0f 49 ca          	cmovns %rdx,%r9
   192ac:	41 39 c9             	cmp    %ecx,%r9d
   192af:	41 0f 43 c4          	cmovae %r12d,%eax
   192b3:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   192b9:	44 89 6b 04          	mov    %r13d,0x4(%rbx)
   192bd:	89 43 08             	mov    %eax,0x8(%rbx)
   192c0:	e9 80 fc ff ff       	jmp    18f45 <<hyperinterval::float::F32Enclosure>::corner_image+0xb5>
   192c5:	cc                   	int3
   192c6:	cc                   	int3
   192c7:	cc                   	int3
   192c8:	cc                   	int3
   192c9:	cc                   	int3
   192ca:	cc                   	int3
   192cb:	cc                   	int3
   192cc:	cc                   	int3
   192cd:	cc                   	int3
   192ce:	cc                   	int3
   192cf:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   192d0:	48 89 c8             	mov    %rcx,%rax
   192d3:	4c 8b 11             	mov    (%rcx),%r10
   192d6:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   192da:	4c 89 d1             	mov    %r10,%rcx
   192dd:	4c 09 d9             	or     %r11,%rcx
   192e0:	0f 84 dd 00 00 00    	je     193c3 <<hyperinterval::ieee::Format>::rounded+0xf3>
   192e6:	55                   	push   %rbp
   192e7:	41 57                	push   %r15
   192e9:	41 56                	push   %r14
   192eb:	41 55                	push   %r13
   192ed:	41 54                	push   %r12
   192ef:	53                   	push   %rbx
   192f0:	8b 68 10             	mov    0x10(%rax),%ebp
   192f3:	49 0f bd cb          	bsr    %r11,%rcx
   192f7:	83 f1 3f             	xor    $0x3f,%ecx
   192fa:	49 0f bd da          	bsr    %r10,%rbx
   192fe:	83 f3 3f             	xor    $0x3f,%ebx
   19301:	83 cb 40             	or     $0x40,%ebx
   19304:	4d 85 db             	test   %r11,%r11
   19307:	0f 45 d9             	cmovne %ecx,%ebx
   1930a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1930f:	44 89 c1             	mov    %r8d,%ecx
   19312:	48 d3 ea             	shr    %cl,%rdx
   19315:	83 f3 7f             	xor    $0x7f,%ebx
   19318:	01 eb                	add    %ebp,%ebx
   1931a:	48 d1 ea             	shr    $1,%rdx
   1931d:	39 d3                	cmp    %edx,%ebx
   1931f:	0f 8f 88 01 00 00    	jg     194ad <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19325:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   19329:	b9 01 00 00 00       	mov    $0x1,%ecx
   1932e:	44 29 c9             	sub    %r9d,%ecx
   19331:	44 29 c3             	sub    %r8d,%ebx
   19334:	39 cb                	cmp    %ecx,%ebx
   19336:	0f 4e d9             	cmovle %ecx,%ebx
   19339:	89 d9                	mov    %ebx,%ecx
   1933b:	29 e9                	sub    %ebp,%ecx
   1933d:	83 f9 7f             	cmp    $0x7f,%ecx
   19340:	0f 8e 88 00 00 00    	jle    193ce <<hyperinterval::ieee::Format>::rounded+0xfe>
   19346:	41 b7 01             	mov    $0x1,%r15b
   19349:	45 31 f6             	xor    %r14d,%r14d
   1934c:	45 31 db             	xor    %r11d,%r11d
   1934f:	45 31 d2             	xor    %r10d,%r10d
   19352:	45 0f b6 ff          	movzbl %r15b,%r15d
   19356:	4d 01 f7             	add    %r14,%r15
   19359:	49 83 d3 00          	adc    $0x0,%r11
   1935d:	4c 89 f9             	mov    %r15,%rcx
   19360:	4c 09 d9             	or     %r11,%rcx
   19363:	0f 84 c3 00 00 00    	je     1942c <<hyperinterval::ieee::Format>::rounded+0x15c>
   19369:	49 0f bd cb          	bsr    %r11,%rcx
   1936d:	83 f1 3f             	xor    $0x3f,%ecx
   19370:	4d 0f bd f7          	bsr    %r15,%r14
   19374:	41 83 f6 3f          	xor    $0x3f,%r14d
   19378:	41 83 ce 40          	or     $0x40,%r14d
   1937c:	4d 85 db             	test   %r11,%r11
   1937f:	44 0f 45 f1          	cmovne %ecx,%r14d
   19383:	41 83 f6 7f          	xor    $0x7f,%r14d
   19387:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   1938b:	39 d5                	cmp    %edx,%ebp
   1938d:	0f 8f 1a 01 00 00    	jg     194ad <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19393:	b9 01 00 00 00       	mov    $0x1,%ecx
   19398:	29 d1                	sub    %edx,%ecx
   1939a:	39 cd                	cmp    %ecx,%ebp
   1939c:	0f 8d 41 01 00 00    	jge    194e3 <<hyperinterval::ieee::Format>::rounded+0x213>
   193a2:	41 01 d9             	add    %ebx,%r9d
   193a5:	41 fe c9             	dec    %r9b
   193a8:	44 89 c9             	mov    %r9d,%ecx
   193ab:	49 d3 e7             	shl    %cl,%r15
   193ae:	31 d2                	xor    %edx,%edx
   193b0:	41 f6 c1 40          	test   $0x40,%r9b
   193b4:	49 0f 44 d7          	cmove  %r15,%rdx
   193b8:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   193bc:	74 76                	je     19434 <<hyperinterval::ieee::Format>::rounded+0x164>
   193be:	e9 8e 00 00 00       	jmp    19451 <<hyperinterval::ieee::Format>::rounded+0x181>
   193c3:	c6 07 00             	movb   $0x0,(%rdi)
   193c6:	0f 57 c0             	xorps  %xmm0,%xmm0
   193c9:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   193cd:	c3                   	ret
   193ce:	85 c9                	test   %ecx,%ecx
   193d0:	0f 8e 88 00 00 00    	jle    1945e <<hyperinterval::ieee::Format>::rounded+0x18e>
   193d6:	4d 89 d6             	mov    %r10,%r14
   193d9:	4d 0f ad de          	shrd   %cl,%r11,%r14
   193dd:	4d 89 dc             	mov    %r11,%r12
   193e0:	49 d3 ec             	shr    %cl,%r12
   193e3:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   193ea:	49 d3 e7             	shl    %cl,%r15
   193ed:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   193f4:	31 ed                	xor    %ebp,%ebp
   193f6:	f6 c1 40             	test   $0x40,%cl
   193f9:	4d 0f 45 f4          	cmovne %r12,%r14
   193fd:	4c 0f 45 e5          	cmovne %rbp,%r12
   19401:	4d 0f 45 ef          	cmovne %r15,%r13
   19405:	4c 0f 45 fd          	cmovne %rbp,%r15
   19409:	49 f7 d7             	not    %r15
   1940c:	49 f7 d5             	not    %r13
   1940f:	4d 21 dd             	and    %r11,%r13
   19412:	4d 21 d7             	and    %r10,%r15
   19415:	4d 09 ef             	or     %r13,%r15
   19418:	41 0f 95 c7          	setne  %r15b
   1941c:	4d 89 e3             	mov    %r12,%r11
   1941f:	4c 89 f1             	mov    %r14,%rcx
   19422:	4c 09 d9             	or     %r11,%rcx
   19425:	75 60                	jne    19487 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   19427:	e9 1d ff ff ff       	jmp    19349 <<hyperinterval::ieee::Format>::rounded+0x79>
   1942c:	31 d2                	xor    %edx,%edx
   1942e:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   19432:	75 1d                	jne    19451 <<hyperinterval::ieee::Format>::rounded+0x181>
   19434:	48 89 d0             	mov    %rdx,%rax
   19437:	48 31 f0             	xor    %rsi,%rax
   1943a:	48 85 d2             	test   %rdx,%rdx
   1943d:	48 0f 44 c2          	cmove  %rdx,%rax
   19441:	4c 31 d6             	xor    %r10,%rsi
   19444:	4d 85 d2             	test   %r10,%r10
   19447:	49 0f 44 f2          	cmove  %r10,%rsi
   1944b:	49 89 c2             	mov    %rax,%r10
   1944e:	48 89 f2             	mov    %rsi,%rdx
   19451:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   19455:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   19459:	c6 07 00             	movb   $0x0,(%rdi)
   1945c:	eb 54                	jmp    194b2 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   1945e:	f6 d9                	neg    %cl
   19460:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   19464:	49 d3 e2             	shl    %cl,%r10
   19467:	45 31 ff             	xor    %r15d,%r15d
   1946a:	f6 c1 40             	test   $0x40,%cl
   1946d:	4d 0f 45 da          	cmovne %r10,%r11
   19471:	41 be 00 00 00 00    	mov    $0x0,%r14d
   19477:	4d 0f 44 f2          	cmove  %r10,%r14
   1947b:	4c 89 f1             	mov    %r14,%rcx
   1947e:	4c 09 d9             	or     %r11,%rcx
   19481:	0f 84 c2 fe ff ff    	je     19349 <<hyperinterval::ieee::Format>::rounded+0x79>
   19487:	49 0f bd cb          	bsr    %r11,%rcx
   1948b:	83 f1 3f             	xor    $0x3f,%ecx
   1948e:	4d 0f bd e6          	bsr    %r14,%r12
   19492:	41 83 f4 3f          	xor    $0x3f,%r12d
   19496:	41 83 cc 40          	or     $0x40,%r12d
   1949a:	4d 85 db             	test   %r11,%r11
   1949d:	44 0f 45 e1          	cmovne %ecx,%r12d
   194a1:	41 83 f4 7f          	xor    $0x7f,%r12d
   194a5:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   194a9:	39 d5                	cmp    %edx,%ebp
   194ab:	7e 10                	jle    194bd <<hyperinterval::ieee::Format>::rounded+0x1ed>
   194ad:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   194b2:	5b                   	pop    %rbx
   194b3:	41 5c                	pop    %r12
   194b5:	41 5d                	pop    %r13
   194b7:	41 5e                	pop    %r14
   194b9:	41 5f                	pop    %r15
   194bb:	5d                   	pop    %rbp
   194bc:	c3                   	ret
   194bd:	b9 01 00 00 00       	mov    $0x1,%ecx
   194c2:	29 d1                	sub    %edx,%ecx
   194c4:	39 cd                	cmp    %ecx,%ebp
   194c6:	7d 7d                	jge    19545 <<hyperinterval::ieee::Format>::rounded+0x275>
   194c8:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   194cc:	fe c9                	dec    %cl
   194ce:	4d 89 f4             	mov    %r14,%r12
   194d1:	49 d3 e4             	shl    %cl,%r12
   194d4:	45 31 d2             	xor    %r10d,%r10d
   194d7:	f6 c1 40             	test   $0x40,%cl
   194da:	4d 0f 44 d4          	cmove  %r12,%r10
   194de:	e9 6f fe ff ff       	jmp    19352 <<hyperinterval::ieee::Format>::rounded+0x82>
   194e3:	44 89 c1             	mov    %r8d,%ecx
   194e6:	44 29 f1             	sub    %r14d,%ecx
   194e9:	41 89 c9             	mov    %ecx,%r9d
   194ec:	41 f7 d9             	neg    %r9d
   194ef:	4c 89 fb             	mov    %r15,%rbx
   194f2:	48 d3 e3             	shl    %cl,%rbx
   194f5:	45 31 e4             	xor    %r12d,%r12d
   194f8:	f6 c1 40             	test   $0x40,%cl
   194fb:	4c 0f 44 e3          	cmove  %rbx,%r12
   194ff:	44 89 c9             	mov    %r9d,%ecx
   19502:	4d 0f ad df          	shrd   %cl,%r11,%r15
   19506:	49 d3 eb             	shr    %cl,%r11
   19509:	41 f6 c1 40          	test   $0x40,%r9b
   1950d:	4d 0f 44 df          	cmove  %r15,%r11
   19511:	45 39 f0             	cmp    %r14d,%r8d
   19514:	4d 0f 43 dc          	cmovae %r12,%r11
   19518:	01 d5                	add    %edx,%ebp
   1951a:	4c 63 cd             	movslq %ebp,%r9
   1951d:	44 89 c1             	mov    %r8d,%ecx
   19520:	49 d3 e1             	shl    %cl,%r9
   19523:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   1952a:	48 d3 e2             	shl    %cl,%rdx
   1952d:	48 f7 d2             	not    %rdx
   19530:	4c 21 da             	and    %r11,%rdx
   19533:	4c 09 ca             	or     %r9,%rdx
   19536:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1953a:	0f 85 11 ff ff ff    	jne    19451 <<hyperinterval::ieee::Format>::rounded+0x181>
   19540:	e9 ef fe ff ff       	jmp    19434 <<hyperinterval::ieee::Format>::rounded+0x164>
   19545:	44 89 c1             	mov    %r8d,%ecx
   19548:	44 29 e1             	sub    %r12d,%ecx
   1954b:	4d 89 f5             	mov    %r14,%r13
   1954e:	49 d3 e5             	shl    %cl,%r13
   19551:	41 89 ca             	mov    %ecx,%r10d
   19554:	41 f7 da             	neg    %r10d
   19557:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   1955e:	00 00 
   19560:	f6 c1 40             	test   $0x40,%cl
   19563:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   19568:	49 0f 44 cd          	cmove  %r13,%rcx
   1956c:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   19571:	4d 89 f5             	mov    %r14,%r13
   19574:	44 89 d1             	mov    %r10d,%ecx
   19577:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   1957b:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   19580:	4d 89 dd             	mov    %r11,%r13
   19583:	49 d3 ed             	shr    %cl,%r13
   19586:	41 f6 c2 40          	test   $0x40,%r10b
   1958a:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   19590:	45 39 e0             	cmp    %r12d,%r8d
   19593:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   19599:	01 d5                	add    %edx,%ebp
   1959b:	4c 63 e5             	movslq %ebp,%r12
   1959e:	44 89 c1             	mov    %r8d,%ecx
   195a1:	49 d3 e4             	shl    %cl,%r12
   195a4:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   195ab:	49 d3 e2             	shl    %cl,%r10
   195ae:	49 f7 d2             	not    %r10
   195b1:	4d 21 ea             	and    %r13,%r10
   195b4:	4d 09 e2             	or     %r12,%r10
   195b7:	e9 96 fd ff ff       	jmp    19352 <<hyperinterval::ieee::Format>::rounded+0x82>
   195bc:	cc                   	int3
   195bd:	cc                   	int3
   195be:	cc                   	int3
   195bf:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   195c0:	55                   	push   %rbp
   195c1:	41 57                	push   %r15
   195c3:	41 56                	push   %r14
   195c5:	41 55                	push   %r13
   195c7:	41 54                	push   %r12
   195c9:	53                   	push   %rbx
   195ca:	48 83 ec 38          	sub    $0x38,%rsp
   195ce:	4d 85 c0             	test   %r8,%r8
   195d1:	74 47                	je     1961a <<hyperinterval::ieee::Format>::div+0x5a>
   195d3:	48 85 c9             	test   %rcx,%rcx
   195d6:	74 4c                	je     19624 <<hyperinterval::ieee::Format>::div+0x64>
   195d8:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   195dd:	49 89 c9             	mov    %rcx,%r9
   195e0:	49 21 d1             	and    %rdx,%r9
   195e3:	48 89 c8             	mov    %rcx,%rax
   195e6:	44 89 f1             	mov    %r14d,%ecx
   195e9:	49 d3 e9             	shr    %cl,%r9
   195ec:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   195f2:	49 d3 e2             	shl    %cl,%r10
   195f5:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   195f9:	49 89 ec             	mov    %rbp,%r12
   195fc:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19601:	49 21 c4             	and    %rax,%r12
   19604:	48 89 d0             	mov    %rdx,%rax
   19607:	48 d3 e8             	shr    %cl,%rax
   1960a:	4d 85 c9             	test   %r9,%r9
   1960d:	74 24                	je     19633 <<hyperinterval::ieee::Format>::div+0x73>
   1960f:	4d 09 d4             	or     %r10,%r12
   19612:	48 d1 e8             	shr    $1,%rax
   19615:	44 01 f0             	add    %r14d,%eax
   19618:	eb 25                	jmp    1963f <<hyperinterval::ieee::Format>::div+0x7f>
   1961a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1961f:	e9 ae 03 00 00       	jmp    199d2 <<hyperinterval::ieee::Format>::div+0x412>
   19624:	c6 07 00             	movb   $0x0,(%rdi)
   19627:	0f 57 c0             	xorps  %xmm0,%xmm0
   1962a:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1962e:	e9 9f 03 00 00       	jmp    199d2 <<hyperinterval::ieee::Format>::div+0x412>
   19633:	48 d1 e8             	shr    $1,%rax
   19636:	44 01 f0             	add    %r14d,%eax
   19639:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1963f:	41 29 c1             	sub    %eax,%r9d
   19642:	4d 89 c3             	mov    %r8,%r11
   19645:	49 21 d3             	and    %rdx,%r11
   19648:	44 89 f1             	mov    %r14d,%ecx
   1964b:	49 d3 eb             	shr    %cl,%r11
   1964e:	4c 21 c5             	and    %r8,%rbp
   19651:	48 89 d0             	mov    %rdx,%rax
   19654:	48 d3 e8             	shr    %cl,%rax
   19657:	4d 85 db             	test   %r11,%r11
   1965a:	74 0e                	je     1966a <<hyperinterval::ieee::Format>::div+0xaa>
   1965c:	4c 09 d5             	or     %r10,%rbp
   1965f:	48 d1 e8             	shr    $1,%rax
   19662:	44 01 f0             	add    %r14d,%eax
   19665:	44 29 d8             	sub    %r11d,%eax
   19668:	eb 08                	jmp    19672 <<hyperinterval::ieee::Format>::div+0xb2>
   1966a:	48 d1 e8             	shr    $1,%rax
   1966d:	44 01 f0             	add    %r14d,%eax
   19670:	ff c8                	dec    %eax
   19672:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   19677:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   1967d:	4c 0f bd d5          	bsr    %rbp,%r10
   19681:	41 83 f2 3f          	xor    $0x3f,%r10d
   19685:	41 83 c2 40          	add    $0x40,%r10d
   19689:	49 0f bd cc          	bsr    %r12,%rcx
   1968d:	83 f1 3f             	xor    $0x3f,%ecx
   19690:	45 89 d7             	mov    %r10d,%r15d
   19693:	41 29 cf             	sub    %ecx,%r15d
   19696:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1969a:	78 26                	js     196c2 <<hyperinterval::ieee::Format>::div+0x102>
   1969c:	45 31 db             	xor    %r11d,%r11d
   1969f:	44 89 f9             	mov    %r15d,%ecx
   196a2:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   196a6:	31 db                	xor    %ebx,%ebx
   196a8:	49 89 ed             	mov    %rbp,%r13
   196ab:	49 d3 e5             	shl    %cl,%r13
   196ae:	41 f6 c7 40          	test   $0x40,%r15b
   196b2:	4d 0f 45 dd          	cmovne %r13,%r11
   196b6:	4c 0f 45 eb          	cmovne %rbx,%r13
   196ba:	4d 39 ec             	cmp    %r13,%r12
   196bd:	4c 19 db             	sbb    %r11,%rbx
   196c0:	eb 26                	jmp    196e8 <<hyperinterval::ieee::Format>::div+0x128>
   196c2:	44 89 f9             	mov    %r15d,%ecx
   196c5:	f6 d9                	neg    %cl
   196c7:	45 31 db             	xor    %r11d,%r11d
   196ca:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   196ce:	31 db                	xor    %ebx,%ebx
   196d0:	4d 89 e5             	mov    %r12,%r13
   196d3:	49 d3 e5             	shl    %cl,%r13
   196d6:	f6 c1 40             	test   $0x40,%cl
   196d9:	4d 0f 45 dd          	cmovne %r13,%r11
   196dd:	4c 0f 45 eb          	cmovne %rbx,%r13
   196e1:	49 39 ed             	cmp    %rbp,%r13
   196e4:	49 83 db 00          	sbb    $0x0,%r11
   196e8:	41 0f 92 c3          	setb   %r11b
   196ec:	44 89 f1             	mov    %r14d,%ecx
   196ef:	48 d3 ea             	shr    %cl,%rdx
   196f2:	44 01 c8             	add    %r9d,%eax
   196f5:	41 01 c7             	add    %eax,%r15d
   196f8:	41 0f b6 cb          	movzbl %r11b,%ecx
   196fc:	41 29 cf             	sub    %ecx,%r15d
   196ff:	48 d1 ea             	shr    $1,%rdx
   19702:	41 39 d7             	cmp    %edx,%r15d
   19705:	0f 8f 0e 02 00 00    	jg     19919 <<hyperinterval::ieee::Format>::div+0x359>
   1970b:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   1970f:	b9 01 00 00 00       	mov    $0x1,%ecx
   19714:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   19719:	44 29 c9             	sub    %r9d,%ecx
   1971c:	45 29 f7             	sub    %r14d,%r15d
   1971f:	41 39 cf             	cmp    %ecx,%r15d
   19722:	44 0f 4e f9          	cmovle %ecx,%r15d
   19726:	44 29 f8             	sub    %r15d,%eax
   19729:	78 61                	js     1978c <<hyperinterval::ieee::Format>::div+0x1cc>
   1972b:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   19730:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19735:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   1973a:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1973f:	48 85 ed             	test   %rbp,%rbp
   19742:	0f 84 99 02 00 00    	je     199e1 <<hyperinterval::ieee::Format>::div+0x421>
   19748:	45 31 ed             	xor    %r13d,%r13d
   1974b:	89 c1                	mov    %eax,%ecx
   1974d:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   19751:	31 d2                	xor    %edx,%edx
   19753:	49 d3 e4             	shl    %cl,%r12
   19756:	a8 40                	test   $0x40,%al
   19758:	4d 0f 45 ec          	cmovne %r12,%r13
   1975c:	4c 0f 45 e2          	cmovne %rdx,%r12
   19760:	4c 89 e7             	mov    %r12,%rdi
   19763:	4c 89 ee             	mov    %r13,%rsi
   19766:	48 89 ea             	mov    %rbp,%rdx
   19769:	31 c9                	xor    %ecx,%ecx
   1976b:	ff 15 6f 6f 03 00    	call   *0x36f6f(%rip)        # 506e0 <_DYNAMIC+0x298>
   19771:	49 89 c2             	mov    %rax,%r10
   19774:	49 89 d1             	mov    %rdx,%r9
   19777:	48 89 d1             	mov    %rdx,%rcx
   1977a:	48 0f af cd          	imul   %rbp,%rcx
   1977e:	48 f7 e5             	mul    %rbp
   19781:	48 01 ca             	add    %rcx,%rdx
   19784:	49 29 c4             	sub    %rax,%r12
   19787:	49 19 d5             	sbb    %rdx,%r13
   1978a:	eb 79                	jmp    19805 <<hyperinterval::ieee::Format>::div+0x245>
   1978c:	f7 d8                	neg    %eax
   1978e:	44 39 d0             	cmp    %r10d,%eax
   19791:	7e 07                	jle    1979a <<hyperinterval::ieee::Format>::div+0x1da>
   19793:	b3 01                	mov    $0x1,%bl
   19795:	e9 df 00 00 00       	jmp    19879 <<hyperinterval::ieee::Format>::div+0x2b9>
   1979a:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1979f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   197a4:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   197a9:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   197ae:	31 db                	xor    %ebx,%ebx
   197b0:	89 c1                	mov    %eax,%ecx
   197b2:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   197b6:	48 d3 e5             	shl    %cl,%rbp
   197b9:	31 c9                	xor    %ecx,%ecx
   197bb:	a8 40                	test   $0x40,%al
   197bd:	48 0f 45 dd          	cmovne %rbp,%rbx
   197c1:	48 0f 45 e9          	cmovne %rcx,%rbp
   197c5:	48 89 e8             	mov    %rbp,%rax
   197c8:	48 09 d8             	or     %rbx,%rax
   197cb:	0f 84 1c 02 00 00    	je     199ed <<hyperinterval::ieee::Format>::div+0x42d>
   197d1:	45 31 ed             	xor    %r13d,%r13d
   197d4:	4c 89 e7             	mov    %r12,%rdi
   197d7:	31 f6                	xor    %esi,%esi
   197d9:	48 89 ea             	mov    %rbp,%rdx
   197dc:	48 89 d9             	mov    %rbx,%rcx
   197df:	ff 15 fb 6e 03 00    	call   *0x36efb(%rip)        # 506e0 <_DYNAMIC+0x298>
   197e5:	49 89 c2             	mov    %rax,%r10
   197e8:	49 89 d1             	mov    %rdx,%r9
   197eb:	48 0f af d8          	imul   %rax,%rbx
   197ef:	48 f7 e5             	mul    %rbp
   197f2:	48 01 da             	add    %rbx,%rdx
   197f5:	4c 89 c9             	mov    %r9,%rcx
   197f8:	48 0f af cd          	imul   %rbp,%rcx
   197fc:	48 01 d1             	add    %rdx,%rcx
   197ff:	49 29 c4             	sub    %rax,%r12
   19802:	49 19 cd             	sbb    %rcx,%r13
   19805:	4d 09 ec             	or     %r13,%r12
   19808:	0f 95 c3             	setne  %bl
   1980b:	4c 89 d0             	mov    %r10,%rax
   1980e:	4c 09 c8             	or     %r9,%rax
   19811:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19816:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1981b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   19820:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   19825:	74 52                	je     19879 <<hyperinterval::ieee::Format>::div+0x2b9>
   19827:	49 0f bd c1          	bsr    %r9,%rax
   1982b:	83 f0 3f             	xor    $0x3f,%eax
   1982e:	4d 0f bd da          	bsr    %r10,%r11
   19832:	41 83 f3 3f          	xor    $0x3f,%r11d
   19836:	41 83 cb 40          	or     $0x40,%r11d
   1983a:	4d 85 c9             	test   %r9,%r9
   1983d:	44 0f 45 d8          	cmovne %eax,%r11d
   19841:	41 83 f3 7f          	xor    $0x7f,%r11d
   19845:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   19849:	39 d5                	cmp    %edx,%ebp
   1984b:	0f 8f c8 00 00 00    	jg     19919 <<hyperinterval::ieee::Format>::div+0x359>
   19851:	b8 01 00 00 00       	mov    $0x1,%eax
   19856:	29 d0                	sub    %edx,%eax
   19858:	39 c5                	cmp    %eax,%ebp
   1985a:	7d 28                	jge    19884 <<hyperinterval::ieee::Format>::div+0x2c4>
   1985c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19861:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   19865:	fe c9                	dec    %cl
   19867:	4c 89 d0             	mov    %r10,%rax
   1986a:	48 d3 e0             	shl    %cl,%rax
   1986d:	45 31 db             	xor    %r11d,%r11d
   19870:	f6 c1 40             	test   $0x40,%cl
   19873:	4c 0f 44 d8          	cmove  %rax,%r11
   19877:	eb 68                	jmp    198e1 <<hyperinterval::ieee::Format>::div+0x321>
   19879:	45 31 d2             	xor    %r10d,%r10d
   1987c:	45 31 c9             	xor    %r9d,%r9d
   1987f:	45 31 db             	xor    %r11d,%r11d
   19882:	eb 5d                	jmp    198e1 <<hyperinterval::ieee::Format>::div+0x321>
   19884:	44 89 f1             	mov    %r14d,%ecx
   19887:	44 29 d9             	sub    %r11d,%ecx
   1988a:	4d 89 d4             	mov    %r10,%r12
   1988d:	49 d3 e4             	shl    %cl,%r12
   19890:	89 c8                	mov    %ecx,%eax
   19892:	f7 d8                	neg    %eax
   19894:	45 31 ed             	xor    %r13d,%r13d
   19897:	f6 c1 40             	test   $0x40,%cl
   1989a:	4d 0f 44 ec          	cmove  %r12,%r13
   1989e:	4d 89 d4             	mov    %r10,%r12
   198a1:	89 c1                	mov    %eax,%ecx
   198a3:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   198a7:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   198ab:	4c 89 cb             	mov    %r9,%rbx
   198ae:	48 d3 eb             	shr    %cl,%rbx
   198b1:	a8 40                	test   $0x40,%al
   198b3:	49 0f 44 dc          	cmove  %r12,%rbx
   198b7:	45 39 de             	cmp    %r11d,%r14d
   198ba:	49 0f 43 dd          	cmovae %r13,%rbx
   198be:	01 d5                	add    %edx,%ebp
   198c0:	48 63 c5             	movslq %ebp,%rax
   198c3:	44 89 f1             	mov    %r14d,%ecx
   198c6:	48 d3 e0             	shl    %cl,%rax
   198c9:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   198d0:	49 d3 e3             	shl    %cl,%r11
   198d3:	49 f7 d3             	not    %r11
   198d6:	49 21 db             	and    %rbx,%r11
   198d9:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   198de:	49 09 c3             	or     %rax,%r11
   198e1:	0f b6 db             	movzbl %bl,%ebx
   198e4:	4c 01 d3             	add    %r10,%rbx
   198e7:	49 83 d1 00          	adc    $0x0,%r9
   198eb:	48 89 d8             	mov    %rbx,%rax
   198ee:	4c 09 c8             	or     %r9,%rax
   198f1:	74 30                	je     19923 <<hyperinterval::ieee::Format>::div+0x363>
   198f3:	49 0f bd c1          	bsr    %r9,%rax
   198f7:	83 f0 3f             	xor    $0x3f,%eax
   198fa:	4c 0f bd d3          	bsr    %rbx,%r10
   198fe:	41 83 f2 3f          	xor    $0x3f,%r10d
   19902:	41 83 ca 40          	or     $0x40,%r10d
   19906:	4d 85 c9             	test   %r9,%r9
   19909:	44 0f 45 d0          	cmovne %eax,%r10d
   1990d:	41 83 f2 7f          	xor    $0x7f,%r10d
   19911:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   19915:	39 d5                	cmp    %edx,%ebp
   19917:	7e 0e                	jle    19927 <<hyperinterval::ieee::Format>::div+0x367>
   19919:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   1991e:	e9 af 00 00 00       	jmp    199d2 <<hyperinterval::ieee::Format>::div+0x412>
   19923:	31 c0                	xor    %eax,%eax
   19925:	eb 71                	jmp    19998 <<hyperinterval::ieee::Format>::div+0x3d8>
   19927:	b8 01 00 00 00       	mov    $0x1,%eax
   1992c:	29 d0                	sub    %edx,%eax
   1992e:	39 c5                	cmp    %eax,%ebp
   19930:	7d 18                	jge    1994a <<hyperinterval::ieee::Format>::div+0x38a>
   19932:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19937:	44 01 f9             	add    %r15d,%ecx
   1993a:	fe c9                	dec    %cl
   1993c:	48 d3 e3             	shl    %cl,%rbx
   1993f:	31 c0                	xor    %eax,%eax
   19941:	f6 c1 40             	test   $0x40,%cl
   19944:	48 0f 44 c3          	cmove  %rbx,%rax
   19948:	eb 4e                	jmp    19998 <<hyperinterval::ieee::Format>::div+0x3d8>
   1994a:	44 89 f1             	mov    %r14d,%ecx
   1994d:	44 29 d1             	sub    %r10d,%ecx
   19950:	89 c8                	mov    %ecx,%eax
   19952:	f7 d8                	neg    %eax
   19954:	49 89 df             	mov    %rbx,%r15
   19957:	49 d3 e7             	shl    %cl,%r15
   1995a:	45 31 e4             	xor    %r12d,%r12d
   1995d:	f6 c1 40             	test   $0x40,%cl
   19960:	4d 0f 44 e7          	cmove  %r15,%r12
   19964:	89 c1                	mov    %eax,%ecx
   19966:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   1996a:	49 d3 e9             	shr    %cl,%r9
   1996d:	a8 40                	test   $0x40,%al
   1996f:	4c 0f 44 cb          	cmove  %rbx,%r9
   19973:	45 39 d6             	cmp    %r10d,%r14d
   19976:	4d 0f 43 cc          	cmovae %r12,%r9
   1997a:	01 d5                	add    %edx,%ebp
   1997c:	48 63 d5             	movslq %ebp,%rdx
   1997f:	44 89 f1             	mov    %r14d,%ecx
   19982:	48 d3 e2             	shl    %cl,%rdx
   19985:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   1998c:	48 d3 e0             	shl    %cl,%rax
   1998f:	48 f7 d0             	not    %rax
   19992:	4c 21 c8             	and    %r9,%rax
   19995:	48 09 d0             	or     %rdx,%rax
   19998:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   1999d:	0f 95 c1             	setne  %cl
   199a0:	49 85 f0             	test   %rsi,%r8
   199a3:	0f 94 c2             	sete   %dl
   199a6:	30 ca                	xor    %cl,%dl
   199a8:	75 1d                	jne    199c7 <<hyperinterval::ieee::Format>::div+0x407>
   199aa:	48 89 c1             	mov    %rax,%rcx
   199ad:	48 31 f1             	xor    %rsi,%rcx
   199b0:	48 85 c0             	test   %rax,%rax
   199b3:	48 0f 44 c8          	cmove  %rax,%rcx
   199b7:	4c 31 de             	xor    %r11,%rsi
   199ba:	4d 85 db             	test   %r11,%r11
   199bd:	49 0f 44 f3          	cmove  %r11,%rsi
   199c1:	48 89 f0             	mov    %rsi,%rax
   199c4:	49 89 cb             	mov    %rcx,%r11
   199c7:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   199cb:	48 89 47 10          	mov    %rax,0x10(%rdi)
   199cf:	c6 07 00             	movb   $0x0,(%rdi)
   199d2:	48 83 c4 38          	add    $0x38,%rsp
   199d6:	5b                   	pop    %rbx
   199d7:	41 5c                	pop    %r12
   199d9:	41 5d                	pop    %r13
   199db:	41 5e                	pop    %r14
   199dd:	41 5f                	pop    %r15
   199df:	5d                   	pop    %rbp
   199e0:	c3                   	ret
   199e1:	48 8d 3d 08 56 03 00 	lea    0x35608(%rip),%rdi        # 4eff0 <__frame_dummy_init_array_entry+0x450>
   199e8:	e8 93 cc ff ff       	call   16680 <core::panicking::panic_const::panic_const_div_by_zero>
   199ed:	48 8d 3d e4 55 03 00 	lea    0x355e4(%rip),%rdi        # 4efd8 <__frame_dummy_init_array_entry+0x438>
   199f4:	e8 87 cc ff ff       	call   16680 <core::panicking::panic_const::panic_const_div_by_zero>
   199f9:	cc                   	int3
   199fa:	cc                   	int3
   199fb:	cc                   	int3
   199fc:	cc                   	int3
   199fd:	cc                   	int3
   199fe:	cc                   	int3
   199ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19a00:	55                   	push   %rbp
   19a01:	41 57                	push   %r15
   19a03:	41 56                	push   %r14
   19a05:	41 55                	push   %r13
   19a07:	41 54                	push   %r12
   19a09:	53                   	push   %rbx
   19a0a:	48 83 ec 78          	sub    $0x78,%rsp
   19a0e:	48 89 fb             	mov    %rdi,%rbx
   19a11:	f6 06 01             	testb  $0x1,(%rsi)
   19a14:	0f 84 e9 00 00 00    	je     19b03 <<hyperinterval::float::F32Enclosure>::square+0x103>
   19a1a:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   19a1e:	8b 6e 08             	mov    0x8(%rsi),%ebp
   19a21:	44 89 f0             	mov    %r14d,%eax
   19a24:	c1 e8 17             	shr    $0x17,%eax
   19a27:	0f b6 c0             	movzbl %al,%eax
   19a2a:	44 89 f1             	mov    %r14d,%ecx
   19a2d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19a33:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19a3a:	85 c0                	test   %eax,%eax
   19a3c:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19a43:	48 0f 44 d1          	cmove  %rcx,%rdx
   19a47:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   19a4d:	41 0f 44 c7          	cmove  %r15d,%eax
   19a51:	48 0f af d2          	imul   %rdx,%rdx
   19a55:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19a5a:	48 89 14 24          	mov    %rdx,(%rsp)
   19a5e:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19a65:	00 00 
   19a67:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19a6b:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19a70:	48 89 e1             	mov    %rsp,%rcx
   19a73:	be 00 00 00 80       	mov    $0x80000000,%esi
   19a78:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19a7d:	e8 4e f8 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   19a82:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   19a87:	75 6a                	jne    19af3 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   19a89:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   19a8e:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   19a93:	89 e8                	mov    %ebp,%eax
   19a95:	c1 e8 17             	shr    $0x17,%eax
   19a98:	0f b6 c0             	movzbl %al,%eax
   19a9b:	89 e9                	mov    %ebp,%ecx
   19a9d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19aa3:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19aaa:	85 c0                	test   %eax,%eax
   19aac:	48 0f 44 d1          	cmove  %rcx,%rdx
   19ab0:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19ab7:	41 0f 44 c7          	cmove  %r15d,%eax
   19abb:	48 0f af d2          	imul   %rdx,%rdx
   19abf:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19ac4:	48 89 14 24          	mov    %rdx,(%rsp)
   19ac8:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19acf:	00 00 
   19ad1:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19ad5:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19ada:	48 89 e1             	mov    %rsp,%rcx
   19add:	be 00 00 00 80       	mov    $0x80000000,%esi
   19ae2:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19ae7:	e8 e4 f7 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   19aec:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   19af1:	75 25                	jne    19b18 <<hyperinterval::float::F32Enclosure>::square+0x118>
   19af3:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   19af8:	88 43 04             	mov    %al,0x4(%rbx)
   19afb:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19b01:	eb 06                	jmp    19b09 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19b03:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19b09:	48 83 c4 78          	add    $0x78,%rsp
   19b0d:	5b                   	pop    %rbx
   19b0e:	41 5c                	pop    %r12
   19b10:	41 5d                	pop    %r13
   19b12:	41 5e                	pop    %r14
   19b14:	41 5f                	pop    %r15
   19b16:	5d                   	pop    %rbp
   19b17:	c3                   	ret
   19b18:	8b 44 24 40          	mov    0x40(%rsp),%eax
   19b1c:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19b21:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   19b26:	48 89 e7             	mov    %rsp,%rdi
   19b29:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b2e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b33:	4c 89 e9             	mov    %r13,%rcx
   19b36:	e8 15 f3 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   19b3b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19b3f:	74 25                	je     19b66 <<hyperinterval::float::F32Enclosure>::square+0x166>
   19b41:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   19b46:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19b4b:	48 89 e7             	mov    %rsp,%rdi
   19b4e:	be 00 00 00 80       	mov    $0x80000000,%esi
   19b53:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19b58:	4c 89 e1             	mov    %r12,%rcx
   19b5b:	e8 f0 f2 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   19b60:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19b64:	75 07                	jne    19b6d <<hyperinterval::float::F32Enclosure>::square+0x16d>
   19b66:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19b6b:	eb 8b                	jmp    19af8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19b6d:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   19b72:	45 89 fd             	mov    %r15d,%r13d
   19b75:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   19b7c:	41 89 d4             	mov    %edx,%r12d
   19b7f:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   19b86:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19b8b:	4c 29 e8             	sub    %r13,%rax
   19b8e:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19b93:	49 09 cd             	or     %rcx,%r13
   19b96:	45 85 ff             	test   %r15d,%r15d
   19b99:	4c 0f 48 e8          	cmovs  %rax,%r13
   19b9d:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19ba2:	4c 29 e0             	sub    %r12,%rax
   19ba5:	49 09 cc             	or     %rcx,%r12
   19ba8:	85 d2                	test   %edx,%edx
   19baa:	4c 0f 48 e0          	cmovs  %rax,%r12
   19bae:	b0 01                	mov    $0x1,%al
   19bb0:	4d 39 e5             	cmp    %r12,%r13
   19bb3:	0f 87 3f ff ff ff    	ja     19af8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19bb9:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19bbe:	48 89 e7             	mov    %rsp,%rdi
   19bc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bc6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bcb:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   19bd0:	e8 7b f2 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   19bd5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19bd9:	74 27                	je     19c02 <<hyperinterval::float::F32Enclosure>::square+0x202>
   19bdb:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19be0:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19be5:	48 89 e7             	mov    %rsp,%rdi
   19be8:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bed:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bf2:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   19bf7:	e8 54 f2 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   19bfc:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19c00:	75 13                	jne    19c15 <<hyperinterval::float::F32Enclosure>::square+0x215>
   19c02:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19c07:	88 53 04             	mov    %dl,0x4(%rbx)
   19c0a:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19c10:	e9 f4 fe ff ff       	jmp    19b09 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19c15:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19c1a:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   19c1f:	44 89 c1             	mov    %r8d,%ecx
   19c22:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19c28:	89 c2                	mov    %eax,%edx
   19c2a:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19c30:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c35:	48 29 ce             	sub    %rcx,%rsi
   19c38:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19c3d:	48 09 f9             	or     %rdi,%rcx
   19c40:	45 85 c0             	test   %r8d,%r8d
   19c43:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19c47:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   19c4b:	48 29 d7             	sub    %rdx,%rdi
   19c4e:	85 c0                	test   %eax,%eax
   19c50:	48 0f 49 fe          	cmovns %rsi,%rdi
   19c54:	b2 01                	mov    $0x1,%dl
   19c56:	48 39 f9             	cmp    %rdi,%rcx
   19c59:	77 ac                	ja     19c07 <<hyperinterval::float::F32Enclosure>::square+0x207>
   19c5b:	41 39 cd             	cmp    %ecx,%r13d
   19c5e:	45 0f 47 f8          	cmova  %r8d,%r15d
   19c62:	41 39 fc             	cmp    %edi,%r12d
   19c65:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19c6a:	0f 42 c8             	cmovb  %eax,%ecx
   19c6d:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   19c74:	00 
   19c75:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   19c7a:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   19c7e:	45 85 f6             	test   %r14d,%r14d
   19c81:	7f 6d                	jg     19cf0 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   19c83:	85 ed                	test   %ebp,%ebp
   19c85:	0f 98 c0             	sets   %al
   19c88:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   19c8e:	0f 95 c1             	setne  %cl
   19c91:	84 c8                	test   %cl,%al
   19c93:	75 5b                	jne    19cf0 <<hyperinterval::float::F32Enclosure>::square+0x2f0>
   19c95:	48 89 e7             	mov    %rsp,%rdi
   19c98:	31 f6                	xor    %esi,%esi
   19c9a:	31 d2                	xor    %edx,%edx
   19c9c:	e8 cf 05 00 00       	call   1a270 <<hyperinterval::float::F32Enclosure>::from_bits>
   19ca1:	8b 0c 24             	mov    (%rsp),%ecx
   19ca4:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19ca9:	83 f9 02             	cmp    $0x2,%ecx
   19cac:	0f 84 46 fe ff ff    	je     19af8 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19cb2:	8b 54 24 05          	mov    0x5(%rsp),%edx
   19cb6:	8b 74 24 08          	mov    0x8(%rsp),%esi
   19cba:	89 74 24 40          	mov    %esi,0x40(%rsp)
   19cbe:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   19cc2:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   19cc6:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   19cca:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   19ccf:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   19cd4:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   19cd9:	e8 42 04 00 00       	call   1a120 <<hyperinterval::float::F32Enclosure>::hull>
   19cde:	8b 44 24 74          	mov    0x74(%rsp),%eax
   19ce2:	89 44 24 30          	mov    %eax,0x30(%rsp)
   19ce6:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   19ceb:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19cf0:	8b 44 24 30          	mov    0x30(%rsp),%eax
   19cf4:	89 43 08             	mov    %eax,0x8(%rbx)
   19cf7:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   19cfc:	48 89 03             	mov    %rax,(%rbx)
   19cff:	e9 05 fe ff ff       	jmp    19b09 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19d04:	cc                   	int3
   19d05:	cc                   	int3
   19d06:	cc                   	int3
   19d07:	cc                   	int3
   19d08:	cc                   	int3
   19d09:	cc                   	int3
   19d0a:	cc                   	int3
   19d0b:	cc                   	int3
   19d0c:	cc                   	int3
   19d0d:	cc                   	int3
   19d0e:	cc                   	int3
   19d0f:	cc                   	int3

<hyperinterval::ieee::Format>::power:
   19d10:	55                   	push   %rbp
   19d11:	41 57                	push   %r15
   19d13:	41 56                	push   %r14
   19d15:	41 55                	push   %r13
   19d17:	41 54                	push   %r12
   19d19:	53                   	push   %rbx
   19d1a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   19d21:	49 89 ca             	mov    %rcx,%r10
   19d24:	49 89 d6             	mov    %rdx,%r14
   19d27:	48 85 f1             	test   %rsi,%rcx
   19d2a:	0f 95 c0             	setne  %al
   19d2d:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   19d32:	49 89 d3             	mov    %rdx,%r11
   19d35:	44 89 c9             	mov    %r9d,%ecx
   19d38:	49 d3 eb             	shr    %cl,%r11
   19d3b:	49 d1 eb             	shr    $1,%r11
   19d3e:	49 63 d3             	movslq %r11d,%rdx
   19d41:	48 d3 e2             	shl    %cl,%rdx
   19d44:	45 85 c0             	test   %r8d,%r8d
   19d47:	0f 84 65 03 00 00    	je     1a0b2 <<hyperinterval::ieee::Format>::power+0x3a2>
   19d4d:	88 44 24 07          	mov    %al,0x7(%rsp)
   19d51:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   19d56:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   19d5a:	49 21 c2             	and    %rax,%r10
   19d5d:	bb 01 00 00 00       	mov    $0x1,%ebx
   19d62:	44 89 c9             	mov    %r9d,%ecx
   19d65:	48 d3 e3             	shl    %cl,%rbx
   19d68:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   19d6c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   19d71:	45 01 cb             	add    %r9d,%r11d
   19d74:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19d7a:	45 29 df             	sub    %r11d,%r15d
   19d7d:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   19d82:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   19d87:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   19d8c:	44 89 c5             	mov    %r8d,%ebp
   19d8f:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   19d94:	4d 89 d5             	mov    %r10,%r13
   19d97:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19d9c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   19da1:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   19da8:	00 
   19da9:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   19dae:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   19db3:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   19dba:	00 
   19dbb:	40 f6 c5 01          	test   $0x1,%bpl
   19dbf:	75 2f                	jne    19df0 <<hyperinterval::ieee::Format>::power+0xe0>
   19dc1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   19dc8:	0f 1f 84 00 00 00 00 
   19dcf:	00 
   19dd0:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19dd5:	d1 ed                	shr    $1,%ebp
   19dd7:	0f 85 b6 01 00 00    	jne    19f93 <<hyperinterval::ieee::Format>::power+0x283>
   19ddd:	e9 13 03 00 00       	jmp    1a0f5 <<hyperinterval::ieee::Format>::power+0x3e5>
   19de2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   19de9:	1f 84 00 00 00 00 00 
   19df0:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   19df4:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   19df9:	4c 89 c2             	mov    %r8,%rdx
   19dfc:	4c 21 f2             	and    %r14,%rdx
   19dff:	44 89 c9             	mov    %r9d,%ecx
   19e02:	48 d3 ea             	shr    %cl,%rdx
   19e05:	4c 89 c0             	mov    %r8,%rax
   19e08:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19e0d:	48 21 e8             	and    %rbp,%rax
   19e10:	41 89 d2             	mov    %edx,%r10d
   19e13:	45 29 da             	sub    %r11d,%r10d
   19e16:	48 85 d2             	test   %rdx,%rdx
   19e19:	45 0f 44 d7          	cmove  %r15d,%r10d
   19e1d:	48 0f 45 d3          	cmovne %rbx,%rdx
   19e21:	48 09 c2             	or     %rax,%rdx
   19e24:	4c 89 e8             	mov    %r13,%rax
   19e27:	4c 21 f0             	and    %r14,%rax
   19e2a:	48 d3 e8             	shr    %cl,%rax
   19e2d:	4c 89 e9             	mov    %r13,%rcx
   19e30:	48 21 e9             	and    %rbp,%rcx
   19e33:	89 c5                	mov    %eax,%ebp
   19e35:	44 29 dd             	sub    %r11d,%ebp
   19e38:	48 85 c0             	test   %rax,%rax
   19e3b:	41 0f 44 ef          	cmove  %r15d,%ebp
   19e3f:	48 0f 45 c3          	cmovne %rbx,%rax
   19e43:	48 09 c8             	or     %rcx,%rax
   19e46:	49 85 f0             	test   %rsi,%r8
   19e49:	0f 95 c1             	setne  %cl
   19e4c:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   19e53:	00 
   19e54:	49 85 f5             	test   %rsi,%r13
   19e57:	41 0f 95 c0          	setne  %r8b
   19e5b:	48 f7 e2             	mul    %rdx
   19e5e:	41 30 c8             	xor    %cl,%r8b
   19e61:	44 01 d5             	add    %r10d,%ebp
   19e64:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   19e69:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19e6e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19e73:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   19e77:	4c 89 f2             	mov    %r14,%rdx
   19e7a:	4c 89 e1             	mov    %r12,%rcx
   19e7d:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19e82:	4d 89 dd             	mov    %r11,%r13
   19e85:	4d 89 cc             	mov    %r9,%r12
   19e88:	e8 43 f4 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   19e8d:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   19e92:	0f 85 09 02 00 00    	jne    1a0a1 <<hyperinterval::ieee::Format>::power+0x391>
   19e98:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   19e9d:	4c 89 c2             	mov    %r8,%rdx
   19ea0:	4c 21 f2             	and    %r14,%rdx
   19ea3:	4d 89 f2             	mov    %r14,%r10
   19ea6:	44 89 e1             	mov    %r12d,%ecx
   19ea9:	48 d3 ea             	shr    %cl,%rdx
   19eac:	4c 89 c7             	mov    %r8,%rdi
   19eaf:	48 21 ef             	and    %rbp,%rdi
   19eb2:	89 d6                	mov    %edx,%esi
   19eb4:	4d 89 ee             	mov    %r13,%r14
   19eb7:	44 29 f6             	sub    %r14d,%esi
   19eba:	48 85 d2             	test   %rdx,%rdx
   19ebd:	41 0f 44 f7          	cmove  %r15d,%esi
   19ec1:	48 0f 45 d3          	cmovne %rbx,%rdx
   19ec5:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
   19eca:	4c 89 c8             	mov    %r9,%rax
   19ecd:	4c 21 d0             	and    %r10,%rax
   19ed0:	4d 89 d5             	mov    %r10,%r13
   19ed3:	48 d3 e8             	shr    %cl,%rax
   19ed6:	48 09 fa             	or     %rdi,%rdx
   19ed9:	4c 89 c9             	mov    %r9,%rcx
   19edc:	48 21 e9             	and    %rbp,%rcx
   19edf:	89 c7                	mov    %eax,%edi
   19ee1:	44 29 f7             	sub    %r14d,%edi
   19ee4:	48 85 c0             	test   %rax,%rax
   19ee7:	41 0f 44 ff          	cmove  %r15d,%edi
   19eeb:	48 0f 45 c3          	cmovne %rbx,%rax
   19eef:	48 09 c8             	or     %rcx,%rax
   19ef2:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   19ef9:	00 
   19efa:	4d 85 f8             	test   %r15,%r8
   19efd:	0f 95 c1             	setne  %cl
   19f00:	4d 85 f9             	test   %r15,%r9
   19f03:	41 0f 95 c0          	setne  %r8b
   19f07:	41 30 c8             	xor    %cl,%r8b
   19f0a:	48 f7 e2             	mul    %rdx
   19f0d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   19f12:	01 f7                	add    %esi,%edi
   19f14:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   19f19:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19f1e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19f23:	89 7c 24 40          	mov    %edi,0x40(%rsp)
   19f27:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   19f2c:	48 89 fd             	mov    %rdi,%rbp
   19f2f:	4c 89 fe             	mov    %r15,%rsi
   19f32:	4c 89 d2             	mov    %r10,%rdx
   19f35:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   19f3a:	49 89 cc             	mov    %rcx,%r12
   19f3d:	e8 8e f3 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   19f42:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   19f47:	0f 84 54 01 00 00    	je     1a0a1 <<hyperinterval::ieee::Format>::power+0x391>
   19f4d:	4c 89 fe             	mov    %r15,%rsi
   19f50:	4d 89 f3             	mov    %r14,%r11
   19f53:	4d 89 ee             	mov    %r13,%r14
   19f56:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   19f5b:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   19f60:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   19f65:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   19f6c:	00 
   19f6d:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   19f72:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19f77:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   19f7c:	48 89 ef             	mov    %rbp,%rdi
   19f7f:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   19f83:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   19f8a:	00 
   19f8b:	d1 ed                	shr    $1,%ebp
   19f8d:	0f 84 62 01 00 00    	je     1a0f5 <<hyperinterval::ieee::Format>::power+0x3e5>
   19f93:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   19f97:	4c 89 e8             	mov    %r13,%rax
   19f9a:	4c 21 f0             	and    %r14,%rax
   19f9d:	44 89 c9             	mov    %r9d,%ecx
   19fa0:	48 d3 e8             	shr    %cl,%rax
   19fa3:	49 21 d5             	and    %rdx,%r13
   19fa6:	89 c1                	mov    %eax,%ecx
   19fa8:	44 29 d9             	sub    %r11d,%ecx
   19fab:	48 85 c0             	test   %rax,%rax
   19fae:	48 0f 45 c3          	cmovne %rbx,%rax
   19fb2:	41 0f 44 cf          	cmove  %r15d,%ecx
   19fb6:	4c 09 e8             	or     %r13,%rax
   19fb9:	48 89 d5             	mov    %rdx,%rbp
   19fbc:	48 f7 e0             	mul    %rax
   19fbf:	01 c9                	add    %ecx,%ecx
   19fc1:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   19fc6:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19fcb:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19fd0:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   19fd4:	4c 89 f2             	mov    %r14,%rdx
   19fd7:	4c 89 e1             	mov    %r12,%rcx
   19fda:	49 89 dd             	mov    %rbx,%r13
   19fdd:	4c 89 db             	mov    %r11,%rbx
   19fe0:	4d 89 f4             	mov    %r14,%r12
   19fe3:	4d 89 ce             	mov    %r9,%r14
   19fe6:	e8 e5 f2 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   19feb:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   19ff0:	0f 85 ab 00 00 00    	jne    1a0a1 <<hyperinterval::ieee::Format>::power+0x391>
   19ff6:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   19ffb:	48 89 d0             	mov    %rdx,%rax
   19ffe:	4c 21 e0             	and    %r12,%rax
   1a001:	44 89 f1             	mov    %r14d,%ecx
   1a004:	48 d3 e8             	shr    %cl,%rax
   1a007:	48 21 ea             	and    %rbp,%rdx
   1a00a:	89 c1                	mov    %eax,%ecx
   1a00c:	29 d9                	sub    %ebx,%ecx
   1a00e:	48 85 c0             	test   %rax,%rax
   1a011:	49 0f 45 c5          	cmovne %r13,%rax
   1a015:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a019:	48 09 d0             	or     %rdx,%rax
   1a01c:	48 f7 e0             	mul    %rax
   1a01f:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1a024:	01 c9                	add    %ecx,%ecx
   1a026:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a02b:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a030:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a035:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a039:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1a03e:	48 89 ef             	mov    %rbp,%rdi
   1a041:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1a048:	00 
   1a049:	4c 89 f6             	mov    %r14,%rsi
   1a04c:	4c 89 e2             	mov    %r12,%rdx
   1a04f:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1a054:	4c 89 f9             	mov    %r15,%rcx
   1a057:	e8 74 f2 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   1a05c:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a061:	74 3e                	je     1a0a1 <<hyperinterval::ieee::Format>::power+0x391>
   1a063:	4c 89 f6             	mov    %r14,%rsi
   1a066:	49 89 db             	mov    %rbx,%r11
   1a069:	4d 89 e6             	mov    %r12,%r14
   1a06c:	48 89 ef             	mov    %rbp,%rdi
   1a06f:	4d 89 fc             	mov    %r15,%r12
   1a072:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a077:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1a07c:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a083:	00 
   1a084:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a089:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a08e:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a092:	40 f6 c5 01          	test   $0x1,%bpl
   1a096:	0f 85 54 fd ff ff    	jne    19df0 <<hyperinterval::ieee::Format>::power+0xe0>
   1a09c:	e9 2f fd ff ff       	jmp    19dd0 <<hyperinterval::ieee::Format>::power+0xc0>
   1a0a1:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1a0a6:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a0ab:	88 47 01             	mov    %al,0x1(%rdi)
   1a0ae:	b0 01                	mov    $0x1,%al
   1a0b0:	eb 2f                	jmp    1a0e1 <<hyperinterval::ieee::Format>::power+0x3d1>
   1a0b2:	48 89 d1             	mov    %rdx,%rcx
   1a0b5:	44 20 c0             	and    %r8b,%al
   1a0b8:	74 1d                	je     1a0d7 <<hyperinterval::ieee::Format>::power+0x3c7>
   1a0ba:	48 89 d0             	mov    %rdx,%rax
   1a0bd:	48 31 f0             	xor    %rsi,%rax
   1a0c0:	48 85 d2             	test   %rdx,%rdx
   1a0c3:	48 0f 44 c2          	cmove  %rdx,%rax
   1a0c7:	48 31 ce             	xor    %rcx,%rsi
   1a0ca:	48 85 c9             	test   %rcx,%rcx
   1a0cd:	48 0f 44 f1          	cmove  %rcx,%rsi
   1a0d1:	48 89 c1             	mov    %rax,%rcx
   1a0d4:	48 89 f2             	mov    %rsi,%rdx
   1a0d7:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1a0db:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a0df:	31 c0                	xor    %eax,%eax
   1a0e1:	88 07                	mov    %al,(%rdi)
   1a0e3:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1a0ea:	5b                   	pop    %rbx
   1a0eb:	41 5c                	pop    %r12
   1a0ed:	41 5d                	pop    %r13
   1a0ef:	41 5e                	pop    %r14
   1a0f1:	41 5f                	pop    %r15
   1a0f3:	5d                   	pop    %rbp
   1a0f4:	c3                   	ret
   1a0f5:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a0fa:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1a0ff:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1a104:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1a109:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1a10e:	44 20 c0             	and    %r8b,%al
   1a111:	75 a7                	jne    1a0ba <<hyperinterval::ieee::Format>::power+0x3aa>
   1a113:	eb c2                	jmp    1a0d7 <<hyperinterval::ieee::Format>::power+0x3c7>
   1a115:	cc                   	int3
   1a116:	cc                   	int3
   1a117:	cc                   	int3
   1a118:	cc                   	int3
   1a119:	cc                   	int3
   1a11a:	cc                   	int3
   1a11b:	cc                   	int3
   1a11c:	cc                   	int3
   1a11d:	cc                   	int3
   1a11e:	cc                   	int3
   1a11f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   1a120:	44 8b 16             	mov    (%rsi),%r10d
   1a123:	44 8b 0a             	mov    (%rdx),%r9d
   1a126:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a12a:	8b 42 08             	mov    0x8(%rdx),%eax
   1a12d:	41 f6 c2 01          	test   $0x1,%r10b
   1a131:	0f 84 9d 00 00 00    	je     1a1d4 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   1a137:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1a13a:	8b 56 08             	mov    0x8(%rsi),%edx
   1a13d:	41 f6 c1 01          	test   $0x1,%r9b
   1a141:	0f 84 98 00 00 00    	je     1a1df <<hyperinterval::float::F32Enclosure>::hull+0xbf>
   1a147:	53                   	push   %rbx
   1a148:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a14d:	44 8d 0c 31          	lea    (%rcx,%rsi,1),%r9d
   1a151:	41 89 ca             	mov    %ecx,%r10d
   1a154:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a15b:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a161:	45 29 d3             	sub    %r10d,%r11d
   1a164:	85 c9                	test   %ecx,%ecx
   1a166:	4d 0f 49 d9          	cmovns %r9,%r11
   1a16a:	45 8d 0c 30          	lea    (%r8,%rsi,1),%r9d
   1a16e:	45 89 c2             	mov    %r8d,%r10d
   1a171:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a178:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a17d:	44 29 d3             	sub    %r10d,%ebx
   1a180:	45 85 c0             	test   %r8d,%r8d
   1a183:	49 0f 49 d9          	cmovns %r9,%rbx
   1a187:	41 39 db             	cmp    %ebx,%r11d
   1a18a:	41 0f 47 c8          	cmova  %r8d,%ecx
   1a18e:	44 8d 04 32          	lea    (%rdx,%rsi,1),%r8d
   1a192:	41 89 d1             	mov    %edx,%r9d
   1a195:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a19c:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a1a2:	45 29 ca             	sub    %r9d,%r10d
   1a1a5:	85 d2                	test   %edx,%edx
   1a1a7:	4d 0f 49 d0          	cmovns %r8,%r10
   1a1ab:	44 8d 04 30          	lea    (%rax,%rsi,1),%r8d
   1a1af:	41 89 c1             	mov    %eax,%r9d
   1a1b2:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a1b9:	44 29 ce             	sub    %r9d,%esi
   1a1bc:	85 c0                	test   %eax,%eax
   1a1be:	49 0f 49 f0          	cmovns %r8,%rsi
   1a1c2:	41 39 f2             	cmp    %esi,%r10d
   1a1c5:	0f 42 d0             	cmovb  %eax,%edx
   1a1c8:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1a1ce:	89 d0                	mov    %edx,%eax
   1a1d0:	41 89 c8             	mov    %ecx,%r8d
   1a1d3:	5b                   	pop    %rbx
   1a1d4:	44 89 0f             	mov    %r9d,(%rdi)
   1a1d7:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1a1db:	89 47 08             	mov    %eax,0x8(%rdi)
   1a1de:	c3                   	ret
   1a1df:	89 d0                	mov    %edx,%eax
   1a1e1:	41 89 c8             	mov    %ecx,%r8d
   1a1e4:	45 89 d1             	mov    %r10d,%r9d
   1a1e7:	44 89 0f             	mov    %r9d,(%rdi)
   1a1ea:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1a1ee:	89 47 08             	mov    %eax,0x8(%rdi)
   1a1f1:	c3                   	ret
   1a1f2:	cc                   	int3
   1a1f3:	cc                   	int3
   1a1f4:	cc                   	int3
   1a1f5:	cc                   	int3
   1a1f6:	cc                   	int3
   1a1f7:	cc                   	int3
   1a1f8:	cc                   	int3
   1a1f9:	cc                   	int3
   1a1fa:	cc                   	int3
   1a1fb:	cc                   	int3
   1a1fc:	cc                   	int3
   1a1fd:	cc                   	int3
   1a1fe:	cc                   	int3
   1a1ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::signs:
   1a200:	83 3f 01             	cmpl   $0x1,(%rdi)
   1a203:	75 65                	jne    1a26a <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   1a205:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a20a:	8b 57 04             	mov    0x4(%rdi),%edx
   1a20d:	8b 47 08             	mov    0x8(%rdi),%eax
   1a210:	48 89 d6             	mov    %rdx,%rsi
   1a213:	48 09 ce             	or     %rcx,%rsi
   1a216:	41 89 d0             	mov    %edx,%r8d
   1a219:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a220:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1a225:	4c 29 c7             	sub    %r8,%rdi
   1a228:	85 d2                	test   %edx,%edx
   1a22a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1a22e:	31 f6                	xor    %esi,%esi
   1a230:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   1a236:	0f 94 c2             	sete   %dl
   1a239:	48 39 cf             	cmp    %rcx,%rdi
   1a23c:	77 1d                	ja     1a25b <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   1a23e:	39 cf                	cmp    %ecx,%edi
   1a240:	0f 92 c1             	setb   %cl
   1a243:	80 c9 02             	or     $0x2,%cl
   1a246:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1a24b:	0f b6 c9             	movzbl %cl,%ecx
   1a24e:	40 88 d6             	mov    %dl,%sil
   1a251:	0f 44 f1             	cmove  %ecx,%esi
   1a254:	85 c0                	test   %eax,%eax
   1a256:	0f 49 f1             	cmovns %ecx,%esi
   1a259:	89 f2                	mov    %esi,%edx
   1a25b:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1a25e:	85 c0                	test   %eax,%eax
   1a260:	0f b6 d2             	movzbl %dl,%edx
   1a263:	0f b6 c1             	movzbl %cl,%eax
   1a266:	0f 4e c2             	cmovle %edx,%eax
   1a269:	c3                   	ret
   1a26a:	31 c0                	xor    %eax,%eax
   1a26c:	c3                   	ret
   1a26d:	cc                   	int3
   1a26e:	cc                   	int3
   1a26f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1a270:	41 57                	push   %r15
   1a272:	41 56                	push   %r14
   1a274:	41 54                	push   %r12
   1a276:	53                   	push   %rbx
   1a277:	48 83 ec 18          	sub    $0x18,%rsp
   1a27b:	49 89 d6             	mov    %rdx,%r14
   1a27e:	48 89 fb             	mov    %rdi,%rbx
   1a281:	41 bf 00 00 00 80    	mov    $0x80000000,%r15d
   1a287:	89 f1                	mov    %esi,%ecx
   1a289:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a28e:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a293:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a298:	e8 b3 eb ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a29d:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a2a2:	74 23                	je     1a2c7 <<hyperinterval::float::F32Enclosure>::from_bits+0x57>
   1a2a4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1a2a9:	44 89 f1             	mov    %r14d,%ecx
   1a2ac:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a2b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a2b6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a2bb:	e8 90 eb ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a2c0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a2c5:	75 1a                	jne    1a2e1 <<hyperinterval::float::F32Enclosure>::from_bits+0x71>
   1a2c7:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a2cc:	88 43 04             	mov    %al,0x4(%rbx)
   1a2cf:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a2d5:	48 83 c4 18          	add    $0x18,%rsp
   1a2d9:	5b                   	pop    %rbx
   1a2da:	41 5c                	pop    %r12
   1a2dc:	41 5e                	pop    %r14
   1a2de:	41 5f                	pop    %r15
   1a2e0:	c3                   	ret
   1a2e1:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a2e5:	44 89 e1             	mov    %r12d,%ecx
   1a2e8:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a2ee:	89 c2                	mov    %eax,%edx
   1a2f0:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a2f6:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a2fb:	29 ce                	sub    %ecx,%esi
   1a2fd:	44 09 f9             	or     %r15d,%ecx
   1a300:	45 85 e4             	test   %r12d,%r12d
   1a303:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a307:	89 d1                	mov    %edx,%ecx
   1a309:	44 09 f9             	or     %r15d,%ecx
   1a30c:	41 29 d7             	sub    %edx,%r15d
   1a30f:	85 c0                	test   %eax,%eax
   1a311:	4c 0f 49 f9          	cmovns %rcx,%r15
   1a315:	44 39 fe             	cmp    %r15d,%esi
   1a318:	76 06                	jbe    1a320 <<hyperinterval::float::F32Enclosure>::from_bits+0xb0>
   1a31a:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a31e:	eb af                	jmp    1a2cf <<hyperinterval::float::F32Enclosure>::from_bits+0x5f>
   1a320:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a326:	44 89 63 04          	mov    %r12d,0x4(%rbx)
   1a32a:	89 43 08             	mov    %eax,0x8(%rbx)
   1a32d:	eb a6                	jmp    1a2d5 <<hyperinterval::float::F32Enclosure>::from_bits+0x65>
   1a32f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   1a330:	45 31 c9             	xor    %r9d,%r9d
   1a333:	f6 06 01             	testb  $0x1,(%rsi)
   1a336:	0f 84 ed 00 00 00    	je     1a429 <<hyperinterval::float::F32Enclosure>::intersection+0xf9>
   1a33c:	f6 02 01             	testb  $0x1,(%rdx)
   1a33f:	0f 84 d9 00 00 00    	je     1a41e <<hyperinterval::float::F32Enclosure>::intersection+0xee>
   1a345:	53                   	push   %rbx
   1a346:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a34a:	8b 46 04             	mov    0x4(%rsi),%eax
   1a34d:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a352:	41 89 c1             	mov    %eax,%r9d
   1a355:	41 09 c9             	or     %ecx,%r9d
   1a358:	41 89 c2             	mov    %eax,%r10d
   1a35b:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a362:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a368:	45 29 d3             	sub    %r10d,%r11d
   1a36b:	85 c0                	test   %eax,%eax
   1a36d:	4d 0f 49 d9          	cmovns %r9,%r11
   1a371:	45 89 c1             	mov    %r8d,%r9d
   1a374:	41 09 c9             	or     %ecx,%r9d
   1a377:	45 89 c2             	mov    %r8d,%r10d
   1a37a:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a381:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a386:	44 29 d3             	sub    %r10d,%ebx
   1a389:	45 85 c0             	test   %r8d,%r8d
   1a38c:	49 0f 49 d9          	cmovns %r9,%rbx
   1a390:	8b 52 08             	mov    0x8(%rdx),%edx
   1a393:	41 39 db             	cmp    %ebx,%r11d
   1a396:	41 0f 42 c0          	cmovb  %r8d,%eax
   1a39a:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   1a39e:	44 89 c6             	mov    %r8d,%esi
   1a3a1:	09 ce                	or     %ecx,%esi
   1a3a3:	45 89 c1             	mov    %r8d,%r9d
   1a3a6:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a3ad:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a3b3:	45 29 ca             	sub    %r9d,%r10d
   1a3b6:	45 85 c0             	test   %r8d,%r8d
   1a3b9:	4c 0f 49 d6          	cmovns %rsi,%r10
   1a3bd:	89 d6                	mov    %edx,%esi
   1a3bf:	09 ce                	or     %ecx,%esi
   1a3c1:	41 89 d1             	mov    %edx,%r9d
   1a3c4:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a3cb:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a3d1:	45 29 cb             	sub    %r9d,%r11d
   1a3d4:	85 d2                	test   %edx,%edx
   1a3d6:	4c 0f 49 de          	cmovns %rsi,%r11
   1a3da:	45 39 da             	cmp    %r11d,%r10d
   1a3dd:	44 0f 47 c2          	cmova  %edx,%r8d
   1a3e1:	89 c2                	mov    %eax,%edx
   1a3e3:	09 ca                	or     %ecx,%edx
   1a3e5:	89 c6                	mov    %eax,%esi
   1a3e7:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a3ed:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a3f3:	41 29 f2             	sub    %esi,%r10d
   1a3f6:	85 c0                	test   %eax,%eax
   1a3f8:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a3fc:	44 89 c2             	mov    %r8d,%edx
   1a3ff:	09 ca                	or     %ecx,%edx
   1a401:	44 89 c6             	mov    %r8d,%esi
   1a404:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a40a:	29 f1                	sub    %esi,%ecx
   1a40c:	45 85 c0             	test   %r8d,%r8d
   1a40f:	48 0f 49 ca          	cmovns %rdx,%rcx
   1a413:	45 31 c9             	xor    %r9d,%r9d
   1a416:	41 39 ca             	cmp    %ecx,%r10d
   1a419:	41 0f 96 c1          	setbe  %r9b
   1a41d:	5b                   	pop    %rbx
   1a41e:	44 89 0f             	mov    %r9d,(%rdi)
   1a421:	89 47 04             	mov    %eax,0x4(%rdi)
   1a424:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1a428:	c3                   	ret
   1a429:	44 89 0f             	mov    %r9d,(%rdi)
   1a42c:	89 47 04             	mov    %eax,0x4(%rdi)
   1a42f:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1a433:	c3                   	ret
   1a434:	cc                   	int3
   1a435:	cc                   	int3
   1a436:	cc                   	int3
   1a437:	cc                   	int3
   1a438:	cc                   	int3
   1a439:	cc                   	int3
   1a43a:	cc                   	int3
   1a43b:	cc                   	int3
   1a43c:	cc                   	int3
   1a43d:	cc                   	int3
   1a43e:	cc                   	int3
   1a43f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   1a440:	41 56                	push   %r14
   1a442:	53                   	push   %rbx
   1a443:	48 83 ec 18          	sub    $0x18,%rsp
   1a447:	48 89 fb             	mov    %rdi,%rbx
   1a44a:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   1a450:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a454:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a459:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a45e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a463:	e8 e8 e9 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a468:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a46d:	3c 01                	cmp    $0x1,%al
   1a46f:	75 0d                	jne    1a47e <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   1a471:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1a476:	48 83 c4 18          	add    $0x18,%rsp
   1a47a:	5b                   	pop    %rbx
   1a47b:	41 5e                	pop    %r14
   1a47d:	c3                   	ret
   1a47e:	f6 03 01             	testb  $0x1,(%rbx)
   1a481:	74 44                	je     1a4c7 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   1a483:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a488:	8b 73 04             	mov    0x4(%rbx),%esi
   1a48b:	89 d1                	mov    %edx,%ecx
   1a48d:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a493:	89 f7                	mov    %esi,%edi
   1a495:	44 09 f7             	or     %r14d,%edi
   1a498:	41 89 f0             	mov    %esi,%r8d
   1a49b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a4a2:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a4a8:	45 29 c1             	sub    %r8d,%r9d
   1a4ab:	85 f6                	test   %esi,%esi
   1a4ad:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a4b1:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a4b6:	48 29 ce             	sub    %rcx,%rsi
   1a4b9:	4c 09 f1             	or     %r14,%rcx
   1a4bc:	85 d2                	test   %edx,%edx
   1a4be:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1a4c2:	41 39 c9             	cmp    %ecx,%r9d
   1a4c5:	76 0a                	jbe    1a4d1 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   1a4c7:	31 d2                	xor    %edx,%edx
   1a4c9:	48 83 c4 18          	add    $0x18,%rsp
   1a4cd:	5b                   	pop    %rbx
   1a4ce:	41 5e                	pop    %r14
   1a4d0:	c3                   	ret
   1a4d1:	8b 53 08             	mov    0x8(%rbx),%edx
   1a4d4:	89 d6                	mov    %edx,%esi
   1a4d6:	44 09 f6             	or     %r14d,%esi
   1a4d9:	89 d7                	mov    %edx,%edi
   1a4db:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a4e1:	41 29 fe             	sub    %edi,%r14d
   1a4e4:	85 d2                	test   %edx,%edx
   1a4e6:	4c 0f 49 f6          	cmovns %rsi,%r14
   1a4ea:	44 39 f1             	cmp    %r14d,%ecx
   1a4ed:	0f 96 c2             	setbe  %dl
   1a4f0:	48 83 c4 18          	add    $0x18,%rsp
   1a4f4:	5b                   	pop    %rbx
   1a4f5:	41 5e                	pop    %r14
   1a4f7:	c3                   	ret
   1a4f8:	cc                   	int3
   1a4f9:	cc                   	int3
   1a4fa:	cc                   	int3
   1a4fb:	cc                   	int3
   1a4fc:	cc                   	int3
   1a4fd:	cc                   	int3
   1a4fe:	cc                   	int3
   1a4ff:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   1a500:	b0 01                	mov    $0x1,%al
   1a502:	f6 07 01             	testb  $0x1,(%rdi)
   1a505:	0f 84 8e 00 00 00    	je     1a599 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1a50b:	f6 06 01             	testb  $0x1,(%rsi)
   1a50e:	0f 84 83 00 00 00    	je     1a597 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1a514:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a517:	8b 56 04             	mov    0x4(%rsi),%edx
   1a51a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a51f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a523:	41 89 d1             	mov    %edx,%r9d
   1a526:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a52d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a533:	45 29 ca             	sub    %r9d,%r10d
   1a536:	85 d2                	test   %edx,%edx
   1a538:	4d 0f 49 d0          	cmovns %r8,%r10
   1a53c:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a53f:	41 89 c8             	mov    %ecx,%r8d
   1a542:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a549:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a54f:	45 29 c1             	sub    %r8d,%r9d
   1a552:	85 c9                	test   %ecx,%ecx
   1a554:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a558:	45 39 ca             	cmp    %r9d,%r10d
   1a55b:	73 3a                	jae    1a597 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1a55d:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a560:	8b 56 08             	mov    0x8(%rsi),%edx
   1a563:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   1a566:	89 cf                	mov    %ecx,%edi
   1a568:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a56e:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a574:	41 29 f8             	sub    %edi,%r8d
   1a577:	85 c9                	test   %ecx,%ecx
   1a579:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a57d:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   1a580:	89 d6                	mov    %edx,%esi
   1a582:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a588:	29 f0                	sub    %esi,%eax
   1a58a:	85 d2                	test   %edx,%edx
   1a58c:	48 0f 49 c1          	cmovns %rcx,%rax
   1a590:	41 39 c0             	cmp    %eax,%r8d
   1a593:	0f 92 c0             	setb   %al
   1a596:	c3                   	ret
   1a597:	31 c0                	xor    %eax,%eax
   1a599:	c3                   	ret
   1a59a:	cc                   	int3
   1a59b:	cc                   	int3
   1a59c:	cc                   	int3
   1a59d:	cc                   	int3
   1a59e:	cc                   	int3
   1a59f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   1a5a0:	f6 06 01             	testb  $0x1,(%rsi)
   1a5a3:	0f 84 d3 00 00 00    	je     1a67c <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1a5a9:	f6 02 01             	testb  $0x1,(%rdx)
   1a5ac:	0f 84 ca 00 00 00    	je     1a67c <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1a5b2:	41 57                	push   %r15
   1a5b4:	41 56                	push   %r14
   1a5b6:	41 55                	push   %r13
   1a5b8:	41 54                	push   %r12
   1a5ba:	53                   	push   %rbx
   1a5bb:	48 83 ec 20          	sub    $0x20,%rsp
   1a5bf:	49 89 fc             	mov    %rdi,%r12
   1a5c2:	8b 5e 08             	mov    0x8(%rsi),%ebx
   1a5c5:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1a5cb:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a5cf:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   1a5d3:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1a5d6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a5db:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a5e0:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a5e5:	e8 f6 00 00 00       	call   1a6e0 <<hyperinterval::ieee::Format>::add>
   1a5ea:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a5ef:	74 6b                	je     1a65c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a5f1:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1a5f6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a5fb:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a600:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a605:	48 89 d9             	mov    %rbx,%rcx
   1a608:	4d 89 f0             	mov    %r14,%r8
   1a60b:	e8 d0 00 00 00       	call   1a6e0 <<hyperinterval::ieee::Format>::add>
   1a610:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a615:	74 45                	je     1a65c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a617:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1a61b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a620:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a625:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a62a:	4c 89 f9             	mov    %r15,%rcx
   1a62d:	e8 1e e8 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a632:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a637:	74 23                	je     1a65c <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a639:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a63e:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a643:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a648:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a64d:	48 89 d9             	mov    %rbx,%rcx
   1a650:	e8 fb e7 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a655:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a65a:	75 27                	jne    1a683 <<hyperinterval::float::F32Enclosure>::add+0xe3>
   1a65c:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a661:	41 88 44 24 04       	mov    %al,0x4(%r12)
   1a666:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   1a66d:	00 
   1a66e:	48 83 c4 20          	add    $0x20,%rsp
   1a672:	5b                   	pop    %rbx
   1a673:	41 5c                	pop    %r12
   1a675:	41 5d                	pop    %r13
   1a677:	41 5e                	pop    %r14
   1a679:	41 5f                	pop    %r15
   1a67b:	c3                   	ret
   1a67c:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
   1a682:	c3                   	ret
   1a683:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a687:	44 89 f1             	mov    %r14d,%ecx
   1a68a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a690:	89 c2                	mov    %eax,%edx
   1a692:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a698:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a69d:	29 ce                	sub    %ecx,%esi
   1a69f:	44 09 e9             	or     %r13d,%ecx
   1a6a2:	45 85 f6             	test   %r14d,%r14d
   1a6a5:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a6a9:	89 d1                	mov    %edx,%ecx
   1a6ab:	44 09 e9             	or     %r13d,%ecx
   1a6ae:	41 29 d5             	sub    %edx,%r13d
   1a6b1:	85 c0                	test   %eax,%eax
   1a6b3:	4c 0f 49 e9          	cmovns %rcx,%r13
   1a6b7:	44 39 ee             	cmp    %r13d,%esi
   1a6ba:	76 08                	jbe    1a6c4 <<hyperinterval::float::F32Enclosure>::add+0x124>
   1a6bc:	41 c6 44 24 04 01    	movb   $0x1,0x4(%r12)
   1a6c2:	eb a2                	jmp    1a666 <<hyperinterval::float::F32Enclosure>::add+0xc6>
   1a6c4:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
   1a6cb:	00 
   1a6cc:	45 89 74 24 04       	mov    %r14d,0x4(%r12)
   1a6d1:	41 89 44 24 08       	mov    %eax,0x8(%r12)
   1a6d6:	eb 96                	jmp    1a66e <<hyperinterval::float::F32Enclosure>::add+0xce>
   1a6d8:	cc                   	int3
   1a6d9:	cc                   	int3
   1a6da:	cc                   	int3
   1a6db:	cc                   	int3
   1a6dc:	cc                   	int3
   1a6dd:	cc                   	int3
   1a6de:	cc                   	int3
   1a6df:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1a6e0:	48 85 c9             	test   %rcx,%rcx
   1a6e3:	74 50                	je     1a735 <<hyperinterval::ieee::Format>::add+0x55>
   1a6e5:	48 89 c8             	mov    %rcx,%rax
   1a6e8:	4d 85 c0             	test   %r8,%r8
   1a6eb:	74 54                	je     1a741 <<hyperinterval::ieee::Format>::add+0x61>
   1a6ed:	55                   	push   %rbp
   1a6ee:	41 57                	push   %r15
   1a6f0:	41 56                	push   %r14
   1a6f2:	41 55                	push   %r13
   1a6f4:	41 54                	push   %r12
   1a6f6:	53                   	push   %rbx
   1a6f7:	48 83 ec 38          	sub    $0x38,%rsp
   1a6fb:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a700:	49 89 c7             	mov    %rax,%r15
   1a703:	49 21 d7             	and    %rdx,%r15
   1a706:	44 89 c9             	mov    %r9d,%ecx
   1a709:	49 d3 ef             	shr    %cl,%r15
   1a70c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   1a712:	49 d3 e5             	shl    %cl,%r13
   1a715:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   1a719:	49 89 de             	mov    %rbx,%r14
   1a71c:	49 21 c6             	and    %rax,%r14
   1a71f:	49 89 d2             	mov    %rdx,%r10
   1a722:	49 d3 ea             	shr    %cl,%r10
   1a725:	4d 85 ff             	test   %r15,%r15
   1a728:	74 23                	je     1a74d <<hyperinterval::ieee::Format>::add+0x6d>
   1a72a:	4d 09 ee             	or     %r13,%r14
   1a72d:	49 d1 ea             	shr    $1,%r10
   1a730:	45 01 ca             	add    %r9d,%r10d
   1a733:	eb 24                	jmp    1a759 <<hyperinterval::ieee::Format>::add+0x79>
   1a735:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   1a739:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   1a73d:	c6 07 00             	movb   $0x0,(%rdi)
   1a740:	c3                   	ret
   1a741:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1a745:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a749:	c6 07 00             	movb   $0x0,(%rdi)
   1a74c:	c3                   	ret
   1a74d:	49 d1 ea             	shr    $1,%r10
   1a750:	45 01 ca             	add    %r9d,%r10d
   1a753:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a759:	45 29 d7             	sub    %r10d,%r15d
   1a75c:	48 85 f0             	test   %rsi,%rax
   1a75f:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1a764:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a769:	49 0f bd ce          	bsr    %r14,%rcx
   1a76d:	83 f1 3f             	xor    $0x3f,%ecx
   1a770:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   1a774:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   1a778:	45 31 e4             	xor    %r12d,%r12d
   1a77b:	44 89 d9             	mov    %r11d,%ecx
   1a77e:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   1a782:	49 d3 e6             	shl    %cl,%r14
   1a785:	31 c9                	xor    %ecx,%ecx
   1a787:	41 f6 c3 40          	test   $0x40,%r11b
   1a78b:	4d 0f 45 e6          	cmovne %r14,%r12
   1a78f:	4c 0f 45 f1          	cmovne %rcx,%r14
   1a793:	4d 89 c2             	mov    %r8,%r10
   1a796:	49 21 d2             	and    %rdx,%r10
   1a799:	44 89 c9             	mov    %r9d,%ecx
   1a79c:	49 d3 ea             	shr    %cl,%r10
   1a79f:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   1a7a3:	45 29 df             	sub    %r11d,%r15d
   1a7a6:	4c 21 c3             	and    %r8,%rbx
   1a7a9:	49 89 d3             	mov    %rdx,%r11
   1a7ac:	49 d3 eb             	shr    %cl,%r11
   1a7af:	4d 85 d2             	test   %r10,%r10
   1a7b2:	74 0b                	je     1a7bf <<hyperinterval::ieee::Format>::add+0xdf>
   1a7b4:	4c 09 eb             	or     %r13,%rbx
   1a7b7:	49 d1 eb             	shr    $1,%r11
   1a7ba:	45 01 cb             	add    %r9d,%r11d
   1a7bd:	eb 0c                	jmp    1a7cb <<hyperinterval::ieee::Format>::add+0xeb>
   1a7bf:	49 d1 eb             	shr    $1,%r11
   1a7c2:	45 01 cb             	add    %r9d,%r11d
   1a7c5:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1a7cb:	45 29 da             	sub    %r11d,%r10d
   1a7ce:	49 85 f0             	test   %rsi,%r8
   1a7d1:	41 0f 95 c3          	setne  %r11b
   1a7d5:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a7da:	48 0f bd cb          	bsr    %rbx,%rcx
   1a7de:	83 f1 3f             	xor    $0x3f,%ecx
   1a7e1:	01 e9                	add    %ebp,%ecx
   1a7e3:	83 c1 40             	add    $0x40,%ecx
   1a7e6:	45 31 ed             	xor    %r13d,%r13d
   1a7e9:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1a7ed:	48 d3 e3             	shl    %cl,%rbx
   1a7f0:	45 31 c9             	xor    %r9d,%r9d
   1a7f3:	f6 c1 40             	test   $0x40,%cl
   1a7f6:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a7fa:	49 0f 45 d9          	cmovne %r9,%rbx
   1a7fe:	41 29 ca             	sub    %ecx,%r10d
   1a801:	45 39 d7             	cmp    %r10d,%r15d
   1a804:	7d 6d                	jge    1a873 <<hyperinterval::ieee::Format>::add+0x193>
   1a806:	44 89 f9             	mov    %r15d,%ecx
   1a809:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   1a80f:	4c 89 f5             	mov    %r14,%rbp
   1a812:	4d 89 e1             	mov    %r12,%r9
   1a815:	4d 89 c6             	mov    %r8,%r14
   1a818:	45 89 dc             	mov    %r11d,%r12d
   1a81b:	41 29 ca             	sub    %ecx,%r10d
   1a81e:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1a822:	7f 76                	jg     1a89a <<hyperinterval::ieee::Format>::add+0x1ba>
   1a824:	41 89 cb             	mov    %ecx,%r11d
   1a827:	49 85 f0             	test   %rsi,%r8
   1a82a:	41 0f 95 c0          	setne  %r8b
   1a82e:	48 85 f0             	test   %rsi,%rax
   1a831:	41 0f 95 c6          	setne  %r14b
   1a835:	44 89 d1             	mov    %r10d,%ecx
   1a838:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1a83c:	48 d3 e3             	shl    %cl,%rbx
   1a83f:	31 c0                	xor    %eax,%eax
   1a841:	41 f6 c2 40          	test   $0x40,%r10b
   1a845:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a849:	48 0f 44 c3          	cmove  %rbx,%rax
   1a84d:	45 30 c6             	xor    %r8b,%r14b
   1a850:	0f 84 95 00 00 00    	je     1a8eb <<hyperinterval::ieee::Format>::add+0x20b>
   1a856:	48 39 e8             	cmp    %rbp,%rax
   1a859:	4c 89 e9             	mov    %r13,%rcx
   1a85c:	4c 19 c9             	sbb    %r9,%rcx
   1a85f:	0f 83 b8 00 00 00    	jae    1a91d <<hyperinterval::ieee::Format>::add+0x23d>
   1a865:	48 29 c5             	sub    %rax,%rbp
   1a868:	4d 19 e9             	sbb    %r13,%r9
   1a86b:	45 89 fc             	mov    %r15d,%r12d
   1a86e:	e9 b6 00 00 00       	jmp    1a929 <<hyperinterval::ieee::Format>::add+0x249>
   1a873:	44 89 d1             	mov    %r10d,%ecx
   1a876:	48 89 dd             	mov    %rbx,%rbp
   1a879:	4d 89 e9             	mov    %r13,%r9
   1a87c:	4d 89 e5             	mov    %r12,%r13
   1a87f:	4c 89 f3             	mov    %r14,%rbx
   1a882:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   1a888:	45 89 fa             	mov    %r15d,%r10d
   1a88b:	45 89 df             	mov    %r11d,%r15d
   1a88e:	49 89 c6             	mov    %rax,%r14
   1a891:	41 29 ca             	sub    %ecx,%r10d
   1a894:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1a898:	7e 8a                	jle    1a824 <<hyperinterval::ieee::Format>::add+0x144>
   1a89a:	48 89 fb             	mov    %rdi,%rbx
   1a89d:	4c 89 f0             	mov    %r14,%rax
   1a8a0:	45 84 ff             	test   %r15b,%r15b
   1a8a3:	74 4e                	je     1a8f3 <<hyperinterval::ieee::Format>::add+0x213>
   1a8a5:	48 31 f0             	xor    %rsi,%rax
   1a8a8:	48 89 c1             	mov    %rax,%rcx
   1a8ab:	48 21 f1             	and    %rsi,%rcx
   1a8ae:	31 ff                	xor    %edi,%edi
   1a8b0:	48 f7 d9             	neg    %rcx
   1a8b3:	40 0f 93 c7          	setae  %dil
   1a8b7:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1a8bb:	48 ff c9             	dec    %rcx
   1a8be:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a8c3:	49 89 f7             	mov    %rsi,%r15
   1a8c6:	e8 85 e5 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a8cb:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a8d0:	75 44                	jne    1a916 <<hyperinterval::ieee::Format>::add+0x236>
   1a8d2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a8d7:	49 31 c7             	xor    %rax,%r15
   1a8da:	48 85 c0             	test   %rax,%rax
   1a8dd:	4c 0f 44 f8          	cmove  %rax,%r15
   1a8e1:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1a8e5:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1a8e9:	eb 6b                	jmp    1a956 <<hyperinterval::ieee::Format>::add+0x276>
   1a8eb:	48 01 c5             	add    %rax,%rbp
   1a8ee:	4d 11 e9             	adc    %r13,%r9
   1a8f1:	eb 36                	jmp    1a929 <<hyperinterval::ieee::Format>::add+0x249>
   1a8f3:	48 21 f0             	and    %rsi,%rax
   1a8f6:	31 c9                	xor    %ecx,%ecx
   1a8f8:	48 f7 d8             	neg    %rax
   1a8fb:	0f 93 c1             	setae  %cl
   1a8fe:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   1a902:	48 ff c9             	dec    %rcx
   1a905:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1a90a:	e8 41 e5 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1a90f:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1a914:	74 33                	je     1a949 <<hyperinterval::ieee::Format>::add+0x269>
   1a916:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1a91b:	eb 3c                	jmp    1a959 <<hyperinterval::ieee::Format>::add+0x279>
   1a91d:	48 29 e8             	sub    %rbp,%rax
   1a920:	4d 19 cd             	sbb    %r9,%r13
   1a923:	48 89 c5             	mov    %rax,%rbp
   1a926:	4d 89 e9             	mov    %r13,%r9
   1a929:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   1a92e:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
   1a933:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1a938:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
   1a93d:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1a942:	e8 89 e9 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   1a947:	eb 10                	jmp    1a959 <<hyperinterval::ieee::Format>::add+0x279>
   1a949:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1a94e:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1a952:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1a956:	c6 03 00             	movb   $0x0,(%rbx)
   1a959:	48 83 c4 38          	add    $0x38,%rsp
   1a95d:	5b                   	pop    %rbx
   1a95e:	41 5c                	pop    %r12
   1a960:	41 5d                	pop    %r13
   1a962:	41 5e                	pop    %r14
   1a964:	41 5f                	pop    %r15
   1a966:	5d                   	pop    %rbp
   1a967:	c3                   	ret
   1a968:	cc                   	int3
   1a969:	cc                   	int3
   1a96a:	cc                   	int3
   1a96b:	cc                   	int3
   1a96c:	cc                   	int3
   1a96d:	cc                   	int3
   1a96e:	cc                   	int3
   1a96f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   1a970:	83 3a 01             	cmpl   $0x1,(%rdx)
   1a973:	0f 85 17 e5 ff ff    	jne    18e90 <<hyperinterval::float::F32Enclosure>::corner_image>
   1a979:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1a97d:	0f 8f 0d e5 ff ff    	jg     18e90 <<hyperinterval::float::F32Enclosure>::corner_image>
   1a983:	8b 42 08             	mov    0x8(%rdx),%eax
   1a986:	85 c0                	test   %eax,%eax
   1a988:	0f 99 c1             	setns  %cl
   1a98b:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1a990:	0f 94 c0             	sete   %al
   1a993:	08 c8                	or     %cl,%al
   1a995:	0f 84 f5 e4 ff ff    	je     18e90 <<hyperinterval::float::F32Enclosure>::corner_image>
   1a99b:	c6 47 04 04          	movb   $0x4,0x4(%rdi)
   1a99f:	c7 07 02 00 00 00    	movl   $0x2,(%rdi)
   1a9a5:	c3                   	ret
   1a9a6:	cc                   	int3
   1a9a7:	cc                   	int3
   1a9a8:	cc                   	int3
   1a9a9:	cc                   	int3
   1a9aa:	cc                   	int3
   1a9ab:	cc                   	int3
   1a9ac:	cc                   	int3
   1a9ad:	cc                   	int3
   1a9ae:	cc                   	int3
   1a9af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   1a9b0:	f6 02 01             	testb  $0x1,(%rdx)
   1a9b3:	74 29                	je     1a9de <<hyperinterval::float::F32Enclosure>::sub+0x2e>
   1a9b5:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1a9ba:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1a9be:	66 0f 6f 15 ea 88 fe 	movdqa -0x17716(%rip),%xmm2        # 32b0 <__abi_tag+0x2fb4>
   1a9c5:	ff 
   1a9c6:	66 0f ef d0          	pxor   %xmm0,%xmm2
   1a9ca:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   1a9ce:	66 0f df ca          	pandn  %xmm2,%xmm1
   1a9d2:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1a9d7:	b8 01 00 00 00       	mov    $0x1,%eax
   1a9dc:	eb 02                	jmp    1a9e0 <<hyperinterval::float::F32Enclosure>::sub+0x30>
   1a9de:	31 c0                	xor    %eax,%eax
   1a9e0:	48 83 ec 18          	sub    $0x18,%rsp
   1a9e4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
   1a9e8:	66 0f d6 44 24 10    	movq   %xmm0,0x10(%rsp)
   1a9ee:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
   1a9f3:	e8 a8 fb ff ff       	call   1a5a0 <<hyperinterval::float::F32Enclosure>::add>
   1a9f8:	48 83 c4 18          	add    $0x18,%rsp
   1a9fc:	c3                   	ret
   1a9fd:	cc                   	int3
   1a9fe:	cc                   	int3
   1a9ff:	cc                   	int3

<hyperinterval::ieee::Format>::affine:
   1aa00:	55                   	push   %rbp
   1aa01:	41 57                	push   %r15
   1aa03:	41 56                	push   %r14
   1aa05:	41 55                	push   %r13
   1aa07:	41 54                	push   %r12
   1aa09:	53                   	push   %rbx
   1aa0a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1aa11:	49 89 ca             	mov    %rcx,%r10
   1aa14:	48 89 d3             	mov    %rdx,%rbx
   1aa17:	f3 48 0f bc ca       	tzcnt  %rdx,%rcx
   1aa1c:	4d 89 d4             	mov    %r10,%r12
   1aa1f:	49 21 d4             	and    %rdx,%r12
   1aa22:	49 d3 ec             	shr    %cl,%r12
   1aa25:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1aa2b:	49 d3 e7             	shl    %cl,%r15
   1aa2e:	4d 8d 77 ff          	lea    -0x1(%r15),%r14
   1aa32:	4c 89 f2             	mov    %r14,%rdx
   1aa35:	4c 21 d2             	and    %r10,%rdx
   1aa38:	48 89 d8             	mov    %rbx,%rax
   1aa3b:	48 d3 e8             	shr    %cl,%rax
   1aa3e:	4d 85 e4             	test   %r12,%r12
   1aa41:	74 0a                	je     1aa4d <<hyperinterval::ieee::Format>::affine+0x4d>
   1aa43:	4c 09 fa             	or     %r15,%rdx
   1aa46:	48 d1 e8             	shr    $1,%rax
   1aa49:	01 c8                	add    %ecx,%eax
   1aa4b:	eb 0b                	jmp    1aa58 <<hyperinterval::ieee::Format>::affine+0x58>
   1aa4d:	48 d1 e8             	shr    $1,%rax
   1aa50:	01 c8                	add    %ecx,%eax
   1aa52:	41 bc 01 00 00 00    	mov    $0x1,%r12d
   1aa58:	41 29 c4             	sub    %eax,%r12d
   1aa5b:	4d 89 c3             	mov    %r8,%r11
   1aa5e:	49 21 db             	and    %rbx,%r11
   1aa61:	49 d3 eb             	shr    %cl,%r11
   1aa64:	4c 89 f0             	mov    %r14,%rax
   1aa67:	4c 21 c0             	and    %r8,%rax
   1aa6a:	49 89 dd             	mov    %rbx,%r13
   1aa6d:	49 d3 ed             	shr    %cl,%r13
   1aa70:	4d 85 db             	test   %r11,%r11
   1aa73:	74 0b                	je     1aa80 <<hyperinterval::ieee::Format>::affine+0x80>
   1aa75:	4c 09 f8             	or     %r15,%rax
   1aa78:	49 d1 ed             	shr    $1,%r13
   1aa7b:	41 01 cd             	add    %ecx,%r13d
   1aa7e:	eb 0c                	jmp    1aa8c <<hyperinterval::ieee::Format>::affine+0x8c>
   1aa80:	49 d1 ed             	shr    $1,%r13
   1aa83:	41 01 cd             	add    %ecx,%r13d
   1aa86:	41 bb 01 00 00 00    	mov    $0x1,%r11d
   1aa8c:	45 29 eb             	sub    %r13d,%r11d
   1aa8f:	49 85 f2             	test   %rsi,%r10
   1aa92:	41 0f 95 c2          	setne  %r10b
   1aa96:	49 85 f0             	test   %rsi,%r8
   1aa99:	41 0f 95 c0          	setne  %r8b
   1aa9d:	48 f7 e2             	mul    %rdx
   1aaa0:	45 30 d0             	xor    %r10b,%r8b
   1aaa3:	45 01 e3             	add    %r12d,%r11d
   1aaa6:	44 88 44 24 64       	mov    %r8b,0x64(%rsp)
   1aaab:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   1aab0:	4d 89 ca             	mov    %r9,%r10
   1aab3:	49 21 da             	and    %rbx,%r10
   1aab6:	49 d3 ea             	shr    %cl,%r10
   1aab9:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1aabe:	44 89 5c 24 60       	mov    %r11d,0x60(%rsp)
   1aac3:	4d 21 ce             	and    %r9,%r14
   1aac6:	4d 85 d2             	test   %r10,%r10
   1aac9:	74 14                	je     1aadf <<hyperinterval::ieee::Format>::affine+0xdf>
   1aacb:	49 89 dc             	mov    %rbx,%r12
   1aace:	49 d3 ec             	shr    %cl,%r12
   1aad1:	4d 09 fe             	or     %r15,%r14
   1aad4:	49 d1 ec             	shr    $1,%r12
   1aad7:	41 01 cc             	add    %ecx,%r12d
   1aada:	45 29 e2             	sub    %r12d,%r10d
   1aadd:	eb 15                	jmp    1aaf4 <<hyperinterval::ieee::Format>::affine+0xf4>
   1aadf:	49 89 df             	mov    %rbx,%r15
   1aae2:	49 d3 ef             	shr    %cl,%r15
   1aae5:	49 d1 ef             	shr    $1,%r15
   1aae8:	41 01 cf             	add    %ecx,%r15d
   1aaeb:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1aaf1:	45 29 fa             	sub    %r15d,%r10d
   1aaf4:	49 85 f1             	test   %rsi,%r9
   1aaf7:	40 0f 95 c5          	setne  %bpl
   1aafb:	0f 95 84 24 84 00 00 	setne  0x84(%rsp)
   1ab02:	00 
   1ab03:	4c 89 74 24 70       	mov    %r14,0x70(%rsp)
   1ab08:	48 c7 44 24 78 00 00 	movq   $0x0,0x78(%rsp)
   1ab0f:	00 00 
   1ab11:	44 89 94 24 80 00 00 	mov    %r10d,0x80(%rsp)
   1ab18:	00 
   1ab19:	48 89 c1             	mov    %rax,%rcx
   1ab1c:	48 09 d1             	or     %rdx,%rcx
   1ab1f:	74 7b                	je     1ab9c <<hyperinterval::ieee::Format>::affine+0x19c>
   1ab21:	4d 85 f6             	test   %r14,%r14
   1ab24:	74 7d                	je     1aba3 <<hyperinterval::ieee::Format>::affine+0x1a3>
   1ab26:	40 88 6c 24 07       	mov    %bpl,0x7(%rsp)
   1ab2b:	48 0f bd ca          	bsr    %rdx,%rcx
   1ab2f:	83 f1 3f             	xor    $0x3f,%ecx
   1ab32:	4c 0f bd e0          	bsr    %rax,%r12
   1ab36:	41 83 f4 3f          	xor    $0x3f,%r12d
   1ab3a:	41 83 cc 40          	or     $0x40,%r12d
   1ab3e:	48 85 d2             	test   %rdx,%rdx
   1ab41:	44 0f 45 e1          	cmovne %ecx,%r12d
   1ab45:	41 83 f4 7f          	xor    $0x7f,%r12d
   1ab49:	45 01 dc             	add    %r11d,%r12d
   1ab4c:	4d 0f bd fe          	bsr    %r14,%r15
   1ab50:	41 83 f7 3f          	xor    $0x3f,%r15d
   1ab54:	41 83 cf 40          	or     $0x40,%r15d
   1ab58:	41 83 f7 7f          	xor    $0x7f,%r15d
   1ab5c:	45 01 d7             	add    %r10d,%r15d
   1ab5f:	45 39 e7             	cmp    %r12d,%r15d
   1ab62:	45 0f 4e fc          	cmovle %r12d,%r15d
   1ab66:	41 83 c7 82          	add    $0xffffff82,%r15d
   1ab6a:	45 29 fb             	sub    %r15d,%r11d
   1ab6d:	78 46                	js     1abb5 <<hyperinterval::ieee::Format>::affine+0x1b5>
   1ab6f:	44 89 d9             	mov    %r11d,%ecx
   1ab72:	48 0f a5 c2          	shld   %cl,%rax,%rdx
   1ab76:	48 d3 e0             	shl    %cl,%rax
   1ab79:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   1ab80:	00 00 
   1ab82:	41 f6 c3 40          	test   $0x40,%r11b
   1ab86:	48 0f 45 d0          	cmovne %rax,%rdx
   1ab8a:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1ab90:	4c 0f 44 e8          	cmove  %rax,%r13
   1ab94:	48 89 d5             	mov    %rdx,%rbp
   1ab97:	e9 98 00 00 00       	jmp    1ac34 <<hyperinterval::ieee::Format>::affine+0x234>
   1ab9c:	48 8d 4c 24 70       	lea    0x70(%rsp),%rcx
   1aba1:	eb 05                	jmp    1aba8 <<hyperinterval::ieee::Format>::affine+0x1a8>
   1aba3:	48 8d 4c 24 50       	lea    0x50(%rsp),%rcx
   1aba8:	48 89 da             	mov    %rbx,%rdx
   1abab:	e8 20 e7 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   1abb0:	e9 fa 01 00 00       	jmp    1adaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1abb5:	41 f7 db             	neg    %r11d
   1abb8:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   1abbe:	bd 00 00 00 00       	mov    $0x0,%ebp
   1abc3:	41 83 fb 7f          	cmp    $0x7f,%r11d
   1abc7:	7f 5d                	jg     1ac26 <<hyperinterval::ieee::Format>::affine+0x226>
   1abc9:	49 89 c5             	mov    %rax,%r13
   1abcc:	44 89 d9             	mov    %r11d,%ecx
   1abcf:	49 0f ad d5          	shrd   %cl,%rdx,%r13
   1abd3:	48 89 d5             	mov    %rdx,%rbp
   1abd6:	48 d3 ed             	shr    %cl,%rbp
   1abd9:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
   1abe0:	49 d3 e4             	shl    %cl,%r12
   1abe3:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
   1abea:	41 f6 c3 40          	test   $0x40,%r11b
   1abee:	4c 0f 45 ed          	cmovne %rbp,%r13
   1abf2:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1abf8:	49 0f 45 eb          	cmovne %r11,%rbp
   1abfc:	49 0f 45 cc          	cmovne %r12,%rcx
   1ac00:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1ac06:	4c 89 5c 24 08       	mov    %r11,0x8(%rsp)
   1ac0b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   1ac11:	4d 0f 45 e3          	cmovne %r11,%r12
   1ac15:	49 f7 d4             	not    %r12
   1ac18:	48 f7 d1             	not    %rcx
   1ac1b:	48 21 d1             	and    %rdx,%rcx
   1ac1e:	49 21 c4             	and    %rax,%r12
   1ac21:	49 09 cc             	or     %rcx,%r12
   1ac24:	74 0e                	je     1ac34 <<hyperinterval::ieee::Format>::affine+0x234>
   1ac26:	41 0f b6 c0          	movzbl %r8b,%eax
   1ac2a:	f7 d8                	neg    %eax
   1ac2c:	83 c8 01             	or     $0x1,%eax
   1ac2f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
   1ac34:	45 29 fa             	sub    %r15d,%r10d
   1ac37:	78 20                	js     1ac59 <<hyperinterval::ieee::Format>::affine+0x259>
   1ac39:	31 d2                	xor    %edx,%edx
   1ac3b:	44 89 d1             	mov    %r10d,%ecx
   1ac3e:	4c 0f a5 f2          	shld   %cl,%r14,%rdx
   1ac42:	49 d3 e6             	shl    %cl,%r14
   1ac45:	45 31 e4             	xor    %r12d,%r12d
   1ac48:	41 f6 c2 40          	test   $0x40,%r10b
   1ac4c:	49 0f 45 d6          	cmovne %r14,%rdx
   1ac50:	4d 0f 45 f4          	cmovne %r12,%r14
   1ac54:	4c 89 f0             	mov    %r14,%rax
   1ac57:	eb 59                	jmp    1acb2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1ac59:	41 f7 da             	neg    %r10d
   1ac5c:	45 31 e4             	xor    %r12d,%r12d
   1ac5f:	b8 00 00 00 00       	mov    $0x0,%eax
   1ac64:	41 83 fa 7f          	cmp    $0x7f,%r10d
   1ac68:	7f 2d                	jg     1ac97 <<hyperinterval::ieee::Format>::affine+0x297>
   1ac6a:	4c 89 f0             	mov    %r14,%rax
   1ac6d:	44 89 d1             	mov    %r10d,%ecx
   1ac70:	4c 0f ad e0          	shrd   %cl,%r12,%rax
   1ac74:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   1ac7b:	49 d3 e3             	shl    %cl,%r11
   1ac7e:	41 f6 c2 40          	test   $0x40,%r10b
   1ac82:	49 0f 45 c4          	cmovne %r12,%rax
   1ac86:	4d 0f 45 dc          	cmovne %r12,%r11
   1ac8a:	49 f7 d3             	not    %r11
   1ac8d:	ba 00 00 00 00       	mov    $0x0,%edx
   1ac92:	4d 85 f3             	test   %r14,%r11
   1ac95:	74 1b                	je     1acb2 <<hyperinterval::ieee::Format>::affine+0x2b2>
   1ac97:	4c 89 e2             	mov    %r12,%rdx
   1ac9a:	4c 89 c9             	mov    %r9,%rcx
   1ac9d:	48 21 f1             	and    %rsi,%rcx
   1aca0:	45 31 d2             	xor    %r10d,%r10d
   1aca3:	48 f7 d9             	neg    %rcx
   1aca6:	41 0f 93 c2          	setae  %r10b
   1acaa:	46 8d 24 55 ff ff ff 	lea    -0x1(,%r10,2),%r12d
   1acb1:	ff 
   1acb2:	49 85 f1             	test   %rsi,%r9
   1acb5:	0f 95 c1             	setne  %cl
   1acb8:	41 38 c8             	cmp    %cl,%r8b
   1acbb:	49 89 fe             	mov    %rdi,%r14
   1acbe:	74 19                	je     1acd9 <<hyperinterval::ieee::Format>::affine+0x2d9>
   1acc0:	49 39 c5             	cmp    %rax,%r13
   1acc3:	48 89 e9             	mov    %rbp,%rcx
   1acc6:	48 19 d1             	sbb    %rdx,%rcx
   1acc9:	73 16                	jae    1ace1 <<hyperinterval::ieee::Format>::affine+0x2e1>
   1accb:	4c 29 e8             	sub    %r13,%rax
   1acce:	48 19 ea             	sbb    %rbp,%rdx
   1acd1:	44 0f b6 44 24 07    	movzbl 0x7(%rsp),%r8d
   1acd7:	eb 14                	jmp    1aced <<hyperinterval::ieee::Format>::affine+0x2ed>
   1acd9:	4c 01 e8             	add    %r13,%rax
   1acdc:	48 11 ea             	adc    %rbp,%rdx
   1acdf:	eb 0c                	jmp    1aced <<hyperinterval::ieee::Format>::affine+0x2ed>
   1ace1:	49 29 c5             	sub    %rax,%r13
   1ace4:	48 19 d5             	sbb    %rdx,%rbp
   1ace7:	4c 89 e8             	mov    %r13,%rax
   1acea:	48 89 ea             	mov    %rbp,%rdx
   1aced:	44 88 44 24 24       	mov    %r8b,0x24(%rsp)
   1acf2:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1acf7:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1acfc:	44 89 7c 24 20       	mov    %r15d,0x20(%rsp)
   1ad01:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1ad06:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1ad0b:	49 89 f5             	mov    %rsi,%r13
   1ad0e:	48 89 da             	mov    %rbx,%rdx
   1ad11:	e8 ba e5 ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   1ad16:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   1ad1b:	75 12                	jne    1ad2f <<hyperinterval::ieee::Format>::affine+0x32f>
   1ad1d:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   1ad22:	41 88 46 01          	mov    %al,0x1(%r14)
   1ad26:	41 c6 06 01          	movb   $0x1,(%r14)
   1ad2a:	e9 80 00 00 00       	jmp    1adaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1ad2f:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   1ad34:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   1ad39:	49 39 c7             	cmp    %rax,%r15
   1ad3c:	4c 89 f1             	mov    %r14,%rcx
   1ad3f:	75 63                	jne    1ada4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1ad41:	44 03 64 24 08       	add    0x8(%rsp),%r12d
   1ad46:	41 83 fc 01          	cmp    $0x1,%r12d
   1ad4a:	74 75                	je     1adc1 <<hyperinterval::ieee::Format>::affine+0x3c1>
   1ad4c:	41 83 fc ff          	cmp    $0xffffffff,%r12d
   1ad50:	75 52                	jne    1ada4 <<hyperinterval::ieee::Format>::affine+0x3a4>
   1ad52:	4c 89 f8             	mov    %r15,%rax
   1ad55:	4c 89 ee             	mov    %r13,%rsi
   1ad58:	4c 31 e8             	xor    %r13,%rax
   1ad5b:	4d 85 ff             	test   %r15,%r15
   1ad5e:	49 0f 44 c7          	cmove  %r15,%rax
   1ad62:	48 89 c1             	mov    %rax,%rcx
   1ad65:	4c 21 e9             	and    %r13,%rcx
   1ad68:	31 d2                	xor    %edx,%edx
   1ad6a:	48 f7 d9             	neg    %rcx
   1ad6d:	0f 93 c2             	setae  %dl
   1ad70:	48 8d 0c 50          	lea    (%rax,%rdx,2),%rcx
   1ad74:	48 ff c9             	dec    %rcx
   1ad77:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1ad7c:	48 89 da             	mov    %rbx,%rdx
   1ad7f:	e8 cc e0 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1ad84:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1ad89:	75 62                	jne    1aded <<hyperinterval::ieee::Format>::affine+0x3ed>
   1ad8b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1ad90:	49 31 c5             	xor    %rax,%r13
   1ad93:	48 85 c0             	test   %rax,%rax
   1ad96:	4c 0f 44 e8          	cmove  %rax,%r13
   1ad9a:	4d 89 6e 08          	mov    %r13,0x8(%r14)
   1ad9e:	4d 89 7e 10          	mov    %r15,0x10(%r14)
   1ada2:	eb 5e                	jmp    1ae02 <<hyperinterval::ieee::Format>::affine+0x402>
   1ada4:	4c 89 79 08          	mov    %r15,0x8(%rcx)
   1ada8:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1adac:	c6 01 00             	movb   $0x0,(%rcx)
   1adaf:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1adb6:	5b                   	pop    %rbx
   1adb7:	41 5c                	pop    %r12
   1adb9:	41 5d                	pop    %r13
   1adbb:	41 5e                	pop    %r14
   1adbd:	41 5f                	pop    %r15
   1adbf:	5d                   	pop    %rbp
   1adc0:	c3                   	ret
   1adc1:	4c 89 ee             	mov    %r13,%rsi
   1adc4:	4c 89 f8             	mov    %r15,%rax
   1adc7:	4c 21 e8             	and    %r13,%rax
   1adca:	31 c9                	xor    %ecx,%ecx
   1adcc:	48 f7 d8             	neg    %rax
   1adcf:	0f 93 c1             	setae  %cl
   1add2:	49 8d 0c 4f          	lea    (%r15,%rcx,2),%rcx
   1add6:	48 ff c9             	dec    %rcx
   1add9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1adde:	48 89 da             	mov    %rbx,%rdx
   1ade1:	e8 6a e0 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1ade6:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1adeb:	74 08                	je     1adf5 <<hyperinterval::ieee::Format>::affine+0x3f5>
   1aded:	66 41 c7 06 01 03    	movw   $0x301,(%r14)
   1adf3:	eb ba                	jmp    1adaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1adf5:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1adfa:	4d 89 7e 08          	mov    %r15,0x8(%r14)
   1adfe:	49 89 46 10          	mov    %rax,0x10(%r14)
   1ae02:	41 c6 06 00          	movb   $0x0,(%r14)
   1ae06:	eb a7                	jmp    1adaf <<hyperinterval::ieee::Format>::affine+0x3af>
   1ae08:	cc                   	int3
   1ae09:	cc                   	int3
   1ae0a:	cc                   	int3
   1ae0b:	cc                   	int3
   1ae0c:	cc                   	int3
   1ae0d:	cc                   	int3
   1ae0e:	cc                   	int3
   1ae0f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1ae10:	83 3f 00             	cmpl   $0x0,(%rdi)
   1ae13:	b0 01                	mov    $0x1,%al
   1ae15:	0f 84 a3 00 00 00    	je     1aebe <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1ae1b:	8b 0e                	mov    (%rsi),%ecx
   1ae1d:	85 c9                	test   %ecx,%ecx
   1ae1f:	0f 84 99 00 00 00    	je     1aebe <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1ae25:	f6 c1 01             	test   $0x1,%cl
   1ae28:	74 4c                	je     1ae76 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1ae2a:	53                   	push   %rbx
   1ae2b:	8b 56 04             	mov    0x4(%rsi),%edx
   1ae2e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1ae32:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1ae38:	45 89 c2             	mov    %r8d,%r10d
   1ae3b:	45 09 ca             	or     %r9d,%r10d
   1ae3e:	45 89 c3             	mov    %r8d,%r11d
   1ae41:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1ae48:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1ae4d:	44 29 db             	sub    %r11d,%ebx
   1ae50:	45 85 c0             	test   %r8d,%r8d
   1ae53:	49 0f 49 da          	cmovns %r10,%rbx
   1ae57:	41 89 d0             	mov    %edx,%r8d
   1ae5a:	45 09 c8             	or     %r9d,%r8d
   1ae5d:	41 89 d2             	mov    %edx,%r10d
   1ae60:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1ae67:	45 29 d1             	sub    %r10d,%r9d
   1ae6a:	85 d2                	test   %edx,%edx
   1ae6c:	4d 0f 49 c8          	cmovns %r8,%r9
   1ae70:	44 39 cb             	cmp    %r9d,%ebx
   1ae73:	5b                   	pop    %rbx
   1ae74:	72 48                	jb     1aebe <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1ae76:	f6 c1 01             	test   $0x1,%cl
   1ae79:	75 03                	jne    1ae7e <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1ae7b:	31 c0                	xor    %eax,%eax
   1ae7d:	c3                   	ret
   1ae7e:	8b 47 04             	mov    0x4(%rdi),%eax
   1ae81:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1ae84:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1ae89:	89 ce                	mov    %ecx,%esi
   1ae8b:	09 d6                	or     %edx,%esi
   1ae8d:	89 cf                	mov    %ecx,%edi
   1ae8f:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1ae95:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1ae9b:	41 29 f8             	sub    %edi,%r8d
   1ae9e:	85 c9                	test   %ecx,%ecx
   1aea0:	4c 0f 49 c6          	cmovns %rsi,%r8
   1aea4:	89 c1                	mov    %eax,%ecx
   1aea6:	09 d1                	or     %edx,%ecx
   1aea8:	89 c6                	mov    %eax,%esi
   1aeaa:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1aeb0:	29 f2                	sub    %esi,%edx
   1aeb2:	85 c0                	test   %eax,%eax
   1aeb4:	48 0f 49 d1          	cmovns %rcx,%rdx
   1aeb8:	41 39 d0             	cmp    %edx,%r8d
   1aebb:	0f 92 c0             	setb   %al
   1aebe:	c3                   	ret
   1aebf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1aec0:	31 c0                	xor    %eax,%eax
   1aec2:	83 3f 00             	cmpl   $0x0,(%rdi)
   1aec5:	0f 84 a1 00 00 00    	je     1af6c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1aecb:	8b 0e                	mov    (%rsi),%ecx
   1aecd:	85 c9                	test   %ecx,%ecx
   1aecf:	0f 84 97 00 00 00    	je     1af6c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1aed5:	f6 c1 01             	test   $0x1,%cl
   1aed8:	74 4b                	je     1af25 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1aeda:	8b 46 04             	mov    0x4(%rsi),%eax
   1aedd:	8b 57 08             	mov    0x8(%rdi),%edx
   1aee0:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1aee6:	41 89 d1             	mov    %edx,%r9d
   1aee9:	45 09 c1             	or     %r8d,%r9d
   1aeec:	41 89 d2             	mov    %edx,%r10d
   1aeef:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1aef6:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1aefc:	45 29 d3             	sub    %r10d,%r11d
   1aeff:	85 d2                	test   %edx,%edx
   1af01:	4d 0f 49 d9          	cmovns %r9,%r11
   1af05:	89 c2                	mov    %eax,%edx
   1af07:	44 09 c2             	or     %r8d,%edx
   1af0a:	41 89 c1             	mov    %eax,%r9d
   1af0d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1af14:	45 29 c8             	sub    %r9d,%r8d
   1af17:	85 c0                	test   %eax,%eax
   1af19:	4c 0f 49 c2          	cmovns %rdx,%r8
   1af1d:	45 39 c3             	cmp    %r8d,%r11d
   1af20:	73 03                	jae    1af25 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1af22:	31 c0                	xor    %eax,%eax
   1af24:	c3                   	ret
   1af25:	b0 01                	mov    $0x1,%al
   1af27:	f6 c1 01             	test   $0x1,%cl
   1af2a:	74 40                	je     1af6c <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1af2c:	8b 47 04             	mov    0x4(%rdi),%eax
   1af2f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1af32:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1af37:	89 ce                	mov    %ecx,%esi
   1af39:	09 d6                	or     %edx,%esi
   1af3b:	89 cf                	mov    %ecx,%edi
   1af3d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1af43:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1af49:	41 29 f8             	sub    %edi,%r8d
   1af4c:	85 c9                	test   %ecx,%ecx
   1af4e:	4c 0f 49 c6          	cmovns %rsi,%r8
   1af52:	89 c1                	mov    %eax,%ecx
   1af54:	09 d1                	or     %edx,%ecx
   1af56:	89 c6                	mov    %eax,%esi
   1af58:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1af5e:	29 f2                	sub    %esi,%edx
   1af60:	85 c0                	test   %eax,%eax
   1af62:	48 0f 49 d1          	cmovns %rcx,%rdx
   1af66:	41 39 d0             	cmp    %edx,%r8d
   1af69:	0f 93 c0             	setae  %al
   1af6c:	c3                   	ret
   1af6d:	cc                   	int3
   1af6e:	cc                   	int3
   1af6f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1af70:	b0 01                	mov    $0x1,%al
   1af72:	f6 07 01             	testb  $0x1,(%rdi)
   1af75:	74 50                	je     1afc7 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1af77:	f6 06 01             	testb  $0x1,(%rsi)
   1af7a:	74 49                	je     1afc5 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1af7c:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1af7f:	8b 56 04             	mov    0x4(%rsi),%edx
   1af82:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1af87:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1af8b:	41 89 d1             	mov    %edx,%r9d
   1af8e:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1af95:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1af9b:	45 29 ca             	sub    %r9d,%r10d
   1af9e:	85 d2                	test   %edx,%edx
   1afa0:	4d 0f 49 d0          	cmovns %r8,%r10
   1afa4:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1afa7:	41 89 c8             	mov    %ecx,%r8d
   1afaa:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1afb1:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1afb7:	45 29 c1             	sub    %r8d,%r9d
   1afba:	85 c9                	test   %ecx,%ecx
   1afbc:	4c 0f 49 ca          	cmovns %rdx,%r9
   1afc0:	45 39 ca             	cmp    %r9d,%r10d
   1afc3:	76 03                	jbe    1afc8 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1afc5:	31 c0                	xor    %eax,%eax
   1afc7:	c3                   	ret
   1afc8:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1afcb:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1afce:	89 cf                	mov    %ecx,%edi
   1afd0:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1afd6:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1afdc:	41 29 f8             	sub    %edi,%r8d
   1afdf:	85 c9                	test   %ecx,%ecx
   1afe1:	4c 0f 49 c2          	cmovns %rdx,%r8
   1afe5:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1afe8:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1afeb:	89 ce                	mov    %ecx,%esi
   1afed:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1aff3:	29 f0                	sub    %esi,%eax
   1aff5:	85 c9                	test   %ecx,%ecx
   1aff7:	48 0f 49 c2          	cmovns %rdx,%rax
   1affb:	41 39 c0             	cmp    %eax,%r8d
   1affe:	0f 96 c0             	setbe  %al
   1b001:	c3                   	ret
   1b002:	cc                   	int3
   1b003:	cc                   	int3
   1b004:	cc                   	int3
   1b005:	cc                   	int3
   1b006:	cc                   	int3
   1b007:	cc                   	int3
   1b008:	cc                   	int3
   1b009:	cc                   	int3
   1b00a:	cc                   	int3
   1b00b:	cc                   	int3
   1b00c:	cc                   	int3
   1b00d:	cc                   	int3
   1b00e:	cc                   	int3
   1b00f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1b010:	55                   	push   %rbp
   1b011:	41 57                	push   %r15
   1b013:	41 56                	push   %r14
   1b015:	41 55                	push   %r13
   1b017:	41 54                	push   %r12
   1b019:	53                   	push   %rbx
   1b01a:	48 83 ec 58          	sub    $0x58,%rsp
   1b01e:	48 89 fb             	mov    %rdi,%rbx
   1b021:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b025:	0f 85 ac 00 00 00    	jne    1b0d7 <<hyperinterval::float::F64Enclosure>::corner_image+0xc7>
   1b02b:	f6 02 01             	testb  $0x1,(%rdx)
   1b02e:	0f 84 a3 00 00 00    	je     1b0d7 <<hyperinterval::float::F64Enclosure>::corner_image+0xc7>
   1b034:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1b03b:	00 00 80 
   1b03e:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b045:	00 f0 7f 
   1b048:	4c 8b 66 08          	mov    0x8(%rsi),%r12
   1b04c:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1b050:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   1b055:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1b059:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b05d:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1b062:	48 89 e7             	mov    %rsp,%rdi
   1b065:	48 89 ce             	mov    %rcx,%rsi
   1b068:	4c 89 f2             	mov    %r14,%rdx
   1b06b:	4c 89 e1             	mov    %r12,%rcx
   1b06e:	49 89 e8             	mov    %rbp,%r8
   1b071:	e8 4a e5 ff ff       	call   195c0 <<hyperinterval::ieee::Format>::div>
   1b076:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b07a:	75 48                	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b07c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b081:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1b086:	48 89 e7             	mov    %rsp,%rdi
   1b089:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b090:	00 00 80 
   1b093:	4c 89 f2             	mov    %r14,%rdx
   1b096:	e8 b5 dd ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b09b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b09f:	75 23                	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b0a1:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b0a6:	48 89 e7             	mov    %rsp,%rdi
   1b0a9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b0b0:	00 00 80 
   1b0b3:	4c 89 f2             	mov    %r14,%rdx
   1b0b6:	4c 89 e9             	mov    %r13,%rcx
   1b0b9:	e8 92 dd ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b0be:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b0c2:	74 29                	je     1b0ed <<hyperinterval::float::F64Enclosure>::corner_image+0xdd>
   1b0c4:	44 0f b6 6c 24 01    	movzbl 0x1(%rsp),%r13d
   1b0ca:	44 88 6b 08          	mov    %r13b,0x8(%rbx)
   1b0ce:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b0d5:	eb 07                	jmp    1b0de <<hyperinterval::float::F64Enclosure>::corner_image+0xce>
   1b0d7:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b0de:	48 83 c4 58          	add    $0x58,%rsp
   1b0e2:	5b                   	pop    %rbx
   1b0e3:	41 5c                	pop    %r12
   1b0e5:	41 5d                	pop    %r13
   1b0e7:	41 5e                	pop    %r14
   1b0e9:	41 5f                	pop    %r15
   1b0eb:	5d                   	pop    %rbp
   1b0ec:	c3                   	ret
   1b0ed:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b0f4:	00 00 80 
   1b0f7:	49 8d 3c 37          	lea    (%r15,%rsi,1),%rdi
   1b0fb:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
   1b0ff:	4c 89 f8             	mov    %r15,%rax
   1b102:	48 21 d0             	and    %rdx,%rax
   1b105:	49 89 f2             	mov    %rsi,%r10
   1b108:	49 29 c2             	sub    %rax,%r10
   1b10b:	4d 85 ff             	test   %r15,%r15
   1b10e:	48 89 f8             	mov    %rdi,%rax
   1b111:	49 0f 48 c2          	cmovs  %r10,%rax
   1b115:	4c 8b 44 24 08       	mov    0x8(%rsp),%r8
   1b11a:	4d 8d 0c 30          	lea    (%r8,%rsi,1),%r9
   1b11e:	4c 89 c1             	mov    %r8,%rcx
   1b121:	48 21 d1             	and    %rdx,%rcx
   1b124:	48 29 ce             	sub    %rcx,%rsi
   1b127:	4d 85 c0             	test   %r8,%r8
   1b12a:	4c 89 c9             	mov    %r9,%rcx
   1b12d:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1b131:	41 b5 01             	mov    $0x1,%r13b
   1b134:	48 39 c8             	cmp    %rcx,%rax
   1b137:	77 91                	ja     1b0ca <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b139:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1b13e:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
   1b143:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
   1b148:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
   1b14d:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
   1b152:	48 89 e7             	mov    %rsp,%rdi
   1b155:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b15c:	00 00 80 
   1b15f:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b166:	00 f0 7f 
   1b169:	4c 89 f2             	mov    %r14,%rdx
   1b16c:	4c 89 e1             	mov    %r12,%rcx
   1b16f:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b174:	e8 47 e4 ff ff       	call   195c0 <<hyperinterval::ieee::Format>::div>
   1b179:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b17d:	0f 85 41 ff ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b183:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b188:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b18d:	48 89 e7             	mov    %rsp,%rdi
   1b190:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b197:	00 00 80 
   1b19a:	4c 89 f2             	mov    %r14,%rdx
   1b19d:	e8 ae dc ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b1a2:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b1a6:	0f 84 18 ff ff ff    	je     1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b1ac:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b1b1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1b1b6:	48 89 e7             	mov    %rsp,%rdi
   1b1b9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b1c0:	00 00 80 
   1b1c3:	4c 89 f2             	mov    %r14,%rdx
   1b1c6:	4c 89 e1             	mov    %r12,%rcx
   1b1c9:	e8 82 dc ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b1ce:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b1d2:	0f 84 ec fe ff ff    	je     1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b1d8:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b1dd:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b1e4:	00 00 80 
   1b1e7:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
   1b1ec:	4b 8d 0c 01          	lea    (%r9,%r8,1),%rcx
   1b1f0:	4c 89 ca             	mov    %r9,%rdx
   1b1f3:	49 8d 78 ff          	lea    -0x1(%r8),%rdi
   1b1f7:	48 21 fa             	and    %rdi,%rdx
   1b1fa:	4c 89 c0             	mov    %r8,%rax
   1b1fd:	48 29 d0             	sub    %rdx,%rax
   1b200:	4d 85 c9             	test   %r9,%r9
   1b203:	48 0f 49 c1          	cmovns %rcx,%rax
   1b207:	4b 8d 14 04          	lea    (%r12,%r8,1),%rdx
   1b20b:	4c 89 e6             	mov    %r12,%rsi
   1b20e:	48 21 fe             	and    %rdi,%rsi
   1b211:	4c 89 c1             	mov    %r8,%rcx
   1b214:	48 29 f1             	sub    %rsi,%rcx
   1b217:	4d 85 e4             	test   %r12,%r12
   1b21a:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b21e:	48 39 c8             	cmp    %rcx,%rax
   1b221:	0f 87 a3 fe ff ff    	ja     1b0ca <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b227:	4c 89 ca             	mov    %r9,%rdx
   1b22a:	4d 85 ff             	test   %r15,%r15
   1b22d:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1b232:	48 0f 48 74 24 40    	cmovs  0x40(%rsp),%rsi
   1b238:	48 39 c6             	cmp    %rax,%rsi
   1b23b:	49 0f 46 d7          	cmovbe %r15,%rdx
   1b23f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
   1b244:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1b249:	48 85 c0             	test   %rax,%rax
   1b24c:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1b251:	48 0f 48 54 24 38    	cmovs  0x38(%rsp),%rdx
   1b257:	48 39 ca             	cmp    %rcx,%rdx
   1b25a:	4c 0f 43 e0          	cmovae %rax,%r12
   1b25e:	48 89 e7             	mov    %rsp,%rdi
   1b261:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b268:	00 00 80 
   1b26b:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b272:	00 f0 7f 
   1b275:	4c 89 f2             	mov    %r14,%rdx
   1b278:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1b27d:	49 89 e8             	mov    %rbp,%r8
   1b280:	e8 3b e3 ff ff       	call   195c0 <<hyperinterval::ieee::Format>::div>
   1b285:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b289:	0f 85 35 fe ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b28f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b294:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1b299:	48 89 e7             	mov    %rsp,%rdi
   1b29c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b2a3:	00 00 80 
   1b2a6:	4c 89 f2             	mov    %r14,%rdx
   1b2a9:	e8 a2 db ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b2ae:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b2b2:	0f 85 0c fe ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b2b8:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b2bd:	48 89 e7             	mov    %rsp,%rdi
   1b2c0:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b2c7:	00 00 80 
   1b2ca:	4c 89 f2             	mov    %r14,%rdx
   1b2cd:	48 89 e9             	mov    %rbp,%rcx
   1b2d0:	e8 7b db ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b2d5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b2d9:	0f 85 e5 fd ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b2df:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b2e4:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1b2eb:	00 00 80 
   1b2ee:	49 8d 04 3f          	lea    (%r15,%rdi,1),%rax
   1b2f2:	4c 89 fa             	mov    %r15,%rdx
   1b2f5:	4c 8d 47 ff          	lea    -0x1(%rdi),%r8
   1b2f9:	4c 21 c2             	and    %r8,%rdx
   1b2fc:	48 89 f9             	mov    %rdi,%rcx
   1b2ff:	48 29 d1             	sub    %rdx,%rcx
   1b302:	4d 85 ff             	test   %r15,%r15
   1b305:	48 0f 49 c8          	cmovns %rax,%rcx
   1b309:	48 8d 14 2f          	lea    (%rdi,%rbp,1),%rdx
   1b30d:	48 89 ee             	mov    %rbp,%rsi
   1b310:	4c 21 c6             	and    %r8,%rsi
   1b313:	48 89 f8             	mov    %rdi,%rax
   1b316:	48 29 f0             	sub    %rsi,%rax
   1b319:	48 85 ed             	test   %rbp,%rbp
   1b31c:	48 0f 49 c2          	cmovns %rdx,%rax
   1b320:	48 39 c1             	cmp    %rax,%rcx
   1b323:	0f 87 a1 fd ff ff    	ja     1b0ca <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b329:	4d 89 f9             	mov    %r15,%r9
   1b32c:	4c 8b 54 24 18       	mov    0x18(%rsp),%r10
   1b331:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b338:	00 00 80 
   1b33b:	49 8d 14 32          	lea    (%r10,%rsi,1),%rdx
   1b33f:	4d 89 d3             	mov    %r10,%r11
   1b342:	4d 21 c3             	and    %r8,%r11
   1b345:	48 89 f7             	mov    %rsi,%rdi
   1b348:	4c 29 df             	sub    %r11,%rdi
   1b34b:	4d 85 d2             	test   %r10,%r10
   1b34e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b352:	48 39 cf             	cmp    %rcx,%rdi
   1b355:	4d 0f 46 ca          	cmovbe %r10,%r9
   1b359:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
   1b35e:	49 8d 0c 34          	lea    (%r12,%rsi,1),%rcx
   1b362:	4c 89 e2             	mov    %r12,%rdx
   1b365:	4c 21 c2             	and    %r8,%rdx
   1b368:	48 89 f7             	mov    %rsi,%rdi
   1b36b:	48 29 d7             	sub    %rdx,%rdi
   1b36e:	4d 85 e4             	test   %r12,%r12
   1b371:	48 0f 49 f9          	cmovns %rcx,%rdi
   1b375:	48 39 c7             	cmp    %rax,%rdi
   1b378:	49 0f 43 ec          	cmovae %r12,%rbp
   1b37c:	48 89 e7             	mov    %rsp,%rdi
   1b37f:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1b386:	00 f0 7f 
   1b389:	4c 89 f2             	mov    %r14,%rdx
   1b38c:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
   1b391:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
   1b396:	e8 25 e2 ff ff       	call   195c0 <<hyperinterval::ieee::Format>::div>
   1b39b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b39f:	0f 85 1f fd ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b3a5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b3aa:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1b3af:	48 89 e7             	mov    %rsp,%rdi
   1b3b2:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b3b9:	00 00 80 
   1b3bc:	4c 89 f2             	mov    %r14,%rdx
   1b3bf:	e8 8c da ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b3c4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b3c8:	0f 85 f6 fc ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b3ce:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1b3d3:	48 89 e7             	mov    %rsp,%rdi
   1b3d6:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   1b3dd:	00 00 80 
   1b3e0:	4c 89 f2             	mov    %r14,%rdx
   1b3e3:	4c 89 f9             	mov    %r15,%rcx
   1b3e6:	e8 65 da ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b3eb:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b3ef:	0f 85 cf fc ff ff    	jne    1b0c4 <<hyperinterval::float::F64Enclosure>::corner_image+0xb4>
   1b3f5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b3fa:	49 b9 00 00 00 00 00 	movabs $0x8000000000000000,%r9
   1b401:	00 00 80 
   1b404:	4b 8d 0c 0c          	lea    (%r12,%r9,1),%rcx
   1b408:	4c 89 e6             	mov    %r12,%rsi
   1b40b:	4d 8d 41 ff          	lea    -0x1(%r9),%r8
   1b40f:	4c 21 c6             	and    %r8,%rsi
   1b412:	4c 89 ca             	mov    %r9,%rdx
   1b415:	48 29 f2             	sub    %rsi,%rdx
   1b418:	4d 85 e4             	test   %r12,%r12
   1b41b:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b41f:	4a 8d 34 08          	lea    (%rax,%r9,1),%rsi
   1b423:	48 89 c7             	mov    %rax,%rdi
   1b426:	4c 21 c7             	and    %r8,%rdi
   1b429:	4c 89 c9             	mov    %r9,%rcx
   1b42c:	48 29 f9             	sub    %rdi,%rcx
   1b42f:	48 85 c0             	test   %rax,%rax
   1b432:	48 0f 49 ce          	cmovns %rsi,%rcx
   1b436:	48 39 ca             	cmp    %rcx,%rdx
   1b439:	0f 87 8b fc ff ff    	ja     1b0ca <<hyperinterval::float::F64Enclosure>::corner_image+0xba>
   1b43f:	4c 8b 54 24 20       	mov    0x20(%rsp),%r10
   1b444:	49 bb 00 00 00 00 00 	movabs $0x8000000000000000,%r11
   1b44b:	00 00 80 
   1b44e:	4b 8d 34 1a          	lea    (%r10,%r11,1),%rsi
   1b452:	4c 89 d7             	mov    %r10,%rdi
   1b455:	4d 8d 4b ff          	lea    -0x1(%r11),%r9
   1b459:	4c 21 cf             	and    %r9,%rdi
   1b45c:	4d 89 d8             	mov    %r11,%r8
   1b45f:	49 29 f8             	sub    %rdi,%r8
   1b462:	4d 85 d2             	test   %r10,%r10
   1b465:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b469:	49 39 d0             	cmp    %rdx,%r8
   1b46c:	4d 0f 46 e2          	cmovbe %r10,%r12
   1b470:	49 8d 14 2b          	lea    (%r11,%rbp,1),%rdx
   1b474:	49 21 e9             	and    %rbp,%r9
   1b477:	4d 29 cb             	sub    %r9,%r11
   1b47a:	48 85 ed             	test   %rbp,%rbp
   1b47d:	4c 0f 49 da          	cmovns %rdx,%r11
   1b481:	49 39 cb             	cmp    %rcx,%r11
   1b484:	48 0f 43 c5          	cmovae %rbp,%rax
   1b488:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b48f:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1b493:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b497:	e9 42 fc ff ff       	jmp    1b0de <<hyperinterval::float::F64Enclosure>::corner_image+0xce>
   1b49c:	cc                   	int3
   1b49d:	cc                   	int3
   1b49e:	cc                   	int3
   1b49f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1b4a0:	55                   	push   %rbp
   1b4a1:	41 57                	push   %r15
   1b4a3:	41 56                	push   %r14
   1b4a5:	41 55                	push   %r13
   1b4a7:	41 54                	push   %r12
   1b4a9:	53                   	push   %rbx
   1b4aa:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1b4b1:	48 89 fb             	mov    %rdi,%rbx
   1b4b4:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b4b8:	0f 85 0a 01 00 00    	jne    1b5c8 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1b4be:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1b4c2:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b4c9:	00 00 80 
   1b4cc:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1b4d3:	00 f0 7f 
   1b4d6:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1b4dd:	ff 0f 00 
   1b4e0:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b4e4:	4c 89 e9             	mov    %r13,%rcx
   1b4e7:	48 c1 e9 34          	shr    $0x34,%rcx
   1b4eb:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b4f1:	4c 89 ea             	mov    %r13,%rdx
   1b4f4:	4c 21 fa             	and    %r15,%rdx
   1b4f7:	48 85 c9             	test   %rcx,%rcx
   1b4fa:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1b4ff:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b506:	48 0f 44 c2          	cmove  %rdx,%rax
   1b50a:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1b50f:	0f 44 cd             	cmove  %ebp,%ecx
   1b512:	48 f7 e0             	mul    %rax
   1b515:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b51a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b51f:	48 89 04 24          	mov    %rax,(%rsp)
   1b523:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b527:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b52c:	48 89 e1             	mov    %rsp,%rcx
   1b52f:	4c 89 f6             	mov    %r14,%rsi
   1b532:	4c 89 c2             	mov    %r8,%rdx
   1b535:	e8 96 dd ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   1b53a:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b53f:	75 76                	jne    1b5b7 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1b541:	4c 89 e2             	mov    %r12,%rdx
   1b544:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1b549:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1b54e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1b553:	48 89 d1             	mov    %rdx,%rcx
   1b556:	48 c1 e9 34          	shr    $0x34,%rcx
   1b55a:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b560:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1b565:	4c 21 fa             	and    %r15,%rdx
   1b568:	48 85 c9             	test   %rcx,%rcx
   1b56b:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1b570:	48 0f 44 c2          	cmove  %rdx,%rax
   1b574:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b57b:	0f 44 cd             	cmove  %ebp,%ecx
   1b57e:	48 f7 e0             	mul    %rax
   1b581:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b586:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b58b:	48 89 04 24          	mov    %rax,(%rsp)
   1b58f:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b593:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b598:	48 89 e1             	mov    %rsp,%rcx
   1b59b:	4c 89 f6             	mov    %r14,%rsi
   1b59e:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1b5a5:	00 f0 7f 
   1b5a8:	48 89 ea             	mov    %rbp,%rdx
   1b5ab:	e8 20 dd ff ff       	call   192d0 <<hyperinterval::ieee::Format>::rounded>
   1b5b0:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1b5b5:	75 2a                	jne    1b5e1 <<hyperinterval::float::F64Enclosure>::square+0x141>
   1b5b7:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1b5bc:	88 43 08             	mov    %al,0x8(%rbx)
   1b5bf:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b5c6:	eb 07                	jmp    1b5cf <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1b5c8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b5cf:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1b5d6:	5b                   	pop    %rbx
   1b5d7:	41 5c                	pop    %r12
   1b5d9:	41 5d                	pop    %r13
   1b5db:	41 5e                	pop    %r14
   1b5dd:	41 5f                	pop    %r15
   1b5df:	5d                   	pop    %rbp
   1b5e0:	c3                   	ret
   1b5e1:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1b5e6:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1b5eb:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1b5f0:	48 89 e7             	mov    %rsp,%rdi
   1b5f3:	4c 89 f6             	mov    %r14,%rsi
   1b5f6:	48 89 ea             	mov    %rbp,%rdx
   1b5f9:	4c 89 e1             	mov    %r12,%rcx
   1b5fc:	e8 4f d8 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b601:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b605:	74 23                	je     1b62a <<hyperinterval::float::F64Enclosure>::square+0x18a>
   1b607:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1b60c:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b611:	48 89 e7             	mov    %rsp,%rdi
   1b614:	4c 89 f6             	mov    %r14,%rsi
   1b617:	48 89 ea             	mov    %rbp,%rdx
   1b61a:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b61f:	e8 2c d8 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b624:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b628:	75 07                	jne    1b631 <<hyperinterval::float::F64Enclosure>::square+0x191>
   1b62a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b62f:	eb 8b                	jmp    1b5bc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1b631:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1b636:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1b63a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1b63e:	4c 89 f9             	mov    %r15,%rcx
   1b641:	48 21 d1             	and    %rdx,%rcx
   1b644:	4c 89 f7             	mov    %r14,%rdi
   1b647:	48 29 cf             	sub    %rcx,%rdi
   1b64a:	4d 85 ff             	test   %r15,%r15
   1b64d:	48 0f 49 f8          	cmovns %rax,%rdi
   1b651:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1b655:	48 89 f1             	mov    %rsi,%rcx
   1b658:	48 21 d1             	and    %rdx,%rcx
   1b65b:	4d 89 f4             	mov    %r14,%r12
   1b65e:	49 29 cc             	sub    %rcx,%r12
   1b661:	48 85 f6             	test   %rsi,%rsi
   1b664:	4c 0f 49 e0          	cmovns %rax,%r12
   1b668:	b0 01                	mov    $0x1,%al
   1b66a:	4c 39 e7             	cmp    %r12,%rdi
   1b66d:	0f 87 49 ff ff ff    	ja     1b5bc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1b673:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1b678:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1b67d:	48 89 e7             	mov    %rsp,%rdi
   1b680:	4c 89 f6             	mov    %r14,%rsi
   1b683:	48 89 ea             	mov    %rbp,%rdx
   1b686:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b68b:	e8 c0 d7 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b690:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b694:	74 23                	je     1b6b9 <<hyperinterval::float::F64Enclosure>::square+0x219>
   1b696:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1b69b:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b6a0:	48 89 e7             	mov    %rsp,%rdi
   1b6a3:	4c 89 f6             	mov    %r14,%rsi
   1b6a6:	48 89 ea             	mov    %rbp,%rdx
   1b6a9:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1b6ae:	e8 9d d7 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b6b3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6b7:	75 14                	jne    1b6cd <<hyperinterval::float::F64Enclosure>::square+0x22d>
   1b6b9:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1b6be:	88 53 08             	mov    %dl,0x8(%rbx)
   1b6c1:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b6c8:	e9 02 ff ff ff       	jmp    1b5cf <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1b6cd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b6d2:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1b6d6:	4c 89 fe             	mov    %r15,%rsi
   1b6d9:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1b6dd:	48 21 fe             	and    %rdi,%rsi
   1b6e0:	4c 89 f1             	mov    %r14,%rcx
   1b6e3:	48 29 f1             	sub    %rsi,%rcx
   1b6e6:	4d 85 ff             	test   %r15,%r15
   1b6e9:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b6ed:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b6f1:	48 89 c6             	mov    %rax,%rsi
   1b6f4:	48 21 fe             	and    %rdi,%rsi
   1b6f7:	49 29 f6             	sub    %rsi,%r14
   1b6fa:	48 85 c0             	test   %rax,%rax
   1b6fd:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b701:	b2 01                	mov    $0x1,%dl
   1b703:	4c 39 f1             	cmp    %r14,%rcx
   1b706:	77 b6                	ja     1b6be <<hyperinterval::float::F64Enclosure>::square+0x21e>
   1b708:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1b70d:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b712:	49 0f 47 cf          	cmova  %r15,%rcx
   1b716:	4d 39 f4             	cmp    %r14,%r12
   1b719:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1b71e:	48 0f 42 d0          	cmovb  %rax,%rdx
   1b722:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1b729:	00 00 
   1b72b:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1b730:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1b735:	4d 85 ed             	test   %r13,%r13
   1b738:	7f 7c                	jg     1b7b6 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1b73a:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1b740:	79 07                	jns    1b749 <<hyperinterval::float::F64Enclosure>::square+0x2a9>
   1b742:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1b747:	75 6d                	jne    1b7b6 <<hyperinterval::float::F64Enclosure>::square+0x316>
   1b749:	48 89 e7             	mov    %rsp,%rdi
   1b74c:	31 f6                	xor    %esi,%esi
   1b74e:	31 d2                	xor    %edx,%edx
   1b750:	e8 eb 01 00 00       	call   1b940 <<hyperinterval::float::F64Enclosure>::from_bits>
   1b755:	48 8b 0c 24          	mov    (%rsp),%rcx
   1b759:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b75e:	48 83 f9 02          	cmp    $0x2,%rcx
   1b762:	0f 84 54 fe ff ff    	je     1b5bc <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1b768:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1b76d:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b772:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1b777:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1b77c:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1b781:	88 44 24 30          	mov    %al,0x30(%rsp)
   1b785:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1b78c:	00 
   1b78d:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1b792:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1b797:	e8 44 00 00 00       	call   1b7e0 <<hyperinterval::float::F64Enclosure>::hull>
   1b79c:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1b7a3:	00 
   1b7a4:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b7a9:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1b7b0:	00 
   1b7b1:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1b7b6:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1b7bb:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b7bf:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1b7c4:	48 89 03             	mov    %rax,(%rbx)
   1b7c7:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1b7cc:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b7d0:	e9 fa fd ff ff       	jmp    1b5cf <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1b7d5:	cc                   	int3
   1b7d6:	cc                   	int3
   1b7d7:	cc                   	int3
   1b7d8:	cc                   	int3
   1b7d9:	cc                   	int3
   1b7da:	cc                   	int3
   1b7db:	cc                   	int3
   1b7dc:	cc                   	int3
   1b7dd:	cc                   	int3
   1b7de:	cc                   	int3
   1b7df:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b7e0:	4c 8b 02             	mov    (%rdx),%r8
   1b7e3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   1b7e7:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b7eb:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b7ef:	0f 85 9f 00 00 00    	jne    1b894 <<hyperinterval::float::F64Enclosure>::hull+0xb4>
   1b7f5:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b7f9:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b7fd:	ba 01 00 00 00       	mov    $0x1,%edx
   1b802:	49 83 f8 01          	cmp    $0x1,%r8
   1b806:	0f 85 97 00 00 00    	jne    1b8a3 <<hyperinterval::float::F64Enclosure>::hull+0xc3>
   1b80c:	41 57                	push   %r15
   1b80e:	41 56                	push   %r14
   1b810:	53                   	push   %rbx
   1b811:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b818:	00 00 80 
   1b81b:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b81f:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b823:	4c 89 d3             	mov    %r10,%rbx
   1b826:	4c 21 cb             	and    %r9,%rbx
   1b829:	4d 89 c6             	mov    %r8,%r14
   1b82c:	49 29 de             	sub    %rbx,%r14
   1b82f:	4d 85 d2             	test   %r10,%r10
   1b832:	4d 0f 49 f3          	cmovns %r11,%r14
   1b836:	4e 8d 1c 01          	lea    (%rcx,%r8,1),%r11
   1b83a:	48 89 cb             	mov    %rcx,%rbx
   1b83d:	4c 21 cb             	and    %r9,%rbx
   1b840:	4d 89 c7             	mov    %r8,%r15
   1b843:	49 29 df             	sub    %rbx,%r15
   1b846:	48 85 c9             	test   %rcx,%rcx
   1b849:	4d 0f 49 fb          	cmovns %r11,%r15
   1b84d:	4d 39 fe             	cmp    %r15,%r14
   1b850:	49 0f 46 ca          	cmovbe %r10,%rcx
   1b854:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b858:	49 89 f3             	mov    %rsi,%r11
   1b85b:	4d 21 cb             	and    %r9,%r11
   1b85e:	4c 89 c3             	mov    %r8,%rbx
   1b861:	4c 29 db             	sub    %r11,%rbx
   1b864:	48 85 f6             	test   %rsi,%rsi
   1b867:	49 0f 49 da          	cmovns %r10,%rbx
   1b86b:	4e 8d 14 00          	lea    (%rax,%r8,1),%r10
   1b86f:	49 21 c1             	and    %rax,%r9
   1b872:	4d 29 c8             	sub    %r9,%r8
   1b875:	48 85 c0             	test   %rax,%rax
   1b878:	4d 0f 49 c2          	cmovns %r10,%r8
   1b87c:	4c 39 c3             	cmp    %r8,%rbx
   1b87f:	48 0f 43 c6          	cmovae %rsi,%rax
   1b883:	5b                   	pop    %rbx
   1b884:	41 5e                	pop    %r14
   1b886:	41 5f                	pop    %r15
   1b888:	48 89 17             	mov    %rdx,(%rdi)
   1b88b:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b88f:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b893:	c3                   	ret
   1b894:	4c 89 c2             	mov    %r8,%rdx
   1b897:	48 89 17             	mov    %rdx,(%rdi)
   1b89a:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b89e:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b8a2:	c3                   	ret
   1b8a3:	48 89 f0             	mov    %rsi,%rax
   1b8a6:	4c 89 d1             	mov    %r10,%rcx
   1b8a9:	48 89 17             	mov    %rdx,(%rdi)
   1b8ac:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b8b0:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b8b4:	c3                   	ret
   1b8b5:	cc                   	int3
   1b8b6:	cc                   	int3
   1b8b7:	cc                   	int3
   1b8b8:	cc                   	int3
   1b8b9:	cc                   	int3
   1b8ba:	cc                   	int3
   1b8bb:	cc                   	int3
   1b8bc:	cc                   	int3
   1b8bd:	cc                   	int3
   1b8be:	cc                   	int3
   1b8bf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1b8c0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1b8c3:	75 69                	jne    1b92e <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1b8c5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b8cc:	00 00 80 
   1b8cf:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1b8d3:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1b8d7:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1b8db:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1b8df:	49 89 c9             	mov    %rcx,%r9
   1b8e2:	49 21 f1             	and    %rsi,%r9
   1b8e5:	4c 89 c7             	mov    %r8,%rdi
   1b8e8:	4c 29 cf             	sub    %r9,%rdi
   1b8eb:	48 85 c9             	test   %rcx,%rcx
   1b8ee:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b8f2:	31 d2                	xor    %edx,%edx
   1b8f4:	48 85 ff             	test   %rdi,%rdi
   1b8f7:	0f 99 c1             	setns  %cl
   1b8fa:	4c 39 c7             	cmp    %r8,%rdi
   1b8fd:	77 1f                	ja     1b91e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1b8ff:	48 85 ff             	test   %rdi,%rdi
   1b902:	40 0f 99 c7          	setns  %dil
   1b906:	40 80 cf 02          	or     $0x2,%dil
   1b90a:	48 85 f0             	test   %rsi,%rax
   1b90d:	88 ca                	mov    %cl,%dl
   1b90f:	40 0f b6 cf          	movzbl %dil,%ecx
   1b913:	0f 44 d1             	cmove  %ecx,%edx
   1b916:	48 85 c0             	test   %rax,%rax
   1b919:	0f 49 d1             	cmovns %ecx,%edx
   1b91c:	89 d1                	mov    %edx,%ecx
   1b91e:	8d 51 04             	lea    0x4(%rcx),%edx
   1b921:	48 85 c0             	test   %rax,%rax
   1b924:	0f b6 c9             	movzbl %cl,%ecx
   1b927:	0f b6 c2             	movzbl %dl,%eax
   1b92a:	0f 4e c1             	cmovle %ecx,%eax
   1b92d:	c3                   	ret
   1b92e:	31 c0                	xor    %eax,%eax
   1b930:	c3                   	ret
   1b931:	cc                   	int3
   1b932:	cc                   	int3
   1b933:	cc                   	int3
   1b934:	cc                   	int3
   1b935:	cc                   	int3
   1b936:	cc                   	int3
   1b937:	cc                   	int3
   1b938:	cc                   	int3
   1b939:	cc                   	int3
   1b93a:	cc                   	int3
   1b93b:	cc                   	int3
   1b93c:	cc                   	int3
   1b93d:	cc                   	int3
   1b93e:	cc                   	int3
   1b93f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1b940:	41 57                	push   %r15
   1b942:	41 56                	push   %r14
   1b944:	41 55                	push   %r13
   1b946:	41 54                	push   %r12
   1b948:	53                   	push   %rbx
   1b949:	48 83 ec 10          	sub    $0x10,%rsp
   1b94d:	49 89 d7             	mov    %rdx,%r15
   1b950:	48 89 f1             	mov    %rsi,%rcx
   1b953:	48 89 fb             	mov    %rdi,%rbx
   1b956:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b95d:	00 00 80 
   1b960:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1b967:	00 f0 7f 
   1b96a:	48 89 e7             	mov    %rsp,%rdi
   1b96d:	4c 89 f6             	mov    %r14,%rsi
   1b970:	4c 89 e2             	mov    %r12,%rdx
   1b973:	e8 d8 d4 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b978:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b97c:	74 1c                	je     1b99a <<hyperinterval::float::F64Enclosure>::from_bits+0x5a>
   1b97e:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b983:	48 89 e7             	mov    %rsp,%rdi
   1b986:	4c 89 f6             	mov    %r14,%rsi
   1b989:	4c 89 e2             	mov    %r12,%rdx
   1b98c:	4c 89 f9             	mov    %r15,%rcx
   1b98f:	e8 bc d4 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1b994:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b998:	75 1d                	jne    1b9b7 <<hyperinterval::float::F64Enclosure>::from_bits+0x77>
   1b99a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b99f:	88 43 08             	mov    %al,0x8(%rbx)
   1b9a2:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b9a9:	48 83 c4 10          	add    $0x10,%rsp
   1b9ad:	5b                   	pop    %rbx
   1b9ae:	41 5c                	pop    %r12
   1b9b0:	41 5d                	pop    %r13
   1b9b2:	41 5e                	pop    %r14
   1b9b4:	41 5f                	pop    %r15
   1b9b6:	c3                   	ret
   1b9b7:	4b 8d 04 2e          	lea    (%r14,%r13,1),%rax
   1b9bb:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b9bf:	4c 89 ea             	mov    %r13,%rdx
   1b9c2:	48 21 ca             	and    %rcx,%rdx
   1b9c5:	4c 89 f6             	mov    %r14,%rsi
   1b9c8:	48 29 d6             	sub    %rdx,%rsi
   1b9cb:	4d 85 ed             	test   %r13,%r13
   1b9ce:	48 0f 49 f0          	cmovns %rax,%rsi
   1b9d2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b9d7:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b9db:	48 21 c1             	and    %rax,%rcx
   1b9de:	49 29 ce             	sub    %rcx,%r14
   1b9e1:	48 85 c0             	test   %rax,%rax
   1b9e4:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b9e8:	4c 39 f6             	cmp    %r14,%rsi
   1b9eb:	76 06                	jbe    1b9f3 <<hyperinterval::float::F64Enclosure>::from_bits+0xb3>
   1b9ed:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1b9f1:	eb af                	jmp    1b9a2 <<hyperinterval::float::F64Enclosure>::from_bits+0x62>
   1b9f3:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1b9fa:	4c 89 6b 08          	mov    %r13,0x8(%rbx)
   1b9fe:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ba02:	eb a5                	jmp    1b9a9 <<hyperinterval::float::F64Enclosure>::from_bits+0x69>
   1ba04:	cc                   	int3
   1ba05:	cc                   	int3
   1ba06:	cc                   	int3
   1ba07:	cc                   	int3
   1ba08:	cc                   	int3
   1ba09:	cc                   	int3
   1ba0a:	cc                   	int3
   1ba0b:	cc                   	int3
   1ba0c:	cc                   	int3
   1ba0d:	cc                   	int3
   1ba0e:	cc                   	int3
   1ba0f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1ba10:	45 31 c0             	xor    %r8d,%r8d
   1ba13:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ba17:	0f 85 d5 00 00 00    	jne    1baf2 <<hyperinterval::float::F64Enclosure>::intersection+0xe2>
   1ba1d:	f6 02 01             	testb  $0x1,(%rdx)
   1ba20:	0f 84 c0 00 00 00    	je     1bae6 <<hyperinterval::float::F64Enclosure>::intersection+0xd6>
   1ba26:	41 56                	push   %r14
   1ba28:	53                   	push   %rbx
   1ba29:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1ba2d:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1ba31:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1ba35:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1ba3c:	00 00 80 
   1ba3f:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   1ba43:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1ba47:	49 89 c3             	mov    %rax,%r11
   1ba4a:	4d 21 c3             	and    %r8,%r11
   1ba4d:	48 89 d3             	mov    %rdx,%rbx
   1ba50:	4c 29 db             	sub    %r11,%rbx
   1ba53:	48 85 c0             	test   %rax,%rax
   1ba56:	48 0f 49 d9          	cmovns %rcx,%rbx
   1ba5a:	49 8d 0c 12          	lea    (%r10,%rdx,1),%rcx
   1ba5e:	4d 89 d3             	mov    %r10,%r11
   1ba61:	4d 21 c3             	and    %r8,%r11
   1ba64:	49 89 d6             	mov    %rdx,%r14
   1ba67:	4d 29 de             	sub    %r11,%r14
   1ba6a:	4d 85 d2             	test   %r10,%r10
   1ba6d:	4c 0f 49 f1          	cmovns %rcx,%r14
   1ba71:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1ba75:	4c 39 f3             	cmp    %r14,%rbx
   1ba78:	49 0f 42 c2          	cmovb  %r10,%rax
   1ba7c:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1ba80:	49 89 ca             	mov    %rcx,%r10
   1ba83:	4d 21 c2             	and    %r8,%r10
   1ba86:	49 89 d3             	mov    %rdx,%r11
   1ba89:	4d 29 d3             	sub    %r10,%r11
   1ba8c:	48 85 c9             	test   %rcx,%rcx
   1ba8f:	4c 0f 49 de          	cmovns %rsi,%r11
   1ba93:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1ba97:	4d 89 ca             	mov    %r9,%r10
   1ba9a:	4d 21 c2             	and    %r8,%r10
   1ba9d:	48 89 d3             	mov    %rdx,%rbx
   1baa0:	4c 29 d3             	sub    %r10,%rbx
   1baa3:	4d 85 c9             	test   %r9,%r9
   1baa6:	48 0f 49 de          	cmovns %rsi,%rbx
   1baaa:	49 39 db             	cmp    %rbx,%r11
   1baad:	49 0f 47 c9          	cmova  %r9,%rcx
   1bab1:	48 8d 34 10          	lea    (%rax,%rdx,1),%rsi
   1bab5:	49 89 c1             	mov    %rax,%r9
   1bab8:	4d 21 c1             	and    %r8,%r9
   1babb:	49 89 d2             	mov    %rdx,%r10
   1babe:	4d 29 ca             	sub    %r9,%r10
   1bac1:	48 85 c0             	test   %rax,%rax
   1bac4:	4c 0f 49 d6          	cmovns %rsi,%r10
   1bac8:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1bacc:	49 21 c8             	and    %rcx,%r8
   1bacf:	4c 29 c2             	sub    %r8,%rdx
   1bad2:	48 85 c9             	test   %rcx,%rcx
   1bad5:	48 0f 49 d6          	cmovns %rsi,%rdx
   1bad9:	45 31 c0             	xor    %r8d,%r8d
   1badc:	49 39 d2             	cmp    %rdx,%r10
   1badf:	41 0f 96 c0          	setbe  %r8b
   1bae3:	5b                   	pop    %rbx
   1bae4:	41 5e                	pop    %r14
   1bae6:	4c 89 07             	mov    %r8,(%rdi)
   1bae9:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1baed:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1baf1:	c3                   	ret
   1baf2:	4c 89 07             	mov    %r8,(%rdi)
   1baf5:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1baf9:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1bafd:	c3                   	ret
   1bafe:	cc                   	int3
   1baff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1bb00:	41 56                	push   %r14
   1bb02:	53                   	push   %rbx
   1bb03:	48 83 ec 18          	sub    $0x18,%rsp
   1bb07:	49 89 fe             	mov    %rdi,%r14
   1bb0a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bb11:	00 00 80 
   1bb14:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb19:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1bb1e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1bb25:	00 f0 7f 
   1bb28:	48 89 de             	mov    %rbx,%rsi
   1bb2b:	e8 20 d3 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1bb30:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bb35:	3c 01                	cmp    $0x1,%al
   1bb37:	75 0d                	jne    1bb46 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1bb39:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1bb3e:	48 83 c4 18          	add    $0x18,%rsp
   1bb42:	5b                   	pop    %rbx
   1bb43:	41 5e                	pop    %r14
   1bb45:	c3                   	ret
   1bb46:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1bb4a:	75 40                	jne    1bb8c <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1bb4c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1bb51:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1bb55:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1bb59:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1bb5d:	49 89 d0             	mov    %rdx,%r8
   1bb60:	49 21 c8             	and    %rcx,%r8
   1bb63:	49 89 d9             	mov    %rbx,%r9
   1bb66:	4d 29 c1             	sub    %r8,%r9
   1bb69:	48 85 d2             	test   %rdx,%rdx
   1bb6c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bb70:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1bb74:	49 89 f0             	mov    %rsi,%r8
   1bb77:	49 21 c8             	and    %rcx,%r8
   1bb7a:	48 89 da             	mov    %rbx,%rdx
   1bb7d:	4c 29 c2             	sub    %r8,%rdx
   1bb80:	48 85 f6             	test   %rsi,%rsi
   1bb83:	48 0f 49 d7          	cmovns %rdi,%rdx
   1bb87:	49 39 d1             	cmp    %rdx,%r9
   1bb8a:	76 0a                	jbe    1bb96 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1bb8c:	31 d2                	xor    %edx,%edx
   1bb8e:	48 83 c4 18          	add    $0x18,%rsp
   1bb92:	5b                   	pop    %rbx
   1bb93:	41 5e                	pop    %r14
   1bb95:	c3                   	ret
   1bb96:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1bb9a:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1bb9e:	48 21 f1             	and    %rsi,%rcx
   1bba1:	48 29 cb             	sub    %rcx,%rbx
   1bba4:	48 85 f6             	test   %rsi,%rsi
   1bba7:	48 0f 49 df          	cmovns %rdi,%rbx
   1bbab:	48 39 da             	cmp    %rbx,%rdx
   1bbae:	0f 96 c2             	setbe  %dl
   1bbb1:	48 83 c4 18          	add    $0x18,%rsp
   1bbb5:	5b                   	pop    %rbx
   1bbb6:	41 5e                	pop    %r14
   1bbb8:	c3                   	ret
   1bbb9:	cc                   	int3
   1bbba:	cc                   	int3
   1bbbb:	cc                   	int3
   1bbbc:	cc                   	int3
   1bbbd:	cc                   	int3
   1bbbe:	cc                   	int3
   1bbbf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1bbc0:	b0 01                	mov    $0x1,%al
   1bbc2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bbc6:	0f 85 8b 00 00 00    	jne    1bc57 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1bbcc:	f6 06 01             	testb  $0x1,(%rsi)
   1bbcf:	0f 84 80 00 00 00    	je     1bc55 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1bbd5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bbd9:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bbdd:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bbe4:	00 00 80 
   1bbe7:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1bbeb:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bbef:	4d 89 c2             	mov    %r8,%r10
   1bbf2:	49 21 ca             	and    %rcx,%r10
   1bbf5:	49 89 c3             	mov    %rax,%r11
   1bbf8:	4d 29 d3             	sub    %r10,%r11
   1bbfb:	4d 85 c0             	test   %r8,%r8
   1bbfe:	4d 0f 49 d9          	cmovns %r9,%r11
   1bc02:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1bc06:	49 89 d1             	mov    %rdx,%r9
   1bc09:	49 21 c9             	and    %rcx,%r9
   1bc0c:	49 89 c2             	mov    %rax,%r10
   1bc0f:	4d 29 ca             	sub    %r9,%r10
   1bc12:	48 85 d2             	test   %rdx,%rdx
   1bc15:	4d 0f 49 d0          	cmovns %r8,%r10
   1bc19:	4d 39 d3             	cmp    %r10,%r11
   1bc1c:	73 37                	jae    1bc55 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1bc1e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bc22:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bc26:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1bc2a:	49 89 d0             	mov    %rdx,%r8
   1bc2d:	49 21 c8             	and    %rcx,%r8
   1bc30:	49 89 c1             	mov    %rax,%r9
   1bc33:	4d 29 c1             	sub    %r8,%r9
   1bc36:	48 85 d2             	test   %rdx,%rdx
   1bc39:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bc3d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1bc41:	48 21 f1             	and    %rsi,%rcx
   1bc44:	48 29 c8             	sub    %rcx,%rax
   1bc47:	48 85 f6             	test   %rsi,%rsi
   1bc4a:	48 0f 49 c2          	cmovns %rdx,%rax
   1bc4e:	49 39 c1             	cmp    %rax,%r9
   1bc51:	0f 92 c0             	setb   %al
   1bc54:	c3                   	ret
   1bc55:	31 c0                	xor    %eax,%eax
   1bc57:	c3                   	ret
   1bc58:	cc                   	int3
   1bc59:	cc                   	int3
   1bc5a:	cc                   	int3
   1bc5b:	cc                   	int3
   1bc5c:	cc                   	int3
   1bc5d:	cc                   	int3
   1bc5e:	cc                   	int3
   1bc5f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1bc60:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bc64:	0f 85 c8 00 00 00    	jne    1bd32 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1bc6a:	f6 02 01             	testb  $0x1,(%rdx)
   1bc6d:	0f 84 bf 00 00 00    	je     1bd32 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1bc73:	55                   	push   %rbp
   1bc74:	41 57                	push   %r15
   1bc76:	41 56                	push   %r14
   1bc78:	41 55                	push   %r13
   1bc7a:	41 54                	push   %r12
   1bc7c:	53                   	push   %rbx
   1bc7d:	48 83 ec 18          	sub    $0x18,%rsp
   1bc81:	48 89 fd             	mov    %rdi,%rbp
   1bc84:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1bc88:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1bc8c:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1bc90:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bc97:	00 00 80 
   1bc9a:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1bca1:	00 f0 7f 
   1bca4:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1bca8:	48 89 e7             	mov    %rsp,%rdi
   1bcab:	48 89 de             	mov    %rbx,%rsi
   1bcae:	4c 89 f2             	mov    %r14,%rdx
   1bcb1:	e8 2a ea ff ff       	call   1a6e0 <<hyperinterval::ieee::Format>::add>
   1bcb6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bcba:	74 57                	je     1bd13 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1bcbc:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1bcc1:	48 89 e7             	mov    %rsp,%rdi
   1bcc4:	48 89 de             	mov    %rbx,%rsi
   1bcc7:	4c 89 f2             	mov    %r14,%rdx
   1bcca:	4c 89 f9             	mov    %r15,%rcx
   1bccd:	4d 89 e0             	mov    %r12,%r8
   1bcd0:	e8 0b ea ff ff       	call   1a6e0 <<hyperinterval::ieee::Format>::add>
   1bcd5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bcd9:	74 38                	je     1bd13 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1bcdb:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1bce0:	48 89 e7             	mov    %rsp,%rdi
   1bce3:	48 89 de             	mov    %rbx,%rsi
   1bce6:	4c 89 f2             	mov    %r14,%rdx
   1bce9:	4c 89 e9             	mov    %r13,%rcx
   1bcec:	e8 5f d1 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1bcf1:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bcf5:	74 1c                	je     1bd13 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1bcf7:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bcfc:	48 89 e7             	mov    %rsp,%rdi
   1bcff:	48 89 de             	mov    %rbx,%rsi
   1bd02:	4c 89 f2             	mov    %r14,%rdx
   1bd05:	4c 89 f9             	mov    %r15,%rcx
   1bd08:	e8 43 d1 ff ff       	call   18e50 <<hyperinterval::ieee::Format>::finite>
   1bd0d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bd11:	75 27                	jne    1bd3a <<hyperinterval::float::F64Enclosure>::add+0xda>
   1bd13:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bd18:	88 45 08             	mov    %al,0x8(%rbp)
   1bd1b:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1bd22:	00 
   1bd23:	48 83 c4 18          	add    $0x18,%rsp
   1bd27:	5b                   	pop    %rbx
   1bd28:	41 5c                	pop    %r12
   1bd2a:	41 5d                	pop    %r13
   1bd2c:	41 5e                	pop    %r14
   1bd2e:	41 5f                	pop    %r15
   1bd30:	5d                   	pop    %rbp
   1bd31:	c3                   	ret
   1bd32:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1bd39:	c3                   	ret
   1bd3a:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1bd3e:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1bd42:	4c 89 e2             	mov    %r12,%rdx
   1bd45:	48 21 ca             	and    %rcx,%rdx
   1bd48:	48 89 de             	mov    %rbx,%rsi
   1bd4b:	48 29 d6             	sub    %rdx,%rsi
   1bd4e:	4d 85 e4             	test   %r12,%r12
   1bd51:	48 0f 49 f0          	cmovns %rax,%rsi
   1bd55:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bd5a:	48 8d 14 18          	lea    (%rax,%rbx,1),%rdx
   1bd5e:	48 21 c1             	and    %rax,%rcx
   1bd61:	48 29 cb             	sub    %rcx,%rbx
   1bd64:	48 85 c0             	test   %rax,%rax
   1bd67:	48 0f 49 da          	cmovns %rdx,%rbx
   1bd6b:	48 39 de             	cmp    %rbx,%rsi
   1bd6e:	76 06                	jbe    1bd76 <<hyperinterval::float::F64Enclosure>::add+0x116>
   1bd70:	c6 45 08 01          	movb   $0x1,0x8(%rbp)
   1bd74:	eb a5                	jmp    1bd1b <<hyperinterval::float::F64Enclosure>::add+0xbb>
   1bd76:	48 c7 45 00 01 00 00 	movq   $0x1,0x0(%rbp)
   1bd7d:	00 
   1bd7e:	4c 89 65 08          	mov    %r12,0x8(%rbp)
   1bd82:	48 89 45 10          	mov    %rax,0x10(%rbp)
   1bd86:	eb 9b                	jmp    1bd23 <<hyperinterval::float::F64Enclosure>::add+0xc3>
   1bd88:	cc                   	int3
   1bd89:	cc                   	int3
   1bd8a:	cc                   	int3
   1bd8b:	cc                   	int3
   1bd8c:	cc                   	int3
   1bd8d:	cc                   	int3
   1bd8e:	cc                   	int3
   1bd8f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1bd90:	83 3a 01             	cmpl   $0x1,(%rdx)
   1bd93:	0f 85 77 f2 ff ff    	jne    1b010 <<hyperinterval::float::F64Enclosure>::corner_image>
   1bd99:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1bd9e:	0f 8f 6c f2 ff ff    	jg     1b010 <<hyperinterval::float::F64Enclosure>::corner_image>
   1bda4:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1bda8:	48 85 c0             	test   %rax,%rax
   1bdab:	0f 99 c1             	setns  %cl
   1bdae:	48 d1 e0             	shl    $1,%rax
   1bdb1:	48 85 c0             	test   %rax,%rax
   1bdb4:	0f 94 c0             	sete   %al
   1bdb7:	08 c8                	or     %cl,%al
   1bdb9:	0f 84 51 f2 ff ff    	je     1b010 <<hyperinterval::float::F64Enclosure>::corner_image>
   1bdbf:	c6 47 08 04          	movb   $0x4,0x8(%rdi)
   1bdc3:	48 c7 07 02 00 00 00 	movq   $0x2,(%rdi)
   1bdca:	c3                   	ret
   1bdcb:	cc                   	int3
   1bdcc:	cc                   	int3
   1bdcd:	cc                   	int3
   1bdce:	cc                   	int3
   1bdcf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sub:
   1bdd0:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1bdd4:	75 30                	jne    1be06 <<hyperinterval::float::F64Enclosure>::sub+0x36>
   1bdd6:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1bdda:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1bdde:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bde5:	00 00 80 
   1bde8:	48 89 d1             	mov    %rdx,%rcx
   1bdeb:	48 31 c1             	xor    %rax,%rcx
   1bdee:	48 85 d2             	test   %rdx,%rdx
   1bdf1:	48 0f 44 ca          	cmove  %rdx,%rcx
   1bdf5:	4c 31 c0             	xor    %r8,%rax
   1bdf8:	4d 85 c0             	test   %r8,%r8
   1bdfb:	49 0f 44 c0          	cmove  %r8,%rax
   1bdff:	ba 01 00 00 00       	mov    $0x1,%edx
   1be04:	eb 02                	jmp    1be08 <<hyperinterval::float::F64Enclosure>::sub+0x38>
   1be06:	31 d2                	xor    %edx,%edx
   1be08:	48 83 ec 18          	sub    $0x18,%rsp
   1be0c:	48 89 14 24          	mov    %rdx,(%rsp)
   1be10:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1be15:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1be1a:	48 89 e2             	mov    %rsp,%rdx
   1be1d:	e8 3e fe ff ff       	call   1bc60 <<hyperinterval::float::F64Enclosure>::add>
   1be22:	48 83 c4 18          	add    $0x18,%rsp
   1be26:	c3                   	ret
   1be27:	cc                   	int3
   1be28:	cc                   	int3
   1be29:	cc                   	int3
   1be2a:	cc                   	int3
   1be2b:	cc                   	int3
   1be2c:	cc                   	int3
   1be2d:	cc                   	int3
   1be2e:	cc                   	int3
   1be2f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::disjoint:
   1be30:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1be34:	b0 01                	mov    $0x1,%al
   1be36:	0f 84 8b 00 00 00    	je     1bec7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1be3c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1be40:	0f 84 81 00 00 00    	je     1bec7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1be46:	53                   	push   %rbx
   1be47:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1be4e:	00 00 80 
   1be51:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1be55:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1be59:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1be5d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1be61:	4d 89 c3             	mov    %r8,%r11
   1be64:	49 21 d3             	and    %rdx,%r11
   1be67:	48 89 cb             	mov    %rcx,%rbx
   1be6a:	4c 29 db             	sub    %r11,%rbx
   1be6d:	4d 85 c0             	test   %r8,%r8
   1be70:	49 0f 49 da          	cmovns %r10,%rbx
   1be74:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1be78:	4d 89 ca             	mov    %r9,%r10
   1be7b:	49 21 d2             	and    %rdx,%r10
   1be7e:	49 89 cb             	mov    %rcx,%r11
   1be81:	4d 29 d3             	sub    %r10,%r11
   1be84:	4d 85 c9             	test   %r9,%r9
   1be87:	4d 0f 49 d8          	cmovns %r8,%r11
   1be8b:	4c 39 db             	cmp    %r11,%rbx
   1be8e:	5b                   	pop    %rbx
   1be8f:	72 36                	jb     1bec7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1be91:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1be95:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1be99:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1be9d:	49 89 f0             	mov    %rsi,%r8
   1bea0:	49 21 d0             	and    %rdx,%r8
   1bea3:	49 89 c9             	mov    %rcx,%r9
   1bea6:	4d 29 c1             	sub    %r8,%r9
   1bea9:	48 85 f6             	test   %rsi,%rsi
   1beac:	4c 0f 49 cf          	cmovns %rdi,%r9
   1beb0:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1beb4:	48 21 c2             	and    %rax,%rdx
   1beb7:	48 29 d1             	sub    %rdx,%rcx
   1beba:	48 85 c0             	test   %rax,%rax
   1bebd:	48 0f 49 ce          	cmovns %rsi,%rcx
   1bec1:	49 39 c9             	cmp    %rcx,%r9
   1bec4:	0f 92 c0             	setb   %al
   1bec7:	c3                   	ret
   1bec8:	cc                   	int3
   1bec9:	cc                   	int3
   1beca:	cc                   	int3
   1becb:	cc                   	int3
   1becc:	cc                   	int3
   1becd:	cc                   	int3
   1bece:	cc                   	int3
   1becf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1bed0:	31 c0                	xor    %eax,%eax
   1bed2:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1bed6:	0f 84 8c 00 00 00    	je     1bf68 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1bedc:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1bee0:	0f 84 82 00 00 00    	je     1bf68 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1bee6:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1beed:	00 00 80 
   1bef0:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bef4:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bef8:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1befc:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bf00:	49 89 d2             	mov    %rdx,%r10
   1bf03:	49 21 ca             	and    %rcx,%r10
   1bf06:	49 89 c3             	mov    %rax,%r11
   1bf09:	4d 29 d3             	sub    %r10,%r11
   1bf0c:	48 85 d2             	test   %rdx,%rdx
   1bf0f:	4d 0f 49 d9          	cmovns %r9,%r11
   1bf13:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1bf17:	4d 89 c1             	mov    %r8,%r9
   1bf1a:	49 21 c9             	and    %rcx,%r9
   1bf1d:	49 89 c2             	mov    %rax,%r10
   1bf20:	4d 29 ca             	sub    %r9,%r10
   1bf23:	4d 85 c0             	test   %r8,%r8
   1bf26:	4c 0f 49 d2          	cmovns %rdx,%r10
   1bf2a:	4d 39 d3             	cmp    %r10,%r11
   1bf2d:	73 03                	jae    1bf32 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1bf2f:	31 c0                	xor    %eax,%eax
   1bf31:	c3                   	ret
   1bf32:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bf36:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bf3a:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1bf3e:	49 89 f0             	mov    %rsi,%r8
   1bf41:	49 21 c8             	and    %rcx,%r8
   1bf44:	49 89 c1             	mov    %rax,%r9
   1bf47:	4d 29 c1             	sub    %r8,%r9
   1bf4a:	48 85 f6             	test   %rsi,%rsi
   1bf4d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bf51:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1bf55:	48 21 d1             	and    %rdx,%rcx
   1bf58:	48 29 c8             	sub    %rcx,%rax
   1bf5b:	48 85 d2             	test   %rdx,%rdx
   1bf5e:	48 0f 49 c6          	cmovns %rsi,%rax
   1bf62:	49 39 c1             	cmp    %rax,%r9
   1bf65:	0f 93 c0             	setae  %al
   1bf68:	c3                   	ret
   1bf69:	cc                   	int3
   1bf6a:	cc                   	int3
   1bf6b:	cc                   	int3
   1bf6c:	cc                   	int3
   1bf6d:	cc                   	int3
   1bf6e:	cc                   	int3
   1bf6f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1bf70:	b0 01                	mov    $0x1,%al
   1bf72:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bf76:	75 50                	jne    1bfc8 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1bf78:	f6 06 01             	testb  $0x1,(%rsi)
   1bf7b:	74 49                	je     1bfc6 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1bf7d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bf81:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bf85:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bf8c:	00 00 80 
   1bf8f:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1bf93:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bf97:	4d 89 c2             	mov    %r8,%r10
   1bf9a:	49 21 ca             	and    %rcx,%r10
   1bf9d:	49 89 c3             	mov    %rax,%r11
   1bfa0:	4d 29 d3             	sub    %r10,%r11
   1bfa3:	4d 85 c0             	test   %r8,%r8
   1bfa6:	4d 0f 49 d9          	cmovns %r9,%r11
   1bfaa:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1bfae:	49 89 d1             	mov    %rdx,%r9
   1bfb1:	49 21 c9             	and    %rcx,%r9
   1bfb4:	49 89 c2             	mov    %rax,%r10
   1bfb7:	4d 29 ca             	sub    %r9,%r10
   1bfba:	48 85 d2             	test   %rdx,%rdx
   1bfbd:	4d 0f 49 d0          	cmovns %r8,%r10
   1bfc1:	4d 39 d3             	cmp    %r10,%r11
   1bfc4:	76 03                	jbe    1bfc9 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1bfc6:	31 c0                	xor    %eax,%eax
   1bfc8:	c3                   	ret
   1bfc9:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bfcd:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bfd1:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1bfd5:	49 89 d0             	mov    %rdx,%r8
   1bfd8:	49 21 c8             	and    %rcx,%r8
   1bfdb:	49 89 c1             	mov    %rax,%r9
   1bfde:	4d 29 c1             	sub    %r8,%r9
   1bfe1:	48 85 d2             	test   %rdx,%rdx
   1bfe4:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bfe8:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1bfec:	48 21 f1             	and    %rsi,%rcx
   1bfef:	48 29 c8             	sub    %rcx,%rax
   1bff2:	48 85 f6             	test   %rsi,%rsi
   1bff5:	48 0f 49 c2          	cmovns %rdx,%rax
   1bff9:	49 39 c1             	cmp    %rax,%r9
   1bffc:	0f 96 c0             	setbe  %al
   1bfff:	c3                   	ret

__udivti3:
   4da70:	49 89 d0             	mov    %rdx,%r8
   4da73:	48 85 c9             	test   %rcx,%rcx
   4da76:	74 76                	je     4daee <__udivti3+0x7e>
   4da78:	53                   	push   %rbx
   4da79:	4c 0f bd c9          	bsr    %rcx,%r9
   4da7d:	44 89 ca             	mov    %r9d,%edx
   4da80:	83 f2 3f             	xor    $0x3f,%edx
   4da83:	b0 40                	mov    $0x40,%al
   4da85:	28 d0                	sub    %dl,%al
   4da87:	4c 89 c2             	mov    %r8,%rdx
   4da8a:	49 89 cb             	mov    %rcx,%r11
   4da8d:	89 c1                	mov    %eax,%ecx
   4da8f:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4da93:	4d 89 da             	mov    %r11,%r10
   4da96:	49 d3 ea             	shr    %cl,%r10
   4da99:	a8 40                	test   $0x40,%al
   4da9b:	4c 0f 44 d2          	cmove  %rdx,%r10
   4da9f:	48 89 f8             	mov    %rdi,%rax
   4daa2:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   4daa7:	48 89 f2             	mov    %rsi,%rdx
   4daaa:	48 d1 ea             	shr    $1,%rdx
   4daad:	49 f7 f2             	div    %r10
   4dab0:	49 89 c2             	mov    %rax,%r10
   4dab3:	44 89 c9             	mov    %r9d,%ecx
   4dab6:	49 d3 ea             	shr    %cl,%r10
   4dab9:	31 c9                	xor    %ecx,%ecx
   4dabb:	49 83 ea 01          	sub    $0x1,%r10
   4dabf:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4dac3:	4c 89 db             	mov    %r11,%rbx
   4dac6:	4c 89 c0             	mov    %r8,%rax
   4dac9:	49 f7 e2             	mul    %r10
   4dacc:	49 89 c1             	mov    %rax,%r9
   4dacf:	4c 89 d0             	mov    %r10,%rax
   4dad2:	49 0f af da          	imul   %r10,%rbx
   4dad6:	48 01 da             	add    %rbx,%rdx
   4dad9:	4c 29 cf             	sub    %r9,%rdi
   4dadc:	48 19 d6             	sbb    %rdx,%rsi
   4dadf:	4c 39 c7             	cmp    %r8,%rdi
   4dae2:	4c 19 de             	sbb    %r11,%rsi
   4dae5:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4dae9:	5b                   	pop    %rbx
   4daea:	48 89 ca             	mov    %rcx,%rdx
   4daed:	c3                   	ret
   4daee:	4c 39 c6             	cmp    %r8,%rsi
   4daf1:	73 0f                	jae    4db02 <__udivti3+0x92>
   4daf3:	48 89 f8             	mov    %rdi,%rax
   4daf6:	48 89 f2             	mov    %rsi,%rdx
   4daf9:	49 f7 f0             	div    %r8
   4dafc:	31 c9                	xor    %ecx,%ecx
   4dafe:	48 89 ca             	mov    %rcx,%rdx
   4db01:	c3                   	ret
   4db02:	48 89 f0             	mov    %rsi,%rax
   4db05:	4c 09 c0             	or     %r8,%rax
   4db08:	48 c1 e8 20          	shr    $0x20,%rax
   4db0c:	74 15                	je     4db23 <__udivti3+0xb3>
   4db0e:	48 89 f0             	mov    %rsi,%rax
   4db11:	31 d2                	xor    %edx,%edx
   4db13:	49 f7 f0             	div    %r8
   4db16:	48 89 c1             	mov    %rax,%rcx
   4db19:	48 89 f8             	mov    %rdi,%rax
   4db1c:	49 f7 f0             	div    %r8
   4db1f:	48 89 ca             	mov    %rcx,%rdx
   4db22:	c3                   	ret
   4db23:	89 f0                	mov    %esi,%eax
   4db25:	31 d2                	xor    %edx,%edx
   4db27:	41 f7 f0             	div    %r8d
   4db2a:	89 c1                	mov    %eax,%ecx
   4db2c:	48 89 f8             	mov    %rdi,%rax
   4db2f:	49 f7 f0             	div    %r8
   4db32:	48 89 ca             	mov    %rcx,%rdx
   4db35:	c3                   	ret

Disassembly of section .init:
