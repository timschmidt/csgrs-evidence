# Source-bound RK4 proposal admission

Source: `c7bfacdff04ca228193d4c6d0dd1a16a85c4e88c`. Base:
`bb111ce9ff9f6d576ac7bd81dcecbb8886103af8`; accepted source before this increment
was `6f2c110f3758c5059df7e852536769bc94bcd2b6`. The full interval goal remains active.

## Contract and ownership

Phase 12 gains an optional, non-authoritative RK4 proposal path. Hypersolve owns
`float-proposal-program`: a prepared primitive view retaining its original exact
DAG, ordered bindings, demanded-node schedule, guards and full i64 powers.
Hyperdynamics owns `rk-proposal`: four stage estimates, explicit heuristic padding,
exact original time/initial-state request, source association and partial failures.
Finite IEEE candidate coordinates are adopted exactly, then the unchanged Picard
verifier consumes the original source/request. Only its report authorizes a tube
or endpoint. Float success does not establish a source domain, flow or error bound.
Native horizon integration remains independently available, including where float
projection cannot distinguish times or represent magnitudes.

Hyperinterval supplies exact finite binary64 point ingress. Its existing decoder
and admission-before-allocation point construction are shared with enclosure
conversion. This does not broaden strict-float platform qualification. The exact
IEEE value is the adopted number, including subnormals and canonical signed zero;
NaN and infinity remain typed invalid input. No Hyperreal dependency or native
rounding operation is needed for the minimal ingress feature pair.

P1-P6, P19-P20, P25 and P36-P37 apply. `CONTRACT.md` preserves the initial admission,
rejected ingress alternatives, final option-validity finding and reproduction
correction. Resource counters cover declared graph/dyadic stages, not scalar
projection/refinement, total CPU work or total heap. Cancellation is cooperative.
Provisional numerical traces never become serialized executable proof flags.

## Correctness and failure evidence

Maintained tests cover independent integer/rational controls for the entire owned
expression grammar, shared/unused nodes and full-width exponents; exact IEEE bit
values, 4096 seeded rational comparisons, zero dispatch, budgets/retry and all 16
supported MXCSR modes. RK fixtures cover uncertain constant sets, explicit
polynomial stage values, affine time dependence, exponential Taylor bounds,
oscillator bounds, Riccati flow, rounded-away source-domain failure, insufficient
candidates, later-stage poles, unavailable projections, empty/unit products,
invalid requests/options, every graph cutoff, scalar cutoffs, cancellation and
recovery. Certified outputs feed subsequent native operations and rational clocks.
Five fresh-process cases rebuild source/request/options and compare every retained
numerical bit pattern, proof field, status and resource count. Invalid source
references/bindings are rejected; forged success fields do not supply evidence.

Final review found that debug native `< 0.0` option checks admit negative subnormal
padding under DAZ: eight modes times two option fields, 16 invalid acceptances.
The release baseline already rejects them through different optimized lowering;
that passing baseline is retained. Reusing `[0,padding]` construction fixes the
input domain without another decoder. The external probe copies the existing
MXCSR helper and now rejects all 32 cases in both debug and release. Maintained
RK tests exercise both option fields and retain negative-zero bits. See
`padding-regression.json` and the complete original failing log.

## Executed validation

`checks-final.json` records 23 primary groups; `supplementary-checks.json` records
12 post-layout/downstream groups; `padding-final-checks.json` records 14 groups
for the final option-validity edit. All pass. Unchanged owners are not rerun merely
because a later edit changes only RK option validation and its test witness.

The post-layout full suites report 204 Hyperinterval tests, 1422 Hypersolve tests,
and 496 Hyperdynamics/Hyperpath tests (including doctests where reported). The
accepted isolated package reports 37 tests; Interface reports 201. Checks include
minimal/default-off features, Rust 1.88 minimal ingress and Rust 1.95 field/program,
release, AddressSanitizer, Clippy with `-D warnings`, warning-denying docs, WASM,
no-std thumb ingress compilation, examples, owner benches and formatting.
`successive_operations` retains all 200 geometry/certainty/structure rows and
allocator counts. Its timings are validation smoke, not a performance claim.
This is an affected-contract matrix, not the entire pre-push workflow matrix.
No push was performed; hosted/other-OS/HIL qualification remains outside this work.

