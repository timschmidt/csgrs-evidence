# Polynomial arithmetic over retained Taylor models

This is an additive, opt-in Phase 13 extension at Hypersolve's existing Taylor
proof layer, forwarded by Hyperdynamics. It does not complete Phase 13, wrapping
control, the interval refactor, or the target geometry support envelope.
`CONTRACT.md` records the admitted domain and missing witness before implementation.
`SOURCE_FINAL.json` and `candidate-final.patch` identify the qualified 13-path
change against a7bf5eb2142dbe5d3b958855cc74859edf9b607e, retained as
568ddff117ee0ba873cdfa14186b1830201ede4c. Build artifacts and target
directories remain outside this record; their paths, hashes and commands are retained.

## Construction and evidence

A `TaylorPolynomialModel` retains its original `Arc<TaylorModel>` and an immutable
flat history of shared map stages. Constants, inputs, negation, addition,
subtraction and multiplication consume the previous outputs over the original
center/domain/order. Exact sparse coefficients are combined before truncation.
Multiplication retains every discarded monomial and separately encloses truncation,
P*S, Q*R and R*S. Scalar coefficients never become enclosure endpoints. Original
source guards and definitions remain authoritative when maps ignore inputs.
Subdomain queries intersect polynomial-plus-residual bounds with native map
images. This need not preserve residual correlations or provide a tight enclosure;
use the existing specialized affine form for its distinct residual-coordinate
composition contract. Division, transcendental maps, direct PowI nodes and merging
independently centered models remain outside this map grammar.

Private certificates are reconstructed from original source/request and map
definitions, including in fresh processes. Generated output is input to further
maps. `TaylorRange` reuses the existing Cartesian carrier and distinguishes empty
from zero-dimensional unit results. Its fields stay private; the new internal
constructor is feature gated. The proof accessor checks the requested map node's
operation before returning multiplication evidence, so a reused input cannot
misattribute a producer's evidence to a new operation.

Graph budgets charge new traversal, coefficient keys, proof nodes and copied stage
handles. Native arithmetic charges the supplied dyadic budget. Stage entry limits
are not total live heap bounds. Existing exact-scalar payload/refinement and
within-scalar cancellation exclusions remain explicit. Failures publish no model
and leave inputs reusable; the history has no recursive owning-parent chain.

## Regressions and verification

Retained failures include the missing public carrier, empty/unit conflation, and
misattributed multiplication evidence on generated input. Other draft failures
(type inference, duplicate export and test access to private downstream budgets)
remain recorded. The field fixture uses the field API's existing public model
access and explicit native budgets; production budget visibility was not changed.
The final ten core tests cover independent exact coefficients, truncation and all
residual cross terms, algebraic coefficients, multivariate cancellation, source
guards, invalid/reached/unused map nodes, empty/unit inputs, subdomains, shared
sources, 32-map chains, typed exhaustion/cancellation/retry, one-unit-short final
budgets, zero getter dispatch and fresh-process exact replay. The downstream
fixture preserves field identity and reordered time/state bindings, then consumes
its product in another exact polynomial map.

`qualification.json` records all seven final successful checks: 1,547 tests
across 70 test/doc groups in Hypersolve and Hyperdynamics (zero failed or ignored;
six filtered), all-feature/all-target Clippy with warnings denied, warning-denied
docs, minimal polynomial features, disabled features, WASM and workspace formatting.
Earlier successful runs and failures are separate, not overwritten. The root's
normal/build/dev feature graph has only Hypersolve's default feature and does not
compile the changed Taylor module; this is scoped dependency evidence for the
existing successive_operations configuration, not a unified-all-features timing
claim. The full pre-push workflow matrix, coverage/fuzz/sanitizer campaigns and
remaining release qualification have not been run for this increment. No push.

## Existing workload controls

The initial ungated implementation grew the old model consumer by 8,200 ELF bytes
and changed owner code sizes; it was rejected. The new capability is isolated in
`taylor-polynomial`. New declarations are appended to preserve existing source
locations. A trial widening range-field visibility changed the affine consumer's
code layout; the retained design keeps the original fields private.

