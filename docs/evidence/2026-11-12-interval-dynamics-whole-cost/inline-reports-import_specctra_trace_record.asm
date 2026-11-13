
/tmp/interval-refactor/dynamics-cost-binaries/whole-inline-reports:     file format elf64-x86-64


Disassembly of section .text:

000000000061d110 <hyperpath::specctra::import_specctra_trace_record>:
  61d110:	push   %rbp
  61d111:	push   %r15
  61d113:	push   %r14
  61d115:	push   %r12
  61d117:	push   %rbx
  61d118:	sub    $0x7e0,%rsp
  61d11f:	mov    %edx,%ebp
  61d121:	mov    %rsi,%r14
  61d124:	mov    %rdi,%rbx
  61d127:	mov    %rsp,%rdi
  61d12a:	call   61b440 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d12f:	lea    0x30(%r14),%rsi
  61d133:	lea    0xc0(%rsp),%rdi
  61d13b:	call   61b440 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d140:	movups (%rsp),%xmm0
  61d144:	movups 0x10(%rsp),%xmm1
  61d149:	movups 0x20(%rsp),%xmm2
  61d14e:	movaps %xmm2,0x50(%rsp)
  61d153:	movaps %xmm1,0x40(%rsp)
  61d158:	movaps %xmm0,0x30(%rsp)
  61d15d:	movups 0xc0(%rsp),%xmm0
  61d165:	movups 0xd0(%rsp),%xmm1
  61d16d:	movups 0xe0(%rsp),%xmm2
  61d175:	movaps %xmm0,0x60(%rsp)
  61d17a:	movaps %xmm1,0x70(%rsp)
  61d17f:	movaps %xmm2,0x80(%rsp)
  61d187:	lea    0x60(%r14),%rsi
  61d18b:	lea    0x90(%rsp),%rdi
  61d193:	call   61b440 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d198:	lea    0x90(%r14),%rsi
  61d19f:	mov    %rsp,%rdi
  61d1a2:	call   61b440 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d1a7:	movups 0x90(%rsp),%xmm0
  61d1af:	movups 0xa0(%rsp),%xmm1
  61d1b7:	movups 0xb0(%rsp),%xmm2
  61d1bf:	movaps %xmm2,0xe0(%rsp)
  61d1c7:	movaps %xmm1,0xd0(%rsp)
  61d1cf:	movaps %xmm0,0xc0(%rsp)
  61d1d7:	movups (%rsp),%xmm0
  61d1db:	movups 0x10(%rsp),%xmm1
  61d1e0:	movups 0x20(%rsp),%xmm2
  61d1e5:	movaps %xmm0,0xf0(%rsp)
  61d1ed:	movaps %xmm1,0x100(%rsp)
  61d1f5:	movaps %xmm2,0x110(%rsp)
  61d1fd:	movzbl %bpl,%ebp
  61d201:	lea    0x550(%rsp),%rdi
  61d209:	lea    0x30(%rsp),%rsi
  61d20e:	lea    0xc0(%rsp),%rdx
  61d216:	mov    %ebp,%ecx
  61d218:	call   *0x45585a(%rip)        # a72a78 <_DYNAMIC+0x640>
  61d21e:	movzbl 0x73b(%rsp),%r15d
  61d227:	cmp    $0x2,%r15b
  61d22b:	jne    61d23c <hyperpath::specctra::import_specctra_trace_record+0x12c>
  61d22d:	movb   $0x9,(%rbx)
  61d230:	movb   $0x2,0x2ec(%rbx)
  61d237:	jmp    61d41d <hyperpath::specctra::import_specctra_trace_record+0x30d>
  61d23c:	movzbl 0x550(%rsp),%r12d
  61d245:	lea    0x551(%rsp),%rsi
  61d24d:	lea    0xc1(%rsp),%rdi
  61d255:	mov    $0x1ea,%edx
  61d25a:	call   *0x4554e8(%rip)        # a72748 <memcpy@GLIBC_2.14>
  61d260:	mov    0x73c(%rsp),%rax
  61d268:	mov    %rax,0x2ac(%rsp)
  61d270:	mov    0x744(%rsp),%eax
  61d277:	mov    %eax,0x2b4(%rsp)
  61d27e:	mov    %r12b,0xc0(%rsp)
  61d286:	mov    %r15b,0x2ab(%rsp)
  61d28e:	lea    0xc0(%r14),%rsi
  61d295:	lea    0x30(%rsp),%rdi
  61d29a:	call   61b440 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  61d29f:	lea    0x550(%rsp),%rdi
  61d2a7:	lea    0xc0(%rsp),%rsi
  61d2af:	lea    0x30(%rsp),%rdx
  61d2b4:	mov    %ebp,%ecx
  61d2b6:	call   *0x455a44(%rip)        # a72d00 <_DYNAMIC+0x8c8>
  61d2bc:	movzbl 0x7d4(%rsp),%r15d
  61d2c5:	cmp    $0x2,%r15b
  61d2c9:	jne    61d30a <hyperpath::specctra::import_specctra_trace_record+0x1fa>
  61d2cb:	mov    $0x9,%al
  61d2cd:	cmpq   $0x24,0x558(%rsp)
  61d2d6:	jne    61d2fc <hyperpath::specctra::import_specctra_trace_record+0x1ec>
  61d2d8:	mov    0x550(%rsp),%rdi
  61d2e0:	lea    -0x4c690f(%rip),%rsi        # 1569d8 <anon.bdeda72db269a6456cc6403697ad4fb7.40.llvm.628051137442760858+0x26>
  61d2e7:	mov    $0x24,%edx
  61d2ec:	call   *0x455afe(%rip)        # a72df0 <bcmp@GLIBC_2.2.5>
  61d2f2:	test   %eax,%eax
  61d2f4:	setne  %al
  61d2f7:	shl    $0x3,%al
  61d2fa:	inc    %al
  61d2fc:	mov    %al,(%rbx)
  61d2fe:	movb   $0x2,0x2ec(%rbx)
  61d305:	jmp    61d41d <hyperpath::specctra::import_specctra_trace_record+0x30d>
  61d30a:	movzbl 0x550(%rsp),%r12d
  61d313:	lea    0x551(%rsp),%rsi
  61d31b:	lea    0x2c1(%rsp),%rdi
  61d323:	mov    $0x283,%edx
  61d328:	call   *0x45541a(%rip)        # a72748 <memcpy@GLIBC_2.14>
  61d32e:	mov    0x7d5(%rsp),%rax
  61d336:	mov    %rax,0x545(%rsp)
  61d33e:	mov    0x7dc(%rsp),%eax
  61d345:	mov    %eax,0x54c(%rsp)
  61d34c:	mov    %r12b,0x2c0(%rsp)
  61d354:	mov    %r15b,0x544(%rsp)
  61d35c:	mov    0xf0(%r14),%r15d
  61d363:	movzwl 0xf4(%r14),%r14d
  61d36b:	lea    0x2c0(%rsp),%rdi
  61d373:	mov    %ebp,%esi
  61d375:	call   *0x456105(%rip)        # a73480 <_DYNAMIC+0x1048>
  61d37b:	shl    $0x3,%eax
  61d37e:	mov    $0x2010002,%ebp
  61d383:	mov    %eax,%ecx
  61d385:	shr    %cl,%ebp
  61d387:	movups 0x538(%rsp),%xmm0
  61d38f:	movups %xmm0,0x2e0(%rbx)
  61d396:	movups 0x528(%rsp),%xmm0
  61d39e:	movups %xmm0,0x2d0(%rbx)
  61d3a5:	movups 0x4e8(%rsp),%xmm0
  61d3ad:	movups 0x4f8(%rsp),%xmm1
  61d3b5:	movups 0x508(%rsp),%xmm2
  61d3bd:	movups 0x518(%rsp),%xmm3
  61d3c5:	movups %xmm3,0x2c0(%rbx)
  61d3cc:	movups %xmm2,0x2b0(%rbx)
  61d3d3:	movups %xmm1,0x2a0(%rbx)
  61d3da:	movups %xmm0,0x290(%rbx)
  61d3e1:	movzbl 0x4d2(%rsp),%r12d
  61d3ea:	lea    0x2c0(%rsp),%rsi
  61d3f2:	mov    $0x290,%edx
  61d3f7:	mov    %rbx,%rdi
  61d3fa:	call   *0x455348(%rip)        # a72748 <memcpy@GLIBC_2.14>
  61d400:	mov    %r15d,0x2f8(%rbx)
  61d407:	mov    %r14w,0x2fc(%rbx)
  61d40f:	mov    %bpl,0x2f0(%rbx)
  61d416:	mov    %r12b,0x2f1(%rbx)
  61d41d:	mov    %rbx,%rax
  61d420:	add    $0x7e0,%rsp
  61d427:	pop    %rbx
  61d428:	pop    %r12
  61d42a:	pop    %r14
  61d42c:	pop    %r15
  61d42e:	pop    %rbp
  61d42f:	ret
  61d430:	mov    %rax,%rbx
  61d433:	lea    0x2c0(%rsp),%rdi
  61d43b:	call   5bc580 <core::ptr::drop_in_place<hyperpath::swept::SweptLineSegment>>
  61d440:	jmp    61d492 <hyperpath::specctra::import_specctra_trace_record+0x382>
  61d442:	call   *0x4552f0(%rip)        # a72738 <_DYNAMIC+0x300>
  61d448:	mov    %rax,%rbx
  61d44b:	lea    0xc0(%rsp),%rdi
  61d453:	call   61ad70 <core::ptr::drop_in_place<hyperpath::segment::LinePathSegment>>
  61d458:	jmp    61d492 <hyperpath::specctra::import_specctra_trace_record+0x382>
  61d45a:	mov    %rax,%rbx
  61d45d:	lea    0x90(%rsp),%rdi
  61d465:	call   61a810 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  61d46a:	jmp    61d475 <hyperpath::specctra::import_specctra_trace_record+0x365>
  61d46c:	call   *0x4552c6(%rip)        # a72738 <_DYNAMIC+0x300>
  61d472:	mov    %rax,%rbx
  61d475:	lea    0x30(%rsp),%rdi
  61d47a:	call   61a7d0 <core::ptr::drop_in_place<hyperlattice::point::Point2>>
  61d47f:	jmp    61d492 <hyperpath::specctra::import_specctra_trace_record+0x382>
  61d481:	call   *0x4552b1(%rip)        # a72738 <_DYNAMIC+0x300>
  61d487:	mov    %rax,%rbx
  61d48a:	mov    %rsp,%rdi
  61d48d:	call   61a810 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  61d492:	mov    %rbx,%rdi
  61d495:	call   a2bbf0 <_Unwind_Resume@plt>
  61d49a:	call   *0x455298(%rip)        # a72738 <_DYNAMIC+0x300>
