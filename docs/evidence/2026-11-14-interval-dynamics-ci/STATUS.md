# Hyperdynamics continuous qualification

Retained source `c633925421f6924d8aa3be9433000eec2cce80f3`, based on
`3adf184821fb00cfc2674d216de6ccb81f4aa482`, adds a dedicated Hyperdynamics
workflow and corrects the workspace workflow's ownership comment. No Rust source,
manifest, lockfile, fixture or mathematical policy changed. Phase14 remains open.

The baseline has no Hyperdynamics workflow or workspace test entry. Its actual
no-feature test command completed16 suite invocations with zero tests, confirming
that default workspace checking cannot exercise the feature-gated implementation.
The new job checks Rust1.95.0 and stable1.99.0 independently. Push/PR triggers cover
all seven local dependency packages, root Cargo files and .cargo configuration;
merge groups are included. Actions use existing pinned commits, read-only
permissions and disabled persisted checkout credentials. cargo-hack is pinned0.6.46.

All nine validation steps per toolchain passed locally. The runner reads exact
shell bodies from YAML, and qualification checks those recorded commands against
the final workflow. Each toolchain passed18 feature configurations covering all16
manifest feature keys, all target compilation,128 debug tests across14 integration
suites,29 Criterion test-mode cases, and the same128 release tests. No-feature
and doc-test commands passed but each executes zero tests; they are not counted
as behavioral coverage. All six examples compile as test targets; their main
functions were not run by this workflow. Strict Clippy passed at no-feature and
all-feature boundaries. The existing coordinate-change fuzz target compiled and
passed strict Clippy; no sanitizer campaign or new fuzz coverage is claimed.
Warnings-denied all-feature documentation passed on both compilers.

The exact minimum-compiler cargo-hack installation also passed. Existing toolchain
components were reused; hosted runner provisioning and cache actions were not
executed locally. Local runs used four build jobs, separate target directories,
no terminal color and the existing offline registry cache. Test timings are
qualification observations, not a performance comparison.

The final workflow additionally triggers on .cargo changes. This trigger-only
edit occurred during qualification and did not alter any validation command;
the final command sequence is checked byte-for-byte. Final workflow parsing,
trigger/dependency assertions and Zizmor were rerun after that edit.
Zizmor1.32.0 --pedantic --strict-collection reports no findings repository-wide.
Its default offline mode leaves network-dependent audits unavailable, as retained
in the raw log. No security setting or finding was suppressed.

Integration preserves main's41 staged extraction paths with identical patch SHA
6ee02af8332cd2595155df98085a8877ce22705bda865760bb6d3a73d8b9dd61.
Interface's8 pending files and firmware are unchanged. Main workflow shell syntax,
Zizmor, formatting, repository budget and diff checks passed after integration.
All39 earlier frozen evidence stages are unchanged.

Hosted GitHub Actions execution, other operating systems, runtime example mains,
coverage instrumentation, sanitizer campaigns, broader downstream/full-workflow
pre-push checks and the remaining plan acceptance gates are not established by
this record. The local matrix qualifies the retained source excluding the
unaccepted extraction. No push or publication was performed. No phase or full
plan completion is claimed.
