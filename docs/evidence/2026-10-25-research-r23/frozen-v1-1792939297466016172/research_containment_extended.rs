use std::cmp::Ordering;

use hypercurve::{
    Aabb2, Axis2, BoxBoundary2, Curve2, CurveBoxContainment2, CurveCertainty, CurveGeometry2,
    CurvePoint2, Point2, PredicatePolicy, RationalBezier2, Real, Similarity2, evaluate_under,
};

fn q(n: i64, d: i64) -> Real {
    (Real::from(n) / Real::from(d)).unwrap()
}

fn below(y: Real) -> Aabb2 {
    Aabb2::new_unchecked(Point2::from_values(-10, -10), Point2::new(10.into(), y))
}

fn cubic(scale: i64) -> (Vec<Point2>, Vec<Real>, Point2) {
    // x=t, y=(t-t^2)/(1+t). y'=(1-2t-t^2)/(1+t)^2,
    // so t=sqrt(2)-1 is the unique maximum and y=3-2sqrt(2).
    let controls = vec![
        Point2::from_values(0, 0),
        Point2::new(q(1, 4), q(1, 4)),
        Point2::new(q(3, 5), q(1, 5)),
        Point2::from_values(1, 0),
    ];
    let weights = [q(1, 1), q(4, 3), q(5, 3), q(2, 1)]
        .map(|w| w * Real::from(scale))
        .to_vec();
    let sqrt2 = Real::from(2).sqrt().unwrap();
    let peak = Point2::new(&sqrt2 - Real::one(), Real::from(3) - Real::from(2) * sqrt2);
    (controls, weights, peak)
}

fn quartic(scale: i64) -> (Vec<Point2>, Vec<Real>, Point2) {
    // x=t, y=(t-t^3)/(1+t^2). y'=(1-4t^2-t^4)/(1+t^2)^2.
    // The numerator decreases strictly for t>0 and has its only positive
    // root at sqrt(sqrt(5)-2); no curve-kernel extremum is used as an oracle.
    let controls = vec![
        Point2::from_values(0, 0),
        Point2::new(q(1, 4), q(1, 4)),
        Point2::new(q(3, 7), q(3, 7)),
        Point2::new(q(2, 3), q(1, 3)),
        Point2::from_values(1, 0),
    ];
    let weights = [6, 6, 7, 9, 12].map(|w| Real::from(w * scale)).to_vec();
    let t2 = Real::from(5).sqrt().unwrap() - Real::from(2);
    let t = t2.clone().sqrt().unwrap();
    let y = (&t * (Real::one() - &t2) / (Real::one() + t2)).unwrap();
    (controls, weights, Point2::new(t, y))
}

fn require_peak(curve: &Curve2, peak: &Point2, name: &str) {
    let tiny = Real::from(2).powi_i64(-200).unwrap();
    let tests = [
        ("hull", Real::one(), true),
        ("tangent", peak.y().clone(), true),
        ("above", peak.y() + &tiny, true),
        ("below", peak.y() - &tiny, false),
        ("outside", q(1, 10), false),
    ];
    let mut witnesses = Vec::new();
    for policy in [
        PredicatePolicy::STRICT,
        PredicatePolicy::APPROXIMATE_512,
        PredicatePolicy::STRICT,
    ] {
        for (bound_name, max_y, contained) in &tests {
            println!("R23 extended {name} {bound_name} {policy:?}");
            let result = evaluate_under(policy, || curve.box_containment(&below(max_y.clone())));
            assert_eq!(result.certainty(), CurveCertainty::Certified);
            match result.into_unverified().unwrap() {
                CurveBoxContainment2::Contained => assert!(*contained, "{name}/{bound_name}"),
                CurveBoxContainment2::Escapes(escape) => {
                    assert!(!contained, "{name}/{bound_name}");
                    assert_eq!(
                        (escape.axis(), escape.boundary()),
                        (Axis2::Y, BoxBoundary2::Maximum)
                    );
                    assert_eq!(escape.curve_index(), 0);
                    assert_eq!(
                        escape
                            .point()
                            .compare_coordinate(
                                &Point2::new(Real::zero(), max_y.clone()).into(),
                                Axis2::Y
                            )
                            .unwrap(),
                        Ordering::Greater
                    );
                    // An inserted knot is a legal first witness when already
                    // outside. At the near-peak bound, only the peak escapes.
                    if *bound_name == "below" {
                        assert!(escape.point().coincides_with(&peak.clone().into()).unwrap());
                    }
                    let cold = escape.point().definition().unwrap().into_point().unwrap();
                    assert!(cold.coincides_with(escape.point()).unwrap());
                    witnesses.push(cold);
                }
            }
        }
    }
    for witness in witnesses {
        // These fixtures have x=t, including the independent extremum.
        let parameter = witness.affine_form(1.into(), 0.into(), 0.into());
        assert_ne!(
            parameter.compare_to_real(&Real::zero()).unwrap(),
            Ordering::Less
        );
        assert_ne!(
            parameter.compare_to_real(&Real::one()).unwrap(),
            Ordering::Greater
        );
    }
}

