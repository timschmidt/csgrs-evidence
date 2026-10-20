# Upstream integration and acceptance contract

The `brep` branch integrates upstream
`7cf9d82acee6f152047eb37e5ff2e6dcece51a0d` onto
`f653f1ed2387791009eac454a460f372b5b67535`. There are 77 upstream commits
since the previous shared main revision, `47ae4a170`. Both histories are
preserved. [integration.json](integration.json) records revisions, conflict
resolution and hashes of the unfinished work saved before integration.

The only merge conflict was the shared property ledger. Resolution retained
every upstream value and the existing HyperBRep entry. The root agent rules,
properties and admission protocol are imported unchanged from upstream.
The BREP plan and work-package gates apply that contract to existing and
future work. The integration-specific source change updates Hypersolve tests
and certainty documentation for the newly available quotient proof; executable
production code is unchanged. The source checks below determine the integrated
state.

## Guidance applied

The normative sources remain [properties.md](../../../../../properties.md),
[docs/admission.md](../../../../../docs/admission.md) and
[AGENTS.md](../../../../../AGENTS.md). The plan now requires:

1. Empty-result composition and visible failures before broader feature work.
   BREP's operand/result mismatch is a concrete missing capability: its public
   Boolean functions require `SolidRef`, while results are `BodySet`, which
   can be empty. [empty_operand.rs](empty_operand.rs) reproduces the compiler
   rejection; [its log](empty-operand.log) and [artifact record](empty-operand.json)
   are missing-API evidence, not a passing runtime composition test. The plan
   moves to one native `BodySet` operand/result interface and direct caller
   migration, with no compatibility facade.
2. Named ordinary strict workflows, including further operations on prior
   outputs. Numerical certainty, topology validity and source fidelity are
   independent claims. Independent semantic expectations supplement topology,
   measurements and deterministic serialization.
3. A clean external documented-package pipeline and real affected bindings
   before delivery claims. Local source tests, path dependencies and WASM
   probes cannot establish this boundary.
4. Separate precision, total-work, retained-memory and cancellation contracts;
   honest unknown/exhausted/unsupported/invalid outcomes; explicit provisional
   partial results; cleanup and recovery checks.
5. Cost evidence for the same completed contract, with certainty, completion,
   provenance, required validation and materialization beside timing. Preserve
   adverse samples and every certified-success case. Changing policies,
   resolution or a required success to Unknown cannot make a regression pass.

All 28 work-package gates remain open. Neither this merge nor its documentation
establishes whole-plan completion. The historical repository audit and earlier
evidence retain their original source scope.

## Dependency review and inherited gaps

The reviewed scalar changes add opposite identical-product cancellation,
bounded polynomial/guarded quotient recognition and query-local shared-node
proof reuse. Hyperlimit point equality can use a certified unequal coordinate
without treating another undecided coordinate as disproof. BREP consumes these
owning-layer proofs; it must not duplicate them or replace them with tolerances.
The updated root modeling API preserves typed construction, transformation,
bound, sampled-field, planar and section failures. Upstream adds corresponding
consumer regressions and keeps original full-resolution workflows.

This review includes the scalar proof implementation, point-equality change,
updated contracts, property-ledger qualifications and strict drill tests.
[changed-source-paths.txt](changed-source-paths.txt) is an inventory, not a claim
to have read every changed source or evidence file.

Upstream's affine, quotient and shared scalar proof entries explicitly retain
`runtime_admitted: false`. Its original 16/32-segment drills complete their
initial cut but the further empty-accumulation compositions remain failing.
Those tests are preserved and rerun; neither an initial certified drill nor a
successful BREP test closes these downstream gaps. The prior BREP
archive-admission cost regression also remains open.

The all-feature solver check also found an outdated expectation: the original
`[[e, pi], [pi, e]]` Cramer-solution fixture now produces two certified zero
residuals, where its test required `UnknownResidual` and approximate acceptance.
[The admission record](residual-replay-admission.json) preserves the target
failure, original input and independently derived numerator cancellations.
The [test/documentation patch](residual-replay.patch) retains that
matrix and requires exact success under both policies. A separate existing
transcendental identity retains genuine terminal coverage, including strict
refusal before and after approximate use. No old geometry, policy or resource
limit is weakened; dense replay docs now distinguish acceptance under a policy
from an exact proof. Tests and public documentation are the only changed parts
of that source file.

