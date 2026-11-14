use alumina_foc::{ServoPosition, ServoPositionInterval};
#[unsafe(no_mangle)]
pub extern "C" fn midpoint(lower:i64,upper:i64)->i64 {
 ServoPositionInterval::new(ServoPosition::from_bits(lower),ServoPosition::from_bits(upper)).unwrap().midpoint().bits()
}
#[unsafe(no_mangle)]
pub extern "C" fn width(lower:i64,upper:i64)->u64 {
 ServoPositionInterval::new(ServoPosition::from_bits(lower),ServoPosition::from_bits(upper)).unwrap().width_ulps()
}
