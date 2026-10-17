# Fresh curve and WASM qualification

The unchanged baseline completed the full all-feature Hypercurve Cargo suite:
2,478 passed, zero failed, 33 ignored. The isolated cache candidate completed
both configurations: 2,487 passed/33 ignored with all features, and 2,450
passed/28 ignored without defaults. All nine new cache tests passed in both.
The all-feature delta is exactly nine unit-test passes; all other group counts
match the fresh baseline. Each run had 53 terminal test groups. Root formatting,
both strict curve Clippy configurations and warning-free curve docs passed.

Two existing scalar regressions exercised unreduced rational hashing and
canonical observable boundaries. GMP was built through a private whitespace-free
mount alias on Disk B, preserving dependency and test sources. This is two
named scalar tests, not full scalar-suite qualification.

The unchanged real WASM script completed five JavaScript programs, three TAP
groups totaling 35 tests, the TypeScript declaration check and two compiled
TypeScript programs. WASM Clippy passed. The first attempt built successfully
but failed at initial Node WASM allocation under an 8 GiB virtual-address cap.
A one-page allocation reproduced that environment failure. The successful run
used NODE_OPTIONS=--disable-wasm-trap-handler for explicit bounds checking under
the same cap. Default Node runtime qualification remains open. The failed run,
first probe diagnostic-text assertion and helper preparation error are retained.

Source, fixtures, policies and existing timing gates remain unchanged. The
candidate README preserves the Apache license link. These results qualify the
stated local checks; they do not admit the cache candidate, reverse rejection
of the original 35-file native bundle, establish an end-to-end speedup, qualify
every binding or complete the properties plan. Native workload and report checks
are in progress in separate open roots. Remaining gates are in review-v1.json;
historical E46 cost evidence retains its own scope.

Every newly closed path is independently hashed. The verified compact archive
retains completed logs, controls, source inventories and failed attempts. Both
WASM targets remain physically preserved and pinned, without copying binaries
into Git. General source, registry/cache and native/scalar build roots remain
open. Inherited missing paths remain 27,093; this is not a full historical audit.
Only current_work changes in the execution ledger.

This evidence is committed in the isolated Disk B documentation worktree. The
original repository remains below its reserve and unchanged. Parent expectations
use the retained isolated E53 path, then its original-repository parent.
Integration and portable release reproduction remain separate work.
