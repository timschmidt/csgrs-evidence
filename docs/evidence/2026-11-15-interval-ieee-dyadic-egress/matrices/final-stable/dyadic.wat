(module $interval_dyadic_wasm_conformance.wasm
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (param i32 i32 i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32)))
 (type $4 (func (param i32 i32 i32)))
 (type $5 (func (param i32 i32 i32 i32)))
 (type $6 (func (param i32 i32 i32 i32 i32)))
 (type $7 (func (param i32 i32 i32 i32) (result i32)))
 (type $8 (func))
 (type $9 (func (param i32) (result i32)))
 (type $10 (func (param i32 i32 i32 i32 i32) (result i32)))
 (type $11 (func (param i32 i64 i64 i32)))
 (type $12 (func (result i32)))
 (type $13 (func (param i32 i64 i64 i64)))
 (type $14 (func (param i32 i64 i64 i32 i32 i32)))
 (type $15 (func (param i32 i64 i64 i64 i32)))
 (type $16 (func (param i32 i32 i32 i32 i32 i32)))
 (type $17 (func (param i32 i32 i32 i32 i32 i32 i32 i32)))
 (type $18 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
 (type $19 (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $20 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (global $__stack_pointer (mut i32) (i32.const 1048576))
 (memory $0 17)
 (data $.rodata (i32.const 1048576) "\00\00\00\00\04\00\00\00\04\00\00\00\01\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\03\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\16slice index starts at \c0\r but ends at \c0\00\12range start index \c0\" out of range for slice of length \c0\00\10range end index \c0\" out of range for slice of length \c0\00\10assertion `left \c0\17 right` failed\n  left: \c0\t\n right: \c0\00\10assertion `left \c0\10 right` failed: \c0\t\n  left: \c0\t\n right: \c0\00\c0\02: \c0\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/biguint/shift.rs\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/bigint/shift.rs\00src/../../../tests/support/dyadic_egress_cases.rs\00/rustc/b940084d7eb6a299eb4bfeb8e34901bc051e7ac4/library/std/src/sys/sync/rwlock/no_threads.rs\00/home/tim/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/num-bigint-0.4.8/src/biguint/subtraction.rs\00/mnt/development/csgrs-ieee-egress/crates/hyperinterval/src/ieee.rs\00/rustc/b940084d7eb6a299eb4bfeb8e34901bc051e7ac4/library/alloc/src/raw_vec/mod.rs\00/rust/deps/dlmalloc-0.2.14/src/dlmalloc.rs\00/mnt/development/csgrs-ieee-egress/crates/hyperinterval/src/ieee/dyadic.rs\00\001\02\10\001\00\00\00M\00\00\00\05\00\00\00\00\00\00\00\01\00\00\00\01\00\00\00\04\00\00\00called `Result::unwrap()` on an `Err` value\00\02\00\00\00\05\00\00\00\00\00\00\001\02\10\001\00\00\00L\00\00\00\05\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\05\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\06\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\07\00\00\00Boundslowerupper\00\00\00\00\08\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\t\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\01\00\00\00NonFiniteEndpointReversedEndpointsNonSingletonEndpointUnboundedImageInvalidScaleOverflowContainsZeroEmptyDomainPoleUnsupportedBranchPrecisionExhaustedWorkExhaustedSizeExhaustedUnqualifiedEnvironment\00\00\00\00\00\00\04\00\00\00\04\00\00\00\n\00\00\00Binary32\00\00\00\00\04\00\00\00\04\00\00\00\0b\00\00\00F64EnclosureboundsNone\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0c\00\00\00Some\00\00\00\00\04\00\00\00\04\00\00\00\r\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\0e\00\00\00F32Enclosure\00\00\00\00\04\00\00\00\04\00\00\00\0f\00\00\00Ok\00\00\00\00\00\00\04\00\00\00\04\00\00\00\10\00\00\00Err\00\00\00\00\00\04\00\00\00\04\00\00\00\11\00\00\00Binary64\11\11\14\0e\0c\08\0c\0b\04\11\12\r\r\16\00\00\10\05\10\00!\05\10\002\05\10\00F\05\10\00T\05\10\00`\05\10\00h\05\10\00t\05\10\00\7f\05\10\00\83\05\10\00\94\05\10\00\a6\05\10\00\b3\05\10\00\c0\05\10\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\01\00\00\00negative values are non-zero\cd\01\10\00c\00\00\00f\00\00\00(\00\00\00,\03\10\00C\00\00\00\1e\00\00\00\1a\00\00\00,\03\10\00C\00\00\00\98\01\00\00\n\00\00\00\ec\03\10\00J\00\00\00!\00\00\00\'\00\00\00unshifted IEEE significand has at most 53 bits\00\00\ec\03\10\00J\00\00\00-\00\00\00\12\00\00\00\ec\03\10\00J\00\00\00+\00\00\00\19\00\00\00retained IEEE significand has at most 53 bits\00\00\00\ec\03\10\00J\00\00\00\'\00\00\00\12\00\00\00nonzero magnitude\00\00\00\ec\03\10\00J\00\00\00(\00\00\008\00\00\00\ec\03\10\00J\00\00\002\00\00\00!\00\00\00,\03\10\00C\00\00\00\9b\01\00\00\t\00\00\00,\03\10\00C\00\00\00\80\00\00\00\13\00\00\00,\03\10\00C\00\00\00\85\00\00\00\12\00\00\00,\03\10\00C\00\00\00\8f\00\00\00\r\00\00\00,\03\10\00C\00\00\00\87\00\00\00%\00\00\00,\03\10\00C\00\00\00\87\00\00\00\17\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00\ff\ff\ff\ff\00\00\00\00\00\00\00\00Tried to shrink to a larger capacityp\03\10\00P\00\00\00+\03\00\00\t\00\00\00Cannot subtract b from a because b is larger than a.\c1\02\10\00j\00\00\00G\00\00\00\05\00\00\00assertion failed: a_hi.is_empty()\00\00\00\c1\02\10\00j\00\00\00d\00\00\00\05\00\00\00\c1\02\10\00j\00\00\00g\00\00\00\05\00\00\00h\01\10\00d\00\00\00\'\00\00\00\1b\00\00\00h\01\10\00d\00\00\00)\00\00\00\1d\00\00\00h\01\10\00d\00\00\00*\00\00\00\15\00\00\00h\01\10\00d\00\00\00(\00\00\00\19\00\00\00h\01\10\00d\00\00\00X\00\00\00\1c\00\00\00h\01\10\00d\00\00\00[\00\00\00\15\00\00\00\13\00\00\00\0c\00\00\00\04\00\00\00\14\00\00\00\15\00\00\00\16\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00\17\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\10\00\00\00\04\00\00\00\1c\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00\\\f6\e9_\dc\02\f6\b9\f1\c1pl\f2a\c1$\f2\ef8TM\7f\80\a4\1e\a7m\e5>B<\feassertion failed: psize >= size + min_overhead\00\00\c1\03\10\00*\00\00\00\e9\04\00\00\t\00\00\00assertion failed: psize <= size + max_overhead\00\00\c1\03\10\00*\00\00\00\ef\04\00\00\r\00\00\00\c1\03\10\00*\00\00\00M\05\00\00\1e\00\00\00rwlock overflowed read locksc\02\10\00]\00\00\00\18\00\00\00,\00\00\00\00\00\00\00\08\00\00\00\04\00\00\00 \00\00\00\13\00\00\00\0c\00\00\00\04\00\00\00!\00\00\00rwlock has not been locked for reading\00\00c\02\10\00]\00\00\00A\00\00\00\t\00\00\00capacity overflow\00\00\00p\03\10\00P\00\00\00\1c\00\00\00\05\00\00\000123456789abcdef} { , :  {\n,\n)((\n, }\00\00\00\00\0c\00\00\00\04\00\00\00&\00\00\00\'\00\00\00(\00\00\00called `Option::unwrap()` on a `None` value==!=matches00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899attempt to divide by zeroattempt to add with overflowattempt to shift left with overflowattempt to shift right with overflowattempt to subtract with overflow    0x0123456789ABCDEF\00\00\00\bf\0b\10\00\c1\0b\10\00\c3\0b\10\00\02\02\07")
 (data $.data (i32.const 1051992) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\ff\0f\00\00")
 (table $0 41 41 funcref)
 (elem $0 (i32.const 1) $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F32EnclosureNtNtBW_5state13IntervalErrorENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F64EnclosureNtNtBW_5state13IntervalErrorENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRTyyENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs4_NtCskObGt8PTDSq_13hyperinterval5stateNtB5_13IntervalErrorNtNtCs8hZryZq3oeI_4core3fmt5Debug3fmt $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRyNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs9_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_8Binary32NtNtCs8hZryZq3oeI_4core3fmt5Debug3fmt $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float8Binary32NtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXsz_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_8Binary64NtNtCs8hZryZq3oeI_4core3fmt5Debug3fmt $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float8Binary64NtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRmNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6option6OptionINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBX_5float8Binary64EENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBB_5float8Binary32ENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBB_5float8Binary64ENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6option6OptionINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBX_5float8Binary32EENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float12F32EnclosureNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5state13IntervalErrorNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float12F64EnclosureNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance $_RNvNtCs4BkbFkxXoBt_3std5alloc24default_alloc_error_hook $_RINvNtCs8hZryZq3oeI_4core3ptr9drop_glueNtNtCshrt81WbuBY1_5alloc6string6StringECs4BkbFkxXoBt_3std $_RNvXsZ_NtCshrt81WbuBY1_5alloc6stringNtB5_6StringNtNtCs8hZryZq3oeI_4core3fmt5Write9write_str $_RNvXsZ_NtCshrt81WbuBY1_5alloc6stringNtB5_6StringNtNtCs8hZryZq3oeI_4core3fmt5Write10write_char $_RNvYNtNtCshrt81WbuBY1_5alloc6string6StringNtNtCs8hZryZq3oeI_4core3fmt5Write9write_fmtCs4BkbFkxXoBt_3std $_RNvXs2_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core3fmt7Display3fmt $_RNvXs1_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload8take_box $_RNvXs1_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload3get $_RNvXs1_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload6as_str $_RINvNtCs8hZryZq3oeI_4core3ptr9drop_glueNtNvNtCs4BkbFkxXoBt_3std9panicking13panic_handler19FormatStringPayloadEBH_ $_RNvXs0_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCs8hZryZq3oeI_4core3fmt7Display3fmt $_RNvXs_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload8take_box $_RNvXs_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload3get $_RNvYINtNvNtCs4BkbFkxXoBt_3std9panicking11begin_panic7PayloadReENtNtCs8hZryZq3oeI_4core5panic12PanicPayload6as_strB9_ $_RNvXNtCs8hZryZq3oeI_4core3anyReNtB2_3Any7type_idCs4BkbFkxXoBt_3std $_RNvXNtCs8hZryZq3oeI_4core3anyNtNtCshrt81WbuBY1_5alloc6string6StringNtB2_3Any7type_idCs4BkbFkxXoBt_3std $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ $_RNvXs8_NtCs8hZryZq3oeI_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt $_RNvXs1i_NtCs8hZryZq3oeI_4core3fmtReNtB6_7Display3fmtB8_ $_RNvXs8_NtNtNtCs8hZryZq3oeI_4core3fmt3num3impmNtB9_7Display3fmt $_RNvXs0_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str $_RNvXs0_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write10write_char $_RNvYNtNtNtCs8hZryZq3oeI_4core3fmt8builders10PadAdapterNtB6_5Write9write_fmtB8_)
 (export "memory" (memory $0))
 (export "verify_dyadic_egress" (func $verify_dyadic_egress))
 (func $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedINtNtB4_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F32EnclosureNtNtB1c_5state13IntervalErrorEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1049732)
  )
  (i32.store offset=8
   (local.get $1)
   (local.get $0)
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking19assert_failed_inner
   (i32.const 0)
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (i32.const 1048576)
   (i32.add
    (local.get $1)
    (i32.const 12)
   )
   (i32.const 1048576)
   (i32.const 0)
   (local.get $1)
   (i32.const 1049744)
  )
  (unreachable)
 )
 (func $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedINtNtB4_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F64EnclosureNtNtB1c_5state13IntervalErrorEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32)
  (local $1 i32)
  (global.set $__stack_pointer
   (local.tee $1
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=12
   (local.get $1)
   (i32.const 1048640)
  )
  (i32.store offset=8
   (local.get $1)
   (local.get $0)
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking19assert_failed_inner
   (i32.const 0)
   (i32.add
    (local.get $1)
    (i32.const 8)
   )
   (i32.const 1048592)
   (i32.add
    (local.get $1)
    (i32.const 12)
   )
   (i32.const 1048592)
   (i32.const 0)
   (local.get $1)
   (i32.const 1049656)
  )
  (unreachable)
 )
 (func $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedTyyEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
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
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking19assert_failed_inner
   (i32.const 0)
   (i32.add
    (local.get $3)
    (i32.const 8)
   )
   (i32.const 1048608)
   (i32.add
    (local.get $3)
    (i32.const 12)
   )
   (i32.const 1048608)
   (i32.const 0)
   (local.get $3)
   (local.get $2)
  )
  (unreachable)
 )
 (func $_RNvMNtCsbodFP5rPXOh_10num_bigint9big_digitNtB2_9BigDigits9normalize (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.eq
         (local.tee $1
          (i32.load
           (local.get $0)
          )
         )
         (i32.const -1)
        )
       )
       (br_if $label$4
        (local.tee $2
         (i32.load offset=8
          (local.get $0)
         )
        )
       )
       (local.set $2
        (i32.const 0)
       )
       (br $label$3)
      )
      (br_if $label$2
       (i32.ne
        (i32.load offset=4
         (local.get $0)
        )
        (i32.const 1)
       )
      )
      (br_if $label$2
       (i32.load offset=8
        (local.get $0)
       )
      )
      (i32.store offset=4
       (local.get $0)
       (i32.const 0)
      )
      (return)
     )
     (br_if $label$3
      (i32.load
       (i32.add
        (i32.add
         (local.tee $3
          (i32.load offset=4
           (local.get $0)
          )
         )
         (local.tee $4
          (i32.shl
           (local.get $2)
           (i32.const 2)
          )
         )
        )
        (i32.const -4)
       )
      )
     )
     (block $label$6
      (block $label$7
       (br_if $label$7
        (local.get $4)
       )
       (local.set $5
        (i32.const 0)
       )
       (br $label$6)
      )
      (local.set $5
       (i32.and
        (local.get $2)
        (i32.const 1073741823)
       )
      )
      (local.set $3
       (i32.add
        (local.get $3)
        (i32.const -4)
       )
      )
      (block $label$8
       (loop $label$9
        (br_if $label$8
         (i32.load
          (i32.add
           (local.get $3)
           (local.get $4)
          )
         )
        )
        (local.set $5
         (i32.add
          (local.get $5)
          (i32.const -1)
         )
        )
        (br_if $label$9
         (local.tee $4
          (i32.add
           (local.get $4)
           (i32.const -4)
          )
         )
        )
       )
       (local.set $5
        (i32.const 0)
       )
       (br $label$6)
      )
      (br_if $label$3
       (i32.gt_u
        (local.get $5)
        (local.get $2)
       )
      )
     )
     (i32.store offset=8
      (local.get $0)
      (local.get $5)
     )
     (local.set $2
      (local.get $5)
     )
    )
    (br_if $label$2
     (i32.ge_u
      (local.get $2)
      (i32.shr_u
       (local.get $1)
       (i32.const 1)
      )
     )
    )
    (block $label$10
     (block $label$11
      (block $label$12
       (br_table $label$12 $label$11 $label$10
        (local.get $2)
       )
      )
      (block $label$13
       (br_if $label$13
        (i32.lt_s
         (local.get $1)
         (i32.const 1)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (i32.load offset=4
         (local.get $0)
        )
        (i32.shl
         (local.get $1)
         (i32.const 2)
        )
        (i32.const 4)
       )
      )
      (i32.store offset=8
       (local.get $0)
       (i32.load offset=1048632
        (i32.const 0)
       )
      )
      (i64.store align=4
       (local.get $0)
       (i64.load offset=1048624 align=4
        (i32.const 0)
       )
      )
      (return)
     )
     (local.set $4
      (i32.load
       (local.tee $5
        (i32.load offset=4
         (local.get $0)
        )
       )
      )
     )
     (block $label$14
      (br_if $label$14
       (i32.lt_s
        (local.get $1)
        (i32.const 1)
       )
      )
      (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
       (local.get $5)
       (i32.shl
        (local.get $1)
        (i32.const 2)
       )
       (i32.const 4)
      )
     )
     (i32.store offset=8
      (local.get $0)
      (local.get $4)
     )
     (i64.store align=4
      (local.get $0)
      (i64.const 8589934591)
     )
     (return)
    )
    (br_if $label$2
     (i32.le_u
      (local.get $1)
      (local.tee $4
       (i32.add
        (local.get $2)
        (i32.const 1)
       )
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.tee $5
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_realloc
        (i32.load offset=4
         (local.get $0)
        )
        (i32.shl
         (local.get $1)
         (i32.const 2)
        )
        (i32.const 4)
        (local.tee $2
         (i32.shl
          (local.get $4)
          (i32.const 2)
         )
        )
       )
      )
     )
    )
    (i32.store
     (local.get $0)
     (local.get $4)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $5)
    )
   )
   (return)
  )
  (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
   (i32.const 4)
   (local.get $2)
  )
  (unreachable)
 )
 (func $_RNvXs1_NtNtCsbodFP5rPXOh_10num_bigint7biguint8additionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9AddAssignmE10add_assign (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eq
       (local.tee $1
        (i32.load
         (local.get $0)
        )
       )
       (i32.const -1)
      )
     )
     (br_if $label$2
      (local.tee $2
       (i32.load offset=8
        (local.get $0)
       )
      )
     )
     (block $label$4
      (br_if $label$4
       (local.get $1)
      )
      (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
       (local.get $0)
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
    (block $label$5
     (br_if $label$5
      (i32.eqz
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
     (local.set $1
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
     )
     (local.set $3
      (i32.const 4)
     )
     (br $label$1)
    )
    (i64.store offset=4 align=4
     (local.get $0)
     (i64.const 4294967297)
    )
    (return)
   )
   (local.set $3
    (i32.shl
     (local.get $2)
     (i32.const 2)
    )
   )
   (local.set $1
    (i32.load offset=4
     (local.get $0)
    )
   )
  )
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
  (block $label$6
   (block $label$7
    (block $label$8
     (br_if $label$8
      (local.get $2)
     )
     (block $label$9
      (br_if $label$9
       (i32.eq
        (local.get $3)
        (i32.const 4)
       )
      )
      (local.set $3
       (i32.add
        (local.get $3)
        (i32.const -4)
       )
      )
      (local.set $1
       (i32.add
        (local.get $1)
        (i32.const 4)
       )
      )
      (loop $label$10
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
       (br_if $label$8
        (local.get $2)
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (br_if $label$10
        (local.tee $3
         (i32.add
          (local.get $3)
          (i32.const -4)
         )
        )
       )
      )
     )
     (block $label$11
      (br_if $label$11
       (i32.eq
        (local.tee $2
         (i32.load
          (local.get $0)
         )
        )
        (i32.const -1)
       )
      )
      (block $label$12
       (br_if $label$12
        (i32.ne
         (local.tee $1
          (i32.load offset=8
           (local.get $0)
          )
         )
         (local.get $2)
        )
       )
       (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
        (local.get $0)
       )
      )
      (i32.store
       (i32.add
        (i32.load offset=4
         (local.get $0)
        )
        (i32.shl
         (local.get $1)
         (i32.const 2)
        )
       )
       (i32.const 1)
      )
      (i32.store offset=8
       (local.get $0)
       (i32.add
        (local.get $1)
        (i32.const 1)
       )
      )
      (return)
     )
     (br_if $label$7
      (i32.ne
       (i32.load offset=4
        (local.get $0)
       )
       (i32.const 1)
      )
     )
     (local.set $2
      (i32.load offset=8
       (local.get $0)
      )
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
     (br_if $label$6
      (i32.eqz
       (local.tee $1
        (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
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
    )
    (return)
   )
   (i64.store offset=4 align=4
    (local.get $0)
    (i64.const 4294967297)
   )
   (return)
  )
  (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
   (i32.const 4)
   (i32.const 8)
  )
  (unreachable)
 )
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6option6OptionINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBX_5float8Binary32EENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
     (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
      (local.get $1)
      (i32.const 1050152)
      (i32.const 4)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1050136)
     )
    )
    (br $label$1)
   )
   (local.set $0
    (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str
     (local.get $1)
     (i32.const 1050130)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6option6OptionINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBX_5float8Binary64EENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
      (i64.const 1)
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
     (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
      (local.get $1)
      (i32.const 1050152)
      (i32.const 4)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1050156)
     )
    )
    (br $label$1)
   )
   (local.set $0
    (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str
     (local.get $1)
     (i32.const 1050130)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F32EnclosureNtNtBW_5state13IntervalErrorENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
     (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
      (local.get $1)
      (i32.const 1050236)
      (i32.const 3)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1050220)
     )
    )
    (br $label$1)
   )
   (i32.store offset=8
    (local.get $2)
    (local.get $0)
   )
   (local.set $0
    (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
     (local.get $1)
     (i32.const 1050216)
     (i32.const 2)
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 1050200)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtB8_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F64EnclosureNtNtBW_5state13IntervalErrorENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
     (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
      (local.get $1)
      (i32.const 1050236)
      (i32.const 3)
      (i32.add
       (local.get $2)
       (i32.const 12)
      )
      (i32.const 1050220)
     )
    )
    (br $label$1)
   )
   (i32.store offset=8
    (local.get $2)
    (local.get $0)
   )
   (local.set $0
    (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
     (local.get $1)
     (i32.const 1050216)
     (i32.const 2)
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i32.const 1050240)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBB_5float8Binary32ENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter26debug_struct_field2_finish
    (local.get $1)
    (i32.const 1049808)
    (i32.const 6)
    (i32.const 1049814)
    (i32.const 5)
    (local.get $0)
    (i32.const 1049776)
    (i32.const 1049819)
    (i32.const 5)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049792)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRINtNtCskObGt8PTDSq_13hyperinterval6bounds6BoundsNtNtBB_5float8Binary64ENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter26debug_struct_field2_finish
    (local.get $1)
    (i32.const 1049808)
    (i32.const 6)
    (i32.const 1049814)
    (i32.const 5)
    (local.get $0)
    (i32.const 1049824)
    (i32.const 1049819)
    (i32.const 5)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049840)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float12F32EnclosureNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter26debug_struct_field1_finish
    (local.get $1)
    (i32.const 1050188)
    (i32.const 12)
    (i32.const 1050124)
    (i32.const 6)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1050172)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float12F64EnclosureNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter26debug_struct_field1_finish
    (local.get $1)
    (i32.const 1050112)
    (i32.const 12)
    (i32.const 1050124)
    (i32.const 6)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1050096)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float8Binary32NtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
    (local.get $1)
    (i32.const 1050088)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1050072)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5float8Binary64NtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
    (local.get $1)
    (i32.const 1050256)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049760)
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRNtNtCskObGt8PTDSq_13hyperinterval5state13IntervalErrorNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
  (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str
   (local.get $1)
   (i32.load offset=1050280
    (i32.shl
     (local.tee $0
      (i32.load8_u
       (i32.load
        (local.get $0)
       )
      )
     )
     (i32.const 2)
    )
   )
   (i32.load8_u offset=1050264
    (local.get $0)
   )
  )
 )
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRTyyENtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
  (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter11debug_tuple
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
   (call $_RNvMs3_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10DebugTuple5field
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.add
     (local.get $2)
     (i32.const 24)
    )
    (i32.const 1049760)
   )
  )
  (drop
   (call $_RNvMs3_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10DebugTuple5field
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.add
     (local.get $2)
     (i32.const 28)
    )
    (i32.const 1049760)
   )
  )
  (local.set $0
   (call $_RNvMs3_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10DebugTuple6finish
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
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRmNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
     (call $_RNvXs8_NtNtNtCs8hZryZq3oeI_4core3fmt3num3impmNtB9_7Display3fmt
      (local.get $0)
      (local.get $1)
     )
    )
   )
   (return
    (call $_RNvXs8_NtNtCs8hZryZq3oeI_4core3fmt3numjNtB7_8UpperHex3fmt
     (local.get $0)
     (local.get $1)
    )
   )
  )
  (call $_RNvXs6_NtNtCs8hZryZq3oeI_4core3fmt3numjNtB7_8LowerHex3fmt
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRyNtB6_5Debug3fmtCsk3zFpI5xiw6_32interval_dyadic_wasm_conformance (param $0 i32) (param $1 i32) (result i32)
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
     (call $_RNvXsd_NtNtNtCs8hZryZq3oeI_4core3fmt3num3impyNtB9_7Display3fmt
      (local.get $0)
      (local.get $1)
     )
    )
   )
   (return
    (call $_RNvXsE_NtNtCs8hZryZq3oeI_4core3fmt3numyNtB7_8UpperHex3fmt
     (local.get $0)
     (local.get $1)
    )
   )
  )
  (call $_RNvXsC_NtNtCs8hZryZq3oeI_4core3fmt3numyNtB7_8LowerHex3fmt
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub (param $0 i32) (param $1 i32)
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
               (br_table $label$12 $label$11 $label$13 $label$12
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
                   (i32.const -1)
                  )
                 )
                 (br_if $label$10
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
                (block $label$17
                 (br_if $label$17
                  (i32.eq
                   (local.tee $4
                    (i32.load offset=8
                     (local.get $1)
                    )
                   )
                   (i32.const 1)
                  )
                 )
                 (local.set $4
                  (i32.sub
                   (i32.gt_u
                    (local.get $4)
                    (i32.const 1)
                   )
                   (i32.eqz
                    (local.get $4)
                   )
                  )
                 )
                 (br $label$14)
                )
                (local.set $4
                 (i32.load offset=4
                  (local.get $1)
                 )
                )
               )
               (br_if $label$9
                (i32.eq
                 (local.tee $4
                  (i32.load
                   (local.get $4)
                  )
                 )
                 (i32.const 1)
                )
               )
               (local.set $4
                (i32.sub
                 (i32.gt_u
                  (local.get $4)
                  (i32.const 1)
                 )
                 (i32.eqz
                  (local.get $4)
                 )
                )
               )
              )
              (br_table $label$9 $label$6 $label$10
               (i32.and
                (local.get $4)
                (i32.const 255)
               )
              )
             )
             (i32.store offset=8
              (local.get $2)
              (i32.load offset=8
               (local.get $1)
              )
             )
             (i64.store
              (local.get $2)
              (i64.load align=4
               (local.get $1)
              )
             )
             (call $_RNvXs1_NtNtCsbodFP5rPXOh_10num_bigint7biguint8additionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9AddAssignmE10add_assign
              (local.get $2)
             )
             (local.set $1
              (i32.load offset=8
               (local.get $2)
              )
             )
             (local.set $4
              (i32.load offset=4
               (local.get $2)
              )
             )
             (block $label$18
              (block $label$19
               (br_if $label$19
                (i32.eq
                 (local.tee $5
                  (i32.load
                   (local.get $2)
                  )
                 )
                 (i32.const -1)
                )
               )
               (br_if $label$18
                (i32.eqz
                 (local.get $1)
                )
               )
               (br $label$3)
              )
              (local.set $3
               (i32.const 1)
              )
              (br_if $label$3
               (i32.and
                (local.get $4)
                (i32.const 1)
               )
              )
              (i64.store offset=8 align=4
               (local.get $0)
               (i64.load offset=1049864
                (i32.const 0)
               )
              )
              (i64.store align=4
               (local.get $0)
               (i64.load offset=1049856
                (i32.const 0)
               )
              )
              (br $label$2)
             )
             (i64.store offset=8 align=4
              (local.get $0)
              (i64.load offset=1049864
               (i32.const 0)
              )
             )
             (i64.store align=4
              (local.get $0)
              (i64.load offset=1049856
               (i32.const 0)
              )
             )
             (local.set $3
              (i32.const 1)
             )
             (br_if $label$2
              (i32.eqz
               (local.get $5)
              )
             )
             (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
              (local.get $4)
              (i32.shl
               (local.get $5)
               (i32.const 2)
              )
              (i32.const 4)
             )
             (br $label$2)
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
             (i64.const 8589934591)
            )
            (local.set $3
             (i32.load
              (local.get $1)
             )
            )
            (br $label$4)
           )
           (i32.store offset=8
            (local.get $2)
            (i32.load offset=8
             (local.get $1)
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
           (block $label$20
            (block $label$21
             (block $label$22
              (block $label$23
               (block $label$24
                (br_if $label$24
                 (i32.eq
                  (local.tee $3
                   (i32.wrap_i64
                    (local.get $6)
                   )
                  )
                  (i32.const -1)
                 )
                )
                (br_if $label$23
                 (local.tee $1
                  (i32.load offset=8
                   (local.get $2)
                  )
                 )
                )
                (block $label$25
                 (br_if $label$25
                  (local.get $3)
                 )
                 (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
                  (local.get $2)
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
                (br $label$20)
               )
               (br_if $label$22
                (i32.load offset=4
                 (local.get $2)
                )
               )
               (i64.store offset=4 align=4
                (local.get $2)
                (i64.const 4294967297)
               )
               (br $label$20)
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
              (br $label$21)
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
            (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint11subtraction7sub2rev
             (i32.add
              (local.get $2)
              (i32.const 12)
             )
             (i32.const 1)
             (local.get $3)
             (local.get $1)
            )
           )
           (call $_RNvMNtCsbodFP5rPXOh_10num_bigint9big_digitNtB2_9BigDigits9normalize
            (local.get $2)
           )
           (local.set $1
            (i32.load offset=8
             (local.get $2)
            )
           )
           (local.set $3
            (i32.load offset=4
             (local.get $2)
            )
           )
           (br_if $label$8
            (i32.eq
             (local.tee $4
              (i32.load
               (local.get $2)
              )
             )
             (i32.const -1)
            )
           )
           (br_if $label$7
            (i32.eqz
             (local.get $1)
            )
           )
           (br $label$5)
          )
          (i64.store offset=8 align=4
           (local.get $0)
           (i64.load offset=1049864
            (i32.const 0)
           )
          )
          (i64.store align=4
           (local.get $0)
           (i64.load offset=1049856
            (i32.const 0)
           )
          )
          (br $label$4)
         )
         (br_if $label$5
          (i32.and
           (local.get $3)
           (i32.const 1)
          )
         )
         (i64.store offset=8 align=4
          (local.get $0)
          (i64.load offset=1049864
           (i32.const 0)
          )
         )
         (i64.store align=4
          (local.get $0)
          (i64.load offset=1049856
           (i32.const 0)
          )
         )
         (i32.store8 offset=12
          (local.get $0)
          (i32.const 1)
         )
         (br $label$1)
        )
        (i64.store offset=8 align=4
         (local.get $0)
         (i64.load offset=1049864
          (i32.const 0)
         )
        )
        (i64.store align=4
         (local.get $0)
         (i64.load offset=1049856
          (i32.const 0)
         )
        )
        (block $label$26
         (br_if $label$26
          (i32.eqz
           (local.get $4)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (local.get $3)
          (i32.shl
           (local.get $4)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (i32.store8 offset=12
         (local.get $0)
         (i32.const 1)
        )
        (br $label$1)
       )
       (i32.store offset=8
        (local.get $2)
        (i32.load offset=8
         (local.get $1)
        )
       )
       (i64.store
        (local.get $2)
        (i64.load align=4
         (local.get $1)
        )
       )
       (call $_RNvXs2_NtNtCsbodFP5rPXOh_10num_bigint7biguint11subtractionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9SubAssignmE10sub_assign
        (local.get $2)
        (i32.const 1)
       )
       (local.set $1
        (i32.load offset=8
         (local.get $2)
        )
       )
       (local.set $3
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
            (i32.const -1)
           )
          )
          (br_if $label$28
           (i32.eqz
            (local.get $1)
           )
          )
          (br $label$27)
         )
         (br_if $label$27
          (i32.and
           (local.get $3)
           (i32.const 1)
          )
         )
         (i64.store offset=8 align=4
          (local.get $0)
          (i64.load offset=1049864
           (i32.const 0)
          )
         )
         (i64.store align=4
          (local.get $0)
          (i64.load offset=1049856
           (i32.const 0)
          )
         )
         (br $label$1)
        )
        (i64.store offset=8 align=4
         (local.get $0)
         (i64.load offset=1049864
          (i32.const 0)
         )
        )
        (i64.store align=4
         (local.get $0)
         (i64.load offset=1049856
          (i32.const 0)
         )
        )
        (br_if $label$1
         (i32.eqz
          (local.get $4)
         )
        )
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
         (local.get $3)
         (i32.shl
          (local.get $4)
          (i32.const 2)
         )
         (i32.const 4)
        )
        (br $label$1)
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $1)
       )
       (i32.store offset=4
        (local.get $0)
        (local.get $3)
       )
       (i32.store
        (local.get $0)
        (local.get $4)
       )
       (i32.store8 offset=12
        (local.get $0)
        (i32.const 2)
       )
       (br $label$1)
      )
      (i32.store offset=8
       (local.get $0)
       (local.get $1)
      )
      (i32.store offset=4
       (local.get $0)
       (local.get $3)
      )
      (i32.store
       (local.get $0)
       (local.get $4)
      )
      (i32.store8 offset=12
       (local.get $0)
       (i32.const 0)
      )
      (br $label$1)
     )
     (br_if $label$1
      (i32.lt_s
       (local.get $3)
       (i32.const 1)
      )
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
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
    (i32.store offset=8
     (local.get $0)
     (local.get $1)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $4)
    )
    (i32.store
     (local.get $0)
     (local.get $5)
    )
    (local.set $3
     (i32.const 0)
    )
   )
   (i32.store8 offset=12
    (local.get $0)
    (local.get $3)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
 )
 (func $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint8additionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3AddmE3add (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
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
          (br_table $label$8 $label$7 $label$6 $label$8
           (i32.load8_u offset=12
            (local.get $1)
           )
          )
         )
         (block $label$9
          (block $label$10
           (block $label$11
            (block $label$12
             (block $label$13
              (block $label$14
               (br_if $label$14
                (i32.ne
                 (local.tee $3
                  (i32.load
                   (local.get $1)
                  )
                 )
                 (i32.const -1)
                )
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
               (br $label$13)
              )
              (block $label$15
               (br_if $label$15
                (i32.eq
                 (local.tee $4
                  (i32.load offset=8
                   (local.get $1)
                  )
                 )
                 (i32.const 1)
                )
               )
               (local.set $4
                (i32.sub
                 (i32.gt_u
                  (local.get $4)
                  (i32.const 1)
                 )
                 (i32.eqz
                  (local.get $4)
                 )
                )
               )
               (br $label$12)
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
             (local.set $4
              (i32.sub
               (i32.gt_u
                (local.get $4)
                (i32.const 1)
               )
               (i32.eqz
                (local.get $4)
               )
              )
             )
            )
            (br_table $label$10 $label$9 $label$11
             (i32.and
              (local.get $4)
              (i32.const 255)
             )
            )
           )
           (i32.store offset=8
            (local.get $2)
            (i32.load offset=8
             (local.get $1)
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
           (block $label$16
            (block $label$17
             (block $label$18
              (block $label$19
               (block $label$20
                (br_if $label$20
                 (i32.eq
                  (local.tee $3
                   (i32.wrap_i64
                    (local.get $5)
                   )
                  )
                  (i32.const -1)
                 )
                )
                (br_if $label$19
                 (local.tee $1
                  (i32.load offset=8
                   (local.get $2)
                  )
                 )
                )
                (block $label$21
                 (br_if $label$21
                  (local.get $3)
                 )
                 (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
                  (local.get $2)
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
                (br $label$16)
               )
               (br_if $label$18
                (i32.load offset=4
                 (local.get $2)
                )
               )
               (i64.store offset=4 align=4
                (local.get $2)
                (i64.const 4294967297)
               )
               (br $label$16)
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
              (br $label$17)
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
            (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint11subtraction7sub2rev
             (i32.add
              (local.get $2)
              (i32.const 12)
             )
             (i32.const 1)
             (local.get $3)
             (local.get $1)
            )
           )
           (call $_RNvMNtCsbodFP5rPXOh_10num_bigint9big_digitNtB2_9BigDigits9normalize
            (local.get $2)
           )
           (local.set $1
            (i32.load offset=8
             (local.get $2)
            )
           )
           (local.set $3
            (i32.load offset=4
             (local.get $2)
            )
           )
           (block $label$22
            (block $label$23
             (br_if $label$23
              (i32.eq
               (local.tee $4
                (i32.load
                 (local.get $2)
                )
               )
               (i32.const -1)
              )
             )
             (br_if $label$22
              (i32.eqz
               (local.get $1)
              )
             )
             (br $label$2)
            )
            (br_if $label$2
             (i32.and
              (local.get $3)
              (i32.const 1)
             )
            )
            (i64.store offset=8 align=4
             (local.get $0)
             (i64.load offset=1049864
              (i32.const 0)
             )
            )
            (i64.store align=4
             (local.get $0)
             (i64.load offset=1049856
              (i32.const 0)
             )
            )
            (br $label$1)
           )
           (i64.store offset=8 align=4
            (local.get $0)
            (i64.load offset=1049864
             (i32.const 0)
            )
           )
           (i64.store align=4
            (local.get $0)
            (i64.load offset=1049856
             (i32.const 0)
            )
           )
           (br_if $label$1
            (i32.eqz
             (local.get $4)
            )
           )
           (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
            (local.get $3)
            (i32.shl
             (local.get $4)
             (i32.const 2)
            )
            (i32.const 4)
           )
           (br $label$1)
          )
          (i64.store offset=8 align=4
           (local.get $0)
           (i64.load offset=1049864
            (i32.const 0)
           )
          )
          (i64.store align=4
           (local.get $0)
           (i64.load offset=1049856
            (i32.const 0)
           )
          )
          (br $label$3)
         )
         (i32.store offset=8
          (local.get $2)
          (i32.load offset=8
           (local.get $1)
          )
         )
         (i64.store
          (local.get $2)
          (i64.load align=4
           (local.get $1)
          )
         )
         (call $_RNvXs2_NtNtCsbodFP5rPXOh_10num_bigint7biguint11subtractionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9SubAssignmE10sub_assign
          (local.get $2)
          (i32.const 1)
         )
         (local.set $1
          (i32.load offset=8
           (local.get $2)
          )
         )
         (local.set $3
          (i32.load offset=4
           (local.get $2)
          )
         )
         (block $label$24
          (block $label$25
           (br_if $label$25
            (i32.eq
             (local.tee $4
              (i32.load
               (local.get $2)
              )
             )
             (i32.const -1)
            )
           )
           (br_if $label$24
            (i32.eqz
             (local.get $1)
            )
           )
           (br $label$5)
          )
          (br_if $label$5
           (i32.and
            (local.get $3)
            (i32.const 1)
           )
          )
          (i64.store offset=8 align=4
           (local.get $0)
           (i64.load offset=1049864
            (i32.const 0)
           )
          )
          (i64.store align=4
           (local.get $0)
           (i64.load offset=1049856
            (i32.const 0)
           )
          )
          (local.set $1
           (i32.const 1)
          )
          (br $label$4)
         )
         (i64.store offset=8 align=4
          (local.get $0)
          (i64.load offset=1049864
           (i32.const 0)
          )
         )
         (i64.store align=4
          (local.get $0)
          (i64.load offset=1049856
           (i32.const 0)
          )
         )
         (local.set $1
          (i32.const 1)
         )
         (br_if $label$4
          (i32.eqz
           (local.get $4)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (local.get $3)
          (i32.shl
           (local.get $4)
           (i32.const 2)
          )
          (i32.const 4)
         )
         (br $label$4)
        )
        (i32.store offset=8
         (local.get $0)
         (i32.const 1)
        )
        (i64.store align=4
         (local.get $0)
         (i64.const 8589934591)
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
        (br $label$3)
       )
       (i32.store offset=8
        (local.get $2)
        (i32.load offset=8
         (local.get $1)
        )
       )
       (i64.store
        (local.get $2)
        (i64.load align=4
         (local.get $1)
        )
       )
       (call $_RNvXs1_NtNtCsbodFP5rPXOh_10num_bigint7biguint8additionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9AddAssignmE10add_assign
        (local.get $2)
       )
       (local.set $1
        (i32.load offset=8
         (local.get $2)
        )
       )
       (local.set $3
        (i32.load offset=4
         (local.get $2)
        )
       )
       (block $label$26
        (block $label$27
         (block $label$28
          (br_if $label$28
           (i32.eq
            (local.tee $4
             (i32.load
              (local.get $2)
             )
            )
            (i32.const -1)
           )
          )
          (br_if $label$27
           (i32.eqz
            (local.get $1)
           )
          )
          (br $label$26)
         )
         (br_if $label$26
          (i32.and
           (local.get $3)
           (i32.const 1)
          )
         )
         (i64.store offset=8 align=4
          (local.get $0)
          (i64.load offset=1049864
           (i32.const 0)
          )
         )
         (i64.store align=4
          (local.get $0)
          (i64.load offset=1049856
           (i32.const 0)
          )
         )
         (br $label$1)
        )
        (i64.store offset=8 align=4
         (local.get $0)
         (i64.load offset=1049864
          (i32.const 0)
         )
        )
        (i64.store align=4
         (local.get $0)
         (i64.load offset=1049856
          (i32.const 0)
         )
        )
        (br_if $label$1
         (i32.eqz
          (local.get $4)
         )
        )
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
         (local.get $3)
         (i32.shl
          (local.get $4)
          (i32.const 2)
         )
         (i32.const 4)
        )
        (br $label$1)
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $1)
       )
       (i32.store offset=4
        (local.get $0)
        (local.get $3)
       )
       (i32.store
        (local.get $0)
        (local.get $4)
       )
       (i32.store8 offset=12
        (local.get $0)
        (i32.const 2)
       )
       (br $label$1)
      )
      (i32.store offset=8
       (local.get $0)
       (local.get $1)
      )
      (i32.store offset=4
       (local.get $0)
       (local.get $3)
      )
      (i32.store
       (local.get $0)
       (local.get $4)
      )
      (local.set $1
       (i32.const 0)
      )
     )
     (i32.store8 offset=12
      (local.get $0)
      (local.get $1)
     )
     (br $label$1)
    )
    (br_if $label$1
     (i32.lt_s
      (local.get $3)
      (i32.const 1)
     )
    )
    (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
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
   (i32.store offset=8
    (local.get $0)
    (local.get $1)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $3)
   )
   (i32.store
    (local.get $0)
    (local.get $4)
   )
   (i32.store8 offset=12
    (local.get $0)
    (i32.const 2)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
 )
 (func $_RNvXs4_NtCskObGt8PTDSq_13hyperinterval5stateNtB5_13IntervalErrorNtNtCs8hZryZq3oeI_4core3fmt5Debug3fmt (param $0 i32) (param $1 i32) (result i32)
  (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str
   (local.get $1)
   (i32.load offset=1050280
    (i32.shl
     (local.tee $0
      (i32.load8_u
       (local.get $0)
      )
     )
     (i32.const 2)
    )
   )
   (i32.load8_u offset=1050264
    (local.get $0)
   )
  )
 )
 (func $_RNvXs9_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_8Binary32NtNtCs8hZryZq3oeI_4core3fmt5Debug3fmt (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
    (local.get $1)
    (i32.const 1050088)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1050072)
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
 (func $_RNvXsz_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_8Binary64NtNtCs8hZryZq3oeI_4core3fmt5Debug3fmt (param $0 i32) (param $1 i32) (result i32)
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
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish
    (local.get $1)
    (i32.const 1050256)
    (i32.const 8)
    (i32.add
     (local.get $2)
     (i32.const 12)
    )
    (i32.const 1049760)
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
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i32)
  (global.set $__stack_pointer
   (local.tee $0
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 608)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 0)
   (i32.const 24)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$1)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 472)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 0)
   (i32.const 24)
  )
  (block $label$3
   (block $label$4
    (br_if $label$4
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$3)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 592)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$5)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint8additionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3AddmE3add
   (i32.add
    (local.get $0)
    (i32.const 512)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$7
   (block $label$8
    (br_if $label$8
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$7)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 496)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$9
   (block $label$10
    (br_if $label$10
     (i32.eq
      (i32.load offset=496
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=504
       (local.get $0)
      )
     )
    )
    (br $label$9)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=500
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=504
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=496 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint8additionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3AddmE3add
   (i32.add
    (local.get $0)
    (i32.const 496)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i64.store offset=280
   (local.get $0)
   (i64.load offset=480
    (local.get $0)
   )
  )
  (i64.store offset=272
   (local.get $0)
   (i64.load offset=472
    (local.get $0)
   )
  )
  (i64.store offset=312
   (local.get $0)
   (i64.load offset=592
    (local.get $0)
   )
  )
  (i64.store offset=320
   (local.get $0)
   (i64.load offset=600
    (local.get $0)
   )
  )
  (i64.store offset=352
   (local.get $0)
   (i64.load offset=512
    (local.get $0)
   )
  )
  (i64.store offset=360
   (local.get $0)
   (i64.load offset=520
    (local.get $0)
   )
  )
  (i64.store offset=392
   (local.get $0)
   (i64.load offset=552
    (local.get $0)
   )
  )
  (i64.store offset=400
   (local.get $0)
   (i64.load offset=560
    (local.get $0)
   )
  )
  (local.set $2
   (i32.const 0)
  )
  (i64.store offset=40
   (local.get $0)
   (i64.load offset=1049864
    (i32.const 0)
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=1049856
    (i32.const 0)
   )
  )
  (i64.store offset=424
   (local.get $0)
   (i64.const 1065353216)
  )
  (i32.store offset=416
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=408
   (local.get $0)
   (i64.const 1065353215)
  )
  (i64.store offset=384
   (local.get $0)
   (i64.const 1065353217)
  )
  (i32.store offset=376
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=368
   (local.get $0)
   (i64.const 1065353216)
  )
  (i64.store offset=344
   (local.get $0)
   (i64.const 2139095039)
  )
  (i32.store offset=336
   (local.get $0)
   (i32.const 104)
  )
  (i64.store offset=328
   (local.get $0)
   (i64.const 2139095039)
  )
  (i64.store offset=304
   (local.get $0)
   (i64.const 8388608)
  )
  (i32.store offset=296
   (local.get $0)
   (i32.const -150)
  )
  (i64.store offset=288
   (local.get $0)
   (i64.const 8388607)
  )
  (i64.store offset=264
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=256
   (local.get $0)
   (i32.const -2147483648)
  )
  (i64.store offset=248
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=244
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=240
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=232
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=224
   (local.get $0)
   (i64.const 2)
  )
  (i32.store offset=216
   (local.get $0)
   (i32.const -150)
  )
  (i64.store offset=208
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=204
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=200
   (local.get $0)
   (i32.const 3)
  )
  (i64.store offset=192
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=184
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=176
   (local.get $0)
   (i32.const -150)
  )
  (i64.store offset=168
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=164
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=160
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=152
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=144
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=136
   (local.get $0)
   (i32.const -149)
  )
  (i64.store offset=128
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=124
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=120
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=112
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=104
   (local.get $0)
   (i64.const 1065353216)
  )
  (i32.store offset=96
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=88
   (local.get $0)
   (i64.const 1065353216)
  )
  (i32.store8 offset=84
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=80
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=72
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=64
   (local.get $0)
   (i64.const 0)
  )
  (i32.store offset=56
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=48
   (local.get $0)
   (i64.const 0)
  )
  (i64.store offset=24
   (local.get $0)
   (i64.const 47244640256)
  )
  (i64.store offset=448
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=456
   (local.get $0)
   (i32.const -4245)
  )
  (i64.store offset=464
   (local.get $0)
   (i64.const 2)
  )
  (i64.store offset=440
   (local.get $0)
   (i64.load offset=504
    (local.get $0)
   )
  )
  (i64.store offset=432
   (local.get $0)
   (i64.load offset=496
    (local.get $0)
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (local.set $4
   (i32.const 0)
  )
  (block $label$11
   (loop $label$12
    (i32.store offset=24
     (local.get $0)
     (local.tee $5
      (i32.add
       (local.get $2)
       (i32.const 1)
      )
     )
    )
    (block $label$13
     (br_if $label$13
      (i32.ne
       (local.tee $6
        (i32.load
         (i32.add
          (local.tee $1
           (i32.add
            (i32.add
             (local.get $0)
             (i32.const 24)
            )
            (local.get $3)
           )
          )
          (i32.const 8)
         )
        )
       )
       (i32.const -2)
      )
     )
     (br_if $label$11
      (i32.eq
       (local.get $3)
       (i32.const 400)
      )
     )
     (local.set $6
      (i32.sub
       (i32.const 10)
       (local.get $2)
      )
     )
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.const 52)
      )
     )
     (loop $label$14
      (block $label$15
       (br_if $label$15
        (i32.lt_s
         (local.tee $3
          (i32.load
           (i32.add
            (local.get $1)
            (i32.const -4)
           )
          )
         )
         (i32.const 1)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (i32.load
         (local.get $1)
        )
        (i32.shl
         (local.get $3)
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
      (br_if $label$14
       (local.tee $6
        (i32.add
         (local.get $6)
         (i32.const -1)
        )
       )
      )
      (br $label$11)
     )
    )
    (local.set $7
     (i64.load
      (i32.add
       (local.get $1)
       (i32.const 40)
      )
     )
    )
    (local.set $2
     (i32.load
      (i32.add
       (local.get $1)
       (i32.const 32)
      )
     )
    )
    (local.set $8
     (i64.load
      (i32.add
       (local.get $1)
       (i32.const 24)
      )
     )
    )
    (local.set $9
     (i32.load8_u
      (i32.add
       (local.get $1)
       (i32.const 20)
      )
     )
    )
    (local.set $10
     (i32.load
      (i32.add
       (local.get $1)
       (i32.const 12)
      )
     )
    )
    (local.set $11
     (i32.shl
      (local.tee $1
       (i32.load
        (i32.add
         (local.get $1)
         (i32.const 16)
        )
       )
      )
      (i32.const 2)
     )
    )
    (local.set $12
     (i32.const -1)
    )
    (block $label$16
     (block $label$17
      (block $label$18
       (block $label$19
        (block $label$20
         (block $label$21
          (block $label$22
           (block $label$23
            (block $label$24
             (block $label$25
              (block $label$26
               (br_if $label$26
                (i32.ne
                 (local.get $6)
                 (i32.const -1)
                )
               )
               (local.set $13
                (local.get $10)
               )
               (br $label$25)
              )
              (local.set $13
               (local.get $1)
              )
              (block $label$27
               (block $label$28
                (br_table $label$24 $label$28 $label$27
                 (local.get $1)
                )
               )
               (local.set $14
                (i32.load
                 (local.get $10)
                )
               )
               (local.set $13
                (i32.const 1)
               )
               (br $label$24)
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
              (br_if $label$23
               (i32.eqz
                (local.tee $13
                 (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
                  (local.get $11)
                  (i32.const 4)
                 )
                )
               )
              )
              (block $label$29
               (br_if $label$29
                (i32.eqz
                 (local.get $11)
                )
               )
               (memory.copy
                (local.get $13)
                (local.get $10)
                (local.get $11)
               )
              )
              (local.set $12
               (local.get $1)
              )
             )
             (local.set $14
              (local.get $1)
             )
            )
            (i32.store offset=16
             (local.get $0)
             (local.get $14)
            )
            (i32.store offset=12
             (local.get $0)
             (local.get $13)
            )
            (i32.store offset=8
             (local.get $0)
             (local.get $12)
            )
            (i32.store8 offset=20
             (local.get $0)
             (local.get $9)
            )
            (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
             (i32.add
              (local.get $0)
              (i32.const 552)
             )
             (i32.add
              (local.get $0)
              (i32.const 8)
             )
             (local.get $2)
            )
            (br_if $label$22
             (i32.eq
              (i32.load offset=552
               (local.get $0)
              )
              (i32.const -3)
             )
            )
            (i32.store offset=544
             (local.get $0)
             (i32.load offset=584
              (local.get $0)
             )
            )
            (i64.store offset=536
             (local.get $0)
             (i64.load offset=576 align=4
              (local.get $0)
             )
            )
            (i64.store offset=528
             (local.get $0)
             (i64.load offset=568 align=4
              (local.get $0)
             )
            )
            (i64.store offset=520
             (local.get $0)
             (i64.load offset=560 align=4
              (local.get $0)
             )
            )
            (i64.store offset=512
             (local.get $0)
             (i64.load offset=552 align=4
              (local.get $0)
             )
            )
            (i64.store offset=560
             (local.get $0)
             (i64.const 100000)
            )
            (i64.store offset=552
             (local.get $0)
             (i64.const 8192)
            )
            (call $_RNvMs5_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F32Enclosure11from_dyadic
             (i32.add
              (local.get $0)
              (i32.const 592)
             )
             (i32.add
              (local.get $0)
              (i32.const 512)
             )
             (i32.add
              (local.get $0)
              (i32.const 552)
             )
            )
            (br_if $label$21
             (i32.eq
              (local.tee $13
               (i32.load offset=592
                (local.get $0)
               )
              )
              (i32.const 2)
             )
            )
            (br_if $label$20
             (i32.eqz
              (i32.and
               (local.get $13)
               (i32.const 1)
              )
             )
            )
            (local.set $15
             (i64.load32_u offset=600
              (local.get $0)
             )
            )
            (local.set $16
             (i64.load32_u offset=596
              (local.get $0)
             )
            )
            (i64.store offset=600
             (local.get $0)
             (local.get $7)
            )
            (i64.store offset=592
             (local.get $0)
             (local.get $8)
            )
            (i64.store offset=560
             (local.get $0)
             (local.get $15)
            )
            (i64.store offset=552
             (local.get $0)
             (local.get $16)
            )
            (br_if $label$19
             (i64.ne
              (local.get $8)
              (local.get $16)
             )
            )
            (br_if $label$19
             (i64.ne
              (local.get $7)
              (local.get $15)
             )
            )
            (block $label$30
             (br_if $label$30
              (i32.eq
               (local.tee $13
                (i32.load offset=512
                 (local.get $0)
                )
               )
               (i32.const -2)
              )
             )
             (block $label$31
              (br_if $label$31
               (i32.lt_s
                (local.get $13)
                (i32.const 1)
               )
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
               (i32.load offset=516
                (local.get $0)
               )
               (i32.shl
                (local.get $13)
                (i32.const 2)
               )
               (i32.const 4)
              )
             )
             (br_if $label$30
              (i32.lt_s
               (local.tee $13
                (i32.load offset=528
                 (local.get $0)
                )
               )
               (i32.const 1)
              )
             )
             (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
              (i32.load offset=532
               (local.get $0)
              )
              (i32.shl
               (local.get $13)
               (i32.const 2)
              )
              (i32.const 4)
             )
            )
            (local.set $14
             (i32.const -1)
            )
            (block $label$32
             (block $label$33
              (br_if $label$33
               (i32.ne
                (local.get $6)
                (i32.const -1)
               )
              )
              (local.set $13
               (local.get $10)
              )
              (br $label$32)
             )
             (local.set $13
              (local.get $1)
             )
             (block $label$34
              (block $label$35
               (br_table $label$32 $label$35 $label$34
                (local.get $1)
               )
              )
              (local.set $1
               (i32.load
                (local.get $10)
               )
              )
              (local.set $13
               (i32.const 1)
              )
              (br $label$32)
             )
             (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
             (br_if $label$18
              (i32.eqz
               (local.tee $13
                (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
                 (local.get $11)
                 (i32.const 4)
                )
               )
              )
             )
             (block $label$36
              (br_if $label$36
               (i32.eqz
                (local.get $11)
               )
              )
              (memory.copy
               (local.get $13)
               (local.get $10)
               (local.get $11)
              )
             )
             (local.set $14
              (local.get $1)
             )
            )
            (i32.store8 offset=20
             (local.get $0)
             (i32.sub
              (i32.const 2)
              (local.get $9)
             )
            )
            (i32.store offset=16
             (local.get $0)
             (local.get $1)
            )
            (i32.store offset=12
             (local.get $0)
             (local.get $13)
            )
            (i32.store offset=8
             (local.get $0)
             (local.get $14)
            )
            (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
             (i32.add
              (local.get $0)
              (i32.const 552)
             )
             (i32.add
              (local.get $0)
              (i32.const 8)
             )
             (local.get $2)
            )
            (br_if $label$22
             (i32.eq
              (i32.load offset=552
               (local.get $0)
              )
              (i32.const -3)
             )
            )
            (i32.store offset=544
             (local.get $0)
             (i32.load offset=584
              (local.get $0)
             )
            )
            (i64.store offset=536
             (local.get $0)
             (i64.load offset=576 align=4
              (local.get $0)
             )
            )
            (i64.store offset=528
             (local.get $0)
             (i64.load offset=568 align=4
              (local.get $0)
             )
            )
            (i64.store offset=520
             (local.get $0)
             (i64.load offset=560 align=4
              (local.get $0)
             )
            )
            (i64.store offset=512
             (local.get $0)
             (i64.load offset=552 align=4
              (local.get $0)
             )
            )
            (i64.store offset=560
             (local.get $0)
             (i64.const 100000)
            )
            (i64.store offset=552
             (local.get $0)
             (i64.const 8192)
            )
            (call $_RNvMs5_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F32Enclosure11from_dyadic
             (i32.add
              (local.get $0)
              (i32.const 592)
             )
             (i32.add
              (local.get $0)
              (i32.const 512)
             )
             (i32.add
              (local.get $0)
              (i32.const 552)
             )
            )
            (br_if $label$21
             (i32.eq
              (local.tee $1
               (i32.load offset=592
                (local.get $0)
               )
              )
              (i32.const 2)
             )
            )
            (br_if $label$20
             (i32.ne
              (local.get $1)
              (i32.const 1)
             )
            )
            (local.set $15
             (i64.load32_u offset=600
              (local.get $0)
             )
            )
            (local.set $16
             (i64.load32_u offset=596
              (local.get $0)
             )
            )
            (i64.store offset=600
             (local.get $0)
             (local.tee $17
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
            (i64.store offset=592
             (local.get $0)
             (local.tee $8
              (select
               (i64.const 0)
               (i64.or
                (local.get $7)
                (i64.const 2147483648)
               )
               (i64.eqz
                (local.get $7)
               )
              )
             )
            )
            (i64.store offset=560
             (local.get $0)
             (local.get $15)
            )
            (i64.store offset=552
             (local.get $0)
             (local.get $16)
            )
            (br_if $label$19
             (i64.ne
              (local.get $8)
              (local.get $16)
             )
            )
            (br_if $label$19
             (i64.ne
              (local.get $17)
              (local.get $15)
             )
            )
            (block $label$37
             (br_if $label$37
              (i32.eq
               (local.tee $1
                (i32.load offset=512
                 (local.get $0)
                )
               )
               (i32.const -2)
              )
             )
             (block $label$38
              (br_if $label$38
               (i32.lt_s
                (local.get $1)
                (i32.const 1)
               )
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
               (i32.load offset=516
                (local.get $0)
               )
               (i32.shl
                (local.get $1)
                (i32.const 2)
               )
               (i32.const 4)
              )
             )
             (br_if $label$37
              (i32.lt_s
               (local.tee $1
                (i32.load offset=528
                 (local.get $0)
                )
               )
               (i32.const 1)
              )
             )
             (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
              (i32.load offset=532
               (local.get $0)
              )
              (i32.shl
               (local.get $1)
               (i32.const 2)
              )
              (i32.const 4)
             )
            )
            (br_if $label$17
             (i32.lt_u
              (i32.add
               (local.get $6)
               (i32.const -1)
              )
              (i32.const -2)
             )
            )
            (br $label$16)
           )
           (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
            (i32.const 4)
            (local.get $11)
           )
           (unreachable)
          )
          (i32.store8 offset=592
           (local.get $0)
           (i32.load8_u offset=556
            (local.get $0)
           )
          )
          (call $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed
           (i32.const 1049688)
           (i32.const 43)
           (i32.add
            (local.get $0)
            (i32.const 592)
           )
           (i32.const 1049672)
           (i32.const 1049744)
          )
          (unreachable)
         )
         (i32.store8 offset=472
          (local.get $0)
          (i32.load8_u offset=596
           (local.get $0)
          )
         )
         (call $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed
          (i32.const 1049688)
          (i32.const 43)
          (i32.add
           (local.get $0)
           (i32.const 472)
          )
          (i32.const 1049672)
          (i32.const 1049744)
         )
         (unreachable)
        )
        (call $_RNvNtCs8hZryZq3oeI_4core6option13unwrap_failed
         (i32.const 1049744)
        )
        (unreachable)
       )
       (call $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedTyyEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance
        (i32.add
         (local.get $0)
         (i32.const 552)
        )
        (i32.add
         (local.get $0)
         (i32.const 592)
        )
        (i32.const 1049744)
       )
       (unreachable)
      )
      (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
       (i32.const 4)
       (local.get $11)
      )
      (unreachable)
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
      (local.get $10)
      (i32.shl
       (local.get $6)
       (i32.const 2)
      )
      (i32.const 4)
     )
    )
    (local.set $4
     (i32.add
      (local.get $4)
      (i32.const 2)
     )
    )
    (local.set $2
     (local.get $5)
    )
    (br_if $label$12
     (i32.ne
      (local.tee $3
       (i32.add
        (local.get $3)
        (i32.const 40)
       )
      )
      (i32.const 440)
     )
    )
   )
   (local.set $4
    (i32.const 22)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 512)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 0)
   (i32.const 25)
  )
  (block $label$39
   (block $label$40
    (br_if $label$40
     (i32.eq
      (i32.load offset=512
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=520
       (local.get $0)
      )
     )
    )
    (br $label$39)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=516
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=560
   (local.get $0)
   (i32.load offset=520
    (local.get $0)
   )
  )
  (i64.store offset=552
   (local.get $0)
   (i64.load offset=512 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=564
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 72)
   )
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
  )
  (i32.store offset=88
   (local.get $0)
   (i32.const 103)
  )
  (i32.store offset=68
   (local.get $0)
   (i32.const 128)
  )
  (i32.store8 offset=64
   (local.get $0)
   (i32.const 2)
  )
  (i64.store offset=56 align=4
   (local.get $0)
   (i64.const 4294967297)
  )
  (i64.store offset=48 align=4
   (local.get $0)
   (i64.const -2147483649)
  )
  (i32.store8 offset=44
   (local.get $0)
   (i32.const 2)
  )
  (i64.store offset=36 align=4
   (local.get $0)
   (i64.const 4294967297)
  )
  (i64.store offset=28 align=4
   (local.get $0)
   (i64.const -4294967293)
  )
  (local.set $11
   (i32.add
    (local.get $0)
    (i32.const 605)
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (local.set $12
   (i32.const -1)
  )
  (block $label$41
   (block $label$42
    (loop $label$43
     (local.set $2
      (i32.add
       (local.tee $1
        (i32.add
         (i32.add
          (local.get $0)
          (i32.const 24)
         )
         (local.get $3)
        )
       )
       (i32.const 21)
      )
     )
     (local.set $9
      (i32.load
       (i32.add
        (local.get $1)
        (i32.const 24)
       )
      )
     )
     (local.set $10
      (i32.load8_u
       (i32.add
        (local.get $1)
        (i32.const 20)
       )
      )
     )
     (local.set $6
      (i32.load
       (i32.add
        (local.get $1)
        (i32.const 16)
       )
      )
     )
     (local.set $13
      (i32.load
       (i32.add
        (local.get $1)
        (i32.const 12)
       )
      )
     )
     (block $label$44
      (block $label$45
       (block $label$46
        (block $label$47
         (block $label$48
          (block $label$49
           (block $label$50
            (block $label$51
             (block $label$52
              (br_table $label$52 $label$50 $label$51
               (i32.add
                (local.tee $5
                 (i32.load
                  (i32.add
                   (local.get $1)
                   (i32.const 8)
                  )
                 )
                )
                (i32.const 2)
               )
              )
             )
             (i32.store offset=24
              (local.get $0)
              (i32.sub
               (i32.const 0)
               (local.get $12)
              )
             )
             (br_if $label$41
              (i32.eq
               (local.get $3)
               (i32.const 40)
              )
             )
             (local.set $6
              (i32.add
               (local.get $12)
               (i32.const 3)
              )
             )
             (local.set $1
              (i32.add
               (local.get $1)
               (i32.const 32)
              )
             )
             (loop $label$53
              (block $label$54
               (br_if $label$54
                (i32.lt_s
                 (local.tee $3
                  (i32.load
                   (i32.add
                    (local.get $1)
                    (i32.const -4)
                   )
                  )
                 )
                 (i32.const 1)
                )
               )
               (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
                (i32.load
                 (local.get $1)
                )
                (i32.shl
                 (local.get $3)
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
              (br_if $label$53
               (local.tee $6
                (i32.add
                 (local.get $6)
                 (i32.const -1)
                )
               )
              )
              (br $label$41)
             )
            )
            (local.set $1
             (local.get $6)
            )
            (block $label$55
             (block $label$56
              (br_table $label$49 $label$56 $label$55
               (local.get $6)
              )
             )
             (local.set $14
              (i32.load
               (local.get $13)
              )
             )
             (local.set $1
              (i32.const 1)
             )
             (br $label$49)
            )
            (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
            (br_if $label$48
             (local.tee $1
              (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
               (local.tee $14
                (i32.shl
                 (local.get $6)
                 (i32.const 2)
                )
               )
               (i32.const 4)
              )
             )
            )
            (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
             (i32.const 4)
             (local.get $14)
            )
            (unreachable)
           )
           (local.set $1
            (local.get $13)
           )
           (local.set $14
            (local.get $6)
           )
          )
          (i32.store8 offset=474
           (local.get $0)
           (i32.load8_u offset=2
            (local.get $2)
           )
          )
          (i32.store16 offset=472
           (local.get $0)
           (i32.load16_u align=1
            (local.get $2)
           )
          )
          (local.set $2
           (i32.const -1)
          )
          (br $label$47)
         )
         (block $label$57
          (br_if $label$57
           (i32.eqz
            (local.get $14)
           )
          )
          (memory.copy
           (local.get $1)
           (local.get $13)
           (local.get $14)
          )
         )
         (i32.store8 offset=474
          (local.get $0)
          (i32.load8_u offset=2
           (local.get $2)
          )
         )
         (i32.store16 offset=472
          (local.get $0)
          (i32.load16_u align=1
           (local.get $2)
          )
         )
         (local.set $14
          (local.get $6)
         )
         (local.set $2
          (local.get $6)
         )
         (br_if $label$46
          (i32.eq
           (local.get $6)
           (i32.const -2)
          )
         )
        )
        (i32.store offset=600
         (local.get $0)
         (local.get $14)
        )
        (i32.store offset=596
         (local.get $0)
         (local.get $1)
        )
        (i32.store offset=592
         (local.get $0)
         (local.get $2)
        )
        (i32.store8 offset=604
         (local.get $0)
         (local.get $10)
        )
        (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
         (i32.add
          (local.get $0)
          (i32.const 552)
         )
         (i32.add
          (local.get $0)
          (i32.const 592)
         )
         (local.get $9)
        )
        (br_if $label$45
         (i32.ne
          (i32.load offset=552
           (local.get $0)
          )
          (i32.const -3)
         )
        )
        (br $label$42)
       )
       (br_if $label$44
        (i32.lt_s
         (local.get $5)
         (i32.const 1)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (local.get $13)
        (i32.shl
         (local.get $5)
         (i32.const 2)
        )
        (i32.const 4)
       )
       (br $label$44)
      )
      (i32.store offset=544
       (local.get $0)
       (i32.load offset=584
        (local.get $0)
       )
      )
      (i64.store offset=536
       (local.get $0)
       (i64.load offset=576 align=4
        (local.get $0)
       )
      )
      (i64.store offset=528
       (local.get $0)
       (i64.load offset=568 align=4
        (local.get $0)
       )
      )
      (i64.store offset=520
       (local.get $0)
       (i64.load offset=560 align=4
        (local.get $0)
       )
      )
      (i64.store offset=512
       (local.get $0)
       (i64.load offset=552 align=4
        (local.get $0)
       )
      )
      (i64.store offset=560
       (local.get $0)
       (i64.const 100000)
      )
      (i64.store offset=552
       (local.get $0)
       (i64.const 8192)
      )
      (call $_RNvMs5_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F32Enclosure11from_dyadic
       (i32.add
        (local.get $0)
        (i32.const 496)
       )
       (i32.add
        (local.get $0)
        (i32.const 512)
       )
       (i32.add
        (local.get $0)
        (i32.const 552)
       )
      )
      (block $label$58
       (br_if $label$58
        (i32.ne
         (i32.load offset=496
          (local.get $0)
         )
         (i32.const 2)
        )
       )
       (br_if $label$58
        (i32.ne
         (i32.and
          (i32.load8_u offset=500
           (local.get $0)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
       (block $label$59
        (br_if $label$59
         (i32.eq
          (local.get $4)
          (i32.const -1)
         )
        )
        (local.set $1
         (i32.sub
          (i32.const 2)
          (local.get $10)
         )
        )
        (block $label$60
         (br_if $label$60
          (i32.eq
           (local.tee $2
            (i32.load offset=512
             (local.get $0)
            )
           )
           (i32.const -2)
          )
         )
         (block $label$61
          (br_if $label$61
           (i32.lt_s
            (local.get $2)
            (i32.const 1)
           )
          )
          (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
           (i32.load offset=516
            (local.get $0)
           )
           (i32.shl
            (local.get $2)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (br_if $label$60
          (i32.lt_s
           (local.tee $2
            (i32.load offset=528
             (local.get $0)
            )
           )
           (i32.const 1)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (i32.load offset=532
           (local.get $0)
          )
          (i32.shl
           (local.get $2)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (i32.store16 align=1
         (local.get $11)
         (i32.load16_u offset=472
          (local.get $0)
         )
        )
        (i32.store8 offset=2
         (local.get $11)
         (i32.load8_u offset=474
          (local.get $0)
         )
        )
        (i32.store8 offset=604
         (local.get $0)
         (local.get $1)
        )
        (i32.store offset=600
         (local.get $0)
         (local.get $6)
        )
        (i32.store offset=596
         (local.get $0)
         (local.get $13)
        )
        (i32.store offset=592
         (local.get $0)
         (local.get $5)
        )
        (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
         (i32.add
          (local.get $0)
          (i32.const 552)
         )
         (i32.add
          (local.get $0)
          (i32.const 592)
         )
         (local.get $9)
        )
        (br_if $label$42
         (i32.eq
          (i32.load offset=552
           (local.get $0)
          )
          (i32.const -3)
         )
        )
        (i32.store offset=544
         (local.get $0)
         (i32.load offset=584
          (local.get $0)
         )
        )
        (i64.store offset=536
         (local.get $0)
         (i64.load offset=576 align=4
          (local.get $0)
         )
        )
        (i64.store offset=528
         (local.get $0)
         (i64.load offset=568 align=4
          (local.get $0)
         )
        )
        (i64.store offset=520
         (local.get $0)
         (i64.load offset=560 align=4
          (local.get $0)
         )
        )
        (i64.store offset=512
         (local.get $0)
         (i64.load offset=552 align=4
          (local.get $0)
         )
        )
        (i64.store offset=560
         (local.get $0)
         (i64.const 100000)
        )
        (i64.store offset=552
         (local.get $0)
         (i64.const 8192)
        )
        (call $_RNvMs5_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F32Enclosure11from_dyadic
         (i32.add
          (local.get $0)
          (i32.const 496)
         )
         (i32.add
          (local.get $0)
          (i32.const 512)
         )
         (i32.add
          (local.get $0)
          (i32.const 552)
         )
        )
        (br_if $label$58
         (i32.ne
          (i32.load offset=496
           (local.get $0)
          )
          (i32.const 2)
         )
        )
        (br_if $label$58
         (i32.ne
          (i32.and
           (i32.load8_u offset=500
            (local.get $0)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
        (br_if $label$59
         (i32.eq
          (local.get $4)
          (i32.const -2)
         )
        )
        (block $label$62
         (br_if $label$62
          (i32.eq
           (local.tee $1
            (i32.load offset=512
             (local.get $0)
            )
           )
           (i32.const -2)
          )
         )
         (block $label$63
          (br_if $label$63
           (i32.lt_s
            (local.get $1)
            (i32.const 1)
           )
          )
          (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
           (i32.load offset=516
            (local.get $0)
           )
           (i32.shl
            (local.get $1)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (br_if $label$62
          (i32.lt_s
           (local.tee $1
            (i32.load offset=528
             (local.get $0)
            )
           )
           (i32.const 1)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (i32.load offset=532
           (local.get $0)
          )
          (i32.shl
           (local.get $1)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (local.set $4
         (i32.add
          (local.get $4)
          (i32.const 2)
         )
        )
        (br $label$44)
       )
       (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow
        (i32.const 1049744)
       )
       (unreachable)
      )
      (call $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedINtNtB4_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F32EnclosureNtNtB1c_5state13IntervalErrorEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance
       (i32.add
        (local.get $0)
        (i32.const 496)
       )
      )
      (unreachable)
     )
     (local.set $12
      (i32.add
       (local.get $12)
       (i32.const -1)
      )
     )
     (br_if $label$43
      (i32.ne
       (local.tee $3
        (i32.add
         (local.get $3)
         (i32.const 20)
        )
       )
       (i32.const 60)
      )
     )
     (br $label$41)
    )
   )
   (i32.store8 offset=496
    (local.get $0)
    (i32.load8_u offset=556
     (local.get $0)
    )
   )
   (call $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed
    (i32.const 1049688)
    (i32.const 43)
    (i32.add
     (local.get $0)
     (i32.const 496)
    )
    (i32.const 1049672)
    (i32.const 1049744)
   )
   (unreachable)
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 1)
   (i32.const 21)
  )
  (block $label$64
   (block $label$65
    (br_if $label$65
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$64)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 472)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 1)
   (i32.const 21)
  )
  (block $label$66
   (block $label$67
    (br_if $label$67
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$66)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 592)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$68
   (block $label$69
    (br_if $label$69
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$68)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint8additionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3AddmE3add
   (i32.add
    (local.get $0)
    (i32.const 512)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$70
   (block $label$71
    (br_if $label$71
     (i32.eq
      (i32.load offset=552
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=560
       (local.get $0)
      )
     )
    )
    (br $label$70)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=556
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=560
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=552 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 496)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 128)
   (i32.const 0)
  )
  (block $label$72
   (block $label$73
    (br_if $label$73
     (i32.eq
      (i32.load offset=496
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=504
       (local.get $0)
      )
     )
    )
    (br $label$72)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=500
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.load offset=504
    (local.get $0)
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.load offset=496 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=36
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint8additionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3AddmE3add
   (i32.add
    (local.get $0)
    (i32.const 496)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i64.store offset=280
   (local.get $0)
   (i64.load offset=480
    (local.get $0)
   )
  )
  (i64.store offset=272
   (local.get $0)
   (i64.load offset=472
    (local.get $0)
   )
  )
  (i64.store offset=312
   (local.get $0)
   (i64.load offset=592
    (local.get $0)
   )
  )
  (i64.store offset=320
   (local.get $0)
   (i64.load offset=600
    (local.get $0)
   )
  )
  (i64.store offset=352
   (local.get $0)
   (i64.load offset=512
    (local.get $0)
   )
  )
  (i64.store offset=360
   (local.get $0)
   (i64.load offset=520
    (local.get $0)
   )
  )
  (i64.store offset=392
   (local.get $0)
   (i64.load offset=552
    (local.get $0)
   )
  )
  (i64.store offset=400
   (local.get $0)
   (i64.load offset=560
    (local.get $0)
   )
  )
  (local.set $9
   (i32.const 0)
  )
  (i64.store offset=40
   (local.get $0)
   (i64.load offset=1049864
    (i32.const 0)
   )
  )
  (i64.store offset=32
   (local.get $0)
   (i64.load offset=1049856
    (i32.const 0)
   )
  )
  (i64.store offset=424
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i32.store offset=416
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=408
   (local.get $0)
   (i64.const 4607182418800017407)
  )
  (i64.store offset=384
   (local.get $0)
   (i64.const 4607182418800017409)
  )
  (i32.store offset=376
   (local.get $0)
   (i32.const -4096)
  )
  (i64.store offset=368
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i64.store offset=344
   (local.get $0)
   (i64.const 9218868437227405311)
  )
  (i32.store offset=336
   (local.get $0)
   (i32.const 971)
  )
  (i64.store offset=328
   (local.get $0)
   (i64.const 9218868437227405311)
  )
  (i64.store offset=304
   (local.get $0)
   (i64.const 4503599627370496)
  )
  (i32.store offset=296
   (local.get $0)
   (i32.const -1075)
  )
  (i64.store offset=288
   (local.get $0)
   (i64.const 4503599627370495)
  )
  (i64.store offset=264
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=256
   (local.get $0)
   (i32.const -2147483648)
  )
  (i64.store offset=248
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=244
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=240
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=232
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=224
   (local.get $0)
   (i64.const 2)
  )
  (i32.store offset=216
   (local.get $0)
   (i32.const -1075)
  )
  (i64.store offset=208
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=204
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=200
   (local.get $0)
   (i32.const 3)
  )
  (i64.store offset=192
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=184
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=176
   (local.get $0)
   (i32.const -1075)
  )
  (i64.store offset=168
   (local.get $0)
   (i64.const 0)
  )
  (i32.store8 offset=164
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=160
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=152
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=144
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=136
   (local.get $0)
   (i32.const -1074)
  )
  (i64.store offset=128
   (local.get $0)
   (i64.const 1)
  )
  (i32.store8 offset=124
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=120
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=112
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=104
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i32.store offset=96
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=88
   (local.get $0)
   (i64.const 4607182418800017408)
  )
  (i32.store8 offset=84
   (local.get $0)
   (i32.const 2)
  )
  (i32.store offset=80
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=72
   (local.get $0)
   (i64.const 8589934591)
  )
  (i64.store offset=64
   (local.get $0)
   (i64.const 0)
  )
  (i32.store offset=56
   (local.get $0)
   (i32.const 0)
  )
  (i64.store offset=48
   (local.get $0)
   (i64.const 0)
  )
  (i64.store offset=24
   (local.get $0)
   (i64.const 47244640256)
  )
  (i64.store offset=448
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=456
   (local.get $0)
   (i32.const -5170)
  )
  (i64.store offset=464
   (local.get $0)
   (i64.const 2)
  )
  (i64.store offset=440
   (local.get $0)
   (i64.load offset=504
    (local.get $0)
   )
  )
  (i64.store offset=432
   (local.get $0)
   (i64.load offset=496
    (local.get $0)
   )
  )
  (local.set $3
   (i32.sub
    (i32.const 0)
    (local.get $4)
   )
  )
  (local.set $4
   (i32.add
    (local.get $4)
    (i32.const 22)
   )
  )
  (local.set $2
   (i32.const 0)
  )
  (block $label$74
   (loop $label$75
    (i32.store offset=24
     (local.get $0)
     (local.tee $11
      (i32.add
       (local.get $9)
       (i32.const 1)
      )
     )
    )
    (block $label$76
     (br_if $label$76
      (i32.ne
       (local.tee $6
        (i32.load
         (i32.add
          (local.tee $1
           (i32.add
            (i32.add
             (local.get $0)
             (i32.const 24)
            )
            (local.get $2)
           )
          )
          (i32.const 8)
         )
        )
       )
       (i32.const -2)
      )
     )
     (local.set $4
      (i32.sub
       (i32.const 0)
       (local.get $3)
      )
     )
     (br_if $label$74
      (i32.eq
       (local.get $2)
       (i32.const 400)
      )
     )
     (local.set $6
      (i32.sub
       (i32.const 10)
       (local.get $9)
      )
     )
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.const 52)
      )
     )
     (loop $label$77
      (block $label$78
       (br_if $label$78
        (i32.lt_s
         (local.tee $3
          (i32.load
           (i32.add
            (local.get $1)
            (i32.const -4)
           )
          )
         )
         (i32.const 1)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (i32.load
         (local.get $1)
        )
        (i32.shl
         (local.get $3)
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
      (br_if $label$77
       (local.tee $6
        (i32.add
         (local.get $6)
         (i32.const -1)
        )
       )
      )
      (br $label$74)
     )
    )
    (local.set $7
     (i64.load
      (i32.add
       (local.get $1)
       (i32.const 40)
      )
     )
    )
    (local.set $9
     (i32.load
      (i32.add
       (local.get $1)
       (i32.const 32)
      )
     )
    )
    (local.set $8
     (i64.load
      (i32.add
       (local.get $1)
       (i32.const 24)
      )
     )
    )
    (local.set $10
     (i32.load8_u
      (i32.add
       (local.get $1)
       (i32.const 20)
      )
     )
    )
    (local.set $13
     (i32.load
      (i32.add
       (local.get $1)
       (i32.const 12)
      )
     )
    )
    (local.set $18
     (i32.shl
      (local.tee $1
       (i32.load
        (i32.add
         (local.get $1)
         (i32.const 16)
        )
       )
      )
      (i32.const 2)
     )
    )
    (local.set $5
     (i32.const -1)
    )
    (block $label$79
     (block $label$80
      (block $label$81
       (block $label$82
        (block $label$83
         (block $label$84
          (block $label$85
           (block $label$86
            (block $label$87
             (block $label$88
              (block $label$89
               (br_if $label$89
                (i32.ne
                 (local.get $6)
                 (i32.const -1)
                )
               )
               (local.set $14
                (local.get $13)
               )
               (br $label$88)
              )
              (local.set $14
               (local.get $1)
              )
              (block $label$90
               (block $label$91
                (br_table $label$87 $label$91 $label$90
                 (local.get $1)
                )
               )
               (local.set $12
                (i32.load
                 (local.get $13)
                )
               )
               (local.set $14
                (i32.const 1)
               )
               (br $label$87)
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
              (br_if $label$86
               (i32.eqz
                (local.tee $14
                 (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
                  (local.get $18)
                  (i32.const 4)
                 )
                )
               )
              )
              (block $label$92
               (br_if $label$92
                (i32.eqz
                 (local.get $18)
                )
               )
               (memory.copy
                (local.get $14)
                (local.get $13)
                (local.get $18)
               )
              )
              (local.set $5
               (local.get $1)
              )
             )
             (local.set $12
              (local.get $1)
             )
            )
            (i32.store offset=480
             (local.get $0)
             (local.get $12)
            )
            (i32.store offset=476
             (local.get $0)
             (local.get $14)
            )
            (i32.store offset=472
             (local.get $0)
             (local.get $5)
            )
            (i32.store8 offset=484
             (local.get $0)
             (local.get $10)
            )
            (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
             (i32.add
              (local.get $0)
              (i32.const 552)
             )
             (i32.add
              (local.get $0)
              (i32.const 472)
             )
             (local.get $9)
            )
            (br_if $label$85
             (i32.eq
              (i32.load offset=552
               (local.get $0)
              )
              (i32.const -3)
             )
            )
            (i32.store offset=544
             (local.get $0)
             (i32.load offset=584
              (local.get $0)
             )
            )
            (i64.store offset=536
             (local.get $0)
             (i64.load offset=576 align=4
              (local.get $0)
             )
            )
            (i64.store offset=528
             (local.get $0)
             (i64.load offset=568 align=4
              (local.get $0)
             )
            )
            (i64.store offset=520
             (local.get $0)
             (i64.load offset=560 align=4
              (local.get $0)
             )
            )
            (i64.store offset=512
             (local.get $0)
             (i64.load offset=552 align=4
              (local.get $0)
             )
            )
            (i64.store offset=600
             (local.get $0)
             (i64.const 100000)
            )
            (i64.store offset=592
             (local.get $0)
             (i64.const 8192)
            )
            (call $_RNvMsv_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F64Enclosure11from_dyadic
             (i32.add
              (local.get $0)
              (i32.const 552)
             )
             (i32.add
              (local.get $0)
              (i32.const 512)
             )
             (i32.add
              (local.get $0)
              (i32.const 592)
             )
            )
            (br_if $label$84
             (i64.eq
              (local.tee $16
               (i64.load offset=552
                (local.get $0)
               )
              )
              (i64.const 2)
             )
            )
            (br_if $label$83
             (i32.eqz
              (i32.and
               (i32.wrap_i64
                (local.get $16)
               )
               (i32.const 1)
              )
             )
            )
            (local.set $15
             (i64.load offset=568
              (local.get $0)
             )
            )
            (local.set $16
             (i64.load offset=560
              (local.get $0)
             )
            )
            (i64.store offset=600
             (local.get $0)
             (local.get $7)
            )
            (i64.store offset=592
             (local.get $0)
             (local.get $8)
            )
            (i64.store offset=560
             (local.get $0)
             (local.get $15)
            )
            (i64.store offset=552
             (local.get $0)
             (local.get $16)
            )
            (br_if $label$82
             (i64.ne
              (local.get $16)
              (local.get $8)
             )
            )
            (br_if $label$82
             (i64.ne
              (local.get $15)
              (local.get $7)
             )
            )
            (block $label$93
             (br_if $label$93
              (i32.eq
               (local.get $3)
               (i32.const 1)
              )
             )
             (block $label$94
              (br_if $label$94
               (i32.eq
                (local.tee $14
                 (i32.load offset=512
                  (local.get $0)
                 )
                )
                (i32.const -2)
               )
              )
              (block $label$95
               (br_if $label$95
                (i32.lt_s
                 (local.get $14)
                 (i32.const 1)
                )
               )
               (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
                (i32.load offset=516
                 (local.get $0)
                )
                (i32.shl
                 (local.get $14)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (br_if $label$94
               (i32.lt_s
                (local.tee $14
                 (i32.load offset=528
                  (local.get $0)
                 )
                )
                (i32.const 1)
               )
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
               (i32.load offset=532
                (local.get $0)
               )
               (i32.shl
                (local.get $14)
                (i32.const 2)
               )
               (i32.const 4)
              )
             )
             (local.set $12
              (i32.const -1)
             )
             (block $label$96
              (block $label$97
               (br_if $label$97
                (i32.ne
                 (local.get $6)
                 (i32.const -1)
                )
               )
               (local.set $14
                (local.get $13)
               )
               (br $label$96)
              )
              (local.set $14
               (local.get $1)
              )
              (block $label$98
               (block $label$99
                (br_table $label$96 $label$99 $label$98
                 (local.get $1)
                )
               )
               (local.set $1
                (i32.load
                 (local.get $13)
                )
               )
               (local.set $14
                (i32.const 1)
               )
               (br $label$96)
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
              (br_if $label$81
               (i32.eqz
                (local.tee $14
                 (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
                  (local.get $18)
                  (i32.const 4)
                 )
                )
               )
              )
              (block $label$100
               (br_if $label$100
                (i32.eqz
                 (local.get $18)
                )
               )
               (memory.copy
                (local.get $14)
                (local.get $13)
                (local.get $18)
               )
              )
              (local.set $12
               (local.get $1)
              )
             )
             (i32.store8 offset=484
              (local.get $0)
              (i32.sub
               (i32.const 2)
               (local.get $10)
              )
             )
             (i32.store offset=480
              (local.get $0)
              (local.get $1)
             )
             (i32.store offset=476
              (local.get $0)
              (local.get $14)
             )
             (i32.store offset=472
              (local.get $0)
              (local.get $12)
             )
             (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
              (i32.add
               (local.get $0)
               (i32.const 552)
              )
              (i32.add
               (local.get $0)
               (i32.const 472)
              )
              (local.get $9)
             )
             (br_if $label$85
              (i32.eq
               (i32.load offset=552
                (local.get $0)
               )
               (i32.const -3)
              )
             )
             (i32.store offset=544
              (local.get $0)
              (i32.load offset=584
               (local.get $0)
              )
             )
             (i64.store offset=536
              (local.get $0)
              (i64.load offset=576 align=4
               (local.get $0)
              )
             )
             (i64.store offset=528
              (local.get $0)
              (i64.load offset=568 align=4
               (local.get $0)
              )
             )
             (i64.store offset=520
              (local.get $0)
              (i64.load offset=560 align=4
               (local.get $0)
              )
             )
             (i64.store offset=512
              (local.get $0)
              (i64.load offset=552 align=4
               (local.get $0)
              )
             )
             (i64.store offset=600
              (local.get $0)
              (i64.const 100000)
             )
             (i64.store offset=592
              (local.get $0)
              (i64.const 8192)
             )
             (call $_RNvMsv_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F64Enclosure11from_dyadic
              (i32.add
               (local.get $0)
               (i32.const 552)
              )
              (i32.add
               (local.get $0)
               (i32.const 512)
              )
              (i32.add
               (local.get $0)
               (i32.const 592)
              )
             )
             (br_if $label$84
              (i64.eq
               (local.tee $16
                (i64.load offset=552
                 (local.get $0)
                )
               )
               (i64.const 2)
              )
             )
             (br_if $label$83
              (i64.ne
               (local.get $16)
               (i64.const 1)
              )
             )
             (local.set $15
              (i64.load offset=568
               (local.get $0)
              )
             )
             (local.set $16
              (i64.load offset=560
               (local.get $0)
              )
             )
             (i64.store offset=600
              (local.get $0)
              (local.tee $17
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
             (i64.store offset=592
              (local.get $0)
              (local.tee $8
               (select
                (i64.const 0)
                (i64.or
                 (local.get $7)
                 (i64.const -9223372036854775808)
                )
                (i64.eqz
                 (local.get $7)
                )
               )
              )
             )
             (i64.store offset=560
              (local.get $0)
              (local.get $15)
             )
             (i64.store offset=552
              (local.get $0)
              (local.get $16)
             )
             (br_if $label$82
              (i64.ne
               (local.get $16)
               (local.get $8)
              )
             )
             (br_if $label$82
              (i64.ne
               (local.get $15)
               (local.get $17)
              )
             )
             (br_if $label$93
              (i32.eq
               (local.get $3)
               (i32.const 2)
              )
             )
             (block $label$101
              (br_if $label$101
               (i32.eq
                (local.tee $1
                 (i32.load offset=512
                  (local.get $0)
                 )
                )
                (i32.const -2)
               )
              )
              (block $label$102
               (br_if $label$102
                (i32.lt_s
                 (local.get $1)
                 (i32.const 1)
                )
               )
               (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
                (i32.load offset=516
                 (local.get $0)
                )
                (i32.shl
                 (local.get $1)
                 (i32.const 2)
                )
                (i32.const 4)
               )
              )
              (br_if $label$101
               (i32.lt_s
                (local.tee $1
                 (i32.load offset=528
                  (local.get $0)
                 )
                )
                (i32.const 1)
               )
              )
              (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
               (i32.load offset=532
                (local.get $0)
               )
               (i32.shl
                (local.get $1)
                (i32.const 2)
               )
               (i32.const 4)
              )
             )
             (br_if $label$80
              (i32.lt_u
               (i32.add
                (local.get $6)
                (i32.const -1)
               )
               (i32.const -2)
              )
             )
             (br $label$79)
            )
            (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow
             (i32.const 1049656)
            )
            (unreachable)
           )
           (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
            (i32.const 4)
            (local.get $18)
           )
           (unreachable)
          )
          (i32.store8 offset=592
           (local.get $0)
           (i32.load8_u offset=556
            (local.get $0)
           )
          )
          (call $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed
           (i32.const 1049688)
           (i32.const 43)
           (i32.add
            (local.get $0)
            (i32.const 592)
           )
           (i32.const 1049672)
           (i32.const 1049656)
          )
          (unreachable)
         )
         (i32.store8 offset=492
          (local.get $0)
          (i32.load8_u offset=560
           (local.get $0)
          )
         )
         (call $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed
          (i32.const 1049688)
          (i32.const 43)
          (i32.add
           (local.get $0)
           (i32.const 492)
          )
          (i32.const 1049672)
          (i32.const 1049656)
         )
         (unreachable)
        )
        (call $_RNvNtCs8hZryZq3oeI_4core6option13unwrap_failed
         (i32.const 1049656)
        )
        (unreachable)
       )
       (call $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedTyyEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance
        (i32.add
         (local.get $0)
         (i32.const 552)
        )
        (i32.add
         (local.get $0)
         (i32.const 592)
        )
        (i32.const 1049656)
       )
       (unreachable)
      )
      (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
       (i32.const 4)
       (local.get $18)
      )
      (unreachable)
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
      (local.get $13)
      (i32.shl
       (local.get $6)
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
    (local.set $9
     (local.get $11)
    )
    (br_if $label$75
     (i32.ne
      (local.tee $2
       (i32.add
        (local.get $2)
        (i32.const 40)
       )
      )
      (i32.const 440)
     )
    )
   )
  )
  (i32.store offset=32
   (local.get $0)
   (i32.const 1)
  )
  (i64.store offset=24 align=4
   (local.get $0)
   (i64.const 8589934591)
  )
  (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2
   (i32.add
    (local.get $0)
    (i32.const 512)
   )
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
   (i32.const 1)
   (i32.const 22)
  )
  (block $label$103
   (block $label$104
    (br_if $label$104
     (i32.eq
      (i32.load offset=512
       (local.get $0)
      )
      (i32.const -1)
     )
    )
    (local.set $1
     (i32.eqz
      (i32.load offset=520
       (local.get $0)
      )
     )
    )
    (br $label$103)
   )
   (local.set $1
    (i32.xor
     (i32.load offset=516
      (local.get $0)
     )
     (i32.const 1)
    )
   )
  )
  (i32.store offset=560
   (local.get $0)
   (i32.load offset=520
    (local.get $0)
   )
  )
  (i64.store offset=552
   (local.get $0)
   (i64.load offset=512 align=4
    (local.get $0)
   )
  )
  (i32.store8 offset=564
   (local.get $0)
   (select
    (i32.const 1)
    (i32.const 2)
    (local.get $1)
   )
  )
  (call $_RNvXs3_NtNtCsbodFP5rPXOh_10num_bigint6bigint11subtractionNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops5arith3SubmE3sub
   (i32.add
    (local.get $0)
    (i32.const 72)
   )
   (i32.add
    (local.get $0)
    (i32.const 552)
   )
  )
  (i32.store offset=88
   (local.get $0)
   (i32.const 970)
  )
  (i32.store offset=68
   (local.get $0)
   (i32.const 1024)
  )
  (i32.store8 offset=64
   (local.get $0)
   (i32.const 2)
  )
  (i64.store offset=56 align=4
   (local.get $0)
   (i64.const 4294967297)
  )
  (i64.store offset=48 align=4
   (local.get $0)
   (i64.const -2147483649)
  )
  (i32.store8 offset=44
   (local.get $0)
   (i32.const 2)
  )
  (i64.store offset=36 align=4
   (local.get $0)
   (i64.const 4294967297)
  )
  (i64.store offset=28 align=4
   (local.get $0)
   (i64.const -4294967293)
  )
  (local.set $11
   (i32.add
    (local.get $0)
    (i32.const 509)
   )
  )
  (local.set $3
   (i32.const 0)
  )
  (local.set $12
   (i32.const -1)
  )
  (block $label$105
   (block $label$106
    (loop $label$107
     (local.set $2
      (i32.add
       (local.tee $1
        (i32.add
         (i32.add
          (local.get $0)
          (i32.const 24)
         )
         (local.get $3)
        )
       )
       (i32.const 21)
      )
     )
     (local.set $9
      (i32.load
       (i32.add
        (local.get $1)
        (i32.const 24)
       )
      )
     )
     (local.set $10
      (i32.load8_u
       (i32.add
        (local.get $1)
        (i32.const 20)
       )
      )
     )
     (local.set $6
      (i32.load
       (i32.add
        (local.get $1)
        (i32.const 16)
       )
      )
     )
     (local.set $13
      (i32.load
       (i32.add
        (local.get $1)
        (i32.const 12)
       )
      )
     )
     (block $label$108
      (block $label$109
       (block $label$110
        (block $label$111
         (block $label$112
          (block $label$113
           (block $label$114
            (block $label$115
             (block $label$116
              (br_table $label$116 $label$114 $label$115
               (i32.add
                (local.tee $5
                 (i32.load
                  (i32.add
                   (local.get $1)
                   (i32.const 8)
                  )
                 )
                )
                (i32.const 2)
               )
              )
             )
             (i32.store offset=24
              (local.get $0)
              (i32.sub
               (i32.const 0)
               (local.get $12)
              )
             )
             (br_if $label$106
              (i32.eq
               (local.get $3)
               (i32.const 40)
              )
             )
             (local.set $6
              (i32.add
               (local.get $12)
               (i32.const 3)
              )
             )
             (local.set $1
              (i32.add
               (local.get $1)
               (i32.const 32)
              )
             )
             (loop $label$117
              (block $label$118
               (br_if $label$118
                (i32.lt_s
                 (local.tee $3
                  (i32.load
                   (i32.add
                    (local.get $1)
                    (i32.const -4)
                   )
                  )
                 )
                 (i32.const 1)
                )
               )
               (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
                (i32.load
                 (local.get $1)
                )
                (i32.shl
                 (local.get $3)
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
              (br_if $label$117
               (local.tee $6
                (i32.add
                 (local.get $6)
                 (i32.const -1)
                )
               )
              )
              (br $label$106)
             )
            )
            (local.set $1
             (local.get $6)
            )
            (block $label$119
             (block $label$120
              (br_table $label$113 $label$120 $label$119
               (local.get $6)
              )
             )
             (local.set $14
              (i32.load
               (local.get $13)
              )
             )
             (local.set $1
              (i32.const 1)
             )
             (br $label$113)
            )
            (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
            (br_if $label$112
             (local.tee $1
              (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
               (local.tee $14
                (i32.shl
                 (local.get $6)
                 (i32.const 2)
                )
               )
               (i32.const 4)
              )
             )
            )
            (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
             (i32.const 4)
             (local.get $14)
            )
            (unreachable)
           )
           (local.set $1
            (local.get $13)
           )
           (local.set $14
            (local.get $6)
           )
          )
          (i32.store8 offset=494
           (local.get $0)
           (i32.load8_u offset=2
            (local.get $2)
           )
          )
          (i32.store16 offset=492
           (local.get $0)
           (i32.load16_u align=1
            (local.get $2)
           )
          )
          (local.set $2
           (i32.const -1)
          )
          (br $label$111)
         )
         (block $label$121
          (br_if $label$121
           (i32.eqz
            (local.get $14)
           )
          )
          (memory.copy
           (local.get $1)
           (local.get $13)
           (local.get $14)
          )
         )
         (i32.store8 offset=494
          (local.get $0)
          (i32.load8_u offset=2
           (local.get $2)
          )
         )
         (i32.store16 offset=492
          (local.get $0)
          (i32.load16_u align=1
           (local.get $2)
          )
         )
         (local.set $14
          (local.get $6)
         )
         (local.set $2
          (local.get $6)
         )
         (br_if $label$110
          (i32.eq
           (local.get $6)
           (i32.const -2)
          )
         )
        )
        (i32.store offset=504
         (local.get $0)
         (local.get $14)
        )
        (i32.store offset=500
         (local.get $0)
         (local.get $1)
        )
        (i32.store offset=496
         (local.get $0)
         (local.get $2)
        )
        (i32.store8 offset=508
         (local.get $0)
         (local.get $10)
        )
        (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
         (i32.add
          (local.get $0)
          (i32.const 552)
         )
         (i32.add
          (local.get $0)
          (i32.const 496)
         )
         (local.get $9)
        )
        (br_if $label$109
         (i32.ne
          (i32.load offset=552
           (local.get $0)
          )
          (i32.const -3)
         )
        )
        (br $label$105)
       )
       (br_if $label$108
        (i32.lt_s
         (local.get $5)
         (i32.const 1)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (local.get $13)
        (i32.shl
         (local.get $5)
         (i32.const 2)
        )
        (i32.const 4)
       )
       (br $label$108)
      )
      (i32.store offset=544
       (local.get $0)
       (i32.load offset=584
        (local.get $0)
       )
      )
      (i64.store offset=536
       (local.get $0)
       (i64.load offset=576 align=4
        (local.get $0)
       )
      )
      (i64.store offset=528
       (local.get $0)
       (i64.load offset=568 align=4
        (local.get $0)
       )
      )
      (i64.store offset=520
       (local.get $0)
       (i64.load offset=560 align=4
        (local.get $0)
       )
      )
      (i64.store offset=512
       (local.get $0)
       (i64.load offset=552 align=4
        (local.get $0)
       )
      )
      (i64.store offset=600
       (local.get $0)
       (i64.const 100000)
      )
      (i64.store offset=592
       (local.get $0)
       (i64.const 8192)
      )
      (call $_RNvMsv_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F64Enclosure11from_dyadic
       (i32.add
        (local.get $0)
        (i32.const 552)
       )
       (i32.add
        (local.get $0)
        (i32.const 512)
       )
       (i32.add
        (local.get $0)
        (i32.const 592)
       )
      )
      (block $label$122
       (br_if $label$122
        (i64.ne
         (i64.load offset=552
          (local.get $0)
         )
         (i64.const 2)
        )
       )
       (br_if $label$122
        (i32.ne
         (i32.and
          (i32.load8_u offset=560
           (local.get $0)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
       (block $label$123
        (br_if $label$123
         (i32.eq
          (local.get $4)
          (i32.const -1)
         )
        )
        (local.set $1
         (i32.sub
          (i32.const 2)
          (local.get $10)
         )
        )
        (block $label$124
         (br_if $label$124
          (i32.eq
           (local.tee $2
            (i32.load offset=512
             (local.get $0)
            )
           )
           (i32.const -2)
          )
         )
         (block $label$125
          (br_if $label$125
           (i32.lt_s
            (local.get $2)
            (i32.const 1)
           )
          )
          (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
           (i32.load offset=516
            (local.get $0)
           )
           (i32.shl
            (local.get $2)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (br_if $label$124
          (i32.lt_s
           (local.tee $2
            (i32.load offset=528
             (local.get $0)
            )
           )
           (i32.const 1)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (i32.load offset=532
           (local.get $0)
          )
          (i32.shl
           (local.get $2)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (i32.store16 align=1
         (local.get $11)
         (i32.load16_u offset=492
          (local.get $0)
         )
        )
        (i32.store8 offset=2
         (local.get $11)
         (i32.load8_u offset=494
          (local.get $0)
         )
        )
        (i32.store8 offset=508
         (local.get $0)
         (local.get $1)
        )
        (i32.store offset=504
         (local.get $0)
         (local.get $6)
        )
        (i32.store offset=500
         (local.get $0)
         (local.get $13)
        )
        (i32.store offset=496
         (local.get $0)
         (local.get $5)
        )
        (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point
         (i32.add
          (local.get $0)
          (i32.const 552)
         )
         (i32.add
          (local.get $0)
          (i32.const 496)
         )
         (local.get $9)
        )
        (br_if $label$105
         (i32.eq
          (i32.load offset=552
           (local.get $0)
          )
          (i32.const -3)
         )
        )
        (i32.store offset=544
         (local.get $0)
         (i32.load offset=584
          (local.get $0)
         )
        )
        (i64.store offset=536
         (local.get $0)
         (i64.load offset=576 align=4
          (local.get $0)
         )
        )
        (i64.store offset=528
         (local.get $0)
         (i64.load offset=568 align=4
          (local.get $0)
         )
        )
        (i64.store offset=520
         (local.get $0)
         (i64.load offset=560 align=4
          (local.get $0)
         )
        )
        (i64.store offset=512
         (local.get $0)
         (i64.load offset=552 align=4
          (local.get $0)
         )
        )
        (i64.store offset=600
         (local.get $0)
         (i64.const 100000)
        )
        (i64.store offset=592
         (local.get $0)
         (i64.const 8192)
        )
        (call $_RNvMsv_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F64Enclosure11from_dyadic
         (i32.add
          (local.get $0)
          (i32.const 552)
         )
         (i32.add
          (local.get $0)
          (i32.const 512)
         )
         (i32.add
          (local.get $0)
          (i32.const 592)
         )
        )
        (br_if $label$122
         (i64.ne
          (i64.load offset=552
           (local.get $0)
          )
          (i64.const 2)
         )
        )
        (br_if $label$122
         (i32.ne
          (i32.and
           (i32.load8_u offset=560
            (local.get $0)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
        (br_if $label$123
         (i32.eq
          (local.get $4)
          (i32.const -2)
         )
        )
        (block $label$126
         (br_if $label$126
          (i32.eq
           (local.tee $1
            (i32.load offset=512
             (local.get $0)
            )
           )
           (i32.const -2)
          )
         )
         (block $label$127
          (br_if $label$127
           (i32.lt_s
            (local.get $1)
            (i32.const 1)
           )
          )
          (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
           (i32.load offset=516
            (local.get $0)
           )
           (i32.shl
            (local.get $1)
            (i32.const 2)
           )
           (i32.const 4)
          )
         )
         (br_if $label$126
          (i32.lt_s
           (local.tee $1
            (i32.load offset=528
             (local.get $0)
            )
           )
           (i32.const 1)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (i32.load offset=532
           (local.get $0)
          )
          (i32.shl
           (local.get $1)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (local.set $4
         (i32.add
          (local.get $4)
          (i32.const 2)
         )
        )
        (br $label$108)
       )
       (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow
        (i32.const 1049656)
       )
       (unreachable)
      )
      (call $_RINvNtCs8hZryZq3oeI_4core9panicking13assert_failedINtNtB4_6result6ResultNtNtCskObGt8PTDSq_13hyperinterval5float12F64EnclosureNtNtB1c_5state13IntervalErrorEBM_ECsk3zFpI5xiw6_32interval_dyadic_wasm_conformance
       (i32.add
        (local.get $0)
        (i32.const 552)
       )
      )
      (unreachable)
     )
     (local.set $12
      (i32.add
       (local.get $12)
       (i32.const -1)
      )
     )
     (br_if $label$107
      (i32.ne
       (local.tee $3
        (i32.add
         (local.get $3)
         (i32.const 20)
        )
       )
       (i32.const 60)
      )
     )
    )
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $0)
     (i32.const 608)
    )
   )
   (return
    (local.get $4)
   )
  )
  (i32.store8 offset=592
   (local.get $0)
   (i32.load8_u offset=556
    (local.get $0)
   )
  )
  (call $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed
   (i32.const 1049688)
   (i32.const 43)
   (i32.add
    (local.get $0)
    (i32.const 592)
   )
   (i32.const 1049672)
   (i32.const 1049656)
  )
  (unreachable)
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc (param $0 i32) (param $1 i32) (result i32)
  (return
   (call $_RNvCsdtSMxSA38aw_7___rustc11___rdl_alloc
    (local.get $0)
    (local.get $1)
   )
  )
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_RNvCsdtSMxSA38aw_7___rustc13___rdl_dealloc
   (local.get $0)
   (local.get $1)
   (local.get $2)
  )
  (return)
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc14___rust_realloc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (return
   (call $_RNvCsdtSMxSA38aw_7___rustc13___rdl_realloc
    (local.get $0)
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
  )
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2
  (return)
 )
 (func $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval3new (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 128)
    )
   )
  )
  (call $_RNvMNtCskObGt8PTDSq_13hyperinterval6boundsINtB2_6BoundsNtNtCsbodFP5rPXOh_10num_bigint6bigint6BigIntE3newB4_
   (i32.add
    (local.get $4)
    (i32.const 32)
   )
   (local.get $1)
   (local.get $2)
  )
  (local.set $1
   (i32.load8_u offset=36
    (local.get $4)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (local.tee $2
       (i32.load offset=32
        (local.get $4)
       )
      )
      (i32.const -2)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const -3)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (i32.store offset=119 align=1
    (local.get $4)
    (i32.load offset=60 align=1
     (local.get $4)
    )
   )
   (i64.store offset=112
    (local.get $4)
    (i64.load offset=53 align=1
     (local.get $4)
    )
   )
   (i64.store offset=104
    (local.get $4)
    (i64.load offset=45 align=1
     (local.get $4)
    )
   )
   (i64.store offset=96
    (local.get $4)
    (local.tee $5
     (i64.load offset=37 align=1
      (local.get $4)
     )
    )
   )
   (i64.store offset=24
    (local.get $4)
    (i64.load offset=115 align=1
     (local.get $4)
    )
   )
   (i64.store offset=16
    (local.get $4)
    (i64.load offset=107 align=1
     (local.get $4)
    )
   )
   (i32.store offset=12 align=1
    (local.get $4)
    (i32.load offset=103 align=1
     (local.get $4)
    )
   )
   (i64.store offset=5 align=1
    (local.get $4)
    (local.get $5)
   )
   (i32.store8 offset=4
    (local.get $4)
    (local.get $1)
   )
   (i32.store
    (local.get $4)
    (local.get $2)
   )
   (block $label$3
    (block $label$4
     (block $label$5
      (br_if $label$5
       (i32.ne
        (i32.load8_u offset=12
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (br_if $label$4
       (i32.eq
        (i32.and
         (i32.load8_u offset=28
          (local.get $4)
         )
         (i32.const 255)
        )
        (i32.const 1)
       )
      )
     )
     (call $_RNvMso_NtCsbodFP5rPXOh_10num_bigint6bigintNtB5_6BigInt14trailing_zeros
      (i32.add
       (local.get $4)
       (i32.const 32)
      )
      (local.get $4)
     )
     (local.set $2
      (i32.load offset=32
       (local.get $4)
      )
     )
     (local.set $5
      (i64.load offset=40
       (local.get $4)
      )
     )
     (call $_RNvMso_NtCsbodFP5rPXOh_10num_bigint6bigintNtB5_6BigInt14trailing_zeros
      (i32.add
       (local.get $4)
       (i32.const 32)
      )
      (i32.add
       (local.get $4)
       (i32.const 16)
      )
     )
     (call $_RNvXsx_NtNtCsbodFP5rPXOh_10num_bigint6bigint5shiftNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops3bit9ShrAssignjE10shr_assign
      (local.get $4)
      (local.tee $2
       (i32.wrap_i64
        (select
         (local.tee $6
          (i64.sub
           (i64.const 2147483647)
           (i64.extend_i32_s
            (local.get $3)
           )
          )
         )
         (local.tee $5
          (select
           (select
            (local.tee $7
             (i64.load offset=40
              (local.get $4)
             )
            )
            (local.tee $5
             (select
              (local.get $5)
              (i64.const -1)
              (local.get $2)
             )
            )
            (i64.lt_u
             (local.get $7)
             (local.get $5)
            )
           )
           (local.get $5)
           (i32.load offset=32
            (local.get $4)
           )
          )
         )
         (i64.lt_u
          (local.get $6)
          (local.get $5)
         )
        )
       )
      )
     )
     (call $_RNvXsx_NtNtCsbodFP5rPXOh_10num_bigint6bigint5shiftNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops3bit9ShrAssignjE10shr_assign
      (i32.add
       (local.get $4)
       (i32.const 16)
      )
      (local.get $2)
     )
     (i64.store offset=72
      (local.get $4)
      (i64.load offset=8 align=4
       (local.get $4)
      )
     )
     (i64.store offset=64
      (local.get $4)
      (i64.load align=4
       (local.get $4)
      )
     )
     (i64.store offset=88
      (local.get $4)
      (i64.load offset=24
       (local.get $4)
      )
     )
     (i64.store offset=80
      (local.get $4)
      (i64.load offset=16
       (local.get $4)
      )
     )
     (call $_RNvMNtCskObGt8PTDSq_13hyperinterval6boundsINtB2_6BoundsNtNtCsbodFP5rPXOh_10num_bigint6bigint6BigIntE3newB4_
      (i32.add
       (local.get $4)
       (i32.const 32)
      )
      (i32.add
       (local.get $4)
       (i32.const 64)
      )
      (i32.add
       (local.get $4)
       (i32.const 80)
      )
     )
     (local.set $1
      (i32.load8_u offset=36
       (local.get $4)
      )
     )
     (br_if $label$3
      (i32.ne
       (local.tee $8
        (i32.load offset=32
         (local.get $4)
        )
       )
       (i32.const -2)
      )
     )
     (i32.store
      (local.get $0)
      (i32.const -3)
     )
     (i32.store8 offset=4
      (local.get $0)
      (local.get $1)
     )
     (br $label$1)
    )
    (i32.store8 offset=12
     (local.get $0)
     (i32.const 1)
    )
    (i32.store offset=32
     (local.get $0)
     (i32.const 0)
    )
    (i32.store offset=8
     (local.get $0)
     (i32.load offset=1050356
      (i32.const 0)
     )
    )
    (i64.store align=4
     (local.get $0)
     (local.tee $5
      (i64.load offset=1050348 align=4
       (i32.const 0)
      )
     )
    )
    (i64.store offset=16 align=4
     (local.get $0)
     (local.get $5)
    )
    (i64.store offset=24 align=4
     (local.get $0)
     (i64.load offset=1050356 align=4
      (i32.const 0)
     )
    )
    (block $label$6
     (br_if $label$6
      (i32.eq
       (local.tee $0
        (i32.load offset=16
         (local.get $4)
        )
       )
       (i32.const -1)
      )
     )
     (br_if $label$6
      (i32.eqz
       (local.get $0)
      )
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
      (i32.load offset=20
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
      (local.get $2)
      (i32.const -1)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $2)
     )
    )
    (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
     (i32.load offset=4
      (local.get $4)
     )
     (i32.shl
      (local.get $2)
      (i32.const 2)
     )
     (i32.const 4)
    )
    (br $label$1)
   )
   (i32.store offset=28 align=1
    (local.get $0)
    (i32.load offset=60 align=1
     (local.get $4)
    )
   )
   (i64.store offset=21 align=1
    (local.get $0)
    (i64.load offset=53 align=1
     (local.get $4)
    )
   )
   (i64.store offset=13 align=1
    (local.get $0)
    (i64.load offset=45 align=1
     (local.get $4)
    )
   )
   (i64.store offset=5 align=1
    (local.get $0)
    (i64.load offset=37 align=1
     (local.get $4)
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
    (local.get $8)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 128)
   )
  )
 )
 (func $_RNvXsx_NtNtCsbodFP5rPXOh_10num_bigint6bigint5shiftNtB7_6BigIntINtNtNtCs8hZryZq3oeI_4core3ops3bit9ShrAssignjE10shr_assign (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
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
      (call $_RNvMso_NtCsbodFP5rPXOh_10num_bigint6bigintNtB5_6BigInt14trailing_zeros
       (i32.add
        (local.get $2)
        (i32.const 16)
       )
       (local.get $0)
      )
      (br_if $label$3
       (i64.ne
        (i64.load offset=16
         (local.get $2)
        )
        (i64.const 1)
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
      (i32.load offset=4
       (local.get $0)
      )
     )
     (local.set $5
      (i32.load
       (local.get $0)
      )
     )
     (i64.store align=4
      (local.get $0)
      (i64.load offset=1050336 align=4
       (i32.const 0)
      )
     )
     (local.set $6
      (i32.load offset=8
       (local.get $0)
      )
     )
     (i32.store offset=8
      (local.get $0)
      (i32.load offset=1050344
       (i32.const 0)
      )
     )
     (block $label$5
      (block $label$6
       (block $label$7
        (block $label$8
         (br_table $label$8 $label$7 $label$6
          (i32.add
           (local.get $5)
           (i32.const 2)
          )
         )
        )
        (block $label$9
         (block $label$10
          (br_if $label$10
           (i32.eq
            (i32.load
             (local.get $4)
            )
            (i32.const -1)
           )
          )
          (br_if $label$5
           (i32.load offset=8
            (local.get $4)
           )
          )
          (br $label$9)
         )
         (br_if $label$5
          (i32.load offset=4
           (local.get $4)
          )
         )
         (local.set $4
          (i32.load offset=8
           (local.get $4)
          )
         )
        )
        (i32.store offset=12
         (local.get $2)
         (local.get $4)
        )
        (i64.store offset=4 align=4
         (local.get $2)
         (i64.const 4294967295)
        )
        (br $label$1)
       )
       (br_if $label$5
        (i32.and
         (local.get $4)
         (i32.const 1)
        )
       )
       (br $label$2)
      )
      (br_if $label$2
       (i32.eqz
        (local.get $6)
       )
      )
     )
     (i32.store offset=24
      (local.get $2)
      (local.get $6)
     )
     (i32.store offset=20
      (local.get $2)
      (local.get $4)
     )
     (i32.store offset=16
      (local.get $2)
      (local.get $5)
     )
     (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shr2
      (i32.add
       (local.get $2)
       (i32.const 4)
      )
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
       (local.tee $4
        (i32.load
         (local.get $0)
        )
       )
       (i32.const -1)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.get $4)
      )
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
      (i32.load offset=4
       (local.get $0)
      )
      (i32.shl
       (local.get $4)
       (i32.const 2)
      )
      (i32.const 4)
     )
     (br $label$1)
    )
    (call $_RNvNtCs8hZryZq3oeI_4core6option13expect_failed
     (i32.const 1050364)
     (i32.const 28)
     (i32.const 1050392)
    )
    (unreachable)
   )
   (i32.store offset=12
    (local.get $2)
    (local.get $6)
   )
   (i32.store offset=8
    (local.get $2)
    (local.get $4)
   )
   (i32.store offset=4
    (local.get $2)
    (local.get $5)
   )
  )
  (i32.store offset=8
   (local.get $0)
   (i32.load offset=12
    (local.get $2)
   )
  )
  (i64.store align=4
   (local.get $0)
   (i64.load offset=4 align=4
    (local.get $2)
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
        (i32.const -1)
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
   (call $_RNvXs1_NtNtCsbodFP5rPXOh_10num_bigint7biguint8additionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9AddAssignmE10add_assign_32
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
 (func $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval5point (param $0 i32) (param $1 i32) (param $2 i32)
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
   (i32.const -1)
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
        (i32.const -1)
       )
      )
      (local.set $7
       (i32.load offset=4
        (local.get $1)
       )
      )
      (block $label$5
       (block $label$6
        (br_table $label$1 $label$6 $label$5
         (local.get $5)
        )
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
      (br_if $label$3
       (i32.gt_u
        (local.get $5)
        (i32.const 1073741823)
       )
      )
      (br_if $label$3
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
       (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
       (local.set $4
        (i32.const 4)
       )
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
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
      (br_if $label$2
       (i32.eqz
        (local.get $8)
       )
      )
      (memory.copy
       (local.get $9)
       (local.get $7)
       (local.get $8)
      )
      (br $label$2)
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
    (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
     (local.get $4)
     (local.get $8)
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
  (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval6dyadicNtB4_14DyadicInterval3new
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
 (func $_RNvXs1_NtNtCsbodFP5rPXOh_10num_bigint7biguint8additionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9AddAssignmE10add_assign_32 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eq
       (local.tee $1
        (i32.load
         (local.get $0)
        )
       )
       (i32.const -1)
      )
     )
     (br_if $label$2
      (local.tee $2
       (i32.load offset=8
        (local.get $0)
       )
      )
     )
     (block $label$4
      (br_if $label$4
       (local.get $1)
      )
      (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
       (local.get $0)
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
    (block $label$5
     (br_if $label$5
      (i32.eqz
       (i32.load offset=4
        (local.get $0)
       )
      )
     )
     (local.set $1
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
     )
     (local.set $2
      (i32.const 1)
     )
     (br $label$1)
    )
    (i64.store offset=4 align=4
     (local.get $0)
     (i64.const 4294967297)
    )
    (return)
   )
   (local.set $1
    (i32.load offset=4
     (local.get $0)
    )
   )
  )
  (i32.store
   (local.get $1)
   (local.tee $3
    (i32.add
     (i32.load
      (local.get $1)
     )
     (i32.const 1)
    )
   )
  )
  (block $label$6
   (block $label$7
    (block $label$8
     (br_if $label$8
      (local.get $3)
     )
     (block $label$9
      (br_if $label$9
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
      (loop $label$10
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
       (br_if $label$8
        (local.get $2)
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (br_if $label$10
        (local.tee $3
         (i32.add
          (local.get $3)
          (i32.const -4)
         )
        )
       )
      )
     )
     (block $label$11
      (br_if $label$11
       (i32.eq
        (local.tee $2
         (i32.load
          (local.get $0)
         )
        )
        (i32.const -1)
       )
      )
      (block $label$12
       (br_if $label$12
        (i32.ne
         (local.tee $1
          (i32.load offset=8
           (local.get $0)
          )
         )
         (local.get $2)
        )
       )
       (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
        (local.get $0)
       )
      )
      (i32.store
       (i32.add
        (i32.load offset=4
         (local.get $0)
        )
        (i32.shl
         (local.get $1)
         (i32.const 2)
        )
       )
       (i32.const 1)
      )
      (i32.store offset=8
       (local.get $0)
       (i32.add
        (local.get $1)
        (i32.const 1)
       )
      )
      (return)
     )
     (br_if $label$7
      (i32.ne
       (i32.load offset=4
        (local.get $0)
       )
       (i32.const 1)
      )
     )
     (local.set $2
      (i32.load offset=8
       (local.get $0)
      )
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
     (br_if $label$6
      (i32.eqz
       (local.tee $1
        (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
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
    )
    (return)
   )
   (i64.store offset=4 align=4
    (local.get $0)
    (i64.const 4294967297)
   )
   (return)
  )
  (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
   (i32.const 4)
   (i32.const 8)
  )
  (unreachable)
 )
 (func $_RNvMs5_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F32Enclosure11from_dyadic (param $0 i32) (param $1 i32) (param $2 i32)
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
       (i32.const -2)
      )
     )
     (call $_RNvMNtNtCskObGt8PTDSq_13hyperinterval4ieee6dyadicNtB4_6Format14enclose_dyadic
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
   (call $_RNvMNtNtCskObGt8PTDSq_13hyperinterval4ieee6dyadicNtB4_6Format14enclose_dyadic
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
   (call $_RNvMNtCskObGt8PTDSq_13hyperinterval4ieeeNtB2_6Format6finite
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
    (i64.load32_u offset=16
     (local.get $3)
    )
   )
   (call $_RNvMNtCskObGt8PTDSq_13hyperinterval4ieeeNtB2_6Format6finite
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
      (i64.add
       (select
        (i64.sub
         (i64.const 0)
         (i64.and
          (local.get $5)
          (i64.const 2147483647)
         )
        )
        (local.get $5)
        (i32.lt_s
         (local.tee $1
          (i32.wrap_i64
           (local.get $5)
          )
         )
         (i32.const 0)
        )
       )
       (i64.const 2147483648)
      )
      (i64.add
       (select
        (i64.sub
         (i64.const 0)
         (i64.and
          (local.tee $5
           (i64.load offset=16
            (local.get $3)
           )
          )
          (i64.const 2147483647)
         )
        )
        (i64.and
         (local.get $5)
         (i64.const 4294967295)
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
       (i64.const 2147483648)
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
 (func $_RNvMsv_NtCskObGt8PTDSq_13hyperinterval5floatNtB5_12F64Enclosure11from_dyadic (param $0 i32) (param $1 i32) (param $2 i32)
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
       (i32.const -2)
      )
     )
     (call $_RNvMNtNtCskObGt8PTDSq_13hyperinterval4ieee6dyadicNtB4_6Format14enclose_dyadic
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
   (call $_RNvMNtNtCskObGt8PTDSq_13hyperinterval4ieee6dyadicNtB4_6Format14enclose_dyadic
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
   (call $_RNvMNtCskObGt8PTDSq_13hyperinterval4ieeeNtB2_6Format6finite
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
   (call $_RNvMNtCskObGt8PTDSq_13hyperinterval4ieeeNtB2_6Format6finite
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
 (func $_RNvMNtCskObGt8PTDSq_13hyperinterval6boundsINtB2_6BoundsNtNtCsbodFP5rPXOh_10num_bigint6bigint6BigIntE3newB4_ (param $0 i32) (param $1 i32) (param $2 i32)
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
        (i32.eq
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
       (local.set $4
        (i32.gt_u
         (local.get $4)
         (local.get $5)
        )
       )
       (br $label$4)
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
           (local.tee $5
            (i32.load
             (local.get $2)
            )
           )
           (i32.const -1)
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
           (i32.const -1)
          )
         )
         (local.set $7
          (i32.load offset=8
           (local.get $1)
          )
         )
         (local.set $8
          (i32.load offset=4
           (local.get $1)
          )
         )
         (br $label$11)
        )
        (local.set $7
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
         (local.set $8
          (i32.const 4)
         )
         (local.set $7
          (i32.const 0)
         )
         (br $label$11)
        )
        (local.set $8
         (i32.add
          (local.get $1)
          (i32.const 8)
         )
        )
       )
       (block $label$14
        (br_if $label$14
         (i32.eq
          (local.get $4)
          (local.get $7)
         )
        )
        (local.set $4
         (i32.gt_u
          (local.get $4)
          (local.get $7)
         )
        )
        (br $label$4)
       )
       (br_if $label$2
        (i32.eqz
         (local.get $4)
        )
       )
       (local.set $7
        (i32.add
         (local.get $8)
         (i32.const -4)
        )
       )
       (local.set $6
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
       (block $label$15
        (loop $label$16
         (br_if $label$15
          (i32.ne
           (local.tee $8
            (i32.load
             (i32.add
              (local.get $6)
              (local.get $4)
             )
            )
           )
           (local.tee $9
            (i32.load
             (i32.add
              (local.get $7)
              (local.get $4)
             )
            )
           )
          )
         )
         (br_if $label$2
          (i32.eqz
           (local.tee $4
            (i32.add
             (local.get $4)
             (i32.const -4)
            )
           )
          )
         )
         (br $label$16)
        )
       )
       (br_if $label$3
        (i32.gt_u
         (local.get $8)
         (local.get $9)
        )
       )
       (br $label$2)
      )
      (block $label$17
       (block $label$18
        (br_if $label$18
         (i32.eq
          (i32.load
           (local.get $1)
          )
          (i32.const -1)
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
        (br $label$17)
       )
       (local.set $4
        (i32.const 1)
       )
       (block $label$19
        (br_if $label$19
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
        (br $label$17)
       )
       (local.set $6
        (i32.add
         (local.get $1)
         (i32.const 8)
        )
       )
      )
      (block $label$20
       (block $label$21
        (br_if $label$21
         (i32.eq
          (local.tee $5
           (i32.load
            (local.get $2)
           )
          )
          (i32.const -1)
         )
        )
        (local.set $7
         (i32.load offset=8
          (local.get $2)
         )
        )
        (local.set $8
         (i32.load offset=4
          (local.get $2)
         )
        )
        (br $label$20)
       )
       (local.set $7
        (i32.const 1)
       )
       (block $label$22
        (br_if $label$22
         (i32.eq
          (i32.load offset=4
           (local.get $2)
          )
          (i32.const 1)
         )
        )
        (local.set $8
         (i32.const 4)
        )
        (local.set $7
         (i32.const 0)
        )
        (br $label$20)
       )
       (local.set $8
        (i32.add
         (local.get $2)
         (i32.const 8)
        )
       )
      )
      (block $label$23
       (br_if $label$23
        (i32.eq
         (local.get $4)
         (local.get $7)
        )
       )
       (local.set $4
        (i32.gt_u
         (local.get $4)
         (local.get $7)
        )
       )
       (br $label$4)
      )
      (br_if $label$2
       (i32.eqz
        (local.get $4)
       )
      )
      (local.set $7
       (i32.add
        (local.get $8)
        (i32.const -4)
       )
      )
      (local.set $6
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
      (block $label$24
       (loop $label$25
        (br_if $label$24
         (i32.ne
          (local.tee $8
           (i32.load
            (i32.add
             (local.get $6)
             (local.get $4)
            )
           )
          )
          (local.tee $9
           (i32.load
            (i32.add
             (local.get $7)
             (local.get $4)
            )
           )
          )
         )
        )
        (br_if $label$2
         (i32.eqz
          (local.tee $4
           (i32.add
            (local.get $4)
            (i32.const -4)
           )
          )
         )
        )
        (br $label$25)
       )
      )
      (br_if $label$3
       (i32.gt_u
        (local.get $8)
        (local.get $9)
       )
      )
      (br $label$2)
     )
     (br_if $label$2
      (i32.eqz
       (local.get $4)
      )
     )
     (local.set $5
      (i32.load
       (local.get $2)
      )
     )
    )
    (i32.store
     (local.get $0)
     (i32.const -2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (i32.const 1)
    )
    (block $label$26
     (br_if $label$26
      (i32.lt_s
       (local.get $5)
       (i32.const 1)
      )
     )
     (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
      (i32.load offset=4
       (local.get $2)
      )
      (i32.shl
       (local.get $5)
       (i32.const 2)
      )
      (i32.const 4)
     )
    )
    (br_if $label$1
     (i32.lt_s
      (local.tee $2
       (i32.load
        (local.get $1)
       )
      )
      (i32.const 1)
     )
    )
    (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
     (i32.load offset=4
      (local.get $1)
     )
     (i32.shl
      (local.get $2)
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
   (i64.store offset=8 align=4
    (local.get $0)
    (i64.load offset=8 align=4
     (local.get $1)
    )
   )
   (i64.store offset=16 align=4
    (local.get $0)
    (i64.load align=4
     (local.get $2)
    )
   )
   (i64.store offset=24 align=4
    (local.get $0)
    (i64.load offset=8 align=4
     (local.get $2)
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
 (func $_RNvMNtCskObGt8PTDSq_13hyperinterval4ieeeNtB2_6Format6finite (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64)
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
  (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
   (i32.const 1050408)
  )
  (unreachable)
 )
 (func $_RNvMNtNtCskObGt8PTDSq_13hyperinterval4ieee6dyadicNtB4_6Format14enclose_dyadic (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i32)
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
       (br_if $label$5
        (i32.eq
         (local.tee $7
          (i32.load
           (local.get $3)
          )
         )
         (i32.const -1)
        )
       )
       (br_if $label$4
        (local.tee $8
         (i32.load offset=8
          (local.get $3)
         )
        )
       )
       (local.set $9
        (i64.const 0)
       )
       (br $label$1)
      )
      (br_if $label$3
       (i32.load offset=4
        (local.get $3)
       )
      )
      (local.set $9
       (i64.const 0)
      )
      (br $label$1)
     )
     (local.set $9
      (i64.shl
       (i64.extend_i32_u
        (local.get $8)
       )
       (i64.const 5)
      )
     )
     (local.set $8
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
     (br $label$2)
    )
    (local.set $8
     (i32.clz
      (i32.load offset=8
       (local.get $3)
      )
     )
    )
    (local.set $9
     (i64.const 32)
    )
   )
   (local.set $9
    (i64.sub
     (local.get $9)
     (i64.extend_i32_u
      (local.get $8)
     )
    )
   )
  )
  (block $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (br_if $label$10
        (i64.le_u
         (local.tee $11
          (select
           (local.tee $11
            (i64.add
             (local.tee $10
              (i64.ctz
               (local.get $2)
              )
             )
             (i64.const 2)
            )
           )
           (local.get $9)
           (i64.gt_u
            (local.get $11)
            (local.get $9)
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
       (br $label$9)
      )
      (br_if $label$8
       (i64.ge_u
        (local.tee $12
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
     (br $label$7)
    )
    (i64.store offset=8
     (local.get $5)
     (i64.sub
      (local.get $12)
      (local.get $11)
     )
    )
    (block $label$11
     (br_if $label$11
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
     (i64.store offset=16
      (local.get $0)
      (i64.const 0)
     )
     (br $label$7)
    )
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
              (br_if $label$21
               (i64.gt_u
                (local.get $10)
                (i64.const 63)
               )
              )
              (br_if $label$18
               (select
                (i64.gt_u
                 (local.tee $13
                  (i64.add
                   (local.tee $11
                    (i64.add
                     (local.get $9)
                     (local.tee $12
                      (i64.extend_i32_s
                       (local.get $4)
                      )
                     )
                    )
                   )
                   (i64.const -1)
                  )
                 )
                 (local.tee $15
                  (i64.extend32_s
                   (local.tee $14
                    (i64.shr_u
                     (i64.shr_u
                      (local.get $2)
                      (local.get $10)
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
                   (local.tee $16
                    (i64.add
                     (i64.shr_s
                      (local.get $12)
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
                 (local.tee $15
                  (i64.shr_s
                   (local.get $15)
                   (i64.const 63)
                  )
                 )
                )
                (i64.eq
                 (local.get $9)
                 (local.get $15)
                )
               )
              )
              (br_if $label$20
               (i32.xor
                (i32.gt_s
                 (local.tee $5
                  (i32.wrap_i64
                   (local.get $14)
                  )
                 )
                 (i32.const 1)
                )
                (i32.lt_s
                 (local.tee $5
                  (i32.sub
                   (i32.const 1)
                   (local.get $5)
                  )
                 )
                 (i32.const 0)
                )
               )
              )
              (br_if $label$19
               (i32.xor
                (i32.lt_s
                 (local.get $5)
                 (local.tee $8
                  (i32.wrap_i64
                   (local.get $10)
                  )
                 )
                )
                (i32.lt_s
                 (local.tee $5
                  (i32.sub
                   (local.get $5)
                   (local.get $8)
                  )
                 )
                 (i32.const 0)
                )
               )
              )
              (local.set $17
               (i32.load8_u offset=12
                (local.get $3)
               )
              )
              (br_if $label$17
               (i32.eqz
                (select
                 (i64.gt_u
                  (local.get $11)
                  (local.tee $9
                   (i64.extend_i32_s
                    (local.get $5)
                   )
                  )
                 )
                 (i64.gt_s
                  (local.get $16)
                  (local.tee $9
                   (i64.shr_s
                    (local.get $9)
                    (i64.const 63)
                   )
                  )
                 )
                 (i64.eq
                  (local.get $16)
                  (local.get $9)
                 )
                )
               )
              )
              (br_if $label$16
               (i32.xor
                (i32.lt_s
                 (local.tee $4
                  (i32.wrap_i64
                   (local.get $13)
                  )
                 )
                 (local.get $8)
                )
                (i32.lt_s
                 (local.tee $8
                  (i32.sub
                   (local.get $4)
                   (local.get $8)
                  )
                 )
                 (i32.const 0)
                )
               )
              )
              (block $label$22
               (br_if $label$22
                (i64.gt_s
                 (local.tee $10
                  (i64.sub
                   (i64.extend_i32_s
                    (local.tee $18
                     (select
                      (local.get $8)
                      (local.get $5)
                      (i32.gt_s
                       (local.get $8)
                       (local.get $5)
                      )
                     )
                    )
                   )
                   (local.get $12)
                  )
                 )
                 (i64.const 0)
                )
               )
               (block $label$23
                (block $label$24
                 (block $label$25
                  (br_if $label$25
                   (i32.ne
                    (local.get $7)
                    (i32.const -1)
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
                 (block $label$26
                  (br_if $label$26
                   (local.tee $5
                    (i32.load offset=8
                     (local.get $3)
                    )
                   )
                  )
                  (local.set $11
                   (i64.const 0)
                  )
                  (local.set $9
                   (i64.const 0)
                  )
                  (br $label$23)
                 )
                 (br_if $label$15
                  (i32.lt_u
                   (i32.add
                    (local.tee $5
                     (i32.shl
                      (local.get $5)
                      (i32.const 2)
                     )
                    )
                    (i32.const -17)
                   )
                   (i32.const -13)
                  )
                 )
                 (local.set $8
                  (i32.add
                   (local.tee $3
                    (i32.load offset=4
                     (local.get $3)
                    )
                   )
                   (local.get $5)
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
                (loop $label$27
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
                 (br_if $label$27
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
               (br_if $label$14
                (i64.ge_u
                 (local.tee $10
                  (i64.sub
                   (i64.const 0)
                   (local.get $10)
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
                 (local.get $10)
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
               (br $label$12)
              )
              (block $label$28
               (block $label$29
                (block $label$30
                 (br_if $label$30
                  (i32.eq
                   (local.get $7)
                   (i32.const -1)
                  )
                 )
                 (br_if $label$29
                  (i32.load offset=8
                   (local.get $3)
                  )
                 )
                 (local.set $9
                  (i64.const 0)
                 )
                 (local.set $11
                  (i64.const 0)
                 )
                 (br $label$28)
                )
                (local.set $9
                 (i64.const 0)
                )
                (local.set $11
                 (i64.const 0)
                )
                (br_if $label$28
                 (i32.ne
                  (i32.load offset=4
                   (local.get $3)
                  )
                  (i32.const 1)
                 )
                )
               )
               (i32.store offset=68
                (local.get $6)
                (local.get $3)
               )
               (i32.store offset=64
                (local.get $6)
                (i32.const -2)
               )
               (call $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shr2
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
                   (local.get $10)
                  )
                 )
                 (i32.const 5)
                )
                (i32.and
                 (local.get $5)
                 (i32.const 31)
                )
               )
               (block $label$31
                (block $label$32
                 (block $label$33
                  (br_if $label$33
                   (i32.ne
                    (local.tee $7
                     (i32.load offset=52
                      (local.get $6)
                     )
                    )
                    (i32.const -1)
                   )
                  )
                  (local.set $9
                   (i64.const 0)
                  )
                  (local.set $11
                   (i64.const 0)
                  )
                  (br_if $label$28
                   (i32.ne
                    (i32.load offset=56
                     (local.get $6)
                    )
                    (i32.const 1)
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
                  (br $label$32)
                 )
                 (block $label$34
                  (br_if $label$34
                   (local.tee $5
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
                  (br $label$31)
                 )
                 (br_if $label$13
                  (i32.lt_u
                   (i32.add
                    (local.tee $8
                     (i32.shl
                      (local.get $5)
                      (i32.const 2)
                     )
                    )
                    (i32.const -17)
                   )
                   (i32.const -13)
                  )
                 )
                 (local.set $4
                  (i32.add
                   (local.tee $5
                    (i32.load offset=56
                     (local.get $6)
                    )
                   )
                   (local.get $8)
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
                (loop $label$35
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
                 (br_if $label$35
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
                (br_if $label$28
                 (i32.eq
                  (local.get $7)
                  (i32.const -1)
                 )
                )
               )
               (br_if $label$28
                (i32.eqz
                 (local.get $7)
                )
               )
               (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
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
              (call $_RNvMsj_NtCsbodFP5rPXOh_10num_bigint7biguintNtB5_7BigUint14trailing_zeros
               (i32.add
                (local.get $6)
                (i32.const 64)
               )
               (local.get $3)
              )
              (block $label$36
               (br_if $label$36
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
                 (local.get $10)
                )
               )
               (br $label$12)
              )
              (call $_RNvNtCs8hZryZq3oeI_4core6option13expect_failed
               (i32.const 1050600)
               (i32.const 17)
               (i32.const 1050620)
              )
              (unreachable)
             )
             (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shr_overflow
              (i32.const 1050424)
             )
             (unreachable)
            )
            (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
             (i32.const 1050652)
            )
            (unreachable)
           )
           (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
            (i32.const 1050652)
           )
           (unreachable)
          )
          (i32.store16
           (local.get $0)
           (i32.const 1281)
          )
          (br $label$7)
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
             (local.get $17)
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
         (br $label$7)
        )
        (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
         (i32.const 1050440)
        )
        (unreachable)
       )
       (call $_RNvNtCs8hZryZq3oeI_4core6option13expect_failed
        (i32.const 1050456)
        (i32.const 46)
        (i32.const 1050504)
       )
       (unreachable)
      )
      (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shl_overflow
       (i32.const 1050520)
      )
      (unreachable)
     )
     (call $_RNvNtCs8hZryZq3oeI_4core6option13expect_failed
      (i32.const 1050536)
      (i32.const 45)
      (i32.const 1050584)
     )
     (unreachable)
    )
    (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval4ieeeNtB4_6Format6encode.llvm.213774994061146641
     (i32.add
      (local.get $6)
      (i32.const 64)
     )
     (local.get $2)
     (local.get $9)
     (local.get $11)
     (local.get $18)
    )
    (block $label$37
     (br_if $label$37
      (i32.eqz
       (i32.load8_u offset=64
        (local.get $6)
       )
      )
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
     (br $label$7)
    )
    (br_if $label$6
     (select
      (local.tee $3
       (i64.lt_u
        (local.tee $10
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
       (local.tee $12
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
       (local.get $10)
       (local.get $9)
      )
     )
    )
    (local.set $9
     (i64.load offset=72
      (local.get $6)
     )
    )
    (call $_RNvMs_NtCskObGt8PTDSq_13hyperinterval4ieeeNtB4_6Format6encode.llvm.213774994061146641
     (i32.add
      (local.get $6)
      (i32.const 64)
     )
     (local.get $2)
     (local.get $10)
     (local.get $12)
     (local.get $18)
    )
    (block $label$38
     (br_if $label$38
      (i32.eqz
       (i32.load8_u offset=64
        (local.get $6)
       )
      )
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
     (br $label$7)
    )
    (local.set $2
     (i64.load offset=72
      (local.get $6)
     )
    )
    (block $label$39
     (block $label$40
      (br_if $label$40
       (i32.eqz
        (i32.and
         (local.get $17)
         (i32.const 255)
        )
       )
      )
      (local.set $11
       (local.get $2)
      )
      (br $label$39)
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
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $6)
     (i32.const 80)
    )
   )
   (return)
  )
  (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow
   (i32.const 1050636)
  )
  (unreachable)
 )
 (func $_RNvMs_NtCskObGt8PTDSq_13hyperinterval4ieeeNtB4_6Format6encode.llvm.213774994061146641 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i32)
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
         (br_if $label$7
          (i64.ge_u
           (local.tee $8
            (i64.ctz
             (local.get $1)
            )
           )
           (i64.const 64)
          )
         )
         (block $label$9
          (br_if $label$9
           (i32.le_s
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
          (i32.store8 offset=1
           (local.get $0)
           (i32.const 5)
          )
          (local.set $4
           (i32.const 1)
          )
          (br $label$1)
         )
         (br_if $label$6
          (i32.xor
           (i32.gt_s
            (local.get $9)
            (i32.const 1)
           )
           (i32.lt_s
            (local.tee $10
             (i32.sub
              (i32.const 1)
              (local.get $9)
             )
            )
            (i32.const 0)
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
               (i32.lt_s
                (local.get $10)
                (local.get $11)
               )
               (i32.lt_s
                (local.tee $7
                 (i32.sub
                  (local.get $10)
                  (local.get $11)
                 )
                )
                (i32.const 0)
               )
              )
             )
             (br_if $label$11
              (i32.xor
               (i32.lt_s
                (local.get $4)
                (local.get $7)
               )
               (i32.lt_s
                (local.tee $4
                 (i32.sub
                  (local.get $4)
                  (local.get $7)
                 )
                )
                (i32.const 0)
               )
              )
             )
             (br_if $label$10
              (i32.ge_u
               (local.get $4)
               (i32.const 128)
              )
             )
             (call $__ashlti3
              (local.get $5)
              (local.get $2)
              (local.get $3)
              (local.get $4)
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
          (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
           (i32.const 1050716)
          )
          (unreachable)
         )
         (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shl_overflow
          (i32.const 1050732)
         )
         (unreachable)
        )
        (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow
         (i32.const 1050668)
        )
        (unreachable)
       )
       (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shr_overflow
        (i32.const 1050424)
       )
       (unreachable)
      )
      (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
       (i32.const 1050684)
      )
      (unreachable)
     )
     (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
      (i32.const 1050652)
     )
     (unreachable)
    )
    (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow
     (i32.const 1050700)
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
 (func $_RNvMNtCsbodFP5rPXOh_10num_bigint9big_digitNtB2_9BigDigits9normalize.llvm.295840251310847846 (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
          (i32.const -1)
         )
        )
        (br_if $label$5
         (local.tee $2
          (i32.load offset=8
           (local.get $0)
          )
         )
        )
        (local.set $2
         (i32.const 0)
        )
        (br $label$4)
       )
       (br_if $label$3
        (i32.ne
         (i32.load offset=4
          (local.get $0)
         )
         (i32.const 1)
        )
       )
       (br_if $label$3
        (i32.load offset=8
         (local.get $0)
        )
       )
       (i32.store offset=4
        (local.get $0)
        (i32.const 0)
       )
       (return)
      )
      (br_if $label$4
       (i32.load
        (i32.add
         (i32.add
          (local.tee $3
           (i32.load offset=4
            (local.get $0)
           )
          )
          (local.tee $4
           (i32.shl
            (local.get $2)
            (i32.const 2)
           )
          )
         )
         (i32.const -4)
        )
       )
      )
      (block $label$7
       (block $label$8
        (br_if $label$8
         (local.get $4)
        )
        (local.set $5
         (i32.const 0)
        )
        (br $label$7)
       )
       (local.set $5
        (i32.and
         (local.get $2)
         (i32.const 1073741823)
        )
       )
       (local.set $3
        (i32.add
         (local.get $3)
         (i32.const -4)
        )
       )
       (block $label$9
        (loop $label$10
         (br_if $label$9
          (i32.load
           (i32.add
            (local.get $3)
            (local.get $4)
           )
          )
         )
         (local.set $5
          (i32.add
           (local.get $5)
           (i32.const -1)
          )
         )
         (br_if $label$10
          (local.tee $4
           (i32.add
            (local.get $4)
            (i32.const -4)
           )
          )
         )
        )
        (local.set $5
         (i32.const 0)
        )
        (br $label$7)
       )
       (br_if $label$4
        (i32.gt_u
         (local.get $5)
         (local.get $2)
        )
       )
      )
      (i32.store offset=8
       (local.get $0)
       (local.get $5)
      )
      (local.set $2
       (local.get $5)
      )
     )
     (br_if $label$3
      (i32.ge_u
       (local.get $2)
       (i32.shr_u
        (local.get $1)
        (i32.const 1)
       )
      )
     )
     (block $label$11
      (block $label$12
       (block $label$13
        (br_table $label$13 $label$12 $label$11
         (local.get $2)
        )
       )
       (block $label$14
        (br_if $label$14
         (i32.eqz
          (local.get $1)
         )
        )
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
         (i32.load offset=4
          (local.get $0)
         )
         (i32.shl
          (local.get $1)
          (i32.const 2)
         )
         (i32.const 4)
        )
       )
       (i32.store offset=8
        (local.get $0)
        (i32.load offset=1050756
         (i32.const 0)
        )
       )
       (i64.store align=4
        (local.get $0)
        (i64.load offset=1050748 align=4
         (i32.const 0)
        )
       )
       (return)
      )
      (local.set $4
       (i32.load
        (local.tee $5
         (i32.load offset=4
          (local.get $0)
         )
        )
       )
      )
      (block $label$15
       (br_if $label$15
        (i32.eqz
         (local.get $1)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (local.get $5)
        (i32.shl
         (local.get $1)
         (i32.const 2)
        )
        (i32.const 4)
       )
      )
      (i32.store offset=8
       (local.get $0)
       (local.get $4)
      )
      (i64.store align=4
       (local.get $0)
       (i64.const 8589934591)
      )
      (return)
     )
     (br_if $label$3
      (i32.le_u
       (local.get $1)
       (local.tee $4
        (i32.add
         (local.get $2)
         (i32.const 1)
        )
       )
      )
     )
     (br_if $label$2
      (i32.gt_u
       (local.get $2)
       (local.get $1)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.tee $5
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_realloc
         (i32.load offset=4
          (local.get $0)
         )
         (i32.shl
          (local.get $1)
          (i32.const 2)
         )
         (i32.const 4)
         (local.tee $2
          (i32.shl
           (local.get $4)
           (i32.const 2)
          )
         )
        )
       )
      )
     )
     (i32.store
      (local.get $0)
      (local.get $4)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $5)
     )
    )
    (return)
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
    (i32.const 1050772)
    (i32.const 73)
    (i32.const 1050808)
   )
   (unreachable)
  )
  (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
   (i32.const 4)
   (local.get $2)
  )
  (unreachable)
 )
 (func $_RNvMsj_NtCsbodFP5rPXOh_10num_bigint7biguintNtB5_7BigUint14trailing_zeros (param $0 i32) (param $1 i32)
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
       (i32.const -1)
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
 (func $_RNvXs2_NtNtCsbodFP5rPXOh_10num_bigint7biguint11subtractionNtB7_7BigUintINtNtNtCs8hZryZq3oeI_4core3ops5arith9SubAssignmE10sub_assign (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
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
         (i32.const -1)
        )
       )
       (local.set $2
        (i32.const 1)
       )
       (br_if $label$3
        (i32.ne
         (i32.load offset=4
          (local.get $0)
         )
         (i32.const 1)
        )
       )
       (local.set $3
        (i32.add
         (local.get $0)
         (i32.const 12)
        )
       )
       (local.set $4
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
       )
       (br $label$4)
      )
      (br_if $label$3
       (i32.eqz
        (local.tee $2
         (i32.load offset=8
          (local.get $0)
         )
        )
       )
      )
      (local.set $3
       (i32.add
        (local.tee $4
         (i32.load offset=4
          (local.get $0)
         )
        )
        (i32.shl
         (i32.ne
          (local.get $2)
          (i32.const 0)
         )
         (i32.const 2)
        )
       )
      )
     )
     (i32.store
      (local.get $4)
      (i32.sub
       (local.tee $5
        (i32.load
         (local.get $4)
        )
       )
       (local.get $1)
      )
     )
     (br_if $label$1
      (i32.ge_u
       (local.get $5)
       (local.get $1)
      )
     )
     (br_if $label$2
      (i32.eq
       (local.get $2)
       (i32.const 1)
      )
     )
     (local.set $4
      (i32.add
       (local.get $4)
       (i32.shl
        (local.get $2)
        (i32.const 2)
       )
      )
     )
     (loop $label$6
      (i32.store
       (local.get $3)
       (i32.add
        (local.tee $1
         (i32.load
          (local.get $3)
         )
        )
        (i32.const -1)
       )
      )
      (br_if $label$1
       (local.get $1)
      )
      (br_if $label$2
       (i32.eq
        (local.tee $3
         (i32.add
          (local.get $3)
          (i32.const 4)
         )
        )
        (local.get $4)
       )
      )
      (br $label$6)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $1)
     )
    )
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
    (i32.const 1050824)
    (i32.const 105)
    (i32.const 1050876)
   )
   (unreachable)
  )
  (call $_RNvMNtCsbodFP5rPXOh_10num_bigint9big_digitNtB2_9BigDigits9normalize.llvm.295840251310847846
   (local.get $0)
  )
 )
 (func $_RNvMso_NtCsbodFP5rPXOh_10num_bigint6bigintNtB5_6BigInt14trailing_zeros (param $0 i32) (param $1 i32)
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
       (i32.const -1)
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
 (func $_RINvNvMs2_NtCshrt81WbuBY1_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsbodFP5rPXOh_10num_bigint.llvm.13650672697737217751 (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ge_u
     (local.tee $1
      (i32.add
       (local.get $2)
       (local.get $1)
      )
     )
     (local.get $2)
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
    (i32.const 0)
    (i32.const 0)
   )
   (unreachable)
  )
  (call $_RNvMs5_NtCshrt81WbuBY1_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsbodFP5rPXOh_10num_bigint.llvm.13650672697737217751
   (i32.add
    (local.get $3)
    (i32.const 4)
   )
   (local.tee $2
    (i32.load
     (local.get $0)
    )
   )
   (i32.load offset=4
    (local.get $0)
   )
   (local.tee $2
    (select
     (local.tee $2
      (select
       (local.get $1)
       (local.tee $2
        (i32.shl
         (local.get $2)
         (i32.const 1)
        )
       )
       (i32.gt_u
        (local.get $1)
        (local.get $2)
       )
      )
     )
     (i32.const 4)
     (i32.gt_u
      (local.get $2)
      (i32.const 4)
     )
    )
   )
   (i32.const 4)
  )
  (block $label$2
   (br_if $label$2
    (i32.ne
     (i32.load offset=4
      (local.get $3)
     )
     (i32.const 1)
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
    (i32.load offset=8
     (local.get $3)
    )
    (i32.load offset=12
     (local.get $3)
    )
   )
   (unreachable)
  )
  (local.set $1
   (i32.load offset=8
    (local.get $3)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $2)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $1)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_RNvMs5_NtCshrt81WbuBY1_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsbodFP5rPXOh_10num_bigint.llvm.13650672697737217751 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local.set $5
   (i32.const 1)
  )
  (local.set $6
   (i32.const 4)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.wrap_i64
       (i64.shr_u
        (local.tee $7
         (i64.mul
          (i64.extend_i32_u
           (local.get $4)
          )
          (i64.extend_i32_u
           (local.get $3)
          )
         )
        )
        (i64.const 32)
       )
      )
     )
    )
    (local.set $3
     (i32.const 0)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i32.le_u
      (local.tee $3
       (i32.wrap_i64
        (local.get $7)
       )
      )
      (i32.const 2147483644)
     )
    )
    (local.set $3
     (i32.const 0)
    )
    (br $label$1)
   )
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (br_if $label$7
        (i32.eqz
         (local.get $1)
        )
       )
       (local.set $6
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_realloc
         (local.get $2)
         (i32.mul
          (local.get $4)
          (local.get $1)
         )
         (i32.const 4)
         (local.get $3)
        )
       )
       (br $label$6)
      )
      (block $label$8
       (br_if $label$8
        (local.get $3)
       )
       (local.set $6
        (i32.const 4)
       )
       (br $label$5)
      )
      (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
      (local.set $6
       (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
        (local.get $3)
        (i32.const 4)
       )
      )
     )
     (br_if $label$5
      (local.get $6)
     )
     (i32.store offset=4
      (local.get $0)
      (i32.const 4)
     )
     (br $label$4)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $6)
    )
    (local.set $5
     (i32.const 0)
    )
   )
   (local.set $6
    (i32.const 8)
   )
  )
  (i32.store
   (i32.add
    (local.get $0)
    (local.get $6)
   )
   (local.get $3)
  )
  (i32.store
   (local.get $0)
   (local.get $5)
  )
 )
 (func $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint (param $0 i32)
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
  (call $_RNvMs5_NtCshrt81WbuBY1_5alloc7raw_vecNtB5_11RawVecInner11finish_growCsbodFP5rPXOh_10num_bigint.llvm.13650672697737217751
   (i32.add
    (local.get $1)
    (i32.const 4)
   )
   (local.tee $2
    (i32.load
     (local.get $0)
    )
   )
   (i32.load offset=4
    (local.get $0)
   )
   (local.tee $2
    (select
     (local.tee $2
      (i32.shl
       (local.get $2)
       (i32.const 1)
      )
     )
     (i32.const 4)
     (i32.gt_u
      (local.get $2)
      (i32.const 4)
     )
    )
   )
   (i32.const 4)
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (i32.load offset=4
      (local.get $1)
     )
     (i32.const 1)
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
    (i32.load offset=8
     (local.get $1)
    )
    (i32.load offset=12
     (local.get $1)
    )
   )
   (unreachable)
  )
  (local.set $3
   (i32.load offset=8
    (local.get $1)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $2)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $3)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $1)
    (i32.const 16)
   )
  )
 )
 (func $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint11subtraction7sub2rev (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.eqz
         (local.tee $4
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
       (local.set $5
        (i32.const 0)
       )
       (local.set $6
        (i32.const 0)
       )
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i32.eq
           (local.get $4)
           (i32.const 1)
          )
         )
         (local.set $7
          (i32.and
           (local.get $4)
           (i32.const 1)
          )
         )
         (local.set $8
          (i32.and
           (local.get $4)
           (i32.const 536870910)
          )
         )
         (local.set $5
          (i32.const 0)
         )
         (local.set $9
          (local.get $2)
         )
         (local.set $10
          (local.get $0)
         )
         (local.set $6
          (i32.const 0)
         )
         (loop $label$8
          (i32.store
           (local.get $9)
           (i32.sub
            (local.tee $13
             (i32.sub
              (local.tee $11
               (i32.load
                (local.get $10)
               )
              )
              (local.tee $12
               (i32.load
                (local.get $9)
               )
              )
             )
            )
            (local.get $5)
           )
          )
          (i32.store
           (local.tee $14
            (i32.add
             (local.get $9)
             (i32.const 4)
            )
           )
           (i32.sub
            (local.tee $16
             (i32.sub
              (local.tee $15
               (i32.load
                (i32.add
                 (local.get $10)
                 (i32.const 4)
                )
               )
              )
              (local.tee $14
               (i32.load
                (local.get $14)
               )
              )
             )
            )
            (local.tee $5
             (i32.or
              (i32.lt_u
               (local.get $11)
               (local.get $12)
              )
              (i32.lt_u
               (local.get $13)
               (local.get $5)
              )
             )
            )
           )
          )
          (local.set $5
           (i32.or
            (i32.lt_u
             (local.get $15)
             (local.get $14)
            )
            (i32.lt_u
             (local.get $16)
             (local.get $5)
            )
           )
          )
          (local.set $9
           (i32.add
            (local.get $9)
            (i32.const 8)
           )
          )
          (local.set $10
           (i32.add
            (local.get $10)
            (i32.const 8)
           )
          )
          (br_if $label$8
           (i32.ne
            (local.get $8)
            (local.tee $6
             (i32.add
              (local.get $6)
              (i32.const 2)
             )
            )
           )
          )
         )
         (br_if $label$6
          (i32.eqz
           (local.get $7)
          )
         )
        )
        (i32.store
         (local.tee $10
          (i32.add
           (local.get $2)
           (local.tee $9
            (i32.shl
             (local.get $6)
             (i32.const 2)
            )
           )
          )
         )
         (i32.sub
          (local.tee $6
           (i32.sub
            (local.tee $9
             (i32.load
              (i32.add
               (local.get $0)
               (local.get $9)
              )
             )
            )
            (local.tee $10
             (i32.load
              (local.get $10)
             )
            )
           )
          )
          (local.get $5)
         )
        )
        (local.set $5
         (i32.or
          (i32.lt_u
           (local.get $9)
           (local.get $10)
          )
          (i32.lt_u
           (local.get $6)
           (local.get $5)
          )
         )
        )
       )
       (br_if $label$4
        (i32.gt_u
         (local.get $1)
         (local.get $3)
        )
       )
       (br_if $label$2
        (local.get $5)
       )
       (br $label$3)
      )
      (br_if $label$3
       (i32.le_u
        (local.get $1)
        (local.get $3)
       )
      )
     )
     (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
      (i32.const 1050892)
      (i32.const 33)
      (i32.const 1050928)
     )
     (unreachable)
    )
    (br_if $label$1
     (i32.le_u
      (local.get $3)
      (local.get $1)
     )
    )
    (local.set $9
     (i32.add
      (local.get $2)
      (i32.shl
       (local.get $4)
       (i32.const 2)
      )
     )
    )
    (local.set $10
     (i32.sub
      (i32.shl
       (local.get $3)
       (i32.const 2)
      )
      (i32.shl
       (local.get $4)
       (i32.const 2)
      )
     )
    )
    (loop $label$9
     (br_if $label$2
      (i32.load
       (local.get $9)
      )
     )
     (local.set $9
      (i32.add
       (local.get $9)
       (i32.const 4)
      )
     )
     (br_if $label$1
      (i32.eqz
       (local.tee $10
        (i32.add
         (local.get $10)
         (i32.const -4)
        )
       )
      )
     )
     (br $label$9)
    )
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
    (i32.const 1050824)
    (i32.const 105)
    (i32.const 1050944)
   )
   (unreachable)
  )
 )
 (func $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shl2 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
           (block $label$10
            (block $label$11
             (block $label$12
              (br_if $label$12
               (local.get $2)
              )
              (local.set $6
               (i32.load offset=4
                (local.get $1)
               )
              )
              (block $label$13
               (block $label$14
                (br_if $label$14
                 (i32.eq
                  (local.get $5)
                  (i32.const -2)
                 )
                )
                (local.set $1
                 (i32.load offset=8
                  (local.get $1)
                 )
                )
                (local.set $7
                 (local.get $6)
                )
                (local.set $8
                 (local.get $5)
                )
                (br $label$13)
               )
               (local.set $8
                (i32.const -1)
               )
               (local.set $1
                (i32.load offset=8
                 (local.get $6)
                )
               )
               (block $label$15
                (br_if $label$15
                 (i32.eq
                  (i32.load
                   (local.get $6)
                  )
                  (i32.const -1)
                 )
                )
                (local.set $9
                 (i32.load offset=4
                  (local.get $6)
                 )
                )
                (local.set $7
                 (local.get $1)
                )
                (block $label$16
                 (block $label$17
                  (br_table $label$13 $label$17 $label$16
                   (local.get $1)
                  )
                 )
                 (local.set $1
                  (i32.load
                   (local.get $9)
                  )
                 )
                 (local.set $7
                  (i32.const 1)
                 )
                 (br $label$13)
                )
                (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
                (br_if $label$11
                 (i32.eqz
                  (local.tee $7
                   (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
                    (local.tee $8
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
                (block $label$18
                 (br_if $label$18
                  (i32.eqz
                   (local.get $8)
                  )
                 )
                 (memory.copy
                  (local.get $7)
                  (local.get $9)
                  (local.get $8)
                 )
                )
                (local.set $8
                 (local.get $1)
                )
                (br $label$13)
               )
               (local.set $7
                (i32.load offset=4
                 (local.get $6)
                )
               )
              )
              (i32.store offset=16
               (local.get $4)
               (local.get $1)
              )
              (i32.store offset=12
               (local.get $4)
               (local.get $7)
              )
              (i32.store offset=8
               (local.get $4)
               (local.get $8)
              )
              (br_if $label$7
               (i32.and
                (local.get $3)
                (i32.const 255)
               )
              )
              (i32.store offset=8
               (local.get $0)
               (i32.load offset=16
                (local.get $4)
               )
              )
              (i64.store align=4
               (local.get $0)
               (i64.load offset=8
                (local.get $4)
               )
              )
              (br $label$1)
             )
             (block $label$19
              (block $label$20
               (br_if $label$20
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
                     (i32.const -2)
                    )
                   )
                  )
                 )
                 (i32.const -1)
                )
               )
               (local.set $7
                (i32.load offset=8
                 (local.get $1)
                )
               )
               (br $label$19)
              )
              (local.set $7
               (i32.load offset=4
                (local.get $1)
               )
              )
             )
             (local.set $8
              (i32.shl
               (local.tee $7
                (select
                 (i32.const -1)
                 (local.tee $7
                  (i32.add
                   (i32.add
                    (local.get $7)
                    (local.get $2)
                   )
                   (i32.const 1)
                  )
                 )
                 (i32.lt_u
                  (local.get $7)
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
             (br_if $label$10
              (i32.gt_u
               (local.get $7)
               (i32.const 1073741823)
              )
             )
             (br_if $label$10
              (i32.gt_u
               (local.get $8)
               (i32.const 2147483644)
              )
             )
             (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
             (local.set $10
              (i32.const 4)
             )
             (br_if $label$10
              (i32.eqz
               (local.tee $9
                (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
                 (local.get $8)
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
              (local.get $7)
             )
             (local.set $10
              (local.get $9)
             )
             (block $label$21
              (br_if $label$21
               (i32.eq
                (local.get $2)
                (i32.const 1)
               )
              )
              (block $label$22
               (br_if $label$22
                (i32.eqz
                 (local.tee $8
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
                (local.get $8)
               )
              )
              (local.set $10
               (i32.add
                (local.get $9)
                (local.get $8)
               )
              )
             )
             (local.set $8
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
             (block $label$23
              (block $label$24
               (block $label$25
                (br_if $label$25
                 (i32.ne
                  (i32.load
                   (local.get $1)
                  )
                  (i32.const -1)
                 )
                )
                (local.set $10
                 (local.get $2)
                )
                (br_if $label$8
                 (i32.eqz
                  (i32.load offset=4
                   (local.get $1)
                  )
                 )
                )
                (local.set $11
                 (i32.add
                  (local.get $1)
                  (i32.const 8)
                 )
                )
                (local.set $8
                 (i32.const 1)
                )
                (local.set $10
                 (local.get $2)
                )
                (br_if $label$24
                 (i32.eq
                  (local.get $7)
                  (local.get $2)
                 )
                )
                (br $label$9)
               )
               (local.set $11
                (i32.load offset=4
                 (local.get $1)
                )
               )
               (br_if $label$23
                (i32.le_u
                 (local.tee $8
                  (i32.load offset=8
                   (local.get $1)
                  )
                 )
                 (i32.sub
                  (local.get $7)
                  (local.get $2)
                 )
                )
               )
              )
              (call $_RINvNvMs2_NtCshrt81WbuBY1_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECsbodFP5rPXOh_10num_bigint.llvm.13650672697737217751
               (i32.add
                (local.get $4)
                (i32.const 20)
               )
               (local.get $2)
               (local.get $8)
              )
              (local.set $9
               (i32.load offset=24
                (local.get $4)
               )
              )
              (local.set $10
               (i32.load offset=28
                (local.get $4)
               )
              )
              (br $label$9)
             )
             (local.set $10
              (local.get $2)
             )
             (br_if $label$9
              (local.get $8)
             )
             (local.set $8
              (i32.const 0)
             )
             (local.set $10
              (local.get $2)
             )
             (br $label$8)
            )
            (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
             (i32.const 4)
             (local.get $8)
            )
            (unreachable)
           )
           (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
            (local.get $10)
            (local.get $8)
           )
           (unreachable)
          )
          (br_if $label$8
           (i32.eqz
            (local.tee $1
             (i32.shl
              (local.get $8)
              (i32.const 2)
             )
            )
           )
          )
          (memory.copy
           (i32.add
            (local.get $9)
            (i32.shl
             (local.get $10)
             (i32.const 2)
            )
           )
           (local.get $11)
           (local.get $1)
          )
         )
         (i64.store offset=8
          (local.get $4)
          (i64.load offset=20 align=4
           (local.get $4)
          )
         )
         (i32.store offset=28
          (local.get $4)
          (local.tee $1
           (i32.add
            (local.get $10)
            (local.get $8)
           )
          )
         )
         (i32.store offset=16
          (local.get $4)
          (local.get $1)
         )
         (br_if $label$6
          (i32.eqz
           (i32.and
            (local.get $3)
            (i32.const 255)
           )
          )
         )
        )
        (br_if $label$5
         (i32.gt_u
          (i32.and
           (local.get $3)
           (i32.const 255)
          )
          (i32.const 32)
         )
        )
        (br_if $label$4
         (i32.eq
          (i32.load offset=8
           (local.get $4)
          )
          (i32.const -1)
         )
        )
        (local.set $7
         (i32.load offset=16
          (local.get $4)
         )
        )
        (local.set $1
         (i32.load offset=12
          (local.get $4)
         )
        )
        (br $label$3)
       )
       (i32.store offset=8
        (local.get $0)
        (i32.load offset=28
         (local.get $4)
        )
       )
       (i64.store align=4
        (local.get $0)
        (i64.load offset=20 align=4
         (local.get $4)
        )
       )
       (br $label$2)
      )
      (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
       (i32.const 1050960)
      )
      (unreachable)
     )
     (local.set $7
      (i32.const 1)
     )
     (block $label$26
      (br_if $label$26
       (i32.eq
        (i32.load offset=12
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (local.set $7
       (i32.const 0)
      )
      (local.set $1
       (i32.const 4)
      )
      (br $label$3)
     )
     (local.set $1
      (i32.add
       (local.get $4)
       (i32.const 16)
      )
     )
    )
    (block $label$27
     (block $label$28
      (block $label$29
       (block $label$30
        (br_if $label$30
         (i32.gt_u
          (local.get $2)
          (local.get $7)
         )
        )
        (br_if $label$27
         (i32.eq
          (local.get $2)
          (local.get $7)
         )
        )
        (block $label$31
         (block $label$32
          (block $label$33
           (br_if $label$33
            (i32.gt_u
             (local.tee $9
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
           (br_if $label$32
            (i32.eq
             (local.tee $10
              (i32.and
               (local.get $3)
               (i32.const 255)
              )
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
           (local.set $7
            (i32.sub
             (i32.shl
              (local.get $7)
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
           (loop $label$34
            (i32.store
             (local.get $1)
             (i32.or
              (i32.shl
               (local.tee $8
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
              (local.get $8)
              (local.get $9)
             )
            )
            (br_if $label$34
             (local.tee $7
              (i32.add
               (local.get $7)
               (i32.const -4)
              )
             )
            )
           )
           (br_if $label$27
            (i32.eqz
             (local.get $3)
            )
           )
           (br_if $label$31
            (i32.eq
             (local.tee $7
              (i32.load offset=8
               (local.get $4)
              )
             )
             (i32.const -1)
            )
           )
           (block $label$35
            (br_if $label$35
             (i32.ne
              (local.tee $1
               (i32.load offset=16
                (local.get $4)
               )
              )
              (local.get $7)
             )
            )
            (call $_RNvMs4_NtCshrt81WbuBY1_5alloc7raw_vecINtB5_6RawVecmE8grow_oneCsbodFP5rPXOh_10num_bigint
             (i32.add
              (local.get $4)
              (i32.const 8)
             )
            )
           )
           (i32.store
            (i32.add
             (i32.load offset=12
              (local.get $4)
             )
             (i32.shl
              (local.get $1)
              (i32.const 2)
             )
            )
            (local.get $3)
           )
           (i32.store offset=16
            (local.get $4)
            (i32.add
             (local.get $1)
             (i32.const 1)
            )
           )
           (br $label$27)
          )
          (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shr_overflow
           (i32.const 1050976)
          )
          (unreachable)
         )
         (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shl_overflow
          (i32.const 1050992)
         )
         (unreachable)
        )
        (br_if $label$29
         (i32.ne
          (i32.load offset=12
           (local.get $4)
          )
          (i32.const 1)
         )
        )
        (local.set $7
         (i32.load offset=16
          (local.get $4)
         )
        )
        (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
        (br_if $label$28
         (i32.eqz
          (local.tee $1
           (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
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
         (local.get $7)
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
        (br $label$27)
       )
       (call $_RNvNtNtCs8hZryZq3oeI_4core5slice5index16slice_index_fail
        (local.get $2)
        (local.get $7)
        (local.get $7)
        (i32.const 1051008)
       )
       (unreachable)
      )
      (i32.store offset=16
       (local.get $4)
       (local.get $3)
      )
      (i32.store offset=12
       (local.get $4)
       (i32.const 1)
      )
      (br $label$27)
     )
     (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
      (i32.const 4)
      (i32.const 8)
     )
     (unreachable)
    )
    (i32.store offset=8
     (local.get $0)
     (i32.load offset=16
      (local.get $4)
     )
    )
    (i64.store align=4
     (local.get $0)
     (i64.load offset=8
      (local.get $4)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $2)
     )
    )
   )
   (br_if $label$1
    (i32.gt_u
     (i32.add
      (local.get $5)
      (i32.const -1)
     )
     (i32.const -4)
    )
   )
   (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
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
 (func $_RNvNtNtCsbodFP5rPXOh_10num_bigint7biguint5shift12biguint_shr2 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
           (br_table $label$9 $label$8 $label$7
            (i32.add
             (local.tee $5
              (i32.load
               (local.get $1)
              )
             )
             (i32.const 2)
            )
           )
          )
          (block $label$10
           (block $label$11
            (block $label$12
             (block $label$13
              (br_if $label$13
               (i32.ne
                (i32.load
                 (local.tee $1
                  (i32.load offset=4
                   (local.get $1)
                  )
                 )
                )
                (i32.const -1)
               )
              )
              (br_if $label$12
               (i32.ge_u
                (local.get $2)
                (i32.load offset=4
                 (local.get $1)
                )
               )
              )
              (local.set $1
               (i32.add
                (local.get $1)
                (i32.const 8)
               )
              )
              (local.set $6
               (i32.const 1)
              )
              (br $label$10)
             )
             (br_if $label$11
              (i32.lt_u
               (local.get $2)
               (local.tee $6
                (i32.load offset=8
                 (local.get $1)
                )
               )
              )
             )
            )
            (i32.store offset=8
             (local.get $0)
             (i32.load offset=1050768
              (i32.const 0)
             )
            )
            (i64.store align=4
             (local.get $0)
             (i64.load offset=1050760 align=4
              (i32.const 0)
             )
            )
            (br $label$1)
           )
           (local.set $1
            (i32.load offset=4
             (local.get $1)
            )
           )
          )
          (local.set $5
           (i32.add
            (local.get $1)
            (i32.shl
             (local.get $2)
             (i32.const 2)
            )
           )
          )
          (block $label$14
           (block $label$15
            (block $label$16
             (br_table $label$16 $label$15 $label$14
              (local.tee $6
               (i32.sub
                (local.get $6)
                (local.get $2)
               )
              )
             )
            )
            (local.set $1
             (i32.const 0)
            )
            (i32.store offset=8
             (local.get $4)
             (i32.load offset=1050768
              (i32.const 0)
             )
            )
            (i64.store
             (local.get $4)
             (i64.load offset=1050760 align=4
              (i32.const 0)
             )
            )
            (local.set $5
             (i32.const 1)
            )
            (br $label$2)
           )
           (i64.store align=4
            (local.get $4)
            (i64.const 8589934591)
           )
           (i32.store offset=8
            (local.get $4)
            (local.tee $6
             (i32.load
              (local.get $5)
             )
            )
           )
           (local.set $1
            (i32.const 1)
           )
           (local.set $5
            (i32.const 1)
           )
           (br $label$2)
          )
          (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
          (br_if $label$5
           (i32.eqz
            (local.tee $1
             (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
              (local.tee $2
               (i32.shl
                (local.get $6)
                (i32.const 2)
               )
              )
              (i32.const 4)
             )
            )
           )
          )
          (block $label$17
           (br_if $label$17
            (i32.eqz
             (local.get $2)
            )
           )
           (memory.copy
            (local.get $1)
            (local.get $5)
            (local.get $2)
           )
          )
          (i32.store offset=8
           (local.get $4)
           (local.get $6)
          )
          (i32.store offset=4
           (local.get $4)
           (local.get $1)
          )
          (i32.store
           (local.get $4)
           (local.get $6)
          )
          (local.set $5
           (i32.const 0)
          )
          (br $label$2)
         )
         (br_if $label$6
          (i32.ge_u
           (local.get $2)
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
         (local.set $6
          (i32.load offset=8
           (local.get $1)
          )
         )
         (local.set $2
          (i32.const -1)
         )
         (local.set $1
          (i32.const 1)
         )
         (br $label$3)
        )
        (br_if $label$4
         (i32.gt_u
          (local.tee $6
           (i32.load offset=8
            (local.get $1)
           )
          )
          (local.get $2)
         )
        )
       )
       (i32.store offset=8
        (local.get $0)
        (i32.load offset=8
         (local.get $1)
        )
       )
       (i64.store align=4
        (local.get $0)
        (local.tee $7
         (i64.load align=4
          (local.get $1)
         )
        )
       )
       (block $label$18
        (br_if $label$18
         (i32.eq
          (i32.wrap_i64
           (local.get $7)
          )
          (i32.const -1)
         )
        )
        (i32.store offset=8
         (local.get $0)
         (i32.const 0)
        )
        (br $label$1)
       )
       (i32.store offset=4
        (local.get $0)
        (i32.const 0)
       )
       (br $label$1)
      )
      (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
       (i32.const 4)
       (local.get $2)
      )
      (unreachable)
     )
     (local.set $6
      (i32.sub
       (local.get $6)
       (local.get $2)
      )
     )
     (local.set $8
      (i32.load offset=4
       (local.get $1)
      )
     )
     (block $label$19
      (br_if $label$19
       (i32.eqz
        (local.get $2)
       )
      )
      (br_if $label$19
       (i32.eqz
        (local.tee $1
         (i32.shl
          (local.get $6)
          (i32.const 2)
         )
        )
       )
      )
      (memory.copy
       (local.get $8)
       (i32.add
        (local.get $8)
        (i32.shl
         (local.get $2)
         (i32.const 2)
        )
       )
       (local.get $1)
      )
     )
     (block $label$20
      (br_if $label$20
       (i32.ge_u
        (local.get $6)
        (i32.shr_u
         (local.get $5)
         (i32.const 1)
        )
       )
      )
      (block $label$21
       (block $label$22
        (block $label$23
         (br_table $label$23 $label$22 $label$21
          (local.get $6)
         )
        )
        (local.set $2
         (i32.const -1)
        )
        (local.set $1
         (i32.const 0)
        )
        (block $label$24
         (br_if $label$24
          (i32.eqz
           (local.get $5)
          )
         )
         (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
          (local.get $8)
          (i32.shl
           (local.get $5)
           (i32.const 2)
          )
          (i32.const 4)
         )
        )
        (br $label$3)
       )
       (local.set $6
        (i32.load
         (local.get $8)
        )
       )
       (local.set $2
        (i32.const -1)
       )
       (local.set $1
        (i32.const 1)
       )
       (br_if $label$3
        (i32.eqz
         (local.get $5)
        )
       )
       (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
        (local.get $8)
        (i32.shl
         (local.get $5)
         (i32.const 2)
        )
        (i32.const 4)
       )
       (br $label$3)
      )
      (br_if $label$20
       (i32.le_u
        (local.get $5)
        (local.tee $2
         (i32.add
          (local.get $6)
          (i32.const 1)
         )
        )
       )
      )
      (br_if $label$3
       (local.tee $1
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_realloc
         (local.get $8)
         (i32.shl
          (local.get $5)
          (i32.const 2)
         )
         (i32.const 4)
         (local.tee $5
          (i32.shl
           (local.get $2)
           (i32.const 2)
          )
         )
        )
       )
      )
      (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
       (i32.const 4)
       (local.get $5)
      )
      (unreachable)
     )
     (local.set $1
      (local.get $8)
     )
     (local.set $2
      (local.get $5)
     )
    )
    (i32.store offset=8
     (local.get $4)
     (local.get $6)
    )
    (i32.store offset=4
     (local.get $4)
     (local.get $1)
    )
    (i32.store
     (local.get $4)
     (local.get $2)
    )
    (local.set $5
     (i32.eq
      (local.get $2)
      (i32.const -1)
     )
    )
   )
   (block $label$25
    (br_if $label$25
     (i32.eqz
      (local.tee $2
       (i32.and
        (local.get $3)
        (i32.const 255)
       )
      )
     )
    )
    (block $label$26
     (br_if $label$26
      (i32.gt_u
       (local.get $2)
       (i32.const 32)
      )
     )
     (block $label$27
      (block $label$28
       (block $label$29
        (block $label$30
         (block $label$31
          (br_if $label$31
           (i32.eqz
            (local.get $5)
           )
          )
          (local.set $2
           (i32.const 0)
          )
          (br_if $label$29
           (i32.ne
            (local.get $1)
            (i32.const 1)
           )
          )
          (local.set $1
           (i32.add
            (local.get $4)
            (i32.const 8)
           )
          )
          (local.set $5
           (i32.const 4)
          )
          (br $label$30)
         )
         (br_if $label$25
          (i32.eqz
           (local.get $6)
          )
         )
         (local.set $5
          (i32.shl
           (local.get $6)
           (i32.const 2)
          )
         )
        )
        (br_if $label$28
         (i32.eq
          (local.tee $2
           (i32.and
            (local.get $3)
            (i32.const 255)
           )
          )
          (i32.const 32)
         )
        )
        (local.set $6
         (i32.and
          (i32.sub
           (i32.const 32)
           (local.get $3)
          )
          (i32.const 255)
         )
        )
        (local.set $1
         (i32.add
          (local.get $1)
          (local.get $5)
         )
        )
        (local.set $5
         (i32.and
          (local.tee $9
           (i32.add
            (i32.shr_u
             (local.tee $8
              (i32.add
               (local.get $5)
               (i32.const -4)
              )
             )
             (i32.const 2)
            )
            (i32.const 1)
           )
          )
          (i32.const 3)
         )
        )
        (local.set $3
         (i32.const 0)
        )
        (block $label$32
         (block $label$33
          (br_if $label$33
           (i32.lt_u
            (local.get $8)
            (i32.const 12)
           )
          )
          (local.set $8
           (i32.and
            (local.get $9)
            (i32.const 2147483644)
           )
          )
          (local.set $3
           (i32.const 0)
          )
          (loop $label$34
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
             (local.get $3)
            )
           )
           (i32.store
            (local.tee $3
             (i32.add
              (local.get $1)
              (i32.const -8)
             )
            )
            (i32.or
             (i32.shr_u
              (local.tee $3
               (i32.load
                (local.get $3)
               )
              )
              (local.get $2)
             )
             (i32.shl
              (local.get $9)
              (local.get $6)
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
              (local.get $3)
              (local.get $6)
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
              (local.tee $3
               (i32.load
                (local.get $1)
               )
              )
              (local.get $2)
             )
             (i32.shl
              (local.get $9)
              (local.get $6)
             )
            )
           )
           (local.set $3
            (i32.shl
             (local.get $3)
             (local.get $6)
            )
           )
           (br_if $label$34
            (local.tee $8
             (i32.add
              (local.get $8)
              (i32.const -4)
             )
            )
           )
          )
          (br_if $label$32
           (i32.eqz
            (local.get $5)
           )
          )
         )
         (local.set $1
          (i32.add
           (local.get $1)
           (i32.const -4)
          )
         )
         (loop $label$35
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
            (local.get $3)
           )
          )
          (local.set $1
           (i32.add
            (local.get $1)
            (i32.const -4)
           )
          )
          (local.set $3
           (i32.shl
            (local.get $8)
            (local.get $6)
           )
          )
          (br_if $label$35
           (local.tee $5
            (i32.add
             (local.get $5)
             (i32.const -1)
            )
           )
          )
         )
        )
        (br_if $label$27
         (i32.ne
          (i32.load
           (local.get $4)
          )
          (i32.const -1)
         )
        )
        (local.set $6
         (i32.load offset=8
          (local.get $4)
         )
        )
        (local.set $2
         (i32.load offset=4
          (local.get $4)
         )
        )
       )
       (i32.store offset=4
        (local.get $4)
        (select
         (select
          (local.get $2)
          (i32.const 0)
          (local.get $6)
         )
         (local.get $2)
         (local.get $2)
        )
       )
       (br $label$25)
      )
      (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shr_overflow
       (i32.const 1051040)
      )
      (unreachable)
     )
     (br_if $label$25
      (i32.eqz
       (local.tee $1
        (i32.load offset=8
         (local.get $4)
        )
       )
      )
     )
     (br_if $label$25
      (i32.load
       (i32.add
        (i32.add
         (i32.load offset=4
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
     (i32.store offset=8
      (local.get $4)
      (i32.add
       (local.get $1)
       (i32.const -1)
      )
     )
     (br $label$25)
    )
    (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow
     (i32.const 1051024)
    )
    (unreachable)
   )
   (i32.store offset=8
    (local.get $0)
    (i32.load offset=8
     (local.get $4)
    )
   )
   (i64.store align=4
    (local.get $0)
    (i64.load
     (local.get $4)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 16)
   )
  )
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc18___rust_start_panic (param $0 i32) (param $1 i32) (result i32)
  (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_abort)
  (unreachable)
 )
 (func $_RINvNtCs8hZryZq3oeI_4core3ptr9drop_glueNtNtCshrt81WbuBY1_5alloc6string6StringECs4BkbFkxXoBt_3std (param $0 i32)
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
   (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
    (i32.load offset=4
     (local.get $0)
    )
    (local.get $1)
    (i32.const 1)
   )
  )
 )
 (func $_RINvNtCs8hZryZq3oeI_4core3ptr9drop_glueNtNvNtCs4BkbFkxXoBt_3std9panicking13panic_handler19FormatStringPayloadEBH_ (param $0 i32)
  (local $1 i32)
  (block $label$1
   (br_if $label$1
    (i32.lt_s
     (local.tee $1
      (i32.load
       (local.get $0)
      )
     )
     (i32.const 1)
    )
   )
   (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_dealloc
    (i32.load offset=4
     (local.get $0)
    )
    (local.get $1)
    (i32.const 1)
   )
  )
 )
 (func $_RINvNtNtCs4BkbFkxXoBt_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_ (param $0 i32)
  (call $_RNCNvNtCs4BkbFkxXoBt_3std5alloc8rust_oom0B5_
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNCNvNtCs4BkbFkxXoBt_3std5alloc8rust_oom0B5_ (param $0 i32)
  (call_indirect $0 (type $2)
   (i32.load
    (local.get $0)
   )
   (i32.load offset=4
    (local.get $0)
   )
   (select
    (local.tee $0
     (i32.load offset=1052460
      (i32.const 0)
     )
    )
    (i32.const 18)
    (local.get $0)
   )
  )
  (unreachable)
 )
 (func $_RINvNtNtCs4BkbFkxXoBt_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_ (param $0 i32)
  (call $_RNCNvNtCs4BkbFkxXoBt_3std9panicking13panic_handler0B5_
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNCNvNtCs4BkbFkxXoBt_3std9panicking13panic_handler0B5_ (param $0 i32)
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
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (local.tee $3
       (i32.load offset=4
        (local.tee $2
         (i32.load
          (local.get $0)
         )
        )
       )
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.load
     (local.get $2)
    )
   )
   (i32.store offset=4
    (local.get $1)
    (i32.shr_u
     (local.get $3)
     (i32.const 1)
    )
   )
   (i32.store
    (local.get $1)
    (local.get $2)
   )
   (call $_RNvNtCs4BkbFkxXoBt_3std9panicking15panic_with_hook
    (local.get $1)
    (i32.const 1051080)
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
  (i32.store
   (local.get $1)
   (i32.const -1)
  )
  (i32.store offset=12
   (local.get $1)
   (local.get $0)
  )
  (call $_RNvNtCs4BkbFkxXoBt_3std9panicking15panic_with_hook
   (local.get $1)
   (i32.const 1051108)
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
 (func $_RINvNvMs2_NtCshrt81WbuBY1_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ge_u
     (local.tee $1
      (i32.add
       (local.get $2)
       (local.get $1)
      )
     )
     (local.get $2)
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
    (i32.const 0)
    (i32.const 0)
   )
   (unreachable)
  )
  (call $_RNvMs5_NtCshrt81WbuBY1_5alloc7raw_vecNtB5_11RawVecInner11finish_growCs4BkbFkxXoBt_3std
   (i32.add
    (local.get $5)
    (i32.const 4)
   )
   (local.tee $2
    (i32.load
     (local.get $0)
    )
   )
   (i32.load offset=4
    (local.get $0)
   )
   (local.tee $2
    (select
     (local.tee $2
      (select
       (local.get $1)
       (local.tee $2
        (i32.shl
         (local.get $2)
         (i32.const 1)
        )
       )
       (i32.gt_u
        (local.get $1)
        (local.get $2)
       )
      )
     )
     (local.tee $1
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
      (local.get $1)
     )
    )
   )
   (local.get $3)
   (local.get $4)
  )
  (block $label$2
   (br_if $label$2
    (i32.ne
     (i32.load offset=4
      (local.get $5)
     )
     (i32.const 1)
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error
    (i32.load offset=8
     (local.get $5)
    )
    (i32.load offset=12
     (local.get $5)
    )
   )
   (unreachable)
  )
  (local.set $4
   (i32.load offset=8
    (local.get $5)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $2)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $4)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 16)
   )
  )
 )
 (func $_RNvMs5_NtCshrt81WbuBY1_5alloc7raw_vecNtB5_11RawVecInner11finish_growCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local.set $6
   (i32.const 1)
  )
  (local.set $7
   (i32.const 4)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.wrap_i64
       (i64.shr_u
        (local.tee $8
         (i64.mul
          (i64.extend_i32_u
           (local.get $5)
          )
          (i64.extend_i32_u
           (local.get $3)
          )
         )
        )
        (i64.const 32)
       )
      )
     )
    )
    (local.set $3
     (i32.const 0)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i32.le_u
      (local.tee $3
       (i32.wrap_i64
        (local.get $8)
       )
      )
      (i32.sub
       (i32.const -2147483648)
       (local.get $4)
      )
     )
    )
    (local.set $3
     (i32.const 0)
    )
    (br $label$1)
   )
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (br_if $label$7
        (i32.eqz
         (local.get $1)
        )
       )
       (local.set $7
        (call $_RNvCsdtSMxSA38aw_7___rustc14___rust_realloc
         (local.get $2)
         (i32.mul
          (local.get $5)
          (local.get $1)
         )
         (local.get $4)
         (local.get $3)
        )
       )
       (br $label$6)
      )
      (block $label$8
       (br_if $label$8
        (local.get $3)
       )
       (local.set $7
        (local.get $4)
       )
       (br $label$5)
      )
      (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
      (local.set $7
       (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
        (local.get $3)
        (local.get $4)
       )
      )
     )
     (br_if $label$5
      (local.get $7)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $4)
     )
     (br $label$4)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $7)
    )
    (local.set $6
     (i32.const 0)
    )
   )
   (local.set $7
    (i32.const 8)
   )
  )
  (i32.store
   (i32.add
    (local.get $0)
    (local.get $7)
   )
   (local.get $3)
  )
  (i32.store
   (local.get $0)
   (local.get $6)
  )
 )
 (func $_RNvNtCs4BkbFkxXoBt_3std9panicking15panic_with_hook (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (block $label$8
          (br_table $label$4 $label$7 $label$8 $label$7
           (i32.and
            (call $_RNvNtNtCs4BkbFkxXoBt_3std9panicking11panic_count8increase
             (i32.const 1)
            )
            (i32.const 255)
           )
          )
         )
         (br_if $label$4
          (i32.le_s
           (local.tee $6
            (i32.load offset=1052464
             (i32.const 0)
            )
           )
           (i32.const -1)
          )
         )
         (br_if $label$3
          (i32.lt_s
           (local.tee $7
            (i32.add
             (local.get $6)
             (i32.const 1)
            )
           )
           (local.get $6)
          )
         )
         (i32.store offset=1052464
          (i32.const 0)
          (local.get $7)
         )
         (br_if $label$6
          (i32.load offset=1052468
           (i32.const 0)
          )
         )
         (i32.store offset=1052464
          (i32.const 0)
          (i32.add
           (local.get $7)
           (i32.const -1)
          )
         )
         (br $label$5)
        )
        (call_indirect $0 (type $2)
         (local.get $5)
         (local.get $0)
         (i32.load offset=24
          (local.get $1)
         )
        )
        (unreachable)
       )
       (call_indirect $0 (type $2)
        (i32.add
         (local.get $5)
         (i32.const 8)
        )
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
        (i64.load offset=8
         (local.get $5)
        )
       )
       (call_indirect $0 (type $2)
        (i32.load offset=1052468
         (i32.const 0)
        )
        (i32.add
         (local.get $5)
         (i32.const 16)
        )
        (i32.load offset=20
         (i32.load offset=1052472
          (i32.const 0)
         )
        )
       )
       (i32.store offset=1052464
        (i32.const 0)
        (i32.add
         (local.tee $5
          (i32.load offset=1052464
           (i32.const 0)
          )
         )
         (i32.const -1)
        )
       )
       (br_if $label$2
        (i32.le_s
         (local.get $5)
         (i32.const 0)
        )
       )
      )
      (i32.store8 offset=1052456
       (i32.const 0)
       (i32.const 0)
      )
      (br_if $label$1
       (local.get $3)
      )
     )
     (unreachable)
    )
    (call $_RNvNtCs8hZryZq3oeI_4core6option13expect_failed
     (i32.const 1051312)
     (i32.const 28)
     (i32.const 1051340)
    )
    (unreachable)
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
    (i32.const 1051388)
    (i32.const 77)
    (i32.const 1051428)
   )
   (unreachable)
  )
  (call $_RNvCsdtSMxSA38aw_7___rustc10rust_panic
   (local.get $0)
   (local.get $1)
  )
  (unreachable)
 )
 (func $_RNvNtCs4BkbFkxXoBt_3std5alloc24default_alloc_error_hook (param $0 i32) (param $1 i32)
  (i32.store8 offset=1052480
   (i32.const 0)
   (i32.const 1)
  )
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc10rust_panic (param $0 i32) (param $1 i32)
  (drop
   (call $_RNvCsdtSMxSA38aw_7___rustc18___rust_start_panic
    (local.get $0)
    (local.get $1)
   )
  )
  (unreachable)
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc11___rdl_alloc (param $0 i32) (param $1 i32) (result i32)
  (block $label$1
   (br_if $label$1
    (i32.lt_u
     (local.get $1)
     (i32.const 9)
    )
   )
   (return
    (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCs4BkbFkxXoBt_3std
     (local.get $1)
     (local.get $0)
    )
   )
  )
  (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCs4BkbFkxXoBt_3std
   (local.get $0)
  )
 )
 (func $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32) (result i32)
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
      (select
       (local.tee $3
        (i32.add
         (i32.and
          (i32.sub
           (i32.const -48)
           (i32.load offset=1052444
            (i32.const 0)
           )
          )
          (i32.const -9)
         )
         (i32.const -3)
        )
       )
       (i32.const -64)
       (i32.lt_u
        (local.get $3)
        (i32.const -64)
       )
      )
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
      (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCs4BkbFkxXoBt_3std
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
     (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCs4BkbFkxXoBt_3std
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
    (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCs4BkbFkxXoBt_3std
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
 (func $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCs4BkbFkxXoBt_3std (param $0 i32) (result i32)
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
      (br_if $label$4
       (i32.lt_u
        (local.get $0)
        (i32.const 245)
       )
      )
      (local.set $2
       (i32.const 0)
      )
      (br_if $label$1
       (i32.ge_u
        (local.get $0)
        (select
         (local.tee $3
          (i32.add
           (i32.and
            (i32.sub
             (i32.const -48)
             (i32.load offset=1052444
              (i32.const 0)
             )
            )
            (i32.const -9)
           )
           (i32.const -3)
          )
         )
         (i32.const -64)
         (i32.lt_u
          (local.get $3)
          (i32.const -64)
         )
        )
       )
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
      (br_if $label$2
       (i32.eqz
        (local.tee $4
         (i32.load offset=1052404
          (i32.const 0)
         )
        )
       )
      )
      (local.set $5
       (i32.const 31)
      )
      (br_if $label$3
       (i32.ge_u
        (local.get $0)
        (i32.const 16777205)
       )
      )
      (local.set $5
       (i32.xor
        (i32.or
         (i32.and
          (i32.shr_u
           (local.get $3)
           (i32.sub
            (i32.const 38)
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
      (br $label$3)
     )
     (block $label$5
      (block $label$6
       (block $label$7
        (block $label$8
         (block $label$9
          (block $label$10
           (br_if $label$10
            (i32.eqz
             (i32.and
              (local.tee $0
               (i32.shr_u
                (local.tee $6
                 (i32.load offset=1052400
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
           (br_if $label$9
            (i32.eq
             (local.tee $2
              (i32.add
               (local.tee $0
                (i32.shl
                 (local.tee $7
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
               (i32.const 1052136)
              )
             )
             (local.tee $8
              (i32.load offset=8
               (local.tee $3
                (i32.load
                 (i32.add
                  (local.get $0)
                  (i32.const 1052144)
                 )
                )
               )
              )
             )
            )
           )
           (i32.store offset=12
            (local.get $8)
            (local.get $2)
           )
           (i32.store offset=8
            (local.get $2)
            (local.get $8)
           )
           (br $label$8)
          )
          (br_if $label$2
           (i32.le_u
            (local.get $3)
            (i32.load offset=1052408
             (i32.const 0)
            )
           )
          )
          (block $label$11
           (br_if $label$11
            (local.get $0)
           )
           (br_if $label$2
            (i32.eqz
             (local.tee $0
              (i32.load offset=1052404
               (i32.const 0)
              )
             )
            )
           )
           (local.set $2
            (i32.sub
             (i32.and
              (i32.load offset=4
               (local.tee $8
                (i32.load
                 (i32.add
                  (i32.shl
                   (i32.ctz
                    (local.get $0)
                   )
                   (i32.const 2)
                  )
                  (i32.const 1051992)
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
            (local.get $8)
           )
           (block $label$12
            (loop $label$13
             (block $label$14
              (br_if $label$14
               (local.tee $0
                (i32.load offset=16
                 (local.get $8)
                )
               )
              )
              (br_if $label$12
               (i32.eqz
                (local.tee $0
                 (i32.load offset=20
                  (local.get $8)
                 )
                )
               )
              )
             )
             (local.set $2
              (select
               (local.tee $8
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
               (local.tee $8
                (i32.lt_u
                 (local.get $8)
                 (local.get $2)
                )
               )
              )
             )
             (local.set $6
              (select
               (local.get $0)
               (local.get $6)
               (local.get $8)
              )
             )
             (local.set $8
              (local.get $0)
             )
             (br $label$13)
            )
           )
           (local.set $5
            (i32.load offset=24
             (local.get $6)
            )
           )
           (block $label$15
            (block $label$16
             (block $label$17
              (br_if $label$17
               (i32.ne
                (local.tee $0
                 (i32.load offset=12
                  (local.get $6)
                 )
                )
                (local.get $6)
               )
              )
              (br_if $label$16
               (local.tee $8
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
              (br $label$15)
             )
             (i32.store offset=12
              (local.tee $8
               (i32.load offset=8
                (local.get $6)
               )
              )
              (local.get $0)
             )
             (i32.store offset=8
              (local.get $0)
              (local.get $8)
             )
             (br $label$15)
            )
            (local.set $7
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
            (loop $label$18
             (local.set $9
              (local.get $7)
             )
             (local.set $7
              (select
               (i32.add
                (local.tee $0
                 (local.get $8)
                )
                (i32.const 20)
               )
               (i32.add
                (local.get $0)
                (i32.const 16)
               )
               (local.tee $8
                (i32.load offset=20
                 (local.get $0)
                )
               )
              )
             )
             (br_if $label$18
              (local.tee $8
               (i32.load
                (i32.add
                 (local.get $0)
                 (select
                  (i32.const 20)
                  (i32.const 16)
                  (local.get $8)
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
           (br_if $label$5
            (i32.eqz
             (local.get $5)
            )
           )
           (block $label$19
            (block $label$20
             (br_if $label$20
              (i32.eq
               (local.get $6)
               (i32.load
                (local.tee $8
                 (i32.add
                  (i32.shl
                   (i32.load offset=28
                    (local.get $6)
                   )
                   (i32.const 2)
                  )
                  (i32.const 1051992)
                 )
                )
               )
              )
             )
             (block $label$21
              (br_if $label$21
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
              (br_if $label$19
               (local.get $0)
              )
              (br $label$5)
             )
             (i32.store offset=16
              (local.get $5)
              (local.get $0)
             )
             (br_if $label$19
              (local.get $0)
             )
             (br $label$5)
            )
            (i32.store
             (local.get $8)
             (local.get $0)
            )
            (br_if $label$6
             (i32.eqz
              (local.get $0)
             )
            )
           )
           (i32.store offset=24
            (local.get $0)
            (local.get $5)
           )
           (block $label$22
            (br_if $label$22
             (i32.eqz
              (local.tee $8
               (i32.load offset=16
                (local.get $6)
               )
              )
             )
            )
            (i32.store offset=16
             (local.get $0)
             (local.get $8)
            )
            (i32.store offset=24
             (local.get $8)
             (local.get $0)
            )
           )
           (br_if $label$5
            (i32.eqz
             (local.tee $8
              (i32.load offset=20
               (local.get $6)
              )
             )
            )
           )
           (i32.store offset=20
            (local.get $0)
            (local.get $8)
           )
           (i32.store offset=24
            (local.get $8)
            (local.get $0)
           )
           (br $label$5)
          )
          (block $label$23
           (block $label$24
            (br_if $label$24
             (i32.eq
              (local.tee $8
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
                (i32.const 1052136)
               )
              )
              (local.tee $7
               (i32.load offset=8
                (local.tee $0
                 (i32.load
                  (i32.add
                   (local.get $2)
                   (i32.const 1052144)
                  )
                 )
                )
               )
              )
             )
            )
            (i32.store offset=12
             (local.get $7)
             (local.get $8)
            )
            (i32.store offset=8
             (local.get $8)
             (local.get $7)
            )
            (br $label$23)
           )
           (i32.store offset=1052400
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
          (i32.store
           (i32.add
            (local.get $0)
            (local.get $2)
           )
           (local.tee $8
            (i32.sub
             (local.get $2)
             (local.get $3)
            )
           )
          )
          (i32.store offset=4
           (local.tee $6
            (i32.add
             (local.get $0)
             (local.get $3)
            )
           )
           (i32.or
            (local.get $8)
            (i32.const 1)
           )
          )
          (br_if $label$7
           (i32.eqz
            (local.tee $3
             (i32.load offset=1052408
              (i32.const 0)
             )
            )
           )
          )
          (local.set $2
           (i32.load offset=1052416
            (i32.const 0)
           )
          )
          (block $label$25
           (block $label$26
            (br_if $label$26
             (i32.and
              (local.tee $7
               (i32.load offset=1052400
                (i32.const 0)
               )
              )
              (local.tee $9
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
            (i32.store offset=1052400
             (i32.const 0)
             (i32.or
              (local.get $7)
              (local.get $9)
             )
            )
            (local.set $7
             (local.tee $3
              (i32.add
               (i32.and
                (local.get $3)
                (i32.const -8)
               )
               (i32.const 1052136)
              )
             )
            )
            (br $label$25)
           )
           (local.set $7
            (i32.add
             (local.tee $3
              (i32.and
               (local.get $3)
               (i32.const -8)
              )
             )
             (i32.const 1052136)
            )
           )
           (local.set $3
            (i32.load
             (i32.add
              (local.get $3)
              (i32.const 1052144)
             )
            )
           )
          )
          (i32.store offset=8
           (local.get $7)
           (local.get $2)
          )
          (i32.store offset=12
           (local.get $3)
           (local.get $2)
          )
          (i32.store offset=12
           (local.get $2)
           (local.get $7)
          )
          (i32.store offset=8
           (local.get $2)
           (local.get $3)
          )
          (br $label$7)
         )
         (i32.store offset=1052400
          (i32.const 0)
          (i32.and
           (local.get $6)
           (i32.rotl
            (i32.const -2)
            (local.get $7)
           )
          )
         )
        )
        (local.set $2
         (i32.add
          (local.get $3)
          (i32.const 8)
         )
        )
        (i32.store offset=4
         (local.get $3)
         (i32.or
          (local.get $0)
          (i32.const 3)
         )
        )
        (i32.store offset=4
         (local.tee $0
          (i32.add
           (local.get $3)
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
        (br $label$1)
       )
       (local.set $2
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
       )
       (i32.store offset=1052416
        (i32.const 0)
        (local.get $6)
       )
       (i32.store offset=1052408
        (i32.const 0)
        (local.get $8)
       )
       (br $label$1)
      )
      (i32.store offset=1052404
       (i32.const 0)
       (i32.and
        (i32.load offset=1052404
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
     (block $label$27
      (block $label$28
       (block $label$29
        (br_if $label$29
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
         (local.tee $8
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
          (local.get $8)
          (local.get $2)
         )
         (local.get $2)
        )
        (br_if $label$28
         (i32.eqz
          (local.tee $7
           (i32.load offset=1052408
            (i32.const 0)
           )
          )
         )
        )
        (local.set $0
         (i32.load offset=1052416
          (i32.const 0)
         )
        )
        (block $label$30
         (block $label$31
          (br_if $label$31
           (i32.and
            (local.tee $9
             (i32.load offset=1052400
              (i32.const 0)
             )
            )
            (local.tee $5
             (i32.shl
              (i32.const 1)
              (i32.shr_u
               (local.get $7)
               (i32.const 3)
              )
             )
            )
           )
          )
          (i32.store offset=1052400
           (i32.const 0)
           (i32.or
            (local.get $9)
            (local.get $5)
           )
          )
          (local.set $9
           (local.tee $7
            (i32.add
             (i32.and
              (local.get $7)
              (i32.const -8)
             )
             (i32.const 1052136)
            )
           )
          )
          (br $label$30)
         )
         (local.set $9
          (i32.add
           (local.tee $7
            (i32.and
             (local.get $7)
             (i32.const -8)
            )
           )
           (i32.const 1052136)
          )
         )
         (local.set $7
          (i32.load
           (i32.add
            (local.get $7)
            (i32.const 1052144)
           )
          )
         )
        )
        (i32.store offset=8
         (local.get $9)
         (local.get $0)
        )
        (i32.store offset=12
         (local.get $7)
         (local.get $0)
        )
        (i32.store offset=12
         (local.get $0)
         (local.get $9)
        )
        (i32.store offset=8
         (local.get $0)
         (local.get $7)
        )
        (br $label$28)
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
       (br $label$27)
      )
      (i32.store offset=1052416
       (i32.const 0)
       (local.get $8)
      )
      (i32.store offset=1052408
       (i32.const 0)
       (local.get $2)
      )
     )
     (br_if $label$2
      (i32.eqz
       (local.tee $2
        (i32.add
         (local.get $6)
         (i32.const 8)
        )
       )
      )
     )
     (br $label$1)
    )
    (local.set $2
     (i32.sub
      (i32.const 0)
      (local.get $3)
     )
    )
    (block $label$32
     (block $label$33
      (block $label$34
       (block $label$35
        (br_if $label$35
         (local.tee $6
          (i32.load
           (i32.add
            (i32.shl
             (local.get $5)
             (i32.const 2)
            )
            (i32.const 1051992)
           )
          )
         )
        )
        (local.set $8
         (i32.const 0)
        )
        (local.set $0
         (i32.const 0)
        )
        (br $label$34)
       )
       (local.set $8
        (i32.const 0)
       )
       (local.set $7
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
       (local.set $0
        (i32.const 0)
       )
       (loop $label$36
        (block $label$37
         (br_if $label$37
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
         (br_if $label$37
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
         (local.set $8
          (local.get $6)
         )
         (local.set $2
          (local.get $9)
         )
         (br_if $label$37
          (local.get $9)
         )
         (local.set $2
          (i32.const 0)
         )
         (local.set $0
          (local.get $6)
         )
         (local.set $8
          (local.get $6)
         )
         (br $label$33)
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
                 (local.get $7)
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
        (local.set $7
         (i32.shl
          (local.get $7)
          (i32.const 1)
         )
        )
        (br_if $label$36
         (local.get $6)
        )
       )
      )
      (block $label$38
       (br_if $label$38
        (i32.or
         (local.get $0)
         (local.get $8)
        )
       )
       (local.set $8
        (i32.const 0)
       )
       (br_if $label$2
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
          (i32.const 1051992)
         )
        )
       )
      )
      (br_if $label$32
       (i32.eqz
        (local.get $0)
       )
      )
     )
     (loop $label$39
      (local.set $9
       (select
        (local.tee $6
         (i32.sub
          (local.tee $7
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
        (i32.lt_u
         (local.get $6)
         (local.get $2)
        )
       )
      )
      (local.set $7
       (i32.lt_u
        (local.get $7)
        (local.get $3)
       )
      )
      (local.set $5
       (select
        (local.get $8)
        (local.get $0)
        (i32.ge_u
         (local.get $6)
         (local.get $2)
        )
       )
      )
      (block $label$40
       (br_if $label$40
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
      (local.set $2
       (select
        (local.get $2)
        (local.get $9)
        (local.get $7)
       )
      )
      (local.set $8
       (select
        (local.get $8)
        (local.get $5)
        (local.get $7)
       )
      )
      (local.set $0
       (local.get $6)
      )
      (br_if $label$39
       (local.get $6)
      )
     )
    )
    (br_if $label$2
     (i32.eqz
      (local.get $8)
     )
    )
    (block $label$41
     (br_if $label$41
      (i32.lt_u
       (local.tee $0
        (i32.load offset=1052408
         (i32.const 0)
        )
       )
       (local.get $3)
      )
     )
     (br_if $label$2
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
      (local.get $8)
     )
    )
    (block $label$42
     (block $label$43
      (block $label$44
       (br_if $label$44
        (i32.ne
         (local.tee $0
          (i32.load offset=12
           (local.get $8)
          )
         )
         (local.get $8)
        )
       )
       (br_if $label$43
        (local.tee $6
         (i32.load
          (i32.add
           (local.get $8)
           (select
            (i32.const 20)
            (i32.const 16)
            (local.tee $0
             (i32.load offset=20
              (local.get $8)
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
       (br $label$42)
      )
      (i32.store offset=12
       (local.tee $6
        (i32.load offset=8
         (local.get $8)
        )
       )
       (local.get $0)
      )
      (i32.store offset=8
       (local.get $0)
       (local.get $6)
      )
      (br $label$42)
     )
     (local.set $7
      (select
       (i32.add
        (local.get $8)
        (i32.const 20)
       )
       (i32.add
        (local.get $8)
        (i32.const 16)
       )
       (local.get $0)
      )
     )
     (loop $label$45
      (local.set $9
       (local.get $7)
      )
      (local.set $7
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
      (br_if $label$45
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
    (block $label$46
     (br_if $label$46
      (i32.eqz
       (local.get $5)
      )
     )
     (block $label$47
      (block $label$48
       (block $label$49
        (br_if $label$49
         (i32.eq
          (local.get $8)
          (i32.load
           (local.tee $6
            (i32.add
             (i32.shl
              (i32.load offset=28
               (local.get $8)
              )
              (i32.const 2)
             )
             (i32.const 1051992)
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
           (local.get $8)
          )
         )
         (i32.store offset=20
          (local.get $5)
          (local.get $0)
         )
         (br_if $label$48
          (local.get $0)
         )
         (br $label$46)
        )
        (i32.store offset=16
         (local.get $5)
         (local.get $0)
        )
        (br_if $label$48
         (local.get $0)
        )
        (br $label$46)
       )
       (i32.store
        (local.get $6)
        (local.get $0)
       )
       (br_if $label$47
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
           (local.get $8)
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
      (br_if $label$46
       (i32.eqz
        (local.tee $6
         (i32.load offset=20
          (local.get $8)
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
      (br $label$46)
     )
     (i32.store offset=1052404
      (i32.const 0)
      (i32.and
       (i32.load offset=1052404
        (i32.const 0)
       )
       (i32.rotl
        (i32.const -2)
        (i32.load offset=28
         (local.get $8)
        )
       )
      )
     )
    )
    (block $label$52
     (block $label$53
      (br_if $label$53
       (i32.lt_u
        (local.get $2)
        (i32.const 16)
       )
      )
      (i32.store offset=4
       (local.get $8)
       (i32.or
        (local.get $3)
        (i32.const 3)
       )
      )
      (i32.store offset=4
       (local.tee $0
        (i32.add
         (local.get $8)
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
      (block $label$54
       (br_if $label$54
        (i32.lt_u
         (local.get $2)
         (i32.const 256)
        )
       )
       (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCs4BkbFkxXoBt_3std
        (local.get $0)
        (local.get $2)
       )
       (br $label$52)
      )
      (block $label$55
       (block $label$56
        (br_if $label$56
         (i32.and
          (local.tee $6
           (i32.load offset=1052400
            (i32.const 0)
           )
          )
          (local.tee $7
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
        (i32.store offset=1052400
         (i32.const 0)
         (i32.or
          (local.get $6)
          (local.get $7)
         )
        )
        (local.set $6
         (local.tee $2
          (i32.add
           (i32.and
            (local.get $2)
            (i32.const 248)
           )
           (i32.const 1052136)
          )
         )
        )
        (br $label$55)
       )
       (local.set $6
        (i32.add
         (local.tee $2
          (i32.and
           (local.get $2)
           (i32.const 248)
          )
         )
         (i32.const 1052136)
        )
       )
       (local.set $2
        (i32.load
         (i32.add
          (local.get $2)
          (i32.const 1052144)
         )
        )
       )
      )
      (i32.store offset=8
       (local.get $6)
       (local.get $0)
      )
      (i32.store offset=12
       (local.get $2)
       (local.get $0)
      )
      (i32.store offset=12
       (local.get $0)
       (local.get $6)
      )
      (i32.store offset=8
       (local.get $0)
       (local.get $2)
      )
      (br $label$52)
     )
     (i32.store offset=4
      (local.get $8)
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
        (local.get $8)
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
    (br_if $label$1
     (local.tee $2
      (i32.add
       (local.get $8)
       (i32.const 8)
      )
     )
    )
   )
   (block $label$57
    (block $label$58
     (block $label$59
      (block $label$60
       (block $label$61
        (block $label$62
         (block $label$63
          (block $label$64
           (br_if $label$64
            (i32.ge_u
             (local.tee $0
              (i32.load offset=1052408
               (i32.const 0)
              )
             )
             (local.get $3)
            )
           )
           (block $label$65
            (br_if $label$65
             (i32.gt_u
              (local.tee $0
               (i32.load offset=1052412
                (i32.const 0)
               )
              )
              (local.get $3)
             )
            )
            (local.set $2
             (i32.const 0)
            )
            (call $_RNvXs_NtCsh2fK6zObE8o_8dlmalloc3sysNtB4_6SystemNtB6_9Allocator5alloc
             (i32.add
              (local.get $1)
              (i32.const 4)
             )
             (i32.const 1052452)
             (i32.and
              (i32.add
               (i32.add
                (local.get $3)
                (local.tee $0
                 (i32.load offset=1052444
                  (i32.const 0)
                 )
                )
               )
               (i32.const 47)
              )
              (i32.sub
               (i32.const 0)
               (local.get $0)
              )
             )
            )
            (br_if $label$1
             (i32.eqz
              (local.tee $6
               (i32.load offset=4
                (local.get $1)
               )
              )
             )
            )
            (local.set $5
             (i32.load offset=12
              (local.get $1)
             )
            )
            (i32.store offset=1052424
             (i32.const 0)
             (local.tee $0
              (i32.add
               (i32.load offset=1052424
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
            (i32.store offset=1052428
             (i32.const 0)
             (select
              (local.get $0)
              (local.tee $2
               (i32.load offset=1052428
                (i32.const 0)
               )
              )
              (i32.gt_u
               (local.get $0)
               (local.get $2)
              )
             )
            )
            (block $label$66
             (block $label$67
              (block $label$68
               (br_if $label$68
                (i32.eqz
                 (local.tee $2
                  (i32.load offset=1052420
                   (i32.const 0)
                  )
                 )
                )
               )
               (local.set $0
                (i32.const 1052120)
               )
               (loop $label$69
                (br_if $label$67
                 (i32.eq
                  (local.get $6)
                  (i32.add
                   (local.tee $8
                    (i32.load
                     (local.get $0)
                    )
                   )
                   (local.tee $7
                    (i32.load offset=4
                     (local.get $0)
                    )
                   )
                  )
                 )
                )
                (br_if $label$69
                 (local.tee $0
                  (i32.load offset=8
                   (local.get $0)
                  )
                 )
                )
                (br $label$66)
               )
              )
              (br_if $label$60
               (i32.eqz
                (local.tee $0
                 (i32.load offset=1052436
                  (i32.const 0)
                 )
                )
               )
              )
              (br_if $label$60
               (i32.lt_u
                (local.get $6)
                (local.get $0)
               )
              )
              (br $label$58)
             )
             (br_if $label$66
              (i32.ge_u
               (local.get $2)
               (local.get $6)
              )
             )
             (br_if $label$66
              (i32.gt_u
               (local.get $8)
               (local.get $2)
              )
             )
             (br_if $label$66
              (i32.and
               (local.tee $8
                (i32.load offset=12
                 (local.get $0)
                )
               )
               (i32.const 1)
              )
             )
             (br_if $label$63
              (i32.eq
               (i32.shr_u
                (local.get $8)
                (i32.const 1)
               )
               (local.get $5)
              )
             )
            )
            (i32.store offset=1052436
             (i32.const 0)
             (select
              (local.tee $0
               (i32.load offset=1052436
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
            (local.set $8
             (i32.add
              (local.get $6)
              (local.get $9)
             )
            )
            (local.set $0
             (i32.const 1052120)
            )
            (block $label$70
             (block $label$71
              (block $label$72
               (block $label$73
                (loop $label$74
                 (br_if $label$73
                  (i32.eq
                   (local.tee $7
                    (i32.load
                     (local.get $0)
                    )
                   )
                   (local.get $8)
                  )
                 )
                 (br_if $label$74
                  (local.tee $0
                   (i32.load offset=8
                    (local.get $0)
                   )
                  )
                 )
                 (br $label$72)
                )
               )
               (br_if $label$72
                (i32.and
                 (local.tee $8
                  (i32.load offset=12
                   (local.get $0)
                  )
                 )
                 (i32.const 1)
                )
               )
               (br_if $label$71
                (i32.eq
                 (i32.shr_u
                  (local.get $8)
                  (i32.const 1)
                 )
                 (local.get $5)
                )
               )
              )
              (local.set $0
               (i32.const 1052120)
              )
              (loop $label$75
               (block $label$76
                (br_if $label$76
                 (i32.gt_u
                  (local.tee $8
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
                  (local.tee $8
                   (i32.add
                    (local.get $8)
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
               (br $label$75)
              )
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
              (local.tee $6
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
             (local.set $2
              (i32.sub
               (local.tee $8
                (i32.add
                 (i32.and
                  (i32.add
                   (local.get $7)
                   (i32.const 15)
                  )
                  (i32.const -8)
                 )
                 (i32.const -8)
                )
               )
               (local.tee $0
                (i32.add
                 (local.get $6)
                 (local.get $3)
                )
               )
              )
             )
             (br_if $label$62
              (i32.eq
               (local.get $8)
               (i32.load offset=1052420
                (i32.const 0)
               )
              )
             )
             (br_if $label$61
              (i32.eq
               (local.get $8)
               (i32.load offset=1052416
                (i32.const 0)
               )
              )
             )
             (block $label$77
              (br_if $label$77
               (i32.ne
                (i32.and
                 (local.tee $3
                  (i32.load offset=4
                   (local.get $8)
                  )
                 )
                 (i32.const 3)
                )
                (i32.const 1)
               )
              )
              (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std
               (local.get $8)
               (local.tee $3
                (i32.and
                 (local.get $3)
                 (i32.const -8)
                )
               )
              )
              (local.set $2
               (i32.add
                (local.get $3)
                (local.get $2)
               )
              )
              (local.set $3
               (i32.load offset=4
                (local.tee $8
                 (i32.add
                  (local.get $8)
                  (local.get $3)
                 )
                )
               )
              )
             )
             (i32.store offset=4
              (local.get $8)
              (i32.and
               (local.get $3)
               (i32.const -2)
              )
             )
             (i32.store offset=4
              (local.get $0)
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
             (block $label$78
              (br_if $label$78
               (i32.lt_u
                (local.get $2)
                (i32.const 256)
               )
              )
              (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCs4BkbFkxXoBt_3std
               (local.get $0)
               (local.get $2)
              )
              (br $label$59)
             )
             (block $label$79
              (block $label$80
               (br_if $label$80
                (i32.and
                 (local.tee $3
                  (i32.load offset=1052400
                   (i32.const 0)
                  )
                 )
                 (local.tee $8
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
               (i32.store offset=1052400
                (i32.const 0)
                (i32.or
                 (local.get $3)
                 (local.get $8)
                )
               )
               (local.set $3
                (local.tee $2
                 (i32.add
                  (i32.and
                   (local.get $2)
                   (i32.const 248)
                  )
                  (i32.const 1052136)
                 )
                )
               )
               (br $label$79)
              )
              (local.set $3
               (i32.add
                (local.tee $2
                 (i32.and
                  (local.get $2)
                  (i32.const 248)
                 )
                )
                (i32.const 1052136)
               )
              )
              (local.set $2
               (i32.load
                (i32.add
                 (local.get $2)
                 (i32.const 1052144)
                )
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
             (br $label$59)
            )
            (i32.store offset=1052420
             (i32.const 0)
             (local.tee $7
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
            (i32.store offset=1052412
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
             (local.get $7)
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
            (i32.store offset=1052432
             (i32.const 0)
             (i32.const 2097152)
            )
            (i32.store offset=4
             (local.tee $7
              (select
               (local.get $2)
               (local.tee $0
                (i32.add
                 (i32.and
                  (i32.add
                   (local.get $8)
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
             (i64.load offset=1052120 align=4
              (i32.const 0)
             )
            )
            (i64.store align=4
             (i32.add
              (local.get $7)
              (i32.const 16)
             )
             (i64.load offset=1052128 align=4
              (i32.const 0)
             )
            )
            (i64.store align=4
             (local.tee $0
              (i32.add
               (local.get $7)
               (i32.const 8)
              )
             )
             (local.get $10)
            )
            (i32.store offset=1052132
             (i32.const 0)
             (local.get $5)
            )
            (i32.store offset=1052124
             (i32.const 0)
             (local.get $9)
            )
            (i32.store offset=1052120
             (i32.const 0)
             (local.get $6)
            )
            (i32.store offset=1052128
             (i32.const 0)
             (local.get $0)
            )
            (local.set $0
             (i32.add
              (local.get $7)
              (i32.const 28)
             )
            )
            (loop $label$81
             (i32.store
              (local.get $0)
              (i32.const 7)
             )
             (br_if $label$81
              (i32.lt_u
               (local.tee $0
                (i32.add
                 (local.get $0)
                 (i32.const 4)
                )
               )
               (local.get $8)
              )
             )
            )
            (br_if $label$57
             (i32.eq
              (local.get $7)
              (local.get $2)
             )
            )
            (i32.store offset=4
             (local.get $7)
             (i32.and
              (i32.load offset=4
               (local.get $7)
              )
              (i32.const -2)
             )
            )
            (i32.store offset=4
             (local.get $2)
             (i32.or
              (local.tee $0
               (i32.sub
                (local.get $7)
                (local.get $2)
               )
              )
              (i32.const 1)
             )
            )
            (i32.store
             (local.get $7)
             (local.get $0)
            )
            (block $label$82
             (br_if $label$82
              (i32.lt_u
               (local.get $0)
               (i32.const 256)
              )
             )
             (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCs4BkbFkxXoBt_3std
              (local.get $2)
              (local.get $0)
             )
             (br $label$57)
            )
            (block $label$83
             (block $label$84
              (br_if $label$84
               (i32.and
                (local.tee $8
                 (i32.load offset=1052400
                  (i32.const 0)
                 )
                )
                (local.tee $6
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
              (i32.store offset=1052400
               (i32.const 0)
               (i32.or
                (local.get $8)
                (local.get $6)
               )
              )
              (local.set $8
               (local.tee $0
                (i32.add
                 (i32.and
                  (local.get $0)
                  (i32.const 248)
                 )
                 (i32.const 1052136)
                )
               )
              )
              (br $label$83)
             )
             (local.set $8
              (i32.add
               (local.tee $0
                (i32.and
                 (local.get $0)
                 (i32.const 248)
                )
               )
               (i32.const 1052136)
              )
             )
             (local.set $0
              (i32.load
               (i32.add
                (local.get $0)
                (i32.const 1052144)
               )
              )
             )
            )
            (i32.store offset=8
             (local.get $8)
             (local.get $2)
            )
            (i32.store offset=12
             (local.get $0)
             (local.get $2)
            )
            (i32.store offset=12
             (local.get $2)
             (local.get $8)
            )
            (i32.store offset=8
             (local.get $2)
             (local.get $0)
            )
            (br $label$57)
           )
           (i32.store offset=1052412
            (i32.const 0)
            (local.tee $2
             (i32.sub
              (local.get $0)
              (local.get $3)
             )
            )
           )
           (i32.store offset=1052420
            (i32.const 0)
            (local.tee $8
             (i32.add
              (local.tee $0
               (i32.load offset=1052420
                (i32.const 0)
               )
              )
              (local.get $3)
             )
            )
           )
           (i32.store offset=4
            (local.get $8)
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
           (local.set $2
            (i32.add
             (local.get $0)
             (i32.const 8)
            )
           )
           (br $label$1)
          )
          (local.set $2
           (i32.load offset=1052416
            (i32.const 0)
           )
          )
          (block $label$85
           (block $label$86
            (br_if $label$86
             (i32.gt_u
              (local.tee $8
               (i32.sub
                (local.get $0)
                (local.get $3)
               )
              )
              (i32.const 15)
             )
            )
            (i32.store offset=1052416
             (i32.const 0)
             (i32.const 0)
            )
            (i32.store offset=1052408
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
            (br $label$85)
           )
           (i32.store offset=1052408
            (i32.const 0)
            (local.get $8)
           )
           (i32.store offset=1052416
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
             (local.get $8)
             (i32.const 1)
            )
           )
           (i32.store
            (i32.add
             (local.get $2)
             (local.get $0)
            )
            (local.get $8)
           )
           (i32.store offset=4
            (local.get $2)
            (i32.or
             (local.get $3)
             (i32.const 3)
            )
           )
          )
          (local.set $2
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
           (local.get $7)
           (local.get $9)
          )
         )
         (i32.store offset=1052420
          (i32.const 0)
          (local.tee $8
           (i32.add
            (local.tee $2
             (i32.and
              (i32.add
               (local.tee $0
                (i32.load offset=1052420
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
         (i32.store offset=1052412
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
               (i32.load offset=1052412
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
          (local.get $8)
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
         (i32.store offset=1052432
          (i32.const 0)
          (i32.const 2097152)
         )
         (br $label$57)
        )
        (i32.store offset=1052420
         (i32.const 0)
         (local.get $0)
        )
        (i32.store offset=1052412
         (i32.const 0)
         (local.tee $2
          (i32.add
           (i32.load offset=1052412
            (i32.const 0)
           )
           (local.get $2)
          )
         )
        )
        (i32.store offset=4
         (local.get $0)
         (i32.or
          (local.get $2)
          (i32.const 1)
         )
        )
        (br $label$59)
       )
       (i32.store offset=1052416
        (i32.const 0)
        (local.get $0)
       )
       (i32.store offset=1052408
        (i32.const 0)
        (local.tee $2
         (i32.add
          (i32.load offset=1052408
           (i32.const 0)
          )
          (local.get $2)
         )
        )
       )
       (i32.store offset=4
        (local.get $0)
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
       (br $label$59)
      )
      (i32.store offset=1052436
       (i32.const 0)
       (local.get $6)
      )
      (br $label$58)
     )
     (local.set $2
      (i32.add
       (local.get $6)
       (i32.const 8)
      )
     )
     (br $label$1)
    )
    (i32.store offset=1052132
     (i32.const 0)
     (local.get $5)
    )
    (i32.store offset=1052124
     (i32.const 0)
     (local.get $9)
    )
    (i32.store offset=1052120
     (i32.const 0)
     (local.get $6)
    )
    (i32.store offset=1052148
     (i32.const 0)
     (i32.const 1052136)
    )
    (i32.store offset=1052156
     (i32.const 0)
     (i32.const 1052144)
    )
    (i32.store offset=1052144
     (i32.const 0)
     (i32.const 1052136)
    )
    (i32.store offset=1052164
     (i32.const 0)
     (i32.const 1052152)
    )
    (i32.store offset=1052152
     (i32.const 0)
     (i32.const 1052144)
    )
    (i32.store offset=1052172
     (i32.const 0)
     (i32.const 1052160)
    )
    (i32.store offset=1052160
     (i32.const 0)
     (i32.const 1052152)
    )
    (i32.store offset=1052180
     (i32.const 0)
     (i32.const 1052168)
    )
    (i32.store offset=1052168
     (i32.const 0)
     (i32.const 1052160)
    )
    (i32.store offset=1052188
     (i32.const 0)
     (i32.const 1052176)
    )
    (i32.store offset=1052176
     (i32.const 0)
     (i32.const 1052168)
    )
    (i32.store offset=1052196
     (i32.const 0)
     (i32.const 1052184)
    )
    (i32.store offset=1052184
     (i32.const 0)
     (i32.const 1052176)
    )
    (i32.store offset=1052204
     (i32.const 0)
     (i32.const 1052192)
    )
    (i32.store offset=1052192
     (i32.const 0)
     (i32.const 1052184)
    )
    (i32.store offset=1052440
     (i32.const 0)
     (select
      (local.tee $0
       (i32.load offset=1052448
        (i32.const 0)
       )
      )
      (i32.const -1)
      (local.get $0)
     )
    )
    (i32.store offset=1052212
     (i32.const 0)
     (i32.const 1052200)
    )
    (i32.store offset=1052200
     (i32.const 0)
     (i32.const 1052192)
    )
    (i32.store offset=1052208
     (i32.const 0)
     (i32.const 1052200)
    )
    (i32.store offset=1052220
     (i32.const 0)
     (i32.const 1052208)
    )
    (i32.store offset=1052216
     (i32.const 0)
     (i32.const 1052208)
    )
    (i32.store offset=1052228
     (i32.const 0)
     (i32.const 1052216)
    )
    (i32.store offset=1052224
     (i32.const 0)
     (i32.const 1052216)
    )
    (i32.store offset=1052236
     (i32.const 0)
     (i32.const 1052224)
    )
    (i32.store offset=1052232
     (i32.const 0)
     (i32.const 1052224)
    )
    (i32.store offset=1052244
     (i32.const 0)
     (i32.const 1052232)
    )
    (i32.store offset=1052240
     (i32.const 0)
     (i32.const 1052232)
    )
    (i32.store offset=1052252
     (i32.const 0)
     (i32.const 1052240)
    )
    (i32.store offset=1052248
     (i32.const 0)
     (i32.const 1052240)
    )
    (i32.store offset=1052260
     (i32.const 0)
     (i32.const 1052248)
    )
    (i32.store offset=1052268
     (i32.const 0)
     (i32.const 1052256)
    )
    (i32.store offset=1052256
     (i32.const 0)
     (i32.const 1052248)
    )
    (i32.store offset=1052264
     (i32.const 0)
     (i32.const 1052256)
    )
    (i32.store offset=1052276
     (i32.const 0)
     (i32.const 1052264)
    )
    (i32.store offset=1052284
     (i32.const 0)
     (i32.const 1052272)
    )
    (i32.store offset=1052272
     (i32.const 0)
     (i32.const 1052264)
    )
    (i32.store offset=1052280
     (i32.const 0)
     (i32.const 1052272)
    )
    (i32.store offset=1052292
     (i32.const 0)
     (i32.const 1052280)
    )
    (i32.store offset=1052288
     (i32.const 0)
     (i32.const 1052280)
    )
    (i32.store offset=1052300
     (i32.const 0)
     (i32.const 1052288)
    )
    (i32.store offset=1052296
     (i32.const 0)
     (i32.const 1052288)
    )
    (i32.store offset=1052308
     (i32.const 0)
     (i32.const 1052296)
    )
    (i32.store offset=1052304
     (i32.const 0)
     (i32.const 1052296)
    )
    (i32.store offset=1052316
     (i32.const 0)
     (i32.const 1052304)
    )
    (i32.store offset=1052312
     (i32.const 0)
     (i32.const 1052304)
    )
    (i32.store offset=1052324
     (i32.const 0)
     (i32.const 1052312)
    )
    (i32.store offset=1052320
     (i32.const 0)
     (i32.const 1052312)
    )
    (i32.store offset=1052332
     (i32.const 0)
     (i32.const 1052320)
    )
    (i32.store offset=1052328
     (i32.const 0)
     (i32.const 1052320)
    )
    (i32.store offset=1052340
     (i32.const 0)
     (i32.const 1052328)
    )
    (i32.store offset=1052336
     (i32.const 0)
     (i32.const 1052328)
    )
    (i32.store offset=1052348
     (i32.const 0)
     (i32.const 1052336)
    )
    (i32.store offset=1052356
     (i32.const 0)
     (i32.const 1052344)
    )
    (i32.store offset=1052344
     (i32.const 0)
     (i32.const 1052336)
    )
    (i32.store offset=1052364
     (i32.const 0)
     (i32.const 1052352)
    )
    (i32.store offset=1052352
     (i32.const 0)
     (i32.const 1052344)
    )
    (i32.store offset=1052372
     (i32.const 0)
     (i32.const 1052360)
    )
    (i32.store offset=1052360
     (i32.const 0)
     (i32.const 1052352)
    )
    (i32.store offset=1052380
     (i32.const 0)
     (i32.const 1052368)
    )
    (i32.store offset=1052368
     (i32.const 0)
     (i32.const 1052360)
    )
    (i32.store offset=1052388
     (i32.const 0)
     (i32.const 1052376)
    )
    (i32.store offset=1052376
     (i32.const 0)
     (i32.const 1052368)
    )
    (i32.store offset=1052396
     (i32.const 0)
     (i32.const 1052384)
    )
    (i32.store offset=1052384
     (i32.const 0)
     (i32.const 1052376)
    )
    (i32.store offset=1052420
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
    (i32.store offset=1052392
     (i32.const 0)
     (i32.const 1052384)
    )
    (i32.store offset=1052412
     (i32.const 0)
     (local.tee $8
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
      (local.get $8)
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
    (i32.store offset=1052432
     (i32.const 0)
     (i32.const 2097152)
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i32.le_u
     (local.tee $0
      (i32.load offset=1052412
       (i32.const 0)
      )
     )
     (local.get $3)
    )
   )
   (i32.store offset=1052412
    (i32.const 0)
    (local.tee $2
     (i32.sub
      (local.get $0)
      (local.get $3)
     )
    )
   )
   (i32.store offset=1052420
    (i32.const 0)
    (local.tee $8
     (i32.add
      (local.tee $0
       (i32.load offset=1052420
        (i32.const 0)
       )
      )
      (local.get $3)
     )
    )
   )
   (i32.store offset=4
    (local.get $8)
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
   (local.set $2
    (i32.add
     (local.get $0)
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
  (local.get $2)
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc12___rust_abort
  (unreachable)
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc13___rdl_dealloc (param $0 i32) (param $1 i32) (param $2 i32)
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
    (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCs4BkbFkxXoBt_3std
     (local.get $0)
    )
    (return)
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
    (i32.const 1051168)
    (i32.const 46)
    (i32.const 1051216)
   )
   (unreachable)
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
   (i32.const 1051232)
   (i32.const 46)
   (i32.const 1051280)
  )
  (unreachable)
 )
 (func $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCs4BkbFkxXoBt_3std (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
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
       (i32.load offset=1052416
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
     (i32.store offset=1052408
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
    (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std
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
         (block $label$10
          (block $label$11
           (br_if $label$11
            (i32.and
             (local.tee $2
              (i32.load offset=4
               (local.get $3)
              )
             )
             (i32.const 2)
            )
           )
           (br_if $label$9
            (i32.eq
             (local.get $3)
             (i32.load offset=1052420
              (i32.const 0)
             )
            )
           )
           (br_if $label$6
            (i32.eq
             (local.get $3)
             (i32.load offset=1052416
              (i32.const 0)
             )
            )
           )
           (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std
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
           (br_if $label$10
            (i32.ne
             (local.get $1)
             (i32.load offset=1052416
              (i32.const 0)
             )
            )
           )
           (i32.store offset=1052408
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
         (br_if $label$8
          (i32.lt_u
           (local.get $0)
           (i32.const 256)
          )
         )
         (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCs4BkbFkxXoBt_3std
          (local.get $1)
          (local.get $0)
         )
         (local.set $1
          (i32.const 0)
         )
         (i32.store offset=1052440
          (i32.const 0)
          (local.tee $0
           (i32.add
            (i32.load offset=1052440
             (i32.const 0)
            )
            (i32.const -1)
           )
          )
         )
         (br_if $label$7
          (i32.eqz
           (local.get $0)
          )
         )
         (br $label$1)
        )
        (i32.store offset=1052420
         (i32.const 0)
         (local.get $1)
        )
        (i32.store offset=1052412
         (i32.const 0)
         (local.tee $0
          (i32.add
           (i32.load offset=1052412
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
           (i32.load offset=1052416
            (i32.const 0)
           )
          )
         )
         (i32.store offset=1052408
          (i32.const 0)
          (i32.const 0)
         )
         (i32.store offset=1052416
          (i32.const 0)
          (i32.const 0)
         )
        )
        (br_if $label$1
         (i32.le_u
          (local.get $0)
          (local.tee $2
           (i32.load offset=1052432
            (i32.const 0)
           )
          )
         )
        )
        (br_if $label$1
         (i32.eq
          (i32.and
           (i32.sub
            (i32.const -48)
            (local.tee $1
             (i32.load offset=1052444
              (i32.const 0)
             )
            )
           )
           (i32.const -9)
          )
          (i32.const 3)
         )
        )
        (br_if $label$1
         (i32.eqz
          (local.tee $0
           (i32.load offset=1052420
            (i32.const 0)
           )
          )
         )
        )
        (br_if $label$4
         (i32.lt_u
          (local.tee $4
           (i32.load offset=1052412
            (i32.const 0)
           )
          )
          (i32.const 41)
         )
        )
        (br_if $label$5
         (i32.eqz
          (local.get $1)
         )
        )
        (local.set $1
         (i32.const 1052120)
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
       (block $label$15
        (block $label$16
         (br_if $label$16
          (i32.and
           (local.tee $3
            (i32.load offset=1052400
             (i32.const 0)
            )
           )
           (local.tee $2
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
         (i32.store offset=1052400
          (i32.const 0)
          (i32.or
           (local.get $3)
           (local.get $2)
          )
         )
         (local.set $3
          (local.tee $0
           (i32.add
            (i32.and
             (local.get $0)
             (i32.const 248)
            )
            (i32.const 1052136)
           )
          )
         )
         (br $label$15)
        )
        (local.set $3
         (i32.add
          (local.tee $0
           (i32.and
            (local.get $0)
            (i32.const 248)
           )
          )
          (i32.const 1052136)
         )
        )
        (local.set $0
         (i32.load
          (i32.add
           (local.get $0)
           (i32.const 1052144)
          )
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
         (local.tee $0
          (i32.load offset=1052128
           (i32.const 0)
          )
         )
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (loop $label$18
        (local.set $1
         (i32.add
          (local.get $1)
          (i32.const 1)
         )
        )
        (br_if $label$18
         (local.tee $0
          (i32.load offset=8
           (local.get $0)
          )
         )
        )
       )
      )
      (i32.store offset=1052440
       (i32.const 0)
       (select
        (select
         (local.tee $0
          (i32.load offset=1052448
           (i32.const 0)
          )
         )
         (local.get $1)
         (i32.gt_u
          (local.get $0)
          (local.get $1)
         )
        )
        (i32.const -1)
        (local.get $0)
       )
      )
      (return)
     )
     (i32.store offset=1052416
      (i32.const 0)
      (local.get $1)
     )
     (i32.store offset=1052408
      (i32.const 0)
      (local.tee $0
       (i32.add
        (i32.load offset=1052408
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
    (call $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const23panic_const_div_by_zero
     (i32.const 1051296)
    )
    (unreachable)
   )
   (local.set $1
    (i32.const 0)
   )
   (block $label$19
    (br_if $label$19
     (i32.eqz
      (local.tee $0
       (i32.load offset=1052128
        (i32.const 0)
       )
      )
     )
    )
    (local.set $1
     (i32.const 0)
    )
    (loop $label$20
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.const 1)
      )
     )
     (br_if $label$20
      (local.tee $0
       (i32.load offset=8
        (local.get $0)
       )
      )
     )
    )
   )
   (i32.store offset=1052440
    (i32.const 0)
    (select
     (select
      (local.tee $0
       (i32.load offset=1052448
        (i32.const 0)
       )
      )
      (local.get $1)
      (i32.gt_u
       (local.get $0)
       (local.get $1)
      )
     )
     (i32.const -1)
     (local.get $0)
    )
   )
   (br_if $label$1
    (i32.le_u
     (local.get $4)
     (local.get $2)
    )
   )
   (i32.store offset=1052432
    (i32.const 0)
    (i32.const -1)
   )
   (return)
  )
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc13___rdl_realloc (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
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
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (br_if $label$9
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
           (block $label$10
            (br_if $label$10
             (i32.eqz
              (local.get $7)
             )
            )
            (br_if $label$8
             (i32.gt_u
              (local.get $6)
              (local.get $8)
             )
            )
           )
           (block $label$11
            (br_if $label$11
             (i32.lt_u
              (local.get $2)
              (i32.const 9)
             )
            )
            (block $label$12
             (br_if $label$12
              (local.tee $2
               (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE8memalignCs4BkbFkxXoBt_3std
                (local.get $2)
                (local.get $3)
               )
              )
             )
             (return
              (i32.const 0)
             )
            )
            (block $label$13
             (br_if $label$13
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
            (br_if $label$7
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
            (br_if $label$2
             (i32.eqz
              (local.get $3)
             )
            )
            (br_if $label$6
             (i32.gt_u
              (local.get $7)
              (local.get $8)
             )
            )
            (br $label$2)
           )
           (local.set $2
            (i32.const 0)
           )
           (br_if $label$1
            (i32.ge_u
             (local.get $3)
             (select
              (local.tee $1
               (i32.add
                (i32.and
                 (i32.sub
                  (i32.const -48)
                  (local.tee $9
                   (i32.load offset=1052444
                    (i32.const 0)
                   )
                  )
                 )
                 (i32.const -9)
                )
                (i32.const -3)
               )
              )
              (i32.const -64)
              (i32.lt_u
               (local.get $1)
               (i32.const -64)
              )
             )
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
           (local.set $8
            (i32.add
             (local.get $0)
             (i32.const -8)
            )
           )
           (block $label$14
            (block $label$15
             (block $label$16
              (block $label$17
               (block $label$18
                (br_if $label$18
                 (i32.eqz
                  (local.get $7)
                 )
                )
                (local.set $7
                 (i32.add
                  (local.get $8)
                  (local.get $6)
                 )
                )
                (br_if $label$15
                 (i32.ge_u
                  (local.get $6)
                  (local.get $1)
                 )
                )
                (br_if $label$14
                 (i32.eq
                  (local.get $7)
                  (i32.load offset=1052420
                   (i32.const 0)
                  )
                 )
                )
                (br_if $label$16
                 (i32.eq
                  (local.get $7)
                  (i32.load offset=1052416
                   (i32.const 0)
                  )
                 )
                )
                (br_if $label$3
                 (i32.and
                  (local.tee $5
                   (i32.load offset=4
                    (local.get $7)
                   )
                  )
                  (i32.const 2)
                 )
                )
                (br_if $label$3
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
                (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std
                 (local.get $7)
                 (local.get $9)
                )
                (br_if $label$17
                 (i32.lt_u
                  (local.tee $7
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
                  (local.get $7)
                  (i32.const 3)
                 )
                )
                (i32.store offset=4
                 (local.tee $5
                  (i32.add
                   (local.get $8)
                   (local.get $5)
                  )
                 )
                 (i32.or
                  (i32.load offset=4
                   (local.get $5)
                  )
                  (i32.const 1)
                 )
                )
                (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCs4BkbFkxXoBt_3std
                 (local.get $1)
                 (local.get $7)
                )
                (br $label$4)
               )
               (br_if $label$3
                (i32.lt_u
                 (local.get $1)
                 (i32.const 256)
                )
               )
               (br_if $label$3
                (i32.le_u
                 (local.get $6)
                 (local.get $1)
                )
               )
               (br_if $label$3
                (i32.eqz
                 (local.get $8)
                )
               )
               (br_if $label$3
                (i32.gt_u
                 (i32.sub
                  (local.get $6)
                  (local.get $1)
                 )
                 (i32.shl
                  (local.get $9)
                  (i32.const 1)
                 )
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
              (br $label$4)
             )
             (br_if $label$3
              (i32.lt_u
               (local.tee $7
                (i32.add
                 (i32.load offset=1052408
                  (i32.const 0)
                 )
                 (local.get $6)
                )
               )
               (local.get $1)
              )
             )
             (block $label$19
              (block $label$20
               (br_if $label$20
                (i32.gt_u
                 (local.tee $6
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
               (local.set $6
                (i32.const 0)
               )
               (local.set $1
                (i32.const 0)
               )
               (br $label$19)
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
                (local.get $6)
                (i32.const 1)
               )
              )
              (i32.store
               (local.tee $7
                (i32.add
                 (local.get $8)
                 (local.get $7)
                )
               )
               (local.get $6)
              )
              (i32.store offset=4
               (local.get $7)
               (i32.and
                (i32.load offset=4
                 (local.get $7)
                )
                (i32.const -2)
               )
              )
             )
             (i32.store offset=1052416
              (i32.const 0)
              (local.get $1)
             )
             (i32.store offset=1052408
              (i32.const 0)
              (local.get $6)
             )
             (br $label$4)
            )
            (br_if $label$4
             (i32.le_u
              (local.tee $6
               (i32.sub
                (local.get $6)
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
              (local.get $6)
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
            (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCs4BkbFkxXoBt_3std
             (local.get $1)
             (local.get $6)
            )
            (br $label$4)
           )
           (br_if $label$5
            (i32.gt_u
             (local.tee $7
              (i32.add
               (i32.load offset=1052412
                (i32.const 0)
               )
               (local.get $6)
              )
             )
             (local.get $1)
            )
           )
           (br $label$3)
          )
          (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
           (i32.const 1051168)
           (i32.const 46)
           (i32.const 1051216)
          )
          (unreachable)
         )
         (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
          (i32.const 1051232)
          (i32.const 46)
          (i32.const 1051280)
         )
         (unreachable)
        )
        (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
         (i32.const 1051168)
         (i32.const 46)
         (i32.const 1051216)
        )
        (unreachable)
       )
       (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
        (i32.const 1051232)
        (i32.const 46)
        (i32.const 1051280)
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
       (local.tee $5
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
      (i32.store offset=1052412
       (i32.const 0)
       (local.get $1)
      )
      (i32.store offset=1052420
       (i32.const 0)
       (local.get $5)
      )
     )
     (br_if $label$3
      (i32.eqz
       (local.get $8)
      )
     )
     (return
      (local.get $0)
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.tee $1
       (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE6mallocCs4BkbFkxXoBt_3std
        (local.get $3)
       )
      )
     )
    )
    (block $label$21
     (br_if $label$21
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
     (local.set $2
      (local.get $1)
     )
     (br $label$2)
    )
    (memory.copy
     (local.get $1)
     (local.get $0)
     (local.get $3)
    )
    (local.set $2
     (local.get $1)
    )
   )
   (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE4freeCs4BkbFkxXoBt_3std
    (local.get $0)
   )
  )
  (local.get $2)
 )
 (func $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32)
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
             (i32.const 1051992)
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
     (i32.store offset=1052400
      (i32.const 0)
      (i32.and
       (i32.load offset=1052400
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
  (i32.store offset=1052404
   (i32.const 0)
   (i32.and
    (i32.load offset=1052404
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
 (func $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE13dispose_chunkCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32)
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
    (block $label$3
     (br_if $label$3
      (i32.and
       (local.tee $3
        (i32.load offset=4
         (local.get $0)
        )
       )
       (i32.const 1)
      )
     )
     (br_if $label$2
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
     (block $label$4
      (br_if $label$4
       (i32.ne
        (local.tee $0
         (i32.sub
          (local.get $0)
          (local.get $3)
         )
        )
        (i32.load offset=1052416
         (i32.const 0)
        )
       )
      )
      (br_if $label$3
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
      (i32.store offset=1052408
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
      (return)
     )
     (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std
      (local.get $0)
      (local.get $3)
     )
    )
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
         (i32.load offset=1052420
          (i32.const 0)
         )
        )
       )
       (br_if $label$1
        (i32.eq
         (local.get $2)
         (i32.load offset=1052416
          (i32.const 0)
         )
        )
       )
       (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE12unlink_chunkCs4BkbFkxXoBt_3std
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
         (i32.load offset=1052416
          (i32.const 0)
         )
        )
       )
       (i32.store offset=1052408
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
      (call $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCs4BkbFkxXoBt_3std
       (local.get $0)
       (local.get $1)
      )
      (return)
     )
     (block $label$9
      (block $label$10
       (br_if $label$10
        (i32.and
         (local.tee $2
          (i32.load offset=1052400
           (i32.const 0)
          )
         )
         (local.tee $3
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
       (i32.store offset=1052400
        (i32.const 0)
        (i32.or
         (local.get $2)
         (local.get $3)
        )
       )
       (local.set $2
        (local.tee $1
         (i32.add
          (i32.and
           (local.get $1)
           (i32.const 248)
          )
          (i32.const 1052136)
         )
        )
       )
       (br $label$9)
      )
      (local.set $2
       (i32.add
        (local.tee $1
         (i32.and
          (local.get $1)
          (i32.const 248)
         )
        )
        (i32.const 1052136)
       )
      )
      (local.set $1
       (i32.load
        (i32.add
         (local.get $1)
         (i32.const 1052144)
        )
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
    (i32.store offset=1052420
     (i32.const 0)
     (local.get $0)
    )
    (i32.store offset=1052412
     (i32.const 0)
     (local.tee $1
      (i32.add
       (i32.load offset=1052412
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
    (br_if $label$2
     (i32.ne
      (local.get $0)
      (i32.load offset=1052416
       (i32.const 0)
      )
     )
    )
    (i32.store offset=1052408
     (i32.const 0)
     (i32.const 0)
    )
    (i32.store offset=1052416
     (i32.const 0)
     (i32.const 0)
    )
   )
   (return)
  )
  (i32.store offset=1052416
   (i32.const 0)
   (local.get $0)
  )
  (i32.store offset=1052408
   (i32.const 0)
   (local.tee $1
    (i32.add
     (i32.load offset=1052408
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
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc17rust_begin_unwind (param $0 i32)
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
  (call $_RINvNtNtCs4BkbFkxXoBt_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_9panicking13panic_handler0zEB6_
   (i32.add
    (local.get $1)
    (i32.const 4)
   )
  )
  (unreachable)
 )
 (func $_RNvCsdtSMxSA38aw_7___rustc26___rust_alloc_error_handler (param $0 i32) (param $1 i32)
  (call $_RNvNtCs4BkbFkxXoBt_3std5alloc8rust_oom
   (local.get $1)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtCs4BkbFkxXoBt_3std5alloc8rust_oom (param $0 i32) (param $1 i32)
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
   (local.get $1)
  )
  (i32.store offset=8
   (local.get $2)
   (local.get $0)
  )
  (call $_RINvNtNtCs4BkbFkxXoBt_3std3sys9backtrace26___rust_end_short_backtraceNCNvNtB6_5alloc8rust_oom0zEB6_
   (i32.add
    (local.get $2)
    (i32.const 8)
   )
  )
  (unreachable)
 )
 (func $_RNvMs0_NtCsh2fK6zObE8o_8dlmalloc8dlmallocINtB5_8DlmallocNtNtB7_3sys6SystemE18insert_large_chunkCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (local.tee $3
      (i32.shr_u
       (local.get $1)
       (i32.const 8)
      )
     )
    )
   )
   (local.set $2
    (i32.const 31)
   )
   (br_if $label$1
    (i32.ge_u
     (local.get $1)
     (i32.const 16777216)
    )
   )
   (local.set $2
    (i32.xor
     (i32.or
      (i32.and
       (i32.shr_u
        (local.get $1)
        (i32.sub
         (i32.const 38)
         (local.tee $2
          (i32.clz
           (local.get $3)
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
    (i32.const 1051992)
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.and
     (i32.load offset=1052404
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
   (i32.store offset=1052404
    (i32.const 0)
    (i32.or
     (i32.load offset=1052404
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
 (func $_RNvNtNtCs4BkbFkxXoBt_3std9panicking11panic_count8increase (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local.set $1
   (i32.const 0)
  )
  (i32.store offset=1052476
   (i32.const 0)
   (i32.add
    (local.tee $2
     (i32.load offset=1052476
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
    (i32.load8_u offset=1052456
     (i32.const 0)
    )
   )
   (i32.store8 offset=1052456
    (i32.const 0)
    (local.get $0)
   )
   (i32.store offset=1052452
    (i32.const 0)
    (i32.add
     (i32.load offset=1052452
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
 (func $_RNvXNtCs8hZryZq3oeI_4core3anyNtNtCshrt81WbuBY1_5alloc6string6StringNtB2_3Any7type_idCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32)
  (i64.store offset=8 align=4
   (local.get $0)
   (i64.load offset=1051160 align=4
    (i32.const 0)
   )
  )
  (i64.store align=4
   (local.get $0)
   (i64.load offset=1051152 align=4
    (i32.const 0)
   )
  )
 )
 (func $_RNvXNtCs8hZryZq3oeI_4core3anyReNtB2_3Any7type_idCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32)
  (i64.store offset=8 align=4
   (local.get $0)
   (i64.load offset=1051144 align=4
    (i32.const 0)
   )
  )
  (i64.store align=4
   (local.get $0)
   (i64.load offset=1051136 align=4
    (i32.const 0)
   )
  )
 )
 (func $_RNvXs0_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_19FormatStringPayloadNtNtCs8hZryZq3oeI_4core3fmt7Display3fmt (param $0 i32) (param $1 i32) (result i32)
  (block $label$1
   (br_if $label$1
    (i32.eq
     (i32.load
      (local.get $0)
     )
     (i32.const -1)
    )
   )
   (return
    (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str
     (local.get $1)
     (i32.load offset=4
      (local.get $0)
     )
     (i32.load offset=8
      (local.get $0)
     )
    )
   )
  )
  (call $_RNvNtCs8hZryZq3oeI_4core3fmt5write
   (i32.load
    (local.get $1)
   )
   (i32.load offset=4
    (local.get $1)
   )
   (i32.load
    (local.tee $0
     (i32.load
      (i32.load offset=12
       (local.get $0)
      )
     )
    )
   )
   (i32.load offset=4
    (local.get $0)
   )
  )
 )
 (func $_RNvXs1_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload3get (param $0 i32) (param $1 i32)
  (i32.store offset=4
   (local.get $0)
   (i32.const 1051356)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_RNvXs1_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload6as_str (param $0 i32) (param $1 i32)
  (i64.store
   (local.get $0)
   (i64.load align=4
    (local.get $1)
   )
  )
 )
 (func $_RNvXs1_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload8take_box (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
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
  (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
  (block $label$1
   (br_if $label$1
    (local.tee $1
     (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
      (i32.const 8)
      (i32.const 4)
     )
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc5alloc18handle_alloc_error
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
   (i32.const 1051356)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_RNvXs2_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB5_16StaticStrPayloadNtNtCs8hZryZq3oeI_4core3fmt7Display3fmt (param $0 i32) (param $1 i32) (result i32)
  (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str
   (local.get $1)
   (i32.load
    (local.get $0)
   )
   (i32.load offset=4
    (local.get $0)
   )
  )
 )
 (func $_RNvXsZ_NtCshrt81WbuBY1_5alloc6stringNtB5_6StringNtNtCs8hZryZq3oeI_4core3fmt5Write10write_char (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
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
   (call $_RINvNvMs2_NtCshrt81WbuBY1_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECs4BkbFkxXoBt_3std
    (local.get $0)
    (local.get $2)
    (local.get $3)
    (i32.const 1)
    (i32.const 1)
   )
  )
  (local.set $4
   (i32.add
    (i32.load offset=4
     (local.get $0)
    )
    (local.get $2)
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.lt_u
      (local.get $1)
      (i32.const 128)
     )
    )
    (local.set $5
     (i32.or
      (i32.and
       (local.get $1)
       (i32.const 63)
      )
      (i32.const -128)
     )
    )
    (local.set $6
     (i32.shr_u
      (local.get $1)
      (i32.const 6)
     )
    )
    (block $label$7
     (br_if $label$7
      (i32.ge_u
       (local.get $1)
       (i32.const 2048)
      )
     )
     (i32.store8 offset=1
      (local.get $4)
      (local.get $5)
     )
     (i32.store8
      (local.get $4)
      (i32.or
       (local.get $6)
       (i32.const 192)
      )
     )
     (br $label$5)
    )
    (local.set $7
     (i32.shr_u
      (local.get $1)
      (i32.const 12)
     )
    )
    (local.set $6
     (i32.or
      (i32.and
       (local.get $6)
       (i32.const 63)
      )
      (i32.const -128)
     )
    )
    (block $label$8
     (br_if $label$8
      (i32.gt_u
       (local.get $1)
       (i32.const 65535)
      )
     )
     (i32.store8 offset=2
      (local.get $4)
      (local.get $5)
     )
     (i32.store8 offset=1
      (local.get $4)
      (local.get $6)
     )
     (i32.store8
      (local.get $4)
      (i32.or
       (local.get $7)
       (i32.const 224)
      )
     )
     (br $label$5)
    )
    (i32.store8 offset=3
     (local.get $4)
     (local.get $5)
    )
    (i32.store8 offset=2
     (local.get $4)
     (local.get $6)
    )
    (i32.store8 offset=1
     (local.get $4)
     (i32.or
      (i32.and
       (local.get $7)
       (i32.const 63)
      )
      (i32.const -128)
     )
    )
    (i32.store8
     (local.get $4)
     (i32.or
      (i32.shr_u
       (local.get $1)
       (i32.const 18)
      )
      (i32.const -16)
     )
    )
    (br $label$5)
   )
   (i32.store8
    (local.get $4)
    (local.get $1)
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
 (func $_RNvXsZ_NtCshrt81WbuBY1_5alloc6stringNtB5_6StringNtNtCs8hZryZq3oeI_4core3fmt5Write9write_str (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
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
     (call $_RINvNvMs2_NtCshrt81WbuBY1_5alloc7raw_vecINtB8_11RawVecInnerpE7reserve21do_reserve_and_handleNtNtBa_5alloc6GlobalECs4BkbFkxXoBt_3std
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
     (br $label$2)
    )
    (br_if $label$1
     (i32.eqz
      (local.get $2)
     )
    )
   )
   (br_if $label$1
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
 (func $_RNvXs_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload3get (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (i32.load
      (local.get $1)
     )
     (i32.const -1)
    )
   )
   (local.set $3
    (i32.load offset=12
     (local.get $1)
    )
   )
   (i32.store offset=28
    (local.get $2)
    (i32.const 0)
   )
   (i64.store offset=20 align=4
    (local.get $2)
    (i64.const 4294967296)
   )
   (drop
    (call $_RNvNtCs8hZryZq3oeI_4core3fmt5write
     (i32.add
      (local.get $2)
      (i32.const 20)
     )
     (i32.const 1051056)
     (i32.load
      (local.tee $3
       (i32.load
        (local.get $3)
       )
      )
     )
     (i32.load offset=4
      (local.get $3)
     )
    )
   )
   (i32.store offset=16
    (local.get $2)
    (local.tee $3
     (i32.load offset=28
      (local.get $2)
     )
    )
   )
   (i64.store offset=8
    (local.get $2)
    (local.tee $4
     (i64.load offset=20 align=4
      (local.get $2)
     )
    )
   )
   (i32.store offset=8
    (local.get $1)
    (local.get $3)
   )
   (i64.store align=4
    (local.get $1)
    (local.get $4)
   )
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 1051372)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_RNvXs_NvNtCs4BkbFkxXoBt_3std9panicking13panic_handlerNtB4_19FormatStringPayloadNtNtCs8hZryZq3oeI_4core5panic12PanicPayload8take_box (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.ne
     (i32.load
      (local.get $1)
     )
     (i32.const -1)
    )
   )
   (local.set $3
    (i32.load offset=12
     (local.get $1)
    )
   )
   (i32.store offset=24
    (local.get $2)
    (i32.const 0)
   )
   (i64.store offset=16 align=4
    (local.get $2)
    (i64.const 4294967296)
   )
   (drop
    (call $_RNvNtCs8hZryZq3oeI_4core3fmt5write
     (i32.add
      (local.get $2)
      (i32.const 16)
     )
     (i32.const 1051056)
     (i32.load
      (local.tee $3
       (i32.load
        (local.get $3)
       )
      )
     )
     (i32.load offset=4
      (local.get $3)
     )
    )
   )
   (i32.store offset=8
    (local.get $2)
    (local.tee $3
     (i32.load offset=24
      (local.get $2)
     )
    )
   )
   (i64.store
    (local.get $2)
    (local.tee $4
     (i64.load offset=16 align=4
      (local.get $2)
     )
    )
   )
   (i32.store offset=8
    (local.get $1)
    (local.get $3)
   )
   (i64.store align=4
    (local.get $1)
    (local.get $4)
   )
  )
  (local.set $3
   (i32.load offset=8
    (local.get $1)
   )
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 0)
  )
  (local.set $4
   (i64.load align=4
    (local.get $1)
   )
  )
  (i64.store align=4
   (local.get $1)
   (i64.const 4294967296)
  )
  (i32.store offset=24
   (local.get $2)
   (local.get $3)
  )
  (i64.store offset=16
   (local.get $2)
   (local.get $4)
  )
  (call $_RNvCsdtSMxSA38aw_7___rustc35___rust_no_alloc_shim_is_unstable_v2)
  (block $label$2
   (br_if $label$2
    (local.tee $1
     (call $_RNvCsdtSMxSA38aw_7___rustc12___rust_alloc
      (i32.const 12)
      (i32.const 4)
     )
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc5alloc18handle_alloc_error
    (i32.const 4)
    (i32.const 12)
   )
   (unreachable)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.load offset=24
    (local.get $2)
   )
  )
  (i64.store align=4
   (local.get $1)
   (i64.load offset=16
    (local.get $2)
   )
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 1051372)
  )
  (i32.store
   (local.get $0)
   (local.get $1)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_RNvYINtNvNtCs4BkbFkxXoBt_3std9panicking11begin_panic7PayloadReENtNtCs8hZryZq3oeI_4core5panic12PanicPayload6as_strB9_ (param $0 i32) (param $1 i32)
  (i32.store
   (local.get $0)
   (i32.const 0)
  )
 )
 (func $_RNvYNtNtCshrt81WbuBY1_5alloc6string6StringNtNtCs8hZryZq3oeI_4core3fmt5Write9write_fmtCs4BkbFkxXoBt_3std (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (call $_RNvNtCs8hZryZq3oeI_4core3fmt5write
   (local.get $0)
   (i32.const 1051056)
   (local.get $1)
   (local.get $2)
  )
 )
 (func $_RNvXs_NtCsh2fK6zObE8o_8dlmalloc3sysNtB4_6SystemNtB6_9Allocator5alloc (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (local.get $2)
     )
    )
    (local.set $3
     (i32.load8_u offset=1052481
      (i32.const 0)
     )
    )
    (i32.store8 offset=1052481
     (i32.const 0)
     (i32.const 1)
    )
    (local.set $4
     (i32.const 1052496)
    )
    (br_if $label$2
     (i32.le_u
      (i32.const 1114112)
      (i32.const 1052496)
     )
    )
    (br_if $label$2
     (i32.gt_u
      (local.get $2)
      (i32.sub
       (i32.const 1114112)
       (i32.const 1052496)
      )
     )
    )
    (br_if $label$2
     (i32.and
      (local.get $3)
      (i32.const 255)
     )
    )
    (local.set $2
     (i32.sub
      (i32.const 1114112)
      (i32.const 1052496)
     )
    )
    (br $label$1)
   )
   (local.set $4
    (i32.const 0)
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (local.tee $3
       (memory.grow
        (local.tee $2
         (i32.add
          (i32.shr_u
           (local.get $2)
           (i32.const 16)
          )
          (i32.ne
           (i32.and
            (local.get $2)
            (i32.const 65535)
           )
           (i32.const 0)
          )
         )
        )
       )
      )
      (i32.const -1)
     )
    )
    (local.set $2
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $2
    (select
     (i32.add
      (local.tee $2
       (i32.shl
        (local.get $2)
        (i32.const 16)
       )
      )
      (i32.const -16)
     )
     (local.get $2)
     (i32.eq
      (local.tee $4
       (i32.shl
        (local.get $3)
        (i32.const 16)
       )
      )
      (i32.sub
       (i32.const 0)
       (local.get $2)
      )
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
   (local.get $2)
  )
  (i32.store
   (local.get $0)
   (local.get $4)
  )
 )
 (func $_RNvNtCshrt81WbuBY1_5alloc7raw_vec12handle_error (param $0 i32) (param $1 i32)
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (local.get $0)
    )
   )
   (call $_RNvNtCshrt81WbuBY1_5alloc5alloc18handle_alloc_error
    (local.get $0)
    (local.get $1)
   )
   (unreachable)
  )
  (call $_RNvNtCshrt81WbuBY1_5alloc7raw_vec17capacity_overflow)
  (unreachable)
 )
 (func $_RNvNtCshrt81WbuBY1_5alloc5alloc18handle_alloc_error (param $0 i32) (param $1 i32)
  (call $_RNvCsdtSMxSA38aw_7___rustc26___rust_alloc_error_handler
   (local.get $1)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtCshrt81WbuBY1_5alloc7raw_vec17capacity_overflow
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1051444)
   (i32.const 35)
   (i32.const 1051464)
  )
  (unreachable)
 )
 (func $_RNvNtCs8hZryZq3oeI_4core9panicking19assert_failed_inner (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32)
  (local $8 i32)
  (local $9 i64)
  (global.set $__stack_pointer
   (local.tee $8
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 64)
    )
   )
  )
  (i32.store offset=4
   (local.get $8)
   (local.get $2)
  )
  (i32.store
   (local.get $8)
   (local.get $1)
  )
  (i32.store offset=12
   (local.get $8)
   (local.get $4)
  )
  (i32.store offset=8
   (local.get $8)
   (local.get $3)
  )
  (i32.store offset=20
   (local.get $8)
   (i32.load8_u offset=1051988
    (local.tee $2
     (i32.and
      (local.get $0)
      (i32.const 255)
     )
    )
   )
  )
  (i32.store offset=16
   (local.get $8)
   (i32.load offset=1051976
    (i32.shl
     (local.get $2)
     (i32.const 2)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (local.get $5)
    )
   )
   (i32.store offset=28
    (local.get $8)
    (local.get $6)
   )
   (i32.store offset=24
    (local.get $8)
    (local.get $5)
   )
   (i64.store offset=56
    (local.get $8)
    (i64.or
     (local.tee $9
      (i64.shl
       (i64.extend_i32_u
        (i32.const 34)
       )
       (i64.const 32)
      )
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $8)
       (i32.const 8)
      )
     )
    )
   )
   (i64.store offset=48
    (local.get $8)
    (i64.or
     (local.get $9)
     (i64.extend_i32_u
      (local.get $8)
     )
    )
   )
   (i64.store offset=40
    (local.get $8)
    (i64.or
     (i64.shl
      (i64.extend_i32_u
       (i32.const 35)
      )
      (i64.const 32)
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $8)
       (i32.const 24)
      )
     )
    )
   )
   (i64.store offset=32
    (local.get $8)
    (i64.or
     (i64.shl
      (i64.extend_i32_u
       (i32.const 36)
      )
      (i64.const 32)
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $8)
       (i32.const 16)
      )
     )
    )
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
    (i32.const 1048871)
    (i32.add
     (local.get $8)
     (i32.const 32)
    )
    (local.get $7)
   )
   (unreachable)
  )
  (i64.store offset=48
   (local.get $8)
   (i64.or
    (local.tee $9
     (i64.shl
      (i64.extend_i32_u
       (i32.const 34)
      )
      (i64.const 32)
     )
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $8)
      (i32.const 8)
     )
    )
   )
  )
  (i64.store offset=40
   (local.get $8)
   (i64.or
    (local.get $9)
    (i64.extend_i32_u
     (local.get $8)
    )
   )
  )
  (i64.store offset=32
   (local.get $8)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 36)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (i32.add
      (local.get $8)
      (i32.const 16)
     )
    )
   )
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1048816)
   (i32.add
    (local.get $8)
    (i32.const 32)
   )
   (local.get $7)
  )
  (unreachable)
 )
 (func $_RNvNtCs8hZryZq3oeI_4core9panicking5panic (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (local.get $0)
   (i32.or
    (i32.shl
     (local.get $1)
     (i32.const 1)
    )
    (i32.const 1)
   )
   (local.get $2)
  )
  (unreachable)
 )
 (func $_RNvXsd_NtNtNtCs8hZryZq3oeI_4core3fmt3num3impyNtB9_7Display3fmt (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
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
   (i32.const 20)
  )
  (local.set $5
   (local.tee $4
    (i64.load
     (local.get $0)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i64.lt_u
     (local.get $4)
     (i64.const 1000)
    )
   )
   (local.set $3
    (i32.const 20)
   )
   (local.set $5
    (local.get $4)
   )
   (loop $label$2
    (i32.store16 align=1
     (i32.add
      (local.tee $0
       (i32.add
        (i32.add
         (local.get $2)
         (i32.const 12)
        )
        (local.get $3)
       )
      )
      (i32.const -4)
     )
     (i32.load16_u offset=1051594 align=1
      (i32.shl
       (local.tee $8
        (i32.div_u
         (i32.and
          (local.tee $7
           (i32.wrap_i64
            (i64.sub
             (local.tee $6
              (local.get $5)
             )
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
    )
    (i32.store16 align=1
     (i32.add
      (local.get $0)
      (i32.const -2)
     )
     (i32.load16_u offset=1051594 align=1
      (i32.shl
       (i32.and
        (i32.sub
         (local.get $7)
         (i32.mul
          (local.get $8)
          (i32.const 100)
         )
        )
        (i32.const 65535)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i32.add
      (local.get $3)
      (i32.const -4)
     )
    )
    (br_if $label$2
     (i64.gt_u
      (local.get $6)
      (i64.const 9999999)
     )
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
   (i32.store16 align=1
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 12)
     )
     (local.tee $3
      (i32.add
       (local.get $3)
       (i32.const -2)
      )
     )
    )
    (i32.load16_u offset=1051594 align=1
     (i32.shl
      (i32.and
       (i32.sub
        (local.tee $0
         (i32.wrap_i64
          (local.get $5)
         )
        )
        (i32.mul
         (local.tee $0
          (i32.div_u
           (i32.and
            (local.get $0)
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
   )
   (local.set $5
    (i64.extend_i32_u
     (local.get $0)
    )
   )
  )
  (block $label$4
   (block $label$5
    (br_if $label$5
     (i64.eqz
      (local.get $4)
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
      (local.get $2)
      (i32.const 12)
     )
     (local.tee $3
      (i32.add
       (local.get $3)
       (i32.const -1)
      )
     )
    )
    (i32.load8_u offset=1051595
     (i32.shl
      (i32.wrap_i64
       (local.get $5)
      )
      (i32.const 1)
     )
    )
   )
  )
  (local.set $3
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral
    (local.get $1)
    (i32.const 1)
    (i32.const 1)
    (i32.const 0)
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 12)
     )
     (local.get $3)
    )
    (i32.sub
     (i32.const 20)
     (local.get $3)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
  (local.get $3)
 )
 (func $_RNvXs1i_NtCs8hZryZq3oeI_4core3fmtReNtB6_7Display3fmtB8_ (param $0 i32) (param $1 i32) (result i32)
  (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter3pad
   (local.get $1)
   (i32.load
    (local.get $0)
   )
   (i32.load offset=4
    (local.get $0)
   )
  )
 )
 (func $_RNvNtCs8hZryZq3oeI_4core3fmt5write (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
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
     (i32.const 16)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.and
       (local.get $3)
       (i32.const 1)
      )
     )
     (br_if $label$2
      (local.tee $5
       (i32.load8_u
        (local.get $2)
       )
      )
     )
     (local.set $5
      (i32.const 0)
     )
     (br $label$1)
    )
    (local.set $5
     (call_indirect $0 (type $1)
      (local.get $0)
      (local.get $2)
      (i32.shr_u
       (local.get $3)
       (i32.const 1)
      )
      (i32.load offset=12
       (local.get $1)
      )
     )
    )
    (br $label$1)
   )
   (local.set $6
    (i32.load offset=12
     (local.get $1)
    )
   )
   (local.set $7
    (i32.const 0)
   )
   (loop $label$4
    (local.set $8
     (i32.add
      (local.get $2)
      (i32.const 1)
     )
    )
    (block $label$5
     (block $label$6
      (block $label$7
       (block $label$8
        (block $label$9
         (br_if $label$9
          (i32.gt_s
           (i32.extend8_s
            (local.get $5)
           )
           (i32.const -1)
          )
         )
         (br_if $label$8
          (i32.eq
           (local.tee $9
            (i32.and
             (local.get $5)
             (i32.const 255)
            )
           )
           (i32.const 128)
          )
         )
         (br_if $label$6
          (i32.ne
           (local.get $9)
           (i32.const 192)
          )
         )
         (i32.store offset=4
          (local.get $4)
          (local.get $1)
         )
         (i32.store
          (local.get $4)
          (local.get $0)
         )
         (i64.store offset=8 align=4
          (local.get $4)
          (i64.const 1610612768)
         )
         (br_if $label$7
          (i32.eqz
           (call_indirect $0 (type $0)
            (i32.load
             (local.tee $5
              (i32.add
               (local.get $3)
               (i32.shl
                (local.get $7)
                (i32.const 3)
               )
              )
             )
            )
            (local.get $4)
            (i32.load offset=4
             (local.get $5)
            )
           )
          )
         )
         (local.set $5
          (i32.const 1)
         )
         (br $label$1)
        )
        (block $label$10
         (br_if $label$10
          (call_indirect $0 (type $1)
           (local.get $0)
           (local.get $8)
           (local.tee $5
            (i32.and
             (local.get $5)
             (i32.const 255)
            )
           )
           (local.get $6)
          )
         )
         (local.set $2
          (i32.add
           (local.get $8)
           (local.get $5)
          )
         )
         (br $label$5)
        )
        (local.set $5
         (i32.const 1)
        )
        (br $label$1)
       )
       (block $label$11
        (br_if $label$11
         (call_indirect $0 (type $1)
          (local.get $0)
          (local.tee $5
           (i32.add
            (local.get $2)
            (i32.const 3)
           )
          )
          (local.tee $2
           (i32.load16_u offset=1 align=1
            (local.get $2)
           )
          )
          (local.get $6)
         )
        )
        (local.set $2
         (i32.add
          (local.get $5)
          (local.get $2)
         )
        )
        (br $label$5)
       )
       (local.set $5
        (i32.const 1)
       )
       (br $label$1)
      )
      (local.set $7
       (i32.add
        (local.get $7)
        (i32.const 1)
       )
      )
      (local.set $2
       (local.get $8)
      )
      (br $label$5)
     )
     (local.set $10
      (i32.const 1610612768)
     )
     (block $label$12
      (br_if $label$12
       (i32.eqz
        (i32.and
         (local.get $5)
         (i32.const 1)
        )
       )
      )
      (local.set $8
       (i32.add
        (local.get $2)
        (i32.const 5)
       )
      )
      (local.set $10
       (i32.load offset=1 align=1
        (local.get $2)
       )
      )
     )
     (local.set $9
      (i32.const 0)
     )
     (block $label$13
      (block $label$14
       (br_if $label$14
        (i32.and
         (local.get $5)
         (i32.const 2)
        )
       )
       (local.set $11
        (i32.const 0)
       )
       (local.set $2
        (local.get $8)
       )
       (br $label$13)
      )
      (local.set $2
       (i32.add
        (local.get $8)
        (i32.const 2)
       )
      )
      (local.set $11
       (i32.load16_u align=1
        (local.get $8)
       )
      )
     )
     (block $label$15
      (block $label$16
       (br_if $label$16
        (i32.and
         (local.get $5)
         (i32.const 4)
        )
       )
       (local.set $8
        (local.get $2)
       )
       (br $label$15)
      )
      (local.set $8
       (i32.add
        (local.get $2)
        (i32.const 2)
       )
      )
      (local.set $9
       (i32.load16_u align=1
        (local.get $2)
       )
      )
     )
     (block $label$17
      (block $label$18
       (br_if $label$18
        (i32.and
         (local.get $5)
         (i32.const 8)
        )
       )
       (local.set $2
        (local.get $8)
       )
       (br $label$17)
      )
      (local.set $2
       (i32.add
        (local.get $8)
        (i32.const 2)
       )
      )
      (local.set $7
       (i32.load16_u align=1
        (local.get $8)
       )
      )
     )
     (block $label$19
      (br_if $label$19
       (i32.eqz
        (i32.and
         (local.get $5)
         (i32.const 16)
        )
       )
      )
      (local.set $11
       (i32.load16_u offset=4
        (i32.add
         (local.get $3)
         (i32.shl
          (i32.and
           (local.get $11)
           (i32.const 65535)
          )
          (i32.const 3)
         )
        )
       )
      )
     )
     (block $label$20
      (br_if $label$20
       (i32.eqz
        (i32.and
         (local.get $5)
         (i32.const 32)
        )
       )
      )
      (local.set $9
       (i32.load16_u offset=4
        (i32.add
         (local.get $3)
         (i32.shl
          (i32.and
           (local.get $9)
           (i32.const 65535)
          )
          (i32.const 3)
         )
        )
       )
      )
     )
     (i32.store16 offset=14
      (local.get $4)
      (local.get $9)
     )
     (i32.store16 offset=12
      (local.get $4)
      (local.get $11)
     )
     (i32.store offset=8
      (local.get $4)
      (local.get $10)
     )
     (i32.store offset=4
      (local.get $4)
      (local.get $1)
     )
     (i32.store
      (local.get $4)
      (local.get $0)
     )
     (block $label$21
      (br_if $label$21
       (i32.eqz
        (call_indirect $0 (type $0)
         (i32.load
          (local.tee $5
           (i32.add
            (local.get $3)
            (i32.shl
             (local.get $7)
             (i32.const 3)
            )
           )
          )
         )
         (local.get $4)
         (i32.load offset=4
          (local.get $5)
         )
        )
       )
      )
      (local.set $5
       (i32.const 1)
      )
      (br $label$1)
     )
     (local.set $7
      (i32.add
       (local.get $7)
       (i32.const 1)
      )
     )
    )
    (br_if $label$4
     (local.tee $5
      (i32.load8_u
       (local.get $2)
      )
     )
    )
   )
   (local.set $5
    (i32.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 16)
   )
  )
  (local.get $5)
 )
 (func $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt (param $0 i32) (param $1 i32) (param $2 i32)
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
   (local.get $1)
  )
  (i32.store offset=12
   (local.get $3)
   (local.get $0)
  )
  (i32.store16 offset=28
   (local.get $3)
   (i32.const 1)
  )
  (i32.store offset=24
   (local.get $3)
   (local.get $2)
  )
  (i32.store offset=20
   (local.get $3)
   (i32.add
    (local.get $3)
    (i32.const 12)
   )
  )
  (call $_RNvCsdtSMxSA38aw_7___rustc17rust_begin_unwind
   (i32.add
    (local.get $3)
    (i32.const 20)
   )
  )
  (unreachable)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core5slice5index16slice_index_fail (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
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
     (br_if $label$3
      (i32.gt_u
       (local.get $0)
       (local.get $2)
      )
     )
     (br_if $label$2
      (i32.gt_u
       (local.get $1)
       (local.get $2)
      )
     )
     (local.set $5
      (i64.shl
       (i64.extend_i32_u
        (i32.const 37)
       )
       (i64.const 32)
      )
     )
     (br_if $label$1
      (i32.le_u
       (local.get $0)
       (local.get $1)
      )
     )
     (i32.store offset=8
      (local.get $4)
      (local.get $0)
     )
     (i32.store offset=12
      (local.get $4)
      (local.get $1)
     )
     (i64.store offset=24
      (local.get $4)
      (i64.or
       (local.get $5)
       (i64.extend_i32_u
        (i32.add
         (local.get $4)
         (i32.const 12)
        )
       )
      )
     )
     (i64.store offset=16
      (local.get $4)
      (i64.or
       (local.get $5)
       (i64.extend_i32_u
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
       )
      )
     )
     (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
      (i32.const 1048664)
      (i32.add
       (local.get $4)
       (i32.const 16)
      )
      (local.get $3)
     )
     (unreachable)
    )
    (i32.store offset=8
     (local.get $4)
     (local.get $0)
    )
    (i32.store offset=12
     (local.get $4)
     (local.get $2)
    )
    (i64.store offset=24
     (local.get $4)
     (i64.or
      (local.tee $5
       (i64.shl
        (i64.extend_i32_u
         (i32.const 37)
        )
        (i64.const 32)
       )
      )
      (i64.extend_i32_u
       (i32.add
        (local.get $4)
        (i32.const 12)
       )
      )
     )
    )
    (i64.store offset=16
     (local.get $4)
     (i64.or
      (local.get $5)
      (i64.extend_i32_u
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
      )
     )
    )
    (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
     (i32.const 1048704)
     (i32.add
      (local.get $4)
      (i32.const 16)
     )
     (local.get $3)
    )
    (unreachable)
   )
   (i32.store offset=8
    (local.get $4)
    (local.get $1)
   )
   (i32.store offset=12
    (local.get $4)
    (local.get $2)
   )
   (i64.store offset=24
    (local.get $4)
    (i64.or
     (local.tee $5
      (i64.shl
       (i64.extend_i32_u
        (i32.const 37)
       )
       (i64.const 32)
      )
     )
     (i64.extend_i32_u
      (i32.add
       (local.get $4)
       (i32.const 12)
      )
     )
    )
   )
   (i64.store offset=16
    (local.get $4)
    (i64.or
     (local.get $5)
     (i64.extend_i32_u
      (i32.add
       (local.get $4)
       (i32.const 8)
      )
     )
    )
   )
   (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
    (i32.const 1048761)
    (i32.add
     (local.get $4)
     (i32.const 16)
    )
    (local.get $3)
   )
   (unreachable)
  )
  (i32.store offset=8
   (local.get $4)
   (local.get $1)
  )
  (i32.store offset=12
   (local.get $4)
   (local.get $2)
  )
  (i64.store offset=24
   (local.get $4)
   (i64.or
    (local.get $5)
    (i64.extend_i32_u
     (i32.add
      (local.get $4)
      (i32.const 12)
     )
    )
   )
  )
  (i64.store offset=16
   (local.get $4)
   (i64.or
    (local.get $5)
    (i64.extend_i32_u
     (i32.add
      (local.get $4)
      (i32.const 8)
     )
    )
   )
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1048761)
   (i32.add
    (local.get $4)
    (i32.const 16)
   )
   (local.get $3)
  )
  (unreachable)
 )
 (func $_RNvXs0_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
  (local.set $3
   (i32.load offset=4
    (local.get $0)
   )
  )
  (local.set $4
   (i32.load
    (local.get $0)
   )
  )
  (local.set $5
   (i32.load offset=8
    (local.get $0)
   )
  )
  (local.set $6
   (i32.const 0)
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
  (block $label$1
   (loop $label$2
    (br_if $label$1
     (i32.and
      (local.get $9)
      (i32.const 1)
     )
    )
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.lt_u
        (local.get $2)
        (local.get $8)
       )
      )
      (loop $label$5
       (local.set $9
        (i32.add
         (local.get $1)
         (local.get $8)
        )
       )
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (block $label$10
            (block $label$11
             (br_if $label$11
              (i32.gt_u
               (local.tee $10
                (i32.sub
                 (local.get $2)
                 (local.get $8)
                )
               )
               (i32.const 7)
              )
             )
             (br_if $label$10
              (i32.ne
               (local.get $2)
               (local.get $8)
              )
             )
             (local.set $8
              (local.get $2)
             )
             (br $label$4)
            )
            (br_if $label$9
             (i32.eq
              (local.tee $0
               (i32.and
                (i32.add
                 (local.get $9)
                 (i32.const 3)
                )
                (i32.const -4)
               )
              )
              (local.get $9)
             )
            )
            (local.set $0
             (i32.sub
              (local.get $0)
              (local.get $9)
             )
            )
            (local.set $11
             (i32.const 0)
            )
            (loop $label$12
             (br_if $label$6
              (i32.eq
               (i32.load8_u
                (i32.add
                 (local.get $9)
                 (local.get $11)
                )
               )
               (i32.const 10)
              )
             )
             (br_if $label$12
              (i32.ne
               (local.get $0)
               (local.tee $11
                (i32.add
                 (local.get $11)
                 (i32.const 1)
                )
               )
              )
             )
            )
            (br_if $label$7
             (i32.gt_u
              (local.get $0)
              (local.tee $12
               (i32.add
                (local.get $10)
                (i32.const -8)
               )
              )
             )
            )
            (br $label$8)
           )
           (local.set $11
            (i32.const 0)
           )
           (loop $label$13
            (br_if $label$6
             (i32.eq
              (i32.load8_u
               (i32.add
                (local.get $9)
                (local.get $11)
               )
              )
              (i32.const 10)
             )
            )
            (br_if $label$13
             (i32.ne
              (local.get $10)
              (local.tee $11
               (i32.add
                (local.get $11)
                (i32.const 1)
               )
              )
             )
            )
           )
           (local.set $8
            (local.get $2)
           )
           (br $label$4)
          )
          (local.set $12
           (i32.add
            (local.get $10)
            (i32.const -8)
           )
          )
          (local.set $0
           (i32.const 0)
          )
         )
         (loop $label$14
          (br_if $label$7
           (i32.ne
            (i32.and
             (i32.and
              (i32.or
               (i32.sub
                (i32.const 16843008)
                (i32.xor
                 (local.tee $13
                  (i32.load
                   (local.tee $11
                    (i32.add
                     (local.get $9)
                     (local.get $0)
                    )
                   )
                  )
                 )
                 (i32.const 168430090)
                )
               )
               (local.get $13)
              )
              (i32.or
               (i32.sub
                (i32.const 16843008)
                (i32.xor
                 (local.tee $11
                  (i32.load
                   (i32.add
                    (local.get $11)
                    (i32.const 4)
                   )
                  )
                 )
                 (i32.const 168430090)
                )
               )
               (local.get $11)
              )
             )
             (i32.const -2139062144)
            )
            (i32.const -2139062144)
           )
          )
          (br_if $label$14
           (i32.le_u
            (local.tee $0
             (i32.add
              (local.get $0)
              (i32.const 8)
             )
            )
            (local.get $12)
           )
          )
         )
        )
        (block $label$15
         (br_if $label$15
          (i32.ne
           (local.get $10)
           (local.get $0)
          )
         )
         (local.set $8
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
              (local.get $9)
              (local.get $0)
             )
            )
            (i32.const 10)
           )
          )
          (local.set $11
           (local.get $0)
          )
          (br $label$6)
         )
         (br_if $label$16
          (i32.ne
           (local.get $10)
           (local.tee $0
            (i32.add
             (local.get $0)
             (i32.const 1)
            )
           )
          )
         )
        )
        (local.set $8
         (local.get $2)
        )
        (br $label$4)
       )
       (local.set $8
        (i32.add
         (local.tee $0
          (i32.add
           (local.get $11)
           (local.get $8)
          )
         )
         (i32.const 1)
        )
       )
       (block $label$18
        (br_if $label$18
         (i32.ge_u
          (local.get $0)
          (local.get $2)
         )
        )
        (br_if $label$18
         (i32.ne
          (i32.load8_u
           (i32.add
            (local.get $9)
            (local.get $11)
           )
          )
          (i32.const 10)
         )
        )
        (local.set $9
         (i32.const 0)
        )
        (local.set $10
         (local.get $8)
        )
        (local.set $0
         (local.get $8)
        )
        (br $label$3)
       )
       (br_if $label$5
        (i32.le_u
         (local.get $8)
         (local.get $2)
        )
       )
      )
     )
     (br_if $label$1
      (i32.eq
       (local.get $2)
       (local.get $7)
      )
     )
     (local.set $9
      (i32.const 1)
     )
     (local.set $10
      (local.get $7)
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
         (local.get $5)
        )
       )
      )
      (br_if $label$19
       (call_indirect $0 (type $1)
        (local.get $4)
        (i32.const 1051951)
        (i32.const 4)
        (i32.load offset=12
         (local.get $3)
        )
       )
      )
     )
     (local.set $13
      (i32.sub
       (local.get $0)
       (local.get $7)
      )
     )
     (local.set $11
      (i32.const 0)
     )
     (block $label$21
      (br_if $label$21
       (i32.eq
        (local.get $0)
        (local.get $7)
       )
      )
      (local.set $11
       (i32.eq
        (i32.load8_u
         (i32.add
          (i32.add
           (local.get $1)
           (local.get $0)
          )
          (i32.const -1)
         )
        )
        (i32.const 10)
       )
      )
     )
     (local.set $0
      (i32.add
       (local.get $1)
       (local.get $7)
      )
     )
     (i32.store8
      (local.get $5)
      (local.get $11)
     )
     (local.set $7
      (local.get $10)
     )
     (br_if $label$2
      (i32.eqz
       (call_indirect $0 (type $1)
        (local.get $4)
        (local.get $0)
        (local.get $13)
        (i32.load offset=12
         (local.get $3)
        )
       )
      )
     )
    )
   )
   (local.set $6
    (i32.const 1)
   )
  )
  (local.get $6)
 )
 (func $_RNvMs2_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_11DebugStruct5field (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
       (i32.const 1051500)
       (i32.const 1051497)
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
      (i32.const 1051502)
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
      (i32.const 1051504)
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
    (i32.const 1051516)
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
    (call $_RNvXs0_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str
     (local.get $5)
     (local.get $1)
     (local.get $2)
    )
   )
   (br_if $label$1
    (call $_RNvXs0_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write9write_str
     (local.get $5)
     (i32.const 1051502)
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
     (i32.const 1051507)
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
 (func $_RNvMs3_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10DebugTuple5field (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
       (i32.const 1051500)
       (i32.const 1051510)
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
      (i32.const 1051511)
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
    (i32.const 1051516)
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
     (i32.const 1051507)
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
 (func $_RNvMs3_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10DebugTuple6finish (param $0 i32) (result i32)
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
     (local.set $1
      (i32.load offset=4
       (local.get $0)
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
       (i32.and
        (i32.load8_u offset=9
         (local.get $0)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$3
      (i32.and
       (i32.load8_u offset=10
        (local.get $1)
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
        (i32.const 1051513)
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
       (local.get $1)
      )
      (i32.const 1051509)
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
  (i32.and
   (local.get $3)
   (i32.const 1)
  )
 )
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter11debug_tuple (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
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
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (result i32)
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
     (i32.const -1)
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
      (call $_RNvNtNtCs8hZryZq3oeI_4core3str5count14do_count_chars
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
    (local.set $10
     (i32.const 0)
    )
    (local.set $1
     (i32.const 0)
    )
    (block $label$8
     (br_if $label$8
      (i32.lt_u
       (local.get $3)
       (i32.const 4)
      )
     )
     (local.set $11
      (i32.and
       (local.get $3)
       (i32.const 12)
      )
     )
     (local.set $10
      (i32.const 0)
     )
     (local.set $1
      (i32.const 0)
     )
     (loop $label$9
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
      (br_if $label$9
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
     (br_if $label$5
      (i32.eqz
       (local.get $9)
      )
     )
    )
    (local.set $12
     (i32.add
      (local.get $2)
      (local.get $10)
     )
    )
    (loop $label$10
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
     (br_if $label$10
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
            (br_if $label$20
             (i32.ge_u
              (local.get $6)
              (local.tee $12
               (i32.load16_u offset=12
                (local.get $0)
               )
              )
             )
            )
            (br_if $label$16
             (i32.and
              (local.get $7)
              (i32.const 16777216)
             )
            )
            (local.set $13
             (i32.sub
              (local.get $12)
              (local.get $6)
             )
            )
            (local.set $6
             (i32.const 0)
            )
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
           (br_if $label$12
            (i32.eqz
             (call $_RNvNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
              (local.tee $1
               (i32.load
                (local.get $0)
               )
              )
              (local.tee $12
               (i32.load offset=4
                (local.get $0)
               )
              )
              (local.get $8)
              (local.get $2)
              (local.get $3)
             )
            )
           )
           (return
            (i32.const 1)
           )
          )
          (local.set $6
           (local.get $13)
          )
          (br $label$17)
         )
         (local.set $6
          (i32.shr_u
           (i32.and
            (local.get $13)
            (i32.const 65534)
           )
           (i32.const 1)
          )
         )
        )
        (local.set $9
         (i32.and
          (local.get $7)
          (i32.const 2097151)
         )
        )
        (local.set $11
         (i32.load offset=4
          (local.get $0)
         )
        )
        (local.set $12
         (i32.load
          (local.get $0)
         )
        )
        (br_if $label$15
         (i32.eqz
          (local.tee $10
           (i32.and
            (local.get $6)
            (i32.const 65535)
           )
          )
         )
        )
        (local.set $0
         (i32.load offset=16
          (local.get $11)
         )
        )
        (local.set $1
         (i32.const 0)
        )
        (local.set $7
         (i32.const 1)
        )
        (loop $label$21
         (br_if $label$11
          (call_indirect $0 (type $0)
           (local.get $12)
           (local.get $9)
           (local.get $0)
          )
         )
         (br_if $label$15
          (i32.ge_u
           (i32.and
            (local.tee $1
             (i32.add
              (local.get $1)
              (i32.const 1)
             )
            )
            (i32.const 65535)
           )
           (local.get $10)
          )
         )
         (br $label$21)
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
       (local.set $7
        (i32.const 1)
       )
       (br_if $label$11
        (call $_RNvNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
         (local.tee $9
          (i32.load
           (local.get $0)
          )
         )
         (local.tee $11
          (i32.load offset=4
           (local.get $0)
          )
         )
         (local.get $8)
         (local.get $2)
         (local.get $3)
        )
       )
       (br_if $label$13
        (i32.eq
         (local.get $12)
         (i32.and
          (local.get $6)
          (i32.const 65535)
         )
        )
       )
       (local.set $10
        (i32.load offset=16
         (local.get $11)
        )
       )
       (local.set $1
        (i32.const 0)
       )
       (local.set $12
        (i32.and
         (i32.sub
          (local.get $12)
          (local.get $6)
         )
         (i32.const 65535)
        )
       )
       (br $label$14)
      )
      (local.set $7
       (i32.const 1)
      )
      (br_if $label$11
       (call $_RNvNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB7_9Formatter12pad_integral12write_prefix
        (local.get $12)
        (local.get $11)
        (local.get $8)
        (local.get $2)
        (local.get $3)
       )
      )
      (br_if $label$11
       (call_indirect $0 (type $1)
        (local.get $12)
        (local.get $4)
        (local.get $5)
        (i32.load offset=12
         (local.get $11)
        )
       )
      )
      (block $label$22
       (br_if $label$22
        (i32.ne
         (i32.and
          (local.get $13)
          (i32.const 65535)
         )
         (i32.and
          (local.get $6)
          (i32.const 65535)
         )
        )
       )
       (return
        (i32.const 0)
       )
      )
      (local.set $10
       (i32.load offset=16
        (local.get $11)
       )
      )
      (local.set $1
       (i32.const 0)
      )
      (local.set $0
       (i32.and
        (i32.sub
         (local.get $13)
         (local.get $6)
        )
        (i32.const 65535)
       )
      )
      (loop $label$23
       (br_if $label$11
        (local.tee $7
         (call_indirect $0 (type $0)
          (local.get $12)
          (local.get $9)
          (local.get $10)
         )
        )
       )
       (br_if $label$23
        (i32.lt_u
         (i32.and
          (local.tee $1
           (i32.add
            (local.get $1)
            (i32.const 1)
           )
          )
          (i32.const 65535)
         )
         (local.get $0)
        )
       )
       (br $label$11)
      )
     )
     (block $label$24
      (loop $label$25
       (br_if $label$24
        (call_indirect $0 (type $0)
         (local.get $9)
         (i32.const 48)
         (local.get $10)
        )
       )
       (br_if $label$13
        (i32.ge_u
         (i32.and
          (local.tee $1
           (i32.add
            (local.get $1)
            (i32.const 1)
           )
          )
          (i32.const 65535)
         )
         (local.get $12)
        )
       )
       (br $label$25)
      )
     )
     (return
      (i32.const 1)
     )
    )
    (br_if $label$11
     (call_indirect $0 (type $1)
      (local.get $9)
      (local.get $4)
      (local.get $5)
      (i32.load offset=12
       (local.get $11)
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
   (local.set $7
    (call_indirect $0 (type $1)
     (local.get $1)
     (local.get $4)
     (local.get $5)
     (i32.load offset=12
      (local.get $12)
     )
    )
   )
  )
  (local.get $7)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core3str5count14do_count_chars (param $0 i32) (param $1 i32) (result i32)
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
     (i32.eqz
      (local.tee $5
       (i32.shr_u
        (local.tee $4
         (i32.sub
          (local.get $1)
          (local.get $3)
         )
        )
        (i32.const 2)
       )
      )
     )
    )
    (local.set $6
     (i32.and
      (local.get $4)
      (i32.const 3)
     )
    )
    (local.set $7
     (i32.const 0)
    )
    (local.set $1
     (i32.const 0)
    )
    (block $label$3
     (br_if $label$3
      (i32.eq
       (local.get $2)
       (local.get $0)
      )
     )
     (local.set $8
      (i32.const 0)
     )
     (local.set $1
      (i32.const 0)
     )
     (block $label$4
      (br_if $label$4
       (i32.gt_u
        (local.tee $9
         (i32.sub
          (local.get $0)
          (local.get $2)
         )
        )
        (i32.const -4)
       )
      )
      (local.set $8
       (i32.const 0)
      )
      (local.set $1
       (i32.const 0)
      )
      (loop $label$5
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
                (local.get $8)
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
       (br_if $label$5
        (local.tee $8
         (i32.add
          (local.get $8)
          (i32.const 4)
         )
        )
       )
      )
     )
     (local.set $2
      (i32.add
       (local.get $0)
       (local.get $8)
      )
     )
     (loop $label$6
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
      (br_if $label$6
       (local.tee $9
        (i32.add
         (local.get $9)
         (i32.const 1)
        )
       )
      )
     )
    )
    (local.set $9
     (i32.add
      (local.get $0)
      (local.get $3)
     )
    )
    (block $label$7
     (br_if $label$7
      (i32.eqz
       (local.get $6)
      )
     )
     (local.set $7
      (i32.gt_s
       (i32.load8_s
        (local.tee $2
         (i32.add
          (local.get $9)
          (i32.and
           (local.get $4)
           (i32.const 2147483644)
          )
         )
        )
       )
       (i32.const -65)
      )
     )
     (br_if $label$7
      (i32.eq
       (local.get $6)
       (i32.const 1)
      )
     )
     (local.set $7
      (i32.add
       (local.get $7)
       (i32.gt_s
        (i32.load8_s offset=1
         (local.get $2)
        )
        (i32.const -65)
       )
      )
     )
     (br_if $label$7
      (i32.eq
       (local.get $6)
       (i32.const 2)
      )
     )
     (local.set $7
      (i32.add
       (local.get $7)
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
     (i32.add
      (local.get $7)
      (local.get $1)
     )
    )
    (loop $label$8
     (local.set $3
      (local.get $9)
     )
     (br_if $label$1
      (i32.eqz
       (local.get $5)
      )
     )
     (local.set $6
      (i32.and
       (local.tee $7
        (select
         (local.get $5)
         (i32.const 192)
         (i32.lt_u
          (local.get $5)
          (i32.const 192)
         )
        )
       )
       (i32.const 3)
      )
     )
     (block $label$9
      (block $label$10
       (br_if $label$10
        (local.tee $1
         (i32.and
          (local.tee $4
           (i32.shl
            (local.get $7)
            (i32.const 2)
           )
          )
          (i32.const 1008)
         )
        )
       )
       (local.set $2
        (i32.const 0)
       )
       (br $label$9)
      )
      (local.set $0
       (i32.add
        (local.get $3)
        (local.get $1)
       )
      )
      (local.set $2
       (i32.const 0)
      )
      (local.set $1
       (local.get $3)
      )
      (loop $label$11
       (local.set $2
        (i32.add
         (i32.and
          (i32.or
           (i32.shr_u
            (i32.xor
             (local.tee $9
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
            (local.get $9)
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
              (local.tee $9
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
             (local.get $9)
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
               (local.tee $9
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
              (local.get $9)
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
                (local.tee $9
                 (i32.load
                  (local.get $1)
                 )
                )
                (i32.const -1)
               )
               (i32.const 7)
              )
              (i32.shr_u
               (local.get $9)
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
         (local.get $0)
        )
       )
      )
     )
     (local.set $5
      (i32.sub
       (local.get $5)
       (local.get $7)
      )
     )
     (local.set $9
      (i32.add
       (local.get $3)
       (local.get $4)
      )
     )
     (local.set $8
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
       (local.get $8)
      )
     )
     (br_if $label$8
      (i32.eqz
       (local.get $6)
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
             (local.get $3)
             (i32.shl
              (i32.and
               (local.get $7)
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
       (local.get $6)
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.add
       (i32.and
        (i32.or
         (i32.shr_u
          (i32.xor
           (local.tee $9
            (i32.load offset=4
             (local.get $2)
            )
           )
           (i32.const -1)
          )
          (i32.const 7)
         )
         (i32.shr_u
          (local.get $9)
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
       (local.get $6)
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
    (local.set $8
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
      (local.get $8)
     )
    )
    (br $label$1)
   )
   (block $label$13
    (br_if $label$13
     (local.get $1)
    )
    (return
     (i32.const 0)
    )
   )
   (local.set $2
    (i32.and
     (local.get $1)
     (i32.const 3)
    )
   )
   (local.set $9
    (i32.const 0)
   )
   (local.set $8
    (i32.const 0)
   )
   (block $label$14
    (br_if $label$14
     (i32.lt_u
      (local.get $1)
      (i32.const 4)
     )
    )
    (local.set $5
     (i32.and
      (local.get $1)
      (i32.const -4)
     )
    )
    (local.set $8
     (i32.const 0)
    )
    (local.set $9
     (i32.const 0)
    )
    (loop $label$15
     (local.set $8
      (i32.add
       (i32.add
        (i32.add
         (i32.add
          (local.get $8)
          (i32.gt_s
           (i32.load8_s
            (local.tee $1
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
     (br_if $label$15
      (i32.ne
       (local.get $5)
       (local.tee $9
        (i32.add
         (local.get $9)
         (i32.const 4)
        )
       )
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (local.get $2)
     )
    )
   )
   (local.set $1
    (i32.add
     (local.get $0)
     (local.get $9)
    )
   )
   (loop $label$16
    (local.set $8
     (i32.add
      (local.get $8)
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
    (br_if $label$16
     (local.tee $2
      (i32.add
       (local.get $2)
       (i32.const -1)
      )
     )
    )
   )
  )
  (local.get $8)
 )
 (func $_RNvNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB7_9Formatter12pad_integral12write_prefix (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (block $label$1
   (br_if $label$1
    (i32.eq
     (local.get $2)
     (i32.const -1)
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
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter25debug_tuple_field1_finish (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
       (i32.const 1051510)
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
      (i32.const 1051511)
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
     (i32.const 1051516)
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
      (i32.const 1051507)
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
      (i32.const 1051513)
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
     (i32.const 1051509)
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
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter26debug_struct_field1_finish (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (result i32)
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
   (call $_RNvMs2_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_11DebugStruct5field
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
      (i32.const 1051514)
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
     (i32.const 1051496)
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
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter26debug_struct_field2_finish (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (param $9 i32) (param $10 i32) (result i32)
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
   (call $_RNvMs2_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_11DebugStruct5field
    (call $_RNvMs2_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_11DebugStruct5field
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
      (i32.const 1051514)
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
     (i32.const 1051496)
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
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter3pad (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
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
          (call $_RNvNtNtCs8hZryZq3oeI_4core3str5count14do_count_chars
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
        (local.set $7
         (i32.const 0)
        )
        (local.set $5
         (i32.const 0)
        )
        (block $label$10
         (br_if $label$10
          (i32.lt_u
           (local.get $2)
           (i32.const 4)
          )
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
         (loop $label$11
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
          (br_if $label$11
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
         (br_if $label$3
          (i32.eqz
           (local.get $6)
          )
         )
        )
        (local.set $8
         (i32.add
          (local.get $1)
          (local.get $7)
         )
        )
        (loop $label$12
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
         (br_if $label$12
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
       (local.set $7
        (i32.add
         (local.get $1)
         (local.get $2)
        )
       )
       (local.set $2
        (i32.const 0)
       )
       (local.set $8
        (local.get $1)
       )
       (local.set $6
        (local.get $4)
       )
       (loop $label$13
        (br_if $label$4
         (i32.eq
          (local.tee $5
           (local.get $8)
          )
          (local.get $7)
         )
        )
        (block $label$14
         (block $label$15
          (br_if $label$15
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
          (br $label$14)
         )
         (block $label$16
          (br_if $label$16
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
          (br $label$14)
         )
         (local.set $8
          (i32.add
           (local.get $5)
           (select
            (i32.const 4)
            (i32.const 3)
            (i32.gt_u
             (local.get $8)
             (i32.const -17)
            )
           )
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
        (br_if $label$13
         (local.tee $6
          (i32.add
           (local.get $6)
           (i32.const -1)
          )
         )
        )
       )
      )
      (local.set $6
       (i32.const 0)
      )
     )
     (local.set $5
      (i32.sub
       (local.get $4)
       (local.get $6)
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
    (local.set $4
     (i32.const 0)
    )
    (block $label$17
     (block $label$18
      (block $label$19
       (br_table $label$17 $label$19 $label$18 $label$17 $label$17
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
      (br $label$17)
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
    (local.set $10
     (i32.load offset=4
      (local.get $0)
     )
    )
    (local.set $8
     (i32.load
      (local.get $0)
     )
    )
    (block $label$20
     (br_if $label$20
      (i32.eqz
       (local.tee $7
        (i32.and
         (local.get $4)
         (i32.const 65535)
        )
       )
      )
     )
     (local.set $3
      (i32.load offset=16
       (local.get $10)
      )
     )
     (local.set $5
      (i32.const 0)
     )
     (local.set $0
      (i32.const 1)
     )
     (loop $label$21
      (br_if $label$1
       (call_indirect $0 (type $0)
        (local.get $8)
        (local.get $6)
        (local.get $3)
       )
      )
      (br_if $label$21
       (i32.lt_u
        (i32.and
         (local.tee $5
          (i32.add
           (local.get $5)
           (i32.const 1)
          )
         )
         (i32.const 65535)
        )
        (local.get $7)
       )
      )
     )
    )
    (block $label$22
     (br_if $label$22
      (i32.eqz
       (call_indirect $0 (type $1)
        (local.get $8)
        (local.get $1)
        (local.get $2)
        (i32.load offset=12
         (local.get $10)
        )
       )
      )
     )
     (return
      (i32.const 1)
     )
    )
    (block $label$23
     (br_if $label$23
      (i32.ne
       (i32.and
        (local.get $9)
        (i32.const 65535)
       )
       (i32.and
        (local.get $4)
        (i32.const 65535)
       )
      )
     )
     (return
      (i32.const 0)
     )
    )
    (local.set $2
     (i32.load offset=16
      (local.get $10)
     )
    )
    (local.set $5
     (i32.const 0)
    )
    (local.set $7
     (i32.and
      (i32.sub
       (local.get $9)
       (local.get $4)
      )
      (i32.const 65535)
     )
    )
    (loop $label$24
     (br_if $label$1
      (local.tee $0
       (call_indirect $0 (type $0)
        (local.get $8)
        (local.get $6)
        (local.get $2)
       )
      )
     )
     (br_if $label$1
      (i32.ge_u
       (i32.and
        (local.tee $5
         (i32.add
          (local.get $5)
          (i32.const 1)
         )
        )
        (i32.const 65535)
       )
       (local.get $7)
      )
     )
     (br $label$24)
    )
   )
   (local.set $0
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
  (local.get $0)
 )
 (func $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter9write_str (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $_RNvXs8_NtNtNtCs8hZryZq3oeI_4core3fmt3num3impmNtB9_7Display3fmt (param $0 i32) (param $1 i32) (result i32)
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
     (i32.const 16)
    )
   )
  )
  (local.set $3
   (i32.const 10)
  )
  (local.set $5
   (local.tee $4
    (i32.load
     (local.get $0)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.lt_u
     (local.get $4)
     (i32.const 1000)
    )
   )
   (local.set $3
    (i32.const 10)
   )
   (local.set $5
    (local.get $4)
   )
   (loop $label$2
    (i32.store16 align=1
     (i32.add
      (local.tee $6
       (i32.add
        (i32.add
         (local.get $2)
         (i32.const 6)
        )
        (local.get $3)
       )
      )
      (i32.const -4)
     )
     (i32.load16_u offset=1051594 align=1
      (i32.shl
       (local.tee $8
        (i32.div_u
         (i32.and
          (local.tee $7
           (i32.sub
            (local.tee $0
             (local.get $5)
            )
            (i32.mul
             (local.tee $5
              (i32.div_u
               (local.get $0)
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
    )
    (i32.store16 align=1
     (i32.add
      (local.get $6)
      (i32.const -2)
     )
     (i32.load16_u offset=1051594 align=1
      (i32.shl
       (i32.and
        (i32.sub
         (local.get $7)
         (i32.mul
          (local.get $8)
          (i32.const 100)
         )
        )
        (i32.const 65535)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i32.add
      (local.get $3)
      (i32.const -4)
     )
    )
    (br_if $label$2
     (i32.gt_u
      (local.get $0)
      (i32.const 9999999)
     )
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
    (local.set $0
     (local.get $5)
    )
    (br $label$3)
   )
   (i32.store16 align=1
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 6)
     )
     (local.tee $3
      (i32.add
       (local.get $3)
       (i32.const -2)
      )
     )
    )
    (i32.load16_u offset=1051594 align=1
     (i32.shl
      (i32.and
       (i32.sub
        (local.get $5)
        (i32.mul
         (local.tee $0
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
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.eqz
      (local.get $4)
     )
    )
    (br_if $label$5
     (i32.eqz
      (local.get $0)
     )
    )
   )
   (i32.store8
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 6)
     )
     (local.tee $3
      (i32.add
       (local.get $3)
       (i32.const -1)
      )
     )
    )
    (i32.load8_u offset=1051595
     (i32.shl
      (local.get $0)
      (i32.const 1)
     )
    )
   )
  )
  (local.set $3
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral
    (local.get $1)
    (i32.const 1)
    (i32.const 1)
    (i32.const 0)
    (i32.add
     (i32.add
      (local.get $2)
      (i32.const 6)
     )
     (local.get $3)
    )
    (i32.sub
     (i32.const 10)
     (local.get $3)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
  (local.get $3)
 )
 (func $_RNvNtCs8hZryZq3oeI_4core6option13unwrap_failed (param $0 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking5panic
   (i32.const 1051540)
   (i32.const 43)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtCs8hZryZq3oeI_4core6option13expect_failed (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
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
  (i64.store offset=8
   (local.get $3)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 36)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (local.get $3)
    )
   )
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1048934)
   (i32.add
    (local.get $3)
    (i32.const 8)
   )
   (local.get $2)
  )
  (unreachable)
 )
 (func $_RNvNtCs8hZryZq3oeI_4core6result13unwrap_failed (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (i32.store offset=4
   (local.get $5)
   (local.get $1)
  )
  (i32.store
   (local.get $5)
   (local.get $0)
  )
  (i32.store offset=12
   (local.get $5)
   (local.get $3)
  )
  (i32.store offset=8
   (local.get $5)
   (local.get $2)
  )
  (i64.store offset=24
   (local.get $5)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 34)
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
  (i64.store offset=16
   (local.get $5)
   (i64.or
    (i64.shl
     (i64.extend_i32_u
      (i32.const 36)
     )
     (i64.const 32)
    )
    (i64.extend_i32_u
     (local.get $5)
    )
   )
  )
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1048930)
   (i32.add
    (local.get $5)
    (i32.const 16)
   )
   (local.get $4)
  )
  (unreachable)
 )
 (func $_RNvXs1g_NtCs8hZryZq3oeI_4core3fmtRDNtB6_5DebugEL_Bx_3fmtB8_ (param $0 i32) (param $1 i32) (result i32)
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
 (func $_RNvXs8_NtCs8hZryZq3oeI_4core3fmtNtB5_9ArgumentsNtB5_7Display3fmt (param $0 i32) (param $1 i32) (result i32)
  (call $_RNvNtCs8hZryZq3oeI_4core3fmt5write
   (i32.load
    (local.get $1)
   )
   (i32.load offset=4
    (local.get $1)
   )
   (i32.load
    (local.get $0)
   )
   (i32.load offset=4
    (local.get $0)
   )
  )
 )
 (func $_RNvXs6_NtNtCs8hZryZq3oeI_4core3fmt3numjNtB7_8LowerHex3fmt (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $3
   (i32.load
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
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
      (local.get $0)
     )
     (i32.const 7)
    )
    (i32.load8_u offset=1051480
     (i32.and
      (local.get $3)
      (i32.const 15)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (br_if $label$1
    (local.tee $3
     (i32.shr_u
      (local.get $3)
      (i32.const 4)
     )
    )
   )
  )
  (local.set $0
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral
    (local.get $1)
    (i32.const 1)
    (i32.const 1051955)
    (i32.const 2)
    (i32.add
     (i32.add
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
      (local.get $0)
     )
     (i32.const 8)
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
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const23panic_const_div_by_zero (param $0 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1051794)
   (i32.const 51)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_add_overflow (param $0 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1051819)
   (i32.const 57)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shl_overflow (param $0 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1051847)
   (i32.const 71)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_shr_overflow (param $0 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1051882)
   (i32.const 73)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvNtNtCs8hZryZq3oeI_4core9panicking11panic_const24panic_const_sub_overflow (param $0 i32)
  (call $_RNvNtCs8hZryZq3oeI_4core9panicking9panic_fmt
   (i32.const 1051918)
   (i32.const 67)
   (local.get $0)
  )
  (unreachable)
 )
 (func $_RNvXs0_NtNtCs8hZryZq3oeI_4core3fmt8buildersNtB5_10PadAdapterNtB7_5Write10write_char (param $0 i32) (param $1 i32) (result i32)
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
      (i32.const 1051951)
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
 (func $_RNvXs8_NtNtCs8hZryZq3oeI_4core3fmt3numjNtB7_8UpperHex3fmt (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $3
   (i32.load
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
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
      (local.get $0)
     )
     (i32.const 7)
    )
    (i32.load8_u offset=1051957
     (i32.and
      (local.get $3)
      (i32.const 15)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (br_if $label$1
    (local.tee $3
     (i32.shr_u
      (local.get $3)
      (i32.const 4)
     )
    )
   )
  )
  (local.set $0
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral
    (local.get $1)
    (i32.const 1)
    (i32.const 1051955)
    (i32.const 2)
    (i32.add
     (i32.add
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
      (local.get $0)
     )
     (i32.const 8)
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
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_RNvXsC_NtNtCs8hZryZq3oeI_4core3fmt3numyNtB7_8LowerHex3fmt (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
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
     (i32.const 15)
    )
    (i32.load8_u offset=1051480
     (i32.and
      (i32.wrap_i64
       (local.get $3)
      )
      (i32.const 15)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (br_if $label$1
    (i64.ne
     (local.tee $3
      (i64.shr_u
       (local.get $3)
       (i64.const 4)
      )
     )
     (i64.const 0)
    )
   )
  )
  (local.set $0
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral
    (local.get $1)
    (i32.const 1)
    (i32.const 1051955)
    (i32.const 2)
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $0)
     )
     (i32.const 16)
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
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_RNvXsE_NtNtCs8hZryZq3oeI_4core3fmt3numyNtB7_8UpperHex3fmt (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
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
     (i32.const 15)
    )
    (i32.load8_u offset=1051957
     (i32.and
      (i32.wrap_i64
       (local.get $3)
      )
      (i32.const 15)
     )
    )
   )
   (local.set $0
    (i32.add
     (local.get $0)
     (i32.const -1)
    )
   )
   (br_if $label$1
    (i64.ne
     (local.tee $3
      (i64.shr_u
       (local.get $3)
       (i64.const 4)
      )
     )
     (i64.const 0)
    )
   )
  )
  (local.set $0
   (call $_RNvMsa_NtCs8hZryZq3oeI_4core3fmtNtB5_9Formatter12pad_integral
    (local.get $1)
    (i32.const 1)
    (i32.const 1051955)
    (i32.const 2)
    (i32.add
     (i32.add
      (local.get $2)
      (local.get $0)
     )
     (i32.const 16)
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
    (i32.const 16)
   )
  )
  (local.get $0)
 )
 (func $_RNvYNtNtNtCs8hZryZq3oeI_4core3fmt8builders10PadAdapterNtB6_5Write9write_fmtB8_ (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (call $_RNvNtCs8hZryZq3oeI_4core3fmt5write
   (local.get $0)
   (i32.const 1051516)
   (local.get $1)
   (local.get $2)
  )
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
         (local.get $3)
        )
       )
      )
      (i64.shr_u
       (local.get $1)
       (i64.extend_i32_u
        (i32.sub
         (i32.const 0)
         (local.get $3)
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
      (local.get $3)
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
        (i32.sub
         (i32.const 0)
         (local.get $3)
        )
       )
      )
      (i64.shr_u
       (local.get $1)
       (local.tee $4
        (i64.extend_i32_u
         (local.get $3)
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
      (local.get $3)
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

