//! Independent multi-component normalized-region STEP continuation consumer.
use hyperbrep::*;
use hyperbrep_io::step::*;
use hypercurve::{Contour2, CurveRegion2, FillRule, LineSeg2, Point2 as CurvePoint2, Segment2};
use std::{error::Error, path::Path};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn equal(a: Real, b: Real) {
    assert!((a - b).exact_rational_normal_form().unwrap().is_zero());
}
fn rectangle(x0: i32, y0: i32, x1: i32, y1: i32, reverse: bool) -> Contour2 {
    let mut points = [(x0, y0), (x1, y0), (x1, y1), (x0, y1)];
    if reverse {
        points.reverse();
    }
    Contour2::try_new(
        (0..4)
            .map(|i| {
                let (a, b) = (points[i], points[(i + 1) % 4]);
                Segment2::Line(
                    LineSeg2::try_new(
                        CurvePoint2::from_values(a.0, a.1),
                        CurvePoint2::from_values(b.0, b.1),
                    )
                    .unwrap(),
                )
            })
            .collect(),
    )
    .unwrap()
}
fn verify(bodies: &BodySet) {
    assert_eq!(bodies.len(), 3);
    assert_eq!(bodies.model().counts().solids, 3);
    equal(
        bodies.bodies().map(|s| s.volume().unwrap()).sum(),
        75.into(),
    );
    equal(
        bodies.model().faces().map(|f| f.area().unwrap()).sum(),
        206.into(),
    );
    for edge in bodies.model().edges() {
        let uses = edge.uses().collect::<Vec<_>>();
        assert_eq!(uses.len(), 2);
        assert_ne!(uses[0].direction(), uses[1].direction());
    }
    let delta: Real = "1e-12".parse().unwrap();
    for (x, y, expected) in [
        (q(1, 2), q(1, 2), SolidPointLocation::Inside),
        (q(3, 2), q(3, 2), SolidPointLocation::Outside),
        (q(5, 2), q(5, 2), SolidPointLocation::Inside),
        (q(17, 2), q(1, 2), SolidPointLocation::Inside),
        (Real::one(), 3.into(), SolidPointLocation::Boundary),
        (Real::one() - &delta, 3.into(), SolidPointLocation::Inside),
        (Real::one() + &delta, 3.into(), SolidPointLocation::Outside),
    ] {
        let point = Point3::new(x, y, q(3, 2));
        let mut location = SolidPointLocation::Outside;
        for solid in bodies.bodies() {
            match solid.classify_point(&point).unwrap() {
                SolidPointLocation::Inside => {
                    location = SolidPointLocation::Inside;
                    break;
                }
                SolidPointLocation::Boundary => location = SolidPointLocation::Boundary,
                SolidPointLocation::Outside => {}
            }
        }
        assert_eq!(location, expected);
    }
}
fn main() -> Result<(), Box<dyn Error>> {
    let directory = std::env::args_os().nth(1).ok_or("output directory")?;
    let directory = Path::new(&directory);
    std::fs::create_dir_all(directory)?;
    let context = OperationContext::strict(WorkBudget {
        refinements: 10_000,
        promotions: 1_000,
    });
    for reverse in [false, true] {
        let name = format!("components-reverse-{reverse}");
        let region = CurveRegion2::try_from_native_boundary_contours(
            &[
                rectangle(0, 0, 6, 6, reverse),
                rectangle(1, 1, 5, 5, reverse),
                rectangle(2, 2, 4, 4, reverse),
                rectangle(8, 0, 9, 1, reverse),
            ],
            FillRule::EvenOdd,
        )?;
        let bodies = builder::extrude_curve_region(&region, 0.into(), 3.into())?;
        verify(&bodies);
        let selections = bodies
            .bodies()
            .map(|solid| StepBody { solid, name: &name })
            .collect::<Vec<_>>();
        let output = write_advanced(
            &selections,
            &StepWriteOptions::new("components.step", "2026-10-17T00:00:00"),
            &context,
        )
        .result
        .map_err(|e| format!("write budget: {e:?}"))??;
        let file = StepFile::read(output.text().as_bytes(), &StepReadOptions::default())?;
        let imported = file
            .import_representation(output.representation(), &ImportLimits::default(), &context)
            .result
            .map_err(|e| format!("import budget: {e:?}"))??;
        assert_eq!(imported.bodies().len(), 3);
        let mut restored = BodySet::empty();
        for body in imported.bodies() {
            restored = boolean::union(&restored, &BodySet::from_solid(body.solid()))?;
        }
        verify(&restored);
        let json = restored.model().to_json()?;
        let cold = RawModel::from_json(&json, &ArchiveLimits::default())?.validate()?;
        assert_eq!(cold.to_json()?, json);
        let mut replayed = BodySet::empty();
        for solid in cold.solids() {
            replayed = boolean::union(&replayed, &BodySet::from_solid(solid))?;
        }
        verify(&replayed);
        verify(&boolean::union(&bodies, &replayed)?);
        verify(&boolean::intersection(&replayed, &bodies)?);
        let empty = boolean::difference(&bodies, &replayed)?;
        assert!(empty.is_empty());
        verify(&boolean::union(&empty, &replayed)?);
        std::fs::write(directory.join(format!("{name}.step")), output.text())?;
        std::fs::write(directory.join(format!("{name}.json")), json)?;
        println!(
            "case={name} outcome=certified bodies=3 volume=75 area=206 step_bytes={}",
            output.text().len()
        );
    }
    Ok(())
}
