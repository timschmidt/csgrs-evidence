use hyperlimit::{Certainty, Point2, PredicateOutcome, PredicatePolicy, Sign};
use hyperreal::{Problem, Rational, Real};
use num_bigint::{BigInt, BigUint};
use serde_json::{Value, json};
use std::{io::Write, path::Path};

fn report(value: Value) {
    println!("{value}");
    std::io::stdout().flush().unwrap();
}

fn checked_outcome(outcome: PredicateOutcome<Sign>, expected: Sign) -> Value {
    match outcome {
        PredicateOutcome::Decided {
            value, certainty, ..
        } => {
            assert_eq!(certainty, Certainty::Exact);
            assert_eq!(
                value, expected,
                "definite sign contradicts independent oracle"
            );
            json!({"outcome":"Decided","certainty":"Exact","sign":format!("{value:?}")})
        }
        PredicateOutcome::Unknown { .. } => json!({"outcome":"Unknown"}),
    }
}

fn consume(value: &Real, expected: Sign, operation: &str) -> Value {
    match operation {
        "sign" => checked_outcome(
            hyperlimit::classify_real_sign(value, PredicatePolicy::STRICT),
            expected,
        ),
        "divide" => match (Real::one() / value).map(|inverse| {
            // This is an exact identity only after the checked division admits
            // the nonzero denominator. Do not replace a failed division by zero.
            inverse * value - Real::one()
        }) {
            Ok(residual) => checked_outcome(
                hyperlimit::classify_real_sign(&residual, PredicatePolicy::STRICT),
                Sign::Zero,
            ),
            Err(error) => json!({"outcome":"Problem","problem":format!("{error:?}")}),
        },
        "orient" => checked_outcome(
            hyperlimit::orient2(
                &Point2::new(Real::zero(), Real::zero()),
                &Point2::new(Real::one(), Real::zero()),
                &Point2::new(Real::zero(), value.clone()),
                PredicatePolicy::STRICT,
            ),
            expected,
        ),
        _ => panic!("unknown consumer"),
    }
}

fn native(fixture: &Value) -> Result<Real, Problem> {
    match fixture["kind"].as_str().unwrap() {
        "cot" => {
            let n = fixture["numerator"]
                .as_str()
                .unwrap()
                .parse::<BigInt>()
                .unwrap();
            let d = fixture["denominator"]
                .as_str()
                .unwrap()
                .parse::<BigUint>()
                .unwrap();
            Real::new(Rational::from_bigint_fraction(n, d).unwrap()).cot()
        }
        "quantile" => Real::from(1000).pnorm()?.qnorm(),
        _ => panic!("unknown fixture"),
    }
}

fn run(args: Vec<String>) {
    let mode = &args[1];
    let folder = Path::new(&args[2]);
    let fixture: Value =
        serde_json::from_slice(&std::fs::read(folder.join("fixture.json")).unwrap()).unwrap();
    let expected = match fixture["expected"].as_str().unwrap() {
        "Positive" => Sign::Positive,
        "Negative" => Sign::Negative,
        _ => panic!("unknown oracle sign"),
    };
    let operation = &args[3];
    report(json!({"stage":"start","mode":mode,"operation":operation}));
    let value = match mode.as_str() {
        "emit" | "native" => native(&fixture),
        "json" => Real::from_json(&std::fs::read_to_string(folder.join("value.json")).unwrap()),
        "cbor" => Real::from_bytes(&std::fs::read(folder.join("value.cbor")).unwrap()),
        "value" => {
            let encoded: ciborium::Value = ciborium::de::from_reader(
                std::fs::read(folder.join("value.cbor")).unwrap().as_slice(),
            )
            .unwrap();
            Real::try_from(&encoded)
        }
        _ => panic!("unknown import path"),
    };
    match value {
        Err(error) => report(
            json!({"stage":"complete","mode":mode,"admission":"Problem","problem":format!("{error:?}")}),
        ),
        Ok(value) => {
            report(json!({"stage":"admitted","mode":mode}));
            if mode == "emit" {
                let text = value.to_json();
                let bytes = value.to_bytes();
                for (name, payload) in [
                    ("value.json", text.as_bytes()),
                    ("value.cbor", bytes.as_slice()),
                ] {
                    let mut out = std::fs::OpenOptions::new()
                        .write(true)
                        .create_new(true)
                        .open(folder.join(name))
                        .unwrap();
                    out.write_all(payload).unwrap();
                    out.sync_all().unwrap();
                }
                report(json!({"stage":"encoded","json_bytes":text.len(),"cbor_bytes":bytes.len()}));
            }
            let result = consume(&value, expected, operation);
            report(json!({"stage":"complete","mode":mode,"admission":"Ok","consumer":result}));
            drop(value);
            report(json!({"stage":"dropped","mode":mode}));
        }
    }
}

fn main() {
    let args = std::env::args().collect();
    std::thread::Builder::new()
        .name("r19-contained".into())
        .stack_size(2 * 1024 * 1024)
        .spawn(move || run(args))
        .unwrap()
        .join()
        .unwrap();
}
