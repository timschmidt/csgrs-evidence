# Pre-push validation of the chamfered ellipse closing identity

Source: CSGRS `57515fe50632ead0c662eca058bfee7775b5f9d5`, checked out in two
clean detached worktrees: one for the normal phases and one for the directed
phase. It adds three commits to `origin/main` `1e7847896b`, whose campaign is
recorded in `2026-11-02-hypercurve-closure-arithmetic-scope-validation`:

- `d92fc4be9b`: the receipt for that record. It changes only
  `docs/evidence-archive.tsv`, `docs/evidence-archive.md` and
  `crates/hypercurve/FUTURE_WORK.md`.
- `1de246173f`: zero-displacement endpoint identity in the chord pair kernel,
  plus tangent-junction sharing of algebraic and cusp-semicircle offset band
  endpoints. The change is recorded in
  `2026-11-02-hypercurve-closure-chamfer-closing-identity`.
- `57515fe506`: the receipt for that record.

**The campaign did not pass completely.** The directed ASan fuzz-smoke step
failed with two `jacobi_epsilon` per-input timeouts, as described below. The
repository owner authorized pushing `57515fe506` to `main` without that step
passing, because the load on this host would persist. This record documents
the exception. It does not present the run as a full pass.

## Campaign

`driver.py`, `matrix.json`, the audit shims and the pinned channel files are
byte-identical to the driver in the previous record. No workflow, toolchain,
manifest or lock file changed after `d463ef96a5`, so zizmor was not required.
Toolchains: stable 1.99.1, MSRV 1.95.0, nightly-2026-10-29. The directed phase
started from an empty generated fuzz state.

| Phase | Steps | Result | Step time (s) |
| --- | --- | --- | --- |
| normal quick | 16 | all exit 0 | 901 |
| normal lint | 196 | all exit 0 | 560 |
| normal workflow | 101 | all exit 0 | 27,944 |
| normal release | 2 | all exit 0 | 1,600 |
| directed workflow | 13 | 12 exit 0, `hyperspatial-directed-0-14` exits 1 | 8,916 |

The normal phases cover:
- 131 locally executable workflow groups, apart from the 13 directed groups;
- 196 strict Clippy groups (`-D warnings`);
- the CI security audit.

All 12 directed corpus generation steps passed.

## Directed fuzz-smoke failure

`hyperspatial-directed-0-14` runs `crates/hyperspatial/scripts/fuzz-smoke.py`.
It runs 13 ASan libFuzzer campaigns with a 10 s per-input timeout. Results
(`campaigns/hyperspatial-asan/report.json`):

- The first ten campaigns returned 0:
  - `forward_local`, `normal_offset`, `mercator`;
  - `inverse_isometric`, which recorded one slow-unit artifact, `020900000003`;
  - `ellipsoidal_mercator`, `transverse_mercator`, `elliptic`;
  - `inverse_legendre`, `jacobi`, `complex_jacobi`.
- `jacobi_epsilon` returned 1. While replaying the seed corpus, input
  `[21, 2, 173, 155, 1, 1]` (`1502ad9b0101`) exceeded 10 s. Input
  `[8, 127, 94, 2, 1, 3]` (`087f5e020103`) was recorded as a slow unit. Both
  are under `campaigns/fuzz-artifacts/jacobi_epsilon/`, and the log is
  `campaigns/hyperspatial-asan/jacobi_epsilon.log`.
- `complex_atanh` and `parameter_encodings` did not run, because the script
  stops at the first failure.

### Cause

The evidence points to host load, not to the change:
- An unrelated postmarketOS kernel build (`pmbootstrap`, `make ARCH=arm LLVM=1`)
  started about four minutes before the timeout. When the failure was
  inspected, the host load average was 26 on 16 CPUs. The driver does not
  isolate CPU time.
- The fuzz target's dependency closure is unchanged from `1e7847896b`. It
  consists of `hyperspatial`, `hyperreal`, `hyperlattice`, `hyperlimit` and the
  fuzz crate. `git diff --stat 1e7847896b 57515fe506` touches only
  `crates/hypercurve/` and `docs/`.
- Both inputs were also in the `jacobi_epsilon` seed corpus of the
  `1e7847896b` campaign. There, `jacobi_epsilon` returned 0 with no artifacts.

Still under the same load, the same ASan binary was run once on each input:
- `1502ad9b0101` took 10,409 ms (9.72 s user CPU);
- `087f5e020103` took 7,416 ms (6.54 s user CPU).

This target therefore has little headroom against its 10 s limit. A known
pre-existing near-limit seed is `[2, 9, 127, 39, 0, 0]`, at about 4.8 s on an
idle host and about 14 s under load. The directed phase was not rerun on a
quiet host before the push.

## Layout

- `commands/`: one `validation-*/` directory per driver phase, with per-step
  commands, logs and exit codes (`steps.json`, `events.jsonl`,
  `summary.json`), and the `*-controller.log`, `*-phases.json` and
  `*-runner.log` files. The directed phase is
  `validation-workflow-1793653761058439260`.
- `campaigns/`: the directed corpora, observations and reports, and the ASan
  fuzz state with one log per fuzz target. `fuzz-artifacts/` holds the libFuzzer
  artifacts written by the failed step.
- `driver/`: the campaign driver, step matrix, audit shims and pinned channel
  manifests.

This record establishes partial local pre-push qualification only. It does not
claim exact geometric operation closure. Hosted configuration, upload and
deployment actions were not executed locally.
