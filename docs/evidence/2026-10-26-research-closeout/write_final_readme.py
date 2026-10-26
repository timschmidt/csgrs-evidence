from pathlib import Path
import json, time

raw = Path(__file__).resolve().parent
admission = json.loads((raw / 'validation-admission.json').read_text())
artifacts = json.loads((raw / 'artifact-manifest.json').read_text())
assert admission['all_required_checks_passed']
assert admission['workflow_steps_covered'] == 129
assert admission['strict_lint_steps_covered'] == 196
assert len(admission['sanitizer_campaigns']) == 13
assert len(artifacts['release_packages']) == 36
path = raw / 'README.md'
assert not path.exists()
path.write_text('''# Research closeout, 26 October 2026

The maintainer requested that experiments stop, existing validation finish,
accepted work be committed and pushed, and the new plans and agent instructions
be included. R19 is the final research experiment. R20 received read-only
preparation; no R20 candidate, measurement campaign or admission was started.
The wider research objective and the curve/BRep closure requirements remain
incomplete. The original goal is to be paused after publication.

## Retained revisions and evidence

- `32fece097fc211187b8346cef2055068bf967235`: exact curve/BRep closure plans
  and AGENTS instructions. These state requirements, not implemented closure.
- `05cfe80739567e8abba2c01ddc398b4671814fe1`: retained research changes,
  regression tests, migrations and dispositions. Earlier rejected experiments
  remain rejected. The R19 record is unchanged in the preceding evidence commit
  `55d28790bdcf32b6454d34a2bfd5ed826f187d72`.
- `55800998bafb74434c84299f697a266ef4e1dd0c` and
  `5e7a430c6b93d6889a6b83ee88873b89d6caf5c1`: equivalent iterator/boolean
  spellings and formatting required by current stable/MSRV Clippy. The final
  code revision is `5e7a430c6b93d6889a6b83ee88873b89d6caf5c1`.

`validation-admission.json` is the machine-readable acceptance record.
`matrix.json`, `workflow-inventory.json`, per-run `steps.json`, `events.jsonl`,
logs, Cargo invocation audits and source hashes retain the exact commands and
their results. `maintenance-source-attribution.json` identifies the five
maintenance paths and requires final hashes for every affected check. Earlier
kernel checks are used only where their compiled inputs are unchanged. All
accepted records have unchanged tracked inputs during execution. The later
evidence-index/ledger commit changes no compiled or packaged source payload;
see `final-document-boundary.json`.

## Completed pre-push validation

All 129 locally executable validation steps from all thirteen workflows passed,
as did all 196 additional strict Clippy checks. This includes formatting,
spelling, repository budget, workspace and downstream tests, all 256 Hypertri
feature combinations for build/test/Clippy, cache representations, API docs,
benchmarks, fuzz-target checks, directed selection, coverage, WASM bindings,
three release demos and Pages artifact assembly.

Both complete release workflows passed on stable 1.99.1 and MSRV 1.95.0:
eighteen packages each, their configured docs.rs builds, clean external Rust
consumers and README examples, and real C, C++, Python, Go and TypeScript
consumers. Supplemental strict Clippy also passed for generated Rust consumers.
This establishes local packaging and consumption, not registry publication or
hosted docs.rs success.

All thirteen ASan/LSan fuzz campaigns passed with mutation evidence and the
unchanged configured 10,200 seconds of campaign limits, 10-second per-input
timeout, 2,048 MiB RSS cap and six-byte input limit. The report header queried
the user's older nightly alias; the actual child Cargo audit and binary compiler
section establish nightly-2026-10-26 (rustc 1.101.0-nightly, 76456a688).
`asan-actual-compiler.json` preserves that qualification without altering the
original report. The user's default compiler and nightly alias were unchanged.

All three coverage workflows passed their configured gates. In particular,
Hyperspatial reports 1,875/1,902 production lines (98.58%), 201/201 functions,
2,576/2,754 regions (93.54%), and 136/140 native-inverse lines (97.14%). Branch
coverage was not measured. The pinned Verus workflow passed all four commands:
613 verified units with zero errors, 192 rejected mutations and ten acceptance
tests, on 209 identical inputs. This covers 94 production contracts and 119
arithmetic-model theorems; thirteen obligation groups remain open.

These workflow benchmark executions ran concurrently with other validation.
Their timings are not new performance-admission measurements. R19 retains its
scoped exact-completion admission and disclosed adverse costs; general
performance admission failed. A passing closeout does not establish universal
geometry closure, cumulative resource bounds or completion of open packages.

## Failed attempts and resolution

Raw failed attempts are retained alongside successful reruns. The original
WASM lint selection incorrectly included native-only test targets; selection
was corrected to the workflow target kinds. New compiler lints required the
small committed maintenance changes above. Trunk rejected the inherited local
`NO_COLOR=1`; subsequent runs removed that terminal-only setting. Cargo's
temporary-registry package verification failed offline and passed through its
normal online path. Sandboxing prevented LeakSanitizer startup and Symbolica's
loopback instance guard; identical checks passed outside the sandbox without
disabling either guard, changing licenses, or reducing campaign limits.
Checkpointed batches preserve completed steps and source inventories; interrupted
next-step startup was rerun. No failed validation was treated as a pass.

## Hosted exclusions and retention

Four hosted actions were inspected for consistency and excluded from local
execution: directed-evidence upload, Pages configuration, Pages artifact upload
and Pages deployment. Their exact definitions are in `hosted-action-review.json`.
All workflows use Linux runners, so no platform packaging was excluded. CI and
pre-commit configuration were unchanged; the conditional Zizmor gate did not
apply.

`artifact-manifest.json` records retained directed/sanitizer reports and corpora,
coverage summaries and profiles, package digests and WASM bundle digests.
Rebuildable compiler caches were retired only after their jobs completed and
with inactive-process/lock checks; inventories preserve that housekeeping.
The archive excludes rebuildable binaries and redundant committed package
source with digests, retains normalized package metadata and external-consumer
outputs, and verifies lossless compression/splitting. Earlier evidence records
are immutable. Publication and the final document checks follow this snapshot;
their status belongs to the source evidence index and the publication record.
''')
status = json.loads((raw / 'status.json').read_text())
status['active_validation'] = {}
status['updated_ns'] = time.time_ns()
status['prepush_matrix']['status'] = 'Passed: all 129 workflow steps and all 196 strict lint checks, with source attribution and artifacts admitted.'
status['notes'] = 'Plans and retained research are committed. R20 remains read-only preparation. Every required check is admitted on its final compiled inputs; the final evidence index/ledger and publication follow this snapshot.'
status['completed_since_initial']['primary_validation'] = 'All 20 R19 final primary/downstream checks passed on unchanged sources; the R19 evidence record remains immutable.'
status['new_required_fix']['followup'] = 'All affected final-source native/WASM demo, DRC/circuit/workspace, stable/MSRV lint and both complete release workflows passed.'
status['new_setup_findings'] = [
    'The offline temporary-registry failure is retained; both complete release workflows passed through normal online registry access.',
    'Removing the inherited terminal-only NO_COLOR=1 setting resolved Trunk startup; all final release demo builds and site assembly passed.',
    'The ASan report header retains the older user nightly alias; the actual thirteen child Cargo invocations and binary compiler section establish nightly-2026-10-26.'
]
status['required_next'] = [
    'Archive this completed validation record, update and verify the evidence index and final ledger, run affected document checks and commit.',
    'Push the evidence research branch and source main without force; verify both remote refs.',
    'Pause the original research goal at the explicit maintainer request.'
]
status['sanitizer_setup'] = 'Initial sandbox startup failure retained; all thirteen identical escalated campaigns passed with mutation evidence and unchanged limits.'
status['publication_status'] = 'Not yet pushed at this immutable validation checkpoint.'
(raw / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
print('Wrote completed validation README and checkpoint status.')
