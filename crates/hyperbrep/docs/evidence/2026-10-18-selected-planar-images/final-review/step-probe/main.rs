use hyperbrep::*;
use hyperbrep_io::step::{StepBody, StepWriteOptions, WriteErrorKind, write_advanced};

#[allow(dead_code)]
#[path = "../../../../../tests/support/parallel_profile_extrusion.rs"]
mod prior;

fn main() {
    let root_source = Curve3::rational_bezier(
        [-1, -1, -1, 1]
            .map(|x| Point3::new(x.into(), 0.into(), 0.into()))
            .to_vec(),
        vec![Real::one(); 4],
    )
    .unwrap();
    let CurveParameterLocation::Parameters(parameters) =
        root_source.parameters_of(&Point3::origin()).unwrap()
    else {
        panic!("one root")
    };
    assert_eq!(parameters.len(), 1);
    assert!(parameters[0].try_real().is_none());
    let bodies =
        builder::extrude_curve_region(&prior::original_parallel_cap(), 0.into(), 3.into()).unwrap();
    let split = bodies
        .model()
        .edges()
        .find(|e| e.curve().kind() == Curve3Kind::PlanarImage)
        .unwrap()
        .split(parameters[0].clone())
        .unwrap();
    let json = split.model().to_json().unwrap();
    let cold = RawModel::from_json(&json, &ArchiveLimits::default())
        .unwrap()
        .validate()
        .unwrap();
    for (i, model) in [split.model(), &cold].into_iter().enumerate() {
        assert_eq!(model.to_json().unwrap(), json);
        let solid = model.solids().next().unwrap();
        let context = OperationContext::strict(WorkBudget {
            refinements: 100_000,
            promotions: 10_000,
        });
        let error = write_advanced(
            &[StepBody {
                solid,
                name: "selected parallel cap",
            }],
            &StepWriteOptions::new("selected.step", "2026-10-18T00:00:00"),
            &context,
        )
        .result
        .unwrap()
        .unwrap_err();
        assert!(
            matches!(
                error.kind,
                WriteErrorKind::NonRational
                    | WriteErrorKind::UnsupportedCurve(Curve3Kind::PlanarImage)
            ),
            "{error:?}"
        );
        assert!(error.body.is_some() && error.entity.is_some());
        assert_eq!(model.to_json().unwrap(), json);
        assert_eq!(
            solid
                .classify_point(&Point3::new(2.into(), 0.into(), 1.into()))
                .unwrap(),
            SolidPointLocation::Inside
        );
        let selected = BodySet::from_solid(solid);
        assert!(
            boolean::difference(&selected, &selected)
                .unwrap()
                .is_empty()
        );
        println!(
            "selected_step_case={i} outcome=typed_encoding_error body=true entity=true native_recovery=true kind={:?}",
            error.kind
        );
    }
}
