
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
                if let Classification::Decided(actual) = outcome.value {
                    assert_eq!(actual, ax*by-ay*bx==0 && ax*bx+ay*by<0,
                        "families {a}/{b}, directions ({ax},{ay})/({bx},{by})");
                }
                eprintln!("R12_MATRIX {policy:?} {a} {ax} {ay} {b} {bx} {by} {:?} {:?}",
                    outcome.value,outcome.certainty);
            }
        }
    }
}
