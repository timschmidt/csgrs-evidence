#![cfg(feature = "taylor-flow")]
use hyperdynamics::field::ExpressionField;
fn missing(field: &ExpressionField<1>) { let _ = field.adaptive_taylor(Default::default()); }
