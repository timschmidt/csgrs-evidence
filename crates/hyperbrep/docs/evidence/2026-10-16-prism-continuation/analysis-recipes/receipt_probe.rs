use hyperbrep::{ArchiveLimits, RawModel, Real};
use serde_json::{Value, json};

#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/analytic_cylinder.rs"]
mod cylinder;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/supplied_pcurves.rs"]
mod supplied;

fn digest(bytes: &[u8]) -> u64 {
    bytes.iter().fold(0xcbf29ce484222325, |hash, byte| {
        (hash ^ u64::from(*byte)).wrapping_mul(0x100000001b3)
    })
}

fn compare(a: &Value, b: &Value, path: &str, changed: &mut Vec<Value>) {
    if a == b {
        return;
    }
    if a.get("rational").is_some() && b.get("rational").is_some() {
        let left: Real = serde_json::from_value(a.clone()).unwrap();
        let right: Real = serde_json::from_value(b.clone()).unwrap();
        let direct = hyperlimit::compare_reals(&left, &right, hyperbrep::STRICT_PREDICATES);
        let proof = match direct.value() {
            Some(std::cmp::Ordering::Equal) => {
                json!({"kind": "strict native exact scalar equality"})
            }
            Some(_) => panic!("different exact scalar at {path}"),
            None => {
                // Principal-atan normalization changes expression structure.
                // If the generic equality query is undecided, prove equality
                // independently: (sin,cos) is injective on each half-open
                // interval [k*tau,(k+1)*tau). Every premise is exact and strict;
                // an undecided premise fails the check. No input is rewritten.
                for (name, a, b) in [
                    ("sin", left.clone().sin(), right.clone().sin()),
                    ("cos", left.clone().cos(), right.clone().cos()),
                ] {
                    assert_eq!(
                        hyperlimit::compare_reals(&a, &b, hyperbrep::STRICT_PREDICATES).value(),
                        Some(std::cmp::Ordering::Equal),
                        "{path}: exact {name} image"
                    );
                }
                let interval = (-16..16)
                    .find(|k| {
                        let lower = Real::from(*k) * Real::tau();
                        let upper = Real::from(*k + 1) * Real::tau();
                        [&left, &right].iter().all(|value| {
                            matches!(
                                hyperlimit::compare_reals(
                                    value,
                                    &lower,
                                    hyperbrep::STRICT_PREDICATES
                                )
                                .value(),
                                Some(std::cmp::Ordering::Equal | std::cmp::Ordering::Greater)
                            ) && hyperlimit::compare_reals(
                                value,
                                &upper,
                                hyperbrep::STRICT_PREDICATES,
                            )
                            .value()
                                == Some(std::cmp::Ordering::Less)
                        })
                    })
                    .expect("both angles need exact membership in the same half-open period");
                json!({"kind": "exact sin/cos injectivity on one half-open period",
                       "period": interval, "generic_comparison": format!("{direct:?}"),
                       "premises": "strict certified sine equality, cosine equality, and membership of both angles in [k*tau,(k+1)*tau)"})
            }
        };
        changed.push(json!({"path": path, "proof": proof}));
        return;
    }
    match (a, b) {
        (Value::Object(a), Value::Object(b)) => {
            assert_eq!(
                a.keys().collect::<Vec<_>>(),
                b.keys().collect::<Vec<_>>(),
                "{path}"
            );
            for (key, value) in a {
                compare(value, &b[key], &format!("{path}/{key}"), changed);
            }
        }
        (Value::Array(a), Value::Array(b)) => {
            assert_eq!(a.len(), b.len(), "{path}");
            for (index, (a, b)) in a.iter().zip(b).enumerate() {
                compare(a, b, &format!("{path}/{index}"), changed);
            }
        }
        _ => panic!("non-scalar artifact change at {path}: {a} versus {b}"),
    }
}

