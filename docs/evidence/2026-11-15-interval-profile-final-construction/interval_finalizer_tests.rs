    #[test]
    fn interval_finalizers_run_once_only_after_validated_ingress() {
        use std::cell::Cell;
        let calls = Cell::new(0);
        let (bytes, digest) = document(&machine_records());
        let view = ConfigurationDocumentView::decode::<32>(
            &board_mks_tinybee::PACKAGE, &bytes, digest,
        ).unwrap();
        let missing: MachineProfileResult<Rational> = construct_scalar_interval(
            view, 0, ScalarFact::AxisEncoderCountsPerTurn,
            |nominal: Rational, _: NonEmptyRationalInterval| {
                calls.set(calls.get() + 1);
                Ok(nominal)
            },
        );
        assert!(matches!(missing, Err(MachineProfileError::MissingScalar {
            instance: 0, fact: ScalarFact::AxisEncoderCountsPerTurn,
        })));
        assert_eq!(calls.get(), 0);
        let valid = construct_scalar_interval(
            view, 0, ScalarFact::AxisMicrosteps,
            |nominal: Rational, interval: NonEmptyRationalInterval| {
                calls.set(calls.get() + 1);
                assert_eq!(interval.into_bounds(), (Rational::from(16), Rational::from(16)));
                Ok(nominal)
            },
        ).unwrap();
        assert_eq!(valid, Rational::from(16));
        assert_eq!(calls.get(), 1);
        calls.set(0);
        let valid_positive = construct_positive_scalar_interval(
            view, 0, ScalarFact::AxisMicrosteps,
            |nominal: Rational, interval: PositiveRationalInterval| {
                calls.set(calls.get() + 1);
                assert_eq!(interval.into_bounds(), (Rational::from(16), Rational::from(16)));
                nominal
            },
        ).unwrap();
        assert_eq!(valid_positive, Rational::from(16));
        assert_eq!(calls.get(), 1);
        calls.set(0);
        let mut records = machine_records();
        for record in &mut records {
            if let ConfigurationRecord::Scalar(scalar) = record
                && scalar.instance == 0
                && scalar.fact == ScalarFact::AxisCalibrationScale
            {
                scalar.uncertainty = wire_rational(1, 1);
            }
        }
        let (bytes, digest) = document(&records);
        let view = ConfigurationDocumentView::decode::<32>(
            &board_mks_tinybee::PACKAGE, &bytes, digest,
        ).unwrap();
        let invalid = construct_positive_scalar_interval(
            view, 0, ScalarFact::AxisCalibrationScale,
            |_: Rational, _: PositiveRationalInterval| { calls.set(calls.get() + 1); },
        );
        assert!(matches!(invalid, Err(MachineProfileError::NonPositiveLowerBound {
            instance: 0, fact: ScalarFact::AxisCalibrationScale,
        })));
        assert_eq!(calls.get(), 0);
    }
