# Positive builder admission proofs

Decision: **kept**, against `79e807edf3c267712f5fe3ddc3757b2a7b00fe89`
on `brep`, incorporating upstream `99b88f707b04053de7f40a86d6d029e3c07460d9`.
This is a BREP-only runtime optimization. All 28 work packages remain open or
in progress. No new geometry family, API or archive migration is introduced.

`ArenaModelBuilder::solid` already constructed strict family certificates and
discarded them. It now retains the positive facts after successful admission.
`finish` reuses eligible proofs and still derives missing families. Partial
admission records cannot turn absence, `Unknown` or exhaustion into a negative
fact. Validated transfers retain their existing complete-available-set semantics.
Whole-solid and outer-shell scope remain distinct; cavities, secondary prism
proofs, loft eligibility, ownership, orientation, nesting, orphan rejection and
edit invalidation keep their existing checks. The [contract](contract.md) and
[review](review.md) give the family and mutation audit.

## Correctness and continuation

Four focused tests cover interleaved admission/transfer, deliberately discarded
positive facts, cavity measures and point locations, the cylinder's secondary
prism, failed nesting/ownership and recovery, later orphan/shared-pcurve input,
and edited-sphere invalidation. Independent expectations include volumes
`12*pi`, `496*pi/3`, `24`, and a point `1/10^12` outside the sphere. Exact archive
and replay comparisons are separate from these semantic checks. The baseline
passed the first version of these four lifetime tests before production edits;
the missing coverage did not represent a pre-existing wrong-answer finding.

After the final runtime/test edit, all 18 qualification commands passed:

| Configuration or boundary | Executed result |
| --- | --- |
| HyperBRep + IO, all features, debug | 516 passed, 0 failed, 0 ignored |
| HyperBRep + IO, all features, release | 516 passed, 0 failed, 0 ignored |
| HyperBRep + IO, minimal features, release | 508 passed, 0 failed, 0 ignored |
| All-target Clippy, both feature configurations | Passed with `-D warnings` |
| All-feature rustdoc | Passed with `-D warnings` |
| Six STEP examples | Passed |
| Optional OCCT readers | 11 example and 14 prism export checks passed |
| Fuzz target compilation | Passed; no runtime fuzz campaign |
| WASM source build and Wasmtime 38 runtime | 83 groups passed; zero imports |
| Formatting and tracked-source whitespace | Passed |

The counts overlap across configurations. The exact commands, features,
containment and logs are in [attempts.json](attempts.json) and
[qualification-summary.json](qualification-summary.json). The source identity
is `23951c19ac9a16b9796e5aca425e5cdb2da37128b9be521c42d9de97058a8f9f`.
Native suites, diagnostic commands, examples and measurement use this same
guarded map; analysis recipes added afterwards have separate recorded hashes.

All original continuation outcomes are preserved:

- The [81-slot frontier](continuation-frontier.json) has 74 native results,
  five undecided results and two resource exhaustions.
- The [15 preceding workflows](preceding-frontier.json) complete.
- The [24 prism diagnostics](prism-frontier.json) retain 18 native results and
  six unsupported controls.
- [22 preceding STEP artifacts](preserved-step-artifacts.json) and
  [32 prism artifacts](preserved-prism-artifacts.json) are byte-identical to the
  preceding qualified feature baseline. The latter comprise 18 archives and
  14 STEP files. No representation or receipt migration is admitted here.

Native diagnostic/replay counts and optional OCCT results do not substitute for
independent exact set proofs. The unchanged native/WASM acceptance suites retain
those expectations. The source-path WASM probe is not a published JavaScript
binding or installed-package consumer.

## Matched costs and retention

Baseline executables were frozen before production edits. The complete 17
corpora contain 167 matched cases, with three alternating pairs per corpus and
102 successful processes. Workloads, iteration counts, policies, semantic
assertions, output materialization and fresh/reused-document states are unchanged.
All exact receipts match, including deterministic output sizes/checksums. The
full compiled dependency feature graphs also match. Existing expected-output
preparation can warm scalar state; "fresh document" is not a whole-process
cache reset. CPU affinity is zero; each process has external 1,800-second
containment. No tests or compilation ran alongside this campaign.

The [full report](benchmark-summary.json) and [raw campaign](benchmark-v1/commands.json)
retain all timing, allocations, resources and executable identities. Four
circular-import cases show the clearest reduction in redundant proof work:

