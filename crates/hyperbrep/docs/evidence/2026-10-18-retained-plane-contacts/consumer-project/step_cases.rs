use hyperbrep::*;
use hyperbrep_io::step::{StepBody, StepWriteOptions, WriteErrorKind, write_advanced};

use crate::acceptance::prior;

pub fn run() {
    let context = OperationContext::strict(WorkBudget {
        refinements: 100_000,
        promotions: 10_000,
    });
    let options = StepWriteOptions::new("contacts.step", "2026-10-18T00:00:00");
    let cube =
        builder::cuboid(Point3::origin(), Point3::new(2.into(), 3.into(), 4.into())).unwrap();
    write_advanced(
        &[StepBody {
            solid: cube.model().solids().next().unwrap(),
            name: "represented cube",
        }],
        &options,
        &context,
    )
    .result
    .unwrap()
    .unwrap();
    let cubic = Curve3::rational_bezier(
        (0..4)
            .zip([-1, -1, -1, 1])
            .map(|(x, z)| Point3::new(x.into(), 0.into(), z.into()))
            .collect(),
        vec![Real::one(); 4],
    )
    .unwrap();
    let plane = Surface::plane(Point3::origin(), Vector3::x(), Vector3::y()).unwrap();
    let CurveSurfaceIntersection::Points(contacts) = plane.intersect_curve(&cubic).unwrap() else {
        panic!("one selected contact");
    };
    assert_eq!(contacts.len(), 1);
    let selected_cube = cube
        .model()
        .edges()
        .next()
        .unwrap()
        .split(contacts[0].parameter.clone())
        .unwrap();
    let cap =
        builder::extrude_curve_region(&prior::original_parallel_cap(), 0.into(), 3.into()).unwrap();
    let edge = cap
        .model()
        .edges()
        .find(|e| e.curve().kind() == Curve3Kind::PlanarImage)
        .unwrap();
    let plane = Surface::plane(
        Point3::new(1.into(), 0.into(), 0.into()),
        Vector3::y(),
        Vector3::z(),
    )
    .unwrap();
    let CurveSurfaceIntersection::Points(contacts) =
        plane.intersect_curve(edge.curve().geometry()).unwrap()
    else {
        panic!("one offset contact");
    };
    assert_eq!(contacts.len(), 1);
    let selected_cap = edge.split(contacts[0].parameter.clone()).unwrap();
    for (case, original, query) in [
        (
            "cube",
            selected_cube.model(),
            Point3::new(1.into(), 1.into(), 1.into()),
        ),
        (
            "parallel_cap",
            selected_cap.model(),
            Point3::new(2.into(), 0.into(), 1.into()),
        ),
    ] {
        let json = original.to_json().unwrap();
        let cold = RawModel::from_json(&json, &ArchiveLimits::default())
            .unwrap()
            .validate()
            .unwrap();
        for (replay, model) in [(false, original), (true, &cold)] {
            assert_eq!(model.to_json().unwrap(), json);
            let solid = model.solids().next().unwrap();
            let error = write_advanced(&[StepBody { solid, name: case }], &options, &context)
                .result
                .unwrap()
                .unwrap_err();
            assert!(
                match case {
                    "cube" => matches!(error.kind, WriteErrorKind::UnmaterializedPoint),
                    "parallel_cap" => matches!(error.kind, WriteErrorKind::NonRational),
                    _ => unreachable!("declared STEP fixtures"),
                },
                "{error:?}"
            );
            assert!(error.body.is_some() && error.entity.is_some());
            assert_eq!(model.to_json().unwrap(), json);
            assert_eq!(
                solid.classify_point(&query).unwrap(),
                SolidPointLocation::Inside
            );
            let selected = BodySet::from_solid(solid);
            assert!(
                boolean::difference(&selected, &selected)
                    .unwrap()
                    .is_empty()
            );
            println!(
                "plane_contact_step_case={case} replay={replay} outcome={:?} body=true entity=true native_recovery=true",
                error.kind
            );
        }
    }
}
