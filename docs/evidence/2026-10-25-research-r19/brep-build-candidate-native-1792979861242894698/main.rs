use hyperbrep::{ArchiveLimits, Model, PersistenceError, Point3, RawModel, builder};
use hyperlimit::{Certainty, PredicateOutcome, PredicatePolicy, Sign, classify_real_sign};
use hyperreal::{Rational, Real};
use num_bigint::{BigInt, BigUint};
use serde_json::{Value, json};
use std::{collections::BTreeSet, io::Write, path::Path};

fn report(value: Value) {
    println!("{value}");
    std::io::stdout().flush().unwrap();
}

fn exact_sign(value: &Real, expected: Sign) {
    match classify_real_sign(value, PredicatePolicy::STRICT) {
        PredicateOutcome::Decided {
            value,
            certainty: Certainty::Exact,
            ..
        } => assert_eq!(value, expected),
        other => panic!("strict exact continuation declined: {other:?}"),
    }
}

fn height(fixture: &Value) -> Real {
    let n: BigInt = fixture["numerator"].as_str().unwrap().parse().unwrap();
    let d: BigUint = fixture["denominator"].as_str().unwrap().parse().unwrap();
    Real::new(Rational::from_bigint_fraction(n, d).unwrap())
        .cot()
        .unwrap()
}

fn verify(model: &Model, height: &Real) {
    let counts = model.counts();
    assert_eq!(
        (
            counts.vertices,
            counts.edges,
            counts.faces,
            counts.shells,
            counts.solids
        ),
        (8, 12, 6, 1, 1)
    );
    let mut corners = BTreeSet::new();
    for vertex in model.vertices() {
        let point = vertex.point().try_coordinates().unwrap();
        let mut corner = [0; 3];
        for (axis, (coordinate, high)) in [
            (&point.x, Real::one()),
            (&point.y, Real::one()),
            (&point.z, height.clone()),
        ]
        .into_iter()
        .enumerate()
        {
            match classify_real_sign(coordinate, PredicatePolicy::STRICT) {
                PredicateOutcome::Decided {
                    value: Sign::Zero,
                    certainty: Certainty::Exact,
                    ..
                } => {}
                PredicateOutcome::Decided {
                    value: Sign::Positive,
                    certainty: Certainty::Exact,
                    ..
                } => {
                    exact_sign(&(coordinate - high), Sign::Zero);
                    corner[axis] = 1;
                }
                other => panic!("invalid cuboid coordinate: {other:?}"),
            }
        }
        assert!(corners.insert(corner));
    }
    assert_eq!(corners.len(), 8);
    let volume = model.solids().next().unwrap().volume().unwrap();
    exact_sign(&volume, Sign::Positive);
    exact_sign(&(volume - height), Sign::Zero);
    report(
        json!({"stage":"verified","vertices":8,"edges":12,"faces":6,"solids":1,"unique_exact_corners":8,"exact_volume":"height","certainty":"Exact"}),
    );
}

fn problem(error: PersistenceError) {
    match error {
        PersistenceError::Json(message) => {
            report(json!({"stage":"complete","outcome":"Json","message":message}))
        }
        PersistenceError::ResourceLimit(error) => report(
            json!({"stage":"complete","outcome":"ResourceLimit","resource":format!("{:?}",error.resource),"limit":error.limit,"observed":error.observed}),
        ),
        other => report(
            json!({"stage":"complete","outcome":"PersistenceError","variant":format!("{:?}",std::mem::discriminant(&other))}),
        ),
    }
}

fn run(args: Vec<String>) {
    let mode = &args[1];
    let folder = Path::new(&args[2]);
    let fixture: Value =
        serde_json::from_slice(&std::fs::read(folder.join("fixture.json")).unwrap()).unwrap();
    report(json!({"stage":"start","mode":mode}));
    if mode == "emit" {
        let h = height(&fixture);
        let model = builder::cuboid(
            Point3::origin(),
            Point3::new(Real::one(), Real::one(), h.clone()),
        )
        .unwrap();
        let wire = model.model().to_json().unwrap();
        let mut out = std::fs::OpenOptions::new()
            .write(true)
            .create_new(true)
            .open(folder.join("model.json"))
            .unwrap();
        out.write_all(wire.as_bytes()).unwrap();
        out.sync_all().unwrap();
        report(json!({"stage":"encoded","bytes":wire.len()}));
        verify(model.model(), &h);
        report(json!({"stage":"complete","outcome":"Exact"}));
    } else {
        let wire = std::fs::read_to_string(folder.join("model.json")).unwrap();
        match RawModel::from_json(&wire, &ArchiveLimits::default()).and_then(|raw| raw.validate()) {
            Ok(model) => {
                report(json!({"stage":"admitted"}));
                // Build the comparison height only after cold archive admission.
                verify(&model, &height(&fixture));
                assert_eq!(model.to_json().unwrap(), wire);
                report(json!({"stage":"complete","outcome":"Exact","wire_preserved":true}));
            }
            Err(error) => problem(error),
        }
    }
}

fn main() {
    let args = std::env::args().collect();
    std::thread::Builder::new()
        .name("r19-brep".into())
        .stack_size(2 * 1024 * 1024)
        .spawn(move || run(args))
        .unwrap()
        .join()
        .unwrap();
}
