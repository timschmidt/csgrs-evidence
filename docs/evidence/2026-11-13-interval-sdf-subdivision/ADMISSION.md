# Native adaptive SDF covers with explicit unresolved leaves

Source: f3f1fd56a7951c508f7b4c6877b6c0e99fdfa36e. Baseline: 9ddc55d2ca7f9318ed405640143ac6bd3a52a40c.
CONTRACT.md preceded implementation. missing-subdivision.log reproduces the
missing options type and method on the target revision. The original standalone
witness remains a successful test. retained.patch and final-source.json bind
all nine retained files; source-before-octants.json and the original support
snapshot preserve the earlier test set before the supplemental 3D witness.

## Ownership and mathematical contract

SdfProgram::subdivide supplies the plan's adaptive F-rep cell classification
consumer. Hypersdf owns the schedule and field meaning; Hypersolve certifies
native whole-cell images; Hyperlattice owns exact Cartesian selection/bisection;
Hyperinterval owns scalar arithmetic. The existing enclosure-program feature
now activates hyperlattice/interval-dyadic for actual box operations. No second
coordinate, interval or predicate kernel is introduced. Source compilation,
existing scalar/primitive/affine interpretation and source qualification remain
unchanged. Default consumers do not enable this path.

The domain is a successfully compiled field and a finite dyadic Cartesian query.
Each cell is evaluated with the native natural image. Definite and empty cells
stop; only unresolved signs trigger subdivision. Widest-axis selection uses
native exact widths and lowest-index ties. Native midpoint bisection produces
two closed children whose union is the parent and whose intersection is the
midpoint facet. The children are evaluated left then right; unresolved records
are expanded left first. Parent ranges, explicit axis/child indices and immutable
source-bound child ranges are retained. Induction over those native split
relations proves that terminal cells cover exactly the query. This is a closed
cover, not a disjoint-volume partition or a mesh.

A successful report means complete query coverage with honest per-cell bounds;
it does not imply resolved classification. DepthLimit and Singleton retain an
explicit unresolved sign. Every native domain, arithmetic, capacity or
cancellation failure aborts the entire attempt without publishing a partial
report. Arithmetic failure is not converted to an unresolved leaf. A requested
spatial depth is a resolution criterion, not a claim of arithmetic exhaustion.
The whole-query location agrees with all covering leaves only if their locations
agree; mixed or unresolved classifications give Unknown. None denotes the empty
query. Boundary means zero throughout the query, not surface-topology evidence.

| Capability | Maintained witness | Limitation |
| --- | --- | --- |
| Complete whole-cell sign | Exact dependency field becomes six certified-inside leaves | Natural images only; no automatic Taylor portfolio |
| Full 3D coverage | Independent eight octants and exact image bounds; X/Y/Z split order | No mesh/winding or disjoint-volume claim |
| Boundary contacts | Closed intervals touching x=0 remain explicitly unresolved | No crossing or exact-zero guess |
| Empty/zero/point | Empty image, zero field and unresolved rational singleton differ | Coarse precision can leave a known nonzero point unresolved |
| Generated source | Affine sphere retains source and metric qualification | Native source grammar still applies |
| Resources | Exact entry/work thresholds, capacity, late arithmetic failure, overflow, cancellation/retry | Native scalar and heap-byte exclusions remain |
| Composition/replay | Leaf ranges are subsequent image inputs; fresh process rebuilds cover | No generic SDF serialization or trusted serialized flags |

For f=x(1-x)-3/8 on x in [0,1], the root natural image is [-3/8,5/8]. At depth
three the exact leaves are [0,2]/8, [2,3]/8, [3,4]/8, [4,5]/8, [5,6]/8 and
[6,8]/8; all native images are strictly negative. Eleven records retain those
six leaves and five parents. Independent expected endpoints and each exact
parent/child hull/intersection relation certify coverage without sampled
membership or area. Every leaf image can be recomputed as subsequent input.

The full 3D fixture uses f=x+y+z on [-1,1]^3. Fifteen records retain all eight
independent octants. Their exact ranges are the sums of lower/upper endpoints;
closed zero contacts remain unresolved at depth three. A separate transformed
sphere query retains both inside/outside evidence and unresolved boundary cells.
Original source Arcs and distance qualifications are preserved at every node.

## Resource and failure contract

Graph work is shared across all visits, native evaluations, record/task creation
and publication. Dyadic arithmetic uses one shared caller budget, including
coordinate copies, exact widths and bisection. Size reservations include source
definition slots, two node-sized evaluator arrays, tree records, pending indices
and six fixed working records. The dependency fixture's exact maximum is 48
such entries: 3 bindings+8 nodes+1 output+16 evaluator entries+11 cells+3 pending
indices+6 working records. At 47 it fails typed. Measured successful graph work
and one-less failure are asserted. The fixture uses 668 graph units.

