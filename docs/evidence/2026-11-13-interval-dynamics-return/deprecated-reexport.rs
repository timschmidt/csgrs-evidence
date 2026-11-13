mod native { pub fn operation() {} }
#[deprecated(note = "use native::operation")]
pub use native::operation as legacy;
fn main() { legacy(); }
