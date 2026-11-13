
/tmp/interval-refactor/dynamics-cost-binaries/whole-inline-reports:     file format elf64-x86-64


Disassembly of section .text:

000000000061ea80 <hyperpath::specctra::parse_specctra_grid_trace_records>:
  61ea80:	push   %rbp
  61ea81:	push   %r15
  61ea83:	push   %r14
  61ea85:	push   %r13
  61ea87:	push   %r12
  61ea89:	push   %rbx
  61ea8a:	sub    $0x108,%rsp
  61ea91:	mov    %rdi,%rbx
  61ea94:	lea    0x60(%rsp),%rdi
  61ea99:	call   *0x453e09(%rip)        # a728a8 <_DYNAMIC+0x470>
  61ea9f:	mov    0x60(%rsp),%rcx
  61eaa4:	mov    %rcx,%rax
  61eaa7:	neg    %rax
  61eaaa:	movzbl 0x68(%rsp),%eax
  61eaaf:	jno    61eac6 <hyperpath::specctra::parse_specctra_grid_trace_records+0x46>
  61eab1:	movabs $0x8000000000000000,%rcx
  61eabb:	mov    %al,0x8(%rbx)
  61eabe:	mov    %rcx,(%rbx)
  61eac1:	jmp    61ed28 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  61eac6:	mov    %rcx,0x18(%rsp)
  61eacb:	movzbl %al,%eax
  61eace:	movzbl 0x6f(%rsp),%ecx
  61ead3:	shl    $0x10,%ecx
  61ead6:	movzwl 0x6d(%rsp),%edx
  61eadb:	or     %ecx,%edx
  61eadd:	mov    0x69(%rsp),%r15d
  61eae2:	shl    $0x28,%rdx
  61eae6:	shl    $0x8,%r15
  61eaea:	or     %rdx,%r15
  61eaed:	or     %rax,%r15
  61eaf0:	mov    0x70(%rsp),%rbp
  61eaf5:	mov    0x78(%rsp),%rax
  61eafa:	mov    %rax,0x28(%rsp)
  61eaff:	mov    0x80(%rsp),%rax
  61eb07:	mov    %rax,0x20(%rsp)
  61eb0c:	mov    0x88(%rsp),%r13
  61eb14:	movups 0x90(%rsp),%xmm0
  61eb1c:	movups %xmm0,(%rbx)
  61eb1f:	mov    0xa0(%rsp),%rax
  61eb27:	mov    %rbx,0x58(%rsp)
  61eb2c:	mov    %rax,0x10(%rbx)
  61eb30:	mov    0xa8(%rsp),%rax
  61eb38:	mov    %rax,0x30(%rsp)
  61eb3d:	mov    0xb0(%rsp),%rax
  61eb45:	mov    %rax,(%rsp)
  61eb49:	mov    0xc0(%rsp),%rax
  61eb51:	mov    %rax,0x38(%rsp)
  61eb56:	mov    0xc8(%rsp),%rax
  61eb5e:	mov    %rax,0x8(%rsp)
  61eb63:	mov    0xd8(%rsp),%rax
  61eb6b:	mov    %rax,0x40(%rsp)
  61eb70:	mov    0xe0(%rsp),%rax
  61eb78:	mov    %rax,0x48(%rsp)
  61eb7d:	mov    0xe8(%rsp),%r14
  61eb85:	mov    0xf0(%rsp),%rax
  61eb8d:	mov    %rax,0x50(%rsp)
  61eb92:	mov    0xf8(%rsp),%rax
  61eb9a:	mov    %rax,0x10(%rsp)
  61eb9f:	test   %rbp,%rbp
  61eba2:	je     61ebdf <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  61eba4:	lea    0x8(%r15),%rbx
  61eba8:	mov    0x453ad9(%rip),%r12        # a72688 <_DYNAMIC+0x250>
  61ebaf:	jmp    61ebc9 <hyperpath::specctra::parse_specctra_grid_trace_records+0x149>
  61ebb1:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  61ebc0:	add    $0x20,%rbx
  61ebc4:	dec    %rbp
  61ebc7:	je     61ebdf <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  61ebc9:	mov    -0x8(%rbx),%rsi
  61ebcd:	test   %rsi,%rsi
  61ebd0:	je     61ebc0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  61ebd2:	mov    (%rbx),%rdi
  61ebd5:	mov    $0x1,%edx
  61ebda:	call   *%r12
  61ebdd:	jmp    61ebc0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  61ebdf:	mov    0x18(%rsp),%rsi
  61ebe4:	test   %rsi,%rsi
  61ebe7:	je     61ebfb <hyperpath::specctra::parse_specctra_grid_trace_records+0x17b>
  61ebe9:	shl    $0x5,%rsi
  61ebed:	mov    $0x8,%edx
  61ebf2:	mov    %r15,%rdi
  61ebf5:	call   *0x453a8d(%rip)        # a72688 <_DYNAMIC+0x250>
  61ebfb:	test   %r13,%r13
  61ebfe:	mov    0x20(%rsp),%r12
  61ec03:	je     61ec3f <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  61ec05:	lea    0x8(%r12),%rbx
  61ec0a:	mov    0x453a77(%rip),%r15        # a72688 <_DYNAMIC+0x250>
  61ec11:	jmp    61ec29 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a9>
  61ec13:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  61ec20:	add    $0x20,%rbx
  61ec24:	dec    %r13
  61ec27:	je     61ec3f <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  61ec29:	mov    -0x8(%rbx),%rsi
  61ec2d:	test   %rsi,%rsi
  61ec30:	je     61ec20 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  61ec32:	mov    (%rbx),%rdi
  61ec35:	mov    $0x1,%edx
  61ec3a:	call   *%r15
  61ec3d:	jmp    61ec20 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  61ec3f:	mov    0x28(%rsp),%rsi
  61ec44:	test   %rsi,%rsi
  61ec47:	je     61ec5b <hyperpath::specctra::parse_specctra_grid_trace_records+0x1db>
  61ec49:	shl    $0x5,%rsi
  61ec4d:	mov    $0x8,%edx
  61ec52:	mov    %r12,%rdi
  61ec55:	call   *0x453a2d(%rip)        # a72688 <_DYNAMIC+0x250>
  61ec5b:	mov    0x30(%rsp),%rax
  61ec60:	test   %rax,%rax
  61ec63:	mov    0x58(%rsp),%rbx
  61ec68:	mov    0x48(%rsp),%r13
  61ec6d:	je     61ec82 <hyperpath::specctra::parse_specctra_grid_trace_records+0x202>
  61ec6f:	imul   $0x38,%rax,%rsi
  61ec73:	mov    $0x8,%edx
  61ec78:	mov    (%rsp),%rdi
  61ec7c:	call   *0x453a06(%rip)        # a72688 <_DYNAMIC+0x250>
  61ec82:	mov    0x38(%rsp),%rax
  61ec87:	test   %rax,%rax
  61ec8a:	je     61eca4 <hyperpath::specctra::parse_specctra_grid_trace_records+0x224>
  61ec8c:	shl    $0x4,%rax
  61ec90:	lea    (%rax,%rax,4),%rsi
  61ec94:	mov    $0x8,%edx
  61ec99:	mov    0x8(%rsp),%rdi
  61ec9e:	call   *0x4539e4(%rip)        # a72688 <_DYNAMIC+0x250>
  61eca4:	test   %r14,%r14
  61eca7:	je     61ecea <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  61eca9:	lea    0x10(%r13),%r15
  61ecad:	mov    0x4539d4(%rip),%r12        # a72688 <_DYNAMIC+0x250>
  61ecb4:	jmp    61ecc9 <hyperpath::specctra::parse_specctra_grid_trace_records+0x249>
  61ecb6:	cs nopw 0x0(%rax,%rax,1)
  61ecc0:	add    $0x38,%r15
  61ecc4:	dec    %r14
  61ecc7:	je     61ecea <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  61ecc9:	cmpl   $0x2,-0x10(%r15)
  61ecce:	jb     61ecc0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  61ecd0:	mov    -0x8(%r15),%rsi
  61ecd4:	test   %rsi,%rsi
  61ecd7:	je     61ecc0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  61ecd9:	mov    (%r15),%rdi
  61ecdc:	shl    $0x4,%rsi
  61ece0:	mov    $0x8,%edx
  61ece5:	call   *%r12
  61ece8:	jmp    61ecc0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  61ecea:	mov    0x40(%rsp),%rax
  61ecef:	test   %rax,%rax
  61ecf2:	je     61ed06 <hyperpath::specctra::parse_specctra_grid_trace_records+0x286>
  61ecf4:	imul   $0x38,%rax,%rsi
  61ecf8:	mov    $0x8,%edx
  61ecfd:	mov    %r13,%rdi
  61ed00:	call   *0x453982(%rip)        # a72688 <_DYNAMIC+0x250>
  61ed06:	mov    0x50(%rsp),%rax
  61ed0b:	test   %rax,%rax
  61ed0e:	je     61ed28 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  61ed10:	shl    $0x3,%rax
  61ed14:	lea    (%rax,%rax,4),%rsi
  61ed18:	mov    $0x8,%edx
  61ed1d:	mov    0x10(%rsp),%rdi
  61ed22:	call   *0x453960(%rip)        # a72688 <_DYNAMIC+0x250>
  61ed28:	mov    %rbx,%rax
  61ed2b:	add    $0x108,%rsp
  61ed32:	pop    %rbx
  61ed33:	pop    %r12
  61ed35:	pop    %r13
  61ed37:	pop    %r14
  61ed39:	pop    %r15
  61ed3b:	pop    %rbp
  61ed3c:	ret
