include!("../../../../../../hyperbrep-io/tests/support/spline_exchange.rs");

fn main() {
    retained_spline_profiles_complete_step_replay_and_repeated_cuts();
    independent_splines_retain_charts_weights_trims_units_and_modeling();
    spline_whole_images_ambiguous_trims_and_supplied_pcurves_are_checked();
    spline_write_limits_units_and_exact_numeric_failures_are_explicit();
    invalid_spline_records_and_exhausted_limits_never_publish_a_body();
    let directory = std::path::PathBuf::from(std::env::args_os().nth(1).unwrap());
    std::fs::create_dir_all(&directory).unwrap();
    for reverse in [false, true] {
        for components in [false, true] {
            for affine in [false, true] {
                let name = format!("retained-{reverse}-{components}-{affine}");
                let region = profile(reverse, components, affine);
                let bodies = builder::extrude_curve_region(&region, 0.into(), 3.into()).unwrap();
                verify(bodies.model(), components, affine);
                std::fs::write(
                    directory.join(format!("{name}-native.json")),
                    bodies.model().to_json().unwrap(),
                )
                .unwrap();
                let selection: Vec<_> = bodies
                    .bodies()
                    .map(|solid| StepBody { solid, name: &name })
                    .collect();
                let output = write_advanced(
                    &selection,
                    &StepWriteOptions::new("splines.step", "2026-10-18T00:00:00"),
                    &context(),
                )
                .result
                .unwrap()
                .unwrap();
                std::fs::write(directory.join(format!("{name}.step")), output.text()).unwrap();
                let file =
                    StepFile::read(output.text().as_bytes(), &StepReadOptions::default()).unwrap();
                let imported = file
                    .import_representation(
                        output.representation(),
                        &ImportLimits::default(),
                        &context(),
                    )
                    .result
                    .unwrap()
                    .unwrap();
                for (i, body) in imported.bodies().iter().enumerate() {
                    std::fs::write(
                        directory.join(format!("{name}-import-{i}.json")),
                        replay(body.model()).to_json().unwrap(),
                    )
                    .unwrap();
                }
                let expected = (if components { 61u64 } else { 32u64 })
                    * if affine { 6 } else { 1 }
                    * 1_000_000_000;
                println!(
                    "{{\"step\":\"{name}.step\",\"solids\":{},\"expected_mm3\":{expected}}}",
                    if components { 2 } else { 1 }
                );
            }
        }
    }
    for kind in 0..5 {
        for milli in [false, true] {
            let name = format!("independent-{kind}-{milli}");
            let text = if milli {
                independent_variant(kind).replace("SI_UNIT($,.METRE.)", "SI_UNIT(.MILLI.,.METRE.)")
            } else {
                independent_variant(kind)
            };
            let imported = import(&text, &ImportLimits::default()).unwrap();
            let body = &imported.bodies()[0];
            std::fs::write(directory.join(format!("{name}-input.step")), &text).unwrap();
            std::fs::write(
                directory.join(format!("{name}-native.json")),
                replay(body.model()).to_json().unwrap(),
            )
            .unwrap();
            let output = write_advanced(
                &[StepBody {
                    solid: body.solid(),
                    name: &name,
                }],
                &StepWriteOptions::new("independent.step", "2026-10-18T00:00:00"),
                &context(),
            )
            .result
            .unwrap()
            .unwrap();
            std::fs::write(directory.join(format!("{name}-output.step")), output.text()).unwrap();
            let expected = if milli { 32u64 } else { 32_000_000_000u64 };
            for suffix in ["input", "output"] {
                println!(
                    "{{\"step\":\"{name}-{suffix}.step\",\"solids\":1,\"expected_mm3\":{expected}}}"
                );
            }
        }
    }
}
