
#[test]
fn r12_parallel_vector_opposition_preserves_ordered_signs_and_policy() {
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
        for turns in 0..4 {
            for reflected in [false, true] {
                let rotate = |mut x: i32, mut y: i32| {
                    if reflected { y = -y; }
                    for _ in 0..turns { (x, y) = (-y, x); }
                    (x, y)
                };
                let point = |x, y| { let (x,y) = rotate(x,y); p(x,y) };
                let source = QuadraticBezier2::new(point(0,0), point(1,0), point(2,1));
                for distance in [-8,-3,-2,0,2,3,8] {
                    let parallel = source.parallel_left(Real::from(distance)).unwrap();
                    for end in [false, true] {
                        for reversed in [false, true] {
                            // The source curvature is ±1/(2(1+t²)^(3/2)).
                            // Thus the parallel scale changes sign at distance 2
                            // at t=0 and 4√2 at t=1; no scalar predicate is the oracle.
                            let signed_distance = if reflected { -distance } else { distance };
                            let scale = if end {
                                if signed_distance > 0 && signed_distance * signed_distance > 32 { -1 } else { 1 }
                            } else { match signed_distance.cmp(&2) {
                                std::cmp::Ordering::Less => 1,
                                std::cmp::Ordering::Equal => 0,
                                std::cmp::Ordering::Greater => -1,
                            }};
                            let direction = scale * if reversed { -1 } else { 1 };
                            let (dx,dy) = rotate(2 * direction, if end { 2 * direction } else { 0 });
                            let Classification::Decided(tangent) = exact_parallel_endpoint_tangent(
                                &parallel, &parallel, &CurveParameterRange2::unit(),
                                &BezierParameter2::Exact(Real::from(i32::from(end))),
                                RealSign::Positive, reversed,
                            ).unwrap() else { panic!("the regular parallel owns a tangent") };
                            for (vx,vy) in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(-1,-1),(1,-1),(-1,1),(0,0)] {
                                let (vx,vy) = rotate(vx,vy);
                                let vector = CurveTangent2::RepresentedDirection((vx.into(),vy.into()));
                                let expected = if scale == 0 { Classification::Uncertain(UncertaintyReason::Boundary) } else if dx * vy - dy * vx != 0 {
                                    Classification::Decided(false)
                                } else { match (dx * vx + dy * vy).cmp(&0) {
                                    std::cmp::Ordering::Less => Classification::Decided(true),
                                    std::cmp::Ordering::Greater => Classification::Decided(false),
                                    std::cmp::Ordering::Equal => Classification::Uncertain(UncertaintyReason::Boundary),
                                }};
                                for (first,second) in [(&tangent,&vector),(&vector,&tangent)] {
                                    let outcome = crate::policy::resolve_certified_value(&policy, |attempt| curve_tangents_are_opposite(first,second,attempt));
                                    assert_eq!(outcome.certainty, CurveCertainty::Certified);
                                    assert_eq!(outcome.value, expected, "distance={distance}, end={end}, reflected={reflected}, reversed={reversed}, vector=({vx},{vy})");
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    let z = (Real::e()+Real::one()).sin() - Real::e().sin()*Real::one().cos() - Real::e().cos()*Real::one().sin();
    let parallel = QuadraticBezier2::new(p(0,0),p(1,0),p(2,1)).parallel_left(Real::zero()).unwrap();
    let Classification::Decided(tangent) = exact_parallel_endpoint_tangent(
        &parallel,&parallel,&CurveParameterRange2::unit(),&BezierParameter2::Exact(Real::zero()),RealSign::Positive,false,
    ).unwrap() else { panic!("the nonstationary endpoint owns a tangent") };
    for sign in [-1,1] {
        let vector = CurveTangent2::RepresentedDirection((Real::from(sign), z.clone()));
        for (first,second) in [(&tangent,&vector),(&vector,&tangent)] {
            for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512, CurveContext::STRICT] {
                let outcome = crate::policy::resolve_certified_value(&policy, |attempt| curve_tangents_are_opposite(first,second,attempt));
                if policy == CurveContext::STRICT {
                    assert_eq!(outcome.certainty,CurveCertainty::Certified);
                    assert!(matches!(outcome.value,Classification::Uncertain(_)));
                } else {
                    assert_eq!(outcome.certainty,CurveCertainty::Approximate512Consumed);
                    assert_eq!(outcome.value,Classification::Decided(sign < 0));
                }
            }
        }
    }
}
