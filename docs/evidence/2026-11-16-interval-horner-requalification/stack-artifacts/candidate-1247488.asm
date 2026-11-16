
/tmp/interval-refactor/horner-current/stack-artifacts/candidate:     file format elf64-x86-64


Disassembly of section .text:

0000000000130900 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval>:
  130900:	55                   	push   %rbp
  130901:	41 57                	push   %r15
  130903:	41 56                	push   %r14
  130905:	41 55                	push   %r13
  130907:	41 54                	push   %r12
  130909:	53                   	push   %rbx
  13090a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  130911:	45 89 c5             	mov    %r8d,%r13d
  130914:	49 89 ce             	mov    %rcx,%r14
  130917:	48 89 d3             	mov    %rdx,%rbx
  13091a:	49 89 f7             	mov    %rsi,%r15
  13091d:	49 89 fc             	mov    %rdi,%r12
  130920:	48 89 d7             	mov    %rdx,%rdi
  130923:	48 89 ce             	mov    %rcx,%rsi
  130926:	44 89 c2             	mov    %r8d,%edx
  130929:	e8 32 09 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  13092e:	0f b6 c0             	movzbl %al,%eax
  130931:	40 b5 02             	mov    $0x2,%bpl
  130934:	3d fd 00 00 00       	cmp    $0xfd,%eax
  130939:	7f 60                	jg     13099b <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x9b>
  13093b:	40 b5 02             	mov    $0x2,%bpl
  13093e:	85 c0                	test   %eax,%eax
  130940:	0f 85 0d 01 00 00    	jne    130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  130946:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13094b:	4c 89 e6             	mov    %r12,%rsi
  13094e:	4c 89 fa             	mov    %r15,%rdx
  130951:	48 89 d9             	mov    %rbx,%rcx
  130954:	ff 15 9e 56 17 00    	call   *0x17569e(%rip)        # 2a5ff8 <_DYNAMIC+0x6e8>
  13095a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13095f:	ff 15 53 52 17 00    	call   *0x175253(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  130965:	41 0f b6 d5          	movzbl %r13b,%edx
  130969:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  13096e:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  130973:	e8 e8 08 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  130978:	89 c3                	mov    %eax,%ebx
  13097a:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  13097f:	e8 9c 21 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130984:	31 c0                	xor    %eax,%eax
  130986:	84 db                	test   %bl,%bl
  130988:	0f 95 c0             	setne  %al
  13098b:	80 fb fe             	cmp    $0xfe,%bl
  13098e:	bd 02 00 00 00       	mov    $0x2,%ebp
  130993:	0f 45 e8             	cmovne %eax,%ebp
  130996:	e9 ae 00 00 00       	jmp    130a49 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x149>
  13099b:	3d fe 00 00 00       	cmp    $0xfe,%eax
  1309a0:	0f 84 ad 00 00 00    	je     130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  1309a6:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  1309ab:	4c 89 e6             	mov    %r12,%rsi
  1309ae:	4c 89 fa             	mov    %r15,%rdx
  1309b1:	48 89 d9             	mov    %rbx,%rcx
  1309b4:	ff 15 3e 56 17 00    	call   *0x17563e(%rip)        # 2a5ff8 <_DYNAMIC+0x6e8>
  1309ba:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  1309bf:	ff 15 f3 51 17 00    	call   *0x1751f3(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  1309c5:	41 0f b6 d5          	movzbl %r13b,%edx
  1309c9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  1309ce:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  1309d3:	89 54 24 0c          	mov    %edx,0xc(%rsp)
  1309d7:	e8 84 08 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  1309dc:	41 89 c5             	mov    %eax,%r13d
  1309df:	41 80 fd fe          	cmp    $0xfe,%r13b
  1309e3:	75 0c                	jne    1309f1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0xf1>
  1309e5:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  1309ea:	e8 31 21 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  1309ef:	eb 58                	jmp    130a49 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x149>
  1309f1:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  1309f6:	e8 25 21 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  1309fb:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130a00:	e8 1b 21 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130a05:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130a0a:	4c 89 e6             	mov    %r12,%rsi
  130a0d:	4c 89 fa             	mov    %r15,%rdx
  130a10:	4c 89 f1             	mov    %r14,%rcx
  130a13:	ff 15 df 55 17 00    	call   *0x1755df(%rip)        # 2a5ff8 <_DYNAMIC+0x6e8>
  130a19:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130a1e:	ff 15 94 51 17 00    	call   *0x175194(%rip)        # 2a5bb8 <_DYNAMIC+0x2a8>
  130a24:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130a29:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  130a2e:	8b 54 24 0c          	mov    0xc(%rsp),%edx
  130a32:	e8 29 08 00 00       	call   131260 <_RNvNtNtCs7knkTiwCHxc_10hyperlimit10predicates5order25compare_reals_with_policy.llvm.15342522632802571574>
  130a37:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
  130a3b:	3c fe                	cmp    $0xfe,%al
  130a3d:	75 28                	jne    130a67 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x167>
  130a3f:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130a44:	e8 d7 20 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130a49:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130a4e:	e8 cd 20 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130a53:	89 e8                	mov    %ebp,%eax
  130a55:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
  130a5c:	5b                   	pop    %rbx
  130a5d:	41 5c                	pop    %r12
  130a5f:	41 5d                	pop    %r13
  130a61:	41 5e                	pop    %r14
  130a63:	41 5f                	pop    %r15
  130a65:	5d                   	pop    %rbp
  130a66:	c3                   	ret
  130a67:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130a6c:	e8 af 20 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130a71:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130a76:	e8 a5 20 ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130a7b:	31 ed                	xor    %ebp,%ebp
  130a7d:	45 84 ed             	test   %r13b,%r13b
  130a80:	74 d1                	je     130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  130a82:	80 7c 24 4c 00       	cmpb   $0x0,0x4c(%rsp)
  130a87:	74 ca                	je     130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  130a89:	4c 89 e7             	mov    %r12,%rdi
  130a8c:	4c 89 fe             	mov    %r15,%rsi
  130a8f:	48 89 da             	mov    %rbx,%rdx
  130a92:	4c 89 f1             	mov    %r14,%rcx
  130a95:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
  130a9a:	e8 11 99 ff ff       	call   12a3b0 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation33polynomial_interval_excludes_zero>
  130a9f:	40 b5 01             	mov    $0x1,%bpl
  130aa2:	a8 01                	test   $0x1,%al
  130aa4:	75 ad                	jne    130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  130aa6:	4c 8d 6c 24 50       	lea    0x50(%rsp),%r13
  130aab:	4c 89 ef             	mov    %r13,%rdi
  130aae:	4c 89 e6             	mov    %r12,%rsi
  130ab1:	4c 89 fa             	mov    %r15,%rdx
  130ab4:	e8 07 23 ff ff       	call   122dc0 <_RINvXNvMNtCs1C1lLj4PWSY_5alloc5sliceSp9to_vec_inNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealNtB3_10ConvertVec6to_vecNtNtB8_5alloc6GlobalECs23PzJKl0dyV_10hypersolve>
  130ab9:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130abe:	4c 89 ee             	mov    %r13,%rsi
  130ac1:	8b 6c 24 0c          	mov    0xc(%rsp),%ebp
  130ac5:	89 ea                	mov    %ebp,%edx
  130ac7:	ff 15 a3 54 17 00    	call   *0x1754a3(%rip)        # 2a5f70 <_DYNAMIC+0x660>
  130acd:	48 83 7c 24 10 ff    	cmpq   $0xffffffffffffffff,0x10(%rsp)
  130ad3:	0f 84 a1 00 00 00    	je     130b7a <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x27a>
  130ad9:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  130ade:	48 89 94 24 90 00 00 	mov    %rdx,0x90(%rsp)
  130ae5:	00 
  130ae6:	0f 10 44 24 10       	movups 0x10(%rsp),%xmm0
  130aeb:	0f 29 84 24 80 00 00 	movaps %xmm0,0x80(%rsp)
  130af2:	00 
  130af3:	48 8b b4 24 88 00 00 	mov    0x88(%rsp),%rsi
  130afa:	00 
  130afb:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130b00:	89 e9                	mov    %ebp,%ecx
  130b02:	ff 15 f0 57 17 00    	call   *0x1757f0(%rip)        # 2a62f8 <_DYNAMIC+0x9e8>
  130b08:	48 83 7c 24 50 ff    	cmpq   $0xffffffffffffffff,0x50(%rsp)
  130b0e:	74 5d                	je     130b6d <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x26d>
  130b10:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
  130b15:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  130b1a:	0f 10 44 24 50       	movups 0x50(%rsp),%xmm0
  130b1f:	0f 29 44 24 10       	movaps %xmm0,0x10(%rsp)
  130b24:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  130b29:	48 89 da             	mov    %rbx,%rdx
  130b2c:	4c 89 f1             	mov    %r14,%rcx
  130b2f:	41 89 e8             	mov    %ebp,%r8d
  130b32:	e8 e9 47 ff ff       	call   125320 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation11sturm_count>
  130b37:	48 83 f8 01          	cmp    $0x1,%rax
  130b3b:	75 26                	jne    130b63 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x263>
  130b3d:	48 89 d3             	mov    %rdx,%rbx
  130b40:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130b45:	e8 76 18 ff ff       	call   1223c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs23PzJKl0dyV_10hypersolve>
  130b4a:	48 85 db             	test   %rbx,%rbx
  130b4d:	40 0f 94 c5          	sete   %bpl
  130b51:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  130b58:	00 
  130b59:	e8 62 19 ff ff       	call   1224c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs23PzJKl0dyV_10hypersolve>
  130b5e:	e9 f0 fe ff ff       	jmp    130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  130b63:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130b68:	e8 53 18 ff ff       	call   1223c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs23PzJKl0dyV_10hypersolve>
  130b6d:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  130b74:	00 
  130b75:	e8 46 19 ff ff       	call   1224c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs23PzJKl0dyV_10hypersolve>
  130b7a:	40 b5 02             	mov    $0x2,%bpl
  130b7d:	e9 d1 fe ff ff       	jmp    130a53 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x153>
  130b82:	48 89 c3             	mov    %rax,%rbx
  130b85:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130b8a:	e8 31 18 ff ff       	call   1223c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecIBC_NtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEEECs23PzJKl0dyV_10hypersolve>
  130b8f:	eb 03                	jmp    130b94 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x294>
  130b91:	48 89 c3             	mov    %rax,%rbx
  130b94:	48 8d bc 24 80 00 00 	lea    0x80(%rsp),%rdi
  130b9b:	00 
  130b9c:	e8 1f 19 ff ff       	call   1224c0 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueINtNtCs1C1lLj4PWSY_5alloc3vec3VecNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealEECs23PzJKl0dyV_10hypersolve>
  130ba1:	eb 58                	jmp    130bfb <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2fb>
  130ba3:	48 89 c3             	mov    %rax,%rbx
  130ba6:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130bab:	e8 70 1f ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130bb0:	eb 03                	jmp    130bb5 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2b5>
  130bb2:	48 89 c3             	mov    %rax,%rbx
  130bb5:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130bba:	e8 61 1f ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130bbf:	eb 3a                	jmp    130bfb <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2fb>
  130bc1:	48 89 c3             	mov    %rax,%rbx
  130bc4:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130bc9:	e8 52 1f ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130bce:	eb 12                	jmp    130be2 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2e2>
  130bd0:	48 89 c3             	mov    %rax,%rbx
  130bd3:	48 8d 7c 24 50       	lea    0x50(%rsp),%rdi
  130bd8:	e8 43 1f ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130bdd:	eb 12                	jmp    130bf1 <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2f1>
  130bdf:	48 89 c3             	mov    %rax,%rbx
  130be2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130be7:	e8 34 1f ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130bec:	eb 0d                	jmp    130bfb <_RNvNtCs23PzJKl0dyV_10hypersolve14root_isolation50polynomial_has_no_distinct_root_in_closed_interval+0x2fb>
  130bee:	48 89 c3             	mov    %rax,%rbx
  130bf1:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  130bf6:	e8 25 1f ff ff       	call   122b20 <_RINvNtCsevLNFiNqfJP_4core3ptr9drop_glueNtNtNtCs8rd0GMicEM6_9hyperreal4real10arithmetic4RealECs23PzJKl0dyV_10hypersolve.llvm.15342522632802571574>
  130bfb:	48 89 df             	mov    %rbx,%rdi
  130bfe:	e8 ad b5 16 00       	call   29c1b0 <_Unwind_Resume@plt>
  130c03:	ff 15 47 4f 17 00    	call   *0x174f47(%rip)        # 2a5b50 <_DYNAMIC+0x240>
