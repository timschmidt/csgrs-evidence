# Pre-push validation of the outside-review fixes

Source: CSGRS `b2a8c1ac5ccc32fa495f0ad4ef46d8c967c55dd7`, checked out in two
clean detached worktrees: one for the normal phases and one for the directed
phase. It adds ten commits to `origin/main` `d463ef96a5`:

- the tensor scalar product coefficient bit limit;
- a shared quadratic sign scope in rational-form conversion;
- linear-cost nested chord displacements, through per-point bounds
  memoization (strict scopes only; budget exhaustion is never cached) and
  shared replay sources;
- per-direction regressions for uncertified probe contacts;
- a reflected, translated displacement that is replayed and then chamfered;
- the receipts for `2026-10-31-hypercurve-closure-retained-bezier-replay` and
  `2026-10-31-hypercurve-closure-chamfer-closing-gap`.

`main` was fast-forwarded to this revision after this campaign passed.

## Campaign

`driver.py`, `matrix.json`, the audit shims and the pinned channel files are
byte-identical to the driver in
`2026-10-30-hypercurve-closure-integration-validation`. The matrix is derived
from the workflow files. No workflow, toolchain, manifest or lock file changed
between `d463ef96a5` and this revision, so zizmor was not required, and the
hosted-action review from `146cc0804f` still applies.

Toolchains: stable 1.99.1, MSRV 1.95.0, nightly-2026-10-29 (rustc
`92ffebece`). The directed phase started from an empty generated fuzz state,
as a fresh CI checkout does: the oldest file under the directed `target/` was
written after the phase started.

Every step of every phase exited 0 on
`b2a8c1ac5ccc32fa495f0ad4ef46d8c967c55dd7`:

| Phase | Steps passed | Step time (s) |
| --- | --- | --- |
| normal quick | 16 | 915 |
| normal lint | 196 | 1,443 |
| normal workflow | 101 | 25,726 |
| normal release | 2 | 1,083 |
| directed workflow | 13 | 10,305 |

That is 328 command groups in all:

- 131 locally executable workflow groups;
- 196 strict Clippy groups (`-D warnings`);
- the CI security audit.

All 13 ASan fuzz campaigns returned 0, recorded no artifacts and report
`mutated: true` (`campaigns/hyperspatial-asan/report.json`).

There were no failed or superseded attempts on this revision.

## Layout

- `commands/`: one `validation-*/` directory per driver phase. Each holds the
  per-step commands, logs and exit codes (`steps.json`, `events.jsonl`,
  `summary.json`). Alongside them are the `*-controller.log`, `*-phases.json`
  and `*-runner.log` files.
- `campaigns/`: the directed corpora, observations and reports, and the ASan
  fuzz state, with one log per fuzz target.
- `driver/`: the campaign driver, step matrix, audit shims and pinned channel
  manifests.

This record covers local pre-push qualification only. It does not claim exact
geometric operation closure. Hosted configuration, upload and deployment
actions were not executed locally.
