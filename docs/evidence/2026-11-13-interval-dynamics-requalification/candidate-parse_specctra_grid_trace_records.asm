
/tmp/interval-refactor/dynamics-requal-binaries/candidate:     file format elf64-x86-64


Disassembly of section .text:

000000000061ef30 <hyperpath::specctra::parse_specctra_grid_trace_records>:
  61ef30:	push   %rbp
  61ef31:	push   %r15
  61ef33:	push   %r14
  61ef35:	push   %r13
  61ef37:	push   %r12
  61ef39:	push   %rbx
  61ef3a:	sub    $0x108,%rsp
  61ef41:	mov    %rdi,%rbx
  61ef44:	lea    0x60(%rsp),%rdi
  61ef49:	call   *0x454371(%rip)        # a732c0 <_DYNAMIC+0x470>
  61ef4f:	mov    0x60(%rsp),%rcx
  61ef54:	mov    %rcx,%rax
  61ef57:	neg    %rax
  61ef5a:	movzbl 0x68(%rsp),%eax
  61ef5f:	jno    61ef76 <hyperpath::specctra::parse_specctra_grid_trace_records+0x46>
  61ef61:	movabs $0x8000000000000000,%rcx
  61ef6b:	mov    %al,0x8(%rbx)
  61ef6e:	mov    %rcx,(%rbx)
  61ef71:	jmp    61f1d8 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  61ef76:	mov    %rcx,0x18(%rsp)
  61ef7b:	movzbl %al,%eax
  61ef7e:	movzbl 0x6f(%rsp),%ecx
  61ef83:	shl    $0x10,%ecx
  61ef86:	movzwl 0x6d(%rsp),%edx
  61ef8b:	or     %ecx,%edx
  61ef8d:	mov    0x69(%rsp),%r15d
  61ef92:	shl    $0x28,%rdx
  61ef96:	shl    $0x8,%r15
  61ef9a:	or     %rdx,%r15
  61ef9d:	or     %rax,%r15
  61efa0:	mov    0x70(%rsp),%rbp
  61efa5:	mov    0x78(%rsp),%rax
  61efaa:	mov    %rax,0x28(%rsp)
  61efaf:	mov    0x80(%rsp),%rax
  61efb7:	mov    %rax,0x20(%rsp)
  61efbc:	mov    0x88(%rsp),%r13
  61efc4:	movups 0x90(%rsp),%xmm0
  61efcc:	movups %xmm0,(%rbx)
  61efcf:	mov    0xa0(%rsp),%rax
  61efd7:	mov    %rbx,0x58(%rsp)
  61efdc:	mov    %rax,0x10(%rbx)
  61efe0:	mov    0xa8(%rsp),%rax
  61efe8:	mov    %rax,0x30(%rsp)
  61efed:	mov    0xb0(%rsp),%rax
  61eff5:	mov    %rax,(%rsp)
  61eff9:	mov    0xc0(%rsp),%rax
  61f001:	mov    %rax,0x38(%rsp)
  61f006:	mov    0xc8(%rsp),%rax
  61f00e:	mov    %rax,0x8(%rsp)
  61f013:	mov    0xd8(%rsp),%rax
  61f01b:	mov    %rax,0x40(%rsp)
  61f020:	mov    0xe0(%rsp),%rax
  61f028:	mov    %rax,0x48(%rsp)
  61f02d:	mov    0xe8(%rsp),%r14
  61f035:	mov    0xf0(%rsp),%rax
  61f03d:	mov    %rax,0x50(%rsp)
  61f042:	mov    0xf8(%rsp),%rax
  61f04a:	mov    %rax,0x10(%rsp)
  61f04f:	test   %rbp,%rbp
  61f052:	je     61f08f <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  61f054:	lea    0x8(%r15),%rbx
  61f058:	mov    0x454041(%rip),%r12        # a730a0 <_DYNAMIC+0x250>
  61f05f:	jmp    61f079 <hyperpath::specctra::parse_specctra_grid_trace_records+0x149>
  61f061:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  61f070:	add    $0x20,%rbx
  61f074:	dec    %rbp
  61f077:	je     61f08f <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  61f079:	mov    -0x8(%rbx),%rsi
  61f07d:	test   %rsi,%rsi
  61f080:	je     61f070 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  61f082:	mov    (%rbx),%rdi
  61f085:	mov    $0x1,%edx
  61f08a:	call   *%r12
  61f08d:	jmp    61f070 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  61f08f:	mov    0x18(%rsp),%rsi
  61f094:	test   %rsi,%rsi
  61f097:	je     61f0ab <hyperpath::specctra::parse_specctra_grid_trace_records+0x17b>
  61f099:	shl    $0x5,%rsi
  61f09d:	mov    $0x8,%edx
  61f0a2:	mov    %r15,%rdi
  61f0a5:	call   *0x453ff5(%rip)        # a730a0 <_DYNAMIC+0x250>
  61f0ab:	test   %r13,%r13
  61f0ae:	mov    0x20(%rsp),%r12
  61f0b3:	je     61f0ef <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  61f0b5:	lea    0x8(%r12),%rbx
  61f0ba:	mov    0x453fdf(%rip),%r15        # a730a0 <_DYNAMIC+0x250>
  61f0c1:	jmp    61f0d9 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a9>
  61f0c3:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  61f0d0:	add    $0x20,%rbx
  61f0d4:	dec    %r13
  61f0d7:	je     61f0ef <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  61f0d9:	mov    -0x8(%rbx),%rsi
  61f0dd:	test   %rsi,%rsi
  61f0e0:	je     61f0d0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  61f0e2:	mov    (%rbx),%rdi
  61f0e5:	mov    $0x1,%edx
  61f0ea:	call   *%r15
  61f0ed:	jmp    61f0d0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  61f0ef:	mov    0x28(%rsp),%rsi
  61f0f4:	test   %rsi,%rsi
  61f0f7:	je     61f10b <hyperpath::specctra::parse_specctra_grid_trace_records+0x1db>
  61f0f9:	shl    $0x5,%rsi
  61f0fd:	mov    $0x8,%edx
  61f102:	mov    %r12,%rdi
  61f105:	call   *0x453f95(%rip)        # a730a0 <_DYNAMIC+0x250>
  61f10b:	mov    0x30(%rsp),%rax
  61f110:	test   %rax,%rax
  61f113:	mov    0x58(%rsp),%rbx
  61f118:	mov    0x48(%rsp),%r13
  61f11d:	je     61f132 <hyperpath::specctra::parse_specctra_grid_trace_records+0x202>
  61f11f:	imul   $0x38,%rax,%rsi
  61f123:	mov    $0x8,%edx
  61f128:	mov    (%rsp),%rdi
  61f12c:	call   *0x453f6e(%rip)        # a730a0 <_DYNAMIC+0x250>
  61f132:	mov    0x38(%rsp),%rax
  61f137:	test   %rax,%rax
  61f13a:	je     61f154 <hyperpath::specctra::parse_specctra_grid_trace_records+0x224>
  61f13c:	shl    $0x4,%rax
  61f140:	lea    (%rax,%rax,4),%rsi
  61f144:	mov    $0x8,%edx
  61f149:	mov    0x8(%rsp),%rdi
  61f14e:	call   *0x453f4c(%rip)        # a730a0 <_DYNAMIC+0x250>
  61f154:	test   %r14,%r14
  61f157:	je     61f19a <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  61f159:	lea    0x10(%r13),%r15
  61f15d:	mov    0x453f3c(%rip),%r12        # a730a0 <_DYNAMIC+0x250>
  61f164:	jmp    61f179 <hyperpath::specctra::parse_specctra_grid_trace_records+0x249>
  61f166:	cs nopw 0x0(%rax,%rax,1)
  61f170:	add    $0x38,%r15
  61f174:	dec    %r14
  61f177:	je     61f19a <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  61f179:	cmpl   $0x2,-0x10(%r15)
  61f17e:	jb     61f170 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  61f180:	mov    -0x8(%r15),%rsi
  61f184:	test   %rsi,%rsi
  61f187:	je     61f170 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  61f189:	mov    (%r15),%rdi
  61f18c:	shl    $0x4,%rsi
  61f190:	mov    $0x8,%edx
  61f195:	call   *%r12
  61f198:	jmp    61f170 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  61f19a:	mov    0x40(%rsp),%rax
  61f19f:	test   %rax,%rax
  61f1a2:	je     61f1b6 <hyperpath::specctra::parse_specctra_grid_trace_records+0x286>
  61f1a4:	imul   $0x38,%rax,%rsi
  61f1a8:	mov    $0x8,%edx
  61f1ad:	mov    %r13,%rdi
  61f1b0:	call   *0x453eea(%rip)        # a730a0 <_DYNAMIC+0x250>
  61f1b6:	mov    0x50(%rsp),%rax
  61f1bb:	test   %rax,%rax
  61f1be:	je     61f1d8 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  61f1c0:	shl    $0x3,%rax
  61f1c4:	lea    (%rax,%rax,4),%rsi
  61f1c8:	mov    $0x8,%edx
  61f1cd:	mov    0x10(%rsp),%rdi
  61f1d2:	call   *0x453ec8(%rip)        # a730a0 <_DYNAMIC+0x250>
  61f1d8:	mov    %rbx,%rax
  61f1db:	add    $0x108,%rsp
  61f1e2:	pop    %rbx
  61f1e3:	pop    %r12
  61f1e5:	pop    %r13
  61f1e7:	pop    %r14
  61f1e9:	pop    %r15
  61f1eb:	pop    %rbp
  61f1ec:	ret
