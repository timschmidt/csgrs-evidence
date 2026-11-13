
/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a:     file format elf64-x86-64


Disassembly of section .text:

00000000005d6170 <hyperpath::routing::certify_differential_pair_skew>:
  5d6170:	push   %rbp
  5d6171:	push   %r15
  5d6173:	push   %r14
  5d6175:	push   %r13
  5d6177:	push   %r12
  5d6179:	push   %rbx
  5d617a:	sub    $0x3f8,%rsp
  5d6181:	mov    %r9,%rbx
  5d6184:	mov    %rdi,%r14
  5d6187:	test   %rdx,%rdx
  5d618a:	je     5d61c1 <hyperpath::routing::certify_differential_pair_skew+0x51>
  5d618c:	mov    %r8,%r15
  5d618f:	test   %r8,%r8
  5d6192:	je     5d61c1 <hyperpath::routing::certify_differential_pair_skew+0x51>
  5d6194:	mov    %rcx,%r12
  5d6197:	movzbl 0x430(%rsp),%ebp
  5d619f:	lea    0x140(%rsp),%rdi
  5d61a7:	mov    %ebp,%ecx
  5d61a9:	call   5cea70 <hyperpath::routing::route_axis_length>
  5d61ae:	movzbl 0x140(%rsp),%eax
  5d61b6:	cmp    $0x16,%al
  5d61b8:	jne    5d61f0 <hyperpath::routing::certify_differential_pair_skew+0x80>
  5d61ba:	movb   $0x1,0x8(%r14)
  5d61bf:	jmp    5d61c6 <hyperpath::routing::certify_differential_pair_skew+0x56>
  5d61c1:	movb   $0x0,0x8(%r14)
  5d61c6:	movabs $0x8000000000000000,%rax
  5d61d0:	mov    %rax,(%r14)
  5d61d3:	mov    %rbx,%rdi
  5d61d6:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d61db:	mov    %r14,%rax
  5d61de:	add    $0x3f8,%rsp
  5d61e5:	pop    %rbx
  5d61e6:	pop    %r12
  5d61e8:	pop    %r13
  5d61ea:	pop    %r14
  5d61ec:	pop    %r15
  5d61ee:	pop    %rbp
  5d61ef:	ret
  5d61f0:	movzbl 0x141(%rsp),%ecx
  5d61f8:	movups 0x142(%rsp),%xmm0
  5d6200:	movups %xmm0,0x4a(%rsp)
  5d6205:	movups 0x152(%rsp),%xmm0
  5d620d:	movups %xmm0,0x5a(%rsp)
  5d6212:	movdqu 0x160(%rsp),%xmm0
  5d621b:	movdqu %xmm0,0x68(%rsp)
  5d6221:	mov    %al,0x48(%rsp)
  5d6225:	mov    %cl,0x49(%rsp)
  5d6229:	lea    0x140(%rsp),%rdi
  5d6231:	mov    %r12,%rsi
  5d6234:	mov    %r15,%rdx
  5d6237:	mov    %ebp,%ecx
  5d6239:	call   5cea70 <hyperpath::routing::route_axis_length>
  5d623e:	movzbl 0x140(%rsp),%eax
  5d6246:	cmp    $0x16,%al
  5d6248:	jne    5d626b <hyperpath::routing::certify_differential_pair_skew+0xfb>
  5d624a:	movb   $0x1,0x8(%r14)
  5d624f:	movabs $0x8000000000000000,%rax
  5d6259:	mov    %rax,(%r14)
  5d625c:	lea    0x48(%rsp),%rdi
  5d6261:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6266:	jmp    5d61d3 <hyperpath::routing::certify_differential_pair_skew+0x63>
  5d626b:	movzbl 0x141(%rsp),%ecx
  5d6273:	movups 0x142(%rsp),%xmm0
  5d627b:	movups %xmm0,0x7a(%rsp)
  5d6280:	movups 0x152(%rsp),%xmm0
  5d6288:	movups %xmm0,0x8a(%rsp)
  5d6290:	movdqu 0x160(%rsp),%xmm0
  5d6299:	movdqu %xmm0,0x98(%rsp)
  5d62a2:	mov    %al,0x78(%rsp)
  5d62a6:	mov    %cl,0x79(%rsp)
  5d62aa:	lea    0x310(%rsp),%rdi
  5d62b2:	lea    0x48(%rsp),%rsi
  5d62b7:	call   5cc290 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d62bc:	lea    0x140(%rsp),%rdi
  5d62c4:	lea    0x78(%rsp),%rsi
  5d62c9:	call   5cc290 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d62ce:	lea    0x240(%rsp),%rdi
  5d62d6:	lea    0x310(%rsp),%rsi
  5d62de:	lea    0x140(%rsp),%rdx
  5d62e6:	call   5b34b0 <<&hyperreal::real::arithmetic::Real as core::ops::arith::Sub<T>>::sub>
  5d62eb:	lea    0x140(%rsp),%rdi
  5d62f3:	call   5aa6b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d62f8:	lea    0x310(%rsp),%rdi
  5d6300:	call   5aa6b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6305:	movq   $0x0,0xe0(%rsp)
  5d6311:	movq   $0x8,0xe8(%rsp)
  5d631d:	pxor   %xmm0,%xmm0
  5d6321:	movdqu %xmm0,0xf0(%rsp)
  5d632a:	movq   $0x8,0x100(%rsp)
  5d6336:	movq   $0x0,0x108(%rsp)
  5d6342:	mov    $0x1,%bpl
  5d6345:	lea    0x140(%rsp),%rdi
  5d634d:	lea    0x48(%rsp),%rsi
  5d6352:	call   5cc290 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d6357:	movdqu 0x140(%rsp),%xmm0
  5d6360:	movups 0x150(%rsp),%xmm1
  5d6368:	movups 0x160(%rsp),%xmm2
  5d6370:	movaps %xmm2,0x130(%rsp)
  5d6378:	movaps %xmm1,0x120(%rsp)
  5d6380:	movdqa %xmm0,0x110(%rsp)
  5d6389:	lea    0x140(%rsp),%rdi
  5d6391:	lea    0x78(%rsp),%rsi
  5d6396:	call   5cc290 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d639b:	movdqu 0x140(%rsp),%xmm0
  5d63a4:	movups 0x150(%rsp),%xmm1
  5d63ac:	movups 0x160(%rsp),%xmm2
  5d63b4:	movaps %xmm2,0x30(%rsp)
  5d63b9:	movaps %xmm1,0x20(%rsp)
  5d63be:	movdqa %xmm0,0x10(%rsp)
  5d63c4:	lea    0xa8(%rsp),%rdi
  5d63cc:	mov    %rbx,%rsi
  5d63cf:	call   5cc290 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d63d4:	lea    0x310(%rsp),%rdi
  5d63dc:	lea    0x110(%rsp),%rsi
  5d63e4:	lea    0x10(%rsp),%rdx
  5d63e9:	call   *0x49eb31(%rip)        # a74f20 <_DYNAMIC+0xd50>
  5d63ef:	movdqu 0xa8(%rsp),%xmm0
  5d63f8:	movups 0xb8(%rsp),%xmm1
  5d6400:	movups 0xc8(%rsp),%xmm2
  5d6408:	movaps %xmm2,0x160(%rsp)
  5d6410:	movaps %xmm1,0x150(%rsp)
  5d6418:	movdqa %xmm0,0x140(%rsp)
  5d6421:	lea    0x2d0(%rsp),%rdi
  5d6429:	lea    0x310(%rsp),%rsi
  5d6431:	lea    0x140(%rsp),%rdx
  5d6439:	call   *0x49eae1(%rip)        # a74f20 <_DYNAMIC+0xd50>
  5d643f:	lea    -0x480780(%rip),%rsi        # 155cc6 <anon.c497d48d7b050c1e4e90bf3ac0f61381.20.llvm.11338702450591874704+0x4d>
  5d6446:	lea    0x140(%rsp),%rdi
  5d644e:	lea    0x2d0(%rsp),%rcx
  5d6456:	mov    $0x16,%edx
  5d645b:	call   6740a0 <hypersolve::model::Constraint::equality>
  5d6460:	lea    0xe0(%rsp),%rdi
  5d6468:	lea    0x140(%rsp),%rsi
  5d6470:	call   *0x49eaba(%rip)        # a74f30 <_DYNAMIC+0xd60>
  5d6476:	lea    0x310(%rsp),%rdi
  5d647e:	lea    0xe0(%rsp),%rsi
  5d6486:	call   *0x49eaac(%rip)        # a74f38 <_DYNAMIC+0xd68>
  5d648c:	lea    0xa8(%rsp),%rdi
  5d6494:	lea    0xe0(%rsp),%rsi
  5d649c:	call   *0x49ea9e(%rip)        # a74f40 <_DYNAMIC+0xd70>
  5d64a2:	movups 0x48(%rsp),%xmm0
  5d64a7:	movups 0x58(%rsp),%xmm1
  5d64ac:	movups 0x68(%rsp),%xmm2
  5d64b1:	movaps %xmm2,0x290(%rsp)
  5d64b9:	movaps %xmm1,0x280(%rsp)
  5d64c1:	movaps %xmm0,0x270(%rsp)
  5d64c9:	movups 0x78(%rsp),%xmm0
  5d64ce:	movups 0x88(%rsp),%xmm1
  5d64d6:	movups 0x98(%rsp),%xmm2
  5d64de:	movaps %xmm2,0x2c0(%rsp)
  5d64e6:	movaps %xmm1,0x2b0(%rsp)
  5d64ee:	movaps %xmm0,0x2a0(%rsp)
  5d64f6:	movups 0x240(%rsp),%xmm0
  5d64fe:	movups 0x250(%rsp),%xmm1
  5d6506:	movups 0x260(%rsp),%xmm2
  5d650e:	movaps %xmm2,0x130(%rsp)
  5d6516:	movaps %xmm1,0x120(%rsp)
  5d651e:	movaps %xmm0,0x110(%rsp)
  5d6526:	movdqu (%rbx),%xmm0
  5d652a:	movups 0x10(%rbx),%xmm1
  5d652e:	movups 0x20(%rbx),%xmm2
  5d6532:	movaps %xmm2,0x30(%rsp)
  5d6537:	movaps %xmm1,0x20(%rsp)
  5d653c:	movdqa %xmm0,0x10(%rsp)
  5d6542:	lea    0x2d0(%rsp),%rdi
  5d654a:	lea    0x310(%rsp),%rsi
  5d6552:	lea    0xa8(%rsp),%rdx
  5d655a:	call   *0x49e9e8(%rip)        # a74f48 <_DYNAMIC+0xd78>
  5d6560:	movaps 0x270(%rsp),%xmm0
  5d6568:	movaps 0x280(%rsp),%xmm1
  5d6570:	movaps 0x290(%rsp),%xmm2
  5d6578:	movaps %xmm2,0x1a0(%rsp)
  5d6580:	movaps %xmm1,0x190(%rsp)
  5d6588:	movaps %xmm0,0x180(%rsp)
  5d6590:	movaps 0x2a0(%rsp),%xmm0
  5d6598:	movaps 0x2b0(%rsp),%xmm1
  5d65a0:	movaps 0x2c0(%rsp),%xmm2
  5d65a8:	movaps %xmm0,0x1b0(%rsp)
  5d65b0:	movaps %xmm1,0x1c0(%rsp)
  5d65b8:	movaps %xmm2,0x1d0(%rsp)
  5d65c0:	movups 0x240(%rsp),%xmm0
  5d65c8:	movups 0x250(%rsp),%xmm1
  5d65d0:	movups 0x260(%rsp),%xmm2
  5d65d8:	movaps %xmm0,0x1e0(%rsp)
  5d65e0:	movaps %xmm1,0x1f0(%rsp)
  5d65e8:	movaps %xmm2,0x200(%rsp)
  5d65f0:	movaps 0x10(%rsp),%xmm0
  5d65f5:	movaps 0x20(%rsp),%xmm1
  5d65fa:	movaps 0x30(%rsp),%xmm2
  5d65ff:	movaps %xmm2,0x230(%rsp)
  5d6607:	movaps %xmm1,0x220(%rsp)
  5d660f:	movaps %xmm0,0x210(%rsp)
  5d6617:	movdqu 0x2d0(%rsp),%xmm0
  5d6620:	movups 0x2e0(%rsp),%xmm1
  5d6628:	movups 0x2f0(%rsp),%xmm2
  5d6630:	movups 0x300(%rsp),%xmm3
  5d6638:	movdqa %xmm0,0x140(%rsp)
  5d6641:	movaps %xmm1,0x150(%rsp)
  5d6649:	movaps %xmm2,0x160(%rsp)
  5d6651:	movaps %xmm3,0x170(%rsp)
  5d6659:	lea    0x140(%rsp),%rsi
  5d6661:	mov    $0x100,%edx
  5d6666:	mov    %r14,%rdi
  5d6669:	call   *0x49de71(%rip)        # a744e0 <memcpy@GLIBC_2.14>
  5d666f:	mov    0xb0(%rsp),%r15
  5d6677:	test   %r15,%r15
  5d667a:	je     5d6733 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  5d6680:	mov    %rbx,0x8(%rsp)
  5d6685:	mov    0xc0(%rsp),%r12
  5d668d:	test   %r12,%r12
  5d6690:	je     5d6700 <hyperpath::routing::certify_differential_pair_skew+0x590>
  5d6692:	mov    0xa8(%rsp),%r13
  5d669a:	movdqa 0x0(%r13),%xmm0
  5d66a0:	lea    0x10(%r13),%rbp
  5d66a4:	pmovmskb %xmm0,%ebx
  5d66a8:	not    %ebx
  5d66aa:	nopw   0x0(%rax,%rax,1)
  5d66b0:	test   %bx,%bx
  5d66b3:	jne    5d66dc <hyperpath::routing::certify_differential_pair_skew+0x56c>
  5d66b5:	data16 cs nopw 0x0(%rax,%rax,1)
  5d66c0:	movdqa 0x0(%rbp),%xmm0
  5d66c5:	add    $0xfffffffffffffc80,%r13
  5d66cc:	add    $0x10,%rbp
  5d66d0:	pmovmskb %xmm0,%ebx
  5d66d4:	xor    $0xffff,%ebx
  5d66da:	je     5d66c0 <hyperpath::routing::certify_differential_pair_skew+0x550>
  5d66dc:	tzcnt  %ebx,%eax
  5d66e0:	neg    %rax
  5d66e3:	imul   $0x38,%rax,%rax
  5d66e7:	lea    (%rax,%r13,1),%rdi
  5d66eb:	add    $0xffffffffffffffd0,%rdi
  5d66ef:	call   5b83b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d66f4:	lea    -0x1(%rbx),%eax
  5d66f7:	and    %ebx,%eax
  5d66f9:	mov    %eax,%ebx
  5d66fb:	dec    %r12
  5d66fe:	jne    5d66b0 <hyperpath::routing::certify_differential_pair_skew+0x540>
  5d6700:	imul   $0x38,%r15,%rax
  5d6704:	add    $0x47,%rax
  5d6708:	and    $0xfffffffffffffff0,%rax
  5d670c:	add    %rax,%r15
  5d670f:	add    $0x11,%r15
  5d6713:	mov    0x8(%rsp),%rbx
  5d6718:	je     5d6733 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  5d671a:	mov    0xa8(%rsp),%rdi
  5d6722:	sub    %rax,%rdi
  5d6725:	mov    $0x10,%edx
  5d672a:	mov    %r15,%rsi
  5d672d:	call   *0x49dced(%rip)        # a74420 <_DYNAMIC+0x250>
  5d6733:	xor    %ebp,%ebp
  5d6735:	lea    0x310(%rsp),%rdi
  5d673d:	call   5c9e30 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  5d6742:	lea    0xe0(%rsp),%rdi
  5d674a:	call   5c94e0 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  5d674f:	jmp    5d61db <hyperpath::routing::certify_differential_pair_skew+0x6b>
  5d6754:	mov    %rbx,0x8(%rsp)
  5d6759:	mov    %rax,%r14
  5d675c:	lea    0x10(%rsp),%rdi
  5d6761:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6766:	lea    0x110(%rsp),%rdi
  5d676e:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6773:	lea    0x2a0(%rsp),%rdi
  5d677b:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6780:	lea    0x270(%rsp),%rdi
  5d6788:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d678d:	lea    0xa8(%rsp),%rdi
  5d6795:	call   5c8830 <<hashbrown::raw::RawTable<T,A> as core::ops::drop::Drop>::drop>
  5d679a:	jmp    5d688b <hyperpath::routing::certify_differential_pair_skew+0x71b>
  5d679f:	mov    %rbx,0x8(%rsp)
  5d67a4:	mov    %rax,%r14
  5d67a7:	mov    $0x1,%bpl
  5d67aa:	jmp    5d688d <hyperpath::routing::certify_differential_pair_skew+0x71d>
  5d67af:	mov    %rbx,0x8(%rsp)
  5d67b4:	mov    %rax,%r14
  5d67b7:	lea    0xa8(%rsp),%rdi
  5d67bf:	call   677440 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d67c4:	mov    $0x1,%bpl
  5d67c7:	jmp    5d689a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d67cc:	call   *0x49dcfe(%rip)        # a744d0 <_DYNAMIC+0x300>
  5d67d2:	mov    %rbx,0x8(%rsp)
  5d67d7:	mov    %rax,%r14
  5d67da:	lea    0x10(%rsp),%rdi
  5d67df:	call   5c9610 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  5d67e4:	jmp    5d67ee <hyperpath::routing::certify_differential_pair_skew+0x67e>
  5d67e6:	mov    %rbx,0x8(%rsp)
  5d67eb:	mov    %rax,%r14
  5d67ee:	mov    $0x1,%bpl
  5d67f1:	lea    0x110(%rsp),%rdi
  5d67f9:	call   5c9610 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  5d67fe:	jmp    5d689a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d6803:	jmp    5d684d <hyperpath::routing::certify_differential_pair_skew+0x6dd>
  5d6805:	mov    %rbx,0x8(%rsp)
  5d680a:	mov    %rax,%r14
  5d680d:	jmp    5d6824 <hyperpath::routing::certify_differential_pair_skew+0x6b4>
  5d680f:	mov    %rbx,0x8(%rsp)
  5d6814:	mov    %rax,%r14
  5d6817:	lea    0x140(%rsp),%rdi
  5d681f:	call   5aa6b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6824:	lea    0x310(%rsp),%rdi
  5d682c:	call   5aa6b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6831:	jmp    5d68b9 <hyperpath::routing::certify_differential_pair_skew+0x749>
  5d6836:	mov    %rbx,0x8(%rsp)
  5d683b:	mov    %rax,%r14
  5d683e:	lea    0x310(%rsp),%rdi
  5d6846:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d684b:	jmp    5d68b9 <hyperpath::routing::certify_differential_pair_skew+0x749>
  5d684d:	mov    %rbx,0x8(%rsp)
  5d6852:	mov    %rax,%r14
  5d6855:	jmp    5d68b9 <hyperpath::routing::certify_differential_pair_skew+0x749>
  5d6857:	call   *0x49dc73(%rip)        # a744d0 <_DYNAMIC+0x300>
  5d685d:	mov    %rbx,0x8(%rsp)
  5d6862:	mov    %rax,%r14
  5d6865:	mov    $0x1,%bpl
  5d6868:	jmp    5d689a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d686a:	mov    %rbx,0x8(%rsp)
  5d686f:	mov    %rax,%r14
  5d6872:	jmp    5d68c3 <hyperpath::routing::certify_differential_pair_skew+0x753>
  5d6874:	mov    %rbx,0x8(%rsp)
  5d6879:	mov    %rax,%r14
  5d687c:	jmp    5d689a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d687e:	mov    %rbx,0x8(%rsp)
  5d6883:	mov    %rax,%r14
  5d6886:	jmp    5d68cd <hyperpath::routing::certify_differential_pair_skew+0x75d>
  5d6888:	mov    %rax,%r14
  5d688b:	xor    %ebp,%ebp
  5d688d:	lea    0x310(%rsp),%rdi
  5d6895:	call   5c9e30 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  5d689a:	lea    0xe0(%rsp),%rdi
  5d68a2:	call   5c94e0 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  5d68a7:	test   %bpl,%bpl
  5d68aa:	je     5d68d7 <hyperpath::routing::certify_differential_pair_skew+0x767>
  5d68ac:	lea    0x240(%rsp),%rdi
  5d68b4:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d68b9:	lea    0x78(%rsp),%rdi
  5d68be:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d68c3:	lea    0x48(%rsp),%rdi
  5d68c8:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d68cd:	mov    0x8(%rsp),%rdi
  5d68d2:	call   5c9a90 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d68d7:	mov    %r14,%rdi
  5d68da:	call   a2d970 <_Unwind_Resume@plt>
  5d68df:	call   *0x49dbeb(%rip)        # a744d0 <_DYNAMIC+0x300>
