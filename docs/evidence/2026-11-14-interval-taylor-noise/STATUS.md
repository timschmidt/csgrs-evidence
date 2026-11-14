# Qualified sensitivity-retained Taylor noise queries

Source: `2de9c0ae569a5e40fe97d8e4d179406834c677d3`, based on
`992ec0e9fe5b95d9abd551cc34e583ccf9d424e2`. Fifteen source paths; opt-in
`taylor-noise` in Hypersolve, forwarded by Hyperdynamics. The full plan stays active.

Hypersolve owns source-bound noise columns selected by a certified contribution
variation bound, with canonical ties and explicit retained-column capacity.
Original exact Taylor/affine sources and their coefficient associations stay
shared and authoritative. All omitted monomials have recorded indices and
per-output omission enclosures. Original residual coordinates retain their exact
weights through queries, including cancellation after affine duplication.
Independent bounded parameters are an enclosure construction, not stochastic
independence or replacement of the original function. DESIGN.md gives the
containment argument. The actual field example is also an integration test and
feeds its certified Cartesian result into another field-image operation.

Capacity can widen a query: the generated-source regression deliberately keeps
`[9,23]` with one retained column versus `[15,17]` with two. This explicit
correlation tradeoff is not an exact-image equality claim. Selection is not a
global derivative, an optimal ranking, or ODE noise propagation.

## Reproduced defects and retained adverse evidence

- Baseline missing API: E0432/101 (`missing-api.*`).
- Initial implementation: E0277/101 from missing explicit scalar-error mapping;
  corrected with `TaylorAffineError::Scalar` (`first-tests.*`, initial `noise.rs`).
- Review found original residual identity loss after affine duplication.
  The targeted regression failed with a nonzero interval instead of exact zero
  (`pre-residual-fix.rs`, `residual-regression.*`). The final implementation
  separately preserves the original residual basis and omitted monomial boxes.
- Initial broad validation runs were deliberately stopped with SIGTERM/143
  after that finding; they are not timeouts or final acceptance (`first-*`,
  `first-validation-interruption.json`). Complete new runs passed below.
- Initial external allocation probe had an unused_mut warning; the probe was
  corrected and rerun. Both versions/logs remain; no product fixture was changed.
- Integration first stopped before mutation because a diff hunk's function
  annotation changed from taylor-affine to taylor-noise. The complete actual
  difference is in `integration-metadata-difference.patch`. The corrected
  preflight ignores blob IDs and hunk metadata, still compares every pending
  added/deleted/context line, and proves exact reversal to the old index tree.
  No acceptance assertion or pending source content was weakened.

## Executed qualification

On both Rust 1.95.0 and stable 1.99.0, all eight commands passed: combined
Hypersolve/Hyperdynamics all-feature library and integration tests (1,637 tests
in 77 suites), doctests, all-feature/all-target strict Clippy, warnings-denied
docs, minimal new-feature all-target check, actual field example, ten release
owner tests and one release consumer test. See `*-validation.json` and raw logs.
The new cases include independent rational expectations, asymmetric domains,
nonzero centers, mixed powers, irrational exact coefficients, residual identity,
empty/unit distinctions, map validation before shortcuts, exact work boundaries,
cancellation and retry. Existing executable bodies are unchanged byte prefixes;
existing feature/dependency declarations and package metadata are unchanged.

Seven clean packages were built and verified, including their dependency chain
through Hypersolve and Hyperdynamics. A fresh consumer compiled, ran and passed
strict Clippy using only unpacked archives for those seven crates. Archive source
bytes and clean VCS commit were checked. Three fresh processes reconstructed the
proof from its source definition/request/maps/capacity and produced identical
selection, residual and bounds output. Four malformed source/map/query controls
failed without successful output, including an invalid source with a forged
certified flag. Derived noise proofs are not deserialized as authority.
Cargo's excluded-file and unused hypervoxel-overlay notices remain visible.
This is affected-seven qualification, not the full 21-crate release or publication.

Main-checkout formatting, budget, whitespace and focused owner/consumer results
are recorded in `main-validation.json`. These checks do not qualify the separate
41-path staged extraction. `INTEGRATION.json` proves preservation of its content;
Interface's eight pending paths and clean firmware remain unchanged.

## Completed-workload costs and limits

Common input is an existing original Taylor/affine certificate for
`[16*x*x+x, 16*x*x]` on `[-1,1]`. Every timed observation `[n,-n]` materializes
and checks exactly `[-n,n]`; destruction is included. Original Taylor graph
construction is excluded equally. "Cold" includes noise preparation/destruction,
not cold scalar caches. "Warm" reuses that noise model. Criterion used 30 samples,
1 s warmup, 2 s measurement per row, pinned CPU, no concurrent rustc at launch.
Clock scaling and unrelated host activity were not controlled.

| Mode | Queries | Mean 95% interval (microseconds) | Graph work | Native work | Allocation calls | Requested bytes |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Full affine model | 1 | 31.997–33.143 | 71 | 249260 | 337 | 7240 |
| Noise including preparation | 1 | 20.325–20.362 | 38 | 230916 | 226 | 4600 |
| Prepared noise | 1 | 4.593–4.598 | 13 | 121141 | 61 | 896 |
| Full affine model | 16 | 515.706–516.324 | 1136 | 4094124 | 5392 | 115840 |
| Noise including preparation | 16 | 94.512–94.668 | 233 | 2133431 | 1141 | 18040 |
| Prepared noise | 16 | 74.407–74.476 | 208 | 2023656 | 976 | 14336 |

Intervals above are the mean estimates from `timing-summary.json`; Criterion's
printed regression estimates in `benchmark.log` differ slightly. All 24 raw
Criterion JSON files remain. Work/allocation counts come from a separate repeated
probe with identical output checks. Requested bytes measure allocation traffic,
not peak or retained memory. The new representation adds buffers while retaining
the original shared source. No retained-memory, binary-size reduction, general
speedup, or unchanged cost for all owner workloads is claimed. This is an opt-in
extension, not a behavior-preserving refactor of existing paths.

Structural entry and graph/native work bounds remain distinct; exact Real payload,
refinement, in-scalar cancellation, caller clones, and total heap bytes are not
bounded by the column capacity. ODE fresh-noise propagation, global sensitivity,
cross-order preparation sharing, wider wrapping/adoption and competitive workload
portfolios remain open, as do unrelated migration, firmware/HIL and release gates.
No pushes or publication were performed. Prior forty frozen stages were verified
unchanged. External archive/ledger records establish the final frozen digest.
