# Dyadic multiplication: representable exponent extremes retained

Source efee9bbe3e4007fb81d24ebccffb53ac54d88426. This is a capability extension, not a behavior-preserving
refactor or performance improvement. Two exact-success witnesses fail with Overflow
on unchanged baseline a7ea9382f. Multiplication now uses the existing square/power
normalizer only when checked exponent addition fails. The ordinary branch retains
its endpoint construction, four products, sign/predicate order and budget charge.

The exact interval product is the hull of four bilinear corner products. A common
exponent below MIN is representable exactly when both extrema have enough factors
of two; an exponent above MAX can be shifted into unbounded mantissas subject to
resource admission. No huge rational coordinates or float conversion are needed.
The existing upper-boundary hard case remains with its newly supported exact
expectation; a genuinely unrepresentable odd lower endpoint remains Overflow.
Migration documentation explicitly records the changed failure precedence and
possible SizeExhausted/WorkExhausted outcomes before representability is decided.

Independent integer expectations cover 12,150 boundary interval pairs in both
operand orders, plus 6,075 ordinary pairs/scales with exact work assertions. Tests
exercise precise normalization admission thresholds, genuine overflow, huge growth
rejection, retry, empty/zero identities, generated composition, canonical serde and
zero Real-dispatch counts. Two results survive fresh-process replay and subsequent
operations. New downstream tests exercise ExpressionProgram and vector dot/scale.
The full owner reports 226 passes in 42 summaries, Hyperlattice 90 in 24, and
Hypersolve 1,520 in 63, with no ignored reports. These counts are not universal
closure proofs. Strict all-feature/all-target Clippy for all three crates, native
and WASM no_std checks, strict owner rustdoc and formatting pass. Main integration
rechecks the affected tests (28 reported passes), formatting, diffs and budget.
Full isolated checks use the committed lockfile; main focused checks include the
preserved pending extraction lockfile. Both lockfile hashes are recorded.

The matched external native probe covers five ordinary completed workloads with
24 alternating samples each. Exact output, serialization, work accounting and
allocation requests agree. Observed median ratios are 1.0045–1.0295; the executable
grows 2,568 bytes and the mul symbol 81 bytes. This bounded measured cost buys new
exact support; no speed, whole-application, peak-memory, MCU or WASM cost claim is
made. See cost-contract.md for lockfile, workload and shared-host limitations.
No firmware hot path changes. No new cancellation or total-instruction bound is
claimed; DyadicBudget retains its explicit deterministic accounting contract.

Integration proves that applying the source inverse exactly recovers the original
pending tree, and that applying the original pending patch to the new source gives
the combined index. All 41 pending paths are preserved; migration overlap changes
only blob identifiers in that patch. Interface's eight pending paths and firmware
remain untouched. All 50 prior frozen stages verify unchanged. The broad interval
plan, staged dynamics acceptance, remaining migrations, platform/HIL and release
obligations remain open. No full pre-push matrix, push or publication occurred.
