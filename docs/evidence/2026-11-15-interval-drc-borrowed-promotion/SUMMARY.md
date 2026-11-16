# Borrowed quadratic promotion: rejected

On source parent `54e6337fe42ea4ac92f5585cde27349e1f7ad79c`, the candidate
added borrowed rational-quadratic promotion, forwarded owned promotion to it,
and removed an intermediate quadratic clone during native arc preparation.
It retained the constructor, predicate order and conic-provenance attachment.
The production patch, final three source files and acceptance witness are retained.
No production change is integrated; the isolated checkout is restored clean.

The decisive workload is `arc_large_sparse_path_intersection_256_arcs` in the
unchanged complete arc executable. Six balanced pairs first showed a candidate
slowdown in five pairs. A further 20 pairs, with ten of each order shuffled using
seed 20261115 and all runs pinned to CPU 2, showed a slowdown in 19 pairs:
median paired ratio 1.0170898908727681, mean paired ratio 1.0174315890365915.
Two recorded warmups precede each series. All non-timing output matches.
The complete arc CPU mean was about 1.3% lower in both series, but that aggregate
and the smaller binaries do not satisfy the owning-workload no-regression gate.
No instruction-level or layout cause is established, and no layout/inline tuning
is attempted. The initial overall arc slowdown and cached-decomposition concern
did not reproduce in the larger series; neither is used as the rejection reason.

## Completed finite validation

- Workspace formatting and owner all-target/all-feature Clippy with `-D warnings`.
- Full release Hypercurve all-feature tests: 3263 passed, zero failed, 37 ignored,
  across 128 unit, integration and documentation suites.
- Both-policy promotion values, homogeneous coordinates, endpoints, retained
  provenance identity and full dispatch/rational-count witness; arc tests.
- Rust 1.95 no-default promotion and arc checks; native and WASM builds.
- Strict and approximate dispatch corpus transcripts identical, without masking.
- Full fixed-input DRC reports identical, including finding IDs. An earlier
  path-dependent report mismatch is retained with its diagnosis and corrected
  fixed-path control; checksums/report agreement alone are not geometry proof.
- All 20 downstream successive-operation tests, including the long ignored tests,
  pass. Paired attributed successive binaries and source/build metadata exist.

The source-binding review confirms the final tracked patch matches native build
and validation records; all three source files match the attributed successive
manifest. The original-path baseline left an unused test source file on disk
without a module declaration. The separate paired boundary baseline was clean.

## Cost and resource evidence

The initial owner portfolio ran all 25 executables for both labels at their
unchanged defaults: 48 successful exits and two actual 900-second external
measurement timeouts, both for editing. Partial output is kept separate from
completed-workload comparisons. These are not geometry failures or evidence of
full editing completion. Prepared 14400-second retries were not run after the
candidate failed a completed benchmark gate. Full successive runtime comparisons
and further comparative timing repetitions were also not run after rejection.
Their absence is not waived or represented as successful qualification.

All 74 comparative cases preserve checksums; five adaptive iteration counts differ
and remain recorded. The native pathological 100 MB pair reports 268 decided
Boolean outcomes, zero blockers, and matching counts/checksums under STRICT.
Its flattened comparison is separate. Reported build RSS deltas are 86.6 versus
86.7 MiB; that rounded observation is retained, not masked or claimed equivalent.

Native CLI and all 25 owner benchmark artifacts show no file/text/named-text growth.
The paired WASM artifact is 101 bytes smaller. The attributed successive executable
is 11360 bytes smaller, with 20080 fewer text-section bytes. These size results do
not establish runtime nonregression. Large symbol maps are losslessly compressed;
original and compressed hashes plus round-trip verification are retained.

All six original/candidate KiCad smoke timings still fail the unchanged 120-worker-
second gate. Baseline mean is 127.6513528107 seconds; candidate mean is
128.1120260313 seconds. No DRC speedup or release qualification is claimed.

The initial portfolio, six-pair arc series and 20-pair arc series are terminal.
`retry_owner_benchmarks.py` and `run_successive.py` are prepared but unexecuted;
`build_successive.py` is an earlier superseded unexecuted helper. Queue replacements
only stopped verified idle wrappers, never a measured execution. Source observations
about owned storage are unproved follow-up notes, not an alternative implementation.
The candidate is rejected: do not run these prepared acceptance steps against this
frozen evidence record.

The protected 41 staged CSGRS paths and eight pending Interface paths are preserved;
firmware remains clean. The full interval plan and original release/resource/HIL
obligations remain open. No push or publication occurs. Executables remain external
at hash-bound paths; the archive contains source, commands, logs, reports and metadata.
