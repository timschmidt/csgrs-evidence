# Current-revision dynamics retention investigation

The full fifteen-phase goal remains active. No production change is retained by
this investigation. Base b816c48cca12c922f3dbfb004c4d27586c06ad74 and the original
40-path pending candidate are captured in BASELINE.json and candidate.patch.
Interface's eight-path pending patch is unchanged. Both isolated experiments
were reverted, and the isolated checkout matches the original candidate exactly.

## Work and size

All 194 owner benchmark cases have byte-identical full Debug result observations
and identical allocation rows under the separate warmed observer; live-byte
deltas are zero. These observations are differential checks, not an independent
mathematical oracle or canonical wire serialization. The original Criterion
benchmark body differs only by two deprecation allowances.

The actual Criterion executable shrinks from 13,312,600 to 13,304,584 bytes.
All defined ELF function ranges (aliases/overlaps counted once) shrink from
8,044,187 to 8,036,358 bytes; .text shrinks from 8,118,103 to 8,110,279 bytes.
There are six unsized symbols in each. The main-tree candidate executable is
byte-identical to the isolated candidate used for all original timing sweeps.

Resolved static targets establish that the formerly ambiguous parser indirect
slot invokes parse_specctra_grid_route_records in both variants. Static listings
are not transitive cost proofs. Userspace Callgrind profiles of the actual owner
benchmark show equal instruction and memory-operation counts for the selected
parser, trace import and skew calls; motion calls have small increases. The
separate complete-result/drop observer profiles show equal parser, import and
pad-clearance counts and motion differences up to about 0.16%. Cache/branch
simulation is not a hardware counter or a wall-clock explanation.

## Timings and rejected experiments

Four same-path, same-argv full sweeps cover 194 cases. Follow-up includes every
case with a slower mean plus every historical targeted/supplemental case: 121
cases, four balanced runs, fixed CPU affinity, scoped CPU warm-up. Both original
and repeat observations remain. Forty-one follow-up cases have candidate mean
confidence ranges entirely above both baseline ranges. Examples include parser
256 (1.05459), mixed route parsing (1.05806), circular-edge clearance (1.06905),
and arc-wire exact lifting (1.09998). This fails retention, irrespective of the
aggregate ratio or favorable cases. Selection is not an acceptance tolerance.

A further twelve-case diagnostic disables ASLR only in the benchmark subprocess.
Six cases still have separated adverse ranges: parser 256 is 1.05908 and arc-wire
lifting 1.08315. Load-address randomization does not remove the reproduced gate
failure. No host governor, sysctl or compiler policy was changed.

An ordinary inline attribute on the profiled MetricSpan length adapter removes
that separate call and lowers mixed-jerk instruction count, but does not remove
all motion overhead. Its executable is 13,304,728 bytes and function union
8,036,574. All 194 observed results/allocation rows match. This isolated
experiment was not fully timing-qualified or retained.

A second experiment reexports DynamicsError under the old RouteCertificationError
name and removes the two explicit conversions. All 194 observed results and
allocation rows match. Jerk profile counts fall below baseline, but executable
size rises to 13,316,864 bytes. Removing sixteen now-identity result maps leaves
13,316,848 bytes; both exceed the accepted baseline. Function union is 8,043,152
and .text 8,117,175 for both; unwind and symbol sections account for file growth.
These experiments were rejected and reverted. They did not receive the final
full functional or downstream qualification run; those checks use the restored
original pending candidate. No new public error ownership has been accepted.

## Scope and remaining work

The profiler was extracted from a downloaded Valgrind package into /tmp; no host
package was installed. A linux-perf package fetch failed with HTTP 404. A direct
self-process perf_event_open probe was denied (errno 13, paranoid=3). Hardware
counters remain unavailable; no permission or system setting was changed.

The next retention step needs evidence about transitive code generation, return
ABI/copies, or hardware layout costs. Repeating the same favorable timings or
editing unrelated parsers is not a fix. The shared-error result is a rejected
architecture experiment, not permission to waive file-size or compatibility
gates. The full plan's other phases, platform/HIL and release obligations remain
open. No push is attempted and this is not the complete pre-push workflow matrix.

## Final restored-candidate validation

All eleven affected validation groups pass: 496 owner tests, 201 Interface tests,
strict owner/downstream Clippy, owner docs, WASM compilation, all 194 benchmark
smoke cases, 200 successive rows, both formatting checks and diff whitespace.
Six fresh-process transcripts (legacy/direct/compatibility under STRICT and
APPROXIMATE_512) match within each policy, with 92 report/trace lines each. Fixed
dispatch assertions are unchanged. The existing Interface golden asserts 41,795
bytes and SHA-256 df893df83e90e6b53452e18586ffcaa2524a021631a395d4a6523be16263669c
alongside exact limits, bottlenecks and lowering checks. Successive structural,
allocator-count and displayed memory columns match the retained 200-row control;
its elapsed times are smoke observations, not a matched performance comparison.
This correctness evidence does not clear the separately failing timing gate.
