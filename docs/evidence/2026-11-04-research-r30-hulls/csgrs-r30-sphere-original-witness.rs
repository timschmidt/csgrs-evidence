//! R30: cache state may accelerate the hull, but must not select its rows.
use csgrs::{GeometryCertainty, GeometryContext, TriangleMesh, solid};

fn rows(mesh: &TriangleMesh) -> Vec<[usize; 3]> {
    mesh.triangles.iter().map(|t| t.indices()).collect()
}

#[test]
fn cold_and_repeated_sampled_sphere_hulls_have_identical_rows() {
    let sphere = solid::sphere(1, 32, 16).unwrap();
    let first = solid::convex_hull_with_context(&sphere, GeometryContext::STRICT).unwrap();
    let second = solid::convex_hull_with_context(&sphere, GeometryContext::STRICT).unwrap();
    assert_eq!(first.certainty, GeometryCertainty::Certified);
    assert_eq!(second.certainty, GeometryCertainty::Certified);
    assert_eq!(first.value.positions, second.value.positions);
    assert!(rows(&first.value) == rows(&second.value), "cold and repeated hull triangle rows differ");
}
