# E94: negative rational acos approximation composition

Target: 8f5a82169d4d3c905b0c97fdb23b75083f4bb6af. Owner: Hyperreal's
negative rational acos evaluator. P1, P3-P6, P18-P19, P26 and P35-P39 apply.

All 24 original probe queries completed. Six public/native/Real import paths
returned [3,4] for acos(-49/50) at p=-1 after pi.approx(-2)=13, although the
value is strictly between 5/2 and 3. A valid stronger pi proof must not make
its dependent complement publish a false enclosure. The kernel subtracts
two samples at output precision without reserving their combined errors.

For stored magnitude 0<=r<=1, AcosNegativeRational(r) denotes acos(-r).
Preserve public construction, valid imported graphs and typed rejection of
invalid stored magnitudes, including zero-scaled wrappers. Sample both terms
with two guard bits before subtracting and round once: two one-unit errors
contribute at most half an output unit, and final rounding at most another
half. Reuse native pi, positive-acos and scaling implementations; no adapter
formula or tolerance. Full-width precision and typed native cancellation
remain open.

Acceptance: independently directed MPFR acos bounds for endpoints, tiny,
ordinary and near-endpoint rational magnitudes, cold/warm queries through
p=-512, cancellation cleanup/recovery and concurrent refinement. Preserve
all 24 fresh-process cache histories. Test native/Real JSON/CBOR, Values and
collections, wire preservation, following arithmetic and invalid magnitudes.
The regression must fail against the unchanged parent. Enclosures establish
no topology or analytic-source fidelity.

After the final edit run focused integrations, default/all-feature release
scalar suites/doctests, debug units, strict all-target Clippy, warning-denied
docs/fmt, affected predicate/curve/modeling consumers and Rust 1.95 checks.
Measure the unchanged ordinary 17-row corpus at 100000 iterations and five
alternating pairs. Add 36 native negative-acos rows: magnitudes 1/2 and 49/50,
public Computable, imported negative-rational node and public Real; p=0,-32,
-128; cold construction/evaluation and warm evaluation; 10000 iterations
and five alternating pairs. Check every result against independent MPFR
bounds. Keep allocation, bytes, peak/retained memory, executable sizes and
all unfavorable results. Wrong parent outcomes cannot count as faster
successful operations; retain and classify any such measurement failure.

General domains, full-width precision, fallible native evaluation, internal
resource bounds, formal/exhaustive coverage, full CI, shipped distribution
and foreign consumers remain open. Hypervoxel is excluded. No push.

Use the authorized artifact volume with no retained-artifact quota and a
1 GiB physical free guard. Preserve original root/Disk B/tmp baselines and
200 MiB cumulative logs. Child address space: 8 GiB; Cargo jobs: 2; queries:
60 seconds; compile/full checks: 1800 seconds. External containment is not
an internal bounded-execution claim. Preserve every attempt and executed
helper; hash each physical path independently.

Pre-run correction: the declared matrix has 2 magnitudes x 3 entry modes x
3 precisions x 2 cache conditions = 36 rows. Version 1 counted 72 in error.
Every declared combination, iteration count, pair count and resource limit
is preserved. No benchmark or production edit preceded this correction.
