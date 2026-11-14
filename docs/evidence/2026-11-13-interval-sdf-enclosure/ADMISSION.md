# Admission: native whole-cell enclosure of retained implicit fields

Source extension 61e9c55642c6b538a3e7bab87ef41d59d2274b25 and resource correction
09f540dc8340618f587ca4c7d6282eb894d3b631 are retained against baseline
aede1a20b421cb240f1c3b530c6f593cc6c767a2. CONTRACT.md was recorded before
implementation; missing-api.log reproduces the absent API, and the maintained
trigonometric fixture reproduces the old whole-cell interval gap on that source.
Final-source hashes cover both commits. Initial records are retained separately.

## Ownership, domain and proof

Hypersdf retains the original Arc<Sdf> and assigns whole-cell sign/metric meaning.
Hypersolve validates and evaluates the generated program and owns regularity,
coefficient and Taylor remainder proofs. Hyperinterval owns dyadic arithmetic.
The optional enclosure-program feature introduces no new arithmetic kernel.
Existing query bodies, predicate dispatch order and default behavior are unchanged.

The compiler covers constants, ordered x/y/z coordinates, linear expressions,
add/subtract/multiply, principal sqrt, sine/cosine/tangent, complement, offset,
and nested translations. Primitive, piecewise and affine forms return explicit
Unsupported errors on this new route; their existing SDF operations are retained.
These are current implementation gaps for wider adoption, not mathematical
impossibility or exhaustion. No completeness claim covers every SdfExpr variant.

An induction on iterative traversal establishes the exact scalar interpretation:
constants are unchanged exact Real definitions; coordinate references use the
current frame; linear and arithmetic nodes retain operation and operand order;
translations subtract exact retained offsets; tangent emits sine/cosine of one
shared operand and division with its nonzero-cosine guard. No zero multiplier,
unused coefficient or domain check is simplified away. Every successfully
compiled tree has exactly three bindings and one output. Native validation
checks all references. Source construction/ingress and tree destruction remain
outside this adapter's work accounting; the adapter neither recursively walks
nor clones the source tree.

The retained source/program association is immutable and cannot be created by
loading a serialized success flag. Replay recompiles the authoritative SDF.
The fresh-process fixture reconstructs a declared authored polynomial recipe
and its exact integer parameter; it is not a generic SDF serialization format.
Native program composition, Taylor proof reuse and subdomain enclosures consume
the result without dropping its original guards. Structural sharing checks are
separate from independent scalar expectations.

A report carries the exact query cell and a certified scalar image. Strictly
positive/negative images establish whole-cell outside/inside. An exactly zero
image establishes the whole cell lies in the zero set. A range merely containing
zero remains Unknown and does not establish crossing, surface topology or a
regular boundary. Empty cells yield no location, distinct from zero-valued
nonempty cells. Metric status is inherited unchanged; an implicit range is not
promoted to Euclidean distance. Taylor regularity is stronger than natural image
admission and must hold across the complete cell. All omitted terms contribute
to the native remainder.

## Witnesses and resource correction

For x in [0,1], sin(x)+cos(0) is certified positive. The polynomial
x(1-x)-3/8 has natural image [-3/8,5/8]; its exact quadratic centered model has
zero remainder and image [-3/8,-1/8], proving the full cell is inside. This has
an independent expectation from x(1-x)=1/4-(x-1/2)^2. Forty-nine independent
integer expectations check nested translations, linear expressions and
arithmetic against both original scalar evaluation and the generated program.
Further source composition and native Taylor subdomain reuse are exercised.

Nine maintained tests additionally cover exact zero/empty/unresolved cells,
original invalid roots beneath zero multiplication, a tangent interval crossing
a pole, natural sqrt success versus stronger Taylor rejection, typed unsupported
forms, source identity, fresh-process proof reconstruction, 128 translations
with linear graph growth, wrong request arity, exact work boundaries, size
exhaustion, cancellation and retries. Compilation dispatch and rational counters
are asserted zero. No prior assertion or policy was weakened.

The final review reproduced an unnecessary size rejection on the initial source:
a constant with nine available graph entries was rejected by a uniform twelve-
record expansion reservation. RESERVATION-REVIEW.md and reservation-failure.log
retain that finding. The correction reserves the actual current task's maximum
additional live records, accounting for consumed operands, and charges initial
binding/task construction. The nine-entry witness and every previous boundary
assertion pass. Precision, graph work/entries and native scalar budgets remain
separate. Scalar refinement/payload, source ingestion and heap-byte exclusions
are explicit; no total memory/time or within-scalar cancellation bound is claimed.
Every failure is typed before a result is published, with original error sources
retained. No failed cache survives a retry.

## Validation and measured envelope

Final owner qualification passes 124 tests plus the separately invoked replay
child. Default-feature qualification passes 114 tests. Final all-target/all-
feature Clippy with -D warnings, strict docs, WASM, workspace formatting and
diff checks pass. Final ASan/leak checking passes all nine new tests and replay;
its standard-library sysroot is not instrumented. Main-final command records
cover the merged-workspace acceptance, format and indexed repository budget.
This is affected qualification, not every repository workflow or a push gate.

The actual default classification benchmark completes all 46 smoke cases.
Baseline/final raw executables are 8,102,600/8,102,576 bytes; the final artifact
matches the initial candidate's raw hash. Their loaded sections, addresses and
bytes agree except the GNU build-ID note. Text is 4,515,847 bytes and the complete
merged readelf FUNC address union is 4,467,244 bytes in both. This provides
compiled default-path equivalence evidence, not a new noisy timing claim.
The original objcopy dump commands also rewrote their owned ELF containers;
artifact-dump-note.json records the discovery and raw artifact reconstruction.
Baseline was rebuilt to its original recorded hash and candidate restored from
the identical raw final artifact. Readelf records and direct byte slicing supply
subsequent section comparisons without mutations. All binaries stay outside the
source/evidence archives; build commands and hashes are retained.

The external consumer harness measures two completed use cases: the polynomial
inside proof and trigonometric outside proof. It reuses the prior allocation
instrumentation verbatim, with eight warmups, 32 complete-result/drop allocation
iterations, and five batches of 128 timed operations at CPU 0 with ASLR disabled.
No compiler ran during these measurements. This is a warmed instrumented harness,
not a production latency bound, cold-cache claim or competitive ODE benchmark.
Final median polynomial compile/natural/Taylor/reuse costs are approximately
1.50/3.55/62.10/5.77 microseconds; trig costs are 1.09/90.45/701.39/16.52
microseconds. Maximum measured temporary peaks are 1,252 bytes for compilation,
1,080 for natural image, 11,368 for Taylor construction and 1,304 for reuse.
All success/drop and late-exhaustion epochs have zero signed live-byte delta.
Late compilation exhaustion uses measured required work minus one. Initial
prototype timings and adverse differences remain retained, not replaced by final
samples. There is no old/new speedup claim for a formerly unsupported operation.

The default CSGRS feature graph does not activate enclosure-program. No new full
root successive_operations, browser/Interface, firmware, hardware, coverage/fuzz,
release or full pre-push campaign is claimed. All twelve preceding immutable
stages verify unchanged. Pending extraction hunks remain unchanged: only the
Cargo.lock blob identifiers on the staged diff changed because the optional
dependencies were added on both sides. Interface's pending patch is unchanged;
firmware remains clean. The isolated source tree is clean at the final source.
Phase 13 and the full fifteen-phase goal remain active. No push occurred.
