
/tmp/interval-refactor/dynamics-cost-binaries/whole-control:     file format elf64-x86-64


Disassembly of section .text:

000000000067d1e0 <hyperpath::routing::certify_differential_pair_skew>:
  67d1e0:	push   %rbp
  67d1e1:	push   %r15
  67d1e3:	push   %r14
  67d1e5:	push   %r13
  67d1e7:	push   %r12
  67d1e9:	push   %rbx
  67d1ea:	sub    $0x3f8,%rsp
  67d1f1:	mov    %r9,%rbx
  67d1f4:	mov    %rdi,%r14
  67d1f7:	test   %rdx,%rdx
  67d1fa:	je     67d231 <hyperpath::routing::certify_differential_pair_skew+0x51>
  67d1fc:	mov    %r8,%r15
  67d1ff:	test   %r8,%r8
  67d202:	je     67d231 <hyperpath::routing::certify_differential_pair_skew+0x51>
  67d204:	mov    %rcx,%r12
  67d207:	movzbl 0x430(%rsp),%ebp
  67d20f:	lea    0x140(%rsp),%rdi
  67d217:	mov    %ebp,%ecx
  67d219:	call   675ad0 <hyperpath::routing::route_axis_length>
  67d21e:	movzbl 0x140(%rsp),%eax
  67d226:	cmp    $0x16,%al
  67d228:	jne    67d260 <hyperpath::routing::certify_differential_pair_skew+0x80>
  67d22a:	movb   $0x1,0x8(%r14)
  67d22f:	jmp    67d236 <hyperpath::routing::certify_differential_pair_skew+0x56>
  67d231:	movb   $0x0,0x8(%r14)
  67d236:	movabs $0x8000000000000000,%rax
  67d240:	mov    %rax,(%r14)
  67d243:	mov    %rbx,%rdi
  67d246:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d24b:	mov    %r14,%rax
  67d24e:	add    $0x3f8,%rsp
  67d255:	pop    %rbx
  67d256:	pop    %r12
  67d258:	pop    %r13
  67d25a:	pop    %r14
  67d25c:	pop    %r15
  67d25e:	pop    %rbp
  67d25f:	ret
  67d260:	movzbl 0x141(%rsp),%ecx
  67d268:	movups 0x142(%rsp),%xmm0
  67d270:	movups %xmm0,0x4a(%rsp)
  67d275:	movups 0x152(%rsp),%xmm0
  67d27d:	movups %xmm0,0x5a(%rsp)
  67d282:	movdqu 0x160(%rsp),%xmm0
  67d28b:	movdqu %xmm0,0x68(%rsp)
  67d291:	mov    %al,0x48(%rsp)
  67d295:	mov    %cl,0x49(%rsp)
  67d299:	lea    0x140(%rsp),%rdi
  67d2a1:	mov    %r12,%rsi
  67d2a4:	mov    %r15,%rdx
  67d2a7:	mov    %ebp,%ecx
  67d2a9:	call   675ad0 <hyperpath::routing::route_axis_length>
  67d2ae:	movzbl 0x140(%rsp),%eax
  67d2b6:	cmp    $0x16,%al
  67d2b8:	jne    67d2db <hyperpath::routing::certify_differential_pair_skew+0xfb>
  67d2ba:	movb   $0x1,0x8(%r14)
  67d2bf:	movabs $0x8000000000000000,%rax
  67d2c9:	mov    %rax,(%r14)
  67d2cc:	lea    0x48(%rsp),%rdi
  67d2d1:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d2d6:	jmp    67d243 <hyperpath::routing::certify_differential_pair_skew+0x63>
  67d2db:	movzbl 0x141(%rsp),%ecx
  67d2e3:	movups 0x142(%rsp),%xmm0
  67d2eb:	movups %xmm0,0x7a(%rsp)
  67d2f0:	movups 0x152(%rsp),%xmm0
  67d2f8:	movups %xmm0,0x8a(%rsp)
  67d300:	movdqu 0x160(%rsp),%xmm0
  67d309:	movdqu %xmm0,0x98(%rsp)
  67d312:	mov    %al,0x78(%rsp)
  67d316:	mov    %cl,0x79(%rsp)
  67d31a:	lea    0x310(%rsp),%rdi
  67d322:	lea    0x48(%rsp),%rsi
  67d327:	call   6715d0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  67d32c:	lea    0x140(%rsp),%rdi
  67d334:	lea    0x78(%rsp),%rsi
  67d339:	call   6715d0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  67d33e:	lea    0x240(%rsp),%rdi
  67d346:	lea    0x310(%rsp),%rsi
  67d34e:	lea    0x140(%rsp),%rdx
  67d356:	call   61ce50 <<&hyperreal::real::arithmetic::Real as core::ops::arith::Sub<T>>::sub>
  67d35b:	lea    0x140(%rsp),%rdi
  67d363:	call   6143a0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d368:	lea    0x310(%rsp),%rdi
  67d370:	call   6143a0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d375:	movq   $0x0,0xe0(%rsp)
  67d381:	movq   $0x8,0xe8(%rsp)
  67d38d:	pxor   %xmm0,%xmm0
  67d391:	movdqu %xmm0,0xf0(%rsp)
  67d39a:	movq   $0x8,0x100(%rsp)
  67d3a6:	movq   $0x0,0x108(%rsp)
  67d3b2:	mov    $0x1,%bpl
  67d3b5:	lea    0x140(%rsp),%rdi
  67d3bd:	lea    0x48(%rsp),%rsi
  67d3c2:	call   6715d0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  67d3c7:	movdqu 0x140(%rsp),%xmm0
  67d3d0:	movups 0x150(%rsp),%xmm1
  67d3d8:	movups 0x160(%rsp),%xmm2
  67d3e0:	movaps %xmm2,0x130(%rsp)
  67d3e8:	movaps %xmm1,0x120(%rsp)
  67d3f0:	movdqa %xmm0,0x110(%rsp)
  67d3f9:	lea    0x140(%rsp),%rdi
  67d401:	lea    0x78(%rsp),%rsi
  67d406:	call   6715d0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  67d40b:	movdqu 0x140(%rsp),%xmm0
  67d414:	movups 0x150(%rsp),%xmm1
  67d41c:	movups 0x160(%rsp),%xmm2
  67d424:	movaps %xmm2,0x30(%rsp)
  67d429:	movaps %xmm1,0x20(%rsp)
  67d42e:	movdqa %xmm0,0x10(%rsp)
  67d434:	lea    0xa8(%rsp),%rdi
  67d43c:	mov    %rbx,%rsi
  67d43f:	call   6715d0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  67d444:	lea    0x310(%rsp),%rdi
  67d44c:	lea    0x110(%rsp),%rsi
  67d454:	lea    0x10(%rsp),%rdx
  67d459:	call   *0x413519(%rip)        # a90978 <_DYNAMIC+0xd50>
  67d45f:	movdqu 0xa8(%rsp),%xmm0
  67d468:	movups 0xb8(%rsp),%xmm1
  67d470:	movups 0xc8(%rsp),%xmm2
  67d478:	movaps %xmm2,0x160(%rsp)
  67d480:	movaps %xmm1,0x150(%rsp)
  67d488:	movdqa %xmm0,0x140(%rsp)
  67d491:	lea    0x2d0(%rsp),%rdi
  67d499:	lea    0x310(%rsp),%rsi
  67d4a1:	lea    0x140(%rsp),%rdx
  67d4a9:	call   *0x4134c9(%rip)        # a90978 <_DYNAMIC+0xd50>
  67d4af:	lea    -0x523032(%rip),%rsi        # 15a484 <anon.03668e7bfaf57f21a2a56c7c1cd8f8da.40.llvm.8524560342600865291+0x29e>
  67d4b6:	lea    0x140(%rsp),%rdi
  67d4be:	lea    0x2d0(%rsp),%rcx
  67d4c6:	mov    $0x16,%edx
  67d4cb:	call   623d70 <hypersolve::model::Constraint::equality>
  67d4d0:	lea    0xe0(%rsp),%rdi
  67d4d8:	lea    0x140(%rsp),%rsi
  67d4e0:	call   *0x4134a2(%rip)        # a90988 <_DYNAMIC+0xd60>
  67d4e6:	lea    0x310(%rsp),%rdi
  67d4ee:	lea    0xe0(%rsp),%rsi
  67d4f6:	call   *0x413494(%rip)        # a90990 <_DYNAMIC+0xd68>
  67d4fc:	lea    0xa8(%rsp),%rdi
  67d504:	lea    0xe0(%rsp),%rsi
  67d50c:	call   *0x413486(%rip)        # a90998 <_DYNAMIC+0xd70>
  67d512:	movups 0x48(%rsp),%xmm0
  67d517:	movups 0x58(%rsp),%xmm1
  67d51c:	movups 0x68(%rsp),%xmm2
  67d521:	movaps %xmm2,0x290(%rsp)
  67d529:	movaps %xmm1,0x280(%rsp)
  67d531:	movaps %xmm0,0x270(%rsp)
  67d539:	movups 0x78(%rsp),%xmm0
  67d53e:	movups 0x88(%rsp),%xmm1
  67d546:	movups 0x98(%rsp),%xmm2
  67d54e:	movaps %xmm2,0x2c0(%rsp)
  67d556:	movaps %xmm1,0x2b0(%rsp)
  67d55e:	movaps %xmm0,0x2a0(%rsp)
  67d566:	movups 0x240(%rsp),%xmm0
  67d56e:	movups 0x250(%rsp),%xmm1
  67d576:	movups 0x260(%rsp),%xmm2
  67d57e:	movaps %xmm2,0x130(%rsp)
  67d586:	movaps %xmm1,0x120(%rsp)
  67d58e:	movaps %xmm0,0x110(%rsp)
  67d596:	movdqu (%rbx),%xmm0
  67d59a:	movups 0x10(%rbx),%xmm1
  67d59e:	movups 0x20(%rbx),%xmm2
  67d5a2:	movaps %xmm2,0x30(%rsp)
  67d5a7:	movaps %xmm1,0x20(%rsp)
  67d5ac:	movdqa %xmm0,0x10(%rsp)
  67d5b2:	lea    0x2d0(%rsp),%rdi
  67d5ba:	lea    0x310(%rsp),%rsi
  67d5c2:	lea    0xa8(%rsp),%rdx
  67d5ca:	call   *0x4133d0(%rip)        # a909a0 <_DYNAMIC+0xd78>
  67d5d0:	movaps 0x270(%rsp),%xmm0
  67d5d8:	movaps 0x280(%rsp),%xmm1
  67d5e0:	movaps 0x290(%rsp),%xmm2
  67d5e8:	movaps %xmm2,0x1a0(%rsp)
  67d5f0:	movaps %xmm1,0x190(%rsp)
  67d5f8:	movaps %xmm0,0x180(%rsp)
  67d600:	movaps 0x2a0(%rsp),%xmm0
  67d608:	movaps 0x2b0(%rsp),%xmm1
  67d610:	movaps 0x2c0(%rsp),%xmm2
  67d618:	movaps %xmm0,0x1b0(%rsp)
  67d620:	movaps %xmm1,0x1c0(%rsp)
  67d628:	movaps %xmm2,0x1d0(%rsp)
  67d630:	movups 0x240(%rsp),%xmm0
  67d638:	movups 0x250(%rsp),%xmm1
  67d640:	movups 0x260(%rsp),%xmm2
  67d648:	movaps %xmm0,0x1e0(%rsp)
  67d650:	movaps %xmm1,0x1f0(%rsp)
  67d658:	movaps %xmm2,0x200(%rsp)
  67d660:	movaps 0x10(%rsp),%xmm0
  67d665:	movaps 0x20(%rsp),%xmm1
  67d66a:	movaps 0x30(%rsp),%xmm2
  67d66f:	movaps %xmm2,0x230(%rsp)
  67d677:	movaps %xmm1,0x220(%rsp)
  67d67f:	movaps %xmm0,0x210(%rsp)
  67d687:	movdqu 0x2d0(%rsp),%xmm0
  67d690:	movups 0x2e0(%rsp),%xmm1
  67d698:	movups 0x2f0(%rsp),%xmm2
  67d6a0:	movups 0x300(%rsp),%xmm3
  67d6a8:	movdqa %xmm0,0x140(%rsp)
  67d6b1:	movaps %xmm1,0x150(%rsp)
  67d6b9:	movaps %xmm2,0x160(%rsp)
  67d6c1:	movaps %xmm3,0x170(%rsp)
  67d6c9:	lea    0x140(%rsp),%rsi
  67d6d1:	mov    $0x100,%edx
  67d6d6:	mov    %r14,%rdi
  67d6d9:	call   *0x412859(%rip)        # a8ff38 <memcpy@GLIBC_2.14>
  67d6df:	mov    0xb0(%rsp),%r15
  67d6e7:	test   %r15,%r15
  67d6ea:	je     67d7a3 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  67d6f0:	mov    %rbx,0x8(%rsp)
  67d6f5:	mov    0xc0(%rsp),%r12
  67d6fd:	test   %r12,%r12
  67d700:	je     67d770 <hyperpath::routing::certify_differential_pair_skew+0x590>
  67d702:	mov    0xa8(%rsp),%r13
  67d70a:	movdqa 0x0(%r13),%xmm0
  67d710:	lea    0x10(%r13),%rbp
  67d714:	pmovmskb %xmm0,%ebx
  67d718:	not    %ebx
  67d71a:	nopw   0x0(%rax,%rax,1)
  67d720:	test   %bx,%bx
  67d723:	jne    67d74c <hyperpath::routing::certify_differential_pair_skew+0x56c>
  67d725:	data16 cs nopw 0x0(%rax,%rax,1)
  67d730:	movdqa 0x0(%rbp),%xmm0
  67d735:	add    $0xfffffffffffffc80,%r13
  67d73c:	add    $0x10,%rbp
  67d740:	pmovmskb %xmm0,%ebx
  67d744:	xor    $0xffff,%ebx
  67d74a:	je     67d730 <hyperpath::routing::certify_differential_pair_skew+0x550>
  67d74c:	tzcnt  %ebx,%eax
  67d750:	neg    %rax
  67d753:	imul   $0x38,%rax,%rax
  67d757:	lea    (%rax,%r13,1),%rdi
  67d75b:	add    $0xffffffffffffffd0,%rdi
  67d75f:	call   5afa10 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d764:	lea    -0x1(%rbx),%eax
  67d767:	and    %ebx,%eax
  67d769:	mov    %eax,%ebx
  67d76b:	dec    %r12
  67d76e:	jne    67d720 <hyperpath::routing::certify_differential_pair_skew+0x540>
  67d770:	imul   $0x38,%r15,%rax
  67d774:	add    $0x47,%rax
  67d778:	and    $0xfffffffffffffff0,%rax
  67d77c:	add    %rax,%r15
  67d77f:	add    $0x11,%r15
  67d783:	mov    0x8(%rsp),%rbx
  67d788:	je     67d7a3 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  67d78a:	mov    0xa8(%rsp),%rdi
  67d792:	sub    %rax,%rdi
  67d795:	mov    $0x10,%edx
  67d79a:	mov    %r15,%rsi
  67d79d:	call   *0x4126d5(%rip)        # a8fe78 <_DYNAMIC+0x250>
  67d7a3:	xor    %ebp,%ebp
  67d7a5:	lea    0x310(%rsp),%rdi
  67d7ad:	call   66fb90 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  67d7b2:	lea    0xe0(%rsp),%rdi
  67d7ba:	call   66f140 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  67d7bf:	jmp    67d24b <hyperpath::routing::certify_differential_pair_skew+0x6b>
  67d7c4:	mov    %rbx,0x8(%rsp)
  67d7c9:	mov    %rax,%r14
  67d7cc:	lea    0x10(%rsp),%rdi
  67d7d1:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d7d6:	lea    0x110(%rsp),%rdi
  67d7de:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d7e3:	lea    0x2a0(%rsp),%rdi
  67d7eb:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d7f0:	lea    0x270(%rsp),%rdi
  67d7f8:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d7fd:	lea    0xa8(%rsp),%rdi
  67d805:	call   5c0090 <<hashbrown::raw::RawTable<T,A> as core::ops::drop::Drop>::drop>
  67d80a:	jmp    67d8fb <hyperpath::routing::certify_differential_pair_skew+0x71b>
  67d80f:	mov    %rbx,0x8(%rsp)
  67d814:	mov    %rax,%r14
  67d817:	mov    $0x1,%bpl
  67d81a:	jmp    67d8fd <hyperpath::routing::certify_differential_pair_skew+0x71d>
  67d81f:	mov    %rbx,0x8(%rsp)
  67d824:	mov    %rax,%r14
  67d827:	lea    0xa8(%rsp),%rdi
  67d82f:	call   5d6fa0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d834:	mov    $0x1,%bpl
  67d837:	jmp    67d90a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  67d83c:	call   *0x4126e6(%rip)        # a8ff28 <_DYNAMIC+0x300>
  67d842:	mov    %rbx,0x8(%rsp)
  67d847:	mov    %rax,%r14
  67d84a:	lea    0x10(%rsp),%rdi
  67d84f:	call   66f270 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  67d854:	jmp    67d85e <hyperpath::routing::certify_differential_pair_skew+0x67e>
  67d856:	mov    %rbx,0x8(%rsp)
  67d85b:	mov    %rax,%r14
  67d85e:	mov    $0x1,%bpl
  67d861:	lea    0x110(%rsp),%rdi
  67d869:	call   66f270 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  67d86e:	jmp    67d90a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  67d873:	jmp    67d8bd <hyperpath::routing::certify_differential_pair_skew+0x6dd>
  67d875:	mov    %rbx,0x8(%rsp)
  67d87a:	mov    %rax,%r14
  67d87d:	jmp    67d894 <hyperpath::routing::certify_differential_pair_skew+0x6b4>
  67d87f:	mov    %rbx,0x8(%rsp)
  67d884:	mov    %rax,%r14
  67d887:	lea    0x140(%rsp),%rdi
  67d88f:	call   6143a0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d894:	lea    0x310(%rsp),%rdi
  67d89c:	call   6143a0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d8a1:	jmp    67d929 <hyperpath::routing::certify_differential_pair_skew+0x749>
  67d8a6:	mov    %rbx,0x8(%rsp)
  67d8ab:	mov    %rax,%r14
  67d8ae:	lea    0x310(%rsp),%rdi
  67d8b6:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d8bb:	jmp    67d929 <hyperpath::routing::certify_differential_pair_skew+0x749>
  67d8bd:	mov    %rbx,0x8(%rsp)
  67d8c2:	mov    %rax,%r14
  67d8c5:	jmp    67d929 <hyperpath::routing::certify_differential_pair_skew+0x749>
  67d8c7:	call   *0x41265b(%rip)        # a8ff28 <_DYNAMIC+0x300>
  67d8cd:	mov    %rbx,0x8(%rsp)
  67d8d2:	mov    %rax,%r14
  67d8d5:	mov    $0x1,%bpl
  67d8d8:	jmp    67d90a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  67d8da:	mov    %rbx,0x8(%rsp)
  67d8df:	mov    %rax,%r14
  67d8e2:	jmp    67d933 <hyperpath::routing::certify_differential_pair_skew+0x753>
  67d8e4:	mov    %rbx,0x8(%rsp)
  67d8e9:	mov    %rax,%r14
  67d8ec:	jmp    67d90a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  67d8ee:	mov    %rbx,0x8(%rsp)
  67d8f3:	mov    %rax,%r14
  67d8f6:	jmp    67d93d <hyperpath::routing::certify_differential_pair_skew+0x75d>
  67d8f8:	mov    %rax,%r14
  67d8fb:	xor    %ebp,%ebp
  67d8fd:	lea    0x310(%rsp),%rdi
  67d905:	call   66fb90 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  67d90a:	lea    0xe0(%rsp),%rdi
  67d912:	call   66f140 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  67d917:	test   %bpl,%bpl
  67d91a:	je     67d947 <hyperpath::routing::certify_differential_pair_skew+0x767>
  67d91c:	lea    0x240(%rsp),%rdi
  67d924:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d929:	lea    0x78(%rsp),%rdi
  67d92e:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d933:	lea    0x48(%rsp),%rdi
  67d938:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d93d:	mov    0x8(%rsp),%rdi
  67d942:	call   66f700 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  67d947:	mov    %r14,%rdi
  67d94a:	call   a49140 <_Unwind_Resume@plt>
  67d94f:	call   *0x4125d3(%rip)        # a8ff28 <_DYNAMIC+0x300>
