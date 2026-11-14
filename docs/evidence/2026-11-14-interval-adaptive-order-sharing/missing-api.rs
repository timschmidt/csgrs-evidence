#![cfg(feature="adaptive-taylor")]
use hyperdynamics::field::{ExpressionField,EnclosureBudget,EnclosurePolicy};
#[allow(dead_code)]
fn missing(f:ExpressionField<0>){let mut b=EnclosureBudget::new(EnclosurePolicy::default());let p=f.flow_taylor(0,&mut b).unwrap();let _=p.extend_order(1,&mut b);let _=f.adaptive_taylor(Default::default()).share_preparation();}
