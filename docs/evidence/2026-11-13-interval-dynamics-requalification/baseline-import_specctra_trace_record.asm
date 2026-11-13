
/tmp/interval-refactor/dynamics-requal-binaries/baseline:     file format elf64-x86-64


Disassembly of section .text:

000000000063eec0 <hyperpath::specctra::import_specctra_trace_record>:
  63eec0:	push   %rbp
  63eec1:	push   %r15
  63eec3:	push   %r14
  63eec5:	push   %r12
  63eec7:	push   %rbx
  63eec8:	sub    $0x7e0,%rsp
  63eecf:	mov    %edx,%ebp
  63eed1:	mov    %rsi,%r14
  63eed4:	mov    %rdi,%rbx
  63eed7:	mov    %rsp,%rdi
  63eeda:	call   63d1f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63eedf:	lea    0x30(%r14),%rsi
  63eee3:	lea    0xc0(%rsp),%rdi
  63eeeb:	call   63d1f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63eef0:	movups (%rsp),%xmm0
  63eef4:	movups 0x10(%rsp),%xmm1
  63eef9:	movups 0x20(%rsp),%xmm2
  63eefe:	movaps %xmm2,0x50(%rsp)
  63ef03:	movaps %xmm1,0x40(%rsp)
  63ef08:	movaps %xmm0,0x30(%rsp)
  63ef0d:	movups 0xc0(%rsp),%xmm0
  63ef15:	movups 0xd0(%rsp),%xmm1
  63ef1d:	movups 0xe0(%rsp),%xmm2
  63ef25:	movaps %xmm0,0x60(%rsp)
  63ef2a:	movaps %xmm1,0x70(%rsp)
  63ef2f:	movaps %xmm2,0x80(%rsp)
  63ef37:	lea    0x60(%r14),%rsi
  63ef3b:	lea    0x90(%rsp),%rdi
  63ef43:	call   63d1f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63ef48:	lea    0x90(%r14),%rsi
  63ef4f:	mov    %rsp,%rdi
  63ef52:	call   63d1f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63ef57:	movups 0x90(%rsp),%xmm0
  63ef5f:	movups 0xa0(%rsp),%xmm1
  63ef67:	movups 0xb0(%rsp),%xmm2
  63ef6f:	movaps %xmm2,0xe0(%rsp)
  63ef77:	movaps %xmm1,0xd0(%rsp)
  63ef7f:	movaps %xmm0,0xc0(%rsp)
  63ef87:	movups (%rsp),%xmm0
  63ef8b:	movups 0x10(%rsp),%xmm1
  63ef90:	movups 0x20(%rsp),%xmm2
  63ef95:	movaps %xmm0,0xf0(%rsp)
  63ef9d:	movaps %xmm1,0x100(%rsp)
  63efa5:	movaps %xmm2,0x110(%rsp)
  63efad:	movzbl %bpl,%ebp
  63efb1:	lea    0x550(%rsp),%rdi
  63efb9:	lea    0x30(%rsp),%rsi
  63efbe:	lea    0xc0(%rsp),%rdx
  63efc6:	mov    %ebp,%ecx
  63efc8:	call   *0x4362ca(%rip)        # a75298 <_DYNAMIC+0x700>
  63efce:	movzbl 0x73b(%rsp),%r15d
  63efd7:	cmp    $0x2,%r15b
  63efdb:	jne    63efec <hyperpath::specctra::import_specctra_trace_record+0x12c>
  63efdd:	movb   $0x9,(%rbx)
  63efe0:	movb   $0x2,0x2ec(%rbx)
  63efe7:	jmp    63f1cd <hyperpath::specctra::import_specctra_trace_record+0x30d>
  63efec:	movzbl 0x550(%rsp),%r12d
  63eff5:	lea    0x551(%rsp),%rsi
  63effd:	lea    0xc1(%rsp),%rdi
  63f005:	mov    $0x1ea,%edx
  63f00a:	call   *0x435e98(%rip)        # a74ea8 <memcpy@GLIBC_2.14>
  63f010:	mov    0x73c(%rsp),%rax
  63f018:	mov    %rax,0x2ac(%rsp)
  63f020:	mov    0x744(%rsp),%eax
  63f027:	mov    %eax,0x2b4(%rsp)
  63f02e:	mov    %r12b,0xc0(%rsp)
  63f036:	mov    %r15b,0x2ab(%rsp)
  63f03e:	lea    0xc0(%r14),%rsi
  63f045:	lea    0x30(%rsp),%rdi
  63f04a:	call   63d1f0 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63f04f:	lea    0x550(%rsp),%rdi
  63f057:	lea    0xc0(%rsp),%rsi
  63f05f:	lea    0x30(%rsp),%rdx
  63f064:	mov    %ebp,%ecx
  63f066:	call   *0x4363f4(%rip)        # a75460 <_DYNAMIC+0x8c8>
  63f06c:	movzbl 0x7d4(%rsp),%r15d
  63f075:	cmp    $0x2,%r15b
  63f079:	jne    63f0ba <hyperpath::specctra::import_specctra_trace_record+0x1fa>
  63f07b:	mov    $0x9,%al
  63f07d:	cmpq   $0x24,0x558(%rsp)
  63f086:	jne    63f0ac <hyperpath::specctra::import_specctra_trace_record+0x1ec>
  63f088:	mov    0x550(%rsp),%rdi
  63f090:	lea    -0x4e784f(%rip),%rsi        # 157848 <anon.250a83acb62e5f288b4b2c1a9f3a192b.40.llvm.4692429209761240384+0x26>
  63f097:	mov    $0x24,%edx
  63f09c:	call   *0x4364ae(%rip)        # a75550 <bcmp@GLIBC_2.2.5>
  63f0a2:	test   %eax,%eax
  63f0a4:	setne  %al
  63f0a7:	shl    $0x3,%al
  63f0aa:	inc    %al
  63f0ac:	mov    %al,(%rbx)
  63f0ae:	movb   $0x2,0x2ec(%rbx)
  63f0b5:	jmp    63f1cd <hyperpath::specctra::import_specctra_trace_record+0x30d>
  63f0ba:	movzbl 0x550(%rsp),%r12d
  63f0c3:	lea    0x551(%rsp),%rsi
  63f0cb:	lea    0x2c1(%rsp),%rdi
  63f0d3:	mov    $0x283,%edx
  63f0d8:	call   *0x435dca(%rip)        # a74ea8 <memcpy@GLIBC_2.14>
  63f0de:	mov    0x7d5(%rsp),%rax
  63f0e6:	mov    %rax,0x545(%rsp)
  63f0ee:	mov    0x7dc(%rsp),%eax
  63f0f5:	mov    %eax,0x54c(%rsp)
  63f0fc:	mov    %r12b,0x2c0(%rsp)
  63f104:	mov    %r15b,0x544(%rsp)
  63f10c:	mov    0xf0(%r14),%r15d
  63f113:	movzwl 0xf4(%r14),%r14d
  63f11b:	lea    0x2c0(%rsp),%rdi
  63f123:	mov    %ebp,%esi
  63f125:	call   *0x436ab5(%rip)        # a75be0 <_DYNAMIC+0x1048>
  63f12b:	shl    $0x3,%eax
  63f12e:	mov    $0x2010002,%ebp
  63f133:	mov    %eax,%ecx
  63f135:	shr    %cl,%ebp
  63f137:	movups 0x538(%rsp),%xmm0
  63f13f:	movups %xmm0,0x2e0(%rbx)
  63f146:	movups 0x528(%rsp),%xmm0
  63f14e:	movups %xmm0,0x2d0(%rbx)
  63f155:	movups 0x4e8(%rsp),%xmm0
  63f15d:	movups 0x4f8(%rsp),%xmm1
  63f165:	movups 0x508(%rsp),%xmm2
  63f16d:	movups 0x518(%rsp),%xmm3
  63f175:	movups %xmm3,0x2c0(%rbx)
  63f17c:	movups %xmm2,0x2b0(%rbx)
  63f183:	movups %xmm1,0x2a0(%rbx)
  63f18a:	movups %xmm0,0x290(%rbx)
  63f191:	movzbl 0x4d2(%rsp),%r12d
  63f19a:	lea    0x2c0(%rsp),%rsi
  63f1a2:	mov    $0x290,%edx
  63f1a7:	mov    %rbx,%rdi
  63f1aa:	call   *0x435cf8(%rip)        # a74ea8 <memcpy@GLIBC_2.14>
  63f1b0:	mov    %r15d,0x2f8(%rbx)
  63f1b7:	mov    %r14w,0x2fc(%rbx)
  63f1bf:	mov    %bpl,0x2f0(%rbx)
  63f1c6:	mov    %r12b,0x2f1(%rbx)
  63f1cd:	mov    %rbx,%rax
  63f1d0:	add    $0x7e0,%rsp
  63f1d7:	pop    %rbx
  63f1d8:	pop    %r12
  63f1da:	pop    %r14
  63f1dc:	pop    %r15
  63f1de:	pop    %rbp
  63f1df:	ret
  63f1e0:	mov    %rax,%rbx
  63f1e3:	lea    0x2c0(%rsp),%rdi
  63f1eb:	call   60ec80 <core::ptr::drop_in_place<hyperpath::swept::SweptLineSegment>>
  63f1f0:	jmp    63f242 <hyperpath::specctra::import_specctra_trace_record+0x382>
  63f1f2:	call   *0x435ca0(%rip)        # a74e98 <_DYNAMIC+0x300>
  63f1f8:	mov    %rax,%rbx
  63f1fb:	lea    0xc0(%rsp),%rdi
  63f203:	call   63cc40 <core::ptr::drop_in_place<hyperpath::segment::LinePathSegment>>
  63f208:	jmp    63f242 <hyperpath::specctra::import_specctra_trace_record+0x382>
  63f20a:	mov    %rax,%rbx
  63f20d:	lea    0x90(%rsp),%rdi
  63f215:	call   63c6e0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63f21a:	jmp    63f225 <hyperpath::specctra::import_specctra_trace_record+0x365>
  63f21c:	call   *0x435c76(%rip)        # a74e98 <_DYNAMIC+0x300>
  63f222:	mov    %rax,%rbx
  63f225:	lea    0x30(%rsp),%rdi
  63f22a:	call   63c6a0 <core::ptr::drop_in_place<hyperlattice::point::Point2>>
  63f22f:	jmp    63f242 <hyperpath::specctra::import_specctra_trace_record+0x382>
  63f231:	call   *0x435c61(%rip)        # a74e98 <_DYNAMIC+0x300>
  63f237:	mov    %rax,%rbx
  63f23a:	mov    %rsp,%rdi
  63f23d:	call   63c6e0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63f242:	mov    %rbx,%rdi
  63f245:	call   a2e2c0 <_Unwind_Resume@plt>
  63f24a:	call   *0x435c48(%rip)        # a74e98 <_DYNAMIC+0x300>
