#[cfg(test)]
mod ring_product_sum_tests {
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

    fn number(value: i64) -> Computable {
        raw(Approximation::Ratio(Rational::from(value)))
    }

    fn add(a: &Computable, b: &Computable) -> Computable {
        raw(Approximation::Add(a.clone(), b.clone()))
    }

    fn neg(a: &Computable) -> Computable {
        raw(Approximation::Negate(a.clone()))
    }

    fn mul(a: &Computable, b: &Computable) -> Computable {
        raw(Approximation::Multiply(a.clone(), b.clone()))
    }

    fn identity(extra_factor: Option<Computable>) -> Computable {
        perturbed_identity(extra_factor, Rational::zero())
    }

    fn perturbed_identity(extra_factor: Option<Computable>, residual: Rational) -> Computable {
        let (left, right) = identity_parts(extra_factor, residual);
        add(&left, &mul(&number(12), &right))
    }

    fn identity_parts(
        extra_factor: Option<Computable>,
        residual: Rational,
    ) -> (Computable, Computable) {
        let [a, b, c, d] = [3, 5, 7, 11].map(|denominator| {
            raw(Approximation::PrescaledSin(Computable::rational(
                Rational::fraction(1, denominator).unwrap(),
            )))
        });
        let six = number(6);
        let twelve = number(12);
        let sixth = raw(Approximation::Ratio(Rational::fraction(1, 6).unwrap()));
        let a = add(&mul(&number(2), &a), &six);
        let x = add(&mul(&number(2), &b), &six);
        let z = add(&a, &mul(&sixth, &add(&x, &neg(&a))));
        let u = mul(&number(2), &c);
        let d = add(&mul(&number(2), &d), &six);
        let y = add(&d, &mul(&sixth, &add(&add(&u, &six), &neg(&d))));
        let h = add(
            &mul(&z, &add(&u, &neg(&six))),
            &neg(&mul(&add(&y, &neg(&twelve)), &x)),
        );
        // s = (6-u) h x + x h (u+6) = 12 x h. The complete
        // opposite products have 145 terms before their cancellation.
        let mut s = add(
            &mul(&mul(&add(&six, &neg(&u)), &h), &x),
            &mul(&mul(&x, &h), &add(&u, &six)),
        );
        if !residual.is_zero() {
            s = add(&s, &Computable::rational(residual));
        }
        let mut common = mul(&z, &h);
        if let Some(extra) = extra_factor {
            common = mul(&common, &extra);
        }
        (
            neg(&mul(&mul(&h, &s), &common)),
            mul(&mul(&h, &mul(&x, &h)), &common),
        )
    }

    fn assert_unproved(value: &Computable) {
        assert!(matches!(
            value.internal.facts.exact_sign(),
            ExactSignCache::Invalid
        ));
        assert!(value.cached().is_none());
    }

    #[test]
    fn shared_products_cancel_before_large_polynomial_expansion() {
        for displacement in [0, -1, 1] {
            let epsilon = Rational::fraction(displacement, 1_000_000_000_000).unwrap();
            let value = add(&identity(None), &Computable::rational(epsilon.clone()));
            assert_eq!(value.bounded_quotient_rational(), Some(epsilon));
            assert!(value.cached().is_none());
        }
    }

    #[test]
    fn shared_product_cancellation_preserves_operand_domains_and_degree() {
        for divisor in [number(0), raw(Approximation::PrescaledSin(number(1)))] {
            let value = identity(Some(raw(Approximation::Inverse(divisor))));
            assert_eq!(value.bounded_quotient_rational(), None);
            assert_unproved(&value);
        }
        let atom = raw(Approximation::PrescaledSin(number(2)));
        let value = identity(Some(atom));
        // Each summand now has degree nine, above the existing degree cap.
        assert_eq!(value.bounded_quotient_rational(), None);
        assert_unproved(&value);
    }

    #[test]
    fn shared_product_cancellation_rejects_a_nonzero_residual() {
        // x-x^3/6 < sin(x) < x for these positive inputs gives 6 < z < 7
        // and -1 < h < -1/2. Perturbing s changes the result to
        // -epsilon*z*h^2, whose sign is opposite epsilon's.
        for sign in [-1, 1] {
            let epsilon = Rational::fraction(sign, 1_000_000_000_000).unwrap();
            let value = perturbed_identity(None, epsilon);
            assert_ne!(value.bounded_quotient_rational(), Some(Rational::zero()));
            assert_eq!(
                value.sign_until(-128),
                Some(if sign < 0 {
                    RealSign::Positive
                } else {
                    RealSign::Negative
                })
            );
        }
    }

    #[test]
    fn common_factors_survive_scaled_nested_product_sums() {
        let (left, right) = identity_parts(None, Rational::zero());
        // left = -12*right, so 3*(left+5*right)+7*(left+15*right)=0.
        // Each inner sum is nonzero and exceeds the expansion term limit.
        let value = add(
            &mul(&number(3), &add(&left, &mul(&number(5), &right))),
            &mul(&number(7), &add(&left, &mul(&number(15), &right))),
        );
        assert_eq!(value.bounded_quotient_rational(), Some(Rational::zero()));
        assert!(value.cached().is_none());
    }

