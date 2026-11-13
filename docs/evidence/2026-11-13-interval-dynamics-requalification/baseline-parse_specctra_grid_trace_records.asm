
/tmp/interval-refactor/dynamics-requal-binaries/baseline:     file format elf64-x86-64


Disassembly of section .text:

0000000000640830 <hyperpath::specctra::parse_specctra_grid_trace_records>:
  640830:	push   %rbp
  640831:	push   %r15
  640833:	push   %r14
  640835:	push   %r13
  640837:	push   %r12
  640839:	push   %rbx
  64083a:	sub    $0x108,%rsp
  640841:	mov    %rdi,%rbx
  640844:	lea    0x60(%rsp),%rdi
  640849:	call   *0x434779(%rip)        # a74fc8 <_DYNAMIC+0x430>
  64084f:	mov    0x60(%rsp),%rcx
  640854:	mov    %rcx,%rax
  640857:	neg    %rax
  64085a:	movzbl 0x68(%rsp),%eax
  64085f:	jno    640876 <hyperpath::specctra::parse_specctra_grid_trace_records+0x46>
  640861:	movabs $0x8000000000000000,%rcx
  64086b:	mov    %al,0x8(%rbx)
  64086e:	mov    %rcx,(%rbx)
  640871:	jmp    640ad8 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  640876:	mov    %rcx,0x18(%rsp)
  64087b:	movzbl %al,%eax
  64087e:	movzbl 0x6f(%rsp),%ecx
  640883:	shl    $0x10,%ecx
  640886:	movzwl 0x6d(%rsp),%edx
  64088b:	or     %ecx,%edx
  64088d:	mov    0x69(%rsp),%r15d
  640892:	shl    $0x28,%rdx
  640896:	shl    $0x8,%r15
  64089a:	or     %rdx,%r15
  64089d:	or     %rax,%r15
  6408a0:	mov    0x70(%rsp),%rbp
  6408a5:	mov    0x78(%rsp),%rax
  6408aa:	mov    %rax,0x28(%rsp)
  6408af:	mov    0x80(%rsp),%rax
  6408b7:	mov    %rax,0x20(%rsp)
  6408bc:	mov    0x88(%rsp),%r13
  6408c4:	movups 0x90(%rsp),%xmm0
  6408cc:	movups %xmm0,(%rbx)
  6408cf:	mov    0xa0(%rsp),%rax
  6408d7:	mov    %rbx,0x58(%rsp)
  6408dc:	mov    %rax,0x10(%rbx)
  6408e0:	mov    0xa8(%rsp),%rax
  6408e8:	mov    %rax,0x30(%rsp)
  6408ed:	mov    0xb0(%rsp),%rax
  6408f5:	mov    %rax,(%rsp)
  6408f9:	mov    0xc0(%rsp),%rax
  640901:	mov    %rax,0x38(%rsp)
  640906:	mov    0xc8(%rsp),%rax
  64090e:	mov    %rax,0x8(%rsp)
  640913:	mov    0xd8(%rsp),%rax
  64091b:	mov    %rax,0x40(%rsp)
  640920:	mov    0xe0(%rsp),%rax
  640928:	mov    %rax,0x48(%rsp)
  64092d:	mov    0xe8(%rsp),%r14
  640935:	mov    0xf0(%rsp),%rax
  64093d:	mov    %rax,0x50(%rsp)
  640942:	mov    0xf8(%rsp),%rax
  64094a:	mov    %rax,0x10(%rsp)
  64094f:	test   %rbp,%rbp
  640952:	je     64098f <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  640954:	lea    0x8(%r15),%rbx
  640958:	mov    0x434489(%rip),%r12        # a74de8 <_DYNAMIC+0x250>
  64095f:	jmp    640979 <hyperpath::specctra::parse_specctra_grid_trace_records+0x149>
  640961:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  640970:	add    $0x20,%rbx
  640974:	dec    %rbp
  640977:	je     64098f <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  640979:	mov    -0x8(%rbx),%rsi
  64097d:	test   %rsi,%rsi
  640980:	je     640970 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  640982:	mov    (%rbx),%rdi
  640985:	mov    $0x1,%edx
  64098a:	call   *%r12
  64098d:	jmp    640970 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  64098f:	mov    0x18(%rsp),%rsi
  640994:	test   %rsi,%rsi
  640997:	je     6409ab <hyperpath::specctra::parse_specctra_grid_trace_records+0x17b>
  640999:	shl    $0x5,%rsi
  64099d:	mov    $0x8,%edx
  6409a2:	mov    %r15,%rdi
  6409a5:	call   *0x43443d(%rip)        # a74de8 <_DYNAMIC+0x250>
  6409ab:	test   %r13,%r13
  6409ae:	mov    0x20(%rsp),%r12
  6409b3:	je     6409ef <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  6409b5:	lea    0x8(%r12),%rbx
  6409ba:	mov    0x434427(%rip),%r15        # a74de8 <_DYNAMIC+0x250>
  6409c1:	jmp    6409d9 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a9>
  6409c3:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  6409d0:	add    $0x20,%rbx
  6409d4:	dec    %r13
  6409d7:	je     6409ef <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  6409d9:	mov    -0x8(%rbx),%rsi
  6409dd:	test   %rsi,%rsi
  6409e0:	je     6409d0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  6409e2:	mov    (%rbx),%rdi
  6409e5:	mov    $0x1,%edx
  6409ea:	call   *%r15
  6409ed:	jmp    6409d0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  6409ef:	mov    0x28(%rsp),%rsi
  6409f4:	test   %rsi,%rsi
  6409f7:	je     640a0b <hyperpath::specctra::parse_specctra_grid_trace_records+0x1db>
  6409f9:	shl    $0x5,%rsi
  6409fd:	mov    $0x8,%edx
  640a02:	mov    %r12,%rdi
  640a05:	call   *0x4343dd(%rip)        # a74de8 <_DYNAMIC+0x250>
  640a0b:	mov    0x30(%rsp),%rax
  640a10:	test   %rax,%rax
  640a13:	mov    0x58(%rsp),%rbx
  640a18:	mov    0x48(%rsp),%r13
  640a1d:	je     640a32 <hyperpath::specctra::parse_specctra_grid_trace_records+0x202>
  640a1f:	imul   $0x38,%rax,%rsi
  640a23:	mov    $0x8,%edx
  640a28:	mov    (%rsp),%rdi
  640a2c:	call   *0x4343b6(%rip)        # a74de8 <_DYNAMIC+0x250>
  640a32:	mov    0x38(%rsp),%rax
  640a37:	test   %rax,%rax
  640a3a:	je     640a54 <hyperpath::specctra::parse_specctra_grid_trace_records+0x224>
  640a3c:	shl    $0x4,%rax
  640a40:	lea    (%rax,%rax,4),%rsi
  640a44:	mov    $0x8,%edx
  640a49:	mov    0x8(%rsp),%rdi
  640a4e:	call   *0x434394(%rip)        # a74de8 <_DYNAMIC+0x250>
  640a54:	test   %r14,%r14
  640a57:	je     640a9a <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  640a59:	lea    0x10(%r13),%r15
  640a5d:	mov    0x434384(%rip),%r12        # a74de8 <_DYNAMIC+0x250>
  640a64:	jmp    640a79 <hyperpath::specctra::parse_specctra_grid_trace_records+0x249>
  640a66:	cs nopw 0x0(%rax,%rax,1)
  640a70:	add    $0x38,%r15
  640a74:	dec    %r14
  640a77:	je     640a9a <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  640a79:	cmpl   $0x2,-0x10(%r15)
  640a7e:	jb     640a70 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  640a80:	mov    -0x8(%r15),%rsi
  640a84:	test   %rsi,%rsi
  640a87:	je     640a70 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  640a89:	mov    (%r15),%rdi
  640a8c:	shl    $0x4,%rsi
  640a90:	mov    $0x8,%edx
  640a95:	call   *%r12
  640a98:	jmp    640a70 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  640a9a:	mov    0x40(%rsp),%rax
  640a9f:	test   %rax,%rax
  640aa2:	je     640ab6 <hyperpath::specctra::parse_specctra_grid_trace_records+0x286>
  640aa4:	imul   $0x38,%rax,%rsi
  640aa8:	mov    $0x8,%edx
  640aad:	mov    %r13,%rdi
  640ab0:	call   *0x434332(%rip)        # a74de8 <_DYNAMIC+0x250>
  640ab6:	mov    0x50(%rsp),%rax
  640abb:	test   %rax,%rax
  640abe:	je     640ad8 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  640ac0:	shl    $0x3,%rax
  640ac4:	lea    (%rax,%rax,4),%rsi
  640ac8:	mov    $0x8,%edx
  640acd:	mov    0x10(%rsp),%rdi
  640ad2:	call   *0x434310(%rip)        # a74de8 <_DYNAMIC+0x250>
  640ad8:	mov    %rbx,%rax
  640adb:	add    $0x108,%rsp
  640ae2:	pop    %rbx
  640ae3:	pop    %r12
  640ae5:	pop    %r13
  640ae7:	pop    %r14
  640ae9:	pop    %r15
  640aeb:	pop    %rbp
  640aec:	ret
