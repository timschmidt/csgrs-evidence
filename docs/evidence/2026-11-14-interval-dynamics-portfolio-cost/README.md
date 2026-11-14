# Existing regridded reachability in the completed dynamics portfolio

This increment strengthens Phase-13 completed-workload qualification. It changes
only the maintained Taylor-evolution benchmark, its required-feature list, and
the reachability acceptance corpus. No production source, public type, algorithm,
dispatch sequence, dependency definition or default policy changes. The full
fifteen-phase objective remains active. CONTRACT.md records the initial scope and
subsequent cap qualification; SOURCE.json and candidate-source/ identify the
retained revision. unchanged-runtime.json records the exact changed-path scope.

Current source inspection found that the existing reachability transport already
controls the dyadic growth exposed by ordinary Picard in the previous comparison.
It consumes one-step Picard prefixes, uses displacement-based candidate padding,
outwardly regrids endpoints and checks exact inclusion before continuation. The
new work reuses that authority rather than implementing another controller.
This comparison includes both proposal and transport differences; it is not an
ablation attributing every improvement exclusively to rounding.

## Acceptance and qualification

The maintained benchmark previously had no reachability comparison (the baseline
search is retained in missing-comparator.log). The new hard-case test preserves
ordinary Picard's actual default scalar-size exhaustion on x'=x, x(0)=1, horizon
1/2, step cap 2^-12. It separately establishes that existing reachability completes
all 2,048 prefixes under default resources, with one initial cell and one evolution
attempt. Every native endpoint is included in the carried box, every carry is on
the policy grid and feeds the next exact initial box, and the final time and cover
width are checked. An independent positive rational series and geometric tail
bracket exp(1/2). Default and larger-budget endpoints and spent work agree. Under
the Taylor feature, this output feeds a subsequent Taylor evolution to 3/4 and an
independent bracket for exp(3/4).

A finite default-budget cap probe rejects 2^-8, 2^-9 and 2^-10 for the same width
requirement, and completes at 2^-11 and 2^-12. Failed probes retain completed
native evolution but do not claim an accurate cover. A second maintained test
preserves the failed 512-segment control and successful 1,024-segment case. The
benchmark therefore uses the coarsest successful cap among these probes, 2^-11;
the original 2,048-step default-resource regression remains intact. This is not
a globally optimal cap or an automatic portfolio-selection implementation.

Final isolated checks pass 106 Hyperdynamics tests across 14 test/doc groups and
11 minimal-reachability tests, without failures, ignored or filtered tests.
Strict all-feature/all-target Clippy, warning-denied docs, disabled-feature check,
WASM and formatting pass. The initial Clippy finding was an assign-op pattern in
the new test; it was fixed without changing assertions. The first copied cap
probe included unused helper code; the final probe contains only executed helpers
and runs without those warnings. Original logs and draft remain. No existing
reachability assertion was changed; the entire previous test file is a preserved
prefix. Nine existing benchmark helpers, including source construction, native/
Taylor execution and independent validation, are byte-for-byte unchanged.

## Completed comparison and allocation evidence

The exponential case retains x'=x, x(0)=1, horizon 1/2 and width <=1/512, with an
independent rational bracket for exp(1/2). Ordinary Picard uses 2,048 segments;
reachability uses 1,024 prefixes; Taylor uses two segments. Every method reaches
the same horizon and satisfies the same endpoint-quality gate. Reachability also
retains its explicit single-box epsilon-cover certificate. Boxes are sound outer
enclosures, not claimed equal or exact reachable sets.

The constant case retains x'=2, x(0)=0 and horizon 1/2, with exact singleton-one
output. All three strategies use two segments/four native attempts. This retains
the simpler method's advantage when extra machinery is unnecessary. No original
benchmark case or quality assertion was weakened or removed. Reachability is
restricted to one cell/evolution and zero partition/time-refinement search, so
its completion cannot conceal a different cover workload.

The same benchmark envelope applies to every strategy: precision -64,
1,048,576-bit scalar stage limit, 10^14 native work units and default graph limits.
Ordinary Picard needs the larger envelope on the exponential fixture. The default
resource completion of reachability is qualified separately by tests and probes.
Original source preparation is outside query timing. Full report construction,
all native attempts and proofs, required output and destruction are included;
Taylor preparation is measured separately. These are strategies in one backend,
not competitive external solver results or a universal speedup claim.

