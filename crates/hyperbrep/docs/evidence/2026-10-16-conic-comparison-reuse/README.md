# Per-call periodic conic comparison reuse

The baseline is `f2039ae4e`, qualified against upstream `73472622d`. Only `geometry::angular_parameter_lifts` changes in production. The [contract](contract.md) defines the same exact conic domain, strict authority, full-period endpoint identities and typed failures. Certified interval orderings are reused within one call; a newly lifted value is compared again. No persistent cache is added.

Retained after the complete preserved correctness and cost campaign. The helper reuses strict decided orderings for the same immutable value/domain and changes no accepted geometry, endpoint identity or deterministic output contract. Both partial pcurve cases remove 656 allocation calls and 45,904 requested bytes per operation; their observed full-campaign time ratios are 0.971130 and 0.977347. All 159 cases preserve their receipts and no case-median time ratio exceeds 1.035024. The two similarity matrices with increased allocation observations remain visible; each increase is less than 0.075% of its corresponding baseline. Native harness growth of up to 1,208 bytes and WASM growth of 275 bytes are retained as adverse size observations. These shared-host samples justify this limited local reuse; they do not establish a general speedup, universal allocation reduction or closure of earlier performance, resource, correctness or release gates.

BREP/IO debug and release each pass 496 all-feature tests; minimal release passes 488, with no ignored cases. Both warning-denied all-target Clippy configurations, rustdoc, six examples, eleven optional OCCT reader checks, fuzz-target compilation and 71 zero-import source-path WASM groups pass. The earlier focused conic/oblique and STEP circle/pcurve regressions pass 3 and 13 tests. Independent exact expectations and the original full-size fixtures are unchanged. All fifteen preceding continuation diagnostics succeed; the nine-fixture frontier records 56 native results, 7 undecided, 6 unsupported and 12 unavailable dependent steps, separately from semantic admission. All 22 previous STEP artifacts remain byte-identical. Both targeted scalar zero-factor reproductions still fail with FACTORS > 0; they remain failed gates, not pre-push exemptions.

The full 90-process campaign preserves all receipts across 159 cases and fifteen corpora. Maximum case-median candidate/baseline latency is 1.035024; 0 rows exceed 10%, and 33 rows change allocation observations, including 2 with increased calls or requested bytes. All raw samples, allocation requests, process resources, executable sizes and adverse rows are retained. The six-case focused probe is preserved separately. Shared-host observations do not establish a controlled-host speedup, total-resource bound or closure of prior cost gates. Native harness size changes range from 0 to 1208 bytes; the WASM probe grows 275 bytes. These are harness sizes, not shipped-package measurements.

Full-campaign pcurve observations per iteration:

| Case | Median time ratio | Calls before → after | Requested bytes before → after |
| --- | ---: | ---: | ---: |
| `pcurves/full_fresh` | 0.981064 | 3,542.0 → 3,354.0 | 444,493.0 → 430,933.0 |
| `pcurves/full_reused` | 0.982889 | 3,485.0 → 3,297.0 | 323,089.0 → 309,529.0 |
| `pcurves/partial_fresh` | 0.971130 | 11,634.0 → 10,978.0 | 1,080,321.0 → 1,034,417.0 |
| `pcurves/partial_reused` | 0.977347 | 11,577.0 → 10,921.0 | 958,917.0 → 913,013.0 |
| `pcurves/edit_replay_composition` | 0.991581 | 14,611.0 → 14,423.0 | 1,964,675.0 → 1,951,115.0 |
| `pcurves/reject_nonmaster_height` | 0.948991 | 742.0 → 660.0 | 171,900.0 → 165,948.0 |

No case has a median time more than 10% above baseline in this campaign. Prior cost gates remain open.

Observed allocation increases are retained separately from the pcurve reductions:

| Case | Calls before → after | Requested bytes before → after |
| --- | ---: | ---: |
| `analytic_similarity/similarity/primitive_matrix` | 2,647,253.0 → 2,648,868.0 | 209,903,801.0 → 210,003,137.0 |
| `analytic_similarity/similarity/clipped_void_matrix` | 7,356,861.0 → 7,362,304.0 | 519,115,139.0 → 519,496,547.0 |

These are process observations, not a universal allocation reduction claim.

The initial [focused probe](focused-v1/pcurves-costs.json) retains all six original pcurve cases and their receipts; it does not substitute for the full campaign. The [configuration comparison](configuration-comparison.json) records matching compiler versions, build settings and dependency features. The [complete frontier](continuation-frontier.json) keeps every original cutter, rotation, typed blocker and unavailable dependent step. Body counts and replay remain diagnostic observations, separate from the independent exact acceptance tests.

Every [attempt](attempts.json) retains its source identity and outcome, including the inherited failed scalar gates. The [manifest](manifest.json), [source reconstruction](source-reconstruction.json), [source overlays](source-overlays.tar.gz) and [audit](audit.json) bind the record to the measured implementation.

No public API, archive schema or deterministic artifact migration.

Only the BREP periodic conic helper changes in production. No persistent cache, dependency implementation, public API, archive schema, predicate policy or input domain changes. All 28 work packages remain open. General oblique closure, curved-shell embedding, cone/torus STEP, operation-wide provenance/certainty and internal work/heap/cancellation contracts remain open. The stronger diagonal-cone diagnostics inherited from upstream are not promoted to semantic admission here. WASM uses workspace paths. Package/MSRV, actual C/Python/JS consumers, coverage, machine-checked proofs, runtime fuzz/ASan, lexicase and full-workspace/pre-push gates remain open. No push was performed.
