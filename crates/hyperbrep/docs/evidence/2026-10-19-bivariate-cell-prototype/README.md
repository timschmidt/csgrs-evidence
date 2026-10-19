# Rational polynomial cell topology prototype

Hypersolve now constructs a complete zero-set graph for admitted rational bivariate equations in a closed rational rectangle. It retains the source equation, projection, complete event fibers, ordered branches and root-free connection strips. Subsequent rational slices use the same source. Interior loops, covertical critical points, isolated contacts, nodes, cusps, clipped boundary contacts and degree drops are represented without tracing from boundary seeds or rounding selected roots.

This advances the WP05a prerequisite for general HyperBRep surface intersections. The unchanged biquadratic plane-section probe still returns `UnsupportedIntersection` through the public BRep API, [reproduced on both baseline and final candidate](original-brep-blocker.json). Hypercurve implicit carriers, BRep spatial images and both pcurves, trim arrangements, multiplicity/material semantics and untrusted branch replay are still required. No work package or release gate is closed.

## Evidence

Ten shared regression recipes pass natively and in an actual zero-import WASM module. Two fresh native processes emit 29 byte-identical exact diagnostic graph records. The tests check analytic component/incidence expectations, source replay, independent Sturm slice counts, connection-strip exclusions, tiny-loop preservation, unsupported components, resource refusal and recovery. The graph encoding is a diagnostic record, not a BRep native archive format.

The final all-feature Hypersolve suite passes 985 tests and BRep/IO passes 729. Strict all-target Clippy passes for these owners; Hypersolve warning-denied documentation and workspace formatting pass. Three preserved external BRep workflows pass on freshly built baseline and candidate binaries. These are source-path consumers; installed packages and production bindings remain unqualified.

[Construction argument](construction-argument.md), [qualification summary](qualification-summary.json), [commands and exits](validation.json), and [artifact comparison](artifact-comparison.json) state the finite evidence. Mathematical reasoning and test results are not formal verification. Earlier failed attempts and original source patches remain in the raw record.

## Cost and open scope

Nine CPU-pinned processes retain three alternating baseline/candidate pairs for the three preserved BRep workflows and three absolute processes for all ten new topology recipes. Every recipe includes its original assertions; topology costs include proof inspection and complete exact diagnostic materialization. First and repeated fresh-input calls are separate. The matched timing ratios range from 0.957446 to 1.019787; 0 rows increase allocation traffic. Maximum process RSS is 22832 KiB. [Every raw sample and phase row](consumer-costs.json), including [adverse results](adverse-cost-samples.json), is retained. Requested Rust allocation traffic is distinct from live memory and excludes foreign allocator internals. These shared-host observations establish no general speedup or internal resource bound; the new capability has no successful-work baseline.

Across the finite corpus, the maxima are 2,404 diagnostic bytes, projection degree 11, six event fibers and four arcs. These maxima need not occur in the same record. [Exact payload metrics](graph-record-metrics.json) measure retained rational representations, not intermediate coefficient growth or execution complexity. Input degree, projection degree, fiber depth, connection refinement and shared work units have distinct controls; total work/heap/cancellation contracts remain open.

Vertical components, identically zero boundary restrictions and repeated generic fibers have typed blockers. General branch carriers, rational surface guards and correspondence, singular/common-component completion, full CAD modeling, release consumers and the full repository acceptance matrix remain in the development plan. This increment remains local; the earlier one-time push exception was consumed by `eaa0cae54`.

## Reproduction

Recreate base `495eb89cab1f66cea6e466c701a11297d0697f82`, apply [the qualified patch](qualified-source.patch.gz), and verify [source hashes](candidate-source.json). Remap recorded absolute consumer paths while keeping source recipes, locks and assertions. The raw bundle retains scripts, projects, all logs and patches, and both diagnostic output sets; compiled binaries are excluded and their hashes/sizes are recorded separately. No compatibility adapter or external production kernel was introduced.
