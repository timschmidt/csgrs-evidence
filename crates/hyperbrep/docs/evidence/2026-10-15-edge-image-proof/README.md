# Complete native edge-image proofs

This increment repairs six reproduced false-positive image checks and adds
`ModelBuilder::validate_edge_image` for validating candidate pcurves before
constructing faces. It changes only BREP implementation, tests, benchmarks,
documentation and its property-ledger entry. Surrounding crates remain under
concurrent upstream ownership. The baseline is `3e8b07825`, incorporating
upstream `362e157c1`; [contract.md](contract.md) records ownership, domain,
properties, research and the missing acceptance controls before implementation.

## Failure and repair

The old cylindrical, spherical and conical circle checks compared a center
and one tangent while skipping generic endpoint agreement. For each family,
both a reversed radial phase and a tilted circle plane incorrectly passed.
Independent exact point comparisons establish the mismatch. These are direct
image-dispatch false positives; this experiment does not claim that complete
solid publication admitted those six fixtures. The two baseline attempts and
their complete source controls remain in [attempts.json](attempts.json),
[the first log](baseline-image-control-1.log) and
[the six-control log](baseline-image-control-2.log).

The repaired iso-circle check validates centers, radii, signed angular span
and both vectors of an exact radial/tangent frame. For a circle parameterized
at unit signed angular rate, those data determine every point over the trim
interval. Cylinder, sphere latitude/meridian, cone and torus circles share this
proof. Endpoint correspondence is still checked independently by the existing
image dispatcher.

The first candidate reused the prior direct-domain frame comparison. It fixed
the six false proofs but made two unchanged STEP circle cases undecided in
debug, release and minimal-feature suites; the WASM consumer also trapped.
It is rejected. [candidate-v1.patch](candidate-v1.patch), its new-file snapshot
and every failed check are retained. The final comparison uses the common
edge-domain start as its frame origin, avoiding unnecessary doubled inverse
angles on reversed source circles. The previous direct-domain comparison
remains an alternate exact proof when the first comparison is unresolved.
Neither path uses an approximate policy or changes a fixture.

## Public API and authority

`ModelBuilder::validate_edge_image(&edge, direction, &pcurve, correspondence,
&surface)` takes construction keys scoped to that builder. It invokes the
same strict complete-image dispatcher as face construction. It does not add
an edge use, alter incidence, or install an inherited certificate. The checked
pcurve and surface are ordinary staged native geometry. A later face still
validates its own selected uses.

`Ok(())` certifies the candidate's image and directed parameter correspondence
over the edge trim. It is not a wire/face/shell certificate or a fidelity claim
about another source. Foreign ownership, invalid correspondence, unsupported
tuples and unresolved predicates retain their distinct typed errors. Ambient
approximate evaluation cannot authorize an approximate answer here. Precision
and existing instrumented solver work are not a whole-query work/heap bound.

The API enables the next supplied STEP pcurve mapping without copying image
formulas into IO. Curved `SURFACE_CURVE`/`SEAM_CURVE` import, source-map selection
and basis-aware unit conversion still require their own implementation and
acceptance evidence. No such STEP capability is credited by this increment.

## Final-source checks

All twelve final qualification commands pass. Source hashes, commands, feature
sets, timeouts, every attempt and the final selection are recorded in the
[manifest](manifest.json); [qualify.py](qualify.py) reruns the scoped campaign.

| Check | Result |
| --- | --- |
| BREP/IO all features | 407 tests pass in debug and 407 in release |
| BREP/IO minimal features | 399 tests pass in release |
| Public circle matrix | Seven iso families × 16 trim/frame/direction combinations; 112 cases checked twice and evaluated independently at five parameters |
| Failure controls | Wrong radial phase/plane, radius, angular rate and sense; foreign keys; unsupported tuple; unresolved proof across strict/approximate/strict scopes |
| Ownership | Successes and failures leave staged incidence unchanged; existing publication and traversal checks pass |
| Native downstream paths | Existing STEP import, exact source maps, splitting, reflection, archive replay, BodySet/empty composition and near-coincidence fixtures pass unchanged |
| WASM | 13 groups execute in zero-import Wasmtime 38.0.0: five new query groups plus all eight previous STEP groups |
| Quality checks | Warning-denied all-feature/minimal Clippy and rustdoc; circular STEP example; fuzz-target compilation; workspace formatting |

