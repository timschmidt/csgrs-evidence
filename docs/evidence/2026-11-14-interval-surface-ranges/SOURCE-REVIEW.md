# Surface range source review

Reviewed isolated commit `014a082252da83d8d5d566253bcb598c7a456df3`
against base `b0fde90b4d9eb51c51723fb6e24a9b6ab6938962`. This is implementation
review evidence, not universal proof or a replacement for the pending suites.

## Ownership and scope

The 24-path diff adds a Hypersolve bivariate compiler, HyperBrep native adapter,
focused witnesses, a runnable example, completed workloads and their records.
Existing production function bodies are unchanged. Cargo.lock adds only the
optional Hyperinterval dependency under HyperBrep; default feature sets remain
unchanged. Domain and resource restrictions are explicit in the public contract.

The bivariate compiler uses the existing Jacobian Builder. Nested Horner order
matches coefficient rows indexed first by u power, then v power, including
ragged/empty rows. All outputs have explicit division by one original denominator
node, including zero numerators. It performs no scalar cancellation or predicate
reordering. Duplicate bindings, node references, entry/work budgets and
cancellation remain under the existing graph validator and resource owner.

HyperBrep admits only the existing immutable positive-weight rational tensor
carrier. Native tensor conversion is reused; a temporary carrier isolates cold
homogeneous-cache population while warm source cache storage is borrowed.
The original Surface handle and UV chart are retained. Generated source
transform/subdivision/reconstruction/native replay witnesses exercise the next
range operation. This does not establish arbitrary surface modeling closure.

For nonempty boxes, strict native comparisons validate both ordered endpoint
pairs. The retained regular Jacobian evidence owns the source program and
arguments; private construction fixes three coordinate and six partial outputs.
Public getters cannot forge that association. Canonical empty boxes remain empty.
The exact native Aabb projection borrows the report; its overlap result is not
claimed as incidence, rank, injectivity or face/solid validity.

## Budgets, failures and lifetimes

Native conversion reserves checked structural work before allocation; graph
emission and later projections use the existing caller budgets. Entry checks
are stage-size checks, not heap reservations. Source scalar operations, native
conversion interruption, coefficient growth and total heap remain exclusions.
Neither a failed conversion/query nor a cancellation publishes a complete report.
The new error enum preserves original error sources. Output and source Arcs do
not create a new back-reference or ownership cycle in the added implementation.

The current exact preparation does warm shared scalar arithmetic facts. The
new full lifecycle snapshots expressly pin that behavior; old predicate order
and old trace regression remain unchanged. See TRACE-REVIEW.md and the original
failed fixture logs. The expanded scalar-equality recognizer limitation and the
independent per-node quadratic test oracle remain separately documented.

Measured source and benchmark bodies are unchanged after commit 2d2fc538b;
COST-COMPLETION.json binds final raw summaries and the intervening documentation
diff. Warm zero live storage is not extrapolated to cold runs: cold retained
storage and its 32-query plateau are retained without asserting leak freedom.

## Current checks

Focused acceptance previously records 52 passing tests, strict lint/docs/format
and disabled-feature checks. New broad checks execute on the clean reviewed
commit; see qualification-commands.json and package-final/package-commands.json
for actual completion, rather than interpreting this review as their success.
`bash scripts/check-repository-budget.sh` passed after the documentation commit:
4,223 tracked files / 143,807,478 bytes. All 44 prior frozen evidence trees and
the four managed repository states remain unchanged at this checkpoint.

No source or evidence has been pushed or published. Full goal completion,
general algebraic closure, total resource bounds, new public JS/C bindings,
100% coverage and formal verification are not established by this increment.

## Delivery followup after the fixed-source run

Nine archives and the unchanged external native example pass build/run/strict
Clippy. The same archived example completes three sixteen-cell portfolios in
Node 22.23.5 WebAssembly, zero imports and default linker stack; this is a debug
Rust artifact, not a public JavaScript binding or release-size qualification.
The docs.rs metadata witness finds HyperBrep currently lacks opt-in feature
configuration. Complete that P37 manifest followup after the current fixed-source
owner/downstream run; do not treat local all-feature rustdoc as hosted exposure.

## Docs.rs followup resolved in isolated delivery source

Commit d625de5b8e93dcb34e481a99253b1bb3cdd77592 adds only package metadata;
DELIVERY-SOURCE.json proves every Rust source, fixture, workload, dependency and
default feature is unchanged from the still-validating 014a08225 revision.
All nine new archives verify. The native external consumer builds/runs/passes
strict Clippy; packaged all-feature strict docs and five rendered API pages pass.
Initial artifact-byte and Cargo CLI assumptions failed and are preserved: new
revision receipts alter dependent archive checksums, all individually validated;
Cargo rejects dependency --all-features outside a workspace, so a dedicated root
declares exactly every packaged feature before documenting the dependency.
No source/fixture/policy assertion was weakened. Actual hosted docs.rs execution
is not claimed. See DELIVERY-FINAL.json; full owner/downstream validation remains
running on the unchanged original checkout, session 4105.
