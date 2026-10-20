# Complete cost observations

All 192 original receipts and iterations remain across 22 corpora and 72 processes. 38 cases in seven affected corpora have three alternating pairs; 154 cases in fifteen corpora have one pair as preservation probes. Across all rows the median observed ratio is 0.999352, range 0.818567–1.236156; One row exceeds the 10% review marker; 10 rows increase allocation requests. The six preceding native and nine preceding spline groups have separate three-pair comparisons. Seven new complete groups have absolute costs from three processes, with no ratio against former failures. Every unfavorable observation remains. Shared-host observations and single pairs establish no general speedup or controlled-host timing admission. A fixed three-pair full-arc follow-up retains all twelve receipts; structural-fact replay then has ratio 0.983872, with the original 1.236156 single-pair observation retained separately. Neither campaign establishes a causal or significance claim.

Source and binaries are bound in [cost-summary.json](cost-summary.json).
[Environment and procedure](costs/environment.json) retain toolchain, CPU, affinity,
flags, warmup and measurement boundaries. No task build/test overlaps the timed stages.
Full fixtures, original iterations, assertions, materialization and receipts remain.
Expected-rejection rows retain their original scope. One paired process is preservation
evidence, not a stable latency estimate. Ratios below are candidate/baseline.

## All 192 original rows

