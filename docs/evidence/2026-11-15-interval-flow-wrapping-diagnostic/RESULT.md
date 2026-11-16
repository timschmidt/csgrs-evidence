# Retained result

Implementation e139885a6e44b553a031fd114ff0615c0c1d4c52 adds the full continuous two-rate point/box noise-chain
witness and shared rational exponential oracle, plus the comparison report.
Every endpoint and continuous segment in each 16-step chain passes independent
rational bounds. Entire tube widths remain <=1; stricter final lane width limits
are (2^-29,2^-17) for the point case and (2^-9,2^-11) for the box. Original
nonzero residuals, fresh residual inputs and shared source/proof identities are
checked. No production mathematical kernel or default feature changes.

The clone scheduling candidate is rejected/restored. All 448 exact coefficient,
resource and both-policy receipt/trace records match, as do 36 original wrapping
records excluding timing. One 200-byte allocation per coefficient construction
is avoided, but derive and affected consumers grow by 48 .text bytes. Raw file
sizes also regress. No gate is weakened. All 42 baseline release binaries are
restored byte-identically, with collision-free source-path artifact keys.
Whole-process instruction count decreases 465881247 -> 464748970; this does not
establish a runtime improvement or satisfy the failed size gate.

Validation: 1,676 owner/downstream tests and doctests in 84 suites, no failures or
ignored cases; strict Clippy for both owners/all features/all targets; whole-
workspace format check; flow-noise-only (13), adaptive-only (8), and composed-
noise feature witnesses. See exact command logs and check-summary.json.
Main 41 staged and Interface 8 pending paths are unchanged at collection; all
78 prior frozen stages verify. Full-plan work, automatic noise orchestration,
global sensitivity and broader release/HIL qualification remain open. No push
or publication. The previous turn and this turn are progress, not completion.
