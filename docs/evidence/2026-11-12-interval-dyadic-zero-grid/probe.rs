use hyperinterval::{DyadicBudget, DyadicInterval as D};
use std::{hint::black_box, time::Instant};
#[path = "/mnt/development/csgrs/crates/hyperlattice-interval/conformance/allocations.rs"]
mod allocations;
fn main() {
    let extreme = std::env::args().any(|s| s == "extreme");
    let exponents = if extreme { vec![i32::MIN, i32::MAX] } else { vec![-17, -1, 0, 1, 17] };
    println!("kind,exponent,case,operation,sample,ns,allocations,bytes,work,result");
    for e in exponents {
        for (case, a, b) in [
            ("nonzero",D::new((-3).into(),7.into(),e).unwrap(),D::new(1.into(),5.into(),0).unwrap()),
            ("zero_right",D::new((-3).into(),7.into(),e).unwrap(),D::point(0.into(),0).unwrap()),
            ("zero_left",D::point(0.into(),0).unwrap(),D::new((-3).into(),7.into(),e).unwrap()),
        ] {
            if extreme && case == "nonzero" { continue; }
            for op in 0..4 {
                let run=|| {
                    let mut budget=DyadicBudget::new(512,1_000_000);
                    let x=black_box(&a); let y=black_box(&b);
                    let output=match op {
                        0=>x.add(y,&mut budget),1=>x.sub(y,&mut budget),
                        2=>x.hull(y,&mut budget),_=>x.intersection(y,&mut budget),
                    }.unwrap();
                    (output,1_000_000-budget.remaining_work())
                };
                let ((result,work),allocs,bytes)=allocations::measure(run);
                println!("result,{e},{case},{op},0,0,{allocs},{bytes},{work},{}",serde_json::to_string(&result).unwrap());
                for _ in 0..64 { black_box(run()); }
                for sample in 0..30 {
                    let start=Instant::now();
                    for _ in 0..4096 { black_box(run()); }
                    println!("sample,{e},{case},{op},{sample},{},0,0,{work},",start.elapsed().as_nanos());
                }
            }
        }
    }
}