| Corpus / case | Pairs | Baseline ns/iteration | Candidate ns/iteration | Ratio | Allocation calls before → after | Requested bytes before → after |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| faceted / step/box | 1 | 793457.170 | 731055.100 | 0.921354 | 1783.000 → 1778.000 | 483637.000 → 483165.000 |
| faceted / step/two_bodies | 1 | 1502394.620 | 1449991.800 | 0.965120 | 3567.000 → 3557.000 | 986005.000 → 985061.000 |
| faceted / step/through_hole | 1 | 2095896.400 | 2044950.000 | 0.975692 | 8159.000 → 8154.000 | 1257626.000 → 1257154.000 |
| faceted / step/oblique_tetrahedron | 1 | 689907.020 | 691070.520 | 1.001686 | 1942.320 → 1942.320 | 341302.120 → 341302.120 |
| faceted / step/units_2000 | 1 | 5173453.800 | 5310799.100 | 1.026548 | 4113.000 → 4113.000 | 5553196.000 → 5553196.000 |
| faceted / step/units_20000 | 1 | 53618082.000 | 52431427.667 | 0.977868 | 40141.000 → 40141.000 | 55501196.000 → 55501196.000 |
| faceted / step/reject_scale_bits | 1 | 203459.330 | 206372.470 | 1.014318 | 1523.010 → 1523.010 | 74368.320 → 74368.320 |
| arc / arc_cached_rational_decomposition | 1 | 8.210 | 8.102 | 0.986863 | not instrumented | not instrumented |
| arc / arc_cached_directed_sweep | 1 | 9.391 | 9.419 | 1.002918 | not instrumented | not instrumented |
| arc / arc_decomposition_point_evaluation | 1 | 28.860 | 28.436 | 0.985312 | not instrumented | not instrumented |
| arc / arc_structural_facts_replay | 1 | 5.445 | 6.731 | 1.236156 | not instrumented | not instrumented |
| arc / major_arc_cached_containment | 1 | 8852.254 | 8713.005 | 0.984270 | not instrumented | not instrumented |
| arc / arc_cached_native_promotion | 1 | 19.066 | 19.290 | 1.011759 | not instrumented | not instrumented |
| arc / arc_cached_top_level_evaluation | 1 | 244.596 | 238.132 | 0.973574 | not instrumented | not instrumented |
| arc / arc_retained_inverse_witness_replay | 1 | 22406.157 | 22568.165 | 1.007231 | not instrumented | not instrumented |
| arc / arc_large_cold_native_promotion_256_arcs | 1 | 2902251.100 | 2875514.900 | 0.990788 | not instrumented | not instrumented |
| arc / arc_large_cached_native_promotion_256_arcs | 1 | 48.200 | 39.800 | 0.825726 | not instrumented | not instrumented |
| arc / arc_large_sparse_path_intersection_256_arcs | 1 | 3015390.200 | 2910235.900 | 0.965127 | not instrumented | not instrumented |
| arc / arc_large_region_containment_256_arcs | 1 | 10207611.700 | 9870172.500 | 0.966942 | not instrumented | not instrumented |
| region_exchange / region_exchange/Butt/reverse_false | 3 | 11594675.000 | 11488325.000 | 0.990828 | 27139.667 → 27139.333 | 4691620.333 → 4691561.667 |
| region_exchange / region_exchange/Butt/reverse_true | 3 | 10860709.667 | 10661001.000 | 0.981612 | 27161.667 → 27161.333 | 4695091.333 → 4695032.667 |
| region_exchange / region_exchange/Round/reverse_false | 3 | 27732515.667 | 27394508.000 | 0.987812 | 95307.667 → 95307.000 | 10638346.333 → 10638229.000 |
| region_exchange / region_exchange/Round/reverse_true | 3 | 27878781.333 | 27488432.667 | 0.985998 | 94996.333 → 94996.333 | 10637774.667 → 10637774.667 |
| closed_edges / closed_edges/build | 1 | 325748.340 | 266646.910 | 0.818567 | 696.010 → 696.010 | 128254.760 → 128254.760 |
| closed_edges / closed_edges/replay | 1 | 432507.810 | 427943.020 | 0.989446 | 995.000 → 995.000 | 160841.000 → 160841.000 |
| closed_edges / closed_edges/split_circle | 1 | 193174.740 | 189537.020 | 0.981169 | 466.000 → 466.000 | 113546.000 → 113546.000 |
| closed_edges / closed_edges/split_seam | 1 | 187747.080 | 183601.550 | 0.977920 | 455.000 → 455.000 | 114402.000 → 114402.000 |
| closed_edges / closed_edges/reversed_shifted_replay | 1 | 497774.320 | 492315.200 | 0.989033 | 1746.000 → 1746.000 | 218449.000 → 218449.000 |
| edge_images / edge_images/fresh_cylinder | 3 | 31886.177 | 32733.652 | 1.026578 | 110.000 → 110.000 | 9592.000 → 9592.000 |
| edge_images / edge_images/reused_cylinder | 3 | 12152.813 | 12271.135 | 1.009736 | 61.000 → 61.000 | 3656.000 → 3656.000 |
| edge_images / edge_images/reject_wrong_radius | 3 | 11975.514 | 12142.981 | 1.013984 | 61.000 → 61.000 | 3656.000 → 3656.000 |
| oblique / oblique/identity | 1 | 9033463952.000 | 9042493408.000 | 1.001000 | 67550508.000 → 67550508.000 | 4064437560.000 → 4064437560.000 |
| oblique / oblique/millimetre_reflection | 1 | 11938403798.000 | 11684229799.000 | 0.978710 | 89975513.000 → 89975513.000 | 5666630630.000 → 5666630630.000 |
| oblique / oblique/radical_reflection | 1 | 11190608131.000 | 10905188115.000 | 0.974495 | 85452163.000 → 85452163.000 | 5132851613.000 → 5132851613.000 |
| coplanar / coplanar/torus_axial/recut | 3 | 339917308.000 | 339696170.667 | 0.999349 | 1764095.000 → 1764095.000 | 136058067.000 → 136058067.000 |
| coplanar / coplanar/torus_axial/clear_and_recover | 3 | 235905103.000 | 236320673.333 | 1.001762 | 1243508.000 → 1243508.000 | 94075511.000 → 94075511.000 |
| coplanar / coplanar/torus_axial/reconstruct | 3 | 687700701.333 | 689112981.000 | 1.002054 | 3477684.000 → 3477684.000 | 281825726.000 → 281825726.000 |
| coplanar / coplanar/torus_longitudinal/recut | 3 | 297281197.000 | 297673522.000 | 1.001320 | 1515314.000 → 1515314.000 | 118238461.000 → 118238461.000 |
| coplanar / coplanar/torus_longitudinal/clear_and_recover | 3 | 214290725.333 | 215084135.333 | 1.003702 | 1116057.000 → 1116057.000 | 84753728.000 → 84753728.000 |
| coplanar / coplanar/torus_longitudinal/reconstruct | 3 | 612602244.000 | 613651838.000 | 1.001713 | 3106619.000 → 3106619.000 | 249111616.000 → 249111616.000 |
| coplanar / coplanar/cone_longitudinal/recut | 3 | 231639492.667 | 233071020.333 | 1.006180 | 1203771.000 → 1203771.000 | 103425025.000 → 103425025.000 |
| coplanar / coplanar/cone_longitudinal/clear_and_recover | 3 | 179892058.667 | 180141306.667 | 1.001386 | 958720.000 → 958720.000 | 80765019.000 → 80765019.000 |
| coplanar / coplanar/cone_longitudinal/reconstruct | 3 | 362543426.000 | 365394972.667 | 1.007865 | 1858385.000 → 1858385.000 | 147282702.000 → 147282702.000 |
| coplanar / coplanar/similarity_matrix | 3 | 27175582749.000 | 27240866026.000 | 1.002402 | 169069352.000 → 169069352.000 | 12257681944.000 → 12257681944.000 |
| coplanar / coplanar/circular_boundary_provenance | 3 | 17141055.000 | 17015701.000 | 0.992687 | 44146.000 → 44146.000 | 7780872.000 → 7780872.000 |
| prisms / prisms/same_height | 3 | 128339336.000 | 127942047.000 | 0.996904 | 583419.000 → 583487.000 | 51734927.000 → 51738615.000 |
| prisms / prisms/covering_cylinders | 3 | 4979524215.000 | 5010679250.000 | 1.006257 | 34660312.000 → 34660469.000 | 2223882765.000 → 2223893933.000 |
| prisms / prisms/covering_bores | 3 | 584363553.000 | 585009048.000 | 1.001105 | 2059860.000 → 2059880.000 | 236363966.000 → 236365446.000 |
| prisms / prisms/annular_cut | 3 | 38363046.000 | 38060582.000 | 0.992116 | 131004.000 → 131004.000 | 14717790.000 → 14717790.000 |
| export / export/box | 1 | 63608.533 | 63396.321 | 0.996664 | 733.000 → 733.000 | 21612.000 → 21612.000 |
| export / export/hole | 1 | 101732.044 | 102629.034 | 1.008817 | 1341.002 → 1341.002 | 43892.352 → 43892.352 |
| export / export/concave | 1 | 91539.410 | 90655.544 | 0.990344 | 1125.002 → 1125.002 | 39514.352 → 39514.352 |
| export / export/split | 1 | 60794.190 | 59939.830 | 0.985947 | 767.000 → 767.000 | 28832.000 → 28832.000 |
| export / export/32_bodies | 1 | 1703526.600 | 1690873.900 | 0.992573 | 21979.000 → 21979.000 | 686805.000 → 686805.000 |
| export / export/reject_third | 1 | 3155.927 | 3207.804 | 1.016438 | 42.000 → 42.000 | 2606.000 → 2606.000 |
| sectors / sectors/torus_axial_quarter | 1 | 766301301.667 | 764083220.000 | 0.997105 | 3698371.000 → 3698371.000 | 292339487.000 → 292339487.000 |
| sectors / sectors/torus_longitudinal_quarter | 1 | 495115084.333 | 492967080.333 | 0.995662 | 2412616.000 → 2412616.000 | 195358523.000 → 195358523.000 |
| sectors / sectors/cone_longitudinal_quarter | 1 | 460344501.000 | 460026052.000 | 0.999308 | 2209769.667 → 2209769.667 | 185016062.333 → 185016062.333 |
| sectors / sectors/torus_longitudinal_band | 1 | 3063535740.000 | 3047564588.667 | 0.994787 | 20054534.333 → 20054534.333 | 1344076863.667 → 1344076863.667 |
| sectors / sectors/cone_longitudinal_band | 1 | 425243431.667 | 423460616.333 | 0.995808 | 2115288.000 → 2115288.000 | 172827413.000 → 172827413.000 |
| sectors / sectors/similarity_matrix | 1 | 48099854517.000 | 47779054492.000 | 0.993331 | 329472152.000 → 329472152.000 | 22537838172.000 → 22537838172.000 |
| sectors / sectors/annular_partition | 1 | 11819061.333 | 11684879.333 | 0.988647 | 22754.000 → 22754.000 | 5031760.000 → 5031760.000 |
| sectors / sectors/rotated_torus_reconstruction_false | 1 | 12591390096.000 | 12443909183.000 | 0.988287 | 97064087.000 → 97064087.000 | 7339194207.000 → 7339194207.000 |
| sectors / sectors/rotated_torus_reconstruction_true | 1 | 13315382540.000 | 13161007392.000 | 0.988406 | 103902640.000 → 103902640.000 | 7769944069.000 → 7769944069.000 |
| sectors / sectors/rotated_cone_reconstruction_false | 1 | 3583714325.000 | 3563288829.000 | 0.994300 | 25412731.000 → 25412731.000 | 1648434002.000 → 1648434002.000 |
| sectors / sectors/rotated_cone_reconstruction_true | 1 | 3166219636.000 | 3126190642.000 | 0.987357 | 22030330.000 → 22030330.000 | 1411816726.000 → 1411816726.000 |
| sectors / sectors/rotated_cone_band | 1 | 9291157017.000 | 9220820103.000 | 0.992430 | 74228912.000 → 74228912.000 | 4610128681.000 → 4610128681.000 |
| advanced / advanced/box_3d | 3 | 1071589.350 | 1073157.910 | 1.001464 | 2524.000 → 2524.000 | 643678.000 → 643678.000 |
| advanced / advanced/box_pcurves | 3 | 1280225.050 | 1296006.130 | 1.012327 | 3009.000 → 3009.000 | 818206.000 → 818206.000 |
| advanced / advanced/hole | 3 | 3087779.710 | 3109601.990 | 1.007067 | 9923.000 → 9918.000 | 1909311.000 → 1908839.000 |
| advanced / advanced/two_bodies | 3 | 2374160.400 | 2405444.230 | 1.013177 | 5913.000 → 5913.000 | 1370389.000 → 1370389.000 |
| advanced / advanced/reparameterized | 3 | 1290886.370 | 1301512.050 | 1.008231 | 3015.000 → 3015.000 | 818542.000 → 818542.000 |
| advanced / advanced/reject_alternate_sense | 3 | 308365.306 | 308712.262 | 1.001125 | 416.000 → 416.000 | 345256.000 → 345256.000 |
| analytic_similarity / similarity/rational_replay | 1 | 3280051.290 | 3212632.840 | 0.979446 | 11818.240 → 11818.240 | 1482240.640 → 1482240.640 |
| analytic_similarity / similarity/reflected_replay | 1 | 3480411.990 | 3455441.030 | 0.992825 | 13515.240 → 13515.310 | 1643192.640 → 1643204.960 |
| analytic_similarity / similarity/radical_replay | 1 | 8243676.240 | 8280614.530 | 1.004481 | 61508.010 → 61508.010 | 4202219.760 → 4202219.760 |
| analytic_similarity / similarity/primitive_matrix | 1 | 463125463.000 | 464504224.000 | 1.002977 | 2589596.000 → 2589648.000 | 206399333.000 → 206401829.000 |
| analytic_similarity / similarity/clipped_void_matrix | 1 | 1179226816.000 | 1185008441.000 | 1.004903 | 7224579.000 → 7224837.000 | 513107411.000 → 512999083.000 |
| analytic_similarity / similarity/selected_three_cycles | 1 | 25415779.000 | 25184801.000 | 0.990912 | 81764.500 → 81764.500 | 10423999.000 → 10423999.000 |
| analytic_similarity / similarity/periodic_near | 1 | 20642076.000 | 20628740.000 | 0.999354 | 74594.000 → 74594.000 | 8581515.000 → 8581515.000 |
| analytic_similarity / similarity/profile_families | 1 | 206833218.000 | 205753882.000 | 0.994782 | 1131540.000 → 1130150.000 | 87719990.000 → 87640494.000 |
| analytic_similarity / similarity/rejection_recovery | 1 | 5664316.300 | 5641606.220 | 0.995991 | 17253.920 → 17254.040 | 2753220.920 → 2753242.040 |
| circles / circles/closed_fresh_document | 1 | 1692114.560 | 1625158.670 | 0.960431 | 10995.000 → 10995.000 | 839213.000 → 839213.000 |
| circles / circles/closed_reused_document | 1 | 1582025.580 | 1575012.040 | 0.995567 | 10939.000 → 10939.000 | 766961.000 → 766961.000 |
| circles / circles/partial_fresh_document | 1 | 7365755.440 | 7351611.620 | 0.998080 | 57417.000 → 57417.000 | 3434325.000 → 3434325.000 |
| circles / circles/partial_reused_document | 1 | 7318570.520 | 7328221.050 | 1.001319 | 57361.000 → 57361.000 | 3362073.000 → 3362073.000 |
| circles / circles/edits_replay_composition | 1 | 14967922.160 | 14979140.880 | 1.000750 | 107454.600 → 107454.600 | 7612169.280 → 7612169.280 |
| circles / circles/reject_off_circle | 1 | 74675.612 | 75894.058 | 1.016317 | 137.000 → 137.000 | 87020.000 → 87020.000 |
| seam_cuts / seams/torus_axial | 1 | 253056208.667 | 253380917.000 | 1.001283 | 1330339.000 → 1330339.000 | 104088829.000 → 104088829.000 |
| seam_cuts / seams/torus_longitudinal | 1 | 252959074.333 | 253173028.000 | 1.000846 | 1325398.333 → 1325398.333 | 102871954.667 → 102871954.667 |
| seam_cuts / seams/cone_longitudinal | 1 | 212943700.333 | 216030788.333 | 1.014497 | 1151449.000 → 1151449.000 | 96439871.000 → 96439871.000 |
| seam_cuts / seams/similarity_matrix | 1 | 6373891789.000 | 6372836508.000 | 0.999834 | 40830136.000 → 40830136.000 | 2917847164.000 → 2917847164.000 |
| seam_cuts / seams/boundary_provenance | 1 | 105803820.333 | 105338108.667 | 0.995598 | 481849.000 → 481849.000 | 46449070.000 → 46449070.000 |
| seam_cuts / seams/closed_boundary | 1 | 1719904.000 | 1831308.000 | 1.064773 | 3964.000 → 3964.000 | 812172.000 → 812172.000 |
| pcurves / pcurves/full_fresh | 3 | 1498758.940 | 1517814.110 | 1.012714 | 7957.000 → 7957.000 | 709557.000 → 709557.000 |
| pcurves / pcurves/full_reused | 3 | 1446959.140 | 1448644.090 | 1.001164 | 7900.000 → 7900.000 | 588153.000 → 588153.000 |
| pcurves / pcurves/partial_fresh | 3 | 5547213.280 | 5575290.710 | 1.005062 | 35823.000 → 35823.000 | 2341677.000 → 2341677.000 |
| pcurves / pcurves/partial_reused | 3 | 5469443.710 | 5507953.690 | 1.007041 | 35766.000 → 35766.000 | 2220273.000 → 2220273.000 |
| pcurves / pcurves/edit_replay_composition | 3 | 4924889.700 | 4907637.700 | 0.996497 | 28464.000 → 28464.000 | 2709034.000 → 2709034.000 |
| pcurves / pcurves/reject_nonmaster_height | 3 | 304576.080 | 306324.670 | 1.005741 | 1616.000 → 1616.000 | 217772.000 → 217772.000 |
| cone_exchange / cone_exchange/repeated_modeling_source_maps_replay | 1 | 2836444873.000 | 2821538941.000 | 0.994745 | 19201760.000 → 19201760.000 | 1214351813.000 → 1214351813.000 |
| analytic_export / analytic_export/native_cylinder | 1 | 120573.954 | 123632.976 | 1.025371 | 1438.000 → 1438.000 | 43117.000 → 43117.000 |
| analytic_export / analytic_export/32_bodies | 1 | 3587772.800 | 3596405.667 | 1.002406 | 44508.000 → 44508.000 | 1381435.000 → 1381435.000 |
| analytic_export / analytic_export/closed_imported | 1 | 75251.296 | 76090.372 | 1.011150 | 801.000 → 801.000 | 27260.000 → 27260.000 |
| analytic_export / analytic_export/partial_imported | 1 | 156292.750 | 157315.587 | 1.006544 | 1580.000 → 1580.000 | 64180.000 → 64180.000 |
| analytic_export / analytic_export/radical_imported | 1 | 153594.815 | 154401.425 | 1.005252 | 1549.000 → 1549.000 | 53492.000 → 53492.000 |
| analytic_export / analytic_export/planar_hole | 1 | 222722.807 | 221486.370 | 0.994449 | 2451.000 → 2451.000 | 90936.000 → 90936.000 |
| analytic_export / analytic_export/edit_roundtrip | 1 | 110849854.800 | 111529273.400 | 1.006129 | 863275.000 → 863275.000 | 51146896.000 → 51146896.000 |
| analytic_export / analytic_export/reject_third | 1 | 9642.836 | 9835.880 | 1.020019 | 107.000 → 107.000 | 5161.000 → 5161.000 |
| torus_exchange / torus_exchange/whole_frames_units | 1 | 220380812.000 | 216277183.000 | 0.981379 | 1134934.000 → 1134934.000 | 92208068.000 → 92208068.000 |
| torus_exchange / torus_exchange/halves_reconstruction | 1 | 1722867535.000 | 1718607311.000 | 0.997527 | 8285071.000 → 8285071.000 | 669333803.000 → 669333803.000 |
| torus_exchange / torus_exchange/rational_band | 1 | 895023916.000 | 890953221.000 | 0.995452 | 7068706.000 → 7068706.000 | 470993190.000 → 470993190.000 |
| prism_exchange / prism_exchange/half_cylinder | 3 | 16770900.000 | 16580351.000 | 0.988638 | 59075.000 → 59066.000 | 6370823.000 → 6370319.000 |
| prism_exchange / prism_exchange/annular_prism | 3 | 29670420.000 | 30215628.000 | 1.018375 | 98140.000 → 98131.000 | 11582109.000 → 11581605.000 |
| prism_exchange / prism_exchange/preserved_planar | 3 | 75333142.000 | 76313979.000 | 1.013020 | 235006.000 → 234977.000 | 38227389.000 → 38225413.000 |
| prism_exchange / prism_exchange/covering_circular | 3 | 134981487.000 | 135879166.000 | 1.006650 | 505332.000 → 505329.000 | 56232059.000 → 56231939.000 |
| kernel / planar_kernel/cuboid_build_measure_classify | 1 | 453656.691 | 461582.577 | 1.017471 | not instrumented | not instrumented |
| kernel / analytic_kernel/cylinder_build_measure_classify | 1 | 971649.718 | 976486.247 | 1.004978 | not instrumented | not instrumented |
| kernel / analytic_kernel/sphere_build_measure_classify | 1 | 13115.403 | 12369.808 | 0.943151 | not instrumented | not instrumented |
| kernel / analytic_kernel/cone_frustum_build_measure_classify | 1 | 1165585.050 | 1165181.730 | 0.999654 | not instrumented | not instrumented |
| kernel / analytic_kernel/torus_build_measure_classify | 1 | 2684424.508 | 2653850.856 | 0.988611 | not instrumented | not instrumented |
| kernel / analytic_kernel/revolve_build_measure_classify | 1 | 2270379.640 | 2286274.340 | 1.007001 | not instrumented | not instrumented |
| kernel / analytic_kernel/line_arc_profile_revolution_build_measure_classify | 1 | 1648448.250 | 1667299.710 | 1.011436 | not instrumented | not instrumented |
| kernel / analytic_kernel/linear_sweep_build_measure_classify | 1 | 611881.556 | 618964.588 | 1.011576 | not instrumented | not instrumented |
| kernel / spline_kernel/fixed_frame_curved_sweep_build_measure_classify | 1 | 706035.890 | 716514.900 | 1.014842 | not instrumented | not instrumented |
| kernel / spline_kernel/moving_frame_taper_build_measure_classify | 1 | 569550.090 | 580306.190 | 1.018885 | not instrumented | not instrumented |
| kernel / analytic_kernel/homothetic_loft_build_measure_classify | 1 | 895307.060 | 911238.508 | 1.017794 | not instrumented | not instrumented |
| kernel / spline_kernel/convex_corresponding_bilinear_loft_build_measure_classify | 1 | 487969.964 | 498366.316 | 1.021305 | not instrumented | not instrumented |
| kernel / spline_kernel/multi_section_c0_loft_build_measure_classify | 1 | 831926.720 | 848662.980 | 1.020117 | not instrumented | not instrumented |
| kernel / editing_kernel/cuboid_edge_split_revalidate | 1 | 91909.704 | 92979.728 | 1.011642 | not instrumented | not instrumented |
| kernel / editing_kernel/cuboid_face_split_revalidate | 1 | 72597.408 | 73750.716 | 1.015886 | not instrumented | not instrumented |
| kernel / editing_kernel/cuboid_curve_face_split_revalidate | 1 | 301739.280 | 304590.944 | 1.009451 | not instrumented | not instrumented |
| kernel / editing_kernel/cuboid_multi_trace_face_partition_revalidate | 1 | 708053.168 | 715050.724 | 1.009883 | not instrumented | not instrumented |
| kernel / editing_kernel/cuboid_crossing_trace_arrangement_revalidate | 1 | 407752.224 | 410569.892 | 1.006910 | not instrumented | not instrumented |
| kernel / spline_kernel/affine_tensor_cap_revalidate_measure | 1 | 367482.704 | 379987.796 | 1.034029 | not instrumented | not instrumented |
| kernel / spline_kernel/rational_bezier_patch_build_validate | 1 | 136467.248 | 139432.844 | 1.021731 | not instrumented | not instrumented |
| kernel / spline_kernel/nurbs_patch_build_validate | 1 | 592852.618 | 580327.572 | 0.978873 | not instrumented | not instrumented |
| kernel / spline_kernel/nurbs_planar_face_build_exact_area | 1 | 381958.248 | 387518.252 | 1.014557 | not instrumented | not instrumented |
| kernel / spline_kernel/nurbs_path_extrusion_build_exact_volume | 1 | 837643.366 | 840950.220 | 1.003948 | not instrumented | not instrumented |
| kernel / spline_kernel/nurbs_extrusion_patch_build_exact_area | 1 | 324392.332 | 321078.724 | 0.989785 | not instrumented | not instrumented |
| kernel / spline_kernel/nurbs_revolution_patch_build_exact_area | 1 | 450290.092 | 439798.760 | 0.976701 | not instrumented | not instrumented |
| kernel / spline_kernel/separable_affine_tensor_exact_area | 1 | 43059.115 | 42904.383 | 0.996407 | not instrumented | not instrumented |
| kernel / spline_kernel/projectively_stitched_tensor_patch_shell | 1 | 146575.142 | 151373.182 | 1.032734 | not instrumented | not instrumented |
| kernel / spline_kernel/linear_tensor_plane_iso_curve_intersection | 1 | 10378.512 | 10557.070 | 1.017205 | not instrumented | not instrumented |
| kernel / spline_kernel/curved_translation_tensor_plane_noniso_intersection | 1 | 30608.614 | 29433.596 | 0.961612 | not instrumented | not instrumented |
| kernel / spline_kernel/rational_bilinear_tensor_plane_rational_quartic_intersection | 1 | 74244.988 | 72212.152 | 0.972620 | not instrumented | not instrumented |
| kernel / spline_kernel/native_nurbs_bilinear_plane_rational_quartic_intersection | 1 | 78925.854 | 78612.684 | 0.996032 | not instrumented | not instrumented |
| kernel / spline_kernel/rational_bilinear_tensor_plane_two_pole_branches | 1 | 136417.292 | 135939.332 | 0.996496 | not instrumented | not instrumented |
| kernel / spline_kernel/rational_bilinear_tensor_plane_complete_containment | 1 | 973.080 | 954.738 | 0.981151 | not instrumented | not instrumented |
| kernel / spline_kernel/rational_bilinear_tensor_plane_partial_face_region | 1 | 681128.548 | 670625.808 | 0.984580 | not instrumented | not instrumented |
| kernel / spline_kernel/noniso_tensor_face_intersection_and_validated_split | 1 | 62142.970 | 60852.690 | 0.979237 | not instrumented | not instrumented |
| kernel / spline_kernel/noniso_nurbs_tensor_face_intersection_and_validated_split | 1 | 127960.930 | 129343.750 | 1.010807 | not instrumented | not instrumented |
| kernel / spline_kernel/noniso_v_nurbs_tensor_face_intersection_and_validated_split | 1 | 134732.000 | 132126.150 | 0.980659 | not instrumented | not instrumented |
| kernel / spline_kernel/noniso_multi_span_nurbs_tensor_face_intersection_and_validated_split | 1 | 158323.060 | 159008.410 | 1.004329 | not instrumented | not instrumented |
| kernel / spline_kernel/partial_noniso_nurbs_tensor_intersection_and_validated_partition | 1 | 3972758.820 | 3979248.180 | 1.001633 | not instrumented | not instrumented |
| kernel / spline_kernel/crossing_tensor_pcurve_arrangement_and_validated_partition | 1 | 1373751.100 | 1379892.370 | 1.004470 | not instrumented | not instrumented |
| kernel / spline_kernel/tensor_face_intersection_and_validated_split | 1 | 606340.570 | 602821.470 | 0.994196 | not instrumented | not instrumented |
| kernel / spline_kernel/affine_tensor_inverse_pcurve_boundary_partition | 1 | 437757.290 | 439777.120 | 1.004614 | not instrumented | not instrumented |
| kernel / spline_kernel/curved_affine_tensor_inverse_pcurve_partition | 1 | 1055742.200 | 1047524.640 | 0.992216 | not instrumented | not instrumented |
| kernel / spline_kernel/mobius_affine_tensor_inverse_pcurve_partition | 1 | 1068894.600 | 1061007.450 | 0.992621 | not instrumented | not instrumented |
| kernel / spline_kernel/native_nurbs_mobius_inverse_pcurve_partition | 1 | 1361514.840 | 1342025.060 | 0.985685 | not instrumented | not instrumented |
| kernel / spline_kernel/circular_affine_tensor_inverse_pcurve_partition | 1 | 1595639.040 | 1579170.190 | 0.989679 | not instrumented | not instrumented |
| kernel / spline_kernel/mixed_spline_affine_tensor_inverse_pcurve_partition | 1 | 1149376.430 | 1140288.890 | 0.992094 | not instrumented | not instrumented |
| kernel / spline_kernel/holed_affine_tensor_paired_bridge_partition | 1 | 1657915.330 | 1676760.260 | 1.011367 | not instrumented | not instrumented |
| kernel / spline_kernel/multi_hole_affine_tensor_bridge_cycle_partition | 1 | 3148839.090 | 3199233.580 | 1.016004 | not instrumented | not instrumented |
| kernel / boolean_kernel/disjoint_cuboid_intersection_graph | 1 | 21163.664 | 20966.716 | 0.990694 | not instrumented | not instrumented |
| kernel / boolean_kernel/overlapping_cuboid_trimmed_intersection_graph | 1 | 5004847.292 | 4909653.352 | 0.980980 | not instrumented | not instrumented |
| kernel / boolean_kernel/retained_graph_planar_face_partition | 1 | 4902015.272 | 4883233.240 | 0.996169 | not instrumented | not instrumented |
| kernel / boolean_kernel/retained_graph_planar_face_classify_select | 1 | 9969278.256 | 10004987.236 | 1.003582 | not instrumented | not instrumented |
| kernel / boolean_kernel/retained_graph_planar_face_stitch_union | 1 | 23740504.380 | 23877827.420 | 1.005784 | not instrumented | not instrumented |
| kernel / boolean_kernel/skew_cuboid_convex_intersection | 1 | 24335573.000 | 24673289.920 | 1.013878 | not instrumented | not instrumented |
| kernel / boolean_kernel/skew_cuboid_general_difference | 1 | 58392008.500 | 58300455.000 | 0.998432 | not instrumented | not instrumented |
| kernel / boolean_kernel/skew_cuboid_general_void_difference | 1 | 38356991.300 | 38095173.900 | 0.993174 | not instrumented | not instrumented |
| kernel / boolean_kernel/sphere_planar_conic_trim_graph | 1 | 22477778.900 | 22193464.608 | 0.987351 | not instrumented | not instrumented |
| kernel / boolean_kernel/disjoint_sphere_union_remap_validate | 1 | 11393.268 | 11605.764 | 1.018651 | not instrumented | not instrumented |
| kernel / boolean_kernel/partial_sphere_intersection_build_measure | 1 | 421076.480 | 409507.210 | 0.972525 | not instrumented | not instrumented |
| kernel / boolean_kernel/oriented_cylinder_interval_cut_build_measure | 1 | 2784194.670 | 2800260.080 | 1.005770 | not instrumented | not instrumented |
| kernel / boolean_kernel/cone_frustum_interval_cut_build_measure | 1 | 3000899.200 | 3007864.920 | 1.002321 | not instrumented | not instrumented |
| kernel / boolean_kernel/axial_half_frustum_build_measure_replay | 1 | 160864128.200 | 159738033.400 | 0.993000 | not instrumented | not instrumented |
| kernel / boolean_kernel/coaxial_revolution_cavity_build_measure | 1 | 6610020.880 | 6663227.520 | 1.008049 | not instrumented | not instrumented |
| axial_exchange / axial_exchange/disjoint_false/reflected_false | 1 | 62487419.333 | 62388334.667 | 0.998414 | 221596.000 → 221597.333 | 23766620.000 → 23766718.667 |
| axial_exchange / axial_exchange/disjoint_false/reflected_true | 1 | 62623228.000 | 62805422.333 | 1.002909 | 223721.333 → 223721.333 | 23955121.667 → 23955121.667 |
| axial_exchange / axial_exchange/disjoint_true/reflected_false | 1 | 46874266.333 | 47096930.333 | 1.004750 | 173320.333 → 173319.000 | 17898300.667 → 17898202.000 |
| axial_exchange / axial_exchange/disjoint_true/reflected_true | 1 | 47283025.333 | 47511208.000 | 1.004826 | 175446.000 → 175446.000 | 18086611.000 → 18086611.000 |
| axial_shell_exchange / axial_shell_exchange/kind_0/reflected_false | 1 | 2087373453.667 | 2081807204.000 | 0.997333 | 7976246.667 → 7976297.667 | 764556472.333 → 764559568.333 |
| axial_shell_exchange / axial_shell_exchange/kind_0/reflected_true | 1 | 2108542490.333 | 2105073432.000 | 0.998355 | 7974147.000 → 7974130.333 | 774200661.000 → 774199647.667 |
| axial_shell_exchange / axial_shell_exchange/kind_1/reflected_false | 1 | 2067963523.667 | 2059584968.000 | 0.995948 | 7779338.000 → 7779325.667 | 752221072.000 → 752220581.333 |
| axial_shell_exchange / axial_shell_exchange/kind_1/reflected_true | 1 | 2071302297.667 | 2061610815.667 | 0.995321 | 7674188.667 → 7674184.333 | 756501271.333 → 756500868.667 |
| axial_shell_exchange / axial_shell_exchange/kind_2/reflected_false | 1 | 3060737809.667 | 3052182081.333 | 0.997205 | 10819091.000 → 10819091.333 | 1102214078.000 → 1102214136.667 |
| axial_shell_exchange / axial_shell_exchange/kind_2/reflected_true | 1 | 3090408757.333 | 3076614203.333 | 0.995536 | 10857709.667 → 10857709.333 | 1118157511.333 → 1118157452.667 |
| axial_shell_exchange / axial_shell_exchange/kind_3/reflected_false | 1 | 2502702489.000 | 2497358630.667 | 0.997865 | 9251901.000 → 9251891.000 | 1018750685.000 → 1018749741.000 |
| axial_shell_exchange / axial_shell_exchange/kind_3/reflected_true | 1 | 2523804242.333 | 2519308690.000 | 0.998219 | 9161334.000 → 9161324.000 | 1024134980.000 → 1024134036.000 |

