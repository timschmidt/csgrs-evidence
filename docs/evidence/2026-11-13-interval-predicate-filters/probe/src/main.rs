use hyperinterval::{DyadicBudget, DyadicInterval, IntervalError, SignSet};
use hyperlimit::{Point2, PredicatePolicy, Sign};
use hyperreal::Real;
#[cfg(not(feature="trace"))]
use std::{hint::black_box, time::Instant};

type Case = [Point2; 3];
const NAMES: [&str; 9] = ["integer", "thirds", "rational-near", "algebraic-axis", "algebraic-cancellation", "transcendental-separated", "transcendental-translated", "transcendental-near", "transcendental-collinear"];
fn point(x:Real,y:Real)->Point2 {Point2::new(x,y)}
fn rational(a:i32,b:i32)->Real {(Real::from(a)/Real::from(b)).unwrap()}
fn epsilon()->Real {(0..100).fold(Real::one(),|x,_| (x/Real::from(2)).unwrap())}
fn fixture(i:usize)->(Case,Sign) {
    let origin=point(0.into(),0.into());
    match i {
        0=>([origin,point(1.into(),0.into()),point(0.into(),1.into())],Sign::Positive),
        1=>([origin,point(rational(1,3),0.into()),point(0.into(),rational(1,3))],Sign::Positive),
        2=>([origin,point(1.into(),1.into()),point(1.into(),Real::one()+epsilon())],Sign::Positive),
        3=>([origin,point(Real::from(2).sqrt().unwrap(),0.into()),point(0.into(),Real::from(3).sqrt().unwrap())],Sign::Positive),
        4=>{let u=Real::from(2).sqrt().unwrap();let v=Real::from(3).sqrt().unwrap();([origin,point(u.clone(),v.clone()),point(v,u)],Sign::Negative)},
        // e < 3 < pi proves e^2-pi^2 < 0 independently of this determinant.
        5=>([origin,point(Real::e(),Real::pi()),point(Real::pi(),Real::e())],Sign::Negative),
        // Translation cancels, leaving det([1,2],[3,4]) = -2.
        6=>{let u=Real::one().sin();let v=Real::from(2).cos();([point(u.clone(),v.clone()),point(&u+Real::one(),&v+Real::from(2)),point(&u+Real::from(3),&v+Real::from(4))],Sign::Negative)},
        7=>([origin,point(Real::e(),Real::pi()),point(Real::e()*Real::from(2),Real::pi()*Real::from(2)+epsilon())],Sign::Positive),
        8=>([origin,point(Real::e(),Real::pi()),point(Real::e()*Real::from(2),Real::pi()*Real::from(2))],Sign::Zero),
        _=>unreachable!(),
    }
}

// Experimental cost probe only. All set arithmetic delegates to Hyperinterval;
// production determinant ownership/admission is required before adoption.
fn enclosure(case:&Case,precision:i32,work:u64)->Result<(SignSet,u64),IntervalError> {
    let mut budget=DyadicBudget::new(4096,work);
    let mut convert=|p:&Point2|Ok::<_,IntervalError>([
        DyadicInterval::from_real(&p.x,precision,&mut budget)?,
        DyadicInterval::from_real(&p.y,precision,&mut budget)?]);
    let a=convert(&case[0])?;let b=convert(&case[1])?;let c=convert(&case[2])?;
    let abx=b[0].sub(&a[0],&mut budget)?;
    let aby=b[1].sub(&a[1],&mut budget)?;
    let acx=c[0].sub(&a[0],&mut budget)?;
    let acy=c[1].sub(&a[1],&mut budget)?;
    let det=abx.mul(&acy,&mut budget)?.sub(&aby.mul(&acx,&mut budget)?,&mut budget)?;
    Ok((det.signs(),work-budget.remaining_work()))
}
fn filter(case:&Case,precision:i32)->Option<Sign> {
    match enclosure(case,precision,10_000_000).ok()?.0 {
        SignSet::Positive=>Some(Sign::Positive),
        SignSet::Negative=>Some(Sign::Negative),
        _=>None,
    }
}
fn baseline(case:&Case,policy:PredicatePolicy)->hyperlimit::PredicateOutcome<Sign>{
    hyperlimit::orient2(&case[0],&case[1],&case[2],policy)
}
#[cfg(not(feature="trace"))]
fn run(case:&Case,policy:PredicatePolicy,method:usize)->hyperlimit::PredicateOutcome<Sign>{
    if method>0 {
        if let Some(sign)=filter(case,if method==1{-16}else{-64}) {
            return hyperlimit::PredicateOutcome::decided(sign,hyperlimit::Certainty::Filtered,hyperlimit::Escalation::Filter);
        }
    }
    baseline(case,policy)
}
fn main(){
    for (i,name) in NAMES.iter().enumerate(){
        let (case,expected)=fixture(i);
        for (p,policy) in [("strict",PredicatePolicy::STRICT),("approximate",PredicatePolicy::APPROXIMATE_512)] {
            let original=baseline(&case,policy);assert_eq!(original.clone().value(),Some(expected));
            println!("ROW|{name}|{p}|{original:?}");
            for precision in [-16,-64] {
                let bounds=enclosure(&case,precision,10_000_000);
                let filtered=filter(&case,precision);
                if let Some(sign)=filtered {assert_eq!(sign,expected);assert_ne!(sign,Sign::Zero);}
                println!("FILTER|{name}|{p}|{precision}|{bounds:?}|{filtered:?}");
            }
            #[cfg(feature="trace")]
            {
                hyperreal::dispatch_trace::reset();
                let checked=hyperreal::dispatch_trace::with_recording(||baseline(&case,policy));
                assert_eq!(checked,original);
                for event in hyperreal::dispatch_trace::take_trace().dispatch {
                    println!("TRACE|{name}|{p}|{}|{}|{}|{}",event.layer,event.operation,event.path,event.count);
                }
            }
            #[cfg(not(feature="trace"))]
            for method in 0..3 {
                for _ in 0..4 {black_box(run(&case,policy,method));}
                for mode in ["retained","rebuilt"] {
                    for repeat in 0..5 {
                        let start=Instant::now();
                        for _ in 0..32 {
                            let result=if mode=="retained" {run(black_box(&case),policy,method)} else {let (new,_) = fixture(i);run(black_box(&new),policy,method)};
                            assert_eq!(black_box(result).value(),Some(expected));
                        }
                        println!("TIME|{name}|{p}|{method}|{mode}|{repeat}|32|{}",start.elapsed().as_nanos());
                    }
                }
            }
        }
        assert!(enclosure(&case,-16,0).is_err());
        assert_eq!(baseline(&case,PredicatePolicy::STRICT).value(),Some(expected));
    }
}
