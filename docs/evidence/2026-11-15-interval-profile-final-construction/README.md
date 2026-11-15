# Reject generic final construction for machine interval migration

This Phase 8 experiment preserves exact profile behavior but fails the native and
WASM size gates. No production candidate is retained and the plan remains active.
Initial-state.json records accepted revisions and unchanged pending primary patches;
ADMISSION.md records owner, domain, properties, witness and retention gates.

## Hypothesis and tested source

The prior combined-ingress prototype still had intermediate Result adapters.
This experiment moves construction of the final ExactInterval or private positive
construction state into generic private finalizers after lookup and exact ingress.
The existing Hyperinterval nonempty/positive prototype remains unchanged. Nominal
values, physical-fact errors, public layout and Debug remain Interface-owned.
Lookup, conversion, denominator/numerator validation, positivity and arithmetic
retain their original order. No new hints, flags, tolerances or weaker assertions.

Before implementation, the new lifecycle witness fails with four E0425 diagnostics
for the missing helpers. It then passes, checking that construction happens once
on valid ingress and never after a missing fact or nonpositive lower bound.
The test uses existing configuration builders. All 19 machine_profile unit tests
pass, including existing missing-fact and nonpositive-bound rejection cases and
focused schedule/lowering checks. This is not the complete canonical corpus.

All 14 owner tests in fraction_uncertainty, nonempty_transport,
positive_product_chain and rational pass, including independent endpoint/corner
oracles, GMP large rationals, full-width uncertainty, further use of generated
results and fresh-process dispatch comparisons. Owner Clippy passes with all
features/targets and -D warnings. Interface core Clippy passes for all targets
with default features and -D warnings. Full consumer both-policy dispatch counts
and entire application qualification are not inferred from these checks.

## Controlled consumer comparison

Both the accepted baseline and prior rejected combined-ingress control reproduce
their previous native and WASM hashes exactly. All builds use Rust 1.95.0, locked
frozen harness manifests, unchanged absolute sibling paths and the original CSGRS
build cwd. The harness release profile is one codegen unit, fat LTO, opt-level z,
overflow checks, panic abort and stripped symbols. Scripts reject a different cwd.
Builds use 16 jobs; build time and WASM fuel are not performance measurements.

All seven complete native profile/identity/allocation transcripts match baseline.
All seven WASM outputs match the corresponding native profiles, reject invalid
indices and make zero host calls. Consumer agreement supplements the independent
owner oracles; it is not an independent proof of all profile and schedule behavior.

| Source | Native bytes | Delta | WASM bytes | Delta |
| --- | ---: | ---: | ---: | ---: |
| Baseline | 810416 | 0 | 1069027 | 0 |
| Combined-ingress control | 810608 | +192 | 1069527 | +500 |
| Generic final construction | 811424 | +1008 | 1070423 | +1396 |

The candidate is rejected. No runtime, whole-owner monomorphized-code, complete
browser/schedule, sanitizer, coverage or pre-push campaign follows this decisive
size failure. No production arithmetic or experimental public type is retained.

## Attribution and reproducibility

The candidate linker-map build reproduces its normal stripped native artifact
byte for byte. The baseline map is copied read-only from the preceding stage;
this stage reproduces the baseline binary hash. Native .text grows 736 bytes,
with mapped symbol union and normalized symbol-family delta sum both +737; the
one-byte difference is padding. Unwind sections grow 248 and 32 bytes. NOBITS
relro padding is not file-size savings.

Positive scalar wrappers each occupy 405 bytes (the prior combined-ingress
control had 275 and 69). The nonempty constructor and positivity refinement now
appear as separate 120/115-byte emitted functions. Derive remains 87 bytes smaller
than baseline. These are emitted-artifact observations, not proof of runtime cost
or a universal compiler explanation. The generic finalizer approach does not
remove the measured overhead and should not be repeated without new evidence.

Complete candidate patches and final-source are retained against the revisions
in initial-state.json. The control patches and baseline map originate in the
frozen profile-codegen-attribution stage. Read-only probe source/locks and WASM
replay are in profile-static-products. Run writers only from a writable copy,
never inside frozen evidence. Large binaries remain outside this archive; hashes,
commands, source, maps and transcripts are retained here.

Restoration removes only the candidate-owned paths from isolated worktrees.
Restored owner tests and both workspace format checks are recorded. Restoration.json
records fresh baseline binary/output equality, clean isolated worktrees, unchanged
primary pending patches and verification of all 66 prior frozen stages. Full plan
migration, extraction, resource, hardware and release requirements remain open.
No push or publication occurs.
