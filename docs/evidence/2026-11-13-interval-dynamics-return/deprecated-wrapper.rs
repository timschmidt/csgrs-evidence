mod native { pub fn operation() {} }
#[deprecated(note = "use native::operation")]
#[inline(always)]
pub fn legacy() { native::operation() }
fn main() { legacy(); }
