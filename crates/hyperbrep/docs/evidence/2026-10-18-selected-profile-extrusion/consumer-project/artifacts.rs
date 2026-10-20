use hyperbrep::*;
use hyperbrep_io::step::*;
use std::path::Path;

fn save(directory: &Path, name: &str, model: &Model, expected_volume: Real) {
    let actual: Real = model.solids().map(|solid| solid.volume().unwrap()).sum();
    assert_eq!(
        hyperlimit::compare_reals(&actual, &expected_volume, STRICT_PREDICATES).value(),
        Some(std::cmp::Ordering::Equal)
    );
    let text = model.to_json().unwrap();
    assert_eq!(crate::native::replay(model).to_json().unwrap(), text);
    std::fs::write(directory.join(format!("{name}.json")), text).unwrap();
}

pub fn run(directory: &Path) {
    std::fs::create_dir_all(directory).unwrap();
    for xor in [false, true] {
        for affine in [false, true] {
            for reverse in [false, true] {
                let prefix = format!("xor-{xor}-affine-{affine}-reverse-{reverse}");
                let (region, area) = crate::native::profile(xor, affine, reverse);
                let original = builder::extrude_curve_region(&region, 0.into(), 3.into()).unwrap();
                save(
                    directory,
                    &format!("{prefix}-original"),
                    original.model(),
                    &area * Real::from(3),
                );
                let edge = original
                    .model()
                    .edges()
                    .find(|edge| edge.curve().kind() == Curve3Kind::RationalBezier)
                    .unwrap();
                let split = edge
                    .split((Real::one() / Real::from(2)).unwrap().into())
                    .unwrap();
                let cold = crate::native::replay(split.model());
                save(
                    directory,
                    &format!("{prefix}-split"),
                    &cold,
                    &area * Real::from(3),
                );
                let mut current = BodySet::empty();
                for solid in cold.solids() {
                    current = boolean::union(&current, &BodySet::from_solid(solid)).unwrap();
                }
                let cutter = builder::extrude_curve_region(&region, 1.into(), 2.into()).unwrap();
                let middle = boolean::intersection(&current, &cutter).unwrap();
                let ends = boolean::difference(&current, &cutter).unwrap();
                let restored = boolean::union(&ends, &middle).unwrap();
                save(
                    directory,
                    &format!("{prefix}-middle"),
                    middle.model(),
                    area.clone(),
                );
                save(
                    directory,
                    &format!("{prefix}-ends"),
                    ends.model(),
                    &area * Real::from(2),
                );
                save(
                    directory,
                    &format!("{prefix}-restored"),
                    restored.model(),
                    &area * Real::from(3),
                );
                let bodies = original
                    .model()
                    .solids()
                    .map(|solid| StepBody {
                        solid,
                        name: "selected",
                    })
                    .collect::<Vec<_>>();
                let context = OperationContext::strict(WorkBudget {
                    refinements: 100_000,
                    promotions: 10_000,
                });
                let error = write_advanced(
                    &bodies,
                    &StepWriteOptions::new("selected.step", "2026-10-18T00:00:00"),
                    &context,
                )
                .result
                .unwrap()
                .unwrap_err();
                assert!(matches!(error.kind, WriteErrorKind::NonRational));
                std::fs::write(
                    directory.join(format!("{prefix}-step-error.txt")),
                    format!("{error}\n"),
                )
                .unwrap();
            }
        }
    }
}
