000000000000c6ef <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE>:
    c6ef:	55                   	push   %rbp
    c6f0:	41 57                	push   %r15
    c6f2:	41 56                	push   %r14
    c6f4:	41 55                	push   %r13
    c6f6:	41 54                	push   %r12
    c6f8:	53                   	push   %rbx
    c6f9:	50                   	push   %rax
    c6fa:	48 89 fb             	mov    %rdi,%rbx
    c6fd:	4c 8b 46 38          	mov    0x38(%rsi),%r8
    c701:	4d 85 c0             	test   %r8,%r8
    c704:	0f 88 cd 01 00 00    	js     c8d7 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e8>
    c70a:	4c 8b 4e 48          	mov    0x48(%rsi),%r9
    c70e:	4d 85 c9             	test   %r9,%r9
    c711:	0f 88 c0 01 00 00    	js     c8d7 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e8>
    c717:	48 89 d1             	mov    %rdx,%rcx
    c71a:	48 8b 46 30          	mov    0x30(%rsi),%rax
    c71e:	48 8b 7e 40          	mov    0x40(%rsi),%rdi
    c722:	41 b4 1e             	mov    $0x1e,%r12b
    c725:	48 39 c7             	cmp    %rax,%rdi
    c728:	4c 89 ca             	mov    %r9,%rdx
    c72b:	4c 19 c2             	sbb    %r8,%rdx
    c72e:	0f 8c 9d 01 00 00    	jl     c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c734:	4c 8b 56 50          	mov    0x50(%rsi),%r10
    c738:	4c 8b 6e 58          	mov    0x58(%rsi),%r13
    c73c:	48 8b 6e 68          	mov    0x68(%rsi),%rbp
    c740:	4c 8b 5e 60          	mov    0x60(%rsi),%r11
    c744:	4d 39 d3             	cmp    %r10,%r11
    c747:	48 89 ea             	mov    %rbp,%rdx
    c74a:	4c 19 ea             	sbb    %r13,%rdx
    c74d:	0f 8c 7e 01 00 00    	jl     c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c753:	4d 89 c6             	mov    %r8,%r14
    c756:	49 c1 fe 3f          	sar    $0x3f,%r14
    c75a:	4c 0f af f1          	imul   %rcx,%r14
    c75e:	48 f7 e1             	mul    %rcx
    c761:	48 89 d6             	mov    %rdx,%rsi
    c764:	48 89 04 24          	mov    %rax,(%rsp)
    c768:	4c 89 c0             	mov    %r8,%rax
    c76b:	48 f7 e1             	mul    %rcx
    c76e:	49 89 d0             	mov    %rdx,%r8
    c771:	49 89 c7             	mov    %rax,%r15
    c774:	49 01 f7             	add    %rsi,%r15
    c777:	4d 11 f0             	adc    %r14,%r8
    c77a:	4c 89 f8             	mov    %r15,%rax
    c77d:	48 c1 f8 3f          	sar    $0x3f,%rax
    c781:	4c 89 c2             	mov    %r8,%rdx
    c784:	48 31 c2             	xor    %rax,%rdx
    c787:	49 c1 f8 3f          	sar    $0x3f,%r8
    c78b:	49 31 c0             	xor    %rax,%r8
    c78e:	49 09 d0             	or     %rdx,%r8
    c791:	4d 89 ce             	mov    %r9,%r14
    c794:	49 c1 fe 3f          	sar    $0x3f,%r14
    c798:	4c 0f af f1          	imul   %rcx,%r14
    c79c:	48 89 f8             	mov    %rdi,%rax
    c79f:	48 f7 e1             	mul    %rcx
    c7a2:	48 89 d6             	mov    %rdx,%rsi
    c7a5:	48 89 c7             	mov    %rax,%rdi
    c7a8:	4c 89 c8             	mov    %r9,%rax
    c7ab:	48 f7 e1             	mul    %rcx
    c7ae:	48 01 f0             	add    %rsi,%rax
    c7b1:	4c 11 f2             	adc    %r14,%rdx
    c7b4:	48 89 c1             	mov    %rax,%rcx
    c7b7:	48 c1 f9 3f          	sar    $0x3f,%rcx
    c7bb:	48 89 d6             	mov    %rdx,%rsi
    c7be:	48 31 ce             	xor    %rcx,%rsi
    c7c1:	48 c1 fa 3f          	sar    $0x3f,%rdx
    c7c5:	48 31 ca             	xor    %rcx,%rdx
    c7c8:	48 09 f2             	or     %rsi,%rdx
    c7cb:	4c 09 c2             	or     %r8,%rdx
    c7ce:	0f 85 fd 00 00 00    	jne    c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c7d4:	48 89 ea             	mov    %rbp,%rdx
    c7d7:	48 8b 34 24          	mov    (%rsp),%rsi
    c7db:	48 39 f7             	cmp    %rsi,%rdi
    c7de:	48 89 c1             	mov    %rax,%rcx
    c7e1:	4c 19 f9             	sbb    %r15,%rcx
    c7e4:	4c 89 fd             	mov    %r15,%rbp
    c7e7:	48 0f 4c e8          	cmovl  %rax,%rbp
    c7eb:	49 89 f6             	mov    %rsi,%r14
    c7ee:	4c 0f 4c f7          	cmovl  %rdi,%r14
    c7f2:	4d 01 d6             	add    %r10,%r14
    c7f5:	4c 11 ed             	adc    %r13,%rbp
    c7f8:	0f 80 d3 00 00 00    	jo     c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c7fe:	49 89 f5             	mov    %rsi,%r13
    c801:	48 39 fe             	cmp    %rdi,%rsi
    c804:	4c 89 f9             	mov    %r15,%rcx
    c807:	48 19 c1             	sbb    %rax,%rcx
    c80a:	4c 0f 4c f8          	cmovl  %rax,%r15
    c80e:	4c 0f 4c ef          	cmovl  %rdi,%r13
    c812:	4d 01 dd             	add    %r11,%r13
    c815:	49 11 d7             	adc    %rdx,%r15
    c818:	0f 80 b3 00 00 00    	jo     c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c81e:	4d 39 f5             	cmp    %r14,%r13
    c821:	4c 89 f8             	mov    %r15,%rax
    c824:	48 19 e8             	sbb    %rbp,%rax
    c827:	0f 8c a4 00 00 00    	jl     c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c82d:	49 bc 00 80 c6 a4 7e 	movabs $0x38d7ea4c68000,%r12
    c834:	8d 03 00 
    c837:	4c 89 f7             	mov    %r14,%rdi
    c83a:	48 89 ee             	mov    %rbp,%rsi
    c83d:	4c 89 e2             	mov    %r12,%rdx
    c840:	31 c9                	xor    %ecx,%ecx
    c842:	ff 15 20 b6 04 00    	call   *0x4b620(%rip)        # 57e68 <_GLOBAL_OFFSET_TABLE_+0x60>
    c848:	48 89 c7             	mov    %rax,%rdi
    c84b:	48 89 d1             	mov    %rdx,%rcx
    c84e:	48 89 d6             	mov    %rdx,%rsi
    c851:	49 f7 e4             	mul    %r12
    c854:	4d 89 e0             	mov    %r12,%r8
    c857:	49 0f af f4          	imul   %r12,%rsi
    c85b:	48 01 f2             	add    %rsi,%rdx
    c85e:	49 39 c6             	cmp    %rax,%r14
    c861:	48 19 d5             	sbb    %rdx,%rbp
    c864:	48 c1 fd 3f          	sar    $0x3f,%rbp
    c868:	48 01 ef             	add    %rbp,%rdi
    c86b:	48 11 cd             	adc    %rcx,%rbp
    c86e:	41 b4 1d             	mov    $0x1d,%r12b
    c871:	75 5e                	jne    c8d1 <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1e2>
    c873:	48 89 3c 24          	mov    %rdi,(%rsp)
    c877:	45 31 f6             	xor    %r14d,%r14d
    c87a:	4c 89 ef             	mov    %r13,%rdi
    c87d:	4c 89 fe             	mov    %r15,%rsi
    c880:	4c 89 c5             	mov    %r8,%rbp
    c883:	4c 89 c2             	mov    %r8,%rdx
    c886:	31 c9                	xor    %ecx,%ecx
    c888:	ff 15 da b5 04 00    	call   *0x4b5da(%rip)        # 57e68 <_GLOBAL_OFFSET_TABLE_+0x60>
    c88e:	48 89 c6             	mov    %rax,%rsi
    c891:	48 89 d1             	mov    %rdx,%rcx
    c894:	48 89 d7             	mov    %rdx,%rdi
    c897:	48 f7 e5             	mul    %rbp
    c89a:	48 0f af fd          	imul   %rbp,%rdi
    c89e:	48 01 fa             	add    %rdi,%rdx
    c8a1:	49 29 c5             	sub    %rax,%r13
    c8a4:	49 19 d7             	sbb    %rdx,%r15
    c8a7:	4c 89 f8             	mov    %r15,%rax
    c8aa:	48 c1 f8 3f          	sar    $0x3f,%rax
    c8ae:	48 01 c6             	add    %rax,%rsi
    c8b1:	48 11 c1             	adc    %rax,%rcx
    c8b4:	48 21 e8             	and    %rbp,%rax
    c8b7:	49 f7 dd             	neg    %r13
    c8ba:	4d 19 fe             	sbb    %r15,%r14
    c8bd:	49 31 c5             	xor    %rax,%r13
    c8c0:	31 c0                	xor    %eax,%eax
    c8c2:	4d 09 f5             	or     %r14,%r13
    c8c5:	0f 95 c0             	setne  %al
    c8c8:	48 01 f0             	add    %rsi,%rax
    c8cb:	48 83 d1 00          	adc    $0x0,%rcx
    c8cf:	74 1d                	je     c8ee <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1ff>
    c8d1:	44 88 63 01          	mov    %r12b,0x1(%rbx)
    c8d5:	eb 04                	jmp    c8db <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1ec>
    c8d7:	c6 43 01 1e          	movb   $0x1e,0x1(%rbx)
    c8db:	b0 01                	mov    $0x1,%al
    c8dd:	88 03                	mov    %al,(%rbx)
    c8df:	48 83 c4 08          	add    $0x8,%rsp
    c8e3:	5b                   	pop    %rbx
    c8e4:	41 5c                	pop    %r12
    c8e6:	41 5d                	pop    %r13
    c8e8:	41 5e                	pop    %r14
    c8ea:	41 5f                	pop    %r15
    c8ec:	5d                   	pop    %rbp
    c8ed:	c3                   	ret
    c8ee:	48 8b 0c 24          	mov    (%rsp),%rcx
    c8f2:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
    c8f6:	48 89 43 10          	mov    %rax,0x10(%rbx)
    c8fa:	31 c0                	xor    %eax,%eax
    c8fc:	eb df                	jmp    c8dd <_ZN13alumina_clock14ClockEstimator12cycle_bounds17h6d79f0bd990e3accE+0x1ee>