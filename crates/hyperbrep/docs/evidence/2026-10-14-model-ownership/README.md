# Model-bound topology evidence

The public API binds references to immutable model revisions, checks builder
keys and edit relations before mutation, and retains the revisions described
by split details. Constructors, Booleans, examples, benchmarks and all three
fuzz targets use the canonical API. The private arena implementation is not
an exported compatibility path.

[manifest.json](manifest.json) records source and artifact hashes, scope and
limitations. [commands.json](commands.json) records actual successful command
exits. The 238 core tests, seven public ownership tests and two compile-fail
doctests pass. Strict Clippy, rustdoc, WASM compilation, fuzz-target Clippy,
formatting and the release build pass. This is not full workspace/pre-push,
WASM execution, fuzz-campaign or ASan qualification.

[controls.json](controls.json) describes four deliberate mutants that each
fail a focused assertion. Apply one patch at a time to this increment with
`git apply --unidiff-zero`, run its recorded command, and reverse that patch
before continuing. These mutants test builder ownership, published-key
ownership, transaction ownership and historical split binding. They are not
patches that compile against the old public API.

## Cost comparison

The baseline executable was built at `fba1d51fb`. The later `4cc822cfb` baseline
does not change the Rust benchmark or production source. Its executable hash
is also retained in the preceding strict-scope experiment. Both binaries run
on CPU 0 in alternating order: baseline/candidate, candidate/baseline,
baseline/candidate. All six successful runs preserve all 66 row names,
iteration counts, units, output checksums and source order. The migrated
harness retains its geometry fixtures, 190 `black_box` calls and 31
`compare_reals` calls; edited tensor caps are explicitly reselected from the
committed revision and checked for their rational Bézier family.

| Observation | Baseline | Candidate |
| --- | ---: | ---: |
| Median process peak RSS, KiB | 21,360 | 21,756 |
| Median process elapsed time, seconds | 26.0214 | 25.7280 |
| Release executable, bytes | 24,324,128 | 24,408,616 |

The median of the 66 per-case median timing ratios is **1.00679**. The largest
ratio in this sample is **1.03985**, for homothetic loft construction,
measurement and classification. These are descriptive samples, not confidence
intervals, a speedup claim or a regression ceiling. Full per-case samples and
raw receipts are in [comparison.json](comparison.json).

On this target, `Model`, `VertexRef`, `SolidRef` and `VertexKey` each occupy
16 bytes; `BodySet` occupies 40 bytes. Multi-trace results retain intermediate
arenas, so retained memory can grow with the sum of all step arenas. This
small corpus does not qualify large-history scaling. Allocation counts and
resource bounds remain open.

## Measurement and replay

[measure.c](measure.c) is a Linux evidence helper, not a production dependency.
It forks from a small process and reads the child's resource counters with
`wait4`. Linux reports `ru_maxrss` in KiB; Python's `os.wait4` exposes the same
per-child information. See the [Linux resource documentation](https://man7.org/linux/man-pages/man2/getrusage.2.html)
and [Python process documentation](https://docs.python.org/3/library/os.html#os.wait4).
[measurement.json](measurement.json) records its build and controls: a trivial
process, a touched 64 MiB allocation, and a nonzero child exit.

The [initial measurement](launcher-rss-floor/decision.json) is rejected: the
Python collector's earlier executable hashing left a high-water memory floor
that masked the benchmark. Its raw trials remain archived but are excluded
from the final comparison. The trivial-child
[control](launcher-rss-floor/control.json) reproduces that floor.

Build each recorded source revision with the command in `commands.json` and
preserve the executable before building the other revision. Compile `measure.c`
using the command in `measurement.json`, then replay the paired commands with
those executable paths. [qualification.py](qualification.py) preserves the
session runner; its absolute workspace/cache/output paths must be adjusted
for another host. Use a fresh output directory so recorded successes are not
reused. It requires the preserved baseline executable and compiled measurement
helper. The [receipt checker](../../../tools/benchmark_receipt.py) independently
checks each complete benchmark log against the source and baseline.

The change is kept for ownership correctness. Shared operation budgets,
composed mandatory provenance, durable feature selections and host handles
remain unfinished; no work package or stack property is declared complete.