Thirteen complete old evolution signatures match the previously archived accepted
baseline: nine completed and four stopped reports. Source/request/options/policy,
all attempts, exact evidence, prefix/final endpoints and resource counts agree.
Native scalar conversion has no predicate-policy parameter; its exact IEEE
semantics and zero Hyperreal dispatch are independent of policy. Existing modeling
policy/receipt coverage remains unchanged in the downstream corpus.

## Cost and artifact evidence

`artifacts.json` records hashes, raw sizes, sections and sized function unions.
Old conversion, strict-float and native-evolution `.text` bytes are identical.
Their function unions remain 484827, 271197 and 2065371 bytes. Raw binaries are
1131416 (baseline 1131424), 499936 (unchanged), and 4082872 (unchanged) bytes.
An initial declaration layout enlarged symbol metadata; retaining existing impl
order and appending optional APIs removes the file-size increase without changing
execution order. Initial snapshots and the final source patch are retained.

Matched CPU-0 runs use two-second pre-exec warm-up and balanced variant order.
Sixteen completed f32/f64 conversion cases and their controlled failures preserve
exact values, work and allocation rows. Strict-float completed checksums agree.
Old evolution keeps its 18 completed timing rows, four stopped rows and 36 resource
failure allocation rows. All measured retained-byte deltas are zero.

Initial candidate/control timing ratios: conversion 0.99099-1.01841 (median 1.0),
strict float 0.99720-0.99770 (median 0.99745), native evolution 0.98824-1.03847
(median 1.01097). Riccati integration initially had disjoint run-median ranges.
A follow-up using exactly the same executable path/argv, while preserving both
original binaries, gives 0.98219-1.02648 (median 0.99539); all run ranges overlap,
and Riccati is 0.99036. Both data sets remain. Identical executable code and resource
results support retaining the shared helper; neither run establishes a speedup.

Four independent successful RK fixtures each measure preparation, proposal plus
exact proof, and source serialization/rebuild plus proposal/proof. The latter
clones the exact request and uses default options; it is not a claim that whole
input-bundle serialization is timed. Warm medians are 0.164-0.394 us preparation,
6.748-13.352 us proposal/proof, and 13.875-23.544 us source replay/proof; peak live
owned bytes are at most 3768. Rejected-proof and 15 controlled-exhaustion rows stay
separate. The new consumer is 4084144 file bytes and 2034974 function-union bytes;
this is not a size comparison between equivalent old and new flow algorithms.
No cross-library, whole-resource, universal RK enclosure or ODE completeness claim.

## Reproduction and repository state

The checked-in source patch is the exact source commit diff. `SOURCE_STATE.json`
contains file digests; build/test commands, compiler/target/CPU details, dependency
locks, raw symbols, samples and scripts accompany the record. Build external probes
against the isolated accepted checkout; baseline conversions use the preceding
accepted source. `semantic-baseline.log` is the accepted rational-time record's
candidate result, with identical dependency versions/checksums.

`isolated-core-final.log` was an early main-worktree smoke; use the explicitly
located `isolated-accepted-core` and final padding `accepted-core` runs as isolated
qualification. The pre-completion binary snapshot is named accordingly; final
artifact claims use `artifacts.json`.

All 40 pending legacy extraction paths remain. Thirty-eight index blobs are
unchanged; manifest/README blobs incorporate this accepted API while retaining
legacy edits. The pending patch and Interface patch are retained with digests.
Firmware is unchanged. Automatic RK horizon selection, wrapping/reachability,
whole-resource closure, legacy extraction retention and the other plan phases
remain open; this increment does not complete the goal.
