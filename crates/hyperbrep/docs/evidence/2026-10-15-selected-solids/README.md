# Independent selected solid reconstruction — 2026-10-15

This increment admits selected subdivisions of the tested cuboids and cylinders
through independent archive validation. It adds strict retained linear-form
queries, selected cap-source projection, planar boundary volume integration,
and cylinder rectangle proofs. All original topology records survive. There
are no archived solid proof flags or stored editing histories. The
[archive contract](../../SELECTED_ARCHIVE.md) states the admission boundary;
all 28 work-package gates remain open.

## Correctness and build coverage

The all-feature suite passes 243 core tests, 53 integration tests and four
doctests. The overlapping default configuration passes 236 core tests,
52 integration tests and four doctests. The 30 retained-point, selected-topology
and selected-solid integration tests also pass in release mode. Strict
all-target/all-feature Clippy, warning-denied rustdoc, WASM library compilation,
fuzz-bin Clippy, workspace/fuzz formatting and seven benchmark builds pass.
[commands.json](commands.json) records the qualification checks and the final
restored-source test/Clippy/format checks. Historical source checks need the
matching checkout; this bundle makes no claims about later revisions.

The solid regressions cover each cuboid edge separately, all twelve edges
together, shear, reflection, one/all cylinder axial edges, another split after
reload, exact volume, inside/outside/boundary classification, unchanged selected
vertex counts and byte-stable cold/warm replay. Splitting every cuboid edge
removes native cap-to-cap bridges, exercising the generic planar proof and
boundary volume integration. Three forged solid archives with missing shell
faces, wrong face orientation and wrong selected vertex parameters are rejected.
Earlier sheet/archive/adversarial tests remain in the suite.

Linear-form tests retain the same root through weighted rational curves and
non-unit NURBS knot charts. They exercise non-axis forms, nonzero plane offsets,
exact zero, both strict sides, a constant line projection, zero direction,
authored coordinates, strict uncertainty under an ambient approximate scope,
and successful retry after stronger scalar evidence.

Two deliberate faults fail at runtime: replacing every selected linear-form
result with equality, and halving the planar signed-volume contribution.
[controls.json](controls.json) records expected assertions and restored source
hashes; `controls/` contains patches and logs. The source was restored before
final checks. These controls demonstrate detection of those faults, not general
mutation coverage. `controls.py` deliberately edits source and should be run
only in a clean disposable checkout.

## Cost and representation evidence

Three alternating process pairs pinned to CPU 0 compare with `340d51bce`.
All 66 native receipts preserve fixture order, iteration count, unit and
checksum. [comparison.json](comparison.json) gives the median per-case ratio
1.0111128179 and largest ratio 1.0930232558 (903 to 987 ns for
`rational_bilinear_tensor_plane_complete_containment`). The executable grows
29,640 bytes to 24,760,536. Median native process peak RSS is 21,668 KiB for the
baseline and 21,424 KiB for the candidate. Resource records use Linux `wait4`
from a small C launcher, excluding the Python collector's buffers.

Three final feature processes each run six cohorts, 100 iterations per cohort.
[feature-cost.json](feature-cost.json) records replay/query medians of
868.034 µs for a native cuboid, 1.091859 ms for one selected edge, 2.705168 ms
for all twelve edges and 2.127920 ms for four selected cylinder axial edges.
Reload/split/reload/query takes 6.093168 ms; eight full reload/encode/query
cycles take 24.682930 ms. The timed bodies assert exact volume, classifications,
topology counts and, for repeated encoding, unchanged bytes. Source authoring
and initial root isolation are outside timing. These are fixed descriptive
samples, not significance tests, allocation counts or general growth bounds.

The four archive sizes are 33,834, 36,397, 47,138 and 46,999 bytes. Each selected
archive contains one root and one chart image; their pcurve source counts are
2, 12 and 8. The root is shared despite the increasing edge count.

The initial feature runner selected a test executable with the same target
name; the receipt checker rejected its missing benchmark rows. Its output is
`setup-picked-test-binary.log`. The corrected runner selects Cargo artifacts
by target kind, not modification time. `initial-feature/` retains the first
successful feature runs before the metadata label was corrected from `roots`
to separate parameter-record/root/image counts. Only the three final feature
processes contribute to the reported medians. This setup history is distinct
from the two deliberate implementation faults.

## Reproduction and limits

Use the matching source snapshot, Cargo/rustc 1.99 and the recorded offline
Cargo home/target directory. `qualification.py` and `recheck.py` contain exact
check commands. Build the kernel bench from `340d51bce` in a separate checkout
and preserve it as `/tmp/hyperbrep-selected-archive-kernel`; its expected hash
is in [executables.json](executables.json). Compile `measure.c` with
`cc -O2 -Wall -Wextra -Werror measure.c -o /tmp/hyperbrep-selected-archive-measure`.
Run `benchmark.py` for a clean native/feature comparison. `feature.py` records
the feature-only rerun that preserved the already measured native executable.
The scripts record commands and raw output under
`/tmp/hyperbrep-selected-solids-evidence`. `verify.py` checks source/artifact
hashes, local documentation links, command results, receipts, deliberate-fault
assertions and all 28 work-package records.

General selected-solid validation, selected corners without reconstructible
boundary images, void nesting, surface/contact/fiber carriers, selected Boolean
transfer, angular conics and bounded/WASM-safe decoding remain open. The
optional loft/sweep proofs still need scalar section profiles. The new
linear-form projection is query-local and does not claim prepared plane-query
amortization. No full Hypercurve suite, ASan, runtime fuzz/lexicase campaign,
external kernel comparison, WASM execution, full workspace or pre-push
qualification is claimed.
