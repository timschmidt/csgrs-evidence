#![cfg(feature = "svg")]

use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveCornerMode2, CurveFamily2, CurveFillet2,
    CurveParameter2, CurvePath2, CurvePoint2, CurvePointLocations2, CurveRegion2, Real,
    SvgGeometry2, export_svg_document, import_svg_document,
};

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}
fn selected() -> CurveParameter2 {
    let mut coefficients = vec![Real::zero(); 8];
    coefficients[0] = (-1).into();
    coefficients[7] = 2.into();
    BezierParameter2::Algebraic(
        BezierAlgebraicParameter2::try_isolate(
            BezierParameterPolynomial::try_new_power_basis(coefficients).unwrap(),
            BezierParameterInterval::try_new(q(3, 4), 1.into()).unwrap(),
        )
        .unwrap(),
    )
    .into()
}
fn at(beta: &CurveParameter2, x: Real, y: Real) -> CurvePoint2 {
    beta.affine_point(1.into(), x, 0.into(), y).unwrap()
}
fn encode(path: CurvePath2) -> String {
    export_svg_document(&SvgGeometry2::new(
        CurveRegion2::empty(),
        vec![],
        vec![path],
    ))
    .unwrap()
}
fn fillet() -> CurvePath2 {
    let beta = selected();
    let path = CurvePath2::try_new(vec![
        Curve2::try_line(at(&beta, 0.into(), 0.into()), at(&beta, 1.into(), 0.into())).unwrap(),
        Curve2::try_line(at(&beta, 1.into(), 0.into()), at(&beta, 1.into(), 1.into())).unwrap(),
    ])
    .unwrap();
    let mut solutions = path
        .fillet_vertex(1, &CurveFillet2::new(q(1, 4)), CurveCornerMode2::TrimOnly)
        .unwrap()
        .into_solutions();
    assert_eq!(solutions.len(), 1);
    solutions.pop().unwrap()
}
fn verify(text: &str) {
    let replay = import_svg_document(text).unwrap();
    let path = &replay.paths()[0];
    assert_eq!(path.curves().len(), 3);
    let circle = &path.curves()[1];
    assert_eq!(circle.family(), CurveFamily2::CircularArc);
    assert!(circle.geometry().is_none());
    let beta = selected();
    assert!(
        circle
            .start()
            .coincides_with(&at(&beta, q(3, 4), 0.into()))
            .unwrap()
    );
    assert!(
        circle
            .end()
            .coincides_with(&at(&beta, 1.into(), q(1, 4)))
            .unwrap()
    );
    // C=(beta+3/4,1/4), r=1/4. The rational chart at u=1/4
    // has radial components (3/5,-4/5), so this point is exact.
    let interior = at(&beta, q(9, 10), q(1, 20));
    let CurvePointLocations2::Locations(locations) = circle.point_locations(&interior).unwrap()
    else {
        panic!("one selected point on the retained quarter circle")
    };
    assert_eq!(locations.len(), 1);
    let parameter = locations[0].parameter().unwrap().clone();
    assert!(
        circle
            .point_at(&parameter)
            .unwrap()
            .coincides_with(&interior)
            .unwrap()
    );
    let (first, second) = circle.split_at(parameter).unwrap();
    assert!(first.end().coincides_with(&interior).unwrap());
    assert!(second.start().coincides_with(&interior).unwrap());
    let reversed =
        CurvePath2::try_new(vec![second.reversed().unwrap(), first.reversed().unwrap()]).unwrap();
    let second_text = encode(reversed);
    let twice = import_svg_document(&second_text).unwrap();
    assert!(
        twice.paths()[0]
            .start()
            .coincides_with(&circle.end())
            .unwrap()
    );
    assert!(
        twice.paths()[0]
            .end()
            .coincides_with(&circle.start())
            .unwrap()
    );
    assert_eq!(encode(twice.paths()[0].clone()), second_text);
    assert_eq!(encode(path.clone()), text);
}

#[test]
fn selected_circular_fillet_replays_in_a_fresh_process_before_split_and_reversal() {
    const INPUT: &str = "HYPERCURVE_CIRCLE_SVG_REPLAY_INPUT";
    if let Some(path) = std::env::var_os(INPUT) {
        verify(&std::fs::read_to_string(path).unwrap());
        return;
    }
    let path = fillet();
    let text = encode(path);
    verify(&text);
    let file =
        std::env::temp_dir().join(format!("hypercurve-circle-svg-{}.svg", std::process::id()));
    std::fs::write(&file, &text).unwrap();
    let output = std::process::Command::new(std::env::current_exe().unwrap())
        .args([
            "--exact",
            "selected_circular_fillet_replays_in_a_fresh_process_before_split_and_reversal",
            "--nocapture",
        ])
        .env(INPUT, &file)
        .output()
        .unwrap();
    std::fs::remove_file(file).unwrap();
    assert!(
        output.status.success(),
        "{}{}",
        String::from_utf8_lossy(&output.stdout),
        String::from_utf8_lossy(&output.stderr)
    );
}
