#![forbid(unsafe_code)]
fn assert_traits<T: Send + Sync + std::panic::UnwindSafe + std::panic::RefUnwindSafe>() {}
fn main() {
    assert_traits::<hypercurve::Curve2>();
    assert_traits::<hypercurve::CurvePath2>();
    assert_traits::<hypercurve::CurveRegion2>();
    assert_traits::<std::sync::Arc<std::sync::Mutex<Vec<hypercurve::CurveRegion2>>>>();
}