#[test]
fn irrational_extrema_survive_signed_weights_knots_and_reversal() {
    for (family, fixture) in [
        (
            "cubic",
            cubic as fn(i64) -> (Vec<Point2>, Vec<Real>, Point2),
        ),
        ("quartic", quartic),
    ] {
        for scale in [1, -7] {
            let (controls, weights, peak) = fixture(scale);
            let degree = controls.len() - 1;
            let native =
                Curve2::from(RationalBezier2::try_new(controls.clone(), weights.clone()).unwrap());
            let knots = [
                vec![Real::from(2); degree + 1],
                vec![Real::from(5); degree + 1],
            ]
            .concat();
            let spline = Curve2::try_nurbs(degree, controls, weights, knots).unwrap();
            let CurveGeometry2::Nurbs(spline) = spline.geometry().unwrap() else {
                panic!("NURBS carrier");
            };
            let knotted = Curve2::from(
                spline
                    .insert_knots(vec![Real::from(3), Real::from(4)])
                    .unwrap(),
            );
            for (representation, curve) in [("native", native), ("knotted", knotted)] {
                let reversed = curve.reversed().unwrap();
                require_peak(&curve, &peak, &format!("{family}/{scale}/{representation}"));
                require_peak(
                    &reversed,
                    &peak,
                    &format!("{family}/{scale}/{representation}/reversed"),
                );
            }
        }
    }
}

#[test]
fn repeated_derivative_root_and_constant_coordinate_keep_exact_tangency() {
    // y=1-(2t-1)^4, with a multiplicity-three derivative root at t=1/2.
    // x is identically zero. Both endpoint values are zero and max y=1.
    let curve = Curve2::from(
        RationalBezier2::try_new(
            [0, 2, 0, 2, 0].map(|y| Point2::from_values(0, y)).to_vec(),
            vec![Real::one(); 5],
        )
        .unwrap(),
    );
    require_peak(&curve, &Point2::from_values(0, 1), "flat-quartic");
}

#[test]
fn selected_extremum_witness_survives_similarity_and_source_drop() {
    let (controls, weights, peak) = quartic(1);
    let curve = Curve2::from(RationalBezier2::try_new(controls, weights).unwrap());
    // Quarter turn and reflection, each scaled by two and translated.
    for (a, b, d, e, axis, boundary, expected) in [
        (
            0,
            -2,
            2,
            0,
            Axis2::X,
            BoxBoundary2::Minimum,
            Point2::new(
                Real::from(3) - Real::from(2) * peak.y(),
                Real::from(4) + Real::from(2) * peak.x(),
            ),
        ),
        (
            2,
            0,
            0,
            -2,
            Axis2::Y,
            BoxBoundary2::Minimum,
            Point2::new(
                Real::from(3) + Real::from(2) * peak.x(),
                Real::from(4) - Real::from(2) * peak.y(),
            ),
        ),
    ] {
        let transform = Similarity2::try_from_real_affine(
            a.into(),
            b.into(),
            d.into(),
            e.into(),
            3.into(),
            4.into(),
        )
        .unwrap();
        let mapped = curve.transform_similarity(&transform).unwrap();
        let tiny = Real::from(2).powi_i64(-200).unwrap();
        for delta in [-tiny.clone(), Real::zero(), tiny.clone()] {
            let boundary_value = if axis == Axis2::X {
                expected.x()
            } else {
                expected.y()
            };
            let minimum = boundary_value + &delta;
            let min = if axis == Axis2::X {
                Point2::new(minimum, (-10).into())
            } else {
                Point2::new((-10).into(), minimum)
            };
            let envelope = Aabb2::new_unchecked(min, Point2::from_values(10, 10));
            for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512] {
                let result = evaluate_under(policy, || mapped.box_containment(&envelope));
                assert_eq!(result.certainty(), CurveCertainty::Certified);
                if delta == tiny {
                    let CurveBoxContainment2::Escapes(escape) = result.into_unverified().unwrap()
                    else {
                        panic!("minimum escapes");
                    };
                    assert_eq!((escape.axis(), escape.boundary()), (axis, boundary));
                    let definition = escape.point().definition().unwrap();
                    drop(escape);
                    let cold = definition.into_point().unwrap();
                    assert!(
                        cold.coincides_with(&CurvePoint2::from(expected.clone()))
                            .unwrap()
                    );
                } else {
                    assert_eq!(
                        result.into_unverified().unwrap(),
                        CurveBoxContainment2::Contained
                    );
                }
            }
        }
        let CurveBoxContainment2::Escapes(escape) = mapped
            .box_containment(&Aabb2::new_unchecked(
                Point2::from_values(0, 0),
                Point2::from_values(1, 1),
            ))
            .unwrap()
        else {
            panic!("endpoint escapes");
        };
        drop(mapped);
        assert!(
            escape
                .point()
                .definition()
                .unwrap()
                .into_point()
                .unwrap()
                .coincides_with(escape.point())
                .unwrap()
        );
    }
}

#[test]
fn a_pole_cannot_be_certified_as_a_finite_contained_curve() {
    // W(t)=1-2t has an interior zero. The homogeneous numerator does not
    // vanish there, so this is an actual pole, not a removable singularity.
    let curve = Curve2::from(
        RationalBezier2::try_new(
            [0, 1, 2, 3].map(|x| Point2::from_values(x, x)).to_vec(),
            [q(1, 1), q(1, 3), q(-1, 3), q(-1, 1)].to_vec(),
        )
        .unwrap(),
    );
    for policy in [
        PredicatePolicy::STRICT,
        PredicatePolicy::APPROXIMATE_512,
        PredicatePolicy::STRICT,
    ] {
        let result = evaluate_under(policy, || curve.box_containment(&below(Real::from(100))));
        assert!(result.into_unverified().is_err());
    }
}