## Preceding six native/control groups

[All trials and exact outcomes](prior-native-cost-summary.json). Three alternating pairs, original complete assertions.

| Case / outcome | Baseline ms | Candidate ms | Ratio | Calls before → after | Bytes before → after |
| --- | ---: | ---: | ---: | ---: | ---: |
| eight_profiles / certified | 94.283634 | 94.336290 | 1.000558 | 455838.333 → 455838.333 | 37217198.667 → 37217198.667 |
| cut_restore_replay / certified | 6.382352 | 6.386747 | 1.000689 | 21350.000 → 21350.000 | 2672194.000 → 2672194.000 |
| thin_touching_components / certified | 8.087647 | 8.069215 | 0.997721 | 36412.667 → 36407.000 | 3610316.333 → 3610039.000 |
| planar_replay / certified | 0.706959 | 0.704637 | 0.996716 | 1553.000 → 1553.000 | 229966.000 → 229966.000 |
| unequal_holes / expected_typed_rejection | 2.784145 | 2.773816 | 0.996290 | 9294.000 → 9294.000 | 1195312.000 → 1195312.000 |
| self_intersecting / expected_typed_rejection | 0.040438 | 0.039064 | 0.966022 | 104.000 → 104.000 | 23312.000 → 23312.000 |

## Preceding nine spline/control groups

