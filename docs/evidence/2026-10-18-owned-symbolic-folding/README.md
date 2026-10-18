# Owned symbolic folding

Owned Real folding now reconstructs a missing payload from its retained
symbolic certificate. Previously a directly consumed lazy Pi produced e
from exp and asinh(1) from asinh: the fallback substituted one for Pi.
Both owned-fold fallback branches now use the same certificate constructor
as borrowed access. Existing graphs and cancellation signals still move
through the same path. Public APIs, layout, caches and wire schema stay intact.

Four new tests fail on unchanged production and one materialized control
passes. All five pass after repair, without changing their source. They
cover 252 lazy JSON/CBOR compositions across all 21 named certificate
recipes, absent/null payloads and 0/1/-3 scales, plus 63 materialized
controls. Independent forward exp/asinh bounds cover 32 more cases,
including nonunit positive and negative scales. Values are consumed
directly because cloning could conceal the original defect.

Final-source checks pass: 934 default and 1,054 all-feature scalar tests,
817 debug units, 24/29 scalar doctests, 365 predicate tests, 21 SVG tests,
60 circuit interchange tests and the recorded geometry/all-feature circuit
targets. Strict Clippy, docs, formatting and Rust 1.95 all-target checks
for Hyperreal/Hyperlimit/Hypercurve pass in the named configurations.
The original Cargo-artifact selection setup error is preserved. A weak
LnProduct oracle was strengthened before the executed failing baseline;
that earlier test file is also retained. Existing tests, fixtures and
policies were not weakened.

This admits only owned folding of valid lazy certificates. Lazy query
panics, malformed certificate/graph consistency, undefined graph domains,
composed proof retention and automatic reciprocal equality remain open.
The cache prototype remains rejected and affine subtraction withheld.
Full native workloads, bindings, release/distribution and the complete
pre-push workflow matrix were not rerun. No performance gain or push is claimed.

Each physical artifact is hashed independently. Generated and compiled
outputs remain physically retained; sources, protocols and raw logs are
archived. These experiment roots are closed. Original storage baselines
remain at 16/72/32 GiB root/Disk B/tmp allowances and 96 MiB cumulative
logs. Temporary artifacts remain volatile. Historical missing files were
not reaudited or recovered. Hypervoxel remains excluded and the full plan
remains incomplete.
