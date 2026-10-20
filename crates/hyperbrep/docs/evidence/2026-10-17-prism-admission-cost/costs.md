# Complete-work cost observations

All original full harnesses, sizes, iterations, materialization, exact receipts and fixture facts preserved. Three alternating CPU-pinned pairs. No task builds/tests overlap. Shared-host observations, including every adverse row; no broad or statistically established speedup. Allocation requests and process RSS do not bound retained heap. Executables are harnesses, not distribution sizes.

192 matched cases across 22 complete corpora; 132 fresh processes. All receipts agree. Median case ratio 0.995179; range 0.625531–1.059740.

## Targeted original workloads

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| region_exchange / region_exchange/Butt/reverse_false | 13.019683667 | 11.673518333 | 0.896605 |
| region_exchange / region_exchange/Butt/reverse_true | 12.084490000 | 10.676050667 | 0.883451 |
| region_exchange / region_exchange/Round/reverse_false | 27.652190667 | 27.379150667 | 0.990126 |
| region_exchange / region_exchange/Round/reverse_true | 27.708072333 | 27.469983000 | 0.991407 |
| kernel / spline_kernel/nurbs_path_extrusion_build_exact_volume | 1.207123048 | 0.844273486 | 0.699410 |

## Rows above the 10% review marker

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| None | | | |

## Increased allocation requests

| Corpus / case | Calls delta | Requested bytes delta |
| --- | ---: | ---: |
| prisms / prisms/covering_bores | 4.000 | 296.000 |
| analytic_similarity / similarity/primitive_matrix | 1363.000 | 85128.000 |
| analytic_similarity / similarity/profile_families | 316.000 | 14416.000 |
| prism_exchange / prism_exchange/annular_prism | 0.000 | 312.000 |

## Separate preliminary observations

The pre-edit [reproduction](reproduction.json) retains all three historical pre-extension/current pairs and the complete original kernel and region-exchange harnesses. The complete current domain is the optimization baseline. Historical samples are diagnostic references, never a speedup baseline against unsupported work.

The [adjacency-only pilot](adjacency-pilot.json) and [combined relation pilot](relation-pilot.json) retain their own frozen executable, source and full 68-row receipts. Each is one fresh pair per original harness. They inform which candidate to qualify; they are not pooled into this final campaign or selected as representative of it.

The full NURBS case keeps the degree-two weighted boundary, original knot interval, line sides, through-hole, 500 iterations and independently expected exact volume 45. It is a build/measurement harness, not a complete STEP exchange workload. Region and axial exchange rows include their original exact assertions, native/STEP materialization and continuation. Their receipts, original sizes, and current byte-identical artifact inventory are separate from timing evidence.

All raw trials, unfavorable cases, allocator observations, process RSS/CPU/wall measurements and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Existing archive, spline, cached-arc, pcurve and provenance cost obligations remain open; a later favorable ratio does not erase historical observations.
