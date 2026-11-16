# Typed unsigned fraction experiment: rejected

Source: accepted CSGRS 97713a6102d2b7bb090d6c7ce33e6e156f816588,
Interface f5341f36803ad77c856313315d67ac8b3bb63f9a, firmware
b9ecf8df54723e532a42867a1d3c549f827d5f6d. ADMISSION.md states ownership,
domain, properties and missing witness. No accepted production change is retained.

The missing typed From conversion first fails with E0277. The candidate then
adds unsigned NonZeroU64 fraction ingress at Hyperreal's existing private reducer,
leaving signed fallible fraction untouched. It reapplies the previously rejected
nonempty/positive interval migration and removes impossible Result transport from
the radius factory. These representations remain experimental.

Both scalar witnesses pass: 240 full-u64 pairs match independent BigRational
canonical components and quotient identities; 390 fresh-process cold/warm
construction traces match the historical signed-fraction domain exactly, including
rational statistics. Display/debug and serde bytes also match on that domain.
Sixteen interval tests pass, retaining independent exact/GMP expectations,
empty/invalid distinctions, composition and previous trace assertions. Both owning
crates pass all-feature/all-target Clippy with -D warnings on Rust 1.95; both
workspace format checks pass.

The complete seven-case native profile/identity/allocation transcripts are
byte-identical. Both WASM consumers replay the native fields, preserve invalid
cases and make zero host calls. These are supplemental finite comparisons, not
independent full-profile or full schedule/policy proofs.

| Artifact | Baseline | Candidate | Delta |
| --- | ---: | ---: | ---: |
| Native | 810416 | 810752 | +336 |
| WASM | 1069027 | 1069529 | +502 |

The combined candidate fails the no-growth gate. Removing impossible scalar error
transport does not establish an acceptable complete migration. No runtime speedup
or instruction-level cause is claimed; build duration and WASM fuel are not runtime
benchmark evidence. No arbitrary inlining/layout tuning or weakened gates follow.
Full policy/schedule/browser, owner runtime, successive-operation, monomorphized
size and pre-push campaigns are not run after this early rejection.

Candidate patches and all eleven changed source files are retained and verified
to reapply cleanly. The isolated repositories are restored clean. Restored scalar
fraction and rational interval tests and both format checks pass. Fresh restored
native/WASM artifacts and native transcript reproduce baseline byte for byte.
Protected primary 41 staged paths and Interface 8 pending paths remain byte-identical;
firmware remains clean. All 71 previous frozen evidence stages verify unchanged.
No push or publication. Phase 8 and the entire interval-refactor goal remain open.

Every executed check has a command/result JSON and log. final-verification.json
states limitations explicitly. Executables remain external, hash-bound in build
records; the source and harnesses needed to rebuild are retained here.
