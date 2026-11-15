# Attribute machine interval migration cost; reject incomplete reductions

Disposition: no production candidate retained. This Phase8 experiment identifies
native emitted-code contributions and tests two corresponding changes. It does
not complete the migration or weaken its acceptance gates. Primary pending patches
and all previous evidence remain unchanged; no push/publication occurred.

Accepted source: CSGRS7168a68127e04233141f0baa4c5a9468e0a2c41c,
Interfacef5341f36803ad77c856313315d67ac8b3bb63f9a, firmwareb9ecf8df54723e532a42867a1d3c549f827d5f6d.
Initial-state and admission records precede work. The existing clean isolated sibling
layout is advanced to current CSGRS; its difference from the previous source is
only the ledger/archive row. Original frozen probe manifests are read-only, with
--locked and target/log/map output outside the frozen record. Absolute paths,
release profile, dependencies and original CSGRS working directory are preserved.

## Attribution tied to actual artifacts

Linker-map side output produces executables byte-identical to the original stripped
native artifacts for baseline, rejected dynamic control and both new candidates.
Maps therefore describe those actual emitted artifacts, without trusting an
independently optimized observer. Raw maps, commands, hashes, disassembly ranges
and parsing source remain. Disassembly labels based on nearest dynamic symbols
are not callee names; map addresses identify the relevant source functions.

For the rejected dynamic helper, .text grows416 bytes; the union of mapped symbol
ranges grows415 (the difference is padding). Normalized symbol-family deltas sum
to that union delta. The transmission derive itself shrinks87 bytes. The new
positive proof adapter is519 bytes and the separate scalar components adapter225;
other wrappers/conversions shrink or change. A null/empty check and unreachable
panic remain after a constructor mathematically guaranteed to be nonempty.
Additional rodata, relocation and unwind sections are recorded separately.
NOBITS/relro-padding changes are not file-size savings and do not waive the gate.
This attribution does not prove runtime cost or every compiler's behavior.

## Tested changes

1. A native NonEmptyRationalInterval shares the existing Bounds authority, preserves
   construction nonemptiness, and refines positivity with the original comparison.
   General RationalInterval retains its empty/signed domain and error distinctions.
   Interface consumes the nonempty result without an impossible-empty branch.
   A missing-carrier E0432 witness precedes edits. No predicate or arithmetic order,
   nominal value, units, configuration identity or failure cause is intentionally
   changed.
2. Current disassembly still shows two large-result branches in the positive
   adapter: fact lookup, then scalar-set construction. The baseline performs those
   within one helper. The second candidate combines lookup and construction in one
   private helper, preserving their order and removing the now-unused private
   forwarding constructor. No owner arithmetic changes from candidate1 and no
   inlining, loop-unrolling or layout directive is added.

Fourteen final owner tests across four harnesses pass: retained independent integer
corner and rational endpoint enumerations, a large-rational GMP oracle, original
full-width uncertainty cases, generated results as further operands, invalid and
empty refinements, nonempty/general transport and fresh-process original/shared/
nonempty dispatch equality. Strict all-feature/all-target owner Clippy passes for
the nonempty owner code, which is unchanged by the subsequent Interface-only edit.
All original assertions remain. Full Interface both-policy trace/canonical schedule
qualification is not inferred from these owner controls.

All seven native complete profile/identity/allocation transcripts match baseline.
All seven WASM profiles match native, reject invalid indices and make zero host
calls. This is consumer agreement, supplemental to independent owner oracles;
it is not an independent full-profile or canonical schedule proof.

| Variant | Native bytes | Delta | WASM bytes | Delta |
| --- | ---: | ---: | ---: | ---: |
| Baseline | 810416 | 0 | 1069027 | 0 |
| Rejected dynamic control | 811296 | +880 | 1069992 | +965 |
| Retained nonemptiness | 810864 | +448 | 1069649 | +622 |
| Combined fact ingress | 810608 | +192 | 1069527 | +500 |

The interventions reduce overhead but both fail the required size gates. The final
native .text remains80 bytes larger, with mapped-symbol union +73 and unwind
.eh_frame/.eh_frame_hdr +104/+16. Those are linked profile observations, not a full
owning-crate monomorphized-code or runtime qualification. No broad owner/downstream
timing, complete application/browser, sanitizer, coverage or pre-push campaign
follows rejection. Build durations and WASM fuel are not performance claims.

One combined-ingress build was accidentally launched from Interface's directory,
whose Cargo configuration adds WASM rustflags. The confirmed process group was
stopped and its incomplete run discarded. Both builds were repeated from the
original CSGRS directory under a distinct controlled label. The runner now refuses
another cwd. Original logs and the rejection receipt remain. This does not permit
using different flags to improve the candidate's size comparison.

Both candidates are removed from isolated worktrees. Restored owner tests and
both workspace formatting checks pass. Fresh native/WASM builds reproduce baseline
hashes and native output; restoration.json records source/patch/evidence checks.
No experimental public type or helper is integrated. The complete plan remains
active, including the remaining migration, extraction, resource, hardware and
coordinated release requirements.

## Reproduction

Use the exact sibling paths and accepted revisions in initial-state.json for
byte-identical reproduction. The probe sources/locks are the frozen
profile-static-products stage, referenced read-only by the build scripts. Dynamic
control patches are retained there. Apply the *-nonempty.patch pair for candidate1
or the *-merged-ingress.patch pair for candidate2, not both. Final-source contains
candidate2, while nonempty.rs/apply_nonempty.py retain its construction recipe.
Run writers only from this stage's writable copy, never inside frozen evidence.
Map builds add only a linker-map side output; normal builds/replay run separately
and hashes are compared in screens.json. Large executable/build artifacts remain
outside the archive with hashes. The source, locks, exact paths/commands, raw maps,
full transcripts, failed attempt and restoration receipts are retained.
