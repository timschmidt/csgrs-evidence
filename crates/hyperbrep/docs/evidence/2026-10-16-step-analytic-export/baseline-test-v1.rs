use hyperbrep::{OperationContext, Real, WorkBudget, builder};
use hyperbrep_io::step::{
    ImportLimits, StepBody, StepFile, StepReadOptions, StepWriteOptions, write_advanced,
};

#[test]
fn exact_cylinder_exports_reimports_and_remains_consumable() {
    let context = OperationContext::strict(WorkBudget {
        refinements: 10_000,
        promotions: 1000,
    });
    let source = builder::cylinder(Real::from(5), Real::from(7)).unwrap();
    let output = write_advanced(
        &[StepBody {
            solid: source.bodies().next().unwrap(),
            name: "native cylinder",
        }],
        &StepWriteOptions::new("cylinder.step", "2026-10-16T00:00:00"),
        &context,
    )
    .result
    .unwrap()
    .unwrap();
    let file = StepFile::read(output.text().as_bytes(), &StepReadOptions::default()).unwrap();
    let imported = file
        .import_representation(output.representation(), &ImportLimits::default(), &context)
        .result
        .unwrap()
        .unwrap();
    assert_eq!(imported.bodies().len(), 1);
    assert_eq!(
        (imported.bodies()[0].solid().volume().unwrap() - Real::from(175) * Real::pi())
            .exact_rational_normal_form(),
        Some(hyperreal::Rational::zero())
    );
    let native = imported.bodies()[0].model().to_json().unwrap();
    assert!(hyperbrep::Model::from_json(&native).is_ok());
}
