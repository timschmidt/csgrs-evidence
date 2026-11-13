from pathlib import Path
out=Path(__file__).parent/'cost-project';(out/'src').mkdir(parents=True,exist_ok=True)
base=Path('/tmp/interval-refactor/owned-expression-program/cost-project/src/main.rs').read_text();head=base[:base.index('fn budget()')]
head=head.replace('use hyperreal::Real;', 'use hyperreal::Real;\nuse hyperinterval::{DyadicBudget,DyadicInterval};\nuse std::time::Instant;')
body=r'''
fn budget()->ExpressionBudget { ExpressionBudget::new(1_000_000,100_000_000) }
fn timed<T>(name:&str,op:&str,mut f:impl FnMut()->T) {
 print_row(name,op,32,measure(32,&mut f));
 let mut samples=Vec::new();
 for _ in 0..31 { let t=Instant::now();for _ in 0..8 {drop(black_box(f()));}samples.push(t.elapsed().as_nanos() as f64/8.0); }
 println!("TIMING {name}/{op} ns_per_operation={samples:?}");
}
fn main(){
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=SymbolId(0);
 for degree in [1_i64,8,32,128] {
  let mut source=Expr::int(1);
  for _ in 0..degree { source=Expr::Add(Box::new(Expr::Mul(Box::new(source),Box::new(Expr::anonymous_symbol(x)))),Box::new(Expr::int(1))); }
  let source=ExpressionProgram::compile(&[source],&[x],&mut budget()).unwrap();
  let mut work=budget();let jacobian=source.jacobian(&[x],&mut work).unwrap();
  let expected=[Real::from(degree+1),Real::from(degree*(degree+1)/2)];
  let input=[Real::one()];let intervals=[DyadicInterval::point(1.into(),0).unwrap()];
  let expected_intervals=[DyadicInterval::point((degree+1).into(),0).unwrap(),DyadicInterval::point((degree*(degree+1)/2).into(),0).unwrap()];
  let name=format!("degree_{degree}");
  println!("RESOURCE {name} source_nodes={} generated_nodes={} graph_work={}",source.definition().nodes.len(),jacobian.program().definition().nodes.len(),100_000_000-work.remaining_work());
  timed(&name,"differentiate",||{source.jacobian(black_box(&[x]),&mut budget()).unwrap()});
  timed(&name,"replay",||{
   let replay=ExpressionProgram::from_definition(black_box(source.definition()).clone(),&mut budget()).unwrap();
   replay.jacobian(&[x],&mut budget()).unwrap()
  });
  timed(&name,"evaluate-real",||{
   let result=jacobian.program().eval_real(black_box(&input),&mut budget()).unwrap();assert_eq!(result,expected);result
  });
  timed(&name,"evaluate-interval",||{
   let result=jacobian.program().eval_dyadic(black_box(&intervals),-32,&mut budget(),&mut DyadicBudget::new(16_384,1_000_000_000_000)).unwrap();assert_eq!(result,expected_intervals);result
  });
  for work in [0,1,16] {print_row(&name,&format!("exhaust-{work}"),32,measure(32,||{
   let result=source.jacobian(&[x],&mut ExpressionBudget::new(1_000_000,work));assert!(result.is_err());result
  }));}
  assert_eq!(source.jacobian(&[x],&mut budget()).unwrap().program().eval_real(&input,&mut budget()).unwrap(),expected);
 }
}
'''
(out/'src/main.rs').write_text(head+body)
(out/'Cargo.toml').write_text('''[package]
name = "program-jacobian-cost-probe"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
hypersolve = { path = "/mnt/development/csgrs/crates/hypersolve", features = ["interval-program"] }
hyperinterval = { path = "/mnt/development/csgrs/crates/hyperinterval", features = ["hyperreal"] }
hyperreal = { path = "/mnt/development/csgrs/crates/hyperreal", default-features = false }
''')
