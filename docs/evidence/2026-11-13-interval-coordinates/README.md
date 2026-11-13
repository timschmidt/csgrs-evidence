# Exact state charts and source-bound Picard transport

This phase-13 increment extends the retained affine Taylor work. The complete
fifteen-phase goal remains active. `CONTRACT.md` identifies ownership, domain,
properties, reuse and the missing witness before implementation. `BASELINE.json`
and `pending-main.patch` preserve the retained base and forty pending extraction
paths. No push is part of this increment.

## Implemented contract

Hypersolve's opt-in `coordinate-program` feature proves B*A=I under STRICT and
constructs the shared expression DAG B*f(t,c+A*y). Source operations, guards,
bindings, source-node mapping and inverse receipts remain available. Hyperdynamics'
opt-in `coordinates` feature binds the chart to ordered state variables, delegates
derivatives and Picard verification to existing owners, and transports a completed
one-step tube and endpoint back through Hyperlattice's affine enclosure. The exact
initial set is c+A*Y; existence is not claimed for every point of its Cartesian
envelope. Transport exhaustion cannot publish whole-step success.

The scaling witness x1'=128*x2, x2'=0 rejects the original half-unit proposal's
contraction but certifies in A=diag(128,1) coordinates, with source endpoint
[-64,64] x [-1,1]. This demonstrates a completion use case. It does not establish
adaptive QR, a whole-horizon chart integrator, nonlinear Taylor composition,
competitive dynamics performance or whole-resource closure. Structural work and
native arithmetic are charged separately; exact Real payload/refinement,
predicate internals, total heap and intra-scalar cancellation retain their
explicit exclusions.

## Reproduction and source chronology

`missing-witness.log` reproduces the absent API at the recorded base. The first
test helper used the wrong SymbolId width (`owner-controls.log`). The initial
downstream square expectation was incorrect: [-3,-1]^2 is [1,9], not [0,9];
`initial-consumer-controls.rs` preserves that test. `missing-projection-scan.log`
and `before-projection-charge.rs` reproduce uncharged native-carrier validation
scans. The final implementation charges them and tests dimensions 0, 1 and 3.
No preexisting assertion or policy was relaxed.

`SOURCE.json`/`source-files` identify the 13 paths subjected to broad owner,
downstream, sanitizer, artifact and cost qualification after the accounting fix.
`SOURCE_FINAL.json`/`final-source-files` identify the final 17 paths: production
code is identical; one test subsequently asserts precise nested error variants
and downcastable source chains, and four files add the standalone fuzz package.
`before-typed-source-controls.rs` preserves the earlier assertion version.
`typed-source-controls.log` and `post-test-qualification.json` record the final
test checks. `source-commit.json` identifies the retained source commit.

## Qualification

All 15 groups in `final-qualification.json` pass: 1,455 Hypersolve tests and 455
benchmark smokes, 60 Hyperdynamics tests, minimal/default-off configurations,
strict Clippy, warnings-denied docs, WASM, example, release, ASan, formatting and
whitespace checks. Counts are detailed in `test-counts.json` (29 targeted release
tests and 27 ASan tests). Seven combined-worktree groups pass, including 519
dynamics/path tests and 194 path benchmark smokes. All 200 successive-operations
rows preserve structural fields, allocation counts and shown memory relative
to the preceding affine stage; those parallel-run timings are smoke observations.

The unchanged full Hypersolve coverage script passes its 85% gate in 1,320 s:
53,295/60,897 physical executable lines, 87.52%. Its existing exclusion regex
also includes some Hyperinterval source. The separately retained owner-only
annotated report and identical AWK analysis give 51,639/57,715, 89.47%, with
198/211 (93.84%) in the new coordinate module. This uses the script's trailing
inline-test exclusion convention; dedicated cfg(test) source files/helpers may
remain. Hyperdynamics source-prefix coverage is 1,999/2,198 lines (90.95%),
2,768/3,170 regions and 225/259 functions; its new module covers 160/180 lines.
No Hyperdynamics-specific threshold is configured. Neither run establishes
branch coverage. The production source is unchanged by later test strengthening.

`fuzz-status.json` records locked/offline build, strict Clippy, formatting,
ASan fuzz build and bounded execution. `coordinate_change` uses independent
integer polynomial/Jacobian and constant-flow endpoint expectations, inverse
rejection, graph cutoffs and source replay. Seed 20261113 completed 6,060
executions in 61 s, stopping at the configured 60-second cap before the 10,000
execution ceiling, with no findings. Inputs shorter than eight bytes are skipped;
execution count is not a count of valid charts. The corpus directory retains 220
files; the fuzzer's in-memory final corpus counter is a different observation.
Combined-worktree ASan replay consumes the retained corpus with `-runs=0`, not
another fuzz campaign. External timeouts are harness containment, not a library
whole-resource guarantee.

The standalone fuzz lock preserves all existing dependency versions. Combining
it with the pending extraction reproduces a locked metadata failure because the
extracted Hyperdynamics package adds a direct Hyperlimit dependency. The sole
compatibility delta is one `hyperlimit` dependency edge in the fuzz lock, recorded
in `combined-fuzz-lock.patch`; no package version changes. This new pending path
joins the original forty, making 41 pending extraction paths after retention.
The original 37 nonoverlapping blobs stay identical and three shared package
files incorporate both changes. `retention.json` records the guarded transition.

## Artifacts, costs and limits

`original-implementation-preserved.json` checks that the two existing source
files remain exact prefixes. Same-path baseline/final builds, pinned locks and
read-only ELF comparison preserve both legacy binaries byte-for-byte at
4,023,080 and 4,160,888 bytes. The full 177,398-byte semantic transcript matches.
The existing model consumer shrinks eight ELF metadata bytes (3,919,320 to
3,919,312), while the affine consumer remains 3,968,544 bytes. Both preserve
machine code and loaded sections except build identifiers; this is not a claim
about every feature combination or a performance benefit from metadata size.

All twelve fixed alternating legacy timing pairs retain all 22 cases and equal
resource/allocation rows. One pointwise 95% bootstrap interval is adverse:
exponential/integrate ratio 1.0103964844, interval [1.0006803585,1.0280168222].
The observation is retained without selective reruns or threshold changes.
Identical complete binaries provide the stronger deterministic execution-
preservation evidence; no speedup or universally neutral timing is claimed.

Two old-model and affine trials preserve image/resource/allocation records.
Two coordinate trials reproduce their records. Scaled-shear construction uses
700 graph units and retains 8,832 incremental bytes (10,016 peak); step/transport
uses 380 graph and 513,467 native units. Translated-constant construction uses
455 graph units and retains 7,152 bytes (8,328 peak); step/transport uses
299/476,317 units. Construction medians are about 24.0/7.5 us, step/transport
34.1/34.6 us, and full replay 80.7/60.1 us respectively. Construction starts
from an existing field; replay includes source/chart reconstruction and output
transport. All measured operations and failure controls return live allocation
delta to zero after drop. These are absolute completed-task costs, not cross-
contract speedups or uniform completion bounds. Raw samples and drivers are kept.

Build targets, executable binaries and raw coverage profiles are outside this
archive. The three preceding immutable stages verify unchanged. Interface's
eight edits and clean firmware state remain preserved. Phase 11 retention,
adaptive wrapping/QR, wider consumers, resource closure, HIL and coordinated
release remain open. The full pre-push matrix is still required before a push.
