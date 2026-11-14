# Native rational curve interval ranges: reproduction

Use SOURCE.json for the isolated revision and candidate.patch for its complete
change from the recorded base. The original unreviewed patch and intermediate
source records remain separate. Preserve the main staged dynamics extraction
and existing Alumina Interface changes; neither is part of this candidate.

Qualification uses Rust 1.95.0, the checked-in Cargo.lock, offline dependency
resolution and two build workers. TOOLS.json records installed compiler versions
and the host. validate-qualified.py contains the exact commands, feature sets
and per-command logs. Full owner qualification follows the configured release,
all-feature suite with two libtest workers. Stable is an all-feature/all-target
compile check, not a second full test run. The downstream suite exercises the
existing Hyperbrep work-budget and rational-curve consumers with the new feature
and dispatch tracing enabled. The WASM command checks the feature's library.

The twelve focused tests include independent exact polynomial/rational
expectations, native algebraic subdivision/reversal/reconstruction, empty and
invalid domains, denominator overestimation, resource exhaustion/cancellation
and retry, fresh-process reconstruction, native Aabb consumption, zero-weight
homogeneous controls and a stationary constant source. Fixed native dispatch
counts run in a fresh child process under STRICT and APPROXIMATE_512 so unrelated
libtest scalar caches cannot change the fixture's initial state. Full snapshots
and certainty are asserted, not just selected counters. CAPABILITIES.json maps
the tests to demonstrated and still-open operations.

package-final/ contains the accepted-source package driver and artifacts. It
uses a fresh Cargo home, verifies eight archives, unpacks them and builds/runs/
strictly lints the actual example using only archived Hyper dependencies. The
metadata report verifies provenance. Initial package logs at the stage root
belong to the preceding revision before the rustdoc-only correction; they do
not replace the final package record. No packages are published.

run-costs.py runs the release benchmark after all qualification completes and
no compiler is active. It pins one allowed CPU, alternates mode order, discards
two warmup samples and retains 30 paired samples of 32 completed portfolios per
fixture. Each portfolio covers 16 adjacent cells and includes native basis and
expression/Jacobian preparation, complete C1 report materialization, exact Aabb
projection, existing native broad-phase comparison and report destruction.
Common source construction is excluded; scalar caches are warmed. Native basis
preparation does not populate the source cache. Timed modes are independent
preparation per cell and one preparation shared across the portfolio. Preflight
checks exact graph/arguments/values; timed iterations check report values.
Raw timings and a deterministic paired bootstrap are retained. No universal
speedup or host-noise control is claimed.

The separate allocation probe has already completed five identical observations
per row. All six rows preserve native arithmetic work; graph work and allocator
requests differ because preparation and proofs are shared. Tracked live bytes
return to zero after reports are dropped. These are allocator-requested bytes,
not RSS or a whole-heap bound. The allocation run was allowed alongside compiler
processes because it makes no latency claim. Initial lockfile/build failures and
all intermediate test/doc failures are retained.

The first candidate populated a native basis cache and thereby changed later
high-degree point dispatch. cache-probe-before* reproduces this. The corrected
adapter borrows an already-present basis or owns a conversion using the existing
Bernstein kernel. cache-probe-after* and the policy probes retain unchanged full
native traces. No original native evaluator body was edited. The only later
source correction escapes the interval notation in rustdoc.

Before integration, qualify.py checks the final source, completed qualification,
package provenance, fixed dispatch witness and same-workload cost/timing gates.
integrate.py performs an alternate-index preflight, exact reversal and a pending
patch content comparison before changing the main checkout. finalize.py then
runs main-checkout checks and verifies sibling preservation. These scripts are
prepared, not evidence that their actions have already succeeded. Consult the
actual command logs and final records.

When reproducing an archived stage, copy scripts and data to a fresh mutable
staging directory and adapt checkout/target paths. Never run a writer in a frozen
evidence record. Raw staging is not frozen until every writer has terminated.
The full 15-phase goal and unspecified geometry closure targets remain open.

Dependency correction: the original standalone allocation run selected newer
compatible registry versions through generate-lockfile. cost-supersession.json
records this; those counts are not the retention measurement. cost-final/ uses
a copy of the repository lockfile, resolved without resetting its dependency
versions. Its dependency-review.json must pass before its build/run results may
qualify. The archive-only consumer intentionally records its own consumer lock;
its verified packages are also built with the repository's locked resolution.

Final execution: qualify.exit, integrate.exit and finalize.exit are all zero.
STATUS.md and DESIGN.md describe the retained result and its limits. Main
checkout checks and related-repository preservation are recorded separately
from isolated qualification. The external archive/ledger scripts operate only
after these checks and must never write into this stage after it is frozen.
