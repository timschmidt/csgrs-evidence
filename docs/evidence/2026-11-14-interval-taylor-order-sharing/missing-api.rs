#![cfg(feature = "taylor-flow")]
use hyperdynamics::field::{EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition};
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
fn budget() -> EnclosureBudget { EnclosureBudget::new(EnclosurePolicy::default()) }
fn field() -> ExpressionField<1> {
 let t=SymbolId(0); let x=SymbolId(1);
 let source=ExpressionProgram::compile(&[Expr::anonymous_symbol(x)], &[t,x], &mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
 ExpressionField::from_definition(FieldDefinition{source:source.definition().clone(),time:t,state:vec![x]}, &mut budget()).unwrap()
}
#[test]
fn prepared_order_can_supply_its_lower_remainder_stage() {
 let high=field().flow_taylor(3,&mut budget()).unwrap();
 let lower=high.restrict_order(1,&mut budget()).unwrap();
 assert_eq!(lower.order(),1); assert_eq!(lower.stages().len(),2);
}
