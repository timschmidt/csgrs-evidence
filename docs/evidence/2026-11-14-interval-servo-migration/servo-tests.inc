
#[cfg(test)]
mod interval_migration_tests {
    use super::*;

    #[test]
    fn position_grid_preserves_exact_width_midpoint_and_wide_errors() {
        let values = [i64::MIN, i64::MIN + 1, -(1_i64 << 32), -1, 0, 1, 1_i64 << 32, i64::MAX - 1, i64::MAX];
        for &lower in &values {
            for &upper in &values {
                let result = ServoPositionInterval::new(ServoPosition::from_bits(lower), ServoPosition::from_bits(upper));
                if lower > upper {
                    assert_eq!(result, Err(ServoPositionIntervalError::Order));
                    continue;
                }
                let interval = result.unwrap();
                let expected_midpoint = (i128::from(lower) + i128::from(upper)).div_euclid(2);
                assert_eq!(i128::from(interval.midpoint().bits()), expected_midpoint);
                assert_eq!(u128::from(interval.width_ulps()), (i128::from(upper) - i128::from(lower)) as u128);
                assert_eq!(ServoPositionInterval::point(interval.midpoint()).midpoint(), interval.midpoint());
                assert_eq!(ServoPositionInterval::new(interval.lower(), interval.upper()).unwrap(), interval);
                for &target in &values {
                    let error = ServoPositionErrorInterval::from_target_and_observation(ServoPosition::from_bits(target), interval);
                    assert_eq!(error.lower_bits() + i128::from(upper), i128::from(target));
                    assert_eq!(error.upper_bits() + i128::from(lower), i128::from(target));
                    assert!(error.lower_bits() <= error.upper_bits());
                    assert_eq!(error.maximum_absolute_bits(), error.lower_bits().unsigned_abs().max(error.upper_bits().unsigned_abs()));
                }
            }
        }
        let error = ServoPositionErrorInterval::from_target_and_observation(ServoPosition::from_bits(i64::MAX), ServoPositionInterval::point(ServoPosition::from_bits(i64::MIN)));
        assert_eq!(error.lower_bits(), i128::from(u64::MAX));
    }

    #[test]
    fn velocity_error_preserves_full_i32_difference_without_narrowing() {
        let values = [i32::MIN, i32::MIN + 1, -(1_i32 << 30), -1, 0, 1, 1_i32 << 30, i32::MAX - 1, i32::MAX];
        for &lower in &values {
            for &upper in &values {
                if lower > upper { continue; }
                let interval = Q30Interval::new(Q30::from_bits(lower), Q30::from_bits(upper)).unwrap();
                for &target in &values {
                    let error = ServoQ30ErrorInterval::from_target_and_observation(Q30::from_bits(target), interval);
                    assert_eq!(i128::from(error.lower_bits()) + i128::from(upper), i128::from(target));
                    assert_eq!(i128::from(error.upper_bits()) + i128::from(lower), i128::from(target));
                    assert!(error.lower_bits() <= error.upper_bits());
                }
            }
        }
        let error = ServoQ30ErrorInterval::from_target_and_observation(Q30::from_bits(i32::MAX), Q30Interval::point(Q30::from_bits(i32::MIN)));
        assert_eq!(error.lower_bits(), i64::from(u32::MAX));
    }

    #[test]
    fn position_const_surface_and_layout_remain_available() {
        const FULL: ServoPositionInterval = match ServoPositionInterval::new(ServoPosition::from_bits(i64::MIN), ServoPosition::from_bits(i64::MAX)) {
            Ok(x) => x,
            Err(_) => panic!("ordered endpoints"),
        };
        const ENDPOINTS: [i64; 2] = [FULL.lower().bits(), FULL.upper().bits()];
        const POINT: ServoPositionInterval = ServoPositionInterval::point(ServoPosition::ZERO);
        assert_eq!(ENDPOINTS, [i64::MIN, i64::MAX]);
        assert_eq!(POINT.width_ulps(), 0);
        assert_eq!(core::mem::size_of::<ServoPositionInterval>(), 16);
        assert_eq!(core::mem::align_of::<ServoPositionInterval>(), core::mem::align_of::<i64>());
        assert_eq!(core::mem::size_of::<ServoPositionErrorInterval>(), 32);
        assert_eq!(core::mem::size_of::<ServoQ30ErrorInterval>(), 16);
    }
}