[All trials and exact outcomes](prior-spline-cost-summary.json). Three alternating pairs, original complete assertions.

| Case / outcome | Baseline ms | Candidate ms | Ratio | Calls before → after | Bytes before → after |
| --- | ---: | ---: | ---: | ---: | ---: |
| retained_spline_profiles_complete_step_replay_and_repeated_cuts / certified_or_expected_typed_control | 232.191247 | 232.851315 | 1.002843 | 826107.333 → 826109.333 | 90506094.667 → 90506310.667 |
| independent_splines_retain_charts_weights_trims_units_and_modeling / certified_or_expected_typed_control | 99.685911 | 100.206242 | 1.005220 | 276109.333 → 276050.667 | 39381689.667 → 39378428.333 |
| invalid_spline_records_and_exhausted_limits_never_publish_a_body / certified_or_expected_typed_control | 2.612012 | 2.614020 | 1.000769 | 4048.000 → 4048.000 | 2045445.000 → 2045445.000 |
| spline_whole_images_ambiguous_trims_and_supplied_pcurves_are_checked / certified_or_expected_typed_control | 9.162773 | 9.241080 | 1.008546 | 17945.000 → 17936.000 | 3961302.000 → 3960798.000 |
| spline_write_limits_units_and_exact_numeric_failures_are_explicit / certified_or_expected_typed_control | 4.046978 | 4.069313 | 1.005519 | 14008.000 → 14008.000 | 1585648.000 → 1585648.000 |
| spline_views_retain_weights_knots_and_reversed_subcurve_charts / certified_or_expected_typed_control | 0.101797 | 0.103144 | 1.013235 | 338.000 → 338.000 | 74568.000 → 74568.000 |
| planar_pcurves_prove_whole_image_and_retain_parameter_correspondence / certified_or_expected_typed_control | 0.138432 | 0.137903 | 0.996179 | 232.000 → 232.000 | 53016.000 → 53016.000 |
| extrusion_location_preserves_oblique_nonunit_direction_and_source_parameters / certified_or_expected_typed_control | 1.161016 | 1.192195 | 1.026855 | 3634.000 → 3634.000 | 251392.000 → 251392.000 |
| extrusion_location_keeps_ambiguity_and_rejects_nontransverse_or_nonplanar_charts / certified_or_expected_typed_control | 0.057096 | 0.062768 | 1.099354 | 148.000 → 148.000 | 20940.000 → 20940.000 |

