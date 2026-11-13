
/tmp/interval-refactor/dynamics-requal-binaries/candidate:     file format elf64-x86-64


Disassembly of section .text:

000000000061d5c0 <hyperpath::specctra::import_specctra_trace_record>:
  61d5c0:	push   %rbp
  61d5c1:	push   %r15
  61d5c3:	push   %r14
  61d5c5:	push   %r12
  61d5c7:	push   %rbx
  61d5c8:	sub    $0x7e0,%rsp
  61d5cf:	mov    %edx,%ebp
  61d5d1:	mov    %rsi,%r14
  61d5d4:	mov    %rdi,%rbx
  61d5d7:	mov    %rsp,%rdi
  61d5da:	call   61b8f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d5df:	lea    0x30(%r14),%rsi
  61d5e3:	lea    0xc0(%rsp),%rdi
  61d5eb:	call   61b8f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d5f0:	movups (%rsp),%xmm0
  61d5f4:	movups 0x10(%rsp),%xmm1
  61d5f9:	movups 0x20(%rsp),%xmm2
  61d5fe:	movaps %xmm2,0x50(%rsp)
  61d603:	movaps %xmm1,0x40(%rsp)
  61d608:	movaps %xmm0,0x30(%rsp)
  61d60d:	movups 0xc0(%rsp),%xmm0
  61d615:	movups 0xd0(%rsp),%xmm1
  61d61d:	movups 0xe0(%rsp),%xmm2
  61d625:	movaps %xmm0,0x60(%rsp)
  61d62a:	movaps %xmm1,0x70(%rsp)
  61d62f:	movaps %xmm2,0x80(%rsp)
  61d637:	lea    0x60(%r14),%rsi
  61d63b:	lea    0x90(%rsp),%rdi
  61d643:	call   61b8f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d648:	lea    0x90(%r14),%rsi
  61d64f:	mov    %rsp,%rdi
  61d652:	call   61b8f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d657:	movups 0x90(%rsp),%xmm0
  61d65f:	movups 0xa0(%rsp),%xmm1
  61d667:	movups 0xb0(%rsp),%xmm2
  61d66f:	movaps %xmm2,0xe0(%rsp)
  61d677:	movaps %xmm1,0xd0(%rsp)
  61d67f:	movaps %xmm0,0xc0(%rsp)
  61d687:	movups (%rsp),%xmm0
  61d68b:	movups 0x10(%rsp),%xmm1
  61d690:	movups 0x20(%rsp),%xmm2
  61d695:	movaps %xmm0,0xf0(%rsp)
  61d69d:	movaps %xmm1,0x100(%rsp)
  61d6a5:	movaps %xmm2,0x110(%rsp)
  61d6ad:	movzbl %bpl,%ebp
  61d6b1:	lea    0x550(%rsp),%rdi
  61d6b9:	lea    0x30(%rsp),%rsi
  61d6be:	lea    0xc0(%rsp),%rdx
  61d6c6:	mov    %ebp,%ecx
  61d6c8:	call   *0x455dc2(%rip)        # a73490 <_DYNAMIC+0x640>
  61d6ce:	movzbl 0x73b(%rsp),%r15d
  61d6d7:	cmp    $0x2,%r15b
  61d6db:	jne    61d6ec <hyperpath::specctra::import_specctra_trace_record+0x12c>
  61d6dd:	movb   $0x9,(%rbx)
  61d6e0:	movb   $0x2,0x2ec(%rbx)
  61d6e7:	jmp    61d8cd <hyperpath::specctra::import_specctra_trace_record+0x30d>
  61d6ec:	movzbl 0x550(%rsp),%r12d
  61d6f5:	lea    0x551(%rsp),%rsi
  61d6fd:	lea    0xc1(%rsp),%rdi
  61d705:	mov    $0x1ea,%edx
  61d70a:	call   *0x455a50(%rip)        # a73160 <memcpy@GLIBC_2.14>
  61d710:	mov    0x73c(%rsp),%rax
  61d718:	mov    %rax,0x2ac(%rsp)
  61d720:	mov    0x744(%rsp),%eax
  61d727:	mov    %eax,0x2b4(%rsp)
  61d72e:	mov    %r12b,0xc0(%rsp)
  61d736:	mov    %r15b,0x2ab(%rsp)
  61d73e:	lea    0xc0(%r14),%rsi
  61d745:	lea    0x30(%rsp),%rdi
  61d74a:	call   61b8f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d74f:	lea    0x550(%rsp),%rdi
  61d757:	lea    0xc0(%rsp),%rsi
  61d75f:	lea    0x30(%rsp),%rdx
  61d764:	mov    %ebp,%ecx
  61d766:	call   *0x455fac(%rip)        # a73718 <_DYNAMIC+0x8c8>
  61d76c:	movzbl 0x7d4(%rsp),%r15d
  61d775:	cmp    $0x2,%r15b
  61d779:	jne    61d7ba <hyperpath::specctra::import_specctra_trace_record+0x1fa>
  61d77b:	mov    $0x9,%al
  61d77d:	cmpq   $0x24,0x558(%rsp)
  61d786:	jne    61d7ac <hyperpath::specctra::import_specctra_trace_record+0x1ec>
  61d788:	mov    0x550(%rsp),%rdi
  61d790:	lea    -0x4c6a7f(%rip),%rsi        # 156d18 <anon.bdeda72db269a6456cc6403697ad4fb7.40.llvm.628051137442760858+0x26>
  61d797:	mov    $0x24,%edx
  61d79c:	call   *0x456066(%rip)        # a73808 <bcmp@GLIBC_2.2.5>
  61d7a2:	test   %eax,%eax
  61d7a4:	setne  %al
  61d7a7:	shl    $0x3,%al
  61d7aa:	inc    %al
  61d7ac:	mov    %al,(%rbx)
  61d7ae:	movb   $0x2,0x2ec(%rbx)
  61d7b5:	jmp    61d8cd <hyperpath::specctra::import_specctra_trace_record+0x30d>
  61d7ba:	movzbl 0x550(%rsp),%r12d
  61d7c3:	lea    0x551(%rsp),%rsi
  61d7cb:	lea    0x2c1(%rsp),%rdi
  61d7d3:	mov    $0x283,%edx
  61d7d8:	call   *0x455982(%rip)        # a73160 <memcpy@GLIBC_2.14>
  61d7de:	mov    0x7d5(%rsp),%rax
  61d7e6:	mov    %rax,0x545(%rsp)
  61d7ee:	mov    0x7dc(%rsp),%eax
  61d7f5:	mov    %eax,0x54c(%rsp)
  61d7fc:	mov    %r12b,0x2c0(%rsp)
  61d804:	mov    %r15b,0x544(%rsp)
  61d80c:	mov    0xf0(%r14),%r15d
  61d813:	movzwl 0xf4(%r14),%r14d
  61d81b:	lea    0x2c0(%rsp),%rdi
  61d823:	mov    %ebp,%esi
  61d825:	call   *0x45666d(%rip)        # a73e98 <_DYNAMIC+0x1048>
  61d82b:	shl    $0x3,%eax
  61d82e:	mov    $0x2010002,%ebp
  61d833:	mov    %eax,%ecx
  61d835:	shr    %cl,%ebp
  61d837:	movups 0x538(%rsp),%xmm0
  61d83f:	movups %xmm0,0x2e0(%rbx)
  61d846:	movups 0x528(%rsp),%xmm0
  61d84e:	movups %xmm0,0x2d0(%rbx)
  61d855:	movups 0x4e8(%rsp),%xmm0
  61d85d:	movups 0x4f8(%rsp),%xmm1
  61d865:	movups 0x508(%rsp),%xmm2
  61d86d:	movups 0x518(%rsp),%xmm3
  61d875:	movups %xmm3,0x2c0(%rbx)
  61d87c:	movups %xmm2,0x2b0(%rbx)
  61d883:	movups %xmm1,0x2a0(%rbx)
  61d88a:	movups %xmm0,0x290(%rbx)
  61d891:	movzbl 0x4d2(%rsp),%r12d
  61d89a:	lea    0x2c0(%rsp),%rsi
  61d8a2:	mov    $0x290,%edx
  61d8a7:	mov    %rbx,%rdi
  61d8aa:	call   *0x4558b0(%rip)        # a73160 <memcpy@GLIBC_2.14>
  61d8b0:	mov    %r15d,0x2f8(%rbx)
  61d8b7:	mov    %r14w,0x2fc(%rbx)
  61d8bf:	mov    %bpl,0x2f0(%rbx)
  61d8c6:	mov    %r12b,0x2f1(%rbx)
  61d8cd:	mov    %rbx,%rax
  61d8d0:	add    $0x7e0,%rsp
  61d8d7:	pop    %rbx
  61d8d8:	pop    %r12
  61d8da:	pop    %r14
  61d8dc:	pop    %r15
  61d8de:	pop    %rbp
  61d8df:	ret
  61d8e0:	mov    %rax,%rbx
  61d8e3:	lea    0x2c0(%rsp),%rdi
  61d8eb:	call   5bca30 <core::ptr::drop_in_place<hyperpath::swept::SweptLineSegment>>
  61d8f0:	jmp    61d942 <hyperpath::specctra::import_specctra_trace_record+0x382>
  61d8f2:	call   *0x455858(%rip)        # a73150 <_DYNAMIC+0x300>
  61d8f8:	mov    %rax,%rbx
  61d8fb:	lea    0xc0(%rsp),%rdi
  61d903:	call   61b220 <core::ptr::drop_in_place<hyperpath::segment::LinePathSegment>>
  61d908:	jmp    61d942 <hyperpath::specctra::import_specctra_trace_record+0x382>
  61d90a:	mov    %rax,%rbx
  61d90d:	lea    0x90(%rsp),%rdi
  61d915:	call   61acc0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  61d91a:	jmp    61d925 <hyperpath::specctra::import_specctra_trace_record+0x365>
  61d91c:	call   *0x45582e(%rip)        # a73150 <_DYNAMIC+0x300>
  61d922:	mov    %rax,%rbx
  61d925:	lea    0x30(%rsp),%rdi
  61d92a:	call   61ac80 <core::ptr::drop_in_place<hyperlattice::point::Point2>>
  61d92f:	jmp    61d942 <hyperpath::specctra::import_specctra_trace_record+0x382>
  61d931:	call   *0x455819(%rip)        # a73150 <_DYNAMIC+0x300>
  61d937:	mov    %rax,%rbx
  61d93a:	mov    %rsp,%rdi
  61d93d:	call   61acc0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  61d942:	mov    %rbx,%rdi
  61d945:	call   a2c590 <_Unwind_Resume@plt>
  61d94a:	call   *0x455800(%rip)        # a73150 <_DYNAMIC+0x300>
