#![cfg(feature = "curve")]

#[allow(dead_code)]
#[path = "support/downstream_workloads.rs"]
mod support;

use csgrs::{GeometryCertainty, GeometryContext, Real, TriangleMesh, solid};
use hyperlimit::Sign;
use std::cmp::Ordering;
use support::{assert_certified_closed_manifold, r, six_volume, strict_order, strict_sign};

fn assert_unit_cube(mesh: &TriangleMesh) {
    assert!(!mesh.triangles.is_empty());
    assert_certified_closed_manifold(mesh, "compound rotation union");
    for point in mesh.positions.iter() {
        for coordinate in [&point.x, &point.y, &point.z] {
            assert_ne!(strict_order(coordinate, &r(0)), Ordering::Less);
            assert_ne!(strict_order(coordinate, &r(1)), Ordering::Greater);
        }
    }
    // An independent six-half-space oracle: every triangle belongs to one
    // cube support plane and points outward. No triangulation/count equality.
    for triangle in mesh.triangles.iter() {
        let [a, b, c] = triangle
            .indices()
            .map(|index| mesh.positions[index].to_vector());
        let normal = (&b - &a).cross(&(&c - &a));
        let mut support = false;
        for axis in 0..3 {
            for side in [0, 1] {
                if [&a, &b, &c]
                    .into_iter()
                    .all(|point| strict_order(&point.0[axis], &r(side)) == Ordering::Equal)
                {
                    assert_eq!(
                        strict_sign(&normal.0[axis]),
                        if side == 0 {
                            Sign::Negative
                        } else {
                            Sign::Positive
                        }
                    );
                    for other in 0..3 {
                        if other != axis {
                            assert_eq!(strict_sign(&normal.0[other]), Sign::Zero);
                        }
                    }
                    support = true;
                }
            }
        }
        assert!(support, "triangle is not on an outward cube support plane");
    }
    // Closed, outward boundary on the cube's six planes with unit volume
    // excludes missing material and extra closed coverings of those planes.
    assert_eq!(strict_order(&six_volume(mesh), &r(6)), Ordering::Equal);
}

fn compound_union(binary64: bool) {
    let label = if binary64 { "binary64" } else { "decimal" };
    let angles = if binary64 {
        [13.1_f64, 17.3_f64, -13.1_f64, -17.3_f64].map(|value| Real::try_from(value).unwrap())
    } else {
        ["13.1", "17.3", "-13.1", "-17.3"].map(|value| value.parse::<Real>().unwrap())
    };
    let cube = solid::cube(r(1)).expect("unit cube");
    let mut rotated = cube.clone();
    for (index, angle) in angles.into_iter().enumerate() {
        rotated = solid::try_rotate(&rotated, r(0), r(0), angle).expect("finite z rotation");
        eprintln!("R18_STAGE {label} rotation {}", index + 1);
    }
    // Do not classify intermediate coordinates or compare the two meshes
    // before the original Boolean: such queries can warm exact proof caches.
    eprintln!("R18_STAGE {label} original-union");
    let outcome = solid::boolean_with_context(
        &cube,
        &rotated,
        hypermesh::BooleanOp::Union,
        &GeometryContext::STRICT,
    )
    .unwrap_or_else(|error| {
        eprintln!("R18_BLOCKER {label} {error}");
        panic!("original strict compound-rotation union did not complete")
    });
    assert_eq!(outcome.certainty, GeometryCertainty::Certified);
    let mesh = outcome.into_value();
    eprintln!("R18_STAGE {label} independent-cube-oracle");
    assert_unit_cube(&mesh);
    eprintln!("R18_STAGE {label} continued-difference");
    let empty = solid::boolean_with_context(
        &mesh,
        &cube,
        hypermesh::BooleanOp::Difference,
        &GeometryContext::STRICT,
    )
    .unwrap_or_else(|error| {
        eprintln!("R18_BLOCKER {label} continuation {error}");
        panic!("certified cube union could not continue to exact difference")
    });
    assert_eq!(empty.certainty, GeometryCertainty::Certified);
    assert!(empty.value.triangles.is_empty());
    eprintln!("R18_COMPLETE {label} certified-unit-cube-and-empty-continuation");
}

#[test]
fn binary64_compound_round_trip_union_matches_unit_cube() {
    compound_union(true);
}

#[test]
fn decimal_compound_round_trip_union_matches_unit_cube() {
    compound_union(false);
}
