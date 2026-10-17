#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/coplanar.rs"]
mod coplanar;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/coplanar_export.rs"]
mod coplanar_export;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_images.rs"]
mod images;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/oblique.rs"]
mod oblique;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/oblique_export.rs"]
mod oblique_export;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/prism_export.rs"]
mod prism_export;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/prisms.rs"]
mod prisms;
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/edge_image_queries.rs"]
mod queries;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/seam_cuts.rs"]
mod seam;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/seam_export.rs"]
mod seam_export;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/sector_export.rs"]
mod sector_export;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/sectors.rs"]
mod sectors;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/similarity.rs"]
mod similarity;
use analytic::cylinder;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/supplied_pcurves.rs"]
mod supplied;

#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/analytic_export.rs"]
mod analytic;
mod faceted;

#[unsafe(no_mangle)]
pub extern "C" fn run_probe() -> u32 {
    cylinder::closed_circle();
    cylinder::parameters();
    cylinder::representations();
    cylinder::oblique_frames();
    cylinder::units();
    cylinder::composition();
    cylinder::failures();
    cylinder::admission();
    images::parameterizations();
    images::faults();
    queries::parameter_and_radius_failures();
    queries::unresolved_is_not_success();
    queries::unsupported_is_not_endpoint_agreement();
    supplied::source_maps();
    supplied::representations();
    supplied::composition();
    supplied::failures();
    supplied::admission();
    analytic::imported_circles();
    analytic::frames_and_edits();
    analytic::planar_holes();
    analytic::units_and_occurrences();
    analytic::composition();
    analytic::failures_and_recovery();
    analytic::limits();
    assert_eq!(faceted::run_probe(), 5);
    similarity::primitives();
    similarity::clipped_and_voids();
    similarity::selected_and_repeated();
    similarity::rejection_and_recovery();
    similarity::periodic_and_near();
    analytic::scaled_units();
    similarity::profile_families();
    for kind in 0..3 {
        seam::original(kind);
    }
    assert_eq!(seam::transforms(), 54);
    assert_eq!(seam::boundary_provenance(), 16);
    seam_export::exchange_and_recovery();
    assert_eq!(seam::closed_boundary_provenance(), 2);
    for kind in 0..3 {
        for operation in 0..3 {
            coplanar::original(kind, operation);
        }
    }
    assert_eq!(coplanar::transforms().0, 54);
    coplanar::duplicate_carriers(0);
    coplanar::duplicate_carriers(2);
    assert_eq!(coplanar::circular_boundary_provenance(), 8);
    coplanar_export::exchange_and_recovery();
    for kind in 0..5 {
        sectors::original(kind);
    }
    assert_eq!(sectors::transforms().0, 30);
    sectors::annular_partition();
    sector_export::failures_and_recovery();
    oblique::conic_queries();
    oblique::torus_band_workflow(&hyperbrep::Matrix4::identity(), &hyperbrep::Real::one());
    for scale in [
        oblique::q(1, 1000),
        hyperbrep::Real::from(2).sqrt().unwrap(),
    ] {
        oblique::torus_band_workflow(&oblique::similarity(&scale, true), &scale);
    }
    oblique_export::failures_and_recovery();
    71
}

#[unsafe(no_mangle)]
pub extern "C" fn run_prism_probe() -> u32 {
    prisms::same_height_cylinder();
    prisms::covering_cylinders();
    prisms::covering_bores();
    prisms::annular_cut();
    prisms::slab_boundaries();
    prism_export::same_height();
    prism_export::holes();
    prism_export::malformed();
    prism_export::planar_controls();
    prism_export::inward_shell_is_rejected();
    prism_export::covering_circular_controls();
    scalar_half_angles();
    12
}
fn scalar_half_angles() {
    use hyperbrep::Real;
    for (n, d, c2, s2, den) in [
        (3, 4, 9, 1, 10),
        (4, 3, 4, 1, 5),
        (5, 12, 25, 1, 26),
        (12, 5, 9, 4, 13),
        (8, 15, 16, 1, 17),
        (15, 8, 25, 9, 34),
    ] {
        for sign in [-1, 1] {
            let angle = ((Real::from(sign * n) / Real::from(d))
                .unwrap()
                .atan()
                .unwrap()
                / Real::from(2))
            .unwrap();
            for (value, expected) in [
                (
                    angle.clone().cos(),
                    (Real::from(c2) / Real::from(den)).unwrap().sqrt().unwrap(),
                ),
                (
                    angle.sin(),
                    Real::from(sign) * (Real::from(s2) / Real::from(den)).unwrap().sqrt().unwrap(),
                ),
            ] {
                let encoded = serde_json::to_string(&value).unwrap();
                let replay: Real = serde_json::from_str(&encoded).unwrap();
                analytic::equal(&value, &expected);
                analytic::equal(&replay, &expected);
            }
        }
    }
}

#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/angular_images.rs"]
mod angular_images;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/torus_exchange.rs"]
mod torus_exchange;
#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/torus_input.rs"]
mod torus_input;
#[unsafe(no_mangle)]
pub extern "C" fn run_torus_probe() -> u32 {
    torus_exchange::whole();
    torus_exchange::halves_and_reconstruction();
    torus_exchange::rational_band();
    torus_input::source_maps();
    torus_input::failures_and_recovery();
    torus_input::admission();
    angular_images::proofs();
    7
}

