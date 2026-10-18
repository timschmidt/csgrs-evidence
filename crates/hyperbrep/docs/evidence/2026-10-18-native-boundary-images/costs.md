# Complete-work cost observations

All original full harnesses, sizes, iterations, materialization, exact receipts and fixture facts preserved. Three alternating CPU-pinned pairs. No task builds/tests overlap. Shared-host observations, including every adverse row; no broad or statistically established speedup. Allocation requests and process RSS do not bound retained heap. Executables are harnesses, not distribution sizes.

192 matched cases across 22 complete corpora; 132 fresh processes. All receipts agree. Median case ratio 1.003374; range 0.803214–1.139206.

## Targeted original workloads

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| region_exchange / region_exchange/Butt/reverse_false | 11.659228667 | 11.391370667 | 0.977026 |
| region_exchange / region_exchange/Butt/reverse_true | 10.747841000 | 10.733131000 | 0.998631 |
| region_exchange / region_exchange/Round/reverse_false | 27.424319667 | 27.394976667 | 0.998930 |
| region_exchange / region_exchange/Round/reverse_true | 27.513819667 | 27.585609333 | 1.002609 |
| kernel / spline_kernel/nurbs_path_extrusion_build_exact_volume | 0.833120466 | 0.842998820 | 1.011857 |

## Rows above the 10% review marker

| Corpus / case | Baseline ms | Candidate ms | Ratio |
| --- | ---: | ---: | ---: |
| arc / arc_structural_facts_replay | 0.000005222 | 0.000005949 | 1.139206 |

## Increased allocation requests

| Corpus / case | Calls delta | Requested bytes delta |
| --- | ---: | ---: |
| region_exchange / region_exchange/Round/reverse_false | 0.333 | 58.667 |
| coplanar / coplanar/circular_boundary_provenance | 0.333 | 58.667 |
| prisms / prisms/covering_bores | 24.000 | 1776.000 |
| analytic_similarity / similarity/reflected_replay | 0.050 | 8.800 |
| analytic_similarity / similarity/primitive_matrix | 1149.000 | 72800.000 |
| analytic_similarity / similarity/profile_families | 192.000 | 6152.000 |
| analytic_similarity / similarity/rejection_recovery | 0.140 | 24.640 |
| prism_exchange / prism_exchange/preserved_planar | 0.000 | 680.000 |
| axial_exchange / axial_exchange/disjoint_false/reflected_true | 2.667 | 197.333 |
| axial_exchange / axial_exchange/disjoint_true/reflected_false | 1.000 | 40.000 |
| axial_shell_exchange / axial_shell_exchange/kind_0/reflected_true | 15.333 | 538.667 |
| axial_shell_exchange / axial_shell_exchange/kind_1/reflected_true | 1.333 | 114.667 |

## Separate preliminary observations

The pre-edit [reproduction](reproduction.json) preserves the seven original complete retained-region recipes and their typed outcomes. The preceding prism-admission increment supplies the frozen 22-corpus cost baseline. Former unsupported work is never a speedup baseline; new completed native workflows receive separate absolute cost observations.

The full NURBS case keeps the degree-two weighted boundary, original knot interval, line sides, through-hole, 500 iterations and independently expected exact volume 45. It is a build/measurement harness, not a complete STEP exchange workload. Region and axial exchange rows include their original exact assertions, native/STEP materialization and continuation. Their receipts, original sizes, and current byte-identical artifact inventory are separate from timing evidence.

All raw trials, unfavorable cases, allocator observations, process RSS/CPU/wall measurements and executable sizes remain in [cost-summary.json](cost-summary.json), [resource-summary.json](resource-summary.json) and [costs/commands.json](costs/commands.json). Existing archive, spline, cached-arc, pcurve and provenance cost obligations remain open; a later favorable ratio does not erase historical observations.
