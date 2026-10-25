    #[test]
    fn polynomial_subdivision_shares_selected_cut_authority() {
        use hypersolve::bivariate_topology::{
            BivariateCurveDomain, BivariateTopologyConfig, decompose_bivariate_curve,
        };
        let equation = hypersolve::BivariatePolynomial::new(vec![
            vec![5.into(), 5.into(), 0.into(), 0.into(), 0.into(), 1.into()],
            vec![(-1).into()],
        ]);
        let topology = decompose_bivariate_curve(
            &equation,
            &BivariateCurveDomain {
                first: [(-1).into(), 1.into()],
                second: [(-2).into(), 2.into()],
            },
            BivariateTopologyConfig::default(),
        )
        .unwrap();
        let set = crate::PolynomialCurveSet2::from_topology(
            topology,
            hypersolve::AlgebraicFiberRootIsolationConfig::default(),
        )
        .unwrap();
        let original = set.curves()[0].clone();
        drop(set);
        for reversed in [false, true] {
            let curve = if reversed { original.reversed().unwrap() } else { original.clone() };
            for policy in [CurveContext::STRICT, CurveContext::APPROXIMATE_512] {
                // Duplicates and active endpoints must not make empty pieces.
                let cuts = [Real::zero(), q(-1, 2), q(1, 2), Real::zero(), (-1).into(), 1.into()];
                let pieces = curve.split_at_parameters(cuts.into_iter().map(Into::into), &policy).unwrap();
                assert_eq!(pieces.len(), 4);
                for pair in pieces.windows(2) {
                    let end = pair[0].1.end();
                    let start = pair[1].1.start();
                    assert!(end.shares_storage(&start), "adjacent pieces must reuse one selected fiber point");
                    assert_same(&end, &start, &policy);
                    let residual = end.rational_form(
                        equation.clone(), hypersolve::BivariatePolynomial::new(vec![vec![Real::one()]]),
                    ).unwrap();
                    assert_eq!(residual.compare_to_real(&Real::zero()).unwrap(), Ordering::Equal);
                }
                let (first, second) = curve.split_at(Real::zero().into()).unwrap();
                assert!(first.end().shares_storage(&second.start()), "the public one-cut split must share the same authority");
            }
        }
    }

