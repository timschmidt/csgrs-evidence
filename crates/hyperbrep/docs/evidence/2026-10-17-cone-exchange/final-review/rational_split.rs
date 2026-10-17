//! Public consumer: exact generator/circle subdivision through STEP and reuse.
use hyperbrep::*;
use hyperbrep_io::step::*;
use std::{error::Error, path::Path};

fn equal(a: Real, b: Real) {
    assert!((a - b).exact_rational_normal_form().unwrap().is_zero());
}
fn replay(model: &Model) -> Model {
    let json = model.to_json().unwrap();
    let replay = RawModel::from_json(&json, &ArchiveLimits::default())
        .unwrap()
        .validate()
        .unwrap();
    assert_eq!(replay.to_json().unwrap(), json);
    replay
}
fn main() -> Result<(), Box<dyn Error>> {
    let directory = std::env::args_os().nth(1).ok_or("output directory")?;
    let directory = Path::new(&directory);
    std::fs::create_dir_all(directory)?;
    for height in [6, 7] {
        for mode in ["line", "circle", "both"] {
            let original = builder::cone_frustum(5.into(), 2.into(), height.into())?;
            let mut model = replay(original.model());
            for kind in [Curve3Kind::Line, Curve3Kind::CircleArc] {
                if (mode == "line" && kind != Curve3Kind::Line)
                    || (mode == "circle" && kind != Curve3Kind::CircleArc)
                {
                    continue;
                }
                let edge = model.edges().find(|e| e.curve().kind() == kind).unwrap();
                let (a, b) = edge.domain().try_real_endpoints().unwrap();
                let parameter = if kind == Curve3Kind::Line {
                    ((a + b) / Real::from(2))?
                } else {
                    a + (Real::from(3) / Real::from(4))?.atan()?
                };
                let next = edge.split(parameter.into())?.into_model();
                assert_eq!(next.counts().vertices, model.counts().vertices + 1);
                model = replay(&next);
            }
            let volume = Real::from(13 * height) * Real::pi();
            let area = (Real::from(29) + Real::from(7) * Real::from(9 + height * height).sqrt()?)
                * Real::pi();
            let context = OperationContext::strict(WorkBudget {
                refinements: 10_000,
                promotions: 1_000,
            });
            let name = format!("h{height}-{mode}");
            let output = write_advanced(
                &[StepBody {
                    solid: model.solids().next().unwrap(),
                    name: &name,
                }],
                &StepWriteOptions::new("split.step", "2026-10-17T00:00:00"),
                &context,
            )
            .result
            .map_err(|e| format!("budget: {e:?}"))??;
            let file = StepFile::read(output.text().as_bytes(), &StepReadOptions::default())?;
            let imported = file
                .import_representation(output.representation(), &ImportLimits::default(), &context)
                .result
                .map_err(|e| format!("budget: {e:?}"))??;
            assert_eq!(imported.bodies().len(), 1);
            let round = replay(imported.bodies()[0].model());
            let solid = round.solids().next().unwrap();
            equal(solid.volume()?, volume.clone());
            equal(
                round
                    .faces()
                    .map(|f| f.area().unwrap())
                    .fold(Real::zero(), |a, b| a + b),
                area,
            );
            assert_eq!(
                solid.classify_point(&Point3::new(0.into(), 0.into(), 3.into()))?,
                SolidPointLocation::Inside
            );
            let body = BodySet::from_solid(solid);
            for result in [
                boolean::union(&body, &original)?,
                boolean::intersection(&body, &original)?,
            ] {
                equal(result.bodies().next().unwrap().volume()?, volume.clone());
            }
            let empty = boolean::difference(&body, &original)?;
            assert!(empty.is_empty());
            equal(
                boolean::union(&empty, &body)?
                    .bodies()
                    .next()
                    .unwrap()
                    .volume()?,
                volume,
            );
            std::fs::write(directory.join(format!("{name}.step")), output.text())?;
            println!(
                "{{\"case\":\"{name}\",\"outcome\":\"certified\",\"vertices\":{},\"bytes\":{}}}",
                round.counts().vertices,
                output.text().len()
            );
        }
    }
    Ok(())
}
