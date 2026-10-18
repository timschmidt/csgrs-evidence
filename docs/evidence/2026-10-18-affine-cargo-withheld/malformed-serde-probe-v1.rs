use hyperreal::Real;
use std::panic::{AssertUnwindSafe, catch_unwind};

fn observe(label: &str, action: impl FnOnce() -> String) {
    match catch_unwind(AssertUnwindSafe(action)) {
        Ok(result) => println!("{label}\t{result}"),
        Err(_) => println!("{label}\tpanic"),
    }
}

fn main() {
    let cases = [
        (
            "negative-square-root",
            r#"{"rational":{"sign":1,"numerator":[1],"denominator":[1]},"class":"Irrational","computable":{"internal":{"Sqrt":{"internal":{"Int":[-1,[1]]}}}}}"#,
        ),
        (
            "missing-irrational-payload",
            r#"{"rational":{"sign":1,"numerator":[1],"denominator":[1]},"class":"Irrational","computable":null}"#,
        ),
    ];
    for (name, encoded) in cases {
        observe(&format!("{name}/decode-and-refine"), || {
            match Real::from_json(encoded) {
                Ok(value) => format!("decoded;interval={:?}", value.certified_rational_interval(-16)),
                Err(problem) => format!("rejected:{problem:?}"),
            }
        });
        observe(&format!("{name}/affine-difference"), || {
            match Real::from_json(encoded) {
                Ok(value) => {
                    let left = &value + Real::from(100);
                    let right = &value + Real::from(101);
                    let difference = left - right;
                    format!(
                        "decoded;exact={:?};interval={:?}",
                        difference.exact_rational(),
                        difference.certified_rational_interval(-16)
                    )
                }
                Err(problem) => format!("rejected:{problem:?}"),
            }
        });
    }
}
