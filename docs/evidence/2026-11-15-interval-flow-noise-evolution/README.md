# Automatic affine-noise horizon candidate: rejected, regression retained

Base: `2bf1c6481f68ea7cdb0c696f768c22264deaa36a`. This stage targets plan
phases 12/13 and sections 10.7/10.8. It does not complete those phases or deliver
the proposed API. The 41-path pending extraction is absent from the isolated
candidate and remains unaccepted. See `contract.md` for the pre-edit ownership,
domain, proof and resource obligations.

The candidate composes native finite-horizon searches with retained affine noise
states, reusing accepted Picard proofs and requiring complete Taylor and noise
proofs before advancement. It preserves source/history, exact final-time capping,
invalid-input-before-empty behavior, reusable empty/identity outcomes and separately
named certified prefixes. A shared structural budget and cancellation retain
explicit scalar-payload, scalar-refinement and total-heap exclusions. The source
snapshot and all proposed feature, example, benchmark and test changes are in
`provider-source.patch` / `provider-source.json`; they are not retained production.

## Decisive admission results

The first split-helper implementation passes 163 owner tests and unchanged manual
trace/work/allocation controls, but pinned 16-pair shear controls detect mean
slowdowns of 0.542% cold and 0.743% warm, with paired bootstrap intervals above
parity. It is rejected. Raw samples, original source and `pinned-manual-comparison.json`
remain. Smaller binaries do not compensate for this regression.

The revised private generic proof-source interface expresses manual certification
versus reuse of an accepted proof at the original proof boundary. It does not use
forced inlining or layout variants. Pinned 16-pair shear controls yield ratios
0.996934 cold and 0.996865 warm; their paired 95% bootstrap intervals contain one.
This is no detected regression in those measured controls, not a proven speedup
or completed performance qualification. All four cold/warm constant/shear
allocation, cleanup and work-count controls match exactly. Eight final provider
benchmark smoke commands pass. See `provider-controls-corrected/results.json`.

Six pre-existing owner benchmark executables are byte-identical to the base.
The QR evolution executable grows 7,542,040 -> 7,542,056 bytes. Code, read-only
data, writable data and unwind sections are byte-identical. The 16 added bytes
are in the nonallocated symbol-string table; the build-ID and symbol-table
contents also differ. `provider-qr-original-section-comparison.json` compares
verified original files using a read-only parser. This still fails the unchanged
raw binary-size gate. No exception is assumed, no arbitrary source-layout or
inlining variants follow, and the candidate is rejected.

The candidate's constant timing, full owner timing portfolio, monomorphized-size,
`successive_operations`, package/archive consumer, WASM, fuzz and full pre-push
qualification are not completed. The earlier automatic portfolio applies to the
first candidate only. No broader performance or release claim is made.

## Checks actually completed after the provider edit

- Stable all-feature owner tests: 163 passes in 21 summaries. Optimized lib/tests:
  163 passes in 20 summaries. Rust 1.95 all-feature owner tests: 163 passes in 21
  summaries. No failures or ignored cases in these runs.
- Stable and Rust 1.95 independent feature matrices: all 21 configurations pass.
- Stable strict all-target Clippy with all features and no default features;
  Rust 1.95 strict all-target/all-feature Clippy: pass.
- Stable whole-workspace formatting, strict owner documentation, minimal-feature
  tests and doctests: pass. Minimal tests and doctests execute zero assertions;
  these are configuration/documentation checks, not added behavioral coverage.
- Hyperphysics all-feature consumer tests: 83 passes in 16 summaries.
- New witnesses include reversible shear composition, nonlinear Riccati exact
  solutions, time-dependent integration, empty/unit inputs, explicit prefix
  continuation, one-unit-short final publication, cancellation/retry, and
  fresh-process source/options replay. These finite witnesses are not a universal
  closure or total-resource proof.

Per-command flags, terminal statuses and durations are in `provider-validation`,
`provider-msrv`, `provider-owner.log`, and `validation-counts.json`. Overlapping
correctness builds are not timing comparisons. Pinned timings ran separately.

## Retained change and restored production

Commit `0a3b609e008e28344db393dbb66564b2d3545b4f` retains only the manual
shipped-example dispatch-count regression and its accepted-base fixture. The
fixture was deliberately absent for the first witness, then captured from and
confirmed on the unchanged accepted implementation. Both candidates must match
it. The test is independent of the rejected API. Primary-tree test, strict owner
all-target/all-feature Clippy and formatting pass (`retained-trace`). Temporary-
index tree equality and pending patch hashes verify preservation of all 41 staged
extraction paths, Interface's eight pending paths and the clean firmware state.

All proposed production, manifest, README and automatic-controller files are
removed from the isolated checkout after snapshotting. Both restored manual probe
executables reproduce the original hashes byte for byte; see
`restored-binary-comparison.json`. Final restored-source owner tests and formatting
are recorded separately in `restored-validation`. All 56 prior frozen stages
verify unchanged (`prior-frozen-check.json`).

## Evidence corrections retained explicitly

An earlier diagnostic `objcopy --dump-section` invocation rewrote its input files.
The baseline and first-candidate QR executables were rebuilt from their matching
sources and reproduced their original hashes before original-file comparisons.
The altered copies remain outside this archive. Manual timing/allocation probes
were unaffected; the first candidate's original QR smoke was rerun after recovery.
The provider QR binary was never rewritten. A failed restoration build caused by
mismatched variant source files is retained, followed by the successful matching-
source retry. See `diagnostic-binary-mutations.json` and both restoration records.

The first `provider-controls.py` correctly selected provider allocation binaries
but selected the earlier candidate's benchmark list. Its literal command records
remain. `provider-controls-corrected.py` reruns all 16 commands with the correct
provider benchmark binaries; only those corrected smokes qualify the provider.

No push, publication, controller acceptance, extraction acceptance, full platform
qualification or full-goal completion occurs in this stage.
