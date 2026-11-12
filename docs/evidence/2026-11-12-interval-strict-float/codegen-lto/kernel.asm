hyperinterval_strict_chain32:
   10d30:	41 57                	push   %r15
   10d32:	41 56                	push   %r14
   10d34:	53                   	push   %rbx
   10d35:	48 83 ec 70          	sub    $0x70,%rsp
   10d39:	f3 0f 11 4c 24 54    	movss  %xmm1,0x54(%rsp)
   10d3f:	48 89 fb             	mov    %rdi,%rbx
   10d42:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   10d48:	66 0f 7e c1          	movd   %xmm0,%ecx
   10d4c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   10d51:	be 00 00 00 80       	mov    $0x80000000,%esi
   10d56:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10d5b:	e8 b0 7f 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   10d60:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   10d65:	74 2a                	je     10d91 <hyperinterval_strict_chain32+0x61>
   10d67:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   10d6c:	66 0f 6e 44 24 54    	movd   0x54(%rsp),%xmm0
   10d72:	66 0f 7e c1          	movd   %xmm0,%ecx
   10d76:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   10d7b:	be 00 00 00 80       	mov    $0x80000000,%esi
   10d80:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10d85:	e8 86 7f 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   10d8a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   10d8f:	75 1b                	jne    10dac <hyperinterval_strict_chain32+0x7c>
   10d91:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   10d96:	88 4b 04             	mov    %cl,0x4(%rbx)
   10d99:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   10d9f:	48 89 d8             	mov    %rbx,%rax
   10da2:	48 83 c4 70          	add    $0x70,%rsp
   10da6:	5b                   	pop    %rbx
   10da7:	41 5e                	pop    %r14
   10da9:	41 5f                	pop    %r15
   10dab:	c3                   	ret
   10dac:	8b 44 24 10          	mov    0x10(%rsp),%eax
   10db0:	44 89 f9             	mov    %r15d,%ecx
   10db3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   10db9:	89 c2                	mov    %eax,%edx
   10dbb:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   10dc1:	be 00 00 00 80       	mov    $0x80000000,%esi
   10dc6:	29 ce                	sub    %ecx,%esi
   10dc8:	44 09 f1             	or     %r14d,%ecx
   10dcb:	45 85 ff             	test   %r15d,%r15d
   10dce:	48 0f 49 f1          	cmovns %rcx,%rsi
   10dd2:	bf 00 00 00 80       	mov    $0x80000000,%edi
   10dd7:	29 d7                	sub    %edx,%edi
   10dd9:	89 d1                	mov    %edx,%ecx
   10ddb:	44 09 f1             	or     %r14d,%ecx
   10dde:	85 c0                	test   %eax,%eax
   10de0:	48 0f 49 f9          	cmovns %rcx,%rdi
   10de4:	b1 01                	mov    $0x1,%cl
   10de6:	39 fe                	cmp    %edi,%esi
   10de8:	76 05                	jbe    10def <hyperinterval_strict_chain32+0xbf>
   10dea:	88 4b 04             	mov    %cl,0x4(%rbx)
   10ded:	eb aa                	jmp    10d99 <hyperinterval_strict_chain32+0x69>
   10def:	44 89 f9             	mov    %r15d,%ecx
   10df2:	44 89 fa             	mov    %r15d,%edx
   10df5:	c1 ea 08             	shr    $0x8,%edx
   10df8:	41 c1 ef 18          	shr    $0x18,%r15d
   10dfc:	44 88 7c 24 5f       	mov    %r15b,0x5f(%rsp)
   10e01:	66 89 54 24 5d       	mov    %dx,0x5d(%rsp)
   10e06:	89 44 24 60          	mov    %eax,0x60(%rsp)
   10e0a:	c7 44 24 58 01 00 00 	movl   $0x1,0x58(%rsp)
   10e11:	00 
   10e12:	88 4c 24 5c          	mov    %cl,0x5c(%rsp)
   10e16:	49 8d 8e 00 00 00 3f 	lea    0x3f000000(%r14),%rcx
   10e1d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   10e22:	be 00 00 00 80       	mov    $0x80000000,%esi
   10e27:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10e2c:	e8 df 7e 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   10e31:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   10e36:	75 0a                	jne    10e42 <hyperinterval_strict_chain32+0x112>
   10e38:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   10e3d:	e9 a4 00 00 00       	jmp    10ee6 <hyperinterval_strict_chain32+0x1b6>
   10e42:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   10e47:	89 c1                	mov    %eax,%ecx
   10e49:	c1 e9 08             	shr    $0x8,%ecx
   10e4c:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%rsp)
   10e53:	00 
   10e54:	88 44 24 40          	mov    %al,0x40(%rsp)
   10e58:	89 c2                	mov    %eax,%edx
   10e5a:	c1 ea 18             	shr    $0x18,%edx
   10e5d:	88 54 24 43          	mov    %dl,0x43(%rsp)
   10e61:	66 89 4c 24 41       	mov    %cx,0x41(%rsp)
   10e66:	89 44 24 44          	mov    %eax,0x44(%rsp)
   10e6a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   10e6f:	be 00 00 00 80       	mov    $0x80000000,%esi
   10e74:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10e79:	b9 00 00 80 3e       	mov    $0x3e800000,%ecx
   10e7e:	e8 8d 7e 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   10e83:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   10e88:	75 07                	jne    10e91 <hyperinterval_strict_chain32+0x161>
   10e8a:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   10e8f:	eb 4c                	jmp    10edd <hyperinterval_strict_chain32+0x1ad>
   10e91:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   10e96:	89 c1                	mov    %eax,%ecx
   10e98:	c1 e9 08             	shr    $0x8,%ecx
   10e9b:	c7 44 24 30 01 00 00 	movl   $0x1,0x30(%rsp)
   10ea2:	00 
   10ea3:	88 44 24 34          	mov    %al,0x34(%rsp)
   10ea7:	89 c2                	mov    %eax,%edx
   10ea9:	c1 ea 18             	shr    $0x18,%edx
   10eac:	88 54 24 37          	mov    %dl,0x37(%rsp)
   10eb0:	66 89 4c 24 35       	mov    %cx,0x35(%rsp)
   10eb5:	89 44 24 38          	mov    %eax,0x38(%rsp)
   10eb9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   10ebe:	48 8d 74 24 58       	lea    0x58(%rsp),%rsi
   10ec3:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   10ec8:	31 c9                	xor    %ecx,%ecx
   10eca:	e8 81 7e 00 00       	call   18d50 <<hyperinterval::float::F32Enclosure>::corner_image>
   10ecf:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   10ed3:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   10ed8:	83 f9 02             	cmp    $0x2,%ecx
   10edb:	75 11                	jne    10eee <hyperinterval_strict_chain32+0x1be>
   10edd:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   10ee1:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   10ee6:	88 43 04             	mov    %al,0x4(%rbx)
   10ee9:	e9 ab fe ff ff       	jmp    10d99 <hyperinterval_strict_chain32+0x69>
   10eee:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   10ef2:	8b 74 24 10          	mov    0x10(%rsp),%esi
   10ef6:	89 74 24 50          	mov    %esi,0x50(%rsp)
   10efa:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   10efe:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   10f02:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   10f06:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   10f0b:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   10f10:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   10f15:	e8 f6 97 00 00       	call   1a710 <<hyperinterval::float::F32Enclosure>::add>
   10f1a:	8b 4c 24 18          	mov    0x18(%rsp),%ecx
   10f1e:	0f b6 44 24 1c       	movzbl 0x1c(%rsp),%eax
   10f23:	83 f9 02             	cmp    $0x2,%ecx
   10f26:	74 be                	je     10ee6 <hyperinterval_strict_chain32+0x1b6>
   10f28:	8b 54 24 1d          	mov    0x1d(%rsp),%edx
   10f2c:	8b 74 24 20          	mov    0x20(%rsp),%esi
   10f30:	89 74 24 44          	mov    %esi,0x44(%rsp)
   10f34:	89 54 24 41          	mov    %edx,0x41(%rsp)
   10f38:	89 4c 24 3c          	mov    %ecx,0x3c(%rsp)
   10f3c:	88 44 24 40          	mov    %al,0x40(%rsp)
   10f40:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
   10f45:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   10f4a:	e8 31 8c 00 00       	call   19b80 <<hyperinterval::float::F32Enclosure>::square>
   10f4f:	8b 4c 24 24          	mov    0x24(%rsp),%ecx
   10f53:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   10f58:	83 f9 02             	cmp    $0x2,%ecx
   10f5b:	74 89                	je     10ee6 <hyperinterval_strict_chain32+0x1b6>
   10f5d:	8b 54 24 29          	mov    0x29(%rsp),%edx
   10f61:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
   10f65:	89 74 24 20          	mov    %esi,0x20(%rsp)
   10f69:	89 54 24 1d          	mov    %edx,0x1d(%rsp)
   10f6d:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
   10f71:	88 44 24 1c          	mov    %al,0x1c(%rsp)
   10f75:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   10f7a:	be 00 00 00 80       	mov    $0x80000000,%esi
   10f7f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   10f84:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   10f89:	e8 82 7d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   10f8e:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   10f93:	0f 84 9f fe ff ff    	je     10e38 <hyperinterval_strict_chain32+0x108>
   10f99:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   10f9e:	89 c1                	mov    %eax,%ecx
   10fa0:	c1 e9 08             	shr    $0x8,%ecx
   10fa3:	89 c2                	mov    %eax,%edx
   10fa5:	c1 ea 18             	shr    $0x18,%edx
   10fa8:	88 54 24 37          	mov    %dl,0x37(%rsp)
   10fac:	66 89 4c 24 35       	mov    %cx,0x35(%rsp)
   10fb1:	89 44 24 38          	mov    %eax,0x38(%rsp)
   10fb5:	c7 44 24 30 01 00 00 	movl   $0x1,0x30(%rsp)
   10fbc:	00 
   10fbd:	88 44 24 34          	mov    %al,0x34(%rsp)
   10fc1:	48 8d 7c 24 64       	lea    0x64(%rsp),%rdi
   10fc6:	48 8d 74 24 18       	lea    0x18(%rsp),%rsi
   10fcb:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
   10fd0:	e8 3b 97 00 00       	call   1a710 <<hyperinterval::float::F32Enclosure>::add>
   10fd5:	8b 44 24 64          	mov    0x64(%rsp),%eax
   10fd9:	0f b6 4c 24 68       	movzbl 0x68(%rsp),%ecx
   10fde:	83 f8 02             	cmp    $0x2,%eax
   10fe1:	0f 84 03 fe ff ff    	je     10dea <hyperinterval_strict_chain32+0xba>
   10fe7:	8b 54 24 69          	mov    0x69(%rsp),%edx
   10feb:	8b 74 24 6c          	mov    0x6c(%rsp),%esi
   10fef:	89 74 24 2c          	mov    %esi,0x2c(%rsp)
   10ff3:	89 54 24 29          	mov    %edx,0x29(%rsp)
   10ff7:	89 44 24 24          	mov    %eax,0x24(%rsp)
   10ffb:	88 4c 24 28          	mov    %cl,0x28(%rsp)
   10fff:	85 c0                	test   %eax,%eax
   11001:	0f 84 e9 00 00 00    	je     110f0 <hyperinterval_strict_chain32+0x3c0>
   11007:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1100c:	be 00 00 00 80       	mov    $0x80000000,%esi
   11011:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11016:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   1101b:	e8 f0 7c 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11020:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11025:	0f 84 66 fd ff ff    	je     10d91 <hyperinterval_strict_chain32+0x61>
   1102b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   11030:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11035:	be 00 00 00 80       	mov    $0x80000000,%esi
   1103a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1103f:	b9 00 00 80 3f       	mov    $0x3f800000,%ecx
   11044:	e8 c7 7c 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11049:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1104e:	0f 84 3d fd ff ff    	je     10d91 <hyperinterval_strict_chain32+0x61>
   11054:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11058:	44 89 f9             	mov    %r15d,%ecx
   1105b:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11061:	89 c2                	mov    %eax,%edx
   11063:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11069:	be 00 00 00 80       	mov    $0x80000000,%esi
   1106e:	29 ce                	sub    %ecx,%esi
   11070:	44 09 f1             	or     %r14d,%ecx
   11073:	45 85 ff             	test   %r15d,%r15d
   11076:	48 0f 49 f1          	cmovns %rcx,%rsi
   1107a:	89 d1                	mov    %edx,%ecx
   1107c:	44 09 f1             	or     %r14d,%ecx
   1107f:	41 29 d6             	sub    %edx,%r14d
   11082:	85 c0                	test   %eax,%eax
   11084:	4c 0f 49 f1          	cmovns %rcx,%r14
   11088:	b1 01                	mov    $0x1,%cl
   1108a:	44 39 f6             	cmp    %r14d,%esi
   1108d:	0f 87 57 fd ff ff    	ja     10dea <hyperinterval_strict_chain32+0xba>
   11093:	44 89 f9             	mov    %r15d,%ecx
   11096:	c1 e9 08             	shr    $0x8,%ecx
   11099:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%rsp)
   110a0:	00 
   110a1:	44 88 7c 24 4c       	mov    %r15b,0x4c(%rsp)
   110a6:	41 c1 ef 18          	shr    $0x18,%r15d
   110aa:	44 88 7c 24 4f       	mov    %r15b,0x4f(%rsp)
   110af:	66 89 4c 24 4d       	mov    %cx,0x4d(%rsp)
   110b4:	89 44 24 50          	mov    %eax,0x50(%rsp)
   110b8:	83 7c 24 28 00       	cmpl   $0x0,0x28(%rsp)
   110bd:	7f 15                	jg     110d4 <hyperinterval_strict_chain32+0x3a4>
   110bf:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
   110c3:	85 c0                	test   %eax,%eax
   110c5:	0f 99 c1             	setns  %cl
   110c8:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   110cd:	0f 94 c0             	sete   %al
   110d0:	08 c8                	or     %cl,%al
   110d2:	75 27                	jne    110fb <hyperinterval_strict_chain32+0x3cb>
   110d4:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   110d9:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   110de:	48 89 df             	mov    %rbx,%rdi
   110e1:	b9 01 00 00 00       	mov    $0x1,%ecx
   110e6:	e8 65 7c 00 00       	call   18d50 <<hyperinterval::float::F32Enclosure>::corner_image>
   110eb:	e9 af fc ff ff       	jmp    10d9f <hyperinterval_strict_chain32+0x6f>
   110f0:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   110f6:	e9 a4 fc ff ff       	jmp    10d9f <hyperinterval_strict_chain32+0x6f>
   110fb:	c6 43 04 04          	movb   $0x4,0x4(%rbx)
   110ff:	e9 95 fc ff ff       	jmp    10d99 <hyperinterval_strict_chain32+0x69>
   11104:	cc                   	int3
   11105:	cc                   	int3
   11106:	cc                   	int3
   11107:	cc                   	int3
   11108:	cc                   	int3
   11109:	cc                   	int3
   1110a:	cc                   	int3
   1110b:	cc                   	int3
   1110c:	cc                   	int3
   1110d:	cc                   	int3
   1110e:	cc                   	int3
   1110f:	cc                   	int3

hyperinterval_strict_chain64:
   11110:	55                   	push   %rbp
   11111:	41 57                	push   %r15
   11113:	41 56                	push   %r14
   11115:	41 55                	push   %r13
   11117:	41 54                	push   %r12
   11119:	53                   	push   %rbx
   1111a:	48 81 ec c8 00 00 00 	sub    $0xc8,%rsp
   11121:	f2 0f 11 8c 24 a8 00 	movsd  %xmm1,0xa8(%rsp)
   11128:	00 00 
   1112a:	48 89 fb             	mov    %rdi,%rbx
   1112d:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   11134:	00 00 80 
   11137:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1113e:	00 f0 7f 
   11141:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   11146:	48 89 e7             	mov    %rsp,%rdi
   11149:	4c 89 f6             	mov    %r14,%rsi
   1114c:	4c 89 fa             	mov    %r15,%rdx
   1114f:	e8 bc 7b 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11154:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11158:	74 27                	je     11181 <hyperinterval_strict_chain64+0x71>
   1115a:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1115f:	f3 0f 7e 84 24 a8 00 	movq   0xa8(%rsp),%xmm0
   11166:	00 00 
   11168:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1116d:	48 89 e7             	mov    %rsp,%rdi
   11170:	4c 89 f6             	mov    %r14,%rsi
   11173:	4c 89 fa             	mov    %r15,%rdx
   11176:	e8 95 7b 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1117b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1117f:	75 24                	jne    111a5 <hyperinterval_strict_chain64+0x95>
   11181:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   11186:	88 4b 08             	mov    %cl,0x8(%rbx)
   11189:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   11190:	48 89 d8             	mov    %rbx,%rax
   11193:	48 81 c4 c8 00 00 00 	add    $0xc8,%rsp
   1119a:	5b                   	pop    %rbx
   1119b:	41 5c                	pop    %r12
   1119d:	41 5d                	pop    %r13
   1119f:	41 5e                	pop    %r14
   111a1:	41 5f                	pop    %r15
   111a3:	5d                   	pop    %rbp
   111a4:	c3                   	ret
   111a5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   111aa:	4b 8d 0c 34          	lea    (%r12,%r14,1),%rcx
   111ae:	4d 8d 6e ff          	lea    -0x1(%r14),%r13
   111b2:	4c 89 e2             	mov    %r12,%rdx
   111b5:	4c 21 ea             	and    %r13,%rdx
   111b8:	4c 89 f6             	mov    %r14,%rsi
   111bb:	48 29 d6             	sub    %rdx,%rsi
   111be:	4d 85 e4             	test   %r12,%r12
   111c1:	48 0f 49 f1          	cmovns %rcx,%rsi
   111c5:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   111c9:	48 89 c2             	mov    %rax,%rdx
   111cc:	4c 21 ea             	and    %r13,%rdx
   111cf:	4c 89 f7             	mov    %r14,%rdi
   111d2:	48 29 d7             	sub    %rdx,%rdi
   111d5:	48 85 c0             	test   %rax,%rax
   111d8:	48 0f 49 f9          	cmovns %rcx,%rdi
   111dc:	b1 01                	mov    $0x1,%cl
   111de:	48 39 fe             	cmp    %rdi,%rsi
   111e1:	76 05                	jbe    111e8 <hyperinterval_strict_chain64+0xd8>
   111e3:	88 4b 08             	mov    %cl,0x8(%rbx)
   111e6:	eb a1                	jmp    11189 <hyperinterval_strict_chain64+0x79>
   111e8:	44 89 e1             	mov    %r12d,%ecx
   111eb:	4c 89 e2             	mov    %r12,%rdx
   111ee:	48 c1 ea 08          	shr    $0x8,%rdx
   111f2:	4c 89 e6             	mov    %r12,%rsi
   111f5:	48 c1 ee 38          	shr    $0x38,%rsi
   111f9:	40 88 b4 24 9f 00 00 	mov    %sil,0x9f(%rsp)
   11200:	00 
   11201:	49 c1 ec 28          	shr    $0x28,%r12
   11205:	66 44 89 a4 24 9d 00 	mov    %r12w,0x9d(%rsp)
   1120c:	00 00 
   1120e:	89 94 24 99 00 00 00 	mov    %edx,0x99(%rsp)
   11215:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
   1121c:	00 
   1121d:	48 c7 84 24 90 00 00 	movq   $0x1,0x90(%rsp)
   11224:	00 01 00 00 00 
   11229:	88 8c 24 98 00 00 00 	mov    %cl,0x98(%rsp)
   11230:	48 89 e7             	mov    %rsp,%rdi
   11233:	48 b9 00 00 00 00 00 	movabs $0xbfe0000000000000,%rcx
   1123a:	00 e0 bf 
   1123d:	4c 89 f6             	mov    %r14,%rsi
   11240:	4c 89 fa             	mov    %r15,%rdx
   11243:	e8 c8 7a 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11248:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1124c:	75 0a                	jne    11258 <hyperinterval_strict_chain64+0x148>
   1124e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11253:	e9 8a 00 00 00       	jmp    112e2 <hyperinterval_strict_chain64+0x1d2>
   11258:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1125d:	48 c7 44 24 60 01 00 	movq   $0x1,0x60(%rsp)
   11264:	00 00 
   11266:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1126b:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
   11270:	48 89 e7             	mov    %rsp,%rdi
   11273:	48 b9 00 00 00 00 00 	movabs $0x3fd0000000000000,%rcx
   1127a:	00 d0 3f 
   1127d:	4c 89 f6             	mov    %r14,%rsi
   11280:	4c 89 fa             	mov    %r15,%rdx
   11283:	e8 88 7a 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11288:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1128c:	75 07                	jne    11295 <hyperinterval_strict_chain64+0x185>
   1128e:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11293:	eb 44                	jmp    112d9 <hyperinterval_strict_chain64+0x1c9>
   11295:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1129a:	48 c7 44 24 78 01 00 	movq   $0x1,0x78(%rsp)
   112a1:	00 00 
   112a3:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
   112aa:	00 
   112ab:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
   112b2:	00 
   112b3:	48 89 e7             	mov    %rsp,%rdi
   112b6:	48 8d b4 24 90 00 00 	lea    0x90(%rsp),%rsi
   112bd:	00 
   112be:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
   112c3:	31 c9                	xor    %ecx,%ecx
   112c5:	e8 a6 9a 00 00       	call   1ad70 <<hyperinterval::float::F64Enclosure>::corner_image>
   112ca:	48 8b 0c 24          	mov    (%rsp),%rcx
   112ce:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   112d3:	48 83 f9 02          	cmp    $0x2,%rcx
   112d7:	75 11                	jne    112ea <hyperinterval_strict_chain64+0x1da>
   112d9:	88 44 24 20          	mov    %al,0x20(%rsp)
   112dd:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   112e2:	88 43 08             	mov    %al,0x8(%rbx)
   112e5:	e9 9f fe ff ff       	jmp    11189 <hyperinterval_strict_chain64+0x79>
   112ea:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   112ef:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   112f4:	48 89 74 24 58       	mov    %rsi,0x58(%rsp)
   112f9:	48 89 54 24 51       	mov    %rdx,0x51(%rsp)
   112fe:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
   11303:	88 44 24 50          	mov    %al,0x50(%rsp)
   11307:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1130c:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   11311:	48 8d 54 24 78       	lea    0x78(%rsp),%rdx
   11316:	e8 75 a9 00 00       	call   1bc90 <<hyperinterval::float::F64Enclosure>::add>
   1131b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
   11320:	0f b6 44 24 20       	movzbl 0x20(%rsp),%eax
   11325:	48 83 f9 02          	cmp    $0x2,%rcx
   11329:	74 b7                	je     112e2 <hyperinterval_strict_chain64+0x1d2>
   1132b:	48 8b 54 24 21       	mov    0x21(%rsp),%rdx
   11330:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
   11335:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   1133c:	00 
   1133d:	48 89 94 24 81 00 00 	mov    %rdx,0x81(%rsp)
   11344:	00 
   11345:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
   1134a:	88 84 24 80 00 00 00 	mov    %al,0x80(%rsp)
   11351:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   11356:	48 8d 74 24 78       	lea    0x78(%rsp),%rsi
   1135b:	e8 70 a1 00 00       	call   1b4d0 <<hyperinterval::float::F64Enclosure>::square>
   11360:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   11365:	0f b6 44 24 38       	movzbl 0x38(%rsp),%eax
   1136a:	48 83 f9 02          	cmp    $0x2,%rcx
   1136e:	0f 84 6e ff ff ff    	je     112e2 <hyperinterval_strict_chain64+0x1d2>
   11374:	49 bc 00 00 00 00 00 	movabs $0x3ff0000000000000,%r12
   1137b:	00 f0 3f 
   1137e:	48 8b 54 24 39       	mov    0x39(%rsp),%rdx
   11383:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
   11388:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
   1138d:	48 89 54 24 69       	mov    %rdx,0x69(%rsp)
   11392:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
   11397:	88 44 24 68          	mov    %al,0x68(%rsp)
   1139b:	48 89 e7             	mov    %rsp,%rdi
   1139e:	4c 89 f6             	mov    %r14,%rsi
   113a1:	4c 89 fa             	mov    %r15,%rdx
   113a4:	4c 89 e1             	mov    %r12,%rcx
   113a7:	e8 64 79 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   113ac:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   113b0:	0f 84 98 fe ff ff    	je     1124e <hyperinterval_strict_chain64+0x13e>
   113b6:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   113bb:	48 89 c1             	mov    %rax,%rcx
   113be:	48 c1 e9 08          	shr    $0x8,%rcx
   113c2:	48 89 c2             	mov    %rax,%rdx
   113c5:	48 c1 ea 38          	shr    $0x38,%rdx
   113c9:	88 54 24 57          	mov    %dl,0x57(%rsp)
   113cd:	48 89 c2             	mov    %rax,%rdx
   113d0:	48 c1 ea 28          	shr    $0x28,%rdx
   113d4:	66 89 54 24 55       	mov    %dx,0x55(%rsp)
   113d9:	89 4c 24 51          	mov    %ecx,0x51(%rsp)
   113dd:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   113e2:	48 c7 44 24 48 01 00 	movq   $0x1,0x48(%rsp)
   113e9:	00 00 
   113eb:	88 44 24 50          	mov    %al,0x50(%rsp)
   113ef:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
   113f6:	00 
   113f7:	48 8d 74 24 60       	lea    0x60(%rsp),%rsi
   113fc:	48 8d 54 24 48       	lea    0x48(%rsp),%rdx
   11401:	e8 8a a8 00 00       	call   1bc90 <<hyperinterval::float::F64Enclosure>::add>
   11406:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
   1140d:	00 
   1140e:	0f b6 8c 24 b8 00 00 	movzbl 0xb8(%rsp),%ecx
   11415:	00 
   11416:	48 83 f8 02          	cmp    $0x2,%rax
   1141a:	0f 84 c3 fd ff ff    	je     111e3 <hyperinterval_strict_chain64+0xd3>
   11420:	48 8b 94 24 b9 00 00 	mov    0xb9(%rsp),%rdx
   11427:	00 
   11428:	48 8b b4 24 c0 00 00 	mov    0xc0(%rsp),%rsi
   1142f:	00 
   11430:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
   11435:	48 89 54 24 21       	mov    %rdx,0x21(%rsp)
   1143a:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
   1143f:	88 4c 24 20          	mov    %cl,0x20(%rsp)
   11443:	48 85 c0             	test   %rax,%rax
   11446:	74 46                	je     1148e <hyperinterval_strict_chain64+0x37e>
   11448:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1144d:	4c 89 f6             	mov    %r14,%rsi
   11450:	4c 89 fa             	mov    %r15,%rdx
   11453:	4c 89 e1             	mov    %r12,%rcx
   11456:	e8 b5 78 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1145b:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   11460:	74 1f                	je     11481 <hyperinterval_strict_chain64+0x371>
   11462:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
   11467:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1146c:	4c 89 f6             	mov    %r14,%rsi
   1146f:	4c 89 fa             	mov    %r15,%rdx
   11472:	4c 89 e1             	mov    %r12,%rcx
   11475:	e8 96 78 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1147a:	80 7c 24 30 01       	cmpb   $0x1,0x30(%rsp)
   1147f:	75 19                	jne    1149a <hyperinterval_strict_chain64+0x38a>
   11481:	0f b6 4c 24 31       	movzbl 0x31(%rsp),%ecx
   11486:	88 4b 08             	mov    %cl,0x8(%rbx)
   11489:	e9 fb fc ff ff       	jmp    11189 <hyperinterval_strict_chain64+0x79>
   1148e:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   11495:	e9 f6 fc ff ff       	jmp    11190 <hyperinterval_strict_chain64+0x80>
   1149a:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1149f:	49 8d 0c 2e          	lea    (%r14,%rbp,1),%rcx
   114a3:	48 89 ea             	mov    %rbp,%rdx
   114a6:	4c 21 ea             	and    %r13,%rdx
   114a9:	4c 89 f6             	mov    %r14,%rsi
   114ac:	48 29 d6             	sub    %rdx,%rsi
   114af:	48 85 ed             	test   %rbp,%rbp
   114b2:	48 0f 49 f1          	cmovns %rcx,%rsi
   114b6:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   114ba:	48 89 c2             	mov    %rax,%rdx
   114bd:	4c 21 ea             	and    %r13,%rdx
   114c0:	49 29 d6             	sub    %rdx,%r14
   114c3:	48 85 c0             	test   %rax,%rax
   114c6:	4c 0f 49 f1          	cmovns %rcx,%r14
   114ca:	b1 01                	mov    $0x1,%cl
   114cc:	4c 39 f6             	cmp    %r14,%rsi
   114cf:	0f 87 0e fd ff ff    	ja     111e3 <hyperinterval_strict_chain64+0xd3>
   114d5:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   114dc:	00 
   114dd:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
   114e2:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   114e7:	48 83 7c 24 20 00    	cmpq   $0x0,0x20(%rsp)
   114ed:	7f 0f                	jg     114fe <hyperinterval_strict_chain64+0x3ee>
   114ef:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   114f4:	48 85 c0             	test   %rax,%rax
   114f7:	79 1f                	jns    11518 <hyperinterval_strict_chain64+0x408>
   114f9:	4c 21 e8             	and    %r13,%rax
   114fc:	74 1a                	je     11518 <hyperinterval_strict_chain64+0x408>
   114fe:	48 89 e6             	mov    %rsp,%rsi
   11501:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
   11506:	48 89 df             	mov    %rbx,%rdi
   11509:	b9 01 00 00 00       	mov    $0x1,%ecx
   1150e:	e8 5d 98 00 00       	call   1ad70 <<hyperinterval::float::F64Enclosure>::corner_image>
   11513:	e9 78 fc ff ff       	jmp    11190 <hyperinterval_strict_chain64+0x80>
   11518:	c6 43 08 04          	movb   $0x4,0x8(%rbx)
   1151c:	e9 68 fc ff ff       	jmp    11189 <hyperinterval_strict_chain64+0x79>
   11521:	cc                   	int3
   11522:	cc                   	int3
   11523:	cc                   	int3
   11524:	cc                   	int3
   11525:	cc                   	int3
   11526:	cc                   	int3
   11527:	cc                   	int3
   11528:	cc                   	int3
   11529:	cc                   	int3
   1152a:	cc                   	int3
   1152b:	cc                   	int3
   1152c:	cc                   	int3
   1152d:	cc                   	int3
   1152e:	cc                   	int3
   1152f:	cc                   	int3

hyperinterval_strict_surface32:
   11530:	55                   	push   %rbp
   11531:	41 57                	push   %r15
   11533:	41 56                	push   %r14
   11535:	41 55                	push   %r13
   11537:	41 54                	push   %r12
   11539:	53                   	push   %rbx
   1153a:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
   11541:	41 89 f7             	mov    %esi,%r15d
   11544:	66 0f 7e 4c 24 60    	movd   %xmm1,0x60(%rsp)
   1154a:	48 89 fd             	mov    %rdi,%rbp
   1154d:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   11553:	66 0f 7e 44 24 74    	movd   %xmm0,0x74(%rsp)
   11559:	66 0f 7e c3          	movd   %xmm0,%ebx
   1155d:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11562:	be 00 00 00 80       	mov    $0x80000000,%esi
   11567:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1156c:	48 89 d9             	mov    %rbx,%rcx
   1156f:	e8 9c 77 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11574:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11579:	74 2e                	je     115a9 <hyperinterval_strict_surface32+0x79>
   1157b:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   11580:	66 0f 6e 44 24 60    	movd   0x60(%rsp),%xmm0
   11586:	66 41 0f 7e c6       	movd   %xmm0,%r14d
   1158b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11590:	be 00 00 00 80       	mov    $0x80000000,%esi
   11595:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1159a:	4c 89 f1             	mov    %r14,%rcx
   1159d:	e8 6e 77 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   115a2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   115a7:	75 24                	jne    115cd <hyperinterval_strict_surface32+0x9d>
   115a9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   115ae:	88 45 04             	mov    %al,0x4(%rbp)
   115b1:	c7 45 00 02 00 00 00 	movl   $0x2,0x0(%rbp)
   115b8:	48 89 e8             	mov    %rbp,%rax
   115bb:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
   115c2:	5b                   	pop    %rbx
   115c3:	41 5c                	pop    %r12
   115c5:	41 5d                	pop    %r13
   115c7:	41 5e                	pop    %r14
   115c9:	41 5f                	pop    %r15
   115cb:	5d                   	pop    %rbp
   115cc:	c3                   	ret
   115cd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   115d2:	44 89 e0             	mov    %r12d,%eax
   115d5:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   115da:	89 f9                	mov    %edi,%ecx
   115dc:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   115e2:	ba 00 00 00 80       	mov    $0x80000000,%edx
   115e7:	29 c2                	sub    %eax,%edx
   115e9:	44 09 e8             	or     %r13d,%eax
   115ec:	45 85 e4             	test   %r12d,%r12d
   115ef:	48 0f 49 d0          	cmovns %rax,%rdx
   115f3:	be 00 00 00 80       	mov    $0x80000000,%esi
   115f8:	29 ce                	sub    %ecx,%esi
   115fa:	89 c8                	mov    %ecx,%eax
   115fc:	44 09 e8             	or     %r13d,%eax
   115ff:	85 ff                	test   %edi,%edi
   11601:	48 0f 49 f0          	cmovns %rax,%rsi
   11605:	b0 01                	mov    $0x1,%al
   11607:	39 f2                	cmp    %esi,%edx
   11609:	77 a3                	ja     115ae <hyperinterval_strict_surface32+0x7e>
   1160b:	44 89 e0             	mov    %r12d,%eax
   1160e:	44 89 e1             	mov    %r12d,%ecx
   11611:	c1 e9 08             	shr    $0x8,%ecx
   11614:	41 c1 ec 18          	shr    $0x18,%r12d
   11618:	44 88 64 24 5b       	mov    %r12b,0x5b(%rsp)
   1161d:	66 89 4c 24 59       	mov    %cx,0x59(%rsp)
   11622:	49 89 fc             	mov    %rdi,%r12
   11625:	89 7c 24 5c          	mov    %edi,0x5c(%rsp)
   11629:	c7 44 24 54 01 00 00 	movl   $0x1,0x54(%rsp)
   11630:	00 
   11631:	88 44 24 58          	mov    %al,0x58(%rsp)
   11635:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1163a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1163f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11644:	48 89 d9             	mov    %rbx,%rcx
   11647:	e8 c4 76 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1164c:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11651:	75 12                	jne    11665 <hyperinterval_strict_surface32+0x135>
   11653:	0f b6 5c 24 09       	movzbl 0x9(%rsp),%ebx
   11658:	c1 e3 08             	shl    $0x8,%ebx
   1165b:	48 ff c3             	inc    %rbx
   1165e:	f6 c3 01             	test   $0x1,%bl
   11661:	75 61                	jne    116c4 <hyperinterval_strict_surface32+0x194>
   11663:	eb 67                	jmp    116cc <hyperinterval_strict_surface32+0x19c>
   11665:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1166a:	48 89 c1             	mov    %rax,%rcx
   1166d:	4c 31 e9             	xor    %r13,%rcx
   11670:	48 85 c0             	test   %rax,%rax
   11673:	48 0f 44 c8          	cmove  %rax,%rcx
   11677:	31 c0                	xor    %eax,%eax
   11679:	85 c9                	test   %ecx,%ecx
   1167b:	0f 99 c0             	setns  %al
   1167e:	48 8d 4c 41 ff       	lea    -0x1(%rcx,%rax,2),%rcx
   11683:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11688:	be 00 00 00 80       	mov    $0x80000000,%esi
   1168d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11692:	e8 79 76 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11697:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1169c:	75 07                	jne    116a5 <hyperinterval_strict_surface32+0x175>
   1169e:	bb 01 03 00 00       	mov    $0x301,%ebx
   116a3:	eb 1f                	jmp    116c4 <hyperinterval_strict_surface32+0x194>
   116a5:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   116aa:	48 89 c3             	mov    %rax,%rbx
   116ad:	48 81 f3 00 00 00 80 	xor    $0xffffffff80000000,%rbx
   116b4:	48 c1 e3 20          	shl    $0x20,%rbx
   116b8:	48 85 c0             	test   %rax,%rax
   116bb:	48 0f 44 d8          	cmove  %rax,%rbx
   116bf:	f6 c3 01             	test   $0x1,%bl
   116c2:	74 08                	je     116cc <hyperinterval_strict_surface32+0x19c>
   116c4:	88 7d 04             	mov    %bh,0x4(%rbp)
   116c7:	e9 e5 fe ff ff       	jmp    115b1 <hyperinterval_strict_surface32+0x81>
   116cc:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   116d1:	be 00 00 00 80       	mov    $0x80000000,%esi
   116d6:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   116db:	4c 89 f1             	mov    %r14,%rcx
   116de:	e8 2d 76 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   116e3:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   116e8:	75 11                	jne    116fb <hyperinterval_strict_surface32+0x1cb>
   116ea:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   116ef:	c1 e0 08             	shl    $0x8,%eax
   116f2:	48 ff c0             	inc    %rax
   116f5:	a8 01                	test   $0x1,%al
   116f7:	75 42                	jne    1173b <hyperinterval_strict_surface32+0x20b>
   116f9:	eb 48                	jmp    11743 <hyperinterval_strict_surface32+0x213>
   116fb:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11700:	31 c9                	xor    %ecx,%ecx
   11702:	85 c0                	test   %eax,%eax
   11704:	0f 99 c1             	setns  %cl
   11707:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   1170c:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11711:	be 00 00 00 80       	mov    $0x80000000,%esi
   11716:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1171b:	e8 f0 75 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11720:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11725:	75 07                	jne    1172e <hyperinterval_strict_surface32+0x1fe>
   11727:	b8 01 03 00 00       	mov    $0x301,%eax
   1172c:	eb 0d                	jmp    1173b <hyperinterval_strict_surface32+0x20b>
   1172e:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11733:	48 c1 e0 20          	shl    $0x20,%rax
   11737:	a8 01                	test   $0x1,%al
   11739:	74 08                	je     11743 <hyperinterval_strict_surface32+0x213>
   1173b:	88 65 04             	mov    %ah,0x4(%rbp)
   1173e:	e9 6e fe ff ff       	jmp    115b1 <hyperinterval_strict_surface32+0x81>
   11743:	49 89 c6             	mov    %rax,%r14
   11746:	48 c1 eb 20          	shr    $0x20,%rbx
   1174a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1174f:	be 00 00 00 80       	mov    $0x80000000,%esi
   11754:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11759:	48 89 d9             	mov    %rbx,%rcx
   1175c:	e8 af 75 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11761:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11766:	74 27                	je     1178f <hyperinterval_strict_surface32+0x25f>
   11768:	4c 89 f1             	mov    %r14,%rcx
   1176b:	48 c1 e9 20          	shr    $0x20,%rcx
   1176f:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   11774:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11779:	be 00 00 00 80       	mov    $0x80000000,%esi
   1177e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11783:	e8 88 75 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11788:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1178d:	75 0d                	jne    1179c <hyperinterval_strict_surface32+0x26c>
   1178f:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   11794:	88 4d 04             	mov    %cl,0x4(%rbp)
   11797:	e9 15 fe ff ff       	jmp    115b1 <hyperinterval_strict_surface32+0x81>
   1179c:	8b 44 24 10          	mov    0x10(%rsp),%eax
   117a0:	89 d9                	mov    %ebx,%ecx
   117a2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   117a8:	89 c2                	mov    %eax,%edx
   117aa:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   117b0:	be 00 00 00 80       	mov    $0x80000000,%esi
   117b5:	29 ce                	sub    %ecx,%esi
   117b7:	44 09 e9             	or     %r13d,%ecx
   117ba:	85 db                	test   %ebx,%ebx
   117bc:	48 0f 49 f1          	cmovns %rcx,%rsi
   117c0:	bf 00 00 00 80       	mov    $0x80000000,%edi
   117c5:	29 d7                	sub    %edx,%edi
   117c7:	89 d1                	mov    %edx,%ecx
   117c9:	44 09 e9             	or     %r13d,%ecx
   117cc:	85 c0                	test   %eax,%eax
   117ce:	48 0f 49 f9          	cmovns %rcx,%rdi
   117d2:	b1 01                	mov    $0x1,%cl
   117d4:	39 fe                	cmp    %edi,%esi
   117d6:	77 bc                	ja     11794 <hyperinterval_strict_surface32+0x264>
   117d8:	89 d9                	mov    %ebx,%ecx
   117da:	89 da                	mov    %ebx,%edx
   117dc:	c1 ea 08             	shr    $0x8,%edx
   117df:	c1 eb 18             	shr    $0x18,%ebx
   117e2:	88 5c 24 6f          	mov    %bl,0x6f(%rsp)
   117e6:	66 89 54 24 6d       	mov    %dx,0x6d(%rsp)
   117eb:	89 44 24 70          	mov    %eax,0x70(%rsp)
   117ef:	c7 44 24 68 01 00 00 	movl   $0x1,0x68(%rsp)
   117f6:	00 
   117f7:	88 4c 24 6c          	mov    %cl,0x6c(%rsp)
   117fb:	41 83 ff 02          	cmp    $0x2,%r15d
   117ff:	0f 85 b2 00 00 00    	jne    118b7 <hyperinterval_strict_surface32+0x387>
   11805:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
   1180a:	48 8d 74 24 54       	lea    0x54(%rsp),%rsi
   1180f:	e8 6c 83 00 00       	call   19b80 <<hyperinterval::float::F32Enclosure>::square>
   11814:	8b 44 24 30          	mov    0x30(%rsp),%eax
   11818:	0f b6 4c 24 34       	movzbl 0x34(%rsp),%ecx
   1181d:	83 f8 02             	cmp    $0x2,%eax
   11820:	0f 84 6e ff ff ff    	je     11794 <hyperinterval_strict_surface32+0x264>
   11826:	45 31 ff             	xor    %r15d,%r15d
   11829:	a8 01                	test   $0x1,%al
   1182b:	0f 84 4a 01 00 00    	je     1197b <hyperinterval_strict_surface32+0x44b>
   11831:	0f b6 c1             	movzbl %cl,%eax
   11834:	0f b6 4c 24 37       	movzbl 0x37(%rsp),%ecx
   11839:	c1 e1 10             	shl    $0x10,%ecx
   1183c:	0f b7 54 24 35       	movzwl 0x35(%rsp),%edx
   11841:	09 ca                	or     %ecx,%edx
   11843:	8b 5c 24 38          	mov    0x38(%rsp),%ebx
   11847:	c1 e2 08             	shl    $0x8,%edx
   1184a:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   1184d:	85 c9                	test   %ecx,%ecx
   1184f:	8d 84 02 00 00 00 80 	lea    -0x80000000(%rdx,%rax,1),%eax
   11856:	0f 44 c1             	cmove  %ecx,%eax
   11859:	31 c9                	xor    %ecx,%ecx
   1185b:	85 c0                	test   %eax,%eax
   1185d:	0f 99 c1             	setns  %cl
   11860:	48 8d 4c 48 ff       	lea    -0x1(%rax,%rcx,2),%rcx
   11865:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1186a:	be 00 00 00 80       	mov    $0x80000000,%esi
   1186f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11874:	e8 97 74 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11879:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1187e:	74 30                	je     118b0 <hyperinterval_strict_surface32+0x380>
   11880:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   11885:	31 c0                	xor    %eax,%eax
   11887:	85 db                	test   %ebx,%ebx
   11889:	0f 99 c0             	setns  %al
   1188c:	48 8d 4c 43 ff       	lea    -0x1(%rbx,%rax,2),%rcx
   11891:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11896:	be 00 00 00 80       	mov    $0x80000000,%esi
   1189b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   118a0:	e8 6b 74 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   118a5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   118aa:	0f 85 d4 02 00 00    	jne    11b84 <hyperinterval_strict_surface32+0x654>
   118b0:	b1 03                	mov    $0x3,%cl
   118b2:	e9 dd fe ff ff       	jmp    11794 <hyperinterval_strict_surface32+0x264>
   118b7:	8b 4c 24 58          	mov    0x58(%rsp),%ecx
   118bb:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   118c0:	be 00 00 00 80       	mov    $0x80000000,%esi
   118c5:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   118ca:	45 89 f8             	mov    %r15d,%r8d
   118cd:	e8 ae 85 00 00       	call   19e80 <<hyperinterval::ieee::Format>::power>
   118d2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   118d7:	0f 84 b2 fe ff ff    	je     1178f <hyperinterval_strict_surface32+0x25f>
   118dd:	44 89 e1             	mov    %r12d,%ecx
   118e0:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   118e4:	44 8b 74 24 18       	mov    0x18(%rsp),%r14d
   118e9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   118ee:	be 00 00 00 80       	mov    $0x80000000,%esi
   118f3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   118f8:	45 89 f8             	mov    %r15d,%r8d
   118fb:	e8 80 85 00 00       	call   19e80 <<hyperinterval::ieee::Format>::power>
   11900:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11905:	0f 84 84 fe ff ff    	je     1178f <hyperinterval_strict_surface32+0x25f>
   1190b:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1190f:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   11914:	8b 44 24 18          	mov    0x18(%rsp),%eax
   11918:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   1191f:	00 
   11920:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11925:	be 00 00 00 80       	mov    $0x80000000,%esi
   1192a:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1192f:	48 89 d9             	mov    %rbx,%rcx
   11932:	e8 d9 73 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11937:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1193c:	74 27                	je     11965 <hyperinterval_strict_surface32+0x435>
   1193e:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   11943:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11948:	be 00 00 00 80       	mov    $0x80000000,%esi
   1194d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11952:	4c 89 f1             	mov    %r14,%rcx
   11955:	e8 b6 73 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1195a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1195f:	0f 85 c5 02 00 00    	jne    11c2a <hyperinterval_strict_surface32+0x6fa>
   11965:	0f b6 4c 24 09       	movzbl 0x9(%rsp),%ecx
   1196a:	88 4c 24 34          	mov    %cl,0x34(%rsp)
   1196e:	c7 44 24 30 02 00 00 	movl   $0x2,0x30(%rsp)
   11975:	00 
   11976:	e9 99 fe ff ff       	jmp    11814 <hyperinterval_strict_surface32+0x2e4>
   1197b:	31 d2                	xor    %edx,%edx
   1197d:	66 89 8c 24 89 00 00 	mov    %cx,0x89(%rsp)
   11984:	00 
   11985:	c1 e9 10             	shr    $0x10,%ecx
   11988:	88 8c 24 8b 00 00 00 	mov    %cl,0x8b(%rsp)
   1198f:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%rsp)
   11996:	89 94 24 84 00 00 00 	mov    %edx,0x84(%rsp)
   1199d:	44 88 b4 24 88 00 00 	mov    %r14b,0x88(%rsp)
   119a4:	00 
   119a5:	48 8d 9c 24 9c 00 00 	lea    0x9c(%rsp),%rbx
   119ac:	00 
   119ad:	48 8d b4 24 84 00 00 	lea    0x84(%rsp),%rsi
   119b4:	00 
   119b5:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   119ba:	48 89 df             	mov    %rbx,%rdi
   119bd:	e8 de 8a 00 00       	call   1a4a0 <<hyperinterval::float::F32Enclosure>::intersection>
   119c2:	4c 8d 74 24 78       	lea    0x78(%rsp),%r14
   119c7:	48 8d 54 24 54       	lea    0x54(%rsp),%rdx
   119cc:	4c 89 f7             	mov    %r14,%rdi
   119cf:	48 89 de             	mov    %rbx,%rsi
   119d2:	e8 b9 88 00 00       	call   1a290 <<hyperinterval::float::F32Enclosure>::hull>
   119d7:	4c 89 f7             	mov    %r14,%rdi
   119da:	e8 91 89 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::signs>
   119df:	8b 4c 24 78          	mov    0x78(%rsp),%ecx
   119e3:	83 f9 01             	cmp    $0x1,%ecx
   119e6:	75 20                	jne    11a08 <hyperinterval_strict_surface32+0x4d8>
   119e8:	8b 74 24 7c          	mov    0x7c(%rsp),%esi
   119ec:	8b bc 24 80 00 00 00 	mov    0x80(%rsp),%edi
   119f3:	39 fe                	cmp    %edi,%esi
   119f5:	0f 94 c2             	sete   %dl
   119f8:	66 0f 6e ce          	movd   %esi,%xmm1
   119fc:	66 0f 6e c7          	movd   %edi,%xmm0
   11a00:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   11a06:	eb 02                	jmp    11a0a <hyperinterval_strict_surface32+0x4da>
   11a08:	31 d2                	xor    %edx,%edx
   11a0a:	80 f1 01             	xor    $0x1,%cl
   11a0d:	44 89 7c 24 08       	mov    %r15d,0x8(%rsp)
   11a12:	66 0f 7e 4c 24 0c    	movd   %xmm1,0xc(%rsp)
   11a18:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   11a1c:	88 54 24 11          	mov    %dl,0x11(%rsp)
   11a20:	88 44 24 12          	mov    %al,0x12(%rsp)
   11a24:	44 89 7c 24 14       	mov    %r15d,0x14(%rsp)
   11a29:	66 0f 7e 44 24 18    	movd   %xmm0,0x18(%rsp)
   11a2f:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   11a34:	48 8d 7c 24 78       	lea    0x78(%rsp),%rdi
   11a39:	66 0f 6e 44 24 74    	movd   0x74(%rsp),%xmm0
   11a3f:	e8 6c 8b 00 00       	call   1a5b0 <<hyperinterval::float::F32Enclosure>::contains_point>
   11a44:	41 89 d6             	mov    %edx,%r14d
   11a47:	a8 01                	test   $0x1,%al
   11a49:	74 09                	je     11a54 <hyperinterval_strict_surface32+0x524>
   11a4b:	44 88 75 04          	mov    %r14b,0x4(%rbp)
   11a4f:	e9 5d fb ff ff       	jmp    115b1 <hyperinterval_strict_surface32+0x81>
   11a54:	4c 8d 6c 24 78       	lea    0x78(%rsp),%r13
   11a59:	4c 8d 7c 24 54       	lea    0x54(%rsp),%r15
   11a5e:	4c 89 ef             	mov    %r13,%rdi
   11a61:	4c 89 fe             	mov    %r15,%rsi
   11a64:	e8 b7 91 00 00       	call   1ac20 <<hyperinterval::float::F32Enclosure>::overlaps>
   11a69:	88 44 24 60          	mov    %al,0x60(%rsp)
   11a6d:	4c 89 ef             	mov    %r13,%rdi
   11a70:	4c 89 fe             	mov    %r15,%rsi
   11a73:	e8 f8 90 00 00       	call   1ab70 <<hyperinterval::float::F32Enclosure>::disjoint>
   11a78:	41 89 c7             	mov    %eax,%r15d
   11a7b:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   11a80:	4c 89 ef             	mov    %r13,%rdi
   11a83:	e8 e8 8b 00 00       	call   1a670 <<hyperinterval::float::F32Enclosure>::interior_subset_of>
   11a88:	89 c3                	mov    %eax,%ebx
   11a8a:	4c 89 ef             	mov    %r13,%rdi
   11a8d:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   11a92:	e8 39 92 00 00       	call   1acd0 <<hyperinterval::float::F32Enclosure>::subset_of>
   11a97:	88 44 24 08          	mov    %al,0x8(%rsp)
   11a9b:	88 5c 24 09          	mov    %bl,0x9(%rsp)
   11a9f:	44 88 7c 24 0a       	mov    %r15b,0xa(%rsp)
   11aa4:	0f b6 44 24 60       	movzbl 0x60(%rsp),%eax
   11aa9:	88 44 24 0b          	mov    %al,0xb(%rsp)
   11aad:	44 88 74 24 0c       	mov    %r14b,0xc(%rsp)
   11ab2:	48 8d 44 24 08       	lea    0x8(%rsp),%rax
   11ab7:	8b 44 24 58          	mov    0x58(%rsp),%eax
   11abb:	41 8d 8c 24 00 00 00 	lea    -0x80000000(%r12),%ecx
   11ac2:	80 
   11ac3:	45 85 e4             	test   %r12d,%r12d
   11ac6:	41 0f 44 cc          	cmove  %r12d,%ecx
   11aca:	8d 90 00 00 00 80    	lea    -0x80000000(%rax),%edx
   11ad0:	85 c0                	test   %eax,%eax
   11ad2:	0f 44 d0             	cmove  %eax,%edx
   11ad5:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%rsp)
   11adc:	00 
   11add:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   11ae1:	89 54 24 44          	mov    %edx,0x44(%rsp)
   11ae5:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11aea:	48 8d 54 24 3c       	lea    0x3c(%rsp),%rdx
   11aef:	4c 89 ee             	mov    %r13,%rsi
   11af2:	e8 29 90 00 00       	call   1ab20 <<hyperinterval::float::F32Enclosure>::sub>
   11af7:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   11afb:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   11b00:	83 f9 02             	cmp    $0x2,%ecx
   11b03:	0f 84 a5 fa ff ff    	je     115ae <hyperinterval_strict_surface32+0x7e>
   11b09:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   11b0d:	8b 74 24 10          	mov    0x10(%rsp),%esi
   11b11:	89 74 24 50          	mov    %esi,0x50(%rsp)
   11b15:	89 54 24 4d          	mov    %edx,0x4d(%rsp)
   11b19:	89 4c 24 48          	mov    %ecx,0x48(%rsp)
   11b1d:	88 44 24 4c          	mov    %al,0x4c(%rsp)
   11b21:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11b26:	be 00 00 00 80       	mov    $0x80000000,%esi
   11b2b:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11b30:	b9 00 00 00 40       	mov    $0x40000000,%ecx
   11b35:	e8 d6 71 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11b3a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11b3f:	0f 84 64 fa ff ff    	je     115a9 <hyperinterval_strict_surface32+0x79>
   11b45:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   11b4a:	89 c1                	mov    %eax,%ecx
   11b4c:	c1 e9 08             	shr    $0x8,%ecx
   11b4f:	89 c2                	mov    %eax,%edx
   11b51:	c1 ea 18             	shr    $0x18,%edx
   11b54:	88 54 24 2b          	mov    %dl,0x2b(%rsp)
   11b58:	66 89 4c 24 29       	mov    %cx,0x29(%rsp)
   11b5d:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   11b61:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%rsp)
   11b68:	00 
   11b69:	88 44 24 28          	mov    %al,0x28(%rsp)
   11b6d:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   11b72:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   11b77:	48 89 ef             	mov    %rbp,%rdi
   11b7a:	e8 61 8f 00 00       	call   1aae0 <<hyperinterval::float::F32Enclosure>::div>
   11b7f:	e9 34 fa ff ff       	jmp    115b8 <hyperinterval_strict_surface32+0x88>
   11b84:	44 89 f1             	mov    %r14d,%ecx
   11b87:	4c 31 e9             	xor    %r13,%rcx
   11b8a:	4d 85 f6             	test   %r14,%r14
   11b8d:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
   11b91:	49 0f 44 ce          	cmove  %r14,%rcx
   11b95:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11b9a:	be 00 00 00 80       	mov    $0x80000000,%esi
   11b9f:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11ba4:	e8 67 71 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11ba9:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11bae:	0f 84 db fb ff ff    	je     1178f <hyperinterval_strict_surface32+0x25f>
   11bb4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   11bb9:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11bbe:	be 00 00 00 80       	mov    $0x80000000,%esi
   11bc3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11bc8:	48 89 d9             	mov    %rbx,%rcx
   11bcb:	e8 40 71 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11bd0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11bd5:	0f 84 b4 fb ff ff    	je     1178f <hyperinterval_strict_surface32+0x25f>
   11bdb:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11bdf:	44 89 f1             	mov    %r14d,%ecx
   11be2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11be8:	89 c2                	mov    %eax,%edx
   11bea:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11bf0:	be 00 00 00 80       	mov    $0x80000000,%esi
   11bf5:	29 ce                	sub    %ecx,%esi
   11bf7:	44 09 e9             	or     %r13d,%ecx
   11bfa:	45 85 f6             	test   %r14d,%r14d
   11bfd:	48 0f 49 f1          	cmovns %rcx,%rsi
   11c01:	89 d1                	mov    %edx,%ecx
   11c03:	44 09 e9             	or     %r13d,%ecx
   11c06:	41 29 d5             	sub    %edx,%r13d
   11c09:	85 c0                	test   %eax,%eax
   11c0b:	4c 0f 49 e9          	cmovns %rcx,%r13
   11c0f:	b1 01                	mov    $0x1,%cl
   11c11:	44 39 ee             	cmp    %r13d,%esi
   11c14:	0f 87 7a fb ff ff    	ja     11794 <hyperinterval_strict_surface32+0x264>
   11c1a:	44 89 f1             	mov    %r14d,%ecx
   11c1d:	c1 e9 08             	shr    $0x8,%ecx
   11c20:	ba 01 00 00 00       	mov    $0x1,%edx
   11c25:	e9 53 fd ff ff       	jmp    1197d <hyperinterval_strict_surface32+0x44d>
   11c2a:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11c2e:	89 d9                	mov    %ebx,%ecx
   11c30:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11c36:	89 c2                	mov    %eax,%edx
   11c38:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11c3e:	be 00 00 00 80       	mov    $0x80000000,%esi
   11c43:	29 ce                	sub    %ecx,%esi
   11c45:	44 09 e9             	or     %r13d,%ecx
   11c48:	85 db                	test   %ebx,%ebx
   11c4a:	48 0f 49 f1          	cmovns %rcx,%rsi
   11c4e:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11c53:	29 d7                	sub    %edx,%edi
   11c55:	89 d1                	mov    %edx,%ecx
   11c57:	44 09 e9             	or     %r13d,%ecx
   11c5a:	85 c0                	test   %eax,%eax
   11c5c:	48 0f 49 f9          	cmovns %rcx,%rdi
   11c60:	b1 01                	mov    $0x1,%cl
   11c62:	39 fe                	cmp    %edi,%esi
   11c64:	0f 87 00 fd ff ff    	ja     1196a <hyperinterval_strict_surface32+0x43a>
   11c6a:	89 d9                	mov    %ebx,%ecx
   11c6c:	c1 e9 08             	shr    $0x8,%ecx
   11c6f:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%rsp)
   11c76:	00 
   11c77:	88 5c 24 40          	mov    %bl,0x40(%rsp)
   11c7b:	c1 eb 18             	shr    $0x18,%ebx
   11c7e:	88 5c 24 43          	mov    %bl,0x43(%rsp)
   11c82:	66 89 4c 24 41       	mov    %cx,0x41(%rsp)
   11c87:	89 44 24 44          	mov    %eax,0x44(%rsp)
   11c8b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11c90:	be 00 00 00 80       	mov    $0x80000000,%esi
   11c95:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11c9a:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   11c9f:	e8 6c 70 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11ca4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11ca9:	0f 84 b6 fc ff ff    	je     11965 <hyperinterval_strict_surface32+0x435>
   11caf:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
   11cb4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11cb9:	be 00 00 00 80       	mov    $0x80000000,%esi
   11cbe:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   11cc3:	48 8b 8c 24 90 00 00 	mov    0x90(%rsp),%rcx
   11cca:	00 
   11ccb:	e8 40 70 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11cd0:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   11cd5:	0f 84 8a fc ff ff    	je     11965 <hyperinterval_strict_surface32+0x435>
   11cdb:	8b 44 24 10          	mov    0x10(%rsp),%eax
   11cdf:	89 d9                	mov    %ebx,%ecx
   11ce1:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   11ce7:	89 c2                	mov    %eax,%edx
   11ce9:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   11cef:	be 00 00 00 80       	mov    $0x80000000,%esi
   11cf4:	29 ce                	sub    %ecx,%esi
   11cf6:	44 09 e9             	or     %r13d,%ecx
   11cf9:	85 db                	test   %ebx,%ebx
   11cfb:	48 0f 49 f1          	cmovns %rcx,%rsi
   11cff:	bf 00 00 00 80       	mov    $0x80000000,%edi
   11d04:	29 d7                	sub    %edx,%edi
   11d06:	89 d1                	mov    %edx,%ecx
   11d08:	44 09 e9             	or     %r13d,%ecx
   11d0b:	85 c0                	test   %eax,%eax
   11d0d:	48 0f 49 f9          	cmovns %rcx,%rdi
   11d11:	b1 01                	mov    $0x1,%cl
   11d13:	39 fe                	cmp    %edi,%esi
   11d15:	0f 87 4f fc ff ff    	ja     1196a <hyperinterval_strict_surface32+0x43a>
   11d1b:	89 d9                	mov    %ebx,%ecx
   11d1d:	c1 e9 08             	shr    $0x8,%ecx
   11d20:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%rsp)
   11d27:	00 
   11d28:	88 5c 24 28          	mov    %bl,0x28(%rsp)
   11d2c:	c1 eb 18             	shr    $0x18,%ebx
   11d2f:	88 5c 24 2b          	mov    %bl,0x2b(%rsp)
   11d33:	66 89 4c 24 29       	mov    %cx,0x29(%rsp)
   11d38:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
   11d3c:	48 8d 7c 24 48       	lea    0x48(%rsp),%rdi
   11d41:	48 8d 74 24 3c       	lea    0x3c(%rsp),%rsi
   11d46:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   11d4b:	e8 40 85 00 00       	call   1a290 <<hyperinterval::float::F32Enclosure>::hull>
   11d50:	45 85 ff             	test   %r15d,%r15d
   11d53:	0f 95 c0             	setne  %al
   11d56:	41 f6 c7 01          	test   $0x1,%r15b
   11d5a:	0f 94 c1             	sete   %cl
   11d5d:	84 c8                	test   %cl,%al
   11d5f:	74 75                	je     11dd6 <hyperinterval_strict_surface32+0x8a6>
   11d61:	48 8d 7c 24 54       	lea    0x54(%rsp),%rdi
   11d66:	e8 05 86 00 00       	call   1a370 <<hyperinterval::float::F32Enclosure>::signs>
   11d6b:	a8 02                	test   $0x2,%al
   11d6d:	74 67                	je     11dd6 <hyperinterval_strict_surface32+0x8a6>
   11d6f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   11d74:	e8 67 86 00 00       	call   1a3e0 <<hyperinterval::float::F32Enclosure>::from_bits>
   11d79:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   11d7d:	0f b6 44 24 0c       	movzbl 0xc(%rsp),%eax
   11d82:	83 f9 02             	cmp    $0x2,%ecx
   11d85:	75 11                	jne    11d98 <hyperinterval_strict_surface32+0x868>
   11d87:	88 44 24 34          	mov    %al,0x34(%rsp)
   11d8b:	c7 44 24 30 02 00 00 	movl   $0x2,0x30(%rsp)
   11d92:	00 
   11d93:	e9 7c fa ff ff       	jmp    11814 <hyperinterval_strict_surface32+0x2e4>
   11d98:	8b 54 24 0d          	mov    0xd(%rsp),%edx
   11d9c:	8b 74 24 10          	mov    0x10(%rsp),%esi
   11da0:	89 74 24 2c          	mov    %esi,0x2c(%rsp)
   11da4:	89 54 24 29          	mov    %edx,0x29(%rsp)
   11da8:	89 4c 24 24          	mov    %ecx,0x24(%rsp)
   11dac:	88 44 24 28          	mov    %al,0x28(%rsp)
   11db0:	48 8d 7c 24 3c       	lea    0x3c(%rsp),%rdi
   11db5:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
   11dba:	48 8d 54 24 24       	lea    0x24(%rsp),%rdx
   11dbf:	e8 cc 84 00 00       	call   1a290 <<hyperinterval::float::F32Enclosure>::hull>
   11dc4:	8b 44 24 44          	mov    0x44(%rsp),%eax
   11dc8:	89 44 24 50          	mov    %eax,0x50(%rsp)
   11dcc:	48 8b 44 24 3c       	mov    0x3c(%rsp),%rax
   11dd1:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   11dd6:	8b 44 24 50          	mov    0x50(%rsp),%eax
   11dda:	89 44 24 38          	mov    %eax,0x38(%rsp)
   11dde:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   11de3:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   11de8:	e9 27 fa ff ff       	jmp    11814 <hyperinterval_strict_surface32+0x2e4>
   11ded:	cc                   	int3
   11dee:	cc                   	int3
   11def:	cc                   	int3

hyperinterval_strict_surface64:
   11df0:	55                   	push   %rbp
   11df1:	41 57                	push   %r15
   11df3:	41 56                	push   %r14
   11df5:	41 55                	push   %r13
   11df7:	41 54                	push   %r12
   11df9:	53                   	push   %rbx
   11dfa:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
   11e01:	41 89 f6             	mov    %esi,%r14d
   11e04:	66 0f d6 4c 24 28    	movq   %xmm1,0x28(%rsp)
   11e0a:	48 89 fb             	mov    %rdi,%rbx
   11e0d:	48 bd 00 00 00 00 00 	movabs $0x8000000000000000,%rbp
   11e14:	00 00 80 
   11e17:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   11e1e:	00 f0 7f 
   11e21:	66 0f d6 84 24 00 01 	movq   %xmm0,0x100(%rsp)
   11e28:	00 00 
   11e2a:	66 49 0f 7e c7       	movq   %xmm0,%r15
   11e2f:	48 89 e7             	mov    %rsp,%rdi
   11e32:	48 89 ee             	mov    %rbp,%rsi
   11e35:	4c 89 e2             	mov    %r12,%rdx
   11e38:	4c 89 f9             	mov    %r15,%rcx
   11e3b:	e8 d0 6e 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11e40:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11e44:	74 2c                	je     11e72 <hyperinterval_strict_surface64+0x82>
   11e46:	44 89 74 24 34       	mov    %r14d,0x34(%rsp)
   11e4b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   11e50:	f3 0f 7e 44 24 28    	movq   0x28(%rsp),%xmm0
   11e56:	66 49 0f 7e c5       	movq   %xmm0,%r13
   11e5b:	48 89 e7             	mov    %rsp,%rdi
   11e5e:	48 89 ee             	mov    %rbp,%rsi
   11e61:	4c 89 e2             	mov    %r12,%rdx
   11e64:	4c 89 e9             	mov    %r13,%rcx
   11e67:	e8 a4 6e 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11e6c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11e70:	75 24                	jne    11e96 <hyperinterval_strict_surface64+0xa6>
   11e72:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   11e77:	88 43 08             	mov    %al,0x8(%rbx)
   11e7a:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   11e81:	48 89 d8             	mov    %rbx,%rax
   11e84:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
   11e8b:	5b                   	pop    %rbx
   11e8c:	41 5c                	pop    %r12
   11e8e:	41 5d                	pop    %r13
   11e90:	41 5e                	pop    %r14
   11e92:	41 5f                	pop    %r15
   11e94:	5d                   	pop    %rbp
   11e95:	c3                   	ret
   11e96:	48 89 ee             	mov    %rbp,%rsi
   11e99:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   11e9e:	49 8d 04 36          	lea    (%r14,%rsi,1),%rax
   11ea2:	4c 8d 46 ff          	lea    -0x1(%rsi),%r8
   11ea6:	4c 89 f1             	mov    %r14,%rcx
   11ea9:	4c 21 c1             	and    %r8,%rcx
   11eac:	48 89 f2             	mov    %rsi,%rdx
   11eaf:	48 29 ca             	sub    %rcx,%rdx
   11eb2:	4d 85 f6             	test   %r14,%r14
   11eb5:	48 0f 49 d0          	cmovns %rax,%rdx
   11eb9:	48 8d 04 2e          	lea    (%rsi,%rbp,1),%rax
   11ebd:	48 89 e9             	mov    %rbp,%rcx
   11ec0:	4c 21 c1             	and    %r8,%rcx
   11ec3:	48 89 f7             	mov    %rsi,%rdi
   11ec6:	48 29 cf             	sub    %rcx,%rdi
   11ec9:	48 85 ed             	test   %rbp,%rbp
   11ecc:	48 0f 49 f8          	cmovns %rax,%rdi
   11ed0:	b0 01                	mov    $0x1,%al
   11ed2:	48 39 fa             	cmp    %rdi,%rdx
   11ed5:	77 a0                	ja     11e77 <hyperinterval_strict_surface64+0x87>
   11ed7:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
   11edc:	48 c7 84 24 b8 00 00 	movq   $0x1,0xb8(%rsp)
   11ee3:	00 01 00 00 00 
   11ee8:	4c 89 b4 24 98 00 00 	mov    %r14,0x98(%rsp)
   11eef:	00 
   11ef0:	4c 89 b4 24 c0 00 00 	mov    %r14,0xc0(%rsp)
   11ef7:	00 
   11ef8:	48 89 ac 24 c8 00 00 	mov    %rbp,0xc8(%rsp)
   11eff:	00 
   11f00:	48 89 e7             	mov    %rsp,%rdi
   11f03:	49 89 f6             	mov    %rsi,%r14
   11f06:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   11f0d:	00 f0 7f 
   11f10:	4c 89 e2             	mov    %r12,%rdx
   11f13:	4c 89 f9             	mov    %r15,%rcx
   11f16:	e8 f5 6d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11f1b:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11f1f:	0f 84 4d ff ff ff    	je     11e72 <hyperinterval_strict_surface64+0x82>
   11f25:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11f2a:	48 89 c2             	mov    %rax,%rdx
   11f2d:	4c 31 f2             	xor    %r14,%rdx
   11f30:	48 85 c0             	test   %rax,%rax
   11f33:	48 0f 44 d0          	cmove  %rax,%rdx
   11f37:	48 89 d1             	mov    %rdx,%rcx
   11f3a:	48 c1 f9 3f          	sar    $0x3f,%rcx
   11f3e:	48 83 c9 01          	or     $0x1,%rcx
   11f42:	48 01 d1             	add    %rdx,%rcx
   11f45:	48 89 e7             	mov    %rsp,%rdi
   11f48:	4c 89 f6             	mov    %r14,%rsi
   11f4b:	4c 89 e2             	mov    %r12,%rdx
   11f4e:	e8 bd 6d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11f53:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11f57:	75 07                	jne    11f60 <hyperinterval_strict_surface64+0x170>
   11f59:	b0 03                	mov    $0x3,%al
   11f5b:	e9 17 ff ff ff       	jmp    11e77 <hyperinterval_strict_surface64+0x87>
   11f60:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11f65:	49 89 c7             	mov    %rax,%r15
   11f68:	4d 31 f7             	xor    %r14,%r15
   11f6b:	48 85 c0             	test   %rax,%rax
   11f6e:	4c 0f 44 f8          	cmove  %rax,%r15
   11f72:	48 89 e7             	mov    %rsp,%rdi
   11f75:	4c 89 f6             	mov    %r14,%rsi
   11f78:	4c 89 e2             	mov    %r12,%rdx
   11f7b:	4c 89 e9             	mov    %r13,%rcx
   11f7e:	e8 8d 6d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11f83:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11f87:	0f 84 e5 fe ff ff    	je     11e72 <hyperinterval_strict_surface64+0x82>
   11f8d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11f92:	48 89 c1             	mov    %rax,%rcx
   11f95:	48 c1 f9 3f          	sar    $0x3f,%rcx
   11f99:	48 83 c9 01          	or     $0x1,%rcx
   11f9d:	48 01 c1             	add    %rax,%rcx
   11fa0:	48 89 e7             	mov    %rsp,%rdi
   11fa3:	4c 89 f6             	mov    %r14,%rsi
   11fa6:	4c 89 e2             	mov    %r12,%rdx
   11fa9:	e8 62 6d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11fae:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11fb2:	74 a5                	je     11f59 <hyperinterval_strict_surface64+0x169>
   11fb4:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   11fb9:	48 89 e7             	mov    %rsp,%rdi
   11fbc:	4c 89 f6             	mov    %r14,%rsi
   11fbf:	4c 89 e2             	mov    %r12,%rdx
   11fc2:	4c 89 f9             	mov    %r15,%rcx
   11fc5:	e8 46 6d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11fca:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11fce:	74 1c                	je     11fec <hyperinterval_strict_surface64+0x1fc>
   11fd0:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   11fd5:	48 89 e7             	mov    %rsp,%rdi
   11fd8:	4c 89 f6             	mov    %r14,%rsi
   11fdb:	4c 89 e2             	mov    %r12,%rdx
   11fde:	4c 89 e9             	mov    %r13,%rcx
   11fe1:	e8 2a 6d 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   11fe6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   11fea:	75 0d                	jne    11ff9 <hyperinterval_strict_surface64+0x209>
   11fec:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   11ff1:	88 4b 08             	mov    %cl,0x8(%rbx)
   11ff4:	e9 81 fe ff ff       	jmp    11e7a <hyperinterval_strict_surface64+0x8a>
   11ff9:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   11ffe:	4b 8d 0c 37          	lea    (%r15,%r14,1),%rcx
   12002:	4c 89 fa             	mov    %r15,%rdx
   12005:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
   1200a:	48 21 fa             	and    %rdi,%rdx
   1200d:	4c 89 f6             	mov    %r14,%rsi
   12010:	48 29 d6             	sub    %rdx,%rsi
   12013:	4d 85 ff             	test   %r15,%r15
   12016:	48 0f 49 f1          	cmovns %rcx,%rsi
   1201a:	4a 8d 0c 30          	lea    (%rax,%r14,1),%rcx
   1201e:	48 89 c2             	mov    %rax,%rdx
   12021:	48 21 fa             	and    %rdi,%rdx
   12024:	4c 89 f7             	mov    %r14,%rdi
   12027:	48 29 d7             	sub    %rdx,%rdi
   1202a:	48 85 c0             	test   %rax,%rax
   1202d:	48 0f 49 f9          	cmovns %rcx,%rdi
   12031:	b1 01                	mov    $0x1,%cl
   12033:	48 39 fe             	cmp    %rdi,%rsi
   12036:	77 b9                	ja     11ff1 <hyperinterval_strict_surface64+0x201>
   12038:	44 89 f9             	mov    %r15d,%ecx
   1203b:	4c 89 fa             	mov    %r15,%rdx
   1203e:	48 c1 ea 08          	shr    $0x8,%rdx
   12042:	4c 89 fe             	mov    %r15,%rsi
   12045:	48 c1 ee 38          	shr    $0x38,%rsi
   12049:	40 88 b4 24 af 00 00 	mov    %sil,0xaf(%rsp)
   12050:	00 
   12051:	49 c1 ef 28          	shr    $0x28,%r15
   12055:	66 44 89 bc 24 ad 00 	mov    %r15w,0xad(%rsp)
   1205c:	00 00 
   1205e:	89 94 24 a9 00 00 00 	mov    %edx,0xa9(%rsp)
   12065:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
   1206c:	00 
   1206d:	48 c7 84 24 a0 00 00 	movq   $0x1,0xa0(%rsp)
   12074:	00 01 00 00 00 
   12079:	88 8c 24 a8 00 00 00 	mov    %cl,0xa8(%rsp)
   12080:	44 8b 6c 24 34       	mov    0x34(%rsp),%r13d
   12085:	41 83 fd 02          	cmp    $0x2,%r13d
   12089:	0f 85 ce 00 00 00    	jne    1215d <hyperinterval_strict_surface64+0x36d>
   1208f:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
   12094:	48 8d b4 24 b8 00 00 	lea    0xb8(%rsp),%rsi
   1209b:	00 
   1209c:	e8 2f 94 00 00       	call   1b4d0 <<hyperinterval::float::F64Enclosure>::square>
   120a1:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   120a8:	00 f0 7f 
   120ab:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   120b0:	0f b6 4c 24 58       	movzbl 0x58(%rsp),%ecx
   120b5:	48 83 f8 02          	cmp    $0x2,%rax
   120b9:	0f 84 32 ff ff ff    	je     11ff1 <hyperinterval_strict_surface64+0x201>
   120bf:	48 83 f8 01          	cmp    $0x1,%rax
   120c3:	0f 85 5f 01 00 00    	jne    12228 <hyperinterval_strict_surface64+0x438>
   120c9:	0f b6 c1             	movzbl %cl,%eax
   120cc:	0f b6 4c 24 5f       	movzbl 0x5f(%rsp),%ecx
   120d1:	c1 e1 10             	shl    $0x10,%ecx
   120d4:	0f b7 54 24 5d       	movzwl 0x5d(%rsp),%edx
   120d9:	09 ca                	or     %ecx,%edx
   120db:	48 c1 e2 20          	shl    $0x20,%rdx
   120df:	8b 4c 24 59          	mov    0x59(%rsp),%ecx
   120e3:	48 09 d1             	or     %rdx,%rcx
   120e6:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
   120eb:	48 c1 e1 08          	shl    $0x8,%rcx
   120ef:	48 09 c1             	or     %rax,%rcx
   120f2:	48 89 c8             	mov    %rcx,%rax
   120f5:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   120fc:	00 00 80 
   120ff:	4c 31 f0             	xor    %r14,%rax
   12102:	48 85 c9             	test   %rcx,%rcx
   12105:	48 0f 44 c1          	cmove  %rcx,%rax
   12109:	48 89 c1             	mov    %rax,%rcx
   1210c:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12110:	48 83 c9 01          	or     $0x1,%rcx
   12114:	48 01 c1             	add    %rax,%rcx
   12117:	48 89 e7             	mov    %rsp,%rdi
   1211a:	4c 89 f6             	mov    %r14,%rsi
   1211d:	4c 89 e2             	mov    %r12,%rdx
   12120:	e8 eb 6b 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   12125:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12129:	74 2b                	je     12156 <hyperinterval_strict_surface64+0x366>
   1212b:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   12130:	4c 89 f9             	mov    %r15,%rcx
   12133:	48 c1 f9 3f          	sar    $0x3f,%rcx
   12137:	48 83 c9 01          	or     $0x1,%rcx
   1213b:	4c 01 f9             	add    %r15,%rcx
   1213e:	48 89 e7             	mov    %rsp,%rdi
   12141:	4c 89 f6             	mov    %r14,%rsi
   12144:	4c 89 e2             	mov    %r12,%rdx
   12147:	e8 c4 6b 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1214c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12150:	0f 85 13 03 00 00    	jne    12469 <hyperinterval_strict_surface64+0x679>
   12156:	b1 03                	mov    $0x3,%cl
   12158:	e9 94 fe ff ff       	jmp    11ff1 <hyperinterval_strict_surface64+0x201>
   1215d:	48 89 e7             	mov    %rsp,%rdi
   12160:	4c 89 f6             	mov    %r14,%rsi
   12163:	49 bc 00 00 00 00 00 	movabs $0x7ff0000000000000,%r12
   1216a:	00 f0 7f 
   1216d:	4c 89 e2             	mov    %r12,%rdx
   12170:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
   12177:	00 
   12178:	45 89 e8             	mov    %r13d,%r8d
   1217b:	e8 00 7d 00 00       	call   19e80 <<hyperinterval::ieee::Format>::power>
   12180:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   12184:	0f 84 62 fe ff ff    	je     11fec <hyperinterval_strict_surface64+0x1fc>
   1218a:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1218f:	45 89 e8             	mov    %r13d,%r8d
   12192:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   12197:	48 89 e7             	mov    %rsp,%rdi
   1219a:	4c 89 f6             	mov    %r14,%rsi
   1219d:	4c 89 e2             	mov    %r12,%rdx
   121a0:	48 89 e9             	mov    %rbp,%rcx
   121a3:	e8 d8 7c 00 00       	call   19e80 <<hyperinterval::ieee::Format>::power>
   121a8:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   121ac:	0f 84 3a fe ff ff    	je     11fec <hyperinterval_strict_surface64+0x1fc>
   121b2:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   121b7:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
   121be:	00 
   121bf:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   121c4:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
   121cb:	00 
   121cc:	48 89 e7             	mov    %rsp,%rdi
   121cf:	4c 89 f6             	mov    %r14,%rsi
   121d2:	4c 89 e2             	mov    %r12,%rdx
   121d5:	4c 89 f9             	mov    %r15,%rcx
   121d8:	e8 33 6b 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   121dd:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   121e1:	74 2e                	je     12211 <hyperinterval_strict_surface64+0x421>
   121e3:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   121e8:	48 89 e7             	mov    %rsp,%rdi
   121eb:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   121f2:	00 00 80 
   121f5:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   121fc:	00 f0 7f 
   121ff:	4c 89 e9             	mov    %r13,%rcx
   12202:	e8 09 6b 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   12207:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1220b:	0f 85 19 03 00 00    	jne    1252a <hyperinterval_strict_surface64+0x73a>
   12211:	0f b6 4c 24 01       	movzbl 0x1(%rsp),%ecx
   12216:	88 4c 24 58          	mov    %cl,0x58(%rsp)
   1221a:	48 c7 44 24 50 02 00 	movq   $0x2,0x50(%rsp)
   12221:	00 00 
   12223:	e9 79 fe ff ff       	jmp    120a1 <hyperinterval_strict_surface64+0x2b1>
   12228:	31 c9                	xor    %ecx,%ecx
   1222a:	89 94 24 d9 00 00 00 	mov    %edx,0xd9(%rsp)
   12231:	48 89 d6             	mov    %rdx,%rsi
   12234:	48 c1 ee 30          	shr    $0x30,%rsi
   12238:	40 88 b4 24 df 00 00 	mov    %sil,0xdf(%rsp)
   1223f:	00 
   12240:	48 c1 ea 20          	shr    $0x20,%rdx
   12244:	66 89 94 24 dd 00 00 	mov    %dx,0xdd(%rsp)
   1224b:	00 
   1224c:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
   12253:	00 
   12254:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
   1225b:	00 
   1225c:	44 88 ac 24 d8 00 00 	mov    %r13b,0xd8(%rsp)
   12263:	00 
   12264:	4c 8d bc 24 20 01 00 	lea    0x120(%rsp),%r15
   1226b:	00 
   1226c:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
   12273:	00 
   12274:	48 8d 94 24 a0 00 00 	lea    0xa0(%rsp),%rdx
   1227b:	00 
   1227c:	4c 89 ff             	mov    %r15,%rdi
   1227f:	e8 bc 97 00 00       	call   1ba40 <<hyperinterval::float::F64Enclosure>::intersection>
   12284:	4c 8d ac 24 08 01 00 	lea    0x108(%rsp),%r13
   1228b:	00 
   1228c:	48 8d 94 24 b8 00 00 	lea    0xb8(%rsp),%rdx
   12293:	00 
   12294:	4c 89 ef             	mov    %r13,%rdi
   12297:	4c 89 fe             	mov    %r15,%rsi
   1229a:	e8 71 95 00 00       	call   1b810 <<hyperinterval::float::F64Enclosure>::hull>
   1229f:	4c 89 ef             	mov    %r13,%rdi
   122a2:	e8 49 96 00 00       	call   1b8f0 <<hyperinterval::float::F64Enclosure>::signs>
   122a7:	48 8b 8c 24 08 01 00 	mov    0x108(%rsp),%rcx
   122ae:	00 
   122af:	48 83 f9 01          	cmp    $0x1,%rcx
   122b3:	48 89 ac 24 f8 00 00 	mov    %rbp,0xf8(%rsp)
   122ba:	00 
   122bb:	75 27                	jne    122e4 <hyperinterval_strict_surface64+0x4f4>
   122bd:	48 8b b4 24 10 01 00 	mov    0x110(%rsp),%rsi
   122c4:	00 
   122c5:	48 8b bc 24 18 01 00 	mov    0x118(%rsp),%rdi
   122cc:	00 
   122cd:	48 39 fe             	cmp    %rdi,%rsi
   122d0:	0f 94 c2             	sete   %dl
   122d3:	66 48 0f 6e ce       	movq   %rsi,%xmm1
   122d8:	66 48 0f 6e c7       	movq   %rdi,%xmm0
   122dd:	be 01 00 00 00       	mov    $0x1,%esi
   122e2:	eb 04                	jmp    122e8 <hyperinterval_strict_surface64+0x4f8>
   122e4:	31 d2                	xor    %edx,%edx
   122e6:	31 f6                	xor    %esi,%esi
   122e8:	80 f1 01             	xor    $0x1,%cl
   122eb:	48 89 34 24          	mov    %rsi,(%rsp)
   122ef:	66 0f d6 4c 24 08    	movq   %xmm1,0x8(%rsp)
   122f5:	88 4c 24 10          	mov    %cl,0x10(%rsp)
   122f9:	88 54 24 11          	mov    %dl,0x11(%rsp)
   122fd:	88 44 24 12          	mov    %al,0x12(%rsp)
   12301:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
   12306:	66 0f d6 44 24 20    	movq   %xmm0,0x20(%rsp)
   1230c:	48 89 e0             	mov    %rsp,%rax
   1230f:	48 8d bc 24 08 01 00 	lea    0x108(%rsp),%rdi
   12316:	00 
   12317:	f3 0f 7e 84 24 00 01 	movq   0x100(%rsp),%xmm0
   1231e:	00 00 
   12320:	e8 0b 98 00 00       	call   1bb30 <<hyperinterval::float::F64Enclosure>::contains_point>
   12325:	89 d5                	mov    %edx,%ebp
   12327:	a8 01                	test   $0x1,%al
   12329:	74 09                	je     12334 <hyperinterval_strict_surface64+0x544>
   1232b:	40 88 6b 08          	mov    %bpl,0x8(%rbx)
   1232f:	e9 46 fb ff ff       	jmp    11e7a <hyperinterval_strict_surface64+0x8a>
   12334:	4c 8d a4 24 08 01 00 	lea    0x108(%rsp),%r12
   1233b:	00 
   1233c:	4c 8d ac 24 b8 00 00 	lea    0xb8(%rsp),%r13
   12343:	00 
   12344:	4c 89 e7             	mov    %r12,%rdi
   12347:	4c 89 ee             	mov    %r13,%rsi
   1234a:	e8 b1 9b 00 00       	call   1bf00 <<hyperinterval::float::F64Enclosure>::overlaps>
   1234f:	88 44 24 28          	mov    %al,0x28(%rsp)
   12353:	4c 89 e7             	mov    %r12,%rdi
   12356:	4c 89 ee             	mov    %r13,%rsi
   12359:	e8 02 9b 00 00       	call   1be60 <<hyperinterval::float::F64Enclosure>::disjoint>
   1235e:	41 89 c5             	mov    %eax,%r13d
   12361:	4c 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%r14
   12368:	00 
   12369:	4c 89 e7             	mov    %r12,%rdi
   1236c:	4c 89 f6             	mov    %r14,%rsi
   1236f:	e8 7c 98 00 00       	call   1bbf0 <<hyperinterval::float::F64Enclosure>::interior_subset_of>
   12374:	41 89 c7             	mov    %eax,%r15d
   12377:	4c 89 e7             	mov    %r12,%rdi
   1237a:	4c 89 f6             	mov    %r14,%rsi
   1237d:	e8 1e 9c 00 00       	call   1bfa0 <<hyperinterval::float::F64Enclosure>::subset_of>
   12382:	88 04 24             	mov    %al,(%rsp)
   12385:	44 88 7c 24 01       	mov    %r15b,0x1(%rsp)
   1238a:	44 88 6c 24 02       	mov    %r13b,0x2(%rsp)
   1238f:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
   12394:	88 44 24 03          	mov    %al,0x3(%rsp)
   12398:	40 88 6c 24 04       	mov    %bpl,0x4(%rsp)
   1239d:	48 89 e0             	mov    %rsp,%rax
   123a0:	48 8b b4 24 f8 00 00 	mov    0xf8(%rsp),%rsi
   123a7:	00 
   123a8:	48 89 f1             	mov    %rsi,%rcx
   123ab:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   123b2:	00 00 80 
   123b5:	48 31 f9             	xor    %rdi,%rcx
   123b8:	48 85 f6             	test   %rsi,%rsi
   123bb:	48 0f 44 ce          	cmove  %rsi,%rcx
   123bf:	48 8b b4 24 98 00 00 	mov    0x98(%rsp),%rsi
   123c6:	00 
   123c7:	48 89 f2             	mov    %rsi,%rdx
   123ca:	49 89 fe             	mov    %rdi,%r14
   123cd:	48 31 fa             	xor    %rdi,%rdx
   123d0:	48 85 f6             	test   %rsi,%rsi
   123d3:	48 0f 44 d6          	cmove  %rsi,%rdx
   123d7:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   123de:	00 00 
   123e0:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
   123e5:	48 89 54 24 78       	mov    %rdx,0x78(%rsp)
   123ea:	48 89 e7             	mov    %rsp,%rdi
   123ed:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   123f2:	4c 89 e6             	mov    %r12,%rsi
   123f5:	e8 06 9a 00 00       	call   1be00 <<hyperinterval::float::F64Enclosure>::sub>
   123fa:	48 8b 0c 24          	mov    (%rsp),%rcx
   123fe:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   12403:	48 83 f9 02          	cmp    $0x2,%rcx
   12407:	0f 84 6a fa ff ff    	je     11e77 <hyperinterval_strict_surface64+0x87>
   1240d:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   12412:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12417:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1241c:	48 89 54 24 41       	mov    %rdx,0x41(%rsp)
   12421:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
   12426:	88 44 24 40          	mov    %al,0x40(%rsp)
   1242a:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   12431:	00 
   12432:	48 b9 00 00 00 00 00 	movabs $0x4000000000000000,%rcx
   12439:	00 00 40 
   1243c:	4c 89 f6             	mov    %r14,%rsi
   1243f:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   12446:	00 f0 7f 
   12449:	e8 c2 68 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1244e:	80 bc 24 80 00 00 00 	cmpb   $0x1,0x80(%rsp)
   12455:	01 
   12456:	0f 85 94 01 00 00    	jne    125f0 <hyperinterval_strict_surface64+0x800>
   1245c:	0f b6 84 24 81 00 00 	movzbl 0x81(%rsp),%eax
   12463:	00 
   12464:	e9 0e fa ff ff       	jmp    11e77 <hyperinterval_strict_surface64+0x87>
   12469:	4c 89 e9             	mov    %r13,%rcx
   1246c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12473:	00 00 80 
   12476:	48 31 f1             	xor    %rsi,%rcx
   12479:	4d 85 ed             	test   %r13,%r13
   1247c:	49 0f 44 cd          	cmove  %r13,%rcx
   12480:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   12485:	48 89 e7             	mov    %rsp,%rdi
   12488:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1248f:	00 f0 7f 
   12492:	e8 79 68 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   12497:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1249b:	0f 84 4b fb ff ff    	je     11fec <hyperinterval_strict_surface64+0x1fc>
   124a1:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   124a6:	48 89 e7             	mov    %rsp,%rdi
   124a9:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   124b0:	00 00 80 
   124b3:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   124ba:	00 f0 7f 
   124bd:	4c 89 f9             	mov    %r15,%rcx
   124c0:	e8 4b 68 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   124c5:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   124c9:	0f 84 1d fb ff ff    	je     11fec <hyperinterval_strict_surface64+0x1fc>
   124cf:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   124d4:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   124db:	00 00 80 
   124de:	4a 8d 0c 2f          	lea    (%rdi,%r13,1),%rcx
   124e2:	4c 89 ea             	mov    %r13,%rdx
   124e5:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   124ea:	4c 21 c2             	and    %r8,%rdx
   124ed:	48 89 fe             	mov    %rdi,%rsi
   124f0:	48 29 d6             	sub    %rdx,%rsi
   124f3:	4d 85 ed             	test   %r13,%r13
   124f6:	48 0f 49 f1          	cmovns %rcx,%rsi
   124fa:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   124fe:	49 21 c0             	and    %rax,%r8
   12501:	48 89 fa             	mov    %rdi,%rdx
   12504:	4c 29 c2             	sub    %r8,%rdx
   12507:	48 85 c0             	test   %rax,%rax
   1250a:	48 0f 49 d1          	cmovns %rcx,%rdx
   1250e:	b1 01                	mov    $0x1,%cl
   12510:	48 39 d6             	cmp    %rdx,%rsi
   12513:	0f 87 d8 fa ff ff    	ja     11ff1 <hyperinterval_strict_surface64+0x201>
   12519:	4c 89 ea             	mov    %r13,%rdx
   1251c:	48 c1 ea 08          	shr    $0x8,%rdx
   12520:	b9 01 00 00 00       	mov    $0x1,%ecx
   12525:	e9 00 fd ff ff       	jmp    1222a <hyperinterval_strict_surface64+0x43a>
   1252a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1252f:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   12536:	00 00 80 
   12539:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   1253d:	4c 89 fa             	mov    %r15,%rdx
   12540:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   12545:	4c 21 c2             	and    %r8,%rdx
   12548:	48 89 fe             	mov    %rdi,%rsi
   1254b:	48 29 d6             	sub    %rdx,%rsi
   1254e:	4d 85 ff             	test   %r15,%r15
   12551:	48 0f 49 f1          	cmovns %rcx,%rsi
   12555:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   12559:	48 89 c2             	mov    %rax,%rdx
   1255c:	4c 21 c2             	and    %r8,%rdx
   1255f:	48 29 d7             	sub    %rdx,%rdi
   12562:	48 85 c0             	test   %rax,%rax
   12565:	48 0f 49 f9          	cmovns %rcx,%rdi
   12569:	b1 01                	mov    $0x1,%cl
   1256b:	48 39 fe             	cmp    %rdi,%rsi
   1256e:	0f 87 a2 fc ff ff    	ja     12216 <hyperinterval_strict_surface64+0x426>
   12574:	48 c7 44 24 68 01 00 	movq   $0x1,0x68(%rsp)
   1257b:	00 00 
   1257d:	4c 89 7c 24 70       	mov    %r15,0x70(%rsp)
   12582:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
   12587:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1258c:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   12593:	00 00 80 
   12596:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1259d:	00 f0 7f 
   125a0:	48 8b 8c 24 f0 00 00 	mov    0xf0(%rsp),%rcx
   125a7:	00 
   125a8:	e8 63 67 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   125ad:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   125b2:	74 32                	je     125e6 <hyperinterval_strict_surface64+0x7f6>
   125b4:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
   125b9:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   125be:	48 be 00 00 00 00 00 	movabs $0x8000000000000000,%rsi
   125c5:	00 00 80 
   125c8:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   125cf:	00 f0 7f 
   125d2:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
   125d9:	00 
   125da:	e8 31 67 00 00       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   125df:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   125e4:	75 5a                	jne    12640 <hyperinterval_strict_surface64+0x850>
   125e6:	0f b6 4c 24 39       	movzbl 0x39(%rsp),%ecx
   125eb:	e9 26 fc ff ff       	jmp    12216 <hyperinterval_strict_surface64+0x426>
   125f0:	48 8b 84 24 88 00 00 	mov    0x88(%rsp),%rax
   125f7:	00 
   125f8:	48 89 c1             	mov    %rax,%rcx
   125fb:	48 c1 e9 08          	shr    $0x8,%rcx
   125ff:	48 89 c2             	mov    %rax,%rdx
   12602:	48 c1 ea 38          	shr    $0x38,%rdx
   12606:	88 54 24 0f          	mov    %dl,0xf(%rsp)
   1260a:	48 89 c2             	mov    %rax,%rdx
   1260d:	48 c1 ea 28          	shr    $0x28,%rdx
   12611:	66 89 54 24 0d       	mov    %dx,0xd(%rsp)
   12616:	89 4c 24 09          	mov    %ecx,0x9(%rsp)
   1261a:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1261f:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   12626:	00 
   12627:	88 44 24 08          	mov    %al,0x8(%rsp)
   1262b:	48 8d 74 24 38       	lea    0x38(%rsp),%rsi
   12630:	48 89 e2             	mov    %rsp,%rdx
   12633:	48 89 df             	mov    %rbx,%rdi
   12636:	e8 85 97 00 00       	call   1bdc0 <<hyperinterval::float::F64Enclosure>::div>
   1263b:	e9 41 f8 ff ff       	jmp    11e81 <hyperinterval_strict_surface64+0x91>
   12640:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
   12645:	48 bf 00 00 00 00 00 	movabs $0x8000000000000000,%rdi
   1264c:	00 00 80 
   1264f:	49 8d 0c 3f          	lea    (%r15,%rdi,1),%rcx
   12653:	4c 89 fa             	mov    %r15,%rdx
   12656:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
   1265b:	4c 21 c2             	and    %r8,%rdx
   1265e:	48 89 fe             	mov    %rdi,%rsi
   12661:	48 29 d6             	sub    %rdx,%rsi
   12664:	4d 85 ff             	test   %r15,%r15
   12667:	48 0f 49 f1          	cmovns %rcx,%rsi
   1266b:	48 8d 0c 38          	lea    (%rax,%rdi,1),%rcx
   1266f:	48 89 c2             	mov    %rax,%rdx
   12672:	4c 21 c2             	and    %r8,%rdx
   12675:	48 29 d7             	sub    %rdx,%rdi
   12678:	48 85 c0             	test   %rax,%rax
   1267b:	48 0f 49 f9          	cmovns %rcx,%rdi
   1267f:	b1 01                	mov    $0x1,%cl
   12681:	48 39 fe             	cmp    %rdi,%rsi
   12684:	0f 87 8c fb ff ff    	ja     12216 <hyperinterval_strict_surface64+0x426>
   1268a:	48 c7 04 24 01 00 00 	movq   $0x1,(%rsp)
   12691:	00 
   12692:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
   12697:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1269c:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   126a3:	00 
   126a4:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
   126a9:	48 89 e2             	mov    %rsp,%rdx
   126ac:	e8 5f 91 00 00       	call   1b810 <<hyperinterval::float::F64Enclosure>::hull>
   126b1:	8b 4c 24 34          	mov    0x34(%rsp),%ecx
   126b5:	85 c9                	test   %ecx,%ecx
   126b7:	0f 95 c0             	setne  %al
   126ba:	f6 c1 01             	test   $0x1,%cl
   126bd:	0f 94 c1             	sete   %cl
   126c0:	84 c8                	test   %cl,%al
   126c2:	0f 84 81 00 00 00    	je     12749 <hyperinterval_strict_surface64+0x959>
   126c8:	48 8d bc 24 b8 00 00 	lea    0xb8(%rsp),%rdi
   126cf:	00 
   126d0:	e8 1b 92 00 00       	call   1b8f0 <<hyperinterval::float::F64Enclosure>::signs>
   126d5:	a8 02                	test   $0x2,%al
   126d7:	74 70                	je     12749 <hyperinterval_strict_surface64+0x959>
   126d9:	48 89 e7             	mov    %rsp,%rdi
   126dc:	e8 8f 92 00 00       	call   1b970 <<hyperinterval::float::F64Enclosure>::from_bits>
   126e1:	48 8b 0c 24          	mov    (%rsp),%rcx
   126e5:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   126ea:	48 83 f9 02          	cmp    $0x2,%rcx
   126ee:	75 09                	jne    126f9 <hyperinterval_strict_surface64+0x909>
   126f0:	88 44 24 58          	mov    %al,0x58(%rsp)
   126f4:	e9 21 fb ff ff       	jmp    1221a <hyperinterval_strict_surface64+0x42a>
   126f9:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   126fe:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   12703:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
   12708:	48 89 54 24 71       	mov    %rdx,0x71(%rsp)
   1270d:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
   12712:	88 44 24 70          	mov    %al,0x70(%rsp)
   12716:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   1271b:	48 8d b4 24 80 00 00 	lea    0x80(%rsp),%rsi
   12722:	00 
   12723:	48 8d 54 24 68       	lea    0x68(%rsp),%rdx
   12728:	e8 e3 90 00 00       	call   1b810 <<hyperinterval::float::F64Enclosure>::hull>
   1272d:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
   12732:	48 89 84 24 90 00 00 	mov    %rax,0x90(%rsp)
   12739:	00 
   1273a:	f3 0f 6f 44 24 38    	movdqu 0x38(%rsp),%xmm0
   12740:	66 0f 7f 84 24 80 00 	movdqa %xmm0,0x80(%rsp)
   12747:	00 00 
   12749:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   12750:	00 
   12751:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   12756:	66 0f 6f 84 24 80 00 	movdqa 0x80(%rsp),%xmm0
   1275d:	00 00 
   1275f:	66 0f 7f 44 24 50    	movdqa %xmm0,0x50(%rsp)
   12765:	e9 37 f9 ff ff       	jmp    120a1 <hyperinterval_strict_surface64+0x2b1>
   1276a:	cc                   	int3
   1276b:	cc                   	int3
   1276c:	cc                   	int3
   1276d:	cc                   	int3
   1276e:	cc                   	int3
   1276f:	cc                   	int3

<hyperinterval::ieee::Format>::finite:
   18d10:	48 89 c8             	mov    %rcx,%rax
   18d13:	48 f7 d0             	not    %rax
   18d16:	48 85 d0             	test   %rdx,%rax
   18d19:	75 09                	jne    18d24 <<hyperinterval::ieee::Format>::finite+0x14>
   18d1b:	c6 47 01 00          	movb   $0x0,0x1(%rdi)
   18d1f:	b0 01                	mov    $0x1,%al
   18d21:	88 07                	mov    %al,(%rdi)
   18d23:	c3                   	ret
   18d24:	48 ff ce             	dec    %rsi
   18d27:	48 85 f1             	test   %rsi,%rcx
   18d2a:	74 09                	je     18d35 <<hyperinterval::ieee::Format>::finite+0x25>
   18d2c:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   18d30:	31 c0                	xor    %eax,%eax
   18d32:	88 07                	mov    %al,(%rdi)
   18d34:	c3                   	ret
   18d35:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
   18d3c:	00 
   18d3d:	31 c0                	xor    %eax,%eax
   18d3f:	88 07                	mov    %al,(%rdi)
   18d41:	c3                   	ret
   18d42:	cc                   	int3
   18d43:	cc                   	int3
   18d44:	cc                   	int3
   18d45:	cc                   	int3
   18d46:	cc                   	int3
   18d47:	cc                   	int3
   18d48:	cc                   	int3
   18d49:	cc                   	int3
   18d4a:	cc                   	int3
   18d4b:	cc                   	int3
   18d4c:	cc                   	int3
   18d4d:	cc                   	int3
   18d4e:	cc                   	int3
   18d4f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::corner_image:
   18d50:	55                   	push   %rbp
   18d51:	41 57                	push   %r15
   18d53:	41 56                	push   %r14
   18d55:	41 55                	push   %r13
   18d57:	41 54                	push   %r12
   18d59:	53                   	push   %rbx
   18d5a:	48 83 ec 58          	sub    $0x58,%rsp
   18d5e:	48 89 fb             	mov    %rdi,%rbx
   18d61:	f6 06 01             	testb  $0x1,(%rsi)
   18d64:	74 53                	je     18db9 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   18d66:	f6 02 01             	testb  $0x1,(%rdx)
   18d69:	74 4e                	je     18db9 <<hyperinterval::float::F32Enclosure>::corner_image+0x69>
   18d6b:	44 8b 62 04          	mov    0x4(%rdx),%r12d
   18d6f:	8b 42 08             	mov    0x8(%rdx),%eax
   18d72:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   18d77:	44 8b 6e 04          	mov    0x4(%rsi),%r13d
   18d7b:	8b 46 08             	mov    0x8(%rsi),%eax
   18d7e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
   18d83:	41 89 cf             	mov    %ecx,%r15d
   18d86:	84 c9                	test   %cl,%cl
   18d88:	74 3a                	je     18dc4 <<hyperinterval::float::F32Enclosure>::corner_image+0x74>
   18d8a:	48 89 e7             	mov    %rsp,%rdi
   18d8d:	be 00 00 00 80       	mov    $0x80000000,%esi
   18d92:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18d97:	4c 89 e9             	mov    %r13,%rcx
   18d9a:	4d 89 e0             	mov    %r12,%r8
   18d9d:	e8 9e 09 00 00       	call   19740 <<hyperinterval::ieee::Format>::div>
   18da2:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18da6:	0f 85 fa 00 00 00    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   18dac:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18db0:	8b 6c 24 10          	mov    0x10(%rsp),%ebp
   18db4:	e9 b5 00 00 00       	jmp    18e6e <<hyperinterval::float::F32Enclosure>::corner_image+0x11e>
   18db9:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   18dbf:	e9 f1 00 00 00       	jmp    18eb5 <<hyperinterval::float::F32Enclosure>::corner_image+0x165>
   18dc4:	44 89 e8             	mov    %r13d,%eax
   18dc7:	c1 e8 17             	shr    $0x17,%eax
   18dca:	0f b6 c0             	movzbl %al,%eax
   18dcd:	44 89 e9             	mov    %r13d,%ecx
   18dd0:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18dd6:	8d 90 6a ff ff ff    	lea    -0x96(%rax),%edx
   18ddc:	85 c0                	test   %eax,%eax
   18dde:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18de3:	0f 44 d0             	cmove  %eax,%edx
   18de6:	48 8d b1 00 00 80 00 	lea    0x800000(%rcx),%rsi
   18ded:	48 0f 44 f1          	cmove  %rcx,%rsi
   18df1:	44 89 e1             	mov    %r12d,%ecx
   18df4:	c1 e9 17             	shr    $0x17,%ecx
   18df7:	0f b6 c9             	movzbl %cl,%ecx
   18dfa:	44 89 e7             	mov    %r12d,%edi
   18dfd:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   18e03:	44 8d 81 6a ff ff ff 	lea    -0x96(%rcx),%r8d
   18e0a:	85 c9                	test   %ecx,%ecx
   18e0c:	44 0f 44 c0          	cmove  %eax,%r8d
   18e10:	48 8d 87 00 00 80 00 	lea    0x800000(%rdi),%rax
   18e17:	48 0f 44 c7          	cmove  %rdi,%rax
   18e1b:	44 89 e1             	mov    %r12d,%ecx
   18e1e:	44 31 e9             	xor    %r13d,%ecx
   18e21:	48 0f af c6          	imul   %rsi,%rax
   18e25:	41 01 d0             	add    %edx,%r8d
   18e28:	c1 e9 1f             	shr    $0x1f,%ecx
   18e2b:	88 4c 24 14          	mov    %cl,0x14(%rsp)
   18e2f:	48 89 04 24          	mov    %rax,(%rsp)
   18e33:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18e3a:	00 00 
   18e3c:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)
   18e41:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18e46:	48 89 e1             	mov    %rsp,%rcx
   18e49:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e4e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e53:	e8 f8 05 00 00       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   18e58:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18e5d:	74 07                	je     18e66 <<hyperinterval::float::F32Enclosure>::corner_image+0x116>
   18e5f:	0f b6 6c 24 21       	movzbl 0x21(%rsp),%ebp
   18e64:	eb 45                	jmp    18eab <<hyperinterval::float::F32Enclosure>::corner_image+0x15b>
   18e66:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18e6a:	8b 6c 24 30          	mov    0x30(%rsp),%ebp
   18e6e:	48 89 e7             	mov    %rsp,%rdi
   18e71:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e76:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e7b:	e8 90 fe ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   18e80:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18e84:	75 20                	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   18e86:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   18e8b:	48 89 e7             	mov    %rsp,%rdi
   18e8e:	be 00 00 00 80       	mov    $0x80000000,%esi
   18e93:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18e98:	48 89 e9             	mov    %rbp,%rcx
   18e9b:	e8 70 fe ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   18ea0:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18ea4:	74 1e                	je     18ec4 <<hyperinterval::float::F32Enclosure>::corner_image+0x174>
   18ea6:	0f b6 6c 24 01       	movzbl 0x1(%rsp),%ebp
   18eab:	40 88 6b 04          	mov    %bpl,0x4(%rbx)
   18eaf:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   18eb5:	48 83 c4 58          	add    $0x58,%rsp
   18eb9:	5b                   	pop    %rbx
   18eba:	41 5c                	pop    %r12
   18ebc:	41 5d                	pop    %r13
   18ebe:	41 5e                	pop    %r14
   18ec0:	41 5f                	pop    %r15
   18ec2:	5d                   	pop    %rbp
   18ec3:	c3                   	ret
   18ec4:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   18ec9:	44 89 f0             	mov    %r14d,%eax
   18ecc:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   18ed1:	89 f9                	mov    %edi,%ecx
   18ed3:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   18ed9:	ba 00 00 00 80       	mov    $0x80000000,%edx
   18ede:	29 c2                	sub    %eax,%edx
   18ee0:	be 00 00 00 80       	mov    $0x80000000,%esi
   18ee5:	09 f0                	or     %esi,%eax
   18ee7:	45 85 f6             	test   %r14d,%r14d
   18eea:	48 0f 49 d0          	cmovns %rax,%rdx
   18eee:	b8 00 00 00 80       	mov    $0x80000000,%eax
   18ef3:	29 c8                	sub    %ecx,%eax
   18ef5:	09 f1                	or     %esi,%ecx
   18ef7:	85 ff                	test   %edi,%edi
   18ef9:	48 0f 49 c1          	cmovns %rcx,%rax
   18efd:	40 b5 01             	mov    $0x1,%bpl
   18f00:	39 c2                	cmp    %eax,%edx
   18f02:	77 a7                	ja     18eab <<hyperinterval::float::F32Enclosure>::corner_image+0x15b>
   18f04:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   18f09:	45 84 ff             	test   %r15b,%r15b
   18f0c:	74 2d                	je     18f3b <<hyperinterval::float::F32Enclosure>::corner_image+0x1eb>
   18f0e:	48 89 e7             	mov    %rsp,%rdi
   18f11:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18f16:	4c 89 e9             	mov    %r13,%rcx
   18f19:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   18f1e:	e8 1d 08 00 00       	call   19740 <<hyperinterval::ieee::Format>::div>
   18f23:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   18f27:	0f 85 79 ff ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   18f2d:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   18f31:	44 8b 6c 24 10       	mov    0x10(%rsp),%r13d
   18f36:	e9 ac 00 00 00       	jmp    18fe7 <<hyperinterval::float::F32Enclosure>::corner_image+0x297>
   18f3b:	44 89 e8             	mov    %r13d,%eax
   18f3e:	c1 e8 17             	shr    $0x17,%eax
   18f41:	0f b6 c0             	movzbl %al,%eax
   18f44:	44 89 e9             	mov    %r13d,%ecx
   18f47:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   18f4d:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   18f54:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   18f5a:	85 c0                	test   %eax,%eax
   18f5c:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   18f61:	0f 44 f0             	cmove  %eax,%esi
   18f64:	48 0f 44 d1          	cmove  %rcx,%rdx
   18f68:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   18f6d:	44 89 d1             	mov    %r10d,%ecx
   18f70:	c1 e9 17             	shr    $0x17,%ecx
   18f73:	0f b6 c9             	movzbl %cl,%ecx
   18f76:	44 89 d7             	mov    %r10d,%edi
   18f79:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   18f7f:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   18f86:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   18f8d:	85 c9                	test   %ecx,%ecx
   18f8f:	44 0f 44 c8          	cmove  %eax,%r9d
   18f93:	4c 0f 44 c7          	cmove  %rdi,%r8
   18f97:	45 31 d5             	xor    %r10d,%r13d
   18f9a:	4c 0f af c2          	imul   %rdx,%r8
   18f9e:	41 01 f1             	add    %esi,%r9d
   18fa1:	41 c1 ed 1f          	shr    $0x1f,%r13d
   18fa5:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   18faa:	4c 89 04 24          	mov    %r8,(%rsp)
   18fae:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   18fb5:	00 00 
   18fb7:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   18fbc:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   18fc1:	48 89 e1             	mov    %rsp,%rcx
   18fc4:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fc9:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18fce:	e8 7d 04 00 00       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   18fd3:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   18fd8:	0f 85 81 fe ff ff    	jne    18e5f <<hyperinterval::float::F32Enclosure>::corner_image+0x10f>
   18fde:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   18fe2:	44 8b 6c 24 30       	mov    0x30(%rsp),%r13d
   18fe7:	48 89 e7             	mov    %rsp,%rdi
   18fea:	be 00 00 00 80       	mov    $0x80000000,%esi
   18fef:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   18ff4:	e8 17 fd ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   18ff9:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   18ffd:	0f 84 a3 fe ff ff    	je     18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   19003:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19008:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1900d:	48 89 e7             	mov    %rsp,%rdi
   19010:	be 00 00 00 80       	mov    $0x80000000,%esi
   19015:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1901a:	4c 89 e9             	mov    %r13,%rcx
   1901d:	e8 ee fc ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   19022:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19026:	0f 84 7a fe ff ff    	je     18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   1902c:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   19031:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   19036:	44 89 c1             	mov    %r8d,%ecx
   19039:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1903f:	44 89 e8             	mov    %r13d,%eax
   19042:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   19047:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1904c:	48 29 ca             	sub    %rcx,%rdx
   1904f:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19054:	48 09 f9             	or     %rdi,%rcx
   19057:	45 85 c0             	test   %r8d,%r8d
   1905a:	48 0f 48 ca          	cmovs  %rdx,%rcx
   1905e:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19063:	48 29 c2             	sub    %rax,%rdx
   19066:	48 09 f8             	or     %rdi,%rax
   19069:	45 85 ed             	test   %r13d,%r13d
   1906c:	48 0f 48 c2          	cmovs  %rdx,%rax
   19070:	48 39 c1             	cmp    %rax,%rcx
   19073:	0f 87 32 fe ff ff    	ja     18eab <<hyperinterval::float::F32Enclosure>::corner_image+0x15b>
   19079:	44 89 f2             	mov    %r14d,%edx
   1907c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19082:	be 00 00 00 80       	mov    $0x80000000,%esi
   19087:	29 d6                	sub    %edx,%esi
   19089:	09 fa                	or     %edi,%edx
   1908b:	45 85 f6             	test   %r14d,%r14d
   1908e:	48 0f 49 f2          	cmovns %rdx,%rsi
   19092:	39 ce                	cmp    %ecx,%esi
   19094:	45 0f 46 c6          	cmovbe %r14d,%r8d
   19098:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
   1909d:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
   190a2:	89 f1                	mov    %esi,%ecx
   190a4:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   190aa:	ba 00 00 00 80       	mov    $0x80000000,%edx
   190af:	29 ca                	sub    %ecx,%edx
   190b1:	09 f9                	or     %edi,%ecx
   190b3:	85 f6                	test   %esi,%esi
   190b5:	48 0f 49 d1          	cmovns %rcx,%rdx
   190b9:	39 c2                	cmp    %eax,%edx
   190bb:	44 0f 43 ee          	cmovae %esi,%r13d
   190bf:	45 84 ff             	test   %r15b,%r15b
   190c2:	74 32                	je     190f6 <<hyperinterval::float::F32Enclosure>::corner_image+0x3a6>
   190c4:	48 89 e7             	mov    %rsp,%rdi
   190c7:	be 00 00 00 80       	mov    $0x80000000,%esi
   190cc:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   190d1:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   190d6:	4d 89 e0             	mov    %r12,%r8
   190d9:	e8 62 06 00 00       	call   19740 <<hyperinterval::ieee::Format>::div>
   190de:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   190e2:	0f 85 be fd ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   190e8:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   190ec:	44 8b 64 24 10       	mov    0x10(%rsp),%r12d
   190f1:	e9 ac 00 00 00       	jmp    191a2 <<hyperinterval::float::F32Enclosure>::corner_image+0x452>
   190f6:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
   190fb:	44 89 d0             	mov    %r10d,%eax
   190fe:	c1 e8 17             	shr    $0x17,%eax
   19101:	0f b6 c0             	movzbl %al,%eax
   19104:	44 89 d1             	mov    %r10d,%ecx
   19107:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   1910d:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19114:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   1911a:	85 c0                	test   %eax,%eax
   1911c:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   19121:	0f 44 f0             	cmove  %eax,%esi
   19124:	48 0f 44 d1          	cmove  %rcx,%rdx
   19128:	44 89 e1             	mov    %r12d,%ecx
   1912b:	c1 e9 17             	shr    $0x17,%ecx
   1912e:	0f b6 c9             	movzbl %cl,%ecx
   19131:	44 89 e7             	mov    %r12d,%edi
   19134:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   1913a:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   19141:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   19148:	85 c9                	test   %ecx,%ecx
   1914a:	44 0f 44 c8          	cmove  %eax,%r9d
   1914e:	4c 0f 44 c7          	cmove  %rdi,%r8
   19152:	45 31 d4             	xor    %r10d,%r12d
   19155:	4c 0f af c2          	imul   %rdx,%r8
   19159:	41 01 f1             	add    %esi,%r9d
   1915c:	41 c1 ec 1f          	shr    $0x1f,%r12d
   19160:	44 88 64 24 14       	mov    %r12b,0x14(%rsp)
   19165:	4c 89 04 24          	mov    %r8,(%rsp)
   19169:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19170:	00 00 
   19172:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   19177:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1917c:	48 89 e1             	mov    %rsp,%rcx
   1917f:	be 00 00 00 80       	mov    $0x80000000,%esi
   19184:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19189:	e8 c2 02 00 00       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1918e:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   19193:	0f 85 c6 fc ff ff    	jne    18e5f <<hyperinterval::float::F32Enclosure>::corner_image+0x10f>
   19199:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   1919d:	44 8b 64 24 30       	mov    0x30(%rsp),%r12d
   191a2:	48 89 e7             	mov    %rsp,%rdi
   191a5:	be 00 00 00 80       	mov    $0x80000000,%esi
   191aa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191af:	e8 5c fb ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   191b4:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   191b8:	0f 85 e8 fc ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   191be:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   191c3:	48 89 e7             	mov    %rsp,%rdi
   191c6:	be 00 00 00 80       	mov    $0x80000000,%esi
   191cb:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   191d0:	4c 89 e1             	mov    %r12,%rcx
   191d3:	e8 38 fb ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   191d8:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   191dc:	0f 85 c4 fc ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   191e2:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   191e7:	44 89 f1             	mov    %r14d,%ecx
   191ea:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   191f0:	44 89 e0             	mov    %r12d,%eax
   191f3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
   191f8:	ba 00 00 00 80       	mov    $0x80000000,%edx
   191fd:	48 29 ca             	sub    %rcx,%rdx
   19200:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   19206:	4c 09 c1             	or     %r8,%rcx
   19209:	45 85 f6             	test   %r14d,%r14d
   1920c:	48 0f 48 ca          	cmovs  %rdx,%rcx
   19210:	ba 00 00 00 80       	mov    $0x80000000,%edx
   19215:	48 29 c2             	sub    %rax,%rdx
   19218:	4c 09 c0             	or     %r8,%rax
   1921b:	45 85 e4             	test   %r12d,%r12d
   1921e:	48 0f 48 c2          	cmovs  %rdx,%rax
   19222:	48 39 c1             	cmp    %rax,%rcx
   19225:	0f 87 80 fc ff ff    	ja     18eab <<hyperinterval::float::F32Enclosure>::corner_image+0x15b>
   1922b:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
   19230:	44 89 ca             	mov    %r9d,%edx
   19233:	44 09 c2             	or     %r8d,%edx
   19236:	44 89 ce             	mov    %r9d,%esi
   19239:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1923f:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19244:	29 f7                	sub    %esi,%edi
   19246:	45 85 c9             	test   %r9d,%r9d
   19249:	48 0f 49 fa          	cmovns %rdx,%rdi
   1924d:	39 cf                	cmp    %ecx,%edi
   1924f:	45 0f 46 f1          	cmovbe %r9d,%r14d
   19253:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
   19258:	44 89 e9             	mov    %r13d,%ecx
   1925b:	44 09 c1             	or     %r8d,%ecx
   1925e:	44 89 ea             	mov    %r13d,%edx
   19261:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19267:	be 00 00 00 80       	mov    $0x80000000,%esi
   1926c:	29 d6                	sub    %edx,%esi
   1926e:	45 85 ed             	test   %r13d,%r13d
   19271:	48 0f 49 f1          	cmovns %rcx,%rsi
   19275:	39 c6                	cmp    %eax,%esi
   19277:	45 0f 43 e5          	cmovae %r13d,%r12d
   1927b:	45 84 ff             	test   %r15b,%r15b
   1927e:	74 34                	je     192b4 <<hyperinterval::float::F32Enclosure>::corner_image+0x564>
   19280:	48 89 e7             	mov    %rsp,%rdi
   19283:	be 00 00 00 80       	mov    $0x80000000,%esi
   19288:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1928d:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
   19292:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
   19297:	e8 a4 04 00 00       	call   19740 <<hyperinterval::ieee::Format>::div>
   1929c:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   192a0:	0f 85 00 fc ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   192a6:	8b 4c 24 08          	mov    0x8(%rsp),%ecx
   192aa:	44 8b 74 24 10       	mov    0x10(%rsp),%r14d
   192af:	e9 b1 00 00 00       	jmp    19365 <<hyperinterval::float::F32Enclosure>::corner_image+0x615>
   192b4:	4c 8b 5c 24 38       	mov    0x38(%rsp),%r11
   192b9:	44 89 d8             	mov    %r11d,%eax
   192bc:	c1 e8 17             	shr    $0x17,%eax
   192bf:	0f b6 c0             	movzbl %al,%eax
   192c2:	44 89 d9             	mov    %r11d,%ecx
   192c5:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   192cb:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   192d2:	8d b0 6a ff ff ff    	lea    -0x96(%rax),%esi
   192d8:	85 c0                	test   %eax,%eax
   192da:	b8 6b ff ff ff       	mov    $0xffffff6b,%eax
   192df:	0f 44 f0             	cmove  %eax,%esi
   192e2:	48 0f 44 d1          	cmove  %rcx,%rdx
   192e6:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   192eb:	44 89 d1             	mov    %r10d,%ecx
   192ee:	c1 e9 17             	shr    $0x17,%ecx
   192f1:	0f b6 c9             	movzbl %cl,%ecx
   192f4:	44 89 d7             	mov    %r10d,%edi
   192f7:	81 e7 ff ff 7f 00    	and    $0x7fffff,%edi
   192fd:	4c 8d 87 00 00 80 00 	lea    0x800000(%rdi),%r8
   19304:	44 8d 89 6a ff ff ff 	lea    -0x96(%rcx),%r9d
   1930b:	85 c9                	test   %ecx,%ecx
   1930d:	44 0f 44 c8          	cmove  %eax,%r9d
   19311:	4c 0f 44 c7          	cmove  %rdi,%r8
   19315:	45 31 da             	xor    %r11d,%r10d
   19318:	4c 0f af c2          	imul   %rdx,%r8
   1931c:	41 01 f1             	add    %esi,%r9d
   1931f:	41 c1 ea 1f          	shr    $0x1f,%r10d
   19323:	44 88 54 24 14       	mov    %r10b,0x14(%rsp)
   19328:	4c 89 04 24          	mov    %r8,(%rsp)
   1932c:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19333:	00 00 
   19335:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1933a:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
   1933f:	48 89 e1             	mov    %rsp,%rcx
   19342:	be 00 00 00 80       	mov    $0x80000000,%esi
   19347:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1934c:	e8 ff 00 00 00       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   19351:	80 7c 24 20 00       	cmpb   $0x0,0x20(%rsp)
   19356:	0f 85 03 fb ff ff    	jne    18e5f <<hyperinterval::float::F32Enclosure>::corner_image+0x10f>
   1935c:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
   19360:	44 8b 74 24 30       	mov    0x30(%rsp),%r14d
   19365:	48 89 e7             	mov    %rsp,%rdi
   19368:	be 00 00 00 80       	mov    $0x80000000,%esi
   1936d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19372:	e8 99 f9 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   19377:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1937b:	0f 85 25 fb ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   19381:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19386:	48 89 e7             	mov    %rsp,%rdi
   19389:	be 00 00 00 80       	mov    $0x80000000,%esi
   1938e:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19393:	4c 89 f1             	mov    %r14,%rcx
   19396:	e8 75 f9 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1939b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1939f:	0f 85 01 fb ff ff    	jne    18ea6 <<hyperinterval::float::F32Enclosure>::corner_image+0x156>
   193a5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   193aa:	44 89 fa             	mov    %r15d,%edx
   193ad:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   193b3:	89 c1                	mov    %eax,%ecx
   193b5:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   193bb:	be 00 00 00 80       	mov    $0x80000000,%esi
   193c0:	48 29 d6             	sub    %rdx,%rsi
   193c3:	bf 00 00 00 80       	mov    $0x80000000,%edi
   193c8:	48 09 fa             	or     %rdi,%rdx
   193cb:	45 85 ff             	test   %r15d,%r15d
   193ce:	48 0f 48 d6          	cmovs  %rsi,%rdx
   193d2:	be 00 00 00 80       	mov    $0x80000000,%esi
   193d7:	48 29 ce             	sub    %rcx,%rsi
   193da:	48 09 f9             	or     %rdi,%rcx
   193dd:	85 c0                	test   %eax,%eax
   193df:	48 0f 48 ce          	cmovs  %rsi,%rcx
   193e3:	48 39 ca             	cmp    %rcx,%rdx
   193e6:	0f 87 bf fa ff ff    	ja     18eab <<hyperinterval::float::F32Enclosure>::corner_image+0x15b>
   193ec:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
   193f1:	44 89 d6             	mov    %r10d,%esi
   193f4:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   193fa:	44 09 ce             	or     %r9d,%esi
   193fd:	44 89 d7             	mov    %r10d,%edi
   19400:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   19406:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1940c:	41 29 f8             	sub    %edi,%r8d
   1940f:	45 85 d2             	test   %r10d,%r10d
   19412:	4c 0f 49 c6          	cmovns %rsi,%r8
   19416:	41 39 d0             	cmp    %edx,%r8d
   19419:	45 0f 46 fa          	cmovbe %r10d,%r15d
   1941d:	44 89 e2             	mov    %r12d,%edx
   19420:	44 09 ca             	or     %r9d,%edx
   19423:	44 89 e6             	mov    %r12d,%esi
   19426:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1942c:	41 29 f1             	sub    %esi,%r9d
   1942f:	45 85 e4             	test   %r12d,%r12d
   19432:	4c 0f 49 ca          	cmovns %rdx,%r9
   19436:	41 39 c9             	cmp    %ecx,%r9d
   19439:	41 0f 43 c4          	cmovae %r12d,%eax
   1943d:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   19443:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   19447:	89 43 08             	mov    %eax,0x8(%rbx)
   1944a:	e9 66 fa ff ff       	jmp    18eb5 <<hyperinterval::float::F32Enclosure>::corner_image+0x165>
   1944f:	cc                   	int3

<hyperinterval::ieee::Format>::rounded:
   19450:	48 89 c8             	mov    %rcx,%rax
   19453:	4c 8b 11             	mov    (%rcx),%r10
   19456:	4c 8b 59 08          	mov    0x8(%rcx),%r11
   1945a:	4c 89 d1             	mov    %r10,%rcx
   1945d:	4c 09 d9             	or     %r11,%rcx
   19460:	0f 84 dd 00 00 00    	je     19543 <<hyperinterval::ieee::Format>::rounded+0xf3>
   19466:	55                   	push   %rbp
   19467:	41 57                	push   %r15
   19469:	41 56                	push   %r14
   1946b:	41 55                	push   %r13
   1946d:	41 54                	push   %r12
   1946f:	53                   	push   %rbx
   19470:	8b 68 10             	mov    0x10(%rax),%ebp
   19473:	49 0f bd cb          	bsr    %r11,%rcx
   19477:	83 f1 3f             	xor    $0x3f,%ecx
   1947a:	49 0f bd da          	bsr    %r10,%rbx
   1947e:	83 f3 3f             	xor    $0x3f,%ebx
   19481:	83 cb 40             	or     $0x40,%ebx
   19484:	4d 85 db             	test   %r11,%r11
   19487:	0f 45 d9             	cmovne %ecx,%ebx
   1948a:	f3 4c 0f bc c2       	tzcnt  %rdx,%r8
   1948f:	44 89 c1             	mov    %r8d,%ecx
   19492:	48 d3 ea             	shr    %cl,%rdx
   19495:	83 f3 7f             	xor    $0x7f,%ebx
   19498:	01 eb                	add    %ebp,%ebx
   1949a:	48 d1 ea             	shr    $1,%rdx
   1949d:	39 d3                	cmp    %edx,%ebx
   1949f:	0f 8f 88 01 00 00    	jg     1962d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   194a5:	45 8d 0c 10          	lea    (%r8,%rdx,1),%r9d
   194a9:	b9 01 00 00 00       	mov    $0x1,%ecx
   194ae:	44 29 c9             	sub    %r9d,%ecx
   194b1:	44 29 c3             	sub    %r8d,%ebx
   194b4:	39 cb                	cmp    %ecx,%ebx
   194b6:	0f 4e d9             	cmovle %ecx,%ebx
   194b9:	89 d9                	mov    %ebx,%ecx
   194bb:	29 e9                	sub    %ebp,%ecx
   194bd:	83 f9 7f             	cmp    $0x7f,%ecx
   194c0:	0f 8e 88 00 00 00    	jle    1954e <<hyperinterval::ieee::Format>::rounded+0xfe>
   194c6:	41 b7 01             	mov    $0x1,%r15b
   194c9:	45 31 f6             	xor    %r14d,%r14d
   194cc:	45 31 db             	xor    %r11d,%r11d
   194cf:	45 31 d2             	xor    %r10d,%r10d
   194d2:	45 0f b6 ff          	movzbl %r15b,%r15d
   194d6:	4d 01 f7             	add    %r14,%r15
   194d9:	49 83 d3 00          	adc    $0x0,%r11
   194dd:	4c 89 f9             	mov    %r15,%rcx
   194e0:	4c 09 d9             	or     %r11,%rcx
   194e3:	0f 84 c3 00 00 00    	je     195ac <<hyperinterval::ieee::Format>::rounded+0x15c>
   194e9:	49 0f bd cb          	bsr    %r11,%rcx
   194ed:	83 f1 3f             	xor    $0x3f,%ecx
   194f0:	4d 0f bd f7          	bsr    %r15,%r14
   194f4:	41 83 f6 3f          	xor    $0x3f,%r14d
   194f8:	41 83 ce 40          	or     $0x40,%r14d
   194fc:	4d 85 db             	test   %r11,%r11
   194ff:	44 0f 45 f1          	cmovne %ecx,%r14d
   19503:	41 83 f6 7f          	xor    $0x7f,%r14d
   19507:	41 8d 2c 1e          	lea    (%r14,%rbx,1),%ebp
   1950b:	39 d5                	cmp    %edx,%ebp
   1950d:	0f 8f 1a 01 00 00    	jg     1962d <<hyperinterval::ieee::Format>::rounded+0x1dd>
   19513:	b9 01 00 00 00       	mov    $0x1,%ecx
   19518:	29 d1                	sub    %edx,%ecx
   1951a:	39 cd                	cmp    %ecx,%ebp
   1951c:	0f 8d 41 01 00 00    	jge    19663 <<hyperinterval::ieee::Format>::rounded+0x213>
   19522:	41 01 d9             	add    %ebx,%r9d
   19525:	41 fe c9             	dec    %r9b
   19528:	44 89 c9             	mov    %r9d,%ecx
   1952b:	49 d3 e7             	shl    %cl,%r15
   1952e:	31 d2                	xor    %edx,%edx
   19530:	41 f6 c1 40          	test   $0x40,%r9b
   19534:	49 0f 44 d7          	cmove  %r15,%rdx
   19538:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   1953c:	74 76                	je     195b4 <<hyperinterval::ieee::Format>::rounded+0x164>
   1953e:	e9 8e 00 00 00       	jmp    195d1 <<hyperinterval::ieee::Format>::rounded+0x181>
   19543:	c6 07 00             	movb   $0x0,(%rdi)
   19546:	0f 57 c0             	xorps  %xmm0,%xmm0
   19549:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   1954d:	c3                   	ret
   1954e:	85 c9                	test   %ecx,%ecx
   19550:	0f 8e 88 00 00 00    	jle    195de <<hyperinterval::ieee::Format>::rounded+0x18e>
   19556:	4d 89 d6             	mov    %r10,%r14
   19559:	4d 0f ad de          	shrd   %cl,%r11,%r14
   1955d:	4d 89 dc             	mov    %r11,%r12
   19560:	49 d3 ec             	shr    %cl,%r12
   19563:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   1956a:	49 d3 e7             	shl    %cl,%r15
   1956d:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
   19574:	31 ed                	xor    %ebp,%ebp
   19576:	f6 c1 40             	test   $0x40,%cl
   19579:	4d 0f 45 f4          	cmovne %r12,%r14
   1957d:	4c 0f 45 e5          	cmovne %rbp,%r12
   19581:	4d 0f 45 ef          	cmovne %r15,%r13
   19585:	4c 0f 45 fd          	cmovne %rbp,%r15
   19589:	49 f7 d7             	not    %r15
   1958c:	49 f7 d5             	not    %r13
   1958f:	4d 21 dd             	and    %r11,%r13
   19592:	4d 21 d7             	and    %r10,%r15
   19595:	4d 09 ef             	or     %r13,%r15
   19598:	41 0f 95 c7          	setne  %r15b
   1959c:	4d 89 e3             	mov    %r12,%r11
   1959f:	4c 89 f1             	mov    %r14,%rcx
   195a2:	4c 09 d9             	or     %r11,%rcx
   195a5:	75 60                	jne    19607 <<hyperinterval::ieee::Format>::rounded+0x1b7>
   195a7:	e9 1d ff ff ff       	jmp    194c9 <<hyperinterval::ieee::Format>::rounded+0x79>
   195ac:	31 d2                	xor    %edx,%edx
   195ae:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   195b2:	75 1d                	jne    195d1 <<hyperinterval::ieee::Format>::rounded+0x181>
   195b4:	48 89 d0             	mov    %rdx,%rax
   195b7:	48 31 f0             	xor    %rsi,%rax
   195ba:	48 85 d2             	test   %rdx,%rdx
   195bd:	48 0f 44 c2          	cmove  %rdx,%rax
   195c1:	4c 31 d6             	xor    %r10,%rsi
   195c4:	4d 85 d2             	test   %r10,%r10
   195c7:	49 0f 44 f2          	cmove  %r10,%rsi
   195cb:	49 89 c2             	mov    %rax,%r10
   195ce:	48 89 f2             	mov    %rsi,%rdx
   195d1:	4c 89 57 08          	mov    %r10,0x8(%rdi)
   195d5:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   195d9:	c6 07 00             	movb   $0x0,(%rdi)
   195dc:	eb 54                	jmp    19632 <<hyperinterval::ieee::Format>::rounded+0x1e2>
   195de:	f6 d9                	neg    %cl
   195e0:	4d 0f a5 d3          	shld   %cl,%r10,%r11
   195e4:	49 d3 e2             	shl    %cl,%r10
   195e7:	45 31 ff             	xor    %r15d,%r15d
   195ea:	f6 c1 40             	test   $0x40,%cl
   195ed:	4d 0f 45 da          	cmovne %r10,%r11
   195f1:	41 be 00 00 00 00    	mov    $0x0,%r14d
   195f7:	4d 0f 44 f2          	cmove  %r10,%r14
   195fb:	4c 89 f1             	mov    %r14,%rcx
   195fe:	4c 09 d9             	or     %r11,%rcx
   19601:	0f 84 c2 fe ff ff    	je     194c9 <<hyperinterval::ieee::Format>::rounded+0x79>
   19607:	49 0f bd cb          	bsr    %r11,%rcx
   1960b:	83 f1 3f             	xor    $0x3f,%ecx
   1960e:	4d 0f bd e6          	bsr    %r14,%r12
   19612:	41 83 f4 3f          	xor    $0x3f,%r12d
   19616:	41 83 cc 40          	or     $0x40,%r12d
   1961a:	4d 85 db             	test   %r11,%r11
   1961d:	44 0f 45 e1          	cmovne %ecx,%r12d
   19621:	41 83 f4 7f          	xor    $0x7f,%r12d
   19625:	41 8d 2c 1c          	lea    (%r12,%rbx,1),%ebp
   19629:	39 d5                	cmp    %edx,%ebp
   1962b:	7e 10                	jle    1963d <<hyperinterval::ieee::Format>::rounded+0x1ed>
   1962d:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   19632:	5b                   	pop    %rbx
   19633:	41 5c                	pop    %r12
   19635:	41 5d                	pop    %r13
   19637:	41 5e                	pop    %r14
   19639:	41 5f                	pop    %r15
   1963b:	5d                   	pop    %rbp
   1963c:	c3                   	ret
   1963d:	b9 01 00 00 00       	mov    $0x1,%ecx
   19642:	29 d1                	sub    %edx,%ecx
   19644:	39 cd                	cmp    %ecx,%ebp
   19646:	7d 7d                	jge    196c5 <<hyperinterval::ieee::Format>::rounded+0x275>
   19648:	41 8d 0c 19          	lea    (%r9,%rbx,1),%ecx
   1964c:	fe c9                	dec    %cl
   1964e:	4d 89 f4             	mov    %r14,%r12
   19651:	49 d3 e4             	shl    %cl,%r12
   19654:	45 31 d2             	xor    %r10d,%r10d
   19657:	f6 c1 40             	test   $0x40,%cl
   1965a:	4d 0f 44 d4          	cmove  %r12,%r10
   1965e:	e9 6f fe ff ff       	jmp    194d2 <<hyperinterval::ieee::Format>::rounded+0x82>
   19663:	44 89 c1             	mov    %r8d,%ecx
   19666:	44 29 f1             	sub    %r14d,%ecx
   19669:	41 89 c9             	mov    %ecx,%r9d
   1966c:	41 f7 d9             	neg    %r9d
   1966f:	4c 89 fb             	mov    %r15,%rbx
   19672:	48 d3 e3             	shl    %cl,%rbx
   19675:	45 31 e4             	xor    %r12d,%r12d
   19678:	f6 c1 40             	test   $0x40,%cl
   1967b:	4c 0f 44 e3          	cmove  %rbx,%r12
   1967f:	44 89 c9             	mov    %r9d,%ecx
   19682:	4d 0f ad df          	shrd   %cl,%r11,%r15
   19686:	49 d3 eb             	shr    %cl,%r11
   19689:	41 f6 c1 40          	test   $0x40,%r9b
   1968d:	4d 0f 44 df          	cmove  %r15,%r11
   19691:	45 39 f0             	cmp    %r14d,%r8d
   19694:	4d 0f 43 dc          	cmovae %r12,%r11
   19698:	01 d5                	add    %edx,%ebp
   1969a:	4c 63 cd             	movslq %ebp,%r9
   1969d:	44 89 c1             	mov    %r8d,%ecx
   196a0:	49 d3 e1             	shl    %cl,%r9
   196a3:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   196aa:	48 d3 e2             	shl    %cl,%rdx
   196ad:	48 f7 d2             	not    %rdx
   196b0:	4c 21 da             	and    %r11,%rdx
   196b3:	4c 09 ca             	or     %r9,%rdx
   196b6:	80 78 14 01          	cmpb   $0x1,0x14(%rax)
   196ba:	0f 85 11 ff ff ff    	jne    195d1 <<hyperinterval::ieee::Format>::rounded+0x181>
   196c0:	e9 ef fe ff ff       	jmp    195b4 <<hyperinterval::ieee::Format>::rounded+0x164>
   196c5:	44 89 c1             	mov    %r8d,%ecx
   196c8:	44 29 e1             	sub    %r12d,%ecx
   196cb:	4d 89 f5             	mov    %r14,%r13
   196ce:	49 d3 e5             	shl    %cl,%r13
   196d1:	41 89 ca             	mov    %ecx,%r10d
   196d4:	41 f7 da             	neg    %r10d
   196d7:	48 c7 44 24 f0 00 00 	movq   $0x0,-0x10(%rsp)
   196de:	00 00 
   196e0:	f6 c1 40             	test   $0x40,%cl
   196e3:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
   196e8:	49 0f 44 cd          	cmove  %r13,%rcx
   196ec:	48 89 4c 24 f0       	mov    %rcx,-0x10(%rsp)
   196f1:	4d 89 f5             	mov    %r14,%r13
   196f4:	44 89 d1             	mov    %r10d,%ecx
   196f7:	4d 0f ad dd          	shrd   %cl,%r11,%r13
   196fb:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
   19700:	4d 89 dd             	mov    %r11,%r13
   19703:	49 d3 ed             	shr    %cl,%r13
   19706:	41 f6 c2 40          	test   $0x40,%r10b
   1970a:	4c 0f 44 6c 24 f8    	cmove  -0x8(%rsp),%r13
   19710:	45 39 e0             	cmp    %r12d,%r8d
   19713:	4c 0f 43 6c 24 f0    	cmovae -0x10(%rsp),%r13
   19719:	01 d5                	add    %edx,%ebp
   1971b:	4c 63 e5             	movslq %ebp,%r12
   1971e:	44 89 c1             	mov    %r8d,%ecx
   19721:	49 d3 e4             	shl    %cl,%r12
   19724:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
   1972b:	49 d3 e2             	shl    %cl,%r10
   1972e:	49 f7 d2             	not    %r10
   19731:	4d 21 ea             	and    %r13,%r10
   19734:	4d 09 e2             	or     %r12,%r10
   19737:	e9 96 fd ff ff       	jmp    194d2 <<hyperinterval::ieee::Format>::rounded+0x82>
   1973c:	cc                   	int3
   1973d:	cc                   	int3
   1973e:	cc                   	int3
   1973f:	cc                   	int3

<hyperinterval::ieee::Format>::div:
   19740:	55                   	push   %rbp
   19741:	41 57                	push   %r15
   19743:	41 56                	push   %r14
   19745:	41 55                	push   %r13
   19747:	41 54                	push   %r12
   19749:	53                   	push   %rbx
   1974a:	48 83 ec 38          	sub    $0x38,%rsp
   1974e:	4d 85 c0             	test   %r8,%r8
   19751:	74 47                	je     1979a <<hyperinterval::ieee::Format>::div+0x5a>
   19753:	48 85 c9             	test   %rcx,%rcx
   19756:	74 4c                	je     197a4 <<hyperinterval::ieee::Format>::div+0x64>
   19758:	f3 4c 0f bc f2       	tzcnt  %rdx,%r14
   1975d:	49 89 c9             	mov    %rcx,%r9
   19760:	49 21 d1             	and    %rdx,%r9
   19763:	48 89 c8             	mov    %rcx,%rax
   19766:	44 89 f1             	mov    %r14d,%ecx
   19769:	49 d3 e9             	shr    %cl,%r9
   1976c:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   19772:	49 d3 e2             	shl    %cl,%r10
   19775:	49 8d 6a ff          	lea    -0x1(%r10),%rbp
   19779:	49 89 ec             	mov    %rbp,%r12
   1977c:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19781:	49 21 c4             	and    %rax,%r12
   19784:	48 89 d0             	mov    %rdx,%rax
   19787:	48 d3 e8             	shr    %cl,%rax
   1978a:	4d 85 c9             	test   %r9,%r9
   1978d:	74 24                	je     197b3 <<hyperinterval::ieee::Format>::div+0x73>
   1978f:	4d 09 d4             	or     %r10,%r12
   19792:	48 d1 e8             	shr    $1,%rax
   19795:	44 01 f0             	add    %r14d,%eax
   19798:	eb 25                	jmp    197bf <<hyperinterval::ieee::Format>::div+0x7f>
   1979a:	66 c7 07 01 04       	movw   $0x401,(%rdi)
   1979f:	e9 ae 03 00 00       	jmp    19b52 <<hyperinterval::ieee::Format>::div+0x412>
   197a4:	c6 07 00             	movb   $0x0,(%rdi)
   197a7:	0f 57 c0             	xorps  %xmm0,%xmm0
   197aa:	0f 11 47 08          	movups %xmm0,0x8(%rdi)
   197ae:	e9 9f 03 00 00       	jmp    19b52 <<hyperinterval::ieee::Format>::div+0x412>
   197b3:	48 d1 e8             	shr    $1,%rax
   197b6:	44 01 f0             	add    %r14d,%eax
   197b9:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   197bf:	41 29 c1             	sub    %eax,%r9d
   197c2:	4d 89 c3             	mov    %r8,%r11
   197c5:	49 21 d3             	and    %rdx,%r11
   197c8:	44 89 f1             	mov    %r14d,%ecx
   197cb:	49 d3 eb             	shr    %cl,%r11
   197ce:	4c 21 c5             	and    %r8,%rbp
   197d1:	48 89 d0             	mov    %rdx,%rax
   197d4:	48 d3 e8             	shr    %cl,%rax
   197d7:	4d 85 db             	test   %r11,%r11
   197da:	74 0e                	je     197ea <<hyperinterval::ieee::Format>::div+0xaa>
   197dc:	4c 09 d5             	or     %r10,%rbp
   197df:	48 d1 e8             	shr    $1,%rax
   197e2:	44 01 f0             	add    %r14d,%eax
   197e5:	44 29 d8             	sub    %r11d,%eax
   197e8:	eb 08                	jmp    197f2 <<hyperinterval::ieee::Format>::div+0xb2>
   197ea:	48 d1 e8             	shr    $1,%rax
   197ed:	44 01 f0             	add    %r14d,%eax
   197f0:	ff c8                	dec    %eax
   197f2:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   197f7:	41 ba 7f 00 00 00    	mov    $0x7f,%r10d
   197fd:	4c 0f bd d5          	bsr    %rbp,%r10
   19801:	41 83 f2 3f          	xor    $0x3f,%r10d
   19805:	41 83 c2 40          	add    $0x40,%r10d
   19809:	49 0f bd cc          	bsr    %r12,%rcx
   1980d:	83 f1 3f             	xor    $0x3f,%ecx
   19810:	45 89 d7             	mov    %r10d,%r15d
   19813:	41 29 cf             	sub    %ecx,%r15d
   19816:	41 83 c7 c0          	add    $0xffffffc0,%r15d
   1981a:	78 26                	js     19842 <<hyperinterval::ieee::Format>::div+0x102>
   1981c:	45 31 db             	xor    %r11d,%r11d
   1981f:	44 89 f9             	mov    %r15d,%ecx
   19822:	49 0f a5 eb          	shld   %cl,%rbp,%r11
   19826:	31 db                	xor    %ebx,%ebx
   19828:	49 89 ed             	mov    %rbp,%r13
   1982b:	49 d3 e5             	shl    %cl,%r13
   1982e:	41 f6 c7 40          	test   $0x40,%r15b
   19832:	4d 0f 45 dd          	cmovne %r13,%r11
   19836:	4c 0f 45 eb          	cmovne %rbx,%r13
   1983a:	4d 39 ec             	cmp    %r13,%r12
   1983d:	4c 19 db             	sbb    %r11,%rbx
   19840:	eb 26                	jmp    19868 <<hyperinterval::ieee::Format>::div+0x128>
   19842:	44 89 f9             	mov    %r15d,%ecx
   19845:	f6 d9                	neg    %cl
   19847:	45 31 db             	xor    %r11d,%r11d
   1984a:	4d 0f a5 e3          	shld   %cl,%r12,%r11
   1984e:	31 db                	xor    %ebx,%ebx
   19850:	4d 89 e5             	mov    %r12,%r13
   19853:	49 d3 e5             	shl    %cl,%r13
   19856:	f6 c1 40             	test   $0x40,%cl
   19859:	4d 0f 45 dd          	cmovne %r13,%r11
   1985d:	4c 0f 45 eb          	cmovne %rbx,%r13
   19861:	49 39 ed             	cmp    %rbp,%r13
   19864:	49 83 db 00          	sbb    $0x0,%r11
   19868:	41 0f 92 c3          	setb   %r11b
   1986c:	44 89 f1             	mov    %r14d,%ecx
   1986f:	48 d3 ea             	shr    %cl,%rdx
   19872:	44 01 c8             	add    %r9d,%eax
   19875:	41 01 c7             	add    %eax,%r15d
   19878:	41 0f b6 cb          	movzbl %r11b,%ecx
   1987c:	41 29 cf             	sub    %ecx,%r15d
   1987f:	48 d1 ea             	shr    $1,%rdx
   19882:	41 39 d7             	cmp    %edx,%r15d
   19885:	0f 8f 0e 02 00 00    	jg     19a99 <<hyperinterval::ieee::Format>::div+0x359>
   1988b:	45 8d 0c 16          	lea    (%r14,%rdx,1),%r9d
   1988f:	b9 01 00 00 00       	mov    $0x1,%ecx
   19894:	4c 89 4c 24 08       	mov    %r9,0x8(%rsp)
   19899:	44 29 c9             	sub    %r9d,%ecx
   1989c:	45 29 f7             	sub    %r14d,%r15d
   1989f:	41 39 cf             	cmp    %ecx,%r15d
   198a2:	44 0f 4e f9          	cmovle %ecx,%r15d
   198a6:	44 29 f8             	sub    %r15d,%eax
   198a9:	78 61                	js     1990c <<hyperinterval::ieee::Format>::div+0x1cc>
   198ab:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   198b0:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   198b5:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   198ba:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   198bf:	48 85 ed             	test   %rbp,%rbp
   198c2:	0f 84 99 02 00 00    	je     19b61 <<hyperinterval::ieee::Format>::div+0x421>
   198c8:	45 31 ed             	xor    %r13d,%r13d
   198cb:	89 c1                	mov    %eax,%ecx
   198cd:	4d 0f a5 e5          	shld   %cl,%r12,%r13
   198d1:	31 d2                	xor    %edx,%edx
   198d3:	49 d3 e4             	shl    %cl,%r12
   198d6:	a8 40                	test   $0x40,%al
   198d8:	4d 0f 45 ec          	cmovne %r12,%r13
   198dc:	4c 0f 45 e2          	cmovne %rdx,%r12
   198e0:	4c 89 e7             	mov    %r12,%rdi
   198e3:	4c 89 ee             	mov    %r13,%rsi
   198e6:	48 89 ea             	mov    %rbp,%rdx
   198e9:	31 c9                	xor    %ecx,%ecx
   198eb:	ff 15 1f 6e 03 00    	call   *0x36e1f(%rip)        # 50710 <_DYNAMIC+0x298>
   198f1:	49 89 c2             	mov    %rax,%r10
   198f4:	49 89 d1             	mov    %rdx,%r9
   198f7:	48 89 d1             	mov    %rdx,%rcx
   198fa:	48 0f af cd          	imul   %rbp,%rcx
   198fe:	48 f7 e5             	mul    %rbp
   19901:	48 01 ca             	add    %rcx,%rdx
   19904:	49 29 c4             	sub    %rax,%r12
   19907:	49 19 d5             	sbb    %rdx,%r13
   1990a:	eb 79                	jmp    19985 <<hyperinterval::ieee::Format>::div+0x245>
   1990c:	f7 d8                	neg    %eax
   1990e:	44 39 d0             	cmp    %r10d,%eax
   19911:	7e 07                	jle    1991a <<hyperinterval::ieee::Format>::div+0x1da>
   19913:	b3 01                	mov    $0x1,%bl
   19915:	e9 df 00 00 00       	jmp    199f9 <<hyperinterval::ieee::Format>::div+0x2b9>
   1991a:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
   1991f:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
   19924:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
   19929:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
   1992e:	31 db                	xor    %ebx,%ebx
   19930:	89 c1                	mov    %eax,%ecx
   19932:	48 0f a5 eb          	shld   %cl,%rbp,%rbx
   19936:	48 d3 e5             	shl    %cl,%rbp
   19939:	31 c9                	xor    %ecx,%ecx
   1993b:	a8 40                	test   $0x40,%al
   1993d:	48 0f 45 dd          	cmovne %rbp,%rbx
   19941:	48 0f 45 e9          	cmovne %rcx,%rbp
   19945:	48 89 e8             	mov    %rbp,%rax
   19948:	48 09 d8             	or     %rbx,%rax
   1994b:	0f 84 1c 02 00 00    	je     19b6d <<hyperinterval::ieee::Format>::div+0x42d>
   19951:	45 31 ed             	xor    %r13d,%r13d
   19954:	4c 89 e7             	mov    %r12,%rdi
   19957:	31 f6                	xor    %esi,%esi
   19959:	48 89 ea             	mov    %rbp,%rdx
   1995c:	48 89 d9             	mov    %rbx,%rcx
   1995f:	ff 15 ab 6d 03 00    	call   *0x36dab(%rip)        # 50710 <_DYNAMIC+0x298>
   19965:	49 89 c2             	mov    %rax,%r10
   19968:	49 89 d1             	mov    %rdx,%r9
   1996b:	48 0f af d8          	imul   %rax,%rbx
   1996f:	48 f7 e5             	mul    %rbp
   19972:	48 01 da             	add    %rbx,%rdx
   19975:	4c 89 c9             	mov    %r9,%rcx
   19978:	48 0f af cd          	imul   %rbp,%rcx
   1997c:	48 01 d1             	add    %rdx,%rcx
   1997f:	49 29 c4             	sub    %rax,%r12
   19982:	49 19 cd             	sbb    %rcx,%r13
   19985:	4d 09 ec             	or     %r13,%r12
   19988:	0f 95 c3             	setne  %bl
   1998b:	4c 89 d0             	mov    %r10,%rax
   1998e:	4c 09 c8             	or     %r9,%rax
   19991:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
   19996:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
   1999b:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
   199a0:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
   199a5:	74 52                	je     199f9 <<hyperinterval::ieee::Format>::div+0x2b9>
   199a7:	49 0f bd c1          	bsr    %r9,%rax
   199ab:	83 f0 3f             	xor    $0x3f,%eax
   199ae:	4d 0f bd da          	bsr    %r10,%r11
   199b2:	41 83 f3 3f          	xor    $0x3f,%r11d
   199b6:	41 83 cb 40          	or     $0x40,%r11d
   199ba:	4d 85 c9             	test   %r9,%r9
   199bd:	44 0f 45 d8          	cmovne %eax,%r11d
   199c1:	41 83 f3 7f          	xor    $0x7f,%r11d
   199c5:	43 8d 2c 3b          	lea    (%r11,%r15,1),%ebp
   199c9:	39 d5                	cmp    %edx,%ebp
   199cb:	0f 8f c8 00 00 00    	jg     19a99 <<hyperinterval::ieee::Format>::div+0x359>
   199d1:	b8 01 00 00 00       	mov    $0x1,%eax
   199d6:	29 d0                	sub    %edx,%eax
   199d8:	39 c5                	cmp    %eax,%ebp
   199da:	7d 28                	jge    19a04 <<hyperinterval::ieee::Format>::div+0x2c4>
   199dc:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   199e1:	42 8d 0c 38          	lea    (%rax,%r15,1),%ecx
   199e5:	fe c9                	dec    %cl
   199e7:	4c 89 d0             	mov    %r10,%rax
   199ea:	48 d3 e0             	shl    %cl,%rax
   199ed:	45 31 db             	xor    %r11d,%r11d
   199f0:	f6 c1 40             	test   $0x40,%cl
   199f3:	4c 0f 44 d8          	cmove  %rax,%r11
   199f7:	eb 68                	jmp    19a61 <<hyperinterval::ieee::Format>::div+0x321>
   199f9:	45 31 d2             	xor    %r10d,%r10d
   199fc:	45 31 c9             	xor    %r9d,%r9d
   199ff:	45 31 db             	xor    %r11d,%r11d
   19a02:	eb 5d                	jmp    19a61 <<hyperinterval::ieee::Format>::div+0x321>
   19a04:	44 89 f1             	mov    %r14d,%ecx
   19a07:	44 29 d9             	sub    %r11d,%ecx
   19a0a:	4d 89 d4             	mov    %r10,%r12
   19a0d:	49 d3 e4             	shl    %cl,%r12
   19a10:	89 c8                	mov    %ecx,%eax
   19a12:	f7 d8                	neg    %eax
   19a14:	45 31 ed             	xor    %r13d,%r13d
   19a17:	f6 c1 40             	test   $0x40,%cl
   19a1a:	4d 0f 44 ec          	cmove  %r12,%r13
   19a1e:	4d 89 d4             	mov    %r10,%r12
   19a21:	89 c1                	mov    %eax,%ecx
   19a23:	4d 0f ad cc          	shrd   %cl,%r9,%r12
   19a27:	88 5c 24 07          	mov    %bl,0x7(%rsp)
   19a2b:	4c 89 cb             	mov    %r9,%rbx
   19a2e:	48 d3 eb             	shr    %cl,%rbx
   19a31:	a8 40                	test   $0x40,%al
   19a33:	49 0f 44 dc          	cmove  %r12,%rbx
   19a37:	45 39 de             	cmp    %r11d,%r14d
   19a3a:	49 0f 43 dd          	cmovae %r13,%rbx
   19a3e:	01 d5                	add    %edx,%ebp
   19a40:	48 63 c5             	movslq %ebp,%rax
   19a43:	44 89 f1             	mov    %r14d,%ecx
   19a46:	48 d3 e0             	shl    %cl,%rax
   19a49:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
   19a50:	49 d3 e3             	shl    %cl,%r11
   19a53:	49 f7 d3             	not    %r11
   19a56:	49 21 db             	and    %rbx,%r11
   19a59:	0f b6 5c 24 07       	movzbl 0x7(%rsp),%ebx
   19a5e:	49 09 c3             	or     %rax,%r11
   19a61:	0f b6 db             	movzbl %bl,%ebx
   19a64:	4c 01 d3             	add    %r10,%rbx
   19a67:	49 83 d1 00          	adc    $0x0,%r9
   19a6b:	48 89 d8             	mov    %rbx,%rax
   19a6e:	4c 09 c8             	or     %r9,%rax
   19a71:	74 30                	je     19aa3 <<hyperinterval::ieee::Format>::div+0x363>
   19a73:	49 0f bd c1          	bsr    %r9,%rax
   19a77:	83 f0 3f             	xor    $0x3f,%eax
   19a7a:	4c 0f bd d3          	bsr    %rbx,%r10
   19a7e:	41 83 f2 3f          	xor    $0x3f,%r10d
   19a82:	41 83 ca 40          	or     $0x40,%r10d
   19a86:	4d 85 c9             	test   %r9,%r9
   19a89:	44 0f 45 d0          	cmovne %eax,%r10d
   19a8d:	41 83 f2 7f          	xor    $0x7f,%r10d
   19a91:	43 8d 2c 3a          	lea    (%r10,%r15,1),%ebp
   19a95:	39 d5                	cmp    %edx,%ebp
   19a97:	7e 0e                	jle    19aa7 <<hyperinterval::ieee::Format>::div+0x367>
   19a99:	66 c7 07 01 03       	movw   $0x301,(%rdi)
   19a9e:	e9 af 00 00 00       	jmp    19b52 <<hyperinterval::ieee::Format>::div+0x412>
   19aa3:	31 c0                	xor    %eax,%eax
   19aa5:	eb 71                	jmp    19b18 <<hyperinterval::ieee::Format>::div+0x3d8>
   19aa7:	b8 01 00 00 00       	mov    $0x1,%eax
   19aac:	29 d0                	sub    %edx,%eax
   19aae:	39 c5                	cmp    %eax,%ebp
   19ab0:	7d 18                	jge    19aca <<hyperinterval::ieee::Format>::div+0x38a>
   19ab2:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   19ab7:	44 01 f9             	add    %r15d,%ecx
   19aba:	fe c9                	dec    %cl
   19abc:	48 d3 e3             	shl    %cl,%rbx
   19abf:	31 c0                	xor    %eax,%eax
   19ac1:	f6 c1 40             	test   $0x40,%cl
   19ac4:	48 0f 44 c3          	cmove  %rbx,%rax
   19ac8:	eb 4e                	jmp    19b18 <<hyperinterval::ieee::Format>::div+0x3d8>
   19aca:	44 89 f1             	mov    %r14d,%ecx
   19acd:	44 29 d1             	sub    %r10d,%ecx
   19ad0:	89 c8                	mov    %ecx,%eax
   19ad2:	f7 d8                	neg    %eax
   19ad4:	49 89 df             	mov    %rbx,%r15
   19ad7:	49 d3 e7             	shl    %cl,%r15
   19ada:	45 31 e4             	xor    %r12d,%r12d
   19add:	f6 c1 40             	test   $0x40,%cl
   19ae0:	4d 0f 44 e7          	cmove  %r15,%r12
   19ae4:	89 c1                	mov    %eax,%ecx
   19ae6:	4c 0f ad cb          	shrd   %cl,%r9,%rbx
   19aea:	49 d3 e9             	shr    %cl,%r9
   19aed:	a8 40                	test   $0x40,%al
   19aef:	4c 0f 44 cb          	cmove  %rbx,%r9
   19af3:	45 39 d6             	cmp    %r10d,%r14d
   19af6:	4d 0f 43 cc          	cmovae %r12,%r9
   19afa:	01 d5                	add    %edx,%ebp
   19afc:	48 63 d5             	movslq %ebp,%rdx
   19aff:	44 89 f1             	mov    %r14d,%ecx
   19b02:	48 d3 e2             	shl    %cl,%rdx
   19b05:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   19b0c:	48 d3 e0             	shl    %cl,%rax
   19b0f:	48 f7 d0             	not    %rax
   19b12:	4c 21 c8             	and    %r9,%rax
   19b15:	48 09 d0             	or     %rdx,%rax
   19b18:	48 85 74 24 30       	test   %rsi,0x30(%rsp)
   19b1d:	0f 95 c1             	setne  %cl
   19b20:	49 85 f0             	test   %rsi,%r8
   19b23:	0f 94 c2             	sete   %dl
   19b26:	30 ca                	xor    %cl,%dl
   19b28:	75 1d                	jne    19b47 <<hyperinterval::ieee::Format>::div+0x407>
   19b2a:	48 89 c1             	mov    %rax,%rcx
   19b2d:	48 31 f1             	xor    %rsi,%rcx
   19b30:	48 85 c0             	test   %rax,%rax
   19b33:	48 0f 44 c8          	cmove  %rax,%rcx
   19b37:	4c 31 de             	xor    %r11,%rsi
   19b3a:	4d 85 db             	test   %r11,%r11
   19b3d:	49 0f 44 f3          	cmove  %r11,%rsi
   19b41:	48 89 f0             	mov    %rsi,%rax
   19b44:	49 89 cb             	mov    %rcx,%r11
   19b47:	4c 89 5f 08          	mov    %r11,0x8(%rdi)
   19b4b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   19b4f:	c6 07 00             	movb   $0x0,(%rdi)
   19b52:	48 83 c4 38          	add    $0x38,%rsp
   19b56:	5b                   	pop    %rbx
   19b57:	41 5c                	pop    %r12
   19b59:	41 5d                	pop    %r13
   19b5b:	41 5e                	pop    %r14
   19b5d:	41 5f                	pop    %r15
   19b5f:	5d                   	pop    %rbp
   19b60:	c3                   	ret
   19b61:	48 8d 3d b8 54 03 00 	lea    0x354b8(%rip),%rdi        # 4f020 <__frame_dummy_init_array_entry+0x450>
   19b68:	e8 d3 c9 ff ff       	call   16540 <core::panicking::panic_const::panic_const_div_by_zero>
   19b6d:	48 8d 3d 94 54 03 00 	lea    0x35494(%rip),%rdi        # 4f008 <__frame_dummy_init_array_entry+0x438>
   19b74:	e8 c7 c9 ff ff       	call   16540 <core::panicking::panic_const::panic_const_div_by_zero>
   19b79:	cc                   	int3
   19b7a:	cc                   	int3
   19b7b:	cc                   	int3
   19b7c:	cc                   	int3
   19b7d:	cc                   	int3
   19b7e:	cc                   	int3
   19b7f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::square:
   19b80:	55                   	push   %rbp
   19b81:	41 57                	push   %r15
   19b83:	41 56                	push   %r14
   19b85:	41 55                	push   %r13
   19b87:	41 54                	push   %r12
   19b89:	53                   	push   %rbx
   19b8a:	48 83 ec 78          	sub    $0x78,%rsp
   19b8e:	48 89 fb             	mov    %rdi,%rbx
   19b91:	f6 06 01             	testb  $0x1,(%rsi)
   19b94:	0f 84 e9 00 00 00    	je     19c83 <<hyperinterval::float::F32Enclosure>::square+0x103>
   19b9a:	44 8b 76 04          	mov    0x4(%rsi),%r14d
   19b9e:	8b 6e 08             	mov    0x8(%rsi),%ebp
   19ba1:	44 89 f0             	mov    %r14d,%eax
   19ba4:	c1 e8 17             	shr    $0x17,%eax
   19ba7:	0f b6 c0             	movzbl %al,%eax
   19baa:	44 89 f1             	mov    %r14d,%ecx
   19bad:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19bb3:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19bba:	85 c0                	test   %eax,%eax
   19bbc:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19bc3:	48 0f 44 d1          	cmove  %rcx,%rdx
   19bc7:	41 bf d6 fe ff ff    	mov    $0xfffffed6,%r15d
   19bcd:	41 0f 44 c7          	cmove  %r15d,%eax
   19bd1:	48 0f af d2          	imul   %rdx,%rdx
   19bd5:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19bda:	48 89 14 24          	mov    %rdx,(%rsp)
   19bde:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19be5:	00 00 
   19be7:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19beb:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19bf0:	48 89 e1             	mov    %rsp,%rcx
   19bf3:	be 00 00 00 80       	mov    $0x80000000,%esi
   19bf8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19bfd:	e8 4e f8 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   19c02:	80 7c 24 38 00       	cmpb   $0x0,0x38(%rsp)
   19c07:	75 6a                	jne    19c73 <<hyperinterval::float::F32Enclosure>::square+0xf3>
   19c09:	44 8b 6c 24 40       	mov    0x40(%rsp),%r13d
   19c0e:	44 8b 64 24 48       	mov    0x48(%rsp),%r12d
   19c13:	89 e8                	mov    %ebp,%eax
   19c15:	c1 e8 17             	shr    $0x17,%eax
   19c18:	0f b6 c0             	movzbl %al,%eax
   19c1b:	89 e9                	mov    %ebp,%ecx
   19c1d:	81 e1 ff ff 7f 00    	and    $0x7fffff,%ecx
   19c23:	48 8d 91 00 00 80 00 	lea    0x800000(%rcx),%rdx
   19c2a:	85 c0                	test   %eax,%eax
   19c2c:	48 0f 44 d1          	cmove  %rcx,%rdx
   19c30:	8d 84 00 d4 fe ff ff 	lea    -0x12c(%rax,%rax,1),%eax
   19c37:	41 0f 44 c7          	cmove  %r15d,%eax
   19c3b:	48 0f af d2          	imul   %rdx,%rdx
   19c3f:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   19c44:	48 89 14 24          	mov    %rdx,(%rsp)
   19c48:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
   19c4f:	00 00 
   19c51:	89 44 24 10          	mov    %eax,0x10(%rsp)
   19c55:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
   19c5a:	48 89 e1             	mov    %rsp,%rcx
   19c5d:	be 00 00 00 80       	mov    $0x80000000,%esi
   19c62:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19c67:	e8 e4 f7 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   19c6c:	80 7c 24 38 01       	cmpb   $0x1,0x38(%rsp)
   19c71:	75 25                	jne    19c98 <<hyperinterval::float::F32Enclosure>::square+0x118>
   19c73:	0f b6 44 24 39       	movzbl 0x39(%rsp),%eax
   19c78:	88 43 04             	mov    %al,0x4(%rbx)
   19c7b:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19c81:	eb 06                	jmp    19c89 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19c83:	c7 03 00 00 00 00    	movl   $0x0,(%rbx)
   19c89:	48 83 c4 78          	add    $0x78,%rsp
   19c8d:	5b                   	pop    %rbx
   19c8e:	41 5c                	pop    %r12
   19c90:	41 5d                	pop    %r13
   19c92:	41 5e                	pop    %r14
   19c94:	41 5f                	pop    %r15
   19c96:	5d                   	pop    %rbp
   19c97:	c3                   	ret
   19c98:	8b 44 24 40          	mov    0x40(%rsp),%eax
   19c9c:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19ca1:	44 8b 7c 24 48       	mov    0x48(%rsp),%r15d
   19ca6:	48 89 e7             	mov    %rsp,%rdi
   19ca9:	be 00 00 00 80       	mov    $0x80000000,%esi
   19cae:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19cb3:	4c 89 e9             	mov    %r13,%rcx
   19cb6:	e8 55 f0 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   19cbb:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19cbf:	74 25                	je     19ce6 <<hyperinterval::float::F32Enclosure>::square+0x166>
   19cc1:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   19cc6:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   19ccb:	48 89 e7             	mov    %rsp,%rdi
   19cce:	be 00 00 00 80       	mov    $0x80000000,%esi
   19cd3:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19cd8:	4c 89 e1             	mov    %r12,%rcx
   19cdb:	e8 30 f0 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   19ce0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19ce4:	75 07                	jne    19ced <<hyperinterval::float::F32Enclosure>::square+0x16d>
   19ce6:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   19ceb:	eb 8b                	jmp    19c78 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19ced:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
   19cf2:	45 89 fd             	mov    %r15d,%r13d
   19cf5:	41 81 e5 ff ff ff 7f 	and    $0x7fffffff,%r13d
   19cfc:	41 89 d4             	mov    %edx,%r12d
   19cff:	41 81 e4 ff ff ff 7f 	and    $0x7fffffff,%r12d
   19d06:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19d0b:	4c 29 e8             	sub    %r13,%rax
   19d0e:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   19d13:	49 09 cd             	or     %rcx,%r13
   19d16:	45 85 ff             	test   %r15d,%r15d
   19d19:	4c 0f 48 e8          	cmovs  %rax,%r13
   19d1d:	b8 00 00 00 80       	mov    $0x80000000,%eax
   19d22:	4c 29 e0             	sub    %r12,%rax
   19d25:	49 09 cc             	or     %rcx,%r12
   19d28:	85 d2                	test   %edx,%edx
   19d2a:	4c 0f 48 e0          	cmovs  %rax,%r12
   19d2e:	b0 01                	mov    $0x1,%al
   19d30:	4d 39 e5             	cmp    %r12,%r13
   19d33:	0f 87 3f ff ff ff    	ja     19c78 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19d39:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19d3e:	48 89 e7             	mov    %rsp,%rdi
   19d41:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d46:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d4b:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
   19d50:	e8 bb ef ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   19d55:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d59:	74 27                	je     19d82 <<hyperinterval::float::F32Enclosure>::square+0x202>
   19d5b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19d60:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   19d65:	48 89 e7             	mov    %rsp,%rdi
   19d68:	be 00 00 00 80       	mov    $0x80000000,%esi
   19d6d:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   19d72:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   19d77:	e8 94 ef ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   19d7c:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   19d80:	75 13                	jne    19d95 <<hyperinterval::float::F32Enclosure>::square+0x215>
   19d82:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   19d87:	88 53 04             	mov    %dl,0x4(%rbx)
   19d8a:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   19d90:	e9 f4 fe ff ff       	jmp    19c89 <<hyperinterval::float::F32Enclosure>::square+0x109>
   19d95:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   19d9a:	4c 8b 44 24 50       	mov    0x50(%rsp),%r8
   19d9f:	44 89 c1             	mov    %r8d,%ecx
   19da2:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   19da8:	89 c2                	mov    %eax,%edx
   19daa:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   19db0:	be 00 00 00 80       	mov    $0x80000000,%esi
   19db5:	48 29 ce             	sub    %rcx,%rsi
   19db8:	bf 00 00 00 80       	mov    $0x80000000,%edi
   19dbd:	48 09 f9             	or     %rdi,%rcx
   19dc0:	45 85 c0             	test   %r8d,%r8d
   19dc3:	48 0f 48 ce          	cmovs  %rsi,%rcx
   19dc7:	48 8d 34 3a          	lea    (%rdx,%rdi,1),%rsi
   19dcb:	48 29 d7             	sub    %rdx,%rdi
   19dce:	85 c0                	test   %eax,%eax
   19dd0:	48 0f 49 fe          	cmovns %rsi,%rdi
   19dd4:	b2 01                	mov    $0x1,%dl
   19dd6:	48 39 f9             	cmp    %rdi,%rcx
   19dd9:	77 ac                	ja     19d87 <<hyperinterval::float::F32Enclosure>::square+0x207>
   19ddb:	41 39 cd             	cmp    %ecx,%r13d
   19dde:	45 0f 47 f8          	cmova  %r8d,%r15d
   19de2:	41 39 fc             	cmp    %edi,%r12d
   19de5:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
   19dea:	0f 42 c8             	cmovb  %eax,%ecx
   19ded:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%rsp)
   19df4:	00 
   19df5:	44 89 7c 24 2c       	mov    %r15d,0x2c(%rsp)
   19dfa:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
   19dfe:	45 85 f6             	test   %r14d,%r14d
   19e01:	7f 69                	jg     19e6c <<hyperinterval::float::F32Enclosure>::square+0x2ec>
   19e03:	85 ed                	test   %ebp,%ebp
   19e05:	0f 98 c0             	sets   %al
   19e08:	f7 c5 ff ff ff 7f    	test   $0x7fffffff,%ebp
   19e0e:	0f 95 c1             	setne  %cl
   19e11:	84 c8                	test   %cl,%al
   19e13:	75 57                	jne    19e6c <<hyperinterval::float::F32Enclosure>::square+0x2ec>
   19e15:	48 89 e7             	mov    %rsp,%rdi
   19e18:	e8 c3 05 00 00       	call   1a3e0 <<hyperinterval::float::F32Enclosure>::from_bits>
   19e1d:	8b 0c 24             	mov    (%rsp),%ecx
   19e20:	0f b6 44 24 04       	movzbl 0x4(%rsp),%eax
   19e25:	83 f9 02             	cmp    $0x2,%ecx
   19e28:	0f 84 4a fe ff ff    	je     19c78 <<hyperinterval::float::F32Enclosure>::square+0xf8>
   19e2e:	8b 54 24 05          	mov    0x5(%rsp),%edx
   19e32:	8b 74 24 08          	mov    0x8(%rsp),%esi
   19e36:	89 74 24 40          	mov    %esi,0x40(%rsp)
   19e3a:	89 54 24 3d          	mov    %edx,0x3d(%rsp)
   19e3e:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
   19e42:	88 44 24 3c          	mov    %al,0x3c(%rsp)
   19e46:	48 8d 7c 24 6c       	lea    0x6c(%rsp),%rdi
   19e4b:	48 8d 74 24 28       	lea    0x28(%rsp),%rsi
   19e50:	48 8d 54 24 38       	lea    0x38(%rsp),%rdx
   19e55:	e8 36 04 00 00       	call   1a290 <<hyperinterval::float::F32Enclosure>::hull>
   19e5a:	8b 44 24 74          	mov    0x74(%rsp),%eax
   19e5e:	89 44 24 30          	mov    %eax,0x30(%rsp)
   19e62:	48 8b 44 24 6c       	mov    0x6c(%rsp),%rax
   19e67:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
   19e6c:	8b 44 24 30          	mov    0x30(%rsp),%eax
   19e70:	89 43 08             	mov    %eax,0x8(%rbx)
   19e73:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   19e78:	48 89 03             	mov    %rax,(%rbx)
   19e7b:	e9 09 fe ff ff       	jmp    19c89 <<hyperinterval::float::F32Enclosure>::square+0x109>

<hyperinterval::ieee::Format>::power:
   19e80:	55                   	push   %rbp
   19e81:	41 57                	push   %r15
   19e83:	41 56                	push   %r14
   19e85:	41 55                	push   %r13
   19e87:	41 54                	push   %r12
   19e89:	53                   	push   %rbx
   19e8a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   19e91:	49 89 ca             	mov    %rcx,%r10
   19e94:	49 89 d6             	mov    %rdx,%r14
   19e97:	48 85 f1             	test   %rsi,%rcx
   19e9a:	0f 95 c0             	setne  %al
   19e9d:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   19ea2:	49 89 d3             	mov    %rdx,%r11
   19ea5:	44 89 c9             	mov    %r9d,%ecx
   19ea8:	49 d3 eb             	shr    %cl,%r11
   19eab:	49 d1 eb             	shr    $1,%r11
   19eae:	49 63 d3             	movslq %r11d,%rdx
   19eb1:	48 d3 e2             	shl    %cl,%rdx
   19eb4:	45 85 c0             	test   %r8d,%r8d
   19eb7:	0f 84 65 03 00 00    	je     1a222 <<hyperinterval::ieee::Format>::power+0x3a2>
   19ebd:	88 44 24 07          	mov    %al,0x7(%rsp)
   19ec1:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
   19ec6:	48 8d 46 ff          	lea    -0x1(%rsi),%rax
   19eca:	49 21 c2             	and    %rax,%r10
   19ecd:	bb 01 00 00 00       	mov    $0x1,%ebx
   19ed2:	44 89 c9             	mov    %r9d,%ecx
   19ed5:	48 d3 e3             	shl    %cl,%rbx
   19ed8:	48 8d 43 ff          	lea    -0x1(%rbx),%rax
   19edc:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   19ee1:	45 01 cb             	add    %r9d,%r11d
   19ee4:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   19eea:	45 29 df             	sub    %r11d,%r15d
   19eed:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   19ef2:	4c 8d 64 24 30       	lea    0x30(%rsp),%r12
   19ef7:	44 89 44 24 74       	mov    %r8d,0x74(%rsp)
   19efc:	44 89 c5             	mov    %r8d,%ebp
   19eff:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
   19f04:	4d 89 d5             	mov    %r10,%r13
   19f07:	48 89 54 24 58       	mov    %rdx,0x58(%rsp)
   19f0c:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   19f11:	4c 89 8c 24 80 00 00 	mov    %r9,0x80(%rsp)
   19f18:	00 
   19f19:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
   19f1e:	44 89 7c 24 0c       	mov    %r15d,0xc(%rsp)
   19f23:	48 89 b4 24 88 00 00 	mov    %rsi,0x88(%rsp)
   19f2a:	00 
   19f2b:	40 f6 c5 01          	test   $0x1,%bpl
   19f2f:	75 2f                	jne    19f60 <<hyperinterval::ieee::Format>::power+0xe0>
   19f31:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   19f38:	0f 1f 84 00 00 00 00 
   19f3f:	00 
   19f40:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   19f45:	d1 ed                	shr    $1,%ebp
   19f47:	0f 85 b6 01 00 00    	jne    1a103 <<hyperinterval::ieee::Format>::power+0x283>
   19f4d:	e9 13 03 00 00       	jmp    1a265 <<hyperinterval::ieee::Format>::power+0x3e5>
   19f52:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
   19f59:	1f 84 00 00 00 00 00 
   19f60:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   19f64:	4c 8b 44 24 60       	mov    0x60(%rsp),%r8
   19f69:	4c 89 c2             	mov    %r8,%rdx
   19f6c:	4c 21 f2             	and    %r14,%rdx
   19f6f:	44 89 c9             	mov    %r9d,%ecx
   19f72:	48 d3 ea             	shr    %cl,%rdx
   19f75:	4c 89 c0             	mov    %r8,%rax
   19f78:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19f7d:	48 21 e8             	and    %rbp,%rax
   19f80:	41 89 d2             	mov    %edx,%r10d
   19f83:	45 29 da             	sub    %r11d,%r10d
   19f86:	48 85 d2             	test   %rdx,%rdx
   19f89:	45 0f 44 d7          	cmove  %r15d,%r10d
   19f8d:	48 0f 45 d3          	cmovne %rbx,%rdx
   19f91:	48 09 c2             	or     %rax,%rdx
   19f94:	4c 89 e8             	mov    %r13,%rax
   19f97:	4c 21 f0             	and    %r14,%rax
   19f9a:	48 d3 e8             	shr    %cl,%rax
   19f9d:	4c 89 e9             	mov    %r13,%rcx
   19fa0:	48 21 e9             	and    %rbp,%rcx
   19fa3:	89 c5                	mov    %eax,%ebp
   19fa5:	44 29 dd             	sub    %r11d,%ebp
   19fa8:	48 85 c0             	test   %rax,%rax
   19fab:	41 0f 44 ef          	cmove  %r15d,%ebp
   19faf:	48 0f 45 c3          	cmovne %rbx,%rax
   19fb3:	48 09 c8             	or     %rcx,%rax
   19fb6:	49 85 f0             	test   %rsi,%r8
   19fb9:	0f 95 c1             	setne  %cl
   19fbc:	4c 89 ac 24 90 00 00 	mov    %r13,0x90(%rsp)
   19fc3:	00 
   19fc4:	49 85 f5             	test   %rsi,%r13
   19fc7:	41 0f 95 c0          	setne  %r8b
   19fcb:	48 f7 e2             	mul    %rdx
   19fce:	41 30 c8             	xor    %cl,%r8b
   19fd1:	44 01 d5             	add    %r10d,%ebp
   19fd4:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   19fd9:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   19fde:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   19fe3:	89 6c 24 40          	mov    %ebp,0x40(%rsp)
   19fe7:	4c 89 f2             	mov    %r14,%rdx
   19fea:	4c 89 e1             	mov    %r12,%rcx
   19fed:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   19ff2:	4d 89 dd             	mov    %r11,%r13
   19ff5:	4d 89 cc             	mov    %r9,%r12
   19ff8:	e8 53 f4 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   19ffd:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a002:	0f 85 09 02 00 00    	jne    1a211 <<hyperinterval::ieee::Format>::power+0x391>
   1a008:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
   1a00d:	4c 89 c2             	mov    %r8,%rdx
   1a010:	4c 21 f2             	and    %r14,%rdx
   1a013:	4d 89 f2             	mov    %r14,%r10
   1a016:	44 89 e1             	mov    %r12d,%ecx
   1a019:	48 d3 ea             	shr    %cl,%rdx
   1a01c:	4c 89 c7             	mov    %r8,%rdi
   1a01f:	48 21 ef             	and    %rbp,%rdi
   1a022:	89 d6                	mov    %edx,%esi
   1a024:	4d 89 ee             	mov    %r13,%r14
   1a027:	44 29 f6             	sub    %r14d,%esi
   1a02a:	48 85 d2             	test   %rdx,%rdx
   1a02d:	41 0f 44 f7          	cmove  %r15d,%esi
   1a031:	48 0f 45 d3          	cmovne %rbx,%rdx
   1a035:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
   1a03a:	4c 89 c8             	mov    %r9,%rax
   1a03d:	4c 21 d0             	and    %r10,%rax
   1a040:	4d 89 d5             	mov    %r10,%r13
   1a043:	48 d3 e8             	shr    %cl,%rax
   1a046:	48 09 fa             	or     %rdi,%rdx
   1a049:	4c 89 c9             	mov    %r9,%rcx
   1a04c:	48 21 e9             	and    %rbp,%rcx
   1a04f:	89 c7                	mov    %eax,%edi
   1a051:	44 29 f7             	sub    %r14d,%edi
   1a054:	48 85 c0             	test   %rax,%rax
   1a057:	41 0f 44 ff          	cmove  %r15d,%edi
   1a05b:	48 0f 45 c3          	cmovne %rbx,%rax
   1a05f:	48 09 c8             	or     %rcx,%rax
   1a062:	4c 8b bc 24 88 00 00 	mov    0x88(%rsp),%r15
   1a069:	00 
   1a06a:	4d 85 f8             	test   %r15,%r8
   1a06d:	0f 95 c1             	setne  %cl
   1a070:	4d 85 f9             	test   %r15,%r9
   1a073:	41 0f 95 c0          	setne  %r8b
   1a077:	41 30 c8             	xor    %cl,%r8b
   1a07a:	48 f7 e2             	mul    %rdx
   1a07d:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
   1a082:	01 f7                	add    %esi,%edi
   1a084:	44 88 44 24 44       	mov    %r8b,0x44(%rsp)
   1a089:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a08e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a093:	89 7c 24 40          	mov    %edi,0x40(%rsp)
   1a097:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
   1a09c:	48 89 fd             	mov    %rdi,%rbp
   1a09f:	4c 89 fe             	mov    %r15,%rsi
   1a0a2:	4c 89 d2             	mov    %r10,%rdx
   1a0a5:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
   1a0aa:	49 89 cc             	mov    %rcx,%r12
   1a0ad:	e8 9e f3 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1a0b2:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a0b7:	0f 84 54 01 00 00    	je     1a211 <<hyperinterval::ieee::Format>::power+0x391>
   1a0bd:	4c 89 fe             	mov    %r15,%rsi
   1a0c0:	4d 89 f3             	mov    %r14,%r11
   1a0c3:	4d 89 ee             	mov    %r13,%r14
   1a0c6:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
   1a0cb:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a0d0:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
   1a0d5:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a0dc:	00 
   1a0dd:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a0e2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a0e7:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a0ec:	48 89 ef             	mov    %rbp,%rdi
   1a0ef:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a0f3:	4c 8b ac 24 90 00 00 	mov    0x90(%rsp),%r13
   1a0fa:	00 
   1a0fb:	d1 ed                	shr    $1,%ebp
   1a0fd:	0f 84 62 01 00 00    	je     1a265 <<hyperinterval::ieee::Format>::power+0x3e5>
   1a103:	89 6c 24 08          	mov    %ebp,0x8(%rsp)
   1a107:	4c 89 e8             	mov    %r13,%rax
   1a10a:	4c 21 f0             	and    %r14,%rax
   1a10d:	44 89 c9             	mov    %r9d,%ecx
   1a110:	48 d3 e8             	shr    %cl,%rax
   1a113:	49 21 d5             	and    %rdx,%r13
   1a116:	89 c1                	mov    %eax,%ecx
   1a118:	44 29 d9             	sub    %r11d,%ecx
   1a11b:	48 85 c0             	test   %rax,%rax
   1a11e:	48 0f 45 c3          	cmovne %rbx,%rax
   1a122:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a126:	4c 09 e8             	or     %r13,%rax
   1a129:	48 89 d5             	mov    %rdx,%rbp
   1a12c:	48 f7 e0             	mul    %rax
   1a12f:	01 c9                	add    %ecx,%ecx
   1a131:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a136:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a13b:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a140:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a144:	4c 89 f2             	mov    %r14,%rdx
   1a147:	4c 89 e1             	mov    %r12,%rcx
   1a14a:	49 89 dd             	mov    %rbx,%r13
   1a14d:	4c 89 db             	mov    %r11,%rbx
   1a150:	4d 89 f4             	mov    %r14,%r12
   1a153:	4d 89 ce             	mov    %r9,%r14
   1a156:	e8 f5 f2 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1a15b:	80 7c 24 18 00       	cmpb   $0x0,0x18(%rsp)
   1a160:	0f 85 ab 00 00 00    	jne    1a211 <<hyperinterval::ieee::Format>::power+0x391>
   1a166:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
   1a16b:	48 89 d0             	mov    %rdx,%rax
   1a16e:	4c 21 e0             	and    %r12,%rax
   1a171:	44 89 f1             	mov    %r14d,%ecx
   1a174:	48 d3 e8             	shr    %cl,%rax
   1a177:	48 21 ea             	and    %rbp,%rdx
   1a17a:	89 c1                	mov    %eax,%ecx
   1a17c:	29 d9                	sub    %ebx,%ecx
   1a17e:	48 85 c0             	test   %rax,%rax
   1a181:	49 0f 45 c5          	cmovne %r13,%rax
   1a185:	41 0f 44 cf          	cmove  %r15d,%ecx
   1a189:	48 09 d0             	or     %rdx,%rax
   1a18c:	48 f7 e0             	mul    %rax
   1a18f:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
   1a194:	01 c9                	add    %ecx,%ecx
   1a196:	c6 44 24 44 00       	movb   $0x0,0x44(%rsp)
   1a19b:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
   1a1a0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
   1a1a5:	89 4c 24 40          	mov    %ecx,0x40(%rsp)
   1a1a9:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
   1a1ae:	48 89 ef             	mov    %rbp,%rdi
   1a1b1:	4c 8b b4 24 88 00 00 	mov    0x88(%rsp),%r14
   1a1b8:	00 
   1a1b9:	4c 89 f6             	mov    %r14,%rsi
   1a1bc:	4c 89 e2             	mov    %r12,%rdx
   1a1bf:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
   1a1c4:	4c 89 f9             	mov    %r15,%rcx
   1a1c7:	e8 84 f2 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1a1cc:	80 7c 24 18 01       	cmpb   $0x1,0x18(%rsp)
   1a1d1:	74 3e                	je     1a211 <<hyperinterval::ieee::Format>::power+0x391>
   1a1d3:	4c 89 f6             	mov    %r14,%rsi
   1a1d6:	49 89 db             	mov    %rbx,%r11
   1a1d9:	4d 89 e6             	mov    %r12,%r14
   1a1dc:	48 89 ef             	mov    %rbp,%rdi
   1a1df:	4d 89 fc             	mov    %r15,%r12
   1a1e2:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
   1a1e7:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
   1a1ec:	4c 8b 8c 24 80 00 00 	mov    0x80(%rsp),%r9
   1a1f3:	00 
   1a1f4:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
   1a1f9:	44 8b 7c 24 0c       	mov    0xc(%rsp),%r15d
   1a1fe:	8b 6c 24 08          	mov    0x8(%rsp),%ebp
   1a202:	40 f6 c5 01          	test   $0x1,%bpl
   1a206:	0f 85 54 fd ff ff    	jne    19f60 <<hyperinterval::ieee::Format>::power+0xe0>
   1a20c:	e9 2f fd ff ff       	jmp    19f40 <<hyperinterval::ieee::Format>::power+0xc0>
   1a211:	0f b6 44 24 19       	movzbl 0x19(%rsp),%eax
   1a216:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a21b:	88 47 01             	mov    %al,0x1(%rdi)
   1a21e:	b0 01                	mov    $0x1,%al
   1a220:	eb 2f                	jmp    1a251 <<hyperinterval::ieee::Format>::power+0x3d1>
   1a222:	48 89 d1             	mov    %rdx,%rcx
   1a225:	44 20 c0             	and    %r8b,%al
   1a228:	74 1d                	je     1a247 <<hyperinterval::ieee::Format>::power+0x3c7>
   1a22a:	48 89 d0             	mov    %rdx,%rax
   1a22d:	48 31 f0             	xor    %rsi,%rax
   1a230:	48 85 d2             	test   %rdx,%rdx
   1a233:	48 0f 44 c2          	cmove  %rdx,%rax
   1a237:	48 31 ce             	xor    %rcx,%rsi
   1a23a:	48 85 c9             	test   %rcx,%rcx
   1a23d:	48 0f 44 f1          	cmove  %rcx,%rsi
   1a241:	48 89 c1             	mov    %rax,%rcx
   1a244:	48 89 f2             	mov    %rsi,%rdx
   1a247:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1a24b:	48 89 57 10          	mov    %rdx,0x10(%rdi)
   1a24f:	31 c0                	xor    %eax,%eax
   1a251:	88 07                	mov    %al,(%rdi)
   1a253:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1a25a:	5b                   	pop    %rbx
   1a25b:	41 5c                	pop    %r12
   1a25d:	41 5d                	pop    %r13
   1a25f:	41 5e                	pop    %r14
   1a261:	41 5f                	pop    %r15
   1a263:	5d                   	pop    %rbp
   1a264:	c3                   	ret
   1a265:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
   1a26a:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
   1a26f:	0f b6 44 24 07       	movzbl 0x7(%rsp),%eax
   1a274:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
   1a279:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
   1a27e:	44 20 c0             	and    %r8b,%al
   1a281:	75 a7                	jne    1a22a <<hyperinterval::ieee::Format>::power+0x3aa>
   1a283:	eb c2                	jmp    1a247 <<hyperinterval::ieee::Format>::power+0x3c7>
   1a285:	cc                   	int3
   1a286:	cc                   	int3
   1a287:	cc                   	int3
   1a288:	cc                   	int3
   1a289:	cc                   	int3
   1a28a:	cc                   	int3
   1a28b:	cc                   	int3
   1a28c:	cc                   	int3
   1a28d:	cc                   	int3
   1a28e:	cc                   	int3
   1a28f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::hull:
   1a290:	44 8b 16             	mov    (%rsi),%r10d
   1a293:	44 8b 0a             	mov    (%rdx),%r9d
   1a296:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a29a:	8b 42 08             	mov    0x8(%rdx),%eax
   1a29d:	41 f6 c2 01          	test   $0x1,%r10b
   1a2a1:	0f 84 9d 00 00 00    	je     1a344 <<hyperinterval::float::F32Enclosure>::hull+0xb4>
   1a2a7:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1a2aa:	8b 56 08             	mov    0x8(%rsi),%edx
   1a2ad:	41 f6 c1 01          	test   $0x1,%r9b
   1a2b1:	0f 84 98 00 00 00    	je     1a34f <<hyperinterval::float::F32Enclosure>::hull+0xbf>
   1a2b7:	53                   	push   %rbx
   1a2b8:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a2bd:	44 8d 0c 31          	lea    (%rcx,%rsi,1),%r9d
   1a2c1:	41 89 ca             	mov    %ecx,%r10d
   1a2c4:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a2cb:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a2d1:	45 29 d3             	sub    %r10d,%r11d
   1a2d4:	85 c9                	test   %ecx,%ecx
   1a2d6:	4d 0f 49 d9          	cmovns %r9,%r11
   1a2da:	45 8d 0c 30          	lea    (%r8,%rsi,1),%r9d
   1a2de:	45 89 c2             	mov    %r8d,%r10d
   1a2e1:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a2e8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a2ed:	44 29 d3             	sub    %r10d,%ebx
   1a2f0:	45 85 c0             	test   %r8d,%r8d
   1a2f3:	49 0f 49 d9          	cmovns %r9,%rbx
   1a2f7:	41 39 db             	cmp    %ebx,%r11d
   1a2fa:	41 0f 47 c8          	cmova  %r8d,%ecx
   1a2fe:	44 8d 04 32          	lea    (%rdx,%rsi,1),%r8d
   1a302:	41 89 d1             	mov    %edx,%r9d
   1a305:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a30c:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a312:	45 29 ca             	sub    %r9d,%r10d
   1a315:	85 d2                	test   %edx,%edx
   1a317:	4d 0f 49 d0          	cmovns %r8,%r10
   1a31b:	44 8d 04 30          	lea    (%rax,%rsi,1),%r8d
   1a31f:	41 89 c1             	mov    %eax,%r9d
   1a322:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a329:	44 29 ce             	sub    %r9d,%esi
   1a32c:	85 c0                	test   %eax,%eax
   1a32e:	49 0f 49 f0          	cmovns %r8,%rsi
   1a332:	41 39 f2             	cmp    %esi,%r10d
   1a335:	0f 42 d0             	cmovb  %eax,%edx
   1a338:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   1a33e:	89 d0                	mov    %edx,%eax
   1a340:	41 89 c8             	mov    %ecx,%r8d
   1a343:	5b                   	pop    %rbx
   1a344:	44 89 0f             	mov    %r9d,(%rdi)
   1a347:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1a34b:	89 47 08             	mov    %eax,0x8(%rdi)
   1a34e:	c3                   	ret
   1a34f:	89 d0                	mov    %edx,%eax
   1a351:	41 89 c8             	mov    %ecx,%r8d
   1a354:	45 89 d1             	mov    %r10d,%r9d
   1a357:	44 89 0f             	mov    %r9d,(%rdi)
   1a35a:	44 89 47 04          	mov    %r8d,0x4(%rdi)
   1a35e:	89 47 08             	mov    %eax,0x8(%rdi)
   1a361:	c3                   	ret
   1a362:	cc                   	int3
   1a363:	cc                   	int3
   1a364:	cc                   	int3
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

<hyperinterval::float::F32Enclosure>::signs:
   1a370:	83 3f 01             	cmpl   $0x1,(%rdi)
   1a373:	75 65                	jne    1a3da <<hyperinterval::float::F32Enclosure>::signs+0x6a>
   1a375:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a37a:	8b 57 04             	mov    0x4(%rdi),%edx
   1a37d:	8b 47 08             	mov    0x8(%rdi),%eax
   1a380:	48 89 d6             	mov    %rdx,%rsi
   1a383:	48 09 ce             	or     %rcx,%rsi
   1a386:	41 89 d0             	mov    %edx,%r8d
   1a389:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a390:	bf 00 00 00 80       	mov    $0x80000000,%edi
   1a395:	4c 29 c7             	sub    %r8,%rdi
   1a398:	85 d2                	test   %edx,%edx
   1a39a:	48 0f 49 fe          	cmovns %rsi,%rdi
   1a39e:	31 f6                	xor    %esi,%esi
   1a3a0:	f7 c7 00 00 00 80    	test   $0x80000000,%edi
   1a3a6:	0f 94 c2             	sete   %dl
   1a3a9:	48 39 cf             	cmp    %rcx,%rdi
   1a3ac:	77 1d                	ja     1a3cb <<hyperinterval::float::F32Enclosure>::signs+0x5b>
   1a3ae:	39 cf                	cmp    %ecx,%edi
   1a3b0:	0f 92 c1             	setb   %cl
   1a3b3:	80 c9 02             	or     $0x2,%cl
   1a3b6:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1a3bb:	0f b6 c9             	movzbl %cl,%ecx
   1a3be:	40 88 d6             	mov    %dl,%sil
   1a3c1:	0f 44 f1             	cmove  %ecx,%esi
   1a3c4:	85 c0                	test   %eax,%eax
   1a3c6:	0f 49 f1             	cmovns %ecx,%esi
   1a3c9:	89 f2                	mov    %esi,%edx
   1a3cb:	8d 4a 04             	lea    0x4(%rdx),%ecx
   1a3ce:	85 c0                	test   %eax,%eax
   1a3d0:	0f b6 d2             	movzbl %dl,%edx
   1a3d3:	0f b6 c1             	movzbl %cl,%eax
   1a3d6:	0f 4e c2             	cmovle %edx,%eax
   1a3d9:	c3                   	ret
   1a3da:	31 c0                	xor    %eax,%eax
   1a3dc:	c3                   	ret
   1a3dd:	cc                   	int3
   1a3de:	cc                   	int3
   1a3df:	cc                   	int3

<hyperinterval::float::F32Enclosure>::from_bits:
   1a3e0:	41 57                	push   %r15
   1a3e2:	41 56                	push   %r14
   1a3e4:	53                   	push   %rbx
   1a3e5:	48 83 ec 10          	sub    $0x10,%rsp
   1a3e9:	48 89 fb             	mov    %rdi,%rbx
   1a3ec:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   1a3f2:	48 89 e7             	mov    %rsp,%rdi
   1a3f5:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a3fa:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a3ff:	31 c9                	xor    %ecx,%ecx
   1a401:	e8 0a e9 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1a406:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a40a:	74 1f                	je     1a42b <<hyperinterval::float::F32Enclosure>::from_bits+0x4b>
   1a40c:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1a411:	48 89 e7             	mov    %rsp,%rdi
   1a414:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a419:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a41e:	31 c9                	xor    %ecx,%ecx
   1a420:	e8 eb e8 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1a425:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1a429:	75 18                	jne    1a443 <<hyperinterval::float::F32Enclosure>::from_bits+0x63>
   1a42b:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1a430:	88 43 04             	mov    %al,0x4(%rbx)
   1a433:	c7 03 02 00 00 00    	movl   $0x2,(%rbx)
   1a439:	48 83 c4 10          	add    $0x10,%rsp
   1a43d:	5b                   	pop    %rbx
   1a43e:	41 5e                	pop    %r14
   1a440:	41 5f                	pop    %r15
   1a442:	c3                   	ret
   1a443:	8b 44 24 08          	mov    0x8(%rsp),%eax
   1a447:	44 89 f9             	mov    %r15d,%ecx
   1a44a:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a450:	89 c2                	mov    %eax,%edx
   1a452:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a458:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a45d:	29 ce                	sub    %ecx,%esi
   1a45f:	44 09 f1             	or     %r14d,%ecx
   1a462:	45 85 ff             	test   %r15d,%r15d
   1a465:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a469:	89 d1                	mov    %edx,%ecx
   1a46b:	44 09 f1             	or     %r14d,%ecx
   1a46e:	41 29 d6             	sub    %edx,%r14d
   1a471:	85 c0                	test   %eax,%eax
   1a473:	4c 0f 49 f1          	cmovns %rcx,%r14
   1a477:	44 39 f6             	cmp    %r14d,%esi
   1a47a:	76 06                	jbe    1a482 <<hyperinterval::float::F32Enclosure>::from_bits+0xa2>
   1a47c:	c6 43 04 01          	movb   $0x1,0x4(%rbx)
   1a480:	eb b1                	jmp    1a433 <<hyperinterval::float::F32Enclosure>::from_bits+0x53>
   1a482:	c7 03 01 00 00 00    	movl   $0x1,(%rbx)
   1a488:	44 89 7b 04          	mov    %r15d,0x4(%rbx)
   1a48c:	89 43 08             	mov    %eax,0x8(%rbx)
   1a48f:	eb a8                	jmp    1a439 <<hyperinterval::float::F32Enclosure>::from_bits+0x59>
   1a491:	cc                   	int3
   1a492:	cc                   	int3
   1a493:	cc                   	int3
   1a494:	cc                   	int3
   1a495:	cc                   	int3
   1a496:	cc                   	int3
   1a497:	cc                   	int3
   1a498:	cc                   	int3
   1a499:	cc                   	int3
   1a49a:	cc                   	int3
   1a49b:	cc                   	int3
   1a49c:	cc                   	int3
   1a49d:	cc                   	int3
   1a49e:	cc                   	int3
   1a49f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::intersection:
   1a4a0:	45 31 c9             	xor    %r9d,%r9d
   1a4a3:	f6 06 01             	testb  $0x1,(%rsi)
   1a4a6:	0f 84 ed 00 00 00    	je     1a599 <<hyperinterval::float::F32Enclosure>::intersection+0xf9>
   1a4ac:	f6 02 01             	testb  $0x1,(%rdx)
   1a4af:	0f 84 d9 00 00 00    	je     1a58e <<hyperinterval::float::F32Enclosure>::intersection+0xee>
   1a4b5:	53                   	push   %rbx
   1a4b6:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a4ba:	8b 46 04             	mov    0x4(%rsi),%eax
   1a4bd:	b9 00 00 00 80       	mov    $0x80000000,%ecx
   1a4c2:	41 89 c1             	mov    %eax,%r9d
   1a4c5:	41 09 c9             	or     %ecx,%r9d
   1a4c8:	41 89 c2             	mov    %eax,%r10d
   1a4cb:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a4d2:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a4d8:	45 29 d3             	sub    %r10d,%r11d
   1a4db:	85 c0                	test   %eax,%eax
   1a4dd:	4d 0f 49 d9          	cmovns %r9,%r11
   1a4e1:	45 89 c1             	mov    %r8d,%r9d
   1a4e4:	41 09 c9             	or     %ecx,%r9d
   1a4e7:	45 89 c2             	mov    %r8d,%r10d
   1a4ea:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1a4f1:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1a4f6:	44 29 d3             	sub    %r10d,%ebx
   1a4f9:	45 85 c0             	test   %r8d,%r8d
   1a4fc:	49 0f 49 d9          	cmovns %r9,%rbx
   1a500:	8b 52 08             	mov    0x8(%rdx),%edx
   1a503:	41 39 db             	cmp    %ebx,%r11d
   1a506:	41 0f 42 c0          	cmovb  %r8d,%eax
   1a50a:	44 8b 46 08          	mov    0x8(%rsi),%r8d
   1a50e:	44 89 c6             	mov    %r8d,%esi
   1a511:	09 ce                	or     %ecx,%esi
   1a513:	45 89 c1             	mov    %r8d,%r9d
   1a516:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a51d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a523:	45 29 ca             	sub    %r9d,%r10d
   1a526:	45 85 c0             	test   %r8d,%r8d
   1a529:	4c 0f 49 d6          	cmovns %rsi,%r10
   1a52d:	89 d6                	mov    %edx,%esi
   1a52f:	09 ce                	or     %ecx,%esi
   1a531:	41 89 d1             	mov    %edx,%r9d
   1a534:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a53b:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1a541:	45 29 cb             	sub    %r9d,%r11d
   1a544:	85 d2                	test   %edx,%edx
   1a546:	4c 0f 49 de          	cmovns %rsi,%r11
   1a54a:	45 39 da             	cmp    %r11d,%r10d
   1a54d:	44 0f 47 c2          	cmova  %edx,%r8d
   1a551:	89 c2                	mov    %eax,%edx
   1a553:	09 ca                	or     %ecx,%edx
   1a555:	89 c6                	mov    %eax,%esi
   1a557:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a55d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a563:	41 29 f2             	sub    %esi,%r10d
   1a566:	85 c0                	test   %eax,%eax
   1a568:	4c 0f 49 d2          	cmovns %rdx,%r10
   1a56c:	44 89 c2             	mov    %r8d,%edx
   1a56f:	09 ca                	or     %ecx,%edx
   1a571:	44 89 c6             	mov    %r8d,%esi
   1a574:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a57a:	29 f1                	sub    %esi,%ecx
   1a57c:	45 85 c0             	test   %r8d,%r8d
   1a57f:	48 0f 49 ca          	cmovns %rdx,%rcx
   1a583:	45 31 c9             	xor    %r9d,%r9d
   1a586:	41 39 ca             	cmp    %ecx,%r10d
   1a589:	41 0f 96 c1          	setbe  %r9b
   1a58d:	5b                   	pop    %rbx
   1a58e:	44 89 0f             	mov    %r9d,(%rdi)
   1a591:	89 47 04             	mov    %eax,0x4(%rdi)
   1a594:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1a598:	c3                   	ret
   1a599:	44 89 0f             	mov    %r9d,(%rdi)
   1a59c:	89 47 04             	mov    %eax,0x4(%rdi)
   1a59f:	44 89 47 08          	mov    %r8d,0x8(%rdi)
   1a5a3:	c3                   	ret
   1a5a4:	cc                   	int3
   1a5a5:	cc                   	int3
   1a5a6:	cc                   	int3
   1a5a7:	cc                   	int3
   1a5a8:	cc                   	int3
   1a5a9:	cc                   	int3
   1a5aa:	cc                   	int3
   1a5ab:	cc                   	int3
   1a5ac:	cc                   	int3
   1a5ad:	cc                   	int3
   1a5ae:	cc                   	int3
   1a5af:	cc                   	int3

<hyperinterval::float::F32Enclosure>::contains_point:
   1a5b0:	41 56                	push   %r14
   1a5b2:	53                   	push   %rbx
   1a5b3:	48 83 ec 18          	sub    $0x18,%rsp
   1a5b7:	48 89 fb             	mov    %rdi,%rbx
   1a5ba:	41 be 00 00 00 80    	mov    $0x80000000,%r14d
   1a5c0:	66 0f 7e c1          	movd   %xmm0,%ecx
   1a5c4:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a5c9:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a5ce:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a5d3:	e8 38 e7 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1a5d8:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1a5dd:	3c 01                	cmp    $0x1,%al
   1a5df:	75 0d                	jne    1a5ee <<hyperinterval::float::F32Enclosure>::contains_point+0x3e>
   1a5e1:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1a5e6:	48 83 c4 18          	add    $0x18,%rsp
   1a5ea:	5b                   	pop    %rbx
   1a5eb:	41 5e                	pop    %r14
   1a5ed:	c3                   	ret
   1a5ee:	f6 03 01             	testb  $0x1,(%rbx)
   1a5f1:	74 44                	je     1a637 <<hyperinterval::float::F32Enclosure>::contains_point+0x87>
   1a5f3:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
   1a5f8:	8b 73 04             	mov    0x4(%rbx),%esi
   1a5fb:	89 d1                	mov    %edx,%ecx
   1a5fd:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a603:	89 f7                	mov    %esi,%edi
   1a605:	44 09 f7             	or     %r14d,%edi
   1a608:	41 89 f0             	mov    %esi,%r8d
   1a60b:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a612:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a618:	45 29 c1             	sub    %r8d,%r9d
   1a61b:	85 f6                	test   %esi,%esi
   1a61d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1a621:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a626:	48 29 ce             	sub    %rcx,%rsi
   1a629:	4c 09 f1             	or     %r14,%rcx
   1a62c:	85 d2                	test   %edx,%edx
   1a62e:	48 0f 48 ce          	cmovs  %rsi,%rcx
   1a632:	41 39 c9             	cmp    %ecx,%r9d
   1a635:	76 0a                	jbe    1a641 <<hyperinterval::float::F32Enclosure>::contains_point+0x91>
   1a637:	31 d2                	xor    %edx,%edx
   1a639:	48 83 c4 18          	add    $0x18,%rsp
   1a63d:	5b                   	pop    %rbx
   1a63e:	41 5e                	pop    %r14
   1a640:	c3                   	ret
   1a641:	8b 53 08             	mov    0x8(%rbx),%edx
   1a644:	89 d6                	mov    %edx,%esi
   1a646:	44 09 f6             	or     %r14d,%esi
   1a649:	89 d7                	mov    %edx,%edi
   1a64b:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a651:	41 29 fe             	sub    %edi,%r14d
   1a654:	85 d2                	test   %edx,%edx
   1a656:	4c 0f 49 f6          	cmovns %rsi,%r14
   1a65a:	44 39 f1             	cmp    %r14d,%ecx
   1a65d:	0f 96 c2             	setbe  %dl
   1a660:	48 83 c4 18          	add    $0x18,%rsp
   1a664:	5b                   	pop    %rbx
   1a665:	41 5e                	pop    %r14
   1a667:	c3                   	ret
   1a668:	cc                   	int3
   1a669:	cc                   	int3
   1a66a:	cc                   	int3
   1a66b:	cc                   	int3
   1a66c:	cc                   	int3
   1a66d:	cc                   	int3
   1a66e:	cc                   	int3
   1a66f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::interior_subset_of:
   1a670:	b0 01                	mov    $0x1,%al
   1a672:	f6 07 01             	testb  $0x1,(%rdi)
   1a675:	0f 84 8e 00 00 00    	je     1a709 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x99>
   1a67b:	f6 06 01             	testb  $0x1,(%rsi)
   1a67e:	0f 84 83 00 00 00    	je     1a707 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1a684:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1a687:	8b 56 04             	mov    0x4(%rsi),%edx
   1a68a:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1a68f:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1a693:	41 89 d1             	mov    %edx,%r9d
   1a696:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1a69d:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1a6a3:	45 29 ca             	sub    %r9d,%r10d
   1a6a6:	85 d2                	test   %edx,%edx
   1a6a8:	4d 0f 49 d0          	cmovns %r8,%r10
   1a6ac:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1a6af:	41 89 c8             	mov    %ecx,%r8d
   1a6b2:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1a6b9:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1a6bf:	45 29 c1             	sub    %r8d,%r9d
   1a6c2:	85 c9                	test   %ecx,%ecx
   1a6c4:	4c 0f 49 ca          	cmovns %rdx,%r9
   1a6c8:	45 39 ca             	cmp    %r9d,%r10d
   1a6cb:	73 3a                	jae    1a707 <<hyperinterval::float::F32Enclosure>::interior_subset_of+0x97>
   1a6cd:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1a6d0:	8b 56 08             	mov    0x8(%rsi),%edx
   1a6d3:	8d 34 01             	lea    (%rcx,%rax,1),%esi
   1a6d6:	89 cf                	mov    %ecx,%edi
   1a6d8:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1a6de:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1a6e4:	41 29 f8             	sub    %edi,%r8d
   1a6e7:	85 c9                	test   %ecx,%ecx
   1a6e9:	4c 0f 49 c6          	cmovns %rsi,%r8
   1a6ed:	8d 0c 02             	lea    (%rdx,%rax,1),%ecx
   1a6f0:	89 d6                	mov    %edx,%esi
   1a6f2:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1a6f8:	29 f0                	sub    %esi,%eax
   1a6fa:	85 d2                	test   %edx,%edx
   1a6fc:	48 0f 49 c1          	cmovns %rcx,%rax
   1a700:	41 39 c0             	cmp    %eax,%r8d
   1a703:	0f 92 c0             	setb   %al
   1a706:	c3                   	ret
   1a707:	31 c0                	xor    %eax,%eax
   1a709:	c3                   	ret
   1a70a:	cc                   	int3
   1a70b:	cc                   	int3
   1a70c:	cc                   	int3
   1a70d:	cc                   	int3
   1a70e:	cc                   	int3
   1a70f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::add:
   1a710:	f6 06 01             	testb  $0x1,(%rsi)
   1a713:	0f 84 d3 00 00 00    	je     1a7ec <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1a719:	f6 02 01             	testb  $0x1,(%rdx)
   1a71c:	0f 84 ca 00 00 00    	je     1a7ec <<hyperinterval::float::F32Enclosure>::add+0xdc>
   1a722:	41 57                	push   %r15
   1a724:	41 56                	push   %r14
   1a726:	41 55                	push   %r13
   1a728:	41 54                	push   %r12
   1a72a:	53                   	push   %rbx
   1a72b:	48 83 ec 20          	sub    $0x20,%rsp
   1a72f:	49 89 fc             	mov    %rdi,%r12
   1a732:	8b 5e 08             	mov    0x8(%rsi),%ebx
   1a735:	41 bd 00 00 00 80    	mov    $0x80000000,%r13d
   1a73b:	44 8b 42 04          	mov    0x4(%rdx),%r8d
   1a73f:	44 8b 72 08          	mov    0x8(%rdx),%r14d
   1a743:	8b 4e 04             	mov    0x4(%rsi),%ecx
   1a746:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a74b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a750:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a755:	e8 f6 00 00 00       	call   1a850 <<hyperinterval::ieee::Format>::add>
   1a75a:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a75f:	74 6b                	je     1a7cc <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a761:	44 8b 7c 24 10       	mov    0x10(%rsp),%r15d
   1a766:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a76b:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a770:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a775:	48 89 d9             	mov    %rbx,%rcx
   1a778:	4d 89 f0             	mov    %r14,%r8
   1a77b:	e8 d0 00 00 00       	call   1a850 <<hyperinterval::ieee::Format>::add>
   1a780:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a785:	74 45                	je     1a7cc <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a787:	8b 5c 24 18          	mov    0x18(%rsp),%ebx
   1a78b:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a790:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a795:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a79a:	4c 89 f9             	mov    %r15,%rcx
   1a79d:	e8 6e e5 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1a7a2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a7a7:	74 23                	je     1a7cc <<hyperinterval::float::F32Enclosure>::add+0xbc>
   1a7a9:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1a7ae:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1a7b3:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a7b8:	ba 00 00 80 7f       	mov    $0x7f800000,%edx
   1a7bd:	48 89 d9             	mov    %rbx,%rcx
   1a7c0:	e8 4b e5 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1a7c5:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1a7ca:	75 27                	jne    1a7f3 <<hyperinterval::float::F32Enclosure>::add+0xe3>
   1a7cc:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1a7d1:	41 88 44 24 04       	mov    %al,0x4(%r12)
   1a7d6:	41 c7 04 24 02 00 00 	movl   $0x2,(%r12)
   1a7dd:	00 
   1a7de:	48 83 c4 20          	add    $0x20,%rsp
   1a7e2:	5b                   	pop    %rbx
   1a7e3:	41 5c                	pop    %r12
   1a7e5:	41 5d                	pop    %r13
   1a7e7:	41 5e                	pop    %r14
   1a7e9:	41 5f                	pop    %r15
   1a7eb:	c3                   	ret
   1a7ec:	c7 07 00 00 00 00    	movl   $0x0,(%rdi)
   1a7f2:	c3                   	ret
   1a7f3:	8b 44 24 10          	mov    0x10(%rsp),%eax
   1a7f7:	44 89 f1             	mov    %r14d,%ecx
   1a7fa:	81 e1 ff ff ff 7f    	and    $0x7fffffff,%ecx
   1a800:	89 c2                	mov    %eax,%edx
   1a802:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
   1a808:	be 00 00 00 80       	mov    $0x80000000,%esi
   1a80d:	29 ce                	sub    %ecx,%esi
   1a80f:	44 09 e9             	or     %r13d,%ecx
   1a812:	45 85 f6             	test   %r14d,%r14d
   1a815:	48 0f 49 f1          	cmovns %rcx,%rsi
   1a819:	89 d1                	mov    %edx,%ecx
   1a81b:	44 09 e9             	or     %r13d,%ecx
   1a81e:	41 29 d5             	sub    %edx,%r13d
   1a821:	85 c0                	test   %eax,%eax
   1a823:	4c 0f 49 e9          	cmovns %rcx,%r13
   1a827:	44 39 ee             	cmp    %r13d,%esi
   1a82a:	76 08                	jbe    1a834 <<hyperinterval::float::F32Enclosure>::add+0x124>
   1a82c:	41 c6 44 24 04 01    	movb   $0x1,0x4(%r12)
   1a832:	eb a2                	jmp    1a7d6 <<hyperinterval::float::F32Enclosure>::add+0xc6>
   1a834:	41 c7 04 24 01 00 00 	movl   $0x1,(%r12)
   1a83b:	00 
   1a83c:	45 89 74 24 04       	mov    %r14d,0x4(%r12)
   1a841:	41 89 44 24 08       	mov    %eax,0x8(%r12)
   1a846:	eb 96                	jmp    1a7de <<hyperinterval::float::F32Enclosure>::add+0xce>
   1a848:	cc                   	int3
   1a849:	cc                   	int3
   1a84a:	cc                   	int3
   1a84b:	cc                   	int3
   1a84c:	cc                   	int3
   1a84d:	cc                   	int3
   1a84e:	cc                   	int3
   1a84f:	cc                   	int3

<hyperinterval::ieee::Format>::add:
   1a850:	48 85 c9             	test   %rcx,%rcx
   1a853:	74 50                	je     1a8a5 <<hyperinterval::ieee::Format>::add+0x55>
   1a855:	48 89 c8             	mov    %rcx,%rax
   1a858:	4d 85 c0             	test   %r8,%r8
   1a85b:	74 54                	je     1a8b1 <<hyperinterval::ieee::Format>::add+0x61>
   1a85d:	55                   	push   %rbp
   1a85e:	41 57                	push   %r15
   1a860:	41 56                	push   %r14
   1a862:	41 55                	push   %r13
   1a864:	41 54                	push   %r12
   1a866:	53                   	push   %rbx
   1a867:	48 83 ec 38          	sub    $0x38,%rsp
   1a86b:	f3 4c 0f bc ca       	tzcnt  %rdx,%r9
   1a870:	49 89 c7             	mov    %rax,%r15
   1a873:	49 21 d7             	and    %rdx,%r15
   1a876:	44 89 c9             	mov    %r9d,%ecx
   1a879:	49 d3 ef             	shr    %cl,%r15
   1a87c:	41 bd 01 00 00 00    	mov    $0x1,%r13d
   1a882:	49 d3 e5             	shl    %cl,%r13
   1a885:	49 8d 5d ff          	lea    -0x1(%r13),%rbx
   1a889:	49 89 de             	mov    %rbx,%r14
   1a88c:	49 21 c6             	and    %rax,%r14
   1a88f:	49 89 d2             	mov    %rdx,%r10
   1a892:	49 d3 ea             	shr    %cl,%r10
   1a895:	4d 85 ff             	test   %r15,%r15
   1a898:	74 23                	je     1a8bd <<hyperinterval::ieee::Format>::add+0x6d>
   1a89a:	4d 09 ee             	or     %r13,%r14
   1a89d:	49 d1 ea             	shr    $1,%r10
   1a8a0:	45 01 ca             	add    %r9d,%r10d
   1a8a3:	eb 24                	jmp    1a8c9 <<hyperinterval::ieee::Format>::add+0x79>
   1a8a5:	4c 89 47 08          	mov    %r8,0x8(%rdi)
   1a8a9:	4c 89 47 10          	mov    %r8,0x10(%rdi)
   1a8ad:	c6 07 00             	movb   $0x0,(%rdi)
   1a8b0:	c3                   	ret
   1a8b1:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1a8b5:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1a8b9:	c6 07 00             	movb   $0x0,(%rdi)
   1a8bc:	c3                   	ret
   1a8bd:	49 d1 ea             	shr    $1,%r10
   1a8c0:	45 01 ca             	add    %r9d,%r10d
   1a8c3:	41 bf 01 00 00 00    	mov    $0x1,%r15d
   1a8c9:	45 29 d7             	sub    %r10d,%r15d
   1a8cc:	48 85 f0             	test   %rsi,%rax
   1a8cf:	0f 95 44 24 0f       	setne  0xf(%rsp)
   1a8d4:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a8d9:	49 0f bd ce          	bsr    %r14,%rcx
   1a8dd:	83 f1 3f             	xor    $0x3f,%ecx
   1a8e0:	46 8d 1c 09          	lea    (%rcx,%r9,1),%r11d
   1a8e4:	41 83 c3 c1          	add    $0xffffffc1,%r11d
   1a8e8:	45 31 e4             	xor    %r12d,%r12d
   1a8eb:	44 89 d9             	mov    %r11d,%ecx
   1a8ee:	4d 0f a5 f4          	shld   %cl,%r14,%r12
   1a8f2:	49 d3 e6             	shl    %cl,%r14
   1a8f5:	31 c9                	xor    %ecx,%ecx
   1a8f7:	41 f6 c3 40          	test   $0x40,%r11b
   1a8fb:	4d 0f 45 e6          	cmovne %r14,%r12
   1a8ff:	4c 0f 45 f1          	cmovne %rcx,%r14
   1a903:	4d 89 c2             	mov    %r8,%r10
   1a906:	49 21 d2             	and    %rdx,%r10
   1a909:	44 89 c9             	mov    %r9d,%ecx
   1a90c:	49 d3 ea             	shr    %cl,%r10
   1a90f:	41 8d 69 81          	lea    -0x7f(%r9),%ebp
   1a913:	45 29 df             	sub    %r11d,%r15d
   1a916:	4c 21 c3             	and    %r8,%rbx
   1a919:	49 89 d3             	mov    %rdx,%r11
   1a91c:	49 d3 eb             	shr    %cl,%r11
   1a91f:	4d 85 d2             	test   %r10,%r10
   1a922:	74 0b                	je     1a92f <<hyperinterval::ieee::Format>::add+0xdf>
   1a924:	4c 09 eb             	or     %r13,%rbx
   1a927:	49 d1 eb             	shr    $1,%r11
   1a92a:	45 01 cb             	add    %r9d,%r11d
   1a92d:	eb 0c                	jmp    1a93b <<hyperinterval::ieee::Format>::add+0xeb>
   1a92f:	49 d1 eb             	shr    $1,%r11
   1a932:	45 01 cb             	add    %r9d,%r11d
   1a935:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   1a93b:	45 29 da             	sub    %r11d,%r10d
   1a93e:	49 85 f0             	test   %rsi,%r8
   1a941:	41 0f 95 c3          	setne  %r11b
   1a945:	b9 7f 00 00 00       	mov    $0x7f,%ecx
   1a94a:	48 0f bd cb          	bsr    %rbx,%rcx
   1a94e:	83 f1 3f             	xor    $0x3f,%ecx
   1a951:	01 e9                	add    %ebp,%ecx
   1a953:	83 c1 40             	add    $0x40,%ecx
   1a956:	45 31 ed             	xor    %r13d,%r13d
   1a959:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1a95d:	48 d3 e3             	shl    %cl,%rbx
   1a960:	45 31 c9             	xor    %r9d,%r9d
   1a963:	f6 c1 40             	test   $0x40,%cl
   1a966:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a96a:	49 0f 45 d9          	cmovne %r9,%rbx
   1a96e:	41 29 ca             	sub    %ecx,%r10d
   1a971:	45 39 d7             	cmp    %r10d,%r15d
   1a974:	7d 6d                	jge    1a9e3 <<hyperinterval::ieee::Format>::add+0x193>
   1a976:	44 89 f9             	mov    %r15d,%ecx
   1a979:	44 0f b6 7c 24 0f    	movzbl 0xf(%rsp),%r15d
   1a97f:	4c 89 f5             	mov    %r14,%rbp
   1a982:	4d 89 e1             	mov    %r12,%r9
   1a985:	4d 89 c6             	mov    %r8,%r14
   1a988:	45 89 dc             	mov    %r11d,%r12d
   1a98b:	41 29 ca             	sub    %ecx,%r10d
   1a98e:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1a992:	7f 76                	jg     1aa0a <<hyperinterval::ieee::Format>::add+0x1ba>
   1a994:	41 89 cb             	mov    %ecx,%r11d
   1a997:	49 85 f0             	test   %rsi,%r8
   1a99a:	41 0f 95 c0          	setne  %r8b
   1a99e:	48 85 f0             	test   %rsi,%rax
   1a9a1:	41 0f 95 c6          	setne  %r14b
   1a9a5:	44 89 d1             	mov    %r10d,%ecx
   1a9a8:	49 0f a5 dd          	shld   %cl,%rbx,%r13
   1a9ac:	48 d3 e3             	shl    %cl,%rbx
   1a9af:	31 c0                	xor    %eax,%eax
   1a9b1:	41 f6 c2 40          	test   $0x40,%r10b
   1a9b5:	4c 0f 45 eb          	cmovne %rbx,%r13
   1a9b9:	48 0f 44 c3          	cmove  %rbx,%rax
   1a9bd:	45 30 c6             	xor    %r8b,%r14b
   1a9c0:	0f 84 95 00 00 00    	je     1aa5b <<hyperinterval::ieee::Format>::add+0x20b>
   1a9c6:	48 39 e8             	cmp    %rbp,%rax
   1a9c9:	4c 89 e9             	mov    %r13,%rcx
   1a9cc:	4c 19 c9             	sbb    %r9,%rcx
   1a9cf:	0f 83 b8 00 00 00    	jae    1aa8d <<hyperinterval::ieee::Format>::add+0x23d>
   1a9d5:	48 29 c5             	sub    %rax,%rbp
   1a9d8:	4d 19 e9             	sbb    %r13,%r9
   1a9db:	45 89 fc             	mov    %r15d,%r12d
   1a9de:	e9 b6 00 00 00       	jmp    1aa99 <<hyperinterval::ieee::Format>::add+0x249>
   1a9e3:	44 89 d1             	mov    %r10d,%ecx
   1a9e6:	48 89 dd             	mov    %rbx,%rbp
   1a9e9:	4d 89 e9             	mov    %r13,%r9
   1a9ec:	4d 89 e5             	mov    %r12,%r13
   1a9ef:	4c 89 f3             	mov    %r14,%rbx
   1a9f2:	44 0f b6 64 24 0f    	movzbl 0xf(%rsp),%r12d
   1a9f8:	45 89 fa             	mov    %r15d,%r10d
   1a9fb:	45 89 df             	mov    %r11d,%r15d
   1a9fe:	49 89 c6             	mov    %rax,%r14
   1aa01:	41 29 ca             	sub    %ecx,%r10d
   1aa04:	41 83 fa 4a          	cmp    $0x4a,%r10d
   1aa08:	7e 8a                	jle    1a994 <<hyperinterval::ieee::Format>::add+0x144>
   1aa0a:	48 89 fb             	mov    %rdi,%rbx
   1aa0d:	4c 89 f0             	mov    %r14,%rax
   1aa10:	45 84 ff             	test   %r15b,%r15b
   1aa13:	74 4e                	je     1aa63 <<hyperinterval::ieee::Format>::add+0x213>
   1aa15:	48 31 f0             	xor    %rsi,%rax
   1aa18:	48 89 c1             	mov    %rax,%rcx
   1aa1b:	48 21 f1             	and    %rsi,%rcx
   1aa1e:	31 ff                	xor    %edi,%edi
   1aa20:	48 f7 d9             	neg    %rcx
   1aa23:	40 0f 93 c7          	setae  %dil
   1aa27:	48 8d 0c 78          	lea    (%rax,%rdi,2),%rcx
   1aa2b:	48 ff c9             	dec    %rcx
   1aa2e:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1aa33:	49 89 f7             	mov    %rsi,%r15
   1aa36:	e8 d5 e2 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1aa3b:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1aa40:	75 44                	jne    1aa86 <<hyperinterval::ieee::Format>::add+0x236>
   1aa42:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1aa47:	49 31 c7             	xor    %rax,%r15
   1aa4a:	48 85 c0             	test   %rax,%rax
   1aa4d:	4c 0f 44 f8          	cmove  %rax,%r15
   1aa51:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
   1aa55:	4c 89 73 10          	mov    %r14,0x10(%rbx)
   1aa59:	eb 6b                	jmp    1aac6 <<hyperinterval::ieee::Format>::add+0x276>
   1aa5b:	48 01 c5             	add    %rax,%rbp
   1aa5e:	4d 11 e9             	adc    %r13,%r9
   1aa61:	eb 36                	jmp    1aa99 <<hyperinterval::ieee::Format>::add+0x249>
   1aa63:	48 21 f0             	and    %rsi,%rax
   1aa66:	31 c9                	xor    %ecx,%ecx
   1aa68:	48 f7 d8             	neg    %rax
   1aa6b:	0f 93 c1             	setae  %cl
   1aa6e:	49 8d 0c 4e          	lea    (%r14,%rcx,2),%rcx
   1aa72:	48 ff c9             	dec    %rcx
   1aa75:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
   1aa7a:	e8 91 e2 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1aa7f:	80 7c 24 10 00       	cmpb   $0x0,0x10(%rsp)
   1aa84:	74 33                	je     1aab9 <<hyperinterval::ieee::Format>::add+0x269>
   1aa86:	66 c7 03 01 03       	movw   $0x301,(%rbx)
   1aa8b:	eb 3c                	jmp    1aac9 <<hyperinterval::ieee::Format>::add+0x279>
   1aa8d:	48 29 e8             	sub    %rbp,%rax
   1aa90:	4d 19 cd             	sbb    %r9,%r13
   1aa93:	48 89 c5             	mov    %rax,%rbp
   1aa96:	4d 89 e9             	mov    %r13,%r9
   1aa99:	44 88 64 24 24       	mov    %r12b,0x24(%rsp)
   1aa9e:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
   1aaa3:	4c 89 4c 24 18       	mov    %r9,0x18(%rsp)
   1aaa8:	44 89 5c 24 20       	mov    %r11d,0x20(%rsp)
   1aaad:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
   1aab2:	e8 99 e9 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1aab7:	eb 10                	jmp    1aac9 <<hyperinterval::ieee::Format>::add+0x279>
   1aab9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
   1aabe:	4c 89 73 08          	mov    %r14,0x8(%rbx)
   1aac2:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1aac6:	c6 03 00             	movb   $0x0,(%rbx)
   1aac9:	48 83 c4 38          	add    $0x38,%rsp
   1aacd:	5b                   	pop    %rbx
   1aace:	41 5c                	pop    %r12
   1aad0:	41 5d                	pop    %r13
   1aad2:	41 5e                	pop    %r14
   1aad4:	41 5f                	pop    %r15
   1aad6:	5d                   	pop    %rbp
   1aad7:	c3                   	ret
   1aad8:	cc                   	int3
   1aad9:	cc                   	int3
   1aada:	cc                   	int3
   1aadb:	cc                   	int3
   1aadc:	cc                   	int3
   1aadd:	cc                   	int3
   1aade:	cc                   	int3
   1aadf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::div:
   1aae0:	83 3a 01             	cmpl   $0x1,(%rdx)
   1aae3:	75 1a                	jne    1aaff <<hyperinterval::float::F32Enclosure>::div+0x1f>
   1aae5:	83 7a 04 00          	cmpl   $0x0,0x4(%rdx)
   1aae9:	7f 14                	jg     1aaff <<hyperinterval::float::F32Enclosure>::div+0x1f>
   1aaeb:	8b 42 08             	mov    0x8(%rdx),%eax
   1aaee:	85 c0                	test   %eax,%eax
   1aaf0:	0f 99 c1             	setns  %cl
   1aaf3:	a9 ff ff ff 7f       	test   $0x7fffffff,%eax
   1aaf8:	0f 94 c0             	sete   %al
   1aafb:	08 c8                	or     %cl,%al
   1aafd:	75 0a                	jne    1ab09 <<hyperinterval::float::F32Enclosure>::div+0x29>
   1aaff:	b9 01 00 00 00       	mov    $0x1,%ecx
   1ab04:	e9 47 e2 ff ff       	jmp    18d50 <<hyperinterval::float::F32Enclosure>::corner_image>
   1ab09:	c6 47 04 04          	movb   $0x4,0x4(%rdi)
   1ab0d:	c7 07 02 00 00 00    	movl   $0x2,(%rdi)
   1ab13:	c3                   	ret
   1ab14:	cc                   	int3
   1ab15:	cc                   	int3
   1ab16:	cc                   	int3
   1ab17:	cc                   	int3
   1ab18:	cc                   	int3
   1ab19:	cc                   	int3
   1ab1a:	cc                   	int3
   1ab1b:	cc                   	int3
   1ab1c:	cc                   	int3
   1ab1d:	cc                   	int3
   1ab1e:	cc                   	int3
   1ab1f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::sub:
   1ab20:	f6 02 01             	testb  $0x1,(%rdx)
   1ab23:	74 29                	je     1ab4e <<hyperinterval::float::F32Enclosure>::sub+0x2e>
   1ab25:	f3 0f 7e 42 04       	movq   0x4(%rdx),%xmm0
   1ab2a:	66 0f ef c9          	pxor   %xmm1,%xmm1
   1ab2e:	66 0f 6f 15 7a 87 fe 	movdqa -0x17886(%rip),%xmm2        # 32b0 <__abi_tag+0x2fb4>
   1ab35:	ff 
   1ab36:	66 0f ef d0          	pxor   %xmm0,%xmm2
   1ab3a:	66 0f 76 c8          	pcmpeqd %xmm0,%xmm1
   1ab3e:	66 0f df ca          	pandn  %xmm2,%xmm1
   1ab42:	66 0f 70 c1 e1       	pshufd $0xe1,%xmm1,%xmm0
   1ab47:	b8 01 00 00 00       	mov    $0x1,%eax
   1ab4c:	eb 02                	jmp    1ab50 <<hyperinterval::float::F32Enclosure>::sub+0x30>
   1ab4e:	31 c0                	xor    %eax,%eax
   1ab50:	48 83 ec 18          	sub    $0x18,%rsp
   1ab54:	89 44 24 0c          	mov    %eax,0xc(%rsp)
   1ab58:	66 0f d6 44 24 10    	movq   %xmm0,0x10(%rsp)
   1ab5e:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
   1ab63:	e8 a8 fb ff ff       	call   1a710 <<hyperinterval::float::F32Enclosure>::add>
   1ab68:	48 83 c4 18          	add    $0x18,%rsp
   1ab6c:	c3                   	ret
   1ab6d:	cc                   	int3
   1ab6e:	cc                   	int3
   1ab6f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::disjoint:
   1ab70:	83 3f 00             	cmpl   $0x0,(%rdi)
   1ab73:	b0 01                	mov    $0x1,%al
   1ab75:	0f 84 a3 00 00 00    	je     1ac1e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1ab7b:	8b 0e                	mov    (%rsi),%ecx
   1ab7d:	85 c9                	test   %ecx,%ecx
   1ab7f:	0f 84 99 00 00 00    	je     1ac1e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1ab85:	f6 c1 01             	test   $0x1,%cl
   1ab88:	74 4c                	je     1abd6 <<hyperinterval::float::F32Enclosure>::disjoint+0x66>
   1ab8a:	53                   	push   %rbx
   1ab8b:	8b 56 04             	mov    0x4(%rsi),%edx
   1ab8e:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   1ab92:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1ab98:	45 89 c2             	mov    %r8d,%r10d
   1ab9b:	45 09 ca             	or     %r9d,%r10d
   1ab9e:	45 89 c3             	mov    %r8d,%r11d
   1aba1:	41 81 e3 ff ff ff 7f 	and    $0x7fffffff,%r11d
   1aba8:	bb 00 00 00 80       	mov    $0x80000000,%ebx
   1abad:	44 29 db             	sub    %r11d,%ebx
   1abb0:	45 85 c0             	test   %r8d,%r8d
   1abb3:	49 0f 49 da          	cmovns %r10,%rbx
   1abb7:	41 89 d0             	mov    %edx,%r8d
   1abba:	45 09 c8             	or     %r9d,%r8d
   1abbd:	41 89 d2             	mov    %edx,%r10d
   1abc0:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1abc7:	45 29 d1             	sub    %r10d,%r9d
   1abca:	85 d2                	test   %edx,%edx
   1abcc:	4d 0f 49 c8          	cmovns %r8,%r9
   1abd0:	44 39 cb             	cmp    %r9d,%ebx
   1abd3:	5b                   	pop    %rbx
   1abd4:	72 48                	jb     1ac1e <<hyperinterval::float::F32Enclosure>::disjoint+0xae>
   1abd6:	f6 c1 01             	test   $0x1,%cl
   1abd9:	75 03                	jne    1abde <<hyperinterval::float::F32Enclosure>::disjoint+0x6e>
   1abdb:	31 c0                	xor    %eax,%eax
   1abdd:	c3                   	ret
   1abde:	8b 47 04             	mov    0x4(%rdi),%eax
   1abe1:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1abe4:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1abe9:	89 ce                	mov    %ecx,%esi
   1abeb:	09 d6                	or     %edx,%esi
   1abed:	89 cf                	mov    %ecx,%edi
   1abef:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1abf5:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1abfb:	41 29 f8             	sub    %edi,%r8d
   1abfe:	85 c9                	test   %ecx,%ecx
   1ac00:	4c 0f 49 c6          	cmovns %rsi,%r8
   1ac04:	89 c1                	mov    %eax,%ecx
   1ac06:	09 d1                	or     %edx,%ecx
   1ac08:	89 c6                	mov    %eax,%esi
   1ac0a:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1ac10:	29 f2                	sub    %esi,%edx
   1ac12:	85 c0                	test   %eax,%eax
   1ac14:	48 0f 49 d1          	cmovns %rcx,%rdx
   1ac18:	41 39 d0             	cmp    %edx,%r8d
   1ac1b:	0f 92 c0             	setb   %al
   1ac1e:	c3                   	ret
   1ac1f:	cc                   	int3

<hyperinterval::float::F32Enclosure>::overlaps:
   1ac20:	31 c0                	xor    %eax,%eax
   1ac22:	83 3f 00             	cmpl   $0x0,(%rdi)
   1ac25:	0f 84 a1 00 00 00    	je     1accc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1ac2b:	8b 0e                	mov    (%rsi),%ecx
   1ac2d:	85 c9                	test   %ecx,%ecx
   1ac2f:	0f 84 97 00 00 00    	je     1accc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1ac35:	f6 c1 01             	test   $0x1,%cl
   1ac38:	74 4b                	je     1ac85 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1ac3a:	8b 46 04             	mov    0x4(%rsi),%eax
   1ac3d:	8b 57 08             	mov    0x8(%rdi),%edx
   1ac40:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1ac46:	41 89 d1             	mov    %edx,%r9d
   1ac49:	45 09 c1             	or     %r8d,%r9d
   1ac4c:	41 89 d2             	mov    %edx,%r10d
   1ac4f:	41 81 e2 ff ff ff 7f 	and    $0x7fffffff,%r10d
   1ac56:	41 bb 00 00 00 80    	mov    $0x80000000,%r11d
   1ac5c:	45 29 d3             	sub    %r10d,%r11d
   1ac5f:	85 d2                	test   %edx,%edx
   1ac61:	4d 0f 49 d9          	cmovns %r9,%r11
   1ac65:	89 c2                	mov    %eax,%edx
   1ac67:	44 09 c2             	or     %r8d,%edx
   1ac6a:	41 89 c1             	mov    %eax,%r9d
   1ac6d:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1ac74:	45 29 c8             	sub    %r9d,%r8d
   1ac77:	85 c0                	test   %eax,%eax
   1ac79:	4c 0f 49 c2          	cmovns %rdx,%r8
   1ac7d:	45 39 c3             	cmp    %r8d,%r11d
   1ac80:	73 03                	jae    1ac85 <<hyperinterval::float::F32Enclosure>::overlaps+0x65>
   1ac82:	31 c0                	xor    %eax,%eax
   1ac84:	c3                   	ret
   1ac85:	b0 01                	mov    $0x1,%al
   1ac87:	f6 c1 01             	test   $0x1,%cl
   1ac8a:	74 40                	je     1accc <<hyperinterval::float::F32Enclosure>::overlaps+0xac>
   1ac8c:	8b 47 04             	mov    0x4(%rdi),%eax
   1ac8f:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1ac92:	ba 00 00 00 80       	mov    $0x80000000,%edx
   1ac97:	89 ce                	mov    %ecx,%esi
   1ac99:	09 d6                	or     %edx,%esi
   1ac9b:	89 cf                	mov    %ecx,%edi
   1ac9d:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1aca3:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1aca9:	41 29 f8             	sub    %edi,%r8d
   1acac:	85 c9                	test   %ecx,%ecx
   1acae:	4c 0f 49 c6          	cmovns %rsi,%r8
   1acb2:	89 c1                	mov    %eax,%ecx
   1acb4:	09 d1                	or     %edx,%ecx
   1acb6:	89 c6                	mov    %eax,%esi
   1acb8:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1acbe:	29 f2                	sub    %esi,%edx
   1acc0:	85 c0                	test   %eax,%eax
   1acc2:	48 0f 49 d1          	cmovns %rcx,%rdx
   1acc6:	41 39 d0             	cmp    %edx,%r8d
   1acc9:	0f 93 c0             	setae  %al
   1accc:	c3                   	ret
   1accd:	cc                   	int3
   1acce:	cc                   	int3
   1accf:	cc                   	int3

<hyperinterval::float::F32Enclosure>::subset_of:
   1acd0:	b0 01                	mov    $0x1,%al
   1acd2:	f6 07 01             	testb  $0x1,(%rdi)
   1acd5:	74 50                	je     1ad27 <<hyperinterval::float::F32Enclosure>::subset_of+0x57>
   1acd7:	f6 06 01             	testb  $0x1,(%rsi)
   1acda:	74 49                	je     1ad25 <<hyperinterval::float::F32Enclosure>::subset_of+0x55>
   1acdc:	8b 4f 04             	mov    0x4(%rdi),%ecx
   1acdf:	8b 56 04             	mov    0x4(%rsi),%edx
   1ace2:	b8 00 00 00 80       	mov    $0x80000000,%eax
   1ace7:	44 8d 04 02          	lea    (%rdx,%rax,1),%r8d
   1aceb:	41 89 d1             	mov    %edx,%r9d
   1acee:	41 81 e1 ff ff ff 7f 	and    $0x7fffffff,%r9d
   1acf5:	41 ba 00 00 00 80    	mov    $0x80000000,%r10d
   1acfb:	45 29 ca             	sub    %r9d,%r10d
   1acfe:	85 d2                	test   %edx,%edx
   1ad00:	4d 0f 49 d0          	cmovns %r8,%r10
   1ad04:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1ad07:	41 89 c8             	mov    %ecx,%r8d
   1ad0a:	41 81 e0 ff ff ff 7f 	and    $0x7fffffff,%r8d
   1ad11:	41 b9 00 00 00 80    	mov    $0x80000000,%r9d
   1ad17:	45 29 c1             	sub    %r8d,%r9d
   1ad1a:	85 c9                	test   %ecx,%ecx
   1ad1c:	4c 0f 49 ca          	cmovns %rdx,%r9
   1ad20:	45 39 ca             	cmp    %r9d,%r10d
   1ad23:	76 03                	jbe    1ad28 <<hyperinterval::float::F32Enclosure>::subset_of+0x58>
   1ad25:	31 c0                	xor    %eax,%eax
   1ad27:	c3                   	ret
   1ad28:	8b 4f 08             	mov    0x8(%rdi),%ecx
   1ad2b:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1ad2e:	89 cf                	mov    %ecx,%edi
   1ad30:	81 e7 ff ff ff 7f    	and    $0x7fffffff,%edi
   1ad36:	41 b8 00 00 00 80    	mov    $0x80000000,%r8d
   1ad3c:	41 29 f8             	sub    %edi,%r8d
   1ad3f:	85 c9                	test   %ecx,%ecx
   1ad41:	4c 0f 49 c2          	cmovns %rdx,%r8
   1ad45:	8b 4e 08             	mov    0x8(%rsi),%ecx
   1ad48:	8d 14 01             	lea    (%rcx,%rax,1),%edx
   1ad4b:	89 ce                	mov    %ecx,%esi
   1ad4d:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
   1ad53:	29 f0                	sub    %esi,%eax
   1ad55:	85 c9                	test   %ecx,%ecx
   1ad57:	48 0f 49 c2          	cmovns %rdx,%rax
   1ad5b:	41 39 c0             	cmp    %eax,%r8d
   1ad5e:	0f 96 c0             	setbe  %al
   1ad61:	c3                   	ret
   1ad62:	cc                   	int3
   1ad63:	cc                   	int3
   1ad64:	cc                   	int3
   1ad65:	cc                   	int3
   1ad66:	cc                   	int3
   1ad67:	cc                   	int3
   1ad68:	cc                   	int3
   1ad69:	cc                   	int3
   1ad6a:	cc                   	int3
   1ad6b:	cc                   	int3
   1ad6c:	cc                   	int3
   1ad6d:	cc                   	int3
   1ad6e:	cc                   	int3
   1ad6f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::corner_image:
   1ad70:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ad74:	0f 85 84 00 00 00    	jne    1adfe <<hyperinterval::float::F64Enclosure>::corner_image+0x8e>
   1ad7a:	f6 02 01             	testb  $0x1,(%rdx)
   1ad7d:	74 7f                	je     1adfe <<hyperinterval::float::F64Enclosure>::corner_image+0x8e>
   1ad7f:	55                   	push   %rbp
   1ad80:	41 57                	push   %r15
   1ad82:	41 56                	push   %r14
   1ad84:	41 55                	push   %r13
   1ad86:	41 54                	push   %r12
   1ad88:	53                   	push   %rbx
   1ad89:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   1ad90:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
   1ad95:	49 bb 00 00 00 00 00 	movabs $0x8000000000000000,%r11
   1ad9c:	00 00 80 
   1ad9f:	49 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%r10
   1ada6:	00 f0 7f 
   1ada9:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1adad:	48 8b 46 10          	mov    0x10(%rsi),%rax
   1adb1:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1adb6:	48 8b 6a 08          	mov    0x8(%rdx),%rbp
   1adba:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1adbe:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1adc3:	89 4c 24 24          	mov    %ecx,0x24(%rsp)
   1adc7:	84 c9                	test   %cl,%cl
   1adc9:	74 3b                	je     1ae06 <<hyperinterval::float::F64Enclosure>::corner_image+0x96>
   1adcb:	48 89 e7             	mov    %rsp,%rdi
   1adce:	4c 89 db             	mov    %r11,%rbx
   1add1:	4c 89 de             	mov    %r11,%rsi
   1add4:	4d 89 d7             	mov    %r10,%r15
   1add7:	4c 89 d2             	mov    %r10,%rdx
   1adda:	4c 89 e9             	mov    %r13,%rcx
   1addd:	49 89 e8             	mov    %rbp,%r8
   1ade0:	e8 5b e9 ff ff       	call   19740 <<hyperinterval::ieee::Format>::div>
   1ade5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1ade9:	0f 85 fc 00 00 00    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1adef:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1adf4:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1adf9:	e9 bd 00 00 00       	jmp    1aebb <<hyperinterval::float::F64Enclosure>::corner_image+0x14b>
   1adfe:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1ae05:	c3                   	ret
   1ae06:	4c 89 e8             	mov    %r13,%rax
   1ae09:	48 c1 e8 34          	shr    $0x34,%rax
   1ae0d:	25 ff 07 00 00       	and    $0x7ff,%eax
   1ae12:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1ae19:	ff 0f 00 
   1ae1c:	4c 89 ee             	mov    %r13,%rsi
   1ae1f:	48 21 d6             	and    %rdx,%rsi
   1ae22:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1ae28:	48 85 c0             	test   %rax,%rax
   1ae2b:	b8 ce fb ff ff       	mov    $0xfffffbce,%eax
   1ae30:	0f 44 c8             	cmove  %eax,%ecx
   1ae33:	48 8d 7c 16 01       	lea    0x1(%rsi,%rdx,1),%rdi
   1ae38:	48 0f 44 fe          	cmove  %rsi,%rdi
   1ae3c:	48 89 ee             	mov    %rbp,%rsi
   1ae3f:	48 c1 ee 34          	shr    $0x34,%rsi
   1ae43:	81 e6 ff 07 00 00    	and    $0x7ff,%esi
   1ae49:	49 89 e8             	mov    %rbp,%r8
   1ae4c:	49 21 d0             	and    %rdx,%r8
   1ae4f:	44 8d 8e cd fb ff ff 	lea    -0x433(%rsi),%r9d
   1ae56:	48 85 f6             	test   %rsi,%rsi
   1ae59:	44 0f 44 c8          	cmove  %eax,%r9d
   1ae5d:	49 8d 44 10 01       	lea    0x1(%r8,%rdx,1),%rax
   1ae62:	49 0f 44 c0          	cmove  %r8,%rax
   1ae66:	48 89 ee             	mov    %rbp,%rsi
   1ae69:	4c 31 ee             	xor    %r13,%rsi
   1ae6c:	48 f7 e7             	mul    %rdi
   1ae6f:	41 01 c9             	add    %ecx,%r9d
   1ae72:	48 c1 ee 3f          	shr    $0x3f,%rsi
   1ae76:	40 88 74 24 14       	mov    %sil,0x14(%rsp)
   1ae7b:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1ae80:	48 89 04 24          	mov    %rax,(%rsp)
   1ae84:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1ae89:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1ae8e:	48 89 e1             	mov    %rsp,%rcx
   1ae91:	4c 89 db             	mov    %r11,%rbx
   1ae94:	4c 89 de             	mov    %r11,%rsi
   1ae97:	4d 89 d7             	mov    %r10,%r15
   1ae9a:	4c 89 d2             	mov    %r10,%rdx
   1ae9d:	e8 ae e5 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1aea2:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1aea7:	74 08                	je     1aeb1 <<hyperinterval::float::F64Enclosure>::corner_image+0x141>
   1aea9:	44 0f b6 64 24 29    	movzbl 0x29(%rsp),%r12d
   1aeaf:	eb 40                	jmp    1aef1 <<hyperinterval::float::F64Enclosure>::corner_image+0x181>
   1aeb1:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   1aeb6:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
   1aebb:	48 89 e7             	mov    %rsp,%rdi
   1aebe:	48 89 de             	mov    %rbx,%rsi
   1aec1:	4c 89 fa             	mov    %r15,%rdx
   1aec4:	e8 47 de ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1aec9:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aecd:	75 1c                	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1aecf:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1aed4:	48 89 e7             	mov    %rsp,%rdi
   1aed7:	48 89 de             	mov    %rbx,%rsi
   1aeda:	4c 89 fa             	mov    %r15,%rdx
   1aedd:	4c 89 e1             	mov    %r12,%rcx
   1aee0:	e8 2b de ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1aee5:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1aee9:	74 28                	je     1af13 <<hyperinterval::float::F64Enclosure>::corner_image+0x1a3>
   1aeeb:	44 0f b6 64 24 01    	movzbl 0x1(%rsp),%r12d
   1aef1:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
   1aef6:	44 88 60 08          	mov    %r12b,0x8(%rax)
   1aefa:	48 c7 00 02 00 00 00 	movq   $0x2,(%rax)
   1af01:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   1af08:	5b                   	pop    %rbx
   1af09:	41 5c                	pop    %r12
   1af0b:	41 5d                	pop    %r13
   1af0d:	41 5e                	pop    %r14
   1af0f:	41 5f                	pop    %r15
   1af11:	5d                   	pop    %rbp
   1af12:	c3                   	ret
   1af13:	4d 8d 3c 1e          	lea    (%r14,%rbx,1),%r15
   1af17:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
   1af1b:	4c 89 f0             	mov    %r14,%rax
   1af1e:	48 21 d0             	and    %rdx,%rax
   1af21:	49 89 d9             	mov    %rbx,%r9
   1af24:	49 29 c1             	sub    %rax,%r9
   1af27:	4d 85 f6             	test   %r14,%r14
   1af2a:	4c 89 f8             	mov    %r15,%rax
   1af2d:	49 0f 48 c1          	cmovs  %r9,%rax
   1af31:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
   1af36:	4c 8d 04 1f          	lea    (%rdi,%rbx,1),%r8
   1af3a:	48 89 f9             	mov    %rdi,%rcx
   1af3d:	48 21 d1             	and    %rdx,%rcx
   1af40:	48 89 da             	mov    %rbx,%rdx
   1af43:	48 29 ca             	sub    %rcx,%rdx
   1af46:	48 85 ff             	test   %rdi,%rdi
   1af49:	4c 89 c1             	mov    %r8,%rcx
   1af4c:	48 0f 48 ca          	cmovs  %rdx,%rcx
   1af50:	41 b4 01             	mov    $0x1,%r12b
   1af53:	48 39 c8             	cmp    %rcx,%rax
   1af56:	77 99                	ja     1aef1 <<hyperinterval::float::F64Enclosure>::corner_image+0x181>
   1af58:	48 89 de             	mov    %rbx,%rsi
   1af5b:	48 89 54 24 70       	mov    %rdx,0x70(%rsp)
   1af60:	4c 89 4c 24 78       	mov    %r9,0x78(%rsp)
   1af65:	4c 89 84 24 80 00 00 	mov    %r8,0x80(%rsp)
   1af6c:	00 
   1af6d:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
   1af72:	80 7c 24 24 00       	cmpb   $0x0,0x24(%rsp)
   1af77:	74 3b                	je     1afb4 <<hyperinterval::float::F64Enclosure>::corner_image+0x244>
   1af79:	48 89 e7             	mov    %rsp,%rdi
   1af7c:	48 89 f3             	mov    %rsi,%rbx
   1af7f:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1af86:	00 f0 7f 
   1af89:	4c 89 e9             	mov    %r13,%rcx
   1af8c:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   1af91:	e8 aa e7 ff ff       	call   19740 <<hyperinterval::ieee::Format>::div>
   1af96:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1af9a:	0f 85 4b ff ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1afa0:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   1afa5:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1afaa:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
   1afaf:	e9 ba 00 00 00       	jmp    1b06e <<hyperinterval::float::F64Enclosure>::corner_image+0x2fe>
   1afb4:	4c 89 e8             	mov    %r13,%rax
   1afb7:	48 c1 e8 34          	shr    $0x34,%rax
   1afbb:	25 ff 07 00 00       	and    $0x7ff,%eax
   1afc0:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1afc7:	ff 0f 00 
   1afca:	4d 89 e9             	mov    %r13,%r9
   1afcd:	49 21 d1             	and    %rdx,%r9
   1afd0:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1afd6:	48 85 c0             	test   %rax,%rax
   1afd9:	49 8d 7c 11 01       	lea    0x1(%r9,%rdx,1),%rdi
   1afde:	41 b8 ce fb ff ff    	mov    $0xfffffbce,%r8d
   1afe4:	41 0f 44 c8          	cmove  %r8d,%ecx
   1afe8:	49 0f 44 f9          	cmove  %r9,%rdi
   1afec:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
   1aff1:	4c 89 d0             	mov    %r10,%rax
   1aff4:	48 c1 e8 34          	shr    $0x34,%rax
   1aff8:	25 ff 07 00 00       	and    $0x7ff,%eax
   1affd:	4d 89 d3             	mov    %r10,%r11
   1b000:	49 21 d3             	and    %rdx,%r11
   1b003:	44 8d 88 cd fb ff ff 	lea    -0x433(%rax),%r9d
   1b00a:	48 85 c0             	test   %rax,%rax
   1b00d:	49 8d 44 13 01       	lea    0x1(%r11,%rdx,1),%rax
   1b012:	45 0f 44 c8          	cmove  %r8d,%r9d
   1b016:	49 0f 44 c3          	cmove  %r11,%rax
   1b01a:	4d 31 d5             	xor    %r10,%r13
   1b01d:	48 f7 e7             	mul    %rdi
   1b020:	41 01 c9             	add    %ecx,%r9d
   1b023:	49 c1 ed 3f          	shr    $0x3f,%r13
   1b027:	44 88 6c 24 14       	mov    %r13b,0x14(%rsp)
   1b02c:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b031:	48 89 04 24          	mov    %rax,(%rsp)
   1b035:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1b03a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b03f:	48 89 e1             	mov    %rsp,%rcx
   1b042:	48 89 f3             	mov    %rsi,%rbx
   1b045:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b04c:	00 f0 7f 
   1b04f:	e8 fc e3 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1b054:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b059:	0f 85 4a fe ff ff    	jne    1aea9 <<hyperinterval::float::F64Enclosure>::corner_image+0x139>
   1b05f:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
   1b064:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   1b069:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
   1b06e:	48 89 e7             	mov    %rsp,%rdi
   1b071:	48 89 de             	mov    %rbx,%rsi
   1b074:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b07b:	00 f0 7f 
   1b07e:	4c 89 fa             	mov    %r15,%rdx
   1b081:	e8 8a dc ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b086:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b08a:	0f 84 5b fe ff ff    	je     1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b090:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b095:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
   1b09a:	48 89 e7             	mov    %rsp,%rdi
   1b09d:	48 89 de             	mov    %rbx,%rsi
   1b0a0:	4c 89 fa             	mov    %r15,%rdx
   1b0a3:	4c 89 e9             	mov    %r13,%rcx
   1b0a6:	e8 65 dc ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b0ab:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b0af:	0f 84 36 fe ff ff    	je     1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b0b5:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1b0ba:	4c 8b 4c 24 50       	mov    0x50(%rsp),%r9
   1b0bf:	49 8d 0c 19          	lea    (%r9,%rbx,1),%rcx
   1b0c3:	4c 89 ca             	mov    %r9,%rdx
   1b0c6:	48 8d 7b ff          	lea    -0x1(%rbx),%rdi
   1b0ca:	48 21 fa             	and    %rdi,%rdx
   1b0cd:	48 89 d8             	mov    %rbx,%rax
   1b0d0:	48 29 d0             	sub    %rdx,%rax
   1b0d3:	4d 85 c9             	test   %r9,%r9
   1b0d6:	48 0f 49 c1          	cmovns %rcx,%rax
   1b0da:	4a 8d 14 2b          	lea    (%rbx,%r13,1),%rdx
   1b0de:	4c 89 ee             	mov    %r13,%rsi
   1b0e1:	48 21 fe             	and    %rdi,%rsi
   1b0e4:	48 89 d9             	mov    %rbx,%rcx
   1b0e7:	48 29 f1             	sub    %rsi,%rcx
   1b0ea:	4d 85 ed             	test   %r13,%r13
   1b0ed:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b0f1:	48 39 c8             	cmp    %rcx,%rax
   1b0f4:	0f 87 f7 fd ff ff    	ja     1aef1 <<hyperinterval::float::F64Enclosure>::corner_image+0x181>
   1b0fa:	4c 89 ca             	mov    %r9,%rdx
   1b0fd:	48 89 de             	mov    %rbx,%rsi
   1b100:	4d 85 f6             	test   %r14,%r14
   1b103:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
   1b108:	48 0f 48 7c 24 78    	cmovs  0x78(%rsp),%rdi
   1b10e:	48 39 c7             	cmp    %rax,%rdi
   1b111:	49 0f 46 d6          	cmovbe %r14,%rdx
   1b115:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
   1b11a:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1b11f:	48 85 c0             	test   %rax,%rax
   1b122:	48 8b 94 24 80 00 00 	mov    0x80(%rsp),%rdx
   1b129:	00 
   1b12a:	48 0f 48 54 24 70    	cmovs  0x70(%rsp),%rdx
   1b130:	48 39 ca             	cmp    %rcx,%rdx
   1b133:	4c 0f 43 e8          	cmovae %rax,%r13
   1b137:	80 7c 24 24 00       	cmpb   $0x0,0x24(%rsp)
   1b13c:	74 36                	je     1b174 <<hyperinterval::float::F64Enclosure>::corner_image+0x404>
   1b13e:	48 89 e7             	mov    %rsp,%rdi
   1b141:	48 89 f3             	mov    %rsi,%rbx
   1b144:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b14b:	00 f0 7f 
   1b14e:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b153:	49 89 e8             	mov    %rbp,%r8
   1b156:	e8 e5 e5 ff ff       	call   19740 <<hyperinterval::ieee::Format>::div>
   1b15b:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b15f:	0f 85 86 fd ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b165:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b16a:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
   1b16f:	e9 b5 00 00 00       	jmp    1b229 <<hyperinterval::float::F64Enclosure>::corner_image+0x4b9>
   1b174:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
   1b179:	4c 89 d0             	mov    %r10,%rax
   1b17c:	48 c1 e8 34          	shr    $0x34,%rax
   1b180:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b185:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1b18c:	ff 0f 00 
   1b18f:	4d 89 d1             	mov    %r10,%r9
   1b192:	49 21 d1             	and    %rdx,%r9
   1b195:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1b19b:	48 85 c0             	test   %rax,%rax
   1b19e:	49 8d 7c 11 01       	lea    0x1(%r9,%rdx,1),%rdi
   1b1a3:	41 b8 ce fb ff ff    	mov    $0xfffffbce,%r8d
   1b1a9:	41 0f 44 c8          	cmove  %r8d,%ecx
   1b1ad:	49 0f 44 f9          	cmove  %r9,%rdi
   1b1b1:	48 89 e8             	mov    %rbp,%rax
   1b1b4:	48 c1 e8 34          	shr    $0x34,%rax
   1b1b8:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b1bd:	49 89 eb             	mov    %rbp,%r11
   1b1c0:	49 21 d3             	and    %rdx,%r11
   1b1c3:	44 8d 88 cd fb ff ff 	lea    -0x433(%rax),%r9d
   1b1ca:	48 85 c0             	test   %rax,%rax
   1b1cd:	49 8d 44 13 01       	lea    0x1(%r11,%rdx,1),%rax
   1b1d2:	45 0f 44 c8          	cmove  %r8d,%r9d
   1b1d6:	49 0f 44 c3          	cmove  %r11,%rax
   1b1da:	4c 31 d5             	xor    %r10,%rbp
   1b1dd:	48 f7 e7             	mul    %rdi
   1b1e0:	41 01 c9             	add    %ecx,%r9d
   1b1e3:	48 c1 ed 3f          	shr    $0x3f,%rbp
   1b1e7:	40 88 6c 24 14       	mov    %bpl,0x14(%rsp)
   1b1ec:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b1f1:	48 89 04 24          	mov    %rax,(%rsp)
   1b1f5:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1b1fa:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b1ff:	48 89 e1             	mov    %rsp,%rcx
   1b202:	48 89 f3             	mov    %rsi,%rbx
   1b205:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b20c:	00 f0 7f 
   1b20f:	e8 3c e2 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1b214:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b219:	0f 85 8a fc ff ff    	jne    1aea9 <<hyperinterval::float::F64Enclosure>::corner_image+0x139>
   1b21f:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   1b224:	48 8b 6c 24 38       	mov    0x38(%rsp),%rbp
   1b229:	48 89 e7             	mov    %rsp,%rdi
   1b22c:	48 89 de             	mov    %rbx,%rsi
   1b22f:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b236:	00 f0 7f 
   1b239:	4c 89 fa             	mov    %r15,%rdx
   1b23c:	e8 cf da ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b241:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b245:	0f 85 a0 fc ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b24b:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
   1b250:	48 89 e7             	mov    %rsp,%rdi
   1b253:	48 89 de             	mov    %rbx,%rsi
   1b256:	4c 89 fa             	mov    %r15,%rdx
   1b259:	48 89 e9             	mov    %rbp,%rcx
   1b25c:	e8 af da ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b261:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b265:	0f 85 80 fc ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b26b:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
   1b270:	49 8d 04 1e          	lea    (%r14,%rbx,1),%rax
   1b274:	4c 89 f2             	mov    %r14,%rdx
   1b277:	4c 8d 43 ff          	lea    -0x1(%rbx),%r8
   1b27b:	4c 21 c2             	and    %r8,%rdx
   1b27e:	48 89 d9             	mov    %rbx,%rcx
   1b281:	48 29 d1             	sub    %rdx,%rcx
   1b284:	4d 85 f6             	test   %r14,%r14
   1b287:	48 0f 49 c8          	cmovns %rax,%rcx
   1b28b:	48 8d 14 2b          	lea    (%rbx,%rbp,1),%rdx
   1b28f:	48 89 ee             	mov    %rbp,%rsi
   1b292:	4c 21 c6             	and    %r8,%rsi
   1b295:	48 89 d8             	mov    %rbx,%rax
   1b298:	48 29 f0             	sub    %rsi,%rax
   1b29b:	48 85 ed             	test   %rbp,%rbp
   1b29e:	48 0f 49 c2          	cmovns %rdx,%rax
   1b2a2:	48 39 c1             	cmp    %rax,%rcx
   1b2a5:	0f 87 46 fc ff ff    	ja     1aef1 <<hyperinterval::float::F64Enclosure>::corner_image+0x181>
   1b2ab:	4d 89 f1             	mov    %r14,%r9
   1b2ae:	4c 8b 54 24 50       	mov    0x50(%rsp),%r10
   1b2b3:	49 8d 14 1a          	lea    (%r10,%rbx,1),%rdx
   1b2b7:	4c 89 d6             	mov    %r10,%rsi
   1b2ba:	4c 21 c6             	and    %r8,%rsi
   1b2bd:	48 89 df             	mov    %rbx,%rdi
   1b2c0:	48 29 f7             	sub    %rsi,%rdi
   1b2c3:	4d 85 d2             	test   %r10,%r10
   1b2c6:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b2ca:	48 39 cf             	cmp    %rcx,%rdi
   1b2cd:	4d 0f 46 ca          	cmovbe %r10,%r9
   1b2d1:	4c 89 4c 24 58       	mov    %r9,0x58(%rsp)
   1b2d6:	4a 8d 0c 2b          	lea    (%rbx,%r13,1),%rcx
   1b2da:	4c 89 ea             	mov    %r13,%rdx
   1b2dd:	4c 21 c2             	and    %r8,%rdx
   1b2e0:	48 89 de             	mov    %rbx,%rsi
   1b2e3:	48 29 d6             	sub    %rdx,%rsi
   1b2e6:	4d 85 ed             	test   %r13,%r13
   1b2e9:	48 0f 49 f1          	cmovns %rcx,%rsi
   1b2ed:	48 39 c6             	cmp    %rax,%rsi
   1b2f0:	49 0f 43 ed          	cmovae %r13,%rbp
   1b2f4:	80 7c 24 24 00       	cmpb   $0x0,0x24(%rsp)
   1b2f9:	48 89 de             	mov    %rbx,%rsi
   1b2fc:	74 38                	je     1b336 <<hyperinterval::float::F64Enclosure>::corner_image+0x5c6>
   1b2fe:	48 89 e7             	mov    %rsp,%rdi
   1b301:	48 89 f3             	mov    %rsi,%rbx
   1b304:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b30b:	00 f0 7f 
   1b30e:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b313:	4c 8b 44 24 48       	mov    0x48(%rsp),%r8
   1b318:	e8 23 e4 ff ff       	call   19740 <<hyperinterval::ieee::Format>::div>
   1b31d:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b321:	0f 85 c4 fb ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b327:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
   1b32c:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
   1b331:	e9 ba 00 00 00       	jmp    1b3f0 <<hyperinterval::float::F64Enclosure>::corner_image+0x680>
   1b336:	4c 8b 5c 24 40       	mov    0x40(%rsp),%r11
   1b33b:	4c 89 d8             	mov    %r11,%rax
   1b33e:	48 c1 e8 34          	shr    $0x34,%rax
   1b342:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b347:	48 ba ff ff ff ff ff 	movabs $0xfffffffffffff,%rdx
   1b34e:	ff 0f 00 
   1b351:	4d 89 d9             	mov    %r11,%r9
   1b354:	49 21 d1             	and    %rdx,%r9
   1b357:	8d 88 cd fb ff ff    	lea    -0x433(%rax),%ecx
   1b35d:	48 85 c0             	test   %rax,%rax
   1b360:	49 8d 7c 11 01       	lea    0x1(%r9,%rdx,1),%rdi
   1b365:	41 b8 ce fb ff ff    	mov    $0xfffffbce,%r8d
   1b36b:	41 0f 44 c8          	cmove  %r8d,%ecx
   1b36f:	49 0f 44 f9          	cmove  %r9,%rdi
   1b373:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
   1b378:	4c 89 d0             	mov    %r10,%rax
   1b37b:	48 c1 e8 34          	shr    $0x34,%rax
   1b37f:	25 ff 07 00 00       	and    $0x7ff,%eax
   1b384:	4c 89 d3             	mov    %r10,%rbx
   1b387:	48 21 d3             	and    %rdx,%rbx
   1b38a:	44 8d 88 cd fb ff ff 	lea    -0x433(%rax),%r9d
   1b391:	48 85 c0             	test   %rax,%rax
   1b394:	48 8d 44 13 01       	lea    0x1(%rbx,%rdx,1),%rax
   1b399:	45 0f 44 c8          	cmove  %r8d,%r9d
   1b39d:	48 0f 44 c3          	cmove  %rbx,%rax
   1b3a1:	4d 31 da             	xor    %r11,%r10
   1b3a4:	48 f7 e7             	mul    %rdi
   1b3a7:	41 01 c9             	add    %ecx,%r9d
   1b3aa:	49 c1 ea 3f          	shr    $0x3f,%r10
   1b3ae:	44 88 54 24 14       	mov    %r10b,0x14(%rsp)
   1b3b3:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b3b8:	48 89 04 24          	mov    %rax,(%rsp)
   1b3bc:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
   1b3c1:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b3c6:	48 89 e1             	mov    %rsp,%rcx
   1b3c9:	48 89 f3             	mov    %rsi,%rbx
   1b3cc:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1b3d3:	00 f0 7f 
   1b3d6:	e8 75 e0 ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1b3db:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b3e0:	0f 85 c3 fa ff ff    	jne    1aea9 <<hyperinterval::float::F64Enclosure>::corner_image+0x139>
   1b3e6:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
   1b3eb:	4c 8b 74 24 38       	mov    0x38(%rsp),%r14
   1b3f0:	48 89 e7             	mov    %rsp,%rdi
   1b3f3:	48 89 de             	mov    %rbx,%rsi
   1b3f6:	49 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%r13
   1b3fd:	00 f0 7f 
   1b400:	4c 89 ea             	mov    %r13,%rdx
   1b403:	e8 08 d9 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b408:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b40c:	0f 85 d9 fa ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b412:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b417:	48 89 e7             	mov    %rsp,%rdi
   1b41a:	48 89 de             	mov    %rbx,%rsi
   1b41d:	4c 89 ea             	mov    %r13,%rdx
   1b420:	4c 89 f1             	mov    %r14,%rcx
   1b423:	e8 e8 d8 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b428:	80 3c 24 00          	cmpb   $0x0,(%rsp)
   1b42c:	0f 85 b9 fa ff ff    	jne    1aeeb <<hyperinterval::float::F64Enclosure>::corner_image+0x17b>
   1b432:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b437:	49 8d 0c 1f          	lea    (%r15,%rbx,1),%rcx
   1b43b:	4c 89 fe             	mov    %r15,%rsi
   1b43e:	4c 8d 4b ff          	lea    -0x1(%rbx),%r9
   1b442:	4c 21 ce             	and    %r9,%rsi
   1b445:	48 89 da             	mov    %rbx,%rdx
   1b448:	48 29 f2             	sub    %rsi,%rdx
   1b44b:	4d 85 ff             	test   %r15,%r15
   1b44e:	48 0f 49 d1          	cmovns %rcx,%rdx
   1b452:	48 8d 34 18          	lea    (%rax,%rbx,1),%rsi
   1b456:	48 89 c7             	mov    %rax,%rdi
   1b459:	4c 21 cf             	and    %r9,%rdi
   1b45c:	49 89 db             	mov    %rbx,%r11
   1b45f:	48 29 fb             	sub    %rdi,%rbx
   1b462:	48 85 c0             	test   %rax,%rax
   1b465:	48 0f 49 de          	cmovns %rsi,%rbx
   1b469:	48 39 da             	cmp    %rbx,%rdx
   1b46c:	0f 87 7f fa ff ff    	ja     1aef1 <<hyperinterval::float::F64Enclosure>::corner_image+0x181>
   1b472:	4d 89 c8             	mov    %r9,%r8
   1b475:	4c 8b 54 24 58       	mov    0x58(%rsp),%r10
   1b47a:	4b 8d 34 1a          	lea    (%r10,%r11,1),%rsi
   1b47e:	4c 89 d7             	mov    %r10,%rdi
   1b481:	4c 21 c7             	and    %r8,%rdi
   1b484:	4d 89 d8             	mov    %r11,%r8
   1b487:	49 29 f8             	sub    %rdi,%r8
   1b48a:	4d 85 d2             	test   %r10,%r10
   1b48d:	4c 0f 49 c6          	cmovns %rsi,%r8
   1b491:	49 39 d0             	cmp    %rdx,%r8
   1b494:	4d 0f 46 fa          	cmovbe %r10,%r15
   1b498:	49 8d 14 2b          	lea    (%r11,%rbp,1),%rdx
   1b49c:	49 21 e9             	and    %rbp,%r9
   1b49f:	4d 29 cb             	sub    %r9,%r11
   1b4a2:	48 85 ed             	test   %rbp,%rbp
   1b4a5:	4c 0f 49 da          	cmovns %rdx,%r11
   1b4a9:	49 39 db             	cmp    %rbx,%r11
   1b4ac:	48 0f 43 c5          	cmovae %rbp,%rax
   1b4b0:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
   1b4b5:	48 c7 01 01 00 00 00 	movq   $0x1,(%rcx)
   1b4bc:	4c 89 79 08          	mov    %r15,0x8(%rcx)
   1b4c0:	48 89 41 10          	mov    %rax,0x10(%rcx)
   1b4c4:	e9 38 fa ff ff       	jmp    1af01 <<hyperinterval::float::F64Enclosure>::corner_image+0x191>
   1b4c9:	cc                   	int3
   1b4ca:	cc                   	int3
   1b4cb:	cc                   	int3
   1b4cc:	cc                   	int3
   1b4cd:	cc                   	int3
   1b4ce:	cc                   	int3
   1b4cf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::square:
   1b4d0:	55                   	push   %rbp
   1b4d1:	41 57                	push   %r15
   1b4d3:	41 56                	push   %r14
   1b4d5:	41 55                	push   %r13
   1b4d7:	41 54                	push   %r12
   1b4d9:	53                   	push   %rbx
   1b4da:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   1b4e1:	48 89 fb             	mov    %rdi,%rbx
   1b4e4:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b4e8:	0f 85 0a 01 00 00    	jne    1b5f8 <<hyperinterval::float::F64Enclosure>::square+0x128>
   1b4ee:	4c 8b 66 10          	mov    0x10(%rsi),%r12
   1b4f2:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b4f9:	00 00 80 
   1b4fc:	49 b8 00 00 00 00 00 	movabs $0x7ff0000000000000,%r8
   1b503:	00 f0 7f 
   1b506:	49 bf ff ff ff ff ff 	movabs $0xfffffffffffff,%r15
   1b50d:	ff 0f 00 
   1b510:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
   1b514:	4c 89 e9             	mov    %r13,%rcx
   1b517:	48 c1 e9 34          	shr    $0x34,%rcx
   1b51b:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b521:	4c 89 ea             	mov    %r13,%rdx
   1b524:	4c 21 fa             	and    %r15,%rdx
   1b527:	48 85 c9             	test   %rcx,%rcx
   1b52a:	4a 8d 44 3a 01       	lea    0x1(%rdx,%r15,1),%rax
   1b52f:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b536:	48 0f 44 c2          	cmove  %rdx,%rax
   1b53a:	bd 9c f7 ff ff       	mov    $0xfffff79c,%ebp
   1b53f:	0f 44 cd             	cmove  %ebp,%ecx
   1b542:	48 f7 e0             	mul    %rax
   1b545:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b54a:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b54f:	48 89 04 24          	mov    %rax,(%rsp)
   1b553:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b557:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b55c:	48 89 e1             	mov    %rsp,%rcx
   1b55f:	4c 89 f6             	mov    %r14,%rsi
   1b562:	4c 89 c2             	mov    %r8,%rdx
   1b565:	e8 e6 de ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1b56a:	80 7c 24 28 00       	cmpb   $0x0,0x28(%rsp)
   1b56f:	75 76                	jne    1b5e7 <<hyperinterval::float::F64Enclosure>::square+0x117>
   1b571:	4c 89 e2             	mov    %r12,%rdx
   1b574:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
   1b579:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   1b57e:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
   1b583:	48 89 d1             	mov    %rdx,%rcx
   1b586:	48 c1 e9 34          	shr    $0x34,%rcx
   1b58a:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
   1b590:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
   1b595:	4c 21 fa             	and    %r15,%rdx
   1b598:	48 85 c9             	test   %rcx,%rcx
   1b59b:	49 8d 44 17 01       	lea    0x1(%r15,%rdx,1),%rax
   1b5a0:	48 0f 44 c2          	cmove  %rdx,%rax
   1b5a4:	8d 8c 09 9a f7 ff ff 	lea    -0x866(%rcx,%rcx,1),%ecx
   1b5ab:	0f 44 cd             	cmove  %ebp,%ecx
   1b5ae:	48 f7 e0             	mul    %rax
   1b5b1:	c6 44 24 14 00       	movb   $0x0,0x14(%rsp)
   1b5b6:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
   1b5bb:	48 89 04 24          	mov    %rax,(%rsp)
   1b5bf:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
   1b5c3:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
   1b5c8:	48 89 e1             	mov    %rsp,%rcx
   1b5cb:	4c 89 f6             	mov    %r14,%rsi
   1b5ce:	48 bd 00 00 00 00 00 	movabs $0x7ff0000000000000,%rbp
   1b5d5:	00 f0 7f 
   1b5d8:	48 89 ea             	mov    %rbp,%rdx
   1b5db:	e8 70 de ff ff       	call   19450 <<hyperinterval::ieee::Format>::rounded>
   1b5e0:	80 7c 24 28 01       	cmpb   $0x1,0x28(%rsp)
   1b5e5:	75 2a                	jne    1b611 <<hyperinterval::float::F64Enclosure>::square+0x141>
   1b5e7:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
   1b5ec:	88 43 08             	mov    %al,0x8(%rbx)
   1b5ef:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b5f6:	eb 07                	jmp    1b5ff <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1b5f8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
   1b5ff:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   1b606:	5b                   	pop    %rbx
   1b607:	41 5c                	pop    %r12
   1b609:	41 5d                	pop    %r13
   1b60b:	41 5e                	pop    %r14
   1b60d:	41 5f                	pop    %r15
   1b60f:	5d                   	pop    %rbp
   1b610:	c3                   	ret
   1b611:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
   1b616:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
   1b61b:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
   1b620:	48 89 e7             	mov    %rsp,%rdi
   1b623:	4c 89 f6             	mov    %r14,%rsi
   1b626:	48 89 ea             	mov    %rbp,%rdx
   1b629:	4c 89 e1             	mov    %r12,%rcx
   1b62c:	e8 df d6 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b631:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b635:	74 23                	je     1b65a <<hyperinterval::float::F64Enclosure>::square+0x18a>
   1b637:	4c 89 7c 24 78       	mov    %r15,0x78(%rsp)
   1b63c:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b641:	48 89 e7             	mov    %rsp,%rdi
   1b644:	4c 89 f6             	mov    %r14,%rsi
   1b647:	48 89 ea             	mov    %rbp,%rdx
   1b64a:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
   1b64f:	e8 bc d6 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b654:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b658:	75 07                	jne    1b661 <<hyperinterval::float::F64Enclosure>::square+0x191>
   1b65a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1b65f:	eb 8b                	jmp    1b5ec <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1b661:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
   1b666:	4b 8d 04 37          	lea    (%r15,%r14,1),%rax
   1b66a:	49 8d 56 ff          	lea    -0x1(%r14),%rdx
   1b66e:	4c 89 f9             	mov    %r15,%rcx
   1b671:	48 21 d1             	and    %rdx,%rcx
   1b674:	4c 89 f7             	mov    %r14,%rdi
   1b677:	48 29 cf             	sub    %rcx,%rdi
   1b67a:	4d 85 ff             	test   %r15,%r15
   1b67d:	48 0f 49 f8          	cmovns %rax,%rdi
   1b681:	4a 8d 04 36          	lea    (%rsi,%r14,1),%rax
   1b685:	48 89 f1             	mov    %rsi,%rcx
   1b688:	48 21 d1             	and    %rdx,%rcx
   1b68b:	4d 89 f4             	mov    %r14,%r12
   1b68e:	49 29 cc             	sub    %rcx,%r12
   1b691:	48 85 f6             	test   %rsi,%rsi
   1b694:	4c 0f 49 e0          	cmovns %rax,%r12
   1b698:	b0 01                	mov    $0x1,%al
   1b69a:	4c 39 e7             	cmp    %r12,%rdi
   1b69d:	0f 87 49 ff ff ff    	ja     1b5ec <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1b6a3:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
   1b6a8:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
   1b6ad:	48 89 e7             	mov    %rsp,%rdi
   1b6b0:	4c 89 f6             	mov    %r14,%rsi
   1b6b3:	48 89 ea             	mov    %rbp,%rdx
   1b6b6:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b6bb:	e8 50 d6 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b6c0:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6c4:	74 23                	je     1b6e9 <<hyperinterval::float::F64Enclosure>::square+0x219>
   1b6c6:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
   1b6cb:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
   1b6d0:	48 89 e7             	mov    %rsp,%rdi
   1b6d3:	4c 89 f6             	mov    %r14,%rsi
   1b6d6:	48 89 ea             	mov    %rbp,%rdx
   1b6d9:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
   1b6de:	e8 2d d6 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b6e3:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1b6e7:	75 14                	jne    1b6fd <<hyperinterval::float::F64Enclosure>::square+0x22d>
   1b6e9:	0f b6 54 24 01       	movzbl 0x1(%rsp),%edx
   1b6ee:	88 53 08             	mov    %dl,0x8(%rbx)
   1b6f1:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b6f8:	e9 02 ff ff ff       	jmp    1b5ff <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1b6fd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1b702:	4b 8d 14 37          	lea    (%r15,%r14,1),%rdx
   1b706:	4c 89 fe             	mov    %r15,%rsi
   1b709:	49 8d 7e ff          	lea    -0x1(%r14),%rdi
   1b70d:	48 21 fe             	and    %rdi,%rsi
   1b710:	4c 89 f1             	mov    %r14,%rcx
   1b713:	48 29 f1             	sub    %rsi,%rcx
   1b716:	4d 85 ff             	test   %r15,%r15
   1b719:	48 0f 49 ca          	cmovns %rdx,%rcx
   1b71d:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1b721:	48 89 c6             	mov    %rax,%rsi
   1b724:	48 21 fe             	and    %rdi,%rsi
   1b727:	49 29 f6             	sub    %rsi,%r14
   1b72a:	48 85 c0             	test   %rax,%rax
   1b72d:	4c 0f 49 f2          	cmovns %rdx,%r14
   1b731:	b2 01                	mov    $0x1,%dl
   1b733:	4c 39 f1             	cmp    %r14,%rcx
   1b736:	77 b6                	ja     1b6ee <<hyperinterval::float::F64Enclosure>::square+0x21e>
   1b738:	48 39 4c 24 70       	cmp    %rcx,0x70(%rsp)
   1b73d:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
   1b742:	49 0f 47 cf          	cmova  %r15,%rcx
   1b746:	4d 39 f4             	cmp    %r14,%r12
   1b749:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
   1b74e:	48 0f 42 d0          	cmovb  %rax,%rdx
   1b752:	48 c7 44 24 50 01 00 	movq   $0x1,0x50(%rsp)
   1b759:	00 00 
   1b75b:	48 89 4c 24 58       	mov    %rcx,0x58(%rsp)
   1b760:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
   1b765:	4d 85 ed             	test   %r13,%r13
   1b768:	7f 78                	jg     1b7e2 <<hyperinterval::float::F64Enclosure>::square+0x312>
   1b76a:	48 83 7c 24 68 00    	cmpq   $0x0,0x68(%rsp)
   1b770:	79 07                	jns    1b779 <<hyperinterval::float::F64Enclosure>::square+0x2a9>
   1b772:	48 21 7c 24 68       	and    %rdi,0x68(%rsp)
   1b777:	75 69                	jne    1b7e2 <<hyperinterval::float::F64Enclosure>::square+0x312>
   1b779:	48 89 e7             	mov    %rsp,%rdi
   1b77c:	e8 ef 01 00 00       	call   1b970 <<hyperinterval::float::F64Enclosure>::from_bits>
   1b781:	48 8b 0c 24          	mov    (%rsp),%rcx
   1b785:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1b78a:	48 83 f9 02          	cmp    $0x2,%rcx
   1b78e:	0f 84 58 fe ff ff    	je     1b5ec <<hyperinterval::float::F64Enclosure>::square+0x11c>
   1b794:	48 8b 54 24 09       	mov    0x9(%rsp),%rdx
   1b799:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1b79e:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
   1b7a3:	48 89 54 24 31       	mov    %rdx,0x31(%rsp)
   1b7a8:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
   1b7ad:	88 44 24 30          	mov    %al,0x30(%rsp)
   1b7b1:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
   1b7b8:	00 
   1b7b9:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
   1b7be:	48 8d 54 24 28       	lea    0x28(%rsp),%rdx
   1b7c3:	e8 48 00 00 00       	call   1b810 <<hyperinterval::float::F64Enclosure>::hull>
   1b7c8:	48 8b 84 24 90 00 00 	mov    0x90(%rsp),%rax
   1b7cf:	00 
   1b7d0:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
   1b7d5:	0f 10 84 24 80 00 00 	movups 0x80(%rsp),%xmm0
   1b7dc:	00 
   1b7dd:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
   1b7e2:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
   1b7e7:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1b7eb:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
   1b7f0:	48 89 03             	mov    %rax,(%rbx)
   1b7f3:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
   1b7f8:	48 89 43 08          	mov    %rax,0x8(%rbx)
   1b7fc:	e9 fe fd ff ff       	jmp    1b5ff <<hyperinterval::float::F64Enclosure>::square+0x12f>
   1b801:	cc                   	int3
   1b802:	cc                   	int3
   1b803:	cc                   	int3
   1b804:	cc                   	int3
   1b805:	cc                   	int3
   1b806:	cc                   	int3
   1b807:	cc                   	int3
   1b808:	cc                   	int3
   1b809:	cc                   	int3
   1b80a:	cc                   	int3
   1b80b:	cc                   	int3
   1b80c:	cc                   	int3
   1b80d:	cc                   	int3
   1b80e:	cc                   	int3
   1b80f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::hull:
   1b810:	4c 8b 02             	mov    (%rdx),%r8
   1b813:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   1b817:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1b81b:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1b81f:	0f 85 9f 00 00 00    	jne    1b8c4 <<hyperinterval::float::F64Enclosure>::hull+0xb4>
   1b825:	4c 8b 56 08          	mov    0x8(%rsi),%r10
   1b829:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1b82d:	ba 01 00 00 00       	mov    $0x1,%edx
   1b832:	49 83 f8 01          	cmp    $0x1,%r8
   1b836:	0f 85 97 00 00 00    	jne    1b8d3 <<hyperinterval::float::F64Enclosure>::hull+0xc3>
   1b83c:	41 57                	push   %r15
   1b83e:	41 56                	push   %r14
   1b840:	53                   	push   %rbx
   1b841:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b848:	00 00 80 
   1b84b:	4f 8d 1c 02          	lea    (%r10,%r8,1),%r11
   1b84f:	4d 8d 48 ff          	lea    -0x1(%r8),%r9
   1b853:	4c 89 d3             	mov    %r10,%rbx
   1b856:	4c 21 cb             	and    %r9,%rbx
   1b859:	4d 89 c6             	mov    %r8,%r14
   1b85c:	49 29 de             	sub    %rbx,%r14
   1b85f:	4d 85 d2             	test   %r10,%r10
   1b862:	4d 0f 49 f3          	cmovns %r11,%r14
   1b866:	4e 8d 1c 01          	lea    (%rcx,%r8,1),%r11
   1b86a:	48 89 cb             	mov    %rcx,%rbx
   1b86d:	4c 21 cb             	and    %r9,%rbx
   1b870:	4d 89 c7             	mov    %r8,%r15
   1b873:	49 29 df             	sub    %rbx,%r15
   1b876:	48 85 c9             	test   %rcx,%rcx
   1b879:	4d 0f 49 fb          	cmovns %r11,%r15
   1b87d:	4d 39 fe             	cmp    %r15,%r14
   1b880:	49 0f 46 ca          	cmovbe %r10,%rcx
   1b884:	4e 8d 14 06          	lea    (%rsi,%r8,1),%r10
   1b888:	49 89 f3             	mov    %rsi,%r11
   1b88b:	4d 21 cb             	and    %r9,%r11
   1b88e:	4c 89 c3             	mov    %r8,%rbx
   1b891:	4c 29 db             	sub    %r11,%rbx
   1b894:	48 85 f6             	test   %rsi,%rsi
   1b897:	49 0f 49 da          	cmovns %r10,%rbx
   1b89b:	4e 8d 14 00          	lea    (%rax,%r8,1),%r10
   1b89f:	49 21 c1             	and    %rax,%r9
   1b8a2:	4d 29 c8             	sub    %r9,%r8
   1b8a5:	48 85 c0             	test   %rax,%rax
   1b8a8:	4d 0f 49 c2          	cmovns %r10,%r8
   1b8ac:	4c 39 c3             	cmp    %r8,%rbx
   1b8af:	48 0f 43 c6          	cmovae %rsi,%rax
   1b8b3:	5b                   	pop    %rbx
   1b8b4:	41 5e                	pop    %r14
   1b8b6:	41 5f                	pop    %r15
   1b8b8:	48 89 17             	mov    %rdx,(%rdi)
   1b8bb:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b8bf:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b8c3:	c3                   	ret
   1b8c4:	4c 89 c2             	mov    %r8,%rdx
   1b8c7:	48 89 17             	mov    %rdx,(%rdi)
   1b8ca:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b8ce:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b8d2:	c3                   	ret
   1b8d3:	48 89 f0             	mov    %rsi,%rax
   1b8d6:	4c 89 d1             	mov    %r10,%rcx
   1b8d9:	48 89 17             	mov    %rdx,(%rdi)
   1b8dc:	48 89 4f 08          	mov    %rcx,0x8(%rdi)
   1b8e0:	48 89 47 10          	mov    %rax,0x10(%rdi)
   1b8e4:	c3                   	ret
   1b8e5:	cc                   	int3
   1b8e6:	cc                   	int3
   1b8e7:	cc                   	int3
   1b8e8:	cc                   	int3
   1b8e9:	cc                   	int3
   1b8ea:	cc                   	int3
   1b8eb:	cc                   	int3
   1b8ec:	cc                   	int3
   1b8ed:	cc                   	int3
   1b8ee:	cc                   	int3
   1b8ef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::signs:
   1b8f0:	83 3f 01             	cmpl   $0x1,(%rdi)
   1b8f3:	75 69                	jne    1b95e <<hyperinterval::float::F64Enclosure>::signs+0x6e>
   1b8f5:	49 b8 00 00 00 00 00 	movabs $0x8000000000000000,%r8
   1b8fc:	00 00 80 
   1b8ff:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   1b903:	48 8b 47 10          	mov    0x10(%rdi),%rax
   1b907:	4a 8d 14 01          	lea    (%rcx,%r8,1),%rdx
   1b90b:	49 8d 70 ff          	lea    -0x1(%r8),%rsi
   1b90f:	49 89 c9             	mov    %rcx,%r9
   1b912:	49 21 f1             	and    %rsi,%r9
   1b915:	4c 89 c7             	mov    %r8,%rdi
   1b918:	4c 29 cf             	sub    %r9,%rdi
   1b91b:	48 85 c9             	test   %rcx,%rcx
   1b91e:	48 0f 49 fa          	cmovns %rdx,%rdi
   1b922:	31 d2                	xor    %edx,%edx
   1b924:	48 85 ff             	test   %rdi,%rdi
   1b927:	0f 99 c1             	setns  %cl
   1b92a:	4c 39 c7             	cmp    %r8,%rdi
   1b92d:	77 1f                	ja     1b94e <<hyperinterval::float::F64Enclosure>::signs+0x5e>
   1b92f:	48 85 ff             	test   %rdi,%rdi
   1b932:	40 0f 99 c7          	setns  %dil
   1b936:	40 80 cf 02          	or     $0x2,%dil
   1b93a:	48 85 f0             	test   %rsi,%rax
   1b93d:	88 ca                	mov    %cl,%dl
   1b93f:	40 0f b6 cf          	movzbl %dil,%ecx
   1b943:	0f 44 d1             	cmove  %ecx,%edx
   1b946:	48 85 c0             	test   %rax,%rax
   1b949:	0f 49 d1             	cmovns %ecx,%edx
   1b94c:	89 d1                	mov    %edx,%ecx
   1b94e:	8d 51 04             	lea    0x4(%rcx),%edx
   1b951:	48 85 c0             	test   %rax,%rax
   1b954:	0f b6 c9             	movzbl %cl,%ecx
   1b957:	0f b6 c2             	movzbl %dl,%eax
   1b95a:	0f 4e c1             	cmovle %ecx,%eax
   1b95d:	c3                   	ret
   1b95e:	31 c0                	xor    %eax,%eax
   1b960:	c3                   	ret
   1b961:	cc                   	int3
   1b962:	cc                   	int3
   1b963:	cc                   	int3
   1b964:	cc                   	int3
   1b965:	cc                   	int3
   1b966:	cc                   	int3
   1b967:	cc                   	int3
   1b968:	cc                   	int3
   1b969:	cc                   	int3
   1b96a:	cc                   	int3
   1b96b:	cc                   	int3
   1b96c:	cc                   	int3
   1b96d:	cc                   	int3
   1b96e:	cc                   	int3
   1b96f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::from_bits:
   1b970:	41 57                	push   %r15
   1b972:	41 56                	push   %r14
   1b974:	41 54                	push   %r12
   1b976:	53                   	push   %rbx
   1b977:	48 83 ec 18          	sub    $0x18,%rsp
   1b97b:	48 89 fb             	mov    %rdi,%rbx
   1b97e:	49 be 00 00 00 00 00 	movabs $0x8000000000000000,%r14
   1b985:	00 00 80 
   1b988:	49 bf 00 00 00 00 00 	movabs $0x7ff0000000000000,%r15
   1b98f:	00 f0 7f 
   1b992:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b997:	4c 89 f6             	mov    %r14,%rsi
   1b99a:	4c 89 fa             	mov    %r15,%rdx
   1b99d:	31 c9                	xor    %ecx,%ecx
   1b99f:	e8 6c d3 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b9a4:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b9a9:	74 1e                	je     1b9c9 <<hyperinterval::float::F64Enclosure>::from_bits+0x59>
   1b9ab:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
   1b9b0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1b9b5:	4c 89 f6             	mov    %r14,%rsi
   1b9b8:	4c 89 fa             	mov    %r15,%rdx
   1b9bb:	31 c9                	xor    %ecx,%ecx
   1b9bd:	e8 4e d3 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1b9c2:	80 7c 24 08 01       	cmpb   $0x1,0x8(%rsp)
   1b9c7:	75 1b                	jne    1b9e4 <<hyperinterval::float::F64Enclosure>::from_bits+0x74>
   1b9c9:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
   1b9ce:	88 43 08             	mov    %al,0x8(%rbx)
   1b9d1:	48 c7 03 02 00 00 00 	movq   $0x2,(%rbx)
   1b9d8:	48 83 c4 18          	add    $0x18,%rsp
   1b9dc:	5b                   	pop    %rbx
   1b9dd:	41 5c                	pop    %r12
   1b9df:	41 5e                	pop    %r14
   1b9e1:	41 5f                	pop    %r15
   1b9e3:	c3                   	ret
   1b9e4:	4b 8d 04 34          	lea    (%r12,%r14,1),%rax
   1b9e8:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
   1b9ec:	4c 89 e2             	mov    %r12,%rdx
   1b9ef:	48 21 ca             	and    %rcx,%rdx
   1b9f2:	4c 89 f6             	mov    %r14,%rsi
   1b9f5:	48 29 d6             	sub    %rdx,%rsi
   1b9f8:	4d 85 e4             	test   %r12,%r12
   1b9fb:	48 0f 49 f0          	cmovns %rax,%rsi
   1b9ff:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
   1ba04:	4a 8d 14 30          	lea    (%rax,%r14,1),%rdx
   1ba08:	48 21 c1             	and    %rax,%rcx
   1ba0b:	49 29 ce             	sub    %rcx,%r14
   1ba0e:	48 85 c0             	test   %rax,%rax
   1ba11:	4c 0f 49 f2          	cmovns %rdx,%r14
   1ba15:	4c 39 f6             	cmp    %r14,%rsi
   1ba18:	76 06                	jbe    1ba20 <<hyperinterval::float::F64Enclosure>::from_bits+0xb0>
   1ba1a:	c6 43 08 01          	movb   $0x1,0x8(%rbx)
   1ba1e:	eb b1                	jmp    1b9d1 <<hyperinterval::float::F64Enclosure>::from_bits+0x61>
   1ba20:	48 c7 03 01 00 00 00 	movq   $0x1,(%rbx)
   1ba27:	4c 89 63 08          	mov    %r12,0x8(%rbx)
   1ba2b:	48 89 43 10          	mov    %rax,0x10(%rbx)
   1ba2f:	eb a7                	jmp    1b9d8 <<hyperinterval::float::F64Enclosure>::from_bits+0x68>
   1ba31:	cc                   	int3
   1ba32:	cc                   	int3
   1ba33:	cc                   	int3
   1ba34:	cc                   	int3
   1ba35:	cc                   	int3
   1ba36:	cc                   	int3
   1ba37:	cc                   	int3
   1ba38:	cc                   	int3
   1ba39:	cc                   	int3
   1ba3a:	cc                   	int3
   1ba3b:	cc                   	int3
   1ba3c:	cc                   	int3
   1ba3d:	cc                   	int3
   1ba3e:	cc                   	int3
   1ba3f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::intersection:
   1ba40:	45 31 c0             	xor    %r8d,%r8d
   1ba43:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1ba47:	0f 85 d5 00 00 00    	jne    1bb22 <<hyperinterval::float::F64Enclosure>::intersection+0xe2>
   1ba4d:	f6 02 01             	testb  $0x1,(%rdx)
   1ba50:	0f 84 c0 00 00 00    	je     1bb16 <<hyperinterval::float::F64Enclosure>::intersection+0xd6>
   1ba56:	41 56                	push   %r14
   1ba58:	53                   	push   %rbx
   1ba59:	4c 8b 52 08          	mov    0x8(%rdx),%r10
   1ba5d:	4c 8b 4a 10          	mov    0x10(%rdx),%r9
   1ba61:	48 8b 46 08          	mov    0x8(%rsi),%rax
   1ba65:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
   1ba6c:	00 00 80 
   1ba6f:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   1ba73:	4c 8d 42 ff          	lea    -0x1(%rdx),%r8
   1ba77:	49 89 c3             	mov    %rax,%r11
   1ba7a:	4d 21 c3             	and    %r8,%r11
   1ba7d:	48 89 d3             	mov    %rdx,%rbx
   1ba80:	4c 29 db             	sub    %r11,%rbx
   1ba83:	48 85 c0             	test   %rax,%rax
   1ba86:	48 0f 49 d9          	cmovns %rcx,%rbx
   1ba8a:	49 8d 0c 12          	lea    (%r10,%rdx,1),%rcx
   1ba8e:	4d 89 d3             	mov    %r10,%r11
   1ba91:	4d 21 c3             	and    %r8,%r11
   1ba94:	49 89 d6             	mov    %rdx,%r14
   1ba97:	4d 29 de             	sub    %r11,%r14
   1ba9a:	4d 85 d2             	test   %r10,%r10
   1ba9d:	4c 0f 49 f1          	cmovns %rcx,%r14
   1baa1:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
   1baa5:	4c 39 f3             	cmp    %r14,%rbx
   1baa8:	49 0f 42 c2          	cmovb  %r10,%rax
   1baac:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1bab0:	49 89 ca             	mov    %rcx,%r10
   1bab3:	4d 21 c2             	and    %r8,%r10
   1bab6:	49 89 d3             	mov    %rdx,%r11
   1bab9:	4d 29 d3             	sub    %r10,%r11
   1babc:	48 85 c9             	test   %rcx,%rcx
   1babf:	4c 0f 49 de          	cmovns %rsi,%r11
   1bac3:	49 8d 34 11          	lea    (%r9,%rdx,1),%rsi
   1bac7:	4d 89 ca             	mov    %r9,%r10
   1baca:	4d 21 c2             	and    %r8,%r10
   1bacd:	48 89 d3             	mov    %rdx,%rbx
   1bad0:	4c 29 d3             	sub    %r10,%rbx
   1bad3:	4d 85 c9             	test   %r9,%r9
   1bad6:	48 0f 49 de          	cmovns %rsi,%rbx
   1bada:	49 39 db             	cmp    %rbx,%r11
   1badd:	49 0f 47 c9          	cmova  %r9,%rcx
   1bae1:	48 8d 34 10          	lea    (%rax,%rdx,1),%rsi
   1bae5:	49 89 c1             	mov    %rax,%r9
   1bae8:	4d 21 c1             	and    %r8,%r9
   1baeb:	49 89 d2             	mov    %rdx,%r10
   1baee:	4d 29 ca             	sub    %r9,%r10
   1baf1:	48 85 c0             	test   %rax,%rax
   1baf4:	4c 0f 49 d6          	cmovns %rsi,%r10
   1baf8:	48 8d 34 11          	lea    (%rcx,%rdx,1),%rsi
   1bafc:	49 21 c8             	and    %rcx,%r8
   1baff:	4c 29 c2             	sub    %r8,%rdx
   1bb02:	48 85 c9             	test   %rcx,%rcx
   1bb05:	48 0f 49 d6          	cmovns %rsi,%rdx
   1bb09:	45 31 c0             	xor    %r8d,%r8d
   1bb0c:	49 39 d2             	cmp    %rdx,%r10
   1bb0f:	41 0f 96 c0          	setbe  %r8b
   1bb13:	5b                   	pop    %rbx
   1bb14:	41 5e                	pop    %r14
   1bb16:	4c 89 07             	mov    %r8,(%rdi)
   1bb19:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1bb1d:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1bb21:	c3                   	ret
   1bb22:	4c 89 07             	mov    %r8,(%rdi)
   1bb25:	48 89 47 08          	mov    %rax,0x8(%rdi)
   1bb29:	48 89 4f 10          	mov    %rcx,0x10(%rdi)
   1bb2d:	c3                   	ret
   1bb2e:	cc                   	int3
   1bb2f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::contains_point:
   1bb30:	41 56                	push   %r14
   1bb32:	53                   	push   %rbx
   1bb33:	48 83 ec 18          	sub    $0x18,%rsp
   1bb37:	49 89 fe             	mov    %rdi,%r14
   1bb3a:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bb41:	00 00 80 
   1bb44:	66 48 0f 7e c1       	movq   %xmm0,%rcx
   1bb49:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
   1bb4e:	48 ba 00 00 00 00 00 	movabs $0x7ff0000000000000,%rdx
   1bb55:	00 f0 7f 
   1bb58:	48 89 de             	mov    %rbx,%rsi
   1bb5b:	e8 b0 d1 ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1bb60:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
   1bb65:	3c 01                	cmp    $0x1,%al
   1bb67:	75 0d                	jne    1bb76 <<hyperinterval::float::F64Enclosure>::contains_point+0x46>
   1bb69:	0f b6 54 24 09       	movzbl 0x9(%rsp),%edx
   1bb6e:	48 83 c4 18          	add    $0x18,%rsp
   1bb72:	5b                   	pop    %rbx
   1bb73:	41 5e                	pop    %r14
   1bb75:	c3                   	ret
   1bb76:	49 83 3e 01          	cmpq   $0x1,(%r14)
   1bb7a:	75 40                	jne    1bbbc <<hyperinterval::float::F64Enclosure>::contains_point+0x8c>
   1bb7c:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   1bb81:	49 8b 56 08          	mov    0x8(%r14),%rdx
   1bb85:	48 8d 3c 1a          	lea    (%rdx,%rbx,1),%rdi
   1bb89:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1bb8d:	49 89 d0             	mov    %rdx,%r8
   1bb90:	49 21 c8             	and    %rcx,%r8
   1bb93:	49 89 d9             	mov    %rbx,%r9
   1bb96:	4d 29 c1             	sub    %r8,%r9
   1bb99:	48 85 d2             	test   %rdx,%rdx
   1bb9c:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bba0:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1bba4:	49 89 f0             	mov    %rsi,%r8
   1bba7:	49 21 c8             	and    %rcx,%r8
   1bbaa:	48 89 da             	mov    %rbx,%rdx
   1bbad:	4c 29 c2             	sub    %r8,%rdx
   1bbb0:	48 85 f6             	test   %rsi,%rsi
   1bbb3:	48 0f 49 d7          	cmovns %rdi,%rdx
   1bbb7:	49 39 d1             	cmp    %rdx,%r9
   1bbba:	76 0a                	jbe    1bbc6 <<hyperinterval::float::F64Enclosure>::contains_point+0x96>
   1bbbc:	31 d2                	xor    %edx,%edx
   1bbbe:	48 83 c4 18          	add    $0x18,%rsp
   1bbc2:	5b                   	pop    %rbx
   1bbc3:	41 5e                	pop    %r14
   1bbc5:	c3                   	ret
   1bbc6:	49 8b 76 10          	mov    0x10(%r14),%rsi
   1bbca:	48 8d 3c 1e          	lea    (%rsi,%rbx,1),%rdi
   1bbce:	48 21 f1             	and    %rsi,%rcx
   1bbd1:	48 29 cb             	sub    %rcx,%rbx
   1bbd4:	48 85 f6             	test   %rsi,%rsi
   1bbd7:	48 0f 49 df          	cmovns %rdi,%rbx
   1bbdb:	48 39 da             	cmp    %rbx,%rdx
   1bbde:	0f 96 c2             	setbe  %dl
   1bbe1:	48 83 c4 18          	add    $0x18,%rsp
   1bbe5:	5b                   	pop    %rbx
   1bbe6:	41 5e                	pop    %r14
   1bbe8:	c3                   	ret
   1bbe9:	cc                   	int3
   1bbea:	cc                   	int3
   1bbeb:	cc                   	int3
   1bbec:	cc                   	int3
   1bbed:	cc                   	int3
   1bbee:	cc                   	int3
   1bbef:	cc                   	int3

<hyperinterval::float::F64Enclosure>::interior_subset_of:
   1bbf0:	b0 01                	mov    $0x1,%al
   1bbf2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bbf6:	0f 85 8b 00 00 00    	jne    1bc87 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x97>
   1bbfc:	f6 06 01             	testb  $0x1,(%rsi)
   1bbff:	0f 84 80 00 00 00    	je     1bc85 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1bc05:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bc09:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bc0d:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bc14:	00 00 80 
   1bc17:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1bc1b:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bc1f:	4d 89 c2             	mov    %r8,%r10
   1bc22:	49 21 ca             	and    %rcx,%r10
   1bc25:	49 89 c3             	mov    %rax,%r11
   1bc28:	4d 29 d3             	sub    %r10,%r11
   1bc2b:	4d 85 c0             	test   %r8,%r8
   1bc2e:	4d 0f 49 d9          	cmovns %r9,%r11
   1bc32:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1bc36:	49 89 d1             	mov    %rdx,%r9
   1bc39:	49 21 c9             	and    %rcx,%r9
   1bc3c:	49 89 c2             	mov    %rax,%r10
   1bc3f:	4d 29 ca             	sub    %r9,%r10
   1bc42:	48 85 d2             	test   %rdx,%rdx
   1bc45:	4d 0f 49 d0          	cmovns %r8,%r10
   1bc49:	4d 39 d3             	cmp    %r10,%r11
   1bc4c:	73 37                	jae    1bc85 <<hyperinterval::float::F64Enclosure>::interior_subset_of+0x95>
   1bc4e:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bc52:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bc56:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1bc5a:	49 89 d0             	mov    %rdx,%r8
   1bc5d:	49 21 c8             	and    %rcx,%r8
   1bc60:	49 89 c1             	mov    %rax,%r9
   1bc63:	4d 29 c1             	sub    %r8,%r9
   1bc66:	48 85 d2             	test   %rdx,%rdx
   1bc69:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bc6d:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1bc71:	48 21 f1             	and    %rsi,%rcx
   1bc74:	48 29 c8             	sub    %rcx,%rax
   1bc77:	48 85 f6             	test   %rsi,%rsi
   1bc7a:	48 0f 49 c2          	cmovns %rdx,%rax
   1bc7e:	49 39 c1             	cmp    %rax,%r9
   1bc81:	0f 92 c0             	setb   %al
   1bc84:	c3                   	ret
   1bc85:	31 c0                	xor    %eax,%eax
   1bc87:	c3                   	ret
   1bc88:	cc                   	int3
   1bc89:	cc                   	int3
   1bc8a:	cc                   	int3
   1bc8b:	cc                   	int3
   1bc8c:	cc                   	int3
   1bc8d:	cc                   	int3
   1bc8e:	cc                   	int3
   1bc8f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::add:
   1bc90:	48 83 3e 01          	cmpq   $0x1,(%rsi)
   1bc94:	0f 85 c8 00 00 00    	jne    1bd62 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1bc9a:	f6 02 01             	testb  $0x1,(%rdx)
   1bc9d:	0f 84 bf 00 00 00    	je     1bd62 <<hyperinterval::float::F64Enclosure>::add+0xd2>
   1bca3:	55                   	push   %rbp
   1bca4:	41 57                	push   %r15
   1bca6:	41 56                	push   %r14
   1bca8:	41 55                	push   %r13
   1bcaa:	41 54                	push   %r12
   1bcac:	53                   	push   %rbx
   1bcad:	48 83 ec 18          	sub    $0x18,%rsp
   1bcb1:	48 89 fd             	mov    %rdi,%rbp
   1bcb4:	48 8b 4e 08          	mov    0x8(%rsi),%rcx
   1bcb8:	4c 8b 7e 10          	mov    0x10(%rsi),%r15
   1bcbc:	4c 8b 62 10          	mov    0x10(%rdx),%r12
   1bcc0:	48 bb 00 00 00 00 00 	movabs $0x8000000000000000,%rbx
   1bcc7:	00 00 80 
   1bcca:	49 be 00 00 00 00 00 	movabs $0x7ff0000000000000,%r14
   1bcd1:	00 f0 7f 
   1bcd4:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1bcd8:	48 89 e7             	mov    %rsp,%rdi
   1bcdb:	48 89 de             	mov    %rbx,%rsi
   1bcde:	4c 89 f2             	mov    %r14,%rdx
   1bce1:	e8 6a eb ff ff       	call   1a850 <<hyperinterval::ieee::Format>::add>
   1bce6:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bcea:	74 57                	je     1bd43 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1bcec:	4c 8b 6c 24 08       	mov    0x8(%rsp),%r13
   1bcf1:	48 89 e7             	mov    %rsp,%rdi
   1bcf4:	48 89 de             	mov    %rbx,%rsi
   1bcf7:	4c 89 f2             	mov    %r14,%rdx
   1bcfa:	4c 89 f9             	mov    %r15,%rcx
   1bcfd:	4d 89 e0             	mov    %r12,%r8
   1bd00:	e8 4b eb ff ff       	call   1a850 <<hyperinterval::ieee::Format>::add>
   1bd05:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bd09:	74 38                	je     1bd43 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1bd0b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
   1bd10:	48 89 e7             	mov    %rsp,%rdi
   1bd13:	48 89 de             	mov    %rbx,%rsi
   1bd16:	4c 89 f2             	mov    %r14,%rdx
   1bd19:	4c 89 e9             	mov    %r13,%rcx
   1bd1c:	e8 ef cf ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1bd21:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bd25:	74 1c                	je     1bd43 <<hyperinterval::float::F64Enclosure>::add+0xb3>
   1bd27:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
   1bd2c:	48 89 e7             	mov    %rsp,%rdi
   1bd2f:	48 89 de             	mov    %rbx,%rsi
   1bd32:	4c 89 f2             	mov    %r14,%rdx
   1bd35:	4c 89 f9             	mov    %r15,%rcx
   1bd38:	e8 d3 cf ff ff       	call   18d10 <<hyperinterval::ieee::Format>::finite>
   1bd3d:	80 3c 24 01          	cmpb   $0x1,(%rsp)
   1bd41:	75 27                	jne    1bd6a <<hyperinterval::float::F64Enclosure>::add+0xda>
   1bd43:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
   1bd48:	88 45 08             	mov    %al,0x8(%rbp)
   1bd4b:	48 c7 45 00 02 00 00 	movq   $0x2,0x0(%rbp)
   1bd52:	00 
   1bd53:	48 83 c4 18          	add    $0x18,%rsp
   1bd57:	5b                   	pop    %rbx
   1bd58:	41 5c                	pop    %r12
   1bd5a:	41 5d                	pop    %r13
   1bd5c:	41 5e                	pop    %r14
   1bd5e:	41 5f                	pop    %r15
   1bd60:	5d                   	pop    %rbp
   1bd61:	c3                   	ret
   1bd62:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
   1bd69:	c3                   	ret
   1bd6a:	49 8d 04 1c          	lea    (%r12,%rbx,1),%rax
   1bd6e:	48 8d 4b ff          	lea    -0x1(%rbx),%rcx
   1bd72:	4c 89 e2             	mov    %r12,%rdx
   1bd75:	48 21 ca             	and    %rcx,%rdx
   1bd78:	48 89 de             	mov    %rbx,%rsi
   1bd7b:	48 29 d6             	sub    %rdx,%rsi
   1bd7e:	4d 85 e4             	test   %r12,%r12
   1bd81:	48 0f 49 f0          	cmovns %rax,%rsi
   1bd85:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
   1bd8a:	48 8d 14 18          	lea    (%rax,%rbx,1),%rdx
   1bd8e:	48 21 c1             	and    %rax,%rcx
   1bd91:	48 29 cb             	sub    %rcx,%rbx
   1bd94:	48 85 c0             	test   %rax,%rax
   1bd97:	48 0f 49 da          	cmovns %rdx,%rbx
   1bd9b:	48 39 de             	cmp    %rbx,%rsi
   1bd9e:	76 06                	jbe    1bda6 <<hyperinterval::float::F64Enclosure>::add+0x116>
   1bda0:	c6 45 08 01          	movb   $0x1,0x8(%rbp)
   1bda4:	eb a5                	jmp    1bd4b <<hyperinterval::float::F64Enclosure>::add+0xbb>
   1bda6:	48 c7 45 00 01 00 00 	movq   $0x1,0x0(%rbp)
   1bdad:	00 
   1bdae:	4c 89 65 08          	mov    %r12,0x8(%rbp)
   1bdb2:	48 89 45 10          	mov    %rax,0x10(%rbp)
   1bdb6:	eb 9b                	jmp    1bd53 <<hyperinterval::float::F64Enclosure>::add+0xc3>
   1bdb8:	cc                   	int3
   1bdb9:	cc                   	int3
   1bdba:	cc                   	int3
   1bdbb:	cc                   	int3
   1bdbc:	cc                   	int3
   1bdbd:	cc                   	int3
   1bdbe:	cc                   	int3
   1bdbf:	cc                   	int3

<hyperinterval::float::F64Enclosure>::div:
   1bdc0:	83 3a 01             	cmpl   $0x1,(%rdx)
   1bdc3:	75 1e                	jne    1bde3 <<hyperinterval::float::F64Enclosure>::div+0x23>
   1bdc5:	48 83 7a 08 00       	cmpq   $0x0,0x8(%rdx)
   1bdca:	7f 17                	jg     1bde3 <<hyperinterval::float::F64Enclosure>::div+0x23>
   1bdcc:	48 8b 42 10          	mov    0x10(%rdx),%rax
   1bdd0:	48 85 c0             	test   %rax,%rax
   1bdd3:	0f 99 c1             	setns  %cl
   1bdd6:	48 d1 e0             	shl    $1,%rax
   1bdd9:	48 85 c0             	test   %rax,%rax
   1bddc:	0f 94 c0             	sete   %al
   1bddf:	08 c8                	or     %cl,%al
   1bde1:	75 0a                	jne    1bded <<hyperinterval::float::F64Enclosure>::div+0x2d>
   1bde3:	b9 01 00 00 00       	mov    $0x1,%ecx
   1bde8:	e9 83 ef ff ff       	jmp    1ad70 <<hyperinterval::float::F64Enclosure>::corner_image>
   1bded:	c6 47 08 04          	movb   $0x4,0x8(%rdi)
   1bdf1:	48 c7 07 02 00 00 00 	movq   $0x2,(%rdi)
   1bdf8:	c3                   	ret
   1bdf9:	cc                   	int3
   1bdfa:	cc                   	int3
   1bdfb:	cc                   	int3
   1bdfc:	cc                   	int3
   1bdfd:	cc                   	int3
   1bdfe:	cc                   	int3
   1bdff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::sub:
   1be00:	48 83 3a 01          	cmpq   $0x1,(%rdx)
   1be04:	75 30                	jne    1be36 <<hyperinterval::float::F64Enclosure>::sub+0x36>
   1be06:	4c 8b 42 08          	mov    0x8(%rdx),%r8
   1be0a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
   1be0e:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1be15:	00 00 80 
   1be18:	48 89 d1             	mov    %rdx,%rcx
   1be1b:	48 31 c1             	xor    %rax,%rcx
   1be1e:	48 85 d2             	test   %rdx,%rdx
   1be21:	48 0f 44 ca          	cmove  %rdx,%rcx
   1be25:	4c 31 c0             	xor    %r8,%rax
   1be28:	4d 85 c0             	test   %r8,%r8
   1be2b:	49 0f 44 c0          	cmove  %r8,%rax
   1be2f:	ba 01 00 00 00       	mov    $0x1,%edx
   1be34:	eb 02                	jmp    1be38 <<hyperinterval::float::F64Enclosure>::sub+0x38>
   1be36:	31 d2                	xor    %edx,%edx
   1be38:	48 83 ec 18          	sub    $0x18,%rsp
   1be3c:	48 89 14 24          	mov    %rdx,(%rsp)
   1be40:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
   1be45:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
   1be4a:	48 89 e2             	mov    %rsp,%rdx
   1be4d:	e8 3e fe ff ff       	call   1bc90 <<hyperinterval::float::F64Enclosure>::add>
   1be52:	48 83 c4 18          	add    $0x18,%rsp
   1be56:	c3                   	ret
   1be57:	cc                   	int3
   1be58:	cc                   	int3
   1be59:	cc                   	int3
   1be5a:	cc                   	int3
   1be5b:	cc                   	int3
   1be5c:	cc                   	int3
   1be5d:	cc                   	int3
   1be5e:	cc                   	int3
   1be5f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::disjoint:
   1be60:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1be64:	b0 01                	mov    $0x1,%al
   1be66:	0f 84 8b 00 00 00    	je     1bef7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1be6c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1be70:	0f 84 81 00 00 00    	je     1bef7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1be76:	53                   	push   %rbx
   1be77:	48 b9 00 00 00 00 00 	movabs $0x8000000000000000,%rcx
   1be7e:	00 00 80 
   1be81:	4c 8b 47 10          	mov    0x10(%rdi),%r8
   1be85:	4c 8b 4e 08          	mov    0x8(%rsi),%r9
   1be89:	4d 8d 14 08          	lea    (%r8,%rcx,1),%r10
   1be8d:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
   1be91:	4d 89 c3             	mov    %r8,%r11
   1be94:	49 21 d3             	and    %rdx,%r11
   1be97:	48 89 cb             	mov    %rcx,%rbx
   1be9a:	4c 29 db             	sub    %r11,%rbx
   1be9d:	4d 85 c0             	test   %r8,%r8
   1bea0:	49 0f 49 da          	cmovns %r10,%rbx
   1bea4:	4d 8d 04 09          	lea    (%r9,%rcx,1),%r8
   1bea8:	4d 89 ca             	mov    %r9,%r10
   1beab:	49 21 d2             	and    %rdx,%r10
   1beae:	49 89 cb             	mov    %rcx,%r11
   1beb1:	4d 29 d3             	sub    %r10,%r11
   1beb4:	4d 85 c9             	test   %r9,%r9
   1beb7:	4d 0f 49 d8          	cmovns %r8,%r11
   1bebb:	4c 39 db             	cmp    %r11,%rbx
   1bebe:	5b                   	pop    %rbx
   1bebf:	72 36                	jb     1bef7 <<hyperinterval::float::F64Enclosure>::disjoint+0x97>
   1bec1:	48 8b 47 08          	mov    0x8(%rdi),%rax
   1bec5:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bec9:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
   1becd:	49 89 f0             	mov    %rsi,%r8
   1bed0:	49 21 d0             	and    %rdx,%r8
   1bed3:	49 89 c9             	mov    %rcx,%r9
   1bed6:	4d 29 c1             	sub    %r8,%r9
   1bed9:	48 85 f6             	test   %rsi,%rsi
   1bedc:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bee0:	48 8d 34 08          	lea    (%rax,%rcx,1),%rsi
   1bee4:	48 21 c2             	and    %rax,%rdx
   1bee7:	48 29 d1             	sub    %rdx,%rcx
   1beea:	48 85 c0             	test   %rax,%rax
   1beed:	48 0f 49 ce          	cmovns %rsi,%rcx
   1bef1:	49 39 c9             	cmp    %rcx,%r9
   1bef4:	0f 92 c0             	setb   %al
   1bef7:	c3                   	ret
   1bef8:	cc                   	int3
   1bef9:	cc                   	int3
   1befa:	cc                   	int3
   1befb:	cc                   	int3
   1befc:	cc                   	int3
   1befd:	cc                   	int3
   1befe:	cc                   	int3
   1beff:	cc                   	int3

<hyperinterval::float::F64Enclosure>::overlaps:
   1bf00:	31 c0                	xor    %eax,%eax
   1bf02:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   1bf06:	0f 84 8c 00 00 00    	je     1bf98 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1bf0c:	48 83 3e 00          	cmpq   $0x0,(%rsi)
   1bf10:	0f 84 82 00 00 00    	je     1bf98 <<hyperinterval::float::F64Enclosure>::overlaps+0x98>
   1bf16:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bf1d:	00 00 80 
   1bf20:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bf24:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bf28:	4c 8d 0c 02          	lea    (%rdx,%rax,1),%r9
   1bf2c:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bf30:	49 89 d2             	mov    %rdx,%r10
   1bf33:	49 21 ca             	and    %rcx,%r10
   1bf36:	49 89 c3             	mov    %rax,%r11
   1bf39:	4d 29 d3             	sub    %r10,%r11
   1bf3c:	48 85 d2             	test   %rdx,%rdx
   1bf3f:	4d 0f 49 d9          	cmovns %r9,%r11
   1bf43:	49 8d 14 00          	lea    (%r8,%rax,1),%rdx
   1bf47:	4d 89 c1             	mov    %r8,%r9
   1bf4a:	49 21 c9             	and    %rcx,%r9
   1bf4d:	49 89 c2             	mov    %rax,%r10
   1bf50:	4d 29 ca             	sub    %r9,%r10
   1bf53:	4d 85 c0             	test   %r8,%r8
   1bf56:	4c 0f 49 d2          	cmovns %rdx,%r10
   1bf5a:	4d 39 d3             	cmp    %r10,%r11
   1bf5d:	73 03                	jae    1bf62 <<hyperinterval::float::F64Enclosure>::overlaps+0x62>
   1bf5f:	31 c0                	xor    %eax,%eax
   1bf61:	c3                   	ret
   1bf62:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bf66:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1bf6a:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
   1bf6e:	49 89 f0             	mov    %rsi,%r8
   1bf71:	49 21 c8             	and    %rcx,%r8
   1bf74:	49 89 c1             	mov    %rax,%r9
   1bf77:	4d 29 c1             	sub    %r8,%r9
   1bf7a:	48 85 f6             	test   %rsi,%rsi
   1bf7d:	4c 0f 49 cf          	cmovns %rdi,%r9
   1bf81:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
   1bf85:	48 21 d1             	and    %rdx,%rcx
   1bf88:	48 29 c8             	sub    %rcx,%rax
   1bf8b:	48 85 d2             	test   %rdx,%rdx
   1bf8e:	48 0f 49 c6          	cmovns %rsi,%rax
   1bf92:	49 39 c1             	cmp    %rax,%r9
   1bf95:	0f 93 c0             	setae  %al
   1bf98:	c3                   	ret
   1bf99:	cc                   	int3
   1bf9a:	cc                   	int3
   1bf9b:	cc                   	int3
   1bf9c:	cc                   	int3
   1bf9d:	cc                   	int3
   1bf9e:	cc                   	int3
   1bf9f:	cc                   	int3

<hyperinterval::float::F64Enclosure>::subset_of:
   1bfa0:	b0 01                	mov    $0x1,%al
   1bfa2:	48 83 3f 01          	cmpq   $0x1,(%rdi)
   1bfa6:	75 50                	jne    1bff8 <<hyperinterval::float::F64Enclosure>::subset_of+0x58>
   1bfa8:	f6 06 01             	testb  $0x1,(%rsi)
   1bfab:	74 49                	je     1bff6 <<hyperinterval::float::F64Enclosure>::subset_of+0x56>
   1bfad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   1bfb1:	4c 8b 46 08          	mov    0x8(%rsi),%r8
   1bfb5:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
   1bfbc:	00 00 80 
   1bfbf:	4d 8d 0c 00          	lea    (%r8,%rax,1),%r9
   1bfc3:	48 8d 48 ff          	lea    -0x1(%rax),%rcx
   1bfc7:	4d 89 c2             	mov    %r8,%r10
   1bfca:	49 21 ca             	and    %rcx,%r10
   1bfcd:	49 89 c3             	mov    %rax,%r11
   1bfd0:	4d 29 d3             	sub    %r10,%r11
   1bfd3:	4d 85 c0             	test   %r8,%r8
   1bfd6:	4d 0f 49 d9          	cmovns %r9,%r11
   1bfda:	4c 8d 04 02          	lea    (%rdx,%rax,1),%r8
   1bfde:	49 89 d1             	mov    %rdx,%r9
   1bfe1:	49 21 c9             	and    %rcx,%r9
   1bfe4:	49 89 c2             	mov    %rax,%r10
   1bfe7:	4d 29 ca             	sub    %r9,%r10
   1bfea:	48 85 d2             	test   %rdx,%rdx
   1bfed:	4d 0f 49 d0          	cmovns %r8,%r10
   1bff1:	4d 39 d3             	cmp    %r10,%r11
   1bff4:	76 03                	jbe    1bff9 <<hyperinterval::float::F64Enclosure>::subset_of+0x59>
   1bff6:	31 c0                	xor    %eax,%eax
   1bff8:	c3                   	ret
   1bff9:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   1bffd:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   1c001:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
   1c005:	49 89 d0             	mov    %rdx,%r8
   1c008:	49 21 c8             	and    %rcx,%r8
   1c00b:	49 89 c1             	mov    %rax,%r9
   1c00e:	4d 29 c1             	sub    %r8,%r9
   1c011:	48 85 d2             	test   %rdx,%rdx
   1c014:	4c 0f 49 cf          	cmovns %rdi,%r9
   1c018:	48 8d 14 06          	lea    (%rsi,%rax,1),%rdx
   1c01c:	48 21 f1             	and    %rsi,%rcx
   1c01f:	48 29 c8             	sub    %rcx,%rax
   1c022:	48 85 f6             	test   %rsi,%rsi
   1c025:	48 0f 49 c2          	cmovns %rdx,%rax
   1c029:	49 39 c1             	cmp    %rax,%r9
   1c02c:	0f 96 c0             	setbe  %al
   1c02f:	c3                   	ret

__udivti3:
   4daa0:	49 89 d0             	mov    %rdx,%r8
   4daa3:	48 85 c9             	test   %rcx,%rcx
   4daa6:	74 76                	je     4db1e <__udivti3+0x7e>
   4daa8:	53                   	push   %rbx
   4daa9:	4c 0f bd c9          	bsr    %rcx,%r9
   4daad:	44 89 ca             	mov    %r9d,%edx
   4dab0:	83 f2 3f             	xor    $0x3f,%edx
   4dab3:	b0 40                	mov    $0x40,%al
   4dab5:	28 d0                	sub    %dl,%al
   4dab7:	4c 89 c2             	mov    %r8,%rdx
   4daba:	49 89 cb             	mov    %rcx,%r11
   4dabd:	89 c1                	mov    %eax,%ecx
   4dabf:	4c 0f ad da          	shrd   %cl,%r11,%rdx
   4dac3:	4d 89 da             	mov    %r11,%r10
   4dac6:	49 d3 ea             	shr    %cl,%r10
   4dac9:	a8 40                	test   $0x40,%al
   4dacb:	4c 0f 44 d2          	cmove  %rdx,%r10
   4dacf:	48 89 f8             	mov    %rdi,%rax
   4dad2:	48 0f ac f0 01       	shrd   $0x1,%rsi,%rax
   4dad7:	48 89 f2             	mov    %rsi,%rdx
   4dada:	48 d1 ea             	shr    $1,%rdx
   4dadd:	49 f7 f2             	div    %r10
   4dae0:	49 89 c2             	mov    %rax,%r10
   4dae3:	44 89 c9             	mov    %r9d,%ecx
   4dae6:	49 d3 ea             	shr    %cl,%r10
   4dae9:	31 c9                	xor    %ecx,%ecx
   4daeb:	49 83 ea 01          	sub    $0x1,%r10
   4daef:	4c 0f 42 d1          	cmovb  %rcx,%r10
   4daf3:	4c 89 db             	mov    %r11,%rbx
   4daf6:	4c 89 c0             	mov    %r8,%rax
   4daf9:	49 f7 e2             	mul    %r10
   4dafc:	49 89 c1             	mov    %rax,%r9
   4daff:	4c 89 d0             	mov    %r10,%rax
   4db02:	49 0f af da          	imul   %r10,%rbx
   4db06:	48 01 da             	add    %rbx,%rdx
   4db09:	4c 29 cf             	sub    %r9,%rdi
   4db0c:	48 19 d6             	sbb    %rdx,%rsi
   4db0f:	4c 39 c7             	cmp    %r8,%rdi
   4db12:	4c 19 de             	sbb    %r11,%rsi
   4db15:	48 83 d8 ff          	sbb    $0xffffffffffffffff,%rax
   4db19:	5b                   	pop    %rbx
   4db1a:	48 89 ca             	mov    %rcx,%rdx
   4db1d:	c3                   	ret
   4db1e:	4c 39 c6             	cmp    %r8,%rsi
   4db21:	73 0f                	jae    4db32 <__udivti3+0x92>
   4db23:	48 89 f8             	mov    %rdi,%rax
   4db26:	48 89 f2             	mov    %rsi,%rdx
   4db29:	49 f7 f0             	div    %r8
   4db2c:	31 c9                	xor    %ecx,%ecx
   4db2e:	48 89 ca             	mov    %rcx,%rdx
   4db31:	c3                   	ret
   4db32:	48 89 f0             	mov    %rsi,%rax
   4db35:	4c 09 c0             	or     %r8,%rax
   4db38:	48 c1 e8 20          	shr    $0x20,%rax
   4db3c:	74 15                	je     4db53 <__udivti3+0xb3>
   4db3e:	48 89 f0             	mov    %rsi,%rax
   4db41:	31 d2                	xor    %edx,%edx
   4db43:	49 f7 f0             	div    %r8
   4db46:	48 89 c1             	mov    %rax,%rcx
   4db49:	48 89 f8             	mov    %rdi,%rax
   4db4c:	49 f7 f0             	div    %r8
   4db4f:	48 89 ca             	mov    %rcx,%rdx
   4db52:	c3                   	ret
   4db53:	89 f0                	mov    %esi,%eax
   4db55:	31 d2                	xor    %edx,%edx
   4db57:	41 f7 f0             	div    %r8d
   4db5a:	89 c1                	mov    %eax,%ecx
   4db5c:	48 89 f8             	mov    %rdi,%rax
   4db5f:	49 f7 f0             	div    %r8
   4db62:	48 89 ca             	mov    %rcx,%rdx
   4db65:	c3                   	ret

Disassembly of section .init:
