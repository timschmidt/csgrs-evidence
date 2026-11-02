# Pre-push validation of the arithmetic sign scope

Source: CSGRS `1e7847896b21eabd61ee6e63a297d450fbca5897`, checked out in two
clean detached worktrees, one for the normal phases and one for the directed
phase. It adds four commits to `b2a8c1ac5c`, whose campaign is recorded in
`2026-11-01-hypercurve-closure-review-validation`:

- `61bb34b610`: the receipt for that record. It changes only
  `docs/evidence-archive.tsv`, `docs/evidence-archive.md` and
  `crates/hypercurve/FUTURE_WORK.md`, and it was pushed to `main` without its
  own full campaign. This campaign covers it.
- `cd594e61df`: cross-source rational-form arithmetic pulls each operand back
  in one sign scope, shared by both operands, instead of opening a fresh scope
  per rational image. At image depths 0, 4, 8 and 16, add, subtract and
  multiply each took 1, 11, 37 and 137 successful sign dispatches before, and
  take 1, 5, 9 and 17 now.
- `155f8a1d2d`: an off-diagonal reflection witness, `T(x, y) = (2y + 3, 2x + 1)`,
  applied to explicit-origin displacements. It chamfers the image, compares the
  result with the image of the original chamfer, and repeats the checks after
  fresh-process SVG replay.
- `1e7847896b`: the ledger entry for those results.

## Campaign

`driver.py`, `matrix.json`, the audit shims and the pinned channel files are
byte-identical to the driver in the previous record. No workflow, toolchain,
manifest or lock file changed after `d463ef96a5`, so zizmor was not required.
Toolchains: stable 1.99.1, MSRV 1.95.0, nightly-2026-10-29. The directed phase
started from an empty generated fuzz state, as a fresh CI checkout does: the
oldest file under the directed `target/` was written two seconds after the
phase started.

Every step of every phase exited 0 on
`1e7847896b21eabd61ee6e63a297d450fbca5897`:

| Phase | Steps passed | Step time (s) |
| --- | --- | --- |
| normal quick | 16 | 787 |
| normal lint | 196 | 531 |
| normal workflow | 101 | 32,944 |
| normal release | 2 | 1,069 |
| directed workflow | 13 | 10,321 |

That is 328 command groups:
- 131 locally executable workflow groups;
- 196 strict Clippy groups;
- the CI security audit.

All 13 ASan fuzz campaigns returned 0, recorded no artifacts and report
`mutated: true`.

## Superseded attempt

`superseded-61bb34b610/` is a campaign on `61bb34b610`. It was stopped
deliberately, not because anything failed, once the arithmetic fix was
started, because this head contains it. Seven quick steps had passed. The run
was stopped during `hyperreal-verus-0-3`.

## Layout

- `commands/`: one `validation-*/` directory per driver phase, with per-step
  commands, logs and exit codes (`steps.json`, `events.jsonl`,
  `summary.json`), and the `*-controller.log`, `*-phases.json` and
  `*-runner.log` files.
- `campaigns/`: the directed corpora, observations and reports, and the ASan
  fuzz state with one log per fuzz target.
- `driver/`: the campaign driver, step matrix, audit shims and pinned channel
  manifests.

This record establishes local pre-push qualification only. It does not claim
exact geometric operation closure. Hosted configuration, upload and deployment
actions were not executed locally.
