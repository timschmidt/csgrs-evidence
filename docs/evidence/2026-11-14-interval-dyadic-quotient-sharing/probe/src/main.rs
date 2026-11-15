use hyperinterval::{DomainCoverage,DyadicBudget,DyadicInterval,RangeEnclosure,ExtendedInterval};
use hyperreal::Rational;
use num_bigint::BigInt;
use std::{hint::black_box,time::Instant};
#[path="/mnt/development/csgrs-dyadic-quotient-sharing/crates/hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn d(a:i64,b:i64,e:i32)->DyadicInterval {DyadicInterval::new(a.into(),b.into(),e).unwrap()}
fn image<T>(value:RangeEnclosure<T>)->(T,u8) {(value.range,match value.domain {DomainCoverage::Complete=>0,DomainCoverage::Partial=>1})}
fn probe<T:serde::Serialize>(sample:&str,name:&str,iterations:usize,operation:impl Fn(&mut DyadicBudget)->T) {
    let work=|| {let mut budget=DyadicBudget::new(32768,10_000_000_000_000);let value=operation(&mut budget);(value,budget.remaining_work())};
    let ((value,remaining),count,bytes)=allocations::measure(&work);
    let canonical=serde_json::to_string(&value).unwrap();
    for _ in 0..32 {black_box(work());}
    let start=Instant::now();
    for _ in 0..iterations {black_box(work());}
    println!("{sample}\t{name}\t{}\t{iterations}\t{remaining}\t{count}\t{bytes}\t{canonical}",start.elapsed().as_nanos());
}
fn main() {
    let sample=std::env::args().nth(1).unwrap_or_else(||"0".into());
    for (name,a,b) in [("positive",d(1,3,-3),d(3,7,2)),("negative",d(-7,-3,-2),d(-9,-5,1)),("mixed",d(-3,7,3),d(-9,-5,-2)),("exact",d(8,16,0),d(2,4,0))] {
        probe(&sample,name,8192,|budget|black_box(&a).div(black_box(&b),-64,budget).unwrap());
    }
    let large=BigInt::from(1)<<1024usize;
    let a=DyadicInterval::new(&large+3,&large+17,-512).unwrap();
    let b=DyadicInterval::new(&large+5,&large+19,-512).unwrap();
    probe(&sample,"wide",2048,|budget|a.div(&b,-256,budget).unwrap());
    let a=d(2,3,0);
    probe(&sample,"sqrt",1024,|budget|image(a.sqrt(-256,budget).unwrap()));
    let rational=Rational::fraction(-7,13).unwrap();
    probe(&sample,"rational",8192,|budget|DyadicInterval::from_rational(&rational,-64,budget).unwrap());
    let small=d(1,3,-3);
    probe(&sample,"exp",32,|budget|image(small.exp(-64,budget).unwrap()));
    probe(&sample,"log",32,|budget|image(a.log(-64,budget).unwrap()));
    probe(&sample,"atan",32,|budget|image(small.atan(-64,budget).unwrap()));
    probe(&sample,"sin",32,|budget|image(small.sin(-64,budget).unwrap()));
    probe(&sample,"cos",32,|budget|image(small.cos(-64,budget).unwrap()));
    probe(&sample,"tan",16,|budget|image(small.tan(-64,budget).unwrap()));
    let n=BigInt::from(1);let q=BigInt::from(3);
    probe(&sample,"power",16,|budget|image(a.pow_rational(&n,&q,-64,budget).unwrap()));
    let a=ExtendedInterval::from_finite(d(1,3,0));let b=ExtendedInterval::from_finite(d(-3,5,0));
    probe(&sample,"split",1024,|budget|image(a.div(&b,-64,budget).unwrap()));
}
