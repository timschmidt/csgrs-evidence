
/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a:     file format elf64-x86-64


Disassembly of section .text:

000000000063ea60 <hyperpath::specctra::import_specctra_trace_record>:
  63ea60:	push   %rbp
  63ea61:	push   %r15
  63ea63:	push   %r14
  63ea65:	push   %r12
  63ea67:	push   %rbx
  63ea68:	sub    $0x7e0,%rsp
  63ea6f:	mov    %edx,%ebp
  63ea71:	mov    %rsi,%r14
  63ea74:	mov    %rdi,%rbx
  63ea77:	mov    %rsp,%rdi
  63ea7a:	call   63cd90 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63ea7f:	lea    0x30(%r14),%rsi
  63ea83:	lea    0xc0(%rsp),%rdi
  63ea8b:	call   63cd90 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63ea90:	movups (%rsp),%xmm0
  63ea94:	movups 0x10(%rsp),%xmm1
  63ea99:	movups 0x20(%rsp),%xmm2
  63ea9e:	movaps %xmm2,0x50(%rsp)
  63eaa3:	movaps %xmm1,0x40(%rsp)
  63eaa8:	movaps %xmm0,0x30(%rsp)
  63eaad:	movups 0xc0(%rsp),%xmm0
  63eab5:	movups 0xd0(%rsp),%xmm1
  63eabd:	movups 0xe0(%rsp),%xmm2
  63eac5:	movaps %xmm0,0x60(%rsp)
  63eaca:	movaps %xmm1,0x70(%rsp)
  63eacf:	movaps %xmm2,0x80(%rsp)
  63ead7:	lea    0x60(%r14),%rsi
  63eadb:	lea    0x90(%rsp),%rdi
  63eae3:	call   63cd90 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63eae8:	lea    0x90(%r14),%rsi
  63eaef:	mov    %rsp,%rdi
  63eaf2:	call   63cd90 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63eaf7:	movups 0x90(%rsp),%xmm0
  63eaff:	movups 0xa0(%rsp),%xmm1
  63eb07:	movups 0xb0(%rsp),%xmm2
  63eb0f:	movaps %xmm2,0xe0(%rsp)
  63eb17:	movaps %xmm1,0xd0(%rsp)
  63eb1f:	movaps %xmm0,0xc0(%rsp)
  63eb27:	movups (%rsp),%xmm0
  63eb2b:	movups 0x10(%rsp),%xmm1
  63eb30:	movups 0x20(%rsp),%xmm2
  63eb35:	movaps %xmm0,0xf0(%rsp)
  63eb3d:	movaps %xmm1,0x100(%rsp)
  63eb45:	movaps %xmm2,0x110(%rsp)
  63eb4d:	movzbl %bpl,%ebp
  63eb51:	lea    0x550(%rsp),%rdi
  63eb59:	lea    0x30(%rsp),%rsi
  63eb5e:	lea    0xc0(%rsp),%rdx
  63eb66:	mov    %ebp,%ecx
  63eb68:	call   *0x435d62(%rip)        # a748d0 <_DYNAMIC+0x700>
  63eb6e:	movzbl 0x73b(%rsp),%r15d
  63eb77:	cmp    $0x2,%r15b
  63eb7b:	jne    63eb8c <hyperpath::specctra::import_specctra_trace_record+0x12c>
  63eb7d:	movb   $0x9,(%rbx)
  63eb80:	movb   $0x2,0x2ec(%rbx)
  63eb87:	jmp    63ed6d <hyperpath::specctra::import_specctra_trace_record+0x30d>
  63eb8c:	movzbl 0x550(%rsp),%r12d
  63eb95:	lea    0x551(%rsp),%rsi
  63eb9d:	lea    0xc1(%rsp),%rdi
  63eba5:	mov    $0x1ea,%edx
  63ebaa:	call   *0x435930(%rip)        # a744e0 <memcpy@GLIBC_2.14>
  63ebb0:	mov    0x73c(%rsp),%rax
  63ebb8:	mov    %rax,0x2ac(%rsp)
  63ebc0:	mov    0x744(%rsp),%eax
  63ebc7:	mov    %eax,0x2b4(%rsp)
  63ebce:	mov    %r12b,0xc0(%rsp)
  63ebd6:	mov    %r15b,0x2ab(%rsp)
  63ebde:	lea    0xc0(%r14),%rsi
  63ebe5:	lea    0x30(%rsp),%rdi
  63ebea:	call   63cd90 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  63ebef:	lea    0x550(%rsp),%rdi
  63ebf7:	lea    0xc0(%rsp),%rsi
  63ebff:	lea    0x30(%rsp),%rdx
  63ec04:	mov    %ebp,%ecx
  63ec06:	call   *0x435e8c(%rip)        # a74a98 <_DYNAMIC+0x8c8>
  63ec0c:	movzbl 0x7d4(%rsp),%r15d
  63ec15:	cmp    $0x2,%r15b
  63ec19:	jne    63ec5a <hyperpath::specctra::import_specctra_trace_record+0x1fa>
  63ec1b:	mov    $0x9,%al
  63ec1d:	cmpq   $0x24,0x558(%rsp)
  63ec26:	jne    63ec4c <hyperpath::specctra::import_specctra_trace_record+0x1ec>
  63ec28:	mov    0x550(%rsp),%rdi
  63ec30:	lea    -0x4e76ef(%rip),%rsi        # 157548 <anon.250a83acb62e5f288b4b2c1a9f3a192b.40.llvm.4692429209761240384+0x26>
  63ec37:	mov    $0x24,%edx
  63ec3c:	call   *0x435f46(%rip)        # a74b88 <bcmp@GLIBC_2.2.5>
  63ec42:	test   %eax,%eax
  63ec44:	setne  %al
  63ec47:	shl    $0x3,%al
  63ec4a:	inc    %al
  63ec4c:	mov    %al,(%rbx)
  63ec4e:	movb   $0x2,0x2ec(%rbx)
  63ec55:	jmp    63ed6d <hyperpath::specctra::import_specctra_trace_record+0x30d>
  63ec5a:	movzbl 0x550(%rsp),%r12d
  63ec63:	lea    0x551(%rsp),%rsi
  63ec6b:	lea    0x2c1(%rsp),%rdi
  63ec73:	mov    $0x283,%edx
  63ec78:	call   *0x435862(%rip)        # a744e0 <memcpy@GLIBC_2.14>
  63ec7e:	mov    0x7d5(%rsp),%rax
  63ec86:	mov    %rax,0x545(%rsp)
  63ec8e:	mov    0x7dc(%rsp),%eax
  63ec95:	mov    %eax,0x54c(%rsp)
  63ec9c:	mov    %r12b,0x2c0(%rsp)
  63eca4:	mov    %r15b,0x544(%rsp)
  63ecac:	mov    0xf0(%r14),%r15d
  63ecb3:	movzwl 0xf4(%r14),%r14d
  63ecbb:	lea    0x2c0(%rsp),%rdi
  63ecc3:	mov    %ebp,%esi
  63ecc5:	call   *0x43654d(%rip)        # a75218 <_DYNAMIC+0x1048>
  63eccb:	shl    $0x3,%eax
  63ecce:	mov    $0x2010002,%ebp
  63ecd3:	mov    %eax,%ecx
  63ecd5:	shr    %cl,%ebp
  63ecd7:	movups 0x538(%rsp),%xmm0
  63ecdf:	movups %xmm0,0x2e0(%rbx)
  63ece6:	movups 0x528(%rsp),%xmm0
  63ecee:	movups %xmm0,0x2d0(%rbx)
  63ecf5:	movups 0x4e8(%rsp),%xmm0
  63ecfd:	movups 0x4f8(%rsp),%xmm1
  63ed05:	movups 0x508(%rsp),%xmm2
  63ed0d:	movups 0x518(%rsp),%xmm3
  63ed15:	movups %xmm3,0x2c0(%rbx)
  63ed1c:	movups %xmm2,0x2b0(%rbx)
  63ed23:	movups %xmm1,0x2a0(%rbx)
  63ed2a:	movups %xmm0,0x290(%rbx)
  63ed31:	movzbl 0x4d2(%rsp),%r12d
  63ed3a:	lea    0x2c0(%rsp),%rsi
  63ed42:	mov    $0x290,%edx
  63ed47:	mov    %rbx,%rdi
  63ed4a:	call   *0x435790(%rip)        # a744e0 <memcpy@GLIBC_2.14>
  63ed50:	mov    %r15d,0x2f8(%rbx)
  63ed57:	mov    %r14w,0x2fc(%rbx)
  63ed5f:	mov    %bpl,0x2f0(%rbx)
  63ed66:	mov    %r12b,0x2f1(%rbx)
  63ed6d:	mov    %rbx,%rax
  63ed70:	add    $0x7e0,%rsp
  63ed77:	pop    %rbx
  63ed78:	pop    %r12
  63ed7a:	pop    %r14
  63ed7c:	pop    %r15
  63ed7e:	pop    %rbp
  63ed7f:	ret
  63ed80:	mov    %rax,%rbx
  63ed83:	lea    0x2c0(%rsp),%rdi
  63ed8b:	call   60e820 <core::ptr::drop_in_place<hyperpath::swept::SweptLineSegment>>
  63ed90:	jmp    63ede2 <hyperpath::specctra::import_specctra_trace_record+0x382>
  63ed92:	call   *0x435738(%rip)        # a744d0 <_DYNAMIC+0x300>
  63ed98:	mov    %rax,%rbx
  63ed9b:	lea    0xc0(%rsp),%rdi
  63eda3:	call   63c7e0 <core::ptr::drop_in_place<hyperpath::segment::LinePathSegment>>
  63eda8:	jmp    63ede2 <hyperpath::specctra::import_specctra_trace_record+0x382>
  63edaa:	mov    %rax,%rbx
  63edad:	lea    0x90(%rsp),%rdi
  63edb5:	call   63c280 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63edba:	jmp    63edc5 <hyperpath::specctra::import_specctra_trace_record+0x365>
  63edbc:	call   *0x43570e(%rip)        # a744d0 <_DYNAMIC+0x300>
  63edc2:	mov    %rax,%rbx
  63edc5:	lea    0x30(%rsp),%rdi
  63edca:	call   63c240 <core::ptr::drop_in_place<hyperlattice::point::Point2>>
  63edcf:	jmp    63ede2 <hyperpath::specctra::import_specctra_trace_record+0x382>
  63edd1:	call   *0x4356f9(%rip)        # a744d0 <_DYNAMIC+0x300>
  63edd7:	mov    %rax,%rbx
  63edda:	mov    %rsp,%rdi
  63eddd:	call   63c280 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63ede2:	mov    %rbx,%rdi
  63ede5:	call   a2d970 <_Unwind_Resume@plt>
  63edea:	call   *0x4356e0(%rip)        # a744d0 <_DYNAMIC+0x300>
