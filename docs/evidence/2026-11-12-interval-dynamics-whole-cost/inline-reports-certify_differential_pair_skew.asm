
/tmp/interval-refactor/dynamics-cost-binaries/whole-inline-reports:     file format elf64-x86-64


Disassembly of section .text:

0000000000631900 <hyperpath::routing::certify_differential_pair_skew>:
  631900:	push   %rbp
  631901:	push   %r15
  631903:	push   %r14
  631905:	push   %r13
  631907:	push   %r12
  631909:	push   %rbx
  63190a:	sub    $0x3f8,%rsp
  631911:	mov    %r9,%rbx
  631914:	mov    %rdi,%r14
  631917:	test   %rdx,%rdx
  63191a:	je     631951 <hyperpath::routing::certify_differential_pair_skew+0x51>
  63191c:	mov    %r8,%r15
  63191f:	test   %r8,%r8
  631922:	je     631951 <hyperpath::routing::certify_differential_pair_skew+0x51>
  631924:	mov    %rcx,%r12
  631927:	movzbl 0x430(%rsp),%ebp
  63192f:	lea    0x140(%rsp),%rdi
  631937:	mov    %ebp,%ecx
  631939:	call   62a1c0 <hyperpath::routing::route_axis_length>
  63193e:	movzbl 0x140(%rsp),%eax
  631946:	cmp    $0x16,%al
  631948:	jne    631980 <hyperpath::routing::certify_differential_pair_skew+0x80>
  63194a:	movb   $0x1,0x8(%r14)
  63194f:	jmp    631956 <hyperpath::routing::certify_differential_pair_skew+0x56>
  631951:	movb   $0x0,0x8(%r14)
  631956:	movabs $0x8000000000000000,%rax
  631960:	mov    %rax,(%r14)
  631963:	mov    %rbx,%rdi
  631966:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63196b:	mov    %r14,%rax
  63196e:	add    $0x3f8,%rsp
  631975:	pop    %rbx
  631976:	pop    %r12
  631978:	pop    %r13
  63197a:	pop    %r14
  63197c:	pop    %r15
  63197e:	pop    %rbp
  63197f:	ret
  631980:	movzbl 0x141(%rsp),%ecx
  631988:	movups 0x142(%rsp),%xmm0
  631990:	movups %xmm0,0x4a(%rsp)
  631995:	movups 0x152(%rsp),%xmm0
  63199d:	movups %xmm0,0x5a(%rsp)
  6319a2:	movdqu 0x160(%rsp),%xmm0
  6319ab:	movdqu %xmm0,0x68(%rsp)
  6319b1:	mov    %al,0x48(%rsp)
  6319b5:	mov    %cl,0x49(%rsp)
  6319b9:	lea    0x140(%rsp),%rdi
  6319c1:	mov    %r12,%rsi
  6319c4:	mov    %r15,%rdx
  6319c7:	mov    %ebp,%ecx
  6319c9:	call   62a1c0 <hyperpath::routing::route_axis_length>
  6319ce:	movzbl 0x140(%rsp),%eax
  6319d6:	cmp    $0x16,%al
  6319d8:	jne    6319fb <hyperpath::routing::certify_differential_pair_skew+0xfb>
  6319da:	movb   $0x1,0x8(%r14)
  6319df:	movabs $0x8000000000000000,%rax
  6319e9:	mov    %rax,(%r14)
  6319ec:	lea    0x48(%rsp),%rdi
  6319f1:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  6319f6:	jmp    631963 <hyperpath::routing::certify_differential_pair_skew+0x63>
  6319fb:	movzbl 0x141(%rsp),%ecx
  631a03:	movups 0x142(%rsp),%xmm0
  631a0b:	movups %xmm0,0x7a(%rsp)
  631a10:	movups 0x152(%rsp),%xmm0
  631a18:	movups %xmm0,0x8a(%rsp)
  631a20:	movdqu 0x160(%rsp),%xmm0
  631a29:	movdqu %xmm0,0x98(%rsp)
  631a32:	mov    %al,0x78(%rsp)
  631a36:	mov    %cl,0x79(%rsp)
  631a3a:	lea    0x310(%rsp),%rdi
  631a42:	lea    0x48(%rsp),%rsi
  631a47:	call   627f50 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631a4c:	lea    0x140(%rsp),%rdi
  631a54:	lea    0x78(%rsp),%rsi
  631a59:	call   627f50 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631a5e:	lea    0x240(%rsp),%rdi
  631a66:	lea    0x310(%rsp),%rsi
  631a6e:	lea    0x140(%rsp),%rdx
  631a76:	call   5a9ca0 <<&hyperreal::real::arithmetic::Real as core::ops::arith::Sub<T>>::sub>
  631a7b:	lea    0x140(%rsp),%rdi
  631a83:	call   5a21b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631a88:	lea    0x310(%rsp),%rdi
  631a90:	call   5a21b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631a95:	movq   $0x0,0xe0(%rsp)
  631aa1:	movq   $0x8,0xe8(%rsp)
  631aad:	pxor   %xmm0,%xmm0
  631ab1:	movdqu %xmm0,0xf0(%rsp)
  631aba:	movq   $0x8,0x100(%rsp)
  631ac6:	movq   $0x0,0x108(%rsp)
  631ad2:	mov    $0x1,%bpl
  631ad5:	lea    0x140(%rsp),%rdi
  631add:	lea    0x48(%rsp),%rsi
  631ae2:	call   627f50 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631ae7:	movdqu 0x140(%rsp),%xmm0
  631af0:	movups 0x150(%rsp),%xmm1
  631af8:	movups 0x160(%rsp),%xmm2
  631b00:	movaps %xmm2,0x130(%rsp)
  631b08:	movaps %xmm1,0x120(%rsp)
  631b10:	movdqa %xmm0,0x110(%rsp)
  631b19:	lea    0x140(%rsp),%rdi
  631b21:	lea    0x78(%rsp),%rsi
  631b26:	call   627f50 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631b2b:	movdqu 0x140(%rsp),%xmm0
  631b34:	movups 0x150(%rsp),%xmm1
  631b3c:	movups 0x160(%rsp),%xmm2
  631b44:	movaps %xmm2,0x30(%rsp)
  631b49:	movaps %xmm1,0x20(%rsp)
  631b4e:	movdqa %xmm0,0x10(%rsp)
  631b54:	lea    0xa8(%rsp),%rdi
  631b5c:	mov    %rbx,%rsi
  631b5f:	call   627f50 <<hyperreal::real::arithmetic::Real as core::clone::Clone>::clone>
  631b64:	lea    0x310(%rsp),%rdi
  631b6c:	lea    0x110(%rsp),%rsi
  631b74:	lea    0x10(%rsp),%rdx
  631b79:	call   *0x441609(%rip)        # a73188 <_DYNAMIC+0xd50>
  631b7f:	movdqu 0xa8(%rsp),%xmm0
  631b88:	movups 0xb8(%rsp),%xmm1
  631b90:	movups 0xc8(%rsp),%xmm2
  631b98:	movaps %xmm2,0x160(%rsp)
  631ba0:	movaps %xmm1,0x150(%rsp)
  631ba8:	movdqa %xmm0,0x140(%rsp)
  631bb1:	lea    0x2d0(%rsp),%rdi
  631bb9:	lea    0x310(%rsp),%rsi
  631bc1:	lea    0x140(%rsp),%rdx
  631bc9:	call   *0x4415b9(%rip)        # a73188 <_DYNAMIC+0xd50>
  631bcf:	lea    -0x4dac66(%rip),%rsi        # 156f70 <anon.40aa6753edb3d51d1f4ba64e16da7b53.20.llvm.14261911909539742293+0x3b>
  631bd6:	lea    0x140(%rsp),%rdi
  631bde:	lea    0x2d0(%rsp),%rcx
  631be6:	mov    $0x16,%edx
  631beb:	call   623750 <hypersolve::model::Constraint::equality>
  631bf0:	lea    0xe0(%rsp),%rdi
  631bf8:	lea    0x140(%rsp),%rsi
  631c00:	call   *0x441592(%rip)        # a73198 <_DYNAMIC+0xd60>
  631c06:	lea    0x310(%rsp),%rdi
  631c0e:	lea    0xe0(%rsp),%rsi
  631c16:	call   *0x441584(%rip)        # a731a0 <_DYNAMIC+0xd68>
  631c1c:	lea    0xa8(%rsp),%rdi
  631c24:	lea    0xe0(%rsp),%rsi
  631c2c:	call   *0x441576(%rip)        # a731a8 <_DYNAMIC+0xd70>
  631c32:	movups 0x48(%rsp),%xmm0
  631c37:	movups 0x58(%rsp),%xmm1
  631c3c:	movups 0x68(%rsp),%xmm2
  631c41:	movaps %xmm2,0x290(%rsp)
  631c49:	movaps %xmm1,0x280(%rsp)
  631c51:	movaps %xmm0,0x270(%rsp)
  631c59:	movups 0x78(%rsp),%xmm0
  631c5e:	movups 0x88(%rsp),%xmm1
  631c66:	movups 0x98(%rsp),%xmm2
  631c6e:	movaps %xmm2,0x2c0(%rsp)
  631c76:	movaps %xmm1,0x2b0(%rsp)
  631c7e:	movaps %xmm0,0x2a0(%rsp)
  631c86:	movups 0x240(%rsp),%xmm0
  631c8e:	movups 0x250(%rsp),%xmm1
  631c96:	movups 0x260(%rsp),%xmm2
  631c9e:	movaps %xmm2,0x130(%rsp)
  631ca6:	movaps %xmm1,0x120(%rsp)
  631cae:	movaps %xmm0,0x110(%rsp)
  631cb6:	movdqu (%rbx),%xmm0
  631cba:	movups 0x10(%rbx),%xmm1
  631cbe:	movups 0x20(%rbx),%xmm2
  631cc2:	movaps %xmm2,0x30(%rsp)
  631cc7:	movaps %xmm1,0x20(%rsp)
  631ccc:	movdqa %xmm0,0x10(%rsp)
  631cd2:	lea    0x2d0(%rsp),%rdi
  631cda:	lea    0x310(%rsp),%rsi
  631ce2:	lea    0xa8(%rsp),%rdx
  631cea:	call   *0x4414c0(%rip)        # a731b0 <_DYNAMIC+0xd78>
  631cf0:	movaps 0x270(%rsp),%xmm0
  631cf8:	movaps 0x280(%rsp),%xmm1
  631d00:	movaps 0x290(%rsp),%xmm2
  631d08:	movaps %xmm2,0x1a0(%rsp)
  631d10:	movaps %xmm1,0x190(%rsp)
  631d18:	movaps %xmm0,0x180(%rsp)
  631d20:	movaps 0x2a0(%rsp),%xmm0
  631d28:	movaps 0x2b0(%rsp),%xmm1
  631d30:	movaps 0x2c0(%rsp),%xmm2
  631d38:	movaps %xmm0,0x1b0(%rsp)
  631d40:	movaps %xmm1,0x1c0(%rsp)
  631d48:	movaps %xmm2,0x1d0(%rsp)
  631d50:	movups 0x240(%rsp),%xmm0
  631d58:	movups 0x250(%rsp),%xmm1
  631d60:	movups 0x260(%rsp),%xmm2
  631d68:	movaps %xmm0,0x1e0(%rsp)
  631d70:	movaps %xmm1,0x1f0(%rsp)
  631d78:	movaps %xmm2,0x200(%rsp)
  631d80:	movaps 0x10(%rsp),%xmm0
  631d85:	movaps 0x20(%rsp),%xmm1
  631d8a:	movaps 0x30(%rsp),%xmm2
  631d8f:	movaps %xmm2,0x230(%rsp)
  631d97:	movaps %xmm1,0x220(%rsp)
  631d9f:	movaps %xmm0,0x210(%rsp)
  631da7:	movdqu 0x2d0(%rsp),%xmm0
  631db0:	movups 0x2e0(%rsp),%xmm1
  631db8:	movups 0x2f0(%rsp),%xmm2
  631dc0:	movups 0x300(%rsp),%xmm3
  631dc8:	movdqa %xmm0,0x140(%rsp)
  631dd1:	movaps %xmm1,0x150(%rsp)
  631dd9:	movaps %xmm2,0x160(%rsp)
  631de1:	movaps %xmm3,0x170(%rsp)
  631de9:	lea    0x140(%rsp),%rsi
  631df1:	mov    $0x100,%edx
  631df6:	mov    %r14,%rdi
  631df9:	call   *0x440949(%rip)        # a72748 <memcpy@GLIBC_2.14>
  631dff:	mov    0xb0(%rsp),%r15
  631e07:	test   %r15,%r15
  631e0a:	je     631ec3 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  631e10:	mov    %rbx,0x8(%rsp)
  631e15:	mov    0xc0(%rsp),%r12
  631e1d:	test   %r12,%r12
  631e20:	je     631e90 <hyperpath::routing::certify_differential_pair_skew+0x590>
  631e22:	mov    0xa8(%rsp),%r13
  631e2a:	movdqa 0x0(%r13),%xmm0
  631e30:	lea    0x10(%r13),%rbp
  631e34:	pmovmskb %xmm0,%ebx
  631e38:	not    %ebx
  631e3a:	nopw   0x0(%rax,%rax,1)
  631e40:	test   %bx,%bx
  631e43:	jne    631e6c <hyperpath::routing::certify_differential_pair_skew+0x56c>
  631e45:	data16 cs nopw 0x0(%rax,%rax,1)
  631e50:	movdqa 0x0(%rbp),%xmm0
  631e55:	add    $0xfffffffffffffc80,%r13
  631e5c:	add    $0x10,%rbp
  631e60:	pmovmskb %xmm0,%ebx
  631e64:	xor    $0xffff,%ebx
  631e6a:	je     631e50 <hyperpath::routing::certify_differential_pair_skew+0x550>
  631e6c:	tzcnt  %ebx,%eax
  631e70:	neg    %rax
  631e73:	imul   $0x38,%rax,%rax
  631e77:	lea    (%rax,%r13,1),%rdi
  631e7b:	add    $0xffffffffffffffd0,%rdi
  631e7f:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631e84:	lea    -0x1(%rbx),%eax
  631e87:	and    %ebx,%eax
  631e89:	mov    %eax,%ebx
  631e8b:	dec    %r12
  631e8e:	jne    631e40 <hyperpath::routing::certify_differential_pair_skew+0x540>
  631e90:	imul   $0x38,%r15,%rax
  631e94:	add    $0x47,%rax
  631e98:	and    $0xfffffffffffffff0,%rax
  631e9c:	add    %rax,%r15
  631e9f:	add    $0x11,%r15
  631ea3:	mov    0x8(%rsp),%rbx
  631ea8:	je     631ec3 <hyperpath::routing::certify_differential_pair_skew+0x5c3>
  631eaa:	mov    0xa8(%rsp),%rdi
  631eb2:	sub    %rax,%rdi
  631eb5:	mov    $0x10,%edx
  631eba:	mov    %r15,%rsi
  631ebd:	call   *0x4407c5(%rip)        # a72688 <_DYNAMIC+0x250>
  631ec3:	xor    %ebp,%ebp
  631ec5:	lea    0x310(%rsp),%rdi
  631ecd:	call   6268a0 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  631ed2:	lea    0xe0(%rsp),%rdi
  631eda:	call   625e70 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  631edf:	jmp    63196b <hyperpath::routing::certify_differential_pair_skew+0x6b>
  631ee4:	mov    %rbx,0x8(%rsp)
  631ee9:	mov    %rax,%r14
  631eec:	lea    0x10(%rsp),%rdi
  631ef1:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631ef6:	lea    0x110(%rsp),%rdi
  631efe:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631f03:	lea    0x2a0(%rsp),%rdi
  631f0b:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631f10:	lea    0x270(%rsp),%rdi
  631f18:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631f1d:	lea    0xa8(%rsp),%rdi
  631f25:	call   6267c0 <core::ptr::drop_in_place<hypersolve::eval::EvaluationContext>>
  631f2a:	jmp    63201b <hyperpath::routing::certify_differential_pair_skew+0x71b>
  631f2f:	mov    %rbx,0x8(%rsp)
  631f34:	mov    %rax,%r14
  631f37:	mov    $0x1,%bpl
  631f3a:	jmp    63201d <hyperpath::routing::certify_differential_pair_skew+0x71d>
  631f3f:	mov    %rbx,0x8(%rsp)
  631f44:	mov    %rax,%r14
  631f47:	lea    0xa8(%rsp),%rdi
  631f4f:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631f54:	mov    $0x1,%bpl
  631f57:	jmp    63202a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  631f5c:	call   *0x4407d6(%rip)        # a72738 <_DYNAMIC+0x300>
  631f62:	mov    %rbx,0x8(%rsp)
  631f67:	mov    %rax,%r14
  631f6a:	lea    0x10(%rsp),%rdi
  631f6f:	call   625fa0 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  631f74:	jmp    631f7e <hyperpath::routing::certify_differential_pair_skew+0x67e>
  631f76:	mov    %rbx,0x8(%rsp)
  631f7b:	mov    %rax,%r14
  631f7e:	mov    $0x1,%bpl
  631f81:	lea    0x110(%rsp),%rdi
  631f89:	call   625fa0 <core::ptr::drop_in_place<hypersolve::symbolic::Expr>>
  631f8e:	jmp    63202a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  631f93:	jmp    631fdd <hyperpath::routing::certify_differential_pair_skew+0x6dd>
  631f95:	mov    %rbx,0x8(%rsp)
  631f9a:	mov    %rax,%r14
  631f9d:	jmp    631fb4 <hyperpath::routing::certify_differential_pair_skew+0x6b4>
  631f9f:	mov    %rbx,0x8(%rsp)
  631fa4:	mov    %rax,%r14
  631fa7:	lea    0x140(%rsp),%rdi
  631faf:	call   5a21b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631fb4:	lea    0x310(%rsp),%rdi
  631fbc:	call   5a21b0 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631fc1:	jmp    632049 <hyperpath::routing::certify_differential_pair_skew+0x749>
  631fc6:	mov    %rbx,0x8(%rsp)
  631fcb:	mov    %rax,%r14
  631fce:	lea    0x310(%rsp),%rdi
  631fd6:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  631fdb:	jmp    632049 <hyperpath::routing::certify_differential_pair_skew+0x749>
  631fdd:	mov    %rbx,0x8(%rsp)
  631fe2:	mov    %rax,%r14
  631fe5:	jmp    632049 <hyperpath::routing::certify_differential_pair_skew+0x749>
  631fe7:	call   *0x44074b(%rip)        # a72738 <_DYNAMIC+0x300>
  631fed:	mov    %rbx,0x8(%rsp)
  631ff2:	mov    %rax,%r14
  631ff5:	mov    $0x1,%bpl
  631ff8:	jmp    63202a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  631ffa:	mov    %rbx,0x8(%rsp)
  631fff:	mov    %rax,%r14
  632002:	jmp    632053 <hyperpath::routing::certify_differential_pair_skew+0x753>
  632004:	mov    %rbx,0x8(%rsp)
  632009:	mov    %rax,%r14
  63200c:	jmp    63202a <hyperpath::routing::certify_differential_pair_skew+0x72a>
  63200e:	mov    %rbx,0x8(%rsp)
  632013:	mov    %rax,%r14
  632016:	jmp    63205d <hyperpath::routing::certify_differential_pair_skew+0x75d>
  632018:	mov    %rax,%r14
  63201b:	xor    %ebp,%ebp
  63201d:	lea    0x310(%rsp),%rdi
  632025:	call   6268a0 <core::ptr::drop_in_place<hypersolve::analysis::ProblemAnalysis>>
  63202a:	lea    0xe0(%rsp),%rdi
  632032:	call   625e70 <core::ptr::drop_in_place<hypersolve::model::Problem>>
  632037:	test   %bpl,%bpl
  63203a:	je     632067 <hyperpath::routing::certify_differential_pair_skew+0x767>
  63203c:	lea    0x240(%rsp),%rdi
  632044:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632049:	lea    0x78(%rsp),%rdi
  63204e:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632053:	lea    0x48(%rsp),%rdi
  632058:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  63205d:	mov    0x8(%rsp),%rdi
  632062:	call   626420 <core::ptr::drop_in_place<hyperreal::real::arithmetic::Real>>
  632067:	mov    %r14,%rdi
  63206a:	call   a2bbf0 <_Unwind_Resume@plt>
  63206f:	call   *0x4406c3(%rip)        # a72738 <_DYNAMIC+0x300>
