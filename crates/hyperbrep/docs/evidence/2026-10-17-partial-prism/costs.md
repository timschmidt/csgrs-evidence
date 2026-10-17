# Complete-work cost observations

All original full harnesses and materialized receipts retained. Three alternating pairs; no task builds/tests overlap. Shared-host observations, including all adverse rows. Allocation requests and peak process RSS do not bound retained heap. Executables are harnesses, not distribution sizes. Absolute new-workflow costs have no comparison to a former failure.

180 preserved cases and 4 new cases; 123 fresh processes. All old deterministic receipts agree. Median case ratio 1.001813; range 0.801846–1.053511.

## Rows above the 10% review marker

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| None | | | |

## Increased allocation requests

| Corpus / case | Calls delta | Requested bytes delta |
| --- | ---: | ---: |
| region_exchange / region_exchange/Butt/reverse_false | 48.333 | 6010.667 |
| region_exchange / region_exchange/Butt/reverse_true | 48.000 | 5952.000 |
| region_exchange / region_exchange/Round/reverse_false | 72.333 | 8986.667 |
| region_exchange / region_exchange/Round/reverse_true | 71.667 | 8869.333 |
| oblique / oblique/identity | 8.000 | 992.000 |
| coplanar / coplanar/torus_axial/recut | 8.000 | 992.000 |
| coplanar / coplanar/torus_longitudinal/recut | 8.000 | 992.000 |
| coplanar / coplanar/cone_longitudinal/recut | 8.000 | 992.000 |
| prisms / prisms/same_height | 20.000 | 8040.000 |
| prisms / prisms/covering_cylinders | 767.000 | 131992.000 |
| prisms / prisms/covering_bores | 1471.000 | 159152.000 |
| prisms / prisms/annular_cut | 48.000 | 5952.000 |
| sectors / sectors/torus_axial_quarter | 8.000 | 992.000 |
| sectors / sectors/torus_longitudinal_quarter | 8.000 | 992.000 |
| sectors / sectors/cone_longitudinal_quarter | 8.000 | 992.000 |
| sectors / sectors/torus_longitudinal_band | 8.000 | 992.000 |
| sectors / sectors/cone_longitudinal_band | 8.000 | 992.000 |
| analytic_similarity / similarity/primitive_matrix | 56.000 | 2656.000 |
| analytic_similarity / similarity/clipped_void_matrix | 3270.000 | 151360.000 |
| seam_cuts / seams/torus_axial | 8.000 | 992.000 |
| seam_cuts / seams/torus_longitudinal | 8.000 | 992.000 |
| seam_cuts / seams/cone_longitudinal | 8.000 | 992.000 |
| prism_exchange / prism_exchange/half_cylinder | 27.000 | 2792.000 |
| prism_exchange / prism_exchange/preserved_planar | 69.000 | 7544.000 |
| prism_exchange / prism_exchange/covering_circular | 206.000 | 25344.000 |

## New complete native/STEP workflows

| Case | Median ms | Calls / operation | Requested bytes / operation |
| --- | ---: | ---: | ---: |
| axial_exchange/disjoint_false/reflected_false | 62.652883 | 224466.000 | 23938856.000 |
| axial_exchange/disjoint_false/reflected_true | 62.954239 | 226590.000 | 24127259.000 |
| axial_exchange/disjoint_true/reflected_false | 47.945994 | 178998.000 | 18294362.000 |
| axial_exchange/disjoint_true/reflected_true | 48.018763 | 181122.667 | 18482632.333 |

All raw trials, full case rows, process RSS/CPU/wall observations and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Warmup and timing boundaries belong to each unchanged harness. OS/shared caches were not flushed. The new harness executes one warmup and three measured complete workflows per process, including independent exact checks and native/STEP materialization. No significant speedup or all-cohort timing admission is inferred.
