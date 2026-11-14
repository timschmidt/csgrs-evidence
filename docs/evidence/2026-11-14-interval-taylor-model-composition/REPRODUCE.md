# Reproduction

This record is immutable after archival. Copy drivers and fixtures to a new mutable
stage, update their absolute stage/worktree/build paths, and review their assertions
before running. Never execute a writer from the frozen directory. Integration and
commit drivers document a completed transition and are not idempotent rerun tools.

Source baseline is `2dc26594e60318882dcfe569cce51cb1fb35deac`; measured production
source is `55fe5251be50c341bcf70abcfc550de7a83a76a4`; final source is
`fde51f4dd49735ae324788befebda526eefab261`, adding only the shifted-center test.
`SOURCE.json` records the aggregate patch. Create isolated worktrees at these
revisions; retain the main checkout's separate extraction patch unchanged.

Use Rust 1.95.0 and the locked workspace dependencies. `qualify.py` records full
owner/downstream tests, strict all-target Clippy, docs with warnings denied,
minimal and disabled features, WASM and formatting. Run the final owner focus with:

```sh
cargo +1.95.0 test --locked -p hypersolve --all-features --test program_taylor_composition --test program_taylor_polynomial
cargo +1.95.0 test --locked -p hypersolve --no-default-features --features taylor-composition --test program_taylor_composition
cargo +1.95.0 clippy --locked -p hypersolve --all-features --all-targets -- -D warnings
```

`validate-main.py` records combined extraction checks, including explicit downstream
feature `hypersolve/taylor-composition`. `final-validation.py` records the final
test-only follow-up. Full test run counts refer to their recorded source stage;
final focused checks include subsequent acceptance additions.

For cost reproduction, copy `build-control.py`, `build-new-cost.py`,
`run-new-timing.py`, `time-controls.py`, `feature-cost.py` and their referenced
fixtures together. Read each driver's paths and baseline assertions first. Use
separate target directories for baseline, candidate and observer builds. The
maintained bench is `crates/hypersolve/benches/taylor_composition.rs` with feature
`taylor-composition`. Preserve all assertions, policies, domains, widths and budgets.

Measure only after builds/tests have stopped. Recorded runs pin CPU 0 and disable
ASLR, use one-second warmup, two-second measurement and thirty samples. Three new
trials measure all eight cases; four existing-control sweeps use ABBA order.
Preparation is separate from reuse; include full output/evidence construction and
destruction. The observer copies the benchmark body and requires matching dependency
versions. Inspect allocation epochs, after-drop zero and resource counters as well
as timings. Preserve unfavorable samples and diagnostic failures.

`inspect-controls.py` and associated artifact files attribute changed allocated
bytes using ELF relocations, and `summarize.py` checks sized-function unions.
Load parser helpers into a separate namespace. Comparison is against the same
completed contract, not an unvalidated endpoint estimate. Optional composition
adds an observed eight bytes per old raw-map stage; prepared reuse retains more
proof memory. These fixtures establish neither cold-call speedups nor universal
resource bounds. See STATUS.md for exclusions and open plan work.

`final-test-integration.py` records alternate-index aggregate application, exact
reversal and preservation of the original 41 staged extraction paths. It contains
one-time commit/update-ref operations: inspect its evidence rather than rerunning it
against an already integrated checkout. No push or release qualification is claimed.
