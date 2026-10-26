#[cfg(all(test, feature = "serde"))]
mod ring_r18_diagnostics {
    use super::*;
    use std::cell::Cell;

    thread_local! { static ACTIVE: Cell<Option<usize>> = const { Cell::new(None) }; }

    pub(super) fn record(recognition: &RingRecognition<'_>, reason: &str) {
        ACTIVE.with(|active| {
            if let Some(index) = active.get() {
                if index < 256 {
                    eprintln!("R18_DECLINE {}", serde_json::json!({
                        "reason": reason, "index": index,
                        "nodes_left": recognition.nodes_left,
                        "operations_left": recognition.operations_left,
                        "quotients": recognition.quotients.len(),
                        "atoms": recognition.atoms.len(),
                        "unit_circle_pairs": recognition.unit_circle_pairs,
                    }));
                }
                active.set(Some(index + 1));
            }
        });
    }

    fn raw(approximation: Approximation) -> Computable {
        Computable {
            internal: Arc::new(Node::new(
                approximation,
                BoundCache::Invalid,
                ExactSignCache::Invalid,
            )),
            signal: None,
        }
    }

    fn captured() -> Vec<Computable> {
        let graph: serde_json::Value = serde_json::from_str(include_str!("r18_predicate.json")).unwrap();
        let mut values: Vec<Computable> = Vec::new();
        for node in graph["computable"]["nodes"].as_array().unwrap() {
            let object = node.as_object().unwrap();
            assert_eq!(object.len(), 1);
            let (kind, payload) = object.iter().next().unwrap();
            let child = |value: &serde_json::Value| {
                values[value["r16_node_ref"].as_u64().unwrap() as usize].clone()
            };
            let form = match kind.as_str() {
                "Ratio" => Approximation::Ratio(serde_json::from_value(payload.clone()).unwrap()),
                "Constant" => {
                    assert_eq!(payload.as_str(), Some("Pi"));
                    Approximation::Constant(SharedConstant::Pi)
                }
                "Add" => Approximation::Add(child(&payload[0]), child(&payload[1])),
                "Multiply" => Approximation::Multiply(child(&payload[0]), child(&payload[1])),
                "Negate" => Approximation::Negate(child(payload)),
                "PrescaledSin" => Approximation::PrescaledSin(child(payload)),
                _ => panic!("unsupported captured node: {kind}"),
            };
            values.push(raw(form));
        }
        assert_eq!(values.len(), 89);
        values
    }

    #[test]
    fn captured_cold_decline() {
        for mode in ["quotient", "relation", "extended"] {
            let values = captured();
            let root = values.last().unwrap();
            let mut recognition = RingRecognition::new(root);
            if mode != "quotient" {
                recognition.root_squares = true;
                recognition.trig_arguments = Some(Vec::new());
                recognition.rational_squares = Some(Vec::new());
            }
            if mode == "extended" {
                recognition.extended_degree = true;
                recognition.operations_left = RingRecognition::EXTENDED_OPERATIONS;
            }
            eprintln!("R18_MODE {mode}");
            ACTIVE.with(|active| active.set(Some(0)));
            let result = recognition.expand_quotient(root, RingRecognition::MAX_DEPTH)
                .and_then(|value| recognition.project_quotient(&value));
            let declines = ACTIVE.with(|active| active.replace(None)).unwrap();
            let projections: Vec<_> = values.iter().enumerate().filter_map(|(index, value)| {
                recognition.quotients.get(&Arc::as_ptr(&value.internal)).map(|q| {
                    serde_json::json!({"node": index, "terms": q.numerator.terms.len(),
                        "degree": q.numerator.terms.iter().map(|(t, _)| t.len()).max().unwrap_or(0),
                        "denominator": q.denominator.is_some()})
                })
            }).collect();
            eprintln!("R18_ATTEMPT {}", serde_json::json!({
                "mode": mode, "result": result.as_ref().map(ToString::to_string),
                "declines": declines, "nodes_left": recognition.nodes_left,
                "operations_left": recognition.operations_left,
                "unit_circle_pairs": recognition.unit_circle_pairs,
                "completed_projections": projections,
            }));
            assert!(result.is_none(), "baseline cold capture unexpectedly decided");
        }
    }
}