## Seven new full groups, absolute costs

[All three fresh processes](new-cost-summary.json) include one whole-group warmup
and three timed repetitions per process. Each group contains multiple complete
workflows and controls. No former-error ratio is defined.

| Case / outcome | Median ms/group | Calls/group | Requested bytes/group |
| --- | ---: | ---: | ---: |
| planar_spline_incidence_does_not_require_low_degree_root_solving / certified_or_expected_typed_control | 0.614480 | 1050.000 | 216592.000 |
| rational_prism_validity_does_not_require_a_closed_form_measurement / certified_or_expected_typed_control | 408.272353 | 3687779.000 | 186755224.000 |
| holes_components_and_affine_images_keep_optional_measurements / certified_or_expected_typed_control | 503.867364 | 3131620.000 | 228749080.000 |
| measurement_absence_survives_empty_identities_and_repeated_slab_cuts / certified_or_expected_typed_control | 436.106053 | 2266864.000 | 209220892.000 |
| inward_and_damaged_archives_remain_invalid_without_volume / certified_or_expected_typed_control | 17.070318 | 107778.667 | 9484655.333 |
| independent_quintic_step_admits_and_replays_without_measurement / certified_or_expected_typed_control | 326.158537 | 2337304.333 | 140792446.667 |
| malformed_quintic_step_and_budget_failure_cannot_publish_geometry / certified_or_expected_typed_control | 17.547942 | 129540.000 | 8004346.000 |

