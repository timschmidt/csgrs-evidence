# Wrapping diagnosis and retained qualification

Baseline: csgrs 6b848e7a5dee061fe8387ef8ff69b2ebb42a38c1, isolated checkout
/mnt/development/interval-profile-static/csgrs. Rust 1.95.0, Cargo offline/locked,
CARGO_BUILD_JOBS=16. No subagents, push, publication or production kernel change
is retained. Main's 41 staged paths and Interface's eight pending paths are
preserved by exact patch hashes. The full interval-plan goal remains active.

`ADMISSION.md` records the diagnosis and contracts before each edit. The standalone
`probe` copies the accepted external Rust adapter and adds an existing manual
noise-chain consumer for the point/box two-rate cases. Its initial output and
endpoint oracle are in probe.log / probe-oracle.json. Timings there are unpinned,
exclude proposal generation and publication, and are not a competitive result.
The retained repository test supersedes endpoint-only qualification by checking
every continuous segment and materializing the full tube.

`coefficients-probe` uses the existing owning allocation-counter implementation,
with named coordinates, a large exact rational, aliased outputs, and all work
boundaries. baseline-coefficients.jsonl precedes the production edit. Candidate
controls are byte-equivalent after separating allocation records. Native logical
budgets, exact graphs/results, certainty receipts and full dispatch counts under
both policies are retained. Allocation improvement alone does not pass admission.

`build.py {baseline,candidate,restored}` captures 42 existing release artifacts
with unique source-path keys (including both taylor_orders targets). Captured
binary paths live outside this evidence record. Raw hashes, sizes and every ELF
section size are archived. Use a writable copy of this record and an isolated
checkout to reproduce; never run writers inside a frozen evidence stage.
`rejected-clone-scheduling.patch` removes only the scheduling-visit clone.
The flow_noise symbol table shows derive growing from 0xc85 to 0xcb5 bytes:
exactly the observed +48 .text bytes. Reject the candidate; do not substitute
stripped size or try arbitrary layout/inlining variants. All 42 restored hashes
match baseline. The allocator witness drops one 200-byte allocation per call,
with unchanged peak/live bytes. Whole-process Callgrind instructions decline
from 465881247 to 464748970; this is not a wall-clock performance claim.

Valgrind used /tmp/interval-refactor/profiling-tools/valgrind/usr/bin/valgrind
with VALGRIND_LIB=/tmp/interval-refactor/profiling-tools/valgrind/usr/libexec/valgrind,
--tool=callgrind and the release flow-wrapping-probe executable. The original and
candidate Callgrind logs include setup, Cartesian proposal generation, noise
construction, output and destruction. Inclusive costs overlap; do not sum them.

Retained changes are test support, the full two-rate flow witness and documented
qualification. Existing adaptive-test assertions are unchanged; their positive
series helper moves into shared support with an explicit 0<=t<14 precondition.
Full native and feature-specific command/log pairs describe executed validation.
No broader runtime improvement, automatic noise controller, universal wrapping
closure, total resource bound, phase completion or full-plan completion is claimed.