    #[test]
    fn shared_product_cancellation_preserves_budgets_and_recovers_after_cancel() {
        let mut value = identity(None);
        let mut recognition = RingRecognition::new(&value);
        recognition.operations_left = 16;
        assert!(
            recognition
                .expand_quotient(&value, RingRecognition::MAX_DEPTH)
                .is_none()
        );
        assert_unproved(&value);
        drop(recognition);
        let signal = Arc::new(AtomicBool::new(true));
        value.abort(signal.clone());
        assert_eq!(value.bounded_quotient_rational(), None);
        assert_unproved(&value);
        signal.store(false, std::sync::atomic::Ordering::Relaxed);
        assert_eq!(value.bounded_quotient_rational(), Some(Rational::zero()));
    }

    fn high_degree_opposite_products(count: usize, extra: Option<Computable>) -> Computable {
        let mut factors: Vec<_> = (0..count).map(|index| {
            let angle = raw(Approximation::Ratio(Rational::fraction(1, 3 + index as i64).unwrap()));
            let sine = raw(Approximation::PrescaledSin(angle));
            add(&raw(Approximation::Square(sine)), &number(1))
        }).collect();
        if let Some(extra) = extra { factors.push(extra); }
        let left = factors.iter().fold(number(1), |a, b| mul(&a, b));
        let right = factors.iter().rev().fold(number(1), |a, b| mul(&a, b));
        add(&left, &neg(&right))
    }

    #[test]
    fn late_product_cancellation_bounds_factors_without_expanding_their_total_degree() {
        for count in [7, 12] {
            let value = high_degree_opposite_products(count, None);
            assert_eq!(value.bounded_quotient_rational(), None);
            assert_unproved(&value);
            assert_eq!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
            assert!(value.cached().is_none());
        }
        let value = high_degree_opposite_products(13, None);
        assert_eq!(value.bounded_extended_relation_rational(), None);
        assert_unproved(&value);
    }

    #[test]
    fn late_product_cancellation_keeps_domains_and_nonzero_residuals() {
        for divisor in [number(0), raw(Approximation::PrescaledSin(number(1)))] {
            let value = high_degree_opposite_products(7, Some(raw(Approximation::Inverse(divisor))));
            assert_eq!(value.bounded_extended_relation_rational(), None);
            assert_unproved(&value);
        }
        let value = high_degree_opposite_products(7, Some(raw(Approximation::Inverse(number(2)))));
        assert_eq!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
        for sign in [-1, 1] {
            let value = add(&high_degree_opposite_products(7, None),
                &raw(Approximation::Ratio(Rational::fraction(sign, 1_000_000_000_000).unwrap())));
            assert_ne!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
        }
    }

    #[test]
    fn late_product_cancellation_preserves_remaining_work_depth_nodes_and_cancel() {
        let mut value = high_degree_opposite_products(7, None);
        let attempt = |value: &Computable, budget: usize, nodes: usize, depth: usize| {
            let mut recognition = RingRecognition::new(value);
            recognition.extended_degree = true;
            recognition.operations_left = budget;
            recognition.nodes_left = nodes;
            let Approximation::Add(a, b) = &value.internal.approximation else { panic!() };
            let result = recognition.recover_factored_zero::<true>(a, b, depth);
            (result.is_some(), budget - recognition.operations_left)
        };
        let (success, used) = attempt(&value, RingRecognition::EXTENDED_OPERATIONS,
            RingRecognition::MAX_NODES, RingRecognition::MAX_DEPTH - 1);
        assert!(success && used > 0);
        assert!(attempt(&value, used, RingRecognition::MAX_NODES, RingRecognition::MAX_DEPTH - 1).0);
        assert!(!attempt(&value, used - 1, RingRecognition::MAX_NODES, RingRecognition::MAX_DEPTH - 1).0);
        assert!(!attempt(&value, 0, RingRecognition::MAX_NODES, RingRecognition::MAX_DEPTH - 1).0);
        assert!(!attempt(&value, RingRecognition::EXTENDED_OPERATIONS, 0, RingRecognition::MAX_DEPTH - 1).0);
        assert!(!attempt(&value, RingRecognition::EXTENDED_OPERATIONS, RingRecognition::MAX_NODES, 0).0);
        assert_unproved(&value);
        let signal = Arc::new(AtomicBool::new(true));
        value.abort(signal.clone());
        assert_eq!(value.bounded_extended_relation_rational(), None);
        assert_unproved(&value);
        signal.store(false, std::sync::atomic::Ordering::Relaxed);
        assert_eq!(value.bounded_extended_relation_rational(), Some(Rational::zero()));
    }
}
