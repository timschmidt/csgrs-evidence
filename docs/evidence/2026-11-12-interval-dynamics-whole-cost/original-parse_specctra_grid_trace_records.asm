
/tmp/interval-refactor/dynamics-axis-baseline/target/release/deps/path_predicates-76b5bb949f77565a:     file format elf64-x86-64


Disassembly of section .text:

00000000006403d0 <hyperpath::specctra::parse_specctra_grid_trace_records>:
  6403d0:	push   %rbp
  6403d1:	push   %r15
  6403d3:	push   %r14
  6403d5:	push   %r13
  6403d7:	push   %r12
  6403d9:	push   %rbx
  6403da:	sub    $0x108,%rsp
  6403e1:	mov    %rdi,%rbx
  6403e4:	lea    0x60(%rsp),%rdi
  6403e9:	call   *0x434211(%rip)        # a74600 <_DYNAMIC+0x430>
  6403ef:	mov    0x60(%rsp),%rcx
  6403f4:	mov    %rcx,%rax
  6403f7:	neg    %rax
  6403fa:	movzbl 0x68(%rsp),%eax
  6403ff:	jno    640416 <hyperpath::specctra::parse_specctra_grid_trace_records+0x46>
  640401:	movabs $0x8000000000000000,%rcx
  64040b:	mov    %al,0x8(%rbx)
  64040e:	mov    %rcx,(%rbx)
  640411:	jmp    640678 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  640416:	mov    %rcx,0x18(%rsp)
  64041b:	movzbl %al,%eax
  64041e:	movzbl 0x6f(%rsp),%ecx
  640423:	shl    $0x10,%ecx
  640426:	movzwl 0x6d(%rsp),%edx
  64042b:	or     %ecx,%edx
  64042d:	mov    0x69(%rsp),%r15d
  640432:	shl    $0x28,%rdx
  640436:	shl    $0x8,%r15
  64043a:	or     %rdx,%r15
  64043d:	or     %rax,%r15
  640440:	mov    0x70(%rsp),%rbp
  640445:	mov    0x78(%rsp),%rax
  64044a:	mov    %rax,0x28(%rsp)
  64044f:	mov    0x80(%rsp),%rax
  640457:	mov    %rax,0x20(%rsp)
  64045c:	mov    0x88(%rsp),%r13
  640464:	movups 0x90(%rsp),%xmm0
  64046c:	movups %xmm0,(%rbx)
  64046f:	mov    0xa0(%rsp),%rax
  640477:	mov    %rbx,0x58(%rsp)
  64047c:	mov    %rax,0x10(%rbx)
  640480:	mov    0xa8(%rsp),%rax
  640488:	mov    %rax,0x30(%rsp)
  64048d:	mov    0xb0(%rsp),%rax
  640495:	mov    %rax,(%rsp)
  640499:	mov    0xc0(%rsp),%rax
  6404a1:	mov    %rax,0x38(%rsp)
  6404a6:	mov    0xc8(%rsp),%rax
  6404ae:	mov    %rax,0x8(%rsp)
  6404b3:	mov    0xd8(%rsp),%rax
  6404bb:	mov    %rax,0x40(%rsp)
  6404c0:	mov    0xe0(%rsp),%rax
  6404c8:	mov    %rax,0x48(%rsp)
  6404cd:	mov    0xe8(%rsp),%r14
  6404d5:	mov    0xf0(%rsp),%rax
  6404dd:	mov    %rax,0x50(%rsp)
  6404e2:	mov    0xf8(%rsp),%rax
  6404ea:	mov    %rax,0x10(%rsp)
  6404ef:	test   %rbp,%rbp
  6404f2:	je     64052f <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  6404f4:	lea    0x8(%r15),%rbx
  6404f8:	mov    0x433f21(%rip),%r12        # a74420 <_DYNAMIC+0x250>
  6404ff:	jmp    640519 <hyperpath::specctra::parse_specctra_grid_trace_records+0x149>
  640501:	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  640510:	add    $0x20,%rbx
  640514:	dec    %rbp
  640517:	je     64052f <hyperpath::specctra::parse_specctra_grid_trace_records+0x15f>
  640519:	mov    -0x8(%rbx),%rsi
  64051d:	test   %rsi,%rsi
  640520:	je     640510 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  640522:	mov    (%rbx),%rdi
  640525:	mov    $0x1,%edx
  64052a:	call   *%r12
  64052d:	jmp    640510 <hyperpath::specctra::parse_specctra_grid_trace_records+0x140>
  64052f:	mov    0x18(%rsp),%rsi
  640534:	test   %rsi,%rsi
  640537:	je     64054b <hyperpath::specctra::parse_specctra_grid_trace_records+0x17b>
  640539:	shl    $0x5,%rsi
  64053d:	mov    $0x8,%edx
  640542:	mov    %r15,%rdi
  640545:	call   *0x433ed5(%rip)        # a74420 <_DYNAMIC+0x250>
  64054b:	test   %r13,%r13
  64054e:	mov    0x20(%rsp),%r12
  640553:	je     64058f <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  640555:	lea    0x8(%r12),%rbx
  64055a:	mov    0x433ebf(%rip),%r15        # a74420 <_DYNAMIC+0x250>
  640561:	jmp    640579 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a9>
  640563:	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  640570:	add    $0x20,%rbx
  640574:	dec    %r13
  640577:	je     64058f <hyperpath::specctra::parse_specctra_grid_trace_records+0x1bf>
  640579:	mov    -0x8(%rbx),%rsi
  64057d:	test   %rsi,%rsi
  640580:	je     640570 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  640582:	mov    (%rbx),%rdi
  640585:	mov    $0x1,%edx
  64058a:	call   *%r15
  64058d:	jmp    640570 <hyperpath::specctra::parse_specctra_grid_trace_records+0x1a0>
  64058f:	mov    0x28(%rsp),%rsi
  640594:	test   %rsi,%rsi
  640597:	je     6405ab <hyperpath::specctra::parse_specctra_grid_trace_records+0x1db>
  640599:	shl    $0x5,%rsi
  64059d:	mov    $0x8,%edx
  6405a2:	mov    %r12,%rdi
  6405a5:	call   *0x433e75(%rip)        # a74420 <_DYNAMIC+0x250>
  6405ab:	mov    0x30(%rsp),%rax
  6405b0:	test   %rax,%rax
  6405b3:	mov    0x58(%rsp),%rbx
  6405b8:	mov    0x48(%rsp),%r13
  6405bd:	je     6405d2 <hyperpath::specctra::parse_specctra_grid_trace_records+0x202>
  6405bf:	imul   $0x38,%rax,%rsi
  6405c3:	mov    $0x8,%edx
  6405c8:	mov    (%rsp),%rdi
  6405cc:	call   *0x433e4e(%rip)        # a74420 <_DYNAMIC+0x250>
  6405d2:	mov    0x38(%rsp),%rax
  6405d7:	test   %rax,%rax
  6405da:	je     6405f4 <hyperpath::specctra::parse_specctra_grid_trace_records+0x224>
  6405dc:	shl    $0x4,%rax
  6405e0:	lea    (%rax,%rax,4),%rsi
  6405e4:	mov    $0x8,%edx
  6405e9:	mov    0x8(%rsp),%rdi
  6405ee:	call   *0x433e2c(%rip)        # a74420 <_DYNAMIC+0x250>
  6405f4:	test   %r14,%r14
  6405f7:	je     64063a <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  6405f9:	lea    0x10(%r13),%r15
  6405fd:	mov    0x433e1c(%rip),%r12        # a74420 <_DYNAMIC+0x250>
  640604:	jmp    640619 <hyperpath::specctra::parse_specctra_grid_trace_records+0x249>
  640606:	cs nopw 0x0(%rax,%rax,1)
  640610:	add    $0x38,%r15
  640614:	dec    %r14
  640617:	je     64063a <hyperpath::specctra::parse_specctra_grid_trace_records+0x26a>
  640619:	cmpl   $0x2,-0x10(%r15)
  64061e:	jb     640610 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  640620:	mov    -0x8(%r15),%rsi
  640624:	test   %rsi,%rsi
  640627:	je     640610 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  640629:	mov    (%r15),%rdi
  64062c:	shl    $0x4,%rsi
  640630:	mov    $0x8,%edx
  640635:	call   *%r12
  640638:	jmp    640610 <hyperpath::specctra::parse_specctra_grid_trace_records+0x240>
  64063a:	mov    0x40(%rsp),%rax
  64063f:	test   %rax,%rax
  640642:	je     640656 <hyperpath::specctra::parse_specctra_grid_trace_records+0x286>
  640644:	imul   $0x38,%rax,%rsi
  640648:	mov    $0x8,%edx
  64064d:	mov    %r13,%rdi
  640650:	call   *0x433dca(%rip)        # a74420 <_DYNAMIC+0x250>
  640656:	mov    0x50(%rsp),%rax
  64065b:	test   %rax,%rax
  64065e:	je     640678 <hyperpath::specctra::parse_specctra_grid_trace_records+0x2a8>
  640660:	shl    $0x3,%rax
  640664:	lea    (%rax,%rax,4),%rsi
  640668:	mov    $0x8,%edx
  64066d:	mov    0x10(%rsp),%rdi
  640672:	call   *0x433da8(%rip)        # a74420 <_DYNAMIC+0x250>
  640678:	mov    %rbx,%rax
  64067b:	add    $0x108,%rsp
  640682:	pop    %rbx
  640683:	pop    %r12
  640685:	pop    %r13
  640687:	pop    %r14
  640689:	pop    %r15
  64068b:	pop    %rbp
  64068c:	ret
