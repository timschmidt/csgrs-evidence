use hyperbrep::{ArchiveLimits, Model, OperationContext, RawModel, Real, WorkBudget};
use hyperbrep_io::step::{ImportLimits, StepFile, StepReadOptions};
use serde::Deserialize;
use serde_json::{Value, json};
use std::{cmp::Ordering, fs, path::Path};

fn value(text: &str) -> Value {
    let mut decoder = serde_json::Deserializer::from_str(text);
    decoder.disable_recursion_limit();
    Value::deserialize(serde_stacker::Deserializer::new(&mut decoder)).unwrap()
}

fn equal_coefficients(a: &Value, b: &Value, path: &str, changes: &mut Vec<String>) {
    if a == b {
        return;
    }
    if a.get("rational").is_some()
        && a.get("class").is_some()
        && b.get("rational").is_some()
        && b.get("class").is_some()
    {
        let a: Real = serde_json::from_value(a.clone()).unwrap();
        let b: Real = serde_json::from_value(b.clone()).unwrap();
        assert_eq!(
            hyperlimit::compare_reals(&a, &b, hyperlimit::PredicatePolicy::STRICT).value(),
            Some(Ordering::Equal),
            "changed scalar value at {path}"
        );
        changes.push(path.to_owned());
        return;
    }
    match (a, b) {
        (Value::Array(a), Value::Array(b)) => {
            assert_eq!(a.len(), b.len(), "array shape at {path}");
            for (i, (a, b)) in a.iter().zip(b).enumerate() {
                equal_coefficients(a, b, &format!("{path}/{i}"), changes);
            }
        }
        (Value::Object(a), Value::Object(b)) => {
            assert_eq!(a.len(), b.len(), "object shape at {path}");
            for (key, a) in a {
                let b = b
                    .get(key)
                    .unwrap_or_else(|| panic!("missing key {path}/{key}"));
                equal_coefficients(a, b, &format!("{path}/{key}"), changes);
            }
        }
        _ => panic!("changed structural value at {path}"),
    }
}

fn admit(text: &str) -> Model {
    RawModel::from_json(text, &ArchiveLimits::default())
        .unwrap()
        .validate()
        .unwrap()
}

fn stable(model: &Model) -> String {
    let encoded = model.to_json().unwrap();
    let mut cold = admit(&encoded);
    for _ in 0..2 {
        let next = cold.to_json().unwrap();
        assert!(
            next == encoded,
            "native re-encoding changed after cold admission"
        );
        cold = admit(&next);
    }
    encoded
}

fn main() {
    let args = std::env::args().collect::<Vec<_>>();
    if args[1] == "--compare" {
        let pairs = value(&fs::read_to_string(&args[2]).unwrap());
        for pair in pairs.as_array().unwrap() {
            let name = pair["name"].as_str().unwrap();
            let a = fs::read_to_string(pair["baseline"].as_str().unwrap()).unwrap();
            let b = fs::read_to_string(pair["candidate"].as_str().unwrap()).unwrap();
            let mut changes = Vec::new();
            if name.ends_with(".json") {
                equal_coefficients(&value(&a), &value(&b), "", &mut changes);
                stable(&admit(&a));
                stable(&admit(&b));
            } else {
                assert!(a == b, "non-native artifact bytes changed: {name}");
            }
            println!(
                "{}",
                json!({"path":name,"byte_identical":a==b,
                "baseline_bytes":a.len(),"candidate_bytes":b.len(),
                "changed_scalar_encodings":changes})
            );
        }
        return;
    }
    let inputs = value(&fs::read_to_string(&args[1]).unwrap());
    let output = Path::new(&args[2]);
    fs::create_dir_all(output).unwrap();
    for row in inputs.as_array().unwrap() {
        let name = row["name"].as_str().unwrap();
        let input = Path::new(row["path"].as_str().unwrap());
        let text = fs::read_to_string(input).unwrap();
        let mut changes = Vec::new();
        let mut bodies = 0;
        let outcome = match input.extension().unwrap().to_str().unwrap() {
            "json" => {
                let model = admit(&text);
                let encoded = stable(&model);
                equal_coefficients(&value(&text), &value(&encoded), "", &mut changes);
                let destination = output.join(name);
                fs::create_dir_all(destination.parent().unwrap()).unwrap();
                fs::write(destination, encoded).unwrap();
                "native_admitted_and_stable"
            }
            "step" => {
                let file = StepFile::read(text.as_bytes(), &StepReadOptions::default()).unwrap();
                let ids = file
                    .syntax()
                    .entities()
                    .filter(|e| {
                        e.components().any(|r| {
                            matches!(
                                r.name(),
                                "FACETED_BREP_SHAPE_REPRESENTATION"
                                    | "ADVANCED_BREP_SHAPE_REPRESENTATION"
                            )
                        })
                    })
                    .map(|e| e.id())
                    .collect::<Vec<_>>();
                assert!(!ids.is_empty(), "no supported representation in {name}");
                for id in ids {
                    let context = OperationContext::strict(WorkBudget {
                        refinements: 1_000_000,
                        promotions: 100_000,
                    });
                    let imported = file
                        .import_representation(id, &ImportLimits::default(), &context)
                        .result
                        .unwrap()
                        .unwrap();
                    for body in imported.bodies() {
                        stable(body.model());
                        bodies += 1;
                    }
                }
                "step_import_and_native_replay"
            }
            "txt" => "opaque_text_input_only",
            extension => panic!("unexpected artifact extension {extension}"),
        };
        println!(
            "{}",
            json!({"path":name,"outcome":outcome,"input_bytes":text.len(),
            "changed_scalar_encodings":changes,"imported_step_bodies":bodies})
        );
    }
}
