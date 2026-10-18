use hyperreal::Real;
use std::panic::{AssertUnwindSafe, catch_unwind};

fn main() {
    for (name, input) in [
        (
            "missing-json",
            r#"{"rational":{"sign":1,"numerator":[1],"denominator":[1]},"class":"Irrational","computable":null}"#,
        ),
        (
            "negative-root",
            r#"{"rational":{"sign":1,"numerator":[1],"denominator":[1]},"class":"Irrational","computable":{"internal":{"Sqrt":{"internal":{"Int":[-1,[1]]}}}}}"#,
        ),
    ] {
        match Real::from_json(input) {
            Err(error) => println!("{name}\tErr({error:?})"),
            Ok(value) => {
                println!("{name}\tdecoded");
                let result = catch_unwind(AssertUnwindSafe(|| {
                    value.certified_rational_interval(-16)
                }));
                println!(
                    "{name}/refinement\t{}",
                    if result.is_err() { "panic" } else { "returned" }
                );
            }
        }
    }
    // The exact malformed coordinate used by the downstream SVG regression.
    let invalid = b"\xa3\x68rational\xa3\x64sign\x01\x69numerator\x81\x01\
        \x6bdenominator\x81\x01\x65class\x6aIrrational\x6acomputable\xf6";
    match Real::from_bytes(invalid) {
        Ok(_) => println!("svg-cbor-coordinate\tdecoded"),
        Err(error) => println!("svg-cbor-coordinate\tErr({error:?})"),
    }
}
