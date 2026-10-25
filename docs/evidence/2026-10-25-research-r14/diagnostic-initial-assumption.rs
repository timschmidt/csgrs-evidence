use super::*;
use std::sync::atomic::{AtomicUsize, Ordering};
pub(super) static PREPARATIONS: AtomicUsize = AtomicUsize::new(0);
pub(super) static POINT_SIGNS: AtomicUsize = AtomicUsize::new(0);
pub(super) static HORNER: AtomicUsize = AtomicUsize::new(0);
pub(super) static BERNSTEIN: AtomicUsize = AtomicUsize::new(0);

fn rational(text: &str) -> Real {
    let (numerator, denominator) = text.split_once('/').unwrap_or((text, "1"));
    (numerator.parse::<Real>().unwrap() / denominator.parse::<Real>().unwrap()).unwrap()
}

#[test]
fn captured_leaf_preparation_counts() {
    let directory = std::env::var("R14_LEAF_DIRECTORY").unwrap();
    let leaves = std::env::var("R14_LEAVES").unwrap_or_else(|_| "leaf_0000.txt,leaf_0004.txt".into());
    for name in leaves.split(',') {
        let text = std::fs::read_to_string(std::path::Path::new(&directory).join(name)).unwrap();
        let lines = text.lines().collect::<Vec<_>>();
        let filter_start = lines.iter().position(|line| *line == "filter").unwrap();
        let defining_start = lines.iter().position(|line| *line == "defining").unwrap();
        let filter = lines[filter_start + 1..defining_start].iter().map(|line| rational(line)).collect::<Vec<_>>();
        let defining = lines[defining_start + 1..].iter().filter(|line| !line.is_empty()).map(|line| rational(line)).collect::<Vec<_>>();
        let endpoints = lines.iter().find_map(|line| line.strip_prefix("interval ")).unwrap().split_whitespace().map(rational).collect::<Vec<_>>();
        let interval = BezierParameterInterval { start: endpoints[0].clone(), end: endpoints[1].clone() };
        for counter in [&PREPARATIONS, &POINT_SIGNS, &HORNER, &BERNSTEIN] { counter.store(0, Ordering::Relaxed); }
        let start = std::time::Instant::now();
        let decision = coprime_filter_sign_by_bisection(&filter, &defining, &interval, &CurveContext::STRICT).unwrap();
        let elapsed = start.elapsed();
        println!("R14_BASELINE leaf={name} decision={decision:?} elapsed_ns={} preparations={} point_signs={} horner={} bernstein={}", elapsed.as_nanos(), PREPARATIONS.load(Ordering::Relaxed), POINT_SIGNS.load(Ordering::Relaxed), HORNER.load(Ordering::Relaxed), BERNSTEIN.load(Ordering::Relaxed));
        assert_eq!(decision, Some(RealSign::Positive));
    }
}
