use hyperbrep::{Curve3, GeometryError, OperationContext, Point3, Real, WorkBudget};
use hypercurve::{
    BezierAlgebraicParameter2, BezierParameter2, BezierParameterInterval,
    BezierParameterPolynomial, Curve2, CurveParameter2, LineSeg2, Point2, Similarity2,
};

fn main() {
    let context = OperationContext::strict(WorkBudget {
        refinements: 100_000,
        promotions: 10_000,
    });
    let outcome = context.evaluate(|| -> Result<_, Box<dyn std::error::Error>> {
        for (coefficients, upper, count) in [(vec![1, 0, 1], 1, 0), (vec![2, -3, 1], 3, 2)] {
            let polynomial = BezierParameterPolynomial::try_new_power_basis(
                coefficients.into_iter().map(Real::from).collect(),
            )?;
            let interval = BezierParameterInterval::try_new(Real::zero(), Real::from(upper))?;
            assert_eq!(polynomial.root_count_in_interval(&interval)?, count);
            assert!(BezierAlgebraicParameter2::try_isolate(polynomial, interval).is_err());
        }
        let polynomial = BezierParameterPolynomial::try_new_power_basis(
            [-1, -2, 0, 0, 0, 32].map(Real::from).to_vec(),
        )?;
        let interval = BezierParameterInterval::try_new(Real::zero(), Real::one())?;
        assert_eq!(polynomial.root_count_in_interval(&interval)?, 1);
        let root = BezierParameter2::Algebraic(BezierAlgebraicParameter2::try_isolate(
            polynomial, interval,
        )?);
        assert!(root.scalar().is_none());
        let selected = CurveParameter2::from(root.clone());
        let source = Curve2::from(LineSeg2::try_new(
            Point2::from_values(0, 0),
            Point2::from_values(2, 0),
        )?);
        let point = source.point_at(&selected)?;
        assert!(point.coordinates().is_none());
        let (left, right) = source.split_at(selected.clone())?;
        assert!(left.end().coincides_with(&point)?);
        assert!(right.start().coincides_with(&point)?);
        assert!(left.end().coincides_with(&right.start())?);
        assert!(left.reversed()?.start().coincides_with(&point)?);

        let move_up = Similarity2::try_from_real_affine(
            Real::one(),
            Real::zero(),
            Real::zero(),
            Real::one(),
            Real::from(3),
            Real::from(5),
        )?;
        let move_back = Similarity2::try_from_real_affine(
            Real::one(),
            Real::zero(),
            Real::zero(),
            Real::one(),
            Real::from(-3),
            Real::from(-5),
        )?;
        let moved_source = source.transform_similarity(&move_up)?;
        let moved_left = left.transform_similarity(&move_up)?;
        assert!(
            moved_left
                .end()
                .coincides_with(&moved_source.point_at(&selected)?)?
        );
        let mut replayed = left.clone();
        for _ in 0..64 {
            replayed = replayed
                .transform_similarity(&move_up)?
                .transform_similarity(&move_back)?;
            assert!(replayed.end().coincides_with(&point)?);
            assert!(replayed.end().coordinates().is_none());
        }
        let cut = CurveParameter2::from((Real::one() / Real::from(4))?);
        let (first, last) = replayed.split_at(cut)?;
        assert!(first.end().coincides_with(&last.start())?);
        assert!(last.end().coincides_with(&point)?);

        // The same source polynomial is a valid spatial Bézier x coordinate.
        // Its unique preimage of the origin is still rejected at BREP's Real gate.
        let controls = [-5, -7, -9, -11, -13, 145]
            .into_iter()
            .map(|n| {
                Ok(Point3::new(
                    (Real::from(n) / Real::from(5))?,
                    Real::zero(),
                    Real::zero(),
                ))
            })
            .collect::<Result<Vec<_>, hyperbrep::GeometryError>>()?;
        let spatial = Curve3::rational_bezier(controls, vec![Real::one(); 6])?;
        let blocked = spatial.parameters_of(&Point3::origin()).unwrap_err();
        assert_eq!(blocked, GeometryError::UnrepresentableParameter);
        Ok(serde_json::json!({
            "zero_and_two_root_isolators_rejected": true,
            "polynomial": [-1, -2, 0, 0, 0, 32],
            "singleton_roots_in_unit_interval": 1,
            "stored_parameter_scalar": root.scalar().is_some(),
            "stored_point_coordinates": point.coordinates().is_some(),
            "planar_split_shared_contact": true,
            "planar_reverse_and_transform": true,
            "inverse_transform_pairs": 64,
            "repeated_split_preserves_selected_contact": true,
            "spatial_parameter_frontier": blocked.to_string(),
            "brep_split_persistence_replay": "not implemented by this probe"
        }))
    });
    let mut receipt = outcome
        .result
        .expect("probe work budget")
        .expect("exact probe");
    receipt["usage"] = serde_json::json!({
        "refinements": outcome.usage.refinements,
        "promotions": outcome.usage.promotions
    });
    println!("{}", serde_json::to_string_pretty(&receipt).unwrap());
}
