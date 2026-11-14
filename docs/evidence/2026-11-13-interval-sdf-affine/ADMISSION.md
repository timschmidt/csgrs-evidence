# Affine source closure for SDF enclosure programs

Retained source: a686a1e7a2aa88acbacf9f95f6a25fd87ca89dfe.
Baseline: c80b618fd6a4260face6d65e7e20f3d6f774cebe. CONTRACT.md preceded edits;
missing-affine.log reproduces Unsupported("affine transform") for a valid
constructor-admitted sheared/reflected sphere. missing-affine.rs retains that
witness; its final form lives in shared acceptance support. final-source.json
and retained.patch bind the six changed files, including the new test module.

## Ownership, domain and closure argument

Hypersdf owns source-field interpretation and its retained transform. Its
constructor still validates homogeneous affine form and computes the native
exact inverse once. This compiler consumes inverse rows 0..3 on (x,y,z,1), as
inverse_point does. Every row reuses the existing Linear graph emitter; the
three resulting node identifiers bind the child. Nested frames use local copied
identifier arrays; siblings retain their own bindings. No source tree or matrix
inverse is reconstructed. Native exact scalar coefficients remain graph constants.
By row substitution and induction over the existing expression grammar, child
field values preserve the original inverse-coordinate interpretation.

The publicly constructible Affine enum does not prove mutual invertibility of
its matrices. The compiler preserves its existing inverse_point field semantics
and retains both original matrices in the source Arc; it does not add an
invertibility, projective-map, Euclidean-distance or topology guarantee. The raw
inverse witness verifies that its fourth row is not silently used for projective
division. Constructor-level rejection of singular/non-affine matrices remains
covered by the unchanged owner suite. No transform/offset commutation is used.

| Capability | Demonstrated behavior | Boundary |
| --- | --- | --- |
| Source construction | Native affine constructor; rational shear, reflection, nonuniform scale, translation and algebraic coefficient | Existing constructor decisions remain native |
| Evaluation/differentials | 125 independent rational sphere values; original-source agreement; independent chain-rule Jacobian | No sampling-based claim about complete cells |
| Whole-cell image | Native dyadic evaluation on inverse-coordinate graph | Containing-zero range stays unresolved |
| Taylor/composition | Exact transformed quadratic with zero remainder; native subdomain reuse and subsequent squaring | Native Taylor regularity and complete remainder obligations apply |
| Frame composition | Mixed nested translations/affines, siblings, 64 nested frames | 30 nodes per affine frame; no tree expansion |
| Failure/resources | Original invalid/undecided parameters, query-domain errors, empty cells, exact entry/work thresholds, cancellation/retry | Existing scalar payload/refinement and heap-byte exclusions |
| Replay | Fresh process rebuilds authored recipe and re-establishes proof | No generic SDF interchange or serialized proof adoption |

The sphere inverse coordinates are a=x-2y-3, b=y, c=(1-z)/2, and the field is
f=a²+b²+c²-4. Independent expectations check 125 integer query points using an
integer numerator divided by four. At (6,1,3), f=-1 and grad f=(2,-2,1).
The transformed logistic field uses world x=5, y in [1/2,1], z=1. Its natural
range is [-3/8,5/8]. Centering y at 3/4 gives the exact polynomial
-1/8-4*(y-3/4)^2 and range [-3/8,-1/8], proving the complete cell inside with
zero remainder. Its model can be reused on the midpoint, and its native source
can feed a squaring program, retaining original and composed outputs.

## Guards, identity and resources

All child parameter-admission calls retain their original order and failure
causes. Invalid and undecided radii remain distinct even under zero multiplication.
A transformed square-root query outside its domain fails; an empty Cartesian
query follows the native empty-query contract, and a subsequent valid query
succeeds. Source identity and metric qualification remain attached to reports.
Compilation of an already-admitted affine coordinate field performs no scalar
or predicate dispatch, asserted with an empty full dispatch trace and default
rational counters. Existing dispatch assertions remain unchanged.

