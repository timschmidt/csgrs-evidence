(module $interval_dyadic_wasm_conformance.wasm
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (param i32 i32 i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32)))
 (type $4 (func (param i32 i32 i32)))
 (type $5 (func (param i32 i32 i32 i32 i32)))
 (type $6 (func (param i32 i32 i32 i32)))
 (type $7 (func (param i32) (result i32)))
 (type $8 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $9 (func (result i32)))
 (type $10 (func (param i32 i32 i32 i32) (result i32)))
 (type $11 (func (param i32 i64 i64 i32)))
 (type $12 (func (param i32 i64 i64 i64)))
 (type $13 (func (param i32 i64 i64 i64 i32)))
 (type $14 (func (param i32 i64 i64 i32 i32 i32)))
 (type $15 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
 (type $16 (func (param i32 i32 i32 i32 i32 i32 i32)))
 (type $17 (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $18 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $19 (func (param i64 i32 i32) (result i32)))
 (global $__stack_pointer (mut i32) (i32.const 1048576))
 (global $global$1 i32 (i32.const 1054005))
 (global $global$2 i32 (i32.const 1054016))
 (memory $0 17)
 (data $.rodata (i32.const 1048576) "\00\00\00\80\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\80\00\00\00\00\00\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/big_digit.rs\1c\00\10\00`\00\00\00Y\00\00\00\'\00\00\00\1c\00\10\00`\00\00\00\b1\00\00\00!\00\00\00NonFiniteEndpointReversedEndpointsNonSingletonEndpointUnboundedImageInvalidScaleOverflowContainsZeroEmptyDomainPoleUnsupportedBranchPrecisionExhaustedWorkExhaustedSizeExhaustedUnqualifiedEnvironment/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/slice.rsb\01\10\00J\00\00\00\be\01\00\00\1d\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00src/../../../tests/support/dyadic_egress_cases.rs\00\00\00\d8\01\10\001\00\00\00M\00\00\00\05\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00called `Result::unwrap()` on an `Err` value\00\02\00\00\00\05\00\00\00\00\00\00\00\d8\01\10\001\00\00\00L\00\00\00\05\00\00\00\11\00\00\00\11\00\00\00\14\00\00\00\0e\00\00\00\0c\00\00\00\08\00\00\00\0c\00\00\00\0b\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\r\00\00\00\r\00\00\00\16\00\00\00\9c\00\10\00\ad\00\10\00\be\00\10\00\d2\00\10\00\e0\00\10\00\ec\00\10\00\f4\00\10\00\00\01\10\00\0b\01\10\00\0f\01\10\00 \01\10\002\01\10\00?\01\10\00L\01\10\00\00\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\03\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\04\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\05\00\00\00Tried to shrink to a larger capacity$\03\10\00$\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/raw_vec/mod.rsP\03\10\00P\00\00\00\b9\02\00\00\t\00\00\00None\00\00\00\00\04\00\00\00\04\00\00\00\06\00\00\00Some\00\00\00\00\04\00\00\00\04\00\00\00\07\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\08\00\00\00Binary32Binary64\00\00\00\00\04\00\00\00\04\00\00\00\t\00\00\00Ok\00\00\00\00\00\00\04\00\00\00\04\00\00\00\n\00\00\00Err\00\00\00\00\00\04\00\00\00\04\00\00\00\0b\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0c\00\00\00F32Enclosurebounds\00\00\00\00\00\00\04\00\00\00\04\00\00\00\r\00\00\00F64EnclosureNonFiniteEndpointReversedEndpointsNonSingletonEndpointUnboundedImageInvalidScaleOverflowContainsZeroEmptyDomainPoleUnsupportedBranchPrecisionExhaustedWorkExhaustedSizeExhaustedUnqualifiedEnvironment\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0e\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0f\00\00\00Boundslowerupper\00\00\00\00\08\00\00\00\08\00\00\00\10\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\11\00\00\00\11\00\00\00\11\00\00\00\14\00\00\00\0e\00\00\00\0c\00\00\00\08\00\00\00\0c\00\00\00\0b\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\r\00\00\00\r\00\00\00\16\00\00\00p\04\10\00\81\04\10\00\92\04\10\00\a6\04\10\00\b4\04\10\00\c0\04\10\00\c8\04\10\00\d4\04\10\00\df\04\10\00\e3\04\10\00\f4\04\10\00\06\05\10\00\13\05\10\00 \05\10\00\00\00\00\80\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\80\00\00\00\00\00\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/big_digit.rs\14\06\10\00`\00\00\00Y\00\00\00\'\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/slice.rs\00\00\84\06\10\00J\00\00\00\be\01\00\00\1d\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/biguint.rs\00\00\e0\06\10\00^\00\00\00\7f\03\00\00\11\00\00\00/mnt/development/csgrs-ieee-egress/crates/hyperinterval/src/ieee.rs\00P\07\10\00C\00\00\00\1e\00\00\00\1a\00\00\00P\07\10\00C\00\00\00\80\00\00\00\13\00\00\00P\07\10\00C\00\00\00\85\00\00\00\12\00\00\00P\07\10\00C\00\00\00\8f\00\00\00\r\00\00\00P\07\10\00C\00\00\00\87\00\00\00%\00\00\00P\07\10\00C\00\00\00\87\00\00\00\17\00\00\00P\07\10\00C\00\00\00\98\01\00\00\n\00\00\00P\07\10\00C\00\00\00\9b\01\00\00\t\00\00\00/mnt/development/csgrs-ieee-egress/crates/hyperinterval/src/ieee/dyadic.rs\00\00\14\08\10\00J\00\00\00!\00\00\00\'\00\00\00unshifted IEEE significand has at most 53 bits\00\00\14\08\10\00J\00\00\00-\00\00\00\12\00\00\00\14\08\10\00J\00\00\00+\00\00\00\19\00\00\00retained IEEE significand has at most 53 bits\00\00\00\14\08\10\00J\00\00\00\'\00\00\00\12\00\00\00nonzero magnitude\00\00\00\14\08\10\00J\00\00\00(\00\00\008\00\00\00\14\08\10\00J\00\00\002\00\00\00!\00\00\00negative values are non-zero/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/bigint/shift.rs\00P\t\10\00c\00\00\00f\00\00\00(\00\00\00\00\00\00\80\00\00\00\00\00\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/big_digit.rs\d0\t\10\00`\00\00\00\b1\00\00\00!\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/biguint/subtraction.rsCannot subtract b from a because b is larger than a.\00\00\aa\n\10\004\00\00\00@\n\10\00j\00\00\00G\00\00\00\05\00\00\00@\n\10\00j\00\00\00g\00\00\00\05\00\00\00assertion failed: a_hi.is_empty()\00\00\00@\n\10\00j\00\00\00d\00\00\00\05\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/vec/mod.rs<\0b\10\00L\00\00\00V\n\00\00$\00\00\00Tried to shrink to a larger capacity\98\0b\10\00$\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/raw_vec/mod.rs\c4\0b\10\00P\00\00\00\b9\02\00\00\t\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/slice.rs\00\00$\0c\10\00J\00\00\00\be\01\00\00\1d\00\00\00\00\00\00\80\00\00\00\00\00\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/biguint/shift.rs\8c\0c\10\00d\00\00\00\1e\00\00\00\1c\00\00\00\8c\0c\10\00d\00\00\00\'\00\00\00\1b\00\00\00\8c\0c\10\00d\00\00\00)\00\00\00\1d\00\00\00\8c\0c\10\00d\00\00\00*\00\00\00\15\00\00\00\8c\0c\10\00d\00\00\00(\00\00\00\19\00\00\00\8c\0c\10\00d\00\00\00X\00\00\00\1c\00\00\00\8c\0c\10\00d\00\00\00[\00\00\00\15\00\00\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/big_digit.rs`\r\10\00`\00\00\00Y\00\00\00\'\00\00\00`\r\10\00`\00\00\00\8e\00\00\00\1d\00\00\00assertion failed: len <= 1\00\00`\r\10\00`\00\00\00\c8\00\00\00\11\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/raw_vec/mod.rs\0c\0e\10\00P\00\00\00.\02\00\00\11\00\00\00/rustc/6b00bc3880198600130e1cf62b8f8a93494488cc/library/alloc/src/raw_vec/mod.rsl\0e\10\00P\00\00\00.\02\00\00\11\00\00\00\14\00\00\00\0c\00\00\00\04\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00/rust/deps/dlmalloc-0.2.8/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00\e4\0e\10\00)\00\00\00\ac\04\00\00\t\00\00\00assertion failed: psize <= size + max_overhead\00\00\e4\0e\10\00)\00\00\00\b2\04\00\00\r\00\00\00memory allocation of  bytes failed\00\00\8c\0f\10\00\15\00\00\00\a1\0f\10\00\r\00\00\00library/std/src/alloc.rs\c0\0f\10\00\18\00\00\00d\01\00\00\t\00\00\00\14\00\00\00\0c\00\00\00\04\00\00\00\18\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\19\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\1a\00\00\00\1b\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\10\00\00\00\04\00\00\00\1f\00\00\00 \00\00\00!\00\00\00\"\00\00\00capacity overflow\00\00\00@\10\10\00\11\00\00\00attempt to add with overflow\\\10\10\00\1c\00\00\00attempt to subtract with overflow\00\00\00\80\10\10\00!\00\00\00attempt to shift right with overflow\ac\10\10\00$\00\00\00attempt to shift left with overflow\00\d8\10\10\00#\00\00\00)\00\00\00\01\00\00\00\00\00\00\00called `Option::unwrap()` on a `None` value==!=matchesassertion `left  right` failed\n  left: \n right: \00\00F\11\10\00\10\00\00\00V\11\10\00\17\00\00\00m\11\10\00\t\00\00\00 right` failed: \n  left: \00\00\00F\11\10\00\10\00\00\00\90\11\10\00\10\00\00\00\a0\11\10\00\t\00\00\00m\11\10\00\t\00\00\00: \00\00\01\00\00\00\00\00\00\00\cc\11\10\00\02\00\00\00\00\00\00\00\0c\00\00\00\04\00\00\00&\00\00\00\'\00\00\00(\00\00\00     { ,  {\n,\n} }((\n,0x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899range start index  out of range for slice of length \00\d7\12\10\00\12\00\00\00\e9\12\10\00\"\00\00\00range end index \1c\13\10\00\10\00\00\00\e9\12\10\00\"\00\00\00;\11\10\00=\11\10\00?\11\10\00\02\00\00\00\02\00\00\00\07\00\00\00")
 (table $0 41 41 funcref)
 (elem $0 (i32.const 1) $_ZN72_$LT$hyperinterval..state..IntervalError$u20$as$u20$core..fmt..Debug$GT$3fmt17h14782efba65270faE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h979ba1553e1ed070E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h60b431f8cd9d84a4E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h20e69f89bee506e7E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9c2e87f602bfc089E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h811f8ef5b0dfd2efE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h61671715f47e6009E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h86f3b7f690deb967E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0134fea8590a8ebE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe97619e0e0d12aeE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7dc0ac91f5d02537E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1d7860665311e8feE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h290d342de705ebf8E $_ZN67_$LT$hyperinterval..float..Binary32$u20$as$u20$core..fmt..Debug$GT$3fmt17h442b31530ca63946E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdec691068dc1a049E $_ZN67_$LT$hyperinterval..float..Binary64$u20$as$u20$core..fmt..Debug$GT$3fmt17hb78d8c3feaddf042E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h396c35edec27f58fE $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h10d43ed3b5ffe62fE $_ZN3std5alloc24default_alloc_error_hook17hbd8de71f1732263eE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h37d546d4b358ccb9E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h7850057311a0cef1E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17h61f319b0423b9825E $_ZN4core3fmt5Write9write_fmt17hc808c42956869ae8E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hffe704d8309d203aE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h7304e3c4160876daE $_ZN92_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h1300d7785d2cb8e7E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h89f7fb848e07ab49E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17hf8e628056151d29dE $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17h4b3ad1b286f4163aE $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h328305dd0d118fb6E $_ZN95_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h22bfd80d379a9576E $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17ha7c451ef50e5f856E $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17he84c4c3017ddad6dE $_ZN4core5panic12PanicPayload6as_str17h3575ee572e511855E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb7cc4525d713b4b9E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h44818328333068deE $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hbcc53bae7249994aE $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h915418dd4db6343bE $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h201a3da0f3901d61E $_ZN4core3fmt5Write9write_fmt17h5fc1c2cab027a787E)
 (export "memory" (memory $0))
 (export "verify_dyadic_egress" (func $verify_dyadic_egress))
 (export "__data_end" (global $global$1))
 (export "__heap_base" (global $global$2))
 (func $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (block $label$10
            (block $label$11
             (block $label$12
              (block $label$13
               (br_table $label$12 $label$4 $label$13 $label$12
                (i32.load8_u offset=12
                 (local.get $1)
                )
               )
              )
              (block $label$14
               (block $label$15
                (block $label$16
                 (br_if $label$16
                  (i32.ne
                   (local.tee $3
                    (i32.load
                     (local.get $1)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                 (local.set $4
                  (i32.const 0)
                 )
                 (br_if $label$14
                  (i32.ne
                   (i32.load offset=4
                    (local.get $1)
                   )
                   (i32.const 1)
                  )
                 )
                 (local.set $4
                  (i32.add
                   (local.get $1)
                   (i32.const 8)
                  )
                 )
                 (br $label$15)
                )
                (br_if $label$14
                 (i32.ne
                  (local.tee $4
                   (i32.load offset=8
                    (local.get $1)
                   )
                  )
                  (i32.const 1)
                 )
                )
                (local.set $4
                 (i32.load offset=4
                  (local.get $1)
                 )
                )
               )
               (br_if $label$10
                (i32.eq
                 (local.tee $4
                  (i32.load
                   (local.get $4)
                  )
                 )
                 (i32.const 1)
                )
               )
              )
              (br_table $label$10 $label$5 $label$11
               (i32.and
                (i32.sub
                 (i32.gt_u
                  (local.get $4)
                  (i32.const 1)
                 )
                 (i32.eqz
                  (local.get $4)
                 )
                )
                (i32.const 255)
               )
              )
             )
             (i32.store
              (local.tee $3
               (i32.add
                (local.get $2)
                (i32.const 8)
               )
              )
              (i32.load
               (i32.add
                (local.get $1)
                (i32.const 8)
               )
              )
             )
             (i64.store
              (local.get $2)
              (i64.load align=4
               (local.get $1)
              )
             )
             (call $_ZN10num_bigint7biguint8addition97_$LT$impl$u20$core..ops..arith..AddAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10add_assign17hc9af3becd6914718E
              (local.get $2)
             )
             (local.set $4
              (i32.load
               (local.get $3)
              )
             )
             (local.set $1
              (i32.load offset=4
               (local.get $2)
              )
             )
             (block $label$17
              (block $label$18
               (block $label$19
                (block $label$20
                 (br_if $label$20
                  (i32.eq
                   (local.tee $3
                    (i32.load
                     (local.get $2)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                 (br_if $label$19
                  (i32.eqz
                   (local.get $4)
                  )
                 )
                 (local.set $5
                  (i32.const 0)
                 )
                 (br $label$17)
                )
                (block $label$21
                 (br_if $label$21
                  (i32.eqz
                   (local.get $1)
                  )
                 )
                 (local.set $5
                  (i32.const 0)
                 )
                 (br $label$18)
                )
                (local.set $1
                 (i32.const 0)
                )
                (i32.store8
                 (i32.add
                  (local.get $2)
                  (i32.const 2)
                 )
                 (i32.const 0)
                )
                (i32.store16
                 (local.get $2)
                 (i32.const 0)
                )
                (local.set $5
                 (i32.const 1)
                )
                (br $label$18)
               )
               (i32.store8
                (i32.add
                 (local.get $2)
                 (i32.const 2)
                )
                (i32.const 0)
               )
               (i32.store16
                (local.get $2)
                (i32.const 0)
               )
               (local.set $5
                (i32.const 1)
               )
               (block $label$22
                (br_if $label$22
                 (i32.eqz
                  (local.get $3)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (local.get $1)
                 (i32.shl
                  (local.get $3)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (local.set $1
                (i32.const 0)
               )
              )
              (local.set $3
               (i32.const -2147483648)
              )
             )
             (i32.store8 offset=12
              (local.get $0)
              (local.get $5)
             )
             (i32.store offset=8
              (local.get $0)
              (local.get $4)
             )
             (i32.store offset=4
              (local.get $0)
              (local.get $1)
             )
             (i32.store
              (local.get $0)
              (local.get $3)
             )
             (i32.store16 offset=13 align=1
              (local.get $0)
              (i32.load16_u
               (local.get $2)
              )
             )
             (i32.store8
              (i32.add
               (local.get $0)
               (i32.const 15)
              )
              (i32.load8_u
               (i32.add
                (local.get $2)
                (i32.const 2)
               )
              )
             )
             (br $label$1)
            )
            (i32.store
             (i32.add
              (local.get $2)
              (i32.const 8)
             )
             (i32.load
              (i32.add
               (local.get $1)
               (i32.const 8)
              )
             )
            )
            (i64.store
             (local.get $2)
             (local.tee $6
              (i64.load align=4
               (local.get $1)
              )
             )
            )
            (block $label$23
             (block $label$24
              (block $label$25
               (block $label$26
                (block $label$27
                 (br_if $label$27
                  (i32.eq
                   (local.tee $3
                    (i32.wrap_i64
                     (local.get $6)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                 (br_if $label$26
                  (local.tee $1
                   (i32.load offset=8
                    (local.get $2)
                   )
                  )
                 )
                 (block $label$28
                  (br_if $label$28
                   (local.get $3)
                  )
                  (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
                   (local.get $2)
                   (i32.const 1048700)
                  )
                 )
                 (i32.store
                  (i32.load offset=4
                   (local.get $2)
                  )
                  (i32.const 1)
                 )
                 (i32.store offset=8
                  (local.get $2)
                  (i32.const 1)
                 )
                 (br $label$23)
                )
                (br_if $label$25
                 (i32.load offset=4
                  (local.get $2)
                 )
                )
                (i64.store offset=4 align=4
                 (local.get $2)
                 (i64.const 4294967297)
                )
                (br $label$23)
               )
               (i32.store offset=12
                (local.get $2)
                (i32.const 1)
               )
               (local.set $3
                (i32.load offset=4
                 (local.get $2)
                )
               )
               (br $label$24)
              )
              (local.set $1
               (i32.const 1)
              )
              (i32.store offset=12
               (local.get $2)
               (i32.const 1)
              )
              (local.set $3
               (i32.add
                (local.get $2)
                (i32.const 8)
               )
              )
             )
             (call $_ZN10num_bigint7biguint11subtraction7sub2rev17h2cc96b8ea53527e6E
              (i32.add
               (local.get $2)
               (i32.const 12)
              )
              (i32.const 1)
              (local.get $3)
              (local.get $1)
             )
            )
            (call $_ZN10num_bigint9big_digit9BigDigits9normalize17h1e853a296515931aE
             (local.get $2)
            )
            (local.set $4
             (i32.load offset=8
              (local.get $2)
             )
            )
            (local.set $1
             (i32.load offset=4
              (local.get $2)
             )
            )
            (br_if $label$9
             (i32.eq
              (local.tee $3
               (i32.load
                (local.get $2)
               )
              )
              (i32.const -2147483648)
             )
            )
            (br_if $label$8
             (i32.eqz
              (local.get $4)
             )
            )
            (local.set $5
             (i32.const 0)
            )
            (br $label$6)
           )
           (i64.store align=4
            (i32.add
             (local.get $0)
             (i32.const 8)
            )
            (i64.load offset=1048584
             (i32.const 0)
            )
           )
           (i64.store align=4
            (local.get $0)
            (i64.load offset=1048576
             (i32.const 0)
            )
           )
           (br $label$3)
          )
          (block $label$29
           (br_if $label$29
            (i32.eqz
             (local.get $1)
            )
           )
           (local.set $5
            (i32.const 0)
           )
           (local.set $3
            (i32.const -2147483648)
           )
           (br $label$6)
          )
          (local.set $1
           (i32.const 0)
          )
          (i32.store8
           (i32.add
            (local.get $2)
            (i32.const 2)
           )
           (i32.const 0)
          )
          (i32.store16
           (local.get $2)
           (i32.const 0)
          )
          (local.set $5
           (i32.const 1)
          )
          (local.set $3
           (i32.const -2147483648)
          )
          (br $label$7)
         )
         (i32.store8
          (i32.add
           (local.get $2)
           (i32.const 2)
          )
          (i32.const 0)
         )
         (i32.store16
          (local.get $2)
          (i32.const 0)
         )
         (local.set $5
          (i32.const 1)
         )
         (block $label$30
          (br_if $label$30
           (i32.eqz
            (local.get $3)
           )
          )
          (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
           (local.get $1)
           (i32.shl
            (local.get $3)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (local.set $3
          (i32.const -2147483648)
         )
         (local.set $1
          (i32.const 0)
         )
        )
       )
       (i32.store8 offset=12
        (local.get $0)
        (local.get $5)
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $4)
       )
       (i32.store offset=4
        (local.get $0)
        (local.get $1)
       )
       (i32.store
        (local.get $0)
        (local.get $3)
       )
       (i32.store16 offset=13 align=1
        (local.get $0)
        (i32.load16_u
         (local.get $2)
        )
       )
       (i32.store8
        (i32.add
         (local.get $0)
         (i32.const 15)
        )
        (i32.load8_u
         (i32.add
          (local.get $2)
          (i32.const 2)
         )
        )
       )
       (br $label$1)
      )
      (i32.store
       (local.tee $3
        (i32.add
         (local.get $2)
         (i32.const 8)
        )
       )
       (i32.load
        (i32.add
         (local.get $1)
         (i32.const 8)
        )
       )
      )
      (i64.store
       (local.get $2)
       (i64.load align=4
        (local.get $1)
       )
      )
      (call $_ZN10num_bigint7biguint11subtraction97_$LT$impl$u20$core..ops..arith..SubAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10sub_assign17hf6c4bf2372622459E
       (local.get $2)
       (i32.const 1)
      )
      (local.set $3
       (i32.load
        (local.get $3)
       )
      )
      (local.set $1
       (i32.load offset=4
        (local.get $2)
       )
      )
      (block $label$31
       (block $label$32
        (br_if $label$32
         (i32.eq
          (local.tee $4
           (i32.load
            (local.get $2)
           )
          )
          (i32.const -2147483648)
         )
        )
        (br_if $label$31
         (i32.eqz
          (local.get $3)
         )
        )
        (br $label$2)
       )
       (br_if $label$2
        (local.get $1)
       )
       (i64.store align=4
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
        (i64.load offset=1048584
         (i32.const 0)
        )
       )
       (i64.store align=4
        (local.get $0)
        (i64.load offset=1048576
         (i32.const 0)
        )
       )
       (br $label$1)
      )
      (i64.store align=4
       (i32.add
        (local.get $0)
        (i32.const 8)
       )
       (i64.load offset=1048584
        (i32.const 0)
       )
      )
      (i64.store align=4
       (local.get $0)
       (i64.load offset=1048576
        (i32.const 0)
       )
      )
      (br_if $label$1
       (i32.eqz
        (local.get $4)
       )
      )
      (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
       (local.get $1)
       (i32.shl
        (local.get $4)
        (i32.const 2)
       )
       (i32.const 4)
      )
      (br $label$1)
     )
     (i32.store8 offset=12
      (local.get $0)
      (i32.const 0)
     )
     (i32.store offset=8
      (local.get $0)
      (i32.const 1)
     )
     (i64.store align=4
      (local.get $0)
      (i64.const 6442450944)
     )
     (local.set $3
      (i32.load
       (local.get $1)
      )
     )
    )
    (br_if $label$1
     (i32.eq
      (local.get $3)
      (i32.const -2147483648)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $3)
     )
    )
    (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
     (i32.load offset=4
      (local.get $1)
     )
     (i32.shl
      (local.get $3)
      (i32.const 2)
     )
     (i32.const 4)
    )
    (br $label$1)
   )
   (i32.store8 offset=12
    (local.get $0)
    (i32.const 2)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $3)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $1)
   )
   (i32.store
    (local.get $0)
    (local.get $4)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
 )
 (func $_ZN10num_bigint7biguint8addition97_$LT$impl$u20$core..ops..arith..AddAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10add_assign17hc9af3becd6914718E (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (br_if $label$6
         (i32.eq
          (local.tee $1
           (i32.load
            (local.get $0)
           )
          )
          (i32.const -2147483648)
         )
        )
        (br_if $label$5
         (local.tee $2
          (i32.load offset=8
           (local.get $0)
          )
         )
        )
        (block $label$7
         (br_if $label$7
          (local.get $1)
         )
         (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
          (local.get $0)
          (i32.const 1048700)
         )
        )
        (i32.store
         (i32.load offset=4
          (local.get $0)
         )
         (i32.const 1)
        )
        (i32.store offset=8
         (local.get $0)
         (i32.const 1)
        )
        (return)
       )
       (br_if $label$4
        (i32.load offset=4
         (local.get $0)
        )
       )
       (i64.store offset=4 align=4
        (local.get $0)
        (i64.const 4294967297)
       )
       (return)
      )
      (i32.store
       (local.tee $1
        (i32.load offset=4
         (local.get $0)
        )
       )
       (local.tee $3
        (i32.add
         (i32.load
          (local.get $1)
         )
         (i32.const 1)
        )
       )
      )
      (br_if $label$2
       (local.get $3)
      )
      (br_if $label$3
       (i32.eq
        (local.get $2)
        (i32.const 1)
       )
      )
      (local.set $3
       (i32.add
        (i32.shl
         (local.get $2)
         (i32.const 2)
        )
        (i32.const -4)
       )
      )
      (local.set $1
       (i32.add
        (local.get $1)
        (i32.const 4)
       )
      )
      (loop $label$8
       (i32.store
        (local.get $1)
        (local.tee $2
         (i32.add
          (i32.load
           (local.get $1)
          )
          (i32.const 1)
         )
        )
       )
       (br_if $label$2
        (local.get $2)
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (br_if $label$3
        (i32.eqz
         (local.tee $3
          (i32.add
           (local.get $3)
           (i32.const -4)
          )
         )
        )
       )
       (br $label$8)
      )
     )
     (i32.store offset=8
      (local.get $0)
      (local.tee $1
       (i32.add
        (i32.load offset=8
         (local.get $0)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (local.get $1)
     )
    )
    (block $label$9
     (br_if $label$9
      (i32.eq
       (local.tee $1
        (i32.load
         (local.get $0)
        )
       )
       (i32.const -2147483648)
      )
     )
     (block $label$10
      (br_if $label$10
       (i32.ne
        (local.tee $2
         (i32.load offset=8
          (local.get $0)
         )
        )
        (local.get $1)
       )
      )
      (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
       (local.get $0)
       (i32.const 1048700)
      )
     )
     (i32.store
      (i32.add
       (i32.load offset=4
        (local.get $0)
       )
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
      )
      (i32.const 1)
     )
     (i32.store offset=8
      (local.get $0)
      (i32.add
       (local.get $2)
       (i32.const 1)
      )
     )
     (return)
    )
    (block $label$11
     (br_if $label$11
      (i32.ne
       (i32.load offset=4
        (local.get $0)
       )
       (i32.const 1)
      )
     )
     (drop
      (i32.load8_u offset=1053525
       (i32.const 0)
      )
     )
     (local.set $2
      (i32.load offset=8
       (local.get $0)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.tee $1
        (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
         (i32.const 8)
         (i32.const 4)
        )
       )
      )
     )
     (i32.store offset=4
      (local.get $1)
      (i32.const 1)
     )
     (i32.store
      (local.get $1)
      (local.get $2)
     )
     (i32.store offset=8
      (local.get $0)
      (i32.const 2)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $1)
     )
     (i32.store
      (local.get $0)
      (i32.const 2)
     )
     (return)
    )
    (i64.store offset=4 align=4
     (local.get $0)
     (i64.const 4294967297)
    )
   )
   (return)
  )
  (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
   (i32.const 4)
   (i32.const 8)
   (i32.const 1049004)
  )
  (unreachable)
 )
 (func $_ZN10num_bigint9big_digit9BigDigits9normalize17h1e853a296515931aE (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eq
        (local.tee $2
         (i32.load
          (local.get $0)
         )
        )
        (i32.const -2147483648)
       )
      )
      (br_if $label$3
       (local.tee $3
        (i32.load offset=8
         (local.get $0)
        )
       )
      )
      (local.set $3
       (i32.const 0)
      )
      (br $label$2)
     )
     (br_if $label$1
      (i32.ne
       (i32.load offset=4
        (local.get $0)
       )
       (i32.const 1)
      )
     )
     (br_if $label$1
      (i32.load offset=8
       (local.get $0)
      )
     )
     (i32.store offset=4
      (local.get $0)
      (i32.const 0)
     )
     (br $label$1)
    )
    (br_if $label$2
     (i32.load
      (i32.add
       (i32.add
        (local.tee $4
         (i32.load offset=4
          (local.get $0)
         )
        )
        (local.tee $5
         (i32.shl
          (local.get $3)
          (i32.const 2)
         )
        )
       )
       (i32.const -4)
      )
     )
    )
    (local.set $6
     (i32.add
      (local.get $4)
      (i32.const -4)
     )
    )
    (local.set $4
     (i32.and
      (local.get $3)
      (i32.const 1073741823)
     )
    )
    (block $label$5
     (loop $label$6
      (block $label$7
       (br_if $label$7
        (local.get $5)
       )
       (local.set $5
        (i32.const 0)
       )
       (br $label$5)
      )
      (local.set $4
       (i32.add
        (local.get $4)
        (i32.const -1)
       )
      )
      (local.set $7
       (i32.add
        (local.get $6)
        (local.get $5)
       )
      )
      (local.set $5
       (i32.add
        (local.get $5)
        (i32.const -4)
       )
      )
      (br_if $label$6
       (i32.eqz
        (i32.load
         (local.get $7)
        )
       )
      )
     )
     (br_if $label$2
      (i32.gt_u
       (local.tee $5
        (i32.add
         (local.get $4)
         (i32.const 1)
        )
       )
       (local.get $3)
      )
     )
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $5)
    )
    (local.set $3
     (local.get $5)
    )
   )
   (br_if $label$1
    (i32.ge_u
     (local.get $3)
     (i32.shr_u
      (local.get $2)
      (i32.const 1)
     )
    )
   )
   (block $label$8
    (block $label$9
     (block $label$10
      (br_table $label$10 $label$9 $label$8
       (local.get $3)
      )
     )
     (block $label$11
      (br_if $label$11
       (i32.eqz
        (local.get $2)
       )
      )
      (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
       (i32.load offset=4
        (local.get $0)
       )
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
       (i32.const 4)
      )
     )
     (i32.store
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
      (i32.load offset=1048600
       (i32.const 0)
      )
     )
     (i64.store align=4
      (local.get $0)
      (i64.load offset=1048592 align=4
       (i32.const 0)
      )
     )
     (br $label$1)
    )
    (local.set $5
     (i32.load
      (local.tee $4
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
    )
    (block $label$12
     (br_if $label$12
      (i32.eqz
       (local.get $2)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (local.get $4)
      (i32.shl
       (local.get $2)
       (i32.const 2)
      )
      (i32.const 4)
     )
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $5)
    )
    (i64.store align=4
     (local.get $0)
     (i64.const 6442450944)
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.le_u
     (local.get $2)
     (local.tee $5
      (i32.add
       (local.get $3)
       (i32.const 1)
      )
     )
    )
   )
   (block $label$13
    (br_if $label$13
     (i32.gt_u
      (local.get $3)
      (local.get $2)
     )
    )
    (block $label$14
     (br_if $label$14
      (i32.eqz
       (local.tee $4
        (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_realloc
         (i32.load offset=4
          (local.get $0)
         )
         (i32.shl
          (local.get $2)
          (i32.const 2)
         )
         (i32.const 4)
         (local.tee $7
          (i32.shl
           (local.get $5)
           (i32.const 2)
          )
         )
        )
       )
      )
     )
     (i32.store
      (local.get $0)
      (local.get $5)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $4)
     )
     (br $label$1)
    )
    (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
     (i32.const 4)
     (local.get $7)
     (i32.const 1048716)
    )
    (unreachable)
   )
   (i32.store offset=24
    (local.get $1)
    (i32.const 0)
   )
   (i32.store offset=12
    (local.get $1)
    (i32.const 1)
   )
   (i32.store offset=8
    (local.get $1)
    (i32.const 1049416)
   )
   (i64.store offset=16 align=4
    (local.get $1)
    (i64.const 4)
   )
   (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
    (i32.add
     (local.get $1)
     (i32.const 8)
    )
    (i32.const 1049504)
   )
   (unreachable)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZN10num_bigint6bigint8addition89_$LT$impl$u20$core..ops..arith..Add$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3add17he2e1024fec47bcebE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (br_table $label$6 $label$5 $label$3 $label$6
         (i32.load8_u offset=12
          (local.get $1)
         )
        )
       )
       (block $label$7
        (block $label$8
         (block $label$9
          (block $label$10
           (block $label$11
            (block $label$12
             (block $label$13
              (br_if $label$13
               (i32.ne
                (local.tee $3
                 (i32.load
                  (local.get $1)
                 )
                )
                (i32.const -2147483648)
               )
              )
              (local.set $4
               (i32.const 0)
              )
              (br_if $label$11
               (i32.ne
                (i32.load offset=4
                 (local.get $1)
                )
                (i32.const 1)
               )
              )
              (local.set $4
               (i32.add
                (local.get $1)
                (i32.const 8)
               )
              )
              (br $label$12)
             )
             (br_if $label$11
              (i32.ne
               (local.tee $4
                (i32.load offset=8
                 (local.get $1)
                )
               )
               (i32.const 1)
              )
             )
             (local.set $4
              (i32.load offset=4
               (local.get $1)
              )
             )
            )
            (br_if $label$10
             (i32.eq
              (local.tee $4
               (i32.load
                (local.get $4)
               )
              )
              (i32.const 1)
             )
            )
           )
           (block $label$14
            (br_table $label$10 $label$7 $label$14
             (i32.and
              (i32.sub
               (i32.gt_u
                (local.get $4)
                (i32.const 1)
               )
               (i32.eqz
                (local.get $4)
               )
              )
              (i32.const 255)
             )
            )
           )
           (i32.store
            (i32.add
             (local.get $2)
             (i32.const 8)
            )
            (i32.load
             (i32.add
              (local.get $1)
              (i32.const 8)
             )
            )
           )
           (i64.store
            (local.get $2)
            (local.tee $5
             (i64.load align=4
              (local.get $1)
             )
            )
           )
           (block $label$15
            (block $label$16
             (block $label$17
              (block $label$18
               (block $label$19
                (br_if $label$19
                 (i32.eq
                  (local.tee $3
                   (i32.wrap_i64
                    (local.get $5)
                   )
                  )
                  (i32.const -2147483648)
                 )
                )
                (br_if $label$18
                 (local.tee $1
                  (i32.load offset=8
                   (local.get $2)
                  )
                 )
                )
                (block $label$20
                 (br_if $label$20
                  (local.get $3)
                 )
                 (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
                  (local.get $2)
                  (i32.const 1048700)
                 )
                )
                (i32.store
                 (i32.load offset=4
                  (local.get $2)
                 )
                 (i32.const 1)
                )
                (i32.store offset=8
                 (local.get $2)
                 (i32.const 1)
                )
                (br $label$15)
               )
               (br_if $label$17
                (i32.load offset=4
                 (local.get $2)
                )
               )
               (i64.store offset=4 align=4
                (local.get $2)
                (i64.const 4294967297)
               )
               (br $label$15)
              )
              (i32.store offset=12
               (local.get $2)
               (i32.const 1)
              )
              (local.set $3
               (i32.load offset=4
                (local.get $2)
               )
              )
              (br $label$16)
             )
             (local.set $1
              (i32.const 1)
             )
             (i32.store offset=12
              (local.get $2)
              (i32.const 1)
             )
             (local.set $3
              (i32.add
               (local.get $2)
               (i32.const 8)
              )
             )
            )
            (call $_ZN10num_bigint7biguint11subtraction7sub2rev17h2cc96b8ea53527e6E
             (i32.add
              (local.get $2)
              (i32.const 12)
             )
             (i32.const 1)
             (local.get $3)
             (local.get $1)
            )
           )
           (call $_ZN10num_bigint9big_digit9BigDigits9normalize17h1e853a296515931aE
            (local.get $2)
           )
           (local.set $3
            (i32.load offset=8
             (local.get $2)
            )
           )
           (local.set $1
            (i32.load offset=4
             (local.get $2)
            )
           )
           (br_if $label$9
            (i32.eq
             (local.tee $4
              (i32.load
               (local.get $2)
              )
             )
             (i32.const -2147483648)
            )
           )
           (br_if $label$8
            (i32.eqz
             (local.get $3)
            )
           )
           (br $label$2)
          )
          (i64.store align=4
           (i32.add
            (local.get $0)
            (i32.const 8)
           )
           (i64.load offset=1048584
            (i32.const 0)
           )
          )
          (i64.store align=4
           (local.get $0)
           (i64.load offset=1048576
            (i32.const 0)
           )
          )
          (br $label$4)
         )
         (br_if $label$2
          (local.get $1)
         )
         (i64.store align=4
          (i32.add
           (local.get $0)
           (i32.const 8)
          )
          (i64.load offset=1048584
           (i32.const 0)
          )
         )
         (i64.store align=4
          (local.get $0)
          (i64.load offset=1048576
           (i32.const 0)
          )
         )
         (br $label$1)
        )
        (i64.store align=4
         (i32.add
          (local.get $0)
          (i32.const 8)
         )
         (i64.load offset=1048584
          (i32.const 0)
         )
        )
        (i64.store align=4
         (local.get $0)
         (i64.load offset=1048576
          (i32.const 0)
         )
        )
        (br_if $label$1
         (i32.eqz
          (local.get $4)
         )
        )
        (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
         (local.get $1)
         (i32.shl
          (local.get $4)
          (i32.const 2)
         )
         (i32.const 4)
        )
        (br $label$1)
       )
       (i32.store
        (local.tee $3
         (i32.add
          (local.get $2)
          (i32.const 8)
         )
        )
        (i32.load
         (i32.add
          (local.get $1)
          (i32.const 8)
         )
        )
       )
       (i64.store
        (local.get $2)
        (i64.load align=4
         (local.get $1)
        )
       )
       (call $_ZN10num_bigint7biguint11subtraction97_$LT$impl$u20$core..ops..arith..SubAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10sub_assign17hf6c4bf2372622459E
        (local.get $2)
        (i32.const 1)
       )
       (local.set $4
        (i32.load
         (local.get $3)
        )
       )
       (local.set $1
        (i32.load offset=4
         (local.get $2)
        )
       )
       (block $label$21
        (block $label$22
         (block $label$23
          (block $label$24
           (br_if $label$24
            (i32.eq
             (local.tee $3
              (i32.load
               (local.get $2)
              )
             )
             (i32.const -2147483648)
            )
           )
           (br_if $label$23
            (i32.eqz
             (local.get $4)
            )
           )
           (local.set $6
            (i32.const 0)
           )
           (br $label$21)
          )
          (block $label$25
           (br_if $label$25
            (i32.eqz
             (local.get $1)
            )
           )
           (local.set $6
            (i32.const 0)
           )
           (local.set $3
            (i32.const -2147483648)
           )
           (br $label$21)
          )
          (local.set $1
           (i32.const 0)
          )
          (i32.store8
           (i32.add
            (local.get $2)
            (i32.const 2)
           )
           (i32.const 0)
          )
          (i32.store16
           (local.get $2)
           (i32.const 0)
          )
          (local.set $6
           (i32.const 1)
          )
          (local.set $3
           (i32.const -2147483648)
          )
          (br $label$22)
         )
         (i32.store8
          (i32.add
           (local.get $2)
           (i32.const 2)
          )
          (i32.const 0)
         )
         (i32.store16
          (local.get $2)
          (i32.const 0)
         )
         (local.set $6
          (i32.const 1)
         )
         (block $label$26
          (br_if $label$26
           (i32.eqz
            (local.get $3)
           )
          )
          (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
           (local.get $1)
           (i32.shl
            (local.get $3)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (local.set $3
          (i32.const -2147483648)
         )
         (local.set $1
          (i32.const 0)
         )
        )
       )
       (i32.store8 offset=12
        (local.get $0)
        (local.get $6)
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $4)
       )
       (i32.store offset=4
        (local.get $0)
        (local.get $1)
       )
       (i32.store
        (local.get $0)
        (local.get $3)
       )
       (i32.store16 offset=13 align=1
        (local.get $0)
        (i32.load16_u
         (local.get $2)
        )
       )
       (i32.store8
        (i32.add
         (local.get $0)
         (i32.const 15)
        )
        (i32.load8_u
         (i32.add
          (local.get $2)
          (i32.const 2)
         )
        )
       )
       (br $label$1)
      )
      (i32.store offset=8
       (local.get $0)
       (i32.const 1)
      )
      (i64.store align=4
       (local.get $0)
       (i64.const 6442450944)
      )
      (i32.store8 offset=12
       (local.get $0)
       (i32.const 2)
      )
      (local.set $3
       (i32.load
        (local.get $1)
       )
      )
     )
     (br_if $label$1
      (i32.eq
       (local.get $3)
       (i32.const -2147483648)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.get $3)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (i32.load offset=4
       (local.get $1)
      )
      (i32.shl
       (local.get $3)
       (i32.const 2)
      )
      (i32.const 4)
     )
     (br $label$1)
    )
    (i32.store
     (local.tee $3
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
     )
     (i32.load
      (i32.add
       (local.get $1)
       (i32.const 8)
      )
     )
    )
    (i64.store
     (local.get $2)
     (i64.load align=4
      (local.get $1)
     )
    )
    (call $_ZN10num_bigint7biguint8addition97_$LT$impl$u20$core..ops..arith..AddAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10add_assign17hc9af3becd6914718E
     (local.get $2)
    )
    (local.set $3
     (i32.load
      (local.get $3)
     )
    )
    (local.set $1
     (i32.load offset=4
      (local.get $2)
     )
    )
    (block $label$27
     (block $label$28
      (block $label$29
       (br_if $label$29
        (i32.eq
         (local.tee $4
          (i32.load
           (local.get $2)
          )
         )
         (i32.const -2147483648)
        )
       )
       (br_if $label$28
        (i32.eqz
         (local.get $3)
        )
       )
       (br $label$27)
      )
      (br_if $label$27
       (local.get $1)
      )
      (i64.store align=4
       (i32.add
        (local.get $0)
        (i32.const 8)
       )
       (i64.load offset=1048584
        (i32.const 0)
       )
      )
      (i64.store align=4
       (local.get $0)
       (i64.load offset=1048576
        (i32.const 0)
       )
      )
      (br $label$1)
     )
     (i64.store align=4
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
      (i64.load offset=1048584
       (i32.const 0)
      )
     )
     (i64.store align=4
      (local.get $0)
      (i64.load offset=1048576
       (i32.const 0)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.get $4)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (local.get $1)
      (i32.shl
       (local.get $4)
       (i32.const 2)
      )
      (i32.const 4)
     )
     (br $label$1)
    )
    (i32.store8 offset=12
     (local.get $0)
     (i32.const 2)
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $3)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $1)
    )
    (i32.store
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (i32.store8 offset=12
    (local.get $0)
    (i32.const 2)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $3)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $1)
   )
   (i32.store
    (local.get $0)
    (local.get $4)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
 )
 (func $_ZN72_$LT$hyperinterval..state..IntervalError$u20$as$u20$core..fmt..Debug$GT$3fmt17h14782efba65270faE (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE
   (local.get $1)
   (i32.load
    (i32.add
     (local.tee $0
      (i32.shl
       (i32.load8_u
        (local.get $0)
       )
       (i32.const 2)
      )
     )
     (i32.const 1049260)
    )
   )
   (i32.load
    (i32.add
     (local.get $0)
     (i32.const 1049204)
    )
   )
  )
 )
 (func $_ZN32interval_dyadic_wasm_conformance5cases6verify17h713e683a31014c55E (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i64)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i64)
  (local $24 i64)
  (local $25 i32)
  (local $26 i64)
  (global.set $__stack_pointer
   (local.tee $0
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 624)
    )
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 0)
   (i32.const 24)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$1)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
   (i32.add
    (local.get $0)
    (i32.const 608)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 0)
   (i32.const 24)
  )
  (block $label$3
   (block $label$4
    (br_if $label$4
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$3)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
   (i32.add
    (local.get $0)
    (i32.const 584)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$5)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint8addition89_$LT$impl$u20$core..ops..arith..Add$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3add17he2e1024fec47bcebE
   (i32.add
    (local.get $0)
    (i32.const 504)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$7
   (block $label$8
    (br_if $label$8
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$7)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 16)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$9
   (block $label$10
    (br_if $label$10
     (i32.eq
      (i32.load offset=16
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=24
       (local.get $0)
      )
     )
    )
    (br $label$9)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=20
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (local.tee $2
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 32)
     )
     (i32.const 8)
    )
   )
   (i32.load
    (local.tee $3
     (i32.add
      (i32.add
       (local.get $0)
       (i32.const 16)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=16 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint8addition89_$LT$impl$u20$core..ops..arith..Add$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3add17he2e1024fec47bcebE
   (i32.add
    (local.get $0)
    (i32.const 16)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 288)
   )
   (i64.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 608)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 328)
   )
   (i64.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 584)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 368)
   )
   (i64.load
    (local.tee $4
     (i32.add
      (i32.add
       (local.get $0)
       (i32.const 504)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 408)
   )
   (i64.load
    (local.tee $5
     (i32.add
      (i32.add
       (local.get $0)
       (i32.const 544)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store offset=280
   (local.get $0)
   (i64.load offset=608
    (local.get $0)
   )
  )
  (i64.store offset=320
   (local.get $0)
   (i64.load offset=584
    (local.get $0)
   )
  )
  (i64.store offset=360
   (local.get $0)
   (i64.load offset=504
    (local.get $0)
   )
  )
  (i64.store offset=400
   (local.get $0)
   (i64.load offset=544
    (local.get $0)
   )
  )
  (i32.store offset=36
   (local.get $0)
   (i32.const 11)
  )
  (local.set $6
   (i32.const 0)
  )
  (i64.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 16)
   )
   (i64.load offset=1048584
    (i32.const 0)
   )
  )
  (i64.store offset=40
   (local.get $0)
   (i64.load offset=1048576
    (i32.const 0)
   )
  )
  (i64.store offset=432
   (local.get $0)
   (i64.const 1065353216)
  )
  (i32.store offset=424
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=416
   (local.get $0)
   (i64.const 1065353215)
  )
  (i64.store offset=392
   (local.get $0)
   (i64.const 1065353217)
  )
  (i32.store offset=384
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=376
   (local.get $0)
   (i64.const 1065353216)
  )
  (i64.store offset=352
   (local.get $0)
   (i64.const 2139095039)
  )
  (i32.store offset=344
   (local.get $0)
   (i32.const 104)
  )
  (i64.store offset=336
   (local.get $0)
   (i64.const 2139095039)
  )
  (i64.store offset=312
   (local.get $0)
   (i64.const 8388608)
  )
  (i32.store offset=304
   (local.get $0)
   (i32.const -150)
  )
  (i64.store offset=296
   (local.get $0)
   (i64.const 8388607)
  )
  (i64.store offset=272
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=264
   (local.get $0)
   (i32.const -2147483648)
  )
  (i64.store offset=256
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=252
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=248
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=240
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=232
   (local.get $0)
   (i64.const 2)
  )
  (i32.store offset=224
   (local.get $0)
   (i32.const -150)
  )
  (i64.store offset=216
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=212
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=208
   (local.get $0)
   (i32.const 3)
  )
  (i64.store offset=200
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=192
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=184
   (local.get $0)
   (i32.const -150)
  )
  (i64.store offset=176
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=172
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=168
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=160
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=152
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=144
   (local.get $0)
   (i32.const -149)
  )
  (i64.store offset=136
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=132
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=128
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=120
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=112
   (local.get $0)
   (i64.const 1065353216)
  )
  (i32.store offset=104
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=96
   (local.get $0)
   (i64.const 1065353216)
  )
  (i32.store8 offset=92
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=88
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=80
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=72
   (local.get $0)
   (i64.const 0)
  )
  (i32.store offset=64
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=56
   (local.get $0)
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 448)
   )
   (i64.load
    (local.get $3)
   )
  )
  (i64.store offset=456
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=464
   (local.get $0)
   (i32.const -4245)
  )
  (i64.store offset=472
   (local.get $0)
   (i64.const 2)
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=440
   (local.get $0)
   (i64.load offset=16
    (local.get $0)
   )
  )
  (block $label$11
   (block $label$12
    (block $label$13
     (block $label$14
      (block $label$15
       (block $label$16
        (block $label$17
         (block $label$18
          (block $label$19
           (block $label$20
            (block $label$21
             (block $label$22
              (block $label$23
               (br_if $label$23
                (i32.ne
                 (local.tee $7
                  (i32.load offset=40
                   (local.get $0)
                  )
                 )
                 (i32.const -2147483647)
                )
               )
               (local.set $1
                (i32.add
                 (local.get $0)
                 (i32.const 80)
                )
               )
               (local.set $3
                (i32.const 10)
               )
               (br $label$22)
              )
              (local.set $8
               (i64.load offset=56
                (local.get $0)
               )
              )
              (local.set $9
               (i32.load offset=64
                (local.get $0)
               )
              )
              (local.set $10
               (i64.load offset=72
                (local.get $0)
               )
              )
              (local.set $3
               (i32.const 2)
              )
              (local.set $1
               (local.get $2)
              )
              (loop $label$24
               (local.set $6
                (local.get $3)
               )
               (local.set $12
                (i32.or
                 (i32.gt_u
                  (local.tee $3
                   (i32.load offset=8
                    (local.get $1)
                   )
                  )
                  (i32.const 1073741823)
                 )
                 (i32.gt_u
                  (local.tee $11
                   (i32.shl
                    (local.get $3)
                    (i32.const 2)
                   )
                  )
                  (i32.const 2147483644)
                 )
                )
               )
               (local.set $13
                (i32.const -2147483648)
               )
               (local.set $14
                (i32.load8_u offset=12
                 (local.get $1)
                )
               )
               (local.set $1
                (i32.load offset=4
                 (local.get $1)
                )
               )
               (block $label$25
                (block $label$26
                 (block $label$27
                  (br_if $label$27
                   (i32.ne
                    (local.get $7)
                    (i32.const -2147483648)
                   )
                  )
                  (local.set $15
                   (local.get $1)
                  )
                  (br $label$26)
                 )
                 (local.set $15
                  (local.get $3)
                 )
                 (block $label$28
                  (block $label$29
                   (br_table $label$25 $label$29 $label$28
                    (local.get $3)
                   )
                  )
                  (local.set $16
                   (i32.load
                    (local.get $1)
                   )
                  )
                  (local.set $15
                   (i32.const 1)
                  )
                  (br $label$25)
                 )
                 (block $label$30
                  (block $label$31
                   (block $label$32
                    (block $label$33
                     (br_if $label$33
                      (i32.eqz
                       (local.get $12)
                      )
                     )
                     (local.set $15
                      (i32.const 0)
                     )
                     (br $label$32)
                    )
                    (block $label$34
                     (br_if $label$34
                      (local.get $11)
                     )
                     (local.set $17
                      (i32.const 4)
                     )
                     (local.set $13
                      (i32.const 0)
                     )
                     (br $label$30)
                    )
                    (drop
                     (i32.load8_u offset=1053525
                      (i32.const 0)
                     )
                    )
                    (local.set $15
                     (i32.const 4)
                    )
                    (br_if $label$31
                     (local.tee $17
                      (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                       (local.get $11)
                       (i32.const 4)
                      )
                     )
                    )
                    (local.set $17
                     (local.get $11)
                    )
                   )
                   (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
                    (local.get $15)
                    (local.get $17)
                    (i32.const 1049004)
                   )
                   (unreachable)
                  )
                  (local.set $13
                   (local.get $3)
                  )
                 )
                 (block $label$35
                  (br_if $label$35
                   (i32.eqz
                    (local.get $11)
                   )
                  )
                  (memory.copy
                   (local.get $17)
                   (local.get $1)
                   (local.get $11)
                  )
                 )
                 (local.set $15
                  (local.get $17)
                 )
                )
                (local.set $16
                 (local.get $3)
                )
               )
               (i32.store8 offset=596
                (local.get $0)
                (local.get $14)
               )
               (i32.store offset=592
                (local.get $0)
                (local.get $16)
               )
               (i32.store offset=588
                (local.get $0)
                (local.get $15)
               )
               (i32.store offset=584
                (local.get $0)
                (local.get $13)
               )
               (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
                (local.get $9)
               )
               (br_if $label$17
                (i32.eq
                 (i32.load offset=544
                  (local.get $0)
                 )
                 (i32.const -2147483646)
                )
               )
               (i32.store
                (local.tee $13
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 504)
                  )
                  (i32.const 32)
                 )
                )
                (i32.load
                 (local.tee $18
                  (i32.add
                   (i32.add
                    (local.get $0)
                    (i32.const 544)
                   )
                   (i32.const 32)
                  )
                 )
                )
               )
               (i64.store
                (local.tee $19
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 504)
                  )
                  (i32.const 24)
                 )
                )
                (i64.load align=4
                 (local.tee $20
                  (i32.add
                   (i32.add
                    (local.get $0)
                    (i32.const 544)
                   )
                   (i32.const 24)
                  )
                 )
                )
               )
               (i64.store
                (local.tee $21
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 504)
                  )
                  (i32.const 16)
                 )
                )
                (i64.load align=4
                 (local.tee $22
                  (i32.add
                   (i32.add
                    (local.get $0)
                    (i32.const 544)
                   )
                   (i32.const 16)
                  )
                 )
                )
               )
               (i64.store
                (local.get $4)
                (i64.load align=4
                 (local.get $5)
                )
               )
               (i64.store offset=504
                (local.get $0)
                (i64.load offset=544 align=4
                 (local.get $0)
                )
               )
               (i64.store offset=552
                (local.get $0)
                (i64.const 100000)
               )
               (i64.store offset=544
                (local.get $0)
                (i64.const 8192)
               )
               (call $_ZN13hyperinterval5float12F32Enclosure11from_dyadic17h0b1bbdce0a322157E
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
               )
               (br_if $label$16
                (i32.eq
                 (local.tee $15
                  (i32.load offset=584
                   (local.get $0)
                  )
                 )
                 (i32.const 2)
                )
               )
               (br_if $label$15
                (i32.eqz
                 (i32.and
                  (local.get $15)
                  (i32.const 1)
                 )
                )
               )
               (local.set $23
                (i64.load32_u offset=592
                 (local.get $0)
                )
               )
               (local.set $24
                (i64.load32_u offset=588
                 (local.get $0)
                )
               )
               (i64.store offset=616
                (local.get $0)
                (local.get $10)
               )
               (i64.store offset=608
                (local.get $0)
                (local.get $8)
               )
               (i64.store offset=592
                (local.get $0)
                (local.get $23)
               )
               (i64.store offset=584
                (local.get $0)
                (local.get $24)
               )
               (br_if $label$14
                (i64.ne
                 (local.get $8)
                 (local.get $24)
                )
               )
               (br_if $label$14
                (i64.ne
                 (local.get $10)
                 (local.get $23)
                )
               )
               (block $label$36
                (block $label$37
                 (block $label$38
                  (br_table $label$37 $label$36 $label$38
                   (i32.add
                    (local.tee $15
                     (i32.load offset=504
                      (local.get $0)
                     )
                    )
                    (i32.const -2147483648)
                   )
                  )
                 )
                 (br_if $label$37
                  (i32.eqz
                   (local.get $15)
                  )
                 )
                 (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                  (i32.load offset=508
                   (local.get $0)
                  )
                  (i32.shl
                   (local.get $15)
                   (i32.const 2)
                  )
                  (i32.const 4)
                 )
                )
                (br_if $label$36
                 (i32.eq
                  (local.tee $15
                   (i32.load offset=520
                    (local.get $0)
                   )
                  )
                  (i32.const -2147483648)
                 )
                )
                (br_if $label$36
                 (i32.eqz
                  (local.get $15)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=524
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $15)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (local.set $16
                (i32.const -2147483648)
               )
               (block $label$39
                (block $label$40
                 (br_if $label$40
                  (i32.ne
                   (local.get $7)
                   (i32.const -2147483648)
                  )
                 )
                 (local.set $15
                  (local.get $3)
                 )
                 (local.set $3
                  (local.get $1)
                 )
                 (br $label$39)
                )
                (block $label$41
                 (block $label$42
                  (br_table $label$39 $label$42 $label$41
                   (local.get $3)
                  )
                 )
                 (local.set $15
                  (i32.load
                   (local.get $1)
                  )
                 )
                 (local.set $3
                  (i32.const 1)
                 )
                 (br $label$39)
                )
                (block $label$43
                 (br_if $label$43
                  (i32.eqz
                   (local.get $12)
                  )
                 )
                 (local.set $15
                  (i32.const 0)
                 )
                 (br $label$13)
                )
                (block $label$44
                 (block $label$45
                  (br_if $label$45
                   (local.get $11)
                  )
                  (local.set $25
                   (i32.const 4)
                  )
                  (local.set $16
                   (i32.const 0)
                  )
                  (br $label$44)
                 )
                 (drop
                  (i32.load8_u offset=1053525
                   (i32.const 0)
                  )
                 )
                 (local.set $15
                  (i32.const 4)
                 )
                 (block $label$46
                  (br_if $label$46
                   (local.tee $25
                    (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                     (local.get $11)
                     (i32.const 4)
                    )
                   )
                  )
                  (local.set $25
                   (local.get $11)
                  )
                  (br $label$13)
                 )
                 (local.set $16
                  (local.get $3)
                 )
                )
                (block $label$47
                 (br_if $label$47
                  (i32.eqz
                   (local.get $11)
                  )
                 )
                 (memory.copy
                  (local.get $25)
                  (local.get $1)
                  (local.get $11)
                 )
                )
                (local.set $15
                 (local.get $3)
                )
                (local.set $3
                 (local.get $25)
                )
               )
               (i32.store8 offset=596
                (local.get $0)
                (i32.sub
                 (i32.const 2)
                 (local.get $14)
                )
               )
               (i32.store offset=592
                (local.get $0)
                (local.get $15)
               )
               (i32.store offset=588
                (local.get $0)
                (local.get $3)
               )
               (i32.store offset=584
                (local.get $0)
                (local.get $16)
               )
               (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
                (local.get $9)
               )
               (br_if $label$17
                (i32.eq
                 (i32.load offset=544
                  (local.get $0)
                 )
                 (i32.const -2147483646)
                )
               )
               (i32.store
                (local.get $13)
                (i32.load
                 (local.get $18)
                )
               )
               (i64.store
                (local.get $19)
                (i64.load align=4
                 (local.get $20)
                )
               )
               (i64.store
                (local.get $21)
                (i64.load align=4
                 (local.get $22)
                )
               )
               (i64.store
                (local.get $4)
                (i64.load align=4
                 (local.get $5)
                )
               )
               (i64.store offset=504
                (local.get $0)
                (i64.load offset=544 align=4
                 (local.get $0)
                )
               )
               (i64.store offset=552
                (local.get $0)
                (i64.const 100000)
               )
               (i64.store offset=544
                (local.get $0)
                (i64.const 8192)
               )
               (call $_ZN13hyperinterval5float12F32Enclosure11from_dyadic17h0b1bbdce0a322157E
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
               )
               (br_if $label$16
                (i32.eq
                 (local.tee $3
                  (i32.load offset=584
                   (local.get $0)
                  )
                 )
                 (i32.const 2)
                )
               )
               (br_if $label$15
                (i32.eqz
                 (i32.and
                  (local.get $3)
                  (i32.const 1)
                 )
                )
               )
               (local.set $23
                (i64.load32_u offset=592
                 (local.get $0)
                )
               )
               (local.set $24
                (i64.load32_u offset=588
                 (local.get $0)
                )
               )
               (i64.store offset=616
                (local.get $0)
                (local.tee $26
                 (select
                  (i64.const 0)
                  (i64.or
                   (local.get $8)
                   (i64.const 2147483648)
                  )
                  (i64.eqz
                   (local.get $8)
                  )
                 )
                )
               )
               (i64.store offset=608
                (local.get $0)
                (local.tee $8
                 (select
                  (i64.const 0)
                  (i64.or
                   (local.get $10)
                   (i64.const 2147483648)
                  )
                  (i64.eqz
                   (local.get $10)
                  )
                 )
                )
               )
               (i64.store offset=592
                (local.get $0)
                (local.get $23)
               )
               (i64.store offset=584
                (local.get $0)
                (local.get $24)
               )
               (br_if $label$14
                (i64.ne
                 (local.get $8)
                 (local.get $24)
                )
               )
               (br_if $label$14
                (i64.ne
                 (local.get $26)
                 (local.get $23)
                )
               )
               (br_if $label$20
                (i32.eqz
                 (local.get $6)
                )
               )
               (block $label$48
                (block $label$49
                 (block $label$50
                  (br_table $label$49 $label$48 $label$50
                   (i32.add
                    (local.tee $3
                     (i32.load offset=504
                      (local.get $0)
                     )
                    )
                    (i32.const -2147483648)
                   )
                  )
                 )
                 (br_if $label$49
                  (i32.eqz
                   (local.get $3)
                  )
                 )
                 (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                  (i32.load offset=508
                   (local.get $0)
                  )
                  (i32.shl
                   (local.get $3)
                   (i32.const 2)
                  )
                  (i32.const 4)
                 )
                )
                (br_if $label$48
                 (i32.eq
                  (local.tee $3
                   (i32.load offset=520
                    (local.get $0)
                   )
                  )
                  (i32.const -2147483648)
                 )
                )
                (br_if $label$48
                 (i32.eqz
                  (local.get $3)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=524
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $3)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (block $label$51
                (br_if $label$51
                 (i32.eq
                  (i32.or
                   (local.get $7)
                   (i32.const -2147483648)
                  )
                  (i32.const -2147483648)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (local.get $1)
                 (i32.shl
                  (local.get $7)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (br_if $label$21
                (i32.eq
                 (local.tee $14
                  (i32.load offset=36
                   (local.get $0)
                  )
                 )
                 (local.tee $1
                  (i32.load offset=32
                   (local.get $0)
                  )
                 )
                )
               )
               (i32.store offset=32
                (local.get $0)
                (local.tee $15
                 (i32.add
                  (local.get $1)
                  (i32.const 1)
                 )
                )
               )
               (local.set $3
                (i32.add
                 (local.get $6)
                 (i32.const 2)
                )
               )
               (local.set $10
                (i64.load offset=32
                 (local.tee $1
                  (i32.add
                   (local.get $2)
                   (i32.mul
                    (local.get $1)
                    (i32.const 40)
                   )
                  )
                 )
                )
               )
               (local.set $9
                (i32.load offset=24
                 (local.get $1)
                )
               )
               (local.set $8
                (i64.load offset=16
                 (local.get $1)
                )
               )
               (br_if $label$24
                (i32.ne
                 (local.tee $7
                  (i32.load
                   (local.get $1)
                  )
                 )
                 (i32.const -2147483647)
                )
               )
              )
              (br_if $label$21
               (i32.eq
                (local.get $14)
                (local.get $15)
               )
              )
              (local.set $6
               (i32.add
                (local.get $3)
                (i32.const -2)
               )
              )
              (local.set $3
               (i32.sub
                (local.get $14)
                (local.get $15)
               )
              )
              (local.set $1
               (i32.add
                (local.get $2)
                (i32.mul
                 (local.get $15)
                 (i32.const 40)
                )
               )
              )
             )
             (loop $label$52
              (block $label$53
               (br_if $label$53
                (i32.eq
                 (i32.or
                  (local.tee $7
                   (i32.load
                    (local.get $1)
                   )
                  )
                  (i32.const -2147483648)
                 )
                 (i32.const -2147483648)
                )
               )
               (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                (i32.load
                 (i32.add
                  (local.get $1)
                  (i32.const 4)
                 )
                )
                (i32.shl
                 (local.get $7)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (local.set $1
               (i32.add
                (local.get $1)
                (i32.const 40)
               )
              )
              (br_if $label$52
               (local.tee $3
                (i32.add
                 (local.get $3)
                 (i32.const -1)
                )
               )
              )
             )
             (local.set $6
              (local.get $6)
             )
            )
            (i32.store offset=40
             (local.get $0)
             (i32.const 1)
            )
            (i64.store offset=32 align=4
             (local.get $0)
             (i64.const 6442450944)
            )
            (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
             (i32.add
              (local.get $0)
              (i32.const 504)
             )
             (i32.add
              (local.get $0)
              (i32.const 32)
             )
             (i32.const 0)
             (i32.const 25)
            )
            (block $label$54
             (block $label$55
              (br_if $label$55
               (i32.eq
                (i32.load offset=504
                 (local.get $0)
                )
                (i32.const -2147483648)
               )
              )
              (local.set $1
               (i32.eqz
                (i32.load offset=512
                 (local.get $0)
                )
               )
              )
              (br $label$54)
             )
             (local.set $1
              (i32.xor
               (i32.load offset=508
                (local.get $0)
               )
               (i32.const 1)
              )
             )
            )
            (i32.store
             (local.tee $20
              (i32.add
               (i32.add
                (local.get $0)
                (i32.const 544)
               )
               (i32.const 8)
              )
             )
             (i32.load
              (local.tee $21
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 8)
               )
              )
             )
            )
            (i64.store offset=544
             (local.get $0)
             (i64.load offset=504 align=4
              (local.get $0)
             )
            )
            (i32.store8 offset=556
             (local.get $0)
             (select
              (i32.const 1)
              (i32.const 2)
              (local.get $1)
             )
            )
            (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
             (i32.add
              (local.get $0)
              (i32.const 80)
             )
             (i32.add
              (local.get $0)
              (i32.const 544)
             )
            )
            (i32.store offset=96
             (local.get $0)
             (i32.const 103)
            )
            (i32.store offset=76
             (local.get $0)
             (i32.const 128)
            )
            (i32.store8 offset=72
             (local.get $0)
             (i32.const 2)
            )
            (i64.store offset=64 align=4
             (local.get $0)
             (i64.const 4294967297)
            )
            (i64.store offset=56 align=4
             (local.get $0)
             (i64.const -9223372034707292161)
            )
            (i32.store8 offset=52
             (local.get $0)
             (i32.const 2)
            )
            (i64.store offset=44 align=4
             (local.get $0)
             (i64.const 4294967297)
            )
            (i64.store offset=36 align=4
             (local.get $0)
             (i64.const -9223372036854775805)
            )
            (local.set $3
             (i32.sub
              (i32.const 0)
              (local.get $6)
             )
            )
            (local.set $9
             (i32.add
              (local.get $0)
              (i32.const 13)
             )
            )
            (local.set $19
             (i32.const -1)
            )
            (local.set $6
             (i32.const 0)
            )
            (loop $label$56
             (block $label$57
              (block $label$58
               (block $label$59
                (block $label$60
                 (block $label$61
                  (block $label$62
                   (br_if $label$62
                    (i32.eq
                     (local.tee $14
                      (i32.load
                       (i32.add
                        (local.tee $1
                         (i32.add
                          (i32.add
                           (local.get $0)
                           (i32.const 32)
                          )
                          (local.get $6)
                         )
                        )
                        (i32.const 8)
                       )
                      )
                     )
                     (i32.const -2147483647)
                    )
                   )
                   (local.set $15
                    (i32.load
                     (i32.add
                      (local.get $1)
                      (i32.const 24)
                     )
                    )
                   )
                   (local.set $16
                    (i32.load8_u
                     (i32.add
                      (local.get $1)
                      (i32.const 20)
                     )
                    )
                   )
                   (local.set $7
                    (i32.load
                     (i32.add
                      (local.get $1)
                      (i32.const 16)
                     )
                    )
                   )
                   (local.set $4
                    (i32.load
                     (i32.add
                      (local.get $1)
                      (i32.const 12)
                     )
                    )
                   )
                   (br_if $label$61
                    (i32.eq
                     (local.get $14)
                     (i32.const -2147483648)
                    )
                   )
                   (local.set $18
                    (i32.const -2147483648)
                   )
                   (local.set $13
                    (local.get $7)
                   )
                   (br_table $label$57 $label$60 $label$59
                    (local.get $7)
                   )
                  )
                  (i32.store offset=32
                   (local.get $0)
                   (i32.sub
                    (i32.const 0)
                    (local.get $19)
                   )
                  )
                  (local.set $9
                   (i32.sub
                    (i32.const 0)
                    (local.get $3)
                   )
                  )
                  (br_if $label$11
                   (i32.eq
                    (local.get $6)
                    (i32.const 40)
                   )
                  )
                  (local.set $3
                   (i32.add
                    (local.get $19)
                    (i32.const 3)
                   )
                  )
                  (local.set $1
                   (i32.add
                    (local.get $1)
                    (i32.const 32)
                   )
                  )
                  (loop $label$63
                   (block $label$64
                    (br_if $label$64
                     (i32.eq
                      (i32.or
                       (local.tee $7
                        (i32.load
                         (i32.add
                          (local.get $1)
                          (i32.const -4)
                         )
                        )
                       )
                       (i32.const -2147483648)
                      )
                      (i32.const -2147483648)
                     )
                    )
                    (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                     (i32.load
                      (local.get $1)
                     )
                     (i32.shl
                      (local.get $7)
                      (i32.const 2)
                     )
                     (i32.const 4)
                    )
                   )
                   (local.set $1
                    (i32.add
                     (local.get $1)
                     (i32.const 20)
                    )
                   )
                   (br_if $label$63
                    (local.tee $3
                     (i32.add
                      (local.get $3)
                      (i32.const -1)
                     )
                    )
                   )
                   (br $label$11)
                  )
                 )
                 (local.set $18
                  (i32.const -2147483648)
                 )
                 (local.set $13
                  (local.get $4)
                 )
                 (br $label$58)
                )
                (local.set $5
                 (i32.load
                  (local.get $4)
                 )
                )
                (local.set $13
                 (i32.const 1)
                )
                (br $label$57)
               )
               (local.set $13
                (i32.const 0)
               )
               (block $label$65
                (block $label$66
                 (block $label$67
                  (br_if $label$67
                   (i32.gt_u
                    (local.get $7)
                    (i32.const 1073741823)
                   )
                  )
                  (br_if $label$67
                   (i32.gt_u
                    (local.tee $5
                     (i32.shl
                      (local.get $7)
                      (i32.const 2)
                     )
                    )
                    (i32.const 2147483644)
                   )
                  )
                  (block $label$68
                   (br_if $label$68
                    (local.get $5)
                   )
                   (local.set $25
                    (i32.const 4)
                   )
                   (local.set $18
                    (i32.const 0)
                   )
                   (br $label$65)
                  )
                  (drop
                   (i32.load8_u offset=1053525
                    (i32.const 0)
                   )
                  )
                  (local.set $13
                   (i32.const 4)
                  )
                  (br_if $label$66
                   (local.tee $25
                    (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                     (local.get $5)
                     (i32.const 4)
                    )
                   )
                  )
                  (local.set $25
                   (local.get $5)
                  )
                 )
                 (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
                  (local.get $13)
                  (local.get $25)
                  (i32.const 1049004)
                 )
                 (unreachable)
                )
                (local.set $18
                 (local.get $7)
                )
               )
               (block $label$69
                (br_if $label$69
                 (i32.eqz
                  (local.get $5)
                 )
                )
                (memory.copy
                 (local.get $25)
                 (local.get $4)
                 (local.get $5)
                )
               )
               (local.set $13
                (local.get $25)
               )
              )
              (local.set $5
               (local.get $7)
              )
             )
             (i32.store16 align=1
              (local.get $9)
              (i32.load16_u offset=16 align=1
               (local.get $0)
              )
             )
             (i32.store8
              (local.tee $22
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 484)
                )
                (i32.const 2)
               )
              )
              (i32.load8_u
               (i32.add
                (local.tee $1
                 (i32.add
                  (local.get $1)
                  (i32.const 21)
                 )
                )
                (i32.const 2)
               )
              )
             )
             (i32.store8
              (local.tee $11
               (i32.add
                (local.get $9)
                (i32.const 2)
               )
              )
              (i32.load8_u
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 16)
                )
                (i32.const 2)
               )
              )
             )
             (i32.store offset=8
              (local.get $0)
              (local.get $5)
             )
             (i32.store offset=4
              (local.get $0)
              (local.get $13)
             )
             (i32.store
              (local.get $0)
              (local.get $18)
             )
             (i32.store16 offset=484
              (local.get $0)
              (i32.load16_u align=1
               (local.get $1)
              )
             )
             (i32.store8 offset=12
              (local.get $0)
              (local.get $16)
             )
             (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
              (i32.add
               (local.get $0)
               (i32.const 544)
              )
              (local.get $0)
              (local.get $15)
             )
             (br_if $label$19
              (i32.eq
               (i32.load offset=544
                (local.get $0)
               )
               (i32.const -2147483646)
              )
             )
             (i32.store
              (local.tee $1
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 32)
               )
              )
              (i32.load
               (local.tee $5
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 544)
                 )
                 (i32.const 32)
                )
               )
              )
             )
             (i64.store
              (local.tee $13
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 24)
               )
              )
              (i64.load align=4
               (local.tee $18
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 544)
                 )
                 (i32.const 24)
                )
               )
              )
             )
             (i64.store
              (local.tee $12
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 16)
               )
              )
              (i64.load align=4
               (local.tee $2
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 544)
                 )
                 (i32.const 16)
                )
               )
              )
             )
             (i64.store
              (local.get $21)
              (i64.load align=4
               (local.get $20)
              )
             )
             (i64.store offset=504
              (local.get $0)
              (i64.load offset=544 align=4
               (local.get $0)
              )
             )
             (i64.store offset=592
              (local.get $0)
              (i64.const 100000)
             )
             (i64.store offset=584
              (local.get $0)
              (i64.const 8192)
             )
             (call $_ZN13hyperinterval5float12F32Enclosure11from_dyadic17h0b1bbdce0a322157E
              (i32.add
               (local.get $0)
               (i32.const 608)
              )
              (i32.add
               (local.get $0)
               (i32.const 504)
              )
              (i32.add
               (local.get $0)
               (i32.const 584)
              )
             )
             (br_if $label$18
              (i32.ne
               (i32.load offset=608
                (local.get $0)
               )
               (i32.const 2)
              )
             )
             (br_if $label$18
              (i32.ne
               (i32.and
                (i32.load8_u offset=612
                 (local.get $0)
                )
                (i32.const 255)
               )
               (i32.const 5)
              )
             )
             (block $label$70
              (br_if $label$70
               (i32.eq
                (local.get $3)
                (i32.const 1)
               )
              )
              (local.set $16
               (i32.sub
                (i32.const 2)
                (local.get $16)
               )
              )
              (block $label$71
               (block $label$72
                (block $label$73
                 (br_table $label$72 $label$71 $label$73
                  (i32.add
                   (local.tee $17
                    (i32.load offset=504
                     (local.get $0)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                )
                (br_if $label$72
                 (i32.eqz
                  (local.get $17)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=508
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $17)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (br_if $label$71
                (i32.eq
                 (local.tee $17
                  (i32.load offset=520
                   (local.get $0)
                  )
                 )
                 (i32.const -2147483648)
                )
               )
               (br_if $label$71
                (i32.eqz
                 (local.get $17)
                )
               )
               (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                (i32.load offset=524
                 (local.get $0)
                )
                (i32.shl
                 (local.get $17)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (i32.store16 align=1
               (local.get $9)
               (i32.load16_u offset=484
                (local.get $0)
               )
              )
              (i32.store8
               (local.get $11)
               (i32.load8_u
                (local.get $22)
               )
              )
              (i32.store8 offset=12
               (local.get $0)
               (local.get $16)
              )
              (i32.store offset=8
               (local.get $0)
               (local.get $7)
              )
              (i32.store offset=4
               (local.get $0)
               (local.get $4)
              )
              (i32.store
               (local.get $0)
               (local.get $14)
              )
              (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
               (i32.add
                (local.get $0)
                (i32.const 544)
               )
               (local.get $0)
               (local.get $15)
              )
              (br_if $label$19
               (i32.eq
                (i32.load offset=544
                 (local.get $0)
                )
                (i32.const -2147483646)
               )
              )
              (i32.store
               (local.get $1)
               (i32.load
                (local.get $5)
               )
              )
              (i64.store
               (local.get $13)
               (i64.load align=4
                (local.get $18)
               )
              )
              (i64.store
               (local.get $12)
               (i64.load align=4
                (local.get $2)
               )
              )
              (i64.store
               (local.get $21)
               (i64.load align=4
                (local.get $20)
               )
              )
              (i64.store offset=504
               (local.get $0)
               (i64.load offset=544 align=4
                (local.get $0)
               )
              )
              (i64.store offset=592
               (local.get $0)
               (i64.const 100000)
              )
              (i64.store offset=584
               (local.get $0)
               (i64.const 8192)
              )
              (call $_ZN13hyperinterval5float12F32Enclosure11from_dyadic17h0b1bbdce0a322157E
               (i32.add
                (local.get $0)
                (i32.const 608)
               )
               (i32.add
                (local.get $0)
                (i32.const 504)
               )
               (i32.add
                (local.get $0)
                (i32.const 584)
               )
              )
              (br_if $label$18
               (i32.ne
                (i32.load offset=608
                 (local.get $0)
                )
                (i32.const 2)
               )
              )
              (br_if $label$18
               (i32.ne
                (i32.and
                 (i32.load8_u offset=612
                  (local.get $0)
                 )
                 (i32.const 255)
                )
                (i32.const 5)
               )
              )
              (br_if $label$70
               (i32.eq
                (local.get $3)
                (i32.const 2)
               )
              )
              (block $label$74
               (block $label$75
                (block $label$76
                 (br_table $label$75 $label$74 $label$76
                  (i32.add
                   (local.tee $1
                    (i32.load offset=504
                     (local.get $0)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                )
                (br_if $label$75
                 (i32.eqz
                  (local.get $1)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=508
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $1)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (br_if $label$74
                (i32.eq
                 (local.tee $1
                  (i32.load offset=520
                   (local.get $0)
                  )
                 )
                 (i32.const -2147483648)
                )
               )
               (br_if $label$74
                (i32.eqz
                 (local.get $1)
                )
               )
               (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                (i32.load offset=524
                 (local.get $0)
                )
                (i32.shl
                 (local.get $1)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (local.set $3
               (i32.add
                (local.get $3)
                (i32.const -2)
               )
              )
              (local.set $19
               (i32.add
                (local.get $19)
                (i32.const -1)
               )
              )
              (br_if $label$12
               (i32.eq
                (local.tee $6
                 (i32.add
                  (local.get $6)
                  (i32.const 20)
                 )
                )
                (i32.const 60)
               )
              )
              (br $label$56)
             )
            )
            (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
             (i32.const 1049188)
            )
            (unreachable)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
            (i32.const 1049188)
           )
           (unreachable)
          )
          (i32.store8 offset=584
           (local.get $0)
           (i32.load8_u offset=548
            (local.get $0)
           )
          )
          (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
           (i32.const 1049132)
           (i32.const 43)
           (i32.add
            (local.get $0)
            (i32.const 584)
           )
           (i32.const 1049116)
           (i32.const 1049188)
          )
          (unreachable)
         )
         (i32.store offset=544
          (local.get $0)
          (i32.const 0)
         )
         (call $_ZN4core9panicking13assert_failed17h2e1146eccc43ab29E
          (i32.const 0)
          (i32.add
           (local.get $0)
           (i32.const 608)
          )
          (i32.const 1049176)
          (i32.add
           (local.get $0)
           (i32.const 544)
          )
          (i32.const 1049188)
         )
         (unreachable)
        )
        (i32.store8 offset=584
         (local.get $0)
         (i32.load8_u offset=548
          (local.get $0)
         )
        )
        (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
         (i32.const 1049132)
         (i32.const 43)
         (i32.add
          (local.get $0)
          (i32.const 584)
         )
         (i32.const 1049116)
         (i32.const 1049188)
        )
        (unreachable)
       )
       (i32.store8 offset=608
        (local.get $0)
        (i32.load8_u offset=588
         (local.get $0)
        )
       )
       (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
        (i32.const 1049132)
        (i32.const 43)
        (i32.add
         (local.get $0)
         (i32.const 608)
        )
        (i32.const 1049116)
        (i32.const 1049188)
       )
       (unreachable)
      )
      (call $_ZN4core6option13unwrap_failed17h0450242c3e36021bE
       (i32.const 1049188)
      )
      (unreachable)
     )
     (i32.store offset=544
      (local.get $0)
      (i32.const 0)
     )
     (call $_ZN4core9panicking13assert_failed17h3cd488936ed7650bE
      (i32.const 0)
      (i32.add
       (local.get $0)
       (i32.const 584)
      )
      (i32.add
       (local.get $0)
       (i32.const 608)
      )
      (i32.add
       (local.get $0)
       (i32.const 544)
      )
      (i32.const 1049188)
     )
     (unreachable)
    )
    (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
     (local.get $15)
     (local.get $25)
     (i32.const 1049004)
    )
    (unreachable)
   )
   (local.set $9
    (i32.sub
     (i32.const 0)
     (local.get $3)
    )
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 1)
   (i32.const 21)
  )
  (block $label$77
   (block $label$78
    (br_if $label$78
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$77)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
   (i32.add
    (local.get $0)
    (i32.const 608)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 1)
   (i32.const 21)
  )
  (block $label$79
   (block $label$80
    (br_if $label$80
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$79)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
   (i32.add
    (local.get $0)
    (i32.const 584)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$81
   (block $label$82
    (br_if $label$82
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$81)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint8addition89_$LT$impl$u20$core..ops..arith..Add$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3add17he2e1024fec47bcebE
   (i32.add
    (local.get $0)
    (i32.const 504)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$83
   (block $label$84
    (br_if $label$84
     (i32.eq
      (i32.load offset=544
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=552
       (local.get $0)
      )
     )
    )
    (br $label$83)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=548
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 544)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=544 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
   (i32.add
    (local.get $0)
    (i32.const 544)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i32.store offset=40
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=32 align=4
   (local.get $0)
   (i64.const 6442450944)
  )
  (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
   (i32.add
    (local.get $0)
    (i32.const 16)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$85
   (block $label$86
    (br_if $label$86
     (i32.eq
      (i32.load offset=16
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=24
       (local.get $0)
      )
     )
    )
    (br $label$85)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=20
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store
   (local.tee $2
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 32)
     )
     (i32.const 8)
    )
   )
   (i32.load
    (local.tee $3
     (i32.add
      (i32.add
       (local.get $0)
       (i32.const 16)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=16 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=44
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_ZN10num_bigint6bigint8addition89_$LT$impl$u20$core..ops..arith..Add$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3add17he2e1024fec47bcebE
   (i32.add
    (local.get $0)
    (i32.const 16)
   )
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 288)
   )
   (i64.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 608)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 328)
   )
   (i64.load
    (i32.add
     (i32.add
      (local.get $0)
      (i32.const 584)
     )
     (i32.const 8)
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 368)
   )
   (i64.load
    (local.tee $4
     (i32.add
      (i32.add
       (local.get $0)
       (i32.const 504)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 408)
   )
   (i64.load
    (local.tee $5
     (i32.add
      (i32.add
       (local.get $0)
       (i32.const 544)
      )
      (i32.const 8)
     )
    )
   )
  )
  (i64.store offset=280
   (local.get $0)
   (i64.load offset=608
    (local.get $0)
   )
  )
  (i64.store offset=320
   (local.get $0)
   (i64.load offset=584
    (local.get $0)
   )
  )
  (i64.store offset=360
   (local.get $0)
   (i64.load offset=504
    (local.get $0)
   )
  )
  (i64.store offset=400
   (local.get $0)
   (i64.load offset=544
    (local.get $0)
   )
  )
  (i32.store offset=36
   (local.get $0)
   (i32.const 11)
  )
  (i64.store
   (i32.add
    (i32.add
     (local.get $0)
     (i32.const 32)
    )
    (i32.const 16)
   )
   (i64.load offset=1048584
    (i32.const 0)
   )
  )
  (i64.store offset=40
   (local.get $0)
   (i64.load offset=1048576
    (i32.const 0)
   )
  )
  (i64.store offset=432
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i32.store offset=424
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=416
   (local.get $0)
   (i64.const 4607182418800017407)
  )
  (i64.store offset=392
   (local.get $0)
   (i64.const 4607182418800017409)
  )
  (i32.store offset=384
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=376
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i64.store offset=352
   (local.get $0)
   (i64.const 9218868437227405311)
  )
  (i32.store offset=344
   (local.get $0)
   (i32.const 971)
  )
  (i64.store offset=336
   (local.get $0)
   (i64.const 9218868437227405311)
  )
  (i64.store offset=312
   (local.get $0)
   (i64.const 4503599627370496)
  )
  (i32.store offset=304
   (local.get $0)
   (i32.const -1075)
  )
  (i64.store offset=296
   (local.get $0)
   (i64.const 4503599627370495)
  )
  (i64.store offset=272
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=264
   (local.get $0)
   (i32.const -2147483648)
  )
  (i64.store offset=256
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=252
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=248
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=240
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=232
   (local.get $0)
   (i64.const 2)
  )
  (i32.store offset=224
   (local.get $0)
   (i32.const -1075)
  )
  (i64.store offset=216
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=212
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=208
   (local.get $0)
   (i32.const 3)
  )
  (i64.store offset=200
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=192
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=184
   (local.get $0)
   (i32.const -1075)
  )
  (i64.store offset=176
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=172
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=168
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=160
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=152
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=144
   (local.get $0)
   (i32.const -1074)
  )
  (i64.store offset=136
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=132
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=128
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=120
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=112
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i32.store offset=104
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=96
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i32.store8 offset=92
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=88
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=80
   (local.get $0)
   (i64.const 6442450944)
  )
  (i64.store offset=72
   (local.get $0)
   (i64.const 0)
  )
  (i32.store offset=64
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=56
   (local.get $0)
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (local.get $0)
    (i32.const 448)
   )
   (i64.load
    (local.get $3)
   )
  )
  (i64.store offset=456
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=464
   (local.get $0)
   (i32.const -5170)
  )
  (i64.store offset=472
   (local.get $0)
   (i64.const 2)
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=440
   (local.get $0)
   (i64.load offset=16
    (local.get $0)
   )
  )
  (block $label$87
   (block $label$88
    (block $label$89
     (block $label$90
      (block $label$91
       (block $label$92
        (block $label$93
         (block $label$94
          (block $label$95
           (block $label$96
            (block $label$97
             (block $label$98
              (block $label$99
               (br_if $label$99
                (i32.ne
                 (local.tee $7
                  (i32.load offset=40
                   (local.get $0)
                  )
                 )
                 (i32.const -2147483647)
                )
               )
               (local.set $1
                (i32.add
                 (local.get $0)
                 (i32.const 80)
                )
               )
               (local.set $3
                (i32.const 10)
               )
               (br $label$98)
              )
              (local.set $3
               (i32.add
                (local.get $9)
                (i32.const 2)
               )
              )
              (local.set $8
               (i64.load offset=56
                (local.get $0)
               )
              )
              (local.set $6
               (i32.load offset=64
                (local.get $0)
               )
              )
              (local.set $10
               (i64.load offset=72
                (local.get $0)
               )
              )
              (local.set $1
               (local.get $2)
              )
              (loop $label$100
               (local.set $9
                (local.get $3)
               )
               (local.set $12
                (i32.or
                 (i32.gt_u
                  (local.tee $3
                   (i32.load offset=8
                    (local.get $1)
                   )
                  )
                  (i32.const 1073741823)
                 )
                 (i32.gt_u
                  (local.tee $11
                   (i32.shl
                    (local.get $3)
                    (i32.const 2)
                   )
                  )
                  (i32.const 2147483644)
                 )
                )
               )
               (local.set $13
                (i32.const -2147483648)
               )
               (local.set $14
                (i32.load8_u offset=12
                 (local.get $1)
                )
               )
               (local.set $1
                (i32.load offset=4
                 (local.get $1)
                )
               )
               (block $label$101
                (block $label$102
                 (block $label$103
                  (br_if $label$103
                   (i32.ne
                    (local.get $7)
                    (i32.const -2147483648)
                   )
                  )
                  (local.set $15
                   (local.get $1)
                  )
                  (br $label$102)
                 )
                 (local.set $15
                  (local.get $3)
                 )
                 (block $label$104
                  (block $label$105
                   (br_table $label$101 $label$105 $label$104
                    (local.get $3)
                   )
                  )
                  (local.set $16
                   (i32.load
                    (local.get $1)
                   )
                  )
                  (local.set $15
                   (i32.const 1)
                  )
                  (br $label$101)
                 )
                 (block $label$106
                  (block $label$107
                   (block $label$108
                    (block $label$109
                     (br_if $label$109
                      (i32.eqz
                       (local.get $12)
                      )
                     )
                     (local.set $15
                      (i32.const 0)
                     )
                     (br $label$108)
                    )
                    (block $label$110
                     (br_if $label$110
                      (local.get $11)
                     )
                     (local.set $17
                      (i32.const 4)
                     )
                     (local.set $13
                      (i32.const 0)
                     )
                     (br $label$106)
                    )
                    (drop
                     (i32.load8_u offset=1053525
                      (i32.const 0)
                     )
                    )
                    (local.set $15
                     (i32.const 4)
                    )
                    (br_if $label$107
                     (local.tee $17
                      (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                       (local.get $11)
                       (i32.const 4)
                      )
                     )
                    )
                    (local.set $17
                     (local.get $11)
                    )
                   )
                   (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
                    (local.get $15)
                    (local.get $17)
                    (i32.const 1049004)
                   )
                   (unreachable)
                  )
                  (local.set $13
                   (local.get $3)
                  )
                 )
                 (block $label$111
                  (br_if $label$111
                   (i32.eqz
                    (local.get $11)
                   )
                  )
                  (memory.copy
                   (local.get $17)
                   (local.get $1)
                   (local.get $11)
                  )
                 )
                 (local.set $15
                  (local.get $17)
                 )
                )
                (local.set $16
                 (local.get $3)
                )
               )
               (i32.store8 offset=596
                (local.get $0)
                (local.get $14)
               )
               (i32.store offset=592
                (local.get $0)
                (local.get $16)
               )
               (i32.store offset=588
                (local.get $0)
                (local.get $15)
               )
               (i32.store offset=584
                (local.get $0)
                (local.get $13)
               )
               (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
                (local.get $6)
               )
               (br_if $label$93
                (i32.eq
                 (i32.load offset=544
                  (local.get $0)
                 )
                 (i32.const -2147483646)
                )
               )
               (i32.store
                (local.tee $13
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 504)
                  )
                  (i32.const 32)
                 )
                )
                (i32.load
                 (local.tee $18
                  (i32.add
                   (i32.add
                    (local.get $0)
                    (i32.const 544)
                   )
                   (i32.const 32)
                  )
                 )
                )
               )
               (i64.store
                (local.tee $19
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 504)
                  )
                  (i32.const 24)
                 )
                )
                (i64.load align=4
                 (local.tee $20
                  (i32.add
                   (i32.add
                    (local.get $0)
                    (i32.const 544)
                   )
                   (i32.const 24)
                  )
                 )
                )
               )
               (i64.store
                (local.tee $21
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 504)
                  )
                  (i32.const 16)
                 )
                )
                (i64.load align=4
                 (local.tee $22
                  (i32.add
                   (i32.add
                    (local.get $0)
                    (i32.const 544)
                   )
                   (i32.const 16)
                  )
                 )
                )
               )
               (i64.store
                (local.get $4)
                (i64.load align=4
                 (local.get $5)
                )
               )
               (i64.store offset=504
                (local.get $0)
                (i64.load offset=544 align=4
                 (local.get $0)
                )
               )
               (i64.store offset=592
                (local.get $0)
                (i64.const 100000)
               )
               (i64.store offset=584
                (local.get $0)
                (i64.const 8192)
               )
               (call $_ZN13hyperinterval5float12F64Enclosure11from_dyadic17hea0163c860c15cc1E
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
               )
               (br_if $label$92
                (i64.eq
                 (local.tee $24
                  (i64.load offset=544
                   (local.get $0)
                  )
                 )
                 (i64.const 2)
                )
               )
               (br_if $label$91
                (i32.eqz
                 (i32.and
                  (i32.wrap_i64
                   (local.get $24)
                  )
                  (i32.const 1)
                 )
                )
               )
               (local.set $23
                (i64.load offset=560
                 (local.get $0)
                )
               )
               (local.set $24
                (i64.load offset=552
                 (local.get $0)
                )
               )
               (i64.store offset=616
                (local.get $0)
                (local.get $10)
               )
               (i64.store offset=608
                (local.get $0)
                (local.get $8)
               )
               (i64.store offset=592
                (local.get $0)
                (local.get $23)
               )
               (i64.store offset=584
                (local.get $0)
                (local.get $24)
               )
               (br_if $label$90
                (i64.ne
                 (local.get $24)
                 (local.get $8)
                )
               )
               (br_if $label$90
                (i64.ne
                 (local.get $23)
                 (local.get $10)
                )
               )
               (br_if $label$96
                (i32.eq
                 (local.get $9)
                 (i32.const 1)
                )
               )
               (block $label$112
                (block $label$113
                 (block $label$114
                  (br_table $label$113 $label$112 $label$114
                   (i32.add
                    (local.tee $15
                     (i32.load offset=504
                      (local.get $0)
                     )
                    )
                    (i32.const -2147483648)
                   )
                  )
                 )
                 (br_if $label$113
                  (i32.eqz
                   (local.get $15)
                  )
                 )
                 (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                  (i32.load offset=508
                   (local.get $0)
                  )
                  (i32.shl
                   (local.get $15)
                   (i32.const 2)
                  )
                  (i32.const 4)
                 )
                )
                (br_if $label$112
                 (i32.eq
                  (local.tee $15
                   (i32.load offset=520
                    (local.get $0)
                   )
                  )
                  (i32.const -2147483648)
                 )
                )
                (br_if $label$112
                 (i32.eqz
                  (local.get $15)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=524
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $15)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (local.set $16
                (i32.const -2147483648)
               )
               (block $label$115
                (block $label$116
                 (br_if $label$116
                  (i32.ne
                   (local.get $7)
                   (i32.const -2147483648)
                  )
                 )
                 (local.set $15
                  (local.get $3)
                 )
                 (local.set $3
                  (local.get $1)
                 )
                 (br $label$115)
                )
                (block $label$117
                 (block $label$118
                  (br_table $label$115 $label$118 $label$117
                   (local.get $3)
                  )
                 )
                 (local.set $15
                  (i32.load
                   (local.get $1)
                  )
                 )
                 (local.set $3
                  (i32.const 1)
                 )
                 (br $label$115)
                )
                (block $label$119
                 (br_if $label$119
                  (i32.eqz
                   (local.get $12)
                  )
                 )
                 (local.set $15
                  (i32.const 0)
                 )
                 (br $label$89)
                )
                (block $label$120
                 (block $label$121
                  (br_if $label$121
                   (local.get $11)
                  )
                  (local.set $25
                   (i32.const 4)
                  )
                  (local.set $16
                   (i32.const 0)
                  )
                  (br $label$120)
                 )
                 (drop
                  (i32.load8_u offset=1053525
                   (i32.const 0)
                  )
                 )
                 (local.set $15
                  (i32.const 4)
                 )
                 (block $label$122
                  (br_if $label$122
                   (local.tee $25
                    (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                     (local.get $11)
                     (i32.const 4)
                    )
                   )
                  )
                  (local.set $25
                   (local.get $11)
                  )
                  (br $label$89)
                 )
                 (local.set $16
                  (local.get $3)
                 )
                )
                (block $label$123
                 (br_if $label$123
                  (i32.eqz
                   (local.get $11)
                  )
                 )
                 (memory.copy
                  (local.get $25)
                  (local.get $1)
                  (local.get $11)
                 )
                )
                (local.set $15
                 (local.get $3)
                )
                (local.set $3
                 (local.get $25)
                )
               )
               (i32.store8 offset=596
                (local.get $0)
                (i32.sub
                 (i32.const 2)
                 (local.get $14)
                )
               )
               (i32.store offset=592
                (local.get $0)
                (local.get $15)
               )
               (i32.store offset=588
                (local.get $0)
                (local.get $3)
               )
               (i32.store offset=584
                (local.get $0)
                (local.get $16)
               )
               (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
                (local.get $6)
               )
               (br_if $label$93
                (i32.eq
                 (i32.load offset=544
                  (local.get $0)
                 )
                 (i32.const -2147483646)
                )
               )
               (i32.store
                (local.get $13)
                (i32.load
                 (local.get $18)
                )
               )
               (i64.store
                (local.get $19)
                (i64.load align=4
                 (local.get $20)
                )
               )
               (i64.store
                (local.get $21)
                (i64.load align=4
                 (local.get $22)
                )
               )
               (i64.store
                (local.get $4)
                (i64.load align=4
                 (local.get $5)
                )
               )
               (i64.store offset=504
                (local.get $0)
                (i64.load offset=544 align=4
                 (local.get $0)
                )
               )
               (i64.store offset=592
                (local.get $0)
                (i64.const 100000)
               )
               (i64.store offset=584
                (local.get $0)
                (i64.const 8192)
               )
               (call $_ZN13hyperinterval5float12F64Enclosure11from_dyadic17hea0163c860c15cc1E
                (i32.add
                 (local.get $0)
                 (i32.const 544)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.add
                 (local.get $0)
                 (i32.const 584)
                )
               )
               (br_if $label$92
                (i64.eq
                 (local.tee $24
                  (i64.load offset=544
                   (local.get $0)
                  )
                 )
                 (i64.const 2)
                )
               )
               (br_if $label$91
                (i32.eqz
                 (i32.and
                  (i32.wrap_i64
                   (local.get $24)
                  )
                  (i32.const 1)
                 )
                )
               )
               (local.set $23
                (i64.load offset=560
                 (local.get $0)
                )
               )
               (local.set $24
                (i64.load offset=552
                 (local.get $0)
                )
               )
               (i64.store offset=616
                (local.get $0)
                (local.tee $26
                 (select
                  (i64.const 0)
                  (i64.or
                   (local.get $8)
                   (i64.const -9223372036854775808)
                  )
                  (i64.eqz
                   (local.get $8)
                  )
                 )
                )
               )
               (i64.store offset=608
                (local.get $0)
                (local.tee $8
                 (select
                  (i64.const 0)
                  (i64.or
                   (local.get $10)
                   (i64.const -9223372036854775808)
                  )
                  (i64.eqz
                   (local.get $10)
                  )
                 )
                )
               )
               (i64.store offset=592
                (local.get $0)
                (local.get $23)
               )
               (i64.store offset=584
                (local.get $0)
                (local.get $24)
               )
               (br_if $label$90
                (i64.ne
                 (local.get $24)
                 (local.get $8)
                )
               )
               (br_if $label$90
                (i64.ne
                 (local.get $23)
                 (local.get $26)
                )
               )
               (br_if $label$96
                (i32.eqz
                 (local.get $9)
                )
               )
               (block $label$124
                (block $label$125
                 (block $label$126
                  (br_table $label$125 $label$124 $label$126
                   (i32.add
                    (local.tee $3
                     (i32.load offset=504
                      (local.get $0)
                     )
                    )
                    (i32.const -2147483648)
                   )
                  )
                 )
                 (br_if $label$125
                  (i32.eqz
                   (local.get $3)
                  )
                 )
                 (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                  (i32.load offset=508
                   (local.get $0)
                  )
                  (i32.shl
                   (local.get $3)
                   (i32.const 2)
                  )
                  (i32.const 4)
                 )
                )
                (br_if $label$124
                 (i32.eq
                  (local.tee $3
                   (i32.load offset=520
                    (local.get $0)
                   )
                  )
                  (i32.const -2147483648)
                 )
                )
                (br_if $label$124
                 (i32.eqz
                  (local.get $3)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=524
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $3)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (block $label$127
                (br_if $label$127
                 (i32.eq
                  (i32.or
                   (local.get $7)
                   (i32.const -2147483648)
                  )
                  (i32.const -2147483648)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (local.get $1)
                 (i32.shl
                  (local.get $7)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (br_if $label$97
                (i32.eq
                 (local.tee $14
                  (i32.load offset=36
                   (local.get $0)
                  )
                 )
                 (local.tee $1
                  (i32.load offset=32
                   (local.get $0)
                  )
                 )
                )
               )
               (i32.store offset=32
                (local.get $0)
                (local.tee $15
                 (i32.add
                  (local.get $1)
                  (i32.const 1)
                 )
                )
               )
               (local.set $3
                (i32.add
                 (local.get $9)
                 (i32.const 2)
                )
               )
               (local.set $10
                (i64.load offset=32
                 (local.tee $1
                  (i32.add
                   (local.get $2)
                   (i32.mul
                    (local.get $1)
                    (i32.const 40)
                   )
                  )
                 )
                )
               )
               (local.set $6
                (i32.load offset=24
                 (local.get $1)
                )
               )
               (local.set $8
                (i64.load offset=16
                 (local.get $1)
                )
               )
               (br_if $label$100
                (i32.ne
                 (local.tee $7
                  (i32.load
                   (local.get $1)
                  )
                 )
                 (i32.const -2147483647)
                )
               )
              )
              (br_if $label$97
               (i32.eq
                (local.get $14)
                (local.get $15)
               )
              )
              (local.set $9
               (i32.add
                (local.get $3)
                (i32.const -2)
               )
              )
              (local.set $3
               (i32.sub
                (local.get $14)
                (local.get $15)
               )
              )
              (local.set $1
               (i32.add
                (local.get $2)
                (i32.mul
                 (local.get $15)
                 (i32.const 40)
                )
               )
              )
             )
             (loop $label$128
              (block $label$129
               (br_if $label$129
                (i32.eq
                 (i32.or
                  (local.tee $7
                   (i32.load
                    (local.get $1)
                   )
                  )
                  (i32.const -2147483648)
                 )
                 (i32.const -2147483648)
                )
               )
               (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                (i32.load
                 (i32.add
                  (local.get $1)
                  (i32.const 4)
                 )
                )
                (i32.shl
                 (local.get $7)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (local.set $1
               (i32.add
                (local.get $1)
                (i32.const 40)
               )
              )
              (br_if $label$128
               (local.tee $3
                (i32.add
                 (local.get $3)
                 (i32.const -1)
                )
               )
              )
             )
            )
            (i32.store offset=40
             (local.get $0)
             (i32.const 1)
            )
            (i64.store offset=32 align=4
             (local.get $0)
             (i64.const 6442450944)
            )
            (call $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE
             (i32.add
              (local.get $0)
              (i32.const 504)
             )
             (i32.add
              (local.get $0)
              (i32.const 32)
             )
             (i32.const 1)
             (i32.const 22)
            )
            (block $label$130
             (block $label$131
              (br_if $label$131
               (i32.eq
                (i32.load offset=504
                 (local.get $0)
                )
                (i32.const -2147483648)
               )
              )
              (local.set $1
               (i32.eqz
                (i32.load offset=512
                 (local.get $0)
                )
               )
              )
              (br $label$130)
             )
             (local.set $1
              (i32.xor
               (i32.load offset=508
                (local.get $0)
               )
               (i32.const 1)
              )
             )
            )
            (i32.store
             (local.tee $19
              (i32.add
               (i32.add
                (local.get $0)
                (i32.const 544)
               )
               (i32.const 8)
              )
             )
             (i32.load
              (local.tee $20
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 8)
               )
              )
             )
            )
            (i64.store offset=544
             (local.get $0)
             (i64.load offset=504 align=4
              (local.get $0)
             )
            )
            (i32.store8 offset=556
             (local.get $0)
             (select
              (i32.const 1)
              (i32.const 2)
              (local.get $1)
             )
            )
            (call $_ZN10num_bigint6bigint11subtraction89_$LT$impl$u20$core..ops..arith..Sub$LT$u32$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$3sub17hc601b8e95108816eE
             (i32.add
              (local.get $0)
              (i32.const 80)
             )
             (i32.add
              (local.get $0)
              (i32.const 544)
             )
            )
            (i32.store offset=96
             (local.get $0)
             (i32.const 970)
            )
            (i32.store offset=76
             (local.get $0)
             (i32.const 1024)
            )
            (i32.store8 offset=72
             (local.get $0)
             (i32.const 2)
            )
            (i64.store offset=64 align=4
             (local.get $0)
             (i64.const 4294967297)
            )
            (i64.store offset=56 align=4
             (local.get $0)
             (i64.const -9223372034707292161)
            )
            (i32.store8 offset=52
             (local.get $0)
             (i32.const 2)
            )
            (i64.store offset=44 align=4
             (local.get $0)
             (i64.const 4294967297)
            )
            (i64.store offset=36 align=4
             (local.get $0)
             (i64.const -9223372036854775805)
            )
            (local.set $3
             (i32.sub
              (i32.const 0)
              (local.get $9)
             )
            )
            (local.set $9
             (i32.add
              (local.get $0)
              (i32.const 501)
             )
            )
            (local.set $18
             (i32.const -1)
            )
            (local.set $6
             (i32.const 0)
            )
            (loop $label$132
             (local.set $14
              (i32.load
               (i32.add
                (local.tee $1
                 (i32.add
                  (i32.add
                   (local.get $0)
                   (i32.const 32)
                  )
                  (local.get $6)
                 )
                )
                (i32.const 24)
               )
              )
             )
             (local.set $15
              (i32.load8_u
               (i32.add
                (local.get $1)
                (i32.const 20)
               )
              )
             )
             (local.set $7
              (i32.load
               (i32.add
                (local.get $1)
                (i32.const 16)
               )
              )
             )
             (local.set $16
              (i32.load
               (i32.add
                (local.get $1)
                (i32.const 12)
               )
              )
             )
             (block $label$133
              (block $label$134
               (block $label$135
                (block $label$136
                 (block $label$137
                  (block $label$138
                   (block $label$139
                    (br_table $label$137 $label$139 $label$138
                     (i32.add
                      (local.tee $21
                       (i32.load
                        (i32.add
                         (local.get $1)
                         (i32.const 8)
                        )
                       )
                      )
                      (i32.const -2147483648)
                     )
                    )
                   )
                   (i32.store offset=32
                    (local.get $0)
                    (i32.sub
                     (i32.const 0)
                     (local.get $18)
                    )
                   )
                   (local.set $9
                    (i32.sub
                     (i32.const 0)
                     (local.get $3)
                    )
                   )
                   (br_if $label$87
                    (i32.eq
                     (local.get $6)
                     (i32.const 40)
                    )
                   )
                   (local.set $3
                    (i32.add
                     (local.get $18)
                     (i32.const 3)
                    )
                   )
                   (local.set $1
                    (i32.add
                     (local.get $1)
                     (i32.const 32)
                    )
                   )
                   (loop $label$140
                    (block $label$141
                     (br_if $label$141
                      (i32.eq
                       (i32.or
                        (local.tee $7
                         (i32.load
                          (i32.add
                           (local.get $1)
                           (i32.const -4)
                          )
                         )
                        )
                        (i32.const -2147483648)
                       )
                       (i32.const -2147483648)
                      )
                     )
                     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                      (i32.load
                       (local.get $1)
                      )
                      (i32.shl
                       (local.get $7)
                       (i32.const 2)
                      )
                      (i32.const 4)
                     )
                    )
                    (local.set $1
                     (i32.add
                      (local.get $1)
                      (i32.const 20)
                     )
                    )
                    (br_if $label$140
                     (local.tee $3
                      (i32.add
                       (local.get $3)
                       (i32.const -1)
                      )
                     )
                    )
                    (br $label$87)
                   )
                  )
                  (local.set $13
                   (i32.const -2147483648)
                  )
                  (local.set $4
                   (local.get $7)
                  )
                  (br_table $label$133 $label$136 $label$135
                   (local.get $7)
                  )
                 )
                 (local.set $13
                  (i32.const -2147483648)
                 )
                 (local.set $4
                  (local.get $16)
                 )
                 (br $label$134)
                )
                (local.set $5
                 (i32.load
                  (local.get $16)
                 )
                )
                (local.set $4
                 (i32.const 1)
                )
                (br $label$133)
               )
               (local.set $5
                (i32.const 0)
               )
               (block $label$142
                (block $label$143
                 (block $label$144
                  (br_if $label$144
                   (i32.gt_u
                    (local.get $7)
                    (i32.const 1073741823)
                   )
                  )
                  (br_if $label$144
                   (i32.gt_u
                    (local.tee $4
                     (i32.shl
                      (local.get $7)
                      (i32.const 2)
                     )
                    )
                    (i32.const 2147483644)
                   )
                  )
                  (block $label$145
                   (br_if $label$145
                    (local.get $4)
                   )
                   (local.set $13
                    (i32.const 0)
                   )
                   (local.set $25
                    (i32.const 4)
                   )
                   (br $label$142)
                  )
                  (drop
                   (i32.load8_u offset=1053525
                    (i32.const 0)
                   )
                  )
                  (local.set $5
                   (i32.const 4)
                  )
                  (br_if $label$143
                   (local.tee $25
                    (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                     (local.get $4)
                     (i32.const 4)
                    )
                   )
                  )
                  (local.set $25
                   (local.get $4)
                  )
                 )
                 (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
                  (local.get $5)
                  (local.get $25)
                  (i32.const 1049004)
                 )
                 (unreachable)
                )
                (local.set $13
                 (local.get $7)
                )
               )
               (block $label$146
                (br_if $label$146
                 (i32.eqz
                  (local.get $4)
                 )
                )
                (memory.copy
                 (local.get $25)
                 (local.get $16)
                 (local.get $4)
                )
               )
               (local.set $4
                (local.get $25)
               )
              )
              (local.set $5
               (local.get $7)
              )
             )
             (i32.store16 align=1
              (local.get $9)
              (i32.load16_u offset=16 align=1
               (local.get $0)
              )
             )
             (i32.store8
              (local.tee $22
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 484)
                )
                (i32.const 2)
               )
              )
              (i32.load8_u
               (i32.add
                (local.tee $1
                 (i32.add
                  (local.get $1)
                  (i32.const 21)
                 )
                )
                (i32.const 2)
               )
              )
             )
             (i32.store8
              (local.tee $11
               (i32.add
                (local.get $9)
                (i32.const 2)
               )
              )
              (i32.load8_u
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 16)
                )
                (i32.const 2)
               )
              )
             )
             (i32.store offset=496
              (local.get $0)
              (local.get $5)
             )
             (i32.store offset=492
              (local.get $0)
              (local.get $4)
             )
             (i32.store offset=488
              (local.get $0)
              (local.get $13)
             )
             (i32.store16 offset=484
              (local.get $0)
              (i32.load16_u align=1
               (local.get $1)
              )
             )
             (i32.store8 offset=500
              (local.get $0)
              (local.get $15)
             )
             (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
              (i32.add
               (local.get $0)
               (i32.const 544)
              )
              (i32.add
               (local.get $0)
               (i32.const 488)
              )
              (local.get $14)
             )
             (br_if $label$95
              (i32.eq
               (i32.load offset=544
                (local.get $0)
               )
               (i32.const -2147483646)
              )
             )
             (i32.store
              (local.tee $1
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 32)
               )
              )
              (i32.load
               (local.tee $4
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 544)
                 )
                 (i32.const 32)
                )
               )
              )
             )
             (i64.store
              (local.tee $5
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 24)
               )
              )
              (i64.load align=4
               (local.tee $13
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 544)
                 )
                 (i32.const 24)
                )
               )
              )
             )
             (i64.store
              (local.tee $12
               (i32.add
                (i32.add
                 (local.get $0)
                 (i32.const 504)
                )
                (i32.const 16)
               )
              )
              (i64.load align=4
               (local.tee $2
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 544)
                 )
                 (i32.const 16)
                )
               )
              )
             )
             (i64.store
              (local.get $20)
              (i64.load align=4
               (local.get $19)
              )
             )
             (i64.store offset=504
              (local.get $0)
              (i64.load offset=544 align=4
               (local.get $0)
              )
             )
             (i64.store offset=616
              (local.get $0)
              (i64.const 100000)
             )
             (i64.store offset=608
              (local.get $0)
              (i64.const 8192)
             )
             (call $_ZN13hyperinterval5float12F64Enclosure11from_dyadic17hea0163c860c15cc1E
              (i32.add
               (local.get $0)
               (i32.const 584)
              )
              (i32.add
               (local.get $0)
               (i32.const 504)
              )
              (i32.add
               (local.get $0)
               (i32.const 608)
              )
             )
             (br_if $label$94
              (i64.ne
               (i64.load offset=584
                (local.get $0)
               )
               (i64.const 2)
              )
             )
             (br_if $label$94
              (i32.ne
               (i32.and
                (i32.load8_u offset=592
                 (local.get $0)
                )
                (i32.const 255)
               )
               (i32.const 5)
              )
             )
             (block $label$147
              (br_if $label$147
               (i32.eq
                (local.get $3)
                (i32.const 1)
               )
              )
              (local.set $15
               (i32.sub
                (i32.const 2)
                (local.get $15)
               )
              )
              (block $label$148
               (block $label$149
                (block $label$150
                 (br_table $label$149 $label$148 $label$150
                  (i32.add
                   (local.tee $17
                    (i32.load offset=504
                     (local.get $0)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                )
                (br_if $label$149
                 (i32.eqz
                  (local.get $17)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=508
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $17)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (br_if $label$148
                (i32.eq
                 (local.tee $17
                  (i32.load offset=520
                   (local.get $0)
                  )
                 )
                 (i32.const -2147483648)
                )
               )
               (br_if $label$148
                (i32.eqz
                 (local.get $17)
                )
               )
               (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                (i32.load offset=524
                 (local.get $0)
                )
                (i32.shl
                 (local.get $17)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (i32.store16 align=1
               (local.get $9)
               (i32.load16_u offset=484
                (local.get $0)
               )
              )
              (i32.store8
               (local.get $11)
               (i32.load8_u
                (local.get $22)
               )
              )
              (i32.store8 offset=500
               (local.get $0)
               (local.get $15)
              )
              (i32.store offset=496
               (local.get $0)
               (local.get $7)
              )
              (i32.store offset=492
               (local.get $0)
               (local.get $16)
              )
              (i32.store offset=488
               (local.get $0)
               (local.get $21)
              )
              (call $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE
               (i32.add
                (local.get $0)
                (i32.const 544)
               )
               (i32.add
                (local.get $0)
                (i32.const 488)
               )
               (local.get $14)
              )
              (br_if $label$95
               (i32.eq
                (i32.load offset=544
                 (local.get $0)
                )
                (i32.const -2147483646)
               )
              )
              (i32.store
               (local.get $1)
               (i32.load
                (local.get $4)
               )
              )
              (i64.store
               (local.get $5)
               (i64.load align=4
                (local.get $13)
               )
              )
              (i64.store
               (local.get $12)
               (i64.load align=4
                (local.get $2)
               )
              )
              (i64.store
               (local.get $20)
               (i64.load align=4
                (local.get $19)
               )
              )
              (i64.store offset=504
               (local.get $0)
               (i64.load offset=544 align=4
                (local.get $0)
               )
              )
              (i64.store offset=616
               (local.get $0)
               (i64.const 100000)
              )
              (i64.store offset=608
               (local.get $0)
               (i64.const 8192)
              )
              (call $_ZN13hyperinterval5float12F64Enclosure11from_dyadic17hea0163c860c15cc1E
               (i32.add
                (local.get $0)
                (i32.const 584)
               )
               (i32.add
                (local.get $0)
                (i32.const 504)
               )
               (i32.add
                (local.get $0)
                (i32.const 608)
               )
              )
              (br_if $label$94
               (i64.ne
                (i64.load offset=584
                 (local.get $0)
                )
                (i64.const 2)
               )
              )
              (br_if $label$94
               (i32.ne
                (i32.and
                 (i32.load8_u offset=592
                  (local.get $0)
                 )
                 (i32.const 255)
                )
                (i32.const 5)
               )
              )
              (br_if $label$147
               (i32.eq
                (local.get $3)
                (i32.const 2)
               )
              )
              (block $label$151
               (block $label$152
                (block $label$153
                 (br_table $label$152 $label$151 $label$153
                  (i32.add
                   (local.tee $1
                    (i32.load offset=504
                     (local.get $0)
                    )
                   )
                   (i32.const -2147483648)
                  )
                 )
                )
                (br_if $label$152
                 (i32.eqz
                  (local.get $1)
                 )
                )
                (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                 (i32.load offset=508
                  (local.get $0)
                 )
                 (i32.shl
                  (local.get $1)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
               (br_if $label$151
                (i32.eq
                 (local.tee $1
                  (i32.load offset=520
                   (local.get $0)
                  )
                 )
                 (i32.const -2147483648)
                )
               )
               (br_if $label$151
                (i32.eqz
                 (local.get $1)
                )
               )
               (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
                (i32.load offset=524
                 (local.get $0)
                )
                (i32.shl
                 (local.get $1)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (local.set $3
               (i32.add
                (local.get $3)
                (i32.const -2)
               )
              )
              (local.set $18
               (i32.add
                (local.get $18)
                (i32.const -1)
               )
              )
              (br_if $label$88
               (i32.eq
                (local.tee $6
                 (i32.add
                  (local.get $6)
                  (i32.const 20)
                 )
                )
                (i32.const 60)
               )
              )
              (br $label$132)
             )
            )
            (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
             (i32.const 1049100)
            )
            (unreachable)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
            (i32.const 1049100)
           )
           (unreachable)
          )
          (i32.store8 offset=584
           (local.get $0)
           (i32.load8_u offset=548
            (local.get $0)
           )
          )
          (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
           (i32.const 1049132)
           (i32.const 43)
           (i32.add
            (local.get $0)
            (i32.const 584)
           )
           (i32.const 1049116)
           (i32.const 1049100)
          )
          (unreachable)
         )
         (i32.store offset=544
          (local.get $0)
          (i32.const 0)
         )
         (call $_ZN4core9panicking13assert_failed17hca537391662a44e3E
          (i32.const 0)
          (i32.add
           (local.get $0)
           (i32.const 584)
          )
          (i32.const 1049024)
          (i32.add
           (local.get $0)
           (i32.const 544)
          )
          (i32.const 1049100)
         )
         (unreachable)
        )
        (i32.store8 offset=584
         (local.get $0)
         (i32.load8_u offset=548
          (local.get $0)
         )
        )
        (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
         (i32.const 1049132)
         (i32.const 43)
         (i32.add
          (local.get $0)
          (i32.const 584)
         )
         (i32.const 1049116)
         (i32.const 1049100)
        )
        (unreachable)
       )
       (i32.store8 offset=608
        (local.get $0)
        (i32.load8_u offset=552
         (local.get $0)
        )
       )
       (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
        (i32.const 1049132)
        (i32.const 43)
        (i32.add
         (local.get $0)
         (i32.const 608)
        )
        (i32.const 1049116)
        (i32.const 1049100)
       )
       (unreachable)
      )
      (call $_ZN4core6option13unwrap_failed17h0450242c3e36021bE
       (i32.const 1049100)
      )
      (unreachable)
     )
     (i32.store offset=544
      (local.get $0)
      (i32.const 0)
     )
     (call $_ZN4core9panicking13assert_failed17h3cd488936ed7650bE
      (i32.const 0)
      (i32.add
       (local.get $0)
       (i32.const 584)
      )
      (i32.add
       (local.get $0)
       (i32.const 608)
      )
      (i32.add
       (local.get $0)
       (i32.const 544)
      )
      (i32.const 1049100)
     )
     (unreachable)
    )
    (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
     (local.get $15)
     (local.get $25)
     (i32.const 1049004)
    )
    (unreachable)
   )
   (local.set $9
    (i32.sub
     (i32.const 0)
     (local.get $3)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $0)
    (i32.const 624)
   )
  )
  (local.get $9)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1d7860665311e8feE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load
       (local.tee $0
        (i32.load
         (local.get $0)
        )
       )
      )
      (i32.const 1)
     )
    )
    (i32.store offset=12
     (local.get $2)
     (i32.add
      (local.get $0)
      (i32.const 4)
     )
    )
    (local.set $0
     (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
      (local.get $1)
      (i32.const 1049540)
      (i32.const 4)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1049544)
     )
    )
    (br $label$1)
   )
   (local.set $0
    (call $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE
     (local.get $1)
     (i32.const 1049520)
     (i32.const 4)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h20e69f89bee506e7E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.ne
      (i64.load
       (local.tee $0
        (i32.load
         (local.get $0)
        )
       )
      )
      (i64.const 2)
     )
    )
    (i32.store offset=12
     (local.get $2)
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
    )
    (local.set $0
     (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
      (local.get $1)
      (i32.const 1049628)
      (i32.const 3)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1049612)
     )
    )
    (br $label$1)
   )
   (i32.store offset=8
    (local.get $2)
    (local.get $0)
   )
   (local.set $0
    (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
     (local.get $1)
     (i32.const 1049608)
     (i32.const 2)
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 1049592)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h290d342de705ebf8E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load
       (local.tee $0
        (i32.load
         (local.get $0)
        )
       )
      )
      (i32.const 1)
     )
    )
    (i32.store offset=12
     (local.get $2)
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
    )
    (local.set $0
     (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
      (local.get $1)
      (i32.const 1049540)
      (i32.const 4)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1049524)
     )
    )
    (br $label$1)
   )
   (local.set $0
    (call $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE
     (local.get $1)
     (i32.const 1049520)
     (i32.const 4)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h396c35edec27f58fE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (i32.load
    (local.get $0)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
    (local.get $1)
    (i32.const 1049584)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049364)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h60b431f8cd9d84a4E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $0
   (i32.load
    (local.get $0)
   )
  )
  (call $_ZN4core3fmt9Formatter11debug_tuple17h39b57e749a83bf1dE
   (i32.add
    (local.get $2)
    (i32.const 12)
   )
   (local.get $1)
   (i32.const 1)
   (i32.const 0)
  )
  (i32.store offset=24
   (local.get $2)
   (local.get $0)
  )
  (i32.store offset=28
   (local.get $2)
   (i32.add
    (local.get $0)
    (i32.const 8)
   )
  )
  (drop
   (call $_ZN4core3fmt8builders10DebugTuple5field17h88abbfe9483517b6E
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.add
     (local.get $2)
     (i32.const 24)
    )
    (i32.const 1049364)
   )
  )
  (drop
   (call $_ZN4core3fmt8builders10DebugTuple5field17h88abbfe9483517b6E
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.add
     (local.get $2)
     (i32.const 28)
    )
    (i32.const 1049364)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt8builders10DebugTuple6finish17h1081fa1a6a5ffbd9E
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h61671715f47e6009E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (i32.add
    (local.tee $0
     (i32.load
      (local.get $0)
     )
    )
    (i32.const 4)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter26debug_struct_field2_finish17h625630aaf7084656E
    (local.get $1)
    (i32.const 1049944)
    (i32.const 6)
    (i32.const 1049950)
    (i32.const 5)
    (local.get $0)
    (i32.const 1049912)
    (i32.const 1049955)
    (i32.const 5)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049928)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7dc0ac91f5d02537E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (i32.load
    (local.get $0)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter26debug_struct_field1_finish17h60ea07cd6c9ae974E
    (local.get $1)
    (i32.const 1049664)
    (i32.const 12)
    (i32.const 1049676)
    (i32.const 6)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049648)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h811f8ef5b0dfd2efE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (i32.add
    (local.tee $0
     (i32.load
      (local.get $0)
     )
    )
    (i32.const 8)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter26debug_struct_field2_finish17h625630aaf7084656E
    (local.get $1)
    (i32.const 1049944)
    (i32.const 6)
    (i32.const 1049950)
    (i32.const 5)
    (local.get $0)
    (i32.const 1049960)
    (i32.const 1049955)
    (i32.const 5)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049976)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h86f3b7f690deb967E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local.set $0
   (i32.load
    (local.get $0)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.and
     (local.tee $2
      (i32.load offset=8
       (local.get $1)
      )
     )
     (i32.const 33554432)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.get $2)
      (i32.const 67108864)
     )
    )
    (return
     (call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h10d43ed3b5ffe62fE
      (local.get $0)
      (local.get $1)
     )
    )
   )
   (return
    (call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h7b8f58fed5be4707E
     (local.get $0)
     (local.get $1)
    )
   )
  )
  (call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he0816313014f2d4eE
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h979ba1553e1ed070E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load
       (local.tee $0
        (i32.load
         (local.get $0)
        )
       )
      )
      (i32.const 2)
     )
    )
    (i32.store offset=12
     (local.get $2)
     (i32.add
      (local.get $0)
      (i32.const 4)
     )
    )
    (local.set $0
     (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
      (local.get $1)
      (i32.const 1049628)
      (i32.const 3)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1049612)
     )
    )
    (br $label$1)
   )
   (i32.store offset=8
    (local.get $2)
    (local.get $0)
   )
   (local.set $0
    (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
     (local.get $1)
     (i32.const 1049608)
     (i32.const 2)
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 1049632)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h9c2e87f602bfc089E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local.set $0
   (i32.load
    (local.get $0)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.and
     (local.tee $2
      (i32.load offset=8
       (local.get $1)
      )
     )
     (i32.const 33554432)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.get $2)
      (i32.const 67108864)
     )
    )
    (return
     (call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hf21e6429c4a522c9E
      (local.get $0)
      (local.get $1)
     )
    )
   )
   (return
    (call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17hbeeaf37d438f79adE
     (local.get $0)
     (local.get $1)
    )
   )
  )
  (call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17hd0e92b612134ea30E
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdec691068dc1a049E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (i32.load
    (local.get $0)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
    (local.get $1)
    (i32.const 1049576)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049560)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hf0134fea8590a8ebE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (i32.load
    (local.get $0)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter26debug_struct_field1_finish17h60ea07cd6c9ae974E
    (local.get $1)
    (i32.const 1049700)
    (i32.const 12)
    (i32.const 1049676)
    (i32.const 6)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049684)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hfe97619e0e0d12aeE (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE
   (local.get $1)
   (i32.load
    (i32.add
     (local.tee $0
      (i32.shl
       (i32.load8_u
        (i32.load
         (local.get $0)
        )
       )
       (i32.const 2)
      )
     )
     (i32.const 1050048)
    )
   )
   (i32.load
    (i32.add
     (local.get $0)
     (i32.const 1049992)
    )
   )
  )
 )
 (func $_ZN4core9panicking13assert_failed17h2e1146eccc43ab29E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $5)
   (local.get $2)
  )
  (i32.store offset=8
   (local.get $5)
   (local.get $1)
  )
  (call $_ZN4core9panicking19assert_failed_inner17h195f2bdae754966cE
   (local.get $0)
   (i32.add
    (local.get $5)
    (i32.const 8)
   )
   (i32.const 1049316)
   (i32.add
    (local.get $5)
    (i32.const 12)
   )
   (i32.const 1049316)
   (local.get $3)
   (local.get $4)
  )
  (unreachable)
 )
 (func $_ZN4core9panicking13assert_failed17h3cd488936ed7650bE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $5)
   (local.get $2)
  )
  (i32.store offset=8
   (local.get $5)
   (local.get $1)
  )
  (call $_ZN4core9panicking19assert_failed_inner17h195f2bdae754966cE
   (local.get $0)
   (i32.add
    (local.get $5)
    (i32.const 8)
   )
   (i32.const 1049332)
   (i32.add
    (local.get $5)
    (i32.const 12)
   )
   (i32.const 1049332)
   (local.get $3)
   (local.get $4)
  )
  (unreachable)
 )
 (func $_ZN4core9panicking13assert_failed17hca537391662a44e3E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $5)
   (local.get $2)
  )
  (i32.store offset=8
   (local.get $5)
   (local.get $1)
  )
  (call $_ZN4core9panicking19assert_failed_inner17h195f2bdae754966cE
   (local.get $0)
   (i32.add
    (local.get $5)
    (i32.const 8)
   )
   (i32.const 1049348)
   (i32.add
    (local.get $5)
    (i32.const 12)
   )
   (i32.const 1049348)
   (local.get $3)
   (local.get $4)
  )
  (unreachable)
 )
 (func $_ZN67_$LT$hyperinterval..float..Binary32$u20$as$u20$core..fmt..Debug$GT$3fmt17h442b31530ca63946E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (local.get $0)
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
    (local.get $1)
    (i32.const 1049576)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049560)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN67_$LT$hyperinterval..float..Binary64$u20$as$u20$core..fmt..Debug$GT$3fmt17hb78d8c3feaddf042E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $2)
   (local.get $0)
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE
    (local.get $1)
    (i32.const 1049584)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049364)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $verify_dyadic_egress (result i32)
  (call $_ZN32interval_dyadic_wasm_conformance5cases6verify17h713e683a31014c55E)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local.set $2
   (call $_RNvCs691rhTbG0Ee_7___rustc11___rdl_alloc
    (local.get $0)
    (local.get $1)
   )
  )
  (return
   (local.get $2)
  )
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_RNvCs691rhTbG0Ee_7___rustc13___rdl_dealloc
   (local.get $0)
   (local.get $1)
   (local.get $2)
  )
  (return)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc14___rust_realloc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local.set $4
   (call $_RNvCs691rhTbG0Ee_7___rustc13___rdl_realloc
    (local.get $0)
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
  )
  (return
   (local.get $4)
  )
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc26___rust_alloc_error_handler (param $0 i32) (param $1 i32)
  (call $_RNvCs691rhTbG0Ee_7___rustc8___rg_oom
   (local.get $0)
   (local.get $1)
  )
  (return)
 )
 (func $_ZN10num_bigint6bigint5shift95_$LT$impl$u20$core..ops..bit..ShrAssign$LT$usize$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$10shr_assign17hceb16ab7931998c6E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.load8_u offset=12
        (local.get $0)
       )
      )
      (call $_ZN10num_bigint6bigint6BigInt14trailing_zeros17h352c206afac23af7E
       (i32.add
        (local.get $2)
        (i32.const 16)
       )
       (local.get $0)
      )
      (br_if $label$3
       (i32.ne
        (i32.load offset=16
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $3
       (i32.const 0)
      )
      (br_if $label$4
       (i32.eqz
        (local.get $1)
       )
      )
      (local.set $3
       (i64.lt_u
        (i64.load offset=24
         (local.get $2)
        )
        (i64.extend_i32_u
         (local.get $1)
        )
       )
      )
     )
     (local.set $4
      (i64.load align=4
       (local.get $0)
      )
     )
     (i64.store align=4
      (local.get $0)
      (i64.load offset=1050120 align=4
       (i32.const 0)
      )
     )
     (i32.store
      (i32.add
       (i32.add
        (local.get $2)
        (i32.const 16)
       )
       (i32.const 8)
      )
      (i32.load
       (local.tee $5
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
       )
      )
     )
     (i32.store
      (local.get $5)
      (i32.load offset=1050128
       (i32.const 0)
      )
     )
     (i64.store offset=16
      (local.get $2)
      (local.get $4)
     )
     (block $label$5
      (block $label$6
       (block $label$7
        (block $label$8
         (br_table $label$7 $label$8 $label$6
          (i32.add
           (i32.wrap_i64
            (local.get $4)
           )
           (i32.const -2147483648)
          )
         )
        )
        (block $label$9
         (block $label$10
          (br_if $label$10
           (i32.eq
            (i32.load
             (local.tee $5
              (i32.load offset=20
               (local.get $2)
              )
             )
            )
            (i32.const -2147483648)
           )
          )
          (br_if $label$5
           (i32.load offset=8
            (local.get $5)
           )
          )
          (br $label$9)
         )
         (br_if $label$5
          (i32.load offset=4
           (local.get $5)
          )
         )
         (local.set $1
          (i32.load offset=8
           (local.get $5)
          )
         )
        )
        (i32.store offset=8
         (local.get $2)
         (local.get $1)
        )
        (i64.store align=4
         (local.get $2)
         (i64.const 2147483648)
        )
        (br $label$1)
       )
       (br_if $label$5
        (i32.load offset=20
         (local.get $2)
        )
       )
       (br $label$2)
      )
      (br_if $label$2
       (i32.eqz
        (i32.load offset=24
         (local.get $2)
        )
       )
      )
     )
     (call $_ZN10num_bigint7biguint5shift12biguint_shr217hb02301f24d4fb4a3E
      (local.get $2)
      (i32.add
       (local.get $2)
       (i32.const 16)
      )
      (i32.shr_u
       (local.get $1)
       (i32.const 5)
      )
      (i32.and
       (local.get $1)
       (i32.const 31)
      )
     )
     (br_if $label$1
      (i32.eq
       (local.tee $1
        (i32.load
         (local.get $0)
        )
       )
       (i32.const -2147483648)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.get $1)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (i32.load offset=4
       (local.get $0)
      )
      (i32.shl
       (local.get $1)
       (i32.const 2)
      )
      (i32.const 4)
     )
     (br $label$1)
    )
    (call $_ZN4core6option13expect_failed17hf57fb2c2bc253385E
     (i32.const 1050932)
     (i32.const 28)
     (i32.const 1051060)
    )
    (unreachable)
   )
   (i32.store
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i32.load
     (i32.add
      (i32.add
       (local.get $2)
       (i32.const 16)
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (local.get $2)
    (i64.load offset=16
     (local.get $2)
    )
   )
  )
  (i64.store align=4
   (local.get $0)
   (i64.load
    (local.get $2)
   )
  )
  (i32.store
   (i32.add
    (local.get $0)
    (i32.const 8)
   )
   (i32.load
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
   )
  )
  (block $label$11
   (block $label$12
    (br_if $label$12
     (local.get $3)
    )
    (block $label$13
     (block $label$14
      (br_if $label$14
       (i32.eq
        (i32.load
         (local.get $0)
        )
        (i32.const -2147483648)
       )
      )
      (br_if $label$13
       (i32.eqz
        (i32.load offset=8
         (local.get $0)
        )
       )
      )
      (br $label$11)
     )
     (br_if $label$11
      (i32.load offset=4
       (local.get $0)
      )
     )
    )
    (i32.store8 offset=12
     (local.get $0)
     (i32.const 1)
    )
    (br $label$11)
   )
   (call $_ZN10num_bigint7biguint8addition97_$LT$impl$u20$core..ops..arith..AddAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10add_assign17hc9af3becd6914718E_31
    (local.get $0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN10num_bigint7biguint8addition97_$LT$impl$u20$core..ops..arith..AddAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10add_assign17hc9af3becd6914718E_31 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (br_if $label$6
         (i32.eq
          (local.tee $1
           (i32.load
            (local.get $0)
           )
          )
          (i32.const -2147483648)
         )
        )
        (br_if $label$5
         (local.tee $2
          (i32.load offset=8
           (local.get $0)
          )
         )
        )
        (block $label$7
         (br_if $label$7
          (local.get $1)
         )
         (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
          (local.get $0)
          (i32.const 1050228)
         )
        )
        (i32.store
         (i32.load offset=4
          (local.get $0)
         )
         (i32.const 1)
        )
        (i32.store offset=8
         (local.get $0)
         (i32.const 1)
        )
        (return)
       )
       (br_if $label$4
        (i32.load offset=4
         (local.get $0)
        )
       )
       (i64.store offset=4 align=4
        (local.get $0)
        (i64.const 4294967297)
       )
       (return)
      )
      (i32.store
       (local.tee $1
        (i32.load offset=4
         (local.get $0)
        )
       )
       (local.tee $3
        (i32.add
         (i32.load
          (local.get $1)
         )
         (i32.const 1)
        )
       )
      )
      (br_if $label$2
       (local.get $3)
      )
      (br_if $label$3
       (i32.eq
        (local.get $2)
        (i32.const 1)
       )
      )
      (local.set $3
       (i32.add
        (i32.shl
         (local.get $2)
         (i32.const 2)
        )
        (i32.const -4)
       )
      )
      (local.set $1
       (i32.add
        (local.get $1)
        (i32.const 4)
       )
      )
      (loop $label$8
       (i32.store
        (local.get $1)
        (local.tee $2
         (i32.add
          (i32.load
           (local.get $1)
          )
          (i32.const 1)
         )
        )
       )
       (br_if $label$2
        (local.get $2)
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (br_if $label$3
        (i32.eqz
         (local.tee $3
          (i32.add
           (local.get $3)
           (i32.const -4)
          )
         )
        )
       )
       (br $label$8)
      )
     )
     (i32.store offset=8
      (local.get $0)
      (local.tee $1
       (i32.add
        (i32.load offset=8
         (local.get $0)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (local.get $1)
     )
    )
    (block $label$9
     (br_if $label$9
      (i32.eq
       (local.tee $1
        (i32.load
         (local.get $0)
        )
       )
       (i32.const -2147483648)
      )
     )
     (block $label$10
      (br_if $label$10
       (i32.ne
        (local.tee $2
         (i32.load offset=8
          (local.get $0)
         )
        )
        (local.get $1)
       )
      )
      (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
       (local.get $0)
       (i32.const 1050228)
      )
     )
     (i32.store
      (i32.add
       (i32.load offset=4
        (local.get $0)
       )
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
      )
      (i32.const 1)
     )
     (i32.store offset=8
      (local.get $0)
      (i32.add
       (local.get $2)
       (i32.const 1)
      )
     )
     (return)
    )
    (block $label$11
     (br_if $label$11
      (i32.ne
       (i32.load offset=4
        (local.get $0)
       )
       (i32.const 1)
      )
     )
     (drop
      (i32.load8_u offset=1053525
       (i32.const 0)
      )
     )
     (local.set $2
      (i32.load offset=8
       (local.get $0)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.tee $1
        (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
         (i32.const 8)
         (i32.const 4)
        )
       )
      )
     )
     (i32.store offset=4
      (local.get $1)
      (i32.const 1)
     )
     (i32.store
      (local.get $1)
      (local.get $2)
     )
     (i32.store offset=8
      (local.get $0)
      (i32.const 2)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $1)
     )
     (i32.store
      (local.get $0)
      (i32.const 2)
     )
     (return)
    )
    (i64.store offset=4 align=4
     (local.get $0)
     (i64.const 4294967297)
    )
   )
   (return)
  )
  (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
   (i32.const 4)
   (i32.const 8)
   (i32.const 1050320)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval6dyadic14DyadicInterval3new17hd48dad342c5984fcE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 112)
    )
   )
  )
  (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$3new17hf1b5b015161a97c1E
   (i32.add
    (local.get $4)
    (i32.const 64)
   )
   (local.get $1)
   (local.get $2)
  )
  (local.set $2
   (i32.load8_u offset=68
    (local.get $4)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (local.tee $1
       (i32.load offset=64
        (local.get $4)
       )
      )
      (i32.const -2147483647)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const -2147483646)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $2)
    )
    (br $label$1)
   )
   (i32.store align=1
    (i32.add
     (local.get $4)
     (i32.const 23)
    )
    (i32.load align=1
     (i32.add
      (local.get $4)
      (i32.const 92)
     )
    )
   )
   (i64.store
    (i32.add
     (local.get $4)
     (i32.const 16)
    )
    (i64.load align=1
     (i32.add
      (local.get $4)
      (i32.const 85)
     )
    )
   )
   (i64.store
    (local.tee $5
     (i32.add
      (local.get $4)
      (i32.const 8)
     )
    )
    (i64.load align=1
     (i32.add
      (local.get $4)
      (i32.const 77)
     )
    )
   )
   (i64.store
    (local.get $4)
    (local.tee $6
     (i64.load offset=69 align=1
      (local.get $4)
     )
    )
   )
   (i32.store align=1
    (local.tee $7
     (i32.add
      (local.get $4)
      (i32.const 44)
     )
    )
    (i32.load offset=7 align=1
     (local.get $4)
    )
   )
   (i64.store offset=37 align=1
    (local.get $4)
    (local.get $6)
   )
   (i64.store
    (local.tee $8
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 48)
      )
      (i32.const 8)
     )
    )
    (i64.load align=1
     (i32.add
      (local.get $4)
      (i32.const 19)
     )
    )
   )
   (i64.store offset=48
    (local.get $4)
    (i64.load offset=11 align=1
     (local.get $4)
    )
   )
   (i32.store8 offset=36
    (local.get $4)
    (local.get $2)
   )
   (i32.store offset=32
    (local.get $4)
    (local.get $1)
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u
       (local.get $7)
      )
      (i32.const 1)
     )
    )
    (br_if $label$3
     (i32.ne
      (i32.and
       (i32.load8_u offset=60
        (local.get $4)
       )
       (i32.const 255)
      )
      (i32.const 1)
     )
    )
    (i32.store8 offset=12
     (local.get $0)
     (i32.const 1)
    )
    (i32.store offset=32
     (local.get $0)
     (i32.const 0)
    )
    (i32.store
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
     (i32.load offset=1050112
      (i32.const 0)
     )
    )
    (i64.store align=4
     (local.get $0)
     (local.tee $6
      (i64.load offset=1050104 align=4
       (i32.const 0)
      )
     )
    )
    (i64.store offset=16 align=4
     (local.get $0)
     (local.get $6)
    )
    (i64.store align=4
     (i32.add
      (local.get $0)
      (i32.const 24)
     )
     (i64.load offset=1050112 align=4
      (i32.const 0)
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.eq
       (local.tee $0
        (i32.load offset=48
         (local.get $4)
        )
       )
       (i32.const -2147483648)
      )
     )
     (br_if $label$4
      (i32.eqz
       (local.get $0)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (i32.load offset=52
       (local.get $4)
      )
      (i32.shl
       (local.get $0)
       (i32.const 2)
      )
      (i32.const 4)
     )
    )
    (br_if $label$1
     (i32.eq
      (local.get $1)
      (i32.const -2147483648)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $1)
     )
    )
    (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
     (i32.load offset=36
      (local.get $4)
     )
     (i32.shl
      (local.get $1)
      (i32.const 2)
     )
     (i32.const 4)
    )
    (br $label$1)
   )
   (call $_ZN10num_bigint6bigint6BigInt14trailing_zeros17h352c206afac23af7E
    (i32.add
     (local.get $4)
     (i32.const 64)
    )
    (i32.add
     (local.get $4)
     (i32.const 32)
    )
   )
   (local.set $2
    (i32.load offset=64
     (local.get $4)
    )
   )
   (local.set $6
    (i64.load offset=72
     (local.get $4)
    )
   )
   (call $_ZN10num_bigint6bigint6BigInt14trailing_zeros17h352c206afac23af7E
    (i32.add
     (local.get $4)
     (i32.const 64)
    )
    (i32.add
     (local.get $4)
     (i32.const 48)
    )
   )
   (call $_ZN10num_bigint6bigint5shift95_$LT$impl$u20$core..ops..bit..ShrAssign$LT$usize$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$10shr_assign17hceb16ab7931998c6E
    (i32.add
     (local.get $4)
     (i32.const 32)
    )
    (local.tee $2
     (i32.wrap_i64
      (select
       (local.tee $9
        (i64.sub
         (i64.const 2147483647)
         (i64.extend_i32_s
          (local.get $3)
         )
        )
       )
       (local.tee $6
        (select
         (select
          (local.tee $10
           (i64.load offset=72
            (local.get $4)
           )
          )
          (local.tee $6
           (select
            (local.get $6)
            (i64.const -1)
            (local.get $2)
           )
          )
          (i64.lt_u
           (local.get $10)
           (local.get $6)
          )
         )
         (local.get $6)
         (i32.load offset=64
          (local.get $4)
         )
        )
       )
       (i64.lt_u
        (local.get $9)
        (local.get $6)
       )
      )
     )
    )
   )
   (call $_ZN10num_bigint6bigint5shift95_$LT$impl$u20$core..ops..bit..ShrAssign$LT$usize$GT$$u20$for$u20$num_bigint..bigint..BigInt$GT$10shr_assign17hceb16ab7931998c6E
    (i32.add
     (local.get $4)
     (i32.const 48)
    )
    (local.get $2)
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $4)
      (i32.const 96)
     )
     (i32.const 8)
    )
    (i64.load align=4
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 32)
      )
      (i32.const 8)
     )
    )
   )
   (i64.store offset=96
    (local.get $4)
    (i64.load offset=32 align=4
     (local.get $4)
    )
   )
   (i64.store
    (local.get $5)
    (i64.load
     (local.get $8)
    )
   )
   (i64.store
    (local.get $4)
    (i64.load offset=48
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$3new17hf1b5b015161a97c1E
    (i32.add
     (local.get $4)
     (i32.const 64)
    )
    (i32.add
     (local.get $4)
     (i32.const 96)
    )
    (local.get $4)
   )
   (local.set $1
    (i32.load8_u offset=68
     (local.get $4)
    )
   )
   (block $label$5
    (br_if $label$5
     (i32.ne
      (local.tee $7
       (i32.load offset=64
        (local.get $4)
       )
      )
      (i32.const -2147483647)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const -2147483646)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (i64.store offset=5 align=1
    (local.get $0)
    (i64.load offset=69 align=1
     (local.get $4)
    )
   )
   (i32.store align=1
    (i32.add
     (local.get $0)
     (i32.const 28)
    )
    (i32.load align=1
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 64)
      )
      (i32.const 28)
     )
    )
   )
   (i64.store align=1
    (i32.add
     (local.get $0)
     (i32.const 21)
    )
    (i64.load align=1
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 64)
      )
      (i32.const 21)
     )
    )
   )
   (i64.store align=1
    (i32.add
     (local.get $0)
     (i32.const 13)
    )
    (i64.load align=1
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 64)
      )
      (i32.const 13)
     )
    )
   )
   (i32.store offset=32
    (local.get $0)
    (i32.add
     (local.get $3)
     (local.get $2)
    )
   )
   (i32.store8 offset=4
    (local.get $0)
    (local.get $1)
   )
   (i32.store
    (local.get $0)
    (local.get $7)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 112)
   )
  )
 )
 (func $_ZN13hyperinterval6dyadic14DyadicInterval5point17h90b1db0808c6697dE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $4
   (i32.const -2147483648)
  )
  (local.set $5
   (i32.load offset=8
    (local.get $1)
   )
  )
  (local.set $6
   (i32.load8_u offset=12
    (local.get $1)
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eq
        (i32.load
         (local.get $1)
        )
        (i32.const -2147483648)
       )
      )
      (local.set $7
       (i32.load offset=4
        (local.get $1)
       )
      )
      (br_table $label$1 $label$3 $label$2
       (local.get $5)
      )
     )
     (local.set $8
      (local.get $5)
     )
     (local.set $5
      (i32.load offset=4
       (local.get $1)
      )
     )
     (br $label$1)
    )
    (local.set $8
     (i32.load
      (local.get $7)
     )
    )
    (local.set $5
     (i32.const 1)
    )
    (br $label$1)
   )
   (local.set $8
    (i32.shl
     (local.get $5)
     (i32.const 2)
    )
   )
   (local.set $4
    (i32.const 0)
   )
   (block $label$5
    (block $label$6
     (br_if $label$6
      (i32.gt_u
       (local.get $5)
       (i32.const 1073741823)
      )
     )
     (br_if $label$6
      (i32.gt_u
       (local.get $8)
       (i32.const 2147483644)
      )
     )
     (block $label$7
      (block $label$8
       (br_if $label$8
        (local.get $8)
       )
       (local.set $9
        (i32.const 4)
       )
       (local.set $4
        (i32.const 0)
       )
       (br $label$7)
      )
      (drop
       (i32.load8_u offset=1053525
        (i32.const 0)
       )
      )
      (local.set $4
       (i32.const 4)
      )
      (br_if $label$6
       (i32.eqz
        (local.tee $9
         (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
          (local.get $8)
          (i32.const 4)
         )
        )
       )
      )
      (local.set $4
       (local.get $5)
      )
     )
     (br_if $label$5
      (i32.eqz
       (local.get $8)
      )
     )
     (memory.copy
      (local.get $9)
      (local.get $7)
      (local.get $8)
     )
     (br $label$5)
    )
    (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
     (local.get $4)
     (local.get $8)
     (i32.const 1050320)
    )
    (unreachable)
   )
   (local.set $8
    (local.get $5)
   )
   (local.set $5
    (local.get $9)
   )
  )
  (i32.store offset=8
   (local.get $3)
   (local.get $8)
  )
  (i32.store offset=4
   (local.get $3)
   (local.get $5)
  )
  (i32.store
   (local.get $3)
   (local.get $4)
  )
  (i32.store8 offset=12
   (local.get $3)
   (local.get $6)
  )
  (call $_ZN13hyperinterval6dyadic14DyadicInterval3new17hd48dad342c5984fcE
   (local.get $0)
   (local.get $3)
   (local.get $1)
   (local.get $2)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure11from_dyadic17h0b1bbdce0a322157E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eq
       (i32.load
        (local.get $1)
       )
       (i32.const -2147483647)
      )
     )
     (call $_ZN13hyperinterval4ieee6dyadic45_$LT$impl$u20$hyperinterval..ieee..Format$GT$14enclose_dyadic17hd30dd3c77562331dE
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $1)
      (local.tee $4
       (i32.load offset=32
        (local.get $1)
       )
      )
      (local.get $2)
     )
     (br_if $label$2
      (i32.eqz
       (i32.load8_u offset=8
        (local.get $3)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=9
       (local.get $3)
      )
     )
     (i32.store
      (local.get $0)
      (i32.const 2)
     )
     (i32.store8 offset=4
      (local.get $0)
      (local.get $1)
     )
     (br $label$1)
    )
    (i32.store
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load32_u offset=16
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6dyadic45_$LT$impl$u20$hyperinterval..ieee..Format$GT$14enclose_dyadic17hd30dd3c77562331dE
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i32.add
     (local.get $1)
     (i32.const 16)
    )
    (local.get $4)
    (local.get $2)
   )
   (block $label$4
    (br_if $label$4
     (i32.ne
      (i32.load8_u offset=8
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (local.set $6
    (i64.load32_u offset=24
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h7933c229426a0f96E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $5)
   )
   (block $label$5
    (br_if $label$5
     (i32.ne
      (i32.load8_u offset=8
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load offset=16
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h7933c229426a0f96E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $6)
   )
   (block $label$6
    (br_if $label$6
     (i32.ne
      (i32.load8_u offset=8
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (block $label$7
    (br_if $label$7
     (i64.le_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $6
         (i64.and
          (local.get $5)
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $6)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $1
         (i32.wrap_i64
          (local.get $5)
         )
        )
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $6
         (i64.and
          (local.tee $5
           (i64.load offset=16
            (local.get $3)
           )
          )
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $6)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $2
         (i32.wrap_i64
          (local.get $5)
         )
        )
        (i32.const 0)
       )
      )
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (i32.const 1)
    )
    (br $label$1)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $2)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $1)
   )
   (i32.store
    (local.get $0)
    (i32.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure11from_dyadic17hea0163c860c15cc1E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eq
       (i32.load
        (local.get $1)
       )
       (i32.const -2147483647)
      )
     )
     (call $_ZN13hyperinterval4ieee6dyadic45_$LT$impl$u20$hyperinterval..ieee..Format$GT$14enclose_dyadic17hd30dd3c77562331dE
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $1)
      (local.tee $4
       (i32.load offset=32
        (local.get $1)
       )
      )
      (local.get $2)
     )
     (br_if $label$2
      (i32.eqz
       (i32.load8_u offset=8
        (local.get $3)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=9
       (local.get $3)
      )
     )
     (i64.store
      (local.get $0)
      (i64.const 2)
     )
     (i32.store8 offset=8
      (local.get $0)
      (local.get $1)
     )
     (br $label$1)
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load offset=16
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6dyadic45_$LT$impl$u20$hyperinterval..ieee..Format$GT$14enclose_dyadic17hd30dd3c77562331dE
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (i32.add
     (local.get $1)
     (i32.const 16)
    )
    (local.get $4)
    (local.get $2)
   )
   (block $label$4
    (br_if $label$4
     (i32.ne
      (i32.load8_u offset=8
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (local.set $6
    (i64.load offset=24
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h7933c229426a0f96E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $5)
   )
   (block $label$5
    (br_if $label$5
     (i32.ne
      (i32.load8_u offset=8
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load offset=16
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h7933c229426a0f96E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $6)
   )
   (block $label$6
    (br_if $label$6
     (i32.ne
      (i32.load8_u offset=8
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (block $label$7
    (br_if $label$7
     (i64.le_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $5)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $5)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $6
          (i64.load offset=16
           (local.get $3)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $6)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $6)
        (i64.const 0)
       )
      )
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (i32.const 1)
    )
    (br $label$1)
   )
   (i64.store offset=16
    (local.get $0)
    (local.get $6)
   )
   (i64.store offset=8
    (local.get $0)
    (local.get $5)
   )
   (i64.store
    (local.get $0)
    (i64.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format6finite17h7933c229426a0f96E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.eq
      (i64.and
       (local.get $3)
       (local.get $2)
      )
      (local.get $2)
     )
    )
    (br_if $label$1
     (i64.eqz
      (local.get $1)
     )
    )
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (i64.eqz
         (i64.and
          (local.get $3)
          (i64.add
           (local.get $1)
           (i64.const -1)
          )
         )
        )
       )
      )
      (i64.store offset=8
       (local.get $0)
       (i64.const 0)
      )
      (br $label$3)
     )
     (i64.store offset=8
      (local.get $0)
      (local.get $3)
     )
    )
    (i32.store8
     (local.get $0)
     (i32.const 0)
    )
    (return)
   )
   (i32.store8 offset=1
    (local.get $0)
    (i32.const 0)
   )
   (i32.store8
    (local.get $0)
    (i32.const 1)
   )
   (return)
  )
  (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
   (i32.const 1050516)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval4ieee6Format6encode17h5bdb46e096314ee3E.llvm.17436746034915951627 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i64.ne
       (i64.or
        (local.get $2)
        (local.get $3)
       )
       (i64.const 0)
      )
     )
     (i64.store offset=8
      (local.get $0)
      (i64.const 0)
     )
     (br $label$2)
    )
    (block $label$4
     (block $label$5
      (block $label$6
       (block $label$7
        (block $label$8
         (br_if $label$8
          (i32.xor
           (i32.lt_s
            (local.tee $6
             (i32.xor
              (i32.wrap_i64
               (select
                (i64.clz
                 (local.get $3)
                )
                (i64.add
                 (i64.clz
                  (local.get $2)
                 )
                 (i64.const 64)
                )
                (i64.ne
                 (local.get $3)
                 (i64.const 0)
                )
               )
              )
              (i32.const 127)
             )
            )
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $7
             (i32.add
              (local.get $4)
              (local.get $6)
             )
            )
            (local.get $4)
           )
          )
         )
         (block $label$9
          (br_if $label$9
           (i64.ge_u
            (local.tee $8
             (i64.ctz
              (local.get $1)
             )
            )
            (i64.const 64)
           )
          )
          (br_if $label$7
           (i32.gt_s
            (local.get $7)
            (local.tee $9
             (i32.wrap_i64
              (i64.shr_u
               (i64.shr_u
                (local.get $1)
                (local.get $8)
               )
               (i64.const 1)
              )
             )
            )
           )
          )
          (br_if $label$6
           (i32.xor
            (i32.gt_s
             (local.get $9)
             (i32.const 0)
            )
            (i32.lt_s
             (local.tee $10
              (i32.sub
               (i32.const 1)
               (local.get $9)
              )
             )
             (i32.const 1)
            )
           )
          )
          (local.set $11
           (i32.wrap_i64
            (local.get $8)
           )
          )
          (block $label$10
           (block $label$11
            (block $label$12
             (block $label$13
              (block $label$14
               (br_if $label$14
                (i32.lt_s
                 (local.get $7)
                 (local.get $10)
                )
               )
               (br_if $label$13
                (i32.le_u
                 (local.get $6)
                 (local.get $11)
                )
               )
               (call $__lshrti3
                (i32.add
                 (local.get $5)
                 (i32.const 16)
                )
                (local.get $2)
                (local.get $3)
                (i32.sub
                 (local.get $6)
                 (local.get $11)
                )
               )
               (local.set $3
                (i64.load offset=16
                 (local.get $5)
                )
               )
               (br $label$12)
              )
              (br_if $label$5
               (i32.ne
                (i32.gt_s
                 (local.get $11)
                 (i32.const 0)
                )
                (i32.lt_s
                 (local.tee $7
                  (i32.sub
                   (local.get $10)
                   (local.get $11)
                  )
                 )
                 (local.get $10)
                )
               )
              )
              (br_if $label$11
               (i32.xor
                (i32.gt_s
                 (local.get $7)
                 (i32.const 0)
                )
                (i32.lt_s
                 (local.tee $7
                  (i32.sub
                   (local.get $4)
                   (local.get $7)
                  )
                 )
                 (local.get $4)
                )
               )
              )
              (br_if $label$10
               (i32.ge_u
                (local.get $7)
                (i32.const 128)
               )
              )
              (call $__ashlti3
               (local.get $5)
               (local.get $2)
               (local.get $3)
               (local.get $7)
              )
              (i64.store offset=8
               (local.get $0)
               (i64.load
                (local.get $5)
               )
              )
              (br $label$2)
             )
             (call $__ashlti3
              (i32.add
               (local.get $5)
               (i32.const 32)
              )
              (local.get $2)
              (local.get $3)
              (i32.sub
               (local.get $11)
               (local.get $6)
              )
             )
             (local.set $3
              (i64.load offset=32
               (local.get $5)
              )
             )
            )
            (local.set $4
             (i32.const 0)
            )
            (br_if $label$4
             (i32.ne
              (i32.lt_s
               (local.get $9)
               (i32.const 0)
              )
              (i32.lt_s
               (local.tee $6
                (i32.add
                 (local.get $7)
                 (local.get $9)
                )
               )
               (local.get $7)
              )
             )
            )
            (i64.store offset=8
             (local.get $0)
             (i64.or
              (i64.and
               (local.get $3)
               (i64.xor
                (i64.shl
                 (i64.const -1)
                 (local.get $8)
                )
                (i64.const -1)
               )
              )
              (i64.shl
               (i64.extend_i32_s
                (local.get $6)
               )
               (local.get $8)
              )
             )
            )
            (br $label$1)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
            (i32.const 1050580)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
           (i32.const 1050596)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
          (i32.const 1050612)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
         (i32.const 1050532)
        )
        (unreachable)
       )
       (i32.store8 offset=1
        (local.get $0)
        (i32.const 5)
       )
       (local.set $4
        (i32.const 1)
       )
       (br $label$1)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
       (i32.const 1050548)
      )
      (unreachable)
     )
     (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
      (i32.const 1050628)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
     (i32.const 1050564)
    )
    (unreachable)
   )
   (local.set $4
    (i32.const 0)
   )
  )
  (i32.store8
   (local.get $0)
   (local.get $4)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 48)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6dyadic45_$LT$impl$u20$hyperinterval..ieee..Format$GT$14enclose_dyadic17hd30dd3c77562331dE (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (global.set $__stack_pointer
   (local.tee $6
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 80)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (block $label$10
            (block $label$11
             (block $label$12
              (block $label$13
               (block $label$14
                (block $label$15
                 (block $label$16
                  (block $label$17
                   (br_if $label$17
                    (i32.eq
                     (local.tee $7
                      (i32.load
                       (local.get $3)
                      )
                     )
                     (i32.const -2147483648)
                    )
                   )
                   (br_if $label$16
                    (local.tee $8
                     (i32.load offset=8
                      (local.get $3)
                     )
                    )
                   )
                   (local.set $9
                    (i64.const 0)
                   )
                   (br $label$13)
                  )
                  (br_if $label$15
                   (local.tee $8
                    (i32.load offset=4
                     (local.get $3)
                    )
                   )
                  )
                  (local.set $9
                   (i64.const 0)
                  )
                  (br $label$13)
                 )
                 (local.set $10
                  (i32.clz
                   (i32.load
                    (i32.add
                     (i32.add
                      (i32.load offset=4
                       (local.get $3)
                      )
                      (i32.shl
                       (local.get $8)
                       (i32.const 2)
                      )
                     )
                     (i32.const -4)
                    )
                   )
                  )
                 )
                 (br $label$14)
                )
                (local.set $10
                 (i32.clz
                  (i32.load offset=8
                   (local.get $3)
                  )
                 )
                )
               )
               (br_if $label$12
                (i64.lt_u
                 (local.tee $9
                  (i64.shl
                   (i64.extend_i32_u
                    (local.get $8)
                   )
                   (i64.const 5)
                  )
                 )
                 (local.tee $11
                  (i64.extend_i32_u
                   (local.get $10)
                  )
                 )
                )
               )
               (local.set $9
                (i64.sub
                 (local.get $9)
                 (local.get $11)
                )
               )
              )
              (block $label$18
               (block $label$19
                (block $label$20
                 (br_if $label$20
                  (i64.le_u
                   (local.tee $11
                    (select
                     (local.get $9)
                     (local.tee $11
                      (i64.add
                       (local.tee $12
                        (i64.ctz
                         (local.get $2)
                        )
                       )
                       (i64.const 2)
                      )
                     )
                     (i64.gt_u
                      (local.get $9)
                      (local.get $11)
                     )
                    )
                   )
                   (i64.load
                    (local.get $5)
                   )
                  )
                 )
                 (local.set $3
                  (i32.const 12)
                 )
                 (br $label$19)
                )
                (br_if $label$18
                 (i64.ge_u
                  (local.tee $13
                   (i64.load offset=8
                    (local.get $5)
                   )
                  )
                  (local.tee $11
                   (i64.mul
                    (local.get $11)
                    (i64.const 3)
                   )
                  )
                 )
                )
                (local.set $3
                 (i32.const 11)
                )
               )
               (i32.store8
                (local.get $0)
                (i32.const 1)
               )
               (i32.store8 offset=1
                (local.get $0)
                (local.get $3)
               )
               (br $label$1)
              )
              (i64.store offset=8
               (local.get $5)
               (i64.sub
                (local.get $13)
                (local.get $11)
               )
              )
              (block $label$21
               (br_if $label$21
                (i64.ne
                 (local.get $9)
                 (i64.const 0)
                )
               )
               (i64.store offset=8
                (local.get $0)
                (i64.const 0)
               )
               (i32.store8
                (local.get $0)
                (i32.const 0)
               )
               (i64.store
                (i32.add
                 (local.get $0)
                 (i32.const 16)
                )
                (i64.const 0)
               )
               (br $label$1)
              )
              (br_if $label$11
               (i64.ge_u
                (local.get $12)
                (i64.const 64)
               )
              )
              (br_if $label$8
               (select
                (i64.gt_u
                 (local.tee $14
                  (i64.add
                   (local.tee $11
                    (i64.add
                     (local.get $9)
                     (local.tee $13
                      (i64.extend_i32_s
                       (local.get $4)
                      )
                     )
                    )
                   )
                   (i64.const -1)
                  )
                 )
                 (local.tee $16
                  (i64.extend32_s
                   (local.tee $15
                    (i64.shr_u
                     (i64.shr_u
                      (local.get $2)
                      (local.get $12)
                     )
                     (i64.const 1)
                    )
                   )
                  )
                 )
                )
                (i64.gt_s
                 (local.tee $9
                  (i64.sub
                   (local.tee $17
                    (i64.add
                     (i64.shr_s
                      (local.get $13)
                      (i64.const 63)
                     )
                     (i64.extend_i32_u
                      (i64.lt_u
                       (local.get $11)
                       (local.get $9)
                      )
                     )
                    )
                   )
                   (i64.extend_i32_u
                    (i64.eqz
                     (local.get $11)
                    )
                   )
                  )
                 )
                 (local.tee $16
                  (i64.shr_s
                   (local.get $16)
                   (i64.const 63)
                  )
                 )
                )
                (i64.eq
                 (local.get $9)
                 (local.get $16)
                )
               )
              )
              (br_if $label$10
               (i32.xor
                (i32.gt_s
                 (local.tee $5
                  (i32.wrap_i64
                   (local.get $15)
                  )
                 )
                 (i32.const 0)
                )
                (i32.lt_s
                 (local.tee $5
                  (i32.sub
                   (i32.const 1)
                   (local.get $5)
                  )
                 )
                 (i32.const 1)
                )
               )
              )
              (br_if $label$9
               (i32.xor
                (i32.gt_s
                 (local.tee $8
                  (i32.wrap_i64
                   (local.get $12)
                  )
                 )
                 (i32.const 0)
                )
                (i32.lt_s
                 (local.tee $4
                  (i32.sub
                   (local.get $5)
                   (local.get $8)
                  )
                 )
                 (local.get $5)
                )
               )
              )
              (local.set $10
               (i32.load8_u offset=12
                (local.get $3)
               )
              )
              (block $label$22
               (block $label$23
                (block $label$24
                 (block $label$25
                  (block $label$26
                   (block $label$27
                    (br_if $label$27
                     (i32.eqz
                      (select
                       (i64.gt_u
                        (local.get $11)
                        (local.tee $9
                         (i64.extend_i32_s
                          (local.get $4)
                         )
                        )
                       )
                       (i64.gt_s
                        (local.get $17)
                        (local.tee $9
                         (i64.shr_s
                          (local.get $9)
                          (i64.const 63)
                         )
                        )
                       )
                       (i64.eq
                        (local.get $17)
                        (local.get $9)
                       )
                      )
                     )
                    )
                    (br_if $label$26
                     (i32.xor
                      (i32.gt_s
                       (local.get $8)
                       (i32.const 0)
                      )
                      (i32.lt_s
                       (local.tee $5
                        (i32.sub
                         (local.tee $18
                          (i32.wrap_i64
                           (local.get $14)
                          )
                         )
                         (local.get $8)
                        )
                       )
                       (local.get $18)
                      )
                     )
                    )
                    (br_if $label$22
                     (i64.gt_s
                      (local.tee $12
                       (i64.sub
                        (i64.extend_i32_s
                         (local.tee $18
                          (select
                           (local.get $5)
                           (local.get $4)
                           (i32.gt_s
                            (local.get $5)
                            (local.get $4)
                           )
                          )
                         )
                        )
                        (local.get $13)
                       )
                      )
                      (i64.const 0)
                     )
                    )
                    (br_if $label$25
                     (i32.ne
                      (local.get $7)
                      (i32.const -2147483648)
                     )
                    )
                    (local.set $9
                     (i64.const 0)
                    )
                    (local.set $11
                     (i64.const 0)
                    )
                    (br_if $label$23
                     (i32.ne
                      (i32.load offset=4
                       (local.get $3)
                      )
                      (i32.const 1)
                     )
                    )
                    (local.set $8
                     (i32.add
                      (local.get $3)
                      (i32.const 12)
                     )
                    )
                    (local.set $3
                     (i32.add
                      (local.get $3)
                      (i32.const 8)
                     )
                    )
                    (br $label$24)
                   )
                   (i32.store8
                    (local.get $0)
                    (i32.const 0)
                   )
                   (i64.store offset=8
                    (local.get $0)
                    (select
                     (i64.const 0)
                     (i64.xor
                      (local.get $1)
                      (i64.const 1)
                     )
                     (local.tee $3
                      (i32.and
                       (local.get $10)
                       (i32.const 255)
                      )
                     )
                    )
                   )
                   (i64.store offset=16
                    (local.get $0)
                    (i64.extend_i32_u
                     (i32.ne
                      (local.get $3)
                      (i32.const 0)
                     )
                    )
                   )
                   (br $label$1)
                  )
                  (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
                   (i32.const 1050720)
                  )
                  (unreachable)
                 )
                 (block $label$28
                  (br_if $label$28
                   (local.tee $5
                    (i32.load offset=8
                     (local.get $3)
                    )
                   )
                  )
                  (local.set $9
                   (i64.const 0)
                  )
                  (local.set $11
                   (i64.const 0)
                  )
                  (br $label$23)
                 )
                 (br_if $label$7
                  (i32.and
                   (i32.add
                    (local.get $5)
                    (i32.const -1)
                   )
                   (i32.const 1073741820)
                  )
                 )
                 (local.set $8
                  (i32.add
                   (local.tee $3
                    (i32.load offset=4
                     (local.get $3)
                    )
                   )
                   (i32.shl
                    (local.get $5)
                    (i32.const 2)
                   )
                  )
                 )
                )
                (local.set $5
                 (i32.const 0)
                )
                (local.set $9
                 (i64.const 0)
                )
                (local.set $11
                 (i64.const 0)
                )
                (loop $label$29
                 (call $__ashlti3
                  (i32.add
                   (local.get $6)
                   (i32.const 32)
                  )
                  (i64.load32_u
                   (local.get $3)
                  )
                  (i64.const 0)
                  (i32.and
                   (local.get $5)
                   (i32.const 255)
                  )
                 )
                 (local.set $5
                  (i32.add
                   (local.get $5)
                   (i32.const 32)
                  )
                 )
                 (local.set $11
                  (i64.or
                   (i64.load offset=40
                    (local.get $6)
                   )
                   (local.get $11)
                  )
                 )
                 (local.set $9
                  (i64.or
                   (i64.load offset=32
                    (local.get $6)
                   )
                   (local.get $9)
                  )
                 )
                 (br_if $label$29
                  (i32.ne
                   (local.tee $3
                    (i32.add
                     (local.get $3)
                     (i32.const 4)
                    )
                   )
                   (local.get $8)
                  )
                 )
                )
               )
               (br_if $label$6
                (i64.ge_u
                 (local.tee $12
                  (i64.sub
                   (i64.const 0)
                   (local.get $12)
                  )
                 )
                 (i64.const 128)
                )
               )
               (call $__ashlti3
                (i32.add
                 (local.get $6)
                 (i32.const 16)
                )
                (local.get $9)
                (local.get $11)
                (i32.wrap_i64
                 (local.get $12)
                )
               )
               (local.set $3
                (i32.const 0)
               )
               (local.set $11
                (i64.load offset=24
                 (local.get $6)
                )
               )
               (local.set $9
                (i64.load offset=16
                 (local.get $6)
                )
               )
               (br $label$2)
              )
              (i32.store offset=64
               (local.get $6)
               (i32.const -2147483647)
              )
              (i32.store offset=68
               (local.get $6)
               (local.get $3)
              )
              (block $label$30
               (block $label$31
                (br_if $label$31
                 (i32.eq
                  (local.get $7)
                  (i32.const -2147483648)
                 )
                )
                (br_if $label$30
                 (i32.eqz
                  (i32.load offset=8
                   (local.get $3)
                  )
                 )
                )
                (br $label$5)
               )
               (br_if $label$5
                (i32.load offset=4
                 (local.get $3)
                )
               )
              )
              (local.set $9
               (i64.const 0)
              )
              (local.set $11
               (i64.const 0)
              )
              (br $label$4)
             )
             (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
              (i32.const 1050432)
             )
             (unreachable)
            )
            (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
             (i32.const 1050612)
            )
            (unreachable)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
            (i32.const 1050628)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
           (i32.const 1050628)
          )
          (unreachable)
         )
         (i32.store16
          (local.get $0)
          (i32.const 1281)
         )
         (br $label$1)
        )
        (call $_ZN4core6option13expect_failed17hf57fb2c2bc253385E
         (i32.const 1050736)
         (i32.const 46)
         (i32.const 1050784)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
        (i32.const 1050800)
       )
       (unreachable)
      )
      (call $_ZN10num_bigint7biguint5shift12biguint_shr217hb02301f24d4fb4a3E
       (i32.add
        (local.get $6)
        (i32.const 52)
       )
       (i32.add
        (local.get $6)
        (i32.const 64)
       )
       (i32.shr_u
        (local.tee $5
         (i32.wrap_i64
          (local.get $12)
         )
        )
        (i32.const 5)
       )
       (i32.and
        (local.get $5)
        (i32.const 31)
       )
      )
      (block $label$32
       (block $label$33
        (block $label$34
         (br_if $label$34
          (i32.ne
           (local.tee $7
            (i32.load offset=52
             (local.get $6)
            )
           )
           (i32.const -2147483648)
          )
         )
         (local.set $9
          (i64.const 0)
         )
         (local.set $11
          (i64.const 0)
         )
         (br_if $label$4
          (i32.eqz
           (i32.and
            (i32.load offset=56
             (local.get $6)
            )
            (i32.const 1)
           )
          )
         )
         (local.set $4
          (i32.add
           (local.get $6)
           (i32.const 64)
          )
         )
         (local.set $5
          (i32.add
           (local.get $6)
           (i32.const 60)
          )
         )
         (br $label$33)
        )
        (block $label$35
         (br_if $label$35
          (local.tee $8
           (i32.load offset=60
            (local.get $6)
           )
          )
         )
         (local.set $9
          (i64.const 0)
         )
         (local.set $11
          (i64.const 0)
         )
         (br $label$32)
        )
        (br_if $label$3
         (i32.and
          (i32.add
           (local.get $8)
           (i32.const -1)
          )
          (i32.const 1073741820)
         )
        )
        (local.set $4
         (i32.add
          (local.tee $5
           (i32.load offset=56
            (local.get $6)
           )
          )
          (i32.shl
           (local.get $8)
           (i32.const 2)
          )
         )
        )
       )
       (local.set $8
        (i32.const 0)
       )
       (local.set $9
        (i64.const 0)
       )
       (local.set $11
        (i64.const 0)
       )
       (loop $label$36
        (call $__ashlti3
         (local.get $6)
         (i64.load32_u
          (local.get $5)
         )
         (i64.const 0)
         (i32.and
          (local.get $8)
          (i32.const 255)
         )
        )
        (local.set $8
         (i32.add
          (local.get $8)
          (i32.const 32)
         )
        )
        (local.set $11
         (i64.or
          (i64.load offset=8
           (local.get $6)
          )
          (local.get $11)
         )
        )
        (local.set $9
         (i64.or
          (i64.load
           (local.get $6)
          )
          (local.get $9)
         )
        )
        (br_if $label$36
         (i32.ne
          (local.tee $5
           (i32.add
            (local.get $5)
            (i32.const 4)
           )
          )
          (local.get $4)
         )
        )
       )
       (br_if $label$4
        (i32.eq
         (local.get $7)
         (i32.const -2147483648)
        )
       )
      )
      (br_if $label$4
       (i32.eqz
        (local.get $7)
       )
      )
      (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
       (i32.load offset=56
        (local.get $6)
       )
       (i32.shl
        (local.get $7)
        (i32.const 2)
       )
       (i32.const 4)
      )
     )
     (call $_ZN10num_bigint7biguint7BigUint14trailing_zeros17h4c93a5380182238cE
      (i32.add
       (local.get $6)
       (i32.const 64)
      )
      (local.get $3)
     )
     (block $label$37
      (br_if $label$37
       (i32.eqz
        (i32.load offset=64
         (local.get $6)
        )
       )
      )
      (local.set $3
       (i64.lt_u
        (i64.load offset=72
         (local.get $6)
        )
        (i64.and
         (local.get $12)
         (i64.const 4294967295)
        )
       )
      )
      (br $label$2)
     )
     (call $_ZN4core6option13expect_failed17hf57fb2c2bc253385E
      (i32.const 1050880)
      (i32.const 17)
      (i32.const 1050900)
     )
     (unreachable)
    )
    (call $_ZN4core6option13expect_failed17hf57fb2c2bc253385E
     (i32.const 1050816)
     (i32.const 45)
     (i32.const 1050864)
    )
    (unreachable)
   )
   (call $_ZN13hyperinterval4ieee6Format6encode17h5bdb46e096314ee3E.llvm.17436746034915951627
    (i32.add
     (local.get $6)
     (i32.const 64)
    )
    (local.get $2)
    (local.get $9)
    (local.get $11)
    (local.get $18)
   )
   (block $label$38
    (br_if $label$38
     (i32.load8_u offset=64
      (local.get $6)
     )
    )
    (block $label$39
     (br_if $label$39
      (select
       (local.tee $3
        (i64.lt_u
         (local.tee $12
          (i64.add
           (local.get $9)
           (i64.extend_i32_u
            (local.get $3)
           )
          )
         )
         (local.get $9)
        )
       )
       (i64.lt_u
        (local.tee $13
         (i64.add
          (local.get $11)
          (i64.extend_i32_u
           (local.get $3)
          )
         )
        )
        (local.get $11)
       )
       (i64.ge_u
        (local.get $12)
        (local.get $9)
       )
      )
     )
     (local.set $9
      (i64.load offset=72
       (local.get $6)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6encode17h5bdb46e096314ee3E.llvm.17436746034915951627
      (i32.add
       (local.get $6)
       (i32.const 64)
      )
      (local.get $2)
      (local.get $12)
      (local.get $13)
      (local.get $18)
     )
     (br_if $label$38
      (i32.load8_u offset=64
       (local.get $6)
      )
     )
     (local.set $2
      (i64.load offset=72
       (local.get $6)
      )
     )
     (block $label$40
      (block $label$41
       (br_if $label$41
        (i32.eqz
         (i32.and
          (local.get $10)
          (i32.const 255)
         )
        )
       )
       (local.set $11
        (local.get $2)
       )
       (br $label$40)
      )
      (local.set $11
       (select
        (i64.const 0)
        (i64.xor
         (local.get $9)
         (local.get $1)
        )
        (i64.eqz
         (local.get $9)
        )
       )
      )
      (local.set $9
       (select
        (i64.const 0)
        (i64.xor
         (local.get $2)
         (local.get $1)
        )
        (i64.eqz
         (local.get $2)
        )
       )
      )
     )
     (i64.store offset=16
      (local.get $0)
      (local.get $11)
     )
     (i64.store offset=8
      (local.get $0)
      (local.get $9)
     )
     (i32.store8
      (local.get $0)
      (i32.const 0)
     )
     (br $label$1)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
     (i32.const 1050916)
    )
    (unreachable)
   )
   (local.set $3
    (i32.load8_u offset=65
     (local.get $6)
    )
   )
   (i32.store8
    (local.get $0)
    (i32.const 1)
   )
   (i32.store8 offset=1
    (local.get $0)
    (local.get $3)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $6)
    (i32.const 80)
   )
  )
 )
 (func $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$3new17hf1b5b015161a97c1E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.ne
         (local.tee $4
          (i32.load8_u offset=12
           (local.get $1)
          )
         )
         (local.tee $5
          (i32.load8_u offset=12
           (local.get $2)
          )
         )
        )
       )
       (block $label$6
        (block $label$7
         (br_table $label$7 $label$2 $label$6 $label$7
          (local.get $4)
         )
        )
        (block $label$8
         (block $label$9
          (br_if $label$9
           (i32.eq
            (i32.load
             (local.get $2)
            )
            (i32.const -2147483648)
           )
          )
          (local.set $4
           (i32.load offset=8
            (local.get $2)
           )
          )
          (local.set $6
           (i32.load offset=4
            (local.get $2)
           )
          )
          (br $label$8)
         )
         (local.set $4
          (i32.const 1)
         )
         (block $label$10
          (br_if $label$10
           (i32.eq
            (i32.load offset=4
             (local.get $2)
            )
            (i32.const 1)
           )
          )
          (local.set $6
           (i32.const 4)
          )
          (local.set $4
           (i32.const 0)
          )
          (br $label$8)
         )
         (local.set $6
          (i32.add
           (local.get $2)
           (i32.const 8)
          )
         )
        )
        (block $label$11
         (block $label$12
          (br_if $label$12
           (i32.eq
            (i32.load
             (local.get $1)
            )
            (i32.const -2147483648)
           )
          )
          (local.set $5
           (i32.load offset=8
            (local.get $1)
           )
          )
          (local.set $7
           (i32.load offset=4
            (local.get $1)
           )
          )
          (br $label$11)
         )
         (local.set $5
          (i32.const 1)
         )
         (block $label$13
          (br_if $label$13
           (i32.eq
            (i32.load offset=4
             (local.get $1)
            )
            (i32.const 1)
           )
          )
          (local.set $7
           (i32.const 4)
          )
          (local.set $5
           (i32.const 0)
          )
          (br $label$11)
         )
         (local.set $7
          (i32.add
           (local.get $1)
           (i32.const 8)
          )
         )
        )
        (block $label$14
         (br_if $label$14
          (i32.ne
           (local.get $4)
           (local.get $5)
          )
         )
         (local.set $8
          (i32.add
           (local.get $6)
           (i32.const -4)
          )
         )
         (local.set $4
          (i32.shl
           (local.get $4)
           (i32.const 2)
          )
         )
         (local.set $7
          (i32.add
           (local.get $7)
           (i32.const -4)
          )
         )
         (loop $label$15
          (br_if $label$2
           (i32.eqz
            (local.get $4)
           )
          )
          (local.set $5
           (i32.add
            (local.get $7)
            (local.get $4)
           )
          )
          (local.set $6
           (i32.add
            (local.get $8)
            (local.get $4)
           )
          )
          (local.set $4
           (i32.add
            (local.get $4)
            (i32.const -4)
           )
          )
          (br_if $label$15
           (i32.eq
            (local.tee $6
             (i32.load
              (local.get $6)
             )
            )
            (local.tee $5
             (i32.load
              (local.get $5)
             )
            )
           )
          )
         )
         (br_if $label$2
          (i32.le_u
           (local.get $6)
           (local.get $5)
          )
         )
         (br $label$3)
        )
        (br_if $label$2
         (i32.le_u
          (local.get $4)
          (local.get $5)
         )
        )
        (br $label$3)
       )
       (block $label$16
        (block $label$17
         (br_if $label$17
          (i32.eq
           (i32.load
            (local.get $1)
           )
           (i32.const -2147483648)
          )
         )
         (local.set $4
          (i32.load offset=8
           (local.get $1)
          )
         )
         (local.set $6
          (i32.load offset=4
           (local.get $1)
          )
         )
         (br $label$16)
        )
        (local.set $4
         (i32.const 1)
        )
        (block $label$18
         (br_if $label$18
          (i32.eq
           (i32.load offset=4
            (local.get $1)
           )
           (i32.const 1)
          )
         )
         (local.set $6
          (i32.const 4)
         )
         (local.set $4
          (i32.const 0)
         )
         (br $label$16)
        )
        (local.set $6
         (i32.add
          (local.get $1)
          (i32.const 8)
         )
        )
       )
       (block $label$19
        (block $label$20
         (br_if $label$20
          (i32.eq
           (i32.load
            (local.get $2)
           )
           (i32.const -2147483648)
          )
         )
         (local.set $5
          (i32.load offset=8
           (local.get $2)
          )
         )
         (local.set $7
          (i32.load offset=4
           (local.get $2)
          )
         )
         (br $label$19)
        )
        (local.set $5
         (i32.const 1)
        )
        (block $label$21
         (br_if $label$21
          (i32.eq
           (i32.load offset=4
            (local.get $2)
           )
           (i32.const 1)
          )
         )
         (local.set $7
          (i32.const 4)
         )
         (local.set $5
          (i32.const 0)
         )
         (br $label$19)
        )
        (local.set $7
         (i32.add
          (local.get $2)
          (i32.const 8)
         )
        )
       )
       (br_if $label$4
        (i32.ne
         (local.get $4)
         (local.get $5)
        )
       )
       (local.set $8
        (i32.add
         (local.get $6)
         (i32.const -4)
        )
       )
       (local.set $4
        (i32.shl
         (local.get $4)
         (i32.const 2)
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const -4)
        )
       )
       (loop $label$22
        (br_if $label$2
         (i32.eqz
          (local.get $4)
         )
        )
        (local.set $5
         (i32.add
          (local.get $7)
          (local.get $4)
         )
        )
        (local.set $6
         (i32.add
          (local.get $8)
          (local.get $4)
         )
        )
        (local.set $4
         (i32.add
          (local.get $4)
          (i32.const -4)
         )
        )
        (br_if $label$22
         (i32.eq
          (local.tee $6
           (i32.load
            (local.get $6)
           )
          )
          (local.tee $5
           (i32.load
            (local.get $5)
           )
          )
         )
        )
       )
       (br_if $label$3
        (i32.gt_u
         (local.get $6)
         (local.get $5)
        )
       )
       (br $label$2)
      )
      (br_if $label$2
       (i32.le_u
        (local.get $4)
        (local.get $5)
       )
      )
      (br $label$3)
     )
     (br_if $label$2
      (i32.le_u
       (local.get $4)
       (local.get $5)
      )
     )
    )
    (i32.store8 offset=4
     (local.get $0)
     (i32.const 1)
    )
    (i32.store
     (local.get $0)
     (i32.const -2147483647)
    )
    (block $label$23
     (br_if $label$23
      (i32.eq
       (local.tee $4
        (i32.load
         (local.get $2)
        )
       )
       (i32.const -2147483648)
      )
     )
     (br_if $label$23
      (i32.eqz
       (local.get $4)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (i32.load offset=4
       (local.get $2)
      )
      (i32.shl
       (local.get $4)
       (i32.const 2)
      )
      (i32.const 4)
     )
    )
    (br_if $label$1
     (i32.eq
      (local.tee $4
       (i32.load
        (local.get $1)
       )
      )
      (i32.const -2147483648)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $4)
     )
    )
    (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
     (i32.load offset=4
      (local.get $1)
     )
     (i32.shl
      (local.get $4)
      (i32.const 2)
     )
     (i32.const 4)
    )
    (br $label$1)
   )
   (i64.store align=4
    (local.get $0)
    (i64.load align=4
     (local.get $1)
    )
   )
   (i64.store align=4
    (i32.add
     (local.get $0)
     (i32.const 16)
    )
    (i64.load align=4
     (local.get $2)
    )
   )
   (i64.store align=4
    (i32.add
     (local.get $0)
     (i32.const 8)
    )
    (i64.load align=4
     (i32.add
      (local.get $1)
      (i32.const 8)
     )
    )
   )
   (i64.store align=4
    (i32.add
     (local.get $0)
     (i32.const 24)
    )
    (i64.load align=4
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
 )
 (func $_ZN10num_bigint9big_digit9BigDigits9normalize17h1e853a296515931aE.llvm.7687345245192427019 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eq
        (local.tee $2
         (i32.load
          (local.get $0)
         )
        )
        (i32.const -2147483648)
       )
      )
      (br_if $label$3
       (local.tee $3
        (i32.load offset=8
         (local.get $0)
        )
       )
      )
      (local.set $3
       (i32.const 0)
      )
      (br $label$2)
     )
     (br_if $label$1
      (i32.ne
       (i32.load offset=4
        (local.get $0)
       )
       (i32.const 1)
      )
     )
     (br_if $label$1
      (i32.load offset=8
       (local.get $0)
      )
     )
     (i32.store offset=4
      (local.get $0)
      (i32.const 0)
     )
     (br $label$1)
    )
    (br_if $label$2
     (i32.load
      (i32.add
       (i32.add
        (local.tee $4
         (i32.load offset=4
          (local.get $0)
         )
        )
        (local.tee $5
         (i32.shl
          (local.get $3)
          (i32.const 2)
         )
        )
       )
       (i32.const -4)
      )
     )
    )
    (local.set $6
     (i32.add
      (local.get $4)
      (i32.const -4)
     )
    )
    (local.set $4
     (i32.and
      (local.get $3)
      (i32.const 1073741823)
     )
    )
    (block $label$5
     (loop $label$6
      (block $label$7
       (br_if $label$7
        (local.get $5)
       )
       (local.set $5
        (i32.const 0)
       )
       (br $label$5)
      )
      (local.set $4
       (i32.add
        (local.get $4)
        (i32.const -1)
       )
      )
      (local.set $7
       (i32.add
        (local.get $6)
        (local.get $5)
       )
      )
      (local.set $5
       (i32.add
        (local.get $5)
        (i32.const -4)
       )
      )
      (br_if $label$6
       (i32.eqz
        (i32.load
         (local.get $7)
        )
       )
      )
     )
     (br_if $label$2
      (i32.gt_u
       (local.tee $5
        (i32.add
         (local.get $4)
         (i32.const 1)
        )
       )
       (local.get $3)
      )
     )
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $5)
    )
    (local.set $3
     (local.get $5)
    )
   )
   (br_if $label$1
    (i32.ge_u
     (local.get $3)
     (i32.shr_u
      (local.get $2)
      (i32.const 1)
     )
    )
   )
   (block $label$8
    (block $label$9
     (block $label$10
      (br_table $label$10 $label$9 $label$8
       (local.get $3)
      )
     )
     (block $label$11
      (br_if $label$11
       (i32.eqz
        (local.get $2)
       )
      )
      (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
       (i32.load offset=4
        (local.get $0)
       )
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
       (i32.const 4)
      )
     )
     (i32.store
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
      (i32.load offset=1051084
       (i32.const 0)
      )
     )
     (i64.store align=4
      (local.get $0)
      (i64.load offset=1051076 align=4
       (i32.const 0)
      )
     )
     (br $label$1)
    )
    (local.set $5
     (i32.load
      (local.tee $4
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
    )
    (block $label$12
     (br_if $label$12
      (i32.eqz
       (local.get $2)
      )
     )
     (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
      (local.get $4)
      (i32.shl
       (local.get $2)
       (i32.const 2)
      )
      (i32.const 4)
     )
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $5)
    )
    (i64.store align=4
     (local.get $0)
     (i64.const 6442450944)
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.le_u
     (local.get $2)
     (local.tee $5
      (i32.add
       (local.get $3)
       (i32.const 1)
      )
     )
    )
   )
   (block $label$13
    (br_if $label$13
     (i32.gt_u
      (local.get $3)
      (local.get $2)
     )
    )
    (block $label$14
     (br_if $label$14
      (i32.eqz
       (local.tee $4
        (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_realloc
         (i32.load offset=4
          (local.get $0)
         )
         (i32.shl
          (local.get $2)
          (i32.const 2)
         )
         (i32.const 4)
         (local.tee $7
          (i32.shl
           (local.get $5)
           (i32.const 2)
          )
         )
        )
       )
      )
     )
     (i32.store
      (local.get $0)
      (local.get $5)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $4)
     )
     (br $label$1)
    )
    (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
     (i32.const 4)
     (local.get $7)
     (i32.const 1051184)
    )
    (unreachable)
   )
   (i32.store offset=24
    (local.get $1)
    (i32.const 0)
   )
   (i32.store offset=12
    (local.get $1)
    (i32.const 1)
   )
   (i32.store offset=8
    (local.get $1)
    (i32.const 1051580)
   )
   (i64.store offset=16 align=4
    (local.get $1)
    (i64.const 4)
   )
   (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
    (i32.add
     (local.get $1)
     (i32.const 8)
    )
    (i32.const 1051668)
   )
   (unreachable)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZN10num_bigint7biguint11subtraction97_$LT$impl$u20$core..ops..arith..SubAssign$LT$u32$GT$$u20$for$u20$num_bigint..biguint..BigUint$GT$10sub_assign17hf6c4bf2372622459E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.ne
         (i32.load
          (local.get $0)
         )
         (i32.const -2147483648)
        )
       )
       (block $label$6
        (br_if $label$6
         (i32.load offset=4
          (local.get $0)
         )
        )
        (i32.store offset=4
         (local.get $2)
         (local.get $1)
        )
        (local.set $3
         (i32.const 0)
        )
        (br $label$3)
       )
       (i32.store offset=4
        (local.get $2)
        (local.get $1)
       )
       (local.set $4
        (i32.add
         (local.get $0)
         (i32.const 12)
        )
       )
       (local.set $5
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
       )
       (local.set $6
        (i32.const 1)
       )
       (br $label$4)
      )
      (local.set $5
       (i32.load offset=4
        (local.get $0)
       )
      )
      (local.set $6
       (i32.load offset=8
        (local.get $0)
       )
      )
      (i32.store offset=4
       (local.get $2)
       (local.get $1)
      )
      (local.set $3
       (i32.const 0)
      )
      (br_if $label$3
       (i32.eqz
        (local.get $6)
       )
      )
      (local.set $4
       (i32.add
        (local.get $5)
        (i32.shl
         (i32.ne
          (local.get $6)
          (i32.const 0)
         )
         (i32.const 2)
        )
       )
      )
     )
     (i32.store
      (local.get $5)
      (i32.sub
       (local.tee $7
        (i32.load
         (local.get $5)
        )
       )
       (local.get $1)
      )
     )
     (local.set $3
      (i32.const 4)
     )
     (br_if $label$3
      (i32.ge_u
       (local.get $7)
       (local.get $1)
      )
     )
     (local.set $5
      (i32.add
       (local.get $5)
       (i32.shl
        (local.get $6)
        (i32.const 2)
       )
      )
     )
     (loop $label$7
      (br_if $label$2
       (i32.eq
        (local.get $4)
        (local.get $5)
       )
      )
      (i32.store
       (local.get $4)
       (i32.add
        (local.tee $1
         (i32.load
          (local.get $4)
         )
        )
        (i32.const -1)
       )
      )
      (local.set $3
       (i32.const 4)
      )
      (local.set $4
       (i32.add
        (local.get $4)
        (i32.const 4)
       )
      )
      (br_if $label$7
       (i32.eqz
        (local.get $1)
       )
      )
     )
    )
    (loop $label$8
     (br_if $label$1
      (i32.eq
       (local.get $3)
       (i32.const 4)
      )
     )
     (local.set $4
      (i32.add
       (i32.add
        (local.get $2)
        (i32.const 4)
       )
       (local.get $3)
      )
     )
     (local.set $3
      (i32.add
       (local.get $3)
       (i32.const 4)
      )
     )
     (br_if $label$8
      (i32.eqz
       (i32.load
        (local.get $4)
       )
      )
     )
    )
   )
   (i32.store offset=24
    (local.get $2)
    (i32.const 0)
   )
   (i32.store offset=12
    (local.get $2)
    (i32.const 1)
   )
   (i32.store offset=8
    (local.get $2)
    (i32.const 1051360)
   )
   (i64.store offset=16 align=4
    (local.get $2)
    (i64.const 4)
   )
   (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i32.const 1051368)
   )
   (unreachable)
  )
  (call $_ZN10num_bigint9big_digit9BigDigits9normalize17h1e853a296515931aE.llvm.7687345245192427019
   (local.get $0)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN10num_bigint7biguint7BigUint14trailing_zeros17h4c93a5380182238cE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.ne
       (i32.load
        (local.get $1)
       )
       (i32.const -2147483648)
      )
     )
     (br_if $label$2
      (i32.eq
       (i32.load offset=4
        (local.get $1)
       )
       (i32.const 1)
      )
     )
     (i64.store
      (local.get $0)
      (i64.const 0)
     )
     (return)
    )
    (block $label$4
     (br_if $label$4
      (i32.eqz
       (local.tee $2
        (i32.load offset=8
         (local.get $1)
        )
       )
      )
     )
     (local.set $2
      (i32.add
       (local.tee $1
        (i32.load offset=4
         (local.get $1)
        )
       )
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
      )
     )
     (br $label$1)
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (return)
   )
   (local.set $2
    (i32.add
     (local.get $1)
     (i32.const 12)
    )
   )
   (local.set $1
    (i32.add
     (local.get $1)
     (i32.const 8)
    )
   )
  )
  (local.set $3
   (i64.const 0)
  )
  (block $label$5
   (loop $label$6
    (br_if $label$5
     (i32.load
      (local.get $1)
     )
    )
    (local.set $3
     (i64.add
      (local.get $3)
      (i64.const -32)
     )
    )
    (br_if $label$6
     (i32.ne
      (local.tee $1
       (i32.add
        (local.get $1)
        (i32.const 4)
       )
      )
      (local.get $2)
     )
    )
   )
   (i64.store
    (local.get $0)
    (i64.const 0)
   )
   (return)
  )
  (i64.store offset=8
   (local.get $0)
   (i64.sub
    (i64.extend_i32_u
     (i32.ctz
      (i32.load
       (local.get $1)
      )
     )
    )
    (local.get $3)
   )
  )
  (i64.store
   (local.get $0)
   (i64.const 1)
  )
 )
 (func $_ZN10num_bigint6bigint6BigInt14trailing_zeros17h352c206afac23af7E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.ne
       (i32.load
        (local.get $1)
       )
       (i32.const -2147483648)
      )
     )
     (br_if $label$2
      (i32.eq
       (i32.load offset=4
        (local.get $1)
       )
       (i32.const 1)
      )
     )
     (i64.store
      (local.get $0)
      (i64.const 0)
     )
     (return)
    )
    (block $label$4
     (br_if $label$4
      (i32.eqz
       (local.tee $2
        (i32.load offset=8
         (local.get $1)
        )
       )
      )
     )
     (local.set $2
      (i32.add
       (local.tee $1
        (i32.load offset=4
         (local.get $1)
        )
       )
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
      )
     )
     (br $label$1)
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (return)
   )
   (local.set $2
    (i32.add
     (local.get $1)
     (i32.const 12)
    )
   )
   (local.set $1
    (i32.add
     (local.get $1)
     (i32.const 8)
    )
   )
  )
  (local.set $3
   (i64.const 0)
  )
  (block $label$5
   (loop $label$6
    (br_if $label$5
     (i32.load
      (local.get $1)
     )
    )
    (local.set $3
     (i64.add
      (local.get $3)
      (i64.const -32)
     )
    )
    (br_if $label$6
     (i32.ne
      (local.tee $1
       (i32.add
        (local.get $1)
        (i32.const 4)
       )
      )
      (local.get $2)
     )
    )
   )
   (i64.store
    (local.get $0)
    (i64.const 0)
   )
   (return)
  )
  (i64.store offset=8
   (local.get $0)
   (i64.sub
    (i64.extend_i32_u
     (i32.ctz
      (i32.load
       (local.get $1)
      )
     )
    )
    (local.get $3)
   )
  )
  (i64.store
   (local.get $0)
   (i64.const 1)
  )
 )
 (func $_ZN10num_bigint7biguint11subtraction7sub2rev17h2cc96b8ea53527e6E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (local.tee $5
         (select
          (local.get $3)
          (local.get $1)
          (i32.lt_u
           (local.get $3)
           (local.get $1)
          )
         )
        )
       )
      )
      (local.set $6
       (i32.and
        (local.get $5)
        (i32.const 1)
       )
      )
      (block $label$5
       (block $label$6
        (br_if $label$6
         (i32.ne
          (local.get $5)
          (i32.const 1)
         )
        )
        (local.set $7
         (i32.const 0)
        )
        (local.set $8
         (i32.const 0)
        )
        (br $label$5)
       )
       (local.set $9
        (i32.and
         (local.get $5)
         (i32.const -2)
        )
       )
       (local.set $7
        (i32.const 0)
       )
       (local.set $10
        (local.get $2)
       )
       (local.set $11
        (local.get $0)
       )
       (local.set $8
        (i32.const 0)
       )
       (loop $label$7
        (i32.store
         (local.get $10)
         (i32.sub
          (local.tee $14
           (i32.sub
            (local.tee $12
             (i32.load
              (local.get $11)
             )
            )
            (local.tee $13
             (i32.load
              (local.get $10)
             )
            )
           )
          )
          (local.get $7)
         )
        )
        (i32.store
         (local.tee $15
          (i32.add
           (local.get $10)
           (i32.const 4)
          )
         )
         (i32.sub
          (local.tee $17
           (i32.sub
            (local.tee $16
             (i32.load
              (i32.add
               (local.get $11)
               (i32.const 4)
              )
             )
            )
            (local.tee $15
             (i32.load
              (local.get $15)
             )
            )
           )
          )
          (local.tee $7
           (i32.or
            (i32.lt_u
             (local.get $12)
             (local.get $13)
            )
            (i32.lt_u
             (local.get $14)
             (local.get $7)
            )
           )
          )
         )
        )
        (local.set $7
         (i32.or
          (i32.lt_u
           (local.get $16)
           (local.get $15)
          )
          (i32.lt_u
           (local.get $17)
           (local.get $7)
          )
         )
        )
        (local.set $10
         (i32.add
          (local.get $10)
          (i32.const 8)
         )
        )
        (local.set $11
         (i32.add
          (local.get $11)
          (i32.const 8)
         )
        )
        (br_if $label$7
         (i32.ne
          (local.get $9)
          (local.tee $8
           (i32.add
            (local.get $8)
            (i32.const 2)
           )
          )
         )
        )
       )
      )
      (block $label$8
       (br_if $label$8
        (i32.eqz
         (local.get $6)
        )
       )
       (i32.store
        (local.tee $11
         (i32.add
          (local.get $2)
          (local.tee $10
           (i32.shl
            (local.get $8)
            (i32.const 2)
           )
          )
         )
        )
        (i32.sub
         (local.tee $8
          (i32.sub
           (local.tee $10
            (i32.load
             (i32.add
              (local.get $0)
              (local.get $10)
             )
            )
           )
           (local.tee $11
            (i32.load
             (local.get $11)
            )
           )
          )
         )
         (local.get $7)
        )
       )
       (local.set $7
        (i32.or
         (i32.lt_u
          (local.get $10)
          (local.get $11)
         )
         (i32.lt_u
          (local.get $8)
          (local.get $7)
         )
        )
       )
      )
      (br_if $label$2
       (i32.gt_u
        (local.get $1)
        (local.get $3)
       )
      )
      (br_if $label$3
       (i32.eqz
        (i32.and
         (local.get $7)
         (i32.const 1)
        )
       )
      )
      (br $label$1)
     )
     (br_if $label$2
      (i32.gt_u
       (local.get $1)
       (local.get $3)
      )
     )
    )
    (block $label$9
     (br_if $label$9
      (i32.le_u
       (local.get $3)
       (local.get $1)
      )
     )
     (local.set $10
      (i32.add
       (local.get $2)
       (i32.shl
        (local.get $5)
        (i32.const 2)
       )
      )
     )
     (local.set $11
      (i32.sub
       (i32.shl
        (local.get $3)
        (i32.const 2)
       )
       (i32.shl
        (local.get $5)
        (i32.const 2)
       )
      )
     )
     (loop $label$10
      (br_if $label$1
       (i32.load
        (local.get $10)
       )
      )
      (local.set $10
       (i32.add
        (local.get $10)
        (i32.const 4)
       )
      )
      (br_if $label$10
       (local.tee $11
        (i32.add
         (local.get $11)
         (i32.const -4)
        )
       )
      )
     )
    )
    (global.set $__stack_pointer
     (i32.add
      (local.get $4)
      (i32.const 32)
     )
    )
    (return)
   )
   (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
    (i32.const 1051400)
    (i32.const 33)
    (i32.const 1051436)
   )
   (unreachable)
  )
  (i32.store offset=24
   (local.get $4)
   (i32.const 0)
  )
  (i32.store offset=12
   (local.get $4)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $4)
   (i32.const 1051360)
  )
  (i64.store offset=16 align=4
   (local.get $4)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $4)
    (i32.const 8)
   )
   (i32.const 1051384)
  )
  (unreachable)
 )
 (func $_ZN10num_bigint7biguint5shift12biguint_shl217h0d6a40261111377aE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $5
   (i32.load
    (local.get $1)
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (br_if $label$9
            (local.get $2)
           )
           (local.set $6
            (i32.load offset=4
             (local.get $1)
            )
           )
           (block $label$10
            (br_if $label$10
             (i32.eq
              (local.get $5)
              (i32.const -2147483647)
             )
            )
            (i32.store offset=12
             (local.get $4)
             (local.get $6)
            )
            (i32.store offset=8
             (local.get $4)
             (local.get $5)
            )
            (i32.store offset=16
             (local.get $4)
             (i32.load offset=8
              (local.get $1)
             )
            )
            (br_if $label$4
             (i32.and
              (local.get $3)
              (i32.const 255)
             )
            )
            (i64.store align=4
             (local.get $0)
             (i64.load offset=8
              (local.get $4)
             )
            )
            (i32.store
             (i32.add
              (local.get $0)
              (i32.const 8)
             )
             (i32.load
              (i32.add
               (i32.add
                (local.get $4)
                (i32.const 8)
               )
               (i32.const 8)
              )
             )
            )
            (br $label$1)
           )
           (local.set $7
            (i32.const -2147483648)
           )
           (local.set $1
            (i32.load offset=8
             (local.get $6)
            )
           )
           (block $label$11
            (block $label$12
             (block $label$13
              (br_if $label$13
               (i32.eq
                (i32.load
                 (local.get $6)
                )
                (i32.const -2147483648)
               )
              )
              (local.set $8
               (i32.load offset=4
                (local.get $6)
               )
              )
              (local.set $9
               (local.get $1)
              )
              (br_table $label$6 $label$12 $label$11
               (local.get $1)
              )
             )
             (local.set $9
              (i32.load offset=4
               (local.get $6)
              )
             )
             (br $label$6)
            )
            (local.set $1
             (i32.load
              (local.get $8)
             )
            )
            (local.set $9
             (i32.const 1)
            )
            (br $label$6)
           )
           (local.set $10
            (i32.shl
             (local.get $1)
             (i32.const 2)
            )
           )
           (local.set $7
            (i32.const 0)
           )
           (br_if $label$8
            (i32.gt_u
             (local.get $1)
             (i32.const 1073741823)
            )
           )
           (br_if $label$8
            (i32.gt_u
             (local.get $10)
             (i32.const 2147483644)
            )
           )
           (block $label$14
            (block $label$15
             (br_if $label$15
              (local.get $10)
             )
             (local.set $7
              (i32.const 0)
             )
             (local.set $9
              (i32.const 4)
             )
             (br $label$14)
            )
            (drop
             (i32.load8_u offset=1053525
              (i32.const 0)
             )
            )
            (local.set $7
             (i32.const 4)
            )
            (br_if $label$8
             (i32.eqz
              (local.tee $9
               (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                (local.get $10)
                (i32.const 4)
               )
              )
             )
            )
            (local.set $7
             (local.get $1)
            )
           )
           (br_if $label$6
            (i32.eqz
             (local.get $10)
            )
           )
           (memory.copy
            (local.get $9)
            (local.get $8)
            (local.get $10)
           )
           (br $label$6)
          )
          (block $label$16
           (block $label$17
            (br_if $label$17
             (i32.eq
              (i32.load
               (local.tee $1
                (select
                 (local.tee $6
                  (i32.load offset=4
                   (local.get $1)
                  )
                 )
                 (local.get $1)
                 (i32.eq
                  (local.get $5)
                  (i32.const -2147483647)
                 )
                )
               )
              )
              (i32.const -2147483648)
             )
            )
            (local.set $9
             (i32.load offset=8
              (local.get $1)
             )
            )
            (br $label$16)
           )
           (local.set $9
            (i32.load offset=4
             (local.get $1)
            )
           )
          )
          (local.set $7
           (i32.shl
            (local.tee $8
             (select
              (i32.const -1)
              (local.tee $9
               (i32.add
                (i32.add
                 (local.get $9)
                 (local.get $2)
                )
                (i32.const 1)
               )
              )
              (i32.lt_u
               (local.get $9)
               (local.get $2)
              )
             )
            )
            (i32.const 2)
           )
          )
          (local.set $10
           (i32.const 0)
          )
          (br_if $label$7
           (i32.gt_u
            (local.get $8)
            (i32.const 1073741823)
           )
          )
          (br_if $label$7
           (i32.gt_u
            (local.get $7)
            (i32.const 2147483644)
           )
          )
          (drop
           (i32.load8_u offset=1053525
            (i32.const 0)
           )
          )
          (local.set $10
           (i32.const 4)
          )
          (br_if $label$7
           (i32.eqz
            (local.tee $9
             (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
              (local.get $7)
              (i32.const 4)
             )
            )
           )
          )
          (i32.store offset=24
           (local.get $4)
           (local.get $9)
          )
          (i32.store offset=20
           (local.get $4)
           (local.get $8)
          )
          (local.set $10
           (local.get $9)
          )
          (block $label$18
           (br_if $label$18
            (i32.eq
             (local.get $2)
             (i32.const 1)
            )
           )
           (block $label$19
            (br_if $label$19
             (i32.eqz
              (local.tee $7
               (i32.add
                (i32.shl
                 (local.get $2)
                 (i32.const 2)
                )
                (i32.const -4)
               )
              )
             )
            )
            (memory.fill
             (local.get $9)
             (i32.const 0)
             (local.get $7)
            )
           )
           (local.set $10
            (i32.add
             (local.get $7)
             (local.get $9)
            )
           )
          )
          (local.set $7
           (i32.const 0)
          )
          (i32.store
           (local.get $10)
           (i32.const 0)
          )
          (i32.store offset=28
           (local.get $4)
           (local.get $2)
          )
          (block $label$20
           (block $label$21
            (br_if $label$21
             (i32.eq
              (i32.load
               (local.get $1)
              )
              (i32.const -2147483648)
             )
            )
            (local.set $7
             (i32.shl
              (i32.load offset=8
               (local.get $1)
              )
              (i32.const 2)
             )
            )
            (local.set $11
             (i32.load offset=4
              (local.get $1)
             )
            )
            (br $label$20)
           )
           (local.set $11
            (i32.const 4)
           )
           (br_if $label$20
            (i32.ne
             (i32.load offset=4
              (local.get $1)
             )
             (i32.const 1)
            )
           )
           (local.set $11
            (i32.add
             (local.get $1)
             (i32.const 8)
            )
           )
           (local.set $7
            (i32.const 4)
           )
          )
          (local.set $1
           (local.get $2)
          )
          (block $label$22
           (br_if $label$22
            (i32.le_u
             (local.tee $10
              (i32.shr_u
               (local.get $7)
               (i32.const 2)
              )
             )
             (i32.sub
              (local.get $8)
              (local.get $2)
             )
            )
           )
           (call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h533dd80f5e7c5d08E
            (i32.add
             (local.get $4)
             (i32.const 20)
            )
            (local.get $2)
            (local.get $10)
            (i32.const 4)
            (i32.const 4)
           )
           (local.set $9
            (i32.load offset=24
             (local.get $4)
            )
           )
           (local.set $1
            (i32.load offset=28
             (local.get $4)
            )
           )
          )
          (block $label$23
           (br_if $label$23
            (i32.eqz
             (local.get $7)
            )
           )
           (memory.copy
            (i32.add
             (local.get $9)
             (i32.shl
              (local.get $1)
              (i32.const 2)
             )
            )
            (local.get $11)
            (local.get $7)
           )
          )
          (i32.store
           (i32.add
            (local.get $4)
            (i32.const 16)
           )
           (i32.add
            (local.get $1)
            (local.get $10)
           )
          )
          (i64.store offset=8
           (local.get $4)
           (i64.load offset=20 align=4
            (local.get $4)
           )
          )
          (br $label$5)
         )
         (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
          (local.get $7)
          (local.get $10)
          (i32.const 1051760)
         )
         (unreachable)
        )
        (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
         (local.get $10)
         (local.get $7)
         (i32.const 1051888)
        )
        (unreachable)
       )
       (i32.store offset=16
        (local.get $4)
        (local.get $1)
       )
       (i32.store offset=12
        (local.get $4)
        (local.get $9)
       )
       (i32.store offset=8
        (local.get $4)
        (local.get $7)
       )
      )
      (br_if $label$3
       (i32.eqz
        (i32.and
         (local.get $3)
         (i32.const 255)
        )
       )
      )
     )
     (block $label$24
      (block $label$25
       (block $label$26
        (br_if $label$26
         (i32.gt_u
          (i32.and
           (local.get $3)
           (i32.const 255)
          )
          (i32.const 32)
         )
        )
        (br_if $label$25
         (i32.eq
          (i32.load offset=8
           (local.get $4)
          )
          (i32.const -2147483648)
         )
        )
        (local.set $9
         (i32.load offset=16
          (local.get $4)
         )
        )
        (local.set $1
         (i32.load offset=12
          (local.get $4)
         )
        )
        (br $label$24)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
        (i32.const 1051904)
       )
       (unreachable)
      )
      (local.set $9
       (i32.const 1)
      )
      (block $label$27
       (br_if $label$27
        (i32.eq
         (i32.load offset=12
          (local.get $4)
         )
         (i32.const 1)
        )
       )
       (local.set $9
        (i32.const 0)
       )
       (local.set $1
        (i32.const 4)
       )
       (br $label$24)
      )
      (local.set $1
       (i32.add
        (local.get $4)
        (i32.const 16)
       )
      )
     )
     (block $label$28
      (block $label$29
       (br_if $label$29
        (i32.gt_u
         (local.get $2)
         (local.get $9)
        )
       )
       (block $label$30
        (br_if $label$30
         (i32.ne
          (local.get $2)
          (local.get $9)
         )
        )
        (i64.store align=4
         (local.get $0)
         (i64.load offset=8
          (local.get $4)
         )
        )
        (i32.store
         (i32.add
          (local.get $0)
          (i32.const 8)
         )
         (i32.load
          (i32.add
           (i32.add
            (local.get $4)
            (i32.const 8)
           )
           (i32.const 8)
          )
         )
        )
        (br_if $label$1
         (i32.eqz
          (local.get $2)
         )
        )
        (br_if $label$1
         (i32.lt_s
          (local.get $5)
          (i32.const -2147483646)
         )
        )
        (br $label$2)
       )
       (block $label$31
        (block $label$32
         (block $label$33
          (block $label$34
           (br_if $label$34
            (i32.gt_u
             (local.tee $8
              (i32.and
               (i32.sub
                (i32.const 32)
                (local.get $3)
               )
               (i32.const 255)
              )
             )
             (i32.const 31)
            )
           )
           (br_if $label$33
            (i32.eq
             (i32.and
              (local.get $3)
              (i32.const 255)
             )
             (i32.const 32)
            )
           )
           (local.set $1
            (i32.add
             (local.get $1)
             (i32.shl
              (local.get $2)
              (i32.const 2)
             )
            )
           )
           (local.set $10
            (i32.and
             (local.get $3)
             (i32.const 31)
            )
           )
           (local.set $9
            (i32.sub
             (i32.shl
              (local.get $9)
              (i32.const 2)
             )
             (i32.shl
              (local.get $2)
              (i32.const 2)
             )
            )
           )
           (local.set $3
            (i32.const 0)
           )
           (loop $label$35
            (i32.store
             (local.get $1)
             (i32.or
              (i32.shl
               (local.tee $7
                (i32.load
                 (local.get $1)
                )
               )
               (local.get $10)
              )
              (local.get $3)
             )
            )
            (local.set $1
             (i32.add
              (local.get $1)
              (i32.const 4)
             )
            )
            (local.set $3
             (i32.shr_u
              (local.get $7)
              (local.get $8)
             )
            )
            (br_if $label$35
             (local.tee $9
              (i32.add
               (local.get $9)
               (i32.const -4)
              )
             )
            )
           )
           (br_if $label$3
            (i32.eqz
             (local.get $3)
            )
           )
           (br_if $label$32
            (i32.eq
             (local.tee $1
              (i32.load offset=8
               (local.get $4)
              )
             )
             (i32.const -2147483648)
            )
           )
           (block $label$36
            (br_if $label$36
             (i32.ne
              (local.tee $9
               (i32.load offset=16
                (local.get $4)
               )
              )
              (local.get $1)
             )
            )
            (call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE
             (i32.add
              (local.get $4)
              (i32.const 8)
             )
             (i32.const 1052096)
            )
           )
           (i32.store
            (i32.add
             (i32.load offset=12
              (local.get $4)
             )
             (i32.shl
              (local.get $9)
              (i32.const 2)
             )
            )
            (local.get $3)
           )
           (i32.store offset=16
            (local.get $4)
            (i32.add
             (local.get $9)
             (i32.const 1)
            )
           )
           (br $label$31)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
           (i32.const 1051920)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
          (i32.const 1051936)
         )
         (unreachable)
        )
        (block $label$37
         (br_if $label$37
          (i32.ne
           (i32.load offset=12
            (local.get $4)
           )
           (i32.const 1)
          )
         )
         (drop
          (i32.load8_u offset=1053525
           (i32.const 0)
          )
         )
         (local.set $9
          (i32.load offset=16
           (local.get $4)
          )
         )
         (br_if $label$28
          (i32.eqz
           (local.tee $1
            (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
             (i32.const 8)
             (i32.const 4)
            )
           )
          )
         )
         (i32.store offset=4
          (local.get $1)
          (local.get $3)
         )
         (i32.store
          (local.get $1)
          (local.get $9)
         )
         (i32.store offset=16
          (local.get $4)
          (i32.const 2)
         )
         (i32.store offset=12
          (local.get $4)
          (local.get $1)
         )
         (i32.store offset=8
          (local.get $4)
          (i32.const 2)
         )
         (br $label$31)
        )
        (i32.store offset=16
         (local.get $4)
         (local.get $3)
        )
        (i32.store offset=12
         (local.get $4)
         (i32.const 1)
        )
       )
       (i64.store align=4
        (local.get $0)
        (i64.load offset=8
         (local.get $4)
        )
       )
       (i32.store
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
        (i32.load
         (i32.add
          (i32.add
           (local.get $4)
           (i32.const 8)
          )
          (i32.const 8)
         )
        )
       )
       (br_if $label$1
        (i32.eqz
         (local.get $2)
        )
       )
       (br_if $label$1
        (i32.lt_s
         (local.get $5)
         (i32.const -2147483646)
        )
       )
       (br $label$2)
      )
      (call $_ZN4core5slice5index26slice_start_index_len_fail17h026a9215e79c1fdbE
       (local.get $2)
       (local.get $9)
       (i32.const 1051952)
      )
      (unreachable)
     )
     (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
      (i32.const 4)
      (i32.const 8)
      (i32.const 1051760)
     )
     (unreachable)
    )
    (i64.store align=4
     (local.get $0)
     (i64.load offset=8
      (local.get $4)
     )
    )
    (i32.store
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
     (i32.load
      (i32.add
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i32.const 8)
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $2)
     )
    )
    (br_if $label$1
     (i32.lt_s
      (local.get $5)
      (i32.const -2147483646)
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (local.get $5)
    )
   )
   (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
    (local.get $6)
    (i32.shl
     (local.get $5)
     (i32.const 2)
    )
    (i32.const 4)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 32)
   )
  )
 )
 (func $_ZN10num_bigint7biguint5shift12biguint_shr217hb02301f24d4fb4a3E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (block $label$10
            (block $label$11
             (block $label$12
              (block $label$13
               (br_table $label$11 $label$13 $label$12
                (i32.add
                 (local.tee $5
                  (i32.load
                   (local.get $1)
                  )
                 )
                 (i32.const -2147483648)
                )
               )
              )
              (block $label$14
               (block $label$15
                (block $label$16
                 (block $label$17
                  (br_if $label$17
                   (i32.eq
                    (i32.load
                     (local.tee $1
                      (i32.load offset=4
                       (local.get $1)
                      )
                     )
                    )
                    (i32.const -2147483648)
                   )
                  )
                  (br_if $label$16
                   (i32.ge_u
                    (local.get $2)
                    (local.tee $5
                     (i32.load offset=8
                      (local.get $1)
                     )
                    )
                   )
                  )
                  (local.set $1
                   (i32.load offset=4
                    (local.get $1)
                   )
                  )
                  (br $label$14)
                 )
                 (br_if $label$15
                  (i32.lt_u
                   (local.get $2)
                   (i32.load offset=4
                    (local.get $1)
                   )
                  )
                 )
                )
                (i32.store
                 (i32.add
                  (local.get $0)
                  (i32.const 8)
                 )
                 (i32.load offset=1051784
                  (i32.const 0)
                 )
                )
                (i64.store align=4
                 (local.get $0)
                 (i64.load offset=1051776 align=4
                  (i32.const 0)
                 )
                )
                (br $label$1)
               )
               (local.set $1
                (i32.add
                 (local.get $1)
                 (i32.const 8)
                )
               )
               (local.set $5
                (i32.const 1)
               )
              )
              (local.set $6
               (i32.add
                (local.get $1)
                (i32.shl
                 (local.get $2)
                 (i32.const 2)
                )
               )
              )
              (block $label$18
               (block $label$19
                (block $label$20
                 (br_table $label$20 $label$19 $label$18
                  (local.tee $1
                   (i32.sub
                    (local.get $5)
                    (local.get $2)
                   )
                  )
                 )
                )
                (i32.store
                 (i32.add
                  (local.get $4)
                  (i32.const 24)
                 )
                 (i32.load offset=1051784
                  (i32.const 0)
                 )
                )
                (i64.store offset=16
                 (local.get $4)
                 (i64.load offset=1051776 align=4
                  (i32.const 0)
                 )
                )
                (br $label$2)
               )
               (i64.store offset=16 align=4
                (local.get $4)
                (i64.const 6442450944)
               )
               (i32.store offset=24
                (local.get $4)
                (i32.load
                 (local.get $6)
                )
               )
               (br $label$2)
              )
              (drop
               (i32.load8_u offset=1053525
                (i32.const 0)
               )
              )
              (br_if $label$9
               (i32.eqz
                (local.tee $5
                 (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
                  (local.tee $2
                   (i32.shl
                    (local.get $1)
                    (i32.const 2)
                   )
                  )
                  (i32.const 4)
                 )
                )
               )
              )
              (block $label$21
               (br_if $label$21
                (i32.eqz
                 (local.get $2)
                )
               )
               (memory.copy
                (local.get $5)
                (local.get $6)
                (local.get $2)
               )
              )
              (i32.store offset=24
               (local.get $4)
               (local.get $1)
              )
              (i32.store offset=20
               (local.get $4)
               (local.get $5)
              )
              (i32.store offset=16
               (local.get $4)
               (local.get $1)
              )
              (br $label$2)
             )
             (br_if $label$7
              (i32.lt_u
               (local.get $2)
               (i32.load offset=8
                (local.get $1)
               )
              )
             )
             (local.set $6
              (i32.load offset=4
               (local.get $1)
              )
             )
             (br $label$10)
            )
            (local.set $6
             (i32.const 0)
            )
            (br_if $label$8
             (i32.lt_u
              (local.get $2)
              (i32.load offset=4
               (local.get $1)
              )
             )
            )
           )
           (i32.store offset=8
            (local.get $0)
            (i32.const 0)
           )
           (i32.store offset=4
            (local.get $0)
            (local.get $6)
           )
           (i32.store
            (local.get $0)
            (local.get $5)
           )
           (br $label$1)
          )
          (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
           (i32.const 4)
           (local.get $2)
           (i32.const 1051760)
          )
          (unreachable)
         )
         (i32.store
          (i32.add
           (i32.add
            (local.get $4)
            (i32.const 32)
           )
           (i32.const 8)
          )
          (i32.load
           (i32.add
            (local.get $1)
            (i32.const 8)
           )
          )
         )
         (i64.store offset=32
          (local.get $4)
          (local.tee $7
           (i64.load align=4
            (local.get $1)
           )
          )
         )
         (br_if $label$6
          (i32.ne
           (local.tee $1
            (i32.wrap_i64
             (local.get $7)
            )
           )
           (i32.const -2147483648)
          )
         )
         (br $label$4)
        )
        (i32.store
         (i32.add
          (i32.add
           (local.get $4)
           (i32.const 32)
          )
          (i32.const 8)
         )
         (i32.load
          (i32.add
           (local.get $1)
           (i32.const 8)
          )
         )
        )
        (i64.store offset=32
         (local.get $4)
         (local.tee $7
          (i64.load align=4
           (local.get $1)
          )
         )
        )
        (br_if $label$5
         (i32.eq
          (local.tee $1
           (i32.wrap_i64
            (local.get $7)
           )
          )
          (i32.const -2147483648)
         )
        )
       )
       (block $label$22
        (block $label$23
         (block $label$24
          (block $label$25
           (br_if $label$25
            (i32.lt_u
             (local.tee $6
              (i32.load offset=40
               (local.get $4)
              )
             )
             (local.get $2)
            )
           )
           (local.set $5
            (i32.const 0)
           )
           (i32.store offset=40
            (local.get $4)
            (i32.const 0)
           )
           (local.set $8
            (i32.sub
             (local.get $6)
             (local.get $2)
            )
           )
           (local.set $9
            (i32.load offset=36
             (local.get $4)
            )
           )
           (br_if $label$24
            (i32.eqz
             (local.get $2)
            )
           )
           (br_if $label$22
            (i32.eq
             (local.get $6)
             (local.get $2)
            )
           )
           (br_if $label$23
            (i32.eqz
             (local.tee $5
              (i32.shl
               (local.get $8)
               (i32.const 2)
              )
             )
            )
           )
           (memory.copy
            (local.get $9)
            (i32.add
             (local.get $9)
             (i32.shl
              (local.get $2)
              (i32.const 2)
             )
            )
            (local.get $5)
           )
           (br $label$23)
          )
          (call $_ZN4core5slice5index24slice_end_index_len_fail17hadfbc7e1a15974a1E
           (local.get $2)
           (local.get $6)
           (i32.const 1051528)
          )
          (unreachable)
         )
         (br_if $label$22
          (i32.eq
           (local.get $6)
           (local.get $2)
          )
         )
        )
        (i32.store offset=40
         (local.get $4)
         (local.get $8)
        )
        (local.set $5
         (local.get $8)
        )
       )
       (br_if $label$4
        (i32.ge_u
         (local.get $5)
         (i32.shr_u
          (local.get $1)
          (i32.const 1)
         )
        )
       )
       (block $label$26
        (block $label$27
         (block $label$28
          (br_table $label$28 $label$27 $label$26
           (local.get $5)
          )
         )
         (block $label$29
          (br_if $label$29
           (i32.eqz
            (local.get $1)
           )
          )
          (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
           (local.get $9)
           (i32.shl
            (local.get $1)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (i32.store
          (i32.add
           (local.get $4)
           (i32.const 40)
          )
          (i32.load offset=1051784
           (i32.const 0)
          )
         )
         (i64.store offset=32
          (local.get $4)
          (i64.load offset=1051776 align=4
           (i32.const 0)
          )
         )
         (br $label$4)
        )
        (local.set $2
         (i32.load
          (local.get $9)
         )
        )
        (block $label$30
         (br_if $label$30
          (i32.eqz
           (local.get $1)
          )
         )
         (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
          (local.get $9)
          (i32.shl
           (local.get $1)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (i32.store offset=40
         (local.get $4)
         (local.get $2)
        )
        (i64.store offset=32
         (local.get $4)
         (i64.const 6442450944)
        )
        (br $label$4)
       )
       (br_if $label$4
        (i32.le_u
         (local.get $1)
         (local.tee $2
          (i32.add
           (local.get $5)
           (i32.const 1)
          )
         )
        )
       )
       (call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$16shrink_unchecked17hc917305fc62ebaa0E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i32.add
         (local.get $4)
         (i32.const 32)
        )
        (local.get $2)
        (i32.const 4)
        (i32.const 4)
       )
       (br_if $label$4
        (i32.eq
         (local.tee $1
          (i32.load offset=8
           (local.get $4)
          )
         )
         (i32.const -2147483647)
        )
       )
       (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
        (local.get $1)
        (i32.load offset=12
         (local.get $4)
        )
        (i32.const 1052112)
       )
       (unreachable)
      )
      (br_if $label$3
       (i32.ge_u
        (local.get $2)
        (i32.const 2)
       )
      )
      (br_if $label$4
       (i32.ne
        (local.get $2)
        (i32.const 1)
       )
      )
      (i32.store offset=36
       (local.get $4)
       (i32.const 0)
      )
     )
     (i32.store
      (i32.add
       (i32.add
        (local.get $4)
        (i32.const 16)
       )
       (i32.const 8)
      )
      (i32.load
       (i32.add
        (i32.add
         (local.get $4)
         (i32.const 32)
        )
        (i32.const 8)
       )
      )
     )
     (i64.store offset=16
      (local.get $4)
      (i64.load offset=32
       (local.get $4)
      )
     )
     (br $label$2)
    )
    (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
     (i32.const 1052128)
     (i32.const 26)
     (i32.const 1052156)
    )
    (unreachable)
   )
   (block $label$31
    (br_if $label$31
     (i32.eqz
      (local.tee $1
       (i32.and
        (local.get $3)
        (i32.const 255)
       )
      )
     )
    )
    (block $label$32
     (br_if $label$32
      (i32.gt_u
       (local.get $1)
       (i32.const 32)
      )
     )
     (block $label$33
      (block $label$34
       (block $label$35
        (block $label$36
         (block $label$37
          (br_if $label$37
           (i32.ne
            (i32.load offset=16
             (local.get $4)
            )
            (i32.const -2147483648)
           )
          )
          (local.set $5
           (i32.const 1)
          )
          (br_if $label$35
           (i32.ne
            (local.tee $1
             (i32.load offset=20
              (local.get $4)
             )
            )
            (i32.const 1)
           )
          )
          (local.set $1
           (i32.add
            (local.get $4)
            (i32.const 24)
           )
          )
          (br $label$36)
         )
         (br_if $label$31
          (i32.eqz
           (local.tee $5
            (i32.load offset=24
             (local.get $4)
            )
           )
          )
         )
         (local.set $1
          (i32.load offset=20
           (local.get $4)
          )
         )
        )
        (br_if $label$33
         (i32.eq
          (i32.and
           (local.get $3)
           (i32.const 255)
          )
          (i32.const 32)
         )
        )
        (local.set $2
         (i32.and
          (local.get $3)
          (i32.const 31)
         )
        )
        (local.set $3
         (i32.and
          (i32.sub
           (i32.const 0)
           (local.get $3)
          )
          (i32.const 31)
         )
        )
        (local.set $1
         (i32.add
          (local.get $1)
          (i32.shl
           (local.get $5)
           (i32.const 2)
          )
         )
        )
        (local.set $6
         (i32.and
          (local.tee $9
           (i32.add
            (local.tee $8
             (i32.and
              (i32.add
               (local.get $5)
               (i32.const -1)
              )
              (i32.const 1073741823)
             )
            )
            (i32.const 1)
           )
          )
          (i32.const 3)
         )
        )
        (local.set $5
         (i32.const 0)
        )
        (block $label$38
         (br_if $label$38
          (i32.lt_u
           (local.get $8)
           (i32.const 3)
          )
         )
         (local.set $8
          (i32.and
           (local.get $9)
           (i32.const 2147483644)
          )
         )
         (local.set $5
          (i32.const 0)
         )
         (loop $label$39
          (i32.store
           (local.tee $9
            (i32.add
             (local.get $1)
             (i32.const -4)
            )
           )
           (i32.or
            (i32.shr_u
             (local.tee $9
              (i32.load
               (local.get $9)
              )
             )
             (local.get $2)
            )
            (local.get $5)
           )
          )
          (i32.store
           (local.tee $5
            (i32.add
             (local.get $1)
             (i32.const -8)
            )
           )
           (i32.or
            (i32.shr_u
             (local.tee $5
              (i32.load
               (local.get $5)
              )
             )
             (local.get $2)
            )
            (i32.shl
             (local.get $9)
             (local.get $3)
            )
           )
          )
          (i32.store
           (local.tee $9
            (i32.add
             (local.get $1)
             (i32.const -12)
            )
           )
           (i32.or
            (i32.shr_u
             (local.tee $9
              (i32.load
               (local.get $9)
              )
             )
             (local.get $2)
            )
            (i32.shl
             (local.get $5)
             (local.get $3)
            )
           )
          )
          (i32.store
           (local.tee $1
            (i32.add
             (local.get $1)
             (i32.const -16)
            )
           )
           (i32.or
            (i32.shr_u
             (local.tee $5
              (i32.load
               (local.get $1)
              )
             )
             (local.get $2)
            )
            (i32.shl
             (local.get $9)
             (local.get $3)
            )
           )
          )
          (local.set $5
           (i32.shl
            (local.get $5)
            (local.get $3)
           )
          )
          (br_if $label$39
           (local.tee $8
            (i32.add
             (local.get $8)
             (i32.const -4)
            )
           )
          )
         )
        )
        (block $label$40
         (br_if $label$40
          (i32.eqz
           (local.get $6)
          )
         )
         (local.set $1
          (i32.add
           (local.get $1)
           (i32.const -4)
          )
         )
         (loop $label$41
          (i32.store
           (local.get $1)
           (i32.or
            (i32.shr_u
             (local.tee $8
              (i32.load
               (local.get $1)
              )
             )
             (local.get $2)
            )
            (local.get $5)
           )
          )
          (local.set $1
           (i32.add
            (local.get $1)
            (i32.const -4)
           )
          )
          (local.set $5
           (i32.shl
            (local.get $8)
            (local.get $3)
           )
          )
          (br_if $label$41
           (local.tee $6
            (i32.add
             (local.get $6)
             (i32.const -1)
            )
           )
          )
         )
        )
        (br_if $label$34
         (i32.ne
          (i32.load offset=16
           (local.get $4)
          )
          (i32.const -2147483648)
         )
        )
        (local.set $1
         (i32.load offset=20
          (local.get $4)
         )
        )
       )
       (br_if $label$31
        (i32.eqz
         (i32.and
          (local.get $1)
          (i32.const 1)
         )
        )
       )
       (br_if $label$31
        (i32.load offset=24
         (local.get $4)
        )
       )
       (i32.store offset=20
        (local.get $4)
        (i32.const 0)
       )
       (br $label$31)
      )
      (br_if $label$31
       (i32.eqz
        (local.tee $1
         (i32.load offset=24
          (local.get $4)
         )
        )
       )
      )
      (br_if $label$31
       (i32.load
        (i32.add
         (i32.add
          (i32.load offset=20
           (local.get $4)
          )
          (i32.shl
           (local.get $1)
           (i32.const 2)
          )
         )
         (i32.const -4)
        )
       )
      )
      (i32.store offset=24
       (local.get $4)
       (i32.add
        (local.get $1)
        (i32.const -1)
       )
      )
      (br $label$31)
     )
     (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
      (i32.const 1051984)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
     (i32.const 1051968)
    )
    (unreachable)
   )
   (i64.store align=4
    (local.get $0)
    (i64.load offset=16
     (local.get $4)
    )
   )
   (i32.store
    (i32.add
     (local.get $0)
     (i32.const 8)
    )
    (i32.load
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 16)
      )
      (i32.const 8)
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 48)
   )
  )
 )
 (func $_ZN5alloc7raw_vec11finish_grow17h1293c7f35fa7a25eE.llvm.2748634711770697582 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (block $label$1
   (br_if $label$1
    (i32.lt_s
     (local.get $2)
     (i32.const 0)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (i32.load offset=4
         (local.get $3)
        )
       )
      )
      (block $label$5
       (br_if $label$5
        (local.tee $4
         (i32.load offset=8
          (local.get $3)
         )
        )
       )
       (block $label$6
        (br_if $label$6
         (local.get $2)
        )
        (local.set $3
         (local.get $1)
        )
        (br $label$2)
       )
       (drop
        (i32.load8_u offset=1053525
         (i32.const 0)
        )
       )
       (br $label$3)
      )
      (local.set $3
       (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_realloc
        (i32.load
         (local.get $3)
        )
        (local.get $4)
        (local.get $1)
        (local.get $2)
       )
      )
      (br $label$2)
     )
     (block $label$7
      (br_if $label$7
       (local.get $2)
      )
      (local.set $3
       (local.get $1)
      )
      (br $label$2)
     )
     (drop
      (i32.load8_u offset=1053525
       (i32.const 0)
      )
     )
    )
    (local.set $3
     (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
      (local.get $2)
      (local.get $1)
     )
    )
   )
   (block $label$8
    (br_if $label$8
     (local.get $3)
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $2)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $1)
    )
    (i32.store
     (local.get $0)
     (i32.const 1)
    )
    (return)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $2)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $3)
   )
   (i32.store
    (local.get $0)
    (i32.const 0)
   )
   (return)
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 0)
  )
  (i32.store
   (local.get $0)
   (i32.const 1)
  )
 )
 (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h0f27ed2d9154ef2fE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.le_u
     (local.tee $4
      (i32.load
       (local.get $0)
      )
     )
     (i32.const 536870911)
    )
   )
   (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
    (i32.const 0)
    (i32.const 0)
    (local.get $1)
   )
   (unreachable)
  )
  (block $label$2
   (block $label$3
    (br_if $label$3
     (i32.gt_u
      (local.tee $7
       (i32.shl
        (local.tee $6
         (select
          (local.tee $5
           (i32.shl
            (local.get $4)
            (i32.const 1)
           )
          )
          (i32.const 4)
          (i32.gt_u
           (local.get $5)
           (i32.const 4)
          )
         )
        )
        (i32.const 2)
       )
      )
      (i32.const 2147483644)
     )
    )
    (local.set $5
     (i32.const 0)
    )
    (block $label$4
     (br_if $label$4
      (i32.eqz
       (local.get $4)
      )
     )
     (i32.store offset=28
      (local.get $2)
      (i32.shl
       (local.get $4)
       (i32.const 2)
      )
     )
     (i32.store offset=20
      (local.get $2)
      (i32.load offset=4
       (local.get $0)
      )
     )
     (local.set $5
      (i32.const 4)
     )
    )
    (i32.store offset=24
     (local.get $2)
     (local.get $5)
    )
    (call $_ZN5alloc7raw_vec11finish_grow17h1293c7f35fa7a25eE.llvm.2748634711770697582
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 4)
     (local.get $7)
     (i32.add
      (local.get $2)
      (i32.const 20)
     )
    )
    (br_if $label$2
     (i32.ne
      (i32.load offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $8
     (i32.load offset=16
      (local.get $2)
     )
    )
    (local.set $3
     (i32.load offset=12
      (local.get $2)
     )
    )
   )
   (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
    (local.get $3)
    (local.get $8)
    (local.get $1)
   )
   (unreachable)
  )
  (local.set $4
   (i32.load offset=12
    (local.get $2)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $6)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $4)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$16shrink_unchecked17hc917305fc62ebaa0E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (local.get $4)
     )
    )
    (br_if $label$2
     (i32.eqz
      (local.tee $5
       (i32.load
        (local.get $1)
       )
      )
     )
    )
    (local.set $6
     (i32.load offset=4
      (local.get $1)
     )
    )
    (local.set $5
     (i32.mul
      (local.get $5)
      (local.get $4)
     )
    )
    (block $label$3
     (block $label$4
      (br_if $label$4
       (local.get $2)
      )
      (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
       (local.get $6)
       (local.get $5)
       (local.get $3)
      )
      (local.set $5
       (local.get $3)
      )
      (br $label$3)
     )
     (br_if $label$1
      (i32.eqz
       (local.tee $5
        (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_realloc
         (local.get $6)
         (local.get $5)
         (local.get $3)
         (local.tee $4
          (i32.mul
           (local.get $4)
           (local.get $2)
          )
         )
        )
       )
      )
     )
    )
    (i32.store
     (local.get $1)
     (local.get $2)
    )
    (i32.store offset=4
     (local.get $1)
     (local.get $5)
    )
   )
   (local.set $3
    (i32.const -2147483647)
   )
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $4)
  )
  (i32.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h533dd80f5e7c5d08E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $6
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (local.get $4)
     )
     (br $label$2)
    )
    (block $label$4
     (br_if $label$4
      (i32.ge_u
       (local.tee $2
        (i32.add
         (local.get $1)
         (local.get $2)
        )
       )
       (local.get $1)
      )
     )
     (br $label$2)
    )
    (local.set $6
     (i32.const 0)
    )
    (block $label$5
     (br_if $label$5
      (i32.eqz
       (i32.wrap_i64
        (i64.shr_u
         (local.tee $8
          (i64.mul
           (i64.extend_i32_u
            (i32.and
             (i32.add
              (i32.add
               (local.get $3)
               (local.get $4)
              )
              (i32.const -1)
             )
             (i32.sub
              (i32.const 0)
              (local.get $3)
             )
            )
           )
           (i64.extend_i32_u
            (local.tee $7
             (select
              (local.tee $2
               (select
                (local.get $2)
                (local.tee $7
                 (i32.shl
                  (local.tee $1
                   (i32.load
                    (local.get $0)
                   )
                  )
                  (i32.const 1)
                 )
                )
                (i32.gt_u
                 (local.get $2)
                 (local.get $7)
                )
               )
              )
              (local.tee $7
               (select
                (i32.const 8)
                (select
                 (i32.const 4)
                 (i32.const 1)
                 (i32.lt_u
                  (local.get $4)
                  (i32.const 1025)
                 )
                )
                (i32.eq
                 (local.get $4)
                 (i32.const 1)
                )
               )
              )
              (i32.gt_u
               (local.get $2)
               (local.get $7)
              )
             )
            )
           )
          )
         )
         (i64.const 32)
        )
       )
      )
     )
     (br $label$2)
    )
    (br_if $label$2
     (i32.gt_u
      (local.tee $9
       (i32.wrap_i64
        (local.get $8)
       )
      )
      (i32.sub
       (i32.const -2147483648)
       (local.get $3)
      )
     )
    )
    (local.set $2
     (i32.const 0)
    )
    (block $label$6
     (br_if $label$6
      (i32.eqz
       (local.get $1)
      )
     )
     (i32.store offset=28
      (local.get $5)
      (i32.mul
       (local.get $1)
       (local.get $4)
      )
     )
     (i32.store offset=20
      (local.get $5)
      (i32.load offset=4
       (local.get $0)
      )
     )
     (local.set $2
      (local.get $3)
     )
    )
    (i32.store offset=24
     (local.get $5)
     (local.get $2)
    )
    (call $_ZN5alloc7raw_vec11finish_grow17h1293c7f35fa7a25eE.llvm.2748634711770697582
     (i32.add
      (local.get $5)
      (i32.const 8)
     )
     (local.get $3)
     (local.get $9)
     (i32.add
      (local.get $5)
      (i32.const 20)
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.load offset=8
       (local.get $5)
      )
      (i32.const 1)
     )
    )
    (local.set $2
     (i32.load offset=16
      (local.get $5)
     )
    )
    (local.set $6
     (i32.load offset=12
      (local.get $5)
     )
    )
   )
   (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
    (local.get $6)
    (local.get $2)
    (i32.const 1052252)
   )
   (unreachable)
  )
  (local.set $4
   (i32.load offset=12
    (local.get $5)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $7)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $4)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
  )
 )
 (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h7304e3c4160876daE (param $0 i32) (param $1 i32)
  (i64.store offset=8
   (local.get $0)
   (i64.const 7199936582794304877)
  )
  (i64.store
   (local.get $0)
   (i64.const -5076933981314334344)
  )
 )
 (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17hffe704d8309d203aE (param $0 i32) (param $1 i32)
  (i64.store offset=8
   (local.get $0)
   (i64.const 7305752822554981023)
  )
  (i64.store
   (local.get $0)
   (i64.const 3513012367455052835)
  )
 )
 (func $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h9d7cabd5071c5a51E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.ge_u
       (local.tee $2
        (i32.add
         (local.get $1)
         (local.get $2)
        )
       )
       (local.get $1)
      )
     )
     (local.set $6
      (i32.const 0)
     )
     (br $label$2)
    )
    (local.set $6
     (i32.const 0)
    )
    (block $label$4
     (br_if $label$4
      (i32.eqz
       (i32.wrap_i64
        (i64.shr_u
         (local.tee $8
          (i64.mul
           (i64.extend_i32_u
            (i32.and
             (i32.add
              (i32.add
               (local.get $3)
               (local.get $4)
              )
              (i32.const -1)
             )
             (i32.sub
              (i32.const 0)
              (local.get $3)
             )
            )
           )
           (i64.extend_i32_u
            (local.tee $7
             (select
              (local.tee $2
               (select
                (local.get $2)
                (local.tee $7
                 (i32.shl
                  (local.tee $1
                   (i32.load
                    (local.get $0)
                   )
                  )
                  (i32.const 1)
                 )
                )
                (i32.gt_u
                 (local.get $2)
                 (local.get $7)
                )
               )
              )
              (local.tee $7
               (select
                (i32.const 8)
                (i32.const 4)
                (i32.eq
                 (local.get $4)
                 (i32.const 1)
                )
               )
              )
              (i32.gt_u
               (local.get $2)
               (local.get $7)
              )
             )
            )
           )
          )
         )
         (i64.const 32)
        )
       )
      )
     )
     (br $label$2)
    )
    (br_if $label$2
     (i32.gt_u
      (local.tee $9
       (i32.wrap_i64
        (local.get $8)
       )
      )
      (i32.sub
       (i32.const -2147483648)
       (local.get $3)
      )
     )
    )
    (local.set $2
     (i32.const 0)
    )
    (block $label$5
     (br_if $label$5
      (i32.eqz
       (local.get $1)
      )
     )
     (i32.store offset=28
      (local.get $5)
      (i32.mul
       (local.get $1)
       (local.get $4)
      )
     )
     (i32.store offset=20
      (local.get $5)
      (i32.load offset=4
       (local.get $0)
      )
     )
     (local.set $2
      (local.get $3)
     )
    )
    (i32.store offset=24
     (local.get $5)
     (local.get $2)
    )
    (call $_ZN5alloc7raw_vec11finish_grow17h31fcfb118e0508a4E
     (i32.add
      (local.get $5)
      (i32.const 8)
     )
     (local.get $3)
     (local.get $9)
     (i32.add
      (local.get $5)
      (i32.const 20)
     )
    )
    (br_if $label$1
     (i32.ne
      (i32.load offset=8
       (local.get $5)
      )
      (i32.const 1)
     )
    )
    (local.set $2
     (i32.load offset=16
      (local.get $5)
     )
    )
    (local.set $6
     (i32.load offset=12
      (local.get $5)
     )
    )
   )
   (call $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E
    (local.get $6)
    (local.get $2)
    (i32.const 1052348)
   )
   (unreachable)
  )
  (local.set $3
   (i32.load offset=12
    (local.get $5)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $7)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $3)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
  )
 )
 (func $_ZN4core3fmt5Write9write_fmt17hc808c42956869ae8E (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt5write17h68542eb4423e8992E
   (local.get $0)
   (i32.const 1052364)
   (local.get $1)
  )
 )
 (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h37d546d4b358ccb9E (param $0 i32)
  (local $1 i32)
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (local.tee $1
      (i32.load
       (local.get $0)
      )
     )
    )
   )
   (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
    (i32.load offset=4
     (local.get $0)
    )
    (local.get $1)
    (i32.const 1)
   )
  )
 )
 (func $_ZN4core3ptr74drop_in_place$LT$core..option..Option$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h5e7c564ca6a856faE (param $0 i32) (param $1 i32)
  (block $label$1
   (br_if $label$1
    (i32.eq
     (i32.or
      (local.get $0)
      (i32.const -2147483648)
     )
     (i32.const -2147483648)
    )
   )
   (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
    (local.get $1)
    (local.get $0)
    (i32.const 1)
   )
  )
 )
 (func $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h328305dd0d118fb6E (param $0 i32)
  (local $1 i32)
  (block $label$1
   (br_if $label$1
    (i32.eq
     (i32.or
      (local.tee $1
       (i32.load
        (local.get $0)
       )
      )
      (i32.const -2147483648)
     )
     (i32.const -2147483648)
    )
   )
   (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_dealloc
    (i32.load offset=4
     (local.get $0)
    )
    (local.get $1)
    (i32.const 1)
   )
  )
 )
 (func $_ZN4core5panic12PanicPayload6as_str17h3575ee572e511855E (param $0 i32) (param $1 i32)
  (i32.store
   (local.get $0)
   (i32.const 0)
  )
 )
 (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17h61f319b0423b9825E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local.set $2
   (i32.load offset=8
    (local.get $0)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ge_u
      (local.get $1)
      (i32.const 128)
     )
    )
    (local.set $3
     (i32.const 1)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i32.ge_u
      (local.get $1)
      (i32.const 2048)
     )
    )
    (local.set $3
     (i32.const 2)
    )
    (br $label$1)
   )
   (local.set $3
    (select
     (i32.const 3)
     (i32.const 4)
     (i32.lt_u
      (local.get $1)
      (i32.const 65536)
     )
    )
   )
  )
  (local.set $4
   (local.get $2)
  )
  (block $label$4
   (br_if $label$4
    (i32.le_u
     (local.get $3)
     (i32.sub
      (i32.load
       (local.get $0)
      )
      (local.get $2)
     )
    )
   )
   (call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h9d7cabd5071c5a51E
    (local.get $0)
    (local.get $2)
    (local.get $3)
    (i32.const 1)
    (i32.const 1)
   )
   (local.set $4
    (i32.load offset=8
     (local.get $0)
    )
   )
  )
  (local.set $4
   (i32.add
    (i32.load offset=4
     (local.get $0)
    )
    (local.get $4)
   )
  )
  (block $label$5
   (block $label$6
    (block $label$7
     (br_if $label$7
      (i32.lt_u
       (local.get $1)
       (i32.const 128)
      )
     )
     (br_if $label$6
      (i32.lt_u
       (local.get $1)
       (i32.const 2048)
      )
     )
     (block $label$8
      (br_if $label$8
       (i32.lt_u
        (local.get $1)
        (i32.const 65536)
       )
      )
      (i32.store8 offset=3
       (local.get $4)
       (i32.or
        (i32.and
         (local.get $1)
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (i32.store8
       (local.get $4)
       (i32.or
        (i32.shr_u
         (local.get $1)
         (i32.const 18)
        )
        (i32.const 240)
       )
      )
      (i32.store8 offset=2
       (local.get $4)
       (i32.or
        (i32.and
         (i32.shr_u
          (local.get $1)
          (i32.const 6)
         )
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (i32.store8 offset=1
       (local.get $4)
       (i32.or
        (i32.and
         (i32.shr_u
          (local.get $1)
          (i32.const 12)
         )
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (br $label$5)
     )
     (i32.store8 offset=2
      (local.get $4)
      (i32.or
       (i32.and
        (local.get $1)
        (i32.const 63)
       )
       (i32.const 128)
      )
     )
     (i32.store8
      (local.get $4)
      (i32.or
       (i32.shr_u
        (local.get $1)
        (i32.const 12)
       )
       (i32.const 224)
      )
     )
     (i32.store8 offset=1
      (local.get $4)
      (i32.or
       (i32.and
        (i32.shr_u
         (local.get $1)
         (i32.const 6)
        )
        (i32.const 63)
       )
       (i32.const 128)
      )
     )
     (br $label$5)
    )
    (i32.store8
     (local.get $4)
     (local.get $1)
    )
    (br $label$5)
   )
   (i32.store8 offset=1
    (local.get $4)
    (i32.or
     (i32.and
      (local.get $1)
      (i32.const 63)
     )
     (i32.const 128)
    )
   )
   (i32.store8
    (local.get $4)
    (i32.or
     (i32.shr_u
      (local.get $1)
      (i32.const 6)
     )
     (i32.const 192)
    )
   )
  )
  (i32.store offset=8
   (local.get $0)
   (i32.add
    (local.get $3)
    (local.get $2)
   )
  )
  (i32.const 0)
 )
 (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h7850057311a0cef1E (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (block $label$1
   (br_if $label$1
    (i32.le_u
     (local.get $2)
     (i32.sub
      (i32.load
       (local.get $0)
      )
      (local.tee $3
       (i32.load offset=8
        (local.get $0)
       )
      )
     )
    )
   )
   (call $_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$7reserve21do_reserve_and_handle17h9d7cabd5071c5a51E
    (local.get $0)
    (local.get $3)
    (local.get $2)
    (i32.const 1)
    (i32.const 1)
   )
   (local.set $3
    (i32.load offset=8
     (local.get $0)
    )
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.eqz
     (local.get $2)
    )
   )
   (memory.copy
    (i32.add
     (i32.load offset=4
      (local.get $0)
     )
     (local.get $3)
    )
    (local.get $1)
    (local.get $2)
   )
  )
  (i32.store offset=8
   (local.get $0)
   (i32.add
    (local.get $3)
    (local.get $2)
   )
  )
  (i32.const 0)
 )
 (func $_ZN5alloc7raw_vec11finish_grow17h31fcfb118e0508a4E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (block $label$1
   (br_if $label$1
    (i32.lt_s
     (local.get $2)
     (i32.const 0)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.eqz
        (i32.load offset=4
         (local.get $3)
        )
       )
      )
      (block $label$5
       (br_if $label$5
        (local.tee $4
         (i32.load offset=8
          (local.get $3)
         )
        )
       )
       (block $label$6
        (br_if $label$6
         (local.get $2)
        )
        (local.set $3
         (local.get $1)
        )
        (br $label$2)
       )
       (drop
        (i32.load8_u offset=1053525
         (i32.const 0)
        )
       )
       (br $label$3)
      )
      (local.set $3
       (call $_RNvCs691rhTbG0Ee_7___rustc14___rust_realloc
        (i32.load
         (local.get $3)
        )
        (local.get $4)
        (local.get $1)
        (local.get $2)
       )
      )
      (br $label$2)
     )
     (block $label$7
      (br_if $label$7
       (local.get $2)
      )
      (local.set $3
       (local.get $1)
      )
      (br $label$2)
     )
     (drop
      (i32.load8_u offset=1053525
       (i32.const 0)
      )
     )
    )
    (local.set $3
     (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
      (local.get $2)
      (local.get $1)
     )
    )
   )
   (block $label$8
    (br_if $label$8
     (local.get $3)
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $2)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $1)
    )
    (i32.store
     (local.get $0)
     (i32.const 1)
    )
    (return)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $2)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $3)
   )
   (i32.store
    (local.get $0)
    (i32.const 0)
   )
   (return)
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 0)
  )
  (i32.store
   (local.get $0)
   (i32.const 1)
  )
 )
 (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $2
   (i32.load offset=12
    (local.get $0)
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.lt_u
        (local.get $1)
        (i32.const 256)
       )
      )
      (local.set $3
       (i32.load offset=24
        (local.get $0)
       )
      )
      (block $label$5
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i32.ne
           (local.get $2)
           (local.get $0)
          )
         )
         (br_if $label$6
          (local.tee $1
           (i32.load
            (i32.add
             (local.get $0)
             (select
              (i32.const 20)
              (i32.const 16)
              (local.tee $2
               (i32.load offset=20
                (local.get $0)
               )
              )
             )
            )
           )
          )
         )
         (local.set $2
          (i32.const 0)
         )
         (br $label$5)
        )
        (i32.store offset=12
         (local.tee $1
          (i32.load offset=8
           (local.get $0)
          )
         )
         (local.get $2)
        )
        (i32.store offset=8
         (local.get $2)
         (local.get $1)
        )
        (br $label$5)
       )
       (local.set $4
        (select
         (i32.add
          (local.get $0)
          (i32.const 20)
         )
         (i32.add
          (local.get $0)
          (i32.const 16)
         )
         (local.get $2)
        )
       )
       (loop $label$8
        (local.set $5
         (local.get $4)
        )
        (local.set $4
         (select
          (i32.add
           (local.tee $2
            (local.get $1)
           )
           (i32.const 20)
          )
          (i32.add
           (local.get $2)
           (i32.const 16)
          )
          (local.tee $1
           (i32.load offset=20
            (local.get $2)
           )
          )
         )
        )
        (br_if $label$8
         (local.tee $1
          (i32.load
           (i32.add
            (local.get $2)
            (select
             (i32.const 20)
             (i32.const 16)
             (local.get $1)
            )
           )
          )
         )
        )
       )
       (i32.store
        (local.get $5)
        (i32.const 0)
       )
      )
      (br_if $label$2
       (i32.eqz
        (local.get $3)
       )
      )
      (block $label$9
       (block $label$10
        (br_if $label$10
         (i32.eq
          (local.get $0)
          (i32.load
           (local.tee $1
            (i32.add
             (i32.shl
              (i32.load offset=28
               (local.get $0)
              )
              (i32.const 2)
             )
             (i32.const 1053548)
            )
           )
          )
         )
        )
        (br_if $label$9
         (i32.eq
          (i32.load offset=16
           (local.get $3)
          )
          (local.get $0)
         )
        )
        (i32.store offset=20
         (local.get $3)
         (local.get $2)
        )
        (br_if $label$3
         (local.get $2)
        )
        (br $label$2)
       )
       (i32.store
        (local.get $1)
        (local.get $2)
       )
       (br_if $label$1
        (i32.eqz
         (local.get $2)
        )
       )
       (br $label$3)
      )
      (i32.store offset=16
       (local.get $3)
       (local.get $2)
      )
      (br_if $label$3
       (local.get $2)
      )
      (br $label$2)
     )
     (block $label$11
      (br_if $label$11
       (i32.eq
        (local.get $2)
        (local.tee $4
         (i32.load offset=8
          (local.get $0)
         )
        )
       )
      )
      (i32.store offset=12
       (local.get $4)
       (local.get $2)
      )
      (i32.store offset=8
       (local.get $2)
       (local.get $4)
      )
      (return)
     )
     (i32.store offset=1053956
      (i32.const 0)
      (i32.and
       (i32.load offset=1053956
        (i32.const 0)
       )
       (i32.rotl
        (i32.const -2)
        (i32.shr_u
         (local.get $1)
         (i32.const 3)
        )
       )
      )
     )
     (return)
    )
    (i32.store offset=24
     (local.get $2)
     (local.get $3)
    )
    (block $label$12
     (br_if $label$12
      (i32.eqz
       (local.tee $1
        (i32.load offset=16
         (local.get $0)
        )
       )
      )
     )
     (i32.store offset=16
      (local.get $2)
      (local.get $1)
     )
     (i32.store offset=24
      (local.get $1)
      (local.get $2)
     )
    )
    (br_if $label$2
     (i32.eqz
      (local.tee $1
       (i32.load offset=20
        (local.get $0)
       )
      )
     )
    )
    (i32.store offset=20
     (local.get $2)
     (local.get $1)
    )
    (i32.store offset=24
     (local.get $1)
     (local.get $2)
    )
    (return)
   )
   (return)
  )
  (i32.store offset=1053960
   (i32.const 0)
   (i32.and
    (i32.load offset=1053960
     (i32.const 0)
    )
    (i32.rotl
     (i32.const -2)
     (i32.load offset=28
      (local.get $0)
     )
    )
   )
  )
 )
 (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hcac66ba809c22ef9E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local.set $2
   (i32.add
    (local.get $0)
    (local.get $1)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.tee $3
       (i32.load offset=4
        (local.get $0)
       )
      )
      (i32.const 1)
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (local.get $3)
       (i32.const 2)
      )
     )
    )
    (local.set $1
     (i32.add
      (local.tee $3
       (i32.load
        (local.get $0)
       )
      )
      (local.get $1)
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.ne
       (local.tee $0
        (i32.sub
         (local.get $0)
         (local.get $3)
        )
       )
       (i32.load offset=1053972
        (i32.const 0)
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (i32.and
        (i32.load offset=4
         (local.get $2)
        )
        (i32.const 3)
       )
       (i32.const 3)
      )
     )
     (i32.store offset=1053964
      (i32.const 0)
      (local.get $1)
     )
     (i32.store offset=4
      (local.get $2)
      (i32.and
       (i32.load offset=4
        (local.get $2)
       )
       (i32.const -2)
      )
     )
     (i32.store offset=4
      (local.get $0)
      (i32.or
       (local.get $1)
       (i32.const 1)
      )
     )
     (i32.store
      (local.get $2)
      (local.get $1)
     )
     (br $label$1)
    )
    (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E
     (local.get $0)
     (local.get $3)
    )
   )
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (br_if $label$7
        (i32.and
         (local.tee $3
          (i32.load offset=4
           (local.get $2)
          )
         )
         (i32.const 2)
        )
       )
       (br_if $label$5
        (i32.eq
         (local.get $2)
         (i32.load offset=1053976
          (i32.const 0)
         )
        )
       )
       (br_if $label$4
        (i32.eq
         (local.get $2)
         (i32.load offset=1053972
          (i32.const 0)
         )
        )
       )
       (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E
        (local.get $2)
        (local.tee $3
         (i32.and
          (local.get $3)
          (i32.const -8)
         )
        )
       )
       (i32.store offset=4
        (local.get $0)
        (i32.or
         (local.tee $1
          (i32.add
           (local.get $3)
           (local.get $1)
          )
         )
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (local.get $0)
         (local.get $1)
        )
        (local.get $1)
       )
       (br_if $label$6
        (i32.ne
         (local.get $0)
         (i32.load offset=1053972
          (i32.const 0)
         )
        )
       )
       (i32.store offset=1053964
        (i32.const 0)
        (local.get $1)
       )
       (return)
      )
      (i32.store offset=4
       (local.get $2)
       (i32.and
        (local.get $3)
        (i32.const -2)
       )
      )
      (i32.store offset=4
       (local.get $0)
       (i32.or
        (local.get $1)
        (i32.const 1)
       )
      )
      (i32.store
       (i32.add
        (local.get $0)
        (local.get $1)
       )
       (local.get $1)
      )
     )
     (block $label$8
      (br_if $label$8
       (i32.lt_u
        (local.get $1)
        (i32.const 256)
       )
      )
      (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h36f158d3d0e17661E
       (local.get $0)
       (local.get $1)
      )
      (return)
     )
     (local.set $2
      (i32.add
       (i32.and
        (local.get $1)
        (i32.const 248)
       )
       (i32.const 1053692)
      )
     )
     (block $label$9
      (block $label$10
       (br_if $label$10
        (i32.and
         (local.tee $3
          (i32.load offset=1053956
           (i32.const 0)
          )
         )
         (local.tee $1
          (i32.shl
           (i32.const 1)
           (i32.shr_u
            (local.get $1)
            (i32.const 3)
           )
          )
         )
        )
       )
       (i32.store offset=1053956
        (i32.const 0)
        (i32.or
         (local.get $3)
         (local.get $1)
        )
       )
       (local.set $1
        (local.get $2)
       )
       (br $label$9)
      )
      (local.set $1
       (i32.load offset=8
        (local.get $2)
       )
      )
     )
     (i32.store offset=8
      (local.get $2)
      (local.get $0)
     )
     (i32.store offset=12
      (local.get $1)
      (local.get $0)
     )
     (i32.store offset=12
      (local.get $0)
      (local.get $2)
     )
     (i32.store offset=8
      (local.get $0)
      (local.get $1)
     )
     (return)
    )
    (i32.store offset=1053976
     (i32.const 0)
     (local.get $0)
    )
    (i32.store offset=1053968
     (i32.const 0)
     (local.tee $1
      (i32.add
       (i32.load offset=1053968
        (i32.const 0)
       )
       (local.get $1)
      )
     )
    )
    (i32.store offset=4
     (local.get $0)
     (i32.or
      (local.get $1)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (i32.ne
      (local.get $0)
      (i32.load offset=1053972
       (i32.const 0)
      )
     )
    )
    (i32.store offset=1053964
     (i32.const 0)
     (i32.const 0)
    )
    (i32.store offset=1053972
     (i32.const 0)
     (i32.const 0)
    )
    (return)
   )
   (i32.store offset=1053972
    (i32.const 0)
    (local.get $0)
   )
   (i32.store offset=1053964
    (i32.const 0)
    (local.tee $1
     (i32.add
      (i32.load offset=1053964
       (i32.const 0)
      )
      (local.get $1)
     )
    )
   )
   (i32.store offset=4
    (local.get $0)
    (i32.or
     (local.get $1)
     (i32.const 1)
    )
   )
   (i32.store
    (i32.add
     (local.get $0)
     (local.get $1)
    )
    (local.get $1)
   )
   (return)
  )
 )
 (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h36f158d3d0e17661E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.lt_u
     (local.get $1)
     (i32.const 256)
    )
   )
   (local.set $2
    (i32.const 31)
   )
   (br_if $label$1
    (i32.gt_u
     (local.get $1)
     (i32.const 16777215)
    )
   )
   (local.set $2
    (i32.add
     (i32.sub
      (i32.and
       (i32.shr_u
        (local.get $1)
        (i32.sub
         (i32.const 6)
         (local.tee $2
          (i32.clz
           (i32.shr_u
            (local.get $1)
            (i32.const 8)
           )
          )
         )
        )
       )
       (i32.const 1)
      )
      (i32.shl
       (local.get $2)
       (i32.const 1)
      )
     )
     (i32.const 62)
    )
   )
  )
  (i64.store offset=16 align=4
   (local.get $0)
   (i64.const 0)
  )
  (i32.store offset=28
   (local.get $0)
   (local.get $2)
  )
  (local.set $3
   (i32.add
    (i32.shl
     (local.get $2)
     (i32.const 2)
    )
    (i32.const 1053548)
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.and
     (i32.load offset=1053960
      (i32.const 0)
     )
     (local.tee $4
      (i32.shl
       (i32.const 1)
       (local.get $2)
      )
     )
    )
   )
   (i32.store
    (local.get $3)
    (local.get $0)
   )
   (i32.store offset=24
    (local.get $0)
    (local.get $3)
   )
   (i32.store offset=12
    (local.get $0)
    (local.get $0)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $0)
   )
   (i32.store offset=1053960
    (i32.const 0)
    (i32.or
     (i32.load offset=1053960
      (i32.const 0)
     )
     (local.get $4)
    )
   )
   (return)
  )
  (block $label$3
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.and
        (i32.load offset=4
         (local.tee $4
          (i32.load
           (local.get $3)
          )
         )
        )
        (i32.const -8)
       )
       (local.get $1)
      )
     )
     (local.set $2
      (local.get $4)
     )
     (br $label$4)
    )
    (local.set $3
     (i32.shl
      (local.get $1)
      (select
       (i32.const 0)
       (i32.sub
        (i32.const 25)
        (i32.shr_u
         (local.get $2)
         (i32.const 1)
        )
       )
       (i32.eq
        (local.get $2)
        (i32.const 31)
       )
      )
     )
    )
    (loop $label$6
     (br_if $label$3
      (i32.eqz
       (local.tee $2
        (i32.load offset=16
         (local.tee $5
          (i32.add
           (local.get $4)
           (i32.and
            (i32.shr_u
             (local.get $3)
             (i32.const 29)
            )
            (i32.const 4)
           )
          )
         )
        )
       )
      )
     )
     (local.set $3
      (i32.shl
       (local.get $3)
       (i32.const 1)
      )
     )
     (local.set $4
      (local.get $2)
     )
     (br_if $label$6
      (i32.ne
       (i32.and
        (i32.load offset=4
         (local.get $2)
        )
        (i32.const -8)
       )
       (local.get $1)
      )
     )
    )
   )
   (i32.store offset=12
    (local.tee $3
     (i32.load offset=8
      (local.get $2)
     )
    )
    (local.get $0)
   )
   (i32.store offset=8
    (local.get $2)
    (local.get $0)
   )
   (i32.store offset=24
    (local.get $0)
    (i32.const 0)
   )
   (i32.store offset=12
    (local.get $0)
    (local.get $2)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $3)
   )
   (return)
  )
  (i32.store
   (i32.add
    (local.get $5)
    (i32.const 16)
   )
   (local.get $0)
  )
  (i32.store offset=24
   (local.get $0)
   (local.get $4)
  )
  (i32.store offset=12
   (local.get $0)
   (local.get $0)
  )
  (i32.store offset=8
   (local.get $0)
   (local.get $0)
  )
 )
 (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hd05ac7097937f97bE (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $3
   (i32.add
    (local.tee $1
     (i32.add
      (local.get $0)
      (i32.const -8)
     )
    )
    (local.tee $0
     (i32.and
      (local.tee $2
       (i32.load
        (i32.add
         (local.get $0)
         (i32.const -4)
        )
       )
      )
      (i32.const -8)
     )
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.get $2)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (local.get $2)
       (i32.const 2)
      )
     )
    )
    (local.set $0
     (i32.add
      (local.tee $2
       (i32.load
        (local.get $1)
       )
      )
      (local.get $0)
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.ne
       (local.tee $1
        (i32.sub
         (local.get $1)
         (local.get $2)
        )
       )
       (i32.load offset=1053972
        (i32.const 0)
       )
      )
     )
     (br_if $label$2
      (i32.ne
       (i32.and
        (i32.load offset=4
         (local.get $3)
        )
        (i32.const 3)
       )
       (i32.const 3)
      )
     )
     (i32.store offset=1053964
      (i32.const 0)
      (local.get $0)
     )
     (i32.store offset=4
      (local.get $3)
      (i32.and
       (i32.load offset=4
        (local.get $3)
       )
       (i32.const -2)
      )
     )
     (i32.store offset=4
      (local.get $1)
      (i32.or
       (local.get $0)
       (i32.const 1)
      )
     )
     (i32.store
      (local.get $3)
      (local.get $0)
     )
     (return)
    )
    (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E
     (local.get $1)
     (local.get $2)
    )
   )
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (block $label$8
        (block $label$9
         (br_if $label$9
          (i32.and
           (local.tee $2
            (i32.load offset=4
             (local.get $3)
            )
           )
           (i32.const 2)
          )
         )
         (br_if $label$7
          (i32.eq
           (local.get $3)
           (i32.load offset=1053976
            (i32.const 0)
           )
          )
         )
         (br_if $label$6
          (i32.eq
           (local.get $3)
           (i32.load offset=1053972
            (i32.const 0)
           )
          )
         )
         (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E
          (local.get $3)
          (local.tee $2
           (i32.and
            (local.get $2)
            (i32.const -8)
           )
          )
         )
         (i32.store offset=4
          (local.get $1)
          (i32.or
           (local.tee $0
            (i32.add
             (local.get $2)
             (local.get $0)
            )
           )
           (i32.const 1)
          )
         )
         (i32.store
          (i32.add
           (local.get $1)
           (local.get $0)
          )
          (local.get $0)
         )
         (br_if $label$8
          (i32.ne
           (local.get $1)
           (i32.load offset=1053972
            (i32.const 0)
           )
          )
         )
         (i32.store offset=1053964
          (i32.const 0)
          (local.get $0)
         )
         (return)
        )
        (i32.store offset=4
         (local.get $3)
         (i32.and
          (local.get $2)
          (i32.const -2)
         )
        )
        (i32.store offset=4
         (local.get $1)
         (i32.or
          (local.get $0)
          (i32.const 1)
         )
        )
        (i32.store
         (i32.add
          (local.get $1)
          (local.get $0)
         )
         (local.get $0)
        )
       )
       (br_if $label$5
        (i32.lt_u
         (local.get $0)
         (i32.const 256)
        )
       )
       (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h36f158d3d0e17661E
        (local.get $1)
        (local.get $0)
       )
       (local.set $1
        (i32.const 0)
       )
       (i32.store offset=1053996
        (i32.const 0)
        (local.tee $0
         (i32.add
          (i32.load offset=1053996
           (i32.const 0)
          )
          (i32.const -1)
         )
        )
       )
       (br_if $label$1
        (local.get $0)
       )
       (block $label$10
        (br_if $label$10
         (i32.eqz
          (local.tee $0
           (i32.load offset=1053684
            (i32.const 0)
           )
          )
         )
        )
        (local.set $1
         (i32.const 0)
        )
        (loop $label$11
         (local.set $1
          (i32.add
           (local.get $1)
           (i32.const 1)
          )
         )
         (br_if $label$11
          (local.tee $0
           (i32.load offset=8
            (local.get $0)
           )
          )
         )
        )
       )
       (i32.store offset=1053996
        (i32.const 0)
        (select
         (local.get $1)
         (i32.const 4095)
         (i32.gt_u
          (local.get $1)
          (i32.const 4095)
         )
        )
       )
       (return)
      )
      (i32.store offset=1053976
       (i32.const 0)
       (local.get $1)
      )
      (i32.store offset=1053968
       (i32.const 0)
       (local.tee $0
        (i32.add
         (i32.load offset=1053968
          (i32.const 0)
         )
         (local.get $0)
        )
       )
      )
      (i32.store offset=4
       (local.get $1)
       (i32.or
        (local.get $0)
        (i32.const 1)
       )
      )
      (block $label$12
       (br_if $label$12
        (i32.ne
         (local.get $1)
         (i32.load offset=1053972
          (i32.const 0)
         )
        )
       )
       (i32.store offset=1053964
        (i32.const 0)
        (i32.const 0)
       )
       (i32.store offset=1053972
        (i32.const 0)
        (i32.const 0)
       )
      )
      (br_if $label$1
       (i32.le_u
        (local.get $0)
        (local.tee $4
         (i32.load offset=1053988
          (i32.const 0)
         )
        )
       )
      )
      (br_if $label$1
       (i32.eqz
        (local.tee $0
         (i32.load offset=1053976
          (i32.const 0)
         )
        )
       )
      )
      (local.set $2
       (i32.const 0)
      )
      (br_if $label$4
       (i32.lt_u
        (local.tee $5
         (i32.load offset=1053968
          (i32.const 0)
         )
        )
        (i32.const 41)
       )
      )
      (local.set $1
       (i32.const 1053676)
      )
      (loop $label$13
       (block $label$14
        (br_if $label$14
         (i32.gt_u
          (local.tee $3
           (i32.load
            (local.get $1)
           )
          )
          (local.get $0)
         )
        )
        (br_if $label$4
         (i32.lt_u
          (local.get $0)
          (i32.add
           (local.get $3)
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
        )
       )
       (local.set $1
        (i32.load offset=8
         (local.get $1)
        )
       )
       (br $label$13)
      )
     )
     (i32.store offset=1053972
      (i32.const 0)
      (local.get $1)
     )
     (i32.store offset=1053964
      (i32.const 0)
      (local.tee $0
       (i32.add
        (i32.load offset=1053964
         (i32.const 0)
        )
        (local.get $0)
       )
      )
     )
     (i32.store offset=4
      (local.get $1)
      (i32.or
       (local.get $0)
       (i32.const 1)
      )
     )
     (i32.store
      (i32.add
       (local.get $1)
       (local.get $0)
      )
      (local.get $0)
     )
     (return)
    )
    (local.set $3
     (i32.add
      (i32.and
       (local.get $0)
       (i32.const 248)
      )
      (i32.const 1053692)
     )
    )
    (block $label$15
     (block $label$16
      (br_if $label$16
       (i32.and
        (local.tee $2
         (i32.load offset=1053956
          (i32.const 0)
         )
        )
        (local.tee $0
         (i32.shl
          (i32.const 1)
          (i32.shr_u
           (local.get $0)
           (i32.const 3)
          )
         )
        )
       )
      )
      (i32.store offset=1053956
       (i32.const 0)
       (i32.or
        (local.get $2)
        (local.get $0)
       )
      )
      (local.set $0
       (local.get $3)
      )
      (br $label$15)
     )
     (local.set $0
      (i32.load offset=8
       (local.get $3)
      )
     )
    )
    (i32.store offset=8
     (local.get $3)
     (local.get $1)
    )
    (i32.store offset=12
     (local.get $0)
     (local.get $1)
    )
    (i32.store offset=12
     (local.get $1)
     (local.get $3)
    )
    (i32.store offset=8
     (local.get $1)
     (local.get $0)
    )
    (return)
   )
   (block $label$17
    (br_if $label$17
     (i32.eqz
      (local.tee $1
       (i32.load offset=1053684
        (i32.const 0)
       )
      )
     )
    )
    (local.set $2
     (i32.const 0)
    )
    (loop $label$18
     (local.set $2
      (i32.add
       (local.get $2)
       (i32.const 1)
      )
     )
     (br_if $label$18
      (local.tee $1
       (i32.load offset=8
        (local.get $1)
       )
      )
     )
    )
   )
   (i32.store offset=1053996
    (i32.const 0)
    (select
     (local.get $2)
     (i32.const 4095)
     (i32.gt_u
      (local.get $2)
      (i32.const 4095)
     )
    )
   )
   (br_if $label$1
    (i32.le_u
     (local.get $5)
     (local.get $4)
    )
   )
   (i32.store offset=1053988
    (i32.const 0)
    (i32.const -1)
   )
  )
 )
 (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h90ff8eedc9c6744dE (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (br_if $label$8
           (i32.lt_u
            (local.get $0)
            (i32.const 245)
           )
          )
          (block $label$9
           (br_if $label$9
            (i32.le_u
             (local.get $0)
             (i32.const -65588)
            )
           )
           (local.set $0
            (i32.const 0)
           )
           (br $label$1)
          )
          (local.set $3
           (i32.and
            (local.tee $2
             (i32.add
              (local.get $0)
              (i32.const 11)
             )
            )
            (i32.const -8)
           )
          )
          (br_if $label$4
           (i32.eqz
            (local.tee $4
             (i32.load offset=1053960
              (i32.const 0)
             )
            )
           )
          )
          (local.set $5
           (i32.const 31)
          )
          (block $label$10
           (br_if $label$10
            (i32.gt_u
             (local.get $0)
             (i32.const 16777204)
            )
           )
           (local.set $5
            (i32.add
             (i32.sub
              (i32.and
               (i32.shr_u
                (local.get $3)
                (i32.sub
                 (i32.const 6)
                 (local.tee $0
                  (i32.clz
                   (i32.shr_u
                    (local.get $2)
                    (i32.const 8)
                   )
                  )
                 )
                )
               )
               (i32.const 1)
              )
              (i32.shl
               (local.get $0)
               (i32.const 1)
              )
             )
             (i32.const 62)
            )
           )
          )
          (local.set $2
           (i32.sub
            (i32.const 0)
            (local.get $3)
           )
          )
          (block $label$11
           (br_if $label$11
            (local.tee $6
             (i32.load
              (i32.add
               (i32.shl
                (local.get $5)
                (i32.const 2)
               )
               (i32.const 1053548)
              )
             )
            )
           )
           (local.set $0
            (i32.const 0)
           )
           (local.set $7
            (i32.const 0)
           )
           (br $label$7)
          )
          (local.set $0
           (i32.const 0)
          )
          (local.set $8
           (i32.shl
            (local.get $3)
            (select
             (i32.const 0)
             (i32.sub
              (i32.const 25)
              (i32.shr_u
               (local.get $5)
               (i32.const 1)
              )
             )
             (i32.eq
              (local.get $5)
              (i32.const 31)
             )
            )
           )
          )
          (local.set $7
           (i32.const 0)
          )
          (loop $label$12
           (block $label$13
            (br_if $label$13
             (i32.lt_u
              (local.tee $9
               (i32.and
                (i32.load offset=4
                 (local.tee $6
                  (local.get $6)
                 )
                )
                (i32.const -8)
               )
              )
              (local.get $3)
             )
            )
            (br_if $label$13
             (i32.ge_u
              (local.tee $9
               (i32.sub
                (local.get $9)
                (local.get $3)
               )
              )
              (local.get $2)
             )
            )
            (local.set $2
             (local.get $9)
            )
            (local.set $7
             (local.get $6)
            )
            (br_if $label$13
             (local.get $9)
            )
            (local.set $2
             (i32.const 0)
            )
            (local.set $7
             (local.get $6)
            )
            (local.set $0
             (local.get $6)
            )
            (br $label$6)
           )
           (local.set $0
            (select
             (select
              (local.tee $9
               (i32.load offset=20
                (local.get $6)
               )
              )
              (local.get $0)
              (i32.ne
               (local.get $9)
               (local.tee $6
                (i32.load offset=16
                 (i32.add
                  (local.get $6)
                  (i32.and
                   (i32.shr_u
                    (local.get $8)
                    (i32.const 29)
                   )
                   (i32.const 4)
                  )
                 )
                )
               )
              )
             )
             (local.get $0)
             (local.get $9)
            )
           )
           (local.set $8
            (i32.shl
             (local.get $8)
             (i32.const 1)
            )
           )
           (br_if $label$7
            (i32.eqz
             (local.get $6)
            )
           )
           (br $label$12)
          )
         )
         (block $label$14
          (br_if $label$14
           (i32.eqz
            (i32.and
             (local.tee $0
              (i32.shr_u
               (local.tee $6
                (i32.load offset=1053956
                 (i32.const 0)
                )
               )
               (local.tee $2
                (i32.shr_u
                 (local.tee $3
                  (select
                   (i32.const 16)
                   (i32.and
                    (i32.add
                     (local.get $0)
                     (i32.const 11)
                    )
                    (i32.const 504)
                   )
                   (i32.lt_u
                    (local.get $0)
                    (i32.const 11)
                   )
                  )
                 )
                 (i32.const 3)
                )
               )
              )
             )
             (i32.const 3)
            )
           )
          )
          (block $label$15
           (block $label$16
            (br_if $label$16
             (i32.eq
              (local.tee $0
               (i32.add
                (local.tee $3
                 (i32.shl
                  (local.tee $8
                   (i32.add
                    (i32.and
                     (i32.xor
                      (local.get $0)
                      (i32.const -1)
                     )
                     (i32.const 1)
                    )
                    (local.get $2)
                   )
                  )
                  (i32.const 3)
                 )
                )
                (i32.const 1053692)
               )
              )
              (local.tee $7
               (i32.load offset=8
                (local.tee $2
                 (i32.load
                  (i32.add
                   (local.get $3)
                   (i32.const 1053700)
                  )
                 )
                )
               )
              )
             )
            )
            (i32.store offset=12
             (local.get $7)
             (local.get $0)
            )
            (i32.store offset=8
             (local.get $0)
             (local.get $7)
            )
            (br $label$15)
           )
           (i32.store offset=1053956
            (i32.const 0)
            (i32.and
             (local.get $6)
             (i32.rotl
              (i32.const -2)
              (local.get $8)
             )
            )
           )
          )
          (local.set $0
           (i32.add
            (local.get $2)
            (i32.const 8)
           )
          )
          (i32.store offset=4
           (local.get $2)
           (i32.or
            (local.get $3)
            (i32.const 3)
           )
          )
          (i32.store offset=4
           (local.tee $3
            (i32.add
             (local.get $2)
             (local.get $3)
            )
           )
           (i32.or
            (i32.load offset=4
             (local.get $3)
            )
            (i32.const 1)
           )
          )
          (br $label$1)
         )
         (br_if $label$4
          (i32.le_u
           (local.get $3)
           (i32.load offset=1053964
            (i32.const 0)
           )
          )
         )
         (block $label$17
          (block $label$18
           (block $label$19
            (br_if $label$19
             (local.get $0)
            )
            (br_if $label$4
             (i32.eqz
              (local.tee $0
               (i32.load offset=1053960
                (i32.const 0)
               )
              )
             )
            )
            (local.set $2
             (i32.sub
              (i32.and
               (i32.load offset=4
                (local.tee $7
                 (i32.load
                  (i32.add
                   (i32.shl
                    (i32.ctz
                     (local.get $0)
                    )
                    (i32.const 2)
                   )
                   (i32.const 1053548)
                  )
                 )
                )
               )
               (i32.const -8)
              )
              (local.get $3)
             )
            )
            (local.set $6
             (local.get $7)
            )
            (loop $label$20
             (block $label$21
              (br_if $label$21
               (local.tee $0
                (i32.load offset=16
                 (local.get $7)
                )
               )
              )
              (br_if $label$21
               (local.tee $0
                (i32.load offset=20
                 (local.get $7)
                )
               )
              )
              (local.set $5
               (i32.load offset=24
                (local.get $6)
               )
              )
              (block $label$22
               (block $label$23
                (block $label$24
                 (br_if $label$24
                  (i32.ne
                   (local.tee $0
                    (i32.load offset=12
                     (local.get $6)
                    )
                   )
                   (local.get $6)
                  )
                 )
                 (br_if $label$23
                  (local.tee $7
                   (i32.load
                    (i32.add
                     (local.get $6)
                     (select
                      (i32.const 20)
                      (i32.const 16)
                      (local.tee $0
                       (i32.load offset=20
                        (local.get $6)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                 (local.set $0
                  (i32.const 0)
                 )
                 (br $label$22)
                )
                (i32.store offset=12
                 (local.tee $7
                  (i32.load offset=8
                   (local.get $6)
                  )
                 )
                 (local.get $0)
                )
                (i32.store offset=8
                 (local.get $0)
                 (local.get $7)
                )
                (br $label$22)
               )
               (local.set $8
                (select
                 (i32.add
                  (local.get $6)
                  (i32.const 20)
                 )
                 (i32.add
                  (local.get $6)
                  (i32.const 16)
                 )
                 (local.get $0)
                )
               )
               (loop $label$25
                (local.set $9
                 (local.get $8)
                )
                (local.set $8
                 (select
                  (i32.add
                   (local.tee $0
                    (local.get $7)
                   )
                   (i32.const 20)
                  )
                  (i32.add
                   (local.get $0)
                   (i32.const 16)
                  )
                  (local.tee $7
                   (i32.load offset=20
                    (local.get $0)
                   )
                  )
                 )
                )
                (br_if $label$25
                 (local.tee $7
                  (i32.load
                   (i32.add
                    (local.get $0)
                    (select
                     (i32.const 20)
                     (i32.const 16)
                     (local.get $7)
                    )
                   )
                  )
                 )
                )
               )
               (i32.store
                (local.get $9)
                (i32.const 0)
               )
              )
              (br_if $label$17
               (i32.eqz
                (local.get $5)
               )
              )
              (block $label$26
               (block $label$27
                (br_if $label$27
                 (i32.eq
                  (local.get $6)
                  (i32.load
                   (local.tee $7
                    (i32.add
                     (i32.shl
                      (i32.load offset=28
                       (local.get $6)
                      )
                      (i32.const 2)
                     )
                     (i32.const 1053548)
                    )
                   )
                  )
                 )
                )
                (block $label$28
                 (br_if $label$28
                  (i32.eq
                   (i32.load offset=16
                    (local.get $5)
                   )
                   (local.get $6)
                  )
                 )
                 (i32.store offset=20
                  (local.get $5)
                  (local.get $0)
                 )
                 (br_if $label$26
                  (local.get $0)
                 )
                 (br $label$17)
                )
                (i32.store offset=16
                 (local.get $5)
                 (local.get $0)
                )
                (br_if $label$26
                 (local.get $0)
                )
                (br $label$17)
               )
               (i32.store
                (local.get $7)
                (local.get $0)
               )
               (br_if $label$18
                (i32.eqz
                 (local.get $0)
                )
               )
              )
              (i32.store offset=24
               (local.get $0)
               (local.get $5)
              )
              (block $label$29
               (br_if $label$29
                (i32.eqz
                 (local.tee $7
                  (i32.load offset=16
                   (local.get $6)
                  )
                 )
                )
               )
               (i32.store offset=16
                (local.get $0)
                (local.get $7)
               )
               (i32.store offset=24
                (local.get $7)
                (local.get $0)
               )
              )
              (br_if $label$17
               (i32.eqz
                (local.tee $7
                 (i32.load offset=20
                  (local.get $6)
                 )
                )
               )
              )
              (i32.store offset=20
               (local.get $0)
               (local.get $7)
              )
              (i32.store offset=24
               (local.get $7)
               (local.get $0)
              )
              (br $label$17)
             )
             (local.set $2
              (select
               (local.tee $7
                (i32.sub
                 (i32.and
                  (i32.load offset=4
                   (local.get $0)
                  )
                  (i32.const -8)
                 )
                 (local.get $3)
                )
               )
               (local.get $2)
               (local.tee $7
                (i32.lt_u
                 (local.get $7)
                 (local.get $2)
                )
               )
              )
             )
             (local.set $6
              (select
               (local.get $0)
               (local.get $6)
               (local.get $7)
              )
             )
             (local.set $7
              (local.get $0)
             )
             (br $label$20)
            )
           )
           (block $label$30
            (block $label$31
             (br_if $label$31
              (i32.eq
               (local.tee $7
                (i32.add
                 (local.tee $2
                  (i32.shl
                   (local.tee $9
                    (i32.ctz
                     (i32.and
                      (i32.shl
                       (local.get $0)
                       (local.get $2)
                      )
                      (i32.or
                       (local.tee $0
                        (i32.shl
                         (i32.const 2)
                         (local.get $2)
                        )
                       )
                       (i32.sub
                        (i32.const 0)
                        (local.get $0)
                       )
                      )
                     )
                    )
                   )
                   (i32.const 3)
                  )
                 )
                 (i32.const 1053692)
                )
               )
               (local.tee $8
                (i32.load offset=8
                 (local.tee $0
                  (i32.load
                   (i32.add
                    (local.get $2)
                    (i32.const 1053700)
                   )
                  )
                 )
                )
               )
              )
             )
             (i32.store offset=12
              (local.get $8)
              (local.get $7)
             )
             (i32.store offset=8
              (local.get $7)
              (local.get $8)
             )
             (br $label$30)
            )
            (i32.store offset=1053956
             (i32.const 0)
             (i32.and
              (local.get $6)
              (i32.rotl
               (i32.const -2)
               (local.get $9)
              )
             )
            )
           )
           (i32.store offset=4
            (local.get $0)
            (i32.or
             (local.get $3)
             (i32.const 3)
            )
           )
           (i32.store offset=4
            (local.tee $8
             (i32.add
              (local.get $0)
              (local.get $3)
             )
            )
            (i32.or
             (local.tee $7
              (i32.sub
               (local.get $2)
               (local.get $3)
              )
             )
             (i32.const 1)
            )
           )
           (i32.store
            (i32.add
             (local.get $0)
             (local.get $2)
            )
            (local.get $7)
           )
           (block $label$32
            (br_if $label$32
             (i32.eqz
              (local.tee $6
               (i32.load offset=1053964
                (i32.const 0)
               )
              )
             )
            )
            (local.set $2
             (i32.add
              (i32.and
               (local.get $6)
               (i32.const -8)
              )
              (i32.const 1053692)
             )
            )
            (local.set $3
             (i32.load offset=1053972
              (i32.const 0)
             )
            )
            (block $label$33
             (block $label$34
              (br_if $label$34
               (i32.and
                (local.tee $9
                 (i32.load offset=1053956
                  (i32.const 0)
                 )
                )
                (local.tee $6
                 (i32.shl
                  (i32.const 1)
                  (i32.shr_u
                   (local.get $6)
                   (i32.const 3)
                  )
                 )
                )
               )
              )
              (i32.store offset=1053956
               (i32.const 0)
               (i32.or
                (local.get $9)
                (local.get $6)
               )
              )
              (local.set $6
               (local.get $2)
              )
              (br $label$33)
             )
             (local.set $6
              (i32.load offset=8
               (local.get $2)
              )
             )
            )
            (i32.store offset=8
             (local.get $2)
             (local.get $3)
            )
            (i32.store offset=12
             (local.get $6)
             (local.get $3)
            )
            (i32.store offset=12
             (local.get $3)
             (local.get $2)
            )
            (i32.store offset=8
             (local.get $3)
             (local.get $6)
            )
           )
           (local.set $0
            (i32.add
             (local.get $0)
             (i32.const 8)
            )
           )
           (i32.store offset=1053972
            (i32.const 0)
            (local.get $8)
           )
           (i32.store offset=1053964
            (i32.const 0)
            (local.get $7)
           )
           (br $label$1)
          )
          (i32.store offset=1053960
           (i32.const 0)
           (i32.and
            (i32.load offset=1053960
             (i32.const 0)
            )
            (i32.rotl
             (i32.const -2)
             (i32.load offset=28
              (local.get $6)
             )
            )
           )
          )
         )
         (block $label$35
          (block $label$36
           (block $label$37
            (br_if $label$37
             (i32.lt_u
              (local.get $2)
              (i32.const 16)
             )
            )
            (i32.store offset=4
             (local.get $6)
             (i32.or
              (local.get $3)
              (i32.const 3)
             )
            )
            (i32.store offset=4
             (local.tee $3
              (i32.add
               (local.get $6)
               (local.get $3)
              )
             )
             (i32.or
              (local.get $2)
              (i32.const 1)
             )
            )
            (i32.store
             (i32.add
              (local.get $3)
              (local.get $2)
             )
             (local.get $2)
            )
            (br_if $label$36
             (i32.eqz
              (local.tee $8
               (i32.load offset=1053964
                (i32.const 0)
               )
              )
             )
            )
            (local.set $7
             (i32.add
              (i32.and
               (local.get $8)
               (i32.const -8)
              )
              (i32.const 1053692)
             )
            )
            (local.set $0
             (i32.load offset=1053972
              (i32.const 0)
             )
            )
            (block $label$38
             (block $label$39
              (br_if $label$39
               (i32.and
                (local.tee $9
                 (i32.load offset=1053956
                  (i32.const 0)
                 )
                )
                (local.tee $8
                 (i32.shl
                  (i32.const 1)
                  (i32.shr_u
                   (local.get $8)
                   (i32.const 3)
                  )
                 )
                )
               )
              )
              (i32.store offset=1053956
               (i32.const 0)
               (i32.or
                (local.get $9)
                (local.get $8)
               )
              )
              (local.set $8
               (local.get $7)
              )
              (br $label$38)
             )
             (local.set $8
              (i32.load offset=8
               (local.get $7)
              )
             )
            )
            (i32.store offset=8
             (local.get $7)
             (local.get $0)
            )
            (i32.store offset=12
             (local.get $8)
             (local.get $0)
            )
            (i32.store offset=12
             (local.get $0)
             (local.get $7)
            )
            (i32.store offset=8
             (local.get $0)
             (local.get $8)
            )
            (br $label$36)
           )
           (i32.store offset=4
            (local.get $6)
            (i32.or
             (local.tee $0
              (i32.add
               (local.get $2)
               (local.get $3)
              )
             )
             (i32.const 3)
            )
           )
           (i32.store offset=4
            (local.tee $0
             (i32.add
              (local.get $6)
              (local.get $0)
             )
            )
            (i32.or
             (i32.load offset=4
              (local.get $0)
             )
             (i32.const 1)
            )
           )
           (br $label$35)
          )
          (i32.store offset=1053972
           (i32.const 0)
           (local.get $3)
          )
          (i32.store offset=1053964
           (i32.const 0)
           (local.get $2)
          )
         )
         (local.set $0
          (i32.add
           (local.get $6)
           (i32.const 8)
          )
         )
         (br $label$1)
        )
        (block $label$40
         (br_if $label$40
          (i32.or
           (local.get $0)
           (local.get $7)
          )
         )
         (local.set $7
          (i32.const 0)
         )
         (br_if $label$4
          (i32.eqz
           (local.tee $0
            (i32.and
             (i32.or
              (local.tee $0
               (i32.shl
                (i32.const 2)
                (local.get $5)
               )
              )
              (i32.sub
               (i32.const 0)
               (local.get $0)
              )
             )
             (local.get $4)
            )
           )
          )
         )
         (local.set $0
          (i32.load
           (i32.add
            (i32.shl
             (i32.ctz
              (local.get $0)
             )
             (i32.const 2)
            )
            (i32.const 1053548)
           )
          )
         )
        )
        (br_if $label$5
         (i32.eqz
          (local.get $0)
         )
        )
       )
       (loop $label$41
        (local.set $4
         (select
          (local.get $0)
          (local.get $7)
          (local.tee $5
           (i32.lt_u
            (local.tee $9
             (i32.sub
              (local.tee $6
               (i32.and
                (i32.load offset=4
                 (local.get $0)
                )
                (i32.const -8)
               )
              )
              (local.get $3)
             )
            )
            (local.get $2)
           )
          )
         )
        )
        (local.set $8
         (i32.lt_u
          (local.get $6)
          (local.get $3)
         )
        )
        (local.set $9
         (select
          (local.get $9)
          (local.get $2)
          (local.get $5)
         )
        )
        (block $label$42
         (br_if $label$42
          (local.tee $6
           (i32.load offset=16
            (local.get $0)
           )
          )
         )
         (local.set $6
          (i32.load offset=20
           (local.get $0)
          )
         )
        )
        (local.set $7
         (select
          (local.get $7)
          (local.get $4)
          (local.get $8)
         )
        )
        (local.set $2
         (select
          (local.get $2)
          (local.get $9)
          (local.get $8)
         )
        )
        (local.set $0
         (local.get $6)
        )
        (br_if $label$41
         (local.get $6)
        )
       )
      )
      (br_if $label$4
       (i32.eqz
        (local.get $7)
       )
      )
      (block $label$43
       (br_if $label$43
        (i32.lt_u
         (local.tee $0
          (i32.load offset=1053964
           (i32.const 0)
          )
         )
         (local.get $3)
        )
       )
       (br_if $label$4
        (i32.ge_u
         (local.get $2)
         (i32.sub
          (local.get $0)
          (local.get $3)
         )
        )
       )
      )
      (local.set $5
       (i32.load offset=24
        (local.get $7)
       )
      )
      (block $label$44
       (block $label$45
        (block $label$46
         (br_if $label$46
          (i32.ne
           (local.tee $0
            (i32.load offset=12
             (local.get $7)
            )
           )
           (local.get $7)
          )
         )
         (br_if $label$45
          (local.tee $6
           (i32.load
            (i32.add
             (local.get $7)
             (select
              (i32.const 20)
              (i32.const 16)
              (local.tee $0
               (i32.load offset=20
                (local.get $7)
               )
              )
             )
            )
           )
          )
         )
         (local.set $0
          (i32.const 0)
         )
         (br $label$44)
        )
        (i32.store offset=12
         (local.tee $6
          (i32.load offset=8
           (local.get $7)
          )
         )
         (local.get $0)
        )
        (i32.store offset=8
         (local.get $0)
         (local.get $6)
        )
        (br $label$44)
       )
       (local.set $8
        (select
         (i32.add
          (local.get $7)
          (i32.const 20)
         )
         (i32.add
          (local.get $7)
          (i32.const 16)
         )
         (local.get $0)
        )
       )
       (loop $label$47
        (local.set $9
         (local.get $8)
        )
        (local.set $8
         (select
          (i32.add
           (local.tee $0
            (local.get $6)
           )
           (i32.const 20)
          )
          (i32.add
           (local.get $0)
           (i32.const 16)
          )
          (local.tee $6
           (i32.load offset=20
            (local.get $0)
           )
          )
         )
        )
        (br_if $label$47
         (local.tee $6
          (i32.load
           (i32.add
            (local.get $0)
            (select
             (i32.const 20)
             (i32.const 16)
             (local.get $6)
            )
           )
          )
         )
        )
       )
       (i32.store
        (local.get $9)
        (i32.const 0)
       )
      )
      (br_if $label$2
       (i32.eqz
        (local.get $5)
       )
      )
      (block $label$48
       (block $label$49
        (br_if $label$49
         (i32.eq
          (local.get $7)
          (i32.load
           (local.tee $6
            (i32.add
             (i32.shl
              (i32.load offset=28
               (local.get $7)
              )
              (i32.const 2)
             )
             (i32.const 1053548)
            )
           )
          )
         )
        )
        (block $label$50
         (br_if $label$50
          (i32.eq
           (i32.load offset=16
            (local.get $5)
           )
           (local.get $7)
          )
         )
         (i32.store offset=20
          (local.get $5)
          (local.get $0)
         )
         (br_if $label$48
          (local.get $0)
         )
         (br $label$2)
        )
        (i32.store offset=16
         (local.get $5)
         (local.get $0)
        )
        (br_if $label$48
         (local.get $0)
        )
        (br $label$2)
       )
       (i32.store
        (local.get $6)
        (local.get $0)
       )
       (br_if $label$3
        (i32.eqz
         (local.get $0)
        )
       )
      )
      (i32.store offset=24
       (local.get $0)
       (local.get $5)
      )
      (block $label$51
       (br_if $label$51
        (i32.eqz
         (local.tee $6
          (i32.load offset=16
           (local.get $7)
          )
         )
        )
       )
       (i32.store offset=16
        (local.get $0)
        (local.get $6)
       )
       (i32.store offset=24
        (local.get $6)
        (local.get $0)
       )
      )
      (br_if $label$2
       (i32.eqz
        (local.tee $6
         (i32.load offset=20
          (local.get $7)
         )
        )
       )
      )
      (i32.store offset=20
       (local.get $0)
       (local.get $6)
      )
      (i32.store offset=24
       (local.get $6)
       (local.get $0)
      )
      (br $label$2)
     )
     (block $label$52
      (block $label$53
       (block $label$54
        (block $label$55
         (block $label$56
          (block $label$57
           (br_if $label$57
            (i32.ge_u
             (local.tee $0
              (i32.load offset=1053964
               (i32.const 0)
              )
             )
             (local.get $3)
            )
           )
           (block $label$58
            (br_if $label$58
             (i32.gt_u
              (local.tee $0
               (i32.load offset=1053968
                (i32.const 0)
               )
              )
              (local.get $3)
             )
            )
            (call $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17hd536f0311f53ebe2E
             (i32.add
              (local.get $1)
              (i32.const 4)
             )
             (i32.const 1054000)
             (i32.and
              (i32.add
               (local.get $3)
               (i32.const 65583)
              )
              (i32.const -65536)
             )
            )
            (block $label$59
             (br_if $label$59
              (local.tee $6
               (i32.load offset=4
                (local.get $1)
               )
              )
             )
             (local.set $0
              (i32.const 0)
             )
             (br $label$1)
            )
            (local.set $5
             (i32.load offset=12
              (local.get $1)
             )
            )
            (i32.store offset=1053980
             (i32.const 0)
             (local.tee $0
              (i32.add
               (i32.load offset=1053980
                (i32.const 0)
               )
               (local.tee $9
                (i32.load offset=8
                 (local.get $1)
                )
               )
              )
             )
            )
            (i32.store offset=1053984
             (i32.const 0)
             (select
              (local.get $0)
              (local.tee $2
               (i32.load offset=1053984
                (i32.const 0)
               )
              )
              (i32.gt_u
               (local.get $0)
               (local.get $2)
              )
             )
            )
            (block $label$60
             (block $label$61
              (block $label$62
               (br_if $label$62
                (i32.eqz
                 (local.tee $2
                  (i32.load offset=1053976
                   (i32.const 0)
                  )
                 )
                )
               )
               (local.set $0
                (i32.const 1053676)
               )
               (loop $label$63
                (br_if $label$61
                 (i32.eq
                  (local.get $6)
                  (i32.add
                   (local.tee $7
                    (i32.load
                     (local.get $0)
                    )
                   )
                   (local.tee $8
                    (i32.load offset=4
                     (local.get $0)
                    )
                   )
                  )
                 )
                )
                (br_if $label$63
                 (local.tee $0
                  (i32.load offset=8
                   (local.get $0)
                  )
                 )
                )
                (br $label$60)
               )
              )
              (block $label$64
               (block $label$65
                (br_if $label$65
                 (i32.eqz
                  (local.tee $0
                   (i32.load offset=1053992
                    (i32.const 0)
                   )
                  )
                 )
                )
                (br_if $label$64
                 (i32.ge_u
                  (local.get $6)
                  (local.get $0)
                 )
                )
               )
               (i32.store offset=1053992
                (i32.const 0)
                (local.get $6)
               )
              )
              (i32.store offset=1053996
               (i32.const 0)
               (i32.const 4095)
              )
              (i32.store offset=1053688
               (i32.const 0)
               (local.get $5)
              )
              (i32.store offset=1053680
               (i32.const 0)
               (local.get $9)
              )
              (i32.store offset=1053676
               (i32.const 0)
               (local.get $6)
              )
              (i32.store offset=1053704
               (i32.const 0)
               (i32.const 1053692)
              )
              (i32.store offset=1053712
               (i32.const 0)
               (i32.const 1053700)
              )
              (i32.store offset=1053700
               (i32.const 0)
               (i32.const 1053692)
              )
              (i32.store offset=1053720
               (i32.const 0)
               (i32.const 1053708)
              )
              (i32.store offset=1053708
               (i32.const 0)
               (i32.const 1053700)
              )
              (i32.store offset=1053728
               (i32.const 0)
               (i32.const 1053716)
              )
              (i32.store offset=1053716
               (i32.const 0)
               (i32.const 1053708)
              )
              (i32.store offset=1053736
               (i32.const 0)
               (i32.const 1053724)
              )
              (i32.store offset=1053724
               (i32.const 0)
               (i32.const 1053716)
              )
              (i32.store offset=1053744
               (i32.const 0)
               (i32.const 1053732)
              )
              (i32.store offset=1053732
               (i32.const 0)
               (i32.const 1053724)
              )
              (i32.store offset=1053752
               (i32.const 0)
               (i32.const 1053740)
              )
              (i32.store offset=1053740
               (i32.const 0)
               (i32.const 1053732)
              )
              (i32.store offset=1053760
               (i32.const 0)
               (i32.const 1053748)
              )
              (i32.store offset=1053748
               (i32.const 0)
               (i32.const 1053740)
              )
              (i32.store offset=1053768
               (i32.const 0)
               (i32.const 1053756)
              )
              (i32.store offset=1053756
               (i32.const 0)
               (i32.const 1053748)
              )
              (i32.store offset=1053764
               (i32.const 0)
               (i32.const 1053756)
              )
              (i32.store offset=1053776
               (i32.const 0)
               (i32.const 1053764)
              )
              (i32.store offset=1053772
               (i32.const 0)
               (i32.const 1053764)
              )
              (i32.store offset=1053784
               (i32.const 0)
               (i32.const 1053772)
              )
              (i32.store offset=1053780
               (i32.const 0)
               (i32.const 1053772)
              )
              (i32.store offset=1053792
               (i32.const 0)
               (i32.const 1053780)
              )
              (i32.store offset=1053788
               (i32.const 0)
               (i32.const 1053780)
              )
              (i32.store offset=1053800
               (i32.const 0)
               (i32.const 1053788)
              )
              (i32.store offset=1053796
               (i32.const 0)
               (i32.const 1053788)
              )
              (i32.store offset=1053808
               (i32.const 0)
               (i32.const 1053796)
              )
              (i32.store offset=1053804
               (i32.const 0)
               (i32.const 1053796)
              )
              (i32.store offset=1053816
               (i32.const 0)
               (i32.const 1053804)
              )
              (i32.store offset=1053812
               (i32.const 0)
               (i32.const 1053804)
              )
              (i32.store offset=1053824
               (i32.const 0)
               (i32.const 1053812)
              )
              (i32.store offset=1053820
               (i32.const 0)
               (i32.const 1053812)
              )
              (i32.store offset=1053832
               (i32.const 0)
               (i32.const 1053820)
              )
              (i32.store offset=1053840
               (i32.const 0)
               (i32.const 1053828)
              )
              (i32.store offset=1053828
               (i32.const 0)
               (i32.const 1053820)
              )
              (i32.store offset=1053848
               (i32.const 0)
               (i32.const 1053836)
              )
              (i32.store offset=1053836
               (i32.const 0)
               (i32.const 1053828)
              )
              (i32.store offset=1053856
               (i32.const 0)
               (i32.const 1053844)
              )
              (i32.store offset=1053844
               (i32.const 0)
               (i32.const 1053836)
              )
              (i32.store offset=1053864
               (i32.const 0)
               (i32.const 1053852)
              )
              (i32.store offset=1053852
               (i32.const 0)
               (i32.const 1053844)
              )
              (i32.store offset=1053872
               (i32.const 0)
               (i32.const 1053860)
              )
              (i32.store offset=1053860
               (i32.const 0)
               (i32.const 1053852)
              )
              (i32.store offset=1053880
               (i32.const 0)
               (i32.const 1053868)
              )
              (i32.store offset=1053868
               (i32.const 0)
               (i32.const 1053860)
              )
              (i32.store offset=1053888
               (i32.const 0)
               (i32.const 1053876)
              )
              (i32.store offset=1053876
               (i32.const 0)
               (i32.const 1053868)
              )
              (i32.store offset=1053896
               (i32.const 0)
               (i32.const 1053884)
              )
              (i32.store offset=1053884
               (i32.const 0)
               (i32.const 1053876)
              )
              (i32.store offset=1053904
               (i32.const 0)
               (i32.const 1053892)
              )
              (i32.store offset=1053892
               (i32.const 0)
               (i32.const 1053884)
              )
              (i32.store offset=1053912
               (i32.const 0)
               (i32.const 1053900)
              )
              (i32.store offset=1053900
               (i32.const 0)
               (i32.const 1053892)
              )
              (i32.store offset=1053920
               (i32.const 0)
               (i32.const 1053908)
              )
              (i32.store offset=1053908
               (i32.const 0)
               (i32.const 1053900)
              )
              (i32.store offset=1053928
               (i32.const 0)
               (i32.const 1053916)
              )
              (i32.store offset=1053916
               (i32.const 0)
               (i32.const 1053908)
              )
              (i32.store offset=1053936
               (i32.const 0)
               (i32.const 1053924)
              )
              (i32.store offset=1053924
               (i32.const 0)
               (i32.const 1053916)
              )
              (i32.store offset=1053944
               (i32.const 0)
               (i32.const 1053932)
              )
              (i32.store offset=1053932
               (i32.const 0)
               (i32.const 1053924)
              )
              (i32.store offset=1053952
               (i32.const 0)
               (i32.const 1053940)
              )
              (i32.store offset=1053940
               (i32.const 0)
               (i32.const 1053932)
              )
              (i32.store offset=1053976
               (i32.const 0)
               (local.tee $2
                (i32.add
                 (local.tee $0
                  (i32.and
                   (i32.add
                    (local.get $6)
                    (i32.const 15)
                   )
                   (i32.const -8)
                  )
                 )
                 (i32.const -8)
                )
               )
              )
              (i32.store offset=1053948
               (i32.const 0)
               (i32.const 1053940)
              )
              (i32.store offset=1053968
               (i32.const 0)
               (local.tee $7
                (i32.add
                 (i32.add
                  (i32.sub
                   (local.get $6)
                   (local.get $0)
                  )
                  (local.tee $0
                   (i32.add
                    (local.get $9)
                    (i32.const -40)
                   )
                  )
                 )
                 (i32.const 8)
                )
               )
              )
              (i32.store offset=4
               (local.get $2)
               (i32.or
                (local.get $7)
                (i32.const 1)
               )
              )
              (i32.store offset=4
               (i32.add
                (local.get $6)
                (local.get $0)
               )
               (i32.const 40)
              )
              (i32.store offset=1053988
               (i32.const 0)
               (i32.const 2097152)
              )
              (br $label$52)
             )
             (br_if $label$60
              (i32.ge_u
               (local.get $2)
               (local.get $6)
              )
             )
             (br_if $label$60
              (i32.gt_u
               (local.get $7)
               (local.get $2)
              )
             )
             (br_if $label$60
              (i32.and
               (local.tee $7
                (i32.load offset=12
                 (local.get $0)
                )
               )
               (i32.const 1)
              )
             )
             (br_if $label$56
              (i32.eq
               (i32.shr_u
                (local.get $7)
                (i32.const 1)
               )
               (local.get $5)
              )
             )
            )
            (i32.store offset=1053992
             (i32.const 0)
             (select
              (local.tee $0
               (i32.load offset=1053992
                (i32.const 0)
               )
              )
              (local.get $6)
              (i32.lt_u
               (local.get $0)
               (local.get $6)
              )
             )
            )
            (local.set $7
             (i32.add
              (local.get $6)
              (local.get $9)
             )
            )
            (local.set $0
             (i32.const 1053676)
            )
            (block $label$66
             (block $label$67
              (block $label$68
               (loop $label$69
                (br_if $label$68
                 (i32.eq
                  (local.tee $8
                   (i32.load
                    (local.get $0)
                   )
                  )
                  (local.get $7)
                 )
                )
                (br_if $label$69
                 (local.tee $0
                  (i32.load offset=8
                   (local.get $0)
                  )
                 )
                )
                (br $label$67)
               )
              )
              (br_if $label$67
               (i32.and
                (local.tee $7
                 (i32.load offset=12
                  (local.get $0)
                 )
                )
                (i32.const 1)
               )
              )
              (br_if $label$66
               (i32.eq
                (i32.shr_u
                 (local.get $7)
                 (i32.const 1)
                )
                (local.get $5)
               )
              )
             )
             (local.set $0
              (i32.const 1053676)
             )
             (block $label$70
              (loop $label$71
               (block $label$72
                (br_if $label$72
                 (i32.gt_u
                  (local.tee $7
                   (i32.load
                    (local.get $0)
                   )
                  )
                  (local.get $2)
                 )
                )
                (br_if $label$70
                 (i32.lt_u
                  (local.get $2)
                  (local.tee $7
                   (i32.add
                    (local.get $7)
                    (i32.load offset=4
                     (local.get $0)
                    )
                   )
                  )
                 )
                )
               )
               (local.set $0
                (i32.load offset=8
                 (local.get $0)
                )
               )
               (br $label$71)
              )
             )
             (i32.store offset=1053976
              (i32.const 0)
              (local.tee $8
               (i32.add
                (local.tee $0
                 (i32.and
                  (i32.add
                   (local.get $6)
                   (i32.const 15)
                  )
                  (i32.const -8)
                 )
                )
                (i32.const -8)
               )
              )
             )
             (i32.store offset=1053968
              (i32.const 0)
              (local.tee $4
               (i32.add
                (i32.add
                 (i32.sub
                  (local.get $6)
                  (local.get $0)
                 )
                 (local.tee $0
                  (i32.add
                   (local.get $9)
                   (i32.const -40)
                  )
                 )
                )
                (i32.const 8)
               )
              )
             )
             (i32.store offset=4
              (local.get $8)
              (i32.or
               (local.get $4)
               (i32.const 1)
              )
             )
             (i32.store offset=4
              (i32.add
               (local.get $6)
               (local.get $0)
              )
              (i32.const 40)
             )
             (i32.store offset=1053988
              (i32.const 0)
              (i32.const 2097152)
             )
             (i32.store offset=4
              (local.tee $8
               (select
                (local.get $2)
                (local.tee $0
                 (i32.add
                  (i32.and
                   (i32.add
                    (local.get $7)
                    (i32.const -32)
                   )
                   (i32.const -8)
                  )
                  (i32.const -8)
                 )
                )
                (i32.lt_u
                 (local.get $0)
                 (i32.add
                  (local.get $2)
                  (i32.const 16)
                 )
                )
               )
              )
              (i32.const 27)
             )
             (local.set $10
              (i64.load offset=1053676 align=4
               (i32.const 0)
              )
             )
             (i64.store align=4
              (i32.add
               (local.get $8)
               (i32.const 16)
              )
              (i64.load offset=1053684 align=4
               (i32.const 0)
              )
             )
             (i64.store offset=8 align=4
              (local.get $8)
              (local.get $10)
             )
             (i32.store offset=1053688
              (i32.const 0)
              (local.get $5)
             )
             (i32.store offset=1053680
              (i32.const 0)
              (local.get $9)
             )
             (i32.store offset=1053676
              (i32.const 0)
              (local.get $6)
             )
             (i32.store offset=1053684
              (i32.const 0)
              (i32.add
               (local.get $8)
               (i32.const 8)
              )
             )
             (local.set $0
              (i32.add
               (local.get $8)
               (i32.const 28)
              )
             )
             (loop $label$73
              (i32.store
               (local.get $0)
               (i32.const 7)
              )
              (br_if $label$73
               (i32.lt_u
                (local.tee $0
                 (i32.add
                  (local.get $0)
                  (i32.const 4)
                 )
                )
                (local.get $7)
               )
              )
             )
             (br_if $label$52
              (i32.eq
               (local.get $8)
               (local.get $2)
              )
             )
             (i32.store offset=4
              (local.get $8)
              (i32.and
               (i32.load offset=4
                (local.get $8)
               )
               (i32.const -2)
              )
             )
             (i32.store offset=4
              (local.get $2)
              (i32.or
               (local.tee $0
                (i32.sub
                 (local.get $8)
                 (local.get $2)
                )
               )
               (i32.const 1)
              )
             )
             (i32.store
              (local.get $8)
              (local.get $0)
             )
             (block $label$74
              (br_if $label$74
               (i32.lt_u
                (local.get $0)
                (i32.const 256)
               )
              )
              (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h36f158d3d0e17661E
               (local.get $2)
               (local.get $0)
              )
              (br $label$52)
             )
             (local.set $7
              (i32.add
               (i32.and
                (local.get $0)
                (i32.const 248)
               )
               (i32.const 1053692)
              )
             )
             (block $label$75
              (block $label$76
               (br_if $label$76
                (i32.and
                 (local.tee $6
                  (i32.load offset=1053956
                   (i32.const 0)
                  )
                 )
                 (local.tee $0
                  (i32.shl
                   (i32.const 1)
                   (i32.shr_u
                    (local.get $0)
                    (i32.const 3)
                   )
                  )
                 )
                )
               )
               (i32.store offset=1053956
                (i32.const 0)
                (i32.or
                 (local.get $6)
                 (local.get $0)
                )
               )
               (local.set $0
                (local.get $7)
               )
               (br $label$75)
              )
              (local.set $0
               (i32.load offset=8
                (local.get $7)
               )
              )
             )
             (i32.store offset=8
              (local.get $7)
              (local.get $2)
             )
             (i32.store offset=12
              (local.get $0)
              (local.get $2)
             )
             (i32.store offset=12
              (local.get $2)
              (local.get $7)
             )
             (i32.store offset=8
              (local.get $2)
              (local.get $0)
             )
             (br $label$52)
            )
            (i32.store
             (local.get $0)
             (local.get $6)
            )
            (i32.store offset=4
             (local.get $0)
             (i32.add
              (i32.load offset=4
               (local.get $0)
              )
              (local.get $9)
             )
            )
            (i32.store offset=4
             (local.tee $7
              (i32.add
               (i32.and
                (i32.add
                 (local.get $6)
                 (i32.const 15)
                )
                (i32.const -8)
               )
               (i32.const -8)
              )
             )
             (i32.or
              (local.get $3)
              (i32.const 3)
             )
            )
            (local.set $3
             (i32.sub
              (local.tee $2
               (i32.add
                (i32.and
                 (i32.add
                  (local.get $8)
                  (i32.const 15)
                 )
                 (i32.const -8)
                )
                (i32.const -8)
               )
              )
              (local.tee $0
               (i32.add
                (local.get $7)
                (local.get $3)
               )
              )
             )
            )
            (br_if $label$55
             (i32.eq
              (local.get $2)
              (i32.load offset=1053976
               (i32.const 0)
              )
             )
            )
            (br_if $label$54
             (i32.eq
              (local.get $2)
              (i32.load offset=1053972
               (i32.const 0)
              )
             )
            )
            (block $label$77
             (br_if $label$77
              (i32.ne
               (i32.and
                (local.tee $6
                 (i32.load offset=4
                  (local.get $2)
                 )
                )
                (i32.const 3)
               )
               (i32.const 1)
              )
             )
             (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E
              (local.get $2)
              (local.tee $6
               (i32.and
                (local.get $6)
                (i32.const -8)
               )
              )
             )
             (local.set $3
              (i32.add
               (local.get $6)
               (local.get $3)
              )
             )
             (local.set $6
              (i32.load offset=4
               (local.tee $2
                (i32.add
                 (local.get $2)
                 (local.get $6)
                )
               )
              )
             )
            )
            (i32.store offset=4
             (local.get $2)
             (i32.and
              (local.get $6)
              (i32.const -2)
             )
            )
            (i32.store offset=4
             (local.get $0)
             (i32.or
              (local.get $3)
              (i32.const 1)
             )
            )
            (i32.store
             (i32.add
              (local.get $0)
              (local.get $3)
             )
             (local.get $3)
            )
            (block $label$78
             (br_if $label$78
              (i32.lt_u
               (local.get $3)
               (i32.const 256)
              )
             )
             (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h36f158d3d0e17661E
              (local.get $0)
              (local.get $3)
             )
             (br $label$53)
            )
            (local.set $2
             (i32.add
              (i32.and
               (local.get $3)
               (i32.const 248)
              )
              (i32.const 1053692)
             )
            )
            (block $label$79
             (block $label$80
              (br_if $label$80
               (i32.and
                (local.tee $6
                 (i32.load offset=1053956
                  (i32.const 0)
                 )
                )
                (local.tee $3
                 (i32.shl
                  (i32.const 1)
                  (i32.shr_u
                   (local.get $3)
                   (i32.const 3)
                  )
                 )
                )
               )
              )
              (i32.store offset=1053956
               (i32.const 0)
               (i32.or
                (local.get $6)
                (local.get $3)
               )
              )
              (local.set $3
               (local.get $2)
              )
              (br $label$79)
             )
             (local.set $3
              (i32.load offset=8
               (local.get $2)
              )
             )
            )
            (i32.store offset=8
             (local.get $2)
             (local.get $0)
            )
            (i32.store offset=12
             (local.get $3)
             (local.get $0)
            )
            (i32.store offset=12
             (local.get $0)
             (local.get $2)
            )
            (i32.store offset=8
             (local.get $0)
             (local.get $3)
            )
            (br $label$53)
           )
           (i32.store offset=1053968
            (i32.const 0)
            (local.tee $2
             (i32.sub
              (local.get $0)
              (local.get $3)
             )
            )
           )
           (i32.store offset=1053976
            (i32.const 0)
            (local.tee $7
             (i32.add
              (local.tee $0
               (i32.load offset=1053976
                (i32.const 0)
               )
              )
              (local.get $3)
             )
            )
           )
           (i32.store offset=4
            (local.get $7)
            (i32.or
             (local.get $2)
             (i32.const 1)
            )
           )
           (i32.store offset=4
            (local.get $0)
            (i32.or
             (local.get $3)
             (i32.const 3)
            )
           )
           (local.set $0
            (i32.add
             (local.get $0)
             (i32.const 8)
            )
           )
           (br $label$1)
          )
          (local.set $2
           (i32.load offset=1053972
            (i32.const 0)
           )
          )
          (block $label$81
           (block $label$82
            (br_if $label$82
             (i32.gt_u
              (local.tee $7
               (i32.sub
                (local.get $0)
                (local.get $3)
               )
              )
              (i32.const 15)
             )
            )
            (i32.store offset=1053972
             (i32.const 0)
             (i32.const 0)
            )
            (i32.store offset=1053964
             (i32.const 0)
             (i32.const 0)
            )
            (i32.store offset=4
             (local.get $2)
             (i32.or
              (local.get $0)
              (i32.const 3)
             )
            )
            (i32.store offset=4
             (local.tee $0
              (i32.add
               (local.get $2)
               (local.get $0)
              )
             )
             (i32.or
              (i32.load offset=4
               (local.get $0)
              )
              (i32.const 1)
             )
            )
            (br $label$81)
           )
           (i32.store offset=1053964
            (i32.const 0)
            (local.get $7)
           )
           (i32.store offset=1053972
            (i32.const 0)
            (local.tee $6
             (i32.add
              (local.get $2)
              (local.get $3)
             )
            )
           )
           (i32.store offset=4
            (local.get $6)
            (i32.or
             (local.get $7)
             (i32.const 1)
            )
           )
           (i32.store
            (i32.add
             (local.get $2)
             (local.get $0)
            )
            (local.get $7)
           )
           (i32.store offset=4
            (local.get $2)
            (i32.or
             (local.get $3)
             (i32.const 3)
            )
           )
          )
          (local.set $0
           (i32.add
            (local.get $2)
            (i32.const 8)
           )
          )
          (br $label$1)
         )
         (i32.store offset=4
          (local.get $0)
          (i32.add
           (local.get $8)
           (local.get $9)
          )
         )
         (i32.store offset=1053976
          (i32.const 0)
          (local.tee $7
           (i32.add
            (local.tee $2
             (i32.and
              (i32.add
               (local.tee $0
                (i32.load offset=1053976
                 (i32.const 0)
                )
               )
               (i32.const 15)
              )
              (i32.const -8)
             )
            )
            (i32.const -8)
           )
          )
         )
         (i32.store offset=1053968
          (i32.const 0)
          (local.tee $6
           (i32.add
            (i32.add
             (i32.sub
              (local.get $0)
              (local.get $2)
             )
             (local.tee $2
              (i32.add
               (i32.load offset=1053968
                (i32.const 0)
               )
               (local.get $9)
              )
             )
            )
            (i32.const 8)
           )
          )
         )
         (i32.store offset=4
          (local.get $7)
          (i32.or
           (local.get $6)
           (i32.const 1)
          )
         )
         (i32.store offset=4
          (i32.add
           (local.get $0)
           (local.get $2)
          )
          (i32.const 40)
         )
         (i32.store offset=1053988
          (i32.const 0)
          (i32.const 2097152)
         )
         (br $label$52)
        )
        (i32.store offset=1053976
         (i32.const 0)
         (local.get $0)
        )
        (i32.store offset=1053968
         (i32.const 0)
         (local.tee $3
          (i32.add
           (i32.load offset=1053968
            (i32.const 0)
           )
           (local.get $3)
          )
         )
        )
        (i32.store offset=4
         (local.get $0)
         (i32.or
          (local.get $3)
          (i32.const 1)
         )
        )
        (br $label$53)
       )
       (i32.store offset=1053972
        (i32.const 0)
        (local.get $0)
       )
       (i32.store offset=1053964
        (i32.const 0)
        (local.tee $3
         (i32.add
          (i32.load offset=1053964
           (i32.const 0)
          )
          (local.get $3)
         )
        )
       )
       (i32.store offset=4
        (local.get $0)
        (i32.or
         (local.get $3)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (local.get $0)
         (local.get $3)
        )
        (local.get $3)
       )
      )
      (local.set $0
       (i32.add
        (local.get $7)
        (i32.const 8)
       )
      )
      (br $label$1)
     )
     (local.set $0
      (i32.const 0)
     )
     (br_if $label$1
      (i32.le_u
       (local.tee $2
        (i32.load offset=1053968
         (i32.const 0)
        )
       )
       (local.get $3)
      )
     )
     (i32.store offset=1053968
      (i32.const 0)
      (local.tee $2
       (i32.sub
        (local.get $2)
        (local.get $3)
       )
      )
     )
     (i32.store offset=1053976
      (i32.const 0)
      (local.tee $7
       (i32.add
        (local.tee $0
         (i32.load offset=1053976
          (i32.const 0)
         )
        )
        (local.get $3)
       )
      )
     )
     (i32.store offset=4
      (local.get $7)
      (i32.or
       (local.get $2)
       (i32.const 1)
      )
     )
     (i32.store offset=4
      (local.get $0)
      (i32.or
       (local.get $3)
       (i32.const 3)
      )
     )
     (local.set $0
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
     )
     (br $label$1)
    )
    (i32.store offset=1053960
     (i32.const 0)
     (i32.and
      (i32.load offset=1053960
       (i32.const 0)
      )
      (i32.rotl
       (i32.const -2)
       (i32.load offset=28
        (local.get $7)
       )
      )
     )
    )
   )
   (block $label$83
    (block $label$84
     (br_if $label$84
      (i32.lt_u
       (local.get $2)
       (i32.const 16)
      )
     )
     (i32.store offset=4
      (local.get $7)
      (i32.or
       (local.get $3)
       (i32.const 3)
      )
     )
     (i32.store offset=4
      (local.tee $0
       (i32.add
        (local.get $7)
        (local.get $3)
       )
      )
      (i32.or
       (local.get $2)
       (i32.const 1)
      )
     )
     (i32.store
      (i32.add
       (local.get $0)
       (local.get $2)
      )
      (local.get $2)
     )
     (block $label$85
      (br_if $label$85
       (i32.lt_u
        (local.get $2)
        (i32.const 256)
       )
      )
      (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h36f158d3d0e17661E
       (local.get $0)
       (local.get $2)
      )
      (br $label$83)
     )
     (local.set $3
      (i32.add
       (i32.and
        (local.get $2)
        (i32.const 248)
       )
       (i32.const 1053692)
      )
     )
     (block $label$86
      (block $label$87
       (br_if $label$87
        (i32.and
         (local.tee $6
          (i32.load offset=1053956
           (i32.const 0)
          )
         )
         (local.tee $2
          (i32.shl
           (i32.const 1)
           (i32.shr_u
            (local.get $2)
            (i32.const 3)
           )
          )
         )
        )
       )
       (i32.store offset=1053956
        (i32.const 0)
        (i32.or
         (local.get $6)
         (local.get $2)
        )
       )
       (local.set $2
        (local.get $3)
       )
       (br $label$86)
      )
      (local.set $2
       (i32.load offset=8
        (local.get $3)
       )
      )
     )
     (i32.store offset=8
      (local.get $3)
      (local.get $0)
     )
     (i32.store offset=12
      (local.get $2)
      (local.get $0)
     )
     (i32.store offset=12
      (local.get $0)
      (local.get $3)
     )
     (i32.store offset=8
      (local.get $0)
      (local.get $2)
     )
     (br $label$83)
    )
    (i32.store offset=4
     (local.get $7)
     (i32.or
      (local.tee $0
       (i32.add
        (local.get $2)
        (local.get $3)
       )
      )
      (i32.const 3)
     )
    )
    (i32.store offset=4
     (local.tee $0
      (i32.add
       (local.get $7)
       (local.get $0)
      )
     )
     (i32.or
      (i32.load offset=4
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $7)
     (i32.const 8)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $1)
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h0e39a8832380600bE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.ge_u
     (local.get $1)
     (i32.sub
      (i32.const -65587)
      (local.tee $0
       (select
        (local.get $0)
        (i32.const 16)
        (i32.gt_u
         (local.get $0)
         (i32.const 16)
        )
       )
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (local.tee $1
      (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h90ff8eedc9c6744dE
       (i32.add
        (i32.add
         (local.get $0)
         (local.tee $3
          (select
           (i32.const 16)
           (i32.and
            (i32.add
             (local.get $1)
             (i32.const 11)
            )
            (i32.const -8)
           )
           (i32.lt_u
            (local.get $1)
            (i32.const 11)
           )
          )
         )
        )
        (i32.const 12)
       )
      )
     )
    )
   )
   (local.set $2
    (i32.add
     (local.get $1)
     (i32.const -8)
    )
   )
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.and
       (local.tee $4
        (i32.add
         (local.get $0)
         (i32.const -1)
        )
       )
       (local.get $1)
      )
     )
     (local.set $0
      (local.get $2)
     )
     (br $label$2)
    )
    (local.set $4
     (i32.sub
      (i32.and
       (local.tee $6
        (i32.load
         (local.tee $5
          (i32.add
           (local.get $1)
           (i32.const -4)
          )
         )
        )
       )
       (i32.const -8)
      )
      (local.tee $1
       (i32.sub
        (local.tee $0
         (i32.add
          (local.tee $1
           (i32.add
            (i32.and
             (i32.add
              (local.get $4)
              (local.get $1)
             )
             (i32.sub
              (i32.const 0)
              (local.get $0)
             )
            )
            (i32.const -8)
           )
          )
          (select
           (i32.const 0)
           (local.get $0)
           (i32.gt_u
            (i32.sub
             (local.get $1)
             (local.get $2)
            )
            (i32.const 16)
           )
          )
         )
        )
        (local.get $2)
       )
      )
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.eqz
       (i32.and
        (local.get $6)
        (i32.const 3)
       )
      )
     )
     (i32.store offset=4
      (local.get $0)
      (i32.or
       (i32.or
        (local.get $4)
        (i32.and
         (i32.load offset=4
          (local.get $0)
         )
         (i32.const 1)
        )
       )
       (i32.const 2)
      )
     )
     (i32.store offset=4
      (local.tee $4
       (i32.add
        (local.get $0)
        (local.get $4)
       )
      )
      (i32.or
       (i32.load offset=4
        (local.get $4)
       )
       (i32.const 1)
      )
     )
     (i32.store
      (local.get $5)
      (i32.or
       (i32.or
        (local.get $1)
        (i32.and
         (i32.load
          (local.get $5)
         )
         (i32.const 1)
        )
       )
       (i32.const 2)
      )
     )
     (i32.store offset=4
      (local.tee $4
       (i32.add
        (local.get $2)
        (local.get $1)
       )
      )
      (i32.or
       (i32.load offset=4
        (local.get $4)
       )
       (i32.const 1)
      )
     )
     (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hcac66ba809c22ef9E
      (local.get $2)
      (local.get $1)
     )
     (br $label$2)
    )
    (local.set $2
     (i32.load
      (local.get $2)
     )
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $4)
    )
    (i32.store
     (local.get $0)
     (i32.add
      (local.get $2)
      (local.get $1)
     )
    )
   )
   (block $label$5
    (br_if $label$5
     (i32.eqz
      (i32.and
       (local.tee $1
        (i32.load offset=4
         (local.get $0)
        )
       )
       (i32.const 3)
      )
     )
    )
    (br_if $label$5
     (i32.le_u
      (local.tee $2
       (i32.and
        (local.get $1)
        (i32.const -8)
       )
      )
      (i32.add
       (local.get $3)
       (i32.const 16)
      )
     )
    )
    (i32.store offset=4
     (local.get $0)
     (i32.or
      (i32.or
       (local.get $3)
       (i32.and
        (local.get $1)
        (i32.const 1)
       )
      )
      (i32.const 2)
     )
    )
    (i32.store offset=4
     (local.tee $1
      (i32.add
       (local.get $0)
       (local.get $3)
      )
     )
     (i32.or
      (local.tee $3
       (i32.sub
        (local.get $2)
        (local.get $3)
       )
      )
      (i32.const 3)
     )
    )
    (i32.store offset=4
     (local.tee $2
      (i32.add
       (local.get $0)
       (local.get $2)
      )
     )
     (i32.or
      (i32.load offset=4
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hcac66ba809c22ef9E
     (local.get $1)
     (local.get $3)
    )
   )
   (local.set $2
    (i32.add
     (local.get $0)
     (i32.const 8)
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h16ab72765b32282dE (param $0 i32)
  (call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h23ff416a921468b4E
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h23ff416a921468b4E (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $3
   (i32.load offset=12
    (local.tee $2
     (i32.load
      (local.get $0)
     )
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_table $label$4 $label$3 $label$2
       (i32.load offset=4
        (local.get $2)
       )
      )
     )
     (br_if $label$2
      (local.get $3)
     )
     (local.set $2
      (i32.const 1)
     )
     (local.set $3
      (i32.const 0)
     )
     (br $label$1)
    )
    (br_if $label$2
     (local.get $3)
    )
    (local.set $3
     (i32.load offset=4
      (local.tee $2
       (i32.load
        (local.get $2)
       )
      )
     )
    )
    (local.set $2
     (i32.load
      (local.get $2)
     )
    )
    (br $label$1)
   )
   (i32.store
    (local.get $1)
    (i32.const -2147483648)
   )
   (i32.store offset=12
    (local.get $1)
    (local.get $0)
   )
   (call $_ZN3std9panicking20rust_panic_with_hook17hc276d0501ad5b954E
    (local.get $1)
    (i32.const 1052708)
    (i32.load offset=4
     (local.get $0)
    )
    (i32.load8_u offset=8
     (local.tee $0
      (i32.load offset=8
       (local.get $0)
      )
     )
    )
    (i32.load8_u offset=9
     (local.get $0)
    )
   )
   (unreachable)
  )
  (i32.store offset=4
   (local.get $1)
   (local.get $3)
  )
  (i32.store
   (local.get $1)
   (local.get $2)
  )
  (call $_ZN3std9panicking20rust_panic_with_hook17hc276d0501ad5b954E
   (local.get $1)
   (i32.const 1052680)
   (i32.load offset=4
    (local.get $0)
   )
   (i32.load8_u offset=8
    (local.tee $0
     (i32.load offset=8
      (local.get $0)
     )
    )
   )
   (i32.load8_u offset=9
    (local.get $0)
   )
  )
  (unreachable)
 )
 (func $_ZN3std5alloc24default_alloc_error_hook17hbd8de71f1732263eE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.load8_u offset=1053524
     (i32.const 0)
    )
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $2)
     (i32.const 48)
    )
   )
   (return)
  )
  (i32.store offset=12
   (local.get $2)
   (i32.const 2)
  )
  (i32.store offset=8
   (local.get $2)
   (i32.const 1052592)
  )
  (i64.store offset=20 align=4
   (local.get $2)
   (i64.const 1)
  )
  (i32.store offset=44
   (local.get $2)
   (local.get $1)
  )
  (i64.store offset=32
   (local.get $2)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 18)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $2)
      (i32.const 44)
     )
    )
   )
  )
  (i32.store offset=16
   (local.get $2)
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $2)
    (i32.const 8)
   )
   (i32.const 1052632)
  )
  (unreachable)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc11___rdl_alloc (param $0 i32) (param $1 i32) (result i32)
  (block $label$1
   (br_if $label$1
    (i32.lt_u
     (local.get $1)
     (i32.const 9)
    )
   )
   (return
    (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h0e39a8832380600bE
     (local.get $1)
     (local.get $0)
    )
   )
  )
  (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h90ff8eedc9c6744dE
   (local.get $0)
  )
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc13___rdl_dealloc (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.lt_u
      (local.tee $4
       (i32.and
        (local.tee $3
         (i32.load
          (i32.add
           (local.get $0)
           (i32.const -4)
          )
         )
        )
        (i32.const -8)
       )
      )
      (i32.add
       (select
        (i32.const 4)
        (i32.const 8)
        (local.tee $3
         (i32.and
          (local.get $3)
          (i32.const 3)
         )
        )
       )
       (local.get $1)
      )
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (local.get $3)
      )
     )
     (br_if $label$1
      (i32.gt_u
       (local.get $4)
       (i32.add
        (local.get $1)
        (i32.const 39)
       )
      )
     )
    )
    (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hd05ac7097937f97bE
     (local.get $0)
    )
    (return)
   )
   (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
    (i32.const 1052429)
    (i32.const 46)
    (i32.const 1052476)
   )
   (unreachable)
  )
  (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
   (i32.const 1052492)
   (i32.const 46)
   (i32.const 1052540)
  )
  (unreachable)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc13___rdl_realloc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.lt_u
         (local.tee $6
          (i32.and
           (local.tee $5
            (i32.load
             (local.tee $4
              (i32.add
               (local.get $0)
               (i32.const -4)
              )
             )
            )
           )
           (i32.const -8)
          )
         )
         (i32.add
          (select
           (i32.const 4)
           (i32.const 8)
           (local.tee $7
            (i32.and
             (local.get $5)
             (i32.const 3)
            )
           )
          )
          (local.get $1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $1)
         (i32.const 39)
        )
       )
       (block $label$6
        (br_if $label$6
         (i32.eqz
          (local.get $7)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (local.get $6)
          (local.get $8)
         )
        )
       )
       (block $label$7
        (block $label$8
         (block $label$9
          (br_if $label$9
           (i32.lt_u
            (local.get $2)
            (i32.const 9)
           )
          )
          (br_if $label$8
           (local.tee $2
            (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h0e39a8832380600bE
             (local.get $2)
             (local.get $3)
            )
           )
          )
          (return
           (i32.const 0)
          )
         )
         (local.set $2
          (i32.const 0)
         )
         (br_if $label$7
          (i32.gt_u
           (local.get $3)
           (i32.const -65588)
          )
         )
         (local.set $1
          (select
           (i32.const 16)
           (i32.and
            (i32.add
             (local.get $3)
             (i32.const 11)
            )
            (i32.const -8)
           )
           (i32.lt_u
            (local.get $3)
            (i32.const 11)
           )
          )
         )
         (block $label$10
          (block $label$11
           (br_if $label$11
            (local.get $7)
           )
           (br_if $label$10
            (i32.lt_u
             (local.get $1)
             (i32.const 256)
            )
           )
           (br_if $label$10
            (i32.lt_u
             (local.get $6)
             (i32.or
              (local.get $1)
              (i32.const 4)
             )
            )
           )
           (br_if $label$10
            (i32.ge_u
             (i32.sub
              (local.get $6)
              (local.get $1)
             )
             (i32.const 131073)
            )
           )
           (return
            (local.get $0)
           )
          )
          (local.set $7
           (i32.add
            (local.tee $8
             (i32.add
              (local.get $0)
              (i32.const -8)
             )
            )
            (local.get $6)
           )
          )
          (block $label$12
           (block $label$13
            (block $label$14
             (block $label$15
              (block $label$16
               (br_if $label$16
                (i32.ge_u
                 (local.get $6)
                 (local.get $1)
                )
               )
               (br_if $label$12
                (i32.eq
                 (local.get $7)
                 (i32.load offset=1053976
                  (i32.const 0)
                 )
                )
               )
               (br_if $label$14
                (i32.eq
                 (local.get $7)
                 (i32.load offset=1053972
                  (i32.const 0)
                 )
                )
               )
               (br_if $label$10
                (i32.and
                 (local.tee $5
                  (i32.load offset=4
                   (local.get $7)
                  )
                 )
                 (i32.const 2)
                )
               )
               (br_if $label$10
                (i32.lt_u
                 (local.tee $5
                  (i32.add
                   (local.tee $9
                    (i32.and
                     (local.get $5)
                     (i32.const -8)
                    )
                   )
                   (local.get $6)
                  )
                 )
                 (local.get $1)
                )
               )
               (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h724f0d9c050c94c6E
                (local.get $7)
                (local.get $9)
               )
               (br_if $label$15
                (i32.lt_u
                 (local.tee $3
                  (i32.sub
                   (local.get $5)
                   (local.get $1)
                  )
                 )
                 (i32.const 16)
                )
               )
               (i32.store
                (local.get $4)
                (i32.or
                 (i32.or
                  (local.get $1)
                  (i32.and
                   (i32.load
                    (local.get $4)
                   )
                   (i32.const 1)
                  )
                 )
                 (i32.const 2)
                )
               )
               (i32.store offset=4
                (local.tee $1
                 (i32.add
                  (local.get $8)
                  (local.get $1)
                 )
                )
                (i32.or
                 (local.get $3)
                 (i32.const 3)
                )
               )
               (i32.store offset=4
                (local.tee $2
                 (i32.add
                  (local.get $8)
                  (local.get $5)
                 )
                )
                (i32.or
                 (i32.load offset=4
                  (local.get $2)
                 )
                 (i32.const 1)
                )
               )
               (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hcac66ba809c22ef9E
                (local.get $1)
                (local.get $3)
               )
               (return
                (local.get $0)
               )
              )
              (br_if $label$13
               (i32.gt_u
                (local.tee $3
                 (i32.sub
                  (local.get $6)
                  (local.get $1)
                 )
                )
                (i32.const 15)
               )
              )
              (return
               (local.get $0)
              )
             )
             (i32.store
              (local.get $4)
              (i32.or
               (i32.or
                (local.get $5)
                (i32.and
                 (i32.load
                  (local.get $4)
                 )
                 (i32.const 1)
                )
               )
               (i32.const 2)
              )
             )
             (i32.store offset=4
              (local.tee $1
               (i32.add
                (local.get $8)
                (local.get $5)
               )
              )
              (i32.or
               (i32.load offset=4
                (local.get $1)
               )
               (i32.const 1)
              )
             )
             (return
              (local.get $0)
             )
            )
            (br_if $label$10
             (i32.lt_u
              (local.tee $7
               (i32.add
                (i32.load offset=1053964
                 (i32.const 0)
                )
                (local.get $6)
               )
              )
              (local.get $1)
             )
            )
            (block $label$17
             (block $label$18
              (br_if $label$18
               (i32.gt_u
                (local.tee $3
                 (i32.sub
                  (local.get $7)
                  (local.get $1)
                 )
                )
                (i32.const 15)
               )
              )
              (i32.store
               (local.get $4)
               (i32.or
                (i32.or
                 (i32.and
                  (local.get $5)
                  (i32.const 1)
                 )
                 (local.get $7)
                )
                (i32.const 2)
               )
              )
              (i32.store offset=4
               (local.tee $1
                (i32.add
                 (local.get $8)
                 (local.get $7)
                )
               )
               (i32.or
                (i32.load offset=4
                 (local.get $1)
                )
                (i32.const 1)
               )
              )
              (local.set $3
               (i32.const 0)
              )
              (local.set $1
               (i32.const 0)
              )
              (br $label$17)
             )
             (i32.store
              (local.get $4)
              (i32.or
               (i32.or
                (local.get $1)
                (i32.and
                 (local.get $5)
                 (i32.const 1)
                )
               )
               (i32.const 2)
              )
             )
             (i32.store offset=4
              (local.tee $1
               (i32.add
                (local.get $8)
                (local.get $1)
               )
              )
              (i32.or
               (local.get $3)
               (i32.const 1)
              )
             )
             (i32.store
              (local.tee $2
               (i32.add
                (local.get $8)
                (local.get $7)
               )
              )
              (local.get $3)
             )
             (i32.store offset=4
              (local.get $2)
              (i32.and
               (i32.load offset=4
                (local.get $2)
               )
               (i32.const -2)
              )
             )
            )
            (i32.store offset=1053972
             (i32.const 0)
             (local.get $1)
            )
            (i32.store offset=1053964
             (i32.const 0)
             (local.get $3)
            )
            (return
             (local.get $0)
            )
           )
           (i32.store
            (local.get $4)
            (i32.or
             (i32.or
              (local.get $1)
              (i32.and
               (local.get $5)
               (i32.const 1)
              )
             )
             (i32.const 2)
            )
           )
           (i32.store offset=4
            (local.tee $1
             (i32.add
              (local.get $8)
              (local.get $1)
             )
            )
            (i32.or
             (local.get $3)
             (i32.const 3)
            )
           )
           (i32.store offset=4
            (local.get $7)
            (i32.or
             (i32.load offset=4
              (local.get $7)
             )
             (i32.const 1)
            )
           )
           (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hcac66ba809c22ef9E
            (local.get $1)
            (local.get $3)
           )
           (return
            (local.get $0)
           )
          )
          (br_if $label$1
           (i32.gt_u
            (local.tee $7
             (i32.add
              (i32.load offset=1053968
               (i32.const 0)
              )
              (local.get $6)
             )
            )
            (local.get $1)
           )
          )
         )
         (br_if $label$7
          (i32.eqz
           (local.tee $1
            (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h90ff8eedc9c6744dE
             (local.get $3)
            )
           )
          )
         )
         (block $label$19
          (br_if $label$19
           (i32.eqz
            (local.tee $3
             (select
              (local.get $3)
              (local.tee $2
               (i32.add
                (select
                 (i32.const -4)
                 (i32.const -8)
                 (i32.and
                  (local.tee $2
                   (i32.load
                    (local.get $4)
                   )
                  )
                  (i32.const 3)
                 )
                )
                (i32.and
                 (local.get $2)
                 (i32.const -8)
                )
               )
              )
              (i32.lt_u
               (local.get $3)
               (local.get $2)
              )
             )
            )
           )
          )
          (memory.copy
           (local.get $1)
           (local.get $0)
           (local.get $3)
          )
         )
         (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hd05ac7097937f97bE
          (local.get $0)
         )
         (return
          (local.get $1)
         )
        )
        (block $label$20
         (br_if $label$20
          (i32.eqz
           (local.tee $3
            (select
             (local.get $3)
             (local.get $1)
             (i32.lt_u
              (local.get $3)
              (local.get $1)
             )
            )
           )
          )
         )
         (memory.copy
          (local.get $2)
          (local.get $0)
          (local.get $3)
         )
        )
        (br_if $label$3
         (i32.lt_u
          (local.tee $7
           (i32.and
            (local.tee $3
             (i32.load
              (local.get $4)
             )
            )
            (i32.const -8)
           )
          )
          (i32.add
           (select
            (i32.const 4)
            (i32.const 8)
            (local.tee $3
             (i32.and
              (local.get $3)
              (i32.const 3)
             )
            )
           )
           (local.get $1)
          )
         )
        )
        (block $label$21
         (br_if $label$21
          (i32.eqz
           (local.get $3)
          )
         )
         (br_if $label$2
          (i32.gt_u
           (local.get $7)
           (local.get $8)
          )
         )
        )
        (call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hd05ac7097937f97bE
         (local.get $0)
        )
       )
       (return
        (local.get $2)
       )
      )
      (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
       (i32.const 1052429)
       (i32.const 46)
       (i32.const 1052476)
      )
      (unreachable)
     )
     (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
      (i32.const 1052492)
      (i32.const 46)
      (i32.const 1052540)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
     (i32.const 1052429)
     (i32.const 46)
     (i32.const 1052476)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
    (i32.const 1052492)
    (i32.const 46)
    (i32.const 1052540)
   )
   (unreachable)
  )
  (i32.store
   (local.get $4)
   (i32.or
    (i32.or
     (local.get $1)
     (i32.and
      (local.get $5)
      (i32.const 1)
     )
    )
    (i32.const 2)
   )
  )
  (i32.store offset=4
   (local.tee $3
    (i32.add
     (local.get $8)
     (local.get $1)
    )
   )
   (i32.or
    (local.tee $1
     (i32.sub
      (local.get $7)
      (local.get $1)
     )
    )
    (i32.const 1)
   )
  )
  (i32.store offset=1053968
   (i32.const 0)
   (local.get $1)
  )
  (i32.store offset=1053976
   (i32.const 0)
   (local.get $3)
  )
  (local.get $0)
 )
 (func $_ZN3std9panicking11panic_count8increase17h3de8e2b47e9166f9E (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local.set $1
   (i32.const 0)
  )
  (i32.store offset=1053544
   (i32.const 0)
   (i32.add
    (local.tee $2
     (i32.load offset=1053544
      (i32.const 0)
     )
    )
    (i32.const 1)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.lt_s
     (local.get $2)
     (i32.const 0)
    )
   )
   (local.set $1
    (i32.const 1)
   )
   (br_if $label$1
    (i32.load8_u offset=1054004
     (i32.const 0)
    )
   )
   (i32.store8 offset=1054004
    (i32.const 0)
    (local.get $0)
   )
   (i32.store offset=1054000
    (i32.const 0)
    (i32.add
     (i32.load offset=1054000
      (i32.const 0)
     )
     (i32.const 1)
    )
   )
   (local.set $1
    (i32.const 2)
   )
  )
  (local.get $1)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc17rust_begin_unwind (param $0 i32)
  (local $1 i32)
  (local $2 i64)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $2
   (i64.load align=4
    (local.get $0)
   )
  )
  (i32.store offset=12
   (local.get $1)
   (local.get $0)
  )
  (i64.store offset=4 align=4
   (local.get $1)
   (local.get $2)
  )
  (call $_ZN3std3sys9backtrace26__rust_end_short_backtrace17h16ab72765b32282dE
   (i32.add
    (local.get $1)
    (i32.const 4)
   )
  )
  (unreachable)
 )
 (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17ha7c451ef50e5f856E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 64)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (i32.load
      (local.get $1)
     )
     (i32.const -2147483648)
    )
   )
   (local.set $3
    (i32.load offset=12
     (local.get $1)
    )
   )
   (i32.store
    (local.tee $4
     (i32.add
      (i32.add
       (local.get $2)
       (i32.const 28)
      )
      (i32.const 8)
     )
    )
    (i32.const 0)
   )
   (i64.store offset=28 align=4
    (local.get $2)
    (i64.const 4294967296)
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 40)
     )
     (i32.const 8)
    )
    (i64.load align=4
     (i32.add
      (local.tee $3
       (i32.load
        (local.get $3)
       )
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 40)
     )
     (i32.const 16)
    )
    (i64.load align=4
     (i32.add
      (local.get $3)
      (i32.const 16)
     )
    )
   )
   (i64.store offset=40
    (local.get $2)
    (i64.load align=4
     (local.get $3)
    )
   )
   (drop
    (call $_ZN4core3fmt5write17h68542eb4423e8992E
     (i32.add
      (local.get $2)
      (i32.const 28)
     )
     (i32.const 1052364)
     (i32.add
      (local.get $2)
      (i32.const 40)
     )
    )
   )
   (i32.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 16)
     )
     (i32.const 8)
    )
    (local.tee $3
     (i32.load
      (local.get $4)
     )
    )
   )
   (i64.store offset=16
    (local.get $2)
    (local.tee $5
     (i64.load offset=28 align=4
      (local.get $2)
     )
    )
   )
   (i32.store
    (i32.add
     (local.get $1)
     (i32.const 8)
    )
    (local.get $3)
   )
   (i64.store align=4
    (local.get $1)
    (local.get $5)
   )
  )
  (local.set $5
   (i64.load align=4
    (local.get $1)
   )
  )
  (i64.store align=4
   (local.get $1)
   (i64.const 4294967296)
  )
  (i32.store
   (local.tee $3
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
   )
   (i32.load
    (local.tee $1
     (i32.add
      (local.get $1)
      (i32.const 8)
     )
    )
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 0)
  )
  (drop
   (i32.load8_u offset=1053525
    (i32.const 0)
   )
  )
  (i64.store
   (local.get $2)
   (local.get $5)
  )
  (block $label$2
   (br_if $label$2
    (local.tee $1
     (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
      (i32.const 12)
      (i32.const 4)
     )
    )
   )
   (call $_ZN5alloc5alloc18handle_alloc_error17h538ce9133f14f3ccE
    (i32.const 4)
    (i32.const 12)
   )
   (unreachable)
  )
  (i64.store align=4
   (local.get $1)
   (i64.load
    (local.get $2)
   )
  )
  (i32.store
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (i32.load
    (local.get $3)
   )
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 1052648)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 64)
   )
  )
 )
 (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17he84c4c3017ddad6dE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (i32.load
      (local.get $1)
     )
     (i32.const -2147483648)
    )
   )
   (local.set $3
    (i32.load offset=12
     (local.get $1)
    )
   )
   (i32.store
    (local.tee $4
     (i32.add
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 8)
     )
    )
    (i32.const 0)
   )
   (i64.store offset=12 align=4
    (local.get $2)
    (i64.const 4294967296)
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 24)
     )
     (i32.const 8)
    )
    (i64.load align=4
     (i32.add
      (local.tee $3
       (i32.load
        (local.get $3)
       )
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 24)
     )
     (i32.const 16)
    )
    (i64.load align=4
     (i32.add
      (local.get $3)
      (i32.const 16)
     )
    )
   )
   (i64.store offset=24
    (local.get $2)
    (i64.load align=4
     (local.get $3)
    )
   )
   (drop
    (call $_ZN4core3fmt5write17h68542eb4423e8992E
     (i32.add
      (local.get $2)
      (i32.const 12)
     )
     (i32.const 1052364)
     (i32.add
      (local.get $2)
      (i32.const 24)
     )
    )
   )
   (i32.store
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (local.tee $3
     (i32.load
      (local.get $4)
     )
    )
   )
   (i64.store
    (local.get $2)
    (local.tee $5
     (i64.load offset=12 align=4
      (local.get $2)
     )
    )
   )
   (i32.store
    (i32.add
     (local.get $1)
     (i32.const 8)
    )
    (local.get $3)
   )
   (i64.store align=4
    (local.get $1)
    (local.get $5)
   )
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 1052648)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 48)
   )
  )
 )
 (func $_ZN95_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h22bfd80d379a9576E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eq
      (i32.load
       (local.get $0)
      )
      (i32.const -2147483648)
     )
    )
    (local.set $0
     (call $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE
      (local.get $1)
      (i32.load offset=4
       (local.get $0)
      )
      (i32.load offset=8
       (local.get $0)
      )
     )
    )
    (br $label$1)
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 8)
    )
    (i64.load align=4
     (i32.add
      (local.tee $0
       (i32.load
        (i32.load offset=12
         (local.get $0)
        )
       )
      )
      (i32.const 8)
     )
    )
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 16)
    )
    (i64.load align=4
     (i32.add
      (local.get $0)
      (i32.const 16)
     )
    )
   )
   (i64.store offset=8
    (local.get $2)
    (i64.load align=4
     (local.get $0)
    )
   )
   (local.set $0
    (call $_ZN4core3fmt5write17h68542eb4423e8992E
     (i32.load
      (local.get $1)
     )
     (i32.load offset=4
      (local.get $1)
     )
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
  (local.get $0)
 )
 (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h89f7fb848e07ab49E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (drop
   (i32.load8_u offset=1053525
    (i32.const 0)
   )
  )
  (local.set $2
   (i32.load offset=4
    (local.get $1)
   )
  )
  (local.set $3
   (i32.load
    (local.get $1)
   )
  )
  (block $label$1
   (br_if $label$1
    (local.tee $1
     (call $_RNvCs691rhTbG0Ee_7___rustc12___rust_alloc
      (i32.const 8)
      (i32.const 4)
     )
    )
   )
   (call $_ZN5alloc5alloc18handle_alloc_error17h538ce9133f14f3ccE
    (i32.const 4)
    (i32.const 8)
   )
   (unreachable)
  )
  (i32.store offset=4
   (local.get $1)
   (local.get $2)
  )
  (i32.store
   (local.get $1)
   (local.get $3)
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 1052664)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17hf8e628056151d29dE (param $0 i32) (param $1 i32)
  (i32.store offset=4
   (local.get $0)
   (i32.const 1052664)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$6as_str17h4b3ad1b286f4163aE (param $0 i32) (param $1 i32)
  (i64.store
   (local.get $0)
   (i64.load align=4
    (local.get $1)
   )
  )
 )
 (func $_ZN92_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..fmt..Display$GT$3fmt17h1300d7785d2cb8e7E (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE
   (local.get $1)
   (i32.load
    (local.get $0)
   )
   (i32.load offset=4
    (local.get $0)
   )
  )
 )
 (func $_ZN3std9panicking20rust_panic_with_hook17hc276d0501ad5b954E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eq
     (local.tee $6
      (i32.and
       (call $_ZN3std9panicking11panic_count8increase17h3de8e2b47e9166f9E
        (i32.const 1)
       )
       (i32.const 255)
      )
     )
     (i32.const 2)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (local.get $6)
       (i32.const 1)
      )
     )
    )
    (call_indirect $0 (type $2)
     (i32.add
      (local.get $5)
      (i32.const 8)
     )
     (local.get $0)
     (i32.load offset=24
      (local.get $1)
     )
    )
   )
   (call $_ZN4core3ptr74drop_in_place$LT$core..option..Option$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h5e7c564ca6a856faE
    (i32.const -2147483648)
    (local.get $5)
   )
   (unreachable)
  )
  (block $label$3
   (block $label$4
    (br_if $label$4
     (i32.le_s
      (local.tee $6
       (i32.load offset=1053532
        (i32.const 0)
       )
      )
      (i32.const -1)
     )
    )
    (i32.store offset=1053532
     (i32.const 0)
     (i32.add
      (local.get $6)
      (i32.const 1)
     )
    )
    (block $label$5
     (block $label$6
      (br_if $label$6
       (i32.eqz
        (i32.load offset=1053536
         (i32.const 0)
        )
       )
      )
      (call_indirect $0 (type $2)
       (local.get $5)
       (local.get $0)
       (i32.load offset=20
        (local.get $1)
       )
      )
      (i32.store8 offset=29
       (local.get $5)
       (local.get $4)
      )
      (i32.store8 offset=28
       (local.get $5)
       (local.get $3)
      )
      (i32.store offset=24
       (local.get $5)
       (local.get $2)
      )
      (i64.store offset=16 align=4
       (local.get $5)
       (i64.load
        (local.get $5)
       )
      )
      (call_indirect $0 (type $2)
       (i32.load offset=1053536
        (i32.const 0)
       )
       (i32.add
        (local.get $5)
        (i32.const 16)
       )
       (i32.load offset=20
        (i32.load offset=1053540
         (i32.const 0)
        )
       )
      )
      (br $label$5)
     )
     (call $_ZN4core3ptr74drop_in_place$LT$core..option..Option$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h5e7c564ca6a856faE
      (i32.const -2147483648)
      (local.get $5)
     )
    )
    (i32.store offset=1053532
     (i32.const 0)
     (i32.add
      (i32.load offset=1053532
       (i32.const 0)
      )
      (i32.const -1)
     )
    )
    (i32.store8 offset=1054004
     (i32.const 0)
     (i32.const 0)
    )
    (br_if $label$3
     (i32.eqz
      (local.get $3)
     )
    )
    (call $_RNvCs691rhTbG0Ee_7___rustc10rust_panic
     (local.get $0)
     (local.get $1)
    )
   )
   (unreachable)
  )
  (call $_ZN4core3ptr74drop_in_place$LT$core..option..Option$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h5e7c564ca6a856faE
   (i32.const -2147483648)
   (local.get $5)
  )
  (unreachable)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc10rust_panic (param $0 i32) (param $1 i32)
  (drop
   (call $_RNvCs691rhTbG0Ee_7___rustc18___rust_start_panic
    (local.get $0)
    (local.get $1)
   )
  )
  (call $_ZN4core3ptr74drop_in_place$LT$core..option..Option$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h5e7c564ca6a856faE
   (i32.const -2147483648)
   (local.get $1)
  )
  (unreachable)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc8___rg_oom (param $0 i32) (param $1 i32)
  (local $2 i32)
  (call_indirect $0 (type $2)
   (local.get $1)
   (local.get $0)
   (select
    (local.tee $2
     (i32.load offset=1053528
      (i32.const 0)
     )
    )
    (i32.const 19)
    (local.get $2)
   )
  )
  (unreachable)
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc18___rust_start_panic (param $0 i32) (param $1 i32) (result i32)
  (unreachable)
 )
 (func $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17hd536f0311f53ebe2E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local.set $3
   (memory.grow
    (i32.shr_u
     (local.get $2)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=8
   (local.get $0)
   (i32.const 0)
  )
  (i32.store offset=4
   (local.get $0)
   (select
    (i32.const 0)
    (i32.and
     (local.get $2)
     (i32.const -65536)
    )
    (local.tee $2
     (i32.eq
      (local.get $3)
      (i32.const -1)
     )
    )
   )
  )
  (i32.store
   (local.get $0)
   (select
    (i32.const 0)
    (i32.shl
     (local.get $3)
     (i32.const 16)
    )
    (local.get $2)
   )
  )
 )
 (func $_ZN5alloc7raw_vec17capacity_overflow17hfc61731a92216a2cE (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=24
   (local.get $1)
   (i32.const 0)
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 1052756)
  )
  (i64.store offset=16 align=4
   (local.get $1)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN5alloc7raw_vec12handle_error17h57ad9ee517c44fc6E (param $0 i32) (param $1 i32) (param $2 i32)
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (local.get $0)
    )
   )
   (call $_ZN5alloc5alloc18handle_alloc_error17h538ce9133f14f3ccE
    (local.get $0)
    (local.get $1)
   )
   (unreachable)
  )
  (call $_ZN5alloc7raw_vec17capacity_overflow17hfc61731a92216a2cE
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN5alloc5alloc18handle_alloc_error17h538ce9133f14f3ccE (param $0 i32) (param $1 i32)
  (call $_RNvCs691rhTbG0Ee_7___rustc26___rust_alloc_error_handler
   (local.get $1)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN4core5slice5index26slice_start_index_len_fail17h026a9215e79c1fdbE (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_ZN4core5slice5index26slice_start_index_len_fail8do_panic7runtime17he2583cd0648d1116E
   (local.get $0)
   (local.get $1)
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN4core5slice5index24slice_end_index_len_fail17hadfbc7e1a15974a1E (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h911bca498e89ce56E
   (local.get $0)
   (local.get $1)
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN4core3fmt9Formatter3pad17h5a5f539bbb272398E (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (local.tee $3
        (i32.load offset=8
         (local.get $0)
        )
       )
       (i32.const 402653184)
      )
     )
    )
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i32.eqz
           (i32.and
            (local.get $3)
            (i32.const 268435456)
           )
          )
         )
         (br_if $label$6
          (local.tee $4
           (i32.load16_u offset=14
            (local.get $0)
           )
          )
         )
         (local.set $2
          (i32.const 0)
         )
         (br $label$5)
        )
        (block $label$8
         (br_if $label$8
          (i32.lt_u
           (local.get $2)
           (i32.const 16)
          )
         )
         (local.set $5
          (call $_ZN4core3str5count14do_count_chars17hfba32584e02717a7E
           (local.get $1)
           (local.get $2)
          )
         )
         (br $label$3)
        )
        (block $label$9
         (br_if $label$9
          (local.get $2)
         )
         (local.set $2
          (i32.const 0)
         )
         (local.set $5
          (i32.const 0)
         )
         (br $label$3)
        )
        (local.set $6
         (i32.and
          (local.get $2)
          (i32.const 3)
         )
        )
        (block $label$10
         (block $label$11
          (br_if $label$11
           (i32.ge_u
            (local.get $2)
            (i32.const 4)
           )
          )
          (local.set $5
           (i32.const 0)
          )
          (local.set $7
           (i32.const 0)
          )
          (br $label$10)
         )
         (local.set $4
          (i32.and
           (local.get $2)
           (i32.const 12)
          )
         )
         (local.set $5
          (i32.const 0)
         )
         (local.set $7
          (i32.const 0)
         )
         (loop $label$12
          (local.set $5
           (i32.add
            (i32.add
             (i32.add
              (i32.add
               (local.get $5)
               (i32.gt_s
                (i32.load8_s
                 (local.tee $8
                  (i32.add
                   (local.get $1)
                   (local.get $7)
                  )
                 )
                )
                (i32.const -65)
               )
              )
              (i32.gt_s
               (i32.load8_s
                (i32.add
                 (local.get $8)
                 (i32.const 1)
                )
               )
               (i32.const -65)
              )
             )
             (i32.gt_s
              (i32.load8_s
               (i32.add
                (local.get $8)
                (i32.const 2)
               )
              )
              (i32.const -65)
             )
            )
            (i32.gt_s
             (i32.load8_s
              (i32.add
               (local.get $8)
               (i32.const 3)
              )
             )
             (i32.const -65)
            )
           )
          )
          (br_if $label$12
           (i32.ne
            (local.get $4)
            (local.tee $7
             (i32.add
              (local.get $7)
              (i32.const 4)
             )
            )
           )
          )
         )
        )
        (br_if $label$3
         (i32.eqz
          (local.get $6)
         )
        )
        (local.set $8
         (i32.add
          (local.get $1)
          (local.get $7)
         )
        )
        (loop $label$13
         (local.set $5
          (i32.add
           (local.get $5)
           (i32.gt_s
            (i32.load8_s
             (local.get $8)
            )
            (i32.const -65)
           )
          )
         )
         (local.set $8
          (i32.add
           (local.get $8)
           (i32.const 1)
          )
         )
         (br_if $label$13
          (local.tee $6
           (i32.add
            (local.get $6)
            (i32.const -1)
           )
          )
         )
         (br $label$3)
        )
       )
       (local.set $6
        (i32.add
         (local.get $1)
         (local.get $2)
        )
       )
       (local.set $2
        (i32.const 0)
       )
       (local.set $7
        (local.get $4)
       )
       (local.set $8
        (local.get $1)
       )
       (loop $label$14
        (br_if $label$4
         (i32.eq
          (local.tee $5
           (local.get $8)
          )
          (local.get $6)
         )
        )
        (block $label$15
         (block $label$16
          (br_if $label$16
           (i32.le_s
            (local.tee $8
             (i32.load8_s
              (local.get $5)
             )
            )
            (i32.const -1)
           )
          )
          (local.set $8
           (i32.add
            (local.get $5)
            (i32.const 1)
           )
          )
          (br $label$15)
         )
         (block $label$17
          (br_if $label$17
           (i32.ge_u
            (local.get $8)
            (i32.const -32)
           )
          )
          (local.set $8
           (i32.add
            (local.get $5)
            (i32.const 2)
           )
          )
          (br $label$15)
         )
         (block $label$18
          (br_if $label$18
           (i32.ge_u
            (local.get $8)
            (i32.const -16)
           )
          )
          (local.set $8
           (i32.add
            (local.get $5)
            (i32.const 3)
           )
          )
          (br $label$15)
         )
         (local.set $8
          (i32.add
           (local.get $5)
           (i32.const 4)
          )
         )
        )
        (local.set $2
         (i32.add
          (i32.sub
           (local.get $8)
           (local.get $5)
          )
          (local.get $2)
         )
        )
        (br_if $label$14
         (local.tee $7
          (i32.add
           (local.get $7)
           (i32.const -1)
          )
         )
        )
       )
      )
      (local.set $7
       (i32.const 0)
      )
     )
     (local.set $5
      (i32.sub
       (local.get $4)
       (local.get $7)
      )
     )
    )
    (br_if $label$2
     (i32.ge_u
      (local.get $5)
      (local.tee $8
       (i32.load16_u offset=12
        (local.get $0)
       )
      )
     )
    )
    (local.set $9
     (i32.sub
      (local.get $8)
      (local.get $5)
     )
    )
    (local.set $5
     (i32.const 0)
    )
    (local.set $4
     (i32.const 0)
    )
    (block $label$19
     (block $label$20
      (block $label$21
       (br_table $label$19 $label$21 $label$20 $label$19 $label$19
        (i32.and
         (i32.shr_u
          (local.get $3)
          (i32.const 29)
         )
         (i32.const 3)
        )
       )
      )
      (local.set $4
       (local.get $9)
      )
      (br $label$19)
     )
     (local.set $4
      (i32.shr_u
       (i32.and
        (local.get $9)
        (i32.const 65534)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $6
     (i32.and
      (local.get $3)
      (i32.const 2097151)
     )
    )
    (local.set $7
     (i32.load offset=4
      (local.get $0)
     )
    )
    (local.set $0
     (i32.load
      (local.get $0)
     )
    )
    (block $label$22
     (loop $label$23
      (br_if $label$22
       (i32.ge_u
        (i32.and
         (local.get $5)
         (i32.const 65535)
        )
        (i32.and
         (local.get $4)
         (i32.const 65535)
        )
       )
      )
      (local.set $8
       (i32.const 1)
      )
      (local.set $5
       (i32.add
        (local.get $5)
        (i32.const 1)
       )
      )
      (br_if $label$1
       (call_indirect $0 (type $0)
        (local.get $0)
        (local.get $6)
        (i32.load offset=16
         (local.get $7)
        )
       )
      )
      (br $label$23)
     )
    )
    (local.set $8
     (i32.const 1)
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (local.get $0)
      (local.get $1)
      (local.get $2)
      (i32.load offset=12
       (local.get $7)
      )
     )
    )
    (local.set $5
     (i32.const 0)
    )
    (local.set $2
     (i32.and
      (i32.sub
       (local.get $9)
       (local.get $4)
      )
      (i32.const 65535)
     )
    )
    (loop $label$24
     (local.set $8
      (i32.lt_u
       (local.tee $4
        (i32.and
         (local.get $5)
         (i32.const 65535)
        )
       )
       (local.get $2)
      )
     )
     (br_if $label$1
      (i32.ge_u
       (local.get $4)
       (local.get $2)
      )
     )
     (local.set $5
      (i32.add
       (local.get $5)
       (i32.const 1)
      )
     )
     (br_if $label$1
      (call_indirect $0 (type $0)
       (local.get $0)
       (local.get $6)
       (i32.load offset=16
        (local.get $7)
       )
      )
     )
     (br $label$24)
    )
   )
   (local.set $8
    (call_indirect $0 (type $1)
     (i32.load
      (local.get $0)
     )
     (local.get $1)
     (local.get $2)
     (i32.load offset=12
      (i32.load offset=4
       (local.get $0)
      )
     )
    )
   )
  )
  (local.get $8)
 )
 (func $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=16
   (local.get $3)
   (i32.const 0)
  )
  (i32.store offset=4
   (local.get $3)
   (i32.const 1)
  )
  (i64.store offset=8 align=4
   (local.get $3)
   (i64.const 4)
  )
  (i32.store offset=28
   (local.get $3)
   (local.get $1)
  )
  (i32.store offset=24
   (local.get $3)
   (local.get $0)
  )
  (i32.store
   (local.get $3)
   (i32.add
    (local.get $3)
    (i32.const 24)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (local.get $3)
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store16 offset=12
   (local.get $2)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $2)
   (local.get $1)
  )
  (i32.store offset=4
   (local.get $2)
   (local.get $0)
  )
  (call $_RNvCs691rhTbG0Ee_7___rustc17rust_begin_unwind
   (i32.add
    (local.get $2)
    (i32.const 4)
   )
  )
  (unreachable)
 )
 (func $_ZN4core3fmt5write17h68542eb4423e8992E (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=4
   (local.get $3)
   (local.get $1)
  )
  (i32.store
   (local.get $3)
   (local.get $0)
  )
  (i64.store offset=8 align=4
   (local.get $3)
   (i64.const 3758096416)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.eqz
         (local.tee $4
          (i32.load offset=16
           (local.get $2)
          )
         )
        )
       )
       (br_if $label$4
        (local.tee $1
         (i32.load offset=20
          (local.get $2)
         )
        )
       )
       (br $label$3)
      )
      (br_if $label$3
       (i32.eqz
        (local.tee $0
         (i32.load offset=12
          (local.get $2)
         )
        )
       )
      )
      (local.set $5
       (i32.add
        (local.tee $1
         (i32.load offset=8
          (local.get $2)
         )
        )
        (i32.shl
         (local.get $0)
         (i32.const 3)
        )
       )
      )
      (local.set $6
       (i32.add
        (i32.and
         (i32.add
          (local.get $0)
          (i32.const -1)
         )
         (i32.const 536870911)
        )
        (i32.const 1)
       )
      )
      (local.set $0
       (i32.load
        (local.get $2)
       )
      )
      (loop $label$6
       (block $label$7
        (br_if $label$7
         (i32.eqz
          (local.tee $7
           (i32.load
            (i32.add
             (local.get $0)
             (i32.const 4)
            )
           )
          )
         )
        )
        (br_if $label$7
         (i32.eqz
          (call_indirect $0 (type $1)
           (i32.load
            (local.get $3)
           )
           (i32.load
            (local.get $0)
           )
           (local.get $7)
           (i32.load offset=12
            (i32.load offset=4
             (local.get $3)
            )
           )
          )
         )
        )
        (local.set $1
         (i32.const 1)
        )
        (br $label$1)
       )
       (block $label$8
        (br_if $label$8
         (i32.eqz
          (call_indirect $0 (type $0)
           (i32.load
            (local.get $1)
           )
           (local.get $3)
           (i32.load
            (i32.add
             (local.get $1)
             (i32.const 4)
            )
           )
          )
         )
        )
        (local.set $1
         (i32.const 1)
        )
        (br $label$1)
       )
       (local.set $0
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
       )
       (br_if $label$2
        (i32.eq
         (local.tee $1
          (i32.add
           (local.get $1)
           (i32.const 8)
          )
         )
         (local.get $5)
        )
       )
       (br $label$6)
      )
     )
     (local.set $8
      (i32.mul
       (local.get $1)
       (i32.const 24)
      )
     )
     (local.set $6
      (i32.add
       (i32.and
        (i32.add
         (local.get $1)
         (i32.const -1)
        )
        (i32.const 536870911)
       )
       (i32.const 1)
      )
     )
     (local.set $9
      (i32.load offset=8
       (local.get $2)
      )
     )
     (local.set $0
      (i32.load
       (local.get $2)
      )
     )
     (local.set $7
      (i32.const 0)
     )
     (loop $label$9
      (block $label$10
       (br_if $label$10
        (i32.eqz
         (local.tee $1
          (i32.load
           (i32.add
            (local.get $0)
            (i32.const 4)
           )
          )
         )
        )
       )
       (br_if $label$10
        (i32.eqz
         (call_indirect $0 (type $1)
          (i32.load
           (local.get $3)
          )
          (i32.load
           (local.get $0)
          )
          (local.get $1)
          (i32.load offset=12
           (i32.load offset=4
            (local.get $3)
           )
          )
         )
        )
       )
       (local.set $1
        (i32.const 1)
       )
       (br $label$1)
      )
      (local.set $5
       (i32.const 0)
      )
      (local.set $10
       (i32.const 0)
      )
      (block $label$11
       (block $label$12
        (block $label$13
         (br_table $label$13 $label$12 $label$11 $label$13
          (i32.load16_u
           (i32.add
            (local.tee $1
             (i32.add
              (local.get $4)
              (local.get $7)
             )
            )
            (i32.const 8)
           )
          )
         )
        )
        (local.set $10
         (i32.load16_u
          (i32.add
           (local.get $1)
           (i32.const 10)
          )
         )
        )
        (br $label$11)
       )
       (local.set $10
        (i32.load16_u offset=4
         (i32.add
          (local.get $9)
          (i32.shl
           (i32.load
            (i32.add
             (local.get $1)
             (i32.const 12)
            )
           )
           (i32.const 3)
          )
         )
        )
       )
      )
      (block $label$14
       (block $label$15
        (block $label$16
         (br_table $label$16 $label$15 $label$14 $label$16
          (i32.load16_u
           (local.get $1)
          )
         )
        )
        (local.set $5
         (i32.load16_u
          (i32.add
           (local.get $1)
           (i32.const 2)
          )
         )
        )
        (br $label$14)
       )
       (local.set $5
        (i32.load16_u offset=4
         (i32.add
          (local.get $9)
          (i32.shl
           (i32.load
            (i32.add
             (local.get $1)
             (i32.const 4)
            )
           )
           (i32.const 3)
          )
         )
        )
       )
      )
      (i32.store16 offset=14
       (local.get $3)
       (local.get $5)
      )
      (i32.store16 offset=12
       (local.get $3)
       (local.get $10)
      )
      (i32.store offset=8
       (local.get $3)
       (i32.load
        (i32.add
         (local.get $1)
         (i32.const 20)
        )
       )
      )
      (block $label$17
       (br_if $label$17
        (i32.eqz
         (call_indirect $0 (type $0)
          (i32.load
           (local.tee $1
            (i32.add
             (local.get $9)
             (i32.shl
              (i32.load
               (i32.add
                (local.get $1)
                (i32.const 16)
               )
              )
              (i32.const 3)
             )
            )
           )
          )
          (local.get $3)
          (i32.load offset=4
           (local.get $1)
          )
         )
        )
       )
       (local.set $1
        (i32.const 1)
       )
       (br $label$1)
      )
      (local.set $0
       (i32.add
        (local.get $0)
        (i32.const 8)
       )
      )
      (br_if $label$2
       (i32.eq
        (local.get $8)
        (local.tee $7
         (i32.add
          (local.get $7)
          (i32.const 24)
         )
        )
       )
      )
      (br $label$9)
     )
    )
    (local.set $6
     (i32.const 0)
    )
   )
   (block $label$18
    (br_if $label$18
     (i32.ge_u
      (local.get $6)
      (i32.load offset=4
       (local.get $2)
      )
     )
    )
    (br_if $label$18
     (i32.eqz
      (call_indirect $0 (type $1)
       (i32.load
        (local.get $3)
       )
       (i32.load
        (local.tee $1
         (i32.add
          (i32.load
           (local.get $2)
          )
          (i32.shl
           (local.get $6)
           (i32.const 3)
          )
         )
        )
       )
       (i32.load offset=4
        (local.get $1)
       )
       (i32.load offset=12
        (i32.load offset=4
         (local.get $3)
        )
       )
      )
     )
    )
    (local.set $1
     (i32.const 1)
    )
    (br $label$1)
   )
   (local.set $1
    (i32.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
  (local.get $1)
 )
 (func $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17habc228f2dba507bcE (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $4
   (i32.const 10)
  )
  (local.set $5
   (local.get $0)
  )
  (block $label$1
   (br_if $label$1
    (i32.lt_u
     (local.get $0)
     (i32.const 1000)
    )
   )
   (local.set $4
    (i32.const 10)
   )
   (local.set $6
    (local.get $0)
   )
   (loop $label$2
    (i32.store8
     (i32.add
      (local.tee $7
       (i32.add
        (i32.add
         (local.get $3)
         (i32.const 6)
        )
        (local.get $4)
       )
      )
      (i32.const -3)
     )
     (i32.load8_u
      (i32.add
       (local.tee $10
        (i32.shl
         (local.tee $9
          (i32.div_u
           (i32.and
            (local.tee $8
             (i32.sub
              (local.get $6)
              (i32.mul
               (local.tee $5
                (i32.div_u
                 (local.get $6)
                 (i32.const 10000)
                )
               )
               (i32.const 10000)
              )
             )
            )
            (i32.const 65535)
           )
           (i32.const 100)
          )
         )
         (i32.const 1)
        )
       )
       (i32.const 1053200)
      )
     )
    )
    (i32.store8
     (i32.add
      (local.get $7)
      (i32.const -4)
     )
     (i32.load8_u
      (i32.add
       (local.get $10)
       (i32.const 1053199)
      )
     )
    )
    (i32.store8
     (i32.add
      (local.get $7)
      (i32.const -1)
     )
     (i32.load8_u
      (i32.add
       (local.tee $8
        (i32.shl
         (i32.and
          (i32.sub
           (local.get $8)
           (i32.mul
            (local.get $9)
            (i32.const 100)
           )
          )
          (i32.const 65535)
         )
         (i32.const 1)
        )
       )
       (i32.const 1053200)
      )
     )
    )
    (i32.store8
     (i32.add
      (local.get $7)
      (i32.const -2)
     )
     (i32.load8_u
      (i32.add
       (local.get $8)
       (i32.const 1053199)
      )
     )
    )
    (local.set $4
     (i32.add
      (local.get $4)
      (i32.const -4)
     )
    )
    (local.set $7
     (i32.gt_u
      (local.get $6)
      (i32.const 9999999)
     )
    )
    (local.set $6
     (local.get $5)
    )
    (br_if $label$2
     (local.get $7)
    )
   )
  )
  (block $label$3
   (block $label$4
    (br_if $label$4
     (i32.gt_u
      (local.get $5)
      (i32.const 9)
     )
    )
    (local.set $6
     (local.get $5)
    )
    (br $label$3)
   )
   (i32.store8
    (i32.add
     (i32.add
      (i32.add
       (local.get $3)
       (i32.const 6)
      )
      (local.get $4)
     )
     (i32.const -1)
    )
    (i32.load8_u
     (i32.add
      (local.tee $7
       (i32.shl
        (i32.and
         (i32.sub
          (local.get $5)
          (i32.mul
           (local.tee $6
            (i32.div_u
             (i32.and
              (local.get $5)
              (i32.const 65535)
             )
             (i32.const 100)
            )
           )
           (i32.const 100)
          )
         )
         (i32.const 65535)
        )
        (i32.const 1)
       )
      )
      (i32.const 1053200)
     )
    )
   )
   (i32.store8
    (i32.add
     (i32.add
      (local.get $3)
      (i32.const 6)
     )
     (local.tee $4
      (i32.add
       (local.get $4)
       (i32.const -2)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (local.get $7)
      (i32.const 1053199)
     )
    )
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.eqz
      (local.get $0)
     )
    )
    (br_if $label$5
     (i32.eqz
      (local.get $6)
     )
    )
   )
   (i32.store8
    (i32.add
     (i32.add
      (local.get $3)
      (i32.const 6)
     )
     (local.tee $4
      (i32.add
       (local.get $4)
       (i32.const -1)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (i32.and
       (i32.shl
        (local.get $6)
        (i32.const 1)
       )
       (i32.const 30)
      )
      (i32.const 1053200)
     )
    )
   )
  )
  (local.set $6
   (call $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE
    (local.get $2)
    (local.get $1)
    (i32.const 1)
    (i32.const 0)
    (i32.add
     (i32.add
      (local.get $3)
      (i32.const 6)
     )
     (local.get $4)
    )
    (i32.sub
     (i32.const 10)
     (local.get $4)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
  (local.get $6)
 )
 (func $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (result i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (local.get $1)
    )
    (local.set $6
     (i32.add
      (local.get $5)
      (i32.const 1)
     )
    )
    (local.set $7
     (i32.load offset=8
      (local.get $0)
     )
    )
    (local.set $8
     (i32.const 45)
    )
    (br $label$1)
   )
   (local.set $8
    (select
     (i32.const 43)
     (i32.const 1114112)
     (local.tee $1
      (i32.and
       (local.tee $7
        (i32.load offset=8
         (local.get $0)
        )
       )
       (i32.const 2097152)
      )
     )
    )
   )
   (local.set $6
    (i32.add
     (i32.shr_u
      (local.get $1)
      (i32.const 21)
     )
     (local.get $5)
    )
   )
  )
  (block $label$3
   (block $label$4
    (br_if $label$4
     (i32.and
      (local.get $7)
      (i32.const 8388608)
     )
    )
    (local.set $2
     (i32.const 0)
    )
    (br $label$3)
   )
   (block $label$5
    (block $label$6
     (br_if $label$6
      (i32.lt_u
       (local.get $3)
       (i32.const 16)
      )
     )
     (local.set $1
      (call $_ZN4core3str5count14do_count_chars17hfba32584e02717a7E
       (local.get $2)
       (local.get $3)
      )
     )
     (br $label$5)
    )
    (block $label$7
     (br_if $label$7
      (local.get $3)
     )
     (local.set $1
      (i32.const 0)
     )
     (br $label$5)
    )
    (local.set $9
     (i32.and
      (local.get $3)
      (i32.const 3)
     )
    )
    (block $label$8
     (block $label$9
      (br_if $label$9
       (i32.ge_u
        (local.get $3)
        (i32.const 4)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $10
       (i32.const 0)
      )
      (br $label$8)
     )
     (local.set $11
      (i32.and
       (local.get $3)
       (i32.const 12)
      )
     )
     (local.set $1
      (i32.const 0)
     )
     (local.set $10
      (i32.const 0)
     )
     (loop $label$10
      (local.set $1
       (i32.add
        (i32.add
         (i32.add
          (i32.add
           (local.get $1)
           (i32.gt_s
            (i32.load8_s
             (local.tee $12
              (i32.add
               (local.get $2)
               (local.get $10)
              )
             )
            )
            (i32.const -65)
           )
          )
          (i32.gt_s
           (i32.load8_s
            (i32.add
             (local.get $12)
             (i32.const 1)
            )
           )
           (i32.const -65)
          )
         )
         (i32.gt_s
          (i32.load8_s
           (i32.add
            (local.get $12)
            (i32.const 2)
           )
          )
          (i32.const -65)
         )
        )
        (i32.gt_s
         (i32.load8_s
          (i32.add
           (local.get $12)
           (i32.const 3)
          )
         )
         (i32.const -65)
        )
       )
      )
      (br_if $label$10
       (i32.ne
        (local.get $11)
        (local.tee $10
         (i32.add
          (local.get $10)
          (i32.const 4)
         )
        )
       )
      )
     )
    )
    (br_if $label$5
     (i32.eqz
      (local.get $9)
     )
    )
    (local.set $12
     (i32.add
      (local.get $2)
      (local.get $10)
     )
    )
    (loop $label$11
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.gt_s
        (i32.load8_s
         (local.get $12)
        )
        (i32.const -65)
       )
      )
     )
     (local.set $12
      (i32.add
       (local.get $12)
       (i32.const 1)
      )
     )
     (br_if $label$11
      (local.tee $9
       (i32.add
        (local.get $9)
        (i32.const -1)
       )
      )
     )
    )
   )
   (local.set $6
    (i32.add
     (local.get $1)
     (local.get $6)
    )
   )
  )
  (block $label$12
   (block $label$13
    (br_if $label$13
     (i32.ge_u
      (local.get $6)
      (local.tee $11
       (i32.load16_u offset=12
        (local.get $0)
       )
      )
     )
    )
    (block $label$14
     (block $label$15
      (block $label$16
       (br_if $label$16
        (i32.and
         (local.get $7)
         (i32.const 16777216)
        )
       )
       (local.set $13
        (i32.sub
         (local.get $11)
         (local.get $6)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $11
        (i32.const 0)
       )
       (block $label$17
        (block $label$18
         (block $label$19
          (br_table $label$17 $label$19 $label$18 $label$19 $label$17
           (i32.and
            (i32.shr_u
             (local.get $7)
             (i32.const 29)
            )
            (i32.const 3)
           )
          )
         )
         (local.set $11
          (local.get $13)
         )
         (br $label$17)
        )
        (local.set $11
         (i32.shr_u
          (i32.and
           (local.get $13)
           (i32.const 65534)
          )
          (i32.const 1)
         )
        )
       )
       (local.set $6
        (i32.and
         (local.get $7)
         (i32.const 2097151)
        )
       )
       (local.set $9
        (i32.load offset=4
         (local.get $0)
        )
       )
       (local.set $10
        (i32.load
         (local.get $0)
        )
       )
       (loop $label$20
        (br_if $label$15
         (i32.ge_u
          (i32.and
           (local.get $1)
           (i32.const 65535)
          )
          (i32.and
           (local.get $11)
           (i32.const 65535)
          )
         )
        )
        (local.set $12
         (i32.const 1)
        )
        (local.set $1
         (i32.add
          (local.get $1)
          (i32.const 1)
         )
        )
        (br_if $label$20
         (i32.eqz
          (call_indirect $0 (type $0)
           (local.get $10)
           (local.get $6)
           (i32.load offset=16
            (local.get $9)
           )
          )
         )
        )
        (br $label$12)
       )
      )
      (i32.store offset=8
       (local.get $0)
       (i32.or
        (i32.and
         (i32.wrap_i64
          (local.tee $14
           (i64.load offset=8 align=4
            (local.get $0)
           )
          )
         )
         (i32.const -1612709888)
        )
        (i32.const 536870960)
       )
      )
      (local.set $12
       (i32.const 1)
      )
      (br_if $label$12
       (call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h9b7f224add674e2aE
        (local.tee $10
         (i32.load
          (local.get $0)
         )
        )
        (local.tee $9
         (i32.load offset=4
          (local.get $0)
         )
        )
        (local.get $8)
        (local.get $2)
        (local.get $3)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $2
       (i32.and
        (i32.sub
         (local.get $11)
         (local.get $6)
        )
        (i32.const 65535)
       )
      )
      (loop $label$21
       (br_if $label$14
        (i32.ge_u
         (i32.and
          (local.get $1)
          (i32.const 65535)
         )
         (local.get $2)
        )
       )
       (local.set $12
        (i32.const 1)
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 1)
        )
       )
       (br_if $label$21
        (i32.eqz
         (call_indirect $0 (type $0)
          (local.get $10)
          (i32.const 48)
          (i32.load offset=16
           (local.get $9)
          )
         )
        )
       )
       (br $label$12)
      )
     )
     (local.set $12
      (i32.const 1)
     )
     (br_if $label$12
      (call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h9b7f224add674e2aE
       (local.get $10)
       (local.get $9)
       (local.get $8)
       (local.get $2)
       (local.get $3)
      )
     )
     (br_if $label$12
      (call_indirect $0 (type $1)
       (local.get $10)
       (local.get $4)
       (local.get $5)
       (i32.load offset=12
        (local.get $9)
       )
      )
     )
     (local.set $1
      (i32.const 0)
     )
     (local.set $0
      (i32.and
       (i32.sub
        (local.get $13)
        (local.get $11)
       )
       (i32.const 65535)
      )
     )
     (loop $label$22
      (local.set $12
       (i32.lt_u
        (local.tee $2
         (i32.and
          (local.get $1)
          (i32.const 65535)
         )
        )
        (local.get $0)
       )
      )
      (br_if $label$12
       (i32.ge_u
        (local.get $2)
        (local.get $0)
       )
      )
      (local.set $1
       (i32.add
        (local.get $1)
        (i32.const 1)
       )
      )
      (br_if $label$22
       (i32.eqz
        (call_indirect $0 (type $0)
         (local.get $10)
         (local.get $6)
         (i32.load offset=16
          (local.get $9)
         )
        )
       )
      )
      (br $label$12)
     )
    )
    (local.set $12
     (i32.const 1)
    )
    (br_if $label$12
     (call_indirect $0 (type $1)
      (local.get $10)
      (local.get $4)
      (local.get $5)
      (i32.load offset=12
       (local.get $9)
      )
     )
    )
    (i64.store offset=8 align=4
     (local.get $0)
     (local.get $14)
    )
    (return
     (i32.const 0)
    )
   )
   (local.set $12
    (i32.const 1)
   )
   (br_if $label$12
    (call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h9b7f224add674e2aE
     (local.tee $1
      (i32.load
       (local.get $0)
      )
     )
     (local.tee $10
      (i32.load offset=4
       (local.get $0)
      )
     )
     (local.get $8)
     (local.get $2)
     (local.get $3)
    )
   )
   (local.set $12
    (call_indirect $0 (type $1)
     (local.get $1)
     (local.get $4)
     (local.get $5)
     (i32.load offset=12
      (local.get $10)
     )
    )
   )
  )
  (local.get $12)
 )
 (func $_ZN4core3str5count14do_count_chars17hfba32584e02717a7E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.lt_u
      (local.get $1)
      (local.tee $3
       (i32.sub
        (local.tee $2
         (i32.and
          (i32.add
           (local.get $0)
           (i32.const 3)
          )
          (i32.const -4)
         )
        )
        (local.get $0)
       )
      )
     )
    )
    (br_if $label$2
     (i32.lt_u
      (local.tee $4
       (i32.sub
        (local.get $1)
        (local.get $3)
       )
      )
      (i32.const 4)
     )
    )
    (local.set $5
     (i32.and
      (local.get $4)
      (i32.const 3)
     )
    )
    (local.set $6
     (i32.const 0)
    )
    (local.set $1
     (i32.const 0)
    )
    (block $label$3
     (br_if $label$3
      (local.tee $7
       (i32.eq
        (local.get $2)
        (local.get $0)
       )
      )
     )
     (local.set $1
      (i32.const 0)
     )
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.le_u
         (local.tee $8
          (i32.sub
           (local.get $0)
           (local.get $2)
          )
         )
         (i32.const -4)
        )
       )
       (local.set $9
        (i32.const 0)
       )
       (br $label$4)
      )
      (local.set $9
       (i32.const 0)
      )
      (loop $label$6
       (local.set $1
        (i32.add
         (i32.add
          (i32.add
           (i32.add
            (local.get $1)
            (i32.gt_s
             (i32.load8_s
              (local.tee $2
               (i32.add
                (local.get $0)
                (local.get $9)
               )
              )
             )
             (i32.const -65)
            )
           )
           (i32.gt_s
            (i32.load8_s
             (i32.add
              (local.get $2)
              (i32.const 1)
             )
            )
            (i32.const -65)
           )
          )
          (i32.gt_s
           (i32.load8_s
            (i32.add
             (local.get $2)
             (i32.const 2)
            )
           )
           (i32.const -65)
          )
         )
         (i32.gt_s
          (i32.load8_s
           (i32.add
            (local.get $2)
            (i32.const 3)
           )
          )
          (i32.const -65)
         )
        )
       )
       (br_if $label$6
        (local.tee $9
         (i32.add
          (local.get $9)
          (i32.const 4)
         )
        )
       )
      )
     )
     (br_if $label$3
      (local.get $7)
     )
     (local.set $2
      (i32.add
       (local.get $0)
       (local.get $9)
      )
     )
     (loop $label$7
      (local.set $1
       (i32.add
        (local.get $1)
        (i32.gt_s
         (i32.load8_s
          (local.get $2)
         )
         (i32.const -65)
        )
       )
      )
      (local.set $2
       (i32.add
        (local.get $2)
        (i32.const 1)
       )
      )
      (br_if $label$7
       (local.tee $8
        (i32.add
         (local.get $8)
         (i32.const 1)
        )
       )
      )
     )
    )
    (local.set $0
     (i32.add
      (local.get $0)
      (local.get $3)
     )
    )
    (block $label$8
     (br_if $label$8
      (i32.eqz
       (local.get $5)
      )
     )
     (local.set $6
      (i32.gt_s
       (i32.load8_s
        (local.tee $2
         (i32.add
          (local.get $0)
          (i32.and
           (local.get $4)
           (i32.const -4)
          )
         )
        )
       )
       (i32.const -65)
      )
     )
     (br_if $label$8
      (i32.eq
       (local.get $5)
       (i32.const 1)
      )
     )
     (local.set $6
      (i32.add
       (local.get $6)
       (i32.gt_s
        (i32.load8_s offset=1
         (local.get $2)
        )
        (i32.const -65)
       )
      )
     )
     (br_if $label$8
      (i32.eq
       (local.get $5)
       (i32.const 2)
      )
     )
     (local.set $6
      (i32.add
       (local.get $6)
       (i32.gt_s
        (i32.load8_s offset=2
         (local.get $2)
        )
        (i32.const -65)
       )
      )
     )
    )
    (local.set $8
     (i32.shr_u
      (local.get $4)
      (i32.const 2)
     )
    )
    (local.set $3
     (i32.add
      (local.get $6)
      (local.get $1)
     )
    )
    (loop $label$9
     (local.set $4
      (local.get $0)
     )
     (br_if $label$1
      (i32.eqz
       (local.get $8)
      )
     )
     (local.set $7
      (i32.and
       (local.tee $6
        (select
         (local.get $8)
         (i32.const 192)
         (i32.lt_u
          (local.get $8)
          (i32.const 192)
         )
        )
       )
       (i32.const 3)
      )
     )
     (local.set $5
      (i32.shl
       (local.get $6)
       (i32.const 2)
      )
     )
     (local.set $2
      (i32.const 0)
     )
     (block $label$10
      (br_if $label$10
       (i32.lt_u
        (local.get $8)
        (i32.const 4)
       )
      )
      (local.set $9
       (i32.add
        (local.get $4)
        (i32.and
         (local.get $5)
         (i32.const 1008)
        )
       )
      )
      (local.set $2
       (i32.const 0)
      )
      (local.set $1
       (local.get $4)
      )
      (loop $label$11
       (local.set $2
        (i32.add
         (i32.and
          (i32.or
           (i32.shr_u
            (i32.xor
             (local.tee $0
              (i32.load
               (i32.add
                (local.get $1)
                (i32.const 12)
               )
              )
             )
             (i32.const -1)
            )
            (i32.const 7)
           )
           (i32.shr_u
            (local.get $0)
            (i32.const 6)
           )
          )
          (i32.const 16843009)
         )
         (i32.add
          (i32.and
           (i32.or
            (i32.shr_u
             (i32.xor
              (local.tee $0
               (i32.load
                (i32.add
                 (local.get $1)
                 (i32.const 8)
                )
               )
              )
              (i32.const -1)
             )
             (i32.const 7)
            )
            (i32.shr_u
             (local.get $0)
             (i32.const 6)
            )
           )
           (i32.const 16843009)
          )
          (i32.add
           (i32.and
            (i32.or
             (i32.shr_u
              (i32.xor
               (local.tee $0
                (i32.load
                 (i32.add
                  (local.get $1)
                  (i32.const 4)
                 )
                )
               )
               (i32.const -1)
              )
              (i32.const 7)
             )
             (i32.shr_u
              (local.get $0)
              (i32.const 6)
             )
            )
            (i32.const 16843009)
           )
           (i32.add
            (i32.and
             (i32.or
              (i32.shr_u
               (i32.xor
                (local.tee $0
                 (i32.load
                  (local.get $1)
                 )
                )
                (i32.const -1)
               )
               (i32.const 7)
              )
              (i32.shr_u
               (local.get $0)
               (i32.const 6)
              )
             )
             (i32.const 16843009)
            )
            (local.get $2)
           )
          )
         )
        )
       )
       (br_if $label$11
        (i32.ne
         (local.tee $1
          (i32.add
           (local.get $1)
           (i32.const 16)
          )
         )
         (local.get $9)
        )
       )
      )
     )
     (local.set $8
      (i32.sub
       (local.get $8)
       (local.get $6)
      )
     )
     (local.set $0
      (i32.add
       (local.get $4)
       (local.get $5)
      )
     )
     (local.set $3
      (i32.add
       (i32.shr_u
        (i32.mul
         (i32.add
          (i32.and
           (i32.shr_u
            (local.get $2)
            (i32.const 8)
           )
           (i32.const 16711935)
          )
          (i32.and
           (local.get $2)
           (i32.const 16711935)
          )
         )
         (i32.const 65537)
        )
        (i32.const 16)
       )
       (local.get $3)
      )
     )
     (br_if $label$9
      (i32.eqz
       (local.get $7)
      )
     )
    )
    (local.set $1
     (i32.and
      (i32.or
       (i32.shr_u
        (i32.xor
         (local.tee $1
          (i32.load
           (local.tee $2
            (i32.add
             (local.get $4)
             (i32.shl
              (i32.and
               (local.get $6)
               (i32.const 252)
              )
              (i32.const 2)
             )
            )
           )
          )
         )
         (i32.const -1)
        )
        (i32.const 7)
       )
       (i32.shr_u
        (local.get $1)
        (i32.const 6)
       )
      )
      (i32.const 16843009)
     )
    )
    (block $label$12
     (br_if $label$12
      (i32.eq
       (local.get $7)
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.add
       (i32.and
        (i32.or
         (i32.shr_u
          (i32.xor
           (local.tee $0
            (i32.load offset=4
             (local.get $2)
            )
           )
           (i32.const -1)
          )
          (i32.const 7)
         )
         (i32.shr_u
          (local.get $0)
          (i32.const 6)
         )
        )
        (i32.const 16843009)
       )
       (local.get $1)
      )
     )
     (br_if $label$12
      (i32.eq
       (local.get $7)
       (i32.const 2)
      )
     )
     (local.set $1
      (i32.add
       (i32.and
        (i32.or
         (i32.shr_u
          (i32.xor
           (local.tee $2
            (i32.load offset=8
             (local.get $2)
            )
           )
           (i32.const -1)
          )
          (i32.const 7)
         )
         (i32.shr_u
          (local.get $2)
          (i32.const 6)
         )
        )
        (i32.const 16843009)
       )
       (local.get $1)
      )
     )
    )
    (return
     (i32.add
      (i32.shr_u
       (i32.mul
        (i32.add
         (i32.and
          (i32.shr_u
           (local.get $1)
           (i32.const 8)
          )
          (i32.const 459007)
         )
         (i32.and
          (local.get $1)
          (i32.const 16711935)
         )
        )
        (i32.const 65537)
       )
       (i32.const 16)
      )
      (local.get $3)
     )
    )
   )
   (block $label$13
    (br_if $label$13
     (local.get $1)
    )
    (return
     (i32.const 0)
    )
   )
   (local.set $9
    (i32.and
     (local.get $1)
     (i32.const 3)
    )
   )
   (block $label$14
    (block $label$15
     (br_if $label$15
      (i32.ge_u
       (local.get $1)
       (i32.const 4)
      )
     )
     (local.set $3
      (i32.const 0)
     )
     (local.set $2
      (i32.const 0)
     )
     (br $label$14)
    )
    (local.set $8
     (i32.and
      (local.get $1)
      (i32.const -4)
     )
    )
    (local.set $3
     (i32.const 0)
    )
    (local.set $2
     (i32.const 0)
    )
    (loop $label$16
     (local.set $3
      (i32.add
       (i32.add
        (i32.add
         (i32.add
          (local.get $3)
          (i32.gt_s
           (i32.load8_s
            (local.tee $1
             (i32.add
              (local.get $0)
              (local.get $2)
             )
            )
           )
           (i32.const -65)
          )
         )
         (i32.gt_s
          (i32.load8_s
           (i32.add
            (local.get $1)
            (i32.const 1)
           )
          )
          (i32.const -65)
         )
        )
        (i32.gt_s
         (i32.load8_s
          (i32.add
           (local.get $1)
           (i32.const 2)
          )
         )
         (i32.const -65)
        )
       )
       (i32.gt_s
        (i32.load8_s
         (i32.add
          (local.get $1)
          (i32.const 3)
         )
        )
        (i32.const -65)
       )
      )
     )
     (br_if $label$16
      (i32.ne
       (local.get $8)
       (local.tee $2
        (i32.add
         (local.get $2)
         (i32.const 4)
        )
       )
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (local.get $9)
    )
   )
   (local.set $1
    (i32.add
     (local.get $0)
     (local.get $2)
    )
   )
   (loop $label$17
    (local.set $3
     (i32.add
      (local.get $3)
      (i32.gt_s
       (i32.load8_s
        (local.get $1)
       )
       (i32.const -65)
      )
     )
    )
    (local.set $1
     (i32.add
      (local.get $1)
      (i32.const 1)
     )
    )
    (br_if $label$17
     (local.tee $9
      (i32.add
       (local.get $9)
       (i32.const -1)
      )
     )
    )
   )
  )
  (local.get $3)
 )
 (func $_ZN4core3fmt8builders11DebugStruct5field17he68b8ced02bd779dE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $6
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.load8_u offset=4
     (local.get $0)
    )
   )
   (local.set $7
    (i32.load8_u offset=5
     (local.get $0)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load8_u offset=10
       (local.tee $8
        (i32.load
         (local.get $0)
        )
       )
      )
      (i32.const 128)
     )
    )
    (local.set $6
     (i32.const 1)
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $8)
      )
      (select
       (i32.const 1053183)
       (i32.const 1053180)
       (local.tee $7
        (i32.and
         (local.get $7)
         (i32.const 1)
        )
       )
      )
      (select
       (i32.const 2)
       (i32.const 3)
       (local.get $7)
      )
      (i32.load offset=12
       (i32.load offset=4
        (local.get $8)
       )
      )
     )
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $8)
      )
      (local.get $1)
      (local.get $2)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $8)
       )
      )
     )
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $8)
      )
      (i32.const 1053132)
      (i32.const 2)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $8)
       )
      )
     )
    )
    (local.set $6
     (call_indirect $0 (type $0)
      (local.get $3)
      (local.get $8)
      (i32.load offset=12
       (local.get $4)
      )
     )
    )
    (br $label$1)
   )
   (local.set $6
    (i32.const 1)
   )
   (block $label$3
    (br_if $label$3
     (i32.and
      (local.get $7)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $8)
      )
      (i32.const 1053185)
      (i32.const 3)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $8)
       )
      )
     )
    )
   )
   (local.set $6
    (i32.const 1)
   )
   (i32.store8 offset=15
    (local.get $5)
    (i32.const 1)
   )
   (i32.store offset=20
    (local.get $5)
    (i32.const 1053152)
   )
   (i64.store align=4
    (local.get $5)
    (i64.load align=4
     (local.get $8)
    )
   )
   (i64.store offset=24 align=4
    (local.get $5)
    (i64.load offset=8 align=4
     (local.get $8)
    )
   )
   (i32.store offset=8
    (local.get $5)
    (i32.add
     (local.get $5)
     (i32.const 15)
    )
   )
   (i32.store offset=16
    (local.get $5)
    (local.get $5)
   )
   (br_if $label$1
    (call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h915418dd4db6343bE
     (local.get $5)
     (local.get $1)
     (local.get $2)
    )
   )
   (br_if $label$1
    (call $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h915418dd4db6343bE
     (local.get $5)
     (i32.const 1053132)
     (i32.const 2)
    )
   )
   (br_if $label$1
    (call_indirect $0 (type $0)
     (local.get $3)
     (i32.add
      (local.get $5)
      (i32.const 16)
     )
     (i32.load offset=12
      (local.get $4)
     )
    )
   )
   (local.set $6
    (call_indirect $0 (type $1)
     (i32.load offset=16
      (local.get $5)
     )
     (i32.const 1053188)
     (i32.const 2)
     (i32.load offset=12
      (i32.load offset=20
       (local.get $5)
      )
     )
    )
   )
  )
  (i32.store8 offset=5
   (local.get $0)
   (i32.const 1)
  )
  (i32.store8 offset=4
   (local.get $0)
   (local.get $6)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
  )
  (local.get $0)
 )
 (func $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 64)
    )
   )
  )
  (i32.store offset=12
   (local.get $5)
   (local.get $1)
  )
  (i32.store offset=8
   (local.get $5)
   (local.get $0)
  )
  (i32.store offset=20
   (local.get $5)
   (local.get $3)
  )
  (i32.store offset=16
   (local.get $5)
   (local.get $2)
  )
  (i32.store offset=28
   (local.get $5)
   (i32.const 2)
  )
  (i32.store offset=24
   (local.get $5)
   (i32.const 1053136)
  )
  (i64.store offset=36 align=4
   (local.get $5)
   (i64.const 2)
  )
  (i64.store offset=56
   (local.get $5)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 35)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $5)
      (i32.const 16)
     )
    )
   )
  )
  (i64.store offset=48
   (local.get $5)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 36)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $5)
      (i32.const 8)
     )
    )
   )
  )
  (i32.store offset=32
   (local.get $5)
   (i32.add
    (local.get $5)
    (i32.const 48)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $5)
    (i32.const 24)
   )
   (local.get $4)
  )
  (unreachable)
 )
 (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h10d43ed3b5ffe62fE (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17habc228f2dba507bcE
   (i32.load
    (local.get $0)
   )
   (i32.const 1)
   (local.get $1)
  )
 )
 (func $_ZN4core6option13unwrap_failed17h0450242c3e36021bE (param $0 i32)
  (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
   (i32.const 1052944)
   (i32.const 43)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN4core6option13expect_failed17hf57fb2c2bc253385E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (i32.store offset=12
   (local.get $3)
   (local.get $1)
  )
  (i32.store offset=8
   (local.get $3)
   (local.get $0)
  )
  (i32.store offset=20
   (local.get $3)
   (i32.const 1)
  )
  (i32.store offset=16
   (local.get $3)
   (i32.const 1052936)
  )
  (i64.store offset=28 align=4
   (local.get $3)
   (i64.const 1)
  )
  (i64.store offset=40
   (local.get $3)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 36)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $3)
      (i32.const 8)
     )
    )
   )
  )
  (i32.store offset=24
   (local.get $3)
   (i32.add
    (local.get $3)
    (i32.const 40)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h44818328333068deE (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt9Formatter3pad17h5a5f539bbb272398E
   (local.get $1)
   (i32.load
    (local.get $0)
   )
   (i32.load offset=4
    (local.get $0)
   )
  )
 )
 (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he0816313014f2d4eE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 128)
    )
   )
  )
  (local.set $0
   (i32.load
    (local.get $0)
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (loop $label$1
   (i32.store8
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $3)
     )
     (i32.const 127)
    )
    (select
     (i32.or
      (local.tee $4
       (i32.and
        (local.get $0)
        (i32.const 15)
       )
      )
      (i32.const 48)
     )
     (i32.add
      (local.get $4)
      (i32.const 87)
     )
     (i32.lt_u
      (local.get $4)
      (i32.const 10)
     )
    )
   )
   (local.set $3
    (i32.add
     (local.get $3)
     (i32.const -1)
    )
   )
   (local.set $4
    (i32.gt_u
     (local.get $0)
     (i32.const 15)
    )
   )
   (local.set $0
    (i32.shr_u
     (local.get $0)
     (i32.const 4)
    )
   )
   (br_if $label$1
    (local.get $4)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE
    (local.get $1)
    (i32.const 1)
    (i32.const 1053197)
    (i32.const 2)
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $3)
     )
     (i32.const 128)
    )
    (i32.sub
     (i32.const 0)
     (local.get $3)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 128)
   )
  )
  (local.get $0)
 )
 (func $_ZN4core9panicking19assert_failed_inner17h195f2bdae754966cE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32)
  (local $7 i32)
  (local $8 i64)
  (global.set $__stack_pointer
   (local.tee $7
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 112)
    )
   )
  )
  (i32.store offset=12
   (local.get $7)
   (local.get $2)
  )
  (i32.store offset=8
   (local.get $7)
   (local.get $1)
  )
  (i32.store offset=20
   (local.get $7)
   (local.get $4)
  )
  (i32.store offset=16
   (local.get $7)
   (local.get $3)
  )
  (i32.store offset=28
   (local.get $7)
   (i32.load
    (i32.add
     (local.tee $2
      (i32.shl
       (i32.and
        (local.get $0)
        (i32.const 255)
       )
       (i32.const 2)
      )
     )
     (i32.const 1053512)
    )
   )
  )
  (i32.store offset=24
   (local.get $7)
   (i32.load
    (i32.add
     (local.get $2)
     (i32.const 1053500)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.load
      (local.get $5)
     )
    )
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $7)
      (i32.const 32)
     )
     (i32.const 16)
    )
    (i64.load align=4
     (i32.add
      (local.get $5)
      (i32.const 16)
     )
    )
   )
   (i64.store
    (i32.add
     (i32.add
      (local.get $7)
      (i32.const 32)
     )
     (i32.const 8)
    )
    (i64.load align=4
     (i32.add
      (local.get $5)
      (i32.const 8)
     )
    )
   )
   (i64.store offset=32
    (local.get $7)
    (i64.load align=4
     (local.get $5)
    )
   )
   (i32.store offset=92
    (local.get $7)
    (i32.const 4)
   )
   (i32.store offset=88
    (local.get $7)
    (i32.const 1053100)
   )
   (i64.store offset=100 align=4
    (local.get $7)
    (i64.const 4)
   )
   (i64.store offset=80
    (local.get $7)
    (i64.or
     (local.tee $8
      (i64.shl
       (i64.extend_i32_u
        (i32.const 35)
       )
       (i64.const 32)
      )
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $7)
       (i32.const 16)
      )
     )
    )
   )
   (i64.store offset=72
    (local.get $7)
    (i64.or
     (local.get $8)
     (i64.extend_i32_u
      (i32.add
       (local.get $7)
       (i32.const 8)
      )
     )
    )
   )
   (i64.store offset=64
    (local.get $7)
    (i64.or
     (i64.shl
      (i64.extend_i32_u
       (i32.const 37)
      )
      (i64.const 32)
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $7)
       (i32.const 32)
      )
     )
    )
   )
   (i64.store offset=56
    (local.get $7)
    (i64.or
     (i64.shl
      (i64.extend_i32_u
       (i32.const 36)
      )
      (i64.const 32)
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $7)
       (i32.const 24)
      )
     )
    )
   )
   (i32.store offset=96
    (local.get $7)
    (i32.add
     (local.get $7)
     (i32.const 56)
    )
   )
   (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
    (i32.add
     (local.get $7)
     (i32.const 88)
    )
    (local.get $6)
   )
   (unreachable)
  )
  (i32.store offset=92
   (local.get $7)
   (i32.const 3)
  )
  (i32.store offset=88
   (local.get $7)
   (i32.const 1053048)
  )
  (i64.store offset=100 align=4
   (local.get $7)
   (i64.const 3)
  )
  (i64.store offset=72
   (local.get $7)
   (i64.or
    (local.tee $8
     (i64.shl
      (i64.extend_i32_u
       (i32.const 35)
      )
      (i64.const 32)
     )
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $7)
      (i32.const 16)
     )
    )
   )
  )
  (i64.store offset=64
   (local.get $7)
   (i64.or
    (local.get $8)
    (i64.extend_i32_u
     (i32.add
      (local.get $7)
      (i32.const 8)
     )
    )
   )
  )
  (i64.store offset=56
   (local.get $7)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 36)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $7)
      (i32.const 24)
     )
    )
   )
  )
  (i32.store offset=96
   (local.get $7)
   (i32.add
    (local.get $7)
    (i32.const 56)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $7)
    (i32.const 88)
   )
   (local.get $6)
  )
  (unreachable)
 )
 (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb7cc4525d713b4b9E (param $0 i32) (param $1 i32) (result i32)
  (call_indirect $0 (type $0)
   (i32.load
    (local.get $0)
   )
   (local.get $1)
   (i32.load offset=12
    (i32.load offset=4
     (local.get $0)
    )
   )
  )
 )
 (func $_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hbcc53bae7249994aE (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt5write17h68542eb4423e8992E
   (i32.load
    (local.get $1)
   )
   (i32.load offset=4
    (local.get $1)
   )
   (local.get $0)
  )
 )
 (func $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h915418dd4db6343bE (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local.set $3
   (i32.add
    (local.get $1)
    (i32.const -1)
   )
  )
  (local.set $4
   (i32.load offset=4
    (local.get $0)
   )
  )
  (local.set $5
   (i32.load
    (local.get $0)
   )
  )
  (local.set $6
   (i32.load offset=8
    (local.get $0)
   )
  )
  (local.set $7
   (i32.const 0)
  )
  (local.set $8
   (i32.const 0)
  )
  (local.set $9
   (i32.const 0)
  )
  (local.set $10
   (i32.const 0)
  )
  (block $label$1
   (loop $label$2
    (br_if $label$1
     (i32.and
      (local.get $10)
      (i32.const 1)
     )
    )
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.lt_u
        (local.get $2)
        (local.get $9)
       )
      )
      (loop $label$5
       (local.set $10
        (i32.add
         (local.get $1)
         (local.get $9)
        )
       )
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (br_if $label$9
            (i32.gt_u
             (local.tee $11
              (i32.sub
               (local.get $2)
               (local.get $9)
              )
             )
             (i32.const 7)
            )
           )
           (br_if $label$8
            (i32.ne
             (local.get $2)
             (local.get $9)
            )
           )
           (local.set $9
            (local.get $2)
           )
           (br $label$4)
          )
          (block $label$10
           (block $label$11
            (br_if $label$11
             (i32.eqz
              (local.tee $13
               (i32.sub
                (local.tee $12
                 (i32.and
                  (i32.add
                   (local.get $10)
                   (i32.const 3)
                  )
                  (i32.const -4)
                 )
                )
                (local.get $10)
               )
              )
             )
            )
            (local.set $0
             (i32.const 0)
            )
            (loop $label$12
             (br_if $label$6
              (i32.eq
               (i32.load8_u
                (i32.add
                 (local.get $10)
                 (local.get $0)
                )
               )
               (i32.const 10)
              )
             )
             (br_if $label$12
              (i32.ne
               (local.get $13)
               (local.tee $0
                (i32.add
                 (local.get $0)
                 (i32.const 1)
                )
               )
              )
             )
            )
            (br_if $label$10
             (i32.le_u
              (local.get $13)
              (local.tee $14
               (i32.add
                (local.get $11)
                (i32.const -8)
               )
              )
             )
            )
            (br $label$7)
           )
           (local.set $14
            (i32.add
             (local.get $11)
             (i32.const -8)
            )
           )
          )
          (loop $label$13
           (br_if $label$7
            (i32.ne
             (i32.and
              (i32.and
               (i32.or
                (i32.sub
                 (i32.const 16843008)
                 (i32.xor
                  (local.tee $0
                   (i32.load
                    (local.get $12)
                   )
                  )
                  (i32.const 168430090)
                 )
                )
                (local.get $0)
               )
               (i32.or
                (i32.sub
                 (i32.const 16843008)
                 (i32.xor
                  (local.tee $0
                   (i32.load
                    (i32.add
                     (local.get $12)
                     (i32.const 4)
                    )
                   )
                  )
                  (i32.const 168430090)
                 )
                )
                (local.get $0)
               )
              )
              (i32.const -2139062144)
             )
             (i32.const -2139062144)
            )
           )
           (local.set $12
            (i32.add
             (local.get $12)
             (i32.const 8)
            )
           )
           (br_if $label$13
            (i32.le_u
             (local.tee $13
              (i32.add
               (local.get $13)
               (i32.const 8)
              )
             )
             (local.get $14)
            )
           )
           (br $label$7)
          )
         )
         (local.set $0
          (i32.const 0)
         )
         (loop $label$14
          (br_if $label$6
           (i32.eq
            (i32.load8_u
             (i32.add
              (local.get $10)
              (local.get $0)
             )
            )
            (i32.const 10)
           )
          )
          (br_if $label$14
           (i32.ne
            (local.get $11)
            (local.tee $0
             (i32.add
              (local.get $0)
              (i32.const 1)
             )
            )
           )
          )
         )
         (local.set $9
          (local.get $2)
         )
         (br $label$4)
        )
        (block $label$15
         (br_if $label$15
          (i32.ne
           (local.get $11)
           (local.get $13)
          )
         )
         (local.set $9
          (local.get $2)
         )
         (br $label$4)
        )
        (loop $label$16
         (block $label$17
          (br_if $label$17
           (i32.ne
            (i32.load8_u
             (i32.add
              (local.get $10)
              (local.get $13)
             )
            )
            (i32.const 10)
           )
          )
          (local.set $0
           (local.get $13)
          )
          (br $label$6)
         )
         (br_if $label$16
          (i32.ne
           (local.get $11)
           (local.tee $13
            (i32.add
             (local.get $13)
             (i32.const 1)
            )
           )
          )
         )
        )
        (local.set $9
         (local.get $2)
        )
        (br $label$4)
       )
       (local.set $9
        (i32.add
         (local.tee $13
          (i32.add
           (local.get $0)
           (local.get $9)
          )
         )
         (i32.const 1)
        )
       )
       (block $label$18
        (br_if $label$18
         (i32.ge_u
          (local.get $13)
          (local.get $2)
         )
        )
        (br_if $label$18
         (i32.ne
          (i32.load8_u
           (i32.add
            (local.get $10)
            (local.get $0)
           )
          )
          (i32.const 10)
         )
        )
        (local.set $10
         (i32.const 0)
        )
        (local.set $12
         (local.get $9)
        )
        (local.set $0
         (local.get $9)
        )
        (br $label$3)
       )
       (br_if $label$5
        (i32.le_u
         (local.get $9)
         (local.get $2)
        )
       )
      )
     )
     (br_if $label$1
      (i32.eq
       (local.get $2)
       (local.get $8)
      )
     )
     (local.set $10
      (i32.const 1)
     )
     (local.set $12
      (local.get $8)
     )
     (local.set $0
      (local.get $2)
     )
    )
    (block $label$19
     (block $label$20
      (br_if $label$20
       (i32.eqz
        (i32.load8_u
         (local.get $6)
        )
       )
      )
      (br_if $label$19
       (call_indirect $0 (type $1)
        (local.get $5)
        (i32.const 1053176)
        (i32.const 4)
        (i32.load offset=12
         (local.get $4)
        )
       )
      )
     )
     (local.set $11
      (i32.sub
       (local.get $0)
       (local.get $8)
      )
     )
     (local.set $13
      (i32.const 0)
     )
     (block $label$21
      (br_if $label$21
       (i32.eq
        (local.get $0)
        (local.get $8)
       )
      )
      (local.set $13
       (i32.eq
        (i32.load8_u
         (i32.add
          (local.get $3)
          (local.get $0)
         )
        )
        (i32.const 10)
       )
      )
     )
     (local.set $0
      (i32.add
       (local.get $1)
       (local.get $8)
      )
     )
     (i32.store8
      (local.get $6)
      (local.get $13)
     )
     (local.set $8
      (local.get $12)
     )
     (br_if $label$2
      (i32.eqz
       (call_indirect $0 (type $1)
        (local.get $5)
        (local.get $0)
        (local.get $11)
        (i32.load offset=12
         (local.get $4)
        )
       )
      )
     )
    )
   )
   (local.set $7
    (i32.const 1)
   )
  )
  (local.get $7)
 )
 (func $_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17h201a3da0f3901d61E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local.set $2
   (i32.load offset=4
    (local.get $0)
   )
  )
  (local.set $3
   (i32.load
    (local.get $0)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.load8_u
      (local.tee $0
       (i32.load offset=8
        (local.get $0)
       )
      )
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (call_indirect $0 (type $1)
      (local.get $3)
      (i32.const 1053176)
      (i32.const 4)
      (i32.load offset=12
       (local.get $2)
      )
     )
    )
   )
   (return
    (i32.const 1)
   )
  )
  (i32.store8
   (local.get $0)
   (i32.eq
    (local.get $1)
    (i32.const 10)
   )
  )
  (call_indirect $0 (type $0)
   (local.get $3)
   (local.get $1)
   (i32.load offset=16
    (local.get $2)
   )
  )
 )
 (func $_ZN4core3fmt8builders10DebugTuple5field17h88abbfe9483517b6E (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $4
   (i32.load
    (local.get $0)
   )
  )
  (local.set $5
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.load8_u offset=8
     (local.get $0)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load8_u offset=10
       (local.tee $6
        (i32.load offset=4
         (local.get $0)
        )
       )
      )
      (i32.const 128)
     )
    )
    (local.set $5
     (i32.const 1)
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $6)
      )
      (select
       (i32.const 1053183)
       (i32.const 1053193)
       (local.get $4)
      )
      (select
       (i32.const 2)
       (i32.const 1)
       (local.get $4)
      )
      (i32.load offset=12
       (i32.load offset=4
        (local.get $6)
       )
      )
     )
    )
    (local.set $5
     (call_indirect $0 (type $0)
      (local.get $1)
      (local.get $6)
      (i32.load offset=12
       (local.get $2)
      )
     )
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (local.get $4)
    )
    (local.set $5
     (i32.const 1)
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $6)
      )
      (i32.const 1053194)
      (i32.const 2)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $6)
       )
      )
     )
    )
   )
   (local.set $5
    (i32.const 1)
   )
   (i32.store8 offset=15
    (local.get $3)
    (i32.const 1)
   )
   (i32.store offset=20
    (local.get $3)
    (i32.const 1053152)
   )
   (i64.store align=4
    (local.get $3)
    (i64.load align=4
     (local.get $6)
    )
   )
   (i64.store offset=24 align=4
    (local.get $3)
    (i64.load offset=8 align=4
     (local.get $6)
    )
   )
   (i32.store offset=8
    (local.get $3)
    (i32.add
     (local.get $3)
     (i32.const 15)
    )
   )
   (i32.store offset=16
    (local.get $3)
    (local.get $3)
   )
   (br_if $label$1
    (call_indirect $0 (type $0)
     (local.get $1)
     (i32.add
      (local.get $3)
      (i32.const 16)
     )
     (i32.load offset=12
      (local.get $2)
     )
    )
   )
   (local.set $5
    (call_indirect $0 (type $1)
     (i32.load offset=16
      (local.get $3)
     )
     (i32.const 1053188)
     (i32.const 2)
     (i32.load offset=12
      (i32.load offset=20
       (local.get $3)
      )
     )
    )
   )
  )
  (i32.store8 offset=8
   (local.get $0)
   (local.get $5)
  )
  (i32.store
   (local.get $0)
   (i32.add
    (local.get $4)
    (i32.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
  (local.get $0)
 )
 (func $_ZN4core3fmt8builders10DebugTuple6finish17h1081fa1a6a5ffbd9E (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local.set $1
   (i32.load8_u offset=8
    (local.get $0)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (local.tee $2
      (i32.load
       (local.get $0)
      )
     )
    )
    (local.set $3
     (local.get $1)
    )
    (br $label$1)
   )
   (local.set $3
    (i32.const 1)
   )
   (block $label$3
    (block $label$4
     (br_if $label$4
      (i32.and
       (local.get $1)
       (i32.const 1)
      )
     )
     (br_if $label$3
      (i32.ne
       (local.get $2)
       (i32.const 1)
      )
     )
     (br_if $label$3
      (i32.eqz
       (i32.load8_u offset=9
        (local.get $0)
       )
      )
     )
     (br_if $label$3
      (i32.and
       (i32.load8_u offset=10
        (local.tee $1
         (i32.load offset=4
          (local.get $0)
         )
        )
       )
       (i32.const 128)
      )
     )
     (local.set $3
      (i32.const 1)
     )
     (br_if $label$3
      (i32.eqz
       (call_indirect $0 (type $1)
        (i32.load
         (local.get $1)
        )
        (i32.const 1053196)
        (i32.const 1)
        (i32.load offset=12
         (i32.load offset=4
          (local.get $1)
         )
        )
       )
      )
     )
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $3)
    )
    (br $label$1)
   )
   (i32.store8 offset=8
    (local.get $0)
    (local.tee $3
     (call_indirect $0 (type $1)
      (i32.load
       (local.tee $3
        (i32.load offset=4
         (local.get $0)
        )
       )
      )
      (i32.const 1052932)
      (i32.const 1)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $3)
       )
      )
     )
    )
   )
  )
  (i32.and
   (local.get $3)
   (i32.const 1)
  )
 )
 (func $_ZN4core3fmt5Write9write_fmt17h5fc1c2cab027a787E (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt5write17h68542eb4423e8992E
   (local.get $0)
   (i32.const 1053152)
   (local.get $1)
  )
 )
 (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h9b7f224add674e2aE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (block $label$1
   (br_if $label$1
    (i32.eq
     (local.get $2)
     (i32.const 1114112)
    )
   )
   (br_if $label$1
    (i32.eqz
     (call_indirect $0 (type $0)
      (local.get $0)
      (local.get $2)
      (i32.load offset=16
       (local.get $1)
      )
     )
    )
   )
   (return
    (i32.const 1)
   )
  )
  (block $label$2
   (br_if $label$2
    (local.get $3)
   )
   (return
    (i32.const 0)
   )
  )
  (call_indirect $0 (type $1)
   (local.get $0)
   (local.get $3)
   (local.get $4)
   (i32.load offset=12
    (local.get $1)
   )
  )
 )
 (func $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (call_indirect $0 (type $1)
   (i32.load
    (local.get $0)
   )
   (local.get $1)
   (local.get $2)
   (i32.load offset=12
    (i32.load offset=4
     (local.get $0)
    )
   )
  )
 )
 (func $_ZN4core3fmt9Formatter26debug_struct_field1_finish17h60ea07cd6c9ae974E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i32)
  (local $7 i32)
  (global.set $__stack_pointer
   (local.tee $7
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $2
   (call_indirect $0 (type $1)
    (i32.load
     (local.get $0)
    )
    (local.get $1)
    (local.get $2)
    (i32.load offset=12
     (i32.load offset=4
      (local.get $0)
     )
    )
   )
  )
  (i32.store8 offset=13
   (local.get $7)
   (i32.const 0)
  )
  (i32.store8 offset=12
   (local.get $7)
   (local.get $2)
  )
  (i32.store offset=8
   (local.get $7)
   (local.get $0)
  )
  (local.set $6
   (call $_ZN4core3fmt8builders11DebugStruct5field17he68b8ced02bd779dE
    (i32.add
     (local.get $7)
     (i32.const 8)
    )
    (local.get $3)
    (local.get $4)
    (local.get $5)
    (local.get $6)
   )
  )
  (local.set $0
   (i32.or
    (local.tee $2
     (i32.load8_u offset=13
      (local.get $7)
     )
    )
    (local.tee $1
     (i32.load8_u offset=12
      (local.get $7)
     )
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (local.get $2)
     (i32.const 1)
    )
   )
   (br_if $label$1
    (i32.and
     (local.get $1)
     (i32.const 1)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load8_u offset=10
       (local.tee $0
        (i32.load
         (local.get $6)
        )
       )
      )
      (i32.const 128)
     )
    )
    (local.set $0
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $0)
      )
      (i32.const 1053191)
      (i32.const 2)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
    )
    (br $label$1)
   )
   (local.set $0
    (call_indirect $0 (type $1)
     (i32.load
      (local.get $0)
     )
     (i32.const 1053190)
     (i32.const 1)
     (i32.load offset=12
      (i32.load offset=4
       (local.get $0)
      )
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $7)
    (i32.const 16)
   )
  )
  (i32.and
   (local.get $0)
   (i32.const 1)
  )
 )
 (func $_ZN4core3fmt9Formatter26debug_struct_field2_finish17h625630aaf7084656E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (result i32)
  (local $11 i32)
  (global.set $__stack_pointer
   (local.tee $11
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $2
   (call_indirect $0 (type $1)
    (i32.load
     (local.get $0)
    )
    (local.get $1)
    (local.get $2)
    (i32.load offset=12
     (i32.load offset=4
      (local.get $0)
     )
    )
   )
  )
  (i32.store8 offset=13
   (local.get $11)
   (i32.const 0)
  )
  (i32.store8 offset=12
   (local.get $11)
   (local.get $2)
  )
  (i32.store offset=8
   (local.get $11)
   (local.get $0)
  )
  (local.set $10
   (call $_ZN4core3fmt8builders11DebugStruct5field17he68b8ced02bd779dE
    (call $_ZN4core3fmt8builders11DebugStruct5field17he68b8ced02bd779dE
     (i32.add
      (local.get $11)
      (i32.const 8)
     )
     (local.get $3)
     (local.get $4)
     (local.get $5)
     (local.get $6)
    )
    (local.get $7)
    (local.get $8)
    (local.get $9)
    (local.get $10)
   )
  )
  (local.set $0
   (i32.or
    (local.tee $2
     (i32.load8_u offset=13
      (local.get $11)
     )
    )
    (local.tee $1
     (i32.load8_u offset=12
      (local.get $11)
     )
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (local.get $2)
     (i32.const 1)
    )
   )
   (br_if $label$1
    (i32.and
     (local.get $1)
     (i32.const 1)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load8_u offset=10
       (local.tee $0
        (i32.load
         (local.get $10)
        )
       )
      )
      (i32.const 128)
     )
    )
    (local.set $0
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $0)
      )
      (i32.const 1053191)
      (i32.const 2)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
    )
    (br $label$1)
   )
   (local.set $0
    (call_indirect $0 (type $1)
     (i32.load
      (local.get $0)
     )
     (i32.const 1053190)
     (i32.const 1)
     (i32.load offset=12
      (i32.load offset=4
       (local.get $0)
      )
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $11)
    (i32.const 16)
   )
  )
  (i32.and
   (local.get $0)
   (i32.const 1)
  )
 )
 (func $_ZN4core3fmt9Formatter11debug_tuple17h39b57e749a83bf1dE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (i32.store8 offset=8
   (local.get $0)
   (call_indirect $0 (type $1)
    (i32.load
     (local.get $1)
    )
    (local.get $2)
    (local.get $3)
    (i32.load offset=12
     (i32.load offset=4
      (local.get $1)
     )
    )
   )
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $1)
  )
  (i32.store8 offset=9
   (local.get $0)
   (i32.eqz
    (local.get $3)
   )
  )
  (i32.store
   (local.get $0)
   (i32.const 0)
  )
 )
 (func $_ZN4core3fmt9Formatter25debug_tuple_field1_finish17h58e564f85a17b1bbE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $6
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (call_indirect $0 (type $1)
     (local.tee $7
      (i32.load
       (local.get $0)
      )
     )
     (local.get $1)
     (local.get $2)
     (local.tee $9
      (i32.load offset=12
       (local.tee $8
        (i32.load offset=4
         (local.get $0)
        )
       )
      )
     )
    )
   )
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.and
       (i32.load8_u offset=10
        (local.get $0)
       )
       (i32.const 128)
      )
     )
     (local.set $6
      (i32.const 1)
     )
     (br_if $label$1
      (call_indirect $0 (type $1)
       (local.get $7)
       (i32.const 1053193)
       (i32.const 1)
       (local.get $9)
      )
     )
     (br_if $label$2
      (i32.eqz
       (call_indirect $0 (type $0)
        (local.get $3)
        (local.get $0)
        (i32.load offset=12
         (local.get $4)
        )
       )
      )
     )
     (br $label$1)
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (local.get $7)
      (i32.const 1053194)
      (i32.const 2)
      (local.get $9)
     )
    )
    (local.set $6
     (i32.const 1)
    )
    (i32.store8 offset=15
     (local.get $5)
     (i32.const 1)
    )
    (i32.store offset=4
     (local.get $5)
     (local.get $8)
    )
    (i32.store
     (local.get $5)
     (local.get $7)
    )
    (i32.store offset=20
     (local.get $5)
     (i32.const 1053152)
    )
    (i64.store offset=24 align=4
     (local.get $5)
     (i64.load offset=8 align=4
      (local.get $0)
     )
    )
    (i32.store offset=8
     (local.get $5)
     (i32.add
      (local.get $5)
      (i32.const 15)
     )
    )
    (i32.store offset=16
     (local.get $5)
     (local.get $5)
    )
    (br_if $label$1
     (call_indirect $0 (type $0)
      (local.get $3)
      (i32.add
       (local.get $5)
       (i32.const 16)
      )
      (i32.load offset=12
       (local.get $4)
      )
     )
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load offset=16
       (local.get $5)
      )
      (i32.const 1053188)
      (i32.const 2)
      (i32.load offset=12
       (i32.load offset=20
        (local.get $5)
       )
      )
     )
    )
   )
   (block $label$4
    (br_if $label$4
     (local.get $2)
    )
    (br_if $label$4
     (i32.and
      (i32.load8_u offset=10
       (local.get $0)
      )
      (i32.const 128)
     )
    )
    (local.set $6
     (i32.const 1)
    )
    (br_if $label$1
     (call_indirect $0 (type $1)
      (i32.load
       (local.get $0)
      )
      (i32.const 1053196)
      (i32.const 1)
      (i32.load offset=12
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
    )
   )
   (local.set $6
    (call_indirect $0 (type $1)
     (i32.load
      (local.get $0)
     )
     (i32.const 1052932)
     (i32.const 1)
     (i32.load offset=12
      (i32.load offset=4
       (local.get $0)
      )
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
  )
  (local.get $6)
 )
 (func $_ZN4core5slice5index26slice_start_index_len_fail8do_panic7runtime17he2583cd0648d1116E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (i32.store offset=4
   (local.get $3)
   (local.get $1)
  )
  (i32.store
   (local.get $3)
   (local.get $0)
  )
  (i32.store offset=12
   (local.get $3)
   (i32.const 2)
  )
  (i32.store offset=8
   (local.get $3)
   (i32.const 1053452)
  )
  (i64.store offset=20 align=4
   (local.get $3)
   (i64.const 2)
  )
  (i64.store offset=40
   (local.get $3)
   (i64.or
    (local.tee $4
     (i64.shl
      (i64.extend_i32_u
       (i32.const 18)
      )
      (i64.const 32)
     )
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $3)
      (i32.const 4)
     )
    )
   )
  )
  (i64.store offset=32
   (local.get $3)
   (i64.or
    (local.get $4)
    (i64.extend_i32_u
     (local.get $3)
    )
   )
  )
  (i32.store offset=16
   (local.get $3)
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $3)
    (i32.const 8)
   )
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h911bca498e89ce56E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (i32.store offset=4
   (local.get $3)
   (local.get $1)
  )
  (i32.store
   (local.get $3)
   (local.get $0)
  )
  (i32.store offset=12
   (local.get $3)
   (i32.const 2)
  )
  (i32.store offset=8
   (local.get $3)
   (i32.const 1053484)
  )
  (i64.store offset=20 align=4
   (local.get $3)
   (i64.const 2)
  )
  (i64.store offset=40
   (local.get $3)
   (i64.or
    (local.tee $4
     (i64.shl
      (i64.extend_i32_u
       (i32.const 18)
      )
      (i64.const 32)
     )
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $3)
      (i32.const 4)
     )
    )
   )
  )
  (i64.store offset=32
   (local.get $3)
   (i64.or
    (local.get $4)
    (i64.extend_i32_u
     (local.get $3)
    )
   )
  )
  (i32.store offset=16
   (local.get $3)
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $3)
    (i32.const 8)
   )
   (local.get $2)
  )
  (unreachable)
 )
 (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u64$GT$3fmt17hf21e6429c4a522c9E (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$4_fmt17h879aec967ee53a53E
   (i64.load
    (local.get $0)
   )
   (i32.const 1)
   (local.get $1)
  )
 )
 (func $_ZN4core3fmt3num3imp21_$LT$impl$u20$u64$GT$4_fmt17h879aec967ee53a53E (param $0 i64) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (local.set $4
   (i32.const 20)
  )
  (local.set $5
   (local.get $0)
  )
  (block $label$1
   (br_if $label$1
    (i64.lt_u
     (local.get $0)
     (i64.const 1000)
    )
   )
   (local.set $4
    (i32.const 20)
   )
   (local.set $6
    (local.get $0)
   )
   (loop $label$2
    (i32.store8
     (i32.add
      (local.tee $7
       (i32.add
        (i32.add
         (local.get $3)
         (i32.const 12)
        )
        (local.get $4)
       )
      )
      (i32.const -3)
     )
     (i32.load8_u
      (i32.add
       (local.tee $10
        (i32.shl
         (local.tee $9
          (i32.div_u
           (i32.and
            (local.tee $8
             (i32.wrap_i64
              (i64.sub
               (local.get $6)
               (i64.mul
                (local.tee $5
                 (i64.div_u
                  (local.get $6)
                  (i64.const 10000)
                 )
                )
                (i64.const 10000)
               )
              )
             )
            )
            (i32.const 65535)
           )
           (i32.const 100)
          )
         )
         (i32.const 1)
        )
       )
       (i32.const 1053200)
      )
     )
    )
    (i32.store8
     (i32.add
      (local.get $7)
      (i32.const -4)
     )
     (i32.load8_u
      (i32.add
       (local.get $10)
       (i32.const 1053199)
      )
     )
    )
    (i32.store8
     (i32.add
      (local.get $7)
      (i32.const -1)
     )
     (i32.load8_u
      (i32.add
       (local.tee $8
        (i32.shl
         (i32.and
          (i32.sub
           (local.get $8)
           (i32.mul
            (local.get $9)
            (i32.const 100)
           )
          )
          (i32.const 65535)
         )
         (i32.const 1)
        )
       )
       (i32.const 1053200)
      )
     )
    )
    (i32.store8
     (i32.add
      (local.get $7)
      (i32.const -2)
     )
     (i32.load8_u
      (i32.add
       (local.get $8)
       (i32.const 1053199)
      )
     )
    )
    (local.set $4
     (i32.add
      (local.get $4)
      (i32.const -4)
     )
    )
    (local.set $7
     (i64.gt_u
      (local.get $6)
      (i64.const 9999999)
     )
    )
    (local.set $6
     (local.get $5)
    )
    (br_if $label$2
     (local.get $7)
    )
   )
  )
  (block $label$3
   (br_if $label$3
    (i64.le_u
     (local.get $5)
     (i64.const 9)
    )
   )
   (i32.store8
    (i32.add
     (i32.add
      (i32.add
       (local.get $3)
       (i32.const 12)
      )
      (local.get $4)
     )
     (i32.const -1)
    )
    (i32.load8_u
     (i32.add
      (local.tee $8
       (i32.shl
        (i32.and
         (i32.sub
          (local.tee $7
           (i32.wrap_i64
            (local.get $5)
           )
          )
          (i32.mul
           (local.tee $7
            (i32.div_u
             (i32.and
              (local.get $7)
              (i32.const 65535)
             )
             (i32.const 100)
            )
           )
           (i32.const 100)
          )
         )
         (i32.const 65535)
        )
        (i32.const 1)
       )
      )
      (i32.const 1053200)
     )
    )
   )
   (i32.store8
    (i32.add
     (i32.add
      (local.get $3)
      (i32.const 12)
     )
     (local.tee $4
      (i32.add
       (local.get $4)
       (i32.const -2)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (local.get $8)
      (i32.const 1053199)
     )
    )
   )
   (local.set $5
    (i64.extend_i32_u
     (local.get $7)
    )
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i64.eqz
      (local.get $0)
     )
    )
    (br_if $label$4
     (i64.eqz
      (local.get $5)
     )
    )
   )
   (i32.store8
    (i32.add
     (i32.add
      (local.get $3)
      (i32.const 12)
     )
     (local.tee $4
      (i32.add
       (local.get $4)
       (i32.const -1)
      )
     )
    )
    (i32.load8_u
     (i32.add
      (i32.and
       (i32.shl
        (i32.wrap_i64
         (local.get $5)
        )
        (i32.const 1)
       )
       (i32.const 30)
      )
      (i32.const 1053200)
     )
    )
   )
  )
  (local.set $7
   (call $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE
    (local.get $2)
    (local.get $1)
    (i32.const 1)
    (i32.const 0)
    (i32.add
     (i32.add
      (local.get $3)
      (i32.const 12)
     )
     (local.get $4)
    )
    (i32.sub
     (i32.const 20)
     (local.get $4)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
  (local.get $7)
 )
 (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h7b8f58fed5be4707E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 128)
    )
   )
  )
  (local.set $0
   (i32.load
    (local.get $0)
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (loop $label$1
   (i32.store8
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $3)
     )
     (i32.const 127)
    )
    (select
     (i32.or
      (local.tee $4
       (i32.and
        (local.get $0)
        (i32.const 15)
       )
      )
      (i32.const 48)
     )
     (i32.add
      (local.get $4)
      (i32.const 55)
     )
     (i32.lt_u
      (local.get $4)
      (i32.const 10)
     )
    )
   )
   (local.set $3
    (i32.add
     (local.get $3)
     (i32.const -1)
    )
   )
   (local.set $4
    (i32.gt_u
     (local.get $0)
     (i32.const 15)
    )
   )
   (local.set $0
    (i32.shr_u
     (local.get $0)
     (i32.const 4)
    )
   )
   (br_if $label$1
    (local.get $4)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE
    (local.get $1)
    (i32.const 1)
    (i32.const 1053197)
    (i32.const 2)
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $3)
     )
     (i32.const 128)
    )
    (i32.sub
     (i32.const 0)
     (local.get $3)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 128)
   )
  )
  (local.get $0)
 )
 (func $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=24
   (local.get $1)
   (i32.const 0)
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 1052792)
  )
  (i64.store offset=16 align=4
   (local.get $1)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=24
   (local.get $1)
   (i32.const 0)
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 1052836)
  )
  (i64.store offset=16 align=4
   (local.get $1)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=24
   (local.get $1)
   (i32.const 0)
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 1052880)
  )
  (i64.store offset=16 align=4
   (local.get $1)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=24
   (local.get $1)
   (i32.const 0)
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 1052924)
  )
  (i64.store offset=16 align=4
   (local.get $1)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (local.get $0)
  )
  (unreachable)
 )
 (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i64$GT$3fmt17hd0e92b612134ea30E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 128)
    )
   )
  )
  (local.set $3
   (i64.load
    (local.get $0)
   )
  )
  (local.set $0
   (i32.const 0)
  )
  (loop $label$1
   (i32.store8
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $0)
     )
     (i32.const 127)
    )
    (select
     (i32.or
      (local.tee $4
       (i32.and
        (i32.wrap_i64
         (local.get $3)
        )
        (i32.const 15)
       )
      )
      (i32.const 48)
     )
     (i32.add
      (local.get $4)
      (i32.const 87)
     )
     (i32.lt_u
      (local.get $4)
      (i32.const 10)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (local.set $4
    (i64.gt_u
     (local.get $3)
     (i64.const 15)
    )
   )
   (local.set $3
    (i64.shr_u
     (local.get $3)
     (i64.const 4)
    )
   )
   (br_if $label$1
    (local.get $4)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE
    (local.get $1)
    (i32.const 1)
    (i32.const 1053197)
    (i32.const 2)
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $0)
     )
     (i32.const 128)
    )
    (i32.sub
     (i32.const 0)
     (local.get $0)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 128)
   )
  )
  (local.get $0)
 )
 (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i64$GT$3fmt17hbeeaf37d438f79adE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 128)
    )
   )
  )
  (local.set $3
   (i64.load
    (local.get $0)
   )
  )
  (local.set $0
   (i32.const 0)
  )
  (loop $label$1
   (i32.store8
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $0)
     )
     (i32.const 127)
    )
    (select
     (i32.or
      (local.tee $4
       (i32.and
        (i32.wrap_i64
         (local.get $3)
        )
        (i32.const 15)
       )
      )
      (i32.const 48)
     )
     (i32.add
      (local.get $4)
      (i32.const 55)
     )
     (i32.lt_u
      (local.get $4)
      (i32.const 10)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (local.set $4
    (i64.gt_u
     (local.get $3)
     (i64.const 15)
    )
   )
   (local.set $3
    (i64.shr_u
     (local.get $3)
     (i64.const 4)
    )
   )
   (br_if $label$1
    (local.get $4)
   )
  )
  (local.set $0
   (call $_ZN4core3fmt9Formatter12pad_integral17hafdfc3db6446f97dE
    (local.get $1)
    (i32.const 1)
    (i32.const 1053197)
    (i32.const 2)
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $0)
     )
     (i32.const 128)
    )
    (i32.sub
     (i32.const 0)
     (local.get $0)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 128)
   )
  )
  (local.get $0)
 )
 (func $__ashlti3 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.get $3)
      (i32.const 64)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $3)
     )
    )
    (local.set $2
     (i64.or
      (i64.shl
       (local.get $2)
       (local.tee $4
        (i64.extend_i32_u
         (i32.and
          (local.get $3)
          (i32.const 63)
         )
        )
       )
      )
      (i64.shr_u
       (local.get $1)
       (i64.extend_i32_u
        (i32.and
         (i32.sub
          (i32.const 0)
          (local.get $3)
         )
         (i32.const 63)
        )
       )
      )
     )
    )
    (local.set $1
     (i64.shl
      (local.get $1)
      (local.get $4)
     )
    )
    (br $label$1)
   )
   (local.set $2
    (i64.shl
     (local.get $1)
     (i64.extend_i32_u
      (i32.and
       (local.get $3)
       (i32.const 63)
      )
     )
    )
   )
   (local.set $1
    (i64.const 0)
   )
  )
  (i64.store
   (local.get $0)
   (local.get $1)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $2)
  )
 )
 (func $__lshrti3 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32)
  (local $4 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.get $3)
      (i32.const 64)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $3)
     )
    )
    (local.set $1
     (i64.or
      (i64.shl
       (local.get $2)
       (i64.extend_i32_u
        (i32.and
         (i32.sub
          (i32.const 0)
          (local.get $3)
         )
         (i32.const 63)
        )
       )
      )
      (i64.shr_u
       (local.get $1)
       (local.tee $4
        (i64.extend_i32_u
         (i32.and
          (local.get $3)
          (i32.const 63)
         )
        )
       )
      )
     )
    )
    (local.set $2
     (i64.shr_u
      (local.get $2)
      (local.get $4)
     )
    )
    (br $label$1)
   )
   (local.set $1
    (i64.shr_u
     (local.get $2)
     (i64.extend_i32_u
      (i32.and
       (local.get $3)
       (i32.const 63)
      )
     )
    )
   )
   (local.set $2
    (i64.const 0)
   )
  )
  (i64.store
   (local.get $0)
   (local.get $1)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $2)
  )
 )
 ;; custom section "producers", size 67
 ;; features section: mutable-globals, nontrapping-float-to-int, bulk-memory, sign-ext, reference-types, multivalue
)

