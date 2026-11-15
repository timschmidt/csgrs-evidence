#![no_std]
use hyperinterval::{F32Enclosure, F64Enclosure, IntervalError};
const _: () = assert!(!F32Enclosure::backend_supported());
const _: () = assert!(!F64Enclosure::backend_supported());
#[unsafe(no_mangle)]
pub extern "C" fn f32_rejected() -> bool {
    F32Enclosure::point(1.0) == Err(IntervalError::UnqualifiedEnvironment)
}
#[unsafe(no_mangle)]
pub extern "C" fn f64_rejected() -> bool {
    F64Enclosure::point(1.0) == Err(IntervalError::UnqualifiedEnvironment)
}