#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/rotated_reconstruction.rs"]
mod rotated_reconstruction;
#[unsafe(no_mangle)]
pub extern "C" fn run_reconstruction_probe() -> u32 {
    rotated_reconstruction::workflow(false);
    rotated_reconstruction::workflow(true);
    let zeros: Vec<hyperbrep::Real> = serde_json::from_str(include_str!(
        "/mnt/development/csgrs/crates/hyperreal/tests/fixtures/periodic-rounding-zeros.json"
    ))
    .unwrap();
    for value in zeros {
        assert_eq!(value.floor_certified().unwrap(), 0.into());
        assert_eq!(value.ceil_certified().unwrap(), 0.into());
    }
    let pairs: Vec<[hyperbrep::Real; 2]> = serde_json::from_str(include_str!(
        "/mnt/development/csgrs/crates/hyperreal/tests/fixtures/periodic-endpoint-pairs.json"
    ))
    .unwrap();
    for [a, b] in pairs {
        assert!((a - b).exact_rational_normal_form().unwrap().is_zero());
    }
    4
}

#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep/tests/support/cone_continuation.rs"]
mod cone;

#[unsafe(no_mangle)]
pub extern "C" fn run_cone_probe() -> u32 {
    cone::reconstruction(false);
    cone::reconstruction(true);
    cone::band();
    cone::original_partition();
    cone::captured_circle_query();
    cone::overlap_contacts();
    let fresh = || {
        serde_json::from_str::<hyperbrep::Real>(include_str!(
            "/mnt/development/csgrs/crates/hyperreal/tests/fixtures/cone-chart-joint.json"
        ))
        .unwrap()
    };
    assert!(fresh().exact_rational_normal_form().unwrap().is_zero());
    assert_eq!(fresh().floor_certified().unwrap(), 0.into());
    assert_eq!(fresh().ceil_certified().unwrap(), 0.into());
    let delta = seam::ratio(1, 1_000_000) * seam::ratio(1, 1_000_000);
    for integer in [-7, 0, 11] {
        for sign in [-1, 0, 1] {
            let offset = hyperbrep::Real::from(integer) + hyperbrep::Real::from(sign) * &delta;
            let value = fresh() + &offset;
            assert_eq!(
                value.exact_rational_normal_form(),
                offset.exact_rational_normal_form()
            );
            let replay: hyperbrep::Real =
                serde_json::from_str(&serde_json::to_string(&value).unwrap()).unwrap();
            assert_eq!(
                replay.exact_rational_normal_form(),
                offset.exact_rational_normal_form()
            );
        }
    }
    let rows: Vec<serde_json::Value> = serde_json::from_str(include_str!(
        "/mnt/development/csgrs/crates/hyperreal/tests/fixtures/cone-continuation-zeros.json"
    ))
    .unwrap();
    assert_eq!(rows.len(), 23);
    for row in rows {
        let value: hyperbrep::Real = serde_json::from_value(row["value"].clone()).unwrap();
        assert!(value.exact_rational_normal_form().unwrap().is_zero());
    }
    9
}

#[allow(dead_code)]
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/cone_exchange.rs"]
mod cone_exchange;
#[unsafe(no_mangle)]
pub extern "C" fn run_cone_exchange_probe() -> u32 {
    cone_exchange::complete_workflows();
    cone_exchange::shifted_apex_and_units();
    cone_exchange::manual_line_inputs();
    cone_exchange::transformed_frames_and_explicit_encoding_limits();
    cone_exchange::inputs::reversed_generators_axes_units_and_source_maps();
    cone_exchange::inputs::supplied_pcurve_parameters();
    cone_exchange::inputs::failures_and_limits();
    cone_exchange::inputs::existing_surface_maps();
    // Exercise the root shared oracle on an additional cylinder within this
    // source-map group. No unused-helper suppression or relaxed check.
    {
        use hyperbrep_io::step::{StepBody, StepFile, StepReadOptions, StepWriteOptions};
        let native = hyperbrep::builder::cylinder(2.into(), 4.into()).unwrap();
        let output = analytic::export(
            &[StepBody {
                solid: native.bodies().next().unwrap(),
                name: "source maps",
            }],
            &StepWriteOptions::new("maps.step", "2026-10-17T00:00:00"),
        );
        let imported = analytic::reimport(&output);
        let file = StepFile::read(output.text().as_bytes(), &StepReadOptions::default()).unwrap();
        analytic::source_maps(&file, &imported);
        analytic::equal(
            &imported.bodies()[0].solid().volume().unwrap(),
            &(hyperbrep::Real::from(16) * hyperbrep::Real::pi()),
        );
    }
    8
}

mod native_regions;
#[path = "/mnt/development/csgrs/crates/hyperbrep-io/tests/support/region_extrusion.rs"]
mod region_exchange;
#[unsafe(no_mangle)]
pub extern "C" fn run_region_extrusion_probe() -> u32 {
    native_regions::normalized_strokes_keep_native_circle_surfaces_and_exact_measures();
    native_regions::winding_owned_holes_islands_and_components_survive_replay_and_composition();
    native_regions::empty_material_is_composable_and_does_not_hide_invalid_heights();
    native_regions::extrusion_restores_ambient_receipts_and_cannot_refund_exhausted_work();
    for cap in [hypercurve::OffsetCap::Butt, hypercurve::OffsetCap::Round] {
        for reverse in [false, true] {
            let (step, native) = region_exchange::round_trip(cap, reverse).unwrap();
            assert!(!step.is_empty() && !native.is_empty());
        }
    }
    8
}
