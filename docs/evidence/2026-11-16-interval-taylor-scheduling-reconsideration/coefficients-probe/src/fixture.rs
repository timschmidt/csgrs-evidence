use hyperreal::{Real,Rational};
use hypersolve::{SymbolId,SymbolRef,expression_program::{ExpressionProgram,ExpressionDefinition,ExpressionNode,BinaryOperation,CoefficientRequest,ExpressionBudget}};
pub fn graph() -> ExpressionBudget { ExpressionBudget::new(100_000,10_000_000) }
pub fn source() -> (ExpressionProgram,Vec<CoefficientRequest>,Real) {
 let x=SymbolId(7);
 let k=Real::from("123456789012345678901234567890123456789012345678901234567890".parse::<Rational>().unwrap());
 let source=ExpressionProgram::from_definition(ExpressionDefinition {
 variables:vec![x], nodes:vec![
 ExpressionNode::Variable(SymbolRef::new(x,Some("retained_named_coordinate".repeat(8)))),
 ExpressionNode::Constant(k.clone()),
 ExpressionNode::Binary{operation:BinaryOperation::Mul,left:0,right:0},
 ExpressionNode::Binary{operation:BinaryOperation::Mul,left:1,right:2},
 ExpressionNode::Binary{operation:BinaryOperation::Add,left:3,right:0}],
 outputs:vec![4,4,1]},&mut graph()).unwrap();
 let requests=(0..3).flat_map(|output|(1..=3).map(move |degree|CoefficientRequest{output,powers:vec![(x,degree)]})).collect();
 (source,requests,k)
}
