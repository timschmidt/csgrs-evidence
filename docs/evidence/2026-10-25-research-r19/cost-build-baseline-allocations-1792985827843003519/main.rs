include!("allocator-prefix.rs");
use hyperlimit::{Certainty, Point2, PredicateOutcome, PredicatePolicy, Sign, classify_real_sign};
use hyperreal::{Problem, Rational, Real};
use serde_json::{Value, json};
use std::{hint::black_box, path::Path};

fn node(kind: &str, argument: Value) -> Value {
    json!({"internal":{kind:argument}})
}

fn emit(output: &Path, matrix: &Path) {
    std::fs::create_dir(output).unwrap();
    for kind in 0..12 {
        let folder = output.join(kind.to_string());
        std::fs::create_dir(&folder).unwrap();
        let expected = match kind {
            4 | 6 | 10 => "ExactNegative",
            8 => "UnknownCertificate",
            9 => "ParseError",
            _ => "ExactPositive",
        };
        let (text, bytes) = match kind {
            0..=3 => {
                let value = match kind {
                    0 => Real::from(17),
                    1 => Real::from(2).sqrt().unwrap(),
                    2 => Real::new(Rational::fraction(1, 5).unwrap()).sin_pi(),
                    3 => Real::new(Rational::fraction(1, 7).unwrap()).cot().unwrap(),
                    _ => unreachable!(),
                };
                (value.to_json(), value.to_bytes())
            }
            8 | 9 => {
                let pi = node("Constant", json!("Pi"));
                let graph = if kind == 8 {
                    node("Inverse", node("PrescaledSin", pi))
                } else {
                    node("Sqrt", node("Negate", pi))
                };
                let wire =
                    json!({"rational":Rational::one(),"class":"Irrational","computable":graph});
                let mut bytes = Vec::new();
                ciborium::ser::into_writer(&wire, &mut bytes).unwrap();
                (wire.to_string(), bytes)
            }
            _ => {
                let bits = match kind {
                    4 | 5 => 32,
                    6 | 7 => 1024,
                    _ => 2304,
                };
                let side = if kind % 2 == 0 { "below" } else { "above" };
                let source = matrix.join(format!("cot-{bits}-{side}-positive"));
                (
                    std::fs::read_to_string(source.join("value.json")).unwrap(),
                    std::fs::read(source.join("value.cbor")).unwrap(),
                )
            }
        };
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
        std::fs::write(
            folder.join("fixture.json"),
            json!({"kind":kind,"expected":expected}).to_string(),
        )
        .unwrap();
    }
}

struct Input {
    kind: usize,
    expected: String,
    text: String,
    bytes: Vec<u8>,
    encoded: ciborium::Value,
    json: Value,
}

impl Input {
    fn load(folder: &Path) -> Self {
        let fixture: Value =
            serde_json::from_slice(&std::fs::read(folder.join("fixture.json")).unwrap()).unwrap();
        let text = std::fs::read_to_string(folder.join("value.json")).unwrap();
        let bytes = std::fs::read(folder.join("value.cbor")).unwrap();
        let encoded = ciborium::de::from_reader(bytes.as_slice()).unwrap();
        let json = serde_json::from_str(&text).unwrap();
        Self {
            kind: fixture["kind"].as_u64().unwrap() as usize,
            expected: fixture["expected"].as_str().unwrap().to_owned(),
            text,
            bytes,
            encoded,
            json,
        }
    }

    fn import(&self, path: &str) -> Result<Real, Problem> {
        match path {
            "json" => Real::from_json(&self.text),
            "cbor" => Real::from_bytes(&self.bytes),
            "value" => Real::try_from(&self.encoded),
            _ => panic!("unknown import path"),
        }
    }

    fn verify(&self, result: Result<Real, Problem>) -> u64 {
        if self.kind == 8 || self.kind == 9 {
            let expected = if self.kind == 8 {
                Problem::UnknownCertificate
            } else {
                Problem::ParseError
            };
            assert_eq!(result.map(|_| ()), Err(expected));
            return if self.kind == 8 { 3 } else { 4 };
        }
        let value = result.unwrap();
        let expected = if self.expected == "ExactNegative" {
            Sign::Negative
        } else {
            Sign::Positive
        };
        exact(
            classify_real_sign(&value, PredicatePolicy::STRICT),
            expected,
        );
        let identity = (Real::one() / &value).unwrap() * &value - Real::one();
        exact(
            classify_real_sign(&identity, PredicatePolicy::STRICT),
            Sign::Zero,
        );
        exact(
            hyperlimit::orient2(
                &Point2::new(Real::zero(), Real::zero()),
                &Point2::new(Real::one(), Real::zero()),
                &Point2::new(Real::zero(), value.clone()),
                PredicatePolicy::STRICT,
            ),
            expected,
        );
        assert_eq!(serde_json::to_value(&value).unwrap(), self.json);
        assert_eq!(value.to_bytes(), self.bytes);
        if expected == Sign::Positive { 1 } else { 2 }
    }
}

fn exact(outcome: PredicateOutcome<Sign>, expected: Sign) {
    match outcome {
        PredicateOutcome::Decided {
            value,
            certainty: Certainty::Exact,
            ..
        } => assert_eq!(value, expected),
        other => panic!("required exact continuation: {other:?}"),
    }
}

fn main() {
    let args: Vec<_> = std::env::args().collect();
    if args[1] == "emit" {
        emit(Path::new(&args[2]), Path::new(&args[3]));
        return;
    }
    let input = Input::load(Path::new(&args[1]));
    let path = &args[2];
    let iterations: usize = args[3].parse().unwrap();
    assert!(iterations > 0 && iterations <= 4096);
    let mut output = std::io::BufWriter::new(std::io::stdout());
    // Fixture parsing is outside all timers and constructs no Real values.
    // One first import precedes seven fresh-graph batches. Verification between
    // batches may warm shared constants; this is not a cold-global-state claim.
    for sample in 0..8 {
        let count = if sample == 0 { 1 } else { iterations };
        let mut results = Vec::with_capacity(count);
        let before = counts();
        PEAK.store(before.0, Ordering::Relaxed);
        let start = Instant::now();
        for _ in 0..count {
            results.push(black_box(input.import(black_box(path))));
        }
        let elapsed = start.elapsed().as_nanos();
        let after = counts();
        let peak = PEAK.load(Ordering::Relaxed).saturating_sub(before.0);
        let mut checksum = 14695981039346656037u64;
        for result in results {
            checksum = checksum.wrapping_mul(1099511628211) ^ input.verify(result);
        }
        writeln!(
            output,
            "{}",
            json!({
                "kind":input.kind,"path":path,"phase":if sample==0 {"first"} else {"warm"},
                "sample":sample,"iterations":count,"ns":elapsed,"checksum":checksum.to_string(),
                "outcome":input.expected,"allocation_instrumented":cfg!(feature="allocations"),
                "bytes":after.1-before.1,"calls":after.2-before.2,
                "live_delta":after.0 as i128-before.0 as i128,"peak_live_growth":peak
            })
        )
        .unwrap();
    }
    output.flush().unwrap();
}
