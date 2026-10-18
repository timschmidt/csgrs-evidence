# Lazy scalar ingress investigation

The cache prototype is rejected. Main source and tests are restored to
0fa83aea7. All 15 modified or added files and the full patch are preserved.
This checkpoint admits no implementation.

The boxed cache passed 936 default and 1,055 all-feature scalar tests,
819 debug units, 24/29 doctests, four new scalar tests, one strict predicate
regression, and the recorded strict Clippy/docs/format checks. Broader
consumer and compiler-floor scripts were prepared but not executed.

Acceptance nevertheless fails: warmed proof is lost through scaling,
division and same-class addition. Twenty matched instrumented cost samples
also show one extra 32-byte allocation per cold primitive conversion and
per warm clone, plus latency regressions in all four measured rows. The
allocation instrumentation is inside timing; no general speed claim follows.
Raw measurements, unsuccessful candidates and setup failures are retained.

An original newly proposed automatic reciprocal-equality workflow failed
ten materialized controls. The original test remains archived. A documented
pre-implementation migration instead exercises the existing explicit exact
normal form, requiring Some(1). Passing that workflow does not discharge
the automatic-equality gap. No existing test or policy was weakened.

The investigation reproduces a separate wrong-value bug on committed code:
consuming a deserialized lazy Pi through exp yields an interval near e,
and asinh yields an interval near asinh(1). Owned folding substitutes one
for the missing symbolic payload. This is the next narrow repair.

Valid lazy sign-query panics, forged certificate/graph contradictions,
undefined graph handling, and complete proof retention remain open.
Explicit affine subtraction remains withheld. Native workloads, bindings,
release validation and full-plan completion are not established here.
Hypervoxel remains excluded; no push is performed.

Every new physical artifact is independently hashed. Generated and compiled
outputs remain physically retained; sources, protocols and raw logs are
archived. These experiment roots are closed. Original storage baselines
remain, with ceilings of 16 GiB root, 72 GiB Disk B, 32 GiB tmp and 96 MiB
cumulative logs. The tmp-only migration from 24 GiB is explicit. Temporary
artifacts remain volatile; historical missing files were not recovered or
reaudited.
