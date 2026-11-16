
/tmp/interval-refactor/horner-current/stack-artifacts/baseline:     file format elf64-x86-64


Disassembly of section .text:

0000000000136d90 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero>:
  136d90:	55                   	push   %rbp
  136d91:	41 57                	push   %r15
  136d93:	41 56                	push   %r14
  136d95:	41 55                	push   %r13
  136d97:	41 54                	push   %r12
  136d99:	53                   	push   %rbx
  136d9a:	48 81 ec a8 02 00 00 	sub    $0x2a8,%rsp
  136da1:	44 89 84 24 9c 00 00 	mov    %r8d,0x9c(%rsp)
  136da8:	00 
  136da9:	49 89 cd             	mov    %rcx,%r13
  136dac:	48 89 f3             	mov    %rsi,%rbx
  136daf:	48 89 94 24 98 01 00 	mov    %rdx,0x198(%rsp)
  136db6:	00 
  136db7:	80 3a 00             	cmpb   $0x0,(%rdx)
  136dba:	48 89 8c 24 90 01 00 	mov    %rcx,0x190(%rsp)
  136dc1:	00 
  136dc2:	75 0b                	jne    136dcf <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  136dc4:	41 80 7d 00 00       	cmpb   $0x0,0x0(%r13)
  136dc9:	0f 84 44 09 00 00    	je     137713 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x983>
  136dcf:	48 85 db             	test   %rbx,%rbx
  136dd2:	0f 84 59 0a 00 00    	je     137831 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa1>
  136dd8:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  136ddc:	48 c1 e0 04          	shl    $0x4,%rax
  136de0:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
  136de5:	48 8d 34 07          	lea    (%rdi,%rax,1),%rsi
  136de9:	48 83 c6 d0          	add    $0xffffffffffffffd0,%rsi
  136ded:	4c 8d b4 24 78 02 00 	lea    0x278(%rsp),%r14
  136df4:	00 
  136df5:	4c 89 f7             	mov    %r14,%rdi
  136df8:	e8 63 ab 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  136dfd:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  136e04:	00 
  136e05:	4c 89 f6             	mov    %r14,%rsi
  136e08:	e8 53 ab 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  136e0d:	0f 10 84 24 78 02 00 	movups 0x278(%rsp),%xmm0
  136e14:	00 
  136e15:	0f 10 8c 24 88 02 00 	movups 0x288(%rsp),%xmm1
  136e1c:	00 
  136e1d:	0f 10 94 24 98 02 00 	movups 0x298(%rsp),%xmm2
  136e24:	00 
  136e25:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  136e2c:	00 
  136e2d:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  136e34:	00 
  136e35:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  136e3c:	00 
  136e3d:	48 c1 e3 04          	shl    $0x4,%rbx
  136e41:	4c 8d 3c 5b          	lea    (%rbx,%rbx,2),%r15
  136e45:	49 83 ff 30          	cmp    $0x30,%r15
  136e49:	0f 84 34 07 00 00    	je     137583 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7f3>
  136e4f:	4c 8d a4 24 00 01 00 	lea    0x100(%rsp),%r12
  136e56:	00 
  136e57:	48 83 44 24 60 a0    	addq   $0xffffffffffffffa0,0x60(%rsp)
  136e5d:	44 0f b6 b4 24 9c 00 	movzbl 0x9c(%rsp),%r14d
  136e64:	00 00 
  136e66:	eb 1e                	jmp    136e86 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf6>
  136e68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  136e6f:	00 
  136e70:	49 83 c7 d0          	add    $0xffffffffffffffd0,%r15
  136e74:	49 83 ff 30          	cmp    $0x30,%r15
  136e78:	4c 8b ac 24 90 01 00 	mov    0x190(%rsp),%r13
  136e7f:	00 
  136e80:	0f 84 fd 06 00 00    	je     137583 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7f3>
  136e86:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  136e8d:	00 
  136e8e:	48 8d ac 24 d0 01 00 	lea    0x1d0(%rsp),%rbp
  136e95:	00 
  136e96:	48 89 ee             	mov    %rbp,%rsi
  136e99:	48 8b 9c 24 98 01 00 	mov    0x198(%rsp),%rbx
  136ea0:	00 
  136ea1:	48 89 da             	mov    %rbx,%rdx
  136ea4:	e8 87 08 fe ff       	call   117730 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs6IjHMNHnq5H_10hypersolve>
  136ea9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  136eae:	48 89 ee             	mov    %rbp,%rsi
  136eb1:	4c 89 ea             	mov    %r13,%rdx
  136eb4:	e8 77 08 fe ff       	call   117730 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs6IjHMNHnq5H_10hypersolve>
  136eb9:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  136ebe:	48 8d ac 24 a0 01 00 	lea    0x1a0(%rsp),%rbp
  136ec5:	00 
  136ec6:	48 89 ee             	mov    %rbp,%rsi
  136ec9:	48 89 da             	mov    %rbx,%rdx
  136ecc:	e8 5f 08 fe ff       	call   117730 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs6IjHMNHnq5H_10hypersolve>
  136ed1:	48 89 e7             	mov    %rsp,%rdi
  136ed4:	48 89 ee             	mov    %rbp,%rsi
  136ed7:	4c 89 ea             	mov    %r13,%rdx
  136eda:	e8 51 08 fe ff       	call   117730 <_RNvXs2f_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Mul3mulCs6IjHMNHnq5H_10hypersolve>
  136edf:	0f 10 84 24 a0 00 00 	movups 0xa0(%rsp),%xmm0
  136ee6:	00 
  136ee7:	0f 10 8c 24 b0 00 00 	movups 0xb0(%rsp),%xmm1
  136eee:	00 
  136eef:	0f 10 94 24 c0 00 00 	movups 0xc0(%rsp),%xmm2
  136ef6:	00 
  136ef7:	0f 29 94 24 f0 00 00 	movaps %xmm2,0xf0(%rsp)
  136efe:	00 
  136eff:	0f 29 8c 24 e0 00 00 	movaps %xmm1,0xe0(%rsp)
  136f06:	00 
  136f07:	0f 29 84 24 d0 00 00 	movaps %xmm0,0xd0(%rsp)
  136f0e:	00 
  136f0f:	0f 10 44 24 30       	movups 0x30(%rsp),%xmm0
  136f14:	0f 10 4c 24 40       	movups 0x40(%rsp),%xmm1
  136f19:	0f 10 54 24 50       	movups 0x50(%rsp),%xmm2
  136f1e:	41 0f 11 54 24 20    	movups %xmm2,0x20(%r12)
  136f24:	41 0f 11 4c 24 10    	movups %xmm1,0x10(%r12)
  136f2a:	41 0f 11 04 24       	movups %xmm0,(%r12)
  136f2f:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  136f34:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  136f39:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  136f40:	00 
  136f41:	48 8d 84 24 30 01 00 	lea    0x130(%rsp),%rax
  136f48:	00 
  136f49:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  136f4d:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  136f51:	0f 11 00             	movups %xmm0,(%rax)
  136f54:	0f 10 04 24          	movups (%rsp),%xmm0
  136f58:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  136f5d:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  136f62:	48 8d 84 24 60 01 00 	lea    0x160(%rsp),%rax
  136f69:	00 
  136f6a:	0f 11 50 20          	movups %xmm2,0x20(%rax)
  136f6e:	0f 11 48 10          	movups %xmm1,0x10(%rax)
  136f72:	0f 11 00             	movups %xmm0,(%rax)
  136f75:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  136f7c:	00 
  136f7d:	48 8d 9c 24 d0 00 00 	lea    0xd0(%rsp),%rbx
  136f84:	00 
  136f85:	48 89 de             	mov    %rbx,%rsi
  136f88:	e8 d3 a9 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  136f8d:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  136f92:	48 89 de             	mov    %rbx,%rsi
  136f95:	e8 c6 a9 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  136f9a:	48 89 e3             	mov    %rsp,%rbx
  136f9d:	4c 89 e7             	mov    %r12,%rdi
  136fa0:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  136fa7:	00 
  136fa8:	44 89 f2             	mov    %r14d,%edx
  136fab:	e8 d0 6e 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  136fb0:	3c ff                	cmp    $0xff,%al
  136fb2:	74 1c                	je     136fd0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x240>
  136fb4:	0f b6 c0             	movzbl %al,%eax
  136fb7:	3d fe 00 00 00       	cmp    $0xfe,%eax
  136fbc:	75 50                	jne    13700e <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x27e>
  136fbe:	e9 ce 06 00 00       	jmp    137691 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  136fc3:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  136fca:	84 00 00 00 00 00 
  136fd0:	48 89 df             	mov    %rbx,%rdi
  136fd3:	4c 89 e6             	mov    %r12,%rsi
  136fd6:	e8 85 a9 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  136fdb:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  136fe2:	00 
  136fe3:	e8 18 85 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  136fe8:	0f 10 04 24          	movups (%rsp),%xmm0
  136fec:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  136ff1:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  136ff6:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  136ffd:	00 
  136ffe:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  137005:	00 
  137006:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  13700d:	00 
  13700e:	4c 89 e7             	mov    %r12,%rdi
  137011:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  137016:	44 89 f2             	mov    %r14d,%edx
  137019:	e8 62 6e 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13701e:	3c 01                	cmp    $0x1,%al
  137020:	74 1e                	je     137040 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2b0>
  137022:	0f b6 c0             	movzbl %al,%eax
  137025:	3d fe 00 00 00       	cmp    $0xfe,%eax
  13702a:	75 46                	jne    137072 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x2e2>
  13702c:	e9 60 06 00 00       	jmp    137691 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  137031:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  137038:	0f 1f 84 00 00 00 00 
  13703f:	00 
  137040:	48 89 df             	mov    %rbx,%rdi
  137043:	4c 89 e6             	mov    %r12,%rsi
  137046:	e8 15 a9 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  13704b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137050:	e8 ab 84 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137055:	0f 10 04 24          	movups (%rsp),%xmm0
  137059:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  13705e:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  137063:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  137068:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  13706d:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  137072:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  137079:	00 
  13707a:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  137081:	00 
  137082:	44 89 f2             	mov    %r14d,%edx
  137085:	e8 f6 6d 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13708a:	3c ff                	cmp    $0xff,%al
  13708c:	74 12                	je     1370a0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x310>
  13708e:	0f b6 c0             	movzbl %al,%eax
  137091:	3d fe 00 00 00       	cmp    $0xfe,%eax
  137096:	75 4b                	jne    1370e3 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x353>
  137098:	e9 f4 05 00 00       	jmp    137691 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  13709d:	0f 1f 00             	nopl   (%rax)
  1370a0:	48 89 df             	mov    %rbx,%rdi
  1370a3:	48 8d b4 24 30 01 00 	lea    0x130(%rsp),%rsi
  1370aa:	00 
  1370ab:	e8 b0 a8 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  1370b0:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  1370b7:	00 
  1370b8:	e8 43 84 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1370bd:	0f 10 04 24          	movups (%rsp),%xmm0
  1370c1:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  1370c6:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  1370cb:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  1370d2:	00 
  1370d3:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  1370da:	00 
  1370db:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  1370e2:	00 
  1370e3:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  1370ea:	00 
  1370eb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  1370f0:	44 89 f2             	mov    %r14d,%edx
  1370f3:	e8 88 6d 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  1370f8:	3c 01                	cmp    $0x1,%al
  1370fa:	74 14                	je     137110 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x380>
  1370fc:	0f b6 c0             	movzbl %al,%eax
  1370ff:	3d fe 00 00 00       	cmp    $0xfe,%eax
  137104:	75 41                	jne    137147 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3b7>
  137106:	e9 86 05 00 00       	jmp    137691 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  13710b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  137110:	48 89 df             	mov    %rbx,%rdi
  137113:	48 8d b4 24 30 01 00 	lea    0x130(%rsp),%rsi
  13711a:	00 
  13711b:	e8 40 a8 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  137120:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137125:	e8 d6 83 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13712a:	0f 10 04 24          	movups (%rsp),%xmm0
  13712e:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  137133:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  137138:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  13713d:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  137142:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  137147:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  13714e:	00 
  13714f:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  137156:	00 
  137157:	44 89 f2             	mov    %r14d,%edx
  13715a:	e8 21 6d 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13715f:	3c ff                	cmp    $0xff,%al
  137161:	74 1d                	je     137180 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f0>
  137163:	0f b6 c0             	movzbl %al,%eax
  137166:	3d fe 00 00 00       	cmp    $0xfe,%eax
  13716b:	75 56                	jne    1371c3 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x433>
  13716d:	e9 1f 05 00 00       	jmp    137691 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  137172:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  137179:	1f 84 00 00 00 00 00 
  137180:	48 89 df             	mov    %rbx,%rdi
  137183:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  13718a:	00 
  13718b:	e8 d0 a7 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  137190:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  137197:	00 
  137198:	e8 63 83 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13719d:	0f 10 04 24          	movups (%rsp),%xmm0
  1371a1:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  1371a6:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  1371ab:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  1371b2:	00 
  1371b3:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  1371ba:	00 
  1371bb:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  1371c2:	00 
  1371c3:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  1371ca:	00 
  1371cb:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  1371d0:	44 89 f2             	mov    %r14d,%edx
  1371d3:	e8 a8 6c 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  1371d8:	3c 01                	cmp    $0x1,%al
  1371da:	74 14                	je     1371f0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x460>
  1371dc:	0f b6 c0             	movzbl %al,%eax
  1371df:	3d fe 00 00 00       	cmp    $0xfe,%eax
  1371e4:	75 41                	jne    137227 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x497>
  1371e6:	e9 a6 04 00 00       	jmp    137691 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x901>
  1371eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  1371f0:	48 89 df             	mov    %rbx,%rdi
  1371f3:	48 8d b4 24 60 01 00 	lea    0x160(%rsp),%rsi
  1371fa:	00 
  1371fb:	e8 60 a7 00 00       	call   141960 <_RNvXsn_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticNtB5_4RealNtNtCsevLNFiNqfJP_4core5clone5Clone5clone.llvm.16915591691837077173>
  137200:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137205:	e8 f6 82 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13720a:	0f 10 04 24          	movups (%rsp),%xmm0
  13720e:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  137213:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  137218:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  13721d:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  137222:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  137227:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  13722c:	4e 8d 2c 38          	lea    (%rax,%r15,1),%r13
  137230:	0f 28 84 24 a0 00 00 	movaps 0xa0(%rsp),%xmm0
  137237:	00 
  137238:	0f 28 8c 24 b0 00 00 	movaps 0xb0(%rsp),%xmm1
  13723f:	00 
  137240:	0f 28 94 24 c0 00 00 	movaps 0xc0(%rsp),%xmm2
  137247:	00 
  137248:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  13724d:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  137252:	0f 29 04 24          	movaps %xmm0,(%rsp)
  137256:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  13725b:	48 89 de             	mov    %rbx,%rsi
  13725e:	4c 89 ea             	mov    %r13,%rdx
  137261:	e8 2a cd fd ff       	call   113f90 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs6IjHMNHnq5H_10hypersolve>
  137266:	48 89 df             	mov    %rbx,%rdi
  137269:	e8 e2 ba fd ff       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
  13726e:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  137275:	00 
  137276:	e8 85 82 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13727b:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  137280:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  137285:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  13728c:	00 
  13728d:	0f 29 94 24 f0 01 00 	movaps %xmm2,0x1f0(%rsp)
  137294:	00 
  137295:	0f 29 8c 24 e0 01 00 	movaps %xmm1,0x1e0(%rsp)
  13729c:	00 
  13729d:	0f 29 84 24 d0 01 00 	movaps %xmm0,0x1d0(%rsp)
  1372a4:	00 
  1372a5:	0f 28 44 24 30       	movaps 0x30(%rsp),%xmm0
  1372aa:	0f 28 4c 24 40       	movaps 0x40(%rsp),%xmm1
  1372af:	0f 28 54 24 50       	movaps 0x50(%rsp),%xmm2
  1372b4:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  1372b9:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  1372be:	0f 29 04 24          	movaps %xmm0,(%rsp)
  1372c2:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  1372c7:	48 89 e3             	mov    %rsp,%rbx
  1372ca:	48 89 de             	mov    %rbx,%rsi
  1372cd:	4c 89 ea             	mov    %r13,%rdx
  1372d0:	e8 bb cc fd ff       	call   113f90 <_RNvXs1W_NtNtCs8rd0GMicEM6_9hyperreal4real10arithmeticRNtB6_4RealNtNtNtCsevLNFiNqfJP_4core3ops5arith3Add3addCs6IjHMNHnq5H_10hypersolve>
  1372d5:	48 89 df             	mov    %rbx,%rdi
  1372d8:	e8 73 ba fd ff       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
  1372dd:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  1372e4:	00 
  1372e5:	e8 16 82 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1372ea:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  1372ef:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  1372f4:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  1372fb:	00 
  1372fc:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  137303:	00 
  137304:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  13730b:	00 
  13730c:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  137313:	00 
  137314:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
  13731b:	00 
  13731c:	f0 48 ff 08          	lock decq (%rax)
  137320:	75 1b                	jne    13733d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5ad>
  137322:	bb 01 00 00 00       	mov    $0x1,%ebx
  137327:	4c 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%r13
  13732e:	00 
  13732f:	48 8d bc 24 e0 00 00 	lea    0xe0(%rsp),%rdi
  137336:	00 
  137337:	ff 15 4b e4 16 00    	call   *0x16e44b(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13733d:	bb 01 00 00 00       	mov    $0x1,%ebx
  137342:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137349:	00 
  13734a:	49 89 fd             	mov    %rdi,%r13
  13734d:	e8 6e 82 ff ff       	call   12f5c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137352:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
  137359:	00 
  13735a:	48 85 c0             	test   %rax,%rax
  13735d:	74 51                	je     1373b0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x620>
  13735f:	f0 48 ff 08          	lock decq (%rax)
  137363:	75 1b                	jne    137380 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x5f0>
  137365:	bb 01 00 00 00       	mov    $0x1,%ebx
  13736a:	4c 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%r13
  137371:	00 
  137372:	48 8d bc 24 e8 00 00 	lea    0xe8(%rsp),%rdi
  137379:	00 
  13737a:	ff 15 f8 e3 16 00    	call   *0x16e3f8(%rip)        # 2a5778 <_DYNAMIC+0x250>
  137380:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
  137387:	00 
  137388:	48 85 c0             	test   %rax,%rax
  13738b:	74 23                	je     1373b0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x620>
  13738d:	f0 48 ff 08          	lock decq (%rax)
  137391:	75 1d                	jne    1373b0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x620>
  137393:	bb 01 00 00 00       	mov    $0x1,%ebx
  137398:	48 8d bc 24 f0 00 00 	lea    0xf0(%rsp),%rdi
  13739f:	00 
  1373a0:	ff 15 da e3 16 00    	call   *0x16e3da(%rip)        # 2a5780 <_DYNAMIC+0x258>
  1373a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  1373ad:	00 00 00 
  1373b0:	48 8b 84 24 10 01 00 	mov    0x110(%rsp),%rax
  1373b7:	00 
  1373b8:	f0 48 ff 08          	lock decq (%rax)
  1373bc:	75 16                	jne    1373d4 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x644>
  1373be:	bb 02 00 00 00       	mov    $0x2,%ebx
  1373c3:	4d 89 e5             	mov    %r12,%r13
  1373c6:	48 8d bc 24 10 01 00 	lea    0x110(%rsp),%rdi
  1373cd:	00 
  1373ce:	ff 15 b4 e3 16 00    	call   *0x16e3b4(%rip)        # 2a5788 <_DYNAMIC+0x260>
  1373d4:	bb 02 00 00 00       	mov    $0x2,%ebx
  1373d9:	4d 89 e5             	mov    %r12,%r13
  1373dc:	4c 89 e7             	mov    %r12,%rdi
  1373df:	e8 dc 81 ff ff       	call   12f5c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1373e4:	48 8b 84 24 18 01 00 	mov    0x118(%rsp),%rax
  1373eb:	00 
  1373ec:	48 85 c0             	test   %rax,%rax
  1373ef:	74 4f                	je     137440 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6b0>
  1373f1:	f0 48 ff 08          	lock decq (%rax)
  1373f5:	75 16                	jne    13740d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x67d>
  1373f7:	bb 02 00 00 00       	mov    $0x2,%ebx
  1373fc:	4d 89 e5             	mov    %r12,%r13
  1373ff:	48 8d bc 24 18 01 00 	lea    0x118(%rsp),%rdi
  137406:	00 
  137407:	ff 15 6b e3 16 00    	call   *0x16e36b(%rip)        # 2a5778 <_DYNAMIC+0x250>
  13740d:	48 8b 84 24 20 01 00 	mov    0x120(%rsp),%rax
  137414:	00 
  137415:	48 85 c0             	test   %rax,%rax
  137418:	74 26                	je     137440 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6b0>
  13741a:	f0 48 ff 08          	lock decq (%rax)
  13741e:	75 20                	jne    137440 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6b0>
  137420:	bb 02 00 00 00       	mov    $0x2,%ebx
  137425:	48 8d bc 24 20 01 00 	lea    0x120(%rsp),%rdi
  13742c:	00 
  13742d:	ff 15 4d e3 16 00    	call   *0x16e34d(%rip)        # 2a5780 <_DYNAMIC+0x258>
  137433:	66 66 66 66 2e 0f 1f 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  13743a:	84 00 00 00 00 00 
  137440:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
  137447:	00 
  137448:	f0 48 ff 08          	lock decq (%rax)
  13744c:	75 1b                	jne    137469 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x6d9>
  13744e:	bb 03 00 00 00       	mov    $0x3,%ebx
  137453:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
  13745a:	00 
  13745b:	48 8d bc 24 40 01 00 	lea    0x140(%rsp),%rdi
  137462:	00 
  137463:	ff 15 1f e3 16 00    	call   *0x16e31f(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137469:	bb 03 00 00 00       	mov    $0x3,%ebx
  13746e:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  137475:	00 
  137476:	49 89 fd             	mov    %rdi,%r13
  137479:	e8 42 81 ff ff       	call   12f5c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13747e:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
  137485:	00 
  137486:	48 85 c0             	test   %rax,%rax
  137489:	74 55                	je     1374e0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x750>
  13748b:	f0 48 ff 08          	lock decq (%rax)
  13748f:	75 1b                	jne    1374ac <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x71c>
  137491:	bb 03 00 00 00       	mov    $0x3,%ebx
  137496:	4c 8d ac 24 30 01 00 	lea    0x130(%rsp),%r13
  13749d:	00 
  13749e:	48 8d bc 24 48 01 00 	lea    0x148(%rsp),%rdi
  1374a5:	00 
  1374a6:	ff 15 cc e2 16 00    	call   *0x16e2cc(%rip)        # 2a5778 <_DYNAMIC+0x250>
  1374ac:	48 8b 84 24 50 01 00 	mov    0x150(%rsp),%rax
  1374b3:	00 
  1374b4:	48 85 c0             	test   %rax,%rax
  1374b7:	74 27                	je     1374e0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x750>
  1374b9:	f0 48 ff 08          	lock decq (%rax)
  1374bd:	75 21                	jne    1374e0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x750>
  1374bf:	bb 03 00 00 00       	mov    $0x3,%ebx
  1374c4:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  1374cb:	00 
  1374cc:	ff 15 ae e2 16 00    	call   *0x16e2ae(%rip)        # 2a5780 <_DYNAMIC+0x258>
  1374d2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  1374d9:	1f 84 00 00 00 00 00 
  1374e0:	48 8b 84 24 70 01 00 	mov    0x170(%rsp),%rax
  1374e7:	00 
  1374e8:	f0 48 ff 08          	lock decq (%rax)
  1374ec:	75 1b                	jne    137509 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x779>
  1374ee:	bb 04 00 00 00       	mov    $0x4,%ebx
  1374f3:	4c 8d ac 24 60 01 00 	lea    0x160(%rsp),%r13
  1374fa:	00 
  1374fb:	48 8d bc 24 70 01 00 	lea    0x170(%rsp),%rdi
  137502:	00 
  137503:	ff 15 7f e2 16 00    	call   *0x16e27f(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137509:	bb 04 00 00 00       	mov    $0x4,%ebx
  13750e:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  137515:	00 
  137516:	49 89 fd             	mov    %rdi,%r13
  137519:	e8 a2 80 ff ff       	call   12f5c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13751e:	48 8b 84 24 78 01 00 	mov    0x178(%rsp),%rax
  137525:	00 
  137526:	48 85 c0             	test   %rax,%rax
  137529:	0f 84 41 f9 ff ff    	je     136e70 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  13752f:	f0 48 ff 08          	lock decq (%rax)
  137533:	75 1b                	jne    137550 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x7c0>
  137535:	bb 04 00 00 00       	mov    $0x4,%ebx
  13753a:	4c 8d ac 24 60 01 00 	lea    0x160(%rsp),%r13
  137541:	00 
  137542:	48 8d bc 24 78 01 00 	lea    0x178(%rsp),%rdi
  137549:	00 
  13754a:	ff 15 28 e2 16 00    	call   *0x16e228(%rip)        # 2a5778 <_DYNAMIC+0x250>
  137550:	48 8b 84 24 80 01 00 	mov    0x180(%rsp),%rax
  137557:	00 
  137558:	48 85 c0             	test   %rax,%rax
  13755b:	0f 84 0f f9 ff ff    	je     136e70 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  137561:	f0 48 ff 08          	lock decq (%rax)
  137565:	0f 85 05 f9 ff ff    	jne    136e70 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  13756b:	bb 04 00 00 00       	mov    $0x4,%ebx
  137570:	48 8d bc 24 80 01 00 	lea    0x180(%rsp),%rdi
  137577:	00 
  137578:	ff 15 02 e2 16 00    	call   *0x16e202(%rip)        # 2a5780 <_DYNAMIC+0x258>
  13757e:	e9 ed f8 ff ff       	jmp    136e70 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe0>
  137583:	0f b6 8c 24 d0 01 00 	movzbl 0x1d0(%rsp),%ecx
  13758a:	00 
  13758b:	0f 10 84 24 d1 01 00 	movups 0x1d1(%rsp),%xmm0
  137592:	00 
  137593:	0f 29 84 24 10 02 00 	movaps %xmm0,0x210(%rsp)
  13759a:	00 
  13759b:	0f 10 84 24 e1 01 00 	movups 0x1e1(%rsp),%xmm0
  1375a2:	00 
  1375a3:	0f 29 84 24 20 02 00 	movaps %xmm0,0x220(%rsp)
  1375aa:	00 
  1375ab:	0f 10 84 24 f0 01 00 	movups 0x1f0(%rsp),%xmm0
  1375b2:	00 
  1375b3:	0f 11 84 24 2f 02 00 	movups %xmm0,0x22f(%rsp)
  1375ba:	00 
  1375bb:	0f 28 84 24 a0 01 00 	movaps 0x1a0(%rsp),%xmm0
  1375c2:	00 
  1375c3:	0f 28 8c 24 b0 01 00 	movaps 0x1b0(%rsp),%xmm1
  1375ca:	00 
  1375cb:	0f 28 94 24 c0 01 00 	movaps 0x1c0(%rsp),%xmm2
  1375d2:	00 
  1375d3:	0f 29 84 24 40 02 00 	movaps %xmm0,0x240(%rsp)
  1375da:	00 
  1375db:	0f 29 8c 24 50 02 00 	movaps %xmm1,0x250(%rsp)
  1375e2:	00 
  1375e3:	0f 29 94 24 60 02 00 	movaps %xmm2,0x260(%rsp)
  1375ea:	00 
  1375eb:	b0 02                	mov    $0x2,%al
  1375ed:	80 f9 ff             	cmp    $0xff,%cl
  1375f0:	0f 84 3d 02 00 00    	je     137833 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa3>
  1375f6:	0f 10 84 24 2f 02 00 	movups 0x22f(%rsp),%xmm0
  1375fd:	00 
  1375fe:	0f 11 84 24 88 00 00 	movups %xmm0,0x88(%rsp)
  137605:	00 
  137606:	0f 28 84 24 10 02 00 	movaps 0x210(%rsp),%xmm0
  13760d:	00 
  13760e:	0f 28 8c 24 20 02 00 	movaps 0x220(%rsp),%xmm1
  137615:	00 
  137616:	0f 11 4c 24 79       	movups %xmm1,0x79(%rsp)
  13761b:	0f 11 44 24 69       	movups %xmm0,0x69(%rsp)
  137620:	0f 28 84 24 40 02 00 	movaps 0x240(%rsp),%xmm0
  137627:	00 
  137628:	0f 28 8c 24 50 02 00 	movaps 0x250(%rsp),%xmm1
  13762f:	00 
  137630:	0f 28 94 24 60 02 00 	movaps 0x260(%rsp),%xmm2
  137637:	00 
  137638:	0f 29 54 24 20       	movaps %xmm2,0x20(%rsp)
  13763d:	0f 29 4c 24 10       	movaps %xmm1,0x10(%rsp)
  137642:	0f 29 04 24          	movaps %xmm0,(%rsp)
  137646:	88 4c 24 68          	mov    %cl,0x68(%rsp)
  13764a:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137651:	00 
  137652:	ff 15 78 e1 16 00    	call   *0x16e178(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  137658:	0f b6 ac 24 9c 00 00 	movzbl 0x9c(%rsp),%ebp
  13765f:	00 
  137660:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  137665:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
  13766c:	00 
  13766d:	89 ea                	mov    %ebp,%edx
  13766f:	e8 0c 68 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  137674:	89 c3                	mov    %eax,%ebx
  137676:	80 fb fe             	cmp    $0xfe,%bl
  137679:	0f 85 5e 01 00 00    	jne    1377dd <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa4d>
  13767f:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137686:	00 
  137687:	e8 74 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13768c:	e9 8e 01 00 00       	jmp    13781f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa8f>
  137691:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137696:	e8 65 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13769b:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  1376a2:	00 
  1376a3:	e8 58 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1376a8:	bb 01 00 00 00       	mov    $0x1,%ebx
  1376ad:	31 ed                	xor    %ebp,%ebp
  1376af:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  1376b6:	00 
  1376b7:	e8 44 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1376bc:	bb 02 00 00 00       	mov    $0x2,%ebx
  1376c1:	31 ed                	xor    %ebp,%ebp
  1376c3:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  1376ca:	00 
  1376cb:	e8 30 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1376d0:	bb 03 00 00 00       	mov    $0x3,%ebx
  1376d5:	31 ed                	xor    %ebp,%ebp
  1376d7:	48 8d bc 24 30 01 00 	lea    0x130(%rsp),%rdi
  1376de:	00 
  1376df:	e8 1c 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1376e4:	bb 04 00 00 00       	mov    $0x4,%ebx
  1376e9:	40 b5 01             	mov    $0x1,%bpl
  1376ec:	48 8d bc 24 60 01 00 	lea    0x160(%rsp),%rdi
  1376f3:	00 
  1376f4:	e8 07 7e ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1376f9:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  137700:	00 
  137701:	e8 fa 7d ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137706:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  13770d:	00 
  13770e:	e9 19 01 00 00       	jmp    13782c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa9c>
  137713:	48 8b 84 24 98 01 00 	mov    0x198(%rsp),%rax
  13771a:	00 
  13771b:	48 8d 68 10          	lea    0x10(%rax),%rbp
  13771f:	4d 8d 7d 10          	lea    0x10(%r13),%r15
  137723:	49 89 fe             	mov    %rdi,%r14
  137726:	48 89 ef             	mov    %rbp,%rdi
  137729:	4c 89 fe             	mov    %r15,%rsi
  13772c:	ff 15 16 e1 16 00    	call   *0x16e116(%rip)        # 2a5848 <_DYNAMIC+0x320>
  137732:	4c 89 f7             	mov    %r14,%rdi
  137735:	48 85 db             	test   %rbx,%rbx
  137738:	0f 84 91 f6 ff ff    	je     136dcf <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  13773e:	84 c0                	test   %al,%al
  137740:	0f 8f 89 f6 ff ff    	jg     136dcf <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  137746:	48 89 d8             	mov    %rbx,%rax
  137749:	48 c1 e0 04          	shl    $0x4,%rax
  13774d:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
  137751:	42 80 7c 37 d0 00    	cmpb   $0x0,-0x30(%rdi,%r14,1)
  137757:	0f 85 7b f6 ff ff    	jne    136dd8 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x48>
  13775d:	4a 8b 44 37 e0       	mov    -0x20(%rdi,%r14,1),%rax
  137762:	f0 48 ff 00          	lock incq (%rax)
  137766:	0f 8e 6a 02 00 00    	jle    1379d6 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc46>
  13776c:	4a 8b 44 37 e0       	mov    -0x20(%rdi,%r14,1),%rax
  137771:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  137776:	f0 48 ff 00          	lock incq (%rax)
  13777a:	0f 8e 56 02 00 00    	jle    1379d6 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc46>
  137780:	4e 8b 64 37 e0       	mov    -0x20(%rdi,%r14,1),%r12
  137785:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
  13778a:	48 83 fb 01          	cmp    $0x1,%rbx
  13778e:	0f 85 e3 00 00 00    	jne    137877 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae7>
  137794:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
  137799:	b0 01                	mov    $0x1,%al
  13779b:	80 79 64 02          	cmpb   $0x2,0x64(%rcx)
  13779f:	74 09                	je     1377aa <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa1a>
  1377a1:	41 80 7c 24 64 00    	cmpb   $0x0,0x64(%r12)
  1377a7:	0f 94 c0             	sete   %al
  1377aa:	f0 49 ff 0c 24       	lock decq (%r12)
  1377af:	75 0f                	jne    1377c0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa30>
  1377b1:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  1377b6:	89 c3                	mov    %eax,%ebx
  1377b8:	ff 15 ca df 16 00    	call   *0x16dfca(%rip)        # 2a5788 <_DYNAMIC+0x260>
  1377be:	89 d8                	mov    %ebx,%eax
  1377c0:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
  1377c5:	f0 48 ff 09          	lock decq (%rcx)
  1377c9:	75 68                	jne    137833 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa3>
  1377cb:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1377d0:	89 c3                	mov    %eax,%ebx
  1377d2:	ff 15 b0 df 16 00    	call   *0x16dfb0(%rip)        # 2a5788 <_DYNAMIC+0x260>
  1377d8:	e9 96 00 00 00       	jmp    137873 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xae3>
  1377dd:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  1377e4:	00 
  1377e5:	e8 16 7d ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  1377ea:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  1377f1:	00 
  1377f2:	ff 15 d8 df 16 00    	call   *0x16dfd8(%rip)        # 2a57d0 <_DYNAMIC+0x2a8>
  1377f8:	48 89 e7             	mov    %rsp,%rdi
  1377fb:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
  137802:	00 
  137803:	89 ea                	mov    %ebp,%edx
  137805:	e8 76 66 00 00       	call   13de80 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.16915591691837077173>
  13780a:	89 c5                	mov    %eax,%ebp
  13780c:	40 80 fd fe          	cmp    $0xfe,%bpl
  137810:	75 33                	jne    137845 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xab5>
  137812:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137819:	00 
  13781a:	e8 e1 7c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13781f:	48 89 e7             	mov    %rsp,%rdi
  137822:	e8 d9 7c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137827:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  13782c:	e8 cf 7c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137831:	b0 02                	mov    $0x2,%al
  137833:	48 81 c4 a8 02 00 00 	add    $0x2a8,%rsp
  13783a:	5b                   	pop    %rbx
  13783b:	41 5c                	pop    %r12
  13783d:	41 5d                	pop    %r13
  13783f:	41 5e                	pop    %r14
  137841:	41 5f                	pop    %r15
  137843:	5d                   	pop    %rbp
  137844:	c3                   	ret
  137845:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  13784c:	00 
  13784d:	e8 ae 7c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137852:	48 89 e7             	mov    %rsp,%rdi
  137855:	e8 a6 7c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  13785a:	80 fb 01             	cmp    $0x1,%bl
  13785d:	0f 94 c0             	sete   %al
  137860:	40 80 fd ff          	cmp    $0xff,%bpl
  137864:	0f 94 c3             	sete   %bl
  137867:	08 c3                	or     %al,%bl
  137869:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  13786e:	e8 8d 7c ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137873:	89 d8                	mov    %ebx,%eax
  137875:	eb bc                	jmp    137833 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xaa3>
  137877:	4c 89 bc 24 08 02 00 	mov    %r15,0x208(%rsp)
  13787e:	00 
  13787f:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
  137884:	42 80 7c 37 a0 00    	cmpb   $0x0,-0x60(%rdi,%r14,1)
  13788a:	0f 85 0a 01 00 00    	jne    13799a <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc0a>
  137890:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  137895:	48 83 c0 b0          	add    $0xffffffffffffffb0,%rax
  137899:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
  1378a0:	00 
  1378a1:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1378a6:	48 8d 74 24 68       	lea    0x68(%rsp),%rsi
  1378ab:	49 89 ef             	mov    %rbp,%r15
  1378ae:	48 89 ea             	mov    %rbp,%rdx
  1378b1:	48 8b 8c 24 08 02 00 	mov    0x208(%rsp),%rcx
  1378b8:	00 
  1378b9:	e8 92 61 00 00       	call   13da50 <_RNvNtCs6IjHMNHnq5H_10hypersolve8interval25rational_interval_product>
  1378be:	48 89 c5             	mov    %rax,%rbp
  1378c1:	48 8b 84 24 00 02 00 	mov    0x200(%rsp),%rax
  1378c8:	00 
  1378c9:	4e 8d 24 30          	lea    (%rax,%r14,1),%r12
  1378cd:	48 89 14 24          	mov    %rdx,(%rsp)
  1378d1:	48 89 ac 24 d0 00 00 	mov    %rbp,0xd0(%rsp)
  1378d8:	00 
  1378d9:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  1378e0:	00 
  1378e1:	4c 89 e6             	mov    %r12,%rsi
  1378e4:	ff 15 66 df 16 00    	call   *0x16df66(%rip)        # 2a5850 <_DYNAMIC+0x328>
  1378ea:	49 89 c5             	mov    %rax,%r13
  1378ed:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
  1378f2:	75 0e                	jne    137902 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb72>
  1378f4:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  1378fb:	00 
  1378fc:	ff 15 86 de 16 00    	call   *0x16de86(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137902:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  137907:	f0 48 ff 08          	lock decq (%rax)
  13790b:	4c 89 fd             	mov    %r15,%rbp
  13790e:	75 0b                	jne    13791b <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb8b>
  137910:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137915:	ff 15 6d de 16 00    	call   *0x16de6d(%rip)        # 2a5788 <_DYNAMIC+0x260>
  13791b:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
  137920:	4c 8b 2c 24          	mov    (%rsp),%r13
  137924:	4c 89 ac 24 d0 00 00 	mov    %r13,0xd0(%rsp)
  13792b:	00 
  13792c:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137933:	00 
  137934:	4c 89 e6             	mov    %r12,%rsi
  137937:	ff 15 13 df 16 00    	call   *0x16df13(%rip)        # 2a5850 <_DYNAMIC+0x328>
  13793d:	49 89 c4             	mov    %rax,%r12
  137940:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  137945:	75 0e                	jne    137955 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbc5>
  137947:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  13794e:	00 
  13794f:	ff 15 33 de 16 00    	call   *0x16de33(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137955:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  13795a:	f0 48 ff 08          	lock decq (%rax)
  13795e:	4c 8b ac 24 90 01 00 	mov    0x190(%rsp),%r13
  137965:	00 
  137966:	75 0b                	jne    137973 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xbe3>
  137968:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  13796d:	ff 15 15 de 16 00    	call   *0x16de15(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137973:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
  137978:	49 83 fe 60          	cmp    $0x60,%r14
  13797c:	0f 84 12 fe ff ff    	je     137794 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xa04>
  137982:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
  137987:	42 80 bc 30 70 ff ff 	cmpb   $0x0,-0x90(%rax,%r14,1)
  13798e:	ff 00 
  137990:	4d 8d 76 d0          	lea    -0x30(%r14),%r14
  137994:	0f 84 07 ff ff ff    	je     1378a1 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xb11>
  13799a:	f0 49 ff 0c 24       	lock decq (%r12)
  13799f:	75 0b                	jne    1379ac <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xc1c>
  1379a1:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  1379a6:	ff 15 dc dd 16 00    	call   *0x16dddc(%rip)        # 2a5788 <_DYNAMIC+0x260>
  1379ac:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  1379b1:	f0 48 ff 08          	lock decq (%rax)
  1379b5:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
  1379ba:	0f 85 0f f4 ff ff    	jne    136dcf <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  1379c0:	49 89 fe             	mov    %rdi,%r14
  1379c3:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  1379c8:	ff 15 ba dd 16 00    	call   *0x16ddba(%rip)        # 2a5788 <_DYNAMIC+0x260>
  1379ce:	4c 89 f7             	mov    %r14,%rdi
  1379d1:	e9 f9 f3 ff ff       	jmp    136dcf <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0x3f>
  1379d6:	0f 0b                	ud2
  1379d8:	49 89 c7             	mov    %rax,%r15
  1379db:	e9 87 00 00 00       	jmp    137a67 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcd7>
  1379e0:	49 89 c7             	mov    %rax,%r15
  1379e3:	4c 89 6c 24 30       	mov    %r13,0x30(%rsp)
  1379e8:	eb 49                	jmp    137a33 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca3>
  1379ea:	49 89 c7             	mov    %rax,%r15
  1379ed:	eb 44                	jmp    137a33 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca3>
  1379ef:	49 89 c7             	mov    %rax,%r15
  1379f2:	4c 89 64 24 68       	mov    %r12,0x68(%rsp)
  1379f7:	eb 58                	jmp    137a51 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  1379f9:	eb 53                	jmp    137a4e <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcbe>
  1379fb:	49 89 c7             	mov    %rax,%r15
  1379fe:	f0 49 ff 4d 00       	lock decq 0x0(%r13)
  137a03:	75 4c                	jne    137a51 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  137a05:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137a0c:	00 
  137a0d:	ff 15 75 dd 16 00    	call   *0x16dd75(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137a13:	eb 3c                	jmp    137a51 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  137a15:	ff 15 4d dd 16 00    	call   *0x16dd4d(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137a1b:	49 89 c7             	mov    %rax,%r15
  137a1e:	f0 48 ff 4d 00       	lock decq 0x0(%rbp)
  137a23:	75 0e                	jne    137a33 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xca3>
  137a25:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137a2c:	00 
  137a2d:	ff 15 55 dd 16 00    	call   *0x16dd55(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137a33:	48 8b 04 24          	mov    (%rsp),%rax
  137a37:	f0 48 ff 08          	lock decq (%rax)
  137a3b:	75 14                	jne    137a51 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  137a3d:	48 89 e7             	mov    %rsp,%rdi
  137a40:	ff 15 42 dd 16 00    	call   *0x16dd42(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137a46:	eb 09                	jmp    137a51 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcc1>
  137a48:	ff 15 1a dd 16 00    	call   *0x16dd1a(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137a4e:	49 89 c7             	mov    %rax,%r15
  137a51:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  137a56:	f0 48 ff 08          	lock decq (%rax)
  137a5a:	75 0b                	jne    137a67 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xcd7>
  137a5c:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  137a61:	ff 15 21 dd 16 00    	call   *0x16dd21(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137a67:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  137a6c:	f0 48 ff 08          	lock decq (%rax)
  137a70:	0f 85 e0 02 00 00    	jne    137d56 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  137a76:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137a7b:	ff 15 07 dd 16 00    	call   *0x16dd07(%rip)        # 2a5788 <_DYNAMIC+0x260>
  137a81:	e9 d0 02 00 00       	jmp    137d56 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  137a86:	49 89 c7             	mov    %rax,%r15
  137a89:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137a90:	00 
  137a91:	e8 6a 7a ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137a96:	eb 32                	jmp    137aca <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd3a>
  137a98:	ff 15 ca dc 16 00    	call   *0x16dcca(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137a9e:	49 89 c7             	mov    %rax,%r15
  137aa1:	eb 2f                	jmp    137ad2 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd42>
  137aa3:	49 89 c7             	mov    %rax,%r15
  137aa6:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137aad:	00 
  137aae:	e8 4d 7a ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137ab3:	eb 15                	jmp    137aca <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd3a>
  137ab5:	49 89 c7             	mov    %rax,%r15
  137ab8:	e9 8c 02 00 00       	jmp    137d49 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfb9>
  137abd:	e9 3c 01 00 00       	jmp    137bfe <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe6e>
  137ac2:	e9 2f 01 00 00       	jmp    137bf6 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe66>
  137ac7:	49 89 c7             	mov    %rax,%r15
  137aca:	48 89 e7             	mov    %rsp,%rdi
  137acd:	e8 2e 7a ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137ad2:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  137ad7:	e8 24 7a ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137adc:	e9 75 02 00 00       	jmp    137d56 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  137ae1:	49 89 c7             	mov    %rax,%r15
  137ae4:	48 8d bc 24 78 02 00 	lea    0x278(%rsp),%rdi
  137aeb:	00 
  137aec:	e8 0f 7a ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137af1:	e9 60 02 00 00       	jmp    137d56 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfc6>
  137af6:	ff 15 6c dc 16 00    	call   *0x16dc6c(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137afc:	49 89 c7             	mov    %rax,%r15
  137aff:	40 84 ed             	test   %bpl,%bpl
  137b02:	0f 85 34 02 00 00    	jne    137d3c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  137b08:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  137b0c:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  137b10:	c1 e0 04             	shl    $0x4,%eax
  137b13:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  137b17:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
  137b1e:	66 90                	xchg   %ax,%ax
  137b20:	4c 89 f7             	mov    %r14,%rdi
  137b23:	e8 d8 79 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137b28:	49 83 c6 30          	add    $0x30,%r14
  137b2c:	48 ff c3             	inc    %rbx
  137b2f:	75 ef                	jne    137b20 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xd90>
  137b31:	e9 06 02 00 00       	jmp    137d3c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  137b36:	ff 15 2c dc 16 00    	call   *0x16dc2c(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137b3c:	49 89 c7             	mov    %rax,%r15
  137b3f:	e9 86 01 00 00       	jmp    137cca <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  137b44:	49 89 c7             	mov    %rax,%r15
  137b47:	48 89 e7             	mov    %rsp,%rdi
  137b4a:	e8 01 b2 fd ff       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
  137b4f:	b3 01                	mov    $0x1,%bl
  137b51:	e9 be 01 00 00       	jmp    137d14 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf84>
  137b56:	ff 15 0c dc 16 00    	call   *0x16dc0c(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137b5c:	49 89 c7             	mov    %rax,%r15
  137b5f:	b3 01                	mov    $0x1,%bl
  137b61:	e9 ae 01 00 00       	jmp    137d14 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf84>
  137b66:	49 89 c7             	mov    %rax,%r15
  137b69:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  137b6e:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  137b73:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  137b7a:	00 
  137b7b:	0f 29 94 24 f0 01 00 	movaps %xmm2,0x1f0(%rsp)
  137b82:	00 
  137b83:	0f 29 8c 24 e0 01 00 	movaps %xmm1,0x1e0(%rsp)
  137b8a:	00 
  137b8b:	0f 29 84 24 d0 01 00 	movaps %xmm0,0x1d0(%rsp)
  137b92:	00 
  137b93:	b3 01                	mov    $0x1,%bl
  137b95:	e9 7a 01 00 00       	jmp    137d14 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf84>
  137b9a:	49 89 c7             	mov    %rax,%r15
  137b9d:	48 89 e7             	mov    %rsp,%rdi
  137ba0:	e8 ab b1 fd ff       	call   112d50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.8906551996728875458>
  137ba5:	e9 85 01 00 00       	jmp    137d2f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  137baa:	ff 15 b8 db 16 00    	call   *0x16dbb8(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137bb0:	eb 4c                	jmp    137bfe <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe6e>
  137bb2:	49 89 c7             	mov    %rax,%r15
  137bb5:	0f 10 44 24 68       	movups 0x68(%rsp),%xmm0
  137bba:	0f 10 4c 24 78       	movups 0x78(%rsp),%xmm1
  137bbf:	0f 10 94 24 88 00 00 	movups 0x88(%rsp),%xmm2
  137bc6:	00 
  137bc7:	0f 29 94 24 c0 01 00 	movaps %xmm2,0x1c0(%rsp)
  137bce:	00 
  137bcf:	0f 29 8c 24 b0 01 00 	movaps %xmm1,0x1b0(%rsp)
  137bd6:	00 
  137bd7:	0f 29 84 24 a0 01 00 	movaps %xmm0,0x1a0(%rsp)
  137bde:	00 
  137bdf:	e9 4b 01 00 00       	jmp    137d2f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  137be4:	49 89 c7             	mov    %rax,%r15
  137be7:	eb 2a                	jmp    137c13 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe83>
  137be9:	49 89 c7             	mov    %rax,%r15
  137bec:	eb 2f                	jmp    137c1d <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xe8d>
  137bee:	49 89 c7             	mov    %rax,%r15
  137bf1:	e9 46 01 00 00       	jmp    137d3c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  137bf6:	49 89 c7             	mov    %rax,%r15
  137bf9:	e9 24 01 00 00       	jmp    137d22 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf92>
  137bfe:	49 89 c7             	mov    %rax,%r15
  137c01:	e9 29 01 00 00       	jmp    137d2f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  137c06:	49 89 c7             	mov    %rax,%r15
  137c09:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
  137c0e:	e8 ed 78 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137c13:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137c18:	e8 e3 78 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137c1d:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  137c24:	00 
  137c25:	e8 d6 78 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137c2a:	e9 0d 01 00 00       	jmp    137d3c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  137c2f:	49 89 c7             	mov    %rax,%r15
  137c32:	49 8b 45 20          	mov    0x20(%r13),%rax
  137c36:	48 85 c0             	test   %rax,%rax
  137c39:	0f 84 8b 00 00 00    	je     137cca <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  137c3f:	f0 48 ff 08          	lock decq (%rax)
  137c43:	0f 85 81 00 00 00    	jne    137cca <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  137c49:	49 83 c5 20          	add    $0x20,%r13
  137c4d:	4c 89 ef             	mov    %r13,%rdi
  137c50:	ff 15 2a db 16 00    	call   *0x16db2a(%rip)        # 2a5780 <_DYNAMIC+0x258>
  137c56:	eb 72                	jmp    137cca <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf3a>
  137c58:	ff 15 0a db 16 00    	call   *0x16db0a(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137c5e:	49 89 c7             	mov    %rax,%r15
  137c61:	0f 10 04 24          	movups (%rsp),%xmm0
  137c65:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  137c6a:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  137c6f:	0f 29 54 24 50       	movaps %xmm2,0x50(%rsp)
  137c74:	0f 29 4c 24 40       	movaps %xmm1,0x40(%rsp)
  137c79:	0f 29 44 24 30       	movaps %xmm0,0x30(%rsp)
  137c7e:	e9 8f 00 00 00       	jmp    137d12 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf82>
  137c83:	49 89 c7             	mov    %rax,%r15
  137c86:	0f 10 04 24          	movups (%rsp),%xmm0
  137c8a:	0f 10 4c 24 10       	movups 0x10(%rsp),%xmm1
  137c8f:	0f 10 54 24 20       	movups 0x20(%rsp),%xmm2
  137c94:	0f 29 94 24 c0 00 00 	movaps %xmm2,0xc0(%rsp)
  137c9b:	00 
  137c9c:	0f 29 8c 24 b0 00 00 	movaps %xmm1,0xb0(%rsp)
  137ca3:	00 
  137ca4:	0f 29 84 24 a0 00 00 	movaps %xmm0,0xa0(%rsp)
  137cab:	00 
  137cac:	eb 64                	jmp    137d12 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf82>
  137cae:	49 89 c7             	mov    %rax,%r15
  137cb1:	4c 89 ef             	mov    %r13,%rdi
  137cb4:	e8 07 79 ff ff       	call   12f5c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic5ClassECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137cb9:	eb 03                	jmp    137cbe <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf2e>
  137cbb:	49 89 c7             	mov    %rax,%r15
  137cbe:	49 83 c5 18          	add    $0x18,%r13
  137cc2:	4c 89 ef             	mov    %r13,%rdi
  137cc5:	e8 c6 70 ff ff       	call   12ed90 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtB4_6option6OptionNtNtNtCs8rd0GMicEM6_9hyperreal10computable4node10ComputableEECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137cca:	83 fb 04             	cmp    $0x4,%ebx
  137ccd:	74 6d                	je     137d3c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  137ccf:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
  137cd3:	48 83 c3 fc          	add    $0xfffffffffffffffc,%rbx
  137cd7:	c1 e0 04             	shl    $0x4,%eax
  137cda:	4c 8d 34 04          	lea    (%rsp,%rax,1),%r14
  137cde:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
  137ce5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  137cec:	00 00 00 00 
  137cf0:	4c 89 f7             	mov    %r14,%rdi
  137cf3:	e8 08 78 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137cf8:	49 83 c6 30          	add    $0x30,%r14
  137cfc:	48 ff c3             	inc    %rbx
  137cff:	75 ef                	jne    137cf0 <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf60>
  137d01:	eb 39                	jmp    137d3c <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xfac>
  137d03:	ff 15 5f da 16 00    	call   *0x16da5f(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137d09:	ff 15 59 da 16 00    	call   *0x16da59(%rip)        # 2a5768 <_DYNAMIC+0x240>
  137d0f:	49 89 c7             	mov    %rax,%r15
  137d12:	31 db                	xor    %ebx,%ebx
  137d14:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  137d19:	e8 e2 77 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137d1e:	84 db                	test   %bl,%bl
  137d20:	75 0d                	jne    137d2f <_RNvNtCs6IjHMNHnq5H_10hypersolve14root_isolation33polynomial_interval_excludes_zero+0xf9f>
  137d22:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  137d29:	00 
  137d2a:	e8 d1 77 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137d2f:	48 8d bc 24 d0 00 00 	lea    0xd0(%rsp),%rdi
  137d36:	00 
  137d37:	e8 14 6e ff ff       	call   12eb50 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueANtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4Realj4_ECs6IjHMNHnq5H_10hypersolve>
  137d3c:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  137d43:	00 
  137d44:	e8 b7 77 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137d49:	48 8d bc 24 d0 01 00 	lea    0x1d0(%rsp),%rdi
  137d50:	00 
  137d51:	e8 aa 77 ff ff       	call   12f500 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs6IjHMNHnq5H_10hypersolve.llvm.16915591691837077173>
  137d56:	4c 89 ff             	mov    %r15,%rdi
  137d59:	e8 f2 3f 16 00       	call   29bd50 <_Unwind_Resume@plt>
  137d5e:	ff 15 04 da 16 00    	call   *0x16da04(%rip)        # 2a5768 <_DYNAMIC+0x240>
