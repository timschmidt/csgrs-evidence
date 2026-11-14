#![cfg(feature = "taylor-polynomial")]
use hyperinterval::{DyadicBudget, DyadicInterval};
use hypersolve::{
    Expr, SymbolId,
    expression_program::{ExpressionBudget, ExpressionProgram, TaylorModel, TaylorPolynomialModel, TaylorRequest},
};
use std::sync::Arc;
fn g() -> ExpressionBudget { ExpressionBudget::new(100_000, 10_000_000) }
fn a() -> DyadicBudget { DyadicBudget::new(16384, 1_000_000_000) }
fn d(l:i64,u:i64,e:i32)->DyadicInterval { DyadicInterval::new(l.into(),u.into(),e).unwrap() }
fn model(expr:Expr, variable:SymbolId, center:DyadicInterval, domain:DyadicInterval, order:usize)->Arc<TaylorModel> {
    Arc::new(ExpressionProgram::compile(&[expr], &[variable], &mut g()).unwrap().taylor_model(TaylorRequest{center:vec![center],domain:vec![domain],order,precision:-64}, &mut g(), &mut a()).unwrap())
}
#[test]
fn reciprocal_model_composes_without_redifferentiating_inner_source() {
    let x=Expr::anonymous_symbol(SymbolId(7));
    let inner=model(Expr::int(1)+x,SymbolId(7),d(0,0,0),d(-1,1,-2),1);
    let u=Expr::anonymous_symbol(SymbolId(20));
    let outer=model(Expr::int(1)/u,SymbolId(20),d(1,1,0),d(3,5,-2),1);
    let result=TaylorPolynomialModel::new(inner.clone(),outer.clone(),&mut g(),&mut a()).unwrap();
    assert!(Arc::ptr_eq(result.source(),&inner));
    assert!(Arc::ptr_eq(result.model_map(0).unwrap(),&outer));
    assert_eq!(result.terms(0).unwrap().get(&vec![]),Some(&1.into()));
    assert_eq!(result.terms(0).unwrap().get(&vec![(SymbolId(7),1)]),Some(&(-1).into()));
    assert_eq!(result.remainder(0),Some(&outer.remainder()[0]));
    assert_eq!(result.enclose_on(&[d(0,0,0)],&mut g(),&mut a()).unwrap().bounds(),&[d(1,1,0)]);
    let y=Expr::anonymous_symbol(SymbolId(30));
    let square=ExpressionProgram::compile(&[y.clone()*y],&[SymbolId(30)],&mut g()).unwrap();
    let next=result.transform(square,&mut g(),&mut a()).unwrap();
    assert_eq!(next.stage_count(),2);
    assert_eq!(next.enclose_on(&[d(0,0,0)],&mut g(),&mut a()).unwrap().bounds(),&[d(1,1,0)]);
}