| Case | Baseline median | Candidate median | Ratio | Allocation calls saved | Requested bytes saved |
| --- | ---: | ---: | ---: | ---: | ---: |
| Closed, fresh document | 1.568 ms | 1.221 ms | 0.778750 | 375 | 27,044 |
| Closed, reused document | 1.503 ms | 1.115 ms | 0.742298 | 375 | 27,044 |
| Partial, fresh document | 6.360 ms | 4.604 ms | 0.723790 | 2,877 | 166,288 |
| Partial, reused document | 6.301 ms | 4.548 ms | 0.721784 | 2,877 | 166,288 |

All costs are per completed operation. The circle edit/replay/composition case
has ratio 0.889018. The median across all case ratios is 0.994890; this statistic
is not an aggregate workload speedup. These shared-host measurements support
this local retention decision, not a controlled-host or cross-library claim.

The only row above the 10% review marker is `arc_structural_facts_replay`,
5.85585 to 6.48705 ns (ratio 1.107790). Its frozen baseline and candidate
executables have the **same SHA-256**. That roughly 0.63 ns sample difference
cannot establish an effect of changed BREP code. It is retained as an adverse
observation, not deleted or counted as a timing-gate pass. Other slower rows
are retained too: analytic closed-imported export has ratio 1.049392, planar-hole
export 1.051813, and disjoint sphere-union remap/validate 1.050656. Allocator
requests for those two export cases are unchanged. No significance or causal
explanation is inferred for these small timing shifts.

Of 68 changed allocation rows, 11 increase requested bytes with no extra calls:
nine add eight bytes per operation and two two-body cases add sixteen. The
largest relative increase is below 0.008%. Median process peak-RSS deltas range
from -480 to +372 KiB, including +288 KiB for the circles corpus. These are
whole-process observations, not retained-heap bounds. Native harness size deltas
range from -424 to +17,920 bytes. The WASM probe grows 12,198 bytes to 18,994,295.
Harness/probe sizes do not establish distribution sizes.

Retain the positive-proof reuse because it removes repeated work on the same
validated exact contract, with substantial circular-import time/allocation
savings and the complete supported corpus preserved. Accept the disclosed
small allocation and size costs. No observed BREP row exceeds the review marker;
the unchanged executable's timer-scale adverse row prevents claiming an
unqualified all-row timing pass. [idea-ledger.json](idea-ledger.json) records the
decision and alternatives. Previous prism, sector, archive and arc regressions
remain open; ratios from different campaigns are not combined to claim recovery.

## Reproduction and limits

[manifest.json](manifest.json) indexes the contract, checks and decision.
[source-reconstruction.json](source-reconstruction.json) reconstructs every
captured source snapshot from the pinned baseline and the lossless
[overlay archive](source-overlays.tar.gz), including the initial test-only
state. Rust/Cargo 1.99, dependency locks, compiler flags, build configuration,
CPU, executable hashes and raw samples are retained. The upstream 1.98.1
records are distinct evidence. Build caches and target artifacts used `/tmp`;
repository sources used physical storage. No whole-history storage claim is made.

Run the recorded commands with their reconstructed inputs and required local
tools. `build_benchmarks.py baseline` must run before restoring candidate
runtime files; `qualify.py`, `analysis-recipes/continuation.py`, the candidate
build and `benchmark.py --name <new-directory>` then qualify the candidate.
The report recipes currently name the retained `benchmark-v1`; replay into a
new directory and preserve the old data. Optional OCCT and Wasmtime installations
and temporary probe paths require local setup. They are test oracles, never
production dependencies. [audit.json](audit.json) checks sources, artifacts,
ledger ownership, local links and the final formatting/whitespace results.
Raw Cargo logs retain their original whitespace; any findings are recorded
separately from the code/documentation check.

One setup copy attempted an absent optional historical directory; the driver
instead consumes the retained historical inputs directly with separate hash
binding. All recorded qualification and measurement commands succeeded. This
does not assert that every exploratory shell command succeeded.

There is one owned certificate record per admitted solid, released at builder
consumption/drop. Finalization currently clones proofs into the immutable model.
This is not a total-work, heap-byte or cancellation contract, and it does not
remove repeated prism-orientation work. A later proof-consumption experiment
needs its own baseline and measurement.

The inherited two scalar zero-factor failures, root no-curve rustdoc failure,
upstream pending native resource gates and historical nested-storage failures
remain open; this BREP-only increment does not rerun or waive them. There is no
new package/MSRV, actual C/Python/JS consumer, coverage, formal proof, runtime
fuzz/ASan/lexicase, full-workspace or pre-push admission. No push was performed.
The [next STEP exchange notes](next-exchange-research.md) are future research,
not an implemented cone/torus feature. Other crates remain upstream-owned unless
a reproduced dependency blocker makes a BREP repair necessary.
