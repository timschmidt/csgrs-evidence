//! Post-campaign archive capture and exact representation comparison.
use hyperbrep::{ArchiveLimits, RawModel, Real};
use serde_json::{Value, json};
use std::{path::Path, sync::Mutex};

#[allow(dead_code)]
mod sectors;
#[allow(dead_code)]
mod oblique;

static RECORD: Mutex<Option<(String, String, Vec<Value>)>> = Mutex::new(None);

fn digest(bytes: &[u8]) -> u64 {
    bytes.iter().fold(0xcbf29ce484222325, |hash, byte| {
        (hash ^ u64::from(*byte)).wrapping_mul(0x100000001b3)
    })
}

fn record(data: &str) {
    let mut guard = RECORD.lock().unwrap();
    let (directory, label, files) = guard.as_mut().unwrap();
    let file = format!("{}-{:03}.json", label.replace('/', "_"), files.len());
    std::fs::write(Path::new(directory).join(&file), data).unwrap();
    files.push(json!({"file": file, "bytes": data.len(), "receipt": digest(data.as_bytes())}));
}

fn capture(directory: &str, label: &str, operation: impl FnOnce() -> u64) -> Value {
    *RECORD.lock().unwrap() = Some((directory.into(), label.into(), Vec::new()));
    let receipt = operation();
    let (_, _, files) = RECORD.lock().unwrap().take().unwrap();
    let row = json!({"case": label, "receipt": receipt, "artifacts": files});
    println!("{row}");
    row
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
            Some(std::cmp::Ordering::Equal) => json!({"kind": "strict exact scalar equality"}),
            Some(_) => panic!("different scalar at {path}"),
            None => {
                // This is a proof of the original equation, not a rounded or
                // normalized replacement. Equal sin/cos is injective on one
                // half-open period; every premise must be strictly certified.
                for (name, a, b) in [
                    ("sin", left.clone().sin(), right.clone().sin()),
                    ("cos", left.clone().cos(), right.clone().cos()),
                ] {
                    assert_eq!(
                        hyperlimit::compare_reals(&a, &b, hyperbrep::STRICT_PREDICATES).value(),
                        Some(std::cmp::Ordering::Equal),
                        "{path}: exact {name} equality"
                    );
                }
                let period = (-16..16).find(|k| {
                    let lower = Real::from(*k) * Real::tau();
                    let upper = Real::from(*k + 1) * Real::tau();
                    [&left, &right].iter().all(|value| {
                        matches!(
                            hyperlimit::compare_reals(value, &lower, hyperbrep::STRICT_PREDICATES).value(),
                            Some(std::cmp::Ordering::Equal | std::cmp::Ordering::Greater)
                        ) && hyperlimit::compare_reals(value, &upper, hyperbrep::STRICT_PREDICATES).value()
                            == Some(std::cmp::Ordering::Less)
                    })
                }).expect("same exact half-open period required");
                json!({"kind": "exact sin/cos injectivity", "period": period,
                       "direct_comparison": format!("{direct:?}"),
                       "premises": "strict sine and cosine equality; both values in [k*tau,(k+1)*tau)"})
            }
        };
        changed.push(json!({"path": path, "proof": proof}));
        return;
    }
    match (a, b) {
        (Value::Object(a), Value::Object(b)) => {
            assert_eq!(a.keys().collect::<Vec<_>>(), b.keys().collect::<Vec<_>>(), "{path}");
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
    if args[1] == "emit" {
        std::fs::create_dir_all(&args[2]).unwrap();
        let mut rows = vec![
            capture(&args[2], "sectors/torus_longitudinal_band", || sectors::original(3)),
            capture(&args[2], "sectors/similarity_matrix", || {
                let (count, receipt) = sectors::transforms();
                assert_eq!(count, 30);
                receipt
            }),
        ];
        for (name, scale, reflected) in [
            ("identity", Real::one(), false),
            ("millimetre_reflection", oblique::q(1, 1000), true),
            ("radical_reflection", Real::from(2).sqrt().unwrap(), true),
        ] {
            let map = if reflected {
                oblique::similarity(&scale, true)
            } else {
                hyperbrep::Matrix4::identity()
            };
            rows.push(capture(&args[2], &format!("oblique/{name}"), || {
                oblique::torus_band_workflow(&map, &scale)
            }));
        }
        assert_eq!(rows.iter().map(|r| r["artifacts"].as_array().unwrap().len()).sum::<usize>(), 173);
        std::fs::write(Path::new(&args[2]).join("receipts.json"),
            serde_json::to_string_pretty(&rows).unwrap() + "\n").unwrap();
    } else {
        assert_eq!(args[1], "compare");
        let before = Path::new(&args[2]);
        let after = Path::new(&args[3]);
        let rows: Vec<Value> = serde_json::from_str(
            &std::fs::read_to_string(before.join("receipts.json")).unwrap()).unwrap();
        let mut reports = Vec::new();
        for row in rows {
            for file in row["artifacts"].as_array().unwrap() {
                let name = file["file"].as_str().unwrap();
                let a = std::fs::read_to_string(before.join(name)).unwrap();
                let b = std::fs::read_to_string(after.join(name)).unwrap();
                let mut changes = Vec::new();
                compare(&serde_json::from_str(&a).unwrap(), &serde_json::from_str(&b).unwrap(), "", &mut changes);
                if a != b {
                    for data in [&a, &b] {
                        let model = RawModel::from_json(data, &ArchiveLimits::default()).unwrap().validate().unwrap();
                        assert_eq!(model.to_json().unwrap(), *data);
                    }
                }
                reports.push(json!({"file": name, "baseline_bytes": a.len(), "candidate_bytes": b.len(),
                    "baseline_receipt": digest(a.as_bytes()), "candidate_receipt": digest(b.as_bytes()),
                    "same_bytes": a == b, "changed_exact_scalars": changes,
                    "non_scalar_changes": 0, "changed_archives_revalidate_on_candidate": true}));
                println!("compared {name}");
            }
        }
        assert_eq!(reports.len(), 173);
        let report = json!({"archives": reports,
            "scope": "All 173 complete result archives from the five changed benchmark rows. Every non-scalar field is identical. Every changed scalar has a strict exact equality certificate or exact same-period sine/cosine-injectivity proof. Captured workflows retain their original independent measures, point tables, topology, subdivision, transformed replay and further-composition assertions. Changed complete archives also revalidate and serialize identically under the candidate."});
        std::fs::write(&args[4], serde_json::to_string_pretty(&report).unwrap() + "\n").unwrap();
    }
}
