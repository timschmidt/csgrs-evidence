# Exact faceted STEP import qualification — 2026-10-15

This is partial WP14a progress on baseline `cd1cc8d42c35c7204ba5331118ecfaaee4096741`.
All 28 work-package gates remain open. The
[mapping contract](../../../../hyperbrep-io/docs/STEP_MAPPING.md) defines exactly
what this increment admits; the [performance ledger](../../../../hyperbrep-io/PERFORMANCE.md)
explains the costs and their limits. The core scalar, lattice, predicate, solver,
curve and BREP sources are unchanged. The Cargo lock change adds only the two
workspace dependencies to `hyperbrep-io`; no locked package version changes.

## Evidence and scope

- [Final commands](commands.json): 348 native test results (317 existing HyperBRep
  plus 29 IO integration tests and two IO doctests); 31 IO release results;
  strict all-target/all-feature Clippy for both crates, warning-denied IO rustdoc,
  a release WASM probe build/execution, workspace formatting and diff checks.
- [Native tests](../../../../hyperbrep-io/tests/step.rs) cover complete selected
  bodies, exact SI and conversion values, holes, oblique planes, source aliases,
  reversed bounds/face senses, defaults/projections, native archive replay and
  transforms, near-equal geometry without healing, and coordinates above 2^53.
  [Admission tests](../../../../hyperbrep-io/tests/step_admission.rs) retain
  malformed topology/header/text and missing-reference diagnostics.
  [Unit tests](../../../../hyperbrep-io/tests/step_units.rs) exercise all twenty SI
  prefixes, category/dimension errors, cycles, visit/scale limits and 20,000
  forward conversions on a 64 KiB native stack.
- [Wasmtime execution](wasm-runtime.json): nine assertion groups, no host imports,
  all four fixture solids and exact native archive replay, hole classification,
  deep units, resource/cycle failure and physical-control text decoding. This is
  executed WASM qualification for the probe, not only compilation.
- [Independent OCCT reader](occt-read.json): the four
  [original fixture recipes](../../../../hyperbrep-io/tests/fixtures/README.md)
  produce valid shapes with matching unique vertex/edge/face/body counts and
  floating-point volumes. Native exact volumes come from elementary dimensions,
  independently of the external floating-point results. This does not prove AP
  conformance or qualify geometry exported by HyperBRep.
- [Five restored faults](controls/results.json): wrong SI scale, ignored bound
  reversal, a discarded second body, discarded inner bounds and bypassed scale
  admission each fail a targeted runtime regression. Every source is restored
  before final checks. A subsequent
  [standards regression](text-regression-before-fix.json) fails on the retained
  initial decoder and passes after physical controls inside string directives
  and N/F print directives are handled. This extends completeness; no numeric
  approximation is introduced.
- [Seven absolute cost cases](faceted-costs.json) retain three process receipts,
  native output sizes/fingerprints, allocator requests and process RSS. There is
  no prior equivalent importer for a speedup comparison. The separate
  [syntax comparison](syntax-costs.json) retains four receipts across three
  alternating baseline/current pairs. Ratios use elapsed totals before integer
  per-iteration truncation; the largest final ratio is 1.044287.

The source/ABI ownership and semantic checks are stronger than a successful file
parse. They are still a small selected-domain corpus. Entire-document/product
traversal, advanced BREP and spline exchange, native STEP geometry writing,
arbitrary planar shells, aggregate coefficient/work/heap limits and full
independent exporter coverage are unfinished. No runtime fuzz, ASan, lexicase,
full workspace/pre-push or release qualification is claimed. The inherited
archive-admission timing gate remains open.

## Recorded corrections and rejected experiments

The initial rustdoc auto-trait walk exceeded the default compiler recursion limit
through retained native carrier types; [the diagnostic](rustdoc-before-recursion-limit.log)
is retained. IO now sets a compile-time recursion limit of 256; this is unrelated
to runtime stack admission. A moved intra-doc link was corrected before final
warning-denied documentation passed.

The pinned optional OCCT distribution's faceted writer terminates with signal 11
on an independently constructed 2 × 3 × 4 box. Its general AsIs writer succeeds
but produces advanced-BREP output outside this importer. The
[writer experiment](occt-writer-experiment.json) records both outcomes. Neither
output is used to claim faceted-import success. The independent reader accepts
all four original faceted fixtures. No external kernel is a production dependency.

[Earlier import costs and decoder source](before-text-review/faceted-costs.json)
remain separate from final qualification. They do not establish a matched speedup
for the text-decoding correction. There is no copied external CAD model or schema.

## Reproduction and integrity

Scripts currently target the recorded Linux x86_64 checkout path and Python 3.13.
Cargo uses `/tmp/hyperbrep-review-cargo` and `/tmp/hyperbrep-review-target`; locked
dependencies must first be available. The
[pinned runtime downloads](oracle-downloads.json) identify official PyPI wheels,
their published SHA-256 values, optional dependencies and license-file locations.
`fetch_oracles.py` downloads/verifies/extracts these validation-only wheels under
`/tmp`; it is the only network-dependent reproduction step here.

From the repository root, run scripts in this directory in this order:

1. `fetch_oracles.py`, `occt_read.py` and optionally `occt_writer_probe.py` for
   external validation; retain the reader's JSON stdout as `occt-read.json`.
2. `controls.py` for the five isolated implementation faults, followed by
   `qualify.py` for restored native/release/Clippy/docs/WASM/fmt checks.
3. `syntax_comparison.py`, then `benchmark.py`, after other builds/tests finish.
   Bench input/expected-output construction and independent OCCT checks are
   outside the measured loops. Complete logs include allocator instrumentation.
4. `collect.py` writes a new snapshot manifest. `verify.py` checks source/artifact
   hashes, commands, test totals, independent fixture hashes, faults, receipt
   coverage and ratios. It also rejects deleted, duplicated and changed-checksum
   benchmark records. This verifier is snapshot-bound; later source changes
   require new qualification, not an update of hashes alone.

The [manifest](manifest.json) binds this evidence. Compiler artifact JSON records
the exact executable paths; executable metadata retains byte sizes and hashes.
Wheels and compiled executables are not committed.
