use hyperbrep::{Real, builder};
use hypercurve::{CurvePath2, CurveRegion2, LineSeg2, OffsetCap, OffsetCornerStyle2, Point2};

fn main() {
    let line = CurvePath2::try_new(vec![
        LineSeg2::try_new(Point2::from_values(0, 0), Point2::from_values(3, 4))
            .unwrap()
            .into(),
    ])
    .unwrap();
    let region = CurveRegion2::stroke_path(
        &line,
        Real::one(),
        &OffsetCornerStyle2::Round,
        OffsetCap::Round,
    )
    .unwrap();
    let paths = region.boundary_paths().unwrap();
    for curve in paths[0].curves() {
        println!("profile={:?}", curve.family());
    }
    let bodies = builder::extrude_path(&paths[0], 0.into(), 3.into()).unwrap();
    println!("native counts={:?}", bodies.model().counts());
    for (index, face) in bodies.model().faces().enumerate() {
        let surface = face.surface().geometry();
        println!(
            "face={index} surface={:?} profile={:?} area={:?}",
            surface.kind(),
            surface.extrusion_profile_and_direction().map(|(p, _)| p.kind()),
            face.area()
        );
    }
    if let Some(path) = std::env::args_os().nth(1) {
        std::fs::write(path, bodies.model().to_json().unwrap()).unwrap();
    }
}
