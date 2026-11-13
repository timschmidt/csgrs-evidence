
/tmp/interval-refactor/dynamics-cost-binaries/whole-control:     file format elf64-x86-64


Disassembly of section .text:

0000000000666a10 <hyperpath::specctra::import_specctra_trace_record>:
  666a10:	push   %rbp
  666a11:	push   %r15
  666a13:	push   %r14
  666a15:	push   %r12
  666a17:	push   %rbx
  666a18:	sub    $0x7e0,%rsp
  666a1f:	mov    %edx,%ebp
  666a21:	mov    %rsi,%r14
  666a24:	mov    %rdi,%rbx
  666a27:	mov    %rsp,%rdi
  666a2a:	call   664d40 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  666a2f:	lea    0x30(%r14),%rsi
  666a33:	lea    0xc0(%rsp),%rdi
  666a3b:	call   664d40 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  666a40:	movups (%rsp),%xmm0
  666a44:	movups 0x10(%rsp),%xmm1
  666a49:	movups 0x20(%rsp),%xmm2
  666a4e:	movaps %xmm2,0x50(%rsp)
  666a53:	movaps %xmm1,0x40(%rsp)
  666a58:	movaps %xmm0,0x30(%rsp)
  666a5d:	movups 0xc0(%rsp),%xmm0
  666a65:	movups 0xd0(%rsp),%xmm1
  666a6d:	movups 0xe0(%rsp),%xmm2
  666a75:	movaps %xmm0,0x60(%rsp)
  666a7a:	movaps %xmm1,0x70(%rsp)
  666a7f:	movaps %xmm2,0x80(%rsp)
  666a87:	lea    0x60(%r14),%rsi
  666a8b:	lea    0x90(%rsp),%rdi
  666a93:	call   664d40 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  666a98:	lea    0x90(%r14),%rsi
  666a9f:	mov    %rsp,%rdi
  666aa2:	call   664d40 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  666aa7:	movups 0x90(%rsp),%xmm0
  666aaf:	movups 0xa0(%rsp),%xmm1
  666ab7:	movups 0xb0(%rsp),%xmm2
  666abf:	movaps %xmm2,0xe0(%rsp)
  666ac7:	movaps %xmm1,0xd0(%rsp)
  666acf:	movaps %xmm0,0xc0(%rsp)
  666ad7:	movups (%rsp),%xmm0
  666adb:	movups 0x10(%rsp),%xmm1
  666ae0:	movups 0x20(%rsp),%xmm2
  666ae5:	movaps %xmm0,0xf0(%rsp)
  666aed:	movaps %xmm1,0x100(%rsp)
  666af5:	movaps %xmm2,0x110(%rsp)
  666afd:	movzbl %bpl,%ebp
  666b01:	lea    0x550(%rsp),%rdi
  666b09:	lea    0x30(%rsp),%rsi
  666b0e:	lea    0xc0(%rsp),%rdx
  666b16:	mov    %ebp,%ecx
  666b18:	call   *0x42974a(%rip)        # a90268 <_DYNAMIC+0x640>
  666b1e:	movzbl 0x73b(%rsp),%r15d
  666b27:	cmp    $0x2,%r15b
  666b2b:	jne    666b3c <hyperpath::specctra::import_specctra_trace_record+0x12c>
  666b2d:	movb   $0x9,(%rbx)
  666b30:	movb   $0x2,0x2ec(%rbx)
  666b37:	jmp    666d1d <hyperpath::specctra::import_specctra_trace_record+0x30d>
  666b3c:	movzbl 0x550(%rsp),%r12d
  666b45:	lea    0x551(%rsp),%rsi
  666b4d:	lea    0xc1(%rsp),%rdi
  666b55:	mov    $0x1ea,%edx
  666b5a:	call   *0x4293d8(%rip)        # a8ff38 <memcpy@GLIBC_2.14>
  666b60:	mov    0x73c(%rsp),%rax
  666b68:	mov    %rax,0x2ac(%rsp)
  666b70:	mov    0x744(%rsp),%eax
  666b77:	mov    %eax,0x2b4(%rsp)
  666b7e:	mov    %r12b,0xc0(%rsp)
  666b86:	mov    %r15b,0x2ab(%rsp)
  666b8e:	lea    0xc0(%r14),%rsi
  666b95:	lea    0x30(%rsp),%rdi
  666b9a:	call   664d40 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  666b9f:	lea    0x550(%rsp),%rdi
  666ba7:	lea    0xc0(%rsp),%rsi
  666baf:	lea    0x30(%rsp),%rdx
  666bb4:	mov    %ebp,%ecx
  666bb6:	call   *0x429934(%rip)        # a904f0 <_DYNAMIC+0x8c8>
  666bbc:	movzbl 0x7d4(%rsp),%r15d
  666bc5:	cmp    $0x2,%r15b
  666bc9:	jne    666c0a <hyperpath::specctra::import_specctra_trace_record+0x1fa>
  666bcb:	mov    $0x9,%al
  666bcd:	cmpq   $0x24,0x558(%rsp)
  666bd6:	jne    666bfc <hyperpath::specctra::import_specctra_trace_record+0x1ec>
  666bd8:	mov    0x550(%rsp),%rdi
  666be0:	lea    -0x50c9db(%rip),%rsi        # 15a20c <anon.03668e7bfaf57f21a2a56c7c1cd8f8da.40.llvm.8524560342600865291+0x26>
  666be7:	mov    $0x24,%edx
  666bec:	call   *0x4299ee(%rip)        # a905e0 <bcmp@GLIBC_2.2.5>
  666bf2:	test   %eax,%eax
  666bf4:	setne  %al
  666bf7:	shl    $0x3,%al
  666bfa:	inc    %al
  666bfc:	mov    %al,(%rbx)
  666bfe:	movb   $0x2,0x2ec(%rbx)
  666c05:	jmp    666d1d <hyperpath::specctra::import_specctra_trace_record+0x30d>
  666c0a:	movzbl 0x550(%rsp),%r12d
  666c13:	lea    0x551(%rsp),%rsi
  666c1b:	lea    0x2c1(%rsp),%rdi
  666c23:	mov    $0x283,%edx
  666c28:	call   *0x42930a(%rip)        # a8ff38 <memcpy@GLIBC_2.14>
  666c2e:	mov    0x7d5(%rsp),%rax
  666c36:	mov    %rax,0x545(%rsp)
  666c3e:	mov    0x7dc(%rsp),%eax
  666c45:	mov    %eax,0x54c(%rsp)
  666c4c:	mov    %r12b,0x2c0(%rsp)
  666c54:	mov    %r15b,0x544(%rsp)
  666c5c:	mov    0xf0(%r14),%r15d
  666c63:	movzwl 0xf4(%r14),%r14d
  666c6b:	lea    0x2c0(%rsp),%rdi
  666c73:	mov    %ebp,%esi
  666c75:	call   *0x429ff5(%rip)        # a90c70 <_DYNAMIC+0x1048>
  666c7b:	shl    $0x3,%eax
  666c7e:	mov    $0x2010002,%ebp
  666c83:	mov    %eax,%ecx
  666c85:	shr    %cl,%ebp
  666c87:	movups 0x538(%rsp),%xmm0
  666c8f:	movups %xmm0,0x2e0(%rbx)
  666c96:	movups 0x528(%rsp),%xmm0
  666c9e:	movups %xmm0,0x2d0(%rbx)
  666ca5:	movups 0x4e8(%rsp),%xmm0
  666cad:	movups 0x4f8(%rsp),%xmm1
  666cb5:	movups 0x508(%rsp),%xmm2
  666cbd:	movups 0x518(%rsp),%xmm3
  666cc5:	movups %xmm3,0x2c0(%rbx)
  666ccc:	movups %xmm2,0x2b0(%rbx)
  666cd3:	movups %xmm1,0x2a0(%rbx)
  666cda:	movups %xmm0,0x290(%rbx)
  666ce1:	movzbl 0x4d2(%rsp),%r12d
  666cea:	lea    0x2c0(%rsp),%rsi
  666cf2:	mov    $0x290,%edx
  666cf7:	mov    %rbx,%rdi
  666cfa:	call   *0x429238(%rip)        # a8ff38 <memcpy@GLIBC_2.14>
  666d00:	mov    %r15d,0x2f8(%rbx)
  666d07:	mov    %r14w,0x2fc(%rbx)
  666d0f:	mov    %bpl,0x2f0(%rbx)
  666d16:	mov    %r12b,0x2f1(%rbx)
  666d1d:	mov    %rbx,%rax
  666d20:	add    $0x7e0,%rsp
  666d27:	pop    %rbx
  666d28:	pop    %r12
  666d2a:	pop    %r14
  666d2c:	pop    %r15
  666d2e:	pop    %rbp
  666d2f:	ret
  666d30:	mov    %rax,%rbx
  666d33:	lea    0x2c0(%rsp),%rdi
  666d3b:	call   5e58f0 <core::ptr::drop_in_place<hyperpath::swept::SweptLineSegment>>
  666d40:	jmp    666d92 <hyperpath::specctra::import_specctra_trace_record+0x382>
  666d42:	call   *0x4291e0(%rip)        # a8ff28 <_DYNAMIC+0x300>
  666d48:	mov    %rax,%rbx
  666d4b:	lea    0xc0(%rsp),%rdi
  666d53:	call   664790 <core::ptr::drop_in_place<hyperpath::segment::LinePathSegment>>
  666d58:	jmp    666d92 <hyperpath::specctra::import_specctra_trace_record+0x382>
  666d5a:	mov    %rax,%rbx
  666d5d:	lea    0x90(%rsp),%rdi
  666d65:	call   664230 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  666d6a:	jmp    666d75 <hyperpath::specctra::import_specctra_trace_record+0x365>
  666d6c:	call   *0x4291b6(%rip)        # a8ff28 <_DYNAMIC+0x300>
  666d72:	mov    %rax,%rbx
  666d75:	lea    0x30(%rsp),%rdi
  666d7a:	call   6641f0 <core::ptr::drop_in_place<hyperlattice::point::Point2>>
  666d7f:	jmp    666d92 <hyperpath::specctra::import_specctra_trace_record+0x382>
  666d81:	call   *0x4291a1(%rip)        # a8ff28 <_DYNAMIC+0x300>
  666d87:	mov    %rax,%rbx
  666d8a:	mov    %rsp,%rdi
  666d8d:	call   664230 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  666d92:	mov    %rbx,%rdi
  666d95:	call   a49140 <_Unwind_Resume@plt>
  666d9a:	call   *0x429188(%rip)        # a8ff28 <_DYNAMIC+0x300>
