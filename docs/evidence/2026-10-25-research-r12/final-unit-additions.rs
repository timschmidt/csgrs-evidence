
#[test]
fn parallel_vector_opposition_preserves_ordered_signs_and_policy() {
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
                                std::cmp::Ordering::Equal => 1, // one-sided interior scale at the endpoint cusp
                                std::cmp::Ordering::Greater => -1,
                            }};
                            let direction = scale * if reversed { -1 } else { 1 };
                            let (dx,dy) = rotate(2 * direction, if end { 2 * direction } else { 0 });
                            let Classification::Decided(tangent) = exact_parallel_endpoint_tangent(
                                &parallel, &parallel, &if end {
                                    CurveParameterRange2::try_new(q(9,10).into(), Real::one().into()).unwrap()
                                } else {
                                    CurveParameterRange2::try_new(Real::zero().into(), q(1,10).into()).unwrap()
                                },
                                &BezierParameter2::Exact(Real::from(i32::from(end))),
                                if scale > 0 {RealSign::Positive} else {RealSign::Negative}, reversed,
                            ).unwrap() else { panic!("the regular parallel owns a tangent") };
                            for (vx,vy) in [(1,0),(-1,0),(0,1),(0,-1),(1,1),(-1,-1),(1,-1),(-1,1),(0,0)] {
                                let (vx,vy) = rotate(vx,vy);
                                let vector = CurveTangent2::RepresentedDirection((vx.into(),vy.into()));
                                let expected = if dx * vy - dy * vx != 0 {
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

#[test]
fn joint_tangent_query_preserves_cross_only_certainty() {
    let z = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let represented = CurveTangent2::RepresentedDirection((Real::one(), Real::zero()));
    let parallel = QuadraticBezier2::new(p(0, 0), p(1, 0), p(2, 1))
        .parallel_left(Real::zero()).unwrap();
    let Classification::Decided(retained) = exact_parallel_endpoint_tangent(
        &parallel, &parallel, &CurveParameterRange2::unit(),
        &BezierParameter2::Exact(Real::zero()), RealSign::Positive, false,
    ).unwrap() else { panic!("regular source tangent") };
    drop(parallel);
    let vector = CurveTangent2::RepresentedDirection((z, Real::one()));
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512, CurveContext::STRICT] {
        for (first, second) in [(&represented, &vector), (&vector, &represented)] {
            let outcome = crate::policy::resolve_certified_value(&policy, |attempt| {
                curve_tangents_are_opposite(first, second, attempt)
            });
            assert_eq!(outcome.certainty, CurveCertainty::Certified);
            assert_eq!(outcome.value, Classification::Decided(false));
        }
        // This existing pair kernel requires both signs, including on its
        // cross-only entry point. Reuse must preserve that current contract.
        for (first, second) in [(&retained, &vector), (&vector, &retained)] {
            let outcome = crate::policy::resolve_certified_value(&policy, |attempt| {
                curve_tangents_are_opposite(first, second, attempt)
            });
            if policy == CurveContext::STRICT {
                assert_eq!(outcome.certainty, CurveCertainty::Certified);
                assert_eq!(outcome.value, Classification::Uncertain(UncertaintyReason::RealSign));
            } else {
                assert_eq!(outcome.certainty, CurveCertainty::Approximate512Consumed);
                assert_eq!(outcome.value, Classification::Decided(false));
            }
        }
    }
}

fn tangent_family_with_cardinal_direction(
    family: u8, dx: i32, dy: i32, policy: &CurveContext,
) -> CurveTangent2 {
    match family {
        0 => CurveTangent2::RepresentedDirection((dx.into(), dy.into())),
        1 => {
            let parallel = QuadraticBezier2::new(p(0, 0), p(dx, dy), p(2*dx+dy, 2*dy-dx))
                .parallel_left(Real::zero()).unwrap();
            let Classification::Decided(tangent) = exact_parallel_endpoint_tangent(
                &parallel, &parallel, &CurveParameterRange2::unit(),
                &BezierParameter2::Exact(Real::zero()), RealSign::Positive, false,
            ).unwrap() else { panic!("regular cardinal tangent") };
            tangent
        }
        2 => {
            let Classification::Decided(chord) = crate::BezierAlgebraicChord2::try_new(
                p(0,0).into(), p(dx,dy).into(), policy,
            ).unwrap() else { panic!("nonzero cardinal chord") };
            CurveTangent2::AlgebraicChord(chord)
        }
        3 => CurveTangent2::CircularPoint {
            point: p(-dy,dx).into(),
            circle: Arc::new(crate::rational_bezier::RationalQuadraticCircle2 {
                center: p(0,0), radius_squared: Real::one(), tangent_contacts: None,
            }),
            clockwise: true,
        },
        4 => {
            let (_,center) = selected_circle_fixture_center(policy);
            let Classification::Decided(Some(circle)) =
                crate::bezier_offset::BezierAlgebraicCuspSemicircle2::from_retained_axis_aligned_center(
                    &center, (-dy as i8,dx as i8), Real::one(), true, policy,
                ).unwrap() else { panic!("selected cardinal frame") };
            let fragment = crate::BezierAlgebraicCuspSemicircleFragment2::full(circle, policy);
            CurveTangent2::SelectedCircularEndpoint {
                source_fragment: fragment.clone(), fragment, at_start: true,
            }
        }
        5 => {
            let (_,center) = selected_circle_fixture_center(policy);
            let Classification::Decided(start) = crate::BezierAlgebraicChord2::translated_endpoint(
                &center, &Real::from(-dx), &Real::from(-dy), policy,
            ).unwrap() else { panic!("translated selected center") };
            let Classification::Decided(chord) = crate::BezierAlgebraicChord2::try_new(
                start, center.clone(), policy,
            ).unwrap() else { panic!("nonzero selected chord") };
            let Classification::Decided(Some(circle)) =
                crate::bezier_offset::BezierAlgebraicCuspSemicircle2::from_retained_center_and_chord_normal(
                    center, chord, Real::one(), true, policy,
                ).unwrap() else { panic!("selected chord normal frame") };
            let fragment = crate::BezierAlgebraicCuspSemicircleFragment2::full(circle, policy);
            let Classification::Decided(Some(tangent @ CurveTangent2::ChordContact { .. })) =
                selected_circle_endpoint_tangent(&fragment, &fragment, true, policy).unwrap()
            else { panic!("the chord contact route must be retained") };
            tangent
        }
        _ => unreachable!(),
    }
}

#[test]
fn ordered_tangent_families_preserve_opposition_frontier() {
    for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
        let tangents = (0..6).flat_map(|family| {
            [(1,0),(0,1),(-1,0),(0,-1)].into_iter().map(move |(dx,dy)| {
                (family,dx,dy,tangent_family_with_cardinal_direction(family,dx,dy,&policy))
            })
        }).collect::<Vec<_>>();
        for (a,ax,ay,first) in &tangents {
            for (b,bx,by,second) in &tangents {
                let outcome = crate::policy::resolve_certified_value(&policy, |attempt| {
                    curve_tangents_are_opposite(first,second,attempt)
                });
                assert_eq!(outcome.certainty, CurveCertainty::Certified);
                let cross = ax*by-ay*bx;
                let expected = if matches!((a,b), (1,5)|(5,1)|(1,3)|(3,1)|(3,3)|(3,4)|(4,3)|(3,5)|(5,3))
                    || ((*a==3 || *b==3) && cross==0)
                {
                    Classification::Uncertain(UncertaintyReason::Unsupported)
                } else if *a==5 && *b==5 && cross!=0 {
                    Classification::Uncertain(UncertaintyReason::Boundary)
                } else {
                    Classification::Decided(cross==0 && ax*bx+ay*by<0)
                };
                assert_eq!(outcome.value, expected,
                    "families {a}/{b}, directions ({ax},{ay})/({bx},{by})");
            }
        }
    }
}
