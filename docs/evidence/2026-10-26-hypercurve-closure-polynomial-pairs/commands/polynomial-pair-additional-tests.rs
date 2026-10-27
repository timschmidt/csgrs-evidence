
#[test]
fn polynomial_pair_sections_keep_tangencies_and_distinct_supports() {
    let f = polynomial(&[&[0, 1], &[0], &[-1]]);
    let parabola = curves(f.clone());
    let quarter = curves(polynomial(&[&[-1, 4]]));
    assert_eq!((parabola.curves().len(), quarter.curves().len()), (1, 1));
    for (a, b, swapped) in [
        (&parabola.curves()[0], &quarter.curves()[0], false),
        (&quarter.curves()[0], &parabola.curves()[0], true),
    ] {
        let topology = a.intersection_topology(b).unwrap();
        assert!(topology.result().is_complete() && topology.result().overlaps().is_empty());
        assert_eq!(topology.result().contacts().len(), 2);
        assert_eq!((topology.first().len(), topology.second().len()), (3, 3));
        for (index, contact) in topology.result().contacts().iter().enumerate() {
            let x = if index == 0 { q(-1, 2) } else { q(1, 2) };
            assert!(contact.point().coincides_with(&Point2::new(x.clone(), q(1, 4)).into()).unwrap());
            on(contact.point(), f.clone());
            parameter_is(&contact.first().parameter().unwrap(), x.clone());
            parameter_is(&contact.second().parameter().unwrap(), x);
            assert_eq!(contact.tangent_cross_sign(), Some(if (index == 0) ^ swapped { RealSign::Positive } else { RealSign::Negative }));
            assert!(contact.is_certified_transverse());
        }
        for i in 0..3 {
            let next = topology.first()[i].intersection_topology(&topology.second()[i]).unwrap();
            assert_eq!((next.first().len(), next.second().len()), (1, 1));
            assert_eq!(next.result().contacts().len(), if i == 1 { 2 } else { 1 });
        }
    }
    let tangent = curves(polynomial(&[&[0, 1]]));
    rational_contact(&parabola.curves()[0], &tangent.curves()[0], 0.into(), 0.into(), RealSign::Zero);
    let delta = Real::pow2(-100);
    let displaced = curves(BivariatePolynomial::new(vec![vec![-delta, 1.into()], vec![0.into()], vec![(-1).into()]]));
    for (a, b) in [(&parabola.curves()[0], &displaced.curves()[0]), (&displaced.curves()[0], &parabola.curves()[0])] {
        assert!(a.intersect_curve(b).unwrap().is_disjoint());
        assert!(a.intersection_topology(b).unwrap().result().is_disjoint());
    }
}

#[test]
fn polynomial_pair_overlaps_keep_nonunit_parameter_maps() {
    let f = curves(polynomial(&[&[0, 1], &[-1]]));
    let g = curves(polynomial(&[&[0, -3, 1], &[3, -1]]));
    assert_eq!((f.curves().len(), g.curves().len()), (1, 1));
    for reverse in [false, true] {
        let a = if reverse { f.curves()[0].reversed().unwrap() } else { f.curves()[0].clone() };
        for (a, b) in [(&a, &g.curves()[0]), (&g.curves()[0], &a)] {
            let result = a.intersect_curve(b).unwrap();
            assert!(result.is_complete() && result.contacts().is_empty());
            assert_eq!(result.overlaps().len(), 1);
            let overlap = &result.overlaps()[0];
            let clipped = overlap.restrict(
                [q(-3, 4).into(), q(-1, 4).into()],
                [q(-1, 2).into(), Real::zero().into()],
            ).unwrap().expect("the original negative x charts overlap");
            assert_eq!(clipped.orientation(), overlap.orientation());
            assert!(clipped.includes_start() && clipped.includes_end());
            for (s, t) in [(clipped.first_range().start(), clipped.second_range().start()), (clipped.first_range().end(), clipped.second_range().end())] {
                assert_eq!(s.compare(t).unwrap(), Ordering::Equal);
                assert!(s.compare(&q(-1, 2).into()).unwrap() == Ordering::Equal || s.compare(&q(-1, 4).into()).unwrap() == Ordering::Equal);
                assert!(a.point_at(s).unwrap().coincides_with(&b.point_at(t).unwrap()).unwrap());
            }
            let widened = clipped.restrict([(-1).into(), 1.into()], [(-1).into(), 1.into()]).unwrap().unwrap();
            assert_eq!(widened.first_range(), clipped.first_range());
            assert_eq!(widened.second_range(), clipped.second_range());
            assert!(clipped.restrict([q(-1, 2).into(), q(-3, 8).into()], [q(-3, 8).into(), q(-1, 4).into()]).unwrap().is_none());
            let next = a.restrict_source(clipped.first_range().clone()).unwrap().intersection_topology(&b.restrict_source(clipped.second_range().clone()).unwrap()).unwrap();
            assert_eq!((next.first().len(), next.second().len()), (1, 1));
            assert_eq!(next.result().overlaps().len(), 1);
        }
    }
}

