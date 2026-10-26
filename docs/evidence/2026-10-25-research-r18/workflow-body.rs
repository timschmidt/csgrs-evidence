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
        &cube, &rotated, hypermesh::BooleanOp::Union, &GeometryContext::STRICT,
    ).unwrap();
    assert_eq!(union.certainty, GeometryCertainty::Certified);
    assert_unit_cube(&union.value);
    let empty = solid::boolean_with_context(
        &union.value, &cube, hypermesh::BooleanOp::Difference, &GeometryContext::STRICT,
    ).unwrap();
    assert_eq!(empty.certainty, GeometryCertainty::Certified);
    assert!(empty.value.positions.is_empty() && empty.value.triangles.is_empty());
    let restored = solid::boolean_with_context(
        &empty.value, &cube, hypermesh::BooleanOp::Union, &GeometryContext::STRICT,
    ).unwrap();
    assert_eq!(restored.certainty, GeometryCertainty::Certified);
    assert_unit_cube(&restored.value);
    (union.value, serde_json::json!({"certainty":"Certified","unit_cube":true,"empty_continuation":true,"strict_empty_union":true}))
}

fn icosahedron_workflow() -> (TriangleMesh, serde_json::Value) {
    let chain = chains::polyhedron_unions(true, 6);
    let mut final_mesh = None;
    let records = chains::run(&chain, |step, mesh| {
        if step == 6 { final_mesh = Some(mesh.clone()); }
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
    let positions: Vec<_> = mesh.positions.iter().enumerate().map(|(index, point)| {
        [&point.x, &point.y, &point.z].map(|coordinate| {
            let (a,b,d) = coordinate.exact_quadratic_normal_form()
                .unwrap_or_else(|| panic!("exact quadratic artifact unavailable at vertex {index}"));
            [a.to_string(), b.to_string(), d.to_string()]
        })
    }).collect();
    let triangles: Vec<_> = mesh.triangles.iter().map(|triangle| triangle.indices()).collect();
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
        println!("R18_WORKFLOW {}", serde_json::json!({"case":case,"phase":phase,"ns":ns,"artifact":artifact}));
    }
}