Counts overlap across configurations. Sampled evaluation checks the fixture
oracle; it is not the mathematical whole-interval proof. The original false
proofs are deterministic unit regressions in the production dispatcher.
No runtime fuzz/ASan/lexicase, coverage, formal-verification or actual binding
campaign is claimed. WASM uses local source paths and does not establish a
published package, minimum compiler or JavaScript/C/Python delivery path.

## Cost observations

[baseline-binaries.json](baseline-binaries.json) freezes the baseline built
before this increment. Its exact source and build evidence are retained in the
preceding integration. [benchmark.py](benchmark.py) uses the same features and
build configuration for three alternating CPU-0 pairs over all six preserved
BREP/STEP/arc corpora. Required receipts and fixture facts include the existing
materialized-output and validation work. No successful workload is replaced
by a faster error. The new query has separate absolute measurements in
[new-query-costs/summary.json](new-query-costs/summary.json), with construction,
reuse and invalid-correspondence outcomes identified separately.

All 100 preserved cases retain their required receipts across 36 processes.
Candidate/baseline per-case median timing ratios are summarized below:

| Corpus | Cases | Median ratio | Maximum ratio |
| --- | ---: | ---: | ---: |
| Advanced STEP | 6 | 0.996656 | 1.022109 |
| Faceted STEP | 7 | 1.006795 | 1.059451 |
| Native BREP | 64 | 0.965312 | 1.047286 |
| Default 256-arc | 12 | 1.007697 | 1.111463 |
| Closed edges | 5 | 0.980285 | 0.996184 |
| Circular STEP | 6 | 0.998881 | 1.002757 |

The adverse arc observation is `arc_structural_facts_replay`, measuring 6.68385
versus 7.42885 ns per query. The arc baseline and candidate executables have
identical SHA-256 hashes. This control exceeds 10% on the shared host and is
retained; it does not identify an implementation change causing that difference.
No replacement repeat or general performance claim is used to dismiss it.

Advanced/faceted STEP allocation counts and requested bytes match. Closed-edge
construction and replay request fewer allocations, while reversed shifted replay
increases from 1,718 to 1,741 calls and 218,925 to 219,589 bytes per completion.
Fresh circular import increases about 21 calls and 2,294 bytes; its reused-source
case increases 21 calls and 2,296 bytes. The full circular edit/replay/composition
case decreases from 52,617.88 to 51,698.16 calls and from 4,674,464.28 to
4,613,297.88 requested bytes. All rows, including the small increases, remain
in the manifest. The changed benchmark executables shrink about 35–49 KiB;
the unchanged arc executable has identical size and bytes.

The new query's three-process medians are 37.50 microseconds with fresh cylinder
construction and 18.22 microseconds with reused staged input. They request
110/61 allocation calls and 9,592/3,656 bytes respectively. The separately
labeled wrong-radius rejection costs 15.18 microseconds, 61 calls and 3,656
requested bytes. These operations return a strict image-check result; they do
not build a complete model. Fresh/reused costs have different construction
boundaries and are not an optimization comparison.

The final manifest records every timing, allocation, executable size and process
resource observation. These shared-host observations do not establish a general
speedup or an internal resource bound. Earlier archive-admission and short
cached-arc timing exceptions retain their original scope.

The [audit](audit.json) checks final source identity, owned change scope, JSON,
local documentation links and formatting. Raw failed logs and patch context
retain their original whitespace; they are not rewritten to pass a code-format
check. All 28 work packages remain open. No complete pre-push campaign or push
is performed.
