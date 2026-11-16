# Current uncertainty widening

Stage91, Phase9. Previous stage was progress: reproduced rejection changed the
next action and all source was restored. Full15-phase goal remains active.
Baseline CSGRS13a5ed938, firmware2d68e82, Interface32a59de; preserve90 frozen
stages and45 existing accounts. No subagents, push or hardware actions.

Hyperinterval owns exact fixed Minkowski sum; FOC owns nonempty Q30, skew error,
phase-pair reconstruction, calibration, sample timing/identity and replay.
P1/P3/P6/P19/P27/P31-P33/P35-P39. Current current.rs:627 widen_interval manually
subtracts nonnegative error from lower then adds it to upper. Only derive_phases
calls it, first channel0 then channel1. Missing acceptance: direct independent
image and full-width rejection witnesses through this helper plus matched
public calibration/observe/Clarke/replay cost and exact field comparisons.

Domain: all safely constructed nonempty ordered i32 Q30 intervals and i32 Q30
errors. Negative error remains CurrentCalibration before any arithmetic.
For0<=error<=i32::MAX, [-error,error] is exactly representable. Minkowski sum
is exactly widening, including zero, boundary and checked endpoint overflow.
Use existing checked_neg, Q30Interval::new and checked_add; no new scalar
kernel or unchecked construction. Negative-error check remains first; lower
endpoint arithmetic precedes upper. The added error reflection and symmetric
interval construction cannot fail after the existing nonnegative precondition.
No scalar policy/cache/dispatch calls occur in this fixed path. Public const API,
layout, source snapshot identity, timing evidence and subsequent validation stay.
Angle expansion is distinct i64 expansion intersected with[-1,1], not merged.

Baseline public consumer measurements precede production edits. Existing tests
and new independent witnesses must pass baseline/candidate; public output is
consumed by stationary/Clarke and validate_for. Host timing is only initial
screening; retention requires affected full-image/stack/flash qualification
and explicit outstanding hardware limits. Never infer MCU speed from host.

Size: fixed program baseline c9f1f9ac already records firmware2d68e82 and shared
fixed implementation is unchanged. Existing native final-file/allocated-section
caps: incremental4096 bytes AND1%, cumulative16384 AND2%; code incremental1024
AND0.5%, cumulative4096 AND1%. Existing WASM file/code incremental1024 AND5%,
cumulative4096 AND10%. One new independent unit witness may use the previously
proposed test-executable file32768 AND4% and code16384 AND4% allowance, both
incremental/cumulative. Other allocated-section caps stay unchanged; no size
budget revision or consumption from stage90. Production source reduction alone
cannot justify growth. Firmware positive growth caps remain0; unresolved4MiB
flash fit is not headroom. No sampling/approximation replaces exact authority.
