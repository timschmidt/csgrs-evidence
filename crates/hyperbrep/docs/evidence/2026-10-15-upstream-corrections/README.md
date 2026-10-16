# Upstream corrections and BREP ownership

This integration advances `brep` from
`561eae2376502f67843b4757f333d911d35ecd00` to include upstream
`362e157c1dfb39701749ed2c154b0edff717fec0`, preserving both histories.
The common upstream ancestor is `7cf9d82acee6f152047eb37e5ff2e6dcece51a0d`.
[integration.json](integration.json) and
[upstream-commits.txt](upstream-commits.txt) record the seven new commits.

The project owner directs further implementation to HyperBRep and its IO
crate. Surrounding crates are developed concurrently elsewhere. Their
contracts still govern BREP, but unrelated repairs remain upstream work.
The [plan](../../DEVELOPMENT_PLAN.md#implementation-scope-and-concurrent-development)
records that boundary, the exception for a demonstrated BREP regression, and
the procedure for occasional upstream checks and future merges.

## Preserved local work and conflict resolution

The unfinished scalar investigation is preserved in local stash
`96c308f87af6f3491828ada3e9b8e92cec858cf1`, including its source patches,
untracked factor implementation, failed full-scale cases, conditional algebra
experiments, source-bound test attempts and an unexecuted test draft. It is
not runtime-admitted and is not applied over the newer upstream work. Its
last prototype passed focused quotient tests but had not been checked on the
complete root workflow or qualified downstream. The older closed-edge backup
`b00958cb640fedbe041c46581327df3e64deacf5` remains intact. These local stashes
are preservation references, not portable release artifacts.

Only two files conflicted: Hypersolve's residual replay and representation
tests. Both now match the complete upstream versions. Upstream preserves the
original e/pi matrix and all 22 representation recipes, requires their exact
success, and separately exercises genuinely unresolved terminal behavior,
including strict reuse after approximate evaluation. This supersedes the
earlier BREP integration's local corrections without adding a competing solver
implementation. [resolution-checks.json](resolution-checks.json) records hashes.

Root agent rules, properties and admission protocol match upstream exactly.
The existing BREP workspace lockfile is retained; upstream did not change its
lockfile in these seven commits. All 98 BREP/IO implementation and manifest
files match the pre-merge BREP revision. BREP depends directly on native
Hypercurve and does not call the changed root Bezier/B-spline convenience APIs,
so this integration needs no BREP source or compatibility layer changes.

## Reviewed dependency changes

The review covers the new bounded quotient reduction and shared-factor
product-sum proof, their normal-form contract, the two conflicting solver test
files, typed mesh-adapter errors, and root exact path construction changes.
The source inventory in [upstream-paths.txt](upstream-paths.txt) is not a claim
to have read every inherited evidence file.

Upstream discards unused denominators only after proving zero and admitting
both operands, reduces polynomial quotients using strict divisor evidence,
and can certify a factored sum from a proved-zero residual. These optional
proofs use the original recognition allowance; they do not establish a total
modeling-work or heap-byte bound. The
[upstream scope and limitations](../../../../../docs/evidence/2026-10-15-factored-product-proofs/progress-v1.md)
remain attached to their own source snapshots. BREP consumes the shared proofs
without copying their formulas or treating an undecided result as success.

The upstream mesh adapters retain native error kinds. Root Bezier and spline
path APIs return typed failures and preserve policy/certainty; root Bezier
region construction no longer substitutes empty geometry for failure. These
are upstream changes, not new implementations by this BREP increment.

## Integration checks

[qualify.py](qualify.py) runs BREP/IO debug, release and minimal-feature tests,
strict Clippy, docs, the circular STEP example, fuzz-target compilation and the
actual eight-group WASM probe. It also observes the changed scalar proofs,
the conflicting solver regressions and selected upstream modeling workflows.
Each command has an external timeout, source snapshot, raw log and exit status
in [attempts.json](attempts.json). These observations do not take ownership of
unrelated dependency work or replace upstream's broader qualification.

All 16 qualification commands pass on the integrated implementation:

| Check | Observed result |
| --- | --- |
| BREP/IO, all features | 399 tests pass in debug and 399 in release |
| BREP/IO, minimal features | 391 tests pass in release |
| Hyperreal, all features | 1,066 tests pass in release |
| Conflicting Hypersolve regressions | 14 residual tests and all four representation-matrix tests pass; both strict sparse APIs complete all 22 original recipes |
| Selected upstream workflows | 13 tests pass, including all five original strict-drill tests at unchanged 8/16/24/32 resolutions, typed adapter failures and exact path construction |
| BREP/IO strict Clippy | All-feature and minimal-feature, all-target checks pass with warnings denied |
| BREP/IO documentation and example | Warning-denied rustdoc and the release circular STEP example pass |
| Fuzz targets | Compile successfully; no runtime fuzz campaign is credited |
| WASM | Lock/build pass; eight groups execute in Wasmtime 38.0.0 with zero imports |
| Formatting | Workspace `cargo fmt --all -- --check` passes |

The two previously recorded strict 16/32-segment root drill failures now
complete under the unchanged strict policy. Their earlier failing evidence
remains historical; the new success is attributed to upstream corrections.
No library, acceptance test or fixture changed during these checks. The
generated WASM probe lockfile is the only snapshot addition after the earlier
native checks, recorded explicitly in the manifest.

The final [manifest](manifest.json) records the executed checks and their
limits. Counts across feature configurations overlap. Workspace tests and the
path-dependent, zero-import Wasmtime probe do not establish a published-package
pipeline, actual JavaScript/C/Python bindings, MSRV, exhaustive coverage, formal
verification, a runtime fuzz campaign or complete repository pre-push validation.

The unrestricted inherited staged whitespace check reports 86 raw evidence
files. Every reported file matches upstream byte-for-byte; the
[audit](inherited-data-whitespace.json) retains that result. These logs and
patches are preserved rather than rewritten. The [final audit](audit.json)
separately records source/documentation checks, JSON and local file links,
conflict resolution, preserved stashes and all open work-package gates.

## Matched BREP observations

The pre-change executables in [baseline-binaries.json](baseline-binaries.json)
were frozen at `561eae237`, before the parked scalar investigation or this
integration. Their exact build command, features, source hashes and binary
hashes are retained. The integration rebuild uses the same command and feature
configuration. [benchmark.py](benchmark.py) compares the complete 64-case
native, 12-case 256-arc, five-case closed-edge, six-case advanced STEP,
seven-case faceted STEP and six-case circular STEP corpora in alternating
baseline/candidate trials. Required receipts, validation, materialization,
allocation data and unfavorable observations remain visible beside timing.

All 36 measured processes complete; all 100 case receipts and fixture facts
match across the three alternating pairs. Candidate/baseline ratios below
compare per-case median costs, then summarize across the cases in each corpus:

| Corpus | Cases | Median ratio | Maximum ratio |
| --- | ---: | ---: | ---: |
| Advanced STEP | 6 | 0.997291 | 1.006123 |
| Faceted STEP | 7 | 0.995317 | 1.013709 |
| Native BREP | 64 | 1.001774 | 1.026703 |
| Default 256-arc | 12 | 1.001702 | 3.044496 |
| Closed edges | 5 | 0.795725 | 0.934629 |
| Circular STEP | 6 | 0.990671 | 0.997090 |

The adverse arc observation is `arc_large_cached_native_promotion_256_arcs`:
42.7 ns versus 130 ns per query. Each sample times only ten cached calls;
baseline totals are 490/427/390 ns and candidate totals are 468/1300/1540 ns.
These short shared-host measurements do not establish the cause or a stable
regression, and they do not pass a 10% timing gate. The observation remains
open for controlled measurement; it is not dropped or replaced by a favorable
repeat. All other case ratios are below 1.1 in this run. The same full-size
arc construction and receipts are retained.

Allocation-call counts and requested bytes match for all 19 measured STEP
cases. The six benchmark executables grow by approximately 30–31 KiB
(0.12–0.18%); these are executable sizes, not a claim about library or package
size. Process resource observations and each raw timing remain in the
[benchmark directory](benchmark-v1/commands.json).

These are shared-host integration observations, not a general speedup claim or
an internal resource bound. Earlier archive-admission and cached-arc timing
qualifications keep their original scope; a later snapshot does not erase them.
All 28 work-package gates remain open. No push or whole-plan completion is
claimed.
