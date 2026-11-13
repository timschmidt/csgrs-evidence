
/tmp/interval-refactor/dynamics-requal-binaries/candidate:     file format elf64-x86-64


Disassembly of section .text:

0000000000631db0 <hyperpath::routing::certify_differential_pair_skew>:
  631db0:	push   %rbp
  631db1:	push   %r15
  631db3:	push   %r14
  631db5:	push   %r13
  631db7:	push   %r12
  631db9:	push   %rbx
  631dba:	sub    $0x3f8,%rsp
  631dc1:	mov    %r9,%rbx
  631dc4:	mov    %rdi,%r14
  631dc7:	test   %rdx,%rdx
  631dca:	je     631e01 <hyperpath::routing::certify_differential_pair_skew+0x51>
  631dcc:	mov    %r8,%r15
  631dcf:	test   %r8,%r8
  631dd2:	je     631e01 <hyperpath::routing::certify_differential_pair_skew+0x51>
  631dd4:	mov    %rcx,%r12
  631dd7:	movzbl 0x430(%rsp),%ebp
  631ddf:	lea    0x140(%rsp),%rdi
  631de7:	mov    %ebp,%ecx
  631de9:	call   62a670 <hyperpath::routing::route_axis_length>
  631dee:	movzbl 0x140(%rsp),%eax
  631df6:	cmp    $0x16,%al
  631df8:	jne    631e30 <hyperpath::routing::certify_differential_pair_skew+0x80>
  631dfa:	movb   $0x1,0x8(%r14)
  631dff:	jmp    631e06 <hyperpath::routing::certify_differential_pair_skew+0x56>
  631e01:	movb   $0x0,0x8(%r14)
  631e06:	movabs $0x8000000000000000,%rax
  631e10:	mov    %rax,(%r14)
  631e13:	mov    %rbx,%rdi
  631e16:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631e1b:	mov    %r14,%rax
  631e1e:	add    $0x3f8,%rsp
  631e25:	pop    %rbx
  631e26:	pop    %r12
  631e28:	pop    %r13
  631e2a:	pop    %r14
  631e2c:	pop    %r15
  631e2e:	pop    %rbp
  631e2f:	ret
  631e30:	movzbl 0x141(%rsp),%ecx
  631e38:	movups 0x142(%rsp),%xmm0
  631e40:	movups %xmm0,0x4a(%rsp)
  631e45:	movups 0x152(%rsp),%xmm0
  631e4d:	movups %xmm0,0x5a(%rsp)
  631e52:	movdqu 0x160(%rsp),%xmm0
  631e5b:	movdqu %xmm0,0x68(%rsp)
  631e61:	mov    %al,0x48(%rsp)
  631e65:	mov    %cl,0x49(%rsp)
  631e69:	lea    0x140(%rsp),%rdi
  631e71:	mov    %r12,%rsi
  631e74:	mov    %r15,%rdx
  631e77:	mov    %ebp,%ecx
  631e79:	call   62a670 <hyperpath::routing::route_axis_length>
  631e7e:	movzbl 0x140(%rsp),%eax
  631e86:	cmp    $0x16,%al
  631e88:	jne    631eab <hyperpath::routing::certify_differential_pair_skew+0xfb>
  631e8a:	movb   $0x1,0x8(%r14)
  631e8f:	movabs $0x8000000000000000,%rax
  631e99:	mov    %rax,(%r14)
  631e9c:	lea    0x48(%rsp),%rdi
  631ea1:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631ea6:	jmp    631e13 <hyperpath::routing::certify_differential_pair_skew+0x63>
  631eab:	movzbl 0x141(%rsp),%ecx
  631eb3:	movups 0x142(%rsp),%xmm0
  631ebb:	movups %xmm0,0x7a(%rsp)
  631ec0:	movups 0x152(%rsp),%xmm0
  631ec8:	movups %xmm0,0x8a(%rsp)
  631ed0:	movdqu 0x160(%rsp),%xmm0
  631ed9:	movdqu %xmm0,0x98(%rsp)
  631ee2:	mov    %al,0x78(%rsp)
  631ee6:	mov    %cl,0x79(%rsp)
  631eea:	lea    0x310(%rsp),%rdi
  631ef2:	lea    0x48(%rsp),%rsi
  631ef7:	call   628400 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631efc:	lea    0x140(%rsp),%rdi
  631f04:	lea    0x78(%rsp),%rsi
  631f09:	call   628400 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631f0e:	lea    0x240(%rsp),%rdi
  631f16:	lea    0x310(%rsp),%rsi
  631f1e:	lea    0x140(%rsp),%rdx
  631f26:	call   5aa150 <<&hyperreal::real::arithmetic::Real as core::ops::arith::Sub<T>>::sub>
  631f2b:	lea    0x140(%rsp),%rdi
  631f33:	call   5a2660 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631f38:	lea    0x310(%rsp),%rdi
  631f40:	call   5a2660 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631f45:	movq   $0x0,0xe0(%rsp)
  631f51:	movq   $0x8,0xe8(%rsp)
  631f5d:	pxor   %xmm0,%xmm0
  631f61:	movdqu %xmm0,0xf0(%rsp)
  631f6a:	movq   $0x8,0x100(%rsp)
  631f76:	movq   $0x0,0x108(%rsp)
  631f82:	mov    $0x1,%bpl
  631f85:	lea    0x140(%rsp),%rdi
  631f8d:	lea    0x48(%rsp),%rsi
  631f92:	call   628400 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631f97:	movdqu 0x140(%rsp),%xmm0
  631fa0:	movups 0x150(%rsp),%xmm1
  631fa8:	movups 0x160(%rsp),%xmm2
  631fb0:	movaps %xmm2,0x130(%rsp)
  631fb8:	movaps %xmm1,0x120(%rsp)
  631fc0:	movdqa %xmm0,0x110(%rsp)
  631fc9:	lea    0x140(%rsp),%rdi
  631fd1:	lea    0x78(%rsp),%rsi
  631fd6:	call   628400 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631fdb:	movdqu 0x140(%rsp),%xmm0
  631fe4:	movups 0x150(%rsp),%xmm1
  631fec:	movups 0x160(%rsp),%xmm2
  631ff4:	movaps %xmm2,0x30(%rsp)
  631ff9:	movaps %xmm1,0x20(%rsp)
  631ffe:	movdqa %xmm0,0x10(%rsp)
  632004:	lea    0xa8(%rsp),%rdi
  63200c:	mov    %rbx,%rsi
  63200f:	call   628400 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  632014:	lea    0x310(%rsp),%rdi
  63201c:	lea    0x110(%rsp),%rsi
  632024:	lea    0x10(%rsp),%rdx
  632029:	call   *0x441b71(%rip)        # a73ba0 <_DYNAMIC+0xd50>
  63202f:	movdqu 0xa8(%rsp),%xmm0
  632038:	movups 0xb8(%rsp),%xmm1
  632040:	movups 0xc8(%rsp),%xmm2
  632048:	movaps %xmm2,0x160(%rsp)
  632050:	movaps %xmm1,0x150(%rsp)
  632058:	movdqa %xmm0,0x140(%rsp)
  632061:	lea    0x2d0(%rsp),%rdi
  632069:	lea    0x310(%rsp),%rsi
  632071:	lea    0x140(%rsp),%rdx
  632079:	call   *0x441b21(%rip)        # a73ba0 <_DYNAMIC+0xd50>
  63207f:	lea    -0x4dadd6(%rip),%rsi        # 1572b0 <anon.40aa6753edb3d51d1f4ba64e16da7b53.20.llvm.14261911909539742293+0x3b>
  632086:	lea    0x140(%rsp),%rdi
  63208e:	lea    0x2d0(%rsp),%rcx
  632096:	mov    $0x16,%edx
  63209b:	call   623c00 <hypersolve::model::Constraint::equality>
  6320a0:	lea    0xe0(%rsp),%rdi
  6320a8:	lea    0x140(%rsp),%rsi
  6320b0:	call   *0x441afa(%rip)        # a73bb0 <_DYNAMIC+0xd60>
  6320b6:	lea    0x310(%rsp),%rdi
  6320be:	lea    0xe0(%rsp),%rsi
  6320c6:	call   *0x441aec(%rip)        # a73bb8 <_DYNAMIC+0xd68>
  6320cc:	lea    0xa8(%rsp),%rdi
  6320d4:	lea    0xe0(%rsp),%rsi
  6320dc:	call   *0x441ade(%rip)        # a73bc0 <_DYNAMIC+0xd70>
  6320e2:	movups 0x48(%rsp),%xmm0
  6320e7:	movups 0x58(%rsp),%xmm1
  6320ec:	movups 0x68(%rsp),%xmm2
  6320f1:	movaps %xmm2,0x290(%rsp)
  6320f9:	movaps %xmm1,0x280(%rsp)
  632101:	movaps %xmm0,0x270(%rsp)
  632109:	movups 0x78(%rsp),%xmm0
  63210e:	movups 0x88(%rsp),%xmm1
  632116:	movups 0x98(%rsp),%xmm2
  63211e:	movaps %xmm2,0x2c0(%rsp)
  632126:	movaps %xmm1,0x2b0(%rsp)
  63212e:	movaps %xmm0,0x2a0(%rsp)
  632136:	movups 0x240(%rsp),%xmm0
  63213e:	movups 0x250(%rsp),%xmm1
  632146:	movups 0x260(%rsp),%xmm2
  63214e:	movaps %xmm2,0x130(%rsp)
  632156:	movaps %xmm1,0x120(%rsp)
  63215e:	movaps %xmm0,0x110(%rsp)
  632166:	movdqu (%rbx),%xmm0
  63216a:	movups 0x10(%rbx),%xmm1
  63216e:	movups 0x20(%rbx),%xmm2
  632172:	movaps %xmm2,0x30(%rsp)
  632177:	movaps %xmm1,0x20(%rsp)
  63217c:	movdqa %xmm0,0x10(%rsp)
  632182:	lea    0x2d0(%rsp),%rdi
  63218a:	lea    0x310(%rsp),%rsi
  632192:	lea    0xa8(%rsp),%rdx
  63219a:	call   *0x441a28(%rip)        # a73bc8 <_DYNAMIC+0xd78>
  6321a0:	movaps 0x270(%rsp),%xmm0
  6321a8:	movaps 0x280(%rsp),%xmm1
  6321b0:	movaps 0x290(%rsp),%xmm2
  6321b8:	movaps %xmm2,0x1a0(%rsp)
  6321c0:	movaps %xmm1,0x190(%rsp)
  6321c8:	movaps %xmm0,0x180(%rsp)
  6321d0:	movaps 0x2a0(%rsp),%xmm0
  6321d8:	movaps 0x2b0(%rsp),%xmm1
  6321e0:	movaps 0x2c0(%rsp),%xmm2
  6321e8:	movaps %xmm0,0x1b0(%rsp)
  6321f0:	movaps %xmm1,0x1c0(%rsp)
  6321f8:	movaps %xmm2,0x1d0(%rsp)
  632200:	movups 0x240(%rsp),%xmm0
  632208:	movups 0x250(%rsp),%xmm1
  632210:	movups 0x260(%rsp),%xmm2
  632218:	movaps %xmm0,0x1e0(%rsp)
  632220:	movaps %xmm1,0x1f0(%rsp)
  632228:	movaps %xmm2,0x200(%rsp)
  632230:	movaps 0x10(%rsp),%xmm0
  632235:	movaps 0x20(%rsp),%xmm1
  63223a:	movaps 0x30(%rsp),%xmm2
  63223f:	movaps %xmm2,0x230(%rsp)
  632247:	movaps %xmm1,0x220(%rsp)
  63224f:	movaps %xmm0,0x210(%rsp)
  632257:	movdqu 0x2d0(%rsp),%xmm0
  632260:	movups 0x2e0(%rsp),%xmm1
  632268:	movups 0x2f0(%rsp),%xmm2
  632270:	movups 0x300(%rsp),%xmm3
  632278:	movdqa %xmm0,0x140(%rsp)
  632281:	movaps %xmm1,0x150(%rsp)
  632289:	movaps %xmm2,0x160(%rsp)
  632291:	movaps %xmm3,0x170(%rsp)
  632299:	lea    0x140(%rsp),%rsi
  6322a1:	mov    $0x100,%edx
  6322a6:	mov    %r14,%rdi
  6322a9:	call   *0x440eb1(%rip)        # a73160 <memcpy@GLIBC_2.14>
  6322af:	mov    0xb0(%rsp),%r15
  6322b7:	test   %r15,%r15
  6322ba:	je     632373 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  6322c0:	mov    %rbx,0x8(%rsp)
  6322c5:	mov    0xc0(%rsp),%r12
  6322cd:	test   %r12,%r12
  6322d0:	je     632340 <hyperpath::routing::certify_differential_pair_skew+0x590>
  6322d2:	mov    0xa8(%rsp),%r13
  6322da:	movdqa 0x0(%r13),%xmm0
  6322e0:	lea    0x10(%r13),%rbp
  6322e4:	pmovmskb %xmm0,%ebx
  6322e8:	not    %ebx
  6322ea:	nopw   0x0(%rax,%rax,1)
  6322f0:	test   %bx,%bx
  6322f3:	jne    63231c <hyperpath::routing::certify_differential_pair_skew+0x56c>
  6322f5:	data16 cs nopw 0x0(%rax,%rax,1)
  632300:	movdqa 0x0(%rbp),%xmm0
  632305:	add    $0xfffffffffffffc80,%r13
  63230c:	add    $0x10,%rbp
  632310:	pmovmskb %xmm0,%ebx
  632314:	xor    $0xffff,%ebx
  63231a:	je     632300 <hyperpath::routing::certify_differential_pair_skew+0x550>
  63231c:	tzcnt  %ebx,%eax
  632320:	neg    %rax
  632323:	imul   $0x38,%rax,%rax
  632327:	lea    (%rax,%r13,1),%rdi
  63232b:	add    $0xffffffffffffffd0,%rdi
  63232f:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632334:	lea    -0x1(%rbx),%eax
  632337:	and    %ebx,%eax
  632339:	mov    %eax,%ebx
  63233b:	dec    %r12
  63233e:	jne    6322f0 <hyperpath::routing::certify_differential_pair_skew+0x540>
  632340:	imul   $0x38,%r15,%rax
  632344:	add    $0x47,%rax
  632348:	and    $0xfffffffffffffff0,%rax
  63234c:	add    %rax,%r15
  63234f:	add    $0x11,%r15
  632353:	mov    0x8(%rsp),%rbx
  632358:	je     632373 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  63235a:	mov    0xa8(%rsp),%rdi
  632362:	sub    %rax,%rdi
  632365:	mov    $0x10,%edx
  63236a:	mov    %r15,%rsi
  63236d:	call   *0x440d2d(%rip)        # a730a0 <_DYNAMIC+0x250>
  632373:	xor    %ebp,%ebp
  632375:	lea    0x310(%rsp),%rdi
  63237d:	call   626d50 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  632382:	lea    0xe0(%rsp),%rdi
  63238a:	call   626320 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  63238f:	jmp    631e1b <hyperpath::routing::certify_differential_pair_skew+0x6b>
  632394:	mov    %rbx,0x8(%rsp)
  632399:	mov    %rax,%r14
  63239c:	lea    0x10(%rsp),%rdi
  6323a1:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  6323a6:	lea    0x110(%rsp),%rdi
  6323ae:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  6323b3:	lea    0x2a0(%rsp),%rdi
  6323bb:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  6323c0:	lea    0x270(%rsp),%rdi
  6323c8:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  6323cd:	lea    0xa8(%rsp),%rdi
  6323d5:	call   626c70 <core::ptr::drop_in_place<hypersolve::eval::EvaluationContext>>
  6323da:	jmp    6324cb <hyperpath::routing::certify_differential_pair_skew+0x71b>
  6323df:	mov    %rbx,0x8(%rsp)
  6323e4:	mov    %rax,%r14
  6323e7:	mov    $0x1,%bpl
  6323ea:	jmp    6324cd <hyperpath::routing::certify_differential_pair_skew+0x71d>
  6323ef:	mov    %rbx,0x8(%rsp)
  6323f4:	mov    %rax,%r14
  6323f7:	lea    0xa8(%rsp),%rdi
  6323ff:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632404:	mov    $0x1,%bpl
  632407:	jmp    6324da <hyperpath::routing::certify_differential_pair_skew+0x72a>
  63240c:	call   *0x440d3e(%rip)        # a73150 <_DYNAMIC+0x300>
  632412:	mov    %rbx,0x8(%rsp)
  632417:	mov    %rax,%r14
  63241a:	lea    0x10(%rsp),%rdi
  63241f:	call   626450 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  632424:	jmp    63242e <hyperpath::routing::certify_differential_pair_skew+0x67e>
  632426:	mov    %rbx,0x8(%rsp)
  63242b:	mov    %rax,%r14
  63242e:	mov    $0x1,%bpl
  632431:	lea    0x110(%rsp),%rdi
  632439:	call   626450 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  63243e:	jmp    6324da <hyperpath::routing::certify_differential_pair_skew+0x72a>
  632443:	jmp    63248d <hyperpath::routing::certify_differential_pair_skew+0x6dd>
  632445:	mov    %rbx,0x8(%rsp)
  63244a:	mov    %rax,%r14
  63244d:	jmp    632464 <hyperpath::routing::certify_differential_pair_skew+0x6b4>
  63244f:	mov    %rbx,0x8(%rsp)
  632454:	mov    %rax,%r14
  632457:	lea    0x140(%rsp),%rdi
  63245f:	call   5a2660 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632464:	lea    0x310(%rsp),%rdi
  63246c:	call   5a2660 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632471:	jmp    6324f9 <hyperpath::routing::certify_differential_pair_skew+0x749>
  632476:	mov    %rbx,0x8(%rsp)
  63247b:	mov    %rax,%r14
  63247e:	lea    0x310(%rsp),%rdi
  632486:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63248b:	jmp    6324f9 <hyperpath::routing::certify_differential_pair_skew+0x749>
  63248d:	mov    %rbx,0x8(%rsp)
  632492:	mov    %rax,%r14
  632495:	jmp    6324f9 <hyperpath::routing::certify_differential_pair_skew+0x749>
  632497:	call   *0x440cb3(%rip)        # a73150 <_DYNAMIC+0x300>
  63249d:	mov    %rbx,0x8(%rsp)
  6324a2:	mov    %rax,%r14
  6324a5:	mov    $0x1,%bpl
  6324a8:	jmp    6324da <hyperpath::routing::certify_differential_pair_skew+0x72a>
  6324aa:	mov    %rbx,0x8(%rsp)
  6324af:	mov    %rax,%r14
  6324b2:	jmp    632503 <hyperpath::routing::certify_differential_pair_skew+0x753>
  6324b4:	mov    %rbx,0x8(%rsp)
  6324b9:	mov    %rax,%r14
  6324bc:	jmp    6324da <hyperpath::routing::certify_differential_pair_skew+0x72a>
  6324be:	mov    %rbx,0x8(%rsp)
  6324c3:	mov    %rax,%r14
  6324c6:	jmp    63250d <hyperpath::routing::certify_differential_pair_skew+0x75d>
  6324c8:	mov    %rax,%r14
  6324cb:	xor    %ebp,%ebp
  6324cd:	lea    0x310(%rsp),%rdi
  6324d5:	call   626d50 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  6324da:	lea    0xe0(%rsp),%rdi
  6324e2:	call   626320 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  6324e7:	test   %bpl,%bpl
  6324ea:	je     632517 <hyperpath::routing::certify_differential_pair_skew+0x767>
  6324ec:	lea    0x240(%rsp),%rdi
  6324f4:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  6324f9:	lea    0x78(%rsp),%rdi
  6324fe:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632503:	lea    0x48(%rsp),%rdi
  632508:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63250d:	mov    0x8(%rsp),%rdi
  632512:	call   6268d0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632517:	mov    %r14,%rdi
  63251a:	call   a2c590 <_Unwind_Resume@plt>
  63251f:	call   *0x440c2b(%rip)        # a73150 <_DYNAMIC+0x300>
