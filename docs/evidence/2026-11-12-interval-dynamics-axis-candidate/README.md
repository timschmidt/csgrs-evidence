# Hyperdynamics affine-axis candidate — retention gate open

This is an unfinished extraction candidate, not an accepted refactor or completed
phase. CANDIDATE.json binds the exact CSGRS and Interface baselines and patches.
The primary worktrees retain those pending edits for continued work. No source
commit or push accepted the production changes. The goal remains all 15 phases.

## Implementation and semantics

The candidate introduces Hyperdynamics 0.1, depending only on Hyperreal,
Hyperlimit and Hypersolve. It moves the affine axis projection algorithm and
reports, with DynamicsError retaining the existing thirteen outcomes. Hyperpath
keeps type reexports and deprecated one-release wrappers, with an exhaustive
error conversion. Interface imports the new owner and keeps its old Route
error boundary. No scalar arithmetic, predicate order, replay construction,
report fields or canonical encoding is intentionally changed.

source-equivalence.json and source-move.diff verify the moved implementation
matches the original after only error-type/import substitution and Rust 1.95
formatting with crates/.rustfmt.toml. An initial whitespace-only comparison
failed because rustfmt removed a trailing function-parameter comma; using the
actual formatter configuration establishes the exact source transformation.
The original implementation is frozen in a test-only module.

The initial new-package witness fails as expected in baseline-missing.log.
The maintained direct example subsequently passes in example.log. Package
listing and the dependency tree show licenses/example/source inclusion and no
Hyperpath dependency in Hyperdynamics. Listing is not clean registry publishing
qualification. Inverse `cargo tree -p csgrs -i hyperpath` rejects the absent
package; positive complete dependency trees then establish that the successive
benchmark dependency graphs are identical and contain neither affected crate.

## Correctness and compatibility

checks.py/checks.json record ten selected commands, all passing after the
retained initial failures. The old Hyperpath suite has 444 tests; the candidate
combined suites have 448 (three independent new dynamics tests and one migration
test). Interface's complete core run passes 201 tests/doctests. Strict Clippy,
docs, host Rust 1.95, stable Wasm compilation, both formatting checks and diff
checks pass. ASan passes the three dynamics tests and the migration test. There
is no new full coverage/fuzz/HIL/complete pre-push claim and no CI change.

The migration test runs 56 fixtures under STRICT and APPROXIMATE_512 in separate
processes for frozen legacy, direct dynamics and compatibility entry points.
Every full Debug report and complete trace snapshot matches. Cases include
rational/symbolic values, invalid inputs and unresolved logarithmic identities.
Independent integer cross-products verify 98 exact-minimum cases, row order,
first-tie selection and rejection of unsafe proposals. The first ordinary
fixture additionally fixes 9 rational comparisons, 40 structural sign queries,
1,220 total dispatch events and zero GCDs. Final count assertions pass in
final-trace-counts.log; final Clippy passes. The trace log retains the frozen
legacy strict rows, supplementing the live exact assertions.

initial-check.log retains a duplicate reexport compilation error.
initial-tests.log retains an unused frozen-helper warning; using its existing
all_satisfied method removes the warning without changing arithmetic counts.
initial-check-01.log retains Clippy's complex test fixture tuple error; a type
alias corrects it. None of these was bypassed or used to weaken acceptance.

The Interface baseline was independently checked out at ff668ca39d5e1ecee91b438b20eca806f3a26f29,
with paths redirected to the original CSGRS baseline. Its diagnostic-only patch
is interface-baseline-probe.patch. The retained diagonal/G1/axis projection
workflow produces a planner transcript of 41,795 bytes, with full SHA-256:
df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c.
The candidate now asserts that exact baseline digest and length in its maintained
test; canonical-golden-test.log passes. The first diagnostic used Digest's
truncated Debug formatting; baseline-canonical-full-digest.log records all 32
bytes and is the authoritative golden source. Semantic projection expectations
and downstream lowering checks accompany the digest; it is not the sole oracle.

Both full successive_operations runs complete 200 certified, manifold rows.
Their set/status/topology/representation columns and allocation traffic, live,
peak and call columns agree. This is a broad validation probe; concurrent build
activity means those elapsed times do not establish a speed comparison. The
positive dependency audit establishes this benchmark has no dependency on the
moved crates. All raw logs are retained.

## Measurements and why retention remains open

prepare-probes.py builds matched standalone complete projection consumers with
identical registry dependency versions seeded from repository locks. measure.py
runs baseline/candidate/candidate/baseline, pinned to CPU 0 after builds stop.
Each of twelve cases covers 2/6/16 axes, 1/8 spans and both policies, with eight
warmups and twenty samples of sixteen completed/materialized/dropped results per
run. Full-report checksum and allocation counts/bytes match. Timing ratios range
0.949–1.015, but sampling/clock drift is substantial; bootstrap intervals are
explicitly limited and do not cover timing drift. No global speedup is claimed.
The direct dynamics executable shrinks 3,780,856 -> 3,536,808 bytes. Its affected
17 generic Debug/drop symbols remain 2,848 bytes; client LLVM has 101 definitions
in both cases and shrinks 1,692,207 -> 1,685,984 bytes. Nongeneric function sizes
vary: select_minimum expands while other code disappears, so the selected
projection/client symbol sum itself grows 824 bytes. These different denominators
are retained rather than conflated.

The broad owning Criterion run covers 194 cases with 0.1s warmup, 0.2s requested
measurement and ten samples, pinned to CPU 0 without governor control. Median
ratio is 1.007, range 0.935–1.199. Several untouched Specctra parsers are slower.
Targeted reverse/forward reruns preserve the adverse result: 256-record parsing
is about 198–200 microseconds for the candidate versus 171–172 microseconds for
the baseline in those runs. The Hyperpath benchmark binary grows
13,308,824 -> 13,319,976 bytes (+11,152), with text growth of 6,896 bytes.
These violate the refactor retention gates despite the direct consumer reduction.

The controlled build applies candidate-for-controlled-build.patch in the SAME
absolute directory as the baseline; it produces a byte-identical candidate
binary (SHA eb6550b9f7fe414d42dda954b929497d1e4d63d767470009d5c5cd2f0c692677).
Build-directory differences therefore do not explain the result. A subsequent
control restores the original three Hyperpath implementation/reexport files
while keeping the new dependency. dependency-only-control.patch records its
exact state. That control retains original timing; the extracted candidate
remains slower. The five controlled 256-record means are approximately
239.7,219.3,244.4,213.6,217.2 microseconds for baseline/control/candidate/control/
baseline respectively. This shows clock drift too, but supports a movement/
code-generation/layout effect over a dependency-only explanation. Parser named
function sizes themselves are unchanged. No speculative parser rewrite or
compiler setting was accepted to hide this result.

The isolated directory called dynamics-axis-baseline is NOW the dependency-only
control, not a clean baseline checkout. Its original commit and every applied
patch are recorded. The primary CSGRS/Interface worktrees still hold the original
extraction candidate. Existing binary artifacts are not archived; hashes,
commands, locks, sources, patches, compiler, CPU, raw Criterion samples and LLVM
observations are retained for reconstruction.

## Next work

Do not commit or present the pending production extraction as accepted. Resolve
the owner timing/binary gate as part of the planned complete domain-neutral
dynamics boundary. Feed, lookahead and jerk extraction still require MetricSpan/
join evidence adapters that preserve the original lazy length/classification
call order and concrete geometry receipts. General enclosed functions, Jacobian
carriers, ODE/reachability, the earlier interval migration gaps and all other
plan obligations remain open. The favorable narrow projection timings do not
waive the adverse owning benchmark result.
