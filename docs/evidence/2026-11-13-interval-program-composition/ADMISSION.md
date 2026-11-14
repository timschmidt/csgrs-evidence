# Admission: source-bound expression composition

Retained source: `62b8676bcb41652d558a75743dccd0e980fe78a6`, based on
`02f58bf3e6d7118dc36713113c4e0a20b046e67f`. The contract and missing-API
witness preceded implementation; see CONTRACT.md and missing-api.log.
Owning layer: Hypersolve ExpressionProgram, P1/P4/P6/P8-P10/P19/P27/P35-P37.
This is an additive phase-13 capability; existing arithmetic, evaluation,
predicate order, dependencies and compiler profiles are unchanged.

## Meaning and closure

For admitted programs f and g, with selected inner output indices s in outer
binding-slot order, the executable returns `(g(x), f(g(x)[s]))`. The complete
inner prefix preserves strict partial-function domains, including ignored
bindings and zero outer outputs. Original unreachable nodes remain validated
but unevaluated. Independent source identifier scopes avoid variable capture.
Repeated selections reuse the original inner output node. No expression-tree
reconstruction, numerical fitting, scalar demotion or duplicate solver is used.

Induct on outer node order: constants retain exact Real definitions; variables
map to validated selected inner output roots; each unary/binary node preserves
its operation and maps earlier operands to already emitted nodes. References
remain topologically ordered. Inner output guards execute before composed
results. This establishes the source-substitution meaning, not numerical
validity at arbitrary arguments. Original scalar/domain diagnostics remain
explicit; the outer-node map identifies their source operation. The immediate
sources and selection are retained; replay validates both source definitions
and repeats composition. A serialized validity flag is not a proof.

Existing exact, interval, Jacobian and Taylor evaluators consume the generated
program. Repeated composition selects prior composed slots while keeping all
prior guard outputs. TaylorAffineModel projects final values without dropping
the complete source proof. The independent logistic example gives [0,1/4]
with zero remainder versus the natural independent interval image [0,1].
Taylor regularity restrictions still apply to every retained output. This does
not implement arithmetic on already-built nonlinear remainder models, direct
field output selection, adaptive wrapping/QR, or broad application adoption.

## Resource and failure contract

The caller-owned ExpressionBudget charges visits, copies, binding maps,
validation and publication; checked size sums include graph/mapping entries.
Existing scalar/payload/heap exclusions remain explicit. No claim equates this
entry budget with total heap bytes or scalar bit complexity. Final cancellation
is checked before publication; failure mutates neither source and stores no
failed cache. Shape errors, scalar errors, work/size exhaustion and cancellation
retain distinct diagnostics; retries use an independent budget.

Eight maintained acceptance tests cover exact chain-rule expectations over 49
points, independent binding order/scopes, repeated composition, ignored guard
failures, unexecuted invalid nodes, linear sharing, exact and one-less budgets,
cancellation/retry, zero dispatch counts, fresh-process source replay and
malformed selectors/sources, interval empty/unit products, and Taylor projection.
Pointer identity checks supplement independent value expectations.

## Qualification

All final entries in qualification.json and main-commands.json returned zero.
The isolated all-feature runs passed 1,469 Hypersolve and 60 Hyperdynamics tests,
with zero failures/ignored tests. The eight new tests passed again in main,
along with 12 field-coordinate/Taylor consumer tests. All-target/all-feature
Clippy for both owners with -D warnings, strict Hypersolve rustdoc, WASM check,
minimal expression-program tests (four), disabled-feature check and workspace
format checks passed. ASan with leak checking passed all eight new tests;
its standard-library/proc-macro sysroot was not instrumented. Valgrind Memcheck
could not initialize because the loader lacked required strcmp redirection
debug symbols; this is an environment limitation, not a passing memory run.

Preserved development failures: the missing API compiled with E0432/E0599;
the first replay fixture needed explicit Real::from to resolve an ambiguous
conversion; the first allocation probe attempted unsupported Real::from(usize)
and was corrected to checked i64 conversion. Assertions were not weakened.
The constructor prototype was only an artifact-size probe and was not qualified
as an alternative API. Raw unsuccessful logs remain with successful retries.

## Completed-workload cost evidence

The actual expression_program Criterion owner bench was built with Rust 1.95.0
and the unchanged bench profile. Initial method and appended-module variants
added 136 executable bytes; the constructor probe added 24. The retained method
uses ordinary #[inline]. Baseline and final executables both contain 6,836,472
bytes; .text is 3,206,471 bytes and the merged readelf STT_FUNC address union is
3,167,734 bytes. All section sizes match. Machine-code/allocated section bytes
and executable hashes differ; byte equivalence is not claimed. Raw symbol and
section records and all rejected variants are preserved. Binaries remain outside
the source and evidence repositories, with hashes/build commands recorded.

All 12 actual owner benchmark cases completed in baseline/candidate/candidate/
baseline order, CPU 0, ASLR disabled, fixed path, two-second busy warmup,
one-second Criterion warmup, two-second measurement, 30 samples. No compilation
or profiling ran concurrently. No case had min(candidate lower mean CI) greater
than max(baseline upper mean CI). Degree-32 evaluation had an adverse mean point
ratio 1.00667835 with overlapping intervals; it is retained in the record.
These local measurements do not establish universal performance equality.

The separately attributed allocation observer reuses the frozen prior allocator
instrumentation. Sixteen legacy source/result/allocation rows match exactly;
its dependency locks match. This observer is not the owner timing executable or
a universal semantic oracle. New graph sizes are 7,28,100,388 nodes, three
outputs. Construction measured ten allocations per operation and at most
47,452 temporary peak bytes in this corpus; evaluation peaked at 38,512 bytes.
Taylor/projection construction peaked at 9,972 bytes. All measured success/drop
and late-exhaustion epochs had signed live-byte delta zero. Late exhaustion
uses actual successful work minus one and exercises temporary cleanup. These
are bounded corpus observations, not universal memory or latency guarantees.

Default CSGRS and Hyperpath feature graphs do not activate expression-program;
see unaffected-default-graphs.json. No new successive_operations, complete
browser/Interface/firmware, release, coverage or fuzz campaign is claimed.
No workflow changed and no push was attempted. Broader plan obligations remain.
