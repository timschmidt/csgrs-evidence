# Complete workflow cost observations

This is a capability increment, not an optimization. Three alternating CPU-pinned
pairs retain all 99 preserved rows and every full fixture, assertion, certainty
receipt and output materialization. Eight new groups have three absolute trials;
an earlier unsupported result is not used as their timing baseline. Each process
uses one warmup and three measured repetitions per case. Allocation counters are
enabled. All 63 processes pass their assertions. Sources, recipes and binaries
remain fixed; no task builds, tests or other task measurements overlap the run.

The table reports median time per complete case and cumulative allocation calls
and requested bytes per repetition. Mixed groups include expected typed failure
controls. OS caches are warm on a shared host. These samples, process RSS and
cumulative requests establish neither statistical significance, retained-memory
bounds nor a general speedup. All adverse observations remain visible. Full raw
trials and executable/source hashes are in `consumer-costs.json` and the raw bundle.

Observed time ratios span 0.786806–1.271032; 5 rows exceed the 10% review marker. 2 rows increase allocation calls or requested bytes. The marker is a review aid, not a statistical or release gate.

| Cohort / case | Outcome | Before ms | After ms | Ratio | Before / after calls | Before / after requested bytes |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| images / eight_profiles | certified | 118.051029 | 118.426814 | 1.003183 | 454304.333 / 454304.333 | 37366534.667 / 37366534.667 |
| images / cut_restore_replay | certified | 8.076635 | 8.067328 | 0.998848 | 21358.667 / 21358.667 | 2699455.333 / 2699455.333 |
| images / thin_touching_components | certified | 10.327228 | 10.341377 | 1.001370 | 36343.000 / 36343.000 | 3641631.000 / 3641631.000 |
| images / planar_replay | certified | 0.892923 | 0.892179 | 0.999167 | 1556.000 / 1556.000 | 236210.000 / 236210.000 |
| images / unequal_holes | expected_typed_rejection | 4.264060 | 4.256465 | 0.998219 | 11511.000 / 11511.000 | 1433933.000 / 1433933.000 |
| images / self_intersecting | expected_typed_rejection | 0.052726 | 0.052712 | 0.999734 | 104.000 / 104.000 | 23312.000 / 23312.000 |
| spline / retained_spline_profiles_complete_step_replay_and_repeated_cuts | certified_or_expected_typed_control | 299.590118 | 295.070892 | 0.984915 | 826411.667 / 826418.000 | 91714905.333 / 91715476.000 |
| spline / independent_splines_retain_charts_weights_trims_units_and_modeling | certified_or_expected_typed_control | 130.248369 | 129.496201 | 0.994225 | 276420.000 / 276418.000 | 39808335.000 / 39808119.000 |
| spline / invalid_spline_records_and_exhausted_limits_never_publish_a_body | certified_or_expected_typed_control | 3.450124 | 3.428289 | 0.993671 | 4133.000 / 4133.000 | 2062233.000 / 2062233.000 |
| spline / spline_whole_images_ambiguous_trims_and_supplied_pcurves_are_checked | certified_or_expected_typed_control | 12.175925 | 12.059039 | 0.990400 | 18299.000 / 18299.000 | 4034470.000 / 4034470.000 |
| spline / spline_write_limits_units_and_exact_numeric_failures_are_explicit | certified_or_expected_typed_control | 5.311204 | 5.330859 | 1.003701 | 14111.000 / 14111.000 | 1608792.000 / 1608792.000 |
| spline / spline_views_retain_weights_knots_and_reversed_subcurve_charts | certified_or_expected_typed_control | 0.135974 | 0.133652 | 0.982928 | 338.000 / 338.000 | 74712.000 / 74712.000 |
| spline / planar_pcurves_prove_whole_image_and_retain_parameter_correspondence | certified_or_expected_typed_control | 0.187885 | 0.189451 | 1.008335 | 238.000 / 238.000 | 55896.000 / 55896.000 |
| spline / extrusion_location_preserves_oblique_nonunit_direction_and_source_parameters | certified_or_expected_typed_control | 1.526462 | 1.528397 | 1.001268 | 3634.000 / 3634.000 | 252192.000 / 252192.000 |
| spline / extrusion_location_keeps_ambiguity_and_rejects_nontransverse_or_nonplanar_charts | certified_or_expected_typed_control | 0.079009 | 0.078706 | 0.996165 | 148.000 / 148.000 | 21068.000 / 21068.000 |
| measurement / planar_spline_incidence_does_not_require_low_degree_root_solving | certified_or_expected_typed_control | 1.576595 | 1.596357 | 1.012535 | 3420.667 / 3420.667 | 459453.333 / 459453.333 |
| measurement / rational_prism_validity_does_not_require_a_closed_form_measurement | certified_or_expected_typed_control | 408.710167 | 412.544305 | 1.009381 | 3691303.000 / 3691303.000 | 187551120.000 / 187551120.000 |
| measurement / holes_components_and_affine_images_keep_optional_measurements | certified_or_expected_typed_control | 497.646469 | 499.353134 | 1.003429 | 3111752.000 / 3111752.000 | 230130776.000 / 230130776.000 |
| measurement / measurement_absence_survives_empty_identities_and_repeated_slab_cuts | certified_or_expected_typed_control | 433.683383 | 434.073191 | 1.000899 | 2268459.667 / 2268460.333 | 212750977.333 / 212750937.333 |
| measurement / inward_and_damaged_archives_remain_invalid_without_volume | certified_or_expected_typed_control | 17.191445 | 17.351527 | 1.009312 | 108037.000 / 108037.000 | 9554294.000 / 9554294.000 |
| measurement / independent_quintic_step_admits_and_replays_without_measurement | certified_or_expected_typed_control | 328.410286 | 328.414540 | 1.000013 | 2331410.333 / 2331409.667 | 140692886.667 / 140692769.333 |
| measurement / malformed_quintic_step_and_budget_failure_cannot_publish_geometry | certified_or_expected_typed_control | 17.807805 | 17.818457 | 1.000598 | 129633.000 / 129633.000 | 8026090.000 / 8026090.000 |
| selected / selected_boolean_profiles_extrude_and_replay | certified_or_expected_typed_control | 547.852324 | 563.547780 | 1.028649 | 4253622.000 / 4253622.000 | 296837762.000 / 296837762.000 |
| selected / selected_profile_paths_share_native_image_admission | certified_or_expected_typed_control | 391.675767 | 398.742914 | 1.018043 | 2927279.000 / 2927279.000 | 198774484.000 / 198774484.000 |
| selected / selected_profile_edits_and_slab_booleans_preserve_exact_material | certified_or_expected_typed_control | 28968.975988 | 29096.184367 | 1.004391 | 232672290.000 / 232672287.000 | 17138753180.000 / 17138752924.000 |
| selected / selected_profiles_keep_holes_and_disconnected_components | certified_or_expected_typed_control | 102.197539 | 103.081290 | 1.008647 | 818509.000 / 818509.000 | 56480048.000 / 56480048.000 |
| selected / selected_profiles_transport_exactly_and_reject_damaged_archives | certified_or_expected_typed_control | 261.875487 | 264.890984 | 1.011515 | 1937472.000 / 1937472.000 | 142037079.000 / 142037079.000 |
| selected / partial_height_profile_contacts_keep_boundary_and_overlap_distinct | certified_or_expected_typed_control | 367.198135 | 368.004260 | 1.002195 | 1275395.667 / 1275387.667 | 157308874.333 / 157308546.333 |
| selected / selected_profile_step_vertices_remain_explicitly_unencodable | certified_or_expected_typed_control | 369.130431 | 370.753471 | 1.004397 | 2680396.000 / 2680396.000 | 203147845.000 / 203147845.000 |
| selected / selected_quadratic_image_keeps_the_complete_curve_and_original_roots | certified_or_expected_typed_control | 9.750574 | 9.858884 | 1.011108 | 69569.000 / 69569.000 | 4809848.000 / 4809848.000 |
| selected / nonmonotone_native_image_preserves_its_entire_parameterized_polynomial | certified_or_expected_typed_control | 0.203271 | 0.204664 | 1.006856 | 1013.000 / 1013.000 | 63044.000 / 63044.000 |
| selected / unavailable_higher_degree_views_do_not_replace_selected_evidence | certified_or_expected_typed_control | 0.021670 | 0.021861 | 1.008814 | 77.000 / 77.000 | 13456.000 / 13456.000 |
| selected / selected_weighted_curve_images_preserve_exact_quotients | certified_or_expected_typed_control | 8.094033 | 8.071654 | 0.997235 | 46771.333 / 46771.333 | 3225906.667 / 3225906.667 |
| parallel / nonlinear_parallel_pcurve_replays_exactly | certified_or_expected_typed_control | 7.302050 | 7.218388 | 0.988543 | 38070.000 / 38070.000 | 2550592.000 / 2550592.000 |
| parallel / polynomial_and_rational_parallel_sources_replay | certified_or_expected_typed_control | 3.250333 | 3.236838 | 0.995848 | 20957.333 / 20957.333 | 1178510.667 / 1178510.667 |
| parallel / selected_parallel_ranges_survive_replay_and_subdivision | certified_or_expected_typed_control | 1.289694 | 1.270125 | 0.984826 | 5767.667 / 5767.667 | 415440.333 / 415440.333 |
| parallel / parallel_cusp_endpoints_remain_selected_on_replay | certified_or_expected_typed_control | 1.988746 | 1.958164 | 0.984622 | 15398.000 / 15398.000 | 568809.000 / 568809.000 |
| parallel / replayed_parallel_pcurves_reenter_planar_modeling | certified_or_expected_typed_control | 32.264997 | 31.994402 | 0.991613 | 218411.000 / 218411.000 | 11329224.000 / 11329224.000 |
| parallel / parallel_archives_reject_forged_definitions | certified_or_expected_typed_control | 2.429914 | 2.415166 | 0.993931 | 13147.333 / 13147.333 | 795457.667 / 795457.667 |
| parallel / parallel_archive_limits_and_exhaustion_recover | certified_or_expected_typed_control | 3.415851 | 3.377908 | 0.988892 | 21043.000 / 21043.000 | 945662.000 / 945662.000 |
| planar / original_nonlinear_parallel_cap_extrudes_and_replays | certified_or_expected_typed_control | 151.407810 | 120.844501 | 0.798139 | 1009033.333 / 1009033.333 | 62918946.667 / 62918946.667 |
| planar / planar_images_preserve_exact_frame_and_chart | certified_or_expected_typed_control | 2.330863 | 1.833936 | 0.786806 | 7137.667 / 7137.667 | 484861.333 / 484861.333 |
| planar / parallel_cap_classification_and_edge_split | certified_or_expected_typed_control | 112.578521 | 89.791571 | 0.797591 | 705085.000 / 705085.000 | 39637537.000 / 39637537.000 |
| planar / parallel_cap_affine_transform_and_cold_replay | certified_or_expected_typed_control | 60.725788 | 61.178356 | 1.007453 | 466613.000 / 466613.000 | 26450176.000 / 26450176.000 |
| planar / parallel_cap_repeated_slab_booleans | certified_or_expected_typed_control | 713.090156 | 713.282142 | 1.000269 | 5587136.000 / 5587136.000 | 321647786.000 / 321647786.000 |
| planar / parallel_extrusion_point_queries | certified_or_expected_typed_control | 0.175056 | 0.179423 | 1.024950 | 805.000 / 805.000 | 39428.000 / 39428.000 |
| planar / authored_parallel_paths_share_admission | certified_or_expected_typed_control | 407.608889 | 406.954021 | 0.998393 | 3227985.000 / 3227985.000 | 181685575.000 / 181685575.000 |
| planar / planar_image_archives_reject_forged_interior_and_frames | certified_or_expected_typed_control | 55.980870 | 56.594316 | 1.010958 | 426052.000 / 426052.000 | 29996655.000 / 29996655.000 |
| planar / planar_image_limits_and_typed_frontiers_recover | certified_or_expected_typed_control | 50.742583 | 50.613702 | 0.997460 | 397821.667 / 397821.667 | 22407754.333 / 22407754.333 |
| planar / parallel_caps_keep_holes_and_components | certified_or_expected_typed_control | 213.198562 | 212.079964 | 0.994753 | 1628948.667 / 1628948.667 | 94382764.333 / 94382764.333 |
| planar / planar_lifts_share_native_source_evaluation | certified_or_expected_typed_control | 1.343849 | 1.329081 | 0.989010 | 1956.000 / 1956.000 | 384152.000 / 384152.000 |
| planar / parallel_step_frontier | certified_or_expected_typed_control | 42.060680 | 41.899374 | 0.996165 | 328706.000 / 328706.000 | 18801076.000 / 18801076.000 |
| selected_planar / selected_planar_points_keep_frame_and_source_correlation | certified_or_expected_typed_control | 8.069407 | 8.250292 | 1.022416 | 74947.333 / 74947.333 | 4769498.667 / 4769498.667 |
| selected_planar / selected_planar_points_replay_sources_and_affine_transforms | certified_or_expected_typed_control | 2.176748 | 2.194085 | 1.007965 | 7495.000 / 7495.000 | 756072.000 / 756072.000 |
| selected_planar / selected_parallel_edge_splits_replay_the_whole_cap | certified_or_expected_typed_control | 86.134317 | 86.742180 | 1.007057 | 665129.333 / 665129.333 | 38204240.667 / 38204240.667 |
| selected_planar / selected_parallel_splits_continue_through_boolean_sets | certified_or_expected_typed_control | 723.648959 | 730.466524 | 1.009421 | 5614461.667 / 5614461.667 | 328705819.333 / 328705819.333 |
| selected_planar / selected_parallel_splits_transform_and_preserve_near_separation | certified_or_expected_typed_control | 131.583032 | 132.343512 | 1.005779 | 1024972.667 / 1024972.667 | 58057521.333 / 58057521.333 |
| selected_planar / selected_planar_archives_reject_forged_sources_and_recover | certified_or_expected_typed_control | 276.832077 | 277.787395 | 1.003451 | 2120693.333 / 2120693.333 | 128572422.667 / 128572422.667 |
| selected_planar / selected_planar_policies_and_work_exhaustion_recover | certified_or_expected_typed_control | 44.583699 | 45.137769 | 1.012428 | 345568.000 / 345568.000 | 19783532.000 / 19783532.000 |
| selected_planar / selected_planar_poles_remain_typed_failures | certified_or_expected_typed_control | 0.457595 | 0.484984 | 1.059855 | 1747.000 / 1747.000 | 158728.000 / 158728.000 |
| selected_planar / authored_and_constant_forms_preserve_exact_values | certified_or_expected_typed_control | 0.018673 | 0.018359 | 0.983149 | 71.000 / 71.000 | 9928.000 / 9928.000 |
| selected_planar / selected_forms_preserve_root_correlation_and_cancellation | certified_or_expected_typed_control | 1.844816 | 1.873623 | 1.015615 | 21659.333 / 21659.333 | 1421490.667 / 1421490.667 |
| selected_planar / selected_form_bounds_and_policy_reuse_keep_exact_meaning | certified_or_expected_typed_control | 0.126413 | 0.125125 | 0.989809 | 462.667 / 462.667 | 44013.333 / 44013.333 |
| selected_planar / analytic_form_incidence_preserves_the_positive_normal_sheet | certified_or_expected_typed_control | 12.981677 | 13.128112 | 1.011280 | 113410.667 / 113410.667 | 5770266.333 / 5770266.333 |
| selected_planar / symbolic_forms_keep_correlated_coefficients | certified_or_expected_typed_control | 0.225775 | 0.223894 | 0.991667 | 1244.000 / 1244.000 | 93384.000 / 93384.000 |
| selected_planar / parallel_injectivity_requires_the_consumed_range | certified_or_expected_typed_control | 0.458059 | 0.484289 | 1.057263 | 3890.667 / 3890.667 | 221453.333 / 221453.333 |
| contacts / cubic_contacts_retain_original_source_and_certify_independent_equations | certified_or_expected_typed_control | 4.460647 | 4.566163 | 1.023655 | 25029.333 / 25029.333 | 1726626.667 / 1726626.667 |
| contacts / complete_root_sets_keep_repeated_roots_endpoints_and_distinct_visits | certified_or_expected_typed_control | 1.990603 | 1.977974 | 0.993656 | 11931.000 / 11931.000 | 760993.000 / 760993.000 |
| contacts / high_degree_empty_and_contained_results_are_complete | certified_or_expected_typed_control | 0.273651 | 0.272719 | 0.996594 | 1373.667 / 1373.667 | 86044.333 / 86044.333 |
| contacts / nonunit_nurbs_contacts_use_original_curve_parameters | certified_or_expected_typed_control | 0.540180 | 0.539678 | 0.999071 | 1159.667 / 1159.667 | 183188.333 / 183188.333 |
| contacts / nurbs_coincidence_keeps_all_ranges_and_isolated_contacts | certified_or_expected_typed_control | 0.059319 | 0.059281 | 0.999365 | 127.000 / 127.000 | 45584.000 / 45584.000 |
| contacts / nurbs_joint_classification_preserves_each_incident_span | certified_or_expected_typed_control | 2.000585 | 1.995770 | 0.997593 | 4045.000 / 4045.000 | 543812.000 / 543812.000 |
| contacts / parallel_plane_contacts_preserve_reversal_frame_and_tangency | certified_or_expected_typed_control | 97.134343 | 96.728188 | 0.995819 | 555438.000 / 555438.000 | 33118265.000 / 33118265.000 |
| contacts / planar_nurbs_overlaps_use_authored_spans_before_spatial_transport | certified_or_expected_typed_control | 0.939125 | 0.935676 | 0.996327 | 2257.667 / 2257.667 | 238397.333 / 238397.333 |
| contacts / plane_contacts_keep_tiny_exact_separations | certified_or_expected_typed_control | 6.287331 | 6.293655 | 1.001006 | 29794.667 / 29794.667 | 6370941.333 / 6370941.333 |
| contacts / contact_parameters_split_shared_edges_and_replay_solid_operations | certified_or_expected_typed_control | 282.131880 | 340.739346 | 1.207731 | 2106978.000 / 2106978.000 | 121989290.000 / 121989290.000 |
| contacts / plane_contact_policies_exhaustion_and_recovery_preserve_certainty | certified_or_expected_typed_control | 0.390180 | 0.495931 | 1.271032 | 1856.000 / 1856.000 | 150932.000 / 150932.000 |
| contacts / plane_contacts_reject_poles_before_empty_or_contained_shortcuts | certified_or_expected_typed_control | 10.226649 | 12.951478 | 1.266444 | 68654.000 / 68654.000 | 4282576.000 / 4282576.000 |
| contacts / collapsed_planar_spans_keep_parameter_components | certified_or_expected_typed_control | 0.567118 | 0.669767 | 1.181002 | 1879.000 / 1879.000 | 163084.000 / 163084.000 |
| contacts / finite_cone_boundary_contacts_are_not_claimed_as_equation_roots | certified_or_expected_typed_control | 0.027688 | 0.034096 | 1.231439 | 111.000 / 111.000 | 10440.000 / 10440.000 |
| procedural / selected_profile_domains_retain_endpoints_and_projection | certified_or_expected_typed_control | 0.235546 | 0.244753 | 1.039086 | 740.667 / 740.667 | 43813.333 / 43813.333 |
| procedural / selected_profile_domains_reverse_transform_and_replay | certified_or_expected_typed_control | 1.669892 | 1.714158 | 1.026508 | 4410.000 / 4410.000 | 407326.000 / 407326.000 |
| procedural / full_clipped_parallel_cap_constructs_and_replays | certified_or_expected_typed_control | 448.422443 | 445.306918 | 0.993052 | 3622240.667 / 3622240.667 | 304890662.333 / 304890662.333 |
| procedural / selected_chord_charts_keep_original_boundary | certified_or_expected_typed_control | 18.421534 | 17.930264 | 0.973332 | 166323.000 / 166323.000 | 7582253.000 / 7582253.000 |
| procedural / selected_origin_lines_retain_source_and_replay | certified_or_expected_typed_control | 1.142842 | 1.108021 | 0.969531 | 5331.000 / 5331.000 | 439926.000 / 439926.000 |
| procedural / selected_profile_solids_split_both_edge_directions | certified_or_expected_typed_control | 3436.440992 | 3423.688223 | 0.996289 | 26392875.000 / 26392875.000 | 2656307355.000 / 2656307355.000 |
| procedural / selected_profile_solids_reflect_and_replay | certified_or_expected_typed_control | 2617.169984 | 2541.983512 | 0.971272 | 21227846.333 / 21227846.333 | 2143845378.667 / 2143845378.667 |
| procedural / selected_profile_solids_continue_slab_booleans | certified_or_expected_typed_control | 23496.037219 | 23479.219399 | 0.999284 | 194144462.333 / 194144462.333 | 24755989761.667 / 24755989761.667 |
| procedural / selected_profile_archives_reject_forged_proofs_and_recover | certified_or_expected_typed_control | 4253.629762 | 4293.600619 | 1.009397 | 33613906.000 / 33613906.000 | 2905508434.000 / 2905508434.000 |
| procedural / selected_profiles_keep_holes_components_and_reversal | certified_or_expected_typed_control | 6524.442624 | 6426.079778 | 0.984924 | 55091422.333 / 55091422.333 | 6665463162.667 / 6665463162.667 |
| procedural / selected_profiles_preserve_certainty_and_budget_recovery | certified_or_expected_typed_control | 1572.378811 | 1570.164655 | 0.998592 | 12323178.000 / 12323178.000 | 1054509040.000 / 1054509040.000 |
| procedural / selected_procedural_profiles_fail_step_with_attribution_and_native_recovery | certified_or_expected_typed_control | 1177.244395 | 1178.847247 | 1.001362 | 9297386.000 / 9297386.000 | 795862849.000 / 795862849.000 |
| patches / selected_extrusion_patch_builds_and_replays | certified_or_expected_typed_control | 2.488526 | 2.653152 | 1.066154 | 8502.000 / 8502.000 | 1112465.000 / 1112465.000 |
| patches / selected_planar_face_builds_and_replays | certified_or_expected_typed_control | 119.398458 | 120.207081 | 1.006772 | 933004.000 / 933004.000 | 47309704.000 / 47309704.000 |
| patches / selected_patches_reverse_transform_and_split | certified_or_expected_typed_control | 251.392052 | 256.489278 | 1.020276 | 2037554.333 / 2037554.333 | 122417601.667 / 122417601.667 |
| patches / selected_planar_faces_keep_holes_frames_and_orientation | certified_or_expected_typed_control | 629.001662 | 637.418311 | 1.013381 | 4571409.667 / 4571409.667 | 305489027.333 / 305489027.333 |
| patches / selected_planar_patches_keep_holes_and_contact_edits | certified_or_expected_typed_control | 2716.816228 | 2732.311146 | 1.005703 | 21414173.667 / 21414173.667 | 1620971072.333 / 1620971072.333 |
| patches / selected_patch_archives_reject_wrong_images_and_recover | certified_or_expected_typed_control | 20.948405 | 20.612502 | 0.983965 | 74470.000 / 74470.000 | 9967620.000 / 9967620.000 |
| patches / selected_patches_keep_failure_certainty_and_budget_contracts | certified_or_expected_typed_control | 17.672181 | 17.506930 | 0.990649 | 59161.000 / 59161.000 | 7880682.000 / 7880682.000 |
| revolution / selected_meridian_patch_retains_latitudes_and_replays | certified_or_expected_typed_control | new | 8.436645 | absolute | new / 29592.333 | new / 3222293.667 |
| revolution / selected_rotation_retains_points_and_angular_charts | certified_or_expected_typed_control | new | 2.150417 | absolute | new / 7437.333 | new / 654675.667 |
| revolution / selected_revolution_supports_reversal_reflection_and_subdivision | certified_or_expected_typed_control | new | 209.702998 | absolute | new / 1497422.667 | new / 89121297.333 |
| revolution / selected_revolution_rejects_axis_contacts_and_invalid_domains | certified_or_expected_typed_control | new | 1.229983 | absolute | new / 9517.333 | new / 358966.667 |
| revolution / selected_revolution_archives_reject_wrong_images_and_recover | certified_or_expected_typed_control | new | 52.262015 | absolute | new / 198069.000 | new / 22167999.000 |
| revolution / selected_revolution_preserves_certainty_and_budget_recovery | certified_or_expected_typed_control | new | 23.681601 | absolute | new / 84994.000 | new / 9296959.000 |
| revolution / retained_rotation_closed_edges_split_and_replay | certified_or_expected_typed_control | new | 5.033794 | absolute | new / 20422.000 | new / 1865860.000 |
| revolution / selected_revolution_oblique_axes_tangencies_and_exact_gaps | certified_or_expected_typed_control | new | 11.272902 | absolute | new / 43736.333 | new / 4192399.667 |

Process RSS includes the entire cohort, warmup and allocator retention; it is not per-operation retained heap. Executables are local release builds with allocation instrumentation.

| Cohort | Before / after max RSS KiB | Before / after executable bytes |
| --- | ---: | ---: |
| images | 17692 / 18004 | 27945272 / 28117800 |
| spline | 19960 / 20220 | 27926304 / 28097048 |
| measurement | 21292 / 21280 | 28319072 / 28488056 |
| selected | 29052 / 29144 | 27600024 / 27766728 |
| parallel | 14240 / 14080 | 23752448 / 23925920 |
| planar | 21732 / 21468 | 27514944 / 27685944 |
| selected_planar | 21764 / 21608 | 26901280 / 27074936 |
| contacts | 20928 / 20944 | 27379792 / 27543312 |
| procedural | 28316 / 28280 | 27363904 / 27535088 |
| patches | 20300 / 20568 | 25365808 / 25537184 |
| revolution | new / 17356 | new / 25329920 |
