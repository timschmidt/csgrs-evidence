use hyperdynamics::field::{EnclosureBudget, EnclosurePolicy, ExpressionField, FieldDefinition, taylor_flow::FlowTaylorProgram};
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
use std::hint::black_box;
mod allocation;
fn budget() -> EnclosureBudget { EnclosureBudget::new(EnclosurePolicy::default()) }
fn field(case: usize) -> ExpressionField<1> {
    let t=SymbolId(0); let x=SymbolId(1); let v=Expr::anonymous_symbol(x);
    let rhs=match case {0=>Expr::int(2),1=>v,2=>v.clone()*v,_=>panic!("invalid case")};
    let source=ExpressionProgram::compile(&[rhs], &[x,t], &mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
    ExpressionField::from_definition(FieldDefinition {source:source.definition().clone(),time:t,state:vec![x]},&mut budget()).unwrap()
}
fn perform(f: &ExpressionField<1>, high: Option<&FlowTaylorProgram<1>>, mode: &str, order: usize) -> (Option<FlowTaylorProgram<1>>,Option<FlowTaylorProgram<1>>) {
    let mut b=budget();
    match mode {
        "prepare" => (Some(f.flow_taylor(order,&mut b).unwrap()),None),
        "restrict" => (None,Some(high.unwrap().restrict_order(order-1,&mut b).unwrap())),
        "paired" => {let high=f.flow_taylor(order,&mut b).unwrap();let low=high.restrict_order(order-1,&mut b).unwrap();(Some(high),Some(low))},
        _=>panic!("invalid mode")
    }
}
fn main() {
    let args:Vec<_>=std::env::args().collect();let case:usize=args[1].parse().unwrap();let mode=&args[2];let order:usize=args[3].parse().unwrap();let warm:bool=args[4].parse().unwrap();
    assert!(order>0);let f=field(case);let high=(mode=="restrict").then(|| f.flow_taylor(order,&mut budget()).unwrap());
    if warm { for _ in 0..16 {drop(black_box(perform(&f,high.as_ref(),mode,order)));} }
    for repeat in 0..8 {
        allocation::rust_tracking_reset();let before=allocation::AllocationStats::rust_snapshot();
        allocation::rust_tracking_enable(true);
        let output=black_box(perform(&f,high.as_ref(),mode,order));
        if let Some(p)=&output.0 {assert_eq!(p.order(),order);assert_eq!(p.stages().len(),order+1);}
        if let Some(p)=&output.1 {assert_eq!(p.order(),order-1);assert_eq!(p.stages().len(),order);}
        let retained=allocation::AllocationStats::rust_snapshot();drop(output);let after=allocation::AllocationStats::rust_snapshot();
        allocation::rust_tracking_enable(false);
        println!("ROW case={case} mode={mode} order={order} warm={warm} repeat={repeat} before={before:?} retained={retained:?} after={after:?}");
    }
    drop(high);drop(f);println!("FINAL {:?}",allocation::AllocationStats::rust_snapshot());
}
