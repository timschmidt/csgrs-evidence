# Correct affine SDF Lipschitz certificates

Retained source: 265249c34ac6580f2e23bb07583d3150d067dda2.

CONTRACT.md records the owning contract before implementation. On baseline
37eed4312b08ae267d53e55e96d87631083a7faf, incorrect-bound.log reproduces a
false certificate: the child f=x transformed by an X scale of 1/2 changes by
exactly 2 over world distance 1, but the API certifies a Lipschitz bound of 1.
original-witness.rs retains that test. This is a correctness repair, not a
behavior-preserving refactor or a claim that the old affine result completed
the same contract. The complete interval-refactor goal remains open.

## Ownership and proof

Hypersdf owns transport of its child field's local bound through the retained
inverse map. The existing inverse-AABB computation first supplies a conservative
child query. If the child is L-Lipschitz there and B is the inverse linear part,
the composed field is L times an upper bound for ||B||_2 Lipschitz on the world
query. Translation returns the existing child outcome unchanged. Unknown child
outcomes and structurally zero child bounds return unchanged, without norm work.

The retained implementation uses Hyperlattice Vector3 self-dots and cross-dots
to form the diagonal and symmetric off-diagonal entries of G=B^T B. Existing
strict max/provenance helpers select the largest absolute row sum M. Expanding
v^T G v and applying 2|v_i v_j| <= v_i^2+v_j^2 proves ||Bv||^2 <= M||v||^2.
The factor sqrt(M) is therefore conservative, and sharp for diagonal G, including
similarities and signed axis scales. No scalar or matrix kernel is duplicated.

If row ordering is undecided, row-wise Cauchy-Schwarz independently proves the
Frobenius factor sqrt(trace(G)). That proof does not consume the failed ordering
or any approximate terminal. Its own certainty is exact; the existing pair
combiner still merges the child's certainty and stage. A square-root failure
uses the existing unsupported outcome. No new public error or report shape is
introduced. The result need not be the smallest possible Lipschitz constant.

The proof applies to finite exact retained linear coefficients, including
algebraic and supported computable values. It follows the actual inverse-point
semantics, including the existing public raw inverse variant. It does not add
validation of raw matrix/inverse consistency or projective semantics. Existing
query/domain validation, report self-consistency, source identity and metric
qualification contracts are not strengthened by this correction. No new total
resource bound, cancellation mechanism, serialization or cache is introduced.

## Maintained witnesses and qualification

The new integration binary keeps the original failure and checks exact identity,
reflection, expansion, contraction, anisotropic scale, shear, an algebraic
45-degree rotation, nested transforms, constants and a raw collapsed inverse.
Three fields and 108 exact point pairs per field check 324 independently formed
world-distance inequalities. A retained computable-zero fixture exercises the
independent Frobenius proof when row ordering is undecided. Unsupported tangent
and invalid-radius children remain unknown. Fresh-process reconstruction
recomputes the certificate; serialized flags are not treated as proof.

Trace assertions retain the old predicate prefix: 18 exact-rational comparisons
for inverse AABB, followed by two norm maxima for an ordinary affine coordinate;
constants and unsupported children remain at 18, translation at zero. Both
correct implementations pass these assertions. No existing test is weakened.
There is no policy argument on this strict construction API, so a fabricated
APPROXIMATE_512 configuration is not claimed.

qualification.json and vector-qualification.json record complete owner tests,
no-default tests, all-feature/all-target Clippy with -D warnings, strict rustdoc,
wasm32 check, workspace formatting and diff checks. The ASan logs and commands
cover the new integration binary including the replay child with leak checking;
the standard-library sysroot is not instrumented. test-summary.json records
actual counts, including replay children separately in the raw binary totals.
The selected build passes 158 owner tests plus five replay children, 121
no-default tests plus one replay child, and eight ASan tests plus one replay
child. The owner run after transfer to main also passes all 163 executions,
followed by workspace formatting, diff and indexed repository-budget checks.
The external default-feature probe exercises the public API, inspects certainty,
and drops complete reports. It is a local path consumer, not release validation.

