# Retained affine Taylor output forms

Source commit: `dbe8d0fdfae14a7e0a311831cba293b9dec10fb6`, based on
`bb720d674ca064453e732bf0564adb44b70517c6`. Full fifteen-phase goal remains active.
This record admits an additive, opt-in `taylor-affine` capability, not completion
of Phase 13 or a behavior-preserving refactor with zero raw binary growth.

## Read the final revision first

`isolated-feature/SOURCE_FINAL.json` and `isolated-feature/source-files/` identify
the final twelve source paths. `isolated-feature/VALIDATION.json` distinguishes
qualification before and after the final production edit. `CONTRACT.md` records
the owner, input domain, missing witness, reuse audit and architecture decisions.
`isolated-feature/retention.json` records retention with all forty extraction
paths still staged separately; 37 nonoverlapping pending blobs are unchanged.
The three overlapping Hyperdynamics files combine both sets of additions.
Interface's eight edits remain unchanged. No push was attempted.

Earlier snapshots/logs at the record root and under `final/` describe the first
prototype, not the retained implementation. Its checks passed, but an existing
Taylor consumer grew 10,848 ELF bytes and 2,688 text bytes. That implementation
was not retained. The nested, separately gated module preserves every byte of
three original Rust implementation files as prefixes. Initial compile and lint
failures, the old prototype, artifact comparisons and all adverse measurements
remain in this record.

## Supported result and independent witnesses

Hypersolve owns exact affine maps of a shared certified Taylor source. Exact
coefficients combine by monomial; repeated maps compose against original source
outputs and residual coordinates before enclosure. Original source/domain/grid
and residual evidence remain authoritative. Singular/rectangular maps, translation,
zero-dimensional products, empty sources, nonrational coefficients, restrictions,
finite chains, typed exhaustion/cancellation and retry are covered. The downstream
nonlinear-field example derives x² and y from (x²+y,x²-y), then explicitly projects
to another field operation.

Ten maintained tests include independent polynomial coefficients, repeated
shear/inverse cancellation, duplicate residual cancellation, original-domain
restrictions, exact nonrational cancellation, fresh-process reconstruction and
invalid source/map rejection. The original identical-output residual control is
preserved; the stronger distinct-function control uses reciprocal and reflected
reciprocal functions with matching residual bounds but exact difference 8/15 at
1/4, forbidding cancellation merely from equal bounds. Empty and nonempty unit
products remain distinct through zero-output-to-constant compositions.

A resource audit reproduced one uncharged domain scan. The pre-fix source and
failed `missing-domain-charge.log` remain under `isolated-feature/`. The final
implementation charges the scan before execution. A dimension-sensitive witness
isolates transport work from source-owner work and requires 2*dimension+4 units.
Structural stage budgets and native arithmetic budgets do not establish total
live entries, whole heap bytes, exact Real payload/refinement work or cancellation
inside scalar operations. These existing exclusions remain explicit. Nonlinear
model arithmetic, ODE coordinate transport, QR wrapping and wider adoption remain
open; no universal completion or performance bound is claimed.

## Validation scope

The isolated-feature revision before the final accounting line passed 17 owner
and seven combined downstream command groups: 1,447 Hypersolve tests and 455
benchmark smokes, 53 Hyperdynamics tests, minimal features, release/ASan, strict
Clippy, warnings-denied docs, WASM, examples, formatting and whitespace. Combined
Hyperdynamics/Hyperpath ran 512 tests and 194 path benchmark smokes. All 200
successive-operations rows preserve structural, allocation-count and displayed
memory fields relative to the preceding retained revision. Timings there are
smoke observations, not a matched performance comparison.

After the accounting fix, all twelve affected command groups pass: 25 focused
owner tests; nine minimal affine and 21 original minimal Taylor tests; 53
Hyperdynamics tests; 19 release and 24 ASan tests; strict Clippy, warnings-denied
docs, WASM, combined-worktree downstream affine example, formatting and whitespace.
The last zero-output-chain test-only extension subsequently passes all ten tests,
strict Clippy and formatting. Do not label the earlier full suites as final-code
reruns. All commands/statuses are retained; generated owner reports were archived
and restored rather than committed as authored source. The full pre-push matrix
has not been run for this increment and remains required before publication.

## Artifacts and measured completed tasks

`isolated-feature/consumer-comparison.json` records byte-for-byte identity of both
legacy evolution binaries (4,022,952 and 4,160,560 bytes), including the full
177,398-byte semantic transcript. The existing Taylor consumer preserves machine
code and all allocated sections except its build identifier. Its unstripped ELF
is 3,919,496 bytes versus 3,919,488 before: eight bytes larger from nonallocated
symbol-string metadata and corresponding offsets. This is an explicitly measured
additive extension cost, not a size-neutral refactor claim. Binary parsing is
read-only; binaries/targets are outside the archive, with hashes and reproducible
build probes retained here.

Twelve predeclared alternating legacy timing pairs retain all 22 cases. Every
resource/allocation row matches. One pointwise 95% bootstrap interval is adverse:
halving-limit/stopped ratio 1.0023400422, interval [1.0008895914,1.0041541563]. It
is not erased, thresholded away or selectively rerun. Identical complete legacy
binaries are stronger evidence of preserved execution than these small timing
variations; no speedup or claim that every interval contains one is made.

Two alternating old-model trials retain identical image, work, allocation and
retained-memory records. New affine trials likewise reproduce their resource and
allocation records. Coupled polynomial construction uses 145 graph/588,876 native
work units, retains 2,632 incremental bytes (3,520 peak); reciprocal-copy uses
30/228,565 units, retains 1,360 bytes (2,160 peak). Measured medians are about
52.7/13.4 us for construction, 45.7/9.7 us for reuse, 964/246 us for eight round
trips, and 191/83 us for full replay. Every measured operation, including failure
controls, returns live allocation delta to zero after drop. Construction starts
from an existing shared source; replay includes source reconstruction. These are
absolute costs of the stated completed tasks, not cross-contract speedups or
competitive dynamics results. Exact resource/allocation and timing samples are in
`isolated-feature/model-affine-comparison.json` and its raw logs.
