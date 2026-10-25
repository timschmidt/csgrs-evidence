# R23 / Hypercurve P14 containment pilot

Owner: Hypercurve exact curve-box classification, rational derivative roots and
retained point comparison. P8/P9/P14/P15/P16/P17/P18/P19/P20/P25/P35/P36.
Highest intended improvement: completion of exact rational-span containment,
not changing conservative bounds or treating a control hull as the curve image.

First domain: finite pole-free rational cubic/native NURBS spans, closed AABB,
STRICT and APPROXIMATE_512 with honest receipts. Endpoints and all roots of
N'W-NW' give a complete extremum candidate set; denominator nonzero must remain
proved. Include constant coordinates, repeated derivative roots, exact tangency,
2^-200 clearance, reversed/split/transformed/source-dropped input. Broader
retained trims require chart-correct candidate membership and witness transport;
implicit-polynomial interior extrema stay dependent on R05–R07.

Missing gate: the current rational cubic with controls (0,0),(1,3),(2,3),(3,0),
weights 1,2,2,1, has y=18u/(1+3u), u=t(1-t) in [0,1/4], so max y=18/7 at
(3/2,18/7). The function is increasing in u because its derivative is
18/(1+3u)^2 > 0. Native/split/reversed forms must agree at tangent and nearby
bounds. Existing tests intentionally record Unsupported for nonmonotone
rational extrema; completion must strengthen these expectations and retain a
separate unsupported-family blocker/definite-escape precedence control.

Preserve invalidity precedence, first escaping curve order, endpoint shortcuts,
ordinary hull-query cost and typed blocked/budget outcomes. Avoid mandatory global
Cartesian promotion: compare a selected coordinate with a side through retained
parameter/root evidence. A witness must identify an exact point of the supplied
source/chart, survive source drop and re-enter point/curve queries. No new total-
work/heap/cancellation guarantee is implied by existing root isolation limits.

Baseline reproduction only initially. No primary source edit during frozen R04
validation. Source/candidate isolation and exact coefficient/independent witness
records precede implementation. Use the existing production root solver and
point-comparison owner, rather than a second solver or hull subdivision fallback.
