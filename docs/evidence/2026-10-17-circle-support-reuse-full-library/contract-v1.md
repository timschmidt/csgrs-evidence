# Complete the preserved cache candidate's library suites

Owner: Hypercurve operation-local circle-support cache, P4/P10/P19/P20/P36.
The candidate and its domain are unchanged from the deferred-reuse index audit.
Production still does not contain the proposal. Both earlier whole-library
attempts stopped at the repository free-space guard and remain incomplete.

Reuse the exact two preserved test executables read-only after checking their
physical SHA-256 identities, successful build commands, complete source hashes,
feature lists, dependency hashes and compiler record against retained evidence.
No recompile, dependency substitution or completed-target write is permitted.
The current root manifest differs only by the independently admitted historical
evidence exclusion; prove that TOML difference explicitly against the manifest
used by the recorded build. All other compiled dependency sources must match.

Copy every one of the candidate snapshot's 461 files (26,709,356 source bytes)
into a fresh independent source mirror at
target/properties/circle-support-reuse-corpus-source-v1. Do not use hard links,
symlinks, stub source files, disabled property persistence or reduced fixtures.
This mirror is a shared input for two sequential executions and stays open
until the entire attempt is closed. Each execution receives its own fresh
scratch/output directory under
/run/user/1000/csgrs-circle-support-reuse-corpus-v1. No completed output directory
is reopened. The second mode starts only if the first completes successfully,
the mirror is byte-identical and no extra mirror files were created.

Run the entire no-feature library and then the entire all-feature library with
the original --nocapture --test-threads=1 arguments. Preserve existing ignored
tests and diagnostic ignores. No extra filter or policy/environment weakening
is allowed. Verify terminal test summaries, zero failures/filtered cases,
property-persistence diagnostics, mirror integrity and input identity. Failed,
interrupted and unlaunched modes remain separately identified.

Use the frozen runner_v2 resource supervisor read-only, retaining all existing
guards: 1,800 wall seconds per command, 8 GiB child address space, 2 GiB host
available memory, 512 MiB repository free space, and 256 MiB filesystem/user
quota reserve for /dev/shm plus the 256 MiB /run/user/1000 reserve. Add an
8 MiB monitored fresh-output limit on the new runtime root. Limits can overshoot
between five-second observations; they are external containment, not internal
algorithm bounds. The source mirror has a separate 32 MiB planning allowance;
controls and committed evidence have a 2 MiB planning allowance. Before copying,
require all 34 MiB to fit above the unchanged repository reserve.

Record current inherited PROPTEST_* settings and require equality with the
original full-suite setup. RUST_BACKTRACE remains 0. These are functional runs,
not performance measurements. Never substitute a partial count for a terminal
suite pass. A library pass does not qualify Cargo's full target/feature matrix,
integration/doc/example/bench consumers, original native/report gates, bindings,
external packages or production cache admission. The full properties plan and
the separate large-build storage requirement remain open.