## Implementation choices and cost scope

Kept: correct affine transport and independent conservative fallback. Rejected
as the final implementation: the first correct Matrix3 Gram product, retained
in matrix-implementation.rs with its complete qualification/build/probe evidence.
The selected vector construction reuses Gram symmetry and avoids computing
mirrored entries twice. Native child and inverse-AABB ordering is unchanged.

The vector comparison runs the two correct implementations in MVVM order, with
the same copied executable path, CPU 0, disabled ASLR and a recorded two-second
CPU warmup. All ten exact report/allocation rows agree across the four runs.
Each case warms eight times, measures 32 complete-result/drop allocation epochs,
then five batches of 128 complete operations. Construction is outside measurement.
The scale/shear median vector-to-matrix ratios are 0.7358 and 0.8313. Arithmetic
is 0.9992; translation is 1.0074 with overlapping ranges. The unchanged linear
path is 1.0062 with separated short-batch ranges; that adverse observation is
retained, not called equal or hidden. These short warmed observations establish
no universal speedup. They favor the symmetry-preserving implementation for the
changed affine workload, whose correctness is established independently above.

Initial CBBC probe logs also preserve the old incorrect affine results. Those
two rows cannot supply a same-completed-contract speedup comparison. The three
unaffected rows remain separately comparable. The arithmetic probe's threshold
zero is not an independent exact oracle; its retained exact bound of 5 is checked
by the owner suite. Report debug rows are comparison evidence, not serialization.

The full default owner benchmark runs all 46 cases in CBBC order using Criterion
10 samples, 0.25-second warmup and 0.5-second measurement, pinned CPU and identical
copied path. No compilation or profiling overlaps timing. Raw estimates and
samples, including adverse results, remain in criterion-owner. owner-comparison
records matched confidence intervals; no general no-regression claim is made.
Twenty-four of the 46 cases have both candidate lower confidence limits above
both baseline upper limits in this local campaign. Median ratios over the
whole suite range from 0.9669 to 1.0746. The arithmetic/sphere Lipschitz cases
are 0.9851/1.0099. These adverse observations are costs of the retained correct
build; no code-layout or environmental explanation is asserted without evidence.
The retention priority is restoring exactness over these measured costs.
These benchmarks do not exercise affine Lipschitz directly; the external probe
does. artifact-summary.json uses read-only ELF function-address unions, not a
claim of complete monomorphized or shipped binary size. Default baseline reuse
is bound to unchanged production sources by baseline-artifact-provenance.json.
The selected default executable is 8,117,344 bytes versus 8,102,600 before the
fix (+14,744); its function union is 4,477,513 versus 4,467,244 (+10,269).
The first correct matrix version was 8,131,000/4,488,382 bytes respectively.
The selected standalone probe is 3,245,392 bytes with a 1,904,766-byte function
union. Executables are retained outside this archive with recorded hashes.

All allocation epochs end at zero signed live-byte delta. Linear, arithmetic
and affine-scale probe cases allocate zero during the measured closure. Across
32 epochs translation allocates 3,328 bytes with a 104-byte peak; affine shear
allocates 7,936 bytes with a 144-byte peak. These are warmed probe observations,
not total lifetime, allocator-resident memory or arbitrary-expression bounds.

## Scope and preservation

The retained patch and source revision bind the final three files. Main owner
acceptance and repository-budget checks are recorded separately after transfer.
All sixteen preceding evidence stages are verified unchanged. The original
41-path staged extraction and Interface's eight pending paths remain unchanged;
firmware is untouched. No push is attempted. There is no new complete workflow,
root successive_operations, browser/firmware/hardware, full fuzz/coverage or
release campaign. No in-repository caller outside Hypersdf uses lipschitz_cell;
the local external probe supplies the affected downstream public-API check.
The other F-rep, wrapping/QR, release and fifteen-phase obligations remain open.
