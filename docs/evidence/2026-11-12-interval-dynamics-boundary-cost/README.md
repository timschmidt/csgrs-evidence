# Dynamics boundary cost experiments — both rejected

The preceding goal turn made progress: it implemented exact metric/jerk
extraction and measured failing retention gates. This investigation changes no
primary production source. Its control is CSGRS ledger HEAD
99b810a567ad89162b5ffa23e074948311fadb3c plus control.patch, the exact staged
candidate previously archived at evidence commit
ab370e01cac14702b7e6c4a514361a6a36da071a,
`docs/evidence/2026-11-12-interval-dynamics-jerk-candidate`.
ADMISSION.md names the owner, properties, domain and failing cost witnesses.

## Controlled build

A separate detached checkout at /mnt/development/csgrs-dynamics-cost builds with
Rust 1.95.0, unchanged release profile, dependency lock, target, and owning
path_predicates benchmark. Its executable is byte-identical to the primary
candidate: 13,379,488 bytes, SHA-256
d331496d666548da7e9c90d790d2bc1ff683cd75a8c8c20460a76536c43f3c36.
The original pre-extraction baseline remains 13,308,824 bytes. No build flags,
compiler policy, scalar/parser algorithms, fixtures or predicates change.

## Idea ledger

| Experiment | Result | Decision |
| --- | --- | --- |
| Add ordinary inline availability to seven moved jerk helpers and the shared input-check functions | 13,383,312-byte owner binary, +3,824 versus the already failing control; text 10,722,406 | Rejected as a standalone cost change. No claim of runtime or consumer qualification. |
| Keep generic borrowed-slice adapters while compiling the scheduler body once behind a private MetricRoute protocol | 13,392,472-byte owner binary, +12,984 versus control; text 10,729,246 | Rejected as a standalone cost change despite 453 passing owner tests. |

Each experiment has an exact patch against the staged control, build log,
executable digest/section sizes and full symbol listing. Original owning
benchmark source is unchanged. The second experiment preserves lazy metric
queries and all original report/dispatch comparisons under both policies,
including the earlier axis differential and independent analytic cases.
No consumer, timing, allocation, ASan or complete CI qualification is claimed
for a rejected variant. The binary gate alone rejects both; this is not a
claim that they were proven incorrect or slower in every workload.

The narrow selected dynamics symbol totals decrease (20,704 control; 18,702
inline; 20,581 monomorphic), while full executables grow. This demonstrates why
a favorable selected-symbol sum is not the repository's binary/monomorphized
acceptance gate. It does not establish a fully audited global monomorphized
size comparison.

## Attribution correction

The added 10,107-byte Real::exact_rational_signed_product_sum instance in the
control lives in Hyperpath CGU 04. Static call tracing reaches unchanged tangent,
arrangement, clearance, arc and Bézier routines, not only dynamics callers.
However a larger Rational::signed_product_sum instance disappears. Across the
three changed signed-product function families, named text decreases
124,739 -> 123,102 bytes (-1,637). The new Real symbol is therefore not 10,107
bytes of net signed-product growth. Full symbol deltas from the preceding record
must be considered together. The exact causal explanation of the total owner
binary/timing regression remains unresolved; symbol counts alone do not prove
extra arithmetic work or duplicated semantic operations.

## Final state and next work

Neither patch is applied to the primary repositories. The isolated checkout is
restored to its staged control, then rebuilt and checked for the same complete
binary digest. Its saved experiment binaries live outside this archive in
/tmp/interval-refactor/dynamics-cost-binaries; hashes and reconstruction sources
are retained here, not large executables. The isolated debug artifacts were
built for the rejected monomorphic experiment; do not treat their source state
as the restored control without rebuilding.

NEXT-BOUNDARY.md records reviewed constraints for completing the intended feed/
join boundary. Preserve axis-only legacy rejection, lazy metric/classifier order,
full geometry-owned join receipts, old aliases and exact application evidence.
Qualify that complete boundary before accepting any extraction or a different
cost design. The failed narrow route-adapter experiment is not accepted merely
because a broader future design may need a route abstraction. All earlier
adverse evidence and all fifteen-phase obligations remain. No push ran.
