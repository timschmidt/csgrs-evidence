
#[test]
fn compound_rotation_families_on_each_axis_retain_exact_continuation() {
    let families = [
        [13.1_f64, 17.3_f64, -13.1_f64, -17.3_f64],
        [13.1_f64, 17.3_f64, -17.3_f64, -13.1_f64],
        [-7.7_f64, 33.8_f64, 7.7_f64, -33.8_f64],
    ];
    for axis in 0..3 {
        for (family, angles) in families.into_iter().enumerate() {
            for context in [GeometryContext::STRICT, GeometryContext::APPROXIMATE_512] {
                let cube = solid::cube(r(1)).unwrap();
                let mut rotated = cube.clone();
                for angle in angles {
                    let mut degrees = [r(0), r(0), r(0)];
                    degrees[axis] = Real::try_from(angle).unwrap();
                    let [x, y, z] = degrees;
                    rotated = solid::try_rotate(&rotated, x, y, z).unwrap();
                }
                // Exact signed angles sum to zero on one axis. No intermediate
                // coordinate/sign queries prewarm the original union.
                let union = solid::boolean_with_context(
                    &cube, &rotated, hypermesh::BooleanOp::Union, &context,
                ).unwrap_or_else(|error| panic!("axis {axis} family {family}: {error}"));
                assert_eq!(union.certainty, GeometryCertainty::Certified);
                assert_unit_cube(&union.value);
                let empty = solid::boolean_with_context(
                    &union.value, &cube, hypermesh::BooleanOp::Difference, &context,
                ).unwrap();
                assert_eq!(empty.certainty, GeometryCertainty::Certified);
                assert!(empty.value.triangles.is_empty() && empty.value.positions.is_empty());
                let restored = solid::boolean_with_context(
                    &empty.value, &cube, hypermesh::BooleanOp::Union, &GeometryContext::STRICT,
                ).unwrap();
                assert_eq!(restored.certainty, GeometryCertainty::Certified);
                assert_unit_cube(&restored.value);
            }
        }
    }
}
