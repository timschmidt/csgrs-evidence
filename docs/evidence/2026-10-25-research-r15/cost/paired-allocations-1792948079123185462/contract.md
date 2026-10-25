# R15 matched public workflow and resource contract

This probe evaluates the unchanged public workflow: construct a rectangle from
exact retained selected endpoints, trim a line against it, inspect certainty,
replay source parameters and every boundary contact, reconstruct endpoint
definitions, reverse twice, encode validated canonical rows, and destroy the
result. The independent rectangle width is sqrt(1/2); rational-width controls
use 1/2. Cases are bottom/top overlap, horizontal interior, vertical interior,
rational bottom/interior, and a successful empty result outside the rectangle.
Both source directions and both predicate policies are required to complete
with Certified receipts. No root resolutions or policies differ by variant.

Canonical rows contain the independently specified exact coordinates and source
parameters only after comparing the actual retained output against them. They
also contain actual carrier/loop/fragment/contour indices, contact kinds and
point availability. Every contact's retained parameter must reproduce the
endpoint on its actual carrier. These rows are a declared comparison artifact,
not a general archive format for private recursive parameter authorities. The
unchanged unit workflow separately preserves its original parameter-carrier
identity assertions. A separate untimed query is replayed after dropping the
source and region; this is ownership replay, not cold archive reconstruction.

Two lanes:

- Retained: construct inputs outside timing; repeat query, exact validation,
  canonical encoding, first-sample file export, and result/row destruction on
  those same inputs. Validation may warm retained evidence between queries.
- Workflow: independently construct inputs for every sample; include construction,
  query, the same validation/encoding/export, and input/result destruction.

Sample zero is the first query/workflow in the process. It alone exports the
artifact to a temporary file; all samples encode/checksum/destroy the same rows.
Warm summaries use samples 1..7. Process startup, final source-drop replay,
stdout JSON reporting and compilation are outside the timed work. Query and
validation times are diagnostic; the protected latency metric is total_ns.

Before final timing: freeze source/lock/toolchain/build flags and all probes;
complete owner checks and all heavy concurrent work; check every functional
pilot and exact artifact match. Native mode uses the default System allocator;
the counting allocator is compiled only in the separate allocations mode.
Do not interpret instrumented or concurrent pilot times as native performance.

Native design: 30 independent process pairs per 7 cases x 2 directions x 2
policies x 2 lanes (56 cells); 8 samples/process. The deterministic seed is
20261025. Per-cell A/B order is balanced 15/15 and randomized before collection;
cell order is shuffled for each pair. Pin each child to the first available CPU,
record CPU/platform/governor/topology/load, and serialize all measured children.
Use an external 120-second, 8-GiB address-space limit per process. Keep failure
and timeout records; never impute them as completed latency observations.

Estimator: paired geometric mean candidate/baseline ratio of process first
samples and process warm medians. Report all raw process samples and absolute
medians. The protected family is 112 total-latency metrics (56 cells x cold/warm).
Report marginal 95% paired-log Student-t intervals and Bonferroni simultaneous
95% intervals across that family; this explicitly assumes the paired log ratios
are suitable for the t interval. Query/validation phase intervals are diagnostic
and receive no global performance claim. Keep only a lower-priority performance
claim if every protected simultaneous upper bound is <=1; a new exact-completion
gain may justify disclosed costs but cannot be called a general speedup.

Allocation design: five process pairs per cell, eight samples/process, with the
same mathematical/provenance/receipt and artifact gates. Record full allocation
and reallocation requests, calls, query peak live growth, result live delta,
post-result and post-input destruction retention, and whole-workflow traffic.
These counters do not establish a whole-solver heap or cancellation bound.
Native executable file/.text sizes use the final uninstrumented probe binaries.
WASM compilation is an owner check; a native probe's size is not a deployed WASM
size claim. Builds and all failed drafts remain attributable in the raw record.
