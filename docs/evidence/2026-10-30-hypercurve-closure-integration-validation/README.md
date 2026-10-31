# Pre-push validation of the closure integration

Source: CSGRS `d5366c2988a652dbd09c193112211239eea3c142`, a clean detached
worktree. It integrates, on `origin/main` `8cda1ec3a4`, the nine external
review commits, the five polynomial chamfer and selected-circle commits after
`26916a3c95` (cherry-picked with conflicts resolved by hand), the zero-distance
chord, repeated-factor, empty-axis and native tensor witness leaves,
cooperative cancellation, the hole-dilation fix, the endpoint offset cusp fix,
coefficient growth limits, the PH and disappearance-chain witnesses,
`af0aca8290` (stack growth for HyperBRep selected-graph archive encode and
replay), `ee50162ab9` (circle certificates through exact SVG graph replay) and
`d308c8d2f2` (its `svg` feature gate), the island-in-hole witness, and the
evidence receipts for each.

## Campaign

`driver.py`, `matrix.json`, the audit shims and pinned channel files are the
previous campaign's unchanged driver (`target/hypercurve-closure-work`). The
matrix is derived from the workflow files, and no workflow or toolchain file
changed since `146cc0804f`. The only manifest change adds the `stacker`
dependency to HyperBRep, already present in the lock file through
`serde_stacker`. Toolchains: stable 1.99.1, MSRV 1.95.0, nightly-2026-10-29.
The directed phase started from an empty generated fuzz state, as a fresh CI
checkout does.

Every step of every phase exited 0 on `d5366c2988a652dbd09c193112211239eea3c142`:

| Phase | Steps passed | Step time (s) |
| --- | --- | --- |
| normal quick | 16 | 1,087 |
| normal lint | 196 | 475 |
| normal workflow | 101 | 26,266 |
| normal release | 2 | 1,636 |
| directed workflow | 13 | 10,315 |

Layout:

- `commands/`: one `validation-*/` directory per driver phase, with per-step
  commands, logs and exit codes (`steps.json`, `events.jsonl`, `summary.json`),
  and the `*-controller.log`, `*-phases.json` and `*-runner.log` files.
- `campaigns/`: the directed corpora and the ASan fuzz state, including
  `hyperspatial-asan/report.json` and one log per fuzz target.
- `driver/`: the campaign driver, step matrix, audit shims and pinned channel
  manifests.
- `superseded-*/`: earlier attempts, described below. Each keeps its controller
  logs, phase records, step summaries and the logs of its failing steps; logs of
  steps that passed there are not archived.
- `directed-timeout/`: fuzz timeout inputs, their libFuzzer logs and a
  standalone timing.

## Superseded and failed attempts

- `superseded-f5f8f0fb6f/`: a run of the integration head alone, stopped after
  the quick phase and part of lint when the cancellation commits were added.
- `superseded-08556d2d10/`: quick and lint passed; the directed phase failed in
  the hyperspatial fuzz smoke step. libFuzzer timed out (10 s limit) on
  `inverse_isometric` input `[11, 9, 74, 223, 97, 1]`
  (`directed-timeout/inverse_isometric.log`, artifact under
  `directed-timeout/inverse_isometric/`). The host was loaded by concurrent
  test runs. The same input takes 0.23 s in a release build and about 9.6 s in
  the ASan fuzz build; the directed rerun on `31b949ea79` on a quieter host
  passed. No hyperspatial source or dependency changed in the integration.
- `superseded-31b949ea79/`: quick, lint and directed passed; the workspace
  test job failed. `selected_coefficient_dependency_replay_export_and_drop_on_small_stack`
  (HyperBRep, from external review commit `c08ddcc9bf`) overflowed its
  256 KiB thread in the debug build, which the workflow uses. It fails the
  same way at `c08ddcc9bf` alone. A debugger backtrace showed 160 frames of
  mutually recursive `GraphEncoder::planar_point` and `curve_parameter`
  calls during `to_json`. `af0aca8290` runs those walks and their replay
  counterparts through `stacker::maybe_grow`; the test is unchanged, and
  HyperBRep's 678 debug tests pass.
- `superseded-af0aca8290/`: quick and lint passed. The directed phase failed
  when libFuzzer timed out at 14 s (10 s limit) on `jacobi_epsilon` input
  `[2, 9, 127, 39, 0, 0]` (`directed-timeout/jacobi_epsilon.log` and
  artifact). Alone, the ASan binary runs it in about 4.8 s with peak RSS 579 MB
  (`directed-timeout/jacobi_epsilon-standalone.txt`). During the campaign the
  host was also running the circle-certificate qualification suites, at load
  averages up to about 17. No Hyperspatial source or dependency changed. The
  normal workflow was stopped after 57 passing steps, when the circle
  certificate and island witness commits were added, so that one campaign
  covers the combined head.
- `superseded-11a583e0f7-stale-directed/`: the first directed run on
  `11a583e0f7` failed after 99 s in `fuzz-smoke.py` because `forward_local` recorded
  no mutation. The script reuses `target/hyperspatial-asan/<target>-corpus`,
  which is empty in a fresh CI checkout. Locally it had accumulated outputs
  from the earlier campaigns in the same worktree (1,274 files), and replaying
  them took 97 s of the 60 s budget. The worktree's generated fuzz state was
  moved aside, and the directed phase was rerun from an empty state as in CI.
- `superseded-11a583e0f7/`: quick passed; the first lint step
  (`extra-clippy-000`) failed because the new circle-certificate check is
  unused without the `svg` feature (`dead_code` under `-D warnings`); the
  increment's own Clippy runs used all features only. `d308c8d2f2` gates it on
  `svg`, and hypercurve Clippy then passed with default, no-default and all
  features and for the wasm32 library without default features. The directed
  rerun on `11a583e0f7` was stopped, since this head supersedes it.

Hosted configuration, upload and deployment actions are not executed locally.
This record establishes local pre-push qualification only; it does not claim
exact geometric operation closure.
