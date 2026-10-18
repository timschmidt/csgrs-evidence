# Resource retention review

The [complete report](resource-summary.json) preserves all 192 matched rows,
132 process records, allocation requests and executable sizes. All exact
receipts agree, all 211 final artifacts are byte-identical, and no case-median
timing ratio exceeds the 1.10 review marker. The observed range is
0.625531–1.059740; the median across cases is 0.995179. These are shared-host
observations, not a statistically established general speedup.

Four rows have increased allocation requests or requested bytes. The largest
is the analytic primitive matrix: 1,363 more requests over 2,589,534 baseline
requests, and 85,128 more requested bytes over 206,396,093 baseline bytes.
Those increases are approximately 0.052635% and 0.041245%, respectively.
The profile-family matrix adds 316 requests and 14,416 requested bytes.
Covering bores adds four requests and 296 bytes; annular-prism exchange adds
312 bytes with the same request count. These observations remain unfavorable
rows; no cause is assigned without a separate investigation.

The original butt-region exchanges each use about 4,505 fewer allocation
requests and 411,221–411,280 fewer requested bytes. Their measured time ratios
are 0.896605 and 0.883451. The original NURBS extrusion case measures
1.207123 ms versus 0.844273 ms, a ratio of 0.699410, with its full fixture and
500 iterations preserved. Earlier pre-extension timing observations remain
historical obligations; this increment uses the complete axial-shell domain
as its baseline and does not erase those earlier costs.

The 22 native harnesses change by -1,104 through +5,712 bytes; one is
byte-identical. The largest positive relative change is below 0.023%.
The same 138-group WASM harness is 7,958 bytes smaller. Per-corpus median
process peak RSS varies in both directions, from 588 KiB lower to 200 KiB
higher. Full per-process values remain in the report. None of allocation
requests, executable size or process RSS is a retained-heap bound or a
published-package size measurement.

Retain the combined candidate: it reduces the targeted redundant proof work
while preserving the full exact completed contract, and these small resource
increases do not negate the measured improvement. This decision does not
close general resource, cancellation, coverage, distribution or historical
performance obligations. The full proof, validation and output-materialization
requirements remain unchanged.
