    fn high_degree_unit_circle_product(extra: Option<Computable>) -> Computable {
        high_degree_circle_product(extra, 3)
    }

    fn high_degree_circle_product(extra: Option<Computable>, cosine_denominator: u64) -> Computable {
        let atom = raw(Approximation::PrescaledSin(raw(Approximation::Ratio(
            Rational::fraction(1, 7).unwrap(),
        ))));
        let power = (0..12).fold(number(1), |value, _| mul(&value, &atom));
        let mut common = add(&power, &number(1));
        if let Some(extra) = extra {
            common = mul(&common, &extra);
        }
        let angle = raw(Approximation::Ratio(Rational::fraction(1, 3).unwrap()));
        let sine = raw(Approximation::PrescaledSin(angle.clone()));
        let cosine = raw(Approximation::PrescaledCos(raw(Approximation::Ratio(
            Rational::fraction(1, cosine_denominator).unwrap(),
        ))));
        let circle = add(
            &raw(Approximation::Square(sine)),
            &raw(Approximation::Square(cosine)),
        );
        add(&mul(&common, &circle), &neg(&common))
    }

    #[test]
    fn late_factor_residual_uses_only_proved_unit_circle_relations() {
        let value = high_degree_unit_circle_product(None);
        assert_eq!(value.bounded_quotient_rational(), None);
        assert_unproved(&value);
        assert_eq!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
        for divisor in [number(0), raw(Approximation::PrescaledSin(number(1)))] {
            let value = high_degree_unit_circle_product(Some(raw(Approximation::Inverse(divisor))));
            assert_eq!(value.bounded_extended_relation_rational(), None);
            assert_unproved(&value);
        }
        // sin is strictly increasing on (0, pi/2), so sin(1/3)^2 +
        // cos(1/5)^2 - 1 = sin(1/3)^2 - sin(1/5)^2 is positive.
        let distinct = high_degree_circle_product(None, 5);
        assert_eq!(distinct.bounded_extended_relation_rational(), None);
        assert_unproved(&distinct);
        assert_eq!(distinct.sign_until(-128), Some(RealSign::Positive));
        // The defined inverse's nonzero witness remains sufficient.
        let value = high_degree_unit_circle_product(Some(raw(Approximation::Inverse(number(2)))));
        assert_eq!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
    }

    #[test]
    fn late_factor_residual_charges_all_work_and_observes_mid_attempt_cancel() {
        let mut value = high_degree_unit_circle_product(None);
        let attempt = |value: &Computable, budget| {
            let mut recognition = RingRecognition::new(value);
            recognition.root_squares = true;
            recognition.trig_arguments = Some(Vec::new());
            recognition.rational_squares = Some(Vec::new());
            recognition.extended_degree = true;
            recognition.operations_left = budget;
            let original = recognition.expand_quotient(value, RingRecognition::MAX_DEPTH);
            assert!(original.is_none());
            let Approximation::Add(a, b) = &value.internal.approximation else { panic!() };
            let result = recognition.recover_factored_zero::<true>(a, b, RingRecognition::MAX_DEPTH - 1)
                .and_then(|quotient| recognition.project_quotient(&quotient));
            (result, budget - recognition.operations_left)
        };
        let (result, used) = attempt(&value, RingRecognition::EXTENDED_OPERATIONS);
        assert_eq!(result, Some(Rational::zero()));
        assert_eq!(attempt(&value, used).0, Some(Rational::zero()));
        assert_eq!(attempt(&value, used - 1).0, None);
        assert_unproved(&value);

        let signal = Arc::new(AtomicBool::new(false));
        value.abort(signal.clone());
        let mut recognition = RingRecognition::new(&value);
        recognition.root_squares = true;
        recognition.trig_arguments = Some(Vec::new());
        recognition.rational_squares = Some(Vec::new());
        recognition.extended_degree = true;
        recognition.operations_left = RingRecognition::EXTENDED_OPERATIONS;
        assert!(recognition.expand_quotient(&value, RingRecognition::MAX_DEPTH).is_none());
        signal.store(true, std::sync::atomic::Ordering::Relaxed);
        let Approximation::Add(a, b) = &value.internal.approximation else { panic!() };
        assert!(recognition.recover_factored_zero::<true>(a, b, RingRecognition::MAX_DEPTH - 1).is_none());
        assert_unproved(&value);
        drop(recognition);
        signal.store(false, std::sync::atomic::Ordering::Relaxed);
        assert_eq!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
    }
