#![cfg(all(feature = "curve", feature = "stl-io", feature = "obj-io"))]

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

