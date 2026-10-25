use hypercircuit::{BoardOutline, Real};
use hypercurve::evaluate_under;
use hyperlattice::Point2;
use hyperlimit::PredicatePolicy;

fn p(x: i64, y: i64) -> Point2 { Point2::new(x.into(), y.into()) }

fn main() {
    let board = BoardOutline::rectangle(10.into(), 10.into()).unwrap()
        .boundary_geometry(PredicatePolicy::STRICT).unwrap();
    let z = (Real::e() + Real::one()).sin()
        - Real::e().sin() * Real::one().cos()
        - Real::e().cos() * Real::one().sin();
    let boundary = Point2::new(z.clone(), 5.into());
    for policy in [PredicatePolicy::STRICT, PredicatePolicy::APPROXIMATE_512, PredicatePolicy::STRICT] {
        let classify = evaluate_under(policy, || board.classify_point(&boundary, policy));
        println!("classify {policy:?}: {classify:?}");
        let disc = evaluate_under(policy, || board.contains_disc(&boundary, 0.into(), policy));
        println!("disc {policy:?}: {disc:?}");
        let segment = evaluate_under(policy, || board.contains_segment(&boundary, &p(5,5), 0.into(), policy));
        println!("segment {policy:?}: {segment:?}");
        let bx = evaluate_under(policy, || board.contains_axis_aligned_box(&Point2::new(z.clone(), 3.into()), &p(7,7), policy));
        println!("box {policy:?}: {bx:?}");
        let inset = evaluate_under(policy, || board.inset(z.clone(), policy));
        println!("inset {policy:?}: {inset:?}");
        let exact = evaluate_under(policy, || (
            board.classify_point(&p(5,5), policy),
            board.contains_disc(&p(5,5), 1.into(), policy),
            board.contains_segment(&p(4,5), &p(6,5), 1.into(), policy),
            board.contains_axis_aligned_box(&p(3,3), &p(7,7), policy),
            board.inset(1.into(), policy),
        ));
        println!("exact controls {policy:?}: {exact:?}");
    }
}
