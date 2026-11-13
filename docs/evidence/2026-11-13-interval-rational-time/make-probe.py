from pathlib import Path
import shutil
s=Path(__file__).parent
p=s/'rational-clock-cost-project'
shutil.copytree(s/'evolution-cost-project',p,dirs_exist_ok=True)
m=(p/'Cargo.toml').read_text().replace('name = "dyadic-evolution-cost-probe"','name = "rational-clock-cost-probe"')
m+='hyperreal = { path = "/mnt/development/csgrs-field-core/crates/hyperreal" }\n'
(p/'Cargo.toml').write_text(m)
old=(p/'src/main.rs').read_text();prefix=old[:old.index('use hyperdynamics::field::evolution::*;')]
source=old[old.index('fn source<const'):old.index('fn run<const')]
new=r'''
use hyperdynamics::field::{clock::*, evolution::*};
use hyperinterval::{DyadicBudget,IntervalError};
use hyperreal::Rational;
fn q(a:i64,b:u64)->Rational {Rational::fraction(a,b).unwrap()}
fn cap()->EvolutionOptions {EvolutionOptions { maximum_step:Some(DyadicInterval::point(1.into(),-2).unwrap()), ..Default::default() }}
fn run<const N:usize>(name:&str,outputs:&[Expr],a:Rational,z:Rational,initial:BoxN<DyadicInterval,N>,control:Option<[Rational;N]>) {
 let original=ExpressionField::<N>::from_definition(source::<N>(outputs),&mut budget()).unwrap();
 let mut build=budget();let field=original.on_time_span(a.clone(),z.clone(),&mut build).unwrap();
 let mut work=budget();let report=field.integrate(initial.clone(),cap(),&mut work);
 assert!(report.end_enclosure().is_some(),"{name} {:?}",report.status());assert_eq!(report.reached_time(),&z);
 let expected=report.end_enclosure().unwrap().clone();
 if let Some(control)=control {for (actual,expected) in expected.lanes().unwrap().iter().zip(control) {assert!(actual.to_rational(&mut DyadicBudget::new(16384,u64::MAX)).unwrap().contains_point(&expected),"{name}");}}
 let gw=work.policy().graph_work-work.remaining_graph_work();let sw=work.policy().scalar_work-work.remaining_scalar_work();
 println!("RESOURCE {name} graph={gw} scalar={sw} attempts={} segments={} build_graph={} build_scalar={}",report.normalized().attempts().len(),report.segments().len(),build.policy().graph_work-build.remaining_graph_work(),build.policy().scalar_work-build.remaining_scalar_work());
 timed(name,"integrate",||{let r=field.integrate(black_box(&initial).clone(),cap(),&mut budget());assert_eq!(r.end_enclosure(),Some(&expected));assert_eq!(r.reached_time(),&z);r});
 let encoded=serde_json::to_string(&(&field,&initial,cap())).unwrap();
 timed(name,"replay",||{let (definition,initial,options):(RationalTimeDefinition,BoxN<DyadicInterval,N>,EvolutionOptions)=serde_json::from_str(black_box(&encoded)).unwrap();let mut work=budget();let f=RationalTimeField::<N>::from_definition(definition,&mut work).unwrap();let r=f.integrate(initial,options,&mut work);assert_eq!(r.end_enclosure(),Some(&expected));assert_eq!(r.reached_time(),&z);r});
 for (label,policy) in [("graph-zero",EnclosurePolicy{graph_work:0,..EnclosurePolicy::default()}),("graph-short",EnclosurePolicy{graph_work:gw-1,..EnclosurePolicy::default()}),("scalar-zero",EnclosurePolicy{scalar_work:0,..EnclosurePolicy::default()}),("scalar-short",EnclosurePolicy{scalar_work:sw-1,..EnclosurePolicy::default()})] {
  print_row(name,label,32,measure(32,||{let r=field.integrate(initial.clone(),cap(),&mut EnclosureBudget::new(policy));assert!(matches!(r.status(),ClockStatus::Stopped(_)),"{name}/{label}");assert!(r.end_enclosure().is_none());r}));
 }
 assert_eq!(field.integrate(initial,cap(),&mut budget()).end_enclosure(),Some(&expected));
}
fn main() {
 println!("| Case | Operation | allocations/op | frees/op | bytes/op | reallocations/op | peak bytes | live bytes |\n|---|---|---|---|---|---|---|---|");
 let x=Expr::anonymous_symbol(SymbolId(0));let t=Expr::anonymous_symbol(SymbolId(100));
 run("constant",&[Expr::int(2)],q(1,3),q(2,3),BoxN::new([d(0,1)]).unwrap(),Some([q(2,3)]));
 run("time-affine",&[Expr::int(2)*t+Expr::int(3)],q(-2,3),q(-1,5),BoxN::new([d(0,0)]).unwrap(),Some([q(224,225)]));
 run("riccati",&[x.clone().powi(2)],q(1,3),q(1,2),BoxN::new([d(1,1)]).unwrap(),Some([q(6,5)]));
 run("zero",&[Expr::int(0)],q(1,3),q(2,3),BoxN::new([d(1,1)]).unwrap(),Some([q(1,1)]));
 run("unit",&[],q(1,3),q(2,3),BoxN::new([]).unwrap(),Some([]));
 run::<1>("empty",&[x.clone()],q(1,3),q(2,3),BoxN::empty().unwrap(),None);
 run("identity",&[x],q(1,3),q(1,3),BoxN::new([d(1,2)]).unwrap(),Some([q(1,1)]));
 let power=|n|(0..n).fold(Rational::one(),|a,_|a*Rational::from(2));
 let tiny=Rational::one()/(Rational::from(3)*power(300));
 run("close",&[Expr::int(1)],Rational::one(),Rational::one()+&tiny,BoxN::new([d(0,0)]).unwrap(),Some([tiny]));
 let a=power(512)+q(1,3);
 run("large",&[Expr::int(1)],a.clone(),a+q(2,3),BoxN::new([d(0,0)]).unwrap(),Some([q(2,3)]));
 for bits in [128,4096,131072] {
  let x=power(bits)+Rational::one();let y=q(1,3);
  for operation in ["compare","add","sub","mul"] {
   let stats=measure(64,||{let mut b=DyadicBudget::new(64,1000);let r=match operation {"compare"=>b.rational().compare(&x,&y).map(|_|()),"add"=>b.rational().add(&x,&y).map(|_|()),"sub"=>b.rational().sub(&x,&x).map(|_|()),_=>b.rational().mul(&x,&y).map(|_|())};assert_eq!(r,Err(IntervalError::SizeExhausted));});
   assert_eq!(stats.allocations,0);assert_eq!(stats.allocated_bytes,0);assert_eq!(stats.peak_live_bytes,0);print_row(&format!("reject-{bits}"),operation,64,stats);
  }
 }
}
'''
(p/'src/main.rs').write_text(prefix+source+new)
