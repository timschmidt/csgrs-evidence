# Selected archive replay qualification — 2026-10-15

Format 9 retains selected roots, flattened projective charts, spatial curve
images and authored pcurve restrictions. Import reconstructs their premises
before publishing topology. This is partial WP01/WP02/WP13/WP21 progress;
all 28 work-package gates remain open. See the
[archive contract](../../SELECTED_ARCHIVE.md) for the schema and exact limits.

## Correctness and build coverage

The final restored-source checks pass 243 all-feature core tests, 47 integration
tests and four doctests. The overlapping default configuration passes 236 core,
46 integration and four doctests. Five Hypercurve public chart/restriction tests
pass. All-target/all-feature HyperBRep Clippy and focused Hypercurve-test Clippy
pass with warnings denied. Warning-denied rustdoc, WASM library compilation,
fuzz-bin Clippy, workspace/fuzz formatting, six benchmark builds and the 12
selected-topology release tests pass. [commands.json](commands.json) records
commands, exit codes and wall times, including the earlier benchmark-borrow
compile failure and subsequent successful checks. `initial-checks/` contains
checks before test extraction and the injectivity/native-path review; those
logs are not the final qualification. Raw logs and unified patches retain
their original whitespace; staged source whitespace checks exclude `.log`
and `.patch` evidence files.

Selected planar sheets preserve their exact area, topology counts, selected
points and pcurve mappings across reload and another split. A detached spatial
point source is retained. Reflected rational planar boundaries and rational/
non-unit NURBS extrusion profile sheets replay. A separate unit test replays a
non-affine projective selector and verifies source interning and stable bytes.
The adversarial archive test rejects 14 mutations: invalid/multiple singleton
roots, zero polynomials, missing/cyclic references, poles, wrong point selectors,
wrong pcurve traversal/ranges/sources, wrong source geometry, nested sources,
and wrong affine maps with forged certificate flags. Trailing JSON and old
format envelopes are rejected separately.

Three deliberate implementation faults are rejected by focused runtime
assertions: accepting a nonsingleton root certificate, ignoring archive
traversal, and hiding a source without injectivity evidence. Their patches and
logs are under `controls/`; [controls.json](controls.json) records expected
assertions and restored source hashes. Every source was restored before the
final checks. These controls establish detection of these faults, not general
mutation coverage. The control runner deliberately edits source and should
only be run in a clean disposable checkout.

## Performance, representation size and memory

Three alternating process pairs, pinned to CPU 0, compare against `3426a3a43`.
All 66 native result receipts (case, iteration count, unit and checksum) agree.
The median of per-case median timing ratios is 1.0016276195; the largest is
1.0362940889 (`disjoint_cuboid_intersection_graph`). See
[comparison.json](comparison.json) and the six raw process logs. The candidate
executable is 24,730,896 bytes, 205,040 bytes larger. Median process peak RSS
changes from 21,636 to 22,020 KiB. Each process's resource JSON comes from the
small C `wait4` launcher, excluding the Python collector's retained buffers.

Three more processes run seven archive cohorts with exact assertions and 100
iterations per case. [feature-cost.json](feature-cost.json) records medians.
Native, selected and selected-plus-16-cut sheets encode to 8,163, 9,681 and
26,923 bytes. Both selected archives retain one root and one pcurve source.
Their replay/area medians are 218.026 and 587.420 microseconds; selected
reload/split/area takes 258.493 microseconds. These are fixed composition costs,
not general asymptotic bounds or allocation counts. The version change
intentionally changes archive bytes; version 9's own round trips are checked
for byte stability. No speedup or statistical significance is claimed.

## Reproduction and limits

Use the matching repository snapshot, Cargo/rustc 1.99, the recorded offline
Cargo home and target directory. `qualification.py` and `recheck.py` contain
the exact commands; the latter loads the former from
`/tmp/qualify_selected_archive.py`. Copy the scripts there if reproducing these
local paths. Build the baseline kernel bench from `3426a3a43` in a separate
checkout and preserve its executable as
`/tmp/hyperbrep-selected-topology-final-kernel`. Its expected checksum and both
candidate checksums are in [executables.json](executables.json). Build the
resource launcher with `cc -O2 -Wall -Wextra -Werror measure.c -o
/tmp/hyperbrep-selected-archive-measure`, then use `benchmark.py`. The earlier
launcher setup attempts used an invalid Python access flag and an unavailable
`/usr/bin/time`; neither started a measured process. The final launcher and all
nine measured processes succeeded.

`verify.py` verifies this bundle and the recorded source snapshot, documentation
links and ledger package count. Historical source checks require the matching
checkout; the verifier is not a claim that later revisions have these hashes.

Selected solid graphs can be encoded, but independent cuboid revalidation still
returns `UnrepresentablePoint`; no successful selected-solid round trip is
claimed. General selected surface/contact/fiber support, Boolean transfer,
non-authored pcurve fragments, global decoding/allocation limits, iterative
WASM-safe parsing and semantic provenance remain open. This increment does not
claim a full Hypercurve suite, ASan, runtime fuzz/lexicase campaign, external
kernel comparison, WASM execution, full workspace or pre-push qualification.
