# R04 mixed native/sampled profile admission, 2026-10-25

Owner and acceptance contract are in contract.txt. All eight expanded public fixtures fail on the baseline and pass on the candidate. The final 30 selected checks pass, with 158 Rust tests, C/C++/Python consumers and the generated JavaScript/TypeScript WASM suite. Fourteen already-ignored curve frontier tests remain open. No push or complete pre-push/release matrix was run.

## Reproduction

Start from CSGRS 3cca6a894858c8b98497a3cfe81cff5e17e1a7f2. Apply baseline-source.patch (the retained R01 change in src/curve/native.rs) for the matched baseline. For the R04 candidate additionally apply implementation.patch. Copy acceptance/mixed_modeling_profiles.rs to tests/mixed_modeling_profiles.rs and run:

    cargo test --locked --release --no-default-features --features curve --test mixed_modeling_profiles

For the focused paired probe copy mixed_profile_probe.rs to examples/research_mixed_profile_probe.rs, then use the build command in the corresponding *-build.json. Copy each resulting executable to the path consumed by paired_probe.py, which records every command, timeout and outcome in paired-journal.jsonl. Exact geometry rows, receipts and all timing/allocation samples are retained, including unfavorable results. The executable hashes are in paired-manifest.json; compiled binaries are not redistributed.

The matched baseline includes R01 and the candidate adds R04. The *-source.patch files capture each actual build's tracked source state; the probe is retained separately. final-root.patch also retains the other in-progress R01/R25 changes for the final check state, and prior-untracked-inputs retains R25's two added scripts. implementation.patch isolates only the four R04 production/test-module files from the R01 baseline. The only code edit after the paired measurement was a Clippy fix in a test, replacing a one-element cloned slice with from_ref; final checks run after it. This does not change production geometry. The archive includes the initial failed lint log and successful final run.

The driver records operation-only time, requested allocation/reallocation bytes, calls and live peak growth. Input construction precedes measurement; independent validation, exact JSON materialization and destruction follow it. Five samples reuse each source: the first is cold and four are warm. Three alternating baseline/candidate process pairs cover nine profiles and five operations. The 1,350 rows are a focused shared-host probe, not a speed claim. Fifteen controls have byte-identical exact outputs; all ten linear controls also preserve per-sample allocation calls/bytes. Mixed sqrt(2) revolution costs more (1.61 to 3.81 ms, approximately 2.07 to 4.80 MB requested allocation). Typed baseline failures are not faster successful operations. Native probe section sizes are not production/WASM attribution.

## Evidence and limits

The public matrix executes 220 modeling operations over exact rational/algebraic/tiny/translated members, holes, reversed loops/component order, shared native curve endpoints and zero twist/unit scale. Area and volume are independently derived for the straight components. A curved enclosure retains an exact 2^-80 wall through four cut/restore generations after source drop and through empty feedback. Two additional kernel fixtures check cubic endpoints and qualified closure replay. The numerical certificate describes the sampled mesh; it does not establish equality to the continuous source curve. Nonlinear interiors and endpoints lacking native coordinates remain explicitly sampled/projected, using existing finite sampling code. There is no new work/memory/cancellation guarantee.

validation-final/checks.jsonl is the final command/outcome ledger; validation/ retains the initial lint attempt. Development logs and baseline failures are kept separately. uncertain_line_fit.rs investigated a possible line-fit fallback regression: public region construction already returns a typed blocker before either sampling path is reached. Its diagnostic executable unwraps that error and exits 101; this is not a production panic or a reproduced sampling regression, and no fallback change was retained.

The R02 and R03 hard gates were reproduced in the preceding archive record; R04 does not close them. Per-curve correspondence and broader cold archive guarantees remain separate R24/R19 work. Historical archive records and main are unchanged; this record is an additive local retention step.