max_cells independently limits the number of retained records, including all
parents. It is a length bound, not a bound on Vec spare capacity, scalar payload
or heap bytes. A limit of ten rejects the next required total of eleven; even
an empty query with capacity zero fails the requested capacity contract. An
empty query with sufficient resources returns one empty root record. Scalar
refinement, source ingestion/destruction, payloads and native arithmetic/graph
heap allocations retain their documented exclusions; no total wall-clock or
heap-byte bound is inferred from graph counts.

A cancelled attempt and a late graph/arithmetic exhaustion publish no report;
owned temporary state is dropped and independent retries pass. Exact bisection
of [0,1]*2^i32::MIN fails with the original lattice scalar Overflow instead of
rounding or repeating a cell; an adjacent representable-grid retry succeeds.
A square-root query lacking complete-domain evidence keeps its native
DomainNotCertified failure. A coarse 1/3 singleton stays unresolved, while a
higher-precision retry certifies it positive. No failed attempt is cached as
permanent undecidability.

## Qualification and development evidence

Final qualification passes 150 owner tests plus four replay children, 114
default tests, strict all-target/all-feature Clippy, strict rustdoc, WASM,
workspace formatting and diff checks. ASan/leak checking covers 35 maintained
enclosure tests plus four replay children; its standard-library sysroot is not
instrumented. The supplemental 3D witness changed tests only, and full local
qualification, focused ASan and main-worktree acceptance/formatting reran after
that edit. The indexed repository source-budget check passes after retention.
Existing trace assertions and hard fixtures remain unchanged.

The missing API failure is retained. The external benchmark consumer's first
locked build correctly refused a missing transitive optional dependency; an
offline metadata run updated only its temporary lockfile, after which locked
builds passed. baseline-probe-Cargo.lock and the final probe lockfile preserve
both dependency states. The repository Cargo.lock did not change. An initial
byte-identity assertion for the default executable failed; follow-up read-only
ELF inspection established the precise metadata difference below. No executable
was rewritten and no fixture or validation requirement was weakened.

## Completed-workload cost evidence

Default classification executables are 8,102,576/8,102,600 bytes (baseline/final),
with identical 4,467,244-byte function-address unions. Every loaded section has
identical bytes, address, flags, size and alignment except .note.gnu.build-id;
the 24-byte file growth is outside the matching loaded code/data. All 46 smoke
cases pass. Hashes and section details are retained. No default speedup or
whole-file byte-identity claim is made.

The same legacy polynomial/trig/Linear compile/natural/Taylor/reuse/late-exhaustion
probe preserves all 21 exact definition/result/allocation rows. A controlled CBBC
run uses eight warmups, 32 complete-result/drop allocation epochs and five batches
of 128 timed operations, CPU 0, ASLR disabled, one executable path and a two-second
warmup. Compilation and checks finished before timing. No candidate batch-range
separation in the adverse direction appears in this run; the trig compile median
ratio is 1.0003 with overlapping ranges. All samples, including adverse ones, are
retained. This is not a universal no-regression proof or an optimization claim.

The optional legacy executable grows 2,712 bytes (3,804,488 to 3,807,200); its
function union grows 450 bytes (1,963,804 to 1,964,254). The new subdivision probe
is a separate executable, not an incremental feature-size measurement. The
11-record dependency cover completes at median 55.358 us with temporary peak
13,576 bytes. The affine-sphere cover has 23 records, 12 leaves, four explicit
unresolved leaves and 7,012 graph work units; it completes at median 456.635 us
with peak 29,464 bytes. Its whole-query location is Unknown, not falsely counted
as a resolved geometric classification. Late work exhaustion and capacity failure
are measured separately. All success/drop and failure epochs end with zero signed
live-byte delta. These local warmed instrumented observations are a small
completion/resource envelope, not cold-cache, universal or competitive ODE bounds.

## Remaining scope and preservation

Other primitive/piecewise lowering, domain-refinement strategies, Taylor-based
adaptive portfolios, wider consumers, wrapping/QR, competitive dynamics, whole
resource closure and release qualification remain open. No new full root/browser,
Interface/firmware/hardware, coverage/fuzz, successive_operations or complete
workflow/pre-push campaign is claimed. Fifteen preceding immutable stages verify
unchanged. The main 41-path staged extraction patch and Interface's eight pending
edits remain byte-identical; firmware and the isolated tree are clean. No push
occurred. Phase 13 and the full fifteen-phase objective remain active.
