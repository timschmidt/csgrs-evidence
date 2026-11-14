use alumina_foc::{FocError, Q30, Q30Interval as Q};
use interval_foc_conformance::samples::{sample, native, ACTIONS};
fn main() {
    println!("LAYOUT {} {} {}", size_of::<Q>(), align_of::<Q>(), size_of::<FocError>());
    let points = [i32::MIN, i32::MIN+1, -(1<<30)-1, -(1<<30), -2, -1, 0, 1, 2, (1<<30)-1, 1<<30, i32::MAX-1, i32::MAX];
    let mut ranges=Vec::new();
    for a in points {for b in points {
        let result=Q::new(Q30::from_bits(a),Q30::from_bits(b));
        println!("NEW {a} {b} {result:?}");
        if let Ok(q)=result {ranges.push(q);}
    }}
    for (i,x) in ranges.iter().copied().enumerate() {
        println!("SINGLE {i} {:?} {} {:?} {:?} {:?}", x.midpoint(),x.width_ulps(),x.checked_neg(),x.checked_square(),points.map(|p|x.contains(Q30::from_bits(p))));
        for (j,y) in ranges.iter().copied().enumerate() {
            println!("PAIR {i} {j} {:?} {:?} {:?} {:?}",x.checked_add(y),x.checked_sub(y),x.checked_mul(y),x.checked_div(y));
        }
    }
    let ratios=[i64::MIN,i64::MIN+1,-(1<<32),-3,-1,0,1,3,1<<32,i64::MAX-1,i64::MAX];
    for n in ratios {for d in ratios {println!("RATIO {n} {d} {:?}",Q::from_ratio(n,d));}}
    for seed in 0..165 {for action in ACTIONS {println!("TRANSFORM {seed} {action:?} {:?}",native(action,sample(seed)));}}
}
