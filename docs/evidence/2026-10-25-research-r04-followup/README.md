# R04 follow-up: sampling endpoints and strict triangulation continuation

Status: repaired change retained for exactness and completion after all 39 final
commands pass. No main-repository commit, push or release publication is claimed.
The authoritative final source is captured by admission-reconciliation/
final-retained-validation-1792936467949866459/source.patch and all new acceptance
sources by its untracked/ directory. Compiled Rust/manifest inventories before
and after agree. The current source uses HEAD
3cca6a894858c8b98497a3cfe81cff5e17e1a7f2 plus the recorded pending research changes.

## Contracts and reproductions

Owners: Hypercurve finite projection (P16/P18/P26/P29), Hyperlimit predicate
construction using Hyperreal's existing cancellation primitive (P7–P11),
Hypertri topology search (P10/P11/P17/P18), and CSGRS modeling composition
(P17/P18/P25). Source/root identity, caller policy, certainty and explicit
failure remain authoritative. No sampled geometry is an analytic fidelity
certificate. No internal total-work/heap-byte/cancellation bound is added.

The unchanged downstream_profiles target exposed two omissions in the original
R04 test selection. A clipped, scaled parabola loses 3.7193 volume units against
an independently derived 16*sqrt(2) area (allowed deficit below 0.014). A regular
40-gon circle wall with opposite round offsets fails strict lexicographic
ordering during triangulation. The clean-counterfactual record performs a
legacy -> mixed-profile-function -> legacy comparison in one dedicated checkout
and target, with R12 absent: 6 passes -> 4 passes/2 exact named failures ->
6 passes. Only the adapter function and its import change between these runs.
An initial mislabeled setup used a Hypercurve-only measurement patch and thus
still had the legacy adapter; its unexpected 6 passes and failed script assertion
are retained with SOURCE-SCOPE-CORRECTION.txt. They are not a reproduction of R04.

The repaired primary passes all six unchanged tests. A separate sampling
regression checks cold/replayed roots, reversed authoring, finite-export versus
sampling order and strict/approximate/strict sequences, with independent endpoint,
parabola and area expectations. The scalar/predicate regression covers repeated
symbolic endpoints, nonzero near-points, vertical triangle normals, exact off-plane
queries and strict/approximate/strict unresolved-zero controls.

The new unchanged symbolic-hole gate initially fails despite partial bridge
priorities and the scalar fixes. Extending bridge search alone also fails.
The retained candidate additionally keeps unresolved collinear vertices and
three local convexity proof states, then tries other ears before returning a
retained undecided error. Unknown never certifies an ear or bypasses a candidate's
containment. The final success assertion, positive triangle orientations, exact
area relation and boundary-incidence check pass across all hole authoring orders
and replays. Both the private and primary full Hypertri suites pass 213 tests.
The full predicate suite passes 376 and mesh suite 295, with seven existing mesh
ignores. The full final matrix below also passes after the rejected/inconclusive
R05, R11 and R12 production candidates are removed.

## Source isolation

BUILD-ISOLATION.txt records a shared Cargo target admitting exploratory dependency
objects into a primary validation. That run is excluded as source validation.
Primary now owns /tmp/csgrs-r04-primary-only-target exclusively. Every experimental
checkout owns a distinct target. A partially edited exploratory build is separately
excluded. All failed prototypes, compiler/lint failures and the ccache read-only
host failure remain recorded. Ccache was redirected to writable task directories;
no test, policy, fixture or warning requirement was relaxed.

proof-search/ retains the bridge-only failures' successors, the initial passing
larger state representation, the compact state version, full suite and Clippy
logs, and the promotion digest. The only later source difference is a comment
clarifying that unresolved means no convexity certificate; combined validation
captures that final source. Earlier broad source-projection and direct coordinate
identity shortcuts were removed; the final primitive reuse is at the predicate
owner, and only the sampling-specific parameter path is refined.

## Triangulation cost comparison

tri-probe/locked/ is authoritative for the incremental proof-search comparison.
Baseline has the sampler/scalar fixes and partial bridge priorities; candidate
adds deferred bridge/collinearity/ear proof search. Both use separate targets,
identical remapped paths and external name/version/checksum sets matching the
workspace lock. The initial parent-directory probe upgraded cached dependencies;
its 1,280 successful exploratory samples are retained but not used as workspace
cost evidence. No other compile or heavy validation ran during final paired timing.

The final 30 alternating pairs, 32 cases and 20 samples per process produce
38,400 Certified results. Complete triangle rows and all non-timing sample fields
match: bytes/calls, peak/result live growth, post-drop retention, checksum and size.
Controls include square, concavity, a comb, one/two holes, 2^-80 height, e/pi
translation and 40/20-vertex circular rings, both traversal directions and policies.
The independent validation demands positive exact orientation, exact area equality
to source ring areas and the full boundary/interior edge incidence. Validation
and fixture creation are outside the earcut timer; outputs are dropped per sample.

This is a completion change, with no speedup claim. Unfavorable cold medians:
forward approximate square 17.924 -> 21.029 microseconds (paired ratio 1.1318,
95% interval [1.0359,1.2466]); forward strict tiny rectangle 17.139 -> 20.294
microseconds (1.1407 [1.0273,1.2549]); forward approximate symbolic translation
320.943 -> 329.887 microseconds (1.0459 [1.0120,1.0828]). Warm adverse point
estimates and all raw samples remain available; no warm adverse interval excludes
1. Native probe text is 1,738,361 -> 1,738,809 bytes; file size is
3,061,680 -> 3,062,328. These are probe costs, not deployed package attribution.
The 120-second process limit is external containment, not an internal resource
contract. The full paired journal confirms frozen source patches stayed unchanged.

## Final validation and retention

The first frozen combined run passes all 39 commands, but includes the R05/R11
performance candidates whose admission is subsequently withdrawn. The final
retained-stack driver repeats all 39 commands after removing R05/R11 and R12
production code; they all pass, and its compiled-source inventories agree.
Full suites: Hyperlimit 376, Hypertri 213, Hypermesh 295 (7 pre-existing ignored),
Hypercurve 2,600 (35 pre-existing ignored), modeling 676 (7 ignored), Hyperbrep
669 and Hypercircuit 354. The focused 3 determinant, 1 symbolic-hole and 6 original
profile gates also pass. Successive operations pass all 20 including ignored
continuation fixtures; FFI passes 13. The remaining commands cover all-target/
all-feature Clippy for the owners and affected consumers, warning-free docs,
real C/C++/Python consumers in three binding families, generated JS/TS/WASM
checks, formatting, repository budget and diff checks. No pre-existing ignored
test was removed or weakened. This is the affected local/downstream matrix,
not every workflow/feature configuration required for a future push.

admission-reconciliation/ retains the handoff-rule audit, reversal patches,
unmodified withdrawn candidate tests and the complete final validation record.
R12 independent behavioral oracles remain in the primary tree. R14 and R23
prototypes were private and do not enter these source inventories.
Historical hard gates for R02/R03 and original fidelity/resource limits remain open.
