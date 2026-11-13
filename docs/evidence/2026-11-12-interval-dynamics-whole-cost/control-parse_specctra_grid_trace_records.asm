
/tmp/interval-refactor/dynamics-cost-binaries/whole-control:     file format elf64-x86-64


Disassembly of section .text:

0000000000668380 <hyperpath::specctra::parse_specctra_grid_trace_records>:
  668380:	push   %rbp
  668381:	push   %r15
  668383:	push   %r14
  668385:	push   %r13
  668387:	push   %r12
  668389:	push   %rbx
  66838a:	sub    $0x108,%rsp
  668391:	mov    %rdi,%rbx
  668394:	lea    0x60(%rsp),%rdi
  668399:	call   *0x427cf9(%rip)        # a90098 <_DYNAMIC+0x470>
  66839f:	mov    0x60(%rsp),%rcx
  6683a4:	mov    %rcx,%rax
  6683a7:	neg    %rax
  6683aa:	movzbl 0x68(%rsp),%eax
  6683af:	jno    6683c6 <hyperpath::specctra::parse_specctra_grid_trace_records+0x46>
  6683b1:	movabs $0x8000000000000000,%rcx
  6683bb:	mov    %al,0x8(%rbx)
  6683be:	mov    %rcx,(%rbx)
  6683c1:	jmp    668628 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  6683c6:	mov    %rcx,0x18(%rsp)
  6683cb:	movzbl %al,%eax
  6683ce:	movzbl 0x6f(%rsp),%ecx
  6683d3:	shl    $0x10,%ecx
  6683d6:	movzwl 0x6d(%rsp),%edx
  6683db:	or     %ecx,%edx
  6683dd:	mov    0x69(%rsp),%r15d
  6683e2:	shl    $0x28,%rdx
  6683e6:	shl    $0x8,%r15
  6683ea:	or     %rdx,%r15
  6683ed:	or     %rax,%r15
  6683f0:	mov    0x70(%rsp),%rbp
  6683f5:	mov    0x78(%rsp),%rax
  6683fa:	mov    %rax,0x28(%rsp)
  6683ff:	mov    0x80(%rsp),%rax
  668407:	mov    %rax,0x20(%rsp)
  66840c:	mov    0x88(%rsp),%r13
  668414:	movups 0x90(%rsp),%xmm0
  66841c:	movups %xmm0,(%rbx)
  66841f:	mov    0xa0(%rsp),%rax
  668427:	mov    %rbx,0x58(%rsp)
  66842c:	mov    %rax,0x10(%rbx)
  668430:	mov    0xa8(%rsp),%rax
  668438:	mov    %rax,0x30(%rsp)
  66843d:	mov    0xb0(%rsp),%rax
  668445:	mov    %rax,(%rsp)
  668449:	mov    0xc0(%rsp),%rax
  668451:	mov    %rax,0x38(%rsp)
  668456:	mov    0xc8(%rsp),%rax
  66845e:	mov    %rax,0x8(%rsp)
  668463:	mov    0xd8(%rsp),%rax
  66846b:	mov    %rax,0x40(%rsp)
  668470:	mov    0xe0(%rsp),%rax
  668478:	mov    %rax,0x48(%rsp)
  66847d:	mov    0xe8(%rsp),%r14
  668485:	mov    0xf0(%rsp),%rax
  66848d:	mov    %rax,0x50(%rsp)
  668492:	mov    0xf8(%rsp),%rax
  66849a:	mov    %rax,0x10(%rsp)
  66849f:	test   %rbp,%rbp
  6684a2:	je     6684df <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  6684a4:	lea    0x8(%r15),%rbx
  6684a8:	mov    0x4279c9(%rip),%r12        # a8fe78 <_DYNAMIC+0x250>
  6684af:	jmp    6684c9 <hyperpath::specctra::parse_specctra_grid_trace_records+0x149>
  6684b1:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  6684c0:	add    $0x20,%rbx
  6684c4:	dec    %rbp
  6684c7:	je     6684df <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  6684c9:	mov    -0x8(%rbx),%rsi
  6684cd:	test   %rsi,%rsi
  6684d0:	je     6684c0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  6684d2:	mov    (%rbx),%rdi
  6684d5:	mov    $0x1,%edx
  6684da:	call   *%r12
  6684dd:	jmp    6684c0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  6684df:	mov    0x18(%rsp),%rsi
  6684e4:	test   %rsi,%rsi
  6684e7:	je     6684fb <hyperpath::specctra::parse_specctra_grid_trace_records+0x17b>
  6684e9:	shl    $0x5,%rsi
  6684ed:	mov    $0x8,%edx
  6684f2:	mov    %r15,%rdi
  6684f5:	call   *0x42797d(%rip)        # a8fe78 <_DYNAMIC+0x250>
  6684fb:	test   %r13,%r13
  6684fe:	mov    0x20(%rsp),%r12
  668503:	je     66853f <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  668505:	lea    0x8(%r12),%rbx
  66850a:	mov    0x427967(%rip),%r15        # a8fe78 <_DYNAMIC+0x250>
  668511:	jmp    668529 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a9>
  668513:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  668520:	add    $0x20,%rbx
  668524:	dec    %r13
  668527:	je     66853f <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  668529:	mov    -0x8(%rbx),%rsi
  66852d:	test   %rsi,%rsi
  668530:	je     668520 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  668532:	mov    (%rbx),%rdi
  668535:	mov    $0x1,%edx
  66853a:	call   *%r15
  66853d:	jmp    668520 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  66853f:	mov    0x28(%rsp),%rsi
  668544:	test   %rsi,%rsi
  668547:	je     66855b <hyperpath::specctra::parse_specctra_grid_trace_records+0x1db>
  668549:	shl    $0x5,%rsi
  66854d:	mov    $0x8,%edx
  668552:	mov    %r12,%rdi
  668555:	call   *0x42791d(%rip)        # a8fe78 <_DYNAMIC+0x250>
  66855b:	mov    0x30(%rsp),%rax
  668560:	test   %rax,%rax
  668563:	mov    0x58(%rsp),%rbx
  668568:	mov    0x48(%rsp),%r13
  66856d:	je     668582 <hyperpath::specctra::parse_specctra_grid_trace_records+0x202>
  66856f:	imul   $0x38,%rax,%rsi
  668573:	mov    $0x8,%edx
  668578:	mov    (%rsp),%rdi
  66857c:	call   *0x4278f6(%rip)        # a8fe78 <_DYNAMIC+0x250>
  668582:	mov    0x38(%rsp),%rax
  668587:	test   %rax,%rax
  66858a:	je     6685a4 <hyperpath::specctra::parse_specctra_grid_trace_records+0x224>
  66858c:	shl    $0x4,%rax
  668590:	lea    (%rax,%rax,4),%rsi
  668594:	mov    $0x8,%edx
  668599:	mov    0x8(%rsp),%rdi
  66859e:	call   *0x4278d4(%rip)        # a8fe78 <_DYNAMIC+0x250>
  6685a4:	test   %r14,%r14
  6685a7:	je     6685ea <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  6685a9:	lea    0x10(%r13),%r15
  6685ad:	mov    0x4278c4(%rip),%r12        # a8fe78 <_DYNAMIC+0x250>
  6685b4:	jmp    6685c9 <hyperpath::specctra::parse_specctra_grid_trace_records+0x249>
  6685b6:	cs nopw 0x0(%rax,%rax,1)
  6685c0:	add    $0x38,%r15
  6685c4:	dec    %r14
  6685c7:	je     6685ea <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  6685c9:	cmpl   $0x2,-0x10(%r15)
  6685ce:	jb     6685c0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  6685d0:	mov    -0x8(%r15),%rsi
  6685d4:	test   %rsi,%rsi
  6685d7:	je     6685c0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  6685d9:	mov    (%r15),%rdi
  6685dc:	shl    $0x4,%rsi
  6685e0:	mov    $0x8,%edx
  6685e5:	call   *%r12
  6685e8:	jmp    6685c0 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  6685ea:	mov    0x40(%rsp),%rax
  6685ef:	test   %rax,%rax
  6685f2:	je     668606 <hyperpath::specctra::parse_specctra_grid_trace_records+0x286>
  6685f4:	imul   $0x38,%rax,%rsi
  6685f8:	mov    $0x8,%edx
  6685fd:	mov    %r13,%rdi
  668600:	call   *0x427872(%rip)        # a8fe78 <_DYNAMIC+0x250>
  668606:	mov    0x50(%rsp),%rax
  66860b:	test   %rax,%rax
  66860e:	je     668628 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  668610:	shl    $0x3,%rax
  668614:	lea    (%rax,%rax,4),%rsi
  668618:	mov    $0x8,%edx
  66861d:	mov    0x10(%rsp),%rdi
  668622:	call   *0x427850(%rip)        # a8fe78 <_DYNAMIC+0x250>
  668628:	mov    %rbx,%rax
  66862b:	add    $0x108,%rsp
  668632:	pop    %rbx
  668633:	pop    %r12
  668635:	pop    %r13
  668637:	pop    %r14
  668639:	pop    %r15
  66863b:	pop    %rbp
  66863c:	ret
