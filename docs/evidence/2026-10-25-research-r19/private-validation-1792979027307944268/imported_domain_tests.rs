#[cfg(all(test, feature = "serde"))]
mod imported_domain_tests {
    use super::*;

    fn raw(approximation: Approximation) -> Computable {
        Computable {
            internal: Arc::new(Node::new(
                approximation,
                BoundCache::Invalid,
                ExactSignCache::Invalid,
            )),
            signal: None,
        }
    }

    fn affine(q: Rational, a: Rational) -> Computable {
        raw(Approximation::Add(
            Computable::rational(q),
            raw(Approximation::Multiply(
                Computable::rational(a),
                Computable::pi(),
            )),
        ))
    }

    #[test]
    fn rational_affine_pi_images_replay_nonzero_without_a_sign_claim() {
        for q in [
            Rational::fraction(-3, 5).unwrap(),
            Rational::fraction(3, 5).unwrap(),
        ] {
            for a in [
                Rational::fraction(-7, 3).unwrap(),
                Rational::zero(),
                Rational::fraction(5, 2).unwrap(),
            ] {
                let argument = affine(q.clone(), a);
                for approximation in [
                    Approximation::PrescaledSin(argument.clone()),
                    Approximation::PrescaledCos(argument.clone()),
                ] {
                    let image = raw(approximation);
                    for wrapped in [
                        image.clone(),
                        raw(Approximation::Negate(image.clone())),
                        raw(Approximation::Offset(image.clone(), i32::MIN)),
                        raw(Approximation::Offset(image.clone(), i32::MAX)),
                    ] {
                        for _ in 0..2 {
                            assert!(wrapped.imported_affine_pi_trig_nonzero());
                            assert!(wrapped.cached().is_none());
                            assert!(matches!(
                                wrapped.internal.facts.exact_sign(),
                                ExactSignCache::Invalid
                            ));
                        }
                    }
                    assert!(image.cached().is_none());
                }
                assert!(argument.cached().is_none());
            }
        }
    }

    #[test]
    fn affine_pi_replay_declines_poles_and_unsupported_coefficients() {
        let pi = Computable::pi();
        for argument in [
            affine(Rational::zero(), Rational::one()),
            affine(Rational::zero(), Rational::fraction(1, 2).unwrap()),
            affine(Rational::zero(), Rational::zero()),
            raw(Approximation::Add(
                Computable::one(),
                raw(Approximation::Square(pi.clone())),
            )),
            raw(Approximation::Add(
                raw(Approximation::Sqrt(Computable::rational(Rational::new(2)))),
                pi.clone(),
            )),
            raw(Approximation::Add(
                raw(Approximation::PrescaledSin(Computable::one())),
                pi.clone(),
            )),
            raw(Approximation::Add(
                raw(Approximation::Multiply(
                    Computable::zero(),
                    Computable::one(),
                )),
                pi,
            )),
        ] {
            for approximation in [
                Approximation::PrescaledSin(argument.clone()),
                Approximation::PrescaledCos(argument.clone()),
            ] {
                let image = raw(approximation);
                assert!(!image.imported_affine_pi_trig_nonzero());
                assert!(image.cached().is_none());
                assert!(matches!(
                    image.internal.facts.exact_sign(),
                    ExactSignCache::Invalid
                ));
            }
        }
    }

    #[test]
    fn affine_pi_replay_limits_decline_without_poisoning_fresh_attempts() {
        let image = raw(Approximation::PrescaledSin(affine(
            Rational::one(),
            Rational::one(),
        )));
        let mut wrapped = image.clone();
        for _ in 0..47 {
            wrapped = raw(Approximation::Negate(wrapped));
        }
        assert!(wrapped.imported_affine_pi_trig_nonzero());
        wrapped = raw(Approximation::Negate(wrapped));
        assert!(!wrapped.imported_affine_pi_trig_nonzero());
        assert!(wrapped.cached().is_none());
        assert!(image.imported_affine_pi_trig_nonzero());

        fn wide(depth: usize) -> Computable {
            if depth == 0 {
                affine(Rational::one(), Rational::one())
            } else {
                raw(Approximation::Add(wide(depth - 1), wide(depth - 1)))
            }
        }
        let oversized = raw(Approximation::PrescaledSin(wide(8)));
        assert!(!oversized.imported_affine_pi_trig_nonzero());
        assert!(oversized.cached().is_none());
        assert!(image.imported_affine_pi_trig_nonzero());
    }

    #[test]
    fn affine_pi_replay_handles_extreme_argument_shifts_without_expansion() {
        for shift in [i32::MIN, i32::MAX] {
            let argument = raw(Approximation::Offset(
                affine(Rational::one(), Rational::one()),
                shift,
            ));
            let image = raw(Approximation::PrescaledSin(argument));
            // 2^shift * (1 + pi) is a rational affine pi expression with a
            // nonzero rational part, for every finite integer shift. Proving
            // that fact must not materialize the power-of-two coefficient.
            assert!(image.imported_affine_pi_trig_nonzero());
            assert!(image.cached().is_none());
        }
    }

    #[test]
    fn affine_pi_argument_work_and_cancellation_are_shared_and_retryable() {
        let mut argument = affine(Rational::one(), Rational::one());
        // The affine form uses five visits. Wrappers consume the same 48-visit
        // argument allowance, including unsuccessful alternative branches.
        for _ in 0..43 {
            argument = raw(Approximation::Negate(argument));
        }
        let mut image = raw(Approximation::PrescaledSin(argument.clone()));
        assert!(image.imported_affine_pi_trig_nonzero());
        let too_deep = raw(Approximation::PrescaledSin(raw(Approximation::Negate(
            argument,
        ))));
        assert!(!too_deep.imported_affine_pi_trig_nonzero());
        assert!(too_deep.cached().is_none());
        let stopped = Arc::new(AtomicBool::new(true));
        image.abort(stopped.clone());
        assert!(!image.imported_affine_pi_trig_nonzero());
        assert!(image.cached().is_none());
        stopped.store(false, std::sync::atomic::Ordering::Relaxed);
        assert!(image.imported_affine_pi_trig_nonzero());
        assert!(image.cached().is_none());
        assert!(matches!(
            image.internal.facts.exact_sign(),
            ExactSignCache::Invalid
        ));
    }
}
