# Transformed voxel enclosure admission

Base 3df1ac8c4cd1a6fcf04b33bf233926db5706bc71. Owner Hypervoxel exact affine
handoff, plan phase13/Tier3 transformed conservative bounds; P1/P6/P17-P20/P27/P35-P37.
Before editing reproduce an exact map_bounds ordering blocker with finite certified
scalar enclosures. Existing exact map remains authoritative and unchanged.

Add an opt-in conservative transformed-bounds report reusing Hyperinterval scalar
conversion and Hyperlattice Cartesian matrix/vector arithmetic. Retain immutable
original exact transform and source endpoints; the output is a containing box,
not the correlated image, occupancy, surface or topology. No sampled/rounded point
may replace exact source. Interpret endpoints as their coordinatewise closed hull,
consistent with exact map_bounds handling reversed input. Singular/zero transforms
are valid box images; invalid/unenclosable scalars remain typed errors. Precision
is enclosure spacing, not promised output width. Use one shared dyadic budget for
all conversions and arithmetic; fixed 3D loops, no unbounded container. Hyperreal
refinement and exact clone/drop retain existing exclusions; no total-resource or
asynchronous cancellation promise.

Witnesses: undecided ordering yet certified finite enclosure; independent exact
integer/rational corner extrema and sign permutations; algebraic coefficients,
reversed/degenerate bounds, source mutation isolation; output into another interval
map and source-bound SDF classifier; error source, small-budget/retry, fresh-process
reconstruction. Measure the completed report including retained source and drop;
report legacy and size costs honestly as an additive completeness extension.
Preserve pending primary and Interface work; no push. Do not change a frozen stage.
