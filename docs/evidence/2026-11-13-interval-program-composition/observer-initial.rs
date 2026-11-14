mod allocations;
use hyperreal::Real;
use hypersolve::{Expr, SymbolId, expression_program::{ExpressionBudget, ExpressionProgram}};
fn budget() -> ExpressionBudget { ExpressionBudget::new(1_000_000, 100_000_000) }
fn polynomial(degree: usize) -> (Vec<Expr>, ExpressionProgram) {
    let variable = Expr::anonymous_symbol(SymbolId(0));
    let mut source = Expr::int(1);
    for _ in 0..degree { source = Expr::Add(Box::new(Expr::Mul(Box::new(source), Box::new(variable.clone()))), Box::new(Expr::int(1))); }
    let sources = vec![source];
    let program = ExpressionProgram::compile(&sources, &[SymbolId(0)], &mut budget()).unwrap();
    (sources, program)
}
fn row<T>(name: &str, run: impl FnMut() -> T) {
    let s = allocations::measure(32, run);
    println!("ALLOC|{name}|{}|{}|{}|{}|{}|{}",s.allocations,s.deallocations,s.reallocations,s.allocated_bytes,s.peak_live_bytes,s.live_bytes);
    assert_eq!(s.live_bytes, 0);
}
fn main() {
    for degree in [1,8,32,128] {
        let (sources, program) = polynomial(degree);
        let values = [Real::one()];
        let result = program.eval_real(&values, &mut budget()).unwrap();
        assert_eq!(result, vec![Real::from(degree+1)]);
        println!("ROW|legacy-{degree}|{}|{result:?}", serde_json::to_string(program.definition()).unwrap());
        row(&format!("legacy-{degree}-compile"), || ExpressionProgram::compile(&sources, &[SymbolId(0)], &mut budget()).unwrap());
        row(&format!("legacy-{degree}-replay"), || ExpressionProgram::from_definition(program.definition().clone(), &mut budget()).unwrap());
        row(&format!("legacy-{degree}-evaluate"), || { let r=program.eval_real(&values, &mut budget()).unwrap(); assert_eq!(r,vec![Real::from(degree+1)]); r });
    }
    #[cfg(feature="composition")]
    new_operations();
}
#[cfg(feature="composition")]
fn new_operations() {
    use hyperinterval::{DyadicBudget,DyadicInterval};
    use hypersolve::expression_program::{TaylorRequest,TaylorAffineModel,TaylorAffineMap,TaylorAffineRow,CompositionError,ExpressionError};
    use std::sync::Arc;
    let inner = ExpressionProgram::compile(&[Expr::anonymous_symbol(SymbolId(0)),Expr::anonymous_symbol(SymbolId(0)).powi(2)], &[SymbolId(0)], &mut budget()).unwrap();
    for degree in [1,8,32,128] {
        let (_,outer)=polynomial(degree);
        let composed=outer.compose(&inner,&[1],&mut budget()).unwrap();
        let values=composed.program().eval_real(&[Real::one()],&mut budget()).unwrap();
        assert_eq!(values,vec![Real::one(),Real::one(),Real::from(degree+1)]);
        println!("ROW|composition-{degree}|nodes={}|outputs={}|{values:?}",composed.program().definition().nodes.len(),composed.program().definition().outputs.len());
        row(&format!("composition-{degree}-build"),||outer.compose(&inner,&[1],&mut budget()).unwrap());
        row(&format!("composition-{degree}-evaluate"),||composed.program().eval_real(&[Real::one()],&mut budget()).unwrap());
        row(&format!("composition-{degree}-exhausted"),||{let r=outer.compose(&inner,&[1],&mut ExpressionBudget::new(1_000_000,4));assert!(matches!(r,Err(CompositionError::Expression(ExpressionError::WorkExhausted))));r});
    }
    let x=Expr::anonymous_symbol(SymbolId(0));let y=Expr::anonymous_symbol(SymbolId(1));
    let inner=ExpressionProgram::compile(&[x.clone(),Expr::int(1)-x.clone()],&[SymbolId(0)],&mut budget()).unwrap();
    let outer=ExpressionProgram::compile(&[x*y],&[SymbolId(0),SymbolId(1)],&mut budget()).unwrap();
    let source=outer.compose(&inner,&[0,1],&mut budget()).unwrap();
    let d=|a:i64,b:i64,e:i32|DyadicInterval::new(a.into(),b.into(),e).unwrap();
    let make=|| {
        let mut arithmetic=DyadicBudget::new(16384,1_000_000_000);
        let model=Arc::new(source.program().taylor_model(TaylorRequest{center:vec![d(1,1,-1)],domain:vec![d(0,1,0)],order:2,precision:-64},&mut budget(),&mut arithmetic).unwrap());
        let result=TaylorAffineModel::new(model,TaylorAffineMap{input_count:3,rows:vec![TaylorAffineRow{coefficients:vec![Real::zero(),Real::zero(),Real::one()],offset:Real::zero()}]},&mut budget(),&mut arithmetic).unwrap();
        assert_eq!(result.range().bounds(),&[d(0,1,-2)]);result
    };
    println!("ROW|logistic-projection|{:?}",make().range().bounds());
    row("logistic-projection-build",make);
}