`private-inspected-controls.json` compares three existing consumers and eight
owner bench/test executables under precisely the previous feature sets. Every
allocated section except the build ID is identical, and the complete sized
function layout agrees after canonicalizing LLVM numeric disambiguators.
The field-only consumer is byte-identical. Unstripped ELF size deltas are -8 for
the model consumer, zero for affine, and 0/+8/+16/+40 among owner executables.
These are recorded nonallocated symbol-string metadata costs of the additive
extension, not a claim of zero raw file growth or a behavior-preserving refactor.
No binary was rewritten or stripped for the comparison. Old feature selections
are fixed in the control drivers; functional all-features checks include the new
feature separately.

All three complete consumer observations have equal output/work/allocation/
reallocation/peak/live records after excluding only explicitly identified timing
fields. Raw incidental timing remains in the logs and is not interpreted during
concurrent builds. The complete owner dispatch reports are byte-identical. Code
and loaded-data identity support execution preservation on these compiled paths;
this is not a universal performance proof or a new broad timing speedup claim.

## New completed workload measurements

The maintained Criterion benchmark compares consuming an already-existing seed
model with fresh differentiation of the same composed function, domain and order.
Seed construction is outside both timed callbacks. Both callbacks materialize and
drop the whole returned proof. Independent exact coefficients and analytic extrema
are checked. The polynomial cases require exact equal ranges; the nonlinear case
requires both proofs to meet the same explicit width limit and prints both bounds.
In this measured reciprocal fixture those final bounds also agree. This does not
assert equal residual evidence, equal algorithms or an end-to-end advantage when
seed construction is required solely for one operation.

The allocation observer uses the same cases and operation bodies, a separate
counting allocator, eight warmups and 32 complete construction/drop callbacks.
`final-polynomial-allocation.log` records all rows plus structural/native work and
incremental retained/peak bytes. Reuse versus fresh differentiation allocates
10,066/24,950 bytes for centered logistic, 12,850/21,984 for algebraic product,
and 9,166/129,116 for reciprocal square. Reuse retains 6,416/6,272/4,144 bytes;
fresh differentiation retains 4,704/4,256/12,752. Corresponding peak bytes are
8,032/8,112/5,648 versus 6,708/5,596/20,820. Reuse performs more native arithmetic
work in the two simple cases despite fewer graph work units. No metric is hidden
behind total allocated bytes, and the retained seed's preexisting storage is not
counted as incremental output storage.

Warm-cache observations all return to zero incremental live bytes after drop.
A first retained-output observer used fresh seed caches and found 104 live bytes;
its assertion failure and source are preserved. The corrected observation warms
the existing source caches before attributing incremental storage to an output,
matching the earlier allocation observer's scope. It does not claim zero cold
cache growth or a whole-resource/heap bound.

`new-timing-runs.json` and raw Criterion samples record three complete trials of
all six callbacks, CPU 0, disabled process ASLR, one-second warmup, two-second
measurement and 30 samples. Builds and tests finish before timing starts. These
are local ordinary completion measurements of the disclosed reuse workload,
not broad solver or ODE performance/completeness guarantees.

The three trial median ranges, in microseconds, are:

| Completed case | Reuse | Fresh differentiation |
| --- | ---: | ---: |
| Centered logistic | 42.291–42.388 | 48.612–49.193 |
| Algebraic product | 53.913–54.207 | 42.895–43.051 |
| Reciprocal square | 73.637–73.807 | 259.477–261.305 |

The algebraic product is slower under reuse in every trial. No blanket speedup
claim is made and the favorable reciprocal result does not erase that cost.
The separate feature leaves the preexisting model construction paths available.

## Integration and preservation

Main retains the unrelated 41-path pending extraction; Interface retains its
eight pending edits and Firmware remains clean. The qualified patch overlaps
Hyperdynamics's staged manifest and README. A temporary index prepares the merged
tree and reverses only this new patch back to the exact original index tree;
`integration-preflight.json` records the proof. The actual integration is checked
against that tree before advancing the local branch to the isolated source commit.
All 25 prior frozen evidence stages are verified without modifying them.
