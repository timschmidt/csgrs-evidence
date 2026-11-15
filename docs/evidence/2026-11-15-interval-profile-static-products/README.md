# Static-arity machine interval products: rejected

This is a Phase8 migration experiment, not retained implementation. The full goal
remains active. ADMISSION.md records ownership/domain/gates before edits and
initial-state.json records all four repository heads, branches, dirty paths and
patch digests. Primary pending patches and every prior frozen stage are preserved.
No production source, compiler option, dependency version or acceptance threshold
is changed for retention. No push/publication occurred.

Current accepted targets: CSGRS b51440ab08eef4a140822dc7e8650af4a661934a,
Interface f5341f36803ad77c856313315d67ac8b3bb63f9a, firmware
b9ecf8df54723e532a42867a1d3c549f827d5f6d. The previously rejected dynamic
positive-product helper is rebuilt only as a control. It refines positivity once,
preserves lower-before-upper product and quotient ordering, and retains application
nominal values, units and configuration/capability identity. General empty/signed
rational interval semantics remain unchanged.

The distinct hypothesis was that a runtime slice erased the known four-factor
machine transmission shape at the shared API boundary. The new candidate changes
only product's argument to `impl AsRef<[&Self]>`, retaining array types through
monomorphization while still supporting runtime slices and vectors. It calls
AsRef once and then uses the identical product body. No loop unrolling directive,
inlining hint, compiler flag, predicate order, arithmetic order or factor limit is
introduced. The Interface caller supplies an array. Owner tests add array/slice/
vector equality with independent integer endpoint expectations for lengths
0,1,2,4,8,16 and an additional fresh-process static-array trace control.

The missing positive-chain API is reproduced on the current target before edits
(E0432/E0599, 11 errors). Dynamic owner controls pass 11 tests. The final static
candidate passes 12 owner tests across three harnesses, including 625 independent
integer-corner chains, a large-rational GMP oracle, generated results as further
input, invalid/empty refinement and original/dynamic/static fresh-process trace
equality. Existing assertions remain. Strict all-feature/all-target Clippy passes.
A new test initially used unsupported From<usize>; its literal conversion is
corrected to u128. The initial failure is retained, not counted as a pass.

Complete native profiles/identities and allocation records match byte for byte for
all seven scenarios (six successful profiles and one expected typed invalid input).
All seven WASM transcripts match the corresponding native results, invalid indices
are rejected and there are zero host calls. These comparisons supplement the
independent owner expectations; they are not independent full-profile or canonical
schedule proofs. No completed schedule/WASM-browser acceptance is inferred.

| Artifact | Baseline bytes | Dynamic control | Static candidate |
| --- | ---: | ---: | ---: |
| Native profile executable | 810416 | 811296 | 811296 |
| WASM profile module | 1069027 | 1069992 | 1069992 |

Both static artifacts are byte-identical to their dynamic controls, including
hashes. The +880 native and +965 WASM failures reproduce on current accepted source.
Therefore preserving array type at this boundary does not improve these configured
artifacts. This does not establish the compiler's internal reason, prove absence
of loops, identify the remaining cost cause, or qualify every compiler/profile.
Do not repeat this variant as a new optimization hypothesis without new evidence.
No timing, owner-wide binary/monomorphized-code, full-profile both-policy trace,
full downstream schedule, browser, sanitizer, coverage or pre-push campaign follows
the decisive size rejection. Build duration and WASM fuel are not performance claims.

The experiment is fully removed from isolated worktrees. Restored owner tests and
both workspace format checks pass; fresh native/WASM rebuilds reproduce baseline
hashes and full native output. Restoration and state receipts are in restoration.json.
All 64 previous frozen stages verify. Source patches and complete source snapshots,
locks, failing/passing logs, exact build commands, compiler/environment contract,
artifact hashes, raw profiles and WASM transcripts remain here. Large build artifacts
remain outside the archive; the source recipes reproduce them.

Reproduction uses fresh sibling checkouts at initial-state.json's accepted revisions.
Copy this stage to a writable location and update only the absolute sibling checkout
paths in the two probe manifests and scripts. Preserve each manifest's release
profile and lock. build-profiles.py runs native then WASM and full replay, writes
logs/JSON, and copies artifacts outside this record. Never run it in frozen evidence.
Apply csgrs-dynamic-complete.patch plus dynamic-interface.patch for the dynamic
control, or csgrs-static.patch plus alumina-interface-static.patch for the static
candidate. The missing-API witness is the dynamic positive_product_chain test on
baseline source. Commands are recorded per check in their JSON receipts. The final
candidate is absent from every authoritative production worktree.