fn main() {
    let args: Vec<_> = std::env::args().collect();
    let names = [
        "circles-closed",
        "circles-partial",
        "pcurves-full",
        "pcurves-partial",
    ];
    if args[1] == "emit" {
        let output = std::path::Path::new(&args[2]);
        std::fs::create_dir_all(output).unwrap();
        let partial = cylinder::partitioned();
        let supplied_partial = supplied::supplied(&partial);
        let inputs = [
            cylinder::CYLINDER,
            partial.as_str(),
            include_str!(
                "/mnt/development/csgrs/crates/hyperbrep-io/tests/fixtures/supplied-cylinder.step"
            ),
            supplied_partial.as_str(),
        ];
        for (name, input) in names.into_iter().zip(inputs) {
            let file = cylinder::read(input);
            let imported = file
                .import_representation(
                    10,
                    &hyperbrep_io::step::ImportLimits::default(),
                    &cylinder::context(),
                )
                .result
                .unwrap()
                .unwrap();
            assert_eq!(imported.bodies().len(), 1);
            let body = &imported.bodies()[0];
            if name.starts_with("circles-") {
                cylinder::check(body.model());
                let (vertices, edges, faces, span) = if name == "circles-closed" {
                    (2, 3, 3, Real::tau())
                } else {
                    (4, 6, 4, Real::pi())
                };
                let counts = body.model().counts();
                assert_eq!(
                    (
                        counts.vertices,
                        counts.edges,
                        counts.faces,
                        counts.edge_uses
                    ),
                    (vertices, edges, faces, 2 * edges)
                );
                for edge in body.explicit_edges() {
                    assert_eq!(edge.parameters.len(), 1);
                    let map = &edge.parameters[0];
                    assert_eq!(map.curve, edge.geometry);
                    assert_eq!(edge.master, edge.geometry);
                    if edge.edge.curve().kind() == hyperbrep::Curve3Kind::CircleArc {
                        cylinder::equal(&(&map.end - &map.start), &span);
                    } else {
                        cylinder::equal(&map.start, &Real::zero());
                        cylinder::equal(&map.end, &(Real::from(7) / Real::from(2)).unwrap());
                    }
                }
            } else {
                assert_eq!(
                    imported.interpreted_entities().len() + imported.retained_entities().len(),
                    file.syntax().entities().len()
                );
                cylinder::equal(
                    &body.solid().volume().unwrap(),
                    &(Real::from(175) * Real::pi()),
                );
                for edge in body.explicit_edges() {
                    let maps = match edge.geometry {
                        200 | 230 => 4,
                        260 => 3,
                        _ => 1,
                    };
                    assert_eq!(edge.parameters.len(), maps);
                    assert!(edge.parameters.iter().any(|map| map.curve == edge.master));
                    assert_eq!(edge.edge.uses().count(), 2);
                }
            }
            let data = body.model().to_json().unwrap();
            std::fs::write(output.join(format!("{name}.json")), &data).unwrap();
            std::fs::write(output.join(format!("{name}.step")), input).unwrap();
            println!(
                "{}",
                json!({"case": name, "bytes": data.len(), "receipt": digest(data.as_bytes())})
            );
        }
    } else {
        assert_eq!(args[1], "compare");
        let mut reports = Vec::new();
        for name in names {
            let a = std::fs::read_to_string(
                std::path::Path::new(&args[2]).join(format!("{name}.json")),
            )
            .unwrap();
            let b = std::fs::read_to_string(
                std::path::Path::new(&args[3]).join(format!("{name}.json")),
            )
            .unwrap();
            let left = RawModel::from_json(&a, &ArchiveLimits::default())
                .unwrap()
                .validate()
                .unwrap();
            let right = RawModel::from_json(&b, &ArchiveLimits::default())
                .unwrap()
                .validate()
                .unwrap();
            assert_eq!(left.counts(), right.counts());
            cylinder::check(&left);
            cylinder::check(&right);
            let mut changed = Vec::new();
            compare(
                &serde_json::from_str(&a).unwrap(),
                &serde_json::from_str(&b).unwrap(),
                "",
                &mut changed,
            );
            assert!(!changed.is_empty());
            reports.push(json!({"case": name,
                "baseline_bytes": a.len(), "candidate_bytes": b.len(),
                "baseline_receipt": digest(a.as_bytes()), "candidate_receipt": digest(b.as_bytes()),
                "changed_exact_scalars": changed, "non_scalar_changes": 0,
                "both_archives_strictly_validate": true}));
        }
        let report = json!({"archives": reports,
            "scope": "Recursive comparison of all four complete archives. Every non-scalar field, including topology, carrier family, domain and source mapping structure, is identical. Every changed scalar has either direct strict equality or an exact sin/cos-injectivity proof with strictly certified image and same-half-open-period premises; generic undecided comparisons remain recorded. No approximation or input normalization is used. Both complete archives independently validate and pass the existing independent cylinder expectations. A separate check binds emitted hashes and sizes to measured benchmark receipts."});
        std::fs::write(
            &args[4],
            serde_json::to_string_pretty(&report).unwrap() + "\n",
        )
        .unwrap();
        println!("four complete archive comparisons passed");
    }
}
