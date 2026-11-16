# Retained clock publication repair

Firmware 2d68e82b7341db7b747b20e4ad1455a4c1113a00 repairs a reproduced partial-publication bug:
at accepted_samples=u32::MAX, observe returned Arithmetic after advancing model
identity/timestamps. The prospective count is now checked after original causal
validation/intersection and before any state assignment. Existing rejection
precedence and diagnostic counters remain unchanged. The regression covers the
last success, entire model and estimate preservation, repeated failure and reset.
This is a correctness repair, not an identical-error-behavior refactor.

CSGRS 182b9d072c28d3121e99228d5b21e09f2446e1d5 records the clock ownership boundary and updates13
inventory declarations (two previously lexical plus eleven missing entries).
The other50 original firmware entries remain open. Audit attention shifted to
the reproduced publication defect; no full52-entry completion is claimed.
Generic IntegerRange and directed quotient authority remain in Hyperinterval.

602 firmware tests/doctests,90 Interface client tests/doctests, strict native
all-target Clippy, workspace formatting and native/WASM/Thumb/Xtensa checks pass.
The existing24-case probe's481 output/wire/error records are byte-identical,
as are zero-allocation records. Host raw/text sizes are unchanged; observe's
host body shrinks7 bytes, Thumb48 and Xtensa34. Local frames remain408 and464
bytes respectively. Target assembly is assembled to obtain real symbol sizes;
raw Cargo LTO bitcode had no GNU-nm symbols and was not treated as code size.
Eight pinned CPU0 ASLR-disabled ABBA blocks give960 samples and5898240 completed
operations: median586.094ns baseline,584.945ns candidate. No speedup or MCU-cycle
claim. Full images, whole-call/interrupt stack, flash-fit and HIL remain open.

No dependency, public representation or canonical wire change. No push or
publication. All79 prior stages verify unchanged. Primary41 staged and Interface8
pending paths remain byte-identical before forwarding reviewed commits. The full
interval-plan goal remains active; this turn is concrete implementation progress.