Each affine expansion adds 30 nodes and one pending child task, so the compiler
reserves 31 additional live records. Exact standalone entry thresholds are 38
for a transformed coordinate and 51 for a transformed sphere. One-less entry
and work budgets fail typed; cancelled attempts fail and independent larger
retries succeed. This is graph-entry/work accounting, not a total scalar-work,
heap-memory or wall-clock bound. No exhausted proof is cached.

## Validation and development findings

Final qualification passes 141 owner tests plus three replay children, 114
default-feature tests, strict all-target/all-feature Clippy, strict rustdoc,
WASM, workspace formatting and diff checks. ASan/leak checking passes 26
enclosure tests plus three replay children; its standard-library sysroot is not
instrumented. The retained implementation was restored byte-for-byte after the
second experiment and the entire final qualification and ASan rerun passed.
Main-worktree acceptance, formatting and indexed repository-budget checks pass.
Original parent and primitive tests share one existing uncertainty helper module;
no assertion was removed or weakened.

Retained development failures include the missing affine capability, ambiguous
Into type inference in a new expected-value vector (fixed with explicit Real
values), and Clippy's duplicate loading of the existing uncertainty module
(fixed by loading it once at the shared test root). Both performance experiments,
all raw results and their source snapshots remain present. These failures did
not require a weaker policy, fixture or production result.

## Completed-workload cost evidence

The default owning classification benchmark is byte-identical to baseline:
8,102,576 bytes; SHA-256
be7d09278a800c3623335e196ec26bb172198cfa849ec25097f1a1607b6c9afc;
function-address union 4,467,244 bytes. All 46 smoke cases pass. The new code is
behind the existing optional enclosure feature; no default runtime speedup is
claimed. Readelf inspection preserves executable bytes.

The legacy standalone probe source and allocator are unchanged from the prior
stage, apart from dependency paths. Polynomial, trigonometric and Linear
compile/natural/Taylor/reuse/late-exhaustion workloads have 21 exactly matching
definition/result/allocation rows across baseline and both variants. Each probe
uses eight warmups, 32 complete-result/drop allocation epochs and five timed
batches of 128 operations; CPU 0, ASLR disabled, one executable path and a two
second warmup. Compilations and validation finished before timing. These are
local warmed instrumented measurements, not universal performance guarantees.

The selected direct-emission variant's CBBC run observes compile median ratios
1.0359/1.0357/1.0247 for polynomial/trig/Linear, each with separated batch ranges.
Polynomial late exhaustion is 1.0257 and Linear late exhaustion 1.0154, also
separated. All other rows and adverse overlapping ranges are retained in
legacy-comparison.json. Its optional executable grows 776 bytes (3,803,272 to
3,804,048), and its function union grows 641 bytes (1,963,163 to 1,963,804).
These costs are accepted for demonstrated new affine completion; performance
neutrality is not claimed.

The second variant moved only the new affine emission to an out-of-line helper.
Its complementary BCCB run still shows compile slowdowns, with polynomial/trig
ratios 1.0301/1.0487 and separated late-exhaustion slowdowns 1.0524/1.0704. It
increases executable/function bytes by 1,192/883 over baseline. New affine compile
median is 2.375 us versus 2.267 us for the selected variant. This experiment did
not establish an improvement and is rejected; its sources, validation and cost
observations remain archived. No old predicate order changed in either variant.

For the selected new transformed-cell workload, compile/natural/Taylor/reuse
medians are 2.267/7.529/236.631/11.842 us. It uses 38 graph nodes and 95 compile
work units; the largest temporary peak is 27,212 bytes. Every successful-result
drop and late-exhaustion epoch has zero signed live-byte delta. Late exhaustion
uses the measured complete compilation work minus one, rather than an early
zero-work rejection. These observations define a small completion envelope;
there is no new successive_operations, cold-cache or competitive ODE claim.

## Remaining work and repository preservation

Other primitive/piecewise lowering, adaptive F-rep subdivision, wider consumers,
wrapping/QR, competitive dynamics, full resource closure and release obligations
remain open. No full root/browser/Interface/firmware/hardware, coverage/fuzz or
complete workflow/pre-push campaign is claimed. Fourteen prior immutable stages
verify unchanged. The main 41-path staged extraction patch and Interface's eight
pending edits remain byte-identical; firmware and the isolated source tree are
clean. No push occurred. The full fifteen-phase goal remains active.