#[test]
fn singular_polynomial_pairs_do_not_invent_tangency() {
    let f = curves(polynomial(&[&[0, 0, 1], &[0], &[-1]]));
    let independent = curves(polynomial(&[&[0, 0, 1], &[0], &[-1]]));
    let axis = curves(polynomial(&[&[0, 1]]));
    for other in [&independent.curves()[1], &axis.curves()[0]] {
        for (a, b) in [(&f.curves()[0], other), (other, &f.curves()[0])] {
            let topology = a.intersection_topology(b).unwrap();
            assert!(topology.result().is_complete() && topology.result().overlaps().is_empty());
            assert_eq!(topology.result().contacts().len(), 1);
            let contact = &topology.result().contacts()[0];
            assert!(contact.point().coincides_with(&Point2::new(0.into(), 0.into()).into()).unwrap());
            assert_eq!(contact.tangent_cross_sign(), None);
            assert!(!contact.is_certified_transverse());
        }
    }
}

#[test]
fn polynomial_pairs_retry_and_retain_certainty() {
    let (a, b, point) = {
        let first = curves(polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]));
        let second = curves(polynomial(&[&[0, 0, 1], &[-1]]));
        let a = &first.curves()[0];
        let b = &second.curves()[0];
        let denied = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget::ZERO, || {
            let error = a.intersect_curve(b).unwrap_err();
            assert!(matches!(error, hypercurve::ExactCurveError::Blocked(blocker) if blocker.reason() == hypercurve::UncertaintyReason::BudgetExhausted));
        });
        let reached = denied.result.unwrap_err();
        assert_eq!((reached.limit, reached.used), (0, 0));
        assert!(reached.requested > 0);
        let retry = hypersolve::work_budget::with_budget(hypersolve::work_budget::WorkBudget { refinements: 100_000, promotions: 100_000 }, || a.intersection_topology(b));
        let topology = retry.result.unwrap().unwrap();
        assert!(topology.result().is_complete());
        (topology.first()[0].clone(), topology.second()[1].clone(), topology.result().contacts()[0].point().clone())
    };
    let replay = point.definition().unwrap().into_point().unwrap();
    assert!(replay.coincides_with(&point).unwrap());
    for policy in [hypercurve::PredicatePolicy::STRICT, hypercurve::PredicatePolicy::APPROXIMATE_512, hypercurve::PredicatePolicy::STRICT] {
        let outcome = hypercurve::evaluate_under(policy, || {
            let next = a.intersection_topology(&b).unwrap();
            assert!(next.result().is_complete());
            assert_eq!((next.first().len(), next.second().len()), (1, 1));
            assert_eq!(next.result().contacts().len(), 1);
            assert!(next.result().contacts()[0].point().coincides_with(&replay).unwrap());
            on(next.result().contacts()[0].point(), polynomial(&[&[5, 5, 0, 0, 0, 1], &[-1]]));
            on(next.result().contacts()[0].point(), polynomial(&[&[0, 0, 1], &[-1]]));
        });
        assert_eq!(outcome.certainty(), hypercurve::CurveCertainty::Certified);
        outcome.certified().unwrap();
    }
}
