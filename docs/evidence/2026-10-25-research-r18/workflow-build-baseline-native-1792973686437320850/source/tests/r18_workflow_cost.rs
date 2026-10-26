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

#[allow(dead_code)]
#[path = "support/successive_operations.rs"]
mod chains;

fn decimal_workflow() -> (TriangleMesh, serde_json::Value) {
    let cube = solid::cube(r(1)).unwrap();
    let mut rotated = cube.clone();
    for angle in ["13.1", "17.3", "-13.1", "-17.3"] {
        rotated = solid::try_rotate(&rotated, r(0), r(0), angle.parse().unwrap()).unwrap();
    }
    let union = solid::boolean_with_context(
        &cube,
        &rotated,
        hypermesh::BooleanOp::Union,
        &GeometryContext::STRICT,
    )
    .unwrap();
    assert_eq!(union.certainty, GeometryCertainty::Certified);
    assert_unit_cube(&union.value);
    let empty = solid::boolean_with_context(
        &union.value,
        &cube,
        hypermesh::BooleanOp::Difference,
        &GeometryContext::STRICT,
    )
    .unwrap();
    assert_eq!(empty.certainty, GeometryCertainty::Certified);
    assert!(empty.value.positions.is_empty() && empty.value.triangles.is_empty());
    let restored = solid::boolean_with_context(
        &empty.value,
        &cube,
        hypermesh::BooleanOp::Union,
        &GeometryContext::STRICT,
    )
    .unwrap();
    assert_eq!(restored.certainty, GeometryCertainty::Certified);
    assert_unit_cube(&restored.value);
    (
        union.value,
        serde_json::json!({"certainty":"Certified","unit_cube":true,"empty_continuation":true,"strict_empty_union":true}),
    )
}

fn icosahedron_workflow() -> (TriangleMesh, serde_json::Value) {
    let chain = chains::polyhedron_unions(true, 6);
    let mut final_mesh = None;
    let records = chains::run(&chain, |step, mesh| {
        if step == 6 {
            final_mesh = Some(mesh.clone());
        }
    });
    assert_eq!(records.len(), 6);
    let mut receipts = Vec::new();
    for (index, record) in records.into_iter().enumerate() {
        assert_eq!(record.outcome, chains::Outcome::Certified);
        assert_eq!(record.closed_manifold, Some(true));
        assert_eq!(record.triangles, 44 + 24 * index);
        assert_eq!(record.size.max_depth, 27);
        receipts.push(serde_json::json!({"step":record.step,"certainty":"Certified","closed_manifold":true,
            "triangles":record.triangles,"vertices":record.vertices,
            "max_depth":record.size.max_depth,"max_nodes":record.size.max_nodes,
            "rational":record.size.rational,"symbolic":record.size.symbolic,
            "max_denominator_bits":record.size.max_denominator_bits,
            "max_rational_bits":record.size.max_rational_bits}));
    }
    (final_mesh.unwrap(), serde_json::json!(receipts))
}

fn exact_artifact(mesh: &TriangleMesh, receipts: serde_json::Value) -> serde_json::Value {
    let positions: Vec<_> = mesh
        .positions
        .iter()
        .enumerate()
        .map(|(index, point)| {
            [&point.x, &point.y, &point.z].map(|coordinate| {
                let compact = coordinate.compact_quadratic_tower().unwrap_or_else(|| {
                    panic!("exact tower artifact unavailable at vertex {index}")
                });
                let size = compact.representation_size(128);
                assert!(size.complete && size.nodes <= 128 && size.depth <= 16);
                // Serialize only a verified shallow exact tower, never the
                // original shared graph. Replay stays outside timing.
                let encoded = serde_json::to_value(&compact).unwrap();
                let replay: Real = serde_json::from_value(encoded.clone()).unwrap();
                match hyperlimit::classify_real_sign(
                    &(coordinate - &replay),
                    hyperlimit::PredicatePolicy::STRICT,
                ) {
                    hyperlimit::PredicateOutcome::Decided {
                        value: Sign::Zero,
                        certainty: hyperlimit::Certainty::Exact,
                        ..
                    } => {},
                    _ => panic!("tower replay changed exact coordinate at vertex {index}"),
                }
                encoded
            })
        })
        .collect();
    let triangles: Vec<_> = mesh
        .triangles
        .iter()
        .map(|triangle| triangle.indices())
        .collect();
    serde_json::json!({"positions":positions,"triangles":triangles,"receipts":receipts})
}

#[test]
fn native_workflow_cost() {
    let case = std::env::var("R18_WORKFLOW_CASE").expect("named cost case");
    for phase in ["first", "second"] {
        let start = std::time::Instant::now();
        let (mesh, receipts) = match case.as_str() {
            "decimal" => decimal_workflow(),
            "icosahedron" => icosahedron_workflow(),
            _ => panic!("unknown case"),
        };
        let ns = start.elapsed().as_nanos();
        let artifact = exact_artifact(&mesh, receipts);
        println!(
            "R18_WORKFLOW {}",
            serde_json::json!({"case":case,"phase":phase,"ns":ns,"artifact":artifact})
        );
    }
}
