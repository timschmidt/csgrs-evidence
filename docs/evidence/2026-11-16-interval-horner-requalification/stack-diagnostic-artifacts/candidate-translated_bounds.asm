
/tmp/interval-refactor/horner-current/stack-diagnostic-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

0000000000122510 <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>>:
  122510:	41 57                	push   %r15
  122512:	41 56                	push   %r14
  122514:	53                   	push   %rbx
  122515:	48 83 ec 20          	sub    $0x20,%rsp
  122519:	48 89 d3             	mov    %rdx,%rbx
  12251c:	49 89 ff             	mov    %rdi,%r15
  12251f:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
  122524:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  122529:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  12252e:	48 89 d6             	mov    %rdx,%rsi
  122531:	ff 15 a1 3c 18 00    	call   *0x183ca1(%rip)        # 2a61d8 <_DYNAMIC+0x328>
  122537:	49 89 c6             	mov    %rax,%r14
  12253a:	f0 49 ff 0f          	lock decq (%r15)
  12253e:	75 0b                	jne    12254b <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0x3b>
  122540:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  122545:	ff 15 c5 3b 18 00    	call   *0x183bc5(%rip)        # 2a6110 <_DYNAMIC+0x260>
  12254b:	4c 89 74 24 18       	mov    %r14,0x18(%rsp)
  122550:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
  122555:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
  12255a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  12255f:	48 89 de             	mov    %rbx,%rsi
  122562:	ff 15 70 3c 18 00    	call   *0x183c70(%rip)        # 2a61d8 <_DYNAMIC+0x328>
  122568:	48 89 c3             	mov    %rax,%rbx
  12256b:	f0 49 ff 0e          	lock decq (%r14)
  12256f:	75 0b                	jne    12257c <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0x6c>
  122571:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  122576:	ff 15 94 3b 18 00    	call   *0x183b94(%rip)        # 2a6110 <_DYNAMIC+0x260>
  12257c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  122581:	48 89 da             	mov    %rbx,%rdx
  122584:	48 83 c4 20          	add    $0x20,%rsp
  122588:	5b                   	pop    %rbx
  122589:	41 5e                	pop    %r14
  12258b:	41 5f                	pop    %r15
  12258d:	c3                   	ret
  12258e:	48 89 c3             	mov    %rax,%rbx
  122591:	eb 19                	jmp    1225ac <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0x9c>
  122593:	48 89 c3             	mov    %rax,%rbx
  122596:	eb 46                	jmp    1225de <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0xce>
  122598:	48 89 c3             	mov    %rax,%rbx
  12259b:	f0 49 ff 0e          	lock decq (%r14)
  12259f:	75 0b                	jne    1225ac <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0x9c>
  1225a1:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  1225a6:	ff 15 64 3b 18 00    	call   *0x183b64(%rip)        # 2a6110 <_DYNAMIC+0x260>
  1225ac:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  1225b1:	f0 48 ff 08          	lock decq (%rax)
  1225b5:	75 3d                	jne    1225f4 <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0xe4>
  1225b7:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
  1225bc:	ff 15 4e 3b 18 00    	call   *0x183b4e(%rip)        # 2a6110 <_DYNAMIC+0x260>
  1225c2:	eb 30                	jmp    1225f4 <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0xe4>
  1225c4:	ff 15 26 3b 18 00    	call   *0x183b26(%rip)        # 2a60f0 <_DYNAMIC+0x240>
  1225ca:	48 89 c3             	mov    %rax,%rbx
  1225cd:	f0 49 ff 0f          	lock decq (%r15)
  1225d1:	75 0b                	jne    1225de <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0xce>
  1225d3:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  1225d8:	ff 15 32 3b 18 00    	call   *0x183b32(%rip)        # 2a6110 <_DYNAMIC+0x260>
  1225de:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  1225e3:	f0 48 ff 08          	lock decq (%rax)
  1225e7:	75 0b                	jne    1225f4 <hyperinterval::rational::translated_bounds::<hyperreal::rational::arithmetic::Rational>+0xe4>
  1225e9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  1225ee:	ff 15 1c 3b 18 00    	call   *0x183b1c(%rip)        # 2a6110 <_DYNAMIC+0x260>
  1225f4:	48 89 df             	mov    %rbx,%rdi
  1225f7:	e8 c4 a0 17 00       	call   29c6c0 <_Unwind_Resume@plt>
  1225fc:	ff 15 ee 3a 18 00    	call   *0x183aee(%rip)        # 2a60f0 <_DYNAMIC+0x240>
  122602:	ff 15 e8 3a 18 00    	call   *0x183ae8(%rip)        # 2a60f0 <_DYNAMIC+0x240>
