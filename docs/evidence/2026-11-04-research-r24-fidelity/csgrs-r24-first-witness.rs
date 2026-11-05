mod support;
use hypercurve::*;

fn q(n: i32, d: i32) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

#[test]
fn extracted_parallel_curves_keep_their_individual_source_and_metric() {
    support::under_value(&PredicatePolicy::STRICT, || -> ExactCurveResult<()> {
        let source = CurvePath2::try_new(vec![
            LineSeg2::try_new(Point2::from_values(-1, 0), Point2::from_values(0, 0))?.into(),
            QuadraticBezier2::new(Point2::from_values(0, 0), Point2::from_values(1, 0), Point2::from_values(1, 1)).into(),
        ])?;
        let options = BezierParallelVerificationOptions::try_new(q(1, 20), 16)?;
        let output = source.approximate_parallel_blend2d_certified(q(1, 10), &options)?;
        assert_eq!(output.exact_source_curve_count(), 1);
        assert_eq!(output.approximated_source_curve_count(), 1);
        let path = output.into_path();
        for curve in path.curves() {
            let receipt = curve.parallel_fidelity().expect("per-output fidelity survives path extraction");
            assert!(receipt.source_curve_index() < 2);
            assert_eq!(receipt.source_curve(), &source.curves()[receipt.source_curve_index()]);
        }
        Ok(())
    }).unwrap();
}
