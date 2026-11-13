
/tmp/interval-refactor/dynamics-requal-binaries/baseline:     file format elf64-x86-64


Disassembly of section .text:

00000000005d65d0 <hyperpath::routing::certify_differential_pair_skew>:
  5d65d0:	push   %rbp
  5d65d1:	push   %r15
  5d65d3:	push   %r14
  5d65d5:	push   %r13
  5d65d7:	push   %r12
  5d65d9:	push   %rbx
  5d65da:	sub    $0x3f8,%rsp
  5d65e1:	mov    %r9,%rbx
  5d65e4:	mov    %rdi,%r14
  5d65e7:	test   %rdx,%rdx
  5d65ea:	je     5d6621 <hyperpath::routing::certify_differential_pair_skew+0x51>
  5d65ec:	mov    %r8,%r15
  5d65ef:	test   %r8,%r8
  5d65f2:	je     5d6621 <hyperpath::routing::certify_differential_pair_skew+0x51>
  5d65f4:	mov    %rcx,%r12
  5d65f7:	movzbl 0x430(%rsp),%ebp
  5d65ff:	lea    0x140(%rsp),%rdi
  5d6607:	mov    %ebp,%ecx
  5d6609:	call   5ceed0 <hyperpath::routing::route_axis_length>
  5d660e:	movzbl 0x140(%rsp),%eax
  5d6616:	cmp    $0x16,%al
  5d6618:	jne    5d6650 <hyperpath::routing::certify_differential_pair_skew+0x80>
  5d661a:	movb   $0x1,0x8(%r14)
  5d661f:	jmp    5d6626 <hyperpath::routing::certify_differential_pair_skew+0x56>
  5d6621:	movb   $0x0,0x8(%r14)
  5d6626:	movabs $0x8000000000000000,%rax
  5d6630:	mov    %rax,(%r14)
  5d6633:	mov    %rbx,%rdi
  5d6636:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d663b:	mov    %r14,%rax
  5d663e:	add    $0x3f8,%rsp
  5d6645:	pop    %rbx
  5d6646:	pop    %r12
  5d6648:	pop    %r13
  5d664a:	pop    %r14
  5d664c:	pop    %r15
  5d664e:	pop    %rbp
  5d664f:	ret
  5d6650:	movzbl 0x141(%rsp),%ecx
  5d6658:	movups 0x142(%rsp),%xmm0
  5d6660:	movups %xmm0,0x4a(%rsp)
  5d6665:	movups 0x152(%rsp),%xmm0
  5d666d:	movups %xmm0,0x5a(%rsp)
  5d6672:	movdqu 0x160(%rsp),%xmm0
  5d667b:	movdqu %xmm0,0x68(%rsp)
  5d6681:	mov    %al,0x48(%rsp)
  5d6685:	mov    %cl,0x49(%rsp)
  5d6689:	lea    0x140(%rsp),%rdi
  5d6691:	mov    %r12,%rsi
  5d6694:	mov    %r15,%rdx
  5d6697:	mov    %ebp,%ecx
  5d6699:	call   5ceed0 <hyperpath::routing::route_axis_length>
  5d669e:	movzbl 0x140(%rsp),%eax
  5d66a6:	cmp    $0x16,%al
  5d66a8:	jne    5d66cb <hyperpath::routing::certify_differential_pair_skew+0xfb>
  5d66aa:	movb   $0x1,0x8(%r14)
  5d66af:	movabs $0x8000000000000000,%rax
  5d66b9:	mov    %rax,(%r14)
  5d66bc:	lea    0x48(%rsp),%rdi
  5d66c1:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d66c6:	jmp    5d6633 <hyperpath::routing::certify_differential_pair_skew+0x63>
  5d66cb:	movzbl 0x141(%rsp),%ecx
  5d66d3:	movups 0x142(%rsp),%xmm0
  5d66db:	movups %xmm0,0x7a(%rsp)
  5d66e0:	movups 0x152(%rsp),%xmm0
  5d66e8:	movups %xmm0,0x8a(%rsp)
  5d66f0:	movdqu 0x160(%rsp),%xmm0
  5d66f9:	movdqu %xmm0,0x98(%rsp)
  5d6702:	mov    %al,0x78(%rsp)
  5d6706:	mov    %cl,0x79(%rsp)
  5d670a:	lea    0x310(%rsp),%rdi
  5d6712:	lea    0x48(%rsp),%rsi
  5d6717:	call   5cc6f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d671c:	lea    0x140(%rsp),%rdi
  5d6724:	lea    0x78(%rsp),%rsi
  5d6729:	call   5cc6f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d672e:	lea    0x240(%rsp),%rdi
  5d6736:	lea    0x310(%rsp),%rsi
  5d673e:	lea    0x140(%rsp),%rdx
  5d6746:	call   5b3910 <<&hyperreal::real::arithmetic::Real as core::ops::arith::Sub<T>>::sub>
  5d674b:	lea    0x140(%rsp),%rdi
  5d6753:	call   5aab10 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6758:	lea    0x310(%rsp),%rdi
  5d6760:	call   5aab10 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6765:	movq   $0x0,0xe0(%rsp)
  5d6771:	movq   $0x8,0xe8(%rsp)
  5d677d:	pxor   %xmm0,%xmm0
  5d6781:	movdqu %xmm0,0xf0(%rsp)
  5d678a:	movq   $0x8,0x100(%rsp)
  5d6796:	movq   $0x0,0x108(%rsp)
  5d67a2:	mov    $0x1,%bpl
  5d67a5:	lea    0x140(%rsp),%rdi
  5d67ad:	lea    0x48(%rsp),%rsi
  5d67b2:	call   5cc6f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d67b7:	movdqu 0x140(%rsp),%xmm0
  5d67c0:	movups 0x150(%rsp),%xmm1
  5d67c8:	movups 0x160(%rsp),%xmm2
  5d67d0:	movaps %xmm2,0x130(%rsp)
  5d67d8:	movaps %xmm1,0x120(%rsp)
  5d67e0:	movdqa %xmm0,0x110(%rsp)
  5d67e9:	lea    0x140(%rsp),%rdi
  5d67f1:	lea    0x78(%rsp),%rsi
  5d67f6:	call   5cc6f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d67fb:	movdqu 0x140(%rsp),%xmm0
  5d6804:	movups 0x150(%rsp),%xmm1
  5d680c:	movups 0x160(%rsp),%xmm2
  5d6814:	movaps %xmm2,0x30(%rsp)
  5d6819:	movaps %xmm1,0x20(%rsp)
  5d681e:	movdqa %xmm0,0x10(%rsp)
  5d6824:	lea    0xa8(%rsp),%rdi
  5d682c:	mov    %rbx,%rsi
  5d682f:	call   5cc6f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  5d6834:	lea    0x310(%rsp),%rdi
  5d683c:	lea    0x110(%rsp),%rsi
  5d6844:	lea    0x10(%rsp),%rdx
  5d6849:	call   *0x49f099(%rip)        # a758e8 <_DYNAMIC+0xd50>
  5d684f:	movdqu 0xa8(%rsp),%xmm0
  5d6858:	movups 0xb8(%rsp),%xmm1
  5d6860:	movups 0xc8(%rsp),%xmm2
  5d6868:	movaps %xmm2,0x160(%rsp)
  5d6870:	movaps %xmm1,0x150(%rsp)
  5d6878:	movdqa %xmm0,0x140(%rsp)
  5d6881:	lea    0x2d0(%rsp),%rdi
  5d6889:	lea    0x310(%rsp),%rsi
  5d6891:	lea    0x140(%rsp),%rdx
  5d6899:	call   *0x49f049(%rip)        # a758e8 <_DYNAMIC+0xd50>
  5d689f:	lea    -0x4808e0(%rip),%rsi        # 155fc6 <anon.c497d48d7b050c1e4e90bf3ac0f61381.20.llvm.11338702450591874704+0x4d>
  5d68a6:	lea    0x140(%rsp),%rdi
  5d68ae:	lea    0x2d0(%rsp),%rcx
  5d68b6:	mov    $0x16,%edx
  5d68bb:	call   674500 <hypersolve::model::Constraint::equality>
  5d68c0:	lea    0xe0(%rsp),%rdi
  5d68c8:	lea    0x140(%rsp),%rsi
  5d68d0:	call   *0x49f022(%rip)        # a758f8 <_DYNAMIC+0xd60>
  5d68d6:	lea    0x310(%rsp),%rdi
  5d68de:	lea    0xe0(%rsp),%rsi
  5d68e6:	call   *0x49f014(%rip)        # a75900 <_DYNAMIC+0xd68>
  5d68ec:	lea    0xa8(%rsp),%rdi
  5d68f4:	lea    0xe0(%rsp),%rsi
  5d68fc:	call   *0x49f006(%rip)        # a75908 <_DYNAMIC+0xd70>
  5d6902:	movups 0x48(%rsp),%xmm0
  5d6907:	movups 0x58(%rsp),%xmm1
  5d690c:	movups 0x68(%rsp),%xmm2
  5d6911:	movaps %xmm2,0x290(%rsp)
  5d6919:	movaps %xmm1,0x280(%rsp)
  5d6921:	movaps %xmm0,0x270(%rsp)
  5d6929:	movups 0x78(%rsp),%xmm0
  5d692e:	movups 0x88(%rsp),%xmm1
  5d6936:	movups 0x98(%rsp),%xmm2
  5d693e:	movaps %xmm2,0x2c0(%rsp)
  5d6946:	movaps %xmm1,0x2b0(%rsp)
  5d694e:	movaps %xmm0,0x2a0(%rsp)
  5d6956:	movups 0x240(%rsp),%xmm0
  5d695e:	movups 0x250(%rsp),%xmm1
  5d6966:	movups 0x260(%rsp),%xmm2
  5d696e:	movaps %xmm2,0x130(%rsp)
  5d6976:	movaps %xmm1,0x120(%rsp)
  5d697e:	movaps %xmm0,0x110(%rsp)
  5d6986:	movdqu (%rbx),%xmm0
  5d698a:	movups 0x10(%rbx),%xmm1
  5d698e:	movups 0x20(%rbx),%xmm2
  5d6992:	movaps %xmm2,0x30(%rsp)
  5d6997:	movaps %xmm1,0x20(%rsp)
  5d699c:	movdqa %xmm0,0x10(%rsp)
  5d69a2:	lea    0x2d0(%rsp),%rdi
  5d69aa:	lea    0x310(%rsp),%rsi
  5d69b2:	lea    0xa8(%rsp),%rdx
  5d69ba:	call   *0x49ef50(%rip)        # a75910 <_DYNAMIC+0xd78>
  5d69c0:	movaps 0x270(%rsp),%xmm0
  5d69c8:	movaps 0x280(%rsp),%xmm1
  5d69d0:	movaps 0x290(%rsp),%xmm2
  5d69d8:	movaps %xmm2,0x1a0(%rsp)
  5d69e0:	movaps %xmm1,0x190(%rsp)
  5d69e8:	movaps %xmm0,0x180(%rsp)
  5d69f0:	movaps 0x2a0(%rsp),%xmm0
  5d69f8:	movaps 0x2b0(%rsp),%xmm1
  5d6a00:	movaps 0x2c0(%rsp),%xmm2
  5d6a08:	movaps %xmm0,0x1b0(%rsp)
  5d6a10:	movaps %xmm1,0x1c0(%rsp)
  5d6a18:	movaps %xmm2,0x1d0(%rsp)
  5d6a20:	movups 0x240(%rsp),%xmm0
  5d6a28:	movups 0x250(%rsp),%xmm1
  5d6a30:	movups 0x260(%rsp),%xmm2
  5d6a38:	movaps %xmm0,0x1e0(%rsp)
  5d6a40:	movaps %xmm1,0x1f0(%rsp)
  5d6a48:	movaps %xmm2,0x200(%rsp)
  5d6a50:	movaps 0x10(%rsp),%xmm0
  5d6a55:	movaps 0x20(%rsp),%xmm1
  5d6a5a:	movaps 0x30(%rsp),%xmm2
  5d6a5f:	movaps %xmm2,0x230(%rsp)
  5d6a67:	movaps %xmm1,0x220(%rsp)
  5d6a6f:	movaps %xmm0,0x210(%rsp)
  5d6a77:	movdqu 0x2d0(%rsp),%xmm0
  5d6a80:	movups 0x2e0(%rsp),%xmm1
  5d6a88:	movups 0x2f0(%rsp),%xmm2
  5d6a90:	movups 0x300(%rsp),%xmm3
  5d6a98:	movdqa %xmm0,0x140(%rsp)
  5d6aa1:	movaps %xmm1,0x150(%rsp)
  5d6aa9:	movaps %xmm2,0x160(%rsp)
  5d6ab1:	movaps %xmm3,0x170(%rsp)
  5d6ab9:	lea    0x140(%rsp),%rsi
  5d6ac1:	mov    $0x100,%edx
  5d6ac6:	mov    %r14,%rdi
  5d6ac9:	call   *0x49e3d9(%rip)        # a74ea8 <memcpy@GLIBC_2.14>
  5d6acf:	mov    0xb0(%rsp),%r15
  5d6ad7:	test   %r15,%r15
  5d6ada:	je     5d6b93 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  5d6ae0:	mov    %rbx,0x8(%rsp)
  5d6ae5:	mov    0xc0(%rsp),%r12
  5d6aed:	test   %r12,%r12
  5d6af0:	je     5d6b60 <hyperpath::routing::certify_differential_pair_skew+0x590>
  5d6af2:	mov    0xa8(%rsp),%r13
  5d6afa:	movdqa 0x0(%r13),%xmm0
  5d6b00:	lea    0x10(%r13),%rbp
  5d6b04:	pmovmskb %xmm0,%ebx
  5d6b08:	not    %ebx
  5d6b0a:	nopw   0x0(%rax,%rax,1)
  5d6b10:	test   %bx,%bx
  5d6b13:	jne    5d6b3c <hyperpath::routing::certify_differential_pair_skew+0x56c>
  5d6b15:	data16 cs nopw 0x0(%rax,%rax,1)
  5d6b20:	movdqa 0x0(%rbp),%xmm0
  5d6b25:	add    $0xfffffffffffffc80,%r13
  5d6b2c:	add    $0x10,%rbp
  5d6b30:	pmovmskb %xmm0,%ebx
  5d6b34:	xor    $0xffff,%ebx
  5d6b3a:	je     5d6b20 <hyperpath::routing::certify_differential_pair_skew+0x550>
  5d6b3c:	tzcnt  %ebx,%eax
  5d6b40:	neg    %rax
  5d6b43:	imul   $0x38,%rax,%rax
  5d6b47:	lea    (%rax,%r13,1),%rdi
  5d6b4b:	add    $0xffffffffffffffd0,%rdi
  5d6b4f:	call   5b8810 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6b54:	lea    -0x1(%rbx),%eax
  5d6b57:	and    %ebx,%eax
  5d6b59:	mov    %eax,%ebx
  5d6b5b:	dec    %r12
  5d6b5e:	jne    5d6b10 <hyperpath::routing::certify_differential_pair_skew+0x540>
  5d6b60:	imul   $0x38,%r15,%rax
  5d6b64:	add    $0x47,%rax
  5d6b68:	and    $0xfffffffffffffff0,%rax
  5d6b6c:	add    %rax,%r15
  5d6b6f:	add    $0x11,%r15
  5d6b73:	mov    0x8(%rsp),%rbx
  5d6b78:	je     5d6b93 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  5d6b7a:	mov    0xa8(%rsp),%rdi
  5d6b82:	sub    %rax,%rdi
  5d6b85:	mov    $0x10,%edx
  5d6b8a:	mov    %r15,%rsi
  5d6b8d:	call   *0x49e255(%rip)        # a74de8 <_DYNAMIC+0x250>
  5d6b93:	xor    %ebp,%ebp
  5d6b95:	lea    0x310(%rsp),%rdi
  5d6b9d:	call   5ca290 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  5d6ba2:	lea    0xe0(%rsp),%rdi
  5d6baa:	call   5c9940 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  5d6baf:	jmp    5d663b <hyperpath::routing::certify_differential_pair_skew+0x6b>
  5d6bb4:	mov    %rbx,0x8(%rsp)
  5d6bb9:	mov    %rax,%r14
  5d6bbc:	lea    0x10(%rsp),%rdi
  5d6bc1:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6bc6:	lea    0x110(%rsp),%rdi
  5d6bce:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6bd3:	lea    0x2a0(%rsp),%rdi
  5d6bdb:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6be0:	lea    0x270(%rsp),%rdi
  5d6be8:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6bed:	lea    0xa8(%rsp),%rdi
  5d6bf5:	call   5c8c90 <<hashbrown::raw::RawTable<T,A> as core::ops::drop::Drop>::drop>
  5d6bfa:	jmp    5d6ceb <hyperpath::routing::certify_differential_pair_skew+0x71b>
  5d6bff:	mov    %rbx,0x8(%rsp)
  5d6c04:	mov    %rax,%r14
  5d6c07:	mov    $0x1,%bpl
  5d6c0a:	jmp    5d6ced <hyperpath::routing::certify_differential_pair_skew+0x71d>
  5d6c0f:	mov    %rbx,0x8(%rsp)
  5d6c14:	mov    %rax,%r14
  5d6c17:	lea    0xa8(%rsp),%rdi
  5d6c1f:	call   6778a0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6c24:	mov    $0x1,%bpl
  5d6c27:	jmp    5d6cfa <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d6c2c:	call   *0x49e266(%rip)        # a74e98 <_DYNAMIC+0x300>
  5d6c32:	mov    %rbx,0x8(%rsp)
  5d6c37:	mov    %rax,%r14
  5d6c3a:	lea    0x10(%rsp),%rdi
  5d6c3f:	call   5c9a70 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  5d6c44:	jmp    5d6c4e <hyperpath::routing::certify_differential_pair_skew+0x67e>
  5d6c46:	mov    %rbx,0x8(%rsp)
  5d6c4b:	mov    %rax,%r14
  5d6c4e:	mov    $0x1,%bpl
  5d6c51:	lea    0x110(%rsp),%rdi
  5d6c59:	call   5c9a70 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  5d6c5e:	jmp    5d6cfa <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d6c63:	jmp    5d6cad <hyperpath::routing::certify_differential_pair_skew+0x6dd>
  5d6c65:	mov    %rbx,0x8(%rsp)
  5d6c6a:	mov    %rax,%r14
  5d6c6d:	jmp    5d6c84 <hyperpath::routing::certify_differential_pair_skew+0x6b4>
  5d6c6f:	mov    %rbx,0x8(%rsp)
  5d6c74:	mov    %rax,%r14
  5d6c77:	lea    0x140(%rsp),%rdi
  5d6c7f:	call   5aab10 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6c84:	lea    0x310(%rsp),%rdi
  5d6c8c:	call   5aab10 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6c91:	jmp    5d6d19 <hyperpath::routing::certify_differential_pair_skew+0x749>
  5d6c96:	mov    %rbx,0x8(%rsp)
  5d6c9b:	mov    %rax,%r14
  5d6c9e:	lea    0x310(%rsp),%rdi
  5d6ca6:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6cab:	jmp    5d6d19 <hyperpath::routing::certify_differential_pair_skew+0x749>
  5d6cad:	mov    %rbx,0x8(%rsp)
  5d6cb2:	mov    %rax,%r14
  5d6cb5:	jmp    5d6d19 <hyperpath::routing::certify_differential_pair_skew+0x749>
  5d6cb7:	call   *0x49e1db(%rip)        # a74e98 <_DYNAMIC+0x300>
  5d6cbd:	mov    %rbx,0x8(%rsp)
  5d6cc2:	mov    %rax,%r14
  5d6cc5:	mov    $0x1,%bpl
  5d6cc8:	jmp    5d6cfa <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d6cca:	mov    %rbx,0x8(%rsp)
  5d6ccf:	mov    %rax,%r14
  5d6cd2:	jmp    5d6d23 <hyperpath::routing::certify_differential_pair_skew+0x753>
  5d6cd4:	mov    %rbx,0x8(%rsp)
  5d6cd9:	mov    %rax,%r14
  5d6cdc:	jmp    5d6cfa <hyperpath::routing::certify_differential_pair_skew+0x72a>
  5d6cde:	mov    %rbx,0x8(%rsp)
  5d6ce3:	mov    %rax,%r14
  5d6ce6:	jmp    5d6d2d <hyperpath::routing::certify_differential_pair_skew+0x75d>
  5d6ce8:	mov    %rax,%r14
  5d6ceb:	xor    %ebp,%ebp
  5d6ced:	lea    0x310(%rsp),%rdi
  5d6cf5:	call   5ca290 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  5d6cfa:	lea    0xe0(%rsp),%rdi
  5d6d02:	call   5c9940 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  5d6d07:	test   %bpl,%bpl
  5d6d0a:	je     5d6d37 <hyperpath::routing::certify_differential_pair_skew+0x767>
  5d6d0c:	lea    0x240(%rsp),%rdi
  5d6d14:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6d19:	lea    0x78(%rsp),%rdi
  5d6d1e:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6d23:	lea    0x48(%rsp),%rdi
  5d6d28:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6d2d:	mov    0x8(%rsp),%rdi
  5d6d32:	call   5c9ef0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  5d6d37:	mov    %r14,%rdi
  5d6d3a:	call   a2e2c0 <_Unwind_Resume@plt>
  5d6d3f:	call   *0x49e153(%rip)        # a74e98 <_DYNAMIC+0x300>
