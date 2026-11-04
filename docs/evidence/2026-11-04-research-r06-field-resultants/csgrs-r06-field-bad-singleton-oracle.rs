        let definition =
            hypersolve::selected_polynomial_field::SelectedPolynomialDefinition::from_values(
                &first
                    .iter()
                    .chain(second.iter())
                    .flatten()
                    .cloned()
                    .collect::<Vec<_>>(),
                10000,
            )
            .unwrap();
        assert!(!definition.nodes.is_empty());
        let real = |p: &[Vec<Value>]| {
            let mut rows = Vec::new();
            for row in p {
                let mut out = Vec::new();
                for value in row {
                    // Here the authored coefficients are rational. Exact native
                    // replay of that scalar is an independent package boundary.
                    let bounds = decided(value.enclosed(&policy).unwrap());
                    let bounds = decided(bounds.refined(0, &policy).unwrap());
                    let interval = bounds.interval();
                    assert_eq!(interval.lower, interval.upper);
                    out.push(interval.lower.clone());
                }
                rows.push(out);
            }
            BivariatePolynomial::new(rows)
        };
        let native = hypersolve::resultant_bivariate_polynomial_system(
            &real(&first),
            &real(&second),
            CurveResultantParameter::First,
            CurveIntersectionResultantConfig {
                max_resultant_degree: 128,
                ..Default::default()
            },
        );
