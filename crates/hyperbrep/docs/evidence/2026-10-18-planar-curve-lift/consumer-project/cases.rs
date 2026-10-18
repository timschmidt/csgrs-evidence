#[path = "../../../../tests/support/parallel_profile_extrusion.rs"]
mod acceptance;

fn cases() -> [(&'static str, fn()); 12] {
    [
        ("original_nonlinear_parallel_cap_extrudes_and_replays", acceptance::original_nonlinear_parallel_cap_extrudes_and_replays),
        ("planar_images_preserve_exact_frame_and_chart", acceptance::planar_images_preserve_exact_frame_and_chart),
        ("parallel_cap_classification_and_edge_split", acceptance::parallel_cap_classification_and_edge_split),
        ("parallel_cap_affine_transform_and_cold_replay", acceptance::parallel_cap_affine_transform_and_cold_replay),
        ("parallel_cap_repeated_slab_booleans", acceptance::parallel_cap_repeated_slab_booleans),
        ("parallel_extrusion_point_queries", acceptance::parallel_extrusion_point_queries),
        ("authored_parallel_paths_share_admission", acceptance::authored_parallel_paths_share_admission),
        ("planar_image_archives_reject_forged_interior_and_frames", acceptance::planar_image_archives_reject_forged_interior_and_frames),
        ("planar_image_limits_and_typed_frontiers_recover", acceptance::planar_image_limits_and_typed_frontiers_recover),
        ("parallel_caps_keep_holes_and_components", acceptance::parallel_caps_keep_holes_and_components),
        ("planar_lifts_share_native_source_evaluation", acceptance::planar_lifts_share_native_source_evaluation),
        ("parallel_step_frontier", parallel_step_frontier),
    ]
}

fn parallel_step_frontier() {
    use hyperbrep::*;
    use hyperbrep_io::step::{StepBody, StepWriteOptions, WriteErrorKind, write_advanced};
    let bodies = builder::extrude_curve_region(&acceptance::original_parallel_cap(), 0.into(), 3.into()).unwrap();
    let json = bodies.model().to_json().unwrap();
    let model = RawModel::from_json(&json,&ArchiveLimits::default()).unwrap().validate().unwrap();
    let context = OperationContext::strict(WorkBudget { refinements:100_000, promotions:10_000 });
    let error = write_advanced(&[StepBody {solid:model.solids().next().unwrap(),name:"exact parallel cap"}], &StepWriteOptions::new("parallel.step","2026-10-18T00:00:00"), &context).result.unwrap().unwrap_err();
    assert!(matches!(error.kind, WriteErrorKind::NonRational | WriteErrorKind::UnsupportedCurve(Curve3Kind::PlanarImage)), "{error:?}");
    assert!(error.body.is_some());
    assert!(error.entity.is_some());
    assert_eq!(model.to_json().unwrap(),json);
}