The allocation observer's operation/validation body and core versions/features
match the maintained benchmark, including num-bigint 0.4.6. Eight warmups and 32
construction/drop epochs give the following results. Every epoch returns to zero
incremental live heap:

| Case | Strategy | Allocations | Allocated bytes | Retained bytes | Peak bytes |
| --- | --- | ---: | ---: | ---: | ---: |
| Exponential | Ordinary Picard | 370661 | 493194344 | 123685072 | 123732912 |
| Exponential | Reachability | 220133 | 9894080 | 5200760 | 5200768 |
| Exponential | Taylor | 2338 | 80132 | 22224 | 26256 |
| Exponential | Taylor preparation | 213 | 30296 | 9520 | 10320 |
| Constant | Ordinary Picard | 281 | 10740 | 4552 | 5792 |
| Constant | Reachability | 345 | 20180 | 13640 | 13648 |
| Constant | Taylor | 1094 | 56052 | 18160 | 21408 |
| Constant | Taylor preparation | 78 | 18592 | 7600 | 8400 |

Exponential graph/native work is 190467/18178689623999 for ordinary Picard,
107526/126125643 for reachability and 1420/3088363 for Taylor. Constant work is
185/140496, 212/140878 and 1130/1605906 respectively. Reachability has one cell,
one evolution and one final cover box, with 2,048/4 native attempts in the two
cases. The six previous warm allocation, retained and work observations exactly
match their archived rows (previous-cost-observations.json). This does not assert
cross-revision timing or arbitrary-platform invariance.

Preexisting source/prepared-coefficient storage and stack are outside query heap
epochs. Warm zero live bytes do not prove zero cold-cache growth or a whole-heap
bound. Zero native Taylor-preparation work excludes exact Real arithmetic.
Existing scalar payload, refinement/predicate, vector-capacity and within-scalar
cancellation exclusions remain. Existing reachability accounting is not promoted
into a bound on all live nested proof graphs. The tests qualify these concrete
completed workloads and resource envelopes, not universal computational closure.

## Final integration and timing

Source commit `2fa15af0fc55a1183a34fe158ec10bdcd7bc402e` is integrated on `5521843d6b9b0eba7cdc3548e5347ba3c77b504c`. Alternate-index application and reversal recover the complete original pending tree exactly. The 41 extraction paths remain staged with SHA-256 `676e5d602a1fbdcc3fc7ff0d15bfb62692ef03f69a5a62f957aa7c7b6697b359`. Interface's eight edits and Firmware's clean state are unchanged. Main's combined pending extraction passes 117 Hyperdynamics tests, 11 minimal-feature reachability tests, strict Hyperdynamics Clippy, formatting and repository budget. Commands/outcomes are in main-validation.json; no push occurred.

Three maintained Criterion trials each complete eight workloads on CPU 0 with ASLR disabled, one-second warmup, two-second requested measurement and 30 samples, after builds/tests completed. Criterion can extend the requested duration for slow completed workloads. Independent exact-flow and width checks pass. Median microsecond ranges:

| Workload | Minimum trial median | Maximum trial median |
| --- | ---: | ---: |
| constant/picard | 30.888 | 31.353 |
| constant/prepare_taylor3 | 10.644 | 10.857 |
| constant/reachability | 40.856 | 41.736 |
| constant/taylor | 127.156 | 127.715 |
| exponential/picard | 113788.458 | 120606.745 |
| exponential/prepare_taylor3 | 22.111 | 23.125 |
| exponential/reachability | 23520.364 | 23565.227 |
| exponential/taylor | 253.977 | 254.515 |

These measurements compare complete strategies and include the explicit extra cover evidence for reachability. The exponential fixture continues to favor Taylor; ordinary Picard remains preferable on the measured constant flow. The existing regridded strategy provides a materially stronger native comparison than ordinary unrounded continuation. No universal speedup, isolated rounding-effect claim, automatic selector or external solver qualification is implied. All samples, estimates and artifact hashes remain archived.

All 30 prior frozen stages verify unchanged. This stage freezes at archival; subsequent committed-blob, registry and final frozen-stage checks live outside it. Phase 11 timing regressions, remaining migrations, automatic order/frame control, wider consumer adoption, external competitive qualification, embedded work and coordinated release remain open.
