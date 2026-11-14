mod allocations;
use hyperdynamics::field::{EnclosedVectorField,EnclosureBudget,EnclosurePolicy,ExpressionField,FieldDefinition,coordinates::CoordinateField,evolution::{EvolutionOptions,EvolutionRequest,EvolutionReport,EvolutionStatus}};
#[cfg(feature="candidate")]
use hyperdynamics::field::coordinates::{CoordinateEvolution,CoordinateEvolutionStatus};
use hyperinterval::DyadicInterval;
use hyperlattice_interval::BoxN;
use hypersolve::{Expr,SymbolId,expression_program::{ExpressionBudget,ExpressionProgram,CoordinateChange}};
use std::{hint::black_box,time::Instant};
type B = BoxN<DyadicInterval,2>;
fn d(a:i64,b:i64)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),0).unwrap()}
fn budget()->EnclosureBudget {EnclosureBudget::new(EnclosurePolicy::default())}
fn chart()->CoordinateField<2> {
    let [x,y,t]=[SymbolId(0),SymbolId(1),SymbolId(9)];
    let source=ExpressionProgram::compile(&[Expr::int(2),Expr::int(1)],&[y,x,t],&mut ExpressionBudget::new(1_000_000,100_000_000)).unwrap();
    let field=ExpressionField::from_definition(FieldDefinition {source:source.definition().clone(),time:t,state:vec![x,y]},&mut budget()).unwrap();
    field.in_coordinates(CoordinateChange {variables:vec![x,y],to_source:vec![vec![1.into(),1.into()],vec![0.into(),1.into()]],from_source:vec![vec![1.into(),(-1).into()],vec![0.into(),1.into()]],origin:vec![10.into(),(-3).into()]},&mut budget()).unwrap()
}
enum Output {
    Native(EvolutionReport<2>),
    Manual { chart:CoordinateField<2>, native:EvolutionReport<2>, initial:B, segments:Vec<(B,B)> },
    #[cfg(feature="candidate")]
    Owned(CoordinateEvolution<2>),
}
impl Output {
    fn row(&self)->String {
        match self {
            Self::Native(n)=>format!("{n:?}"),
            Self::Manual{chart,native,initial,segments}=>format!("{:?}|{native:?}|{initial:?}|{segments:?}",chart.original_field().identity()),
            #[cfg(feature="candidate")]
            Self::Owned(r)=>format!("{:?}|{:?}|{:?}|{:?}",r.chart().original_field().identity(),r.native(),r.source_initial_enclosure().unwrap(),r.segments().map(|s|(s.source_tube(),s.source_end_enclosure())).collect::<Vec<_>>()),
        }
    }
}
fn run(chart:&CoordinateField<2>,n:i64,mode:&str)->Output {
    let req=EvolutionRequest{start:d(0,0),end:d(n,n),initial:BoxN::new([d(0,0),d(-1,1)]).unwrap()};
    let opts=EvolutionOptions{maximum_step:Some(d(1,1)),..EvolutionOptions::default()};
    let mut budget=budget();
    #[cfg(feature="candidate")]
    if mode=="owned" {
        let result=chart.integrate(req,opts,&mut budget);
        assert!(matches!(result.status(),CoordinateEvolutionStatus::Completed));
        assert_eq!(result.segments().len(),n as usize);
        assert_eq!(result.source_end_enclosure().unwrap().lanes(),Some(&[d(9+2*n,11+2*n),d(-4+n,-2+n)]));
        return Output::Owned(result);
    }
    let native=chart.transformed_field().integrate(req,opts,&mut budget);
    assert!(matches!(native.status(),EvolutionStatus::Completed));
    if mode=="native" {return Output::Native(native)}
    let initial=chart.source_enclosure(&native.request().initial,&mut budget).unwrap();
    let segments:Vec<_>=native.segments().map(|s|(chart.source_enclosure(s.tube().unwrap(),&mut budget).unwrap(),chart.source_enclosure(s.end_enclosure().unwrap(),&mut budget).unwrap())).collect();
    assert_eq!(segments.last().unwrap().1.lanes(),Some(&[d(9+2*n,11+2*n),d(-4+n,-2+n)]));
    Output::Manual{chart:chart.clone(),native,initial,segments}
}
fn main() {
    let args:Vec<_>=std::env::args().collect();
    let mode=args.get(1).map(String::as_str).unwrap_or("native");
    let n:i64=args.get(2).map(|s|s.parse().unwrap()).unwrap_or(3);
    let action=args.get(3).map(String::as_str).unwrap_or("row");
    let chart=chart();
    if action=="row" {println!("{}",run(&chart,n,mode).row());return;}
    if action=="alloc" {
        let stats=allocations::measure(16,||run(&chart,n,mode));
        assert_eq!(stats.live_bytes,0);assert_eq!(stats.allocations,stats.deallocations);
        println!("{stats:?}");
        // Explicit reads keep every measured field part of the probe contract.
        black_box((stats.reallocations,stats.allocated_bytes,stats.peak_live_bytes));
        return;
    }
    for _ in 0..8 {drop(black_box(run(&chart,n,mode)));}
    for repeat in 0..20 {
        let now=Instant::now();
        for _ in 0..16 {drop(black_box(run(&chart,n,mode)));}
        println!("{mode}|{n}|{repeat}|16|{}",now.elapsed().as_nanos());
    }
}