Allocation bytes are cumulative requests, not retained live heap. Process RSS,
binary growth, adverse rows and limitations are reviewed in [resource-review.md](resource-review.md).


## Fixed three-pair complete arc follow-up

[Predeclared procedure](arc-followup-contract.md) and [every raw trial](arc-followup.json)
retain all twelve original rows. These observations do not replace the main pair.

| Case | Baseline ns | Candidate ns | Ratio |
| --- | ---: | ---: | ---: | ---: |
| arc_cached_rational_decomposition | 8.513 | 8.658 | 1.016976 |
| arc_cached_directed_sweep | 9.938 | 9.452 | 0.951101 |
| arc_decomposition_point_evaluation | 28.464 | 28.358 | 0.996257 |
| arc_structural_facts_replay | 5.475 | 5.387 | 0.983872 |
| major_arc_cached_containment | 9081.732 | 9085.636 | 1.000430 |
| arc_cached_native_promotion | 19.373 | 19.248 | 0.993545 |
| arc_cached_top_level_evaluation | 228.503 | 229.482 | 1.004286 |
| arc_retained_inverse_witness_replay | 22796.331 | 22263.945 | 0.976646 |
| arc_large_cold_native_promotion_256_arcs | 3024396.100 | 2864503.400 | 0.947132 |
| arc_large_cached_native_promotion_256_arcs | 46.500 | 44.300 | 0.952688 |
| arc_large_sparse_path_intersection_256_arcs | 2980424.700 | 2908701.600 | 0.975935 |
| arc_large_region_containment_256_arcs | 10019774.800 | 9872548.100 | 0.985306 |
