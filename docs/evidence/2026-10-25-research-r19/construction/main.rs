include!("allocator-prefix.rs");
use hyperlimit::{Certainty, PredicateOutcome, PredicatePolicy, Sign, classify_real_sign};
use hyperreal::{Rational, Real};
use serde_json::{Value, json};
use std::{
    hint::black_box,
    sync::{Arc, atomic::AtomicBool},
};

fn exact(value: &Real, expected: Sign) {
    match classify_real_sign(value, PredicatePolicy::STRICT) {
        PredicateOutcome::Decided {
            value,
            certainty: Certainty::Exact,
            ..
        } => {
            assert_eq!(value, expected);
        }
        other => panic!("required exact construction result: {other:?}"),
    }
}

fn node(kind: &str, argument: Value) -> Value {
    json!({"internal": {kind: argument}})
}

fn from_graph(graph: Value) -> Real {
    Real::from_json(
        &json!({
            "rational": Rational::one(), "class": "Irrational", "computable": graph
        })
        .to_string(),
    )
    .unwrap()
}

fn trig(kind: &str) -> Real {
    // Prepared operands are outside timing. Preserve precisely the named
    // opaque sin(e)/cos(e) graph instead of timing a constructor's reduction.
    let e = serde_json::to_value(Real::e()).unwrap();
    assert!(!e["computable"].is_null());
    from_graph(node(kind, e["computable"].clone()))
}

struct Input {
    kind: usize,
    left: Real,
    right: Real,
    expected: Sign,
}

impl Input {
    fn new(kind: usize) -> Self {
        let positive = || trig("PrescaledSin");
        let negative = || trig("PrescaledCos");
        let (left, right, expected) = match kind {
            0 => (positive(), negative(), Sign::Negative),
            1 => (
                Real::new(Rational::fraction(7, 13).unwrap()),
                positive(),
                Sign::Positive,
            ),
            2 | 7 => {
                let value = if kind == 2 { positive() } else { negative() };
                exact(
                    &value,
                    if kind == 2 {
                        Sign::Positive
                    } else {
                        Sign::Negative
                    },
                );
                let inverse = value.inverse_ref().unwrap();
                assert_eq!(
                    serde_json::to_value(&inverse).unwrap()["computable"]["internal"]["Inverse"],
                    serde_json::to_value(&value).unwrap()["computable"]
                );
                (value, inverse, Sign::Positive)
            }
            3 => {
                // Independent decodes allocate distinct immutable trig roots.
                let left = positive();
                let distinct = positive();
                assert_eq!(left.to_json(), distinct.to_json());
                (left, distinct.inverse_ref().unwrap(), Sign::Positive)
            }
            4 => (Real::zero(), positive(), Sign::Zero),
            5 => {
                let mut value = positive();
                exact(&value, Sign::Positive);
                value.abort(Arc::new(AtomicBool::new(false)));
                let mut inverse = value.inverse_ref().unwrap();
                inverse.abort(Arc::new(AtomicBool::new(false)));
                (value, inverse, Sign::Positive)
            }
            6 => {
                // Keep all 18 Add nodes. Ordinary addition could compact them.
                let mut graph = node("Constant", json!("Pi"));
                for _ in 0..18 {
                    graph = node("Add", json!([graph, node("Ratio", json!(Rational::one()))]));
                }
                let value = from_graph(graph.clone());
                assert_eq!(serde_json::to_value(&value).unwrap()["computable"], graph);
                exact(&value, Sign::Positive);
                let inverse = value.inverse_ref().unwrap();
                (value, inverse, Sign::Positive)
            }
            _ => panic!("unknown construction case"),
        };
        Self {
            kind,
            left,
            right,
            expected,
        }
    }

    fn construct(&self) -> Real {
        black_box(self.left.clone()) * black_box(self.right.clone())
    }

    fn verify(&self, result: &Real) -> u64 {
        exact(result, self.expected);
        if matches!(self.kind, 2 | 3 | 5 | 6 | 7) {
            exact(&(result - Real::one()), Sign::Zero);
        }
        match self.expected {
            Sign::Positive => 1,
            Sign::Negative => 2,
            Sign::Zero => 3,
        }
    }
}

fn main() {
    let args: Vec<_> = std::env::args().collect();
    let kind: usize = args[1].parse().unwrap();
    let iterations: usize = args[2].parse().unwrap();
    assert!(iterations > 0 && iterations <= 4096);
    let input = Input::new(kind);
    let input_wire = json!({"left": serde_json::to_value(&input.left).unwrap(),
                            "right": serde_json::to_value(&input.right).unwrap()});
    let mut output = std::io::BufWriter::new(std::io::stdout());
    let mut first_wire = None;
    for sample in 0..8 {
        let count = if sample == 0 { 1 } else { iterations };
        let mut results = Vec::with_capacity(count);
        let before = counts();
        PEAK.store(before.0, Ordering::Relaxed);
        let start = Instant::now();
        for _ in 0..count {
            results.push(black_box(input.construct()));
        }
        let elapsed = start.elapsed().as_nanos();
        let after = counts();
        let peak = PEAK.load(Ordering::Relaxed).saturating_sub(before.0);
        let mut checksum = 14695981039346656037u64;
        for result in results {
            let wire = serde_json::to_value(&result).unwrap();
            if let Some(first) = &first_wire {
                assert_eq!(&wire, first);
            } else {
                first_wire = Some(wire);
            }
            checksum = checksum.wrapping_mul(1099511628211) ^ input.verify(&result);
        }
        writeln!(
            output,
            "{}",
            json!({
                "kind":kind,"phase":if sample==0 {"first"} else {"warm"},
                "sample":sample,"iterations":count,"ns":elapsed,"checksum":checksum.to_string(),
                "outcome":format!("Exact{:?}",input.expected),
                "input":input_wire,"wire":first_wire,
                "allocation_instrumented":cfg!(feature="allocations"),
                "bytes":after.1-before.1,"calls":after.2-before.2,
                "live_delta":after.0 as i128-before.0 as i128,"peak_live_growth":peak
            })
        )
        .unwrap();
    }
    output.flush().unwrap();
}
