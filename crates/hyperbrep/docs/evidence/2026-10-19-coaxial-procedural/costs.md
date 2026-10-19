# Cost and size observations

Three alternating CPU-pinned pairs cover 14 preserved completed workflows. Six absolute processes (three per cohort) cover three new Boolean/replay recipes, both archive-control recipes and eight owner point-definition groups. All 30 processes pass; first and repeated fresh-input invocations are separate (three repeats for ordinary groups, one for the expensive overlapping union/XOR group). The 28 matched phase ratios range 0.900838 to 1.087323; 0 exceed the 10% review marker and 0 increase allocation traffic. Every raw sample and adverse result is retained. The complete selected-cap Boolean recipe takes 58.433s first and 58.412s per repeated invocation, requesting 59.375/59.404 GB respectively. Maximum process RSS is 34.83 MiB. Cumulative requested bytes are counted Rust allocation traffic, not live heap or a complete count of foreign allocator traffic. These instrumented shared-host samples establish no general speedup or internal resource bound. Baseline binaries are reused only after source, input and binary-hash verification; all native baseline samples are freshly executed.

## Preserved workflow observations

All timing increases and allocation-growth rows are listed, including observations below the review marker. A marker flags review, not a causal performance claim.

| Workflow / phase | Time ratio | Allocation-call change | Requested-byte change |
| --- | ---: | ---: | ---: |
| selected_meridian_patch_retains_latitudes_and_replays / first_fresh_input | 1.087323 | 0.00000% | 0.00000% |
| selected_meridian_patch_retains_latitudes_and_replays / repeated_fresh_input | 1.009977 | 0.00000% | 0.00000% |
| selected_rotation_retains_points_and_angular_charts / first_fresh_input | 1.082756 | 0.00000% | 0.00000% |
| selected_revolution_rejects_axis_contacts_and_invalid_domains / first_fresh_input | 1.010338 | 0.00000% | 0.00000% |
| selected_revolution_rejects_axis_contacts_and_invalid_domains / repeated_fresh_input | 1.052005 | 0.00000% | 0.00000% |
| selected_revolution_archives_reject_wrong_images_and_recover / first_fresh_input | 1.005959 | 0.00000% | 0.00000% |
| selected_revolution_archives_reject_wrong_images_and_recover / repeated_fresh_input | 1.006096 | 0.00000% | 0.00000% |
| selected_revolution_preserves_certainty_and_budget_recovery / first_fresh_input | 1.006440 | 0.00000% | 0.00000% |
| selected_revolution_preserves_certainty_and_budget_recovery / repeated_fresh_input | 1.003296 | 0.00000% | 0.00000% |
| retained_rotation_closed_edges_split_and_replay / first_fresh_input | 1.065535 | 0.00000% | 0.00000% |
| selected_revolution_oblique_axes_tangencies_and_exact_gaps / first_fresh_input | 1.005675 | 0.00000% | 0.00000% |
| selected_revolution_oblique_axes_tangencies_and_exact_gaps / repeated_fresh_input | 1.003313 | 0.00000% | 0.00000% |
| full_parallel_cap_revolves_and_replays / first_fresh_input | 1.050827 | -0.00093% | -0.00140% |

## Binary sizes

| Consumer | Artifact | Candidate bytes | Baseline delta |
| --- | --- | ---: | ---: |
| revolution | native | 25424384 | 47880 |
| revolution | wasm | 16526490 | 37506 |
| procedural | native | 27767760 | 187776 |
| procedural | wasm | 18106860 | 127845 |
| native | native | 26582584 | 88928 |
| native | wasm | 17303724 | 62125 |
| solids | native | 27711056 | 62560 |
| solids | wasm | 18099088 | 44567 |
| coaxial | native | 27358784 | new domain |
| coaxial | wasm | 17830944 | new domain |
| point-definitions | native | 15315792 | new domain |
| point-definitions | wasm | 9958242 | new domain |

The finite source extension is retained for additional exact completion and replay. These samples do not identify a scalar-layer defect or justify unrelated supporting-crate repair. Profile the complete selected recipe before choosing an optimization. Baseline WASM artifacts are reused for size comparison only; candidate WASM execution is fresh. No global cache eviction, host isolation or whole-corpus cost claim is made.
