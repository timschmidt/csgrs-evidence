# Rational Horner migration qualification

Baseline source: `8f5c14723`. Retained source: `d70c037b8b5536cccadfb2f525b92f71dd3fa634` in timschmidt/csgrs.
Production migration was rejected for a measured size regression. All candidate
production changes were restored; the source commit retains differential tests,
an opt-in allocation/native-report probe, CI test triggers and audit records.
This record does not establish phase 3 or phase 7 completion.

## Reproduction and attribution

Candidate patches are against the baseline; `candidate-control.patch` is the
candidate used for the matched-path production size comparison. The retained
source has the final test-only candidates. External client manifests and lockfiles
pin dependencies. Build logs and JSON artifact lists record commands and output
paths. Temporary paths under `/mnt/development/` and `/tmp/interval-refactor/`
need remapping when replayed elsewhere. The baseline/control worktrees were
created at the baseline commit. Control baseline, candidate and restored builds
used the same worktree path and client manifest. See client-control metadata.

The early standalone clients initially resolved newer dependency versions;
initial-resolution locks are retained. Compared probes were rebuilt with root
lockfile dependency versions. Early diagnostic-feature and later production
Criterion runs are separate experiments, not interchangeable samples. Raw timing
samples and failed intermediate attempts are retained.

## Results

- 702 inputs and 4,212 fresh-process dispatch windows match frozen algorithms.
- Existing dispatch workload report and public native JSON/allocation report match.
- Matched production client summed function bytes: 2,069,474 baseline,
  2,073,622 rejected candidate, 2,069,474 restored.
- Executable file bytes: 3,960,744 baseline, 3,969,944 candidate,
  3,960,744 restored. Restored/baseline binary hashes differ; no byte-identical
  executable claim is made.
- Final library run passes 627 tests. Final focused tests, Clippy, fuzz-target
  check, formatting and zizmor pass. Relevant logs include final-counted-*,
  final-all-library-tests, final-msrv-tests and final-no-features.
- The baseline successive_operations executable was built, but no paired runtime
  comparison was performed once the candidate was rejected. No downstream
  performance gate is claimed passed.

Build trees and executable blobs are omitted; hashes of omitted non-target
executables are in excluded-build-artifacts.json. Source snapshots, build
metadata, lockfiles, raw samples, logs, reports and rejection patches remain.
