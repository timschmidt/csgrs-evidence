# Interface strict validation and release packaging

Retained source: Interface b4a15bd0c281cb63ecc3c1d3d451144041c85f91, seven paths.
This repairs reproduced downstream validation/build failures in plan phases 8/14;
it does not complete either phase or the fifteen-phase goal. No push or deployment.

## Scope and correctness

The client had two Rust 1.95 Clippy failures: a large response enum and redundant
Boolean grouping. Successful validated scan responses now own a boxed complete
scan; all other variants remain allocation-free. This is an intentional unpublished
Rust API/ownership migration, including removal of Copy and independent deep Clone,
not a source-compatible performance-only refactor. Native wire data, complete bounded
scan ordering, transaction checks, retained scan, errors and worker JSON are unchanged.
Snapshot Boolean operands were already evaluated bools; no scalar/predicate dispatch
or cache order changed. No lint exemption, policy relaxation or assertion removal.

Three new tests cover full scans, retained independent ownership after client reset,
malformed/mismatched response retry identity, and 4,536 identity/authorization/phase/
summary cases with an independent presence-count oracle. Baseline/candidate external
transcripts are byte-identical for every semantic row, full scan wire/JSON and Debug.
The semantic transcript has 1,425,659 bytes and SHA-256
54edebbdc0330fb69bcc1b0f9a46a3d9548be76f77c20e150abd2905ec8e6f48.

Three additional existing root browser Clippy failures were reproduced independently.
A redundant Ok-pattern is collapsed after the original RetryRequired arm. Two private
helpers extract the exact capability-transfer and network-scan UI bodies. Formatted
body hashes match the original bytes after dedenting; validation, UI object/scope,
widget/action order, diagnostic and secret-erasure statements remain unchanged.
Compilation/body identity is not interactive browser or latency qualification.

## Validation and packaging

Final isolated workspace: 398 tests pass (108 root, 86 existing client, 3 new client,
199 core, one integration and one doctest). Strict workspace native all-target and
WASM Clippy, warnings-denied client docs, formatting and source-policy audit pass.
All six commands also pass after integration into the primary checkout;
main-validation.json records their commands, durations and exit status.

The existing release workflow requires three gzip assets that the prior Trunk hook
never emitted. The exact baseline hook on minimal valid assets reproduces their
absence while existing Brotli round trips pass. Add gzip -9 -n streams after WASM
optimization, preserving original assets and all existing Brotli files. Candidate
and repeated fixture runs produce nine byte-identical outputs across two directories.

The actual Trunk 0.21.14 release build and all five configured artifact validation
commands pass, including wasm-tools validation and gzip/Brotli integrity checks.
All six production compressed files additionally decompress to their exact originals.
Production WASM is 10,735,302 bytes; gzip is 4,582,684 and Brotli 3,520,029 bytes.
All output paths/sizes/hashes are in production-artifacts.json. This is one combined
local checkout build; full clean-checkout reproducibility remains unproved. Neither
hosted deployment nor an interactive browser/live hardware session was executed.
The initial invocation failed before compiling because inherited NO_COLOR=1 is not
accepted by Trunk; normalizing that environment value to true resolved it. No source
or tool validation was bypassed. Original failures and installation logs are retained.

## Completed workload costs

External release probes use equal locked dependency versions. Each complete accept
operation clones the same prepared machine, validates the response and full encoded
payload, checks retained state, materializes an owned event and destroys it. Separate
clone cases include equality and destruction. Twelve CPU0/ASLR-disabled runs alternate
base/candidate/candidate/base three times with one common executable path, one million
operations per case and 32 warmups. All build/install/test work finished before timing.
Initial colder samples and every adverse result are retained; this is a local screen.

| Case | Baseline median ns | Candidate median ns |
| --- | ---: | ---: |
| status accept | 170 | 147 |
| status clone | 27 | 14 |
| full scan accept | 884 | 931 |
| scan clone | 49 | 61 |

Scan handling is 5.3% slower and scan clone 24.5% slower in this screen. These costs
are explicit tradeoffs of the ownership/API change needed to restore strict client
validation, not a claim of universal improvement or regression-free refactoring.
The scan path adds one 368-byte allocation per accepted/clone event; status paths
remain at zero. Event/Result layout shrinks from 368 to 80 bytes; retained machine
layout remains 576 bytes. Scan allocation is retained while the event lives, and
all measured modes return to zero incremental live heap after drop. Preexisting
machine/response objects and allocator overhead are excluded from these counts.
The external probe grows from 705,216 to 707,560 raw bytes (+2,344); .text grows
2,288 bytes. This is probe size, not an application binary-size delta. Browser helper
latency and baseline/candidate production size were not independently measured.

## Integration and remaining gates

Only the seven intended paths were committed. The primary Interface index is clean
and its eight inherited migration edits remain byte-identical, SHA-256
ba4ca466d9de22d1b299756ab815a6df0d9849753ce41776385b52bc9ebc605a.
CSGRS's 41 staged extraction paths remain byte-identical, SHA-256
7402c446dd98a3c94a6cca38ad4620fc4d8b8d20929ace044afd9ceda8b68b40.
Firmware is unchanged. All 36 prior frozen stages verify unchanged. The final state
and per-command outcomes are recorded separately; archival requires all named final
checks to pass. Historical evidence is not rewritten.

Machine-profile/schedule migration retention, broader browser/HIL coverage, Phase 11
performance regressions, remaining interval consumers and coordinated release still
need work. No full CSGRS pre-push, fuzz/coverage/sanitizer or hosted-platform matrix is
claimed. This stage repairs validation and packaging; it does not certify the full
mathematical or system support envelope.
