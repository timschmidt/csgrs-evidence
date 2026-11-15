#![cfg(feature = "dyadic")]
use hyperinterval::{DyadicBudget, DyadicInterval};

fn d(a: i64, b: i64, e: i32) -> DyadicInterval {
    DyadicInterval::new(a.into(), b.into(), e).unwrap()
}
fn budget() -> DyadicBudget {
    DyadicBudget::new(4096, 1_000_000_000)
}

#[test]
fn upper_exponent_product_is_representable() {
    assert_eq!(
        d(1, 1, i32::MAX).mul(&d(1, 1, 1), &mut budget()).unwrap(),
        d(2, 2, i32::MAX)
    );
}

#[test]
fn lower_exponent_product_hull_removes_common_factor() {
    assert_eq!(
        d(-1, 2, -1_073_741_824)
            .mul(&d(-1, 2, -1_073_741_825), &mut budget()).unwrap(),
        d(-1, 2, i32::MIN)
    );
}
