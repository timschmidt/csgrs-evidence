# Machine profile and firmware lowering fuzz qualification

This stage supplies the previously missing plan 14.3 machine profile and firmware
lowering fuzz targets. It adds only an unpublished, standalone Interface fuzz
workspace, retained canonical configuration and input seeds, shared harness,
regressions and replay utility. No production arithmetic, policy, geometry,
configuration validation, canonical encoding or existing test changes.

The accepted baseline is Interface 73cc71b1bc426cafca0ee829e2fbc40961a45054,
CSGRS d78473bd80f0ca05680aff613fabf8abc984e4e5 and firmware
b9ecf8df54723e532a42867a1d3c549f827d5f6d. The added Interface source commit and
integration receipts are in integration.json; source.patch and final-harness/
retain exactly the committed files. Original pending extraction patches remain
separate and byte-identical. No push/publication or hardware execution occurred.

The input grammar and executable commands are in final-harness/README.md.
Structured profiles cover two axes, 1–32 exact microsteps, uncertainty fractions
0–7 over 1–4, and calibration scaled to parts per million. Microstep uncertainty
remains invalid by the existing integer scalar contract. A raw single-byte wire
mutation arm recomputes the document digest. Lowering uses bounded exact straight
paths, error requests and point limits, then actual canonical partition packaging,
firmware preflight/cached execution and schedule evidence replay. Exact density
expectations are derived independently from fixture constants; reconstruction,
identity, contiguous segments, strict tick order and tamper rejection are checked.

The two original campaigns exposed a new-harness bug: unreduced 0/2 and 6/2 were
passed to a canonical WireRational constructor. Original source, inputs and logs
are retained. Normalization now uses Hyperreal's canonical numerator/denominator.
A first regression incorrectly expected nonzero microstep uncertainty to reach
profile validation. ConfigurationRecord::validate_shape rejects it earlier because
microsteps require an integer with zero uncertainty. The regression now asserts
that specific rejection, and calibration cases exercise valid uncertainty instead.
No existing validator or acceptance assertion was relaxed. The earlier zero nominal
encoder panic and Clippy correction are also retained in logs.

Five final Rust 1.95 tests pass, including fresh-process lowering and exhaustive
4,096 structured profile cases. All-target/all-feature strict Clippy, strict library
docs and formatting pass. Nightly ASAN/coverage/debug-assertion/overflow-check fuzz
builds pass; unchanged alumina-runtime emits a nightly fetch_update deprecation
warning. The supported Rust 1.95 Clippy checks are warning-free. An accidental +1.95
alias invocation installed the same version under an additional alias; subsequent
checks use +1.95.0. No global settings or production APIs were changed.

The final instrumented campaigns execute 22,647 profile inputs and 205 lowering
inputs with 60-second requested campaign budgets, 10-second input timeout and 8GiB
RSS limit. Both exit zero. Reported peak RSS is 410/586MiB respectively, which is
instrumented campaign observation, not retained-memory or geometry resource proof.
Earlier normalized campaigns also pass (19,672/360 inputs) before valid calibration
coverage was added. Exact commands, time, status and raw logs are retained.

Final saved-corpus replay under Rust 1.95 reports:

| Target | Outcome | Inputs |
| --- | --- | ---: |
| Profile | Profiled | 95 |
| Profile | InvalidConfiguration | 272 |
| Profile | InvalidProfile | 32 |
| Lowering | Replayed through cached executor | 72 |
| Lowering | BudgetRejected | 7 |
| Lowering | InvalidConfiguration | 10 |
| Lowering | LoweringRejected | 5 |

Saved-corpus counts are not all campaign invocations. No unobserved outcome is
claimed covered. Final source includes 20 retained seeds, including original crash
inputs and valid calibration cases. Raw expanded corpora are retained here. External
time/RSS limits do not supply internal total-work or cancellation guarantees.
Instrumented binary sizes/hashes identify artifacts only; there is no performance,
binary-size improvement, universal safety, coverage threshold or hardware claim.
All 63 earlier frozen stages verify. This target addition does not accept the
pending arithmetic/path extraction migrations or complete any whole plan phase.

A separate compatibility run applies the unchanged 41-path CSGRS and eight-path
Interface pending patches only in isolated worktrees. The locked command correctly
rejects the changed dependency graph. Offline lock resolution adds 11 lines for
Hyperdynamics, then all five tests pass. The lock delta is retained separately;
both isolated worktrees were restored clean. The committed fuzz lock follows the
accepted source graph. Compatibility is not migration admission, runtime/size gate
success, or acceptance of that provisional lock delta.
