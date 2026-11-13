from pathlib import Path
out=Path(__file__).parent/'cost-project';(out/'src').mkdir(parents=True,exist_ok=True)
base=Path('/tmp/interval-refactor/owned-expression-program/cost-project/src/main.rs').read_text()
head=base[:base.index('fn budget()')]
head=head.replace('use hyperreal::Real;', 'use hyperinterval::{DyadicBudget, DyadicInterval};\nuse std::time::Instant;')
body=r'''
fn graph() -> ExpressionBudget { ExpressionBudget::new(100_000, 1_000_000) }
fn arithmetic() -> DyadicBudget { DyadicBudget::new(16_384, 1_000_000_000_000) }
fn main() {
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));
 let mut cases=vec![
  ("constant".to_owned(),Expr::int(7)), ("variable".to_owned(),x.clone()),
  ("add".to_owned(),x.clone()+Expr::int(2)), ("sub".to_owned(),x.clone()-Expr::int(2)),
  ("mul".to_owned(),x.clone()*Expr::int(2)), ("div".to_owned(),x.clone()/Expr::int(2)),
  ("neg".to_owned(),-x.clone()), ("pow".to_owned(),x.clone().powi(3)),
  ("sqrt".to_owned(),x.clone().sqrt()), ("sin".to_owned(),x.clone().sin()),
  ("cos".to_owned(),x.clone().cos()), ("ln".to_owned(),x.clone().ln()),
  ("log10".to_owned(),x.clone().log10()), ("asin".to_owned(),x.clone().asin()),
  ("acos".to_owned(),x.clone().acos()), ("acosh".to_owned(),(x.clone()+Expr::int(1)).acosh()),
  ("atanh".to_owned(),x.clone().atanh()),
 ];
 for degree in [1,8,32,128] {
  let mut source=Expr::int(1);
  for _ in 0..degree { source=Expr::Add(Box::new(Expr::Mul(Box::new(source),Box::new(x.clone()))),Box::new(Expr::int(1))); }
  cases.push((format!("degree_{degree}"),source));
 }
 let input=[DyadicInterval::new(1.into(),2.into(),-2).unwrap()];
 for (label,source) in cases {
  let program=ExpressionProgram::compile(&[source],&[SymbolId(0)],&mut graph()).unwrap();
  for precision in [-16,-64] {
   let name=format!("{label}/p{precision}");
   let mut gb=graph();let mut db=arithmetic();
   let expected=program.eval_dyadic(&input,precision,&mut gb,&mut db).unwrap();
   assert_eq!(expected.len(),1); assert!(!expected[0].is_empty());
   println!("RESOURCE {name} graph={} arithmetic={} output={expected:?}",1_000_000-gb.remaining_work(),1_000_000_000_000-db.remaining_work());
   print_row(&name,"evaluate",32,measure(32,||{
    let output=program.eval_dyadic(black_box(&input),precision,&mut graph(),&mut arithmetic()).unwrap();
    assert_eq!(output,expected); output
   }));
   let mut samples=Vec::new();
   for _ in 0..31 {
    let start=Instant::now();
    for _ in 0..8 {
     let output=program.eval_dyadic(black_box(&input),precision,&mut graph(),&mut arithmetic()).unwrap();
     assert_eq!(output,expected); drop(black_box(output));
    }
    samples.push(start.elapsed().as_nanos() as f64/8.0);
   }
   println!("TIMING {name} ns_per_operation={samples:?}");
   for work in [0,1] {
    print_row(&name,&format!("arithmetic-exhaust-{work}"),32,measure(32,||{
     let result=program.eval_dyadic(&input,precision,&mut graph(),&mut DyadicBudget::new(16_384,work));
     assert!(result.is_err()); result
    }));
   }
   assert_eq!(program.eval_dyadic(&input,precision,&mut graph(),&mut arithmetic()).unwrap(),expected);
  }
 }
}
'''
(out/'src/main.rs').write_text(head+body)
(out/'Cargo.toml').write_text('''[package]
name = "interval-expression-cost-probe"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
hypersolve = { path = "/mnt/development/csgrs/crates/hypersolve", features = ["interval-program"] }
hyperinterval = { path = "/mnt/development/csgrs/crates/hyperinterval", features = ["hyperreal"] }
''')