The extended solver run then reached a second stale expectation: the public
representation test required at least one strict sparse solve to remain
undecided. All 22 original positive coefficient recipes now succeed. The
[representation admission record](representation-admission.json) retains both
feature-configuration failures and the recipe hash. The
[updated test](representation-success.patch) requires both strict sparse APIs
to return the independently expected exact solution `1` for `v*x=v`, with
certified positive `v`; Unknown is now a regression for this success corpus.
The original recipes and 22×22 ordered-pair matrix are preserved. Genuine
undecided sparse and dense replay controls remain separate.

## Qualification

[qualify.py](qualify.py) records each exact command, exit status, external
containment limit and raw log in [commands.json](commands.json). The source,
dependency manifests/lock, toolchain, platform and CPU affinity are bound in
[environment.json](environment.json). Source hashes are checked after each
command. Tests use the merged source before restoration of the unfinished
closed-edge candidate. Timings include build/test overhead and are not matched
performance measurements.

The first root/scalar attempts stopped before tests because the isolated Cargo
cache lacked locked dependencies. Their failed logs remain retained. A locked
dependency fetch is separately recorded without changing `Cargo.lock`; later
attempts must not overwrite that setup evidence.

[recheck.py](recheck.py) retains the dependency-ready attempts separately.
The combined foundation invocation exposed example filename collisions and a
missing `m4` build tool for the optional GMP/MPFR test oracle.
[m4-setup.json](m4-setup.json) records the checksum-verified Debian tool extracted
under `/tmp`, with no system installation. [foundations.py](foundations.py)
runs each crate separately with the same full all-feature test selection.
[final_checks.py](final_checks.py) records fresh solver and BREP consumer
checks after the final test/documentation edit. Prior source-specific runs
remain linked as prior runs; none is silently relabeled as a final-source run.
That first final-source attempt exposed the representation expectation;
[final_checks_v2.py](final_checks_v2.py) reruns the checks after its repair in
a separate directory, preserving the earlier failures.

The existing advanced STEP WASM probe is rebuilt and executed on this source.
It checks six groups covering 3D/pcurve import and replay, split/reflection,
parameterization/master semantics, alternate rejection, strict ambient-policy
handling and a directed-use resource limit. It is a local WASM runtime probe,
not a JavaScript binding or released-package test.

The [qualification summary](summary.json) retains every command result,
including failed setup and superseded test expectations. Configuration counts
overlap; they are not a unique-test total.

| Check | Observed result |
| --- | --- |
| Merged BREP/IO debug and release, all features | 373 passed in each configuration |
| Merged BREP/IO minimal release | 365 passed |
| Hypercurve default-feature release | 2,439 passed; 28 existing ignored |
| Hyperreal / Hyperlimit all-feature release | 1,043 / 365 passed, including doctests |
| Final Hypersolve default / all-feature release | 974 / 975 passed, including doctests |
| Final focused residual replay | 14 passed |
| Final BREP/IO debug consumer | 373 passed |
| Recorded strict Clippy and warning-denied docs | Passed; see exact package/feature selections in command records |
| BREP fuzz-bin compilation and workspace formatting | Passed |
| Final WASM build and runtime | Six probe groups passed; zero module imports |
| Ten root modeling acceptance suites | 141 passed; two upstream drill-composition cases remain failing with `PredicateUndecided` |

No full pre-push matrix, all bindings, sanitizer campaign, formal verification,
MSRV, competitive benchmark or clean external release is inferred. No push is
part of this integration.

The full staged whitespace check reports pre-existing whitespace in 318 raw
upstream evidence/fuzz files. [The recorded comparison](upstream-raw-whitespace.json)
proves its findings match the upstream diff and every affected file remains
byte-identical to upstream. Raw evidence is preserved rather than reformatted;
this finding is not reported as a passing whole-index whitespace check.
The local `.gitattributes` treats this directory's raw logs and patch as data.

## Preserved candidate

The unfinished native closed-edge implementation, tests, benchmark draft and
evidence were saved before merging. Its debug/release results and deliberate
fault controls belong to the pre-integration source. The interrupted full
Hypercurve debug run is recorded explicitly; it is not a passing run or a
product assertion failure. Restore the candidate without losing those records,
then establish fresh qualification and benchmark baselines on the integrated
dependencies. In particular, a binary frozen before the scalar changes cannot
isolate a subsequent BREP-only cost change.
The candidate remains in the stash identified by `integration.json`;
[preserved-work-verification.json](preserved-work-verification.json) verifies
all 63 saved files byte-for-byte. It is outside this integration-qualified
source and remains unfinished work under the updated implementation priorities.
