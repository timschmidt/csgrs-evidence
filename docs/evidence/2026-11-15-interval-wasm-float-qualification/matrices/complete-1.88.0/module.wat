(module $interval_float_wasm_conformance.wasm
 (type $0 (func (param i32 i32) (result i32)))
 (type $1 (func (param i32 i32 i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32 i32 i32) (result i32)))
 (type $4 (func (param i32)))
 (type $5 (func (param i32 i64 i64 i64 i64)))
 (type $6 (func (param i32 i64 i64)))
 (type $7 (func (param i32 i64 i64 i64)))
 (type $8 (func (param i32 i64 i64 i32)))
 (type $9 (func (param i32) (result i32)))
 (type $10 (func (param i32 i32 i32 i32)))
 (type $11 (func (param i64 i64 i64 i64 i64 i64) (result i32)))
 (type $12 (func (param i32 i64 i64 i64 i32)))
 (type $13 (func (param i32 i32 i32 i32 i32)))
 (type $14 (func (result i32)))
 (type $15 (func (param i32 i32 i32 i32 i32 i32) (result i64)))
 (type $16 (func (param i32 i32 i32 i32 i32 i32 i32 i32) (result i64)))
 (type $17 (func (param i32 i64 i64 i64 i64 i64) (result i64)))
 (type $18 (func (param i32 i32 i32 i64 i64 i64 i64 i32) (result i64)))
 (type $19 (func (param i32 f32 f32)))
 (type $20 (func (param i32 i32 f32)))
 (type $21 (func (param i32 i32 f32 f32)))
 (type $22 (func (param i32 f64 f64)))
 (type $23 (func (param i32 i32 f64)))
 (type $24 (func (param i32 i32 f64 f64)))
 (type $25 (func (param i32 i64 i64 i32 i32)))
 (type $26 (func (param i32 i64 i64 i64 i64 i64)))
 (type $27 (func (param i64 i64 i64) (result i32)))
 (type $28 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
 (type $29 (func (param i32 i32 i32 i32 i32) (result i32)))
 (global $__stack_pointer (mut i32) (i32.const 1048576))
 (global $global$1 i32 (i32.const 1051412))
 (global $global$2 i32 (i32.const 1051424))
 (memory $0 17)
 (data $.rodata (i32.const 1048576) "NonFiniteEndpointReversedEndpointsNonSingletonEndpointUnboundedImageInvalidScaleOverflowContainsZeroEmptyDomainPoleUnsupportedBranchPrecisionExhaustedWorkExhaustedUnqualifiedEnvironmentunexpected primitive error\00\b9\00\10\00\1a\00\00\00src/lib.rs\00\00\dc\00\10\00\n\00\00\00\13\00\00\00\0e\00\00\00assertion failed: flags <= 3\dc\00\10\00\n\00\00\00\a1\00\00\00\01\00\00\00assertion failed: selector <= 2 && flags <= 3endpoints require nonempty success\00\00\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00endpoints require successinvalid operation\00\00\9d\01\10\00\11\00\00\00internal error: entered unreachable code\dc\00\10\00\n\00\00\00\a2\00\00\00\01\00\00\00\11\00\00\00\11\00\00\00\14\00\00\00\0e\00\00\00\0c\00\00\00\08\00\00\00\0c\00\00\00\0b\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\r\00\00\00\16\00\00\00\00\00\10\00\11\00\10\00\"\00\10\006\00\10\00D\00\10\00P\00\10\00X\00\10\00d\00\10\00o\00\10\00s\00\10\00\84\00\10\00\96\00\10\00\a3\00\10\00\10\00\00\00\00\00\00\80\11\00\00\00\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\80\13\00\00\00\00\00\00\80\14\00\00\00\00\00\00\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\00\00\80\10\00\00\00\00\00\00\00\11\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\12\00\00\00\00\00\00\00\13\00\00\00\00\00\00\00\14\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\00\00\00\00/mnt/development/csgrs-wasm-float/crates/hyperinterval/src/ieee.rs\00\00(\03\10\00B\00\00\00\1e\00\00\00\1a\00\00\00(\03\10\00B\00\00\00H\00\00\00\r\00\00\00(\03\10\00B\00\00\00F\00\00\00\r\00\00\00(\03\10\00B\00\00\00a\00\00\00\19\00\00\00(\03\10\00B\00\00\00l\00\00\00)\00\00\00(\03\10\00B\00\00\00p\00\00\00.\00\00\00(\03\10\00B\00\00\00\80\00\00\00\13\00\00\00(\03\10\00B\00\00\00\85\00\00\00\12\00\00\00(\03\10\00B\00\00\00\8f\00\00\00\r\00\00\00(\03\10\00B\00\00\00\87\00\00\00%\00\00\00(\03\10\00B\00\00\00\87\00\00\00\17\00\00\00(\03\10\00B\00\00\00\9e\00\00\00\14\00\00\00(\03\10\00B\00\00\00\9f\00\00\00&\00\00\00(\03\10\00B\00\00\00\9f\00\00\00\15\00\00\00(\03\10\00B\00\00\00\a0\00\00\00?\00\00\00(\03\10\00B\00\00\00\b1\00\00\00\13\00\00\00(\03\10\00B\00\00\00\b5\00\00\00\'\00\00\00(\03\10\00B\00\00\00\b6\00\00\00\15\00\00\00(\03\10\00B\00\00\00\bd\00\00\00\13\00\00\00(\03\10\00B\00\00\00\bd\00\00\00\0e\00\00\00(\03\10\00B\00\00\00\c0\00\00\00!\00\00\00(\03\10\00B\00\00\00\d8\00\00\00\13\00\00\00(\03\10\00B\00\00\00\e0\00\00\00\12\00\00\00(\03\10\00B\00\00\00\e2\00\00\00\1a\00\00\00(\03\10\00B\00\00\00\cc\00\00\00\19\00\00\00(\03\10\00B\00\00\00\cd\00\00\00\r\00\00\00(\03\10\00B\00\00\00\ce\00\00\00\r\00\00\00(\03\10\00B\00\00\00\f4\00\00\00\18\00\00\00(\03\10\00B\00\00\00\f5\00\00\00\17\00\00\00(\03\10\00B\00\00\00\11\01\00\00\1f\00\00\00(\03\10\00B\00\00\00\12\01\00\00\14\00\00\00(\03\10\00B\00\00\00/\01\00\00\1a\00\00\00(\03\10\00B\00\00\00\14\01\00\00\19\00\00\00(\03\10\00B\00\00\00\18\01\00\00\17\00\00\00(\03\10\00B\00\00\00\17\01\00\00\12\00\00\00(\03\10\00B\00\00\00L\01\00\00\1c\00\00\00(\03\10\00B\00\00\00M\01\00\00\1b\00\00\00(\03\10\00B\00\00\00`\01\00\00\r\00\00\00(\03\10\00B\00\00\00^\01\00\00\1b\00\00\00(\03\10\00B\00\00\00e\01\00\00\18\00\00\00(\03\10\00B\00\00\00f\01\00\00\13\00\00\00(\03\10\00B\00\00\00j\01\00\00\'\00\00\00(\03\10\00B\00\00\00k\01\00\00\15\00\00\00(\03\10\00B\00\00\00p\01\00\00\13\00\00\00(\03\10\00B\00\00\00s\01\00\00\15\00\00\00(\03\10\00B\00\00\00t\01\00\00\0e\00\00\00(\03\10\00B\00\00\00n\01\00\00\15\00\00\00(\03\10\00B\00\00\00o\01\00\00\0e\00\00\00(\03\10\00B\00\00\00x\01\00\00\19\00\00\00(\03\10\00B\00\00\00\7f\01\00\00 \00\00\00(\03\10\00B\00\00\00\98\01\00\00\n\00\00\00(\03\10\00B\00\00\00\9b\01\00\00\t\00\00\00(\03\10\00B\00\00\00\a0\01\00\00\15\00\00\00(\03\10\00B\00\00\00\a8\01\00\00\11\00\00\00\00\00\01\00\01\01\01\02\02\00\02\01\02\02\02\03\02\04\03\00\03\01\03\02\03\03\03\04\03\05\03\06\04\00\04\01\04\02\04\03\04\04\04\05\04\06\04\07\04\08\05\00\05\01\05\02\05\03\05\04\05\05\05\06\05\07\05\08\05\t\05\n\06\00\06\01\06\02\06\03\06\04\06\05\06\06\06\07\06\08\06\t\06\n\06\0b\06\0c\07\00\07\01\07\02\07\03\07\04\07\05\07\06\07\07\07\08\07\t\07\n\07\0b\07\0c\07\r\07\0e\08\00\08\01\08\02\08\03\08\04\08\05\08\06\08\07\08\08\08\t\08\n\08\0b\08\0c\08\r\08\0e\08\0f\08\10\t\00\t\01\t\02\t\03\t\04\t\05\t\06\t\07\t\08\t\t\t\n\t\0b\t\0c\t\r\t\0e\t\0f\t\10\t\11\t\12\n\00\n\01\n\02\n\03\n\04\n\05\n\06\n\07\n\08\n\t\n\n\n\0b\n\0c\n\r\n\0e\n\0f\n\10\n\11\n\12\n\13\n\14\0b\00\0b\01\0b\02\0b\03\0b\04\0b\05\0b\06\0b\07\0b\08\0b\t\0b\n\0b\0b\0b\0c\0b\r\0b\0e\0b\0f\0b\10\0b\11\0b\12\0b\13\0b\14\0b\15\0b\16\0c\00\0c\01\0c\02\0c\03\0c\04\0c\05\0c\06\0c\07\0c\08\0c\t\0c\n\0c\0b\0c\0c\0c\r\0c\0e\0c\0f\0c\10\0c\11\0c\12\0c\13\0c\14\0c\15\0c\16\0c\17\0c\18\r\00\r\01\r\02\r\03\r\04\r\05\r\06\r\07\r\08\r\t\r\n\r\0b\r\0c\r\r\r\0e\r\0f\r\10\r\11\r\12\r\13\r\14\r\15\r\16\r\17\r\18\r\19\r\1a\0e\00\0e\01\0e\02\0e\03\0e\04\0e\05\0e\06\0e\07\0e\08\0e\t\0e\n\0e\0b\0e\0c\0e\r\0e\0e\0e\0f\0e\10\0e\11\0e\12\0e\13\0e\14\0e\15\0e\16\0e\17\0e\18\0e\19\0e\1a\0e\1b\0e\1c\0f\00\0f\01\0f\02\0f\03\0f\04\0f\05\0f\06\0f\07\0f\08\0f\t\0f\n\0f\0b\0f\0c\0f\r\0f\0e\0f\0f\0f\10\0f\11\0f\12\0f\13\0f\14\0f\15\0f\16\0f\17\0f\18\0f\19\0f\1a\0f\1b\0f\1c\0f\1d\0f\1eattempt to add with overflow\cc\08\10\00\1c\00\00\00attempt to subtract with overflow\00\00\00\f0\08\10\00!\00\00\00attempt to multiply with overflow\00\00\00\1c\t\10\00!\00\00\00attempt to negate with overflow\00H\t\10\00\1f\00\00\00attempt to shift right with overflowp\t\10\00$\00\00\00attempt to shift left with overflow\00\9c\t\10\00#\00\00\00\01\00\00\00\00\00\00\00index out of bounds: the len is  but the index is \00\00\d0\t\10\00 \00\00\00\f0\t\10\00\12\00\00\00: \00\00\01\00\00\00\00\00\00\00\14\n\10\00\02\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899attempt to divide by zero\00\00\00\f0\n\10\00\19\00\00\00")
 (table $0 5 5 funcref)
 (elem $0 (i32.const 1) $_ZN72_$LT$hyperinterval..state..IntervalError$u20$as$u20$core..fmt..Debug$GT$3fmt17h592cb8c50f843f81E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h10d43ed3b5ffe62fE $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hb7cc4525d713b4b9E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h44818328333068deE)
 (export "memory" (memory $0))
 (export "qualification" (func $qualification))
 (export "properties32" (func $properties32))
 (export "query32" (func $query32))
 (export "properties64" (func $properties64))
 (export "query64" (func $query64))
 (export "__data_end" (global $global$1))
 (export "__heap_base" (global $global$2))
 (func $_ZN72_$LT$hyperinterval..state..IntervalError$u20$as$u20$core..fmt..Debug$GT$3fmt17h592cb8c50f843f81E (param $0 i32) (param $1 i32) (result i32)
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
     (i32.const 1049124)
    )
   )
   (i32.load
    (i32.add
     (local.get $0)
     (i32.const 1049072)
    )
   )
  )
 )
 (func $_RNvCs691rhTbG0Ee_7___rustc17rust_begin_unwind (param $0 i32)
  (unreachable)
 )
 (func $qualification (result i32)
  (i32.const 3)
 )
 (func $properties32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (result i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (global.set $__stack_pointer
   (local.tee $6
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 64)
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
           (i32.ge_u
            (local.get $0)
            (i32.const 4)
           )
          )
          (br_if $label$7
           (i32.and
            (local.get $0)
            (i32.const 1)
           )
          )
          (call $_ZN13hyperinterval5float12F32Enclosure3new17h1e9b63f368a23a9cE
           (i32.add
            (local.get $6)
            (i32.const 40)
           )
           (f32.reinterpret_i32
            (local.get $1)
           )
           (f32.reinterpret_i32
            (local.get $2)
           )
          )
          (local.set $2
           (i32.load8_u offset=44
            (local.get $6)
           )
          )
          (br_if $label$5
           (i32.eq
            (local.tee $1
             (i32.load offset=40
              (local.get $6)
             )
            )
            (i32.const 2)
           )
          )
          (i32.store align=1
           (i32.add
            (i32.add
             (local.get $6)
             (i32.const 8)
            )
            (i32.const 8)
           )
           (i32.load align=1
            (i32.add
             (i32.add
              (local.get $6)
              (i32.const 40)
             )
             (i32.const 8)
            )
           )
          )
          (i32.store offset=13 align=1
           (local.get $6)
           (i32.load offset=45 align=1
            (local.get $6)
           )
          )
          (i32.store8 offset=12
           (local.get $6)
           (local.get $2)
          )
          (br $label$6)
         )
         (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
          (i32.const 1048824)
          (i32.const 28)
          (i32.const 1048852)
         )
         (unreachable)
        )
        (local.set $1
         (i32.const 0)
        )
       )
       (i32.store offset=8
        (local.get $6)
        (local.get $1)
       )
       (block $label$9
        (block $label$10
         (br_if $label$10
          (i32.gt_u
           (local.get $0)
           (i32.const 1)
          )
         )
         (call $_ZN13hyperinterval5float12F32Enclosure3new17h1e9b63f368a23a9cE
          (i32.add
           (local.get $6)
           (i32.const 40)
          )
          (f32.reinterpret_i32
           (local.get $3)
          )
          (f32.reinterpret_i32
           (local.get $4)
          )
         )
         (local.set $0
          (i32.const 2)
         )
         (local.set $2
          (i32.load8_u offset=44
           (local.get $6)
          )
         )
         (br_if $label$5
          (i32.eq
           (local.tee $7
            (i32.load offset=40
             (local.get $6)
            )
           )
           (i32.const 2)
          )
         )
         (i32.store align=1
          (i32.add
           (i32.add
            (local.get $6)
            (i32.const 20)
           )
           (i32.const 8)
          )
          (i32.load align=1
           (i32.add
            (i32.add
             (local.get $6)
             (i32.const 40)
            )
            (i32.const 8)
           )
          )
         )
         (i32.store offset=25 align=1
          (local.get $6)
          (i32.load offset=45 align=1
           (local.get $6)
          )
         )
         (i32.store8 offset=24
          (local.get $6)
          (local.get $2)
         )
         (i32.store offset=20
          (local.get $6)
          (local.get $7)
         )
         (local.set $4
          (i32.load offset=12
           (local.get $6)
          )
         )
         (local.set $3
          (i32.load offset=16
           (local.get $6)
          )
         )
         (block $label$11
          (br_if $label$11
           (i32.and
            (local.get $1)
            (i32.const 1)
           )
          )
          (local.set $7
           (local.get $1)
          )
          (br $label$9)
         )
         (block $label$12
          (br_if $label$12
           (i32.and
            (local.get $7)
            (i32.const 1)
           )
          )
          (local.set $7
           (local.get $1)
          )
          (br $label$9)
         )
         (local.set $8
          (i64.load offset=24 align=4
           (local.get $6)
          )
         )
         (i32.store offset=36
          (local.get $6)
          (local.get $3)
         )
         (i32.store offset=32
          (local.get $6)
          (local.get $4)
         )
         (i64.store offset=40 align=4
          (local.get $6)
          (local.get $8)
         )
         (local.set $0
          (call $_ZN65_$LT$hyperinterval..float..F32Width$u20$as$u20$core..cmp..Ord$GT$3cmp17hf5c5d86b9fe2b0f3E
           (i32.add
            (local.get $6)
            (i32.const 32)
           )
           (i32.add
            (local.get $6)
            (i32.const 40)
           )
          )
         )
         (local.set $7
          (i32.const 1)
         )
         (br $label$9)
        )
        (i32.store offset=20
         (local.get $6)
         (i32.const 0)
        )
        (local.set $0
         (i32.const 2)
        )
        (local.set $4
         (i32.load offset=12
          (local.get $6)
         )
        )
        (local.set $3
         (i32.load offset=16
          (local.get $6)
         )
        )
        (local.set $7
         (local.get $1)
        )
       )
       (call $_ZN13hyperinterval5float12F32Enclosure14contains_point17ha5bf72dea7c1d4b3E
        (local.get $6)
        (i32.add
         (local.get $6)
         (i32.const 8)
        )
        (f32.reinterpret_i32
         (local.get $5)
        )
       )
       (local.set $2
        (i32.load8_u offset=1
         (local.get $6)
        )
       )
       (br_if $label$4
        (i32.eqz
         (i32.load8_u
          (local.get $6)
         )
        )
       )
      )
      (br_if $label$3
       (i32.lt_u
        (local.tee $0
         (i32.and
          (local.get $2)
          (i32.const 255)
         )
        )
        (i32.const 13)
       )
      )
      (br $label$1)
     )
     (local.set $5
      (call $_ZN13hyperinterval5float12F32Enclosure9subset_of17h1d03ebd189bf0f9bE
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 20)
       )
      )
     )
     (local.set $9
      (call $_ZN13hyperinterval5float12F32Enclosure18interior_subset_of17h7a2c38c7d516eedaE
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 20)
       )
      )
     )
     (local.set $10
      (call $_ZN13hyperinterval5float12F32Enclosure16strictly_left_of17hb691d63bce3bf31aE
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 20)
       )
      )
     )
     (local.set $11
      (call $_ZN13hyperinterval5float12F32Enclosure8disjoint17h33a2cd651fccd0a9E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 20)
       )
      )
     )
     (local.set $12
      (call $_ZN13hyperinterval5float12F32Enclosure8overlaps17hc99ae6321de96eaeE
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 20)
       )
      )
     )
     (local.set $13
      (call $_ZN13hyperinterval5float12F32Enclosure5signs17h047269d06770f184E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
      )
     )
     (local.set $14
      (call $_ZN13hyperinterval5float12F32Enclosure5signs17h047269d06770f184E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
      )
     )
     (local.set $8
      (i64.or
       (i64.or
        (i64.or
         (i64.or
          (i64.or
           (i64.or
            (i64.or
             (i64.or
              (i64.or
               (i64.or
                (i64.or
                 (i64.or
                  (i64.or
                   (select
                    (i64.shl
                     (i64.extend_i32_u
                      (i32.eq
                       (local.get $4)
                       (local.get $3)
                      )
                     )
                     (i64.const 1)
                    )
                    (i64.const 0)
                    (i32.and
                     (local.get $7)
                     (i32.const 1)
                    )
                   )
                   (i64.extend_i32_u
                    (i32.xor
                     (local.get $1)
                     (i32.const 1)
                    )
                   )
                  )
                  (i64.shl
                   (i64.extend_i32_u
                    (i32.eq
                     (local.tee $0
                      (i32.and
                       (local.get $0)
                       (i32.const 255)
                      )
                     )
                     (i32.const 255)
                    )
                   )
                   (i64.const 8)
                  )
                 )
                 (i64.shl
                  (i64.extend_i32_u
                   (i32.eqz
                    (local.get $0)
                   )
                  )
                  (i64.const 9)
                 )
                )
                (i64.shl
                 (i64.extend_i32_u
                  (i32.eq
                   (local.get $0)
                   (i32.const 1)
                  )
                 )
                 (i64.const 10)
                )
               )
               (i64.extend_i32_u
                (i32.and
                 (i32.shl
                  (local.get $2)
                  (i32.const 2)
                 )
                 (i32.const 4)
                )
               )
              )
              (select
               (i64.const 8)
               (i64.const 0)
               (local.get $5)
              )
             )
             (select
              (i64.const 16)
              (i64.const 0)
              (local.get $9)
             )
            )
            (select
             (i64.const 32)
             (i64.const 0)
             (local.get $10)
            )
           )
           (select
            (i64.const 64)
            (i64.const 0)
            (local.get $11)
           )
          )
          (select
           (i64.const 128)
           (i64.const 0)
           (local.get $12)
          )
         )
         (i64.shl
          (i64.extend_i32_u
           (i32.and
            (local.get $13)
            (i32.const 249)
           )
          )
          (i64.const 11)
         )
        )
        (i64.shl
         (i64.extend_i32_u
          (i32.gt_u
           (i32.and
            (call $_ZN13hyperinterval5float12F32Enclosure5signs17h047269d06770f184E
             (i32.add
              (local.get $6)
              (i32.const 8)
             )
            )
            (i32.const 255)
           )
           (i32.const 3)
          )
         )
         (i64.const 13)
        )
       )
       (i64.shl
        (i64.extend_i32_u
         (i32.shr_u
          (i32.and
           (local.get $14)
           (i32.const 250)
          )
          (i32.const 1)
         )
        )
        (i64.const 12)
       )
      )
     )
     (br $label$2)
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (i32.shr_u
        (i32.const 4323)
        (local.get $0)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $8
     (i64.load
      (i32.add
       (i32.shl
        (i32.and
         (local.get $2)
         (i32.const 255)
        )
        (i32.const 3)
       )
       (i32.const 1049176)
      )
     )
    )
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $6)
     (i32.const 64)
    )
   )
   (return
    (local.get $8)
   )
  )
  (i32.store offset=56
   (local.get $6)
   (i32.const 0)
  )
  (i32.store offset=44
   (local.get $6)
   (i32.const 1)
  )
  (i32.store offset=40
   (local.get $6)
   (i32.const 1048788)
  )
  (i64.store offset=48 align=4
   (local.get $6)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $6)
    (i32.const 40)
   )
   (i32.const 1048808)
  )
  (unreachable)
 )
 (func $query32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (result i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (global.set $__stack_pointer
   (local.tee $8
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.gt_u
         (local.get $1)
         (i32.const 2)
        )
       )
       (br_if $label$5
        (i32.ge_u
         (local.get $2)
         (i32.const 4)
        )
       )
       (br_if $label$4
        (i32.and
         (local.get $2)
         (i32.const 1)
        )
       )
       (call $_ZN13hyperinterval5float12F32Enclosure3new17h1e9b63f368a23a9cE
        (i32.add
         (local.get $8)
         (i32.const 72)
        )
        (f32.reinterpret_i32
         (local.get $3)
        )
        (f32.reinterpret_i32
         (local.get $4)
        )
       )
       (local.set $3
        (i32.const 2)
       )
       (local.set $4
        (i32.load8_u offset=76
         (local.get $8)
        )
       )
       (br_if $label$2
        (i32.eq
         (local.tee $9
          (i32.load offset=72
           (local.get $8)
          )
         )
         (i32.const 2)
        )
       )
       (i32.store align=1
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
        (i32.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 72)
          )
          (i32.const 8)
         )
        )
       )
       (i32.store offset=5 align=1
        (local.get $8)
        (i32.load offset=77 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=4
        (local.get $8)
        (local.get $4)
       )
       (br $label$3)
      )
      (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
       (i32.const 1048868)
       (i32.const 45)
       (i32.const 1048852)
      )
      (unreachable)
     )
     (local.set $9
      (i32.const 0)
     )
    )
    (i32.store
     (local.get $8)
     (local.get $9)
    )
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
                (block $label$18
                 (block $label$19
                  (block $label$20
                   (block $label$21
                    (br_table $label$18 $label$8 $label$8 $label$8 $label$8 $label$17 $label$16 $label$15 $label$20 $label$19 $label$8 $label$8 $label$8 $label$8 $label$14 $label$13 $label$12 $label$11 $label$10 $label$9 $label$8 $label$21
                     (local.get $0)
                    )
                   )
                   (i32.store offset=88
                    (local.get $8)
                    (i32.const 0)
                   )
                   (i32.store offset=76
                    (local.get $8)
                    (i32.const 1)
                   )
                   (i32.store offset=72
                    (local.get $8)
                    (i32.const 1049008)
                   )
                   (i64.store offset=80 align=4
                    (local.get $8)
                    (i64.const 4)
                   )
                   (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
                    (i32.add
                     (local.get $8)
                     (i32.const 72)
                    )
                    (i32.const 1048852)
                   )
                   (unreachable)
                  )
                  (local.set $2
                   (i32.const 1)
                  )
                  (block $label$22
                   (block $label$23
                    (br_if $label$23
                     (i32.and
                      (local.get $9)
                      (i32.const 1)
                     )
                    )
                    (local.set $2
                     (i32.const 0)
                    )
                    (br $label$22)
                   )
                   (local.set $4
                    (select
                     (i32.xor
                      (local.tee $4
                       (i32.load offset=4
                        (local.get $8)
                       )
                      )
                      (i32.const -2147483648)
                     )
                     (i32.const 0)
                     (local.get $4)
                    )
                   )
                   (local.set $3
                    (select
                     (i32.xor
                      (local.tee $3
                       (i32.load offset=8
                        (local.get $8)
                       )
                      )
                      (i32.const -2147483648)
                     )
                     (i32.const 0)
                     (local.get $3)
                    )
                   )
                  )
                  (i32.store offset=56
                   (local.get $8)
                   (local.get $4)
                  )
                  (i32.store offset=52
                   (local.get $8)
                   (local.get $3)
                  )
                  (i32.store offset=48
                   (local.get $8)
                   (local.get $2)
                  )
                  (br $label$7)
                 )
                 (call $_ZN13hyperinterval5float12F32Enclosure3abs17h7054600bb8d8e83bE
                  (i32.add
                   (local.get $8)
                   (i32.const 48)
                  )
                  (local.get $8)
                 )
                 (br $label$7)
                )
                (i32.store
                 (i32.add
                  (i32.add
                   (local.get $8)
                   (i32.const 48)
                  )
                  (i32.const 8)
                 )
                 (i32.load
                  (i32.add
                   (local.get $8)
                   (i32.const 8)
                  )
                 )
                )
                (i64.store offset=48
                 (local.get $8)
                 (i64.load align=4
                  (local.get $8)
                 )
                )
                (br $label$7)
               )
               (call $_ZN13hyperinterval5float12F32Enclosure6square17h39ac62af88cfbe3dE
                (i32.add
                 (local.get $8)
                 (i32.const 72)
                )
                (local.get $8)
               )
               (local.set $3
                (i32.const 2)
               )
               (local.set $4
                (i32.load8_u offset=76
                 (local.get $8)
                )
               )
               (br_if $label$2
                (i32.eq
                 (local.tee $2
                  (i32.load offset=72
                   (local.get $8)
                  )
                 )
                 (i32.const 2)
                )
               )
               (i32.store align=1
                (i32.add
                 (i32.add
                  (local.get $8)
                  (i32.const 48)
                 )
                 (i32.const 8)
                )
                (i32.load align=1
                 (i32.add
                  (i32.add
                   (local.get $8)
                   (i32.const 72)
                  )
                  (i32.const 8)
                 )
                )
               )
               (i32.store offset=53 align=1
                (local.get $8)
                (i32.load offset=77 align=1
                 (local.get $8)
                )
               )
               (i32.store8 offset=52
                (local.get $8)
                (local.get $4)
               )
               (i32.store offset=48
                (local.get $8)
                (local.get $2)
               )
               (br $label$7)
              )
              (call $_ZN13hyperinterval5float12F32Enclosure4sqrt17h76611bab0b21f3d6E
               (i32.add
                (local.get $8)
                (i32.const 72)
               )
               (local.get $8)
              )
              (local.set $3
               (i32.const 2)
              )
              (local.set $4
               (i32.load8_u offset=76
                (local.get $8)
               )
              )
              (br_if $label$2
               (i32.eq
                (local.tee $2
                 (i32.load offset=72
                  (local.get $8)
                 )
                )
                (i32.const 2)
               )
              )
              (i32.store align=1
               (i32.add
                (i32.add
                 (local.get $8)
                 (i32.const 48)
                )
                (i32.const 8)
               )
               (i32.load align=1
                (i32.add
                 (i32.add
                  (local.get $8)
                  (i32.const 72)
                 )
                 (i32.const 8)
                )
               )
              )
              (i32.store offset=53 align=1
               (local.get $8)
               (i32.load offset=77 align=1
                (local.get $8)
               )
              )
              (i32.store8 offset=52
               (local.get $8)
               (local.get $4)
              )
              (i32.store offset=48
               (local.get $8)
               (local.get $2)
              )
              (local.set $10
               (select
                (i64.const 2)
                (i64.const 0)
                (i32.and
                 (i32.load8_u offset=84
                  (local.get $8)
                 )
                 (i32.const 1)
                )
               )
              )
              (br $label$6)
             )
             (call $_ZN13hyperinterval5float12F32Enclosure6affine17h7752272bfb4adca0E
              (i32.add
               (local.get $8)
               (i32.const 72)
              )
              (local.get $8)
              (f32.reinterpret_i32
               (local.get $5)
              )
              (f32.reinterpret_i32
               (local.get $6)
              )
             )
             (local.set $3
              (i32.const 2)
             )
             (local.set $4
              (i32.load8_u offset=76
               (local.get $8)
              )
             )
             (br_if $label$2
              (i32.eq
               (local.tee $2
                (i32.load offset=72
                 (local.get $8)
                )
               )
               (i32.const 2)
              )
             )
             (i32.store align=1
              (i32.add
               (i32.add
                (local.get $8)
                (i32.const 48)
               )
               (i32.const 8)
              )
              (i32.load align=1
               (i32.add
                (i32.add
                 (local.get $8)
                 (i32.const 72)
                )
                (i32.const 8)
               )
              )
             )
             (i32.store offset=53 align=1
              (local.get $8)
              (i32.load offset=77 align=1
               (local.get $8)
              )
             )
             (i32.store8 offset=52
              (local.get $8)
              (local.get $4)
             )
             (i32.store offset=48
              (local.get $8)
              (local.get $2)
             )
             (br $label$7)
            )
            (call $_ZN13hyperinterval5float12F32Enclosure10reciprocal17hde7475c30be6a1b3E
             (i32.add
              (local.get $8)
              (i32.const 72)
             )
             (local.get $8)
            )
            (local.set $3
             (i32.const 2)
            )
            (local.set $4
             (i32.load8_u offset=76
              (local.get $8)
             )
            )
            (br_if $label$2
             (i32.eq
              (local.tee $2
               (i32.load offset=72
                (local.get $8)
               )
              )
              (i32.const 2)
             )
            )
            (i32.store align=1
             (i32.add
              (i32.add
               (local.get $8)
               (i32.const 48)
              )
              (i32.const 8)
             )
             (i32.load align=1
              (i32.add
               (i32.add
                (local.get $8)
                (i32.const 72)
               )
               (i32.const 8)
              )
             )
            )
            (i32.store offset=53 align=1
             (local.get $8)
             (i32.load offset=77 align=1
              (local.get $8)
             )
            )
            (i32.store8 offset=52
             (local.get $8)
             (local.get $4)
            )
            (i32.store offset=48
             (local.get $8)
             (local.get $2)
            )
            (br $label$7)
           )
           (call $_ZN13hyperinterval5float12F32Enclosure18midpoint_enclosure17hea96b2ad54ffd4baE
            (i32.add
             (local.get $8)
             (i32.const 72)
            )
            (local.get $8)
           )
           (local.set $3
            (i32.const 2)
           )
           (local.set $4
            (i32.load8_u offset=76
             (local.get $8)
            )
           )
           (br_if $label$2
            (i32.eq
             (local.tee $2
              (i32.load offset=72
               (local.get $8)
              )
             )
             (i32.const 2)
            )
           )
           (i32.store align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 48)
             )
             (i32.const 8)
            )
            (i32.load align=1
             (i32.add
              (i32.add
               (local.get $8)
               (i32.const 72)
              )
              (i32.const 8)
             )
            )
           )
           (i32.store offset=53 align=1
            (local.get $8)
            (i32.load offset=77 align=1
             (local.get $8)
            )
           )
           (i32.store8 offset=52
            (local.get $8)
            (local.get $4)
           )
           (i32.store offset=48
            (local.get $8)
            (local.get $2)
           )
           (br $label$7)
          )
          (call $_ZN13hyperinterval5float12F32Enclosure16radius_enclosure17hd10628678d0d99a1E
           (i32.add
            (local.get $8)
            (i32.const 72)
           )
           (local.get $8)
          )
          (local.set $3
           (i32.const 2)
          )
          (local.set $4
           (i32.load8_u offset=76
            (local.get $8)
           )
          )
          (br_if $label$2
           (i32.eq
            (local.tee $2
             (i32.load offset=72
              (local.get $8)
             )
            )
            (i32.const 2)
           )
          )
          (i32.store align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 48)
            )
            (i32.const 8)
           )
           (i32.load align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 72)
             )
             (i32.const 8)
            )
           )
          )
          (i32.store offset=53 align=1
           (local.get $8)
           (i32.load offset=77 align=1
            (local.get $8)
           )
          )
          (i32.store8 offset=52
           (local.get $8)
           (local.get $4)
          )
          (i32.store offset=48
           (local.get $8)
           (local.get $2)
          )
          (br $label$7)
         )
         (block $label$24
          (br_if $label$24
           (i32.and
            (local.get $9)
            (i32.const 1)
           )
          )
          (i32.store offset=48
           (local.get $8)
           (i32.const 0)
          )
          (br $label$7)
         )
         (i64.store offset=60 align=4
          (local.get $8)
          (i64.load offset=4 align=4
           (local.get $8)
          )
         )
         (call $_ZN13hyperinterval5float8F32Width9enclosure17h545f9216acbd0bd6E
          (i32.add
           (local.get $8)
           (i32.const 72)
          )
          (i32.add
           (local.get $8)
           (i32.const 60)
          )
         )
         (local.set $3
          (i32.const 2)
         )
         (local.set $4
          (i32.load8_u offset=76
           (local.get $8)
          )
         )
         (br_if $label$2
          (i32.eq
           (local.tee $2
            (i32.load offset=72
             (local.get $8)
            )
           )
           (i32.const 2)
          )
         )
         (i32.store align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 48)
           )
           (i32.const 8)
          )
          (i32.load align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 72)
            )
            (i32.const 8)
           )
          )
         )
         (i32.store offset=53 align=1
          (local.get $8)
          (i32.load offset=77 align=1
           (local.get $8)
          )
         )
         (i32.store8 offset=52
          (local.get $8)
          (local.get $4)
         )
         (i32.store offset=48
          (local.get $8)
          (local.get $2)
         )
         (br $label$7)
        )
        (call $_ZN13hyperinterval5float12F32Enclosure8expanded17h5ad4488c8b671d6dE
         (i32.add
          (local.get $8)
          (i32.const 72)
         )
         (local.get $8)
        )
        (local.set $3
         (i32.const 2)
        )
        (local.set $4
         (i32.load8_u offset=76
          (local.get $8)
         )
        )
        (br_if $label$2
         (i32.eq
          (local.tee $2
           (i32.load offset=72
            (local.get $8)
           )
          )
          (i32.const 2)
         )
        )
        (i32.store align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 48)
          )
          (i32.const 8)
         )
         (i32.load align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 72)
           )
           (i32.const 8)
          )
         )
        )
        (i32.store offset=53 align=1
         (local.get $8)
         (i32.load offset=77 align=1
          (local.get $8)
         )
        )
        (i32.store8 offset=52
         (local.get $8)
         (local.get $4)
        )
        (i32.store offset=48
         (local.get $8)
         (local.get $2)
        )
        (br $label$7)
       )
       (call $_ZN13hyperinterval5float12F32Enclosure11checked_pow17h1d1c81b9c5551acaE
        (i32.add
         (local.get $8)
         (i32.const 72)
        )
        (local.get $8)
        (local.get $7)
       )
       (local.set $3
        (i32.const 2)
       )
       (local.set $4
        (i32.load8_u offset=76
         (local.get $8)
        )
       )
       (br_if $label$2
        (i32.eq
         (local.tee $2
          (i32.load offset=72
           (local.get $8)
          )
         )
         (i32.const 2)
        )
       )
       (i32.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 48)
         )
         (i32.const 8)
        )
        (i32.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 72)
          )
          (i32.const 8)
         )
        )
       )
       (i32.store offset=53 align=1
        (local.get $8)
        (i32.load offset=77 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=52
        (local.get $8)
        (local.get $4)
       )
       (i32.store offset=48
        (local.get $8)
        (local.get $2)
       )
       (br $label$7)
      )
      (block $label$25
       (block $label$26
        (block $label$27
         (br_if $label$27
          (i32.lt_u
           (local.get $2)
           (i32.const 2)
          )
         )
         (i32.store offset=12
          (local.get $8)
          (i32.const 0)
         )
         (br $label$26)
        )
        (call $_ZN13hyperinterval5float12F32Enclosure3new17h1e9b63f368a23a9cE
         (i32.add
          (local.get $8)
          (i32.const 72)
         )
         (f32.reinterpret_i32
          (local.get $5)
         )
         (f32.reinterpret_i32
          (local.get $6)
         )
        )
        (local.set $4
         (i32.load8_u offset=76
          (local.get $8)
         )
        )
        (br_if $label$25
         (i32.eq
          (local.tee $2
           (i32.load offset=72
            (local.get $8)
           )
          )
          (i32.const 2)
         )
        )
        (i32.store align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 12)
          )
          (i32.const 8)
         )
         (i32.load align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 72)
           )
           (i32.const 8)
          )
         )
        )
        (i32.store offset=17 align=1
         (local.get $8)
         (i32.load offset=77 align=1
          (local.get $8)
         )
        )
        (i32.store8 offset=16
         (local.get $8)
         (local.get $4)
        )
        (i32.store offset=12
         (local.get $8)
         (local.get $2)
        )
       )
       (block $label$28
        (block $label$29
         (block $label$30
          (block $label$31
           (block $label$32
            (block $label$33
             (block $label$34
              (block $label$35
               (block $label$36
                (block $label$37
                 (br_table $label$32 $label$31 $label$30 $label$29 $label$37 $label$37 $label$37 $label$37 $label$37 $label$36 $label$35 $label$34 $label$33 $label$37 $label$37 $label$37 $label$37 $label$37 $label$37 $label$28 $label$37
                  (i32.add
                   (local.get $0)
                   (i32.const -1)
                  )
                 )
                )
                (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
                 (i32.const 1049016)
                 (i32.const 40)
                 (i32.const 1048852)
                )
                (unreachable)
               )
               (call $_ZN13hyperinterval5float12F32Enclosure9min_image17h9c3ebd9c1b37c334E
                (i32.add
                 (local.get $8)
                 (i32.const 48)
                )
                (local.get $8)
                (i32.add
                 (local.get $8)
                 (i32.const 12)
                )
               )
               (br $label$7)
              )
              (call $_ZN13hyperinterval5float12F32Enclosure9max_image17h6f99815d12f8c54bE
               (i32.add
                (local.get $8)
                (i32.const 48)
               )
               (local.get $8)
               (i32.add
                (local.get $8)
                (i32.const 12)
               )
              )
              (br $label$7)
             )
             (call $_ZN13hyperinterval5float12F32Enclosure4hull17he20883130723276fE
              (i32.add
               (local.get $8)
               (i32.const 48)
              )
              (local.get $8)
              (i32.add
               (local.get $8)
               (i32.const 12)
              )
             )
             (br $label$7)
            )
            (call $_ZN13hyperinterval5float12F32Enclosure12intersection17h5a393b9c6a820723E
             (i32.add
              (local.get $8)
              (i32.const 48)
             )
             (local.get $8)
             (i32.add
              (local.get $8)
              (i32.const 12)
             )
            )
            (br $label$7)
           )
           (call $_ZN13hyperinterval5float12F32Enclosure3add17hb6725453457d4c54E
            (i32.add
             (local.get $8)
             (i32.const 72)
            )
            (local.get $8)
            (i32.add
             (local.get $8)
             (i32.const 12)
            )
           )
           (local.set $4
            (i32.load8_u offset=76
             (local.get $8)
            )
           )
           (br_if $label$25
            (i32.eq
             (local.tee $2
              (i32.load offset=72
               (local.get $8)
              )
             )
             (i32.const 2)
            )
           )
           (i32.store align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 48)
             )
             (i32.const 8)
            )
            (i32.load align=1
             (i32.add
              (i32.add
               (local.get $8)
               (i32.const 72)
              )
              (i32.const 8)
             )
            )
           )
           (i32.store offset=53 align=1
            (local.get $8)
            (i32.load offset=77 align=1
             (local.get $8)
            )
           )
           (i32.store8 offset=52
            (local.get $8)
            (local.get $4)
           )
           (i32.store offset=48
            (local.get $8)
            (local.get $2)
           )
           (br $label$7)
          )
          (call $_ZN13hyperinterval5float12F32Enclosure3sub17h646ee18a26eacb4dE
           (i32.add
            (local.get $8)
            (i32.const 72)
           )
           (local.get $8)
           (i32.add
            (local.get $8)
            (i32.const 12)
           )
          )
          (local.set $4
           (i32.load8_u offset=76
            (local.get $8)
           )
          )
          (br_if $label$25
           (i32.eq
            (local.tee $2
             (i32.load offset=72
              (local.get $8)
             )
            )
            (i32.const 2)
           )
          )
          (i32.store align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 48)
            )
            (i32.const 8)
           )
           (i32.load align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 72)
             )
             (i32.const 8)
            )
           )
          )
          (i32.store offset=53 align=1
           (local.get $8)
           (i32.load offset=77 align=1
            (local.get $8)
           )
          )
          (i32.store8 offset=52
           (local.get $8)
           (local.get $4)
          )
          (i32.store offset=48
           (local.get $8)
           (local.get $2)
          )
          (br $label$7)
         )
         (call $_ZN13hyperinterval5float12F32Enclosure3mul17h2739bee9e5f3a208E
          (i32.add
           (local.get $8)
           (i32.const 72)
          )
          (local.get $8)
          (i32.add
           (local.get $8)
           (i32.const 12)
          )
         )
         (local.set $4
          (i32.load8_u offset=76
           (local.get $8)
          )
         )
         (br_if $label$25
          (i32.eq
           (local.tee $2
            (i32.load offset=72
             (local.get $8)
            )
           )
           (i32.const 2)
          )
         )
         (i32.store align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 48)
           )
           (i32.const 8)
          )
          (i32.load align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 72)
            )
            (i32.const 8)
           )
          )
         )
         (i32.store offset=53 align=1
          (local.get $8)
          (i32.load offset=77 align=1
           (local.get $8)
          )
         )
         (i32.store8 offset=52
          (local.get $8)
          (local.get $4)
         )
         (i32.store offset=48
          (local.get $8)
          (local.get $2)
         )
         (br $label$7)
        )
        (call $_ZN13hyperinterval5float12F32Enclosure3div17h7b412cf9615e1b37E
         (i32.add
          (local.get $8)
          (i32.const 72)
         )
         (local.get $8)
         (i32.add
          (local.get $8)
          (i32.const 12)
         )
        )
        (local.set $4
         (i32.load8_u offset=76
          (local.get $8)
         )
        )
        (br_if $label$25
         (i32.eq
          (local.tee $2
           (i32.load offset=72
            (local.get $8)
           )
          )
          (i32.const 2)
         )
        )
        (i32.store align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 48)
          )
          (i32.const 8)
         )
         (i32.load align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 72)
           )
           (i32.const 8)
          )
         )
        )
        (i32.store offset=53 align=1
         (local.get $8)
         (i32.load offset=77 align=1
          (local.get $8)
         )
        )
        (i32.store8 offset=52
         (local.get $8)
         (local.get $4)
        )
        (i32.store offset=48
         (local.get $8)
         (local.get $2)
        )
        (br $label$7)
       )
       (call $_ZN13hyperinterval5float12F32Enclosure3add17hb6725453457d4c54E
        (i32.add
         (local.get $8)
         (i32.const 72)
        )
        (local.get $8)
        (i32.add
         (local.get $8)
         (i32.const 12)
        )
       )
       (local.set $4
        (i32.load8_u offset=76
         (local.get $8)
        )
       )
       (br_if $label$25
        (i32.eq
         (local.tee $2
          (i32.load offset=72
           (local.get $8)
          )
         )
         (i32.const 2)
        )
       )
       (i32.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 60)
         )
         (i32.const 8)
        )
        (i32.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 72)
          )
          (i32.const 8)
         )
        )
       )
       (i32.store offset=65 align=1
        (local.get $8)
        (i32.load offset=77 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=64
        (local.get $8)
        (local.get $4)
       )
       (i32.store offset=60
        (local.get $8)
        (local.get $2)
       )
       (call $_ZN13hyperinterval5float12F32Enclosure6square17h39ac62af88cfbe3dE
        (i32.add
         (local.get $8)
         (i32.const 48)
        )
        (i32.add
         (local.get $8)
         (i32.const 60)
        )
       )
       (local.set $4
        (i32.load8_u offset=52
         (local.get $8)
        )
       )
       (br_if $label$25
        (i32.eq
         (local.tee $2
          (i32.load offset=48
           (local.get $8)
          )
         )
         (i32.const 2)
        )
       )
       (i32.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 36)
         )
         (i32.const 8)
        )
        (i32.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 48)
          )
          (i32.const 8)
         )
        )
       )
       (i32.store offset=41 align=1
        (local.get $8)
        (i32.load offset=53 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=40
        (local.get $8)
        (local.get $4)
       )
       (i32.store offset=36
        (local.get $8)
        (local.get $2)
       )
       (call $_ZN13hyperinterval5float12F32Enclosure3sub17h646ee18a26eacb4dE
        (i32.add
         (local.get $8)
         (i32.const 24)
        )
        (i32.add
         (local.get $8)
         (i32.const 36)
        )
        (local.get $8)
       )
       (local.set $4
        (i32.load8_u offset=28
         (local.get $8)
        )
       )
       (br_if $label$25
        (i32.eq
         (local.tee $2
          (i32.load offset=24
           (local.get $8)
          )
         )
         (i32.const 2)
        )
       )
       (i32.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 48)
         )
         (i32.const 8)
        )
        (i32.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 24)
          )
          (i32.const 8)
         )
        )
       )
       (i32.store offset=53 align=1
        (local.get $8)
        (i32.load offset=29 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=52
        (local.get $8)
        (local.get $4)
       )
       (i32.store offset=48
        (local.get $8)
        (local.get $2)
       )
       (br $label$7)
      )
      (local.set $3
       (i32.const 2)
      )
      (br $label$2)
     )
     (local.set $10
      (i64.const 0)
     )
    )
    (local.set $2
     (i32.and
      (local.tee $4
       (i32.load offset=52
        (local.get $8)
       )
      )
      (i32.const -256)
     )
    )
    (local.set $0
     (i32.load offset=56
      (local.get $8)
     )
    )
    (local.set $3
     (i32.load offset=48
      (local.get $8)
     )
    )
    (br $label$1)
   )
   (local.set $10
    (i64.const 0)
   )
   (local.set $2
    (i32.const 0)
   )
  )
  (block $label$38
   (block $label$39
    (block $label$40
     (br_if $label$40
      (local.get $1)
     )
     (block $label$41
      (block $label$42
       (br_if $label$42
        (i32.ne
         (local.get $3)
         (i32.const 2)
        )
       )
       (br_if $label$41
        (i32.lt_u
         (local.tee $2
          (i32.and
           (local.get $4)
           (i32.const 255)
          )
         )
         (i32.const 13)
        )
       )
       (br $label$38)
      )
      (local.set $10
       (i64.or
        (local.get $10)
        (i64.extend_i32_u
         (i32.ne
          (local.get $3)
          (i32.const 1)
         )
        )
       )
      )
      (br $label$39)
     )
     (br_if $label$38
      (i32.eqz
       (i32.and
        (i32.shr_u
         (i32.const 4323)
         (local.get $2)
        )
        (i32.const 1)
       )
      )
     )
     (local.set $10
      (i64.load
       (i32.add
        (i32.shl
         (i32.and
          (local.get $4)
          (i32.const 255)
         )
         (i32.const 3)
        )
        (i32.const 1049280)
       )
      )
     )
     (br $label$39)
    )
    (block $label$43
     (br_if $label$43
      (i32.eq
       (local.get $3)
       (i32.const 2)
      )
     )
     (block $label$44
      (br_if $label$44
       (i32.eqz
        (i32.and
         (local.get $3)
         (i32.const 1)
        )
       )
      )
      (local.set $10
       (i64.extend_i32_u
        (select
         (i32.or
          (local.get $2)
          (i32.and
           (local.get $4)
           (i32.const 255)
          )
         )
         (local.get $0)
         (i32.eq
          (local.get $1)
          (i32.const 1)
         )
        )
       )
      )
      (br $label$39)
     )
     (call $_ZN4core6option13expect_failed17hf57fb2c2bc253385E
      (i32.const 1048913)
      (i32.const 34)
      (i32.const 1048852)
     )
     (unreachable)
    )
    (i32.store8 offset=72
     (local.get $8)
     (local.get $4)
    )
    (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
     (i32.const 1048964)
     (i32.const 25)
     (i32.add
      (local.get $8)
      (i32.const 72)
     )
     (i32.const 1048948)
     (i32.const 1048852)
    )
    (unreachable)
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $8)
     (i32.const 96)
    )
   )
   (return
    (local.get $10)
   )
  )
  (i32.store offset=88
   (local.get $8)
   (i32.const 0)
  )
  (i32.store offset=76
   (local.get $8)
   (i32.const 1)
  )
  (i32.store offset=72
   (local.get $8)
   (i32.const 1048788)
  )
  (i64.store offset=80 align=4
   (local.get $8)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $8)
    (i32.const 72)
   )
   (i32.const 1048808)
  )
  (unreachable)
 )
 (func $properties64 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64) (param $5 i64) (result i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (global.set $__stack_pointer
   (local.tee $6
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
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
           (i32.ge_u
            (local.get $0)
            (i32.const 4)
           )
          )
          (br_if $label$7
           (i32.and
            (local.get $0)
            (i32.const 1)
           )
          )
          (call $_ZN13hyperinterval5float12F64Enclosure3new17h58a446a9620e5eebE
           (i32.add
            (local.get $6)
            (i32.const 72)
           )
           (f64.reinterpret_i64
            (local.get $1)
           )
           (f64.reinterpret_i64
            (local.get $2)
           )
          )
          (local.set $7
           (i32.load8_u offset=80
            (local.get $6)
           )
          )
          (br_if $label$5
           (i64.eq
            (local.tee $2
             (i64.load offset=72
              (local.get $6)
             )
            )
            (i64.const 2)
           )
          )
          (i64.store align=1
           (i32.add
            (i32.add
             (local.get $6)
             (i32.const 8)
            )
            (i32.const 16)
           )
           (i64.load align=1
            (i32.add
             (i32.add
              (local.get $6)
              (i32.const 72)
             )
             (i32.const 16)
            )
           )
          )
          (i64.store offset=17 align=1
           (local.get $6)
           (i64.load offset=81 align=1
            (local.get $6)
           )
          )
          (i32.store8 offset=16
           (local.get $6)
           (local.get $7)
          )
          (br $label$6)
         )
         (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
          (i32.const 1048824)
          (i32.const 28)
          (i32.const 1049056)
         )
         (unreachable)
        )
        (local.set $2
         (i64.const 0)
        )
       )
       (i64.store offset=8
        (local.get $6)
        (local.get $2)
       )
       (block $label$9
        (block $label$10
         (br_if $label$10
          (i32.gt_u
           (local.get $0)
           (i32.const 1)
          )
         )
         (call $_ZN13hyperinterval5float12F64Enclosure3new17h58a446a9620e5eebE
          (i32.add
           (local.get $6)
           (i32.const 72)
          )
          (f64.reinterpret_i64
           (local.get $3)
          )
          (f64.reinterpret_i64
           (local.get $4)
          )
         )
         (local.set $7
          (i32.load8_u offset=80
           (local.get $6)
          )
         )
         (br_if $label$5
          (i64.eq
           (local.tee $3
            (i64.load offset=72
             (local.get $6)
            )
           )
           (i64.const 2)
          )
         )
         (i64.store align=1
          (i32.add
           (i32.add
            (local.get $6)
            (i32.const 32)
           )
           (i32.const 16)
          )
          (i64.load align=1
           (i32.add
            (i32.add
             (local.get $6)
             (i32.const 72)
            )
            (i32.const 16)
           )
          )
         )
         (i64.store offset=41 align=1
          (local.get $6)
          (i64.load offset=81 align=1
           (local.get $6)
          )
         )
         (i32.store8 offset=40
          (local.get $6)
          (local.get $7)
         )
         (i64.store offset=32
          (local.get $6)
          (local.get $3)
         )
         (local.set $0
          (i32.const 2)
         )
         (local.set $1
          (i64.load offset=16
           (local.get $6)
          )
         )
         (local.set $4
          (i64.load offset=24
           (local.get $6)
          )
         )
         (br_if $label$9
          (i32.eqz
           (i32.and
            (i32.wrap_i64
             (i64.and
              (local.get $3)
              (local.get $2)
             )
            )
            (i32.const 1)
           )
          )
         )
         (local.set $3
          (i64.load offset=40
           (local.get $6)
          )
         )
         (local.set $8
          (i64.load offset=48
           (local.get $6)
          )
         )
         (i64.store offset=64
          (local.get $6)
          (local.get $4)
         )
         (i64.store offset=56
          (local.get $6)
          (local.get $1)
         )
         (i64.store offset=80
          (local.get $6)
          (local.get $8)
         )
         (i64.store offset=72
          (local.get $6)
          (local.get $3)
         )
         (local.set $0
          (call $_ZN65_$LT$hyperinterval..float..F64Width$u20$as$u20$core..cmp..Ord$GT$3cmp17h173e0713f09ebfe6E
           (i32.add
            (local.get $6)
            (i32.const 56)
           )
           (i32.add
            (local.get $6)
            (i32.const 72)
           )
          )
         )
         (br $label$9)
        )
        (i64.store offset=32
         (local.get $6)
         (i64.const 0)
        )
        (local.set $0
         (i32.const 2)
        )
        (local.set $1
         (i64.load offset=16
          (local.get $6)
         )
        )
        (local.set $4
         (i64.load offset=24
          (local.get $6)
         )
        )
       )
       (call $_ZN13hyperinterval5float12F64Enclosure14contains_point17hd1c3a935b45e7cfcE
        (local.get $6)
        (i32.add
         (local.get $6)
         (i32.const 8)
        )
        (f64.reinterpret_i64
         (local.get $5)
        )
       )
       (local.set $7
        (i32.load8_u offset=1
         (local.get $6)
        )
       )
       (br_if $label$4
        (i32.eqz
         (i32.load8_u
          (local.get $6)
         )
        )
       )
      )
      (br_if $label$3
       (i32.lt_u
        (local.tee $0
         (i32.and
          (local.get $7)
          (i32.const 255)
         )
        )
        (i32.const 13)
       )
      )
      (br $label$1)
     )
     (local.set $9
      (call $_ZN13hyperinterval5float12F64Enclosure9subset_of17h1f8f3cf2e62f3063E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 32)
       )
      )
     )
     (local.set $10
      (call $_ZN13hyperinterval5float12F64Enclosure18interior_subset_of17h21507821b578d55aE
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 32)
       )
      )
     )
     (local.set $11
      (call $_ZN13hyperinterval5float12F64Enclosure16strictly_left_of17hfdd946b3ac9bc541E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 32)
       )
      )
     )
     (local.set $12
      (call $_ZN13hyperinterval5float12F64Enclosure8disjoint17ha148eea0779fab98E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 32)
       )
      )
     )
     (local.set $13
      (call $_ZN13hyperinterval5float12F64Enclosure8overlaps17hc7ae44dc85d8c781E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
       (i32.add
        (local.get $6)
        (i32.const 32)
       )
      )
     )
     (local.set $14
      (call $_ZN13hyperinterval5float12F64Enclosure5signs17h65e31044434319a0E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
      )
     )
     (local.set $15
      (call $_ZN13hyperinterval5float12F64Enclosure5signs17h65e31044434319a0E
       (i32.add
        (local.get $6)
        (i32.const 8)
       )
      )
     )
     (local.set $2
      (i64.xor
       (i64.or
        (i64.or
         (i64.or
          (i64.or
           (i64.or
            (i64.or
             (i64.or
              (i64.or
               (i64.or
                (i64.or
                 (i64.or
                  (i64.or
                   (i64.or
                    (i64.shl
                     (i64.extend_i32_u
                      (i32.eq
                       (local.tee $0
                        (i32.and
                         (local.get $0)
                         (i32.const 255)
                        )
                       )
                       (i32.const 255)
                      )
                     )
                     (i64.const 8)
                    )
                    (select
                     (i64.shl
                      (i64.extend_i32_u
                       (i64.eq
                        (local.get $1)
                        (local.get $4)
                       )
                      )
                      (i64.const 1)
                     )
                     (i64.const 0)
                     (i32.and
                      (i32.wrap_i64
                       (local.get $2)
                      )
                      (i32.const 1)
                     )
                    )
                   )
                   (i64.shl
                    (i64.extend_i32_u
                     (i32.eqz
                      (local.get $0)
                     )
                    )
                    (i64.const 9)
                   )
                  )
                  (i64.shl
                   (i64.extend_i32_u
                    (i32.eq
                     (local.get $0)
                     (i32.const 1)
                    )
                   )
                   (i64.const 10)
                  )
                 )
                 (i64.extend_i32_u
                  (i32.and
                   (i32.shl
                    (local.get $7)
                    (i32.const 2)
                   )
                   (i32.const 4)
                  )
                 )
                )
                (select
                 (i64.const 8)
                 (i64.const 0)
                 (local.get $9)
                )
               )
               (select
                (i64.const 16)
                (i64.const 0)
                (local.get $10)
               )
              )
              (select
               (i64.const 32)
               (i64.const 0)
               (local.get $11)
              )
             )
             (select
              (i64.const 64)
              (i64.const 0)
              (local.get $12)
             )
            )
            (select
             (i64.const 128)
             (i64.const 0)
             (local.get $13)
            )
           )
           (i64.shl
            (i64.extend_i32_u
             (i32.and
              (local.get $14)
              (i32.const 249)
             )
            )
            (i64.const 11)
           )
          )
          (i64.shl
           (i64.extend_i32_u
            (i32.gt_u
             (i32.and
              (call $_ZN13hyperinterval5float12F64Enclosure5signs17h65e31044434319a0E
               (i32.add
                (local.get $6)
                (i32.const 8)
               )
              )
              (i32.const 255)
             )
             (i32.const 3)
            )
           )
           (i64.const 13)
          )
         )
         (i64.shl
          (i64.extend_i32_u
           (i32.shr_u
            (i32.and
             (local.get $15)
             (i32.const 250)
            )
            (i32.const 1)
           )
          )
          (i64.const 12)
         )
        )
        (local.get $2)
       )
       (i64.const 1)
      )
     )
     (br $label$2)
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (i32.shr_u
        (i32.const 4323)
        (local.get $0)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $2
     (i64.load
      (i32.add
       (i32.shl
        (i32.and
         (local.get $7)
         (i32.const 255)
        )
        (i32.const 3)
       )
       (i32.const 1049176)
      )
     )
    )
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $6)
     (i32.const 96)
    )
   )
   (return
    (local.get $2)
   )
  )
  (i32.store offset=88
   (local.get $6)
   (i32.const 0)
  )
  (i32.store offset=76
   (local.get $6)
   (i32.const 1)
  )
  (i32.store offset=72
   (local.get $6)
   (i32.const 1048788)
  )
  (i64.store offset=80 align=4
   (local.get $6)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $6)
    (i32.const 72)
   )
   (i32.const 1048808)
  )
  (unreachable)
 )
 (func $query64 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i64) (param $4 i64) (param $5 i64) (param $6 i64) (param $7 i32) (result i64)
  (local $8 i32)
  (local $9 i32)
  (global.set $__stack_pointer
   (local.tee $8
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 176)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.gt_u
         (local.get $1)
         (i32.const 2)
        )
       )
       (br_if $label$5
        (i32.ge_u
         (local.get $2)
         (i32.const 4)
        )
       )
       (br_if $label$4
        (i32.and
         (local.get $2)
         (i32.const 1)
        )
       )
       (call $_ZN13hyperinterval5float12F64Enclosure3new17h58a446a9620e5eebE
        (i32.add
         (local.get $8)
         (i32.const 144)
        )
        (f64.reinterpret_i64
         (local.get $3)
        )
        (f64.reinterpret_i64
         (local.get $4)
        )
       )
       (local.set $4
        (i64.const 2)
       )
       (local.set $9
        (i32.load8_u offset=152
         (local.get $8)
        )
       )
       (br_if $label$2
        (i64.eq
         (local.tee $3
          (i64.load offset=144
           (local.get $8)
          )
         )
         (i64.const 2)
        )
       )
       (i64.store align=1
        (i32.add
         (local.get $8)
         (i32.const 16)
        )
        (i64.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 144)
          )
          (i32.const 16)
         )
        )
       )
       (i64.store offset=9 align=1
        (local.get $8)
        (i64.load offset=153 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=8
        (local.get $8)
        (local.get $9)
       )
       (i64.store
        (local.get $8)
        (local.get $3)
       )
       (local.set $9
        (i32.wrap_i64
         (local.get $3)
        )
       )
       (br $label$3)
      )
      (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
       (i32.const 1048868)
       (i32.const 45)
       (i32.const 1049056)
      )
      (unreachable)
     )
     (i64.store
      (local.get $8)
      (i64.const 0)
     )
     (local.set $9
      (i32.const 0)
     )
    )
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
                (block $label$18
                 (block $label$19
                  (block $label$20
                   (block $label$21
                    (br_table $label$19 $label$8 $label$8 $label$8 $label$8 $label$18 $label$17 $label$16 $label$15 $label$20 $label$8 $label$8 $label$8 $label$8 $label$14 $label$13 $label$12 $label$11 $label$10 $label$9 $label$8 $label$21
                     (local.get $0)
                    )
                   )
                   (i32.store offset=160
                    (local.get $8)
                    (i32.const 0)
                   )
                   (i32.store offset=148
                    (local.get $8)
                    (i32.const 1)
                   )
                   (i32.store offset=144
                    (local.get $8)
                    (i32.const 1049008)
                   )
                   (i64.store offset=152 align=4
                    (local.get $8)
                    (i64.const 4)
                   )
                   (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
                    (i32.add
                     (local.get $8)
                     (i32.const 144)
                    )
                    (i32.const 1049056)
                   )
                   (unreachable)
                  )
                  (call $_ZN13hyperinterval5float12F64Enclosure3abs17haa9e4b248865700cE
                   (i32.add
                    (local.get $8)
                    (i32.const 96)
                   )
                   (local.get $8)
                  )
                  (br $label$7)
                 )
                 (i64.store
                  (i32.add
                   (i32.add
                    (local.get $8)
                    (i32.const 96)
                   )
                   (i32.const 16)
                  )
                  (i64.load
                   (i32.add
                    (local.get $8)
                    (i32.const 16)
                   )
                  )
                 )
                 (i64.store
                  (i32.add
                   (i32.add
                    (local.get $8)
                    (i32.const 96)
                   )
                   (i32.const 8)
                  )
                  (i64.load
                   (i32.add
                    (local.get $8)
                    (i32.const 8)
                   )
                  )
                 )
                 (i64.store offset=96
                  (local.get $8)
                  (i64.load
                   (local.get $8)
                  )
                 )
                 (br $label$7)
                )
                (call $_ZN13hyperinterval5float12F64Enclosure6square17ha5b01fb3cba9bd5cE
                 (i32.add
                  (local.get $8)
                  (i32.const 144)
                 )
                 (local.get $8)
                )
                (local.set $4
                 (i64.const 2)
                )
                (local.set $9
                 (i32.load8_u offset=152
                  (local.get $8)
                 )
                )
                (br_if $label$2
                 (i64.eq
                  (local.tee $3
                   (i64.load offset=144
                    (local.get $8)
                   )
                  )
                  (i64.const 2)
                 )
                )
                (i64.store align=1
                 (i32.add
                  (i32.add
                   (local.get $8)
                   (i32.const 96)
                  )
                  (i32.const 16)
                 )
                 (i64.load align=1
                  (i32.add
                   (i32.add
                    (local.get $8)
                    (i32.const 144)
                   )
                   (i32.const 16)
                  )
                 )
                )
                (i64.store offset=105 align=1
                 (local.get $8)
                 (i64.load offset=153 align=1
                  (local.get $8)
                 )
                )
                (i32.store8 offset=104
                 (local.get $8)
                 (local.get $9)
                )
                (i64.store offset=96
                 (local.get $8)
                 (local.get $3)
                )
                (br $label$7)
               )
               (call $_ZN13hyperinterval5float12F64Enclosure4sqrt17h47c58966d8228387E
                (i32.add
                 (local.get $8)
                 (i32.const 144)
                )
                (local.get $8)
               )
               (local.set $4
                (i64.const 2)
               )
               (local.set $9
                (i32.load8_u offset=152
                 (local.get $8)
                )
               )
               (br_if $label$2
                (i64.eq
                 (local.tee $3
                  (i64.load offset=144
                   (local.get $8)
                  )
                 )
                 (i64.const 2)
                )
               )
               (i64.store align=1
                (i32.add
                 (i32.add
                  (local.get $8)
                  (i32.const 96)
                 )
                 (i32.const 16)
                )
                (i64.load align=1
                 (i32.add
                  (i32.add
                   (local.get $8)
                   (i32.const 144)
                  )
                  (i32.const 16)
                 )
                )
               )
               (i64.store offset=105 align=1
                (local.get $8)
                (i64.load offset=153 align=1
                 (local.get $8)
                )
               )
               (i32.store8 offset=104
                (local.get $8)
                (local.get $9)
               )
               (i64.store offset=96
                (local.get $8)
                (local.get $3)
               )
               (local.set $5
                (select
                 (i64.const 2)
                 (i64.const 0)
                 (i32.and
                  (i32.load8_u offset=168
                   (local.get $8)
                  )
                  (i32.const 1)
                 )
                )
               )
               (br $label$6)
              )
              (call $_ZN13hyperinterval5float12F64Enclosure6affine17h8919e6fdf0383835E
               (i32.add
                (local.get $8)
                (i32.const 144)
               )
               (local.get $8)
               (f64.reinterpret_i64
                (local.get $5)
               )
               (f64.reinterpret_i64
                (local.get $6)
               )
              )
              (local.set $4
               (i64.const 2)
              )
              (local.set $9
               (i32.load8_u offset=152
                (local.get $8)
               )
              )
              (br_if $label$2
               (i64.eq
                (local.tee $3
                 (i64.load offset=144
                  (local.get $8)
                 )
                )
                (i64.const 2)
               )
              )
              (i64.store align=1
               (i32.add
                (i32.add
                 (local.get $8)
                 (i32.const 96)
                )
                (i32.const 16)
               )
               (i64.load align=1
                (i32.add
                 (i32.add
                  (local.get $8)
                  (i32.const 144)
                 )
                 (i32.const 16)
                )
               )
              )
              (i64.store offset=105 align=1
               (local.get $8)
               (i64.load offset=153 align=1
                (local.get $8)
               )
              )
              (i32.store8 offset=104
               (local.get $8)
               (local.get $9)
              )
              (i64.store offset=96
               (local.get $8)
               (local.get $3)
              )
              (br $label$7)
             )
             (local.set $5
              (i64.const 0)
             )
             (local.set $4
              (i64.const 0)
             )
             (block $label$22
              (br_if $label$22
               (i32.eqz
                (i32.and
                 (local.get $9)
                 (i32.const 1)
                )
               )
              )
              (local.set $6
               (select
                (i64.const 0)
                (i64.xor
                 (local.tee $4
                  (i64.load offset=8
                   (local.get $8)
                  )
                 )
                 (i64.const -9223372036854775808)
                )
                (i64.eqz
                 (local.get $4)
                )
               )
              )
              (local.set $3
               (select
                (i64.const 0)
                (i64.xor
                 (local.tee $4
                  (i64.load offset=16
                   (local.get $8)
                  )
                 )
                 (i64.const -9223372036854775808)
                )
                (i64.eqz
                 (local.get $4)
                )
               )
              )
              (local.set $4
               (i64.const 1)
              )
             )
             (i64.store offset=112
              (local.get $8)
              (local.get $6)
             )
             (i64.store offset=104
              (local.get $8)
              (local.get $3)
             )
             (i64.store offset=96
              (local.get $8)
              (local.get $4)
             )
             (br $label$6)
            )
            (call $_ZN13hyperinterval5float12F64Enclosure10reciprocal17h6a7ba1060183a296E
             (i32.add
              (local.get $8)
              (i32.const 144)
             )
             (local.get $8)
            )
            (local.set $4
             (i64.const 2)
            )
            (local.set $9
             (i32.load8_u offset=152
              (local.get $8)
             )
            )
            (br_if $label$2
             (i64.eq
              (local.tee $3
               (i64.load offset=144
                (local.get $8)
               )
              )
              (i64.const 2)
             )
            )
            (i64.store align=1
             (i32.add
              (i32.add
               (local.get $8)
               (i32.const 96)
              )
              (i32.const 16)
             )
             (i64.load align=1
              (i32.add
               (i32.add
                (local.get $8)
                (i32.const 144)
               )
               (i32.const 16)
              )
             )
            )
            (i64.store offset=105 align=1
             (local.get $8)
             (i64.load offset=153 align=1
              (local.get $8)
             )
            )
            (i32.store8 offset=104
             (local.get $8)
             (local.get $9)
            )
            (i64.store offset=96
             (local.get $8)
             (local.get $3)
            )
            (br $label$7)
           )
           (call $_ZN13hyperinterval5float12F64Enclosure18midpoint_enclosure17ha83e42b96f855e6fE
            (i32.add
             (local.get $8)
             (i32.const 144)
            )
            (local.get $8)
           )
           (local.set $4
            (i64.const 2)
           )
           (local.set $9
            (i32.load8_u offset=152
             (local.get $8)
            )
           )
           (br_if $label$2
            (i64.eq
             (local.tee $3
              (i64.load offset=144
               (local.get $8)
              )
             )
             (i64.const 2)
            )
           )
           (i64.store align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 96)
             )
             (i32.const 16)
            )
            (i64.load align=1
             (i32.add
              (i32.add
               (local.get $8)
               (i32.const 144)
              )
              (i32.const 16)
             )
            )
           )
           (i64.store offset=105 align=1
            (local.get $8)
            (i64.load offset=153 align=1
             (local.get $8)
            )
           )
           (i32.store8 offset=104
            (local.get $8)
            (local.get $9)
           )
           (i64.store offset=96
            (local.get $8)
            (local.get $3)
           )
           (br $label$7)
          )
          (call $_ZN13hyperinterval5float12F64Enclosure16radius_enclosure17h4a1f59f9e2b2e0a4E
           (i32.add
            (local.get $8)
            (i32.const 144)
           )
           (local.get $8)
          )
          (local.set $4
           (i64.const 2)
          )
          (local.set $9
           (i32.load8_u offset=152
            (local.get $8)
           )
          )
          (br_if $label$2
           (i64.eq
            (local.tee $3
             (i64.load offset=144
              (local.get $8)
             )
            )
            (i64.const 2)
           )
          )
          (i64.store align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 96)
            )
            (i32.const 16)
           )
           (i64.load align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 144)
             )
             (i32.const 16)
            )
           )
          )
          (i64.store offset=105 align=1
           (local.get $8)
           (i64.load offset=153 align=1
            (local.get $8)
           )
          )
          (i32.store8 offset=104
           (local.get $8)
           (local.get $9)
          )
          (i64.store offset=96
           (local.get $8)
           (local.get $3)
          )
          (br $label$7)
         )
         (block $label$23
          (br_if $label$23
           (i32.and
            (local.get $9)
            (i32.const 1)
           )
          )
          (local.set $5
           (i64.const 0)
          )
          (i64.store offset=96
           (local.get $8)
           (i64.const 0)
          )
          (br $label$6)
         )
         (local.set $4
          (i64.load offset=8
           (local.get $8)
          )
         )
         (i64.store offset=128
          (local.get $8)
          (i64.load offset=16
           (local.get $8)
          )
         )
         (i64.store offset=120
          (local.get $8)
          (local.get $4)
         )
         (call $_ZN13hyperinterval5float8F64Width9enclosure17h50023b562b2c3dccE
          (i32.add
           (local.get $8)
           (i32.const 144)
          )
          (i32.add
           (local.get $8)
           (i32.const 120)
          )
         )
         (local.set $4
          (i64.const 2)
         )
         (local.set $9
          (i32.load8_u offset=152
           (local.get $8)
          )
         )
         (br_if $label$2
          (i64.eq
           (local.tee $3
            (i64.load offset=144
             (local.get $8)
            )
           )
           (i64.const 2)
          )
         )
         (i64.store align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 96)
           )
           (i32.const 16)
          )
          (i64.load align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 144)
            )
            (i32.const 16)
           )
          )
         )
         (i64.store offset=105 align=1
          (local.get $8)
          (i64.load offset=153 align=1
           (local.get $8)
          )
         )
         (i32.store8 offset=104
          (local.get $8)
          (local.get $9)
         )
         (i64.store offset=96
          (local.get $8)
          (local.get $3)
         )
         (br $label$7)
        )
        (call $_ZN13hyperinterval5float12F64Enclosure8expanded17hed40722528ba7d37E
         (i32.add
          (local.get $8)
          (i32.const 144)
         )
         (local.get $8)
        )
        (local.set $4
         (i64.const 2)
        )
        (local.set $9
         (i32.load8_u offset=152
          (local.get $8)
         )
        )
        (br_if $label$2
         (i64.eq
          (local.tee $3
           (i64.load offset=144
            (local.get $8)
           )
          )
          (i64.const 2)
         )
        )
        (i64.store align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 96)
          )
          (i32.const 16)
         )
         (i64.load align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 144)
           )
           (i32.const 16)
          )
         )
        )
        (i64.store offset=105 align=1
         (local.get $8)
         (i64.load offset=153 align=1
          (local.get $8)
         )
        )
        (i32.store8 offset=104
         (local.get $8)
         (local.get $9)
        )
        (i64.store offset=96
         (local.get $8)
         (local.get $3)
        )
        (br $label$7)
       )
       (call $_ZN13hyperinterval5float12F64Enclosure11checked_pow17h4ecbe96091baf326E
        (i32.add
         (local.get $8)
         (i32.const 144)
        )
        (local.get $8)
        (local.get $7)
       )
       (local.set $4
        (i64.const 2)
       )
       (local.set $9
        (i32.load8_u offset=152
         (local.get $8)
        )
       )
       (br_if $label$2
        (i64.eq
         (local.tee $3
          (i64.load offset=144
           (local.get $8)
          )
         )
         (i64.const 2)
        )
       )
       (i64.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 96)
         )
         (i32.const 16)
        )
        (i64.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 144)
          )
          (i32.const 16)
         )
        )
       )
       (i64.store offset=105 align=1
        (local.get $8)
        (i64.load offset=153 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=104
        (local.get $8)
        (local.get $9)
       )
       (i64.store offset=96
        (local.get $8)
        (local.get $3)
       )
       (br $label$7)
      )
      (block $label$24
       (block $label$25
        (block $label$26
         (br_if $label$26
          (i32.lt_u
           (local.get $2)
           (i32.const 2)
          )
         )
         (i64.store offset=24
          (local.get $8)
          (i64.const 0)
         )
         (br $label$25)
        )
        (call $_ZN13hyperinterval5float12F64Enclosure3new17h58a446a9620e5eebE
         (i32.add
          (local.get $8)
          (i32.const 144)
         )
         (f64.reinterpret_i64
          (local.get $5)
         )
         (f64.reinterpret_i64
          (local.get $6)
         )
        )
        (local.set $9
         (i32.load8_u offset=152
          (local.get $8)
         )
        )
        (br_if $label$24
         (i64.eq
          (local.tee $4
           (i64.load offset=144
            (local.get $8)
           )
          )
          (i64.const 2)
         )
        )
        (i64.store align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 24)
          )
          (i32.const 16)
         )
         (i64.load align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 144)
           )
           (i32.const 16)
          )
         )
        )
        (i64.store offset=33 align=1
         (local.get $8)
         (i64.load offset=153 align=1
          (local.get $8)
         )
        )
        (i32.store8 offset=32
         (local.get $8)
         (local.get $9)
        )
        (i64.store offset=24
         (local.get $8)
         (local.get $4)
        )
       )
       (block $label$27
        (block $label$28
         (block $label$29
          (block $label$30
           (block $label$31
            (block $label$32
             (block $label$33
              (block $label$34
               (block $label$35
                (block $label$36
                 (br_table $label$31 $label$30 $label$29 $label$28 $label$36 $label$36 $label$36 $label$36 $label$36 $label$35 $label$34 $label$33 $label$32 $label$36 $label$36 $label$36 $label$36 $label$36 $label$36 $label$27 $label$36
                  (i32.add
                   (local.get $0)
                   (i32.const -1)
                  )
                 )
                )
                (call $_ZN4core9panicking5panic17hcb4f0bfb9f36a348E
                 (i32.const 1049016)
                 (i32.const 40)
                 (i32.const 1049056)
                )
                (unreachable)
               )
               (call $_ZN13hyperinterval5float12F64Enclosure9min_image17h78c30016f597e6c4E
                (i32.add
                 (local.get $8)
                 (i32.const 96)
                )
                (local.get $8)
                (i32.add
                 (local.get $8)
                 (i32.const 24)
                )
               )
               (br $label$7)
              )
              (call $_ZN13hyperinterval5float12F64Enclosure9max_image17haf21fdd51db87492E
               (i32.add
                (local.get $8)
                (i32.const 96)
               )
               (local.get $8)
               (i32.add
                (local.get $8)
                (i32.const 24)
               )
              )
              (br $label$7)
             )
             (call $_ZN13hyperinterval5float12F64Enclosure4hull17h4455536ea286b1d9E
              (i32.add
               (local.get $8)
               (i32.const 96)
              )
              (local.get $8)
              (i32.add
               (local.get $8)
               (i32.const 24)
              )
             )
             (br $label$7)
            )
            (call $_ZN13hyperinterval5float12F64Enclosure12intersection17h228eca2199fbe94aE
             (i32.add
              (local.get $8)
              (i32.const 96)
             )
             (local.get $8)
             (i32.add
              (local.get $8)
              (i32.const 24)
             )
            )
            (br $label$7)
           )
           (call $_ZN13hyperinterval5float12F64Enclosure3add17hafee6c6178700572E
            (i32.add
             (local.get $8)
             (i32.const 144)
            )
            (local.get $8)
            (i32.add
             (local.get $8)
             (i32.const 24)
            )
           )
           (local.set $9
            (i32.load8_u offset=152
             (local.get $8)
            )
           )
           (br_if $label$24
            (i64.eq
             (local.tee $4
              (i64.load offset=144
               (local.get $8)
              )
             )
             (i64.const 2)
            )
           )
           (i64.store align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 96)
             )
             (i32.const 16)
            )
            (i64.load align=1
             (i32.add
              (i32.add
               (local.get $8)
               (i32.const 144)
              )
              (i32.const 16)
             )
            )
           )
           (i64.store offset=105 align=1
            (local.get $8)
            (i64.load offset=153 align=1
             (local.get $8)
            )
           )
           (i32.store8 offset=104
            (local.get $8)
            (local.get $9)
           )
           (i64.store offset=96
            (local.get $8)
            (local.get $4)
           )
           (br $label$7)
          )
          (call $_ZN13hyperinterval5float12F64Enclosure3sub17hba3830939f738ecdE
           (i32.add
            (local.get $8)
            (i32.const 144)
           )
           (local.get $8)
           (i32.add
            (local.get $8)
            (i32.const 24)
           )
          )
          (local.set $9
           (i32.load8_u offset=152
            (local.get $8)
           )
          )
          (br_if $label$24
           (i64.eq
            (local.tee $4
             (i64.load offset=144
              (local.get $8)
             )
            )
            (i64.const 2)
           )
          )
          (i64.store align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 96)
            )
            (i32.const 16)
           )
           (i64.load align=1
            (i32.add
             (i32.add
              (local.get $8)
              (i32.const 144)
             )
             (i32.const 16)
            )
           )
          )
          (i64.store offset=105 align=1
           (local.get $8)
           (i64.load offset=153 align=1
            (local.get $8)
           )
          )
          (i32.store8 offset=104
           (local.get $8)
           (local.get $9)
          )
          (i64.store offset=96
           (local.get $8)
           (local.get $4)
          )
          (br $label$7)
         )
         (call $_ZN13hyperinterval5float12F64Enclosure3mul17h97ef6699d52c426bE
          (i32.add
           (local.get $8)
           (i32.const 144)
          )
          (local.get $8)
          (i32.add
           (local.get $8)
           (i32.const 24)
          )
         )
         (local.set $9
          (i32.load8_u offset=152
           (local.get $8)
          )
         )
         (br_if $label$24
          (i64.eq
           (local.tee $4
            (i64.load offset=144
             (local.get $8)
            )
           )
           (i64.const 2)
          )
         )
         (i64.store align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 96)
           )
           (i32.const 16)
          )
          (i64.load align=1
           (i32.add
            (i32.add
             (local.get $8)
             (i32.const 144)
            )
            (i32.const 16)
           )
          )
         )
         (i64.store offset=105 align=1
          (local.get $8)
          (i64.load offset=153 align=1
           (local.get $8)
          )
         )
         (i32.store8 offset=104
          (local.get $8)
          (local.get $9)
         )
         (i64.store offset=96
          (local.get $8)
          (local.get $4)
         )
         (br $label$7)
        )
        (call $_ZN13hyperinterval5float12F64Enclosure3div17heb3b64f34a7eebcaE
         (i32.add
          (local.get $8)
          (i32.const 144)
         )
         (local.get $8)
         (i32.add
          (local.get $8)
          (i32.const 24)
         )
        )
        (local.set $9
         (i32.load8_u offset=152
          (local.get $8)
         )
        )
        (br_if $label$24
         (i64.eq
          (local.tee $4
           (i64.load offset=144
            (local.get $8)
           )
          )
          (i64.const 2)
         )
        )
        (i64.store align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 96)
          )
          (i32.const 16)
         )
         (i64.load align=1
          (i32.add
           (i32.add
            (local.get $8)
            (i32.const 144)
           )
           (i32.const 16)
          )
         )
        )
        (i64.store offset=105 align=1
         (local.get $8)
         (i64.load offset=153 align=1
          (local.get $8)
         )
        )
        (i32.store8 offset=104
         (local.get $8)
         (local.get $9)
        )
        (i64.store offset=96
         (local.get $8)
         (local.get $4)
        )
        (br $label$7)
       )
       (call $_ZN13hyperinterval5float12F64Enclosure3add17hafee6c6178700572E
        (i32.add
         (local.get $8)
         (i32.const 144)
        )
        (local.get $8)
        (i32.add
         (local.get $8)
         (i32.const 24)
        )
       )
       (local.set $9
        (i32.load8_u offset=152
         (local.get $8)
        )
       )
       (br_if $label$24
        (i64.eq
         (local.tee $4
          (i64.load offset=144
           (local.get $8)
          )
         )
         (i64.const 2)
        )
       )
       (i64.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 120)
         )
         (i32.const 16)
        )
        (i64.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 144)
          )
          (i32.const 16)
         )
        )
       )
       (i64.store offset=129 align=1
        (local.get $8)
        (i64.load offset=153 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=128
        (local.get $8)
        (local.get $9)
       )
       (i64.store offset=120
        (local.get $8)
        (local.get $4)
       )
       (call $_ZN13hyperinterval5float12F64Enclosure6square17ha5b01fb3cba9bd5cE
        (i32.add
         (local.get $8)
         (i32.const 96)
        )
        (i32.add
         (local.get $8)
         (i32.const 120)
        )
       )
       (local.set $9
        (i32.load8_u offset=104
         (local.get $8)
        )
       )
       (br_if $label$24
        (i64.eq
         (local.tee $4
          (i64.load offset=96
           (local.get $8)
          )
         )
         (i64.const 2)
        )
       )
       (i64.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 72)
         )
         (i32.const 16)
        )
        (i64.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 96)
          )
          (i32.const 16)
         )
        )
       )
       (i64.store offset=81 align=1
        (local.get $8)
        (i64.load offset=105 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=80
        (local.get $8)
        (local.get $9)
       )
       (i64.store offset=72
        (local.get $8)
        (local.get $4)
       )
       (call $_ZN13hyperinterval5float12F64Enclosure3sub17hba3830939f738ecdE
        (i32.add
         (local.get $8)
         (i32.const 48)
        )
        (i32.add
         (local.get $8)
         (i32.const 72)
        )
        (local.get $8)
       )
       (local.set $9
        (i32.load8_u offset=56
         (local.get $8)
        )
       )
       (br_if $label$24
        (i64.eq
         (local.tee $4
          (i64.load offset=48
           (local.get $8)
          )
         )
         (i64.const 2)
        )
       )
       (i64.store align=1
        (i32.add
         (i32.add
          (local.get $8)
          (i32.const 96)
         )
         (i32.const 16)
        )
        (i64.load align=1
         (i32.add
          (i32.add
           (local.get $8)
           (i32.const 48)
          )
          (i32.const 16)
         )
        )
       )
       (i64.store offset=105 align=1
        (local.get $8)
        (i64.load offset=57 align=1
         (local.get $8)
        )
       )
       (i32.store8 offset=104
        (local.get $8)
        (local.get $9)
       )
       (i64.store offset=96
        (local.get $8)
        (local.get $4)
       )
       (br $label$7)
      )
      (local.set $4
       (i64.const 2)
      )
      (br $label$2)
     )
     (local.set $5
      (i64.const 0)
     )
    )
    (local.set $3
     (i64.and
      (local.tee $4
       (i64.load offset=104
        (local.get $8)
       )
      )
      (i64.const -256)
     )
    )
    (local.set $9
     (i32.wrap_i64
      (local.get $4)
     )
    )
    (local.set $6
     (i64.load offset=112
      (local.get $8)
     )
    )
    (local.set $4
     (i64.load offset=96
      (local.get $8)
     )
    )
    (br $label$1)
   )
   (local.set $3
    (i64.const 0)
   )
   (local.set $5
    (i64.const 0)
   )
  )
  (block $label$37
   (block $label$38
    (block $label$39
     (br_if $label$39
      (local.get $1)
     )
     (block $label$40
      (block $label$41
       (br_if $label$41
        (i64.ne
         (local.get $4)
         (i64.const 2)
        )
       )
       (br_if $label$40
        (i32.lt_u
         (local.tee $2
          (i32.and
           (local.get $9)
           (i32.const 255)
          )
         )
         (i32.const 13)
        )
       )
       (br $label$37)
      )
      (local.set $4
       (i64.or
        (local.get $5)
        (i64.extend_i32_u
         (i32.ne
          (i32.wrap_i64
           (local.get $4)
          )
          (i32.const 1)
         )
        )
       )
      )
      (br $label$38)
     )
     (br_if $label$37
      (i32.eqz
       (i32.and
        (i32.shr_u
         (i32.const 4323)
         (local.get $2)
        )
        (i32.const 1)
       )
      )
     )
     (local.set $4
      (i64.load
       (i32.add
        (i32.shl
         (i32.and
          (local.get $9)
          (i32.const 255)
         )
         (i32.const 3)
        )
        (i32.const 1049280)
       )
      )
     )
     (br $label$38)
    )
    (block $label$42
     (br_if $label$42
      (i64.eq
       (local.get $4)
       (i64.const 2)
      )
     )
     (block $label$43
      (br_if $label$43
       (i32.eqz
        (i32.and
         (i32.wrap_i64
          (local.get $4)
         )
         (i32.const 1)
        )
       )
      )
      (local.set $4
       (select
        (i64.or
         (local.get $3)
         (i64.and
          (i64.extend_i32_u
           (local.get $9)
          )
          (i64.const 255)
         )
        )
        (local.get $6)
        (i32.eq
         (local.get $1)
         (i32.const 1)
        )
       )
      )
      (br $label$38)
     )
     (call $_ZN4core6option13expect_failed17hf57fb2c2bc253385E
      (i32.const 1048913)
      (i32.const 34)
      (i32.const 1049056)
     )
     (unreachable)
    )
    (i32.store8 offset=144
     (local.get $8)
     (local.get $9)
    )
    (call $_ZN4core6result13unwrap_failed17h4e312bd8e5eb4431E
     (i32.const 1048964)
     (i32.const 25)
     (i32.add
      (local.get $8)
      (i32.const 144)
     )
     (i32.const 1048948)
     (i32.const 1049056)
    )
    (unreachable)
   )
   (global.set $__stack_pointer
    (i32.add
     (local.get $8)
     (i32.const 176)
    )
   )
   (return
    (local.get $4)
   )
  )
  (i32.store offset=160
   (local.get $8)
   (i32.const 0)
  )
  (i32.store offset=148
   (local.get $8)
   (i32.const 1)
  )
  (i32.store offset=144
   (local.get $8)
   (i32.const 1048788)
  )
  (i64.store offset=152 align=4
   (local.get $8)
   (i64.const 4)
  )
  (call $_ZN4core9panicking9panic_fmt17h41cfed79b2ddbf13E
   (i32.add
    (local.get $8)
    (i32.const 144)
   )
   (i32.const 1048808)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval5float8F32Width9enclosure17h545f9216acbd0bd6E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
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
  (call $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E
   (i32.add
    (local.get $2)
    (i32.const 8)
   )
   (i64.const 2147483648)
   (i64.const 2139095040)
   (i64.load32_u offset=4
    (local.get $1)
   )
   (i64.extend_i32_u
    (select
     (i32.xor
      (local.tee $1
       (i32.load
        (local.get $1)
       )
      )
      (i32.const -2147483648)
     )
     (i32.const 0)
     (local.get $1)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (local.set $3
    (i64.load32_u offset=24
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.load32_u offset=16
     (local.get $2)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (local.set $4
    (i64.load offset=16
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $3)
   )
   (block $label$4
    (br_if $label$4
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (block $label$5
    (br_if $label$5
     (i64.le_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $3
         (i64.and
          (local.get $4)
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $3)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $1
         (i32.wrap_i64
          (local.get $4)
         )
        )
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $4
         (i64.and
          (local.tee $3
           (i64.load offset=16
            (local.get $2)
           )
          )
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $4)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $5
         (i32.wrap_i64
          (local.get $3)
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
    (local.get $5)
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
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN65_$LT$hyperinterval..float..F32Width$u20$as$u20$core..cmp..Ord$GT$3cmp17hf5c5d86b9fe2b0f3E (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN13hyperinterval4ieee6Format13compare_width17h1b810d66deee7e0aE
   (i64.const 2147483648)
   (i64.const 2139095040)
   (i64.load32_u
    (local.get $0)
   )
   (i64.load32_u offset=4
    (local.get $0)
   )
   (i64.load32_u
    (local.get $1)
   )
   (i64.load32_u offset=4
    (local.get $1)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure3new17h1e9b63f368a23a9cE (param $0 i32) (param $1 f32) (param $2 f32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (local.get $3)
   (i64.const 2147483648)
   (i64.const 2139095040)
   (i64.extend_i32_u
    (i32.reinterpret_f32
     (local.get $1)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load offset=8
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (local.get $3)
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.extend_i32_u
     (i32.reinterpret_f32
      (local.get $2)
     )
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (block $label$4
    (br_if $label$4
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
        (local.tee $4
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
           (i64.load offset=8
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
        (local.tee $7
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
    (local.get $7)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $4)
   )
   (i32.store
    (local.get $0)
    (i32.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure9from_bits17haaa355d79195c0ffE (param $0 i32) (param $1 i64) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (local.get $3)
   (i64.const 2147483648)
   (i64.const 2139095040)
   (i64.and
    (local.get $1)
    (i64.const 4294967295)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (local.set $1
    (i64.load offset=8
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (local.get $3)
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.and
     (local.get $2)
     (i64.const 4294967295)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (block $label$4
    (br_if $label$4
     (i64.le_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $2
         (i64.and
          (local.get $1)
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $2)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $4
         (i32.wrap_i64
          (local.get $1)
         )
        )
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $2
         (i64.and
          (local.tee $1
           (i64.load offset=8
            (local.get $3)
           )
          )
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $2)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $5
         (i32.wrap_i64
          (local.get $1)
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
    (local.get $5)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $4)
   )
   (i32.store
    (local.get $0)
    (i32.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure18midpoint_enclosure17hea96b2ad54ffd4baE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $1)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i32.load offset=4
      (local.get $1)
     )
    )
    (local.set $1
     (i32.load offset=8
      (local.get $1)
     )
    )
    (i64.store offset=72
     (local.get $2)
     (i64.const 0)
    )
    (i32.store8 offset=84
     (local.get $2)
     (i32.shr_u
      (local.get $1)
      (i32.const 31)
     )
    )
    (i64.store offset=40
     (local.get $2)
     (i64.const 0)
    )
    (i32.store8 offset=52
     (local.get $2)
     (i32.shr_u
      (local.get $3)
      (i32.const 31)
     )
    )
    (i64.store offset=32
     (local.get $2)
     (select
      (local.tee $5
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.get $3)
         )
        )
        (i64.const 8388607)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 8388608)
      )
      (local.tee $3
       (i64.eqz
        (local.tee $4
         (i64.and
          (i64.shr_u
           (local.get $4)
           (i64.const 23)
          )
          (i64.const 255)
         )
        )
       )
      )
     )
    )
    (i64.store offset=64
     (local.get $2)
     (select
      (local.tee $6
       (i64.and
        (local.tee $5
         (i64.extend_i32_u
          (local.get $1)
         )
        )
        (i64.const 8388607)
       )
      )
      (i64.or
       (local.get $6)
       (i64.const 8388608)
      )
      (local.tee $1
       (i64.eqz
        (local.tee $5
         (i64.and
          (i64.shr_u
           (local.get $5)
           (i64.const 23)
          )
          (i64.const 255)
         )
        )
       )
      )
     )
    )
    (i32.store offset=48
     (local.get $2)
     (select
      (i32.const -150)
      (i32.add
       (i32.wrap_i64
        (local.get $4)
       )
       (i32.const -151)
      )
      (local.get $3)
     )
    )
    (i32.store offset=80
     (local.get $2)
     (select
      (i32.const -150)
      (i32.add
       (i32.wrap_i64
        (local.get $5)
       )
       (i32.const -151)
      )
      (local.get $1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format8add_wide17hfb433c6dfcd20526E.llvm.3547746728100167404
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (i32.add
      (local.get $2)
      (i32.const 32)
     )
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.load8_u offset=8
        (local.get $2)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=9
       (local.get $2)
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
    (local.set $4
     (i64.load32_u offset=24
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (i64.load32_u offset=16
      (local.get $2)
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
     (i64.load offset=72
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (local.get $4)
    )
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
    (block $label$6
     (br_if $label$6
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $4
          (i64.and
           (local.get $5)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $4)
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
         (local.tee $5
          (i64.and
           (local.tee $4
            (i64.load offset=72
             (local.get $2)
            )
           )
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $5)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $3
          (i32.wrap_i64
           (local.get $4)
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
     (local.get $3)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $1)
    )
    (i32.store
     (local.get $0)
     (i32.const 1)
    )
    (br $label$1)
   )
   (i32.store
    (local.get $0)
    (i32.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 96)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure16radius_enclosure17hd10628678d0d99a1E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $1)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i32.load offset=4
      (local.get $1)
     )
    )
    (local.set $1
     (i32.load offset=8
      (local.get $1)
     )
    )
    (i64.store offset=72
     (local.get $2)
     (i64.const 0)
    )
    (i64.store offset=40
     (local.get $2)
     (i64.const 0)
    )
    (i32.store8 offset=52
     (local.get $2)
     (i32.shr_u
      (local.get $1)
      (i32.const 31)
     )
    )
    (i32.store8 offset=84
     (local.get $2)
     (i32.shr_u
      (local.tee $3
       (select
        (i32.xor
         (local.get $3)
         (i32.const -2147483648)
        )
        (i32.const 0)
        (local.get $3)
       )
      )
      (i32.const 31)
     )
    )
    (i64.store offset=32
     (local.get $2)
     (select
      (local.tee $5
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.get $1)
         )
        )
        (i64.const 8388607)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 8388608)
      )
      (local.tee $1
       (i64.eqz
        (local.tee $4
         (i64.and
          (i64.shr_u
           (local.get $4)
           (i64.const 23)
          )
          (i64.const 255)
         )
        )
       )
      )
     )
    )
    (i32.store offset=48
     (local.get $2)
     (select
      (i32.const -150)
      (i32.add
       (i32.wrap_i64
        (local.get $4)
       )
       (i32.const -151)
      )
      (local.get $1)
     )
    )
    (i64.store offset=64
     (local.get $2)
     (select
      (local.tee $5
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.get $3)
         )
        )
        (i64.const 8388607)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 8388608)
      )
      (local.tee $1
       (i64.eqz
        (local.tee $4
         (i64.and
          (i64.shr_u
           (local.get $4)
           (i64.const 23)
          )
          (i64.const 255)
         )
        )
       )
      )
     )
    )
    (i32.store offset=80
     (local.get $2)
     (select
      (i32.const -150)
      (i32.add
       (i32.wrap_i64
        (local.get $4)
       )
       (i32.const -151)
      )
      (local.get $1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format8add_wide17hfb433c6dfcd20526E.llvm.3547746728100167404
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (i32.add
      (local.get $2)
      (i32.const 32)
     )
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.load8_u offset=8
        (local.get $2)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=9
       (local.get $2)
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
    (local.set $4
     (i64.load32_u offset=24
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (i64.load32_u offset=16
      (local.get $2)
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
     (i64.load offset=72
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (local.get $4)
    )
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
    (block $label$6
     (br_if $label$6
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $4
          (i64.and
           (local.get $5)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $4)
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
         (local.tee $5
          (i64.and
           (local.tee $4
            (i64.load offset=72
             (local.get $2)
            )
           )
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $5)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $3
          (i32.wrap_i64
           (local.get $4)
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
     (local.get $3)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $1)
    )
    (i32.store
     (local.get $0)
     (i32.const 1)
    )
    (br $label$1)
   )
   (i32.store
    (local.get $0)
    (i32.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 96)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure14contains_point17ha5bf72dea7c1d4b3E (param $0 i32) (param $1 i32) (param $2 f32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (local.get $3)
   (i64.const 2147483648)
   (i64.const 2139095040)
   (i64.extend_i32_u
    (i32.reinterpret_f32
     (local.get $2)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (local.tee $4
       (i32.load8_u
        (local.get $3)
       )
      )
      (i32.const 1)
     )
    )
    (local.set $5
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (br $label$1)
   )
   (local.set $5
    (i32.const 0)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $5
    (i32.const 0)
   )
   (br_if $label$1
    (i64.gt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $7
         (i64.extend_i32_u
          (local.tee $6
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $7)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $6)
       (i32.const 0)
      )
     )
     (local.tee $7
      (select
       (i64.or
        (local.tee $8
         (i64.and
          (local.tee $7
           (i64.load offset=8
            (local.get $3)
           )
          )
          (i64.const 2147483647)
         )
        )
        (i64.const 2147483648)
       )
       (i64.sub
        (i64.const 2147483648)
        (local.get $8)
       )
       (i64.eqz
        (i64.and
         (local.get $7)
         (i64.const 2147483648)
        )
       )
      )
     )
    )
   )
   (local.set $5
    (i64.le_u
     (local.get $7)
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $8
         (i64.extend_i32_u
          (local.tee $5
           (i32.load offset=8
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $8)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $5)
       (i32.const 0)
      )
     )
    )
   )
  )
  (i32.store8 offset=1
   (local.get $0)
   (local.get $5)
  )
  (i32.store8
   (local.get $0)
   (local.get $4)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure9subset_of17h1d03ebd189bf0f9bE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local.set $2
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i64.gt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $3
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $3
           (i32.load offset=4
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
    )
   )
   (local.set $2
    (i64.le_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $2
           (i32.load offset=8
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $2
           (i32.load offset=8
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F32Enclosure18interior_subset_of17h7a2c38c7d516eedaE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local.set $2
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i64.ge_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $3
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $3
           (i32.load offset=4
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
    )
   )
   (local.set $2
    (i64.lt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $2
           (i32.load offset=8
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $2
           (i32.load offset=8
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F32Enclosure16strictly_left_of17hb691d63bce3bf31aE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i64.lt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $3
         (i64.extend_i32_u
          (local.tee $0
           (i32.load offset=8
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $0)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $3
         (i64.extend_i32_u
          (local.tee $0
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $0)
       (i32.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F32Enclosure8disjoint17h33a2cd651fccd0a9E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local.set $2
   (i32.const 1)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.load
       (local.get $0)
      )
     )
    )
    (br_if $label$2
     (i32.eqz
      (local.tee $3
       (i32.load
        (local.get $1)
       )
      )
     )
    )
    (local.set $2
     (i32.const 1)
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (local.get $3)
       (i32.const 1)
      )
     )
    )
    (br_if $label$2
     (i64.lt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $4
          (i64.extend_i32_u
           (local.tee $3
            (i32.load offset=8
             (local.get $0)
            )
           )
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $4
          (i64.extend_i32_u
           (local.tee $3
            (i32.load offset=4
             (local.get $1)
            )
           )
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
    )
    (local.set $2
     (i64.lt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $4
          (i64.extend_i32_u
           (local.tee $2
            (i32.load offset=8
             (local.get $1)
            )
           )
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $2)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $4
          (i64.extend_i32_u
           (local.tee $0
            (i32.load offset=4
             (local.get $0)
            )
           )
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $0)
        (i32.const 0)
       )
      )
     )
    )
   )
   (return
    (local.get $2)
   )
  )
  (i32.const 0)
 )
 (func $_ZN13hyperinterval5float12F32Enclosure8overlaps17hc99ae6321de96eaeE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.load
      (local.get $0)
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (local.tee $3
      (i32.load
       (local.get $1)
      )
     )
    )
   )
   (local.set $2
    (i32.const 1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (local.get $3)
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i64.lt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $3
           (i32.load offset=8
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $3
           (i32.load offset=4
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
    )
   )
   (local.set $2
    (i64.ge_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $2
           (i32.load offset=8
            (local.get $1)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $4
         (i64.extend_i32_u
          (local.tee $2
           (i32.load offset=4
            (local.get $0)
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F32Enclosure4hull17he20883130723276fE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local.set $3
   (i32.load offset=8
    (local.get $2)
   )
  )
  (local.set $4
   (i32.load offset=4
    (local.get $2)
   )
  )
  (local.set $2
   (i32.load
    (local.get $2)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (local.tee $5
       (i32.load
        (local.get $1)
       )
      )
      (i32.const 1)
     )
    )
   )
   (local.set $6
    (i32.load offset=8
     (local.get $1)
    )
   )
   (local.set $1
    (i32.load offset=4
     (local.get $1)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (local.get $2)
      (i32.const 1)
     )
    )
    (local.set $3
     (local.get $6)
    )
    (local.set $4
     (local.get $1)
    )
    (local.set $2
     (local.get $5)
    )
    (br $label$1)
   )
   (local.set $3
    (select
     (local.get $3)
     (local.get $6)
     (i64.lt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $7
          (i64.extend_i32_u
           (local.get $6)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $7)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $6)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $7
          (i64.extend_i32_u
           (local.get $3)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $7)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
    )
   )
   (local.set $4
    (select
     (local.get $4)
     (local.get $1)
     (i64.gt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $7
          (i64.extend_i32_u
           (local.get $1)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $7)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $7
          (i64.extend_i32_u
           (local.get $4)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $7)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $4)
        (i32.const 0)
       )
      )
     )
    )
   )
   (local.set $2
    (i32.const 1)
   )
  )
  (i32.store offset=8
   (local.get $0)
   (local.get $3)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $4)
  )
  (i32.store
   (local.get $0)
   (local.get $2)
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure12intersection17h5a393b9c6a820723E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local.set $3
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $3
    (i64.le_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $6
         (i64.extend_i32_u
          (local.tee $5
           (select
            (local.tee $4
             (i32.load offset=4
              (local.get $2)
             )
            )
            (local.tee $5
             (i32.load offset=4
              (local.get $1)
             )
            )
            (i64.lt_u
             (select
              (i64.sub
               (i64.const 2147483648)
               (i64.and
                (local.tee $6
                 (i64.extend_i32_u
                  (local.get $5)
                 )
                )
                (i64.const 2147483647)
               )
              )
              (i64.or
               (local.get $6)
               (i64.const 2147483648)
              )
              (i32.lt_s
               (local.get $5)
               (i32.const 0)
              )
             )
             (select
              (i64.sub
               (i64.const 2147483648)
               (i64.and
                (local.tee $6
                 (i64.extend_i32_u
                  (local.get $4)
                 )
                )
                (i64.const 2147483647)
               )
              )
              (i64.or
               (local.get $6)
               (i64.const 2147483648)
              )
              (i32.lt_s
               (local.get $4)
               (i32.const 0)
              )
             )
            )
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $6)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $5)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $6
         (i64.extend_i32_u
          (local.tee $4
           (select
            (local.tee $4
             (i32.load offset=8
              (local.get $2)
             )
            )
            (local.tee $1
             (i32.load offset=8
              (local.get $1)
             )
            )
            (i64.gt_u
             (select
              (i64.sub
               (i64.const 2147483648)
               (i64.and
                (local.tee $6
                 (i64.extend_i32_u
                  (local.get $1)
                 )
                )
                (i64.const 2147483647)
               )
              )
              (i64.or
               (local.get $6)
               (i64.const 2147483648)
              )
              (i32.lt_s
               (local.get $1)
               (i32.const 0)
              )
             )
             (select
              (i64.sub
               (i64.const 2147483648)
               (i64.and
                (local.tee $6
                 (i64.extend_i32_u
                  (local.get $4)
                 )
                )
                (i64.const 2147483647)
               )
              )
              (i64.or
               (local.get $6)
               (i64.const 2147483648)
              )
              (i32.lt_s
               (local.get $4)
               (i32.const 0)
              )
             )
            )
           )
          )
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $6)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $4)
       (i32.const 0)
      )
     )
    )
   )
  )
  (i32.store offset=8
   (local.get $0)
   (local.get $4)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $5)
  )
  (i32.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure5signs17h047269d06770f184E (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local.set $1
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $1
    (i64.lt_u
     (local.tee $2
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $2
          (i64.extend_i32_u
           (local.tee $1
            (i32.load offset=4
             (local.get $0)
            )
           )
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $2)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
     )
     (i64.const 2147483648)
    )
   )
   (local.set $4
    (i64.or
     (local.tee $3
      (i64.extend_i32_u
       (local.tee $0
        (i32.load offset=8
         (local.get $0)
        )
       )
      )
     )
     (i64.const 2147483648)
    )
   )
   (local.set $3
    (i64.sub
     (i64.const 2147483648)
     (local.tee $5
      (i64.and
       (local.get $3)
       (i64.const 2147483647)
      )
     )
    )
   )
   (block $label$2
    (br_if $label$2
     (i64.gt_u
      (local.get $2)
      (i64.const 2147483648)
     )
    )
    (local.set $1
     (select
      (select
       (local.get $1)
       (local.tee $6
        (i32.or
         (local.get $1)
         (i32.const 2)
        )
       )
       (i64.ne
        (local.get $5)
        (i64.const 0)
       )
      )
      (local.get $6)
      (i32.lt_s
       (local.get $0)
       (i32.const 0)
      )
     )
    )
   )
   (local.set $1
    (select
     (i32.or
      (local.get $1)
      (i32.const 4)
     )
     (local.get $1)
     (i64.gt_u
      (select
       (local.get $3)
       (local.get $4)
       (i32.lt_s
        (local.get $0)
        (i32.const 0)
       )
      )
      (i64.const 2147483648)
     )
    )
   )
  )
  (local.get $1)
 )
 (func $_ZN13hyperinterval5float12F32Enclosure3abs17h7054600bb8d8e83bE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (i32.gt_s
       (local.tee $2
        (i32.load offset=4
         (local.get $1)
        )
       )
       (i32.const -1)
      )
     )
     (br_if $label$2
      (i64.eq
       (i64.and
        (local.tee $3
         (i64.extend_i32_u
          (local.get $2)
         )
        )
        (i64.const 2147483647)
       )
       (i64.const 0)
      )
     )
     (local.set $5
      (i64.and
       (local.tee $4
        (i64.extend_i32_u
         (local.tee $1
          (i32.load offset=8
           (local.get $1)
          )
         )
        )
       )
       (i64.const 2147483647)
      )
     )
     (br_if $label$1
      (i32.gt_s
       (local.get $1)
       (i32.const -1)
      )
     )
     (br_if $label$1
      (i64.eq
       (local.get $5)
       (i64.const 0)
      )
     )
     (i32.store
      (local.get $0)
      (i32.const 1)
     )
     (i32.store offset=8
      (local.get $0)
      (i32.and
       (local.get $2)
       (i32.const 2147483647)
      )
     )
     (i32.store offset=4
      (local.get $0)
      (i32.and
       (local.get $1)
       (i32.const 2147483647)
      )
     )
     (return)
    )
    (i32.store
     (local.get $0)
     (i32.const 0)
    )
    (return)
   )
   (i64.store align=4
    (local.get $0)
    (i64.load align=4
     (local.get $1)
    )
   )
   (i32.store
    (i32.add
     (local.get $0)
     (i32.const 8)
    )
    (i32.load
     (i32.add
      (local.get $1)
      (i32.const 8)
     )
    )
   )
   (return)
  )
  (i64.store align=4
   (local.get $0)
   (i64.const 1)
  )
  (i32.store offset=8
   (local.get $0)
   (select
    (i32.and
     (local.get $2)
     (i32.const 2147483647)
    )
    (local.get $1)
    (i64.lt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (local.get $5)
      )
      (i64.or
       (local.get $4)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $1)
       (i32.const 0)
      )
     )
     (local.get $3)
    )
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure9min_image17h9c3ebd9c1b37c334E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local.set $3
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $4
    (select
     (local.tee $3
      (i32.load offset=8
       (local.get $2)
      )
     )
     (local.tee $4
      (i32.load offset=8
       (local.get $1)
      )
     )
     (i64.gt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $4)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $4)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $3)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
    )
   )
   (local.set $6
    (select
     (local.tee $3
      (i32.load offset=4
       (local.get $2)
      )
     )
     (local.tee $1
      (i32.load offset=4
       (local.get $1)
      )
     )
     (i64.gt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $1)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $3)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
    )
   )
   (local.set $3
    (i32.const 1)
   )
  )
  (i32.store offset=8
   (local.get $0)
   (local.get $4)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $6)
  )
  (i32.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure9max_image17h6f99815d12f8c54bE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local.set $3
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $4
    (select
     (local.tee $3
      (i32.load offset=8
       (local.get $2)
      )
     )
     (local.tee $4
      (i32.load offset=8
       (local.get $1)
      )
     )
     (i64.lt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $4)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $4)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $3)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
    )
   )
   (local.set $6
    (select
     (local.tee $3
      (i32.load offset=4
       (local.get $2)
      )
     )
     (local.tee $1
      (i32.load offset=4
       (local.get $1)
      )
     )
     (i64.lt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $1)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $5
          (i64.extend_i32_u
           (local.get $3)
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
    )
   )
   (local.set $3
    (i32.const 1)
   )
  )
  (i32.store offset=8
   (local.get $0)
   (local.get $4)
  )
  (i32.store offset=4
   (local.get $0)
   (local.get $6)
  )
  (i32.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure3add17hb6725453457d4c54E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
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
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (i32.and
       (i32.load
        (local.get $2)
       )
       (i32.const 1)
      )
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $4
    (i64.load32_u offset=8
     (local.get $1)
    )
   )
   (local.set $5
    (i64.load32_u offset=8
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.load32_u offset=4
     (local.get $1)
    )
    (i64.load32_u offset=4
     (local.get $2)
    )
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.eq
       (i32.load8_u offset=8
        (local.get $3)
       )
       (i32.const 1)
      )
     )
     (local.set $6
      (i64.load32_u offset=16
       (local.get $3)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $4)
      (local.get $5)
     )
     (br_if $label$4
      (i32.ne
       (i32.load8_u offset=8
        (local.get $3)
       )
       (i32.const 1)
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
   (local.set $4
    (i64.load32_u offset=24
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
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
   (local.set $5
    (i64.load offset=16
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $4)
   )
   (block $label$7
    (br_if $label$7
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
   (block $label$8
    (br_if $label$8
     (i64.le_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (local.tee $4
         (i64.and
          (local.get $5)
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $4)
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
        (local.tee $5
         (i64.and
          (local.tee $4
           (i64.load offset=16
            (local.get $3)
           )
          )
          (i64.const 2147483647)
         )
        )
       )
       (i64.or
        (local.get $5)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.tee $2
         (i32.wrap_i64
          (local.get $4)
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
 (func $_ZN13hyperinterval5float12F32Enclosure3sub17h646ee18a26eacb4dE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (local.set $4
   (i32.const 1)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $5
    (select
     (i32.xor
      (local.tee $5
       (i32.load offset=4
        (local.get $2)
       )
      )
      (i32.const -2147483648)
     )
     (i32.const 0)
     (local.get $5)
    )
   )
   (local.set $2
    (select
     (i32.xor
      (local.tee $2
       (i32.load offset=8
        (local.get $2)
       )
      )
      (i32.const -2147483648)
     )
     (i32.const 0)
     (local.get $2)
    )
   )
  )
  (i32.store offset=12
   (local.get $3)
   (local.get $5)
  )
  (i32.store offset=8
   (local.get $3)
   (local.get $2)
  )
  (i32.store offset=4
   (local.get $3)
   (local.get $4)
  )
  (call $_ZN13hyperinterval5float12F32Enclosure3add17hb6725453457d4c54E
   (local.get $0)
   (local.get $1)
   (i32.add
    (local.get $3)
    (i32.const 4)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure12corner_image17haab8422f4e09c6deE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i32)
  (local $13 i64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i64)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
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
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (i32.and
       (i32.load
        (local.get $2)
       )
       (i32.const 1)
      )
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load32_u offset=8
     (local.get $1)
    )
   )
   (local.set $6
    (i64.load32_u offset=4
     (local.get $1)
    )
   )
   (local.set $7
    (i64.load32_u offset=8
     (local.get $2)
    )
   )
   (local.set $8
    (i64.load32_u offset=4
     (local.get $2)
    )
   )
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (br_if $label$7
        (local.get $3)
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $6)
        (local.get $8)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $9
        (i64.load32_u offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (i64.load32_u offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $10
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $9)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $1
        (i32.const 1)
       )
       (br_if $label$4
        (i64.gt_u
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $9
            (i64.and
             (local.get $10)
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $9)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $2
            (i32.wrap_i64
             (local.get $10)
            )
           )
           (i32.const 0)
          )
         )
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $11
            (i64.and
             (local.tee $9
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $11)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $3
            (i32.wrap_i64
             (local.get $9)
            )
           )
           (i32.const 0)
          )
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $6)
        (local.get $7)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $6
        (i64.load32_u offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (i64.load32_u offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.eq
         (i32.load8_u offset=8
          (local.get $4)
         )
         (i32.const 1)
        )
       )
       (local.set $11
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $6)
       )
       (br_if $label$5
        (i32.eq
         (i32.load8_u offset=8
          (local.get $4)
         )
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.const 1)
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $13
          (select
           (i64.sub
            (i64.const 2147483648)
            (local.tee $6
             (i64.and
              (local.get $11)
              (i64.const 2147483647)
             )
            )
           )
           (i64.or
            (local.get $6)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.tee $12
             (i32.wrap_i64
              (local.get $11)
             )
            )
            (i32.const 0)
           )
          )
         )
         (local.tee $6
          (select
           (i64.sub
            (i64.const 2147483648)
            (local.tee $11
             (i64.and
              (local.tee $6
               (i64.load offset=16
                (local.get $4)
               )
              )
              (i64.const 2147483647)
             )
            )
           )
           (i64.or
            (local.get $11)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.tee $14
             (i32.wrap_i64
              (local.get $6)
             )
            )
            (i32.const 0)
           )
          )
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $5)
        (local.get $8)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $8
        (i64.load32_u offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (i64.load32_u offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $11
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $8)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $16
          (select
           (i64.sub
            (i64.const 2147483648)
            (local.tee $8
             (i64.and
              (local.get $11)
              (i64.const 2147483647)
             )
            )
           )
           (i64.or
            (local.get $8)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.tee $15
             (i32.wrap_i64
              (local.get $11)
             )
            )
            (i32.const 0)
           )
          )
         )
         (local.tee $8
          (select
           (i64.sub
            (i64.const 2147483648)
            (local.tee $11
             (i64.and
              (local.tee $8
               (i64.load offset=16
                (local.get $4)
               )
              )
              (i64.const 2147483647)
             )
            )
           )
           (i64.or
            (local.get $11)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.tee $17
             (i32.wrap_i64
              (local.get $8)
             )
            )
            (i32.const 0)
           )
          )
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $5)
        (local.get $7)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $7
        (i64.load32_u offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (i64.load32_u offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $5
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (local.get $7)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $11
          (select
           (i64.sub
            (i64.const 2147483648)
            (local.tee $7
             (i64.and
              (local.get $5)
              (i64.const 2147483647)
             )
            )
           )
           (i64.or
            (local.get $7)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.tee $18
             (i32.wrap_i64
              (local.get $5)
             )
            )
            (i32.const 0)
           )
          )
         )
         (local.tee $7
          (select
           (i64.sub
            (i64.const 2147483648)
            (local.tee $5
             (i64.and
              (local.tee $7
               (i64.load offset=16
                (local.get $4)
               )
              )
              (i64.const 2147483647)
             )
            )
           )
           (i64.or
            (local.get $5)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.tee $19
             (i32.wrap_i64
              (local.get $7)
             )
            )
            (i32.const 0)
           )
          )
         )
        )
       )
       (local.set $1
        (select
         (local.get $19)
         (local.tee $1
          (select
           (local.get $17)
           (local.tee $1
            (select
             (local.get $14)
             (local.get $3)
             (i64.lt_u
              (select
               (i64.sub
                (i64.const 2147483648)
                (local.tee $5
                 (i64.and
                  (local.get $9)
                  (i64.const 2147483647)
                 )
                )
               )
               (i64.or
                (local.get $5)
                (i64.const 2147483648)
               )
               (i32.lt_s
                (local.get $3)
                (i32.const 0)
               )
              )
              (local.get $6)
             )
            )
           )
           (i64.lt_u
            (select
             (i64.sub
              (i64.const 2147483648)
              (i64.and
               (local.tee $6
                (i64.extend_i32_u
                 (local.get $1)
                )
               )
               (i64.const 2147483647)
              )
             )
             (i64.or
              (local.get $6)
              (i64.const 2147483648)
             )
             (i32.lt_s
              (local.get $1)
              (i32.const 0)
             )
            )
            (local.get $8)
           )
          )
         )
         (i64.lt_u
          (select
           (i64.sub
            (i64.const 2147483648)
            (i64.and
             (local.tee $6
              (i64.extend_i32_u
               (local.get $1)
              )
             )
             (i64.const 2147483647)
            )
           )
           (i64.or
            (local.get $6)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.get $1)
            (i32.const 0)
           )
          )
          (local.get $7)
         )
        )
       )
       (local.set $2
        (select
         (local.get $18)
         (local.tee $2
          (select
           (local.get $15)
           (local.tee $2
            (select
             (local.get $12)
             (local.get $2)
             (i64.gt_u
              (select
               (i64.sub
                (i64.const 2147483648)
                (local.tee $6
                 (i64.and
                  (local.get $10)
                  (i64.const 2147483647)
                 )
                )
               )
               (i64.or
                (local.get $6)
                (i64.const 2147483648)
               )
               (i32.lt_s
                (local.get $2)
                (i32.const 0)
               )
              )
              (local.get $13)
             )
            )
           )
           (i64.gt_u
            (select
             (i64.sub
              (i64.const 2147483648)
              (i64.and
               (local.tee $6
                (i64.extend_i32_u
                 (local.get $2)
                )
               )
               (i64.const 2147483647)
              )
             )
             (i64.or
              (local.get $6)
              (i64.const 2147483648)
             )
             (i32.lt_s
              (local.get $2)
              (i32.const 0)
             )
            )
            (local.get $16)
           )
          )
         )
         (i64.gt_u
          (select
           (i64.sub
            (i64.const 2147483648)
            (i64.and
             (local.tee $6
              (i64.extend_i32_u
               (local.get $2)
              )
             )
             (i64.const 2147483647)
            )
           )
           (i64.or
            (local.get $6)
            (i64.const 2147483648)
           )
           (i32.lt_s
            (local.get $2)
            (i32.const 0)
           )
          )
          (local.get $11)
         )
        )
       )
       (br $label$6)
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $6)
       (local.get $8)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $9
       (i64.load32_u offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (i64.load32_u offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $10
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $9)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $1
       (i32.const 1)
      )
      (br_if $label$4
       (i64.gt_u
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $9
           (i64.and
            (local.get $10)
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $9)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $2
           (i32.wrap_i64
            (local.get $10)
           )
          )
          (i32.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $11
           (i64.and
            (local.tee $9
             (i64.load offset=16
              (local.get $4)
             )
            )
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $11)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $3
           (i32.wrap_i64
            (local.get $9)
           )
          )
          (i32.const 0)
         )
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $6)
       (local.get $7)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $6
       (i64.load32_u offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (i64.load32_u offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $11
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $6)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $13
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $6
            (i64.and
             (local.get $11)
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $6)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $12
            (i32.wrap_i64
             (local.get $11)
            )
           )
           (i32.const 0)
          )
         )
        )
        (local.tee $6
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $11
            (i64.and
             (local.tee $6
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $11)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $14
            (i32.wrap_i64
             (local.get $6)
            )
           )
           (i32.const 0)
          )
         )
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $5)
       (local.get $8)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $8
       (i64.load32_u offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (i64.load32_u offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $11
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $8)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $16
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $8
            (i64.and
             (local.get $11)
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $8)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $15
            (i32.wrap_i64
             (local.get $11)
            )
           )
           (i32.const 0)
          )
         )
        )
        (local.tee $8
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $11
            (i64.and
             (local.tee $8
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $11)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $17
            (i32.wrap_i64
             (local.get $8)
            )
           )
           (i32.const 0)
          )
         )
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $5)
       (local.get $7)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $7
       (i64.load32_u offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (i64.load32_u offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $5
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $7)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $11
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $7
            (i64.and
             (local.get $5)
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $7)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $18
            (i32.wrap_i64
             (local.get $5)
            )
           )
           (i32.const 0)
          )
         )
        )
        (local.tee $7
         (select
          (i64.sub
           (i64.const 2147483648)
           (local.tee $5
            (i64.and
             (local.tee $7
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 2147483647)
            )
           )
          )
          (i64.or
           (local.get $5)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.tee $19
            (i32.wrap_i64
             (local.get $7)
            )
           )
           (i32.const 0)
          )
         )
        )
       )
      )
      (local.set $1
       (select
        (local.get $19)
        (local.tee $1
         (select
          (local.get $17)
          (local.tee $1
           (select
            (local.get $14)
            (local.get $3)
            (i64.lt_u
             (select
              (i64.sub
               (i64.const 2147483648)
               (local.tee $5
                (i64.and
                 (local.get $9)
                 (i64.const 2147483647)
                )
               )
              )
              (i64.or
               (local.get $5)
               (i64.const 2147483648)
              )
              (i32.lt_s
               (local.get $3)
               (i32.const 0)
              )
             )
             (local.get $6)
            )
           )
          )
          (i64.lt_u
           (select
            (i64.sub
             (i64.const 2147483648)
             (i64.and
              (local.tee $6
               (i64.extend_i32_u
                (local.get $1)
               )
              )
              (i64.const 2147483647)
             )
            )
            (i64.or
             (local.get $6)
             (i64.const 2147483648)
            )
            (i32.lt_s
             (local.get $1)
             (i32.const 0)
            )
           )
           (local.get $8)
          )
         )
        )
        (i64.lt_u
         (select
          (i64.sub
           (i64.const 2147483648)
           (i64.and
            (local.tee $6
             (i64.extend_i32_u
              (local.get $1)
             )
            )
            (i64.const 2147483647)
           )
          )
          (i64.or
           (local.get $6)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.get $1)
           (i32.const 0)
          )
         )
         (local.get $7)
        )
       )
      )
      (local.set $2
       (select
        (local.get $18)
        (local.tee $2
         (select
          (local.get $15)
          (local.tee $2
           (select
            (local.get $12)
            (local.get $2)
            (i64.gt_u
             (select
              (i64.sub
               (i64.const 2147483648)
               (local.tee $6
                (i64.and
                 (local.get $10)
                 (i64.const 2147483647)
                )
               )
              )
              (i64.or
               (local.get $6)
               (i64.const 2147483648)
              )
              (i32.lt_s
               (local.get $2)
               (i32.const 0)
              )
             )
             (local.get $13)
            )
           )
          )
          (i64.gt_u
           (select
            (i64.sub
             (i64.const 2147483648)
             (i64.and
              (local.tee $6
               (i64.extend_i32_u
                (local.get $2)
               )
              )
              (i64.const 2147483647)
             )
            )
            (i64.or
             (local.get $6)
             (i64.const 2147483648)
            )
            (i32.lt_s
             (local.get $2)
             (i32.const 0)
            )
           )
           (local.get $16)
          )
         )
        )
        (i64.gt_u
         (select
          (i64.sub
           (i64.const 2147483648)
           (i64.and
            (local.tee $6
             (i64.extend_i32_u
              (local.get $2)
             )
            )
            (i64.const 2147483647)
           )
          )
          (i64.or
           (local.get $6)
           (i64.const 2147483648)
          )
          (i32.lt_s
           (local.get $2)
           (i32.const 0)
          )
         )
         (local.get $11)
        )
       )
      )
     )
     (i32.store offset=8
      (local.get $0)
      (local.get $1)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $2)
     )
     (i32.store
      (local.get $0)
      (i32.const 1)
     )
     (br $label$1)
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $4)
     )
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
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure3mul17h2739bee9e5f3a208E (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_ZN13hyperinterval5float12F32Enclosure12corner_image17haab8422f4e09c6deE
   (local.get $0)
   (local.get $1)
   (local.get $2)
   (i32.const 0)
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure3div17h7b412cf9615e1b37E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $2)
       )
       (i32.const 1)
      )
     )
    )
    (br_if $label$2
     (i64.gt_u
      (select
       (i64.sub
        (i64.const 2147483648)
        (i64.and
         (local.tee $4
          (i64.extend_i32_u
           (local.tee $3
            (i32.load offset=4
             (local.get $2)
            )
           )
          )
         )
         (i64.const 2147483647)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const 2147483648)
       )
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
      (i64.const 2147483648)
     )
    )
    (br_if $label$1
     (i32.gt_s
      (local.tee $3
       (i32.load offset=8
        (local.get $2)
       )
      )
      (i32.const -1)
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (local.get $3)
       (i32.const 2147483647)
      )
     )
    )
   )
   (call $_ZN13hyperinterval5float12F32Enclosure12corner_image17haab8422f4e09c6deE
    (local.get $0)
    (local.get $1)
    (local.get $2)
    (i32.const 1)
   )
   (return)
  )
  (i32.store
   (local.get $0)
   (i32.const 2)
  )
  (i32.store8 offset=4
   (local.get $0)
   (i32.const 6)
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure10reciprocal17hde7475c30be6a1b3E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
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
        (i32.eqz
         (i32.load
          (local.get $1)
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $2)
         (i32.const 16)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (i64.const 1065353216)
       )
       (block $label$6
        (br_if $label$6
         (i32.ne
          (i32.load8_u offset=16
           (local.get $2)
          )
          (i32.const 1)
         )
        )
        (local.set $3
         (i32.load8_u offset=17
          (local.get $2)
         )
        )
        (br $label$3)
       )
       (local.set $4
        (i64.load offset=24
         (local.get $2)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $2)
         (i32.const 16)
        )
        (i64.const 2147483648)
        (i64.const 2139095040)
        (i64.const 1065353216)
       )
       (br_if $label$4
        (i32.ne
         (i32.load8_u offset=16
          (local.get $2)
         )
         (i32.const 1)
        )
       )
       (local.set $3
        (i32.load8_u offset=17
         (local.get $2)
        )
       )
       (br $label$3)
      )
      (i32.store
       (local.get $0)
       (i32.const 0)
      )
      (br $label$1)
     )
     (local.set $3
      (i32.const 1)
     )
     (br_if $label$2
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $5
          (i64.and
           (local.get $4)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $5)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $6
          (i32.wrap_i64
           (local.get $4)
          )
         )
         (i32.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $7
          (i64.and
           (local.tee $5
            (i64.load offset=24
             (local.get $2)
            )
           )
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $7)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $8
          (i32.wrap_i64
           (local.get $5)
          )
         )
         (i32.const 0)
        )
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
     (local.get $3)
    )
    (br $label$1)
   )
   (i32.store8
    (i32.add
     (local.get $2)
     (i32.const 11)
    )
    (i32.shr_u
     (local.get $6)
     (i32.const 24)
    )
   )
   (i32.store offset=12
    (local.get $2)
    (local.get $8)
   )
   (i64.store8 offset=8
    (local.get $2)
    (local.get $4)
   )
   (i32.store offset=4
    (local.get $2)
    (i32.const 1)
   )
   (i32.store16 offset=9 align=1
    (local.get $2)
    (i32.shr_u
     (local.get $6)
     (i32.const 8)
    )
   )
   (block $label$7
    (block $label$8
     (br_if $label$8
      (i64.gt_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (i64.and
          (local.tee $4
           (i64.extend_i32_u
            (local.tee $3
             (i32.load offset=4
              (local.get $1)
             )
            )
           )
          )
          (i64.const 2147483647)
         )
        )
        (i64.or
         (local.get $4)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.get $3)
         (i32.const 0)
        )
       )
       (i64.const 2147483648)
      )
     )
     (br_if $label$7
      (i32.gt_s
       (local.tee $3
        (i32.load offset=8
         (local.get $1)
        )
       )
       (i32.const -1)
      )
     )
     (br_if $label$7
      (i32.eqz
       (i32.and
        (local.get $3)
        (i32.const 2147483647)
       )
      )
     )
    )
    (call $_ZN13hyperinterval5float12F32Enclosure12corner_image17haab8422f4e09c6deE
     (local.get $0)
     (i32.add
      (local.get $2)
      (i32.const 4)
     )
     (local.get $1)
     (i32.const 1)
    )
    (br $label$1)
   )
   (i32.store
    (local.get $0)
    (i32.const 2)
   )
   (i32.store8 offset=4
    (local.get $0)
    (i32.const 6)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure4sqrt17h76611bab0b21f3d6E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
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
      (br_if $label$4
       (i32.eqz
        (i32.and
         (i32.load
          (local.get $1)
         )
         (i32.const 1)
        )
       )
      )
      (local.set $4
       (i64.extend_i32_u
        (local.tee $3
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
      (block $label$5
       (br_if $label$5
        (i32.gt_s
         (local.get $3)
         (i32.const -1)
        )
       )
       (br_if $label$3
        (i64.ne
         (i64.and
          (local.get $4)
          (i64.const 2147483647)
         )
         (i64.const 0)
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format4sqrt17h2acdb3c399d22468E
       (i32.add
        (local.get $2)
        (i32.const 8)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (select
        (i64.const 0)
        (local.tee $5
         (i64.extend_i32_u
          (local.get $1)
         )
        )
        (local.tee $6
         (i32.and
          (i32.lt_s
           (local.get $1)
           (i32.const 0)
          )
          (i64.ne
           (i64.and
            (local.get $5)
            (i64.const 2147483647)
           )
           (i64.const 0)
          )
         )
        )
       )
      )
      (br_if $label$2
       (i32.eqz
        (i32.load8_u offset=8
         (local.get $2)
        )
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $2)
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
     (i32.store8 offset=12
      (local.get $0)
      (i32.const 0)
     )
     (i32.store
      (local.get $0)
      (i32.const 0)
     )
     (br $label$1)
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (i32.const 7)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load32_u offset=16
     (local.get $2)
    )
   )
   (block $label$6
    (br_if $label$6
     (i32.eq
      (local.get $1)
      (local.get $3)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format4sqrt17h2acdb3c399d22468E
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (local.get $4)
    )
    (br_if $label$6
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (local.set $4
    (i64.load32_u offset=24
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $5)
   )
   (block $label$7
    (block $label$8
     (block $label$9
      (br_if $label$9
       (i32.ne
        (i32.load8_u offset=8
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $2)
       )
      )
      (br $label$8)
     )
     (local.set $5
      (i64.load offset=16
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $4)
     )
     (block $label$10
      (br_if $label$10
       (i32.ne
        (i32.load8_u offset=8
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $2)
       )
      )
      (br $label$8)
     )
     (local.set $1
      (i32.const 1)
     )
     (br_if $label$7
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $4
          (i64.and
           (local.get $5)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $4)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $3
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
         (local.tee $7
          (i64.and
           (local.tee $4
            (i64.load offset=16
             (local.get $2)
            )
           )
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $7)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $8
          (i32.wrap_i64
           (local.get $4)
          )
         )
         (i32.const 0)
        )
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
     (local.get $1)
    )
    (br $label$1)
   )
   (i32.store8 offset=12
    (local.get $0)
    (local.get $6)
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $8)
   )
   (i64.store8 offset=4
    (local.get $0)
    (local.get $5)
   )
   (i32.store
    (local.get $0)
    (i32.const 1)
   )
   (i32.store8
    (i32.add
     (local.get $0)
     (i32.const 7)
    )
    (i32.shr_u
     (local.get $3)
     (i32.const 24)
    )
   )
   (i32.store16 offset=5 align=1
    (local.get $0)
    (i32.shr_u
     (local.get $3)
     (i32.const 8)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure6square17h39ac62af88cfbe3dE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (global.set $__stack_pointer
   (local.tee $2
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
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (local.set $3
      (i32.load offset=8
       (local.get $1)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
      (i32.add
       (local.get $2)
       (i32.const 24)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.tee $4
       (i64.extend_i32_u
        (local.tee $1
         (i32.load offset=4
          (local.get $1)
         )
        )
       )
      )
      (local.get $4)
     )
     (br_if $label$2
      (i32.eqz
       (i32.load8_u offset=24
        (local.get $2)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=25
       (local.get $2)
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
    (i64.load32_u offset=40
     (local.get $2)
    )
   )
   (local.set $6
    (i64.load32_u offset=32
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
    (i32.add
     (local.get $2)
     (i32.const 24)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.tee $4
     (i64.extend_i32_u
      (local.get $3)
     )
    )
    (local.get $4)
   )
   (block $label$4
    (br_if $label$4
     (i32.ne
      (i32.load8_u offset=24
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=25
      (local.get $2)
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
   (local.set $7
    (i64.load32_u offset=40
     (local.get $2)
    )
   )
   (local.set $4
    (i64.load32_u offset=32
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 24)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $6)
   )
   (block $label$5
    (block $label$6
     (block $label$7
      (br_if $label$7
       (i32.ne
        (i32.load8_u offset=24
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $8
       (i32.load8_u offset=25
        (local.get $2)
       )
      )
      (br $label$6)
     )
     (local.set $6
      (i64.load offset=32
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $2)
       (i32.const 24)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $5)
     )
     (local.set $8
      (i32.const 1)
     )
     (block $label$8
      (br_if $label$8
       (i32.ne
        (i32.load8_u offset=24
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $8
       (i32.load8_u offset=25
        (local.get $2)
       )
      )
      (br $label$6)
     )
     (br_if $label$5
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $5
          (i64.and
           (local.get $6)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $5)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $9
          (i32.wrap_i64
           (local.get $6)
          )
         )
         (i32.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $5
          (i64.and
           (local.tee $6
            (i64.load offset=32
             (local.get $2)
            )
           )
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $5)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $10
          (i32.wrap_i64
           (local.get $6)
          )
         )
         (i32.const 0)
        )
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
     (local.get $8)
    )
    (br $label$1)
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 24)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $4)
   )
   (block $label$9
    (block $label$10
     (block $label$11
      (br_if $label$11
       (i32.ne
        (i32.load8_u offset=24
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $8
       (i32.load8_u offset=25
        (local.get $2)
       )
      )
      (br $label$10)
     )
     (local.set $4
      (i64.load offset=32
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $2)
       (i32.const 24)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $7)
     )
     (block $label$12
      (br_if $label$12
       (i32.ne
        (i32.load8_u offset=24
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $8
       (i32.load8_u offset=25
        (local.get $2)
       )
      )
      (br $label$10)
     )
     (local.set $8
      (i32.const 1)
     )
     (br_if $label$9
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $6
          (i64.and
           (local.get $4)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $6)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $11
          (i32.wrap_i64
           (local.get $4)
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
           (local.tee $4
            (i64.load offset=32
             (local.get $2)
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
         (local.tee $12
          (i32.wrap_i64
           (local.get $4)
          )
         )
         (i32.const 0)
        )
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
     (local.get $8)
    )
    (br $label$1)
   )
   (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17hddcef4a18fee1ab8E
    (i32.add
     (local.get $2)
     (i32.const 16)
    )
    (local.get $9)
    (local.get $10)
    (local.get $11)
    (local.get $12)
   )
   (local.set $8
    (i32.load offset=20
     (local.get $2)
    )
   )
   (local.set $9
    (i32.load offset=16
     (local.get $2)
    )
   )
   (block $label$13
    (br_if $label$13
     (i32.eqz
      (i32.and
       (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$5signs17h8a34f0220ad92c0fE
        (local.get $1)
        (local.get $3)
        (i32.const 0)
       )
       (i32.const 250)
      )
     )
    )
    (call $_ZN13hyperinterval5float12F32Enclosure9from_bits17haaa355d79195c0ffE
     (i32.add
      (local.get $2)
      (i32.const 24)
     )
     (i64.const 0)
     (i64.const 0)
    )
    (local.set $1
     (i32.load8_u offset=28
      (local.get $2)
     )
    )
    (block $label$14
     (br_if $label$14
      (i32.ne
       (local.tee $3
        (i32.load offset=24
         (local.get $2)
        )
       )
       (i32.const 2)
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
    (br_if $label$13
     (i32.eqz
      (i32.and
       (local.get $3)
       (i32.const 1)
      )
     )
    )
    (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17hddcef4a18fee1ab8E
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (local.get $9)
     (local.get $8)
     (i32.or
      (i32.shl
       (i32.or
        (i32.load16_u offset=29 align=1
         (local.get $2)
        )
        (i32.shl
         (i32.load8_u
          (i32.add
           (local.get $2)
           (i32.const 31)
          )
         )
         (i32.const 16)
        )
       )
       (i32.const 8)
      )
      (local.get $1)
     )
     (i32.load offset=32
      (local.get $2)
     )
    )
    (local.set $8
     (i32.load offset=12
      (local.get $2)
     )
    )
    (local.set $9
     (i32.load offset=8
      (local.get $2)
     )
    )
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $8)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $9)
   )
   (i32.store
    (local.get $0)
    (i32.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 48)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure11checked_pow17h1d1c81b9c5551acaE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 48)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (local.get $2)
      (i32.const 2)
     )
    )
    (call $_ZN13hyperinterval5float12F32Enclosure6square17h39ac62af88cfbe3dE
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $4
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format5power17h301e1115ffe557c4E
    (i32.add
     (local.get $3)
     (i32.const 24)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.extend_i32_u
     (local.tee $1
      (i32.load offset=4
       (local.get $1)
      )
     )
    )
    (local.get $2)
   )
   (block $label$4
    (br_if $label$4
     (i32.load8_u offset=24
      (local.get $3)
     )
    )
    (local.set $5
     (i64.load32_u offset=40
      (local.get $3)
     )
    )
    (local.set $6
     (i64.load32_u offset=32
      (local.get $3)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format5power17h301e1115ffe557c4E
     (i32.add
      (local.get $3)
      (i32.const 24)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (i64.extend_i32_u
      (local.get $4)
     )
     (local.get $2)
    )
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.load8_u offset=24
        (local.get $3)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=25
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
    (local.set $7
     (i64.load32_u offset=40
      (local.get $3)
     )
    )
    (local.set $8
     (i64.load32_u offset=32
      (local.get $3)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $3)
      (i32.const 24)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (local.get $6)
    )
    (block $label$6
     (block $label$7
      (block $label$8
       (br_if $label$8
        (i32.ne
         (i32.load8_u offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $9
        (i32.load8_u offset=25
         (local.get $3)
        )
       )
       (br $label$7)
      )
      (local.set $6
       (i64.load offset=32
        (local.get $3)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $3)
        (i32.const 24)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $5)
      )
      (local.set $9
       (i32.const 1)
      )
      (block $label$9
       (br_if $label$9
        (i32.ne
         (i32.load8_u offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $9
        (i32.load8_u offset=25
         (local.get $3)
        )
       )
       (br $label$7)
      )
      (br_if $label$6
       (i64.le_u
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $5
           (i64.and
            (local.get $6)
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $5)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $10
           (i32.wrap_i64
            (local.get $6)
           )
          )
          (i32.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $5
           (i64.and
            (local.tee $6
             (i64.load offset=32
              (local.get $3)
             )
            )
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $5)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $11
           (i32.wrap_i64
            (local.get $6)
           )
          )
          (i32.const 0)
         )
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
      (local.get $9)
     )
     (br $label$1)
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $3)
      (i32.const 24)
     )
     (i64.const 2147483648)
     (i64.const 2139095040)
     (local.get $8)
    )
    (block $label$10
     (block $label$11
      (block $label$12
       (br_if $label$12
        (i32.ne
         (i32.load8_u offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $9
        (i32.load8_u offset=25
         (local.get $3)
        )
       )
       (br $label$11)
      )
      (local.set $6
       (i64.load offset=32
        (local.get $3)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $3)
        (i32.const 24)
       )
       (i64.const 2147483648)
       (i64.const 2139095040)
       (local.get $7)
      )
      (block $label$13
       (br_if $label$13
        (i32.ne
         (i32.load8_u offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $9
        (i32.load8_u offset=25
         (local.get $3)
        )
       )
       (br $label$11)
      )
      (local.set $9
       (i32.const 1)
      )
      (br_if $label$10
       (i64.le_u
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $5
           (i64.and
            (local.get $6)
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $5)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $12
           (i32.wrap_i64
            (local.get $6)
           )
          )
          (i32.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $5
           (i64.and
            (local.tee $6
             (i64.load offset=32
              (local.get $3)
             )
            )
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $5)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $13
           (i32.wrap_i64
            (local.get $6)
           )
          )
          (i32.const 0)
         )
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
      (local.get $9)
     )
     (br $label$1)
    )
    (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17hddcef4a18fee1ab8E
     (i32.add
      (local.get $3)
      (i32.const 16)
     )
     (local.get $10)
     (local.get $11)
     (local.get $12)
     (local.get $13)
    )
    (local.set $9
     (i32.load offset=20
      (local.get $3)
     )
    )
    (local.set $10
     (i32.load offset=16
      (local.get $3)
     )
    )
    (block $label$14
     (br_if $label$14
      (i32.eqz
       (local.get $2)
      )
     )
     (br_if $label$14
      (i32.and
       (local.get $2)
       (i32.const 1)
      )
     )
     (br_if $label$14
      (i32.eqz
       (i32.and
        (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$5signs17h8a34f0220ad92c0fE
         (local.get $1)
         (local.get $4)
         (i32.const 0)
        )
        (i32.const 250)
       )
      )
     )
     (call $_ZN13hyperinterval5float12F32Enclosure9from_bits17haaa355d79195c0ffE
      (i32.add
       (local.get $3)
       (i32.const 24)
      )
      (i64.const 0)
      (i64.const 0)
     )
     (local.set $1
      (i32.load8_u offset=28
       (local.get $3)
      )
     )
     (block $label$15
      (br_if $label$15
       (i32.ne
        (local.tee $2
         (i32.load offset=24
          (local.get $3)
         )
        )
        (i32.const 2)
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
     (br_if $label$14
      (i32.eqz
       (i32.and
        (local.get $2)
        (i32.const 1)
       )
      )
     )
     (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17hddcef4a18fee1ab8E
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
      (local.get $10)
      (local.get $9)
      (i32.or
       (i32.shl
        (i32.or
         (i32.load16_u offset=29 align=1
          (local.get $3)
         )
         (i32.shl
          (i32.load8_u
           (i32.add
            (local.get $3)
            (i32.const 31)
           )
          )
          (i32.const 16)
         )
        )
        (i32.const 8)
       )
       (local.get $1)
      )
      (i32.load offset=32
       (local.get $3)
      )
     )
     (local.set $9
      (i32.load offset=12
       (local.get $3)
      )
     )
     (local.set $10
      (i32.load offset=8
       (local.get $3)
      )
     )
    )
    (i32.store offset=8
     (local.get $0)
     (local.get $9)
    )
    (i32.store offset=4
     (local.get $0)
     (local.get $10)
    )
    (i32.store
     (local.get $0)
     (i32.const 1)
    )
    (br $label$1)
   )
   (local.set $1
    (i32.load8_u offset=25
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
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 48)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure6affine17h7752272bfb4adca0E (param $0 i32) (param $1 i32) (param $2 f32) (param $3 f32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (i32.add
    (local.get $4)
    (i32.const 8)
   )
   (i64.const 2147483648)
   (i64.const 2139095040)
   (i64.extend_i32_u
    (i32.reinterpret_f32
     (local.get $2)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u offset=8
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $4)
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
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $4)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.extend_i32_u
     (i32.reinterpret_f32
      (local.get $3)
     )
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u offset=8
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $4)
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
   (block $label$4
    (br_if $label$4
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (i32.store
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (local.set $6
    (i64.load32_u offset=8
     (local.get $1)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6affine17h863b42e14750a82bE
    (i32.add
     (local.get $4)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (i64.load32_u offset=4
     (local.get $1)
    )
    (local.get $5)
    (local.tee $7
     (i64.load32_u offset=16
      (local.get $4)
     )
    )
   )
   (block $label$5
    (br_if $label$5
     (i32.ne
      (i32.load8_u offset=8
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $4)
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
   (local.set $8
    (i64.load32_u offset=24
     (local.get $4)
    )
   )
   (local.set $9
    (i64.load32_u offset=16
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6affine17h863b42e14750a82bE
    (i32.add
     (local.get $4)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $6)
    (local.get $5)
    (local.get $7)
   )
   (block $label$6
    (br_if $label$6
     (i32.ne
      (i32.load8_u offset=8
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $4)
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
    (i64.load offset=24
     (local.get $4)
    )
   )
   (local.set $6
    (i64.load offset=16
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $4)
     (i32.const 8)
    )
    (i64.const 2147483648)
    (i64.const 2139095040)
    (local.get $9)
   )
   (block $label$7
    (block $label$8
     (block $label$9
      (br_if $label$9
       (i32.ne
        (i32.load8_u offset=8
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $4)
       )
      )
      (br $label$8)
     )
     (local.set $7
      (i64.load offset=16
       (local.get $4)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $4)
       (i32.const 8)
      )
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $8)
     )
     (local.set $1
      (i32.const 1)
     )
     (block $label$10
      (br_if $label$10
       (i32.ne
        (i32.load8_u offset=8
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $4)
       )
      )
      (br $label$8)
     )
     (br_if $label$7
      (i64.le_u
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $9
          (i64.and
           (local.get $7)
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $9)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $10
          (i32.wrap_i64
           (local.get $7)
          )
         )
         (i32.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const 2147483648)
         (local.tee $9
          (i64.and
           (local.tee $7
            (i64.load offset=16
             (local.get $4)
            )
           )
           (i64.const 2147483647)
          )
         )
        )
        (i64.or
         (local.get $9)
         (i64.const 2147483648)
        )
        (i32.lt_s
         (local.tee $11
          (i32.wrap_i64
           (local.get $7)
          )
         )
         (i32.const 0)
        )
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
     (local.get $1)
    )
    (br $label$1)
   )
   (call $_ZN13hyperinterval5float12F32Enclosure9from_bits17haaa355d79195c0ffE
    (i32.add
     (local.get $4)
     (i32.const 8)
    )
    (local.get $6)
    (local.get $5)
   )
   (local.set $1
    (i32.load8_u offset=12
     (local.get $4)
    )
   )
   (block $label$11
    (br_if $label$11
     (i32.ne
      (local.tee $12
       (i32.load offset=8
        (local.get $4)
       )
      )
      (i32.const 2)
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
   (block $label$12
    (br_if $label$12
     (i32.eqz
      (i32.and
       (local.get $12)
       (i32.const 1)
      )
     )
    )
    (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17hddcef4a18fee1ab8E
     (local.get $4)
     (local.get $10)
     (local.get $11)
     (i32.or
      (i32.shl
       (i32.or
        (i32.load16_u offset=13 align=1
         (local.get $4)
        )
        (i32.shl
         (i32.load8_u
          (i32.add
           (local.get $4)
           (i32.const 15)
          )
         )
         (i32.const 16)
        )
       )
       (i32.const 8)
      )
      (local.get $1)
     )
     (i32.load offset=16
      (local.get $4)
     )
    )
    (local.set $11
     (i32.load offset=4
      (local.get $4)
     )
    )
    (local.set $10
     (i32.load
      (local.get $4)
     )
    )
   )
   (i32.store offset=8
    (local.get $0)
    (local.get $11)
   )
   (i32.store offset=4
    (local.get $0)
    (local.get $10)
   )
   (i32.store
    (local.get $0)
    (i32.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F32Enclosure8expanded17h5ad4488c8b671d6dE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
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
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $1)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i32.load offset=8
      (local.get $1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (local.get $2)
     (i64.const 2147483648)
     (i64.const 2139095040)
     (i64.add
      (select
       (i64.const -1)
       (i64.const 1)
       (i32.lt_s
        (local.tee $1
         (select
          (i32.xor
           (local.tee $1
            (i32.load offset=4
             (local.get $1)
            )
           )
           (i32.const -2147483648)
          )
          (i32.const 0)
          (local.get $1)
         )
        )
        (i32.const 0)
       )
      )
      (i64.extend_i32_u
       (local.get $1)
      )
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.load8_u
       (local.get $2)
      )
     )
     (local.set $4
      (i64.load offset=8
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (local.get $2)
      (i64.const 2147483648)
      (i64.const 2139095040)
      (i64.add
       (select
        (i64.const -1)
        (i64.const 1)
        (i32.lt_s
         (local.get $3)
         (i32.const 0)
        )
       )
       (i64.extend_i32_u
        (local.get $3)
       )
      )
     )
     (br_if $label$3
      (i32.eq
       (i32.load8_u
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $5
      (i64.load32_u offset=8
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (local.get $2)
      (i64.const 2147483648)
      (i64.const 2139095040)
      (select
       (i64.const 0)
       (i64.xor
        (i64.and
         (local.get $4)
         (i64.const 4294967295)
        )
        (i64.const 2147483648)
       )
       (i64.eqz
        (local.get $4)
       )
      )
     )
     (block $label$4
      (br_if $label$4
       (i32.ne
        (i32.load8_u
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=1
        (local.get $2)
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
     (local.set $4
      (i64.load offset=8
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (local.get $2)
      (i64.const 2147483648)
      (i64.const 2139095040)
      (local.get $5)
     )
     (block $label$5
      (br_if $label$5
       (i32.ne
        (i32.load8_u
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=1
        (local.get $2)
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
     (block $label$6
      (br_if $label$6
       (i64.le_u
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $5
           (i64.and
            (local.get $4)
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $5)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $1
           (i32.wrap_i64
            (local.get $4)
           )
          )
          (i32.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const 2147483648)
          (local.tee $5
           (i64.and
            (local.tee $4
             (i64.load offset=8
              (local.get $2)
             )
            )
            (i64.const 2147483647)
           )
          )
         )
         (i64.or
          (local.get $5)
          (i64.const 2147483648)
         )
         (i32.lt_s
          (local.tee $3
           (i32.wrap_i64
            (local.get $4)
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
      (local.get $3)
     )
     (i32.store offset=4
      (local.get $0)
      (local.get $1)
     )
     (i32.store
      (local.get $0)
      (i32.const 1)
     )
     (br $label$1)
    )
    (i32.store
     (local.get $0)
     (i32.const 2)
    )
    (i32.store8 offset=4
     (local.get $0)
     (i32.const 5)
    )
    (br $label$1)
   )
   (i32.store
    (local.get $0)
    (i32.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float8F64Width9enclosure17h50023b562b2c3dccE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E
   (i32.add
    (local.get $2)
    (i32.const 8)
   )
   (i64.const -9223372036854775808)
   (i64.const 9218868437227405312)
   (i64.load offset=8
    (local.get $1)
   )
   (select
    (i64.const 0)
    (i64.xor
     (local.tee $3
      (i64.load
       (local.get $1)
      )
     )
     (i64.const -9223372036854775808)
    )
    (i64.eqz
     (local.get $3)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (local.set $3
    (i64.load offset=24
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (i64.load offset=16
     (local.get $2)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (local.set $4
    (i64.load offset=16
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $3)
   )
   (block $label$4
    (br_if $label$4
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (block $label$5
    (br_if $label$5
     (i64.le_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $4)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $4)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=16
           (local.get $2)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
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
    (local.get $3)
   )
   (i64.store offset=8
    (local.get $0)
    (local.get $4)
   )
   (i64.store
    (local.get $0)
    (i64.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN65_$LT$hyperinterval..float..F64Width$u20$as$u20$core..cmp..Ord$GT$3cmp17h173e0713f09ebfe6E (param $0 i32) (param $1 i32) (result i32)
  (call $_ZN13hyperinterval4ieee6Format13compare_width17h1cbe89d62d3887a6E
   (i64.const -9223372036854775808)
   (i64.const 9218868437227405312)
   (i64.load
    (local.get $0)
   )
   (i64.load offset=8
    (local.get $0)
   )
   (i64.load
    (local.get $1)
   )
   (i64.load offset=8
    (local.get $1)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure3new17h58a446a9620e5eebE (param $0 i32) (param $1 f64) (param $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (local.get $3)
   (i64.const -9223372036854775808)
   (i64.const 9218868437227405312)
   (i64.reinterpret_f64
    (local.get $1)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load offset=8
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (local.get $3)
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (i64.reinterpret_f64
     (local.get $2)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (block $label$4
    (br_if $label$4
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
          (i64.load offset=8
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
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure9from_bits17hca7e1935cbcb20acE (param $0 i32) (param $1 i64) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (local.get $3)
   (i64.const -9223372036854775808)
   (i64.const 9218868437227405312)
   (local.get $1)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (local.set $1
    (i64.load offset=8
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (local.get $3)
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $2)
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u
       (local.get $3)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $4)
    )
    (br $label$1)
   )
   (block $label$4
    (br_if $label$4
     (i64.le_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $1)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $1)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $1)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $2
          (i64.load offset=8
           (local.get $3)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $2)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $2)
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
    (local.get $2)
   )
   (i64.store offset=8
    (local.get $0)
    (local.get $1)
   )
   (i64.store
    (local.get $0)
    (i64.const 1)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure18midpoint_enclosure17ha83e42b96f855e6fE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $1)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i64.load offset=8
      (local.get $1)
     )
    )
    (local.set $4
     (i64.load offset=16
      (local.get $1)
     )
    )
    (i64.store offset=72
     (local.get $2)
     (i64.const 0)
    )
    (i64.store8 offset=84
     (local.get $2)
     (i64.shr_u
      (local.get $4)
      (i64.const 63)
     )
    )
    (i64.store offset=40
     (local.get $2)
     (i64.const 0)
    )
    (i64.store8 offset=52
     (local.get $2)
     (i64.shr_u
      (local.get $3)
      (i64.const 63)
     )
    )
    (i64.store offset=32
     (local.get $2)
     (select
      (local.tee $5
       (i64.and
        (local.get $3)
        (i64.const 4503599627370495)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 4503599627370496)
      )
      (local.tee $1
       (i64.eqz
        (local.tee $3
         (i64.and
          (i64.shr_u
           (local.get $3)
           (i64.const 52)
          )
          (i64.const 2047)
         )
        )
       )
      )
     )
    )
    (i64.store offset=64
     (local.get $2)
     (select
      (local.tee $5
       (i64.and
        (local.get $4)
        (i64.const 4503599627370495)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 4503599627370496)
      )
      (local.tee $6
       (i64.eqz
        (local.tee $4
         (i64.and
          (i64.shr_u
           (local.get $4)
           (i64.const 52)
          )
          (i64.const 2047)
         )
        )
       )
      )
     )
    )
    (i32.store offset=48
     (local.get $2)
     (select
      (i32.const -1075)
      (i32.add
       (i32.wrap_i64
        (local.get $3)
       )
       (i32.const -1076)
      )
      (local.get $1)
     )
    )
    (i32.store offset=80
     (local.get $2)
     (select
      (i32.const -1075)
      (i32.add
       (i32.wrap_i64
        (local.get $4)
       )
       (i32.const -1076)
      )
      (local.get $6)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format8add_wide17hfb433c6dfcd20526E.llvm.3547746728100167404
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (i32.add
      (local.get $2)
      (i32.const 32)
     )
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.load8_u offset=8
        (local.get $2)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=9
       (local.get $2)
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
    (local.set $3
     (i64.load offset=24
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (i64.load offset=16
      (local.get $2)
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
    (local.set $4
     (i64.load offset=72
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (local.get $3)
    )
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
    (block $label$6
     (br_if $label$6
      (i64.le_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.get $4)
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $4)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $4)
         (i64.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $3
           (i64.load offset=72
            (local.get $2)
           )
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $3)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $3)
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
     (local.get $3)
    )
    (i64.store offset=8
     (local.get $0)
     (local.get $4)
    )
    (i64.store
     (local.get $0)
     (i64.const 1)
    )
    (br $label$1)
   )
   (i64.store
    (local.get $0)
    (i64.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 96)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure16radius_enclosure17h4a1f59f9e2b2e0a4E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $1)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i64.load offset=8
      (local.get $1)
     )
    )
    (local.set $4
     (i64.load offset=16
      (local.get $1)
     )
    )
    (i64.store offset=72
     (local.get $2)
     (i64.const 0)
    )
    (i64.store offset=40
     (local.get $2)
     (i64.const 0)
    )
    (i64.store8 offset=52
     (local.get $2)
     (i64.shr_u
      (local.get $4)
      (i64.const 63)
     )
    )
    (i64.store8 offset=84
     (local.get $2)
     (i64.shr_u
      (local.tee $3
       (select
        (i64.const 0)
        (i64.xor
         (local.get $3)
         (i64.const -9223372036854775808)
        )
        (i64.eqz
         (local.get $3)
        )
       )
      )
      (i64.const 63)
     )
    )
    (i64.store offset=32
     (local.get $2)
     (select
      (local.tee $5
       (i64.and
        (local.get $4)
        (i64.const 4503599627370495)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 4503599627370496)
      )
      (local.tee $1
       (i64.eqz
        (local.tee $4
         (i64.and
          (i64.shr_u
           (local.get $4)
           (i64.const 52)
          )
          (i64.const 2047)
         )
        )
       )
      )
     )
    )
    (i32.store offset=48
     (local.get $2)
     (select
      (i32.const -1075)
      (i32.add
       (i32.wrap_i64
        (local.get $4)
       )
       (i32.const -1076)
      )
      (local.get $1)
     )
    )
    (i64.store offset=64
     (local.get $2)
     (select
      (local.tee $4
       (i64.and
        (local.get $3)
        (i64.const 4503599627370495)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const 4503599627370496)
      )
      (local.tee $1
       (i64.eqz
        (local.tee $4
         (i64.and
          (i64.shr_u
           (local.get $3)
           (i64.const 52)
          )
          (i64.const 2047)
         )
        )
       )
      )
     )
    )
    (i32.store offset=80
     (local.get $2)
     (select
      (i32.const -1075)
      (i32.add
       (i32.wrap_i64
        (local.get $4)
       )
       (i32.const -1076)
      )
      (local.get $1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format8add_wide17hfb433c6dfcd20526E.llvm.3547746728100167404
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (i32.add
      (local.get $2)
      (i32.const 32)
     )
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.load8_u offset=8
        (local.get $2)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=9
       (local.get $2)
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
    (local.set $4
     (i64.load offset=24
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (i64.load offset=16
      (local.get $2)
     )
    )
    (block $label$4
     (br_if $label$4
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
    (local.set $3
     (i64.load offset=72
      (local.get $2)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $2)
      (i32.const 64)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (local.get $4)
    )
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.load8_u offset=64
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=65
       (local.get $2)
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
    (block $label$6
     (br_if $label$6
      (i64.le_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.get $3)
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $3)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $3)
         (i64.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $4
           (i64.load offset=72
            (local.get $2)
           )
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $4)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $4)
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
     (local.get $4)
    )
    (i64.store offset=8
     (local.get $0)
     (local.get $3)
    )
    (i64.store
     (local.get $0)
     (i64.const 1)
    )
    (br $label$1)
   )
   (i64.store
    (local.get $0)
    (i64.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 96)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure14contains_point17hd1c3a935b45e7cfcE (param $0 i32) (param $1 i32) (param $2 f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 16)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (local.get $3)
   (i64.const -9223372036854775808)
   (i64.const 9218868437227405312)
   (i64.reinterpret_f64
    (local.get $2)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (local.tee $4
       (i32.load8_u
        (local.get $3)
       )
      )
      (i32.const 1)
     )
    )
    (local.set $5
     (i32.load8_u offset=1
      (local.get $3)
     )
    )
    (br $label$1)
   )
   (local.set $5
    (i32.const 0)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$1
    (i64.gt_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $6
         (i64.load offset=8
          (local.get $1)
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
     (local.tee $6
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $6
          (i64.load offset=8
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
   )
   (local.set $5
    (i64.le_u
     (local.get $6)
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $7
         (i64.load offset=16
          (local.get $1)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $7)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $7)
       (i64.const 0)
      )
     )
    )
   )
  )
  (i32.store8 offset=1
   (local.get $0)
   (local.get $5)
  )
  (i32.store8
   (local.get $0)
   (local.get $4)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure9subset_of17h1f8f3cf2e62f3063E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local.set $2
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$1
    (i64.gt_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=8
          (local.get $1)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=8
          (local.get $0)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
    )
   )
   (local.set $2
    (i64.le_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=16
          (local.get $0)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=16
          (local.get $1)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F64Enclosure18interior_subset_of17h21507821b578d55aE (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local.set $2
   (i32.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i32.const 0)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$1
    (i64.ge_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=8
          (local.get $1)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=8
          (local.get $0)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
    )
   )
   (local.set $2
    (i64.lt_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=16
          (local.get $0)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=16
          (local.get $1)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F64Enclosure16strictly_left_of17hfdd946b3ac9bc541E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $2
    (i64.lt_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=16
          (local.get $0)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.tee $3
         (i64.load offset=8
          (local.get $1)
         )
        )
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $_ZN13hyperinterval5float12F64Enclosure8disjoint17ha148eea0779fab98E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local.set $2
   (i32.const 1)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.eqz
      (i64.load
       (local.get $0)
      )
     )
    )
    (br_if $label$2
     (i64.eqz
      (local.tee $3
       (i64.load
        (local.get $1)
       )
      )
     )
    )
    (local.set $2
     (i32.const 1)
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (i32.wrap_i64
        (local.get $3)
       )
       (i32.const 1)
      )
     )
    )
    (br_if $label$2
     (i64.lt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=16
           (local.get $0)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=8
           (local.get $1)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
    (local.set $2
     (i64.lt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=16
           (local.get $1)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=8
           (local.get $0)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (return
    (local.get $2)
   )
  )
  (i32.const 0)
 )
 (func $_ZN13hyperinterval5float12F64Enclosure8overlaps17hc7ae44dc85d8c781E (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local.set $2
   (i32.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.eqz
      (i64.load
       (local.get $0)
      )
     )
    )
    (br_if $label$2
     (i64.eqz
      (local.tee $3
       (i64.load
        (local.get $1)
       )
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.and
       (i32.wrap_i64
        (local.get $3)
       )
       (i32.const 1)
      )
     )
    )
    (br_if $label$2
     (i64.lt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=16
           (local.get $0)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=8
           (local.get $1)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
    (local.set $2
     (i64.ge_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=16
           (local.get $1)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=8
           (local.get $0)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (return
    (local.get $2)
   )
  )
  (i32.const 1)
 )
 (func $_ZN13hyperinterval5float12F64Enclosure4hull17h4455536ea286b1d9E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local.set $3
   (i64.load offset=16
    (local.get $2)
   )
  )
  (local.set $4
   (i64.load offset=8
    (local.get $2)
   )
  )
  (local.set $5
   (i64.load
    (local.get $2)
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.wrap_i64
       (local.tee $6
        (i64.load
         (local.get $1)
        )
       )
      )
      (i32.const 1)
     )
    )
   )
   (local.set $7
    (i64.load offset=16
     (local.get $1)
    )
   )
   (local.set $8
    (i64.load offset=8
     (local.get $1)
    )
   )
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.wrap_i64
       (local.get $5)
      )
      (i32.const 1)
     )
    )
    (local.set $3
     (local.get $7)
    )
    (local.set $4
     (local.get $8)
    )
    (local.set $5
     (local.get $6)
    )
    (br $label$1)
   )
   (local.set $3
    (select
     (local.get $3)
     (local.get $7)
     (i64.lt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $7)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $7)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $7)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $3)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (local.set $4
    (select
     (local.get $4)
     (local.get $8)
     (i64.gt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $8)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $8)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $8)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $4)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $4)
        (i64.const 0)
       )
      )
     )
    )
   )
   (local.set $5
    (i64.const 1)
   )
  )
  (i64.store offset=16
   (local.get $0)
   (local.get $3)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $4)
  )
  (i64.store
   (local.get $0)
   (local.get $5)
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure12intersection17h228eca2199fbe94aE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local.set $3
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $3
    (i64.extend_i32_u
     (i64.le_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $5
          (select
           (local.tee $4
            (i64.load offset=8
             (local.get $2)
            )
           )
           (local.tee $5
            (i64.load offset=8
             (local.get $1)
            )
           )
           (i64.lt_u
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
               (local.get $4)
               (i64.const 9223372036854775807)
              )
             )
             (i64.or
              (local.get $4)
              (i64.const -9223372036854775808)
             )
             (i64.lt_s
              (local.get $4)
              (i64.const 0)
             )
            )
           )
          )
         )
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
         (local.tee $4
          (select
           (local.tee $4
            (i64.load offset=16
             (local.get $2)
            )
           )
           (local.tee $3
            (i64.load offset=16
             (local.get $1)
            )
           )
           (i64.gt_u
            (select
             (i64.sub
              (i64.const -9223372036854775808)
              (i64.and
               (local.get $3)
               (i64.const 9223372036854775807)
              )
             )
             (i64.or
              (local.get $3)
              (i64.const -9223372036854775808)
             )
             (i64.lt_s
              (local.get $3)
              (i64.const 0)
             )
            )
            (select
             (i64.sub
              (i64.const -9223372036854775808)
              (i64.and
               (local.get $4)
               (i64.const 9223372036854775807)
              )
             )
             (i64.or
              (local.get $4)
              (i64.const -9223372036854775808)
             )
             (i64.lt_s
              (local.get $4)
              (i64.const 0)
             )
            )
           )
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $4)
        (i64.const 0)
       )
      )
     )
    )
   )
  )
  (i64.store offset=16
   (local.get $0)
   (local.get $4)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $5)
  )
  (i64.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure5signs17h65e31044434319a0E (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local.set $1
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $0)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $1
    (i64.gt_s
     (local.tee $3
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $2
          (i64.load offset=8
           (local.get $0)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $2)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $2)
        (i64.const 0)
       )
      )
     )
     (i64.const -1)
    )
   )
   (local.set $4
    (i64.or
     (local.tee $2
      (i64.load offset=16
       (local.get $0)
      )
     )
     (i64.const -9223372036854775808)
    )
   )
   (local.set $5
    (i64.sub
     (i64.const -9223372036854775808)
     (i64.and
      (local.get $2)
      (i64.const 9223372036854775807)
     )
    )
   )
   (block $label$2
    (br_if $label$2
     (i64.gt_u
      (local.get $3)
      (i64.const -9223372036854775808)
     )
    )
    (local.set $1
     (select
      (select
       (local.get $1)
       (local.tee $0
        (i32.or
         (local.get $1)
         (i32.const 2)
        )
       )
       (i64.gt_s
        (local.get $5)
        (i64.const -1)
       )
      )
      (local.get $0)
      (i64.lt_s
       (local.get $2)
       (i64.const 0)
      )
     )
    )
   )
   (local.set $1
    (select
     (i32.or
      (local.get $1)
      (i32.const 4)
     )
     (local.get $1)
     (i64.gt_u
      (select
       (local.get $5)
       (local.get $4)
       (i64.lt_s
        (local.get $2)
        (i64.const 0)
       )
      )
      (i64.const -9223372036854775808)
     )
    )
   )
  )
  (local.get $1)
 )
 (func $_ZN13hyperinterval5float12F64Enclosure3abs17haa9e4b248865700cE (param $0 i32) (param $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (i64.gt_s
       (local.tee $2
        (i64.load offset=8
         (local.get $1)
        )
       )
       (i64.const -1)
      )
     )
     (br_if $label$2
      (i64.ge_s
       (i64.add
        (local.tee $3
         (i64.and
          (local.get $2)
          (i64.const 9223372036854775807)
         )
        )
        (i64.const 9223372036854775807)
       )
       (i64.const 0)
      )
     )
     (local.set $5
      (i64.and
       (local.tee $4
        (i64.load offset=16
         (local.get $1)
        )
       )
       (i64.const 9223372036854775807)
      )
     )
     (block $label$4
      (br_if $label$4
       (i64.gt_s
        (local.get $4)
        (i64.const -1)
       )
      )
      (br_if $label$1
       (i64.lt_s
        (i64.add
         (local.get $5)
         (i64.const 9223372036854775807)
        )
        (i64.const 0)
       )
      )
     )
     (i64.store offset=8
      (local.get $0)
      (i64.const 0)
     )
     (i64.store
      (local.get $0)
      (i64.const 1)
     )
     (i64.store offset=16
      (local.get $0)
      (select
       (local.get $3)
       (local.get $4)
       (i64.gt_u
        (local.get $2)
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (local.get $5)
         )
         (i64.or
          (local.get $4)
          (i64.const -9223372036854775808)
         )
         (i64.lt_s
          (local.get $4)
          (i64.const 0)
         )
        )
       )
      )
     )
     (return)
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (return)
   )
   (i64.store
    (local.get $0)
    (i64.load
     (local.get $1)
    )
   )
   (i64.store
    (i32.add
     (local.get $0)
     (i32.const 16)
    )
    (i64.load
     (i32.add
      (local.get $1)
      (i32.const 16)
     )
    )
   )
   (i64.store
    (i32.add
     (local.get $0)
     (i32.const 8)
    )
    (i64.load
     (i32.add
      (local.get $1)
      (i32.const 8)
     )
    )
   )
   (return)
  )
  (i64.store offset=16
   (local.get $0)
   (local.get $3)
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
 (func $_ZN13hyperinterval5float12F64Enclosure9min_image17h78c30016f597e6c4E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local.set $3
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $4
    (select
     (local.tee $3
      (i64.load offset=16
       (local.get $2)
      )
     )
     (local.tee $4
      (i64.load offset=16
       (local.get $1)
      )
     )
     (i64.gt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $4)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $4)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $3)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (local.set $5
    (select
     (local.tee $3
      (i64.load offset=8
       (local.get $2)
      )
     )
     (local.tee $5
      (i64.load offset=8
       (local.get $1)
      )
     )
     (i64.gt_u
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
         (local.get $3)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (local.set $3
    (i64.const 1)
   )
  )
  (i64.store offset=16
   (local.get $0)
   (local.get $4)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $5)
  )
  (i64.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure9max_image17haf21fdd51db87492E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local.set $3
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (br $label$1)
   )
   (br_if $label$1
    (i32.eqz
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
   )
   (local.set $4
    (select
     (local.tee $3
      (i64.load offset=16
       (local.get $2)
      )
     )
     (local.tee $4
      (i64.load offset=16
       (local.get $1)
      )
     )
     (i64.lt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $4)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $4)
        (i64.const 0)
       )
      )
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.get $3)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (local.set $5
    (select
     (local.tee $3
      (i64.load offset=8
       (local.get $2)
      )
     )
     (local.tee $5
      (i64.load offset=8
       (local.get $1)
      )
     )
     (i64.lt_u
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
         (local.get $3)
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
     )
    )
   )
   (local.set $3
    (i64.const 1)
   )
  )
  (i64.store offset=16
   (local.get $0)
   (local.get $4)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $5)
  )
  (i64.store
   (local.get $0)
   (local.get $3)
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure3add17hafee6c6178700572E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
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
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (i32.and
       (i32.load
        (local.get $2)
       )
       (i32.const 1)
      )
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (br $label$1)
   )
   (local.set $4
    (i64.load offset=16
     (local.get $1)
    )
   )
   (local.set $5
    (i64.load offset=16
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (i64.load offset=8
     (local.get $1)
    )
    (i64.load offset=8
     (local.get $2)
    )
   )
   (block $label$4
    (block $label$5
     (br_if $label$5
      (i32.eq
       (i32.load8_u offset=8
        (local.get $3)
       )
       (i32.const 1)
      )
     )
     (local.set $6
      (i64.load offset=16
       (local.get $3)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $4)
      (local.get $5)
     )
     (br_if $label$4
      (i32.ne
       (i32.load8_u offset=8
        (local.get $3)
       )
       (i32.const 1)
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
   (local.set $4
    (i64.load offset=24
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
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
   (local.set $5
    (i64.load offset=16
     (local.get $3)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $3)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $4)
   )
   (block $label$7
    (br_if $label$7
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
   (block $label$8
    (br_if $label$8
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
         (local.tee $4
          (i64.load offset=16
           (local.get $3)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $4)
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
    (local.get $4)
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
 (func $_ZN13hyperinterval5float12F64Enclosure3sub17hba3830939f738ecdE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
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
    (br_if $label$2
     (i32.and
      (i32.load
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $4
     (i64.const 0)
    )
    (br $label$1)
   )
   (local.set $5
    (select
     (i64.const 0)
     (i64.xor
      (local.tee $4
       (i64.load offset=8
        (local.get $2)
       )
      )
      (i64.const -9223372036854775808)
     )
     (i64.eqz
      (local.get $4)
     )
    )
   )
   (local.set $6
    (select
     (i64.const 0)
     (i64.xor
      (local.tee $4
       (i64.load offset=16
        (local.get $2)
       )
      )
      (i64.const -9223372036854775808)
     )
     (i64.eqz
      (local.get $4)
     )
    )
   )
   (local.set $4
    (i64.const 1)
   )
  )
  (i64.store offset=24
   (local.get $3)
   (local.get $5)
  )
  (i64.store offset=16
   (local.get $3)
   (local.get $6)
  )
  (i64.store offset=8
   (local.get $3)
   (local.get $4)
  )
  (call $_ZN13hyperinterval5float12F64Enclosure3add17hafee6c6178700572E
   (local.get $0)
   (local.get $1)
   (i32.add
    (local.get $3)
    (i32.const 8)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure12corner_image17hbed69d468005db6cE (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i64)
  (local $16 i64)
  (local $17 i64)
  (local $18 i64)
  (local $19 i64)
  (local $20 i64)
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
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (br_if $label$2
      (i32.and
       (i32.load
        (local.get $2)
       )
       (i32.const 1)
      )
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (br $label$1)
   )
   (local.set $5
    (i64.load offset=16
     (local.get $1)
    )
   )
   (local.set $6
    (i64.load offset=8
     (local.get $1)
    )
   )
   (local.set $7
    (i64.load offset=16
     (local.get $2)
    )
   )
   (local.set $8
    (i64.load offset=8
     (local.get $2)
    )
   )
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (br_if $label$7
        (local.get $3)
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $6)
        (local.get $8)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $9
        (i64.load offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (i64.load offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $10
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $9)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $1
        (i32.const 1)
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $11
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.get $10)
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $10)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $10)
            (i64.const 0)
           )
          )
         )
         (local.tee $12
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.tee $9
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $9)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $9)
            (i64.const 0)
           )
          )
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $6)
        (local.get $7)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $6
        (i64.load offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (i64.load offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.eq
         (i32.load8_u offset=8
          (local.get $4)
         )
         (i32.const 1)
        )
       )
       (local.set $13
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $6)
       )
       (br_if $label$5
        (i32.eq
         (i32.load8_u offset=8
          (local.get $4)
         )
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.const 1)
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $14
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.get $13)
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $13)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $13)
            (i64.const 0)
           )
          )
         )
         (local.tee $15
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.tee $6
              (i64.load offset=16
               (local.get $4)
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
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $5)
        (local.get $8)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $8
        (i64.load offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (i64.load offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $16
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $8)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $17
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.get $16)
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $16)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $16)
            (i64.const 0)
           )
          )
         )
         (local.tee $18
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.tee $8
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $8)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $8)
            (i64.const 0)
           )
          )
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $5)
        (local.get $7)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $7
        (i64.load offset=24
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (i64.load offset=16
         (local.get $4)
        )
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (local.set $5
        (i64.load offset=16
         (local.get $4)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $4)
         (i32.const 8)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (local.get $7)
       )
       (br_if $label$5
        (i32.load8_u offset=8
         (local.get $4)
        )
       )
       (br_if $label$4
        (i64.gt_u
         (local.tee $19
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
         )
         (local.tee $20
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.tee $7
              (i64.load offset=16
               (local.get $4)
              )
             )
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $7)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $7)
            (i64.const 0)
           )
          )
         )
        )
       )
       (local.set $6
        (select
         (local.get $7)
         (local.tee $6
          (select
           (local.get $8)
           (local.tee $6
            (select
             (local.get $6)
             (local.get $9)
             (i64.lt_u
              (local.get $12)
              (local.get $15)
             )
            )
           )
           (i64.lt_u
            (select
             (i64.sub
              (i64.const -9223372036854775808)
              (i64.and
               (local.get $6)
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
            (local.get $18)
           )
          )
         )
         (i64.lt_u
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.get $6)
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
          (local.get $20)
         )
        )
       )
       (local.set $8
        (select
         (local.get $5)
         (local.tee $8
          (select
           (local.get $16)
           (local.tee $8
            (select
             (local.get $13)
             (local.get $10)
             (i64.gt_u
              (local.get $11)
              (local.get $14)
             )
            )
           )
           (i64.gt_u
            (select
             (i64.sub
              (i64.const -9223372036854775808)
              (i64.and
               (local.get $8)
               (i64.const 9223372036854775807)
              )
             )
             (i64.or
              (local.get $8)
              (i64.const -9223372036854775808)
             )
             (i64.lt_s
              (local.get $8)
              (i64.const 0)
             )
            )
            (local.get $17)
           )
          )
         )
         (i64.gt_u
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.get $8)
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $8)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $8)
            (i64.const 0)
           )
          )
          (local.get $19)
         )
        )
       )
       (br $label$6)
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $6)
       (local.get $8)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $9
       (i64.load offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (i64.load offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $10
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $9)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $1
       (i32.const 1)
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $11
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.get $10)
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $10)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $10)
           (i64.const 0)
          )
         )
        )
        (local.tee $12
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.tee $9
             (i64.load offset=16
              (local.get $4)
             )
            )
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $9)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $9)
           (i64.const 0)
          )
         )
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $6)
       (local.get $7)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $6
       (i64.load offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (i64.load offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $13
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $6)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $14
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.get $13)
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $13)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $13)
           (i64.const 0)
          )
         )
        )
        (local.tee $15
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.tee $6
             (i64.load offset=16
              (local.get $4)
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
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $5)
       (local.get $8)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $8
       (i64.load offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (i64.load offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $16
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $8)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $17
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.get $16)
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $16)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $16)
           (i64.const 0)
          )
         )
        )
        (local.tee $18
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.tee $8
             (i64.load offset=16
              (local.get $4)
             )
            )
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $8)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $8)
           (i64.const 0)
          )
         )
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $5)
       (local.get $7)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $7
       (i64.load offset=24
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (i64.load offset=16
        (local.get $4)
       )
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (local.set $5
       (i64.load offset=16
        (local.get $4)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $4)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $7)
      )
      (br_if $label$5
       (i32.load8_u offset=8
        (local.get $4)
       )
      )
      (br_if $label$4
       (i64.gt_u
        (local.tee $19
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
        )
        (local.tee $20
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.tee $7
             (i64.load offset=16
              (local.get $4)
             )
            )
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $7)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $7)
           (i64.const 0)
          )
         )
        )
       )
      )
      (local.set $6
       (select
        (local.get $7)
        (local.tee $6
         (select
          (local.get $8)
          (local.tee $6
           (select
            (local.get $6)
            (local.get $9)
            (i64.lt_u
             (local.get $12)
             (local.get $15)
            )
           )
          )
          (i64.lt_u
           (select
            (i64.sub
             (i64.const -9223372036854775808)
             (i64.and
              (local.get $6)
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
           (local.get $18)
          )
         )
        )
        (i64.lt_u
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.get $6)
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
         (local.get $20)
        )
       )
      )
      (local.set $8
       (select
        (local.get $5)
        (local.tee $8
         (select
          (local.get $16)
          (local.tee $8
           (select
            (local.get $13)
            (local.get $10)
            (i64.gt_u
             (local.get $11)
             (local.get $14)
            )
           )
          )
          (i64.gt_u
           (select
            (i64.sub
             (i64.const -9223372036854775808)
             (i64.and
              (local.get $8)
              (i64.const 9223372036854775807)
             )
            )
            (i64.or
             (local.get $8)
             (i64.const -9223372036854775808)
            )
            (i64.lt_s
             (local.get $8)
             (i64.const 0)
            )
           )
           (local.get $17)
          )
         )
        )
        (i64.gt_u
         (select
          (i64.sub
           (i64.const -9223372036854775808)
           (i64.and
            (local.get $8)
            (i64.const 9223372036854775807)
           )
          )
          (i64.or
           (local.get $8)
           (i64.const -9223372036854775808)
          )
          (i64.lt_s
           (local.get $8)
           (i64.const 0)
          )
         )
         (local.get $19)
        )
       )
      )
     )
     (i64.store offset=16
      (local.get $0)
      (local.get $6)
     )
     (i64.store offset=8
      (local.get $0)
      (local.get $8)
     )
     (i64.store
      (local.get $0)
      (i64.const 1)
     )
     (br $label$1)
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $4)
     )
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
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure3mul17h97ef6699d52c426bE (param $0 i32) (param $1 i32) (param $2 i32)
  (call $_ZN13hyperinterval5float12F64Enclosure12corner_image17hbed69d468005db6cE
   (local.get $0)
   (local.get $1)
   (local.get $2)
   (i32.const 0)
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure3div17heb3b64f34a7eebcaE (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i64)
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $2)
       )
       (i32.const 1)
      )
     )
    )
    (br_if $label$2
     (i64.gt_u
      (select
       (i64.sub
        (i64.const -9223372036854775808)
        (i64.and
         (local.tee $3
          (i64.load offset=8
           (local.get $2)
          )
         )
         (i64.const 9223372036854775807)
        )
       )
       (i64.or
        (local.get $3)
        (i64.const -9223372036854775808)
       )
       (i64.lt_s
        (local.get $3)
        (i64.const 0)
       )
      )
      (i64.const -9223372036854775808)
     )
    )
    (br_if $label$1
     (i64.gt_s
      (local.tee $3
       (i64.load offset=16
        (local.get $2)
       )
      )
      (i64.const -1)
     )
    )
    (br_if $label$1
     (i64.gt_s
      (i64.add
       (i64.and
        (local.get $3)
        (i64.const 9223372036854775807)
       )
       (i64.const 9223372036854775807)
      )
      (i64.const -1)
     )
    )
   )
   (call $_ZN13hyperinterval5float12F64Enclosure12corner_image17hbed69d468005db6cE
    (local.get $0)
    (local.get $1)
    (local.get $2)
    (i32.const 1)
   )
   (return)
  )
  (i64.store
   (local.get $0)
   (i64.const 2)
  )
  (i32.store8 offset=8
   (local.get $0)
   (i32.const 6)
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure10reciprocal17h6a7ba1060183a296E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
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
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i64.eqz
         (i64.load
          (local.get $1)
         )
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $2)
         (i32.const 32)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (i64.const 4607182418800017408)
       )
       (block $label$6
        (br_if $label$6
         (i32.ne
          (i32.load8_u offset=32
           (local.get $2)
          )
          (i32.const 1)
         )
        )
        (local.set $3
         (i32.load8_u offset=33
          (local.get $2)
         )
        )
        (br $label$3)
       )
       (local.set $4
        (i64.load offset=40
         (local.get $2)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
        (i32.add
         (local.get $2)
         (i32.const 32)
        )
        (i64.const -9223372036854775808)
        (i64.const 9218868437227405312)
        (i64.const 4607182418800017408)
       )
       (br_if $label$4
        (i32.ne
         (i32.load8_u offset=32
          (local.get $2)
         )
         (i32.const 1)
        )
       )
       (local.set $3
        (i32.load8_u offset=33
         (local.get $2)
        )
       )
       (br $label$3)
      )
      (i64.store
       (local.get $0)
       (i64.const 0)
      )
      (br $label$1)
     )
     (local.set $3
      (i32.const 1)
     )
     (br_if $label$2
      (i64.le_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.get $4)
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $4)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $4)
         (i64.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $5
           (i64.load offset=40
            (local.get $2)
           )
          )
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
      )
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (local.get $3)
    )
    (br $label$1)
   )
   (i64.store8 offset=16
    (local.get $2)
    (local.get $4)
   )
   (i64.store8
    (i32.add
     (local.get $2)
     (i32.const 23)
    )
    (i64.shr_u
     (local.get $4)
     (i64.const 56)
    )
   )
   (i64.store16 align=1
    (i32.add
     (local.get $2)
     (i32.const 21)
    )
    (i64.shr_u
     (local.get $4)
     (i64.const 40)
    )
   )
   (i64.store offset=24
    (local.get $2)
    (local.get $5)
   )
   (i64.store offset=8
    (local.get $2)
    (i64.const 1)
   )
   (i64.store32 offset=17 align=1
    (local.get $2)
    (i64.shr_u
     (local.get $4)
     (i64.const 8)
    )
   )
   (block $label$7
    (block $label$8
     (br_if $label$8
      (i64.gt_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $4
           (i64.load offset=8
            (local.get $1)
           )
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $4)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $4)
         (i64.const 0)
        )
       )
       (i64.const -9223372036854775808)
      )
     )
     (br_if $label$7
      (i64.gt_s
       (local.tee $4
        (i64.load offset=16
         (local.get $1)
        )
       )
       (i64.const -1)
      )
     )
     (br_if $label$7
      (i64.gt_s
       (i64.add
        (i64.and
         (local.get $4)
         (i64.const 9223372036854775807)
        )
        (i64.const 9223372036854775807)
       )
       (i64.const -1)
      )
     )
    )
    (call $_ZN13hyperinterval5float12F64Enclosure12corner_image17hbed69d468005db6cE
     (local.get $0)
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (local.get $1)
     (i32.const 1)
    )
    (br $label$1)
   )
   (i64.store
    (local.get $0)
    (i64.const 2)
   )
   (i32.store8 offset=8
    (local.get $0)
    (i32.const 6)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 48)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure4sqrt17h47c58966d8228387E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
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
      (br_if $label$4
       (i32.eqz
        (i32.and
         (i32.load
          (local.get $1)
         )
         (i32.const 1)
        )
       )
      )
      (local.set $3
       (i64.load offset=8
        (local.get $1)
       )
      )
      (block $label$5
       (br_if $label$5
        (i64.gt_s
         (local.tee $4
          (i64.load offset=16
           (local.get $1)
          )
         )
         (i64.const -1)
        )
       )
       (br_if $label$3
        (i64.lt_s
         (i64.add
          (i64.and
           (local.get $4)
           (i64.const 9223372036854775807)
          )
          (i64.const 9223372036854775807)
         )
         (i64.const 0)
        )
       )
      )
      (call $_ZN13hyperinterval4ieee6Format4sqrt17h2acdb3c399d22468E
       (i32.add
        (local.get $2)
        (i32.const 8)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (i64.and
        (i64.shr_s
         (local.tee $5
          (select
           (i64.sub
            (i64.const -9223372036854775808)
            (i64.and
             (local.get $3)
             (i64.const 9223372036854775807)
            )
           )
           (i64.or
            (local.get $3)
            (i64.const -9223372036854775808)
           )
           (i64.lt_s
            (local.get $3)
            (i64.const 0)
           )
          )
         )
         (i64.const 63)
        )
        (local.get $3)
       )
      )
      (br_if $label$2
       (i32.eqz
        (i32.load8_u offset=8
         (local.get $2)
        )
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $2)
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
     (i32.store8 offset=24
      (local.get $0)
      (i32.const 0)
     )
     (i64.store
      (local.get $0)
      (i64.const 0)
     )
     (br $label$1)
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (i32.const 7)
    )
    (br $label$1)
   )
   (local.set $6
    (i64.load offset=16
     (local.get $2)
    )
   )
   (block $label$6
    (br_if $label$6
     (i64.eq
      (local.get $3)
      (local.get $4)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format4sqrt17h2acdb3c399d22468E
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (local.get $4)
    )
    (br_if $label$6
     (i32.ne
      (i32.load8_u offset=8
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=9
      (local.get $2)
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
   (local.set $4
    (i64.load offset=24
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $6)
   )
   (block $label$7
    (block $label$8
     (block $label$9
      (br_if $label$9
       (i32.ne
        (i32.load8_u offset=8
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $2)
       )
      )
      (br $label$8)
     )
     (local.set $3
      (i64.load offset=16
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $2)
       (i32.const 8)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $4)
     )
     (block $label$10
      (br_if $label$10
       (i32.ne
        (i32.load8_u offset=8
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=9
        (local.get $2)
       )
      )
      (br $label$8)
     )
     (local.set $1
      (i32.const 1)
     )
     (br_if $label$7
      (i64.le_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.get $3)
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $3)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $3)
         (i64.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $4
           (i64.load offset=16
            (local.get $2)
           )
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $4)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $4)
         (i64.const 0)
        )
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
     (local.get $1)
    )
    (br $label$1)
   )
   (i64.store offset=16
    (local.get $0)
    (local.get $4)
   )
   (i64.store8 offset=8
    (local.get $0)
    (local.get $3)
   )
   (i64.store
    (local.get $0)
    (i64.const 1)
   )
   (i64.store8
    (i32.add
     (local.get $0)
     (i32.const 15)
    )
    (i64.shr_u
     (local.get $3)
     (i64.const 56)
    )
   )
   (i64.store16 align=1
    (i32.add
     (local.get $0)
     (i32.const 13)
    )
    (i64.shr_u
     (local.get $3)
     (i64.const 40)
    )
   )
   (i64.store32 offset=9 align=1
    (local.get $0)
    (i64.shr_u
     (local.get $3)
     (i64.const 8)
    )
   )
   (i32.store8 offset=24
    (local.get $0)
    (i64.gt_s
     (local.get $5)
     (i64.const -1)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure6square17ha5b01fb3cba9bd5cE (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (global.set $__stack_pointer
   (local.tee $2
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (br_if $label$3
      (i32.eqz
       (i32.and
        (i32.load
         (local.get $1)
        )
        (i32.const 1)
       )
      )
     )
     (local.set $3
      (i64.load offset=16
       (local.get $1)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
      (i32.add
       (local.get $2)
       (i32.const 72)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.tee $4
       (i64.load offset=8
        (local.get $1)
       )
      )
      (local.get $4)
     )
     (br_if $label$2
      (i32.eqz
       (i32.load8_u offset=72
        (local.get $2)
       )
      )
     )
     (local.set $1
      (i32.load8_u offset=73
       (local.get $2)
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
    (i64.load offset=88
     (local.get $2)
    )
   )
   (local.set $6
    (i64.load offset=80
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
    (i32.add
     (local.get $2)
     (i32.const 72)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $3)
    (local.get $3)
   )
   (block $label$4
    (br_if $label$4
     (i32.ne
      (i32.load8_u offset=72
       (local.get $2)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=73
      (local.get $2)
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
   (local.set $7
    (i64.load offset=88
     (local.get $2)
    )
   )
   (local.set $8
    (i64.load offset=80
     (local.get $2)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 72)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $6)
   )
   (block $label$5
    (block $label$6
     (block $label$7
      (br_if $label$7
       (i32.ne
        (i32.load8_u offset=72
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=73
        (local.get $2)
       )
      )
      (br $label$6)
     )
     (local.set $6
      (i64.load offset=80
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $2)
       (i32.const 72)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $5)
     )
     (local.set $1
      (i32.const 1)
     )
     (block $label$8
      (br_if $label$8
       (i32.ne
        (i32.load8_u offset=72
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=73
        (local.get $2)
       )
      )
      (br $label$6)
     )
     (br_if $label$5
      (i64.le_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.get $6)
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
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $5
           (i64.load offset=80
            (local.get $2)
           )
          )
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
      )
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
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $2)
     (i32.const 72)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $8)
   )
   (block $label$9
    (block $label$10
     (block $label$11
      (br_if $label$11
       (i32.ne
        (i32.load8_u offset=72
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=73
        (local.get $2)
       )
      )
      (br $label$10)
     )
     (local.set $8
      (i64.load offset=80
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $2)
       (i32.const 72)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $7)
     )
     (block $label$12
      (br_if $label$12
       (i32.ne
        (i32.load8_u offset=72
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=73
        (local.get $2)
       )
      )
      (br $label$10)
     )
     (local.set $1
      (i32.const 1)
     )
     (br_if $label$9
      (i64.le_u
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.get $8)
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $8)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $8)
         (i64.const 0)
        )
       )
       (select
        (i64.sub
         (i64.const -9223372036854775808)
         (i64.and
          (local.tee $7
           (i64.load offset=80
            (local.get $2)
           )
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $7)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $7)
         (i64.const 0)
        )
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
     (local.get $1)
    )
    (br $label$1)
   )
   (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17h48d866395682d7a9E
    (i32.add
     (local.get $2)
     (i32.const 72)
    )
    (local.get $6)
    (local.get $5)
    (local.get $8)
    (local.get $7)
   )
   (i64.store
    (local.get $2)
    (i64.const 1)
   )
   (i64.store offset=16
    (local.get $2)
    (i64.load offset=80
     (local.get $2)
    )
   )
   (i64.store offset=8
    (local.get $2)
    (i64.load offset=72
     (local.get $2)
    )
   )
   (block $label$13
    (br_if $label$13
     (i32.eqz
      (i32.and
       (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$5signs17h6acfd502fe9b132dE
        (local.get $4)
        (local.get $3)
        (i64.const 0)
       )
       (i32.const 250)
      )
     )
    )
    (call $_ZN13hyperinterval5float12F64Enclosure9from_bits17hca7e1935cbcb20acE
     (i32.add
      (local.get $2)
      (i32.const 72)
     )
     (i64.const 0)
     (i64.const 0)
    )
    (local.set $1
     (i32.load8_u offset=80
      (local.get $2)
     )
    )
    (block $label$14
     (br_if $label$14
      (i64.ne
       (local.tee $3
        (i64.load offset=72
         (local.get $2)
        )
       )
       (i64.const 2)
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
    (i64.store align=1
     (i32.add
      (i32.add
       (local.get $2)
       (i32.const 48)
      )
      (i32.const 16)
     )
     (i64.load align=1
      (i32.add
       (i32.add
        (local.get $2)
        (i32.const 72)
       )
       (i32.const 16)
      )
     )
    )
    (i64.store offset=57 align=1
     (local.get $2)
     (i64.load offset=81 align=1
      (local.get $2)
     )
    )
    (i32.store8 offset=56
     (local.get $2)
     (local.get $1)
    )
    (i64.store offset=48
     (local.get $2)
     (local.get $3)
    )
    (call $_ZN13hyperinterval5float12F64Enclosure4hull17h4455536ea286b1d9E
     (i32.add
      (local.get $2)
      (i32.const 24)
     )
     (local.get $2)
     (i32.add
      (local.get $2)
      (i32.const 48)
     )
    )
    (i64.store
     (i32.add
      (local.get $2)
      (i32.const 16)
     )
     (i64.load
      (i32.add
       (i32.add
        (local.get $2)
        (i32.const 24)
       )
       (i32.const 16)
      )
     )
    )
    (i64.store
     (i32.add
      (local.get $2)
      (i32.const 8)
     )
     (i64.load
      (i32.add
       (i32.add
        (local.get $2)
        (i32.const 24)
       )
       (i32.const 8)
      )
     )
    )
    (i64.store
     (local.get $2)
     (i64.load offset=24
      (local.get $2)
     )
    )
   )
   (i64.store
    (local.get $0)
    (i64.load
     (local.get $2)
    )
   )
   (i64.store
    (i32.add
     (local.get $0)
     (i32.const 16)
    )
    (i64.load
     (i32.add
      (local.get $2)
      (i32.const 16)
     )
    )
   )
   (i64.store
    (i32.add
     (local.get $0)
     (i32.const 8)
    )
    (i64.load
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
    (i32.const 96)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure11checked_pow17h4ecbe96091baf326E (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 96)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (local.get $2)
      (i32.const 2)
     )
    )
    (call $_ZN13hyperinterval5float12F64Enclosure6square17ha5b01fb3cba9bd5cE
     (local.get $0)
     (local.get $1)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (br $label$1)
   )
   (local.set $4
    (i64.load offset=16
     (local.get $1)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format5power17h301e1115ffe557c4E
    (i32.add
     (local.get $3)
     (i32.const 72)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.tee $5
     (i64.load offset=8
      (local.get $1)
     )
    )
    (local.get $2)
   )
   (block $label$4
    (br_if $label$4
     (i32.load8_u offset=72
      (local.get $3)
     )
    )
    (local.set $6
     (i64.load offset=88
      (local.get $3)
     )
    )
    (local.set $7
     (i64.load offset=80
      (local.get $3)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format5power17h301e1115ffe557c4E
     (i32.add
      (local.get $3)
      (i32.const 72)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (local.get $4)
     (local.get $2)
    )
    (block $label$5
     (br_if $label$5
      (i32.ne
       (i32.load8_u offset=72
        (local.get $3)
       )
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.load8_u offset=73
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
    (local.set $8
     (i64.load offset=88
      (local.get $3)
     )
    )
    (local.set $9
     (i64.load offset=80
      (local.get $3)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $3)
      (i32.const 72)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (local.get $7)
    )
    (block $label$6
     (block $label$7
      (block $label$8
       (br_if $label$8
        (i32.ne
         (i32.load8_u offset=72
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.load8_u offset=73
         (local.get $3)
        )
       )
       (br $label$7)
      )
      (local.set $7
       (i64.load offset=80
        (local.get $3)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $3)
        (i32.const 72)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $6)
      )
      (local.set $1
       (i32.const 1)
      )
      (block $label$9
       (br_if $label$9
        (i32.ne
         (i32.load8_u offset=72
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.load8_u offset=73
         (local.get $3)
        )
       )
       (br $label$7)
      )
      (br_if $label$6
       (i64.le_u
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (i64.and
           (local.get $7)
           (i64.const 9223372036854775807)
          )
         )
         (i64.or
          (local.get $7)
          (i64.const -9223372036854775808)
         )
         (i64.lt_s
          (local.get $7)
          (i64.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (i64.and
           (local.tee $6
            (i64.load offset=80
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
    (i64.store8 offset=56
     (local.get $3)
     (local.get $7)
    )
    (i64.store8
     (i32.add
      (local.get $3)
      (i32.const 63)
     )
     (i64.shr_u
      (local.get $7)
      (i64.const 56)
     )
    )
    (i64.store16 align=1
     (i32.add
      (local.get $3)
      (i32.const 61)
     )
     (i64.shr_u
      (local.get $7)
      (i64.const 40)
     )
    )
    (i64.store offset=64
     (local.get $3)
     (local.get $6)
    )
    (i64.store offset=48
     (local.get $3)
     (i64.const 1)
    )
    (i64.store32 offset=57 align=1
     (local.get $3)
     (i64.shr_u
      (local.get $7)
      (i64.const 8)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (i32.add
      (local.get $3)
      (i32.const 24)
     )
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (local.get $9)
    )
    (block $label$10
     (block $label$11
      (block $label$12
       (br_if $label$12
        (i32.ne
         (i32.load8_u offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.load8_u offset=25
         (local.get $3)
        )
       )
       (br $label$11)
      )
      (local.set $7
       (i64.load offset=32
        (local.get $3)
       )
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $3)
        (i32.const 24)
       )
       (i64.const -9223372036854775808)
       (i64.const 9218868437227405312)
       (local.get $8)
      )
      (block $label$13
       (br_if $label$13
        (i32.ne
         (i32.load8_u offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.load8_u offset=25
         (local.get $3)
        )
       )
       (br $label$11)
      )
      (local.set $1
       (i32.const 1)
      )
      (br_if $label$10
       (i64.le_u
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (i64.and
           (local.get $7)
           (i64.const 9223372036854775807)
          )
         )
         (i64.or
          (local.get $7)
          (i64.const -9223372036854775808)
         )
         (i64.lt_s
          (local.get $7)
          (i64.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (i64.and
           (local.tee $6
            (i64.load offset=32
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
    (i64.store8 offset=80
     (local.get $3)
     (local.get $7)
    )
    (i64.store8
     (i32.add
      (local.get $3)
      (i32.const 87)
     )
     (i64.shr_u
      (local.get $7)
      (i64.const 56)
     )
    )
    (i64.store16 align=1
     (i32.add
      (local.get $3)
      (i32.const 85)
     )
     (i64.shr_u
      (local.get $7)
      (i64.const 40)
     )
    )
    (i64.store offset=88
     (local.get $3)
     (local.get $6)
    )
    (i64.store offset=72
     (local.get $3)
     (i64.const 1)
    )
    (i64.store32 offset=81 align=1
     (local.get $3)
     (i64.shr_u
      (local.get $7)
      (i64.const 8)
     )
    )
    (call $_ZN13hyperinterval5float12F64Enclosure4hull17h4455536ea286b1d9E
     (local.get $3)
     (i32.add
      (local.get $3)
      (i32.const 48)
     )
     (i32.add
      (local.get $3)
      (i32.const 72)
     )
    )
    (block $label$14
     (br_if $label$14
      (i32.eqz
       (local.get $2)
      )
     )
     (br_if $label$14
      (i32.and
       (local.get $2)
       (i32.const 1)
      )
     )
     (br_if $label$14
      (i32.eqz
       (i32.and
        (call $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$5signs17h6acfd502fe9b132dE
         (local.get $5)
         (local.get $4)
         (i64.const 0)
        )
        (i32.const 250)
       )
      )
     )
     (call $_ZN13hyperinterval5float12F64Enclosure9from_bits17hca7e1935cbcb20acE
      (i32.add
       (local.get $3)
       (i32.const 72)
      )
      (i64.const 0)
      (i64.const 0)
     )
     (local.set $1
      (i32.load8_u offset=80
       (local.get $3)
      )
     )
     (block $label$15
      (br_if $label$15
       (i64.ne
        (local.tee $4
         (i64.load offset=72
          (local.get $3)
         )
        )
        (i64.const 2)
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
     (i64.store align=1
      (i32.add
       (i32.add
        (local.get $3)
        (i32.const 48)
       )
       (i32.const 16)
      )
      (i64.load align=1
       (i32.add
        (i32.add
         (local.get $3)
         (i32.const 72)
        )
        (i32.const 16)
       )
      )
     )
     (i64.store offset=57 align=1
      (local.get $3)
      (i64.load offset=81 align=1
       (local.get $3)
      )
     )
     (i32.store8 offset=56
      (local.get $3)
      (local.get $1)
     )
     (i64.store offset=48
      (local.get $3)
      (local.get $4)
     )
     (call $_ZN13hyperinterval5float12F64Enclosure4hull17h4455536ea286b1d9E
      (i32.add
       (local.get $3)
       (i32.const 24)
      )
      (local.get $3)
      (i32.add
       (local.get $3)
       (i32.const 48)
      )
     )
     (i64.store
      (i32.add
       (local.get $3)
       (i32.const 16)
      )
      (i64.load
       (i32.add
        (i32.add
         (local.get $3)
         (i32.const 24)
        )
        (i32.const 16)
       )
      )
     )
     (i64.store
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
      (i64.load
       (i32.add
        (i32.add
         (local.get $3)
         (i32.const 24)
        )
        (i32.const 8)
       )
      )
     )
     (i64.store
      (local.get $3)
      (i64.load offset=24
       (local.get $3)
      )
     )
    )
    (i64.store
     (local.get $0)
     (i64.load
      (local.get $3)
     )
    )
    (i64.store
     (i32.add
      (local.get $0)
      (i32.const 16)
     )
     (i64.load
      (i32.add
       (local.get $3)
       (i32.const 16)
      )
     )
    )
    (i64.store
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
     (i64.load
      (i32.add
       (local.get $3)
       (i32.const 8)
      )
     )
    )
    (br $label$1)
   )
   (local.set $1
    (i32.load8_u offset=73
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
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 96)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure6affine17h8919e6fdf0383835E (param $0 i32) (param $1 i32) (param $2 f64) (param $3 f64)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 80)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
   (i32.add
    (local.get $4)
    (i32.const 56)
   )
   (i64.const -9223372036854775808)
   (i64.const 9218868437227405312)
   (i64.reinterpret_f64
    (local.get $2)
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.ne
      (i32.load8_u offset=56
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=57
      (local.get $4)
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
    (i64.load offset=64
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $4)
     (i32.const 56)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (i64.reinterpret_f64
     (local.get $3)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.ne
      (i32.load8_u offset=56
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=57
      (local.get $4)
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
   (block $label$4
    (br_if $label$4
     (i32.and
      (i32.load
       (local.get $1)
      )
      (i32.const 1)
     )
    )
    (i64.store
     (local.get $0)
     (i64.const 0)
    )
    (br $label$1)
   )
   (local.set $6
    (i64.load offset=16
     (local.get $1)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6affine17h863b42e14750a82bE
    (i32.add
     (local.get $4)
     (i32.const 56)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (i64.load offset=8
     (local.get $1)
    )
    (local.get $5)
    (local.tee $7
     (i64.load offset=64
      (local.get $4)
     )
    )
   )
   (block $label$5
    (br_if $label$5
     (i32.ne
      (i32.load8_u offset=56
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=57
      (local.get $4)
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
   (local.set $8
    (i64.load offset=72
     (local.get $4)
    )
   )
   (local.set $9
    (i64.load offset=64
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6affine17h863b42e14750a82bE
    (i32.add
     (local.get $4)
     (i32.const 56)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $6)
    (local.get $5)
    (local.get $7)
   )
   (block $label$6
    (br_if $label$6
     (i32.ne
      (i32.load8_u offset=56
       (local.get $4)
      )
      (i32.const 1)
     )
    )
    (local.set $1
     (i32.load8_u offset=57
      (local.get $4)
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
    (i64.load offset=72
     (local.get $4)
    )
   )
   (local.set $7
    (i64.load offset=64
     (local.get $4)
    )
   )
   (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
    (i32.add
     (local.get $4)
     (i32.const 56)
    )
    (i64.const -9223372036854775808)
    (i64.const 9218868437227405312)
    (local.get $9)
   )
   (block $label$7
    (block $label$8
     (block $label$9
      (br_if $label$9
       (i32.ne
        (i32.load8_u offset=56
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=57
        (local.get $4)
       )
      )
      (br $label$8)
     )
     (local.set $5
      (i64.load offset=64
       (local.get $4)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $4)
       (i32.const 56)
      )
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $8)
     )
     (local.set $1
      (i32.const 1)
     )
     (block $label$10
      (br_if $label$10
       (i32.ne
        (i32.load8_u offset=56
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=57
        (local.get $4)
       )
      )
      (br $label$8)
     )
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
          (local.tee $9
           (i64.load offset=64
            (local.get $4)
           )
          )
          (i64.const 9223372036854775807)
         )
        )
        (i64.or
         (local.get $9)
         (i64.const -9223372036854775808)
        )
        (i64.lt_s
         (local.get $9)
         (i64.const 0)
        )
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
     (local.get $1)
    )
    (br $label$1)
   )
   (i64.store8 offset=16
    (local.get $4)
    (local.get $5)
   )
   (i64.store8
    (i32.add
     (local.get $4)
     (i32.const 23)
    )
    (i64.shr_u
     (local.get $5)
     (i64.const 56)
    )
   )
   (i64.store16 align=1
    (i32.add
     (local.get $4)
     (i32.const 21)
    )
    (i64.shr_u
     (local.get $5)
     (i64.const 40)
    )
   )
   (i64.store offset=24
    (local.get $4)
    (local.get $9)
   )
   (i64.store offset=8
    (local.get $4)
    (i64.const 1)
   )
   (i64.store32 offset=17 align=1
    (local.get $4)
    (i64.shr_u
     (local.get $5)
     (i64.const 8)
    )
   )
   (call $_ZN13hyperinterval5float12F64Enclosure9from_bits17hca7e1935cbcb20acE
    (i32.add
     (local.get $4)
     (i32.const 56)
    )
    (local.get $7)
    (local.get $6)
   )
   (local.set $1
    (i32.load8_u offset=64
     (local.get $4)
    )
   )
   (block $label$11
    (br_if $label$11
     (i64.ne
      (local.tee $5
       (i64.load offset=56
        (local.get $4)
       )
      )
      (i64.const 2)
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
   (i64.store align=1
    (i32.add
     (i32.add
      (local.get $4)
      (i32.const 32)
     )
     (i32.const 16)
    )
    (i64.load align=1
     (i32.add
      (i32.add
       (local.get $4)
       (i32.const 56)
      )
      (i32.const 16)
     )
    )
   )
   (i64.store offset=41 align=1
    (local.get $4)
    (i64.load offset=65 align=1
     (local.get $4)
    )
   )
   (i32.store8 offset=40
    (local.get $4)
    (local.get $1)
   )
   (i64.store offset=32
    (local.get $4)
    (local.get $5)
   )
   (call $_ZN13hyperinterval5float12F64Enclosure4hull17h4455536ea286b1d9E
    (local.get $0)
    (i32.add
     (local.get $4)
     (i32.const 8)
    )
    (i32.add
     (local.get $4)
     (i32.const 32)
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 80)
   )
  )
 )
 (func $_ZN13hyperinterval5float12F64Enclosure8expanded17hed40722528ba7d37E (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i64)
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
     (i32.eqz
      (i32.and
       (i32.load
        (local.get $1)
       )
       (i32.const 1)
      )
     )
    )
    (local.set $3
     (i64.load offset=16
      (local.get $1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
     (local.get $2)
     (i64.const -9223372036854775808)
     (i64.const 9218868437227405312)
     (i64.add
      (local.tee $4
       (select
        (i64.const 0)
        (i64.xor
         (local.tee $4
          (i64.load offset=8
           (local.get $1)
          )
         )
         (i64.const -9223372036854775808)
        )
        (i64.eqz
         (local.get $4)
        )
       )
      )
      (select
       (i64.const 1)
       (i64.const -1)
       (i64.gt_s
        (local.get $4)
        (i64.const -1)
       )
      )
     )
    )
    (block $label$3
     (br_if $label$3
      (i32.load8_u
       (local.get $2)
      )
     )
     (local.set $4
      (i64.load offset=8
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (local.get $2)
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (i64.add
       (local.get $3)
       (select
        (i64.const 1)
        (i64.const -1)
        (i64.gt_s
         (local.get $3)
         (i64.const -1)
        )
       )
      )
     )
     (br_if $label$3
      (i32.eq
       (i32.load8_u
        (local.get $2)
       )
       (i32.const 1)
      )
     )
     (local.set $3
      (i64.load offset=8
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (local.get $2)
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (select
       (i64.const 0)
       (i64.xor
        (local.get $4)
        (i64.const -9223372036854775808)
       )
       (i64.eqz
        (local.get $4)
       )
      )
     )
     (block $label$4
      (br_if $label$4
       (i32.ne
        (i32.load8_u
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=1
        (local.get $2)
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
     (local.set $4
      (i64.load offset=8
       (local.get $2)
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (local.get $2)
      (i64.const -9223372036854775808)
      (i64.const 9218868437227405312)
      (local.get $3)
     )
     (block $label$5
      (br_if $label$5
       (i32.ne
        (i32.load8_u
         (local.get $2)
        )
        (i32.const 1)
       )
      )
      (local.set $1
       (i32.load8_u offset=1
        (local.get $2)
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
     (block $label$6
      (br_if $label$6
       (i64.le_u
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (i64.and
           (local.get $4)
           (i64.const 9223372036854775807)
          )
         )
         (i64.or
          (local.get $4)
          (i64.const -9223372036854775808)
         )
         (i64.lt_s
          (local.get $4)
          (i64.const 0)
         )
        )
        (select
         (i64.sub
          (i64.const -9223372036854775808)
          (i64.and
           (local.tee $3
            (i64.load offset=8
             (local.get $2)
            )
           )
           (i64.const 9223372036854775807)
          )
         )
         (i64.or
          (local.get $3)
          (i64.const -9223372036854775808)
         )
         (i64.lt_s
          (local.get $3)
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
      (local.get $3)
     )
     (i64.store offset=8
      (local.get $0)
      (local.get $4)
     )
     (i64.store
      (local.get $0)
      (i64.const 1)
     )
     (br $label$1)
    )
    (i64.store
     (local.get $0)
     (i64.const 2)
    )
    (i32.store8 offset=8
     (local.get $0)
     (i32.const 5)
    )
    (br $label$1)
   )
   (i64.store
    (local.get $0)
    (i64.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $2)
    (i32.const 16)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64)
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
   (i32.const 1049452)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval4ieee6Format13compare_width17h1b810d66deee7e0aE (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64) (param $5 i64) (result i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i32)
  (local $16 i64)
  (local $17 i64)
  (global.set $__stack_pointer
   (local.tee $6
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 112)
    )
   )
  )
  (i64.store
   (i32.add
    (local.get $6)
    (i32.const 32)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (local.get $6)
    (i32.const 24)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (local.get $6)
    (i32.const 16)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (local.get $6)
    (i32.const 8)
   )
   (i64.const 0)
  )
  (i64.store
   (local.get $6)
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (i32.add
     (local.get $6)
     (i32.const 40)
    )
    (i32.const 32)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (i32.add
     (local.get $6)
     (i32.const 40)
    )
    (i32.const 24)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (i32.add
     (local.get $6)
     (i32.const 40)
    )
    (i32.const 16)
   )
   (i64.const 0)
  )
  (i64.store
   (i32.add
    (i32.add
     (local.get $6)
     (i32.const 40)
    )
    (i32.const 8)
   )
   (i64.const 0)
  )
  (i64.store offset=40
   (local.get $6)
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i64.gt_u
           (local.tee $7
            (i64.ctz
             (local.get $1)
            )
           )
           (i64.const 63)
          )
         )
         (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
          (i32.add
           (local.get $6)
           (i32.const 80)
          )
          (local.get $0)
          (local.get $1)
          (local.get $3)
         )
         (br_if $label$6
          (i32.xor
           (i32.gt_s
            (local.tee $8
             (i32.wrap_i64
              (i64.shr_u
               (i64.shr_u
                (local.get $1)
                (local.get $7)
               )
               (i64.const 1)
              )
             )
            )
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $8
             (i32.sub
              (i32.const 1)
              (local.get $8)
             )
            )
            (i32.const 1)
           )
          )
         )
         (br_if $label$5
          (i32.xor
           (i32.gt_s
            (local.tee $9
             (i32.wrap_i64
              (local.get $7)
             )
            )
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $10
             (i32.sub
              (local.get $8)
              (local.get $9)
             )
            )
            (local.get $8)
           )
          )
         )
         (br_if $label$2
          (i32.xor
           (i32.gt_s
            (local.get $10)
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $11
             (i32.sub
              (local.tee $8
               (i32.load offset=96
                (local.get $6)
               )
              )
              (local.get $10)
             )
            )
            (local.get $8)
           )
          )
         )
         (local.set $12
          (select
           (i32.add
            (local.get $6)
            (i32.const 40)
           )
           (local.get $6)
           (i32.load8_u offset=100
            (local.get $6)
           )
          )
         )
         (local.set $3
          (i64.load offset=88
           (local.get $6)
          )
         )
         (local.set $13
          (i32.shr_u
           (local.get $11)
           (i32.const 6)
          )
         )
         (block $label$8
          (br_if $label$8
           (i64.eqz
            (local.tee $7
             (i64.shl
              (local.tee $14
               (i64.load offset=80
                (local.get $6)
               )
              )
              (local.tee $16
               (i64.extend_i32_u
                (local.tee $15
                 (i32.and
                  (local.get $11)
                  (i32.const 63)
                 )
                )
               )
              )
             )
            )
           )
          )
          (br_if $label$3
           (i32.gt_u
            (local.get $11)
            (i32.const 319)
           )
          )
          (i64.store
           (local.tee $8
            (i32.add
             (local.get $12)
             (i32.shl
              (local.get $13)
              (i32.const 3)
             )
            )
           )
           (local.tee $7
            (i64.add
             (local.tee $17
              (i64.load
               (local.get $8)
              )
             )
             (local.get $7)
            )
           )
          )
          (br_if $label$8
           (i64.ge_u
            (local.get $7)
            (local.get $17)
           )
          )
          (local.set $9
           (i32.add
            (local.get $13)
            (i32.const -5)
           )
          )
          (local.set $8
           (i32.add
            (local.get $8)
            (i32.const 8)
           )
          )
          (loop $label$9
           (br_if $label$1
            (i32.eqz
             (local.tee $9
              (i32.add
               (local.get $9)
               (i32.const 1)
              )
             )
            )
           )
           (i64.store
            (local.get $8)
            (local.tee $7
             (i64.add
              (i64.load
               (local.get $8)
              )
              (i64.const 1)
             )
            )
           )
           (local.set $8
            (i32.add
             (local.get $8)
             (i32.const 8)
            )
           )
           (br_if $label$9
            (i64.eqz
             (local.get $7)
            )
           )
          )
         )
         (br_if $label$4
          (i64.eqz
           (local.tee $7
            (i64.or
             (i64.shl
              (local.get $3)
              (local.get $16)
             )
             (i64.shr_u
              (i64.shr_u
               (local.get $14)
               (i64.const 1)
              )
              (i64.extend_i32_u
               (i32.xor
                (local.get $15)
                (i32.const 63)
               )
              )
             )
            )
           )
          )
         )
         (local.set $8
          (i32.add
           (local.get $13)
           (i32.const 1)
          )
         )
         (block $label$10
          (br_if $label$10
           (i32.le_u
            (local.get $11)
            (i32.const 255)
           )
          )
          (local.set $13
           (local.get $8)
          )
          (br $label$3)
         )
         (i64.store
          (local.tee $8
           (i32.add
            (local.get $12)
            (i32.shl
             (local.get $8)
             (i32.const 3)
            )
           )
          )
          (local.tee $7
           (i64.add
            (local.tee $3
             (i64.load
              (local.get $8)
             )
            )
            (local.get $7)
           )
          )
         )
         (br_if $label$4
          (i64.ge_u
           (local.get $7)
           (local.get $3)
          )
         )
         (local.set $9
          (i32.add
           (local.get $13)
           (i32.const -4)
          )
         )
         (local.set $8
          (i32.add
           (i32.add
            (i32.shl
             (local.get $13)
             (i32.const 3)
            )
            (local.get $12)
           )
           (i32.const 16)
          )
         )
         (loop $label$11
          (br_if $label$1
           (i32.eqz
            (local.tee $9
             (i32.add
              (local.get $9)
              (i32.const 1)
             )
            )
           )
          )
          (i64.store
           (local.get $8)
           (local.tee $7
            (i64.add
             (i64.load
              (local.get $8)
             )
             (i64.const 1)
            )
           )
          )
          (local.set $8
           (i32.add
            (local.get $8)
            (i32.const 8)
           )
          )
          (br_if $label$4
           (i32.eqz
            (i64.eqz
             (local.get $7)
            )
           )
          )
          (br $label$11)
         )
        )
        (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
         (i32.add
          (local.get $6)
          (i32.const 80)
         )
         (local.get $0)
         (local.get $1)
         (local.get $3)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
         (i32.const 1050252)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
        (i32.const 1050268)
       )
       (unreachable)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
       (i32.const 1050268)
      )
      (unreachable)
     )
     (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
      (i32.add
       (local.get $6)
       (i32.const 80)
      )
      (local.get $0)
      (local.get $1)
      (local.get $4)
     )
     (br_if $label$2
      (i32.xor
       (i32.gt_s
        (local.get $10)
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $11
         (i32.sub
          (local.tee $8
           (i32.load offset=96
            (local.get $6)
           )
          )
          (local.get $10)
         )
        )
        (local.get $8)
       )
      )
     )
     (local.set $12
      (select
       (i32.add
        (local.get $6)
        (i32.const 40)
       )
       (local.get $6)
       (i32.load8_u offset=100
        (local.get $6)
       )
      )
     )
     (local.set $3
      (i64.load offset=88
       (local.get $6)
      )
     )
     (local.set $13
      (i32.shr_u
       (local.get $11)
       (i32.const 6)
      )
     )
     (block $label$12
      (br_if $label$12
       (i64.eqz
        (local.tee $7
         (i64.shl
          (local.tee $14
           (i64.load offset=80
            (local.get $6)
           )
          )
          (local.tee $16
           (i64.extend_i32_u
            (local.tee $15
             (i32.and
              (local.get $11)
              (i32.const 63)
             )
            )
           )
          )
         )
        )
       )
      )
      (br_if $label$3
       (i32.gt_u
        (local.get $11)
        (i32.const 319)
       )
      )
      (i64.store
       (local.tee $8
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
        )
       )
       (local.tee $7
        (i64.add
         (local.tee $4
          (i64.load
           (local.get $8)
          )
         )
         (local.get $7)
        )
       )
      )
      (br_if $label$12
       (i64.ge_u
        (local.get $7)
        (local.get $4)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -5)
       )
      )
      (local.set $8
       (i32.add
        (local.get $8)
        (i32.const 8)
       )
      )
      (loop $label$13
       (br_if $label$1
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $8)
        (local.tee $7
         (i64.add
          (i64.load
           (local.get $8)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
       )
       (br_if $label$13
        (i64.eqz
         (local.get $7)
        )
       )
      )
     )
     (block $label$14
      (br_if $label$14
       (i64.eqz
        (local.tee $7
         (i64.or
          (i64.shl
           (local.get $3)
           (local.get $16)
          )
          (i64.shr_u
           (i64.shr_u
            (local.get $14)
            (i64.const 1)
           )
           (i64.extend_i32_u
            (i32.xor
             (local.get $15)
             (i32.const 63)
            )
           )
          )
         )
        )
       )
      )
      (local.set $8
       (i32.add
        (local.get $13)
        (i32.const 1)
       )
      )
      (block $label$15
       (br_if $label$15
        (i32.le_u
         (local.get $11)
         (i32.const 255)
        )
       )
       (local.set $13
        (local.get $8)
       )
       (br $label$3)
      )
      (i64.store
       (local.tee $8
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $8)
          (i32.const 3)
         )
        )
       )
       (local.tee $7
        (i64.add
         (local.tee $3
          (i64.load
           (local.get $8)
          )
         )
         (local.get $7)
        )
       )
      )
      (br_if $label$14
       (i64.ge_u
        (local.get $7)
        (local.get $3)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -4)
       )
      )
      (local.set $8
       (i32.add
        (i32.add
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
         (local.get $12)
        )
        (i32.const 16)
       )
      )
      (loop $label$16
       (br_if $label$1
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $8)
        (local.tee $7
         (i64.add
          (i64.load
           (local.get $8)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
       )
       (br_if $label$16
        (i64.eqz
         (local.get $7)
        )
       )
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
      (i32.add
       (local.get $6)
       (i32.const 80)
      )
      (local.get $0)
      (local.get $1)
      (local.get $2)
     )
     (br_if $label$2
      (i32.xor
       (i32.gt_s
        (local.get $10)
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $11
         (i32.sub
          (local.tee $8
           (i32.load offset=96
            (local.get $6)
           )
          )
          (local.get $10)
         )
        )
        (local.get $8)
       )
      )
     )
     (local.set $12
      (select
       (local.get $6)
       (i32.add
        (local.get $6)
        (i32.const 40)
       )
       (i32.load8_u offset=100
        (local.get $6)
       )
      )
     )
     (local.set $3
      (i64.load offset=88
       (local.get $6)
      )
     )
     (local.set $13
      (i32.shr_u
       (local.get $11)
       (i32.const 6)
      )
     )
     (block $label$17
      (br_if $label$17
       (i64.eqz
        (local.tee $7
         (i64.shl
          (local.tee $14
           (i64.load offset=80
            (local.get $6)
           )
          )
          (local.tee $16
           (i64.extend_i32_u
            (local.tee $15
             (i32.and
              (local.get $11)
              (i32.const 63)
             )
            )
           )
          )
         )
        )
       )
      )
      (br_if $label$3
       (i32.gt_u
        (local.get $11)
        (i32.const 319)
       )
      )
      (i64.store
       (local.tee $8
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
        )
       )
       (local.tee $7
        (i64.add
         (local.tee $4
          (i64.load
           (local.get $8)
          )
         )
         (local.get $7)
        )
       )
      )
      (br_if $label$17
       (i64.ge_u
        (local.get $7)
        (local.get $4)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -5)
       )
      )
      (local.set $8
       (i32.add
        (local.get $8)
        (i32.const 8)
       )
      )
      (loop $label$18
       (br_if $label$1
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $8)
        (local.tee $7
         (i64.add
          (i64.load
           (local.get $8)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
       )
       (br_if $label$18
        (i64.eqz
         (local.get $7)
        )
       )
      )
     )
     (block $label$19
      (br_if $label$19
       (i64.eqz
        (local.tee $7
         (i64.or
          (i64.shl
           (local.get $3)
           (local.get $16)
          )
          (i64.shr_u
           (i64.shr_u
            (local.get $14)
            (i64.const 1)
           )
           (i64.extend_i32_u
            (i32.xor
             (local.get $15)
             (i32.const 63)
            )
           )
          )
         )
        )
       )
      )
      (local.set $8
       (i32.add
        (local.get $13)
        (i32.const 1)
       )
      )
      (block $label$20
       (br_if $label$20
        (i32.le_u
         (local.get $11)
         (i32.const 255)
        )
       )
       (local.set $13
        (local.get $8)
       )
       (br $label$3)
      )
      (i64.store
       (local.tee $8
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $8)
          (i32.const 3)
         )
        )
       )
       (local.tee $7
        (i64.add
         (local.tee $3
          (i64.load
           (local.get $8)
          )
         )
         (local.get $7)
        )
       )
      )
      (br_if $label$19
       (i64.ge_u
        (local.get $7)
        (local.get $3)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -4)
       )
      )
      (local.set $8
       (i32.add
        (i32.add
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
         (local.get $12)
        )
        (i32.const 16)
       )
      )
      (loop $label$21
       (br_if $label$1
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $8)
        (local.tee $7
         (i64.add
          (i64.load
           (local.get $8)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
       )
       (br_if $label$21
        (i64.eqz
         (local.get $7)
        )
       )
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
      (i32.add
       (local.get $6)
       (i32.const 80)
      )
      (local.get $0)
      (local.get $1)
      (local.get $5)
     )
     (br_if $label$2
      (i32.xor
       (i32.gt_s
        (local.get $10)
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $10
         (i32.sub
          (local.tee $8
           (i32.load offset=96
            (local.get $6)
           )
          )
          (local.get $10)
         )
        )
        (local.get $8)
       )
      )
     )
     (local.set $11
      (select
       (local.get $6)
       (i32.add
        (local.get $6)
        (i32.const 40)
       )
       (i32.load8_u offset=100
        (local.get $6)
       )
      )
     )
     (local.set $1
      (i64.load offset=88
       (local.get $6)
      )
     )
     (local.set $13
      (i32.shr_u
       (local.get $10)
       (i32.const 6)
      )
     )
     (block $label$22
      (br_if $label$22
       (i64.eqz
        (local.tee $7
         (i64.shl
          (local.tee $0
           (i64.load offset=80
            (local.get $6)
           )
          )
          (local.tee $3
           (i64.extend_i32_u
            (local.tee $12
             (i32.and
              (local.get $10)
              (i32.const 63)
             )
            )
           )
          )
         )
        )
       )
      )
      (br_if $label$3
       (i32.gt_u
        (local.get $10)
        (i32.const 319)
       )
      )
      (i64.store
       (local.tee $8
        (i32.add
         (local.get $11)
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
        )
       )
       (local.tee $7
        (i64.add
         (local.tee $14
          (i64.load
           (local.get $8)
          )
         )
         (local.get $7)
        )
       )
      )
      (br_if $label$22
       (i64.ge_u
        (local.get $7)
        (local.get $14)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -5)
       )
      )
      (local.set $8
       (i32.add
        (local.get $8)
        (i32.const 8)
       )
      )
      (loop $label$23
       (br_if $label$1
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $8)
        (local.tee $7
         (i64.add
          (i64.load
           (local.get $8)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
       )
       (br_if $label$23
        (i64.eqz
         (local.get $7)
        )
       )
      )
     )
     (block $label$24
      (br_if $label$24
       (i64.eqz
        (local.tee $7
         (i64.or
          (i64.shl
           (local.get $1)
           (local.get $3)
          )
          (i64.shr_u
           (i64.shr_u
            (local.get $0)
            (i64.const 1)
           )
           (i64.extend_i32_u
            (i32.xor
             (local.get $12)
             (i32.const 63)
            )
           )
          )
         )
        )
       )
      )
      (local.set $8
       (i32.add
        (local.get $13)
        (i32.const 1)
       )
      )
      (block $label$25
       (br_if $label$25
        (i32.le_u
         (local.get $10)
         (i32.const 255)
        )
       )
       (local.set $13
        (local.get $8)
       )
       (br $label$3)
      )
      (i64.store
       (local.tee $8
        (i32.add
         (local.get $11)
         (i32.shl
          (local.get $8)
          (i32.const 3)
         )
        )
       )
       (local.tee $7
        (i64.add
         (local.tee $1
          (i64.load
           (local.get $8)
          )
         )
         (local.get $7)
        )
       )
      )
      (br_if $label$24
       (i64.ge_u
        (local.get $7)
        (local.get $1)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -4)
       )
      )
      (local.set $8
       (i32.add
        (i32.add
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
         (local.get $11)
        )
        (i32.const 16)
       )
      )
      (loop $label$26
       (br_if $label$1
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $8)
        (local.tee $7
         (i64.add
          (i64.load
           (local.get $8)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $8
        (i32.add
         (local.get $8)
         (i32.const 8)
        )
       )
       (br_if $label$26
        (i64.eqz
         (local.get $7)
        )
       )
      )
     )
     (block $label$27
      (block $label$28
       (br_if $label$28
        (i64.ne
         (local.tee $7
          (i64.load offset=32
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=72
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$28
        (i64.ne
         (local.tee $7
          (i64.load offset=24
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=64
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$28
        (i64.ne
         (local.tee $7
          (i64.load offset=16
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=56
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$28
        (i64.ne
         (local.tee $7
          (i64.load offset=8
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=48
           (local.get $6)
          )
         )
        )
       )
       (local.set $8
        (i32.const 0)
       )
       (br_if $label$27
        (i64.eq
         (local.tee $7
          (i64.load
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=40
           (local.get $6)
          )
         )
        )
       )
      )
      (local.set $8
       (i32.sub
        (i64.gt_u
         (local.get $7)
         (local.get $1)
        )
        (i64.lt_u
         (local.get $7)
         (local.get $1)
        )
       )
      )
     )
     (global.set $__stack_pointer
      (i32.add
       (local.get $6)
       (i32.const 112)
      )
     )
     (return
      (local.get $8)
     )
    )
    (call $_ZN4core9panicking18panic_bounds_check17h7a037824b9c6d60fE
     (local.get $13)
     (i32.const 5)
     (i32.const 1049516)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
    (i32.const 1049500)
   )
   (unreachable)
  )
  (call $_ZN4core9panicking18panic_bounds_check17h7a037824b9c6d60fE
   (i32.const 5)
   (i32.const 5)
   (i32.const 1049532)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i64.gt_u
        (local.tee $4
         (i64.ctz
          (local.get $2)
         )
        )
        (i64.const 63)
       )
      )
      (local.set $5
       (i32.wrap_i64
        (local.get $4)
       )
      )
      (local.set $7
       (i64.and
        (i64.add
         (local.tee $6
          (i64.shl
           (i64.const 1)
           (local.get $4)
          )
         )
         (i64.const -1)
        )
        (local.get $3)
       )
      )
      (block $label$5
       (br_if $label$5
        (i32.eqz
         (i64.eqz
          (local.tee $8
           (i64.shr_u
            (i64.and
             (local.get $3)
             (local.get $2)
            )
            (local.get $4)
           )
          )
         )
        )
       )
       (br_if $label$3
        (i32.xor
         (i32.gt_s
          (local.tee $9
           (i32.wrap_i64
            (i64.shr_u
             (i64.shr_u
              (local.get $2)
              (local.get $4)
             )
             (i64.const 1)
            )
           )
          )
          (i32.const 0)
         )
         (i32.lt_s
          (local.tee $9
           (i32.sub
            (i32.const 1)
            (local.get $9)
           )
          )
          (i32.const 1)
         )
        )
       )
       (br_if $label$2
        (i32.xor
         (i32.gt_s
          (local.get $5)
          (i32.const 0)
         )
         (i32.lt_s
          (local.tee $5
           (i32.sub
            (local.get $9)
            (local.get $5)
           )
          )
          (local.get $9)
         )
        )
       )
       (br $label$1)
      )
      (block $label$6
       (block $label$7
        (br_if $label$7
         (i32.xor
          (i32.gt_s
           (local.tee $9
            (i32.wrap_i64
             (i64.shr_u
              (i64.shr_u
               (local.get $2)
               (local.get $4)
              )
              (i64.const 1)
             )
            )
           )
           (i32.const 0)
          )
          (i32.lt_s
           (local.tee $9
            (i32.sub
             (local.tee $10
              (i32.wrap_i64
               (local.get $8)
              )
             )
             (local.get $9)
            )
           )
           (local.get $10)
          )
         )
        )
        (br_if $label$6
         (i32.xor
          (i32.gt_s
           (local.get $5)
           (i32.const 0)
          )
          (i32.lt_s
           (local.tee $5
            (i32.sub
             (local.get $9)
             (local.get $5)
            )
           )
           (local.get $9)
          )
         )
        )
        (local.set $7
         (i64.or
          (local.get $7)
          (local.get $6)
         )
        )
        (br $label$1)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
        (i32.const 1050300)
       )
       (unreachable)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
       (i32.const 1050300)
      )
      (unreachable)
     )
     (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
      (i32.const 1050284)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
     (i32.const 1050268)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
    (i32.const 1050268)
   )
   (unreachable)
  )
  (i64.store offset=8
   (local.get $0)
   (i64.const 0)
  )
  (i64.store
   (local.get $0)
   (local.get $7)
  )
  (i32.store offset=16
   (local.get $0)
   (local.get $5)
  )
  (i32.store8 offset=20
   (local.get $0)
   (i64.ne
    (i64.and
     (local.get $3)
     (local.get $1)
    )
    (i64.const 0)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format13compare_width17h1cbe89d62d3887a6E (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64) (param $5 i64) (result i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i32)
  (local $16 i64)
  (local $17 i64)
  (global.set $__stack_pointer
   (local.tee $6
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 560)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (local.tee $7
     (i32.eqz
      (i32.const 264)
     )
    )
   )
   (memory.fill
    (local.get $6)
    (i32.const 0)
    (i32.const 264)
   )
  )
  (block $label$2
   (br_if $label$2
    (local.get $7)
   )
   (memory.fill
    (i32.add
     (local.get $6)
     (i32.const 264)
    )
    (i32.const 0)
    (i32.const 264)
   )
  )
  (block $label$3
   (block $label$4
    (block $label$5
     (block $label$6
      (block $label$7
       (block $label$8
        (block $label$9
         (br_if $label$9
          (i64.gt_u
           (local.tee $8
            (i64.ctz
             (local.get $1)
            )
           )
           (i64.const 63)
          )
         )
         (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
          (i32.add
           (local.get $6)
           (i32.const 528)
          )
          (local.get $0)
          (local.get $1)
          (local.get $3)
         )
         (br_if $label$8
          (i32.xor
           (i32.gt_s
            (local.tee $7
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
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $7
             (i32.sub
              (i32.const 1)
              (local.get $7)
             )
            )
            (i32.const 1)
           )
          )
         )
         (br_if $label$7
          (i32.xor
           (i32.gt_s
            (local.tee $9
             (i32.wrap_i64
              (local.get $8)
             )
            )
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $10
             (i32.sub
              (local.get $7)
              (local.get $9)
             )
            )
            (local.get $7)
           )
          )
         )
         (br_if $label$4
          (i32.xor
           (i32.gt_s
            (local.get $10)
            (i32.const 0)
           )
           (i32.lt_s
            (local.tee $11
             (i32.sub
              (local.tee $7
               (i32.load offset=544
                (local.get $6)
               )
              )
              (local.get $10)
             )
            )
            (local.get $7)
           )
          )
         )
         (local.set $12
          (select
           (i32.add
            (local.get $6)
            (i32.const 264)
           )
           (local.get $6)
           (i32.load8_u offset=548
            (local.get $6)
           )
          )
         )
         (local.set $3
          (i64.load offset=536
           (local.get $6)
          )
         )
         (local.set $13
          (i32.shr_u
           (local.get $11)
           (i32.const 6)
          )
         )
         (block $label$10
          (br_if $label$10
           (i64.eqz
            (local.tee $8
             (i64.shl
              (local.tee $14
               (i64.load offset=528
                (local.get $6)
               )
              )
              (local.tee $16
               (i64.extend_i32_u
                (local.tee $15
                 (i32.and
                  (local.get $11)
                  (i32.const 63)
                 )
                )
               )
              )
             )
            )
           )
          )
          (br_if $label$5
           (i32.gt_u
            (local.get $11)
            (i32.const 2111)
           )
          )
          (i64.store
           (local.tee $7
            (i32.add
             (local.get $12)
             (i32.shl
              (local.get $13)
              (i32.const 3)
             )
            )
           )
           (local.tee $8
            (i64.add
             (local.tee $17
              (i64.load
               (local.get $7)
              )
             )
             (local.get $8)
            )
           )
          )
          (br_if $label$10
           (i64.ge_u
            (local.get $8)
            (local.get $17)
           )
          )
          (local.set $9
           (i32.add
            (local.get $13)
            (i32.const -33)
           )
          )
          (local.set $7
           (i32.add
            (local.get $7)
            (i32.const 8)
           )
          )
          (loop $label$11
           (br_if $label$3
            (i32.eqz
             (local.tee $9
              (i32.add
               (local.get $9)
               (i32.const 1)
              )
             )
            )
           )
           (i64.store
            (local.get $7)
            (local.tee $8
             (i64.add
              (i64.load
               (local.get $7)
              )
              (i64.const 1)
             )
            )
           )
           (local.set $7
            (i32.add
             (local.get $7)
             (i32.const 8)
            )
           )
           (br_if $label$11
            (i64.eqz
             (local.get $8)
            )
           )
          )
         )
         (br_if $label$6
          (i64.eqz
           (local.tee $8
            (i64.or
             (i64.shl
              (local.get $3)
              (local.get $16)
             )
             (i64.shr_u
              (i64.shr_u
               (local.get $14)
               (i64.const 1)
              )
              (i64.extend_i32_u
               (i32.xor
                (local.get $15)
                (i32.const 63)
               )
              )
             )
            )
           )
          )
         )
         (local.set $7
          (i32.add
           (local.get $13)
           (i32.const 1)
          )
         )
         (block $label$12
          (br_if $label$12
           (i32.le_u
            (local.get $11)
            (i32.const 2047)
           )
          )
          (local.set $13
           (local.get $7)
          )
          (br $label$5)
         )
         (i64.store
          (local.tee $7
           (i32.add
            (local.get $12)
            (i32.shl
             (local.get $7)
             (i32.const 3)
            )
           )
          )
          (local.tee $8
           (i64.add
            (local.tee $3
             (i64.load
              (local.get $7)
             )
            )
            (local.get $8)
           )
          )
         )
         (br_if $label$6
          (i64.ge_u
           (local.get $8)
           (local.get $3)
          )
         )
         (local.set $9
          (i32.add
           (local.get $13)
           (i32.const -32)
          )
         )
         (local.set $7
          (i32.add
           (i32.add
            (i32.shl
             (local.get $13)
             (i32.const 3)
            )
            (local.get $12)
           )
           (i32.const 16)
          )
         )
         (loop $label$13
          (br_if $label$3
           (i32.eqz
            (local.tee $9
             (i32.add
              (local.get $9)
              (i32.const 1)
             )
            )
           )
          )
          (i64.store
           (local.get $7)
           (local.tee $8
            (i64.add
             (i64.load
              (local.get $7)
             )
             (i64.const 1)
            )
           )
          )
          (local.set $7
           (i32.add
            (local.get $7)
            (i32.const 8)
           )
          )
          (br_if $label$6
           (i32.eqz
            (i64.eqz
             (local.get $8)
            )
           )
          )
          (br $label$13)
         )
        )
        (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
         (i32.add
          (local.get $6)
          (i32.const 528)
         )
         (local.get $0)
         (local.get $1)
         (local.get $3)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
         (i32.const 1050252)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
        (i32.const 1050268)
       )
       (unreachable)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
       (i32.const 1050268)
      )
      (unreachable)
     )
     (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
      (i32.add
       (local.get $6)
       (i32.const 528)
      )
      (local.get $0)
      (local.get $1)
      (local.get $4)
     )
     (br_if $label$4
      (i32.xor
       (i32.gt_s
        (local.get $10)
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $11
         (i32.sub
          (local.tee $7
           (i32.load offset=544
            (local.get $6)
           )
          )
          (local.get $10)
         )
        )
        (local.get $7)
       )
      )
     )
     (local.set $12
      (select
       (i32.add
        (local.get $6)
        (i32.const 264)
       )
       (local.get $6)
       (i32.load8_u offset=548
        (local.get $6)
       )
      )
     )
     (local.set $3
      (i64.load offset=536
       (local.get $6)
      )
     )
     (local.set $13
      (i32.shr_u
       (local.get $11)
       (i32.const 6)
      )
     )
     (block $label$14
      (br_if $label$14
       (i64.eqz
        (local.tee $8
         (i64.shl
          (local.tee $14
           (i64.load offset=528
            (local.get $6)
           )
          )
          (local.tee $16
           (i64.extend_i32_u
            (local.tee $15
             (i32.and
              (local.get $11)
              (i32.const 63)
             )
            )
           )
          )
         )
        )
       )
      )
      (br_if $label$5
       (i32.gt_u
        (local.get $11)
        (i32.const 2111)
       )
      )
      (i64.store
       (local.tee $7
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
        )
       )
       (local.tee $8
        (i64.add
         (local.tee $4
          (i64.load
           (local.get $7)
          )
         )
         (local.get $8)
        )
       )
      )
      (br_if $label$14
       (i64.ge_u
        (local.get $8)
        (local.get $4)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -33)
       )
      )
      (local.set $7
       (i32.add
        (local.get $7)
        (i32.const 8)
       )
      )
      (loop $label$15
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $7)
        (local.tee $8
         (i64.add
          (i64.load
           (local.get $7)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const 8)
        )
       )
       (br_if $label$15
        (i64.eqz
         (local.get $8)
        )
       )
      )
     )
     (block $label$16
      (br_if $label$16
       (i64.eqz
        (local.tee $8
         (i64.or
          (i64.shl
           (local.get $3)
           (local.get $16)
          )
          (i64.shr_u
           (i64.shr_u
            (local.get $14)
            (i64.const 1)
           )
           (i64.extend_i32_u
            (i32.xor
             (local.get $15)
             (i32.const 63)
            )
           )
          )
         )
        )
       )
      )
      (local.set $7
       (i32.add
        (local.get $13)
        (i32.const 1)
       )
      )
      (block $label$17
       (br_if $label$17
        (i32.le_u
         (local.get $11)
         (i32.const 2047)
        )
       )
       (local.set $13
        (local.get $7)
       )
       (br $label$5)
      )
      (i64.store
       (local.tee $7
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $7)
          (i32.const 3)
         )
        )
       )
       (local.tee $8
        (i64.add
         (local.tee $3
          (i64.load
           (local.get $7)
          )
         )
         (local.get $8)
        )
       )
      )
      (br_if $label$16
       (i64.ge_u
        (local.get $8)
        (local.get $3)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -32)
       )
      )
      (local.set $7
       (i32.add
        (i32.add
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
         (local.get $12)
        )
        (i32.const 16)
       )
      )
      (loop $label$18
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $7)
        (local.tee $8
         (i64.add
          (i64.load
           (local.get $7)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const 8)
        )
       )
       (br_if $label$18
        (i64.eqz
         (local.get $8)
        )
       )
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
      (i32.add
       (local.get $6)
       (i32.const 528)
      )
      (local.get $0)
      (local.get $1)
      (local.get $2)
     )
     (br_if $label$4
      (i32.xor
       (i32.gt_s
        (local.get $10)
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $11
         (i32.sub
          (local.tee $7
           (i32.load offset=544
            (local.get $6)
           )
          )
          (local.get $10)
         )
        )
        (local.get $7)
       )
      )
     )
     (local.set $12
      (select
       (local.get $6)
       (i32.add
        (local.get $6)
        (i32.const 264)
       )
       (i32.load8_u offset=548
        (local.get $6)
       )
      )
     )
     (local.set $3
      (i64.load offset=536
       (local.get $6)
      )
     )
     (local.set $13
      (i32.shr_u
       (local.get $11)
       (i32.const 6)
      )
     )
     (block $label$19
      (br_if $label$19
       (i64.eqz
        (local.tee $8
         (i64.shl
          (local.tee $14
           (i64.load offset=528
            (local.get $6)
           )
          )
          (local.tee $16
           (i64.extend_i32_u
            (local.tee $15
             (i32.and
              (local.get $11)
              (i32.const 63)
             )
            )
           )
          )
         )
        )
       )
      )
      (br_if $label$5
       (i32.gt_u
        (local.get $11)
        (i32.const 2111)
       )
      )
      (i64.store
       (local.tee $7
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
        )
       )
       (local.tee $8
        (i64.add
         (local.tee $4
          (i64.load
           (local.get $7)
          )
         )
         (local.get $8)
        )
       )
      )
      (br_if $label$19
       (i64.ge_u
        (local.get $8)
        (local.get $4)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -33)
       )
      )
      (local.set $7
       (i32.add
        (local.get $7)
        (i32.const 8)
       )
      )
      (loop $label$20
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $7)
        (local.tee $8
         (i64.add
          (i64.load
           (local.get $7)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const 8)
        )
       )
       (br_if $label$20
        (i64.eqz
         (local.get $8)
        )
       )
      )
     )
     (block $label$21
      (br_if $label$21
       (i64.eqz
        (local.tee $8
         (i64.or
          (i64.shl
           (local.get $3)
           (local.get $16)
          )
          (i64.shr_u
           (i64.shr_u
            (local.get $14)
            (i64.const 1)
           )
           (i64.extend_i32_u
            (i32.xor
             (local.get $15)
             (i32.const 63)
            )
           )
          )
         )
        )
       )
      )
      (local.set $7
       (i32.add
        (local.get $13)
        (i32.const 1)
       )
      )
      (block $label$22
       (br_if $label$22
        (i32.le_u
         (local.get $11)
         (i32.const 2047)
        )
       )
       (local.set $13
        (local.get $7)
       )
       (br $label$5)
      )
      (i64.store
       (local.tee $7
        (i32.add
         (local.get $12)
         (i32.shl
          (local.get $7)
          (i32.const 3)
         )
        )
       )
       (local.tee $8
        (i64.add
         (local.tee $3
          (i64.load
           (local.get $7)
          )
         )
         (local.get $8)
        )
       )
      )
      (br_if $label$21
       (i64.ge_u
        (local.get $8)
        (local.get $3)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -32)
       )
      )
      (local.set $7
       (i32.add
        (i32.add
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
         (local.get $12)
        )
        (i32.const 16)
       )
      )
      (loop $label$23
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $7)
        (local.tee $8
         (i64.add
          (i64.load
           (local.get $7)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const 8)
        )
       )
       (br_if $label$23
        (i64.eqz
         (local.get $8)
        )
       )
      )
     )
     (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
      (i32.add
       (local.get $6)
       (i32.const 528)
      )
      (local.get $0)
      (local.get $1)
      (local.get $5)
     )
     (br_if $label$4
      (i32.xor
       (i32.gt_s
        (local.get $10)
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $10
         (i32.sub
          (local.tee $7
           (i32.load offset=544
            (local.get $6)
           )
          )
          (local.get $10)
         )
        )
        (local.get $7)
       )
      )
     )
     (local.set $11
      (select
       (local.get $6)
       (i32.add
        (local.get $6)
        (i32.const 264)
       )
       (i32.load8_u offset=548
        (local.get $6)
       )
      )
     )
     (local.set $1
      (i64.load offset=536
       (local.get $6)
      )
     )
     (local.set $13
      (i32.shr_u
       (local.get $10)
       (i32.const 6)
      )
     )
     (block $label$24
      (br_if $label$24
       (i64.eqz
        (local.tee $8
         (i64.shl
          (local.tee $0
           (i64.load offset=528
            (local.get $6)
           )
          )
          (local.tee $3
           (i64.extend_i32_u
            (local.tee $12
             (i32.and
              (local.get $10)
              (i32.const 63)
             )
            )
           )
          )
         )
        )
       )
      )
      (br_if $label$5
       (i32.gt_u
        (local.get $10)
        (i32.const 2111)
       )
      )
      (i64.store
       (local.tee $7
        (i32.add
         (local.get $11)
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
        )
       )
       (local.tee $8
        (i64.add
         (local.tee $14
          (i64.load
           (local.get $7)
          )
         )
         (local.get $8)
        )
       )
      )
      (br_if $label$24
       (i64.ge_u
        (local.get $8)
        (local.get $14)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -33)
       )
      )
      (local.set $7
       (i32.add
        (local.get $7)
        (i32.const 8)
       )
      )
      (loop $label$25
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $7)
        (local.tee $8
         (i64.add
          (i64.load
           (local.get $7)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const 8)
        )
       )
       (br_if $label$25
        (i64.eqz
         (local.get $8)
        )
       )
      )
     )
     (block $label$26
      (br_if $label$26
       (i64.eqz
        (local.tee $8
         (i64.or
          (i64.shl
           (local.get $1)
           (local.get $3)
          )
          (i64.shr_u
           (i64.shr_u
            (local.get $0)
            (i64.const 1)
           )
           (i64.extend_i32_u
            (i32.xor
             (local.get $12)
             (i32.const 63)
            )
           )
          )
         )
        )
       )
      )
      (local.set $7
       (i32.add
        (local.get $13)
        (i32.const 1)
       )
      )
      (block $label$27
       (br_if $label$27
        (i32.le_u
         (local.get $10)
         (i32.const 2047)
        )
       )
       (local.set $13
        (local.get $7)
       )
       (br $label$5)
      )
      (i64.store
       (local.tee $7
        (i32.add
         (local.get $11)
         (i32.shl
          (local.get $7)
          (i32.const 3)
         )
        )
       )
       (local.tee $8
        (i64.add
         (local.tee $1
          (i64.load
           (local.get $7)
          )
         )
         (local.get $8)
        )
       )
      )
      (br_if $label$26
       (i64.ge_u
        (local.get $8)
        (local.get $1)
       )
      )
      (local.set $9
       (i32.add
        (local.get $13)
        (i32.const -32)
       )
      )
      (local.set $7
       (i32.add
        (i32.add
         (i32.shl
          (local.get $13)
          (i32.const 3)
         )
         (local.get $11)
        )
        (i32.const 16)
       )
      )
      (loop $label$28
       (br_if $label$3
        (i32.eqz
         (local.tee $9
          (i32.add
           (local.get $9)
           (i32.const 1)
          )
         )
        )
       )
       (i64.store
        (local.get $7)
        (local.tee $8
         (i64.add
          (i64.load
           (local.get $7)
          )
          (i64.const 1)
         )
        )
       )
       (local.set $7
        (i32.add
         (local.get $7)
         (i32.const 8)
        )
       )
       (br_if $label$28
        (i64.eqz
         (local.get $8)
        )
       )
      )
     )
     (block $label$29
      (block $label$30
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=256
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=520
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=248
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=512
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=240
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=504
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=232
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=496
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=224
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=488
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=216
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=480
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=208
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=472
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=200
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=464
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=192
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=456
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=184
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=448
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=176
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=440
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=168
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=432
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=160
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=424
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=152
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=416
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=144
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=408
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=136
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=400
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=128
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=392
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=120
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=384
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=112
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=376
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=104
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=368
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=96
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=360
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=88
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=352
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=80
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=344
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=72
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=336
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=64
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=328
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=56
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=320
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=48
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=312
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=40
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=304
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=32
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=296
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=24
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=288
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=16
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=280
           (local.get $6)
          )
         )
        )
       )
       (br_if $label$30
        (i64.ne
         (local.tee $8
          (i64.load offset=8
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=272
           (local.get $6)
          )
         )
        )
       )
       (local.set $7
        (i32.const 0)
       )
       (br_if $label$29
        (i64.eq
         (local.tee $8
          (i64.load
           (local.get $6)
          )
         )
         (local.tee $1
          (i64.load offset=264
           (local.get $6)
          )
         )
        )
       )
      )
      (local.set $7
       (i32.sub
        (i64.gt_u
         (local.get $8)
         (local.get $1)
        )
        (i64.lt_u
         (local.get $8)
         (local.get $1)
        )
       )
      )
     )
     (global.set $__stack_pointer
      (i32.add
       (local.get $6)
       (i32.const 560)
      )
     )
     (return
      (local.get $7)
     )
    )
    (call $_ZN4core9panicking18panic_bounds_check17h7a037824b9c6d60fE
     (local.get $13)
     (i32.const 33)
     (i32.const 1049516)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
    (i32.const 1049500)
   )
   (unreachable)
  )
  (call $_ZN4core9panicking18panic_bounds_check17h7a037824b9c6d60fE
   (i32.const 33)
   (i32.const 33)
   (i32.const 1049532)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i32)
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
            (i32.const 1049596)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
           (i32.const 1049612)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
          (i32.const 1050252)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
         (i32.const 1049548)
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
       (i32.const 1049564)
      )
      (unreachable)
     )
     (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
      (i32.const 1050268)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
     (i32.const 1049580)
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
 (func $_ZN13hyperinterval4ieee6Format4sqrt17h2acdb3c399d22468E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 80)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
   (i32.add
    (local.get $4)
    (i32.const 16)
   )
   (local.get $1)
   (local.get $2)
   (local.get $3)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (block $label$6
        (block $label$7
         (br_if $label$7
          (i64.ne
           (i64.or
            (local.tee $1
             (i64.load offset=16
              (local.get $4)
             )
            )
            (local.tee $3
             (i64.load offset=24
              (local.get $4)
             )
            )
           )
           (i64.const 0)
          )
         )
         (i64.store offset=8
          (local.get $0)
          (i64.const 0)
         )
         (i64.store
          (i32.add
           (local.get $0)
           (i32.const 16)
          )
          (i64.const 0)
         )
         (br $label$6)
        )
        (br_if $label$4
         (i32.xor
          (i32.lt_s
           (local.tee $5
            (i32.xor
             (i32.wrap_i64
              (select
               (i64.clz
                (local.get $3)
               )
               (i64.add
                (i64.clz
                 (local.get $1)
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
           (local.tee $5
            (i32.add
             (local.tee $6
              (i32.load offset=32
               (local.get $4)
              )
             )
             (local.get $5)
            )
           )
           (local.get $6)
          )
         )
        )
        (br_if $label$3
         (i32.lt_s
          (local.tee $5
           (i32.sub
            (i32.shr_s
             (local.get $5)
             (i32.const 1)
            )
            (i32.wrap_i64
             (i64.ctz
              (local.get $2)
             )
            )
           )
          )
          (i32.const -1073741824)
         )
        )
        (br_if $label$2
         (i32.xor
          (i32.gt_s
           (local.tee $7
            (i32.shl
             (local.get $5)
             (i32.const 1)
            )
           )
           (i32.const 0)
          )
          (i32.lt_s
           (local.tee $7
            (i32.sub
             (local.get $6)
             (local.get $7)
            )
           )
           (local.get $6)
          )
         )
        )
        (br_if $label$1
         (i32.ge_u
          (local.get $7)
          (i32.const 128)
         )
        )
        (call $__ashlti3
         (local.get $4)
         (local.get $1)
         (local.get $3)
         (local.get $7)
        )
        (call $_ZN13hyperinterval4sqrt19integer_sqrt_bounds17hd020d82fdb9785b6E
         (i32.add
          (local.get $4)
          (i32.const 48)
         )
         (i64.load
          (local.get $4)
         )
         (i64.load offset=8
          (local.get $4)
         )
        )
        (local.set $3
         (i64.load offset=72
          (local.get $4)
         )
        )
        (local.set $1
         (i64.load offset=64
          (local.get $4)
         )
        )
        (call $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404
         (i32.add
          (local.get $4)
          (i32.const 48)
         )
         (local.get $2)
         (i64.load offset=48
          (local.get $4)
         )
         (i64.load offset=56
          (local.get $4)
         )
         (local.get $5)
        )
        (block $label$8
         (br_if $label$8
          (i32.eqz
           (i32.load8_u offset=48
            (local.get $4)
           )
          )
         )
         (i32.store8 offset=1
          (local.get $0)
          (i32.load8_u offset=49
           (local.get $4)
          )
         )
         (local.set $6
          (i32.const 1)
         )
         (br $label$5)
        )
        (local.set $8
         (i64.load offset=56
          (local.get $4)
         )
        )
        (call $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404
         (i32.add
          (local.get $4)
          (i32.const 48)
         )
         (local.get $2)
         (local.get $1)
         (local.get $3)
         (local.get $5)
        )
        (local.set $6
         (i32.const 1)
        )
        (block $label$9
         (br_if $label$9
          (i32.ne
           (i32.load8_u offset=48
            (local.get $4)
           )
           (i32.const 1)
          )
         )
         (i32.store8 offset=1
          (local.get $0)
          (i32.load8_u offset=49
           (local.get $4)
          )
         )
         (br $label$5)
        )
        (i64.store offset=16
         (local.get $0)
         (i64.load offset=56
          (local.get $4)
         )
        )
        (i64.store offset=8
         (local.get $0)
         (local.get $8)
        )
       )
       (local.set $6
        (i32.const 0)
       )
      )
      (i32.store8
       (local.get $0)
       (local.get $6)
      )
      (global.set $__stack_pointer
       (i32.add
        (local.get $4)
        (i32.const 80)
       )
      )
      (return)
     )
     (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
      (i32.const 1049628)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_mul_overflow17h632c39c9542fff9dE
     (i32.const 1049644)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
    (i32.const 1049660)
   )
   (unreachable)
  )
  (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
   (i32.const 1049676)
  )
  (unreachable)
 )
 (func $_ZN13hyperinterval4ieee6Format7rounded17h18a254a9a730a5d0E.llvm.3547746728100167404 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i64)
  (local $14 i64)
  (global.set $__stack_pointer
   (local.tee $4
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 64)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.ne
      (i64.or
       (local.tee $5
        (i64.load
         (local.get $3)
        )
       )
       (local.tee $6
        (i64.load offset=8
         (local.get $3)
        )
       )
      )
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
   (block $label$3
    (block $label$4
     (block $label$5
      (block $label$6
       (block $label$7
        (block $label$8
         (block $label$9
          (block $label$10
           (block $label$11
            (br_if $label$11
             (i32.lt_s
              (local.tee $8
               (i32.add
                (local.tee $7
                 (i32.load offset=16
                  (local.get $3)
                 )
                )
                (i32.const 127)
               )
              )
              (local.get $7)
             )
            )
            (br_if $label$10
             (i64.ge_u
              (local.tee $9
               (i64.ctz
                (local.get $2)
               )
              )
              (i64.const 64)
             )
            )
            (br_if $label$7
             (i32.gt_s
              (local.tee $10
               (i32.sub
                (local.get $8)
                (i32.wrap_i64
                 (select
                  (i64.clz
                   (local.get $6)
                  )
                  (i64.add
                   (i64.clz
                    (local.get $5)
                   )
                   (i64.const 64)
                  )
                  (i64.ne
                   (local.get $6)
                   (i64.const 0)
                  )
                 )
                )
               )
              )
              (local.tee $8
               (i32.wrap_i64
                (i64.shr_u
                 (i64.shr_u
                  (local.get $2)
                  (local.get $9)
                 )
                 (i64.const 1)
                )
               )
              )
             )
            )
            (br_if $label$9
             (i32.xor
              (i32.gt_s
               (local.get $8)
               (i32.const 0)
              )
              (i32.lt_s
               (local.tee $11
                (i32.sub
                 (i32.const 1)
                 (local.get $8)
                )
               )
               (i32.const 1)
              )
             )
            )
            (br_if $label$8
             (i32.xor
              (i32.gt_s
               (local.tee $8
                (i32.wrap_i64
                 (local.get $9)
                )
               )
               (i32.const 0)
              )
              (i32.lt_s
               (local.tee $12
                (i32.sub
                 (local.get $11)
                 (local.get $8)
                )
               )
               (local.get $11)
              )
             )
            )
            (br_if $label$6
             (i32.xor
              (i32.gt_s
               (local.get $8)
               (i32.const 0)
              )
              (i32.lt_s
               (local.tee $8
                (i32.sub
                 (local.get $10)
                 (local.get $8)
                )
               )
               (local.get $10)
              )
             )
            )
            (br_if $label$5
             (i32.xor
              (i32.gt_s
               (local.get $7)
               (i32.const 0)
              )
              (i32.lt_s
               (local.tee $7
                (i32.sub
                 (local.tee $8
                  (select
                   (local.get $8)
                   (local.get $12)
                   (i32.gt_s
                    (local.get $8)
                    (local.get $12)
                   )
                  )
                 )
                 (local.get $7)
                )
               )
               (local.get $8)
              )
             )
            )
            (local.set $9
             (i64.const 0)
            )
            (local.set $13
             (i64.const 0)
            )
            (local.set $10
             (i32.const 1)
            )
            (block $label$12
             (br_if $label$12
              (i32.gt_s
               (local.get $7)
               (i32.const 127)
              )
             )
             (block $label$13
              (br_if $label$13
               (i32.gt_s
                (local.get $7)
                (i32.const 0)
               )
              )
              (br_if $label$4
               (i32.eq
                (local.get $7)
                (i32.const -2147483648)
               )
              )
              (local.set $10
               (i32.const 0)
              )
              (block $label$14
               (br_if $label$14
                (i32.ge_u
                 (local.tee $7
                  (i32.sub
                   (i32.const 0)
                   (local.get $7)
                  )
                 )
                 (i32.const 128)
                )
               )
               (call $__ashlti3
                (i32.add
                 (local.get $4)
                 (i32.const 32)
                )
                (local.get $5)
                (local.get $6)
                (local.get $7)
               )
               (local.set $13
                (i64.load offset=40
                 (local.get $4)
                )
               )
               (local.set $9
                (i64.load offset=32
                 (local.get $4)
                )
               )
               (br $label$12)
              )
              (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
               (i32.const 1049756)
              )
              (unreachable)
             )
             (call $__ashlti3
              (i32.add
               (local.get $4)
               (i32.const 16)
              )
              (i64.const -1)
              (i64.const -1)
              (local.get $7)
             )
             (call $__lshrti3
              (local.get $4)
              (local.get $5)
              (local.get $6)
              (local.get $7)
             )
             (local.set $10
              (i64.ne
               (i64.or
                (i64.and
                 (local.get $5)
                 (i64.xor
                  (i64.load offset=16
                   (local.get $4)
                  )
                  (i64.const -1)
                 )
                )
                (i64.and
                 (local.get $6)
                 (i64.xor
                  (i64.load offset=24
                   (local.get $4)
                  )
                  (i64.const -1)
                 )
                )
               )
               (i64.const 0)
              )
             )
             (local.set $13
              (i64.load offset=8
               (local.get $4)
              )
             )
             (local.set $9
              (i64.load
               (local.get $4)
              )
             )
            )
            (call $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404
             (i32.add
              (local.get $4)
              (i32.const 48)
             )
             (local.get $2)
             (local.get $9)
             (local.get $13)
             (local.get $8)
            )
            (block $label$15
             (block $label$16
              (br_if $label$16
               (i32.eq
                (i32.load8_u offset=48
                 (local.get $4)
                )
                (i32.const 1)
               )
              )
              (br_if $label$3
               (select
                (local.tee $7
                 (i64.lt_u
                  (local.tee $6
                   (i64.add
                    (local.get $9)
                    (i64.extend_i32_u
                     (local.get $10)
                    )
                   )
                  )
                  (local.get $9)
                 )
                )
                (i64.lt_u
                 (local.tee $14
                  (i64.add
                   (local.get $13)
                   (i64.extend_i32_u
                    (local.get $7)
                   )
                  )
                 )
                 (local.get $13)
                )
                (i64.ge_u
                 (local.get $6)
                 (local.get $9)
                )
               )
              )
              (local.set $5
               (i64.load offset=56
                (local.get $4)
               )
              )
              (call $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404
               (i32.add
                (local.get $4)
                (i32.const 48)
               )
               (local.get $2)
               (local.get $6)
               (local.get $14)
               (local.get $8)
              )
              (br_if $label$15
               (i32.eqz
                (i32.load8_u offset=48
                 (local.get $4)
                )
               )
              )
             )
             (local.set $3
              (i32.load8_u offset=49
               (local.get $4)
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
            (local.set $2
             (i64.load offset=56
              (local.get $4)
             )
            )
            (block $label$17
             (block $label$18
              (br_if $label$18
               (i32.eq
                (i32.load8_u offset=20
                 (local.get $3)
                )
                (i32.const 1)
               )
              )
              (local.set $6
               (local.get $2)
              )
              (br $label$17)
             )
             (local.set $6
              (select
               (i64.const 0)
               (i64.xor
                (local.get $5)
                (local.get $1)
               )
               (i64.eqz
                (local.get $5)
               )
              )
             )
             (local.set $5
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
             (local.get $6)
            )
            (i64.store offset=8
             (local.get $0)
             (local.get $5)
            )
            (i32.store8
             (local.get $0)
             (i32.const 0)
            )
            (br $label$1)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
            (i32.const 1049692)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
           (i32.const 1050252)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
          (i32.const 1050268)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
         (i32.const 1050268)
        )
        (unreachable)
       )
       (i32.store16
        (local.get $0)
        (i32.const 1281)
       )
       (br $label$1)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
       (i32.const 1049708)
      )
      (unreachable)
     )
     (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
      (i32.const 1049724)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_neg_overflow17ha2120557937cff01E
     (i32.const 1049740)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
    (i32.const 1049772)
   )
   (unreachable)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $4)
    (i32.const 64)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format3add17h3efb23a459c67eb5E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  (local $16 i64)
  (local $17 i64)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 80)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.ne
      (local.get $3)
      (i64.const 0)
     )
    )
    (i64.store offset=16
     (local.get $0)
     (local.get $4)
    )
    (i64.store offset=8
     (local.get $0)
     (local.get $4)
    )
    (i32.store8
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i64.eqz
      (local.get $4)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
     (i32.add
      (local.get $5)
      (i32.const 48)
     )
     (local.get $1)
     (local.get $2)
     (local.get $3)
    )
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
                 (br_if $label$16
                  (i32.lt_u
                   (local.tee $6
                    (i32.add
                     (i32.wrap_i64
                      (i64.ctz
                       (local.get $2)
                      )
                     )
                     (i32.const 1)
                    )
                   )
                   (local.tee $9
                    (i32.sub
                     (i32.const 128)
                     (i32.wrap_i64
                      (select
                       (i64.clz
                        (local.tee $7
                         (i64.load offset=56
                          (local.get $5)
                         )
                        )
                       )
                       (i64.add
                        (i64.clz
                         (local.tee $8
                          (i64.load offset=48
                           (local.get $5)
                          )
                         )
                        )
                        (i64.const 64)
                       )
                       (i64.ne
                        (local.get $7)
                        (i64.const 0)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                 (br_if $label$15
                  (i32.ge_u
                   (local.tee $9
                    (i32.sub
                     (local.get $6)
                     (local.get $9)
                    )
                   )
                   (i32.const 128)
                  )
                 )
                 (br_if $label$14
                  (i32.xor
                   (i32.gt_s
                    (local.get $9)
                    (i32.const 0)
                   )
                   (i32.lt_s
                    (local.tee $11
                     (i32.sub
                      (local.tee $10
                       (i32.load offset=64
                        (local.get $5)
                       )
                      )
                      (local.get $9)
                     )
                    )
                    (local.get $10)
                   )
                  )
                 )
                 (call $__ashlti3
                  (i32.add
                   (local.get $5)
                   (i32.const 32)
                  )
                  (local.get $8)
                  (local.get $7)
                  (local.get $9)
                 )
                 (local.set $12
                  (i32.load offset=68
                   (local.get $5)
                  )
                 )
                 (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
                  (i32.add
                   (local.get $5)
                   (i32.const 48)
                  )
                  (local.get $1)
                  (local.get $2)
                  (local.get $4)
                 )
                 (br_if $label$13
                  (i32.lt_u
                   (local.get $6)
                   (local.tee $9
                    (i32.sub
                     (i32.const 128)
                     (i32.wrap_i64
                      (select
                       (i64.clz
                        (local.tee $7
                         (i64.load offset=56
                          (local.get $5)
                         )
                        )
                       )
                       (i64.add
                        (i64.clz
                         (local.tee $8
                          (i64.load offset=48
                           (local.get $5)
                          )
                         )
                        )
                        (i64.const 64)
                       )
                       (i64.ne
                        (local.get $7)
                        (i64.const 0)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                 (br_if $label$12
                  (i32.ge_u
                   (local.tee $6
                    (i32.sub
                     (local.get $6)
                     (local.get $9)
                    )
                   )
                   (i32.const 128)
                  )
                 )
                 (br_if $label$11
                  (i32.xor
                   (i32.gt_s
                    (local.get $6)
                    (i32.const 0)
                   )
                   (i32.lt_s
                    (local.tee $9
                     (i32.sub
                      (local.tee $10
                       (i32.load offset=64
                        (local.get $5)
                       )
                      )
                      (local.get $6)
                     )
                    )
                    (local.get $10)
                   )
                  )
                 )
                 (local.set $13
                  (i64.load offset=40
                   (local.get $5)
                  )
                 )
                 (local.set $14
                  (i64.load offset=32
                   (local.get $5)
                  )
                 )
                 (call $__ashlti3
                  (i32.add
                   (local.get $5)
                   (i32.const 16)
                  )
                  (local.get $8)
                  (local.get $7)
                  (local.get $6)
                 )
                 (local.set $10
                  (i32.load offset=68
                   (local.get $5)
                  )
                 )
                 (local.set $7
                  (i64.load offset=24
                   (local.get $5)
                  )
                 )
                 (local.set $8
                  (i64.load offset=16
                   (local.get $5)
                  )
                 )
                 (block $label$17
                  (block $label$18
                   (br_if $label$18
                    (i32.lt_s
                     (local.get $11)
                     (local.get $9)
                    )
                   )
                   (local.set $15
                    (local.get $10)
                   )
                   (local.set $16
                    (local.get $8)
                   )
                   (local.set $17
                    (local.get $7)
                   )
                   (local.set $10
                    (local.get $12)
                   )
                   (local.set $8
                    (local.get $14)
                   )
                   (local.set $7
                    (local.get $13)
                   )
                   (local.set $6
                    (local.get $9)
                   )
                   (local.set $9
                    (local.get $11)
                   )
                   (local.set $4
                    (local.get $3)
                   )
                   (br $label$17)
                  )
                  (local.set $15
                   (local.get $12)
                  )
                  (local.set $16
                   (local.get $14)
                  )
                  (local.set $17
                   (local.get $13)
                  )
                  (local.set $6
                   (local.get $11)
                  )
                 )
                 (br_if $label$10
                  (i32.xor
                   (i32.gt_s
                    (local.get $6)
                    (i32.const 0)
                   )
                   (i32.lt_s
                    (local.tee $11
                     (i32.sub
                      (local.get $9)
                      (local.get $6)
                     )
                    )
                    (local.get $9)
                   )
                  )
                 )
                 (block $label$19
                  (br_if $label$19
                   (i32.gt_s
                    (local.get $11)
                    (i32.const 74)
                   )
                  )
                  (br_if $label$9
                   (i32.ge_u
                    (local.get $11)
                    (i32.const 128)
                   )
                  )
                  (call $__ashlti3
                   (local.get $5)
                   (local.get $8)
                   (local.get $7)
                   (local.get $11)
                  )
                  (local.set $4
                   (i64.load offset=8
                    (local.get $5)
                   )
                  )
                  (local.set $3
                   (i64.load
                    (local.get $5)
                   )
                  )
                  (block $label$20
                   (br_if $label$20
                    (i32.eq
                     (i32.and
                      (local.get $10)
                      (i32.const 255)
                     )
                     (i32.and
                      (local.get $15)
                      (i32.const 255)
                     )
                    )
                   )
                   (block $label$21
                    (br_if $label$21
                     (i32.eqz
                      (select
                       (local.tee $9
                        (i64.lt_u
                         (local.get $3)
                         (local.get $16)
                        )
                       )
                       (i64.lt_u
                        (local.get $4)
                        (local.get $17)
                       )
                       (i64.eq
                        (local.get $4)
                        (local.get $17)
                       )
                      )
                     )
                    )
                    (local.set $7
                     (i64.sub
                      (i64.sub
                       (local.get $17)
                       (local.get $4)
                      )
                      (i64.extend_i32_u
                       (i64.lt_u
                        (local.get $16)
                        (local.get $3)
                       )
                      )
                     )
                    )
                    (local.set $8
                     (i64.sub
                      (local.get $16)
                      (local.get $3)
                     )
                    )
                    (br $label$4)
                   )
                   (local.set $7
                    (i64.sub
                     (i64.sub
                      (local.get $4)
                      (local.get $17)
                     )
                     (i64.extend_i32_u
                      (local.get $9)
                     )
                    )
                   )
                   (local.set $8
                    (i64.sub
                     (local.get $3)
                     (local.get $16)
                    )
                   )
                   (local.set $15
                    (local.get $10)
                   )
                   (br $label$4)
                  )
                  (br_if $label$4
                   (i32.eqz
                    (select
                     (local.tee $9
                      (i64.lt_u
                       (local.tee $8
                        (i64.add
                         (local.get $3)
                         (local.get $16)
                        )
                       )
                       (local.get $3)
                      )
                     )
                     (i64.lt_u
                      (local.tee $7
                       (i64.add
                        (i64.add
                         (local.get $4)
                         (local.get $17)
                        )
                        (i64.extend_i32_u
                         (local.get $9)
                        )
                       )
                      )
                      (local.get $4)
                     )
                     (i64.eq
                      (local.get $7)
                      (local.get $4)
                     )
                    )
                   )
                  )
                  (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
                   (i32.const 1049820)
                  )
                  (unreachable)
                 )
                 (block $label$22
                  (br_if $label$22
                   (i32.and
                    (local.get $15)
                    (i32.const 1)
                   )
                  )
                  (block $label$23
                   (br_if $label$23
                    (i64.ne
                     (i64.and
                      (local.get $4)
                      (local.get $1)
                     )
                     (i64.const 0)
                    )
                   )
                   (br_if $label$8
                    (i64.eqz
                     (local.tee $3
                      (i64.add
                       (local.get $4)
                       (i64.const 1)
                      )
                     )
                    )
                   )
                   (br $label$5)
                  )
                  (local.set $3
                   (i64.add
                    (local.get $4)
                    (i64.const -1)
                   )
                  )
                  (br $label$5)
                 )
                 (block $label$24
                  (br_if $label$24
                   (i64.ne
                    (i64.and
                     (local.tee $3
                      (i64.xor
                       (local.get $4)
                       (local.get $1)
                      )
                     )
                     (local.get $1)
                    )
                    (i64.const 0)
                   )
                  )
                  (br_if $label$7
                   (i64.eqz
                    (local.tee $3
                     (i64.add
                      (local.get $3)
                      (i64.const 1)
                     )
                    )
                   )
                  )
                  (br $label$6)
                 )
                 (block $label$25
                  (br_if $label$25
                   (i64.eq
                    (local.get $4)
                    (local.get $1)
                   )
                  )
                  (local.set $3
                   (i64.add
                    (local.get $3)
                    (i64.const -1)
                   )
                  )
                  (br $label$6)
                 )
                 (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
                  (i32.const 1049484)
                 )
                 (unreachable)
                )
                (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
                 (i32.const 1049836)
                )
                (unreachable)
               )
               (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
                (i32.const 1049852)
               )
               (unreachable)
              )
              (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
               (i32.const 1049868)
              )
              (unreachable)
             )
             (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
              (i32.const 1049836)
             )
             (unreachable)
            )
            (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
             (i32.const 1049852)
            )
            (unreachable)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
            (i32.const 1049868)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
           (i32.const 1049788)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
          (i32.const 1049804)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
         (i32.const 1049468)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
        (i32.const 1049468)
       )
       (unreachable)
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $5)
        (i32.const 48)
       )
       (local.get $1)
       (local.get $2)
       (local.get $3)
      )
      (block $label$26
       (br_if $label$26
        (i32.eqz
         (i32.load8_u offset=48
          (local.get $5)
         )
        )
       )
       (i32.store8 offset=1
        (local.get $0)
        (i32.const 5)
       )
       (i32.store8
        (local.get $0)
        (i32.const 1)
       )
       (br $label$1)
      )
      (local.set $3
       (i64.load offset=56
        (local.get $5)
       )
      )
      (i64.store offset=16
       (local.get $0)
       (local.get $4)
      )
      (i64.store offset=8
       (local.get $0)
       (select
        (i64.const 0)
        (i64.xor
         (local.get $3)
         (local.get $1)
        )
        (i64.eqz
         (local.get $3)
        )
       )
      )
      (i32.store8
       (local.get $0)
       (i32.const 0)
      )
      (br $label$1)
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $5)
       (i32.const 48)
      )
      (local.get $1)
      (local.get $2)
      (local.get $3)
     )
     (block $label$27
      (br_if $label$27
       (i32.eqz
        (i32.load8_u offset=48
         (local.get $5)
        )
       )
      )
      (i32.store8 offset=1
       (local.get $0)
       (i32.const 5)
      )
      (i32.store8
       (local.get $0)
       (i32.const 1)
      )
      (br $label$1)
     )
     (i64.store offset=16
      (local.get $0)
      (i64.load offset=56
       (local.get $5)
      )
     )
     (i64.store offset=8
      (local.get $0)
      (local.get $4)
     )
     (i32.store8
      (local.get $0)
      (i32.const 0)
     )
     (br $label$1)
    )
    (i64.store offset=48
     (local.get $5)
     (local.get $8)
    )
    (i32.store offset=64
     (local.get $5)
     (local.get $6)
    )
    (i64.store offset=56
     (local.get $5)
     (local.get $7)
    )
    (i32.store8 offset=68
     (local.get $5)
     (i32.and
      (local.get $15)
      (i32.const 1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format7rounded17h18a254a9a730a5d0E.llvm.3547746728100167404
     (local.get $0)
     (local.get $1)
     (local.get $2)
     (i32.add
      (local.get $5)
      (i32.const 48)
     )
    )
    (br $label$1)
   )
   (i64.store offset=16
    (local.get $0)
    (local.get $3)
   )
   (i64.store offset=8
    (local.get $0)
    (local.get $3)
   )
   (i32.store8
    (local.get $0)
    (i32.const 0)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 80)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 144)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
   (i32.add
    (local.get $5)
    (i32.const 48)
   )
   (local.get $1)
   (local.get $2)
   (local.get $3)
  )
  (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
   (i32.add
    (local.get $5)
    (i32.const 80)
   )
   (local.get $1)
   (local.get $2)
   (local.get $4)
  )
  (call $__multi3
   (i32.add
    (local.get $5)
    (i32.const 16)
   )
   (local.tee $3
    (i64.load offset=56
     (local.get $5)
    )
   )
   (i64.const 0)
   (local.tee $4
    (i64.load offset=80
     (local.get $5)
    )
   )
   (i64.const 0)
  )
  (call $__multi3
   (local.get $5)
   (local.tee $6
    (i64.load offset=88
     (local.get $5)
    )
   )
   (i64.const 0)
   (local.tee $7
    (i64.load offset=48
     (local.get $5)
    )
   )
   (i64.const 0)
  )
  (call $__multi3
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
   (local.get $7)
   (i64.const 0)
   (local.get $4)
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.or
      (i32.or
       (i32.or
        (i32.and
         (i64.ne
          (local.get $3)
          (i64.const 0)
         )
         (i64.ne
          (local.get $6)
          (i64.const 0)
         )
        )
        (i64.ne
         (i64.load offset=24
          (local.get $5)
         )
         (i64.const 0)
        )
       )
       (i64.ne
        (i64.load offset=8
         (local.get $5)
        )
        (i64.const 0)
       )
      )
      (i64.lt_u
       (local.tee $4
        (i64.add
         (local.tee $3
          (i64.load offset=40
           (local.get $5)
          )
         )
         (i64.add
          (i64.load offset=16
           (local.get $5)
          )
          (i64.load
           (local.get $5)
          )
         )
        )
       )
       (local.get $3)
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.xor
       (i32.lt_s
        (local.tee $8
         (i32.load offset=96
          (local.get $5)
         )
        )
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $8
         (i32.add
          (local.tee $9
           (i32.load offset=64
            (local.get $5)
           )
          )
          (local.get $8)
         )
        )
        (local.get $9)
       )
      )
     )
    )
    (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
     (i32.const 1049900)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_mul_overflow17h632c39c9542fff9dE
    (i32.const 1049884)
   )
   (unreachable)
  )
  (local.set $9
   (i32.load8_u offset=100
    (local.get $5)
   )
  )
  (local.set $10
   (i32.load8_u offset=68
    (local.get $5)
   )
  )
  (i64.store offset=112
   (local.get $5)
   (i64.load offset=32
    (local.get $5)
   )
  )
  (i32.store offset=128
   (local.get $5)
   (local.get $8)
  )
  (i64.store offset=120
   (local.get $5)
   (local.get $4)
  )
  (i32.store8 offset=132
   (local.get $5)
   (i32.ne
    (i32.and
     (local.get $10)
     (i32.const 255)
    )
    (i32.and
     (local.get $9)
     (i32.const 255)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format7rounded17h18a254a9a730a5d0E.llvm.3547746728100167404
   (local.get $0)
   (local.get $1)
   (local.get $2)
   (i32.add
    (local.get $5)
    (i32.const 112)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 144)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format8add_wide17hfb433c6dfcd20526E.llvm.3547746728100167404 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i64)
  (local $15 i64)
  (local $16 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 160)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.ne
      (i64.or
       (local.tee $6
        (i64.load
         (local.get $3)
        )
       )
       (local.tee $7
        (i64.load offset=8
         (local.get $3)
        )
       )
      )
      (i64.const 0)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format7rounded17h18a254a9a730a5d0E.llvm.3547746728100167404
     (local.get $0)
     (local.get $1)
     (local.get $2)
     (local.get $4)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i64.eqz
      (i64.or
       (local.tee $8
        (i64.load
         (local.get $4)
        )
       )
       (local.tee $9
        (i64.load offset=8
         (local.get $4)
        )
       )
      )
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
            (block $label$12
             (block $label$13
              (block $label$14
               (br_if $label$14
                (i32.lt_s
                 (local.tee $11
                  (i32.add
                   (local.tee $10
                    (i32.load offset=16
                     (local.get $3)
                    )
                   )
                   (i32.const 127)
                  )
                 )
                 (local.get $10)
                )
               )
               (br_if $label$13
                (i32.lt_s
                 (local.tee $13
                  (i32.add
                   (local.tee $12
                    (i32.load offset=16
                     (local.get $4)
                    )
                   )
                   (i32.const 127)
                  )
                 )
                 (local.get $12)
                )
               )
               (br_if $label$6
                (i32.ge_s
                 (local.tee $11
                  (i32.add
                   (local.tee $13
                    (select
                     (local.tee $13
                      (i32.sub
                       (local.get $13)
                       (i32.wrap_i64
                        (select
                         (i64.clz
                          (local.get $9)
                         )
                         (i64.add
                          (i64.clz
                           (local.get $8)
                          )
                          (i64.const 64)
                         )
                         (i64.ne
                          (local.get $9)
                          (i64.const 0)
                         )
                        )
                       )
                      )
                     )
                     (local.tee $11
                      (i32.sub
                       (local.get $11)
                       (i32.wrap_i64
                        (select
                         (i64.clz
                          (local.get $7)
                         )
                         (i64.add
                          (i64.clz
                           (local.get $6)
                          )
                          (i64.const 64)
                         )
                         (i64.ne
                          (local.get $7)
                          (i64.const 0)
                         )
                        )
                       )
                      )
                     )
                     (i32.gt_s
                      (local.get $13)
                      (local.get $11)
                     )
                    )
                   )
                   (i32.const -126)
                  )
                 )
                 (local.get $13)
                )
               )
               (br_if $label$12
                (i32.xor
                 (i32.gt_s
                  (local.get $11)
                  (i32.const 0)
                 )
                 (i32.lt_s
                  (local.tee $13
                   (i32.sub
                    (local.get $10)
                    (local.get $11)
                   )
                  )
                  (local.get $10)
                 )
                )
               )
               (local.set $10
                (i32.load8_u offset=20
                 (local.get $3)
                )
               )
               (block $label$15
                (block $label$16
                 (br_if $label$16
                  (i32.gt_s
                   (local.get $13)
                   (i32.const -1)
                  )
                 )
                 (br_if $label$11
                  (i32.eq
                   (local.get $13)
                   (i32.const -2147483648)
                  )
                 )
                 (local.set $14
                  (i64.const 0)
                 )
                 (local.set $15
                  (i64.const 0)
                 )
                 (block $label$17
                  (br_if $label$17
                   (i32.lt_u
                    (local.get $13)
                    (i32.const -127)
                   )
                  )
                  (local.set $16
                   (i32.const 0)
                  )
                  (call $__lshrti3
                   (i32.add
                    (local.get $5)
                    (i32.const 64)
                   )
                   (local.get $6)
                   (local.get $7)
                   (local.tee $3
                    (i32.sub
                     (i32.const 0)
                     (local.get $13)
                    )
                   )
                  )
                  (call $__ashlti3
                   (i32.add
                    (local.get $5)
                    (i32.const 80)
                   )
                   (i64.const -1)
                   (i64.const -1)
                   (local.get $3)
                  )
                  (local.set $15
                   (i64.load offset=72
                    (local.get $5)
                   )
                  )
                  (local.set $14
                   (i64.load offset=64
                    (local.get $5)
                   )
                  )
                  (br_if $label$15
                   (i64.eqz
                    (i64.or
                     (i64.and
                      (local.get $6)
                      (i64.xor
                       (i64.load offset=80
                        (local.get $5)
                       )
                       (i64.const -1)
                      )
                     )
                     (i64.and
                      (local.get $7)
                      (i64.xor
                       (i64.load offset=88
                        (local.get $5)
                       )
                       (i64.const -1)
                      )
                     )
                    )
                   )
                  )
                 )
                 (local.set $16
                  (select
                   (i32.const -1)
                   (i32.const 1)
                   (i32.and
                    (local.get $10)
                    (i32.const 1)
                   )
                  )
                 )
                 (br $label$15)
                )
                (br_if $label$10
                 (i32.ge_u
                  (local.get $13)
                  (i32.const 128)
                 )
                )
                (call $__ashlti3
                 (i32.add
                  (local.get $5)
                  (i32.const 48)
                 )
                 (local.get $6)
                 (local.get $7)
                 (local.get $13)
                )
                (local.set $16
                 (i32.const 0)
                )
                (local.set $15
                 (i64.load offset=56
                  (local.get $5)
                 )
                )
                (local.set $14
                 (i64.load offset=48
                  (local.get $5)
                 )
                )
               )
               (br_if $label$9
                (i32.xor
                 (i32.gt_s
                  (local.get $11)
                  (i32.const 0)
                 )
                 (i32.lt_s
                  (local.tee $3
                   (i32.sub
                    (local.get $12)
                    (local.get $11)
                   )
                  )
                  (local.get $12)
                 )
                )
               )
               (local.set $4
                (i32.load8_u offset=20
                 (local.get $4)
                )
               )
               (block $label$18
                (block $label$19
                 (br_if $label$19
                  (i32.gt_s
                   (local.get $3)
                   (i32.const -1)
                  )
                 )
                 (br_if $label$8
                  (i32.eq
                   (local.get $3)
                   (i32.const -2147483648)
                  )
                 )
                 (local.set $6
                  (i64.const 0)
                 )
                 (local.set $7
                  (i64.const 0)
                 )
                 (block $label$20
                  (br_if $label$20
                   (i32.lt_u
                    (local.get $3)
                    (i32.const -127)
                   )
                  )
                  (local.set $13
                   (i32.const 0)
                  )
                  (call $__lshrti3
                   (i32.add
                    (local.get $5)
                    (i32.const 16)
                   )
                   (local.get $8)
                   (local.get $9)
                   (local.tee $3
                    (i32.sub
                     (i32.const 0)
                     (local.get $3)
                    )
                   )
                  )
                  (call $__ashlti3
                   (i32.add
                    (local.get $5)
                    (i32.const 32)
                   )
                   (i64.const -1)
                   (i64.const -1)
                   (local.get $3)
                  )
                  (local.set $7
                   (i64.load offset=24
                    (local.get $5)
                   )
                  )
                  (local.set $6
                   (i64.load offset=16
                    (local.get $5)
                   )
                  )
                  (br_if $label$18
                   (i64.eqz
                    (i64.or
                     (i64.and
                      (local.get $8)
                      (i64.xor
                       (i64.load offset=32
                        (local.get $5)
                       )
                       (i64.const -1)
                      )
                     )
                     (i64.and
                      (local.get $9)
                      (i64.xor
                       (i64.load offset=40
                        (local.get $5)
                       )
                       (i64.const -1)
                      )
                     )
                    )
                   )
                  )
                 )
                 (local.set $13
                  (select
                   (i32.const -1)
                   (i32.const 1)
                   (i32.and
                    (local.get $4)
                    (i32.const 1)
                   )
                  )
                 )
                 (br $label$18)
                )
                (br_if $label$7
                 (i32.ge_u
                  (local.get $3)
                  (i32.const 128)
                 )
                )
                (call $__ashlti3
                 (local.get $5)
                 (local.get $8)
                 (local.get $9)
                 (local.get $3)
                )
                (local.set $13
                 (i32.const 0)
                )
                (local.set $7
                 (i64.load offset=8
                  (local.get $5)
                 )
                )
                (local.set $6
                 (i64.load
                  (local.get $5)
                 )
                )
               )
               (block $label$21
                (br_if $label$21
                 (i32.eq
                  (i32.and
                   (local.get $10)
                   (i32.const 255)
                  )
                  (i32.and
                   (local.get $4)
                   (i32.const 255)
                  )
                 )
                )
                (block $label$22
                 (br_if $label$22
                  (i32.eqz
                   (select
                    (local.tee $3
                     (i64.lt_u
                      (local.get $14)
                      (local.get $6)
                     )
                    )
                    (i64.lt_u
                     (local.get $15)
                     (local.get $7)
                    )
                    (i64.eq
                     (local.get $15)
                     (local.get $7)
                    )
                   )
                  )
                 )
                 (local.set $7
                  (i64.sub
                   (i64.sub
                    (local.get $7)
                    (local.get $15)
                   )
                   (i64.extend_i32_u
                    (i64.lt_u
                     (local.get $6)
                     (local.get $14)
                    )
                   )
                  )
                 )
                 (local.set $9
                  (i64.sub
                   (local.get $6)
                   (local.get $14)
                  )
                 )
                 (br $label$4)
                )
                (local.set $7
                 (i64.sub
                  (i64.sub
                   (local.get $15)
                   (local.get $7)
                  )
                  (i64.extend_i32_u
                   (local.get $3)
                  )
                 )
                )
                (local.set $9
                 (i64.sub
                  (local.get $14)
                  (local.get $6)
                 )
                )
                (br $label$5)
               )
               (br_if $label$5
                (i32.eqz
                 (select
                  (local.tee $3
                   (i64.lt_u
                    (local.tee $9
                     (i64.add
                      (local.get $14)
                      (local.get $6)
                     )
                    )
                    (local.get $14)
                   )
                  )
                  (i64.lt_u
                   (local.tee $7
                    (i64.add
                     (i64.add
                      (local.get $15)
                      (local.get $7)
                     )
                     (i64.extend_i32_u
                      (local.get $3)
                     )
                    )
                   )
                   (local.get $15)
                  )
                  (i64.eq
                   (local.get $7)
                   (local.get $15)
                  )
                 )
                )
               )
               (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
                (i32.const 1049948)
               )
               (unreachable)
              )
              (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
               (i32.const 1049916)
              )
              (unreachable)
             )
             (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
              (i32.const 1049916)
             )
             (unreachable)
            )
            (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
             (i32.const 1049964)
            )
            (unreachable)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_neg_overflow17ha2120557937cff01E
            (i32.const 1049980)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
           (i32.const 1049996)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
          (i32.const 1049964)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_neg_overflow17ha2120557937cff01E
         (i32.const 1049980)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
        (i32.const 1049996)
       )
       (unreachable)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
       (i32.const 1049932)
      )
      (unreachable)
     )
     (local.set $4
      (local.get $10)
     )
    )
    (i64.store offset=136
     (local.get $5)
     (local.get $7)
    )
    (i64.store offset=128
     (local.get $5)
     (local.get $9)
    )
    (i32.store offset=144
     (local.get $5)
     (local.get $11)
    )
    (i32.store8 offset=148
     (local.get $5)
     (i32.and
      (local.get $4)
      (i32.const 1)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format7rounded17h18a254a9a730a5d0E.llvm.3547746728100167404
     (i32.add
      (local.get $5)
      (i32.const 104)
     )
     (local.get $1)
     (local.get $2)
     (i32.add
      (local.get $5)
      (i32.const 128)
     )
    )
    (block $label$23
     (br_if $label$23
      (i32.eqz
       (i32.load8_u offset=104
        (local.get $5)
       )
      )
     )
     (local.set $3
      (i32.load8_u offset=105
       (local.get $5)
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
    (block $label$24
     (br_if $label$24
      (i64.ne
       (local.tee $7
        (i64.load offset=112
         (local.get $5)
        )
       )
       (local.tee $9
        (i64.load offset=120
         (local.get $5)
        )
       )
      )
     )
     (block $label$25
      (block $label$26
       (block $label$27
        (block $label$28
         (block $label$29
          (block $label$30
           (br_table $label$30 $label$24 $label$29 $label$24
            (i32.add
             (i32.add
              (local.get $13)
              (local.get $16)
             )
             (i32.const 1)
            )
           )
          )
          (block $label$31
           (br_if $label$31
            (i64.ne
             (i64.and
              (local.tee $9
               (select
                (i64.const 0)
                (i64.xor
                 (local.get $7)
                 (local.get $1)
                )
                (i64.eqz
                 (local.get $7)
                )
               )
              )
              (local.get $1)
             )
             (i64.const 0)
            )
           )
           (br_if $label$28
            (i64.eqz
             (local.tee $9
              (i64.add
               (local.get $9)
               (i64.const 1)
              )
             )
            )
           )
           (br $label$25)
          )
          (block $label$32
           (br_if $label$32
            (i64.eqz
             (local.get $9)
            )
           )
           (local.set $9
            (i64.add
             (local.get $9)
             (i64.const -1)
            )
           )
           (br $label$25)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
           (i32.const 1049484)
          )
          (unreachable)
         )
         (block $label$33
          (br_if $label$33
           (i64.ne
            (i64.and
             (local.get $7)
             (local.get $1)
            )
            (i64.const 0)
           )
          )
          (br_if $label$27
           (i64.eqz
            (local.tee $9
             (i64.add
              (local.get $7)
              (i64.const 1)
             )
            )
           )
          )
          (br $label$26)
         )
         (block $label$34
          (br_if $label$34
           (i64.eqz
            (local.get $7)
           )
          )
          (local.set $9
           (i64.add
            (local.get $7)
            (i64.const -1)
           )
          )
          (br $label$26)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
          (i32.const 1049484)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
         (i32.const 1049468)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
        (i32.const 1049468)
       )
       (unreachable)
      )
      (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
       (i32.add
        (local.get $5)
        (i32.const 128)
       )
       (local.get $1)
       (local.get $2)
       (local.get $9)
      )
      (block $label$35
       (br_if $label$35
        (i32.eqz
         (i32.load8_u offset=128
          (local.get $5)
         )
        )
       )
       (i32.store16
        (local.get $0)
        (i32.const 1281)
       )
       (br $label$1)
      )
      (i64.store offset=16
       (local.get $0)
       (i64.load offset=136
        (local.get $5)
       )
      )
      (i64.store offset=8
       (local.get $0)
       (local.get $7)
      )
      (i32.store8
       (local.get $0)
       (i32.const 0)
      )
      (br $label$1)
     )
     (call $_ZN13hyperinterval4ieee6Format6finite17h55a77e5c66093816E
      (i32.add
       (local.get $5)
       (i32.const 128)
      )
      (local.get $1)
      (local.get $2)
      (local.get $9)
     )
     (block $label$36
      (br_if $label$36
       (i32.eqz
        (i32.load8_u offset=128
         (local.get $5)
        )
       )
      )
      (i32.store16
       (local.get $0)
       (i32.const 1281)
      )
      (br $label$1)
     )
     (local.set $2
      (i64.load offset=136
       (local.get $5)
      )
     )
     (i64.store offset=16
      (local.get $0)
      (local.get $7)
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
        (local.get $2)
        (local.get $1)
       )
       (i64.eqz
        (local.get $2)
       )
      )
     )
     (br $label$1)
    )
    (i64.store offset=16
     (local.get $0)
     (local.get $9)
    )
    (i64.store offset=8
     (local.get $0)
     (local.get $7)
    )
    (i32.store8
     (local.get $0)
     (i32.const 0)
    )
    (br $label$1)
   )
   (call $_ZN13hyperinterval4ieee6Format7rounded17h18a254a9a730a5d0E.llvm.3547746728100167404
    (local.get $0)
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 160)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format6affine17h863b42e14750a82bE (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64) (param $5 i64)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (global.set $__stack_pointer
   (local.tee $6
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 176)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
   (i32.add
    (local.get $6)
    (i32.const 48)
   )
   (local.get $1)
   (local.get $2)
   (local.get $3)
  )
  (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
   (i32.add
    (local.get $6)
    (i32.const 80)
   )
   (local.get $1)
   (local.get $2)
   (local.get $4)
  )
  (call $__multi3
   (i32.add
    (local.get $6)
    (i32.const 16)
   )
   (local.tee $3
    (i64.load offset=56
     (local.get $6)
    )
   )
   (i64.const 0)
   (local.tee $4
    (i64.load offset=80
     (local.get $6)
    )
   )
   (i64.const 0)
  )
  (call $__multi3
   (local.get $6)
   (local.tee $7
    (i64.load offset=88
     (local.get $6)
    )
   )
   (i64.const 0)
   (local.tee $8
    (i64.load offset=48
     (local.get $6)
    )
   )
   (i64.const 0)
  )
  (call $__multi3
   (i32.add
    (local.get $6)
    (i32.const 32)
   )
   (local.get $8)
   (i64.const 0)
   (local.get $4)
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i32.or
      (i32.or
       (i32.or
        (i32.and
         (i64.ne
          (local.get $3)
          (i64.const 0)
         )
         (i64.ne
          (local.get $7)
          (i64.const 0)
         )
        )
        (i64.ne
         (i64.load offset=24
          (local.get $6)
         )
         (i64.const 0)
        )
       )
       (i64.ne
        (i64.load offset=8
         (local.get $6)
        )
        (i64.const 0)
       )
      )
      (i64.lt_u
       (local.tee $4
        (i64.add
         (local.tee $3
          (i64.load offset=40
           (local.get $6)
          )
         )
         (i64.add
          (i64.load offset=16
           (local.get $6)
          )
          (i64.load
           (local.get $6)
          )
         )
        )
       )
       (local.get $3)
      )
     )
    )
    (br_if $label$1
     (i32.eqz
      (i32.xor
       (i32.lt_s
        (local.tee $9
         (i32.load offset=96
          (local.get $6)
         )
        )
        (i32.const 0)
       )
       (i32.lt_s
        (local.tee $9
         (i32.add
          (local.tee $10
           (i32.load offset=64
            (local.get $6)
           )
          )
          (local.get $9)
         )
        )
        (local.get $10)
       )
      )
     )
    )
    (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
     (i32.const 1050028)
    )
    (unreachable)
   )
   (call $_ZN4core9panicking11panic_const24panic_const_mul_overflow17h632c39c9542fff9dE
    (i32.const 1050012)
   )
   (unreachable)
  )
  (local.set $10
   (i32.load8_u offset=100
    (local.get $6)
   )
  )
  (local.set $11
   (i32.load8_u offset=68
    (local.get $6)
   )
  )
  (i64.store offset=112
   (local.get $6)
   (i64.load offset=32
    (local.get $6)
   )
  )
  (i32.store offset=128
   (local.get $6)
   (local.get $9)
  )
  (i64.store offset=120
   (local.get $6)
   (local.get $4)
  )
  (i32.store8 offset=132
   (local.get $6)
   (i32.ne
    (i32.and
     (local.get $11)
     (i32.const 255)
    )
    (i32.and
     (local.get $10)
     (i32.const 255)
    )
   )
  )
  (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
   (i32.add
    (local.get $6)
    (i32.const 144)
   )
   (local.get $1)
   (local.get $2)
   (local.get $5)
  )
  (call $_ZN13hyperinterval4ieee6Format8add_wide17hfb433c6dfcd20526E.llvm.3547746728100167404
   (local.get $0)
   (local.get $1)
   (local.get $2)
   (i32.add
    (local.get $6)
    (i32.const 112)
   )
   (i32.add
    (local.get $6)
    (i32.const 144)
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $6)
    (i32.const 176)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format3div17hbfdd7146bfc24e86E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i64)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i64)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 208)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.ne
      (local.get $4)
      (i64.const 0)
     )
    )
    (i32.store16
     (local.get $0)
     (i32.const 1537)
    )
    (br $label$1)
   )
   (block $label$3
    (br_if $label$3
     (i64.eqz
      (local.get $3)
     )
    )
    (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
     (i32.add
      (local.get $5)
      (i32.const 128)
     )
     (local.get $1)
     (local.get $2)
     (local.get $3)
    )
    (call $_ZN13hyperinterval4ieee6Format6decode17h190204e25df7c4aaE.llvm.3547746728100167404
     (i32.add
      (local.get $5)
      (i32.const 160)
     )
     (local.get $1)
     (local.get $2)
     (local.get $4)
    )
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
                  (block $label$18
                   (block $label$19
                    (br_if $label$19
                     (i32.lt_s
                      (local.tee $9
                       (i32.sub
                        (local.tee $7
                         (i32.wrap_i64
                          (select
                           (i64.clz
                            (local.tee $4
                             (i64.load offset=168
                              (local.get $5)
                             )
                            )
                           )
                           (i64.add
                            (i64.clz
                             (local.tee $6
                              (i64.load offset=160
                               (local.get $5)
                              )
                             )
                            )
                            (i64.const 64)
                           )
                           (i64.ne
                            (local.get $4)
                            (i64.const 0)
                           )
                          )
                         )
                        )
                        (i32.wrap_i64
                         (select
                          (i64.clz
                           (local.tee $3
                            (i64.load offset=136
                             (local.get $5)
                            )
                           )
                          )
                          (i64.add
                           (i64.clz
                            (local.tee $8
                             (i64.load offset=128
                              (local.get $5)
                             )
                            )
                           )
                           (i64.const 64)
                          )
                          (i64.ne
                           (local.get $3)
                           (i64.const 0)
                          )
                         )
                        )
                       )
                      )
                      (i32.const 0)
                     )
                    )
                    (br_if $label$16
                     (i32.ge_u
                      (local.get $9)
                      (i32.const 128)
                     )
                    )
                    (call $__ashlti3
                     (i32.add
                      (local.get $5)
                      (i32.const 96)
                     )
                     (local.get $6)
                     (local.get $4)
                     (local.get $9)
                    )
                    (local.set $11
                     (select
                      (i64.lt_u
                       (local.get $8)
                       (i64.load offset=96
                        (local.get $5)
                       )
                      )
                      (i64.lt_u
                       (local.get $3)
                       (local.tee $10
                        (i64.load offset=104
                         (local.get $5)
                        )
                       )
                      )
                      (i64.eq
                       (local.get $3)
                       (local.get $10)
                      )
                     )
                    )
                    (br $label$18)
                   )
                   (br_if $label$17
                    (i32.gt_u
                     (local.tee $12
                      (i32.sub
                       (i32.const 0)
                       (local.get $9)
                      )
                     )
                     (i32.const 127)
                    )
                   )
                   (call $__ashlti3
                    (i32.add
                     (local.get $5)
                     (i32.const 112)
                    )
                    (local.get $8)
                    (local.get $3)
                    (local.get $12)
                   )
                   (local.set $11
                    (select
                     (i64.lt_u
                      (i64.load offset=112
                       (local.get $5)
                      )
                      (local.get $6)
                     )
                     (i64.lt_u
                      (local.tee $10
                       (i64.load offset=120
                        (local.get $5)
                       )
                      )
                      (local.get $4)
                     )
                     (i64.eq
                      (local.get $10)
                      (local.get $4)
                     )
                    )
                   )
                  )
                  (br_if $label$15
                   (i32.xor
                    (i32.gt_s
                     (local.tee $12
                      (i32.load offset=176
                       (local.get $5)
                      )
                     )
                     (i32.const 0)
                    )
                    (i32.lt_s
                     (local.tee $12
                      (i32.sub
                       (local.tee $13
                        (i32.load offset=144
                         (local.get $5)
                        )
                       )
                       (local.get $12)
                      )
                     )
                     (local.get $13)
                    )
                   )
                  )
                  (br_if $label$13
                   (i32.xor
                    (i32.lt_s
                     (local.tee $9
                      (i32.sub
                       (local.get $9)
                       (local.get $11)
                      )
                     )
                     (i32.const 0)
                    )
                    (i32.lt_s
                     (local.tee $9
                      (i32.add
                       (local.get $12)
                       (local.get $9)
                      )
                     )
                     (local.get $12)
                    )
                   )
                  )
                  (br_if $label$14
                   (i64.ge_u
                    (local.tee $10
                     (i64.ctz
                      (local.get $2)
                     )
                    )
                    (i64.const 64)
                   )
                  )
                  (local.set $13
                   (i32.const 5)
                  )
                  (br_if $label$4
                   (i32.gt_s
                    (local.get $9)
                    (local.tee $11
                     (i32.wrap_i64
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
                  (br_if $label$12
                   (i32.xor
                    (i32.gt_s
                     (local.get $11)
                     (i32.const 0)
                    )
                    (i32.lt_s
                     (local.tee $11
                      (i32.sub
                       (i32.const 1)
                       (local.get $11)
                      )
                     )
                     (i32.const 1)
                    )
                   )
                  )
                  (br_if $label$11
                   (i32.xor
                    (i32.gt_s
                     (local.tee $13
                      (i32.wrap_i64
                       (local.get $10)
                      )
                     )
                     (i32.const 0)
                    )
                    (i32.lt_s
                     (local.tee $14
                      (i32.sub
                       (local.get $11)
                       (local.get $13)
                      )
                     )
                     (local.get $11)
                    )
                   )
                  )
                  (br_if $label$10
                   (i32.xor
                    (i32.gt_s
                     (local.get $13)
                     (i32.const 0)
                    )
                    (i32.lt_s
                     (local.tee $13
                      (i32.sub
                       (local.get $9)
                       (local.get $13)
                      )
                     )
                     (local.get $9)
                    )
                   )
                  )
                  (br_if $label$9
                   (i32.xor
                    (i32.gt_s
                     (local.tee $13
                      (select
                       (local.get $13)
                       (local.get $14)
                       (i32.gt_s
                        (local.get $13)
                        (local.get $14)
                       )
                      )
                     )
                     (i32.const 0)
                    )
                    (i32.lt_s
                     (local.tee $9
                      (i32.sub
                       (local.get $12)
                       (local.get $13)
                      )
                     )
                     (local.get $12)
                    )
                   )
                  )
                  (block $label$20
                   (br_if $label$20
                    (i32.gt_s
                     (local.get $9)
                     (i32.const -1)
                    )
                   )
                   (block $label$21
                    (block $label$22
                     (br_if $label$22
                      (i32.eq
                       (local.get $9)
                       (i32.const -2147483648)
                      )
                     )
                     (br_if $label$21
                      (i32.le_u
                       (local.tee $12
                        (i32.sub
                         (i32.const 0)
                         (local.get $9)
                        )
                       )
                       (local.get $7)
                      )
                     )
                     (local.set $10
                      (i64.const 0)
                     )
                     (local.set $12
                      (i32.const 1)
                     )
                     (local.set $15
                      (i64.const 0)
                     )
                     (br $label$5)
                    )
                    (call $_ZN4core9panicking11panic_const24panic_const_neg_overflow17ha2120557937cff01E
                     (i32.const 1050140)
                    )
                    (unreachable)
                   )
                   (br_if $label$8
                    (i32.gt_u
                     (local.get $12)
                     (i32.const 127)
                    )
                   )
                   (call $__ashlti3
                    (i32.add
                     (local.get $5)
                     (i32.const 80)
                    )
                    (local.get $6)
                    (local.get $4)
                    (local.get $12)
                   )
                   (br_if $label$7
                    (i64.eqz
                     (i64.or
                      (local.tee $4
                       (i64.load offset=80
                        (local.get $5)
                       )
                      )
                      (local.tee $6
                       (i64.load offset=88
                        (local.get $5)
                       )
                      )
                     )
                    )
                   )
                   (call $__udivti3
                    (i32.add
                     (local.get $5)
                     (i32.const 64)
                    )
                    (local.get $8)
                    (local.get $3)
                    (local.get $4)
                    (local.get $6)
                   )
                   (call $__multi3
                    (i32.add
                     (local.get $5)
                     (i32.const 48)
                    )
                    (local.tee $10
                     (i64.load offset=64
                      (local.get $5)
                     )
                    )
                    (local.tee $15
                     (i64.load offset=72
                      (local.get $5)
                     )
                    )
                    (local.get $4)
                    (local.get $6)
                   )
                   (local.set $12
                    (i64.ne
                     (i64.or
                      (i64.sub
                       (local.get $8)
                       (local.tee $4
                        (i64.load offset=48
                         (local.get $5)
                        )
                       )
                      )
                      (i64.sub
                       (i64.sub
                        (local.get $3)
                        (i64.load offset=56
                         (local.get $5)
                        )
                       )
                       (i64.extend_i32_u
                        (i64.lt_u
                         (local.get $8)
                         (local.get $4)
                        )
                       )
                      )
                     )
                     (i64.const 0)
                    )
                   )
                   (br $label$5)
                  )
                  (br_if $label$6
                   (i32.ge_u
                    (local.get $9)
                    (i32.const 128)
                   )
                  )
                  (block $label$23
                   (br_if $label$23
                    (i64.eqz
                     (i64.or
                      (local.get $6)
                      (local.get $4)
                     )
                    )
                   )
                   (call $__ashlti3
                    (i32.add
                     (local.get $5)
                     (i32.const 32)
                    )
                    (local.get $8)
                    (local.get $3)
                    (local.get $9)
                   )
                   (call $__udivti3
                    (i32.add
                     (local.get $5)
                     (i32.const 16)
                    )
                    (local.tee $3
                     (i64.load offset=32
                      (local.get $5)
                     )
                    )
                    (local.tee $8
                     (i64.load offset=40
                      (local.get $5)
                     )
                    )
                    (local.get $6)
                    (local.get $4)
                   )
                   (call $__multi3
                    (local.get $5)
                    (local.tee $10
                     (i64.load offset=16
                      (local.get $5)
                     )
                    )
                    (local.tee $15
                     (i64.load offset=24
                      (local.get $5)
                     )
                    )
                    (local.get $6)
                    (local.get $4)
                   )
                   (local.set $12
                    (i64.ne
                     (i64.or
                      (i64.sub
                       (local.get $3)
                       (local.tee $4
                        (i64.load
                         (local.get $5)
                        )
                       )
                      )
                      (i64.sub
                       (i64.sub
                        (local.get $8)
                        (i64.load offset=8
                         (local.get $5)
                        )
                       )
                       (i64.extend_i32_u
                        (i64.lt_u
                         (local.get $3)
                         (local.get $4)
                        )
                       )
                      )
                     )
                     (i64.const 0)
                    )
                   )
                   (br $label$5)
                  )
                  (call $_ZN4core9panicking11panic_const23panic_const_div_by_zero17h4c3e4eaedd711717E
                   (i32.const 1050204)
                  )
                  (unreachable)
                 )
                 (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
                  (i32.const 1050044)
                 )
                 (unreachable)
                )
                (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
                 (i32.const 1050060)
                )
                (unreachable)
               )
               (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
                (i32.const 1050076)
               )
               (unreachable)
              )
              (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
               (i32.const 1050252)
              )
              (unreachable)
             )
             (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
              (i32.const 1050092)
             )
             (unreachable)
            )
            (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
             (i32.const 1050268)
            )
            (unreachable)
           )
           (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
            (i32.const 1050268)
           )
           (unreachable)
          )
          (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
           (i32.const 1050108)
          )
          (unreachable)
         )
         (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
          (i32.const 1050124)
         )
         (unreachable)
        )
        (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
         (i32.const 1050156)
        )
        (unreachable)
       )
       (call $_ZN4core9panicking11panic_const23panic_const_div_by_zero17h4c3e4eaedd711717E
        (i32.const 1050172)
       )
       (unreachable)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_shl_overflow17hb9c433c6ba707cc9E
       (i32.const 1050188)
      )
      (unreachable)
     )
     (call $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404
      (i32.add
       (local.get $5)
       (i32.const 192)
      )
      (local.get $2)
      (local.get $10)
      (local.get $15)
      (local.get $13)
     )
     (block $label$24
      (br_if $label$24
       (i32.load8_u offset=192
        (local.get $5)
       )
      )
      (block $label$25
       (br_if $label$25
        (select
         (local.tee $12
          (i64.lt_u
           (local.tee $4
            (i64.add
             (local.get $10)
             (i64.extend_i32_u
              (local.get $12)
             )
            )
           )
           (local.get $10)
          )
         )
         (i64.lt_u
          (local.tee $6
           (i64.add
            (local.get $15)
            (i64.extend_i32_u
             (local.get $12)
            )
           )
          )
          (local.get $15)
         )
         (i64.ge_u
          (local.get $4)
          (local.get $10)
         )
        )
       )
       (local.set $3
        (i64.load offset=200
         (local.get $5)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format6encode17h43cbe79eba5520c4E.llvm.3547746728100167404
        (i32.add
         (local.get $5)
         (i32.const 192)
        )
        (local.get $2)
        (local.get $4)
        (local.get $6)
        (local.get $13)
       )
       (br_if $label$24
        (i32.load8_u offset=192
         (local.get $5)
        )
       )
       (local.set $2
        (i64.load offset=200
         (local.get $5)
        )
       )
       (block $label$26
        (block $label$27
         (br_if $label$27
          (i32.ne
           (i32.load8_u offset=148
            (local.get $5)
           )
           (i32.load8_u offset=180
            (local.get $5)
           )
          )
         )
         (local.set $4
          (local.get $2)
         )
         (br $label$26)
        )
        (local.set $4
         (select
          (i64.const 0)
          (i64.xor
           (local.get $3)
           (local.get $1)
          )
          (i64.eqz
           (local.get $3)
          )
         )
        )
        (local.set $3
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
        (local.get $4)
       )
       (i64.store offset=8
        (local.get $0)
        (local.get $3)
       )
       (i32.store8
        (local.get $0)
        (i32.const 0)
       )
       (br $label$1)
      )
      (call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hffbd5a30fd1bec0cE
       (i32.const 1050220)
      )
      (unreachable)
     )
     (local.set $13
      (i32.load8_u offset=193
       (local.get $5)
      )
     )
    )
    (i32.store8
     (local.get $0)
     (i32.const 1)
    )
    (i32.store8 offset=1
     (local.get $0)
     (local.get $13)
    )
    (br $label$1)
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
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 208)
   )
  )
 )
 (func $_ZN13hyperinterval4ieee6Format5power17h301e1115ffe557c4E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i32)
  (local $10 i64)
  (local $11 i32)
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
      (br_if $label$4
       (i64.eqz
        (local.get $1)
       )
      )
      (br_if $label$3
       (i64.ge_u
        (local.tee $6
         (i64.ctz
          (local.get $2)
         )
        )
        (i64.const 64)
       )
      )
      (local.set $7
       (i64.shl
        (i64.shr_s
         (i64.shl
          (i64.shr_u
           (local.get $2)
           (local.get $6)
          )
          (i64.const 31)
         )
         (i64.const 32)
        )
        (local.get $6)
       )
      )
      (block $label$5
       (br_if $label$5
        (local.get $4)
       )
       (local.set $8
        (local.get $7)
       )
       (br $label$2)
      )
      (local.set $9
       (local.get $4)
      )
      (local.set $8
       (local.get $7)
      )
      (local.set $6
       (local.tee $10
        (i64.and
         (local.get $3)
         (i64.add
          (local.get $1)
          (i64.const -1)
         )
        )
       )
      )
      (loop $label$6
       (block $label$7
        (br_if $label$7
         (i32.eqz
          (i32.and
           (local.tee $11
            (local.get $9)
           )
           (i32.const 1)
          )
         )
        )
        (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
         (i32.add
          (local.get $5)
          (i32.const 8)
         )
         (local.get $1)
         (local.get $2)
         (local.get $8)
         (local.get $6)
        )
        (block $label$8
         (br_if $label$8
          (i32.eqz
           (i32.load8_u offset=8
            (local.get $5)
           )
          )
         )
         (i32.store8 offset=1
          (local.get $0)
          (i32.load8_u offset=9
           (local.get $5)
          )
         )
         (local.set $11
          (i32.const 1)
         )
         (br $label$1)
        )
        (local.set $8
         (i64.load offset=16
          (local.get $5)
         )
        )
        (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
         (i32.add
          (local.get $5)
          (i32.const 8)
         )
         (local.get $1)
         (local.get $2)
         (local.get $7)
         (local.get $10)
        )
        (block $label$9
         (br_if $label$9
          (i32.ne
           (i32.load8_u offset=8
            (local.get $5)
           )
           (i32.const 1)
          )
         )
         (i32.store8 offset=1
          (local.get $0)
          (i32.load8_u offset=9
           (local.get $5)
          )
         )
         (local.set $11
          (i32.const 1)
         )
         (br $label$1)
        )
        (local.set $7
         (i64.load offset=24
          (local.get $5)
         )
        )
       )
       (br_if $label$2
        (i32.eq
         (local.get $11)
         (i32.const 1)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $5)
         (i32.const 8)
        )
        (local.get $1)
        (local.get $2)
        (local.get $6)
        (local.get $6)
       )
       (block $label$10
        (br_if $label$10
         (i32.eqz
          (i32.load8_u offset=8
           (local.get $5)
          )
         )
        )
        (i32.store8 offset=1
         (local.get $0)
         (i32.load8_u offset=9
          (local.get $5)
         )
        )
        (local.set $11
         (i32.const 1)
        )
        (br $label$1)
       )
       (local.set $6
        (i64.load offset=16
         (local.get $5)
        )
       )
       (call $_ZN13hyperinterval4ieee6Format3mul17ha7514957f2dbc099E
        (i32.add
         (local.get $5)
         (i32.const 8)
        )
        (local.get $1)
        (local.get $2)
        (local.get $10)
        (local.get $10)
       )
       (block $label$11
        (br_if $label$11
         (i32.ne
          (i32.load8_u offset=8
           (local.get $5)
          )
          (i32.const 1)
         )
        )
        (i32.store8 offset=1
         (local.get $0)
         (i32.load8_u offset=9
          (local.get $5)
         )
        )
        (local.set $11
         (i32.const 1)
        )
        (br $label$1)
       )
       (local.set $9
        (i32.shr_u
         (local.get $11)
         (i32.const 1)
        )
       )
       (local.set $10
        (i64.load offset=24
         (local.get $5)
        )
       )
       (br_if $label$2
        (i32.eqz
         (local.get $11)
        )
       )
       (br $label$6)
      )
     )
     (call $_ZN4core9panicking11panic_const24panic_const_sub_overflow17h9d68bf31226d49d6E
      (i32.const 1050236)
     )
     (unreachable)
    )
    (call $_ZN4core9panicking11panic_const24panic_const_shr_overflow17hca81dcf66ec710e8E
     (i32.const 1050252)
    )
    (unreachable)
   )
   (block $label$12
    (block $label$13
     (br_if $label$13
      (i32.and
       (i64.ne
        (i64.and
         (local.get $3)
         (local.get $1)
        )
        (i64.const 0)
       )
       (local.get $4)
      )
     )
     (local.set $2
      (local.get $7)
     )
     (br $label$12)
    )
    (local.set $2
     (select
      (i64.const 0)
      (i64.xor
       (local.get $8)
       (local.get $1)
      )
      (i64.eqz
       (local.get $8)
      )
     )
    )
    (local.set $8
     (select
      (i64.const 0)
      (i64.xor
       (local.get $7)
       (local.get $1)
      )
      (i64.eqz
       (local.get $7)
      )
     )
    )
   )
   (i64.store offset=16
    (local.get $0)
    (local.get $2)
   )
   (i64.store offset=8
    (local.get $0)
    (local.get $8)
   )
   (local.set $11
    (i32.const 0)
   )
  )
  (i32.store8
   (local.get $0)
   (local.get $11)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
  )
 )
 (func $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17h48d866395682d7a9E (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (i64.store offset=8
   (local.get $0)
   (select
    (local.get $4)
    (local.get $2)
    (i64.lt_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.get $2)
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $2)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $2)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.get $4)
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $4)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $4)
       (i64.const 0)
      )
     )
    )
   )
  )
  (i64.store
   (local.get $0)
   (select
    (local.get $3)
    (local.get $1)
    (i64.gt_u
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.get $1)
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $1)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $1)
       (i64.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.get $3)
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $3)
       (i64.const 0)
      )
     )
    )
   )
  )
 )
 (func $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$4hull17hddcef4a18fee1ab8E (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i64)
  (i32.store offset=4
   (local.get $0)
   (select
    (local.get $4)
    (local.get $2)
    (i64.lt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $5
         (i64.extend_i32_u
          (local.get $2)
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $5
         (i64.extend_i32_u
          (local.get $4)
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $4)
       (i32.const 0)
      )
     )
    )
   )
  )
  (i32.store
   (local.get $0)
   (select
    (local.get $3)
    (local.get $1)
    (i64.gt_u
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $5
         (i64.extend_i32_u
          (local.get $1)
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $1)
       (i32.const 0)
      )
     )
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $5
         (i64.extend_i32_u
          (local.get $3)
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $5)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $3)
       (i32.const 0)
      )
     )
    )
   )
  )
 )
 (func $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$5signs17h6acfd502fe9b132dE (param $0 i64) (param $1 i64) (param $2 i64) (result i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i64)
  (local.set $4
   (i64.lt_u
    (local.tee $3
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.get $0)
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $0)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $0)
       (i64.const 0)
      )
     )
    )
    (local.tee $2
     (select
      (i64.sub
       (i64.const -9223372036854775808)
       (i64.and
        (local.get $2)
        (i64.const 9223372036854775807)
       )
      )
      (i64.or
       (local.get $2)
       (i64.const -9223372036854775808)
      )
      (i64.lt_s
       (local.get $2)
       (i64.const 0)
      )
     )
    )
   )
  )
  (local.set $0
   (i64.or
    (local.get $1)
    (i64.const -9223372036854775808)
   )
  )
  (local.set $5
   (i64.sub
    (i64.const -9223372036854775808)
    (i64.and
     (local.get $1)
     (i64.const 9223372036854775807)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i64.gt_u
     (local.get $3)
     (local.get $2)
    )
   )
   (local.set $4
    (select
     (local.get $4)
     (i32.or
      (local.get $4)
      (i32.const 2)
     )
     (i64.gt_u
      (local.get $2)
      (select
       (local.get $5)
       (local.get $0)
       (i64.lt_s
        (local.get $1)
        (i64.const 0)
       )
      )
     )
    )
   )
  )
  (select
   (i32.or
    (local.get $4)
    (i32.const 4)
   )
   (local.get $4)
   (i64.gt_u
    (select
     (local.get $5)
     (local.get $0)
     (i64.lt_s
      (local.get $1)
      (i64.const 0)
     )
    )
    (local.get $2)
   )
  )
 )
 (func $_ZN13hyperinterval6bounds15Bounds$LT$T$GT$5signs17h8a34f0220ad92c0fE (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local.set $2
   (i64.lt_u
    (local.tee $4
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $3
         (i64.extend_i32_u
          (local.get $0)
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $0)
       (i32.const 0)
      )
     )
    )
    (local.tee $3
     (select
      (i64.sub
       (i64.const 2147483648)
       (i64.and
        (local.tee $3
         (i64.extend_i32_u
          (local.get $2)
         )
        )
        (i64.const 2147483647)
       )
      )
      (i64.or
       (local.get $3)
       (i64.const 2147483648)
      )
      (i32.lt_s
       (local.get $2)
       (i32.const 0)
      )
     )
    )
   )
  )
  (local.set $6
   (i64.or
    (local.tee $5
     (i64.extend_i32_u
      (local.get $1)
     )
    )
    (i64.const 2147483648)
   )
  )
  (local.set $5
   (i64.sub
    (i64.const 2147483648)
    (i64.and
     (local.get $5)
     (i64.const 2147483647)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i64.gt_u
     (local.get $4)
     (local.get $3)
    )
   )
   (local.set $2
    (select
     (local.get $2)
     (i32.or
      (local.get $2)
      (i32.const 2)
     )
     (i64.gt_u
      (local.get $3)
      (select
       (local.get $5)
       (local.get $6)
       (i32.lt_s
        (local.get $1)
        (i32.const 0)
       )
      )
     )
    )
   )
  )
  (select
   (i32.or
    (local.get $2)
    (i32.const 4)
   )
   (local.get $2)
   (i64.gt_u
    (select
     (local.get $5)
     (local.get $6)
     (i32.lt_s
      (local.get $1)
      (i32.const 0)
     )
    )
    (local.get $3)
   )
  )
 )
 (func $_ZN13hyperinterval4sqrt19integer_sqrt_bounds17hd020d82fdb9785b6E (param $0 i32) (param $1 i64) (param $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (local $14 i64)
  (local $15 i32)
  (global.set $__stack_pointer
   (local.tee $3
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 112)
    )
   )
  )
  (block $label$1
   (block $label$2
    (br_if $label$2
     (i64.eqz
      (local.get $2)
     )
    )
    (call $__ashlti3
     (i32.add
      (local.get $3)
      (i32.const 96)
     )
     (local.get $1)
     (local.get $2)
     (i32.and
      (local.tee $4
       (i32.wrap_i64
        (select
         (i64.clz
          (local.get $2)
         )
         (i64.add
          (i64.clz
           (local.get $1)
          )
          (i64.const 64)
         )
         (i64.ne
          (local.get $2)
          (i64.const 0)
         )
        )
       )
      )
      (i32.const 126)
     )
    )
    (call $__udivti3
     (i32.add
      (local.get $3)
      (i32.const 80)
     )
     (i64.or
      (i64.shr_u
       (local.tee $5
        (i64.load offset=96
         (local.get $3)
        )
       )
       (i64.const 32)
      )
      (i64.shl
       (local.tee $12
        (i64.add
         (i64.sub
          (local.tee $12
           (i64.or
            (i64.shl
             (i64.sub
              (local.tee $11
               (i64.or
                (i64.shl
                 (i64.extend_i32_u
                  (i32.add
                   (i32.sub
                    (local.tee $9
                     (i32.or
                      (i32.shl
                       (i32.sub
                        (local.tee $9
                         (i32.or
                          (i32.shl
                           (i32.and
                            (i32.add
                             (i32.sub
                              (local.tee $9
                               (i32.or
                                (i32.shl
                                 (i32.sub
                                  (local.tee $8
                                   (i32.or
                                    (i32.shl
                                     (i32.load8_u
                                      (i32.add
                                       (local.tee $7
                                        (i32.shl
                                         (i32.wrap_i64
                                          (i64.shr_u
                                           (local.tee $6
                                            (i64.load offset=104
                                             (local.get $3)
                                            )
                                           )
                                           (i64.const 56)
                                          )
                                         )
                                         (i32.const 1)
                                        )
                                       )
                                       (i32.const 1050317)
                                      )
                                     )
                                     (i32.const 4)
                                    )
                                    (i32.and
                                     (i32.wrap_i64
                                      (i64.shr_u
                                       (local.get $6)
                                       (i64.const 52)
                                      )
                                     )
                                     (i32.const 15)
                                    )
                                   )
                                  )
                                  (i32.mul
                                   (local.tee $7
                                    (i32.div_u
                                     (i32.and
                                      (local.get $8)
                                      (i32.const 65535)
                                     )
                                     (local.tee $9
                                      (i32.shl
                                       (local.tee $8
                                        (i32.load8_u
                                         (i32.add
                                          (local.get $7)
                                          (i32.const 1050316)
                                         )
                                        )
                                       )
                                       (i32.const 1)
                                      )
                                     )
                                    )
                                   )
                                   (local.get $9)
                                  )
                                 )
                                 (i32.const 4)
                                )
                                (i32.and
                                 (i32.wrap_i64
                                  (i64.shr_u
                                   (local.get $6)
                                   (i64.const 48)
                                  )
                                 )
                                 (i32.const 15)
                                )
                               )
                              )
                              (local.tee $10
                               (i32.mul
                                (local.get $7)
                                (local.get $7)
                               )
                              )
                             )
                             (select
                              (i32.add
                               (i32.shl
                                (local.tee $7
                                 (i32.add
                                  (local.get $7)
                                  (i32.and
                                   (i32.shl
                                    (local.get $8)
                                    (i32.const 4)
                                   )
                                   (i32.const 240)
                                  )
                                 )
                                )
                                (i32.const 1)
                               )
                               (i32.const -1)
                              )
                              (i32.const 0)
                              (local.tee $8
                               (i32.lt_u
                                (i32.and
                                 (local.get $9)
                                 (i32.const 65535)
                                )
                                (i32.and
                                 (local.get $10)
                                 (i32.const 65535)
                                )
                               )
                              )
                             )
                            )
                            (i32.const 65535)
                           )
                           (i32.const 8)
                          )
                          (i32.and
                           (i32.wrap_i64
                            (i64.shr_u
                             (local.get $6)
                             (i64.const 40)
                            )
                           )
                           (i32.const 255)
                          )
                         )
                        )
                        (i32.mul
                         (local.tee $7
                          (i32.div_u
                           (local.get $9)
                           (local.tee $10
                            (i32.shl
                             (i32.and
                              (local.tee $8
                               (i32.sub
                                (local.get $7)
                                (local.get $8)
                               )
                              )
                              (i32.const 65535)
                             )
                             (i32.const 1)
                            )
                           )
                          )
                         )
                         (local.get $10)
                        )
                       )
                       (i32.const 8)
                      )
                      (i32.and
                       (i32.wrap_i64
                        (i64.shr_u
                         (local.get $6)
                         (i64.const 32)
                        )
                       )
                       (i32.const 255)
                      )
                     )
                    )
                    (local.tee $10
                     (i32.mul
                      (local.get $7)
                      (local.get $7)
                     )
                    )
                   )
                   (select
                    (i32.add
                     (i32.shl
                      (local.tee $7
                       (i32.add
                        (local.get $7)
                        (i32.and
                         (i32.shl
                          (local.get $8)
                          (i32.const 8)
                         )
                         (i32.const 65280)
                        )
                       )
                      )
                      (i32.const 1)
                     )
                     (i32.const -1)
                    )
                    (i32.const 0)
                    (local.tee $8
                     (i32.lt_u
                      (local.get $9)
                      (local.get $10)
                     )
                    )
                   )
                  )
                 )
                 (i64.const 16)
                )
                (i64.and
                 (i64.shr_u
                  (local.get $6)
                  (i64.const 16)
                 )
                 (i64.const 65535)
                )
               )
              )
              (i64.mul
               (local.tee $11
                (i64.div_u
                 (local.get $11)
                 (local.tee $12
                  (i64.shl
                   (i64.extend_i32_u
                    (local.tee $7
                     (i32.sub
                      (local.get $7)
                      (local.get $8)
                     )
                    )
                   )
                   (i64.const 1)
                  )
                 )
                )
               )
               (local.get $12)
              )
             )
             (i64.const 16)
            )
            (i64.and
             (local.get $6)
             (i64.const 65535)
            )
           )
          )
          (local.tee $13
           (i64.mul
            (local.get $11)
            (local.get $11)
           )
          )
         )
         (select
          (i64.add
           (i64.shl
            (local.tee $11
             (i64.add
              (local.get $11)
              (i64.extend_i32_u
               (i32.shl
                (local.get $7)
                (i32.const 16)
               )
              )
             )
            )
            (i64.const 1)
           )
           (i64.const -1)
          )
          (i64.const 0)
          (local.tee $7
           (i64.lt_u
            (local.get $12)
            (local.get $13)
           )
          )
         )
        )
       )
       (i64.const 32)
      )
     )
     (i64.shr_u
      (local.get $12)
      (i64.const 32)
     )
     (i64.shl
      (local.tee $11
       (i64.sub
        (local.get $11)
        (i64.extend_i32_u
         (local.get $7)
        )
       )
      )
      (i64.const 1)
     )
     (i64.shr_u
      (local.get $11)
      (i64.const 63)
     )
    )
    (call $__multi3
     (i32.add
      (local.get $3)
      (i32.const 32)
     )
     (local.tee $12
      (i64.add
       (i64.load offset=88
        (local.get $3)
       )
       (i64.extend_i32_u
        (i64.lt_u
         (local.tee $11
          (i64.add
           (local.tee $12
            (i64.load offset=80
             (local.get $3)
            )
           )
           (i64.shl
            (local.get $11)
            (i64.const 32)
           )
          )
         )
         (local.get $12)
        )
       )
      )
     )
     (i64.const 0)
     (local.get $11)
     (i64.const 0)
    )
    (call $__multi3
     (i32.add
      (local.get $3)
      (i32.const 64)
     )
     (local.get $11)
     (i64.const 0)
     (local.get $11)
     (i64.const 0)
    )
    (call $__lshrti3
     (i32.add
      (local.get $3)
      (i32.const 48)
     )
     (i64.sub
      (local.get $11)
      (local.tee $6
       (i64.extend_i32_u
        (i32.or
         (i32.or
          (i64.ne
           (i64.or
            (local.get $12)
            (i64.load offset=40
             (local.get $3)
            )
           )
           (i64.const 0)
          )
          (i64.lt_u
           (local.tee $13
            (i64.add
             (local.tee $14
              (i64.load offset=72
               (local.get $3)
              )
             )
             (i64.add
              (local.tee $13
               (i64.load offset=32
                (local.get $3)
               )
              )
              (local.get $13)
             )
            )
           )
           (local.get $14)
          )
         )
         (select
          (i64.gt_u
           (i64.load offset=64
            (local.get $3)
           )
           (local.get $5)
          )
          (i64.gt_u
           (local.get $13)
           (local.get $6)
          )
          (i64.eq
           (local.get $13)
           (local.get $6)
          )
         )
        )
       )
      )
     )
     (i64.sub
      (local.get $12)
      (i64.extend_i32_u
       (i64.lt_u
        (local.get $11)
        (local.get $6)
       )
      )
     )
     (i32.shr_u
      (local.get $4)
      (i32.const 1)
     )
    )
    (local.set $11
     (i64.load offset=56
      (local.get $3)
     )
    )
    (local.set $6
     (i64.load offset=48
      (local.get $3)
     )
    )
    (br $label$1)
   )
   (block $label$3
    (block $label$4
     (br_if $label$4
      (i64.lt_u
       (local.get $1)
       (i64.const 4294967296)
      )
     )
     (call $__multi3
      (i32.add
       (local.get $3)
       (i32.const 16)
      )
      (local.tee $11
       (i64.add
        (i64.div_u
         (i64.or
          (i64.shl
           (i64.extend_i32_u
            (i32.add
             (i32.sub
              (local.tee $8
               (i32.or
                (i32.shl
                 (i32.sub
                  (local.tee $8
                   (i32.or
                    (i32.shl
                     (i32.and
                      (i32.add
                       (i32.sub
                        (local.tee $8
                         (i32.or
                          (i32.shl
                           (i32.sub
                            (local.tee $4
                             (i32.or
                              (i32.shl
                               (i32.load8_u
                                (i32.add
                                 (local.tee $7
                                  (i32.shl
                                   (i32.wrap_i64
                                    (i64.shr_u
                                     (local.tee $6
                                      (i64.shl
                                       (local.get $1)
                                       (i64.and
                                        (local.tee $12
                                         (i64.clz
                                          (local.get $1)
                                         )
                                        )
                                        (i64.const 62)
                                       )
                                      )
                                     )
                                     (i64.const 56)
                                    )
                                   )
                                   (i32.const 1)
                                  )
                                 )
                                 (i32.const 1050317)
                                )
                               )
                               (i32.const 4)
                              )
                              (i32.and
                               (i32.wrap_i64
                                (i64.shr_u
                                 (local.get $6)
                                 (i64.const 52)
                                )
                               )
                               (i32.const 15)
                              )
                             )
                            )
                            (i32.mul
                             (local.tee $7
                              (i32.div_u
                               (i32.and
                                (local.get $4)
                                (i32.const 65535)
                               )
                               (local.tee $8
                                (i32.shl
                                 (local.tee $4
                                  (i32.load8_u
                                   (i32.add
                                    (local.get $7)
                                    (i32.const 1050316)
                                   )
                                  )
                                 )
                                 (i32.const 1)
                                )
                               )
                              )
                             )
                             (local.get $8)
                            )
                           )
                           (i32.const 4)
                          )
                          (i32.and
                           (i32.wrap_i64
                            (i64.shr_u
                             (local.get $6)
                             (i64.const 48)
                            )
                           )
                           (i32.const 15)
                          )
                         )
                        )
                        (local.tee $9
                         (i32.mul
                          (local.get $7)
                          (local.get $7)
                         )
                        )
                       )
                       (select
                        (i32.add
                         (i32.shl
                          (local.tee $7
                           (i32.add
                            (local.get $7)
                            (i32.and
                             (i32.shl
                              (local.get $4)
                              (i32.const 4)
                             )
                             (i32.const 240)
                            )
                           )
                          )
                          (i32.const 1)
                         )
                         (i32.const -1)
                        )
                        (i32.const 0)
                        (local.tee $4
                         (i32.lt_u
                          (i32.and
                           (local.get $8)
                           (i32.const 65535)
                          )
                          (i32.and
                           (local.get $9)
                           (i32.const 65535)
                          )
                         )
                        )
                       )
                      )
                      (i32.const 65535)
                     )
                     (i32.const 8)
                    )
                    (i32.and
                     (i32.wrap_i64
                      (i64.shr_u
                       (local.get $6)
                       (i64.const 40)
                      )
                     )
                     (i32.const 255)
                    )
                   )
                  )
                  (i32.mul
                   (local.tee $7
                    (i32.div_u
                     (local.get $8)
                     (local.tee $9
                      (i32.shl
                       (i32.and
                        (local.tee $4
                         (i32.sub
                          (local.get $7)
                          (local.get $4)
                         )
                        )
                        (i32.const 65535)
                       )
                       (i32.const 1)
                      )
                     )
                    )
                   )
                   (local.get $9)
                  )
                 )
                 (i32.const 8)
                )
                (i32.and
                 (i32.wrap_i64
                  (i64.shr_u
                   (local.get $6)
                   (i64.const 32)
                  )
                 )
                 (i32.const 255)
                )
               )
              )
              (local.tee $9
               (i32.mul
                (local.get $7)
                (local.get $7)
               )
              )
             )
             (select
              (i32.add
               (i32.shl
                (local.tee $7
                 (i32.add
                  (local.get $7)
                  (i32.and
                   (i32.shl
                    (local.get $4)
                    (i32.const 8)
                   )
                   (i32.const 65280)
                  )
                 )
                )
                (i32.const 1)
               )
               (i32.const -1)
              )
              (i32.const 0)
              (local.tee $4
               (i32.lt_u
                (local.get $8)
                (local.get $9)
               )
              )
             )
            )
           )
           (i64.const 16)
          )
          (i64.and
           (i64.shr_u
            (local.get $6)
            (i64.const 16)
           )
           (i64.const 65535)
          )
         )
         (i64.shl
          (i64.extend_i32_u
           (local.tee $7
            (i32.sub
             (local.get $7)
             (local.get $4)
            )
           )
          )
          (i64.const 1)
         )
        )
        (i64.extend_i32_u
         (i32.shl
          (local.get $7)
          (i32.const 16)
         )
        )
       )
      )
      (i64.const 0)
      (local.get $11)
      (i64.const 0)
     )
     (local.set $6
      (i64.shr_u
       (i64.sub
        (local.get $11)
        (i64.extend_i32_u
         (i32.or
          (i64.ne
           (i64.load offset=24
            (local.get $3)
           )
           (i64.const 0)
          )
          (i64.gt_u
           (i64.load offset=16
            (local.get $3)
           )
           (local.get $6)
          )
         )
        )
       )
       (i64.shr_u
        (local.get $12)
        (i64.const 1)
       )
      )
     )
     (br $label$3)
    )
    (local.set $7
     (i32.wrap_i64
      (local.get $1)
     )
    )
    (block $label$5
     (block $label$6
      (br_if $label$6
       (i64.lt_u
        (local.get $1)
        (i64.const 65536)
       )
      )
      (local.set $7
       (i32.shr_u
        (i32.sub
         (local.tee $4
          (i32.add
           (i32.div_u
            (i32.or
             (i32.shl
              (i32.and
               (i32.add
                (i32.sub
                 (local.tee $10
                  (i32.or
                   (i32.shl
                    (i32.sub
                     (local.tee $9
                      (i32.or
                       (i32.shl
                        (i32.load8_u
                         (i32.add
                          (local.tee $4
                           (i32.and
                            (i32.shr_u
                             (local.tee $7
                              (i32.shl
                               (local.get $7)
                               (i32.and
                                (local.tee $8
                                 (i32.clz
                                  (local.get $7)
                                 )
                                )
                                (i32.const 30)
                               )
                              )
                             )
                             (i32.const 23)
                            )
                            (i32.const 510)
                           )
                          )
                          (i32.const 1050317)
                         )
                        )
                        (i32.const 4)
                       )
                       (i32.and
                        (i32.shr_u
                         (local.get $7)
                         (i32.const 20)
                        )
                        (i32.const 15)
                       )
                      )
                     )
                     (i32.mul
                      (local.tee $4
                       (i32.div_u
                        (i32.and
                         (local.get $9)
                         (i32.const 65535)
                        )
                        (local.tee $10
                         (i32.shl
                          (local.tee $9
                           (i32.load8_u
                            (i32.add
                             (local.get $4)
                             (i32.const 1050316)
                            )
                           )
                          )
                          (i32.const 1)
                         )
                        )
                       )
                      )
                      (local.get $10)
                     )
                    )
                    (i32.const 4)
                   )
                   (i32.and
                    (i32.shr_u
                     (local.get $7)
                     (i32.const 16)
                    )
                    (i32.const 15)
                   )
                  )
                 )
                 (local.tee $15
                  (i32.mul
                   (local.get $4)
                   (local.get $4)
                  )
                 )
                )
                (select
                 (i32.add
                  (i32.shl
                   (local.tee $4
                    (i32.add
                     (local.get $4)
                     (i32.and
                      (i32.shl
                       (local.get $9)
                       (i32.const 4)
                      )
                      (i32.const 240)
                     )
                    )
                   )
                   (i32.const 1)
                  )
                  (i32.const -1)
                 )
                 (i32.const 0)
                 (local.tee $9
                  (i32.lt_u
                   (i32.and
                    (local.get $10)
                    (i32.const 65535)
                   )
                   (i32.and
                    (local.get $15)
                    (i32.const 65535)
                   )
                  )
                 )
                )
               )
               (i32.const 65535)
              )
              (i32.const 8)
             )
             (i32.and
              (i32.shr_u
               (local.get $7)
               (i32.const 8)
              )
              (i32.const 255)
             )
            )
            (i32.shl
             (i32.and
              (local.tee $4
               (i32.sub
                (local.get $4)
                (local.get $9)
               )
              )
              (i32.const 65535)
             )
             (i32.const 1)
            )
           )
           (i32.and
            (i32.shl
             (local.get $4)
             (i32.const 8)
            )
            (i32.const 65280)
           )
          )
         )
         (i32.or
          (i32.ne
           (i32.wrap_i64
            (i64.shr_u
             (local.tee $6
              (i64.mul
               (local.tee $6
                (i64.extend_i32_u
                 (local.get $4)
                )
               )
               (local.get $6)
              )
             )
             (i64.const 32)
            )
           )
           (i32.const 0)
          )
          (i32.gt_u
           (i32.wrap_i64
            (local.get $6)
           )
           (local.get $7)
          )
         )
        )
        (i32.shr_u
         (local.get $8)
         (i32.const 1)
        )
       )
      )
      (br $label$5)
     )
     (block $label$7
      (br_if $label$7
       (i64.lt_u
        (local.get $1)
        (i64.const 256)
       )
      )
      (local.set $7
       (i32.shr_u
        (i32.and
         (i32.sub
          (local.tee $4
           (i32.add
            (i32.div_u
             (i32.or
              (i32.shl
               (i32.load8_u
                (i32.add
                 (local.tee $4
                  (i32.and
                   (i32.shr_u
                    (local.tee $7
                     (i32.shl
                      (local.get $7)
                      (i32.and
                       (local.tee $8
                        (i32.clz
                         (i32.shl
                          (local.get $7)
                          (i32.const 16)
                         )
                        )
                       )
                       (i32.const 14)
                      )
                     )
                    )
                    (i32.const 7)
                   )
                   (i32.const 510)
                  )
                 )
                 (i32.const 1050317)
                )
               )
               (i32.const 4)
              )
              (i32.and
               (i32.shr_u
                (local.get $7)
                (i32.const 4)
               )
               (i32.const 15)
              )
             )
             (i32.shl
              (local.tee $4
               (i32.load8_u
                (i32.add
                 (local.get $4)
                 (i32.const 1050316)
                )
               )
              )
              (i32.const 1)
             )
            )
            (i32.and
             (i32.shl
              (local.get $4)
              (i32.const 4)
             )
             (i32.const 240)
            )
           )
          )
          (i32.or
           (i32.ne
            (i32.shr_u
             (local.tee $4
              (i32.mul
               (local.get $4)
               (local.get $4)
              )
             )
             (i32.const 16)
            )
            (i32.const 0)
           )
           (i32.gt_u
            (i32.and
             (local.get $4)
             (i32.const 65535)
            )
            (i32.and
             (local.get $7)
             (i32.const 65535)
            )
           )
          )
         )
         (i32.const 65535)
        )
        (i32.shr_u
         (local.get $8)
         (i32.const 1)
        )
       )
      )
      (br $label$5)
     )
     (local.set $7
      (i32.load8_u
       (i32.add
        (i32.shl
         (local.get $7)
         (i32.const 1)
        )
        (i32.const 1050316)
       )
      )
     )
    )
    (local.set $6
     (i64.extend_i32_u
      (local.get $7)
     )
    )
   )
   (local.set $11
    (i64.const 0)
   )
  )
  (call $__multi3
   (local.get $3)
   (local.get $6)
   (local.get $11)
   (local.get $6)
   (local.get $11)
  )
  (i64.store
   (local.get $0)
   (local.get $6)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $11)
  )
  (i64.store offset=16
   (local.get $0)
   (local.tee $1
    (i64.add
     (local.get $6)
     (i64.extend_i32_u
      (i64.ne
       (i64.or
        (i64.xor
         (i64.load
          (local.get $3)
         )
         (local.get $1)
        )
        (i64.xor
         (i64.load offset=8
          (local.get $3)
         )
         (local.get $2)
        )
       )
       (i64.const 0)
      )
     )
    )
   )
  )
  (i64.store offset=24
   (local.get $0)
   (i64.add
    (local.get $11)
    (i64.extend_i32_u
     (i64.lt_u
      (local.get $1)
      (local.get $6)
     )
    )
   )
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $3)
    (i32.const 112)
   )
  )
 )
 (func $_ZN4core9panicking18panic_bounds_check17h7a037824b9c6d60fE (param $0 i32) (param $1 i32) (param $2 i32)
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
   (i32.const 1051140)
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
       (i32.const 2)
      )
      (i64.const 32)
     )
    )
    (i64.extend_i32_u
     (local.get $3)
    )
   )
  )
  (i64.store offset=32
   (local.get $3)
   (i64.or
    (local.get $4)
    (i64.extend_i32_u
     (i32.add
      (local.get $3)
      (i32.const 4)
     )
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
     (call_indirect $0 (type $3)
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
    (call_indirect $0 (type $3)
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
 (func $_ZN4core9panicking11panic_const23panic_const_div_by_zero17h4c3e4eaedd711717E (param $0 i32)
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
   (i32.const 1051404)
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
       (i32.const 1051177)
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
       (i32.const 1051176)
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
       (i32.const 1051177)
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
       (i32.const 1051176)
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
      (i32.const 1051177)
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
      (i32.const 1051176)
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
      (i32.const 1051177)
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
      (call_indirect $0 (type $3)
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
     (call_indirect $0 (type $3)
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
    (call_indirect $0 (type $3)
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
   (i32.const 1051160)
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
      (i32.const 3)
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
      (i32.const 4)
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
   (i32.const 1051080)
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
      (i32.const 4)
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
  (call_indirect $0 (type $3)
   (local.get $0)
   (local.get $3)
   (local.get $4)
   (i32.load offset=12
    (local.get $1)
   )
  )
 )
 (func $_ZN4core3fmt9Formatter9write_str17h5f591b7d46bcc7dbE (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (call_indirect $0 (type $3)
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
   (i32.const 1050856)
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
   (i32.const 1050900)
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
 (func $_ZN4core9panicking11panic_const24panic_const_mul_overflow17h632c39c9542fff9dE (param $0 i32)
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
   (i32.const 1050944)
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
 (func $_ZN4core9panicking11panic_const24panic_const_neg_overflow17ha2120557937cff01E (param $0 i32)
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
   (i32.const 1050984)
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
   (i32.const 1051028)
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
   (i32.const 1051072)
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
 (func $__multi3 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (i64.store
   (local.get $0)
   (local.tee $10
    (i64.add
     (local.tee $7
      (i64.mul
       (local.tee $5
        (i64.and
         (local.get $3)
         (i64.const 4294967295)
        )
       )
       (local.tee $6
        (i64.and
         (local.get $1)
         (i64.const 4294967295)
        )
       )
      )
     )
     (i64.shl
      (local.tee $5
       (i64.add
        (local.tee $6
         (i64.mul
          (local.tee $8
           (i64.shr_u
            (local.get $3)
            (i64.const 32)
           )
          )
          (local.get $6)
         )
        )
        (i64.mul
         (local.get $5)
         (local.tee $9
          (i64.shr_u
           (local.get $1)
           (i64.const 32)
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
  (i64.store offset=8
   (local.get $0)
   (i64.add
    (i64.add
     (i64.add
      (i64.mul
       (local.get $8)
       (local.get $9)
      )
      (i64.or
       (i64.shl
        (i64.extend_i32_u
         (i64.lt_u
          (local.get $5)
          (local.get $6)
         )
        )
        (i64.const 32)
       )
       (i64.shr_u
        (local.get $5)
        (i64.const 32)
       )
      )
     )
     (i64.extend_i32_u
      (i64.lt_u
       (local.get $10)
       (local.get $7)
      )
     )
    )
    (i64.add
     (i64.mul
      (local.get $4)
      (local.get $1)
     )
     (i64.mul
      (local.get $3)
      (local.get $2)
     )
    )
   )
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
 (func $_ZN17compiler_builtins3int19specialized_div_rem12u128_div_rem17hed822da46ae8044cE (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  (local $13 i64)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 176)
    )
   )
  )
  (local.set $6
   (i64.const 0)
  )
  (block $label$1
   (block $label$2
    (block $label$3
     (block $label$4
      (block $label$5
       (br_if $label$5
        (i32.le_u
         (local.tee $7
          (i32.wrap_i64
           (select
            (i64.clz
             (local.get $4)
            )
            (i64.add
             (i64.clz
              (local.get $3)
             )
             (i64.const 64)
            )
            (i64.ne
             (local.get $4)
             (i64.const 0)
            )
           )
          )
         )
         (local.tee $8
          (i32.wrap_i64
           (select
            (i64.clz
             (local.get $2)
            )
            (i64.add
             (i64.clz
              (local.get $1)
             )
             (i64.const 64)
            )
            (i64.ne
             (local.get $2)
             (i64.const 0)
            )
           )
          )
         )
        )
       )
       (br_if $label$4
        (i32.gt_u
         (local.get $8)
         (i32.const 63)
        )
       )
       (br_if $label$3
        (i32.gt_u
         (local.get $7)
         (i32.const 95)
        )
       )
       (br_if $label$2
        (i32.lt_u
         (i32.sub
          (local.get $7)
          (local.get $8)
         )
         (i32.const 32)
        )
       )
       (call $__lshrti3
        (i32.add
         (local.get $5)
         (i32.const 160)
        )
        (local.get $3)
        (local.get $4)
        (local.tee $9
         (i32.sub
          (i32.const 96)
          (local.get $7)
         )
        )
       )
       (local.set $10
        (i64.add
         (i64.load32_u offset=160
          (local.get $5)
         )
         (i64.const 1)
        )
       )
       (local.set $11
        (i64.const 0)
       )
       (local.set $6
        (i64.const 0)
       )
       (block $label$6
        (block $label$7
         (block $label$8
          (block $label$9
           (loop $label$10
            (call $__lshrti3
             (i32.add
              (local.get $5)
              (i32.const 144)
             )
             (local.get $1)
             (local.get $2)
             (local.tee $8
              (i32.sub
               (i32.const 64)
               (local.get $8)
              )
             )
            )
            (local.set $12
             (i64.load offset=144
              (local.get $5)
             )
            )
            (block $label$11
             (br_if $label$11
              (i32.ge_u
               (local.get $8)
               (local.get $9)
              )
             )
             (call $__lshrti3
              (i32.add
               (local.get $5)
               (i32.const 80)
              )
              (local.get $3)
              (local.get $4)
              (local.get $8)
             )
             (block $label$12
              (block $label$13
               (br_if $label$13
                (i32.eqz
                 (i64.eqz
                  (local.tee $10
                   (i64.load offset=80
                    (local.get $5)
                   )
                  )
                 )
                )
               )
               (br $label$12)
              )
              (local.set $12
               (i64.div_u
                (local.get $12)
                (local.get $10)
               )
              )
             )
             (call $__multi3
              (i32.add
               (local.get $5)
               (i32.const 64)
              )
              (local.get $3)
              (local.get $4)
              (local.get $12)
              (i64.const 0)
             )
             (block $label$14
              (br_if $label$14
               (select
                (local.tee $8
                 (i64.lt_u
                  (local.get $1)
                  (local.tee $13
                   (i64.load offset=64
                    (local.get $5)
                   )
                  )
                 )
                )
                (i64.lt_u
                 (local.get $2)
                 (local.tee $10
                  (i64.load offset=72
                   (local.get $5)
                  )
                 )
                )
                (i64.eq
                 (local.get $2)
                 (local.get $10)
                )
               )
              )
              (local.set $2
               (i64.sub
                (i64.sub
                 (local.get $2)
                 (local.get $10)
                )
                (i64.extend_i32_u
                 (local.get $8)
                )
               )
              )
              (local.set $1
               (i64.sub
                (local.get $1)
                (local.get $13)
               )
              )
              (local.set $6
               (i64.add
                (local.get $6)
                (i64.extend_i32_u
                 (i64.lt_u
                  (local.tee $12
                   (i64.add
                    (local.get $11)
                    (local.get $12)
                   )
                  )
                  (local.get $11)
                 )
                )
               )
              )
              (br $label$1)
             )
             (local.set $2
              (i64.sub
               (i64.sub
                (i64.add
                 (i64.add
                  (local.get $2)
                  (local.get $4)
                 )
                 (i64.extend_i32_u
                  (i64.lt_u
                   (local.tee $4
                    (i64.add
                     (local.get $1)
                     (local.get $3)
                    )
                   )
                   (local.get $1)
                  )
                 )
                )
                (local.get $10)
               )
               (i64.extend_i32_u
                (i64.lt_u
                 (local.get $4)
                 (local.get $13)
                )
               )
              )
             )
             (local.set $1
              (i64.sub
               (local.get $4)
               (local.get $13)
              )
             )
             (local.set $6
              (i64.add
               (local.get $6)
               (i64.extend_i32_u
                (i64.lt_u
                 (local.tee $12
                  (i64.add
                   (i64.add
                    (local.get $12)
                    (local.get $11)
                   )
                   (i64.const -1)
                  )
                 )
                 (local.get $11)
                )
               )
              )
             )
             (br $label$1)
            )
            (call $__ashlti3
             (i32.add
              (local.get $5)
              (i32.const 128)
             )
             (local.tee $12
              (i64.div_u
               (local.get $12)
               (local.get $10)
              )
             )
             (i64.const 0)
             (local.tee $8
              (i32.sub
               (local.get $8)
               (local.get $9)
              )
             )
            )
            (call $__multi3
             (i32.add
              (local.get $5)
              (i32.const 112)
             )
             (local.get $3)
             (local.get $4)
             (local.get $12)
             (i64.const 0)
            )
            (call $__ashlti3
             (i32.add
              (local.get $5)
              (i32.const 96)
             )
             (i64.load offset=112
              (local.get $5)
             )
             (i64.load offset=120
              (local.get $5)
             )
             (local.get $8)
            )
            (local.set $6
             (i64.add
              (i64.add
               (i64.load offset=136
                (local.get $5)
               )
               (local.get $6)
              )
              (i64.extend_i32_u
               (i64.lt_u
                (local.tee $11
                 (i64.add
                  (local.tee $6
                   (i64.load offset=128
                    (local.get $5)
                   )
                  )
                  (local.get $11)
                 )
                )
                (local.get $6)
               )
              )
             )
            )
            (br_if $label$9
             (i32.le_u
              (local.get $7)
              (local.tee $8
               (i32.wrap_i64
                (select
                 (i64.clz
                  (local.tee $2
                   (i64.sub
                    (i64.sub
                     (local.get $2)
                     (i64.load offset=104
                      (local.get $5)
                     )
                    )
                    (i64.extend_i32_u
                     (i64.lt_u
                      (local.get $1)
                      (local.tee $12
                       (i64.load offset=96
                        (local.get $5)
                       )
                      )
                     )
                    )
                   )
                  )
                 )
                 (i64.add
                  (i64.clz
                   (local.tee $1
                    (i64.sub
                     (local.get $1)
                     (local.get $12)
                    )
                   )
                  )
                  (i64.const 64)
                 )
                 (i64.ne
                  (local.get $2)
                  (i64.const 0)
                 )
                )
               )
              )
             )
            )
            (br_if $label$10
             (i32.le_u
              (local.get $8)
              (i32.const 63)
             )
            )
           )
           (br_if $label$8
            (i32.eqz
             (i64.eqz
              (local.get $3)
             )
            )
           )
           (br $label$7)
          )
          (br_if $label$6
           (i32.eqz
            (select
             (local.tee $8
              (i64.lt_u
               (local.get $1)
               (local.get $3)
              )
             )
             (i64.lt_u
              (local.get $2)
              (local.get $4)
             )
             (i64.eq
              (local.get $2)
              (local.get $4)
             )
            )
           )
          )
          (local.set $12
           (local.get $11)
          )
          (br $label$1)
         )
         (local.set $2
          (i64.div_u
           (local.get $1)
           (local.get $3)
          )
         )
        )
        (local.set $1
         (i64.rem_u
          (local.get $1)
          (local.get $3)
         )
        )
        (local.set $6
         (i64.add
          (local.get $6)
          (i64.extend_i32_u
           (i64.lt_u
            (local.tee $12
             (i64.add
              (local.get $11)
              (local.get $2)
             )
            )
            (local.get $11)
           )
          )
         )
        )
        (local.set $2
         (i64.const 0)
        )
        (br $label$1)
       )
       (local.set $2
        (i64.sub
         (i64.sub
          (local.get $2)
          (local.get $4)
         )
         (i64.extend_i32_u
          (local.get $8)
         )
        )
       )
       (local.set $1
        (i64.sub
         (local.get $1)
         (local.get $3)
        )
       )
       (local.set $6
        (i64.add
         (local.get $6)
         (i64.extend_i32_u
          (i64.eqz
           (local.tee $12
            (i64.add
             (local.get $11)
             (i64.const 1)
            )
           )
          )
         )
        )
       )
       (br $label$1)
      )
      (local.set $2
       (i64.sub
        (i64.sub
         (local.get $2)
         (select
          (local.get $4)
          (i64.const 0)
          (local.tee $8
           (select
            (i64.ge_u
             (local.get $1)
             (local.get $3)
            )
            (i64.ge_u
             (local.get $2)
             (local.get $4)
            )
            (i64.eq
             (local.get $2)
             (local.get $4)
            )
           )
          )
         )
        )
        (i64.extend_i32_u
         (i64.lt_u
          (local.get $1)
          (local.tee $4
           (select
            (local.get $3)
            (i64.const 0)
            (local.get $8)
           )
          )
         )
        )
       )
      )
      (local.set $1
       (i64.sub
        (local.get $1)
        (local.get $4)
       )
      )
      (local.set $12
       (i64.extend_i32_u
        (local.get $8)
       )
      )
      (br $label$1)
     )
     (local.set $1
      (i64.sub
       (local.get $1)
       (i64.mul
        (local.tee $12
         (i64.div_u
          (local.get $1)
          (local.get $3)
         )
        )
        (local.get $3)
       )
      )
     )
     (local.set $6
      (i64.const 0)
     )
     (local.set $2
      (i64.const 0)
     )
     (br $label$1)
    )
    (local.set $12
     (i64.or
      (i64.shl
       (local.tee $2
        (i64.div_u
         (i64.or
          (i64.shl
           (i64.sub
            (local.get $2)
            (i64.mul
             (local.tee $6
              (i64.div_u
               (local.get $2)
               (local.tee $4
                (i64.and
                 (local.get $3)
                 (i64.const 4294967295)
                )
               )
              )
             )
             (local.get $3)
            )
           )
           (i64.const 32)
          )
          (local.tee $12
           (i64.shr_u
            (local.get $1)
            (i64.const 32)
           )
          )
         )
         (local.get $4)
        )
       )
       (i64.const 32)
      )
      (local.tee $3
       (i64.div_u
        (local.tee $1
         (i64.or
          (i64.shl
           (i64.sub
            (local.get $12)
            (i64.mul
             (local.get $2)
             (local.get $3)
            )
           )
           (i64.const 32)
          )
          (i64.and
           (local.get $1)
           (i64.const 4294967295)
          )
         )
        )
        (local.get $4)
       )
      )
     )
    )
    (local.set $1
     (i64.sub
      (local.get $1)
      (i64.mul
       (local.get $3)
       (local.get $4)
      )
     )
    )
    (local.set $6
     (i64.or
      (i64.shr_u
       (local.get $2)
       (i64.const 32)
      )
      (local.get $6)
     )
    )
    (local.set $2
     (i64.const 0)
    )
    (br $label$1)
   )
   (call $__lshrti3
    (i32.add
     (local.get $5)
     (i32.const 48)
    )
    (local.get $3)
    (local.get $4)
    (local.tee $8
     (i32.sub
      (i32.const 64)
      (local.get $8)
     )
    )
   )
   (call $__lshrti3
    (i32.add
     (local.get $5)
     (i32.const 32)
    )
    (local.get $1)
    (local.get $2)
    (local.get $8)
   )
   (local.set $6
    (i64.const 0)
   )
   (call $__multi3
    (i32.add
     (local.get $5)
     (i32.const 16)
    )
    (local.get $3)
    (i64.const 0)
    (local.tee $12
     (i64.div_u
      (i64.load offset=32
       (local.get $5)
      )
      (i64.load offset=48
       (local.get $5)
      )
     )
    )
    (i64.const 0)
   )
   (call $__multi3
    (local.get $5)
    (local.get $4)
    (i64.const 0)
    (local.get $12)
    (i64.const 0)
   )
   (local.set $10
    (i64.load offset=16
     (local.get $5)
    )
   )
   (block $label$15
    (block $label$16
     (br_if $label$16
      (i64.ne
       (i64.add
        (i64.load offset=8
         (local.get $5)
        )
        (i64.extend_i32_u
         (i64.lt_u
          (local.tee $11
           (i64.add
            (local.tee $13
             (i64.load offset=24
              (local.get $5)
             )
            )
            (i64.load
             (local.get $5)
            )
           )
          )
          (local.get $13)
         )
        )
       )
       (i64.const 0)
      )
     )
     (br_if $label$15
      (i32.eqz
       (select
        (local.tee $8
         (i64.lt_u
          (local.get $1)
          (local.get $10)
         )
        )
        (i64.lt_u
         (local.get $2)
         (local.get $11)
        )
        (i64.eq
         (local.get $2)
         (local.get $11)
        )
       )
      )
     )
    )
    (local.set $2
     (i64.sub
      (i64.sub
       (i64.add
        (i64.add
         (local.get $4)
         (local.get $2)
        )
        (i64.extend_i32_u
         (i64.lt_u
          (local.tee $1
           (i64.add
            (local.get $3)
            (local.get $1)
           )
          )
          (local.get $3)
         )
        )
       )
       (local.get $11)
      )
      (i64.extend_i32_u
       (i64.lt_u
        (local.get $1)
        (local.get $10)
       )
      )
     )
    )
    (local.set $12
     (i64.add
      (local.get $12)
      (i64.const -1)
     )
    )
    (local.set $1
     (i64.sub
      (local.get $1)
      (local.get $10)
     )
    )
    (br $label$1)
   )
   (local.set $2
    (i64.sub
     (i64.sub
      (local.get $2)
      (local.get $11)
     )
     (i64.extend_i32_u
      (local.get $8)
     )
    )
   )
   (local.set $1
    (i64.sub
     (local.get $1)
     (local.get $10)
    )
   )
   (local.set $6
    (i64.const 0)
   )
  )
  (i64.store offset=16
   (local.get $0)
   (local.get $1)
  )
  (i64.store
   (local.get $0)
   (local.get $12)
  )
  (i64.store offset=24
   (local.get $0)
   (local.get $2)
  )
  (i64.store offset=8
   (local.get $0)
   (local.get $6)
  )
  (global.set $__stack_pointer
   (i32.add
    (local.get $5)
    (i32.const 176)
   )
  )
 )
 (func $__udivti3 (param $0 i32) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64)
  (local $5 i32)
  (global.set $__stack_pointer
   (local.tee $5
    (i32.sub
     (global.get $__stack_pointer)
     (i32.const 32)
    )
   )
  )
  (call $_ZN17compiler_builtins3int19specialized_div_rem12u128_div_rem17hed822da46ae8044cE
   (local.get $5)
   (local.get $1)
   (local.get $2)
   (local.get $3)
   (local.get $4)
  )
  (local.set $4
   (i64.load
    (local.get $5)
   )
  )
  (i64.store offset=8
   (local.get $0)
   (i64.load offset=8
    (local.get $5)
   )
  )
  (i64.store
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
 ;; custom section "producers", size 67
 ;; features section: mutable-globals, nontrapping-float-to-int, bulk-memory, sign-ext, reference-types, multivalue
)

