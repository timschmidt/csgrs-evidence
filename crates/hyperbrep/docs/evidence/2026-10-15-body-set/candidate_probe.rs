use hyperbrep::{boolean, builder, ArchiveLimits, BodySet, Matrix4, Point3, RawModel, Real};
use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use std::time::Instant;
struct Allocator;
static ACTIVE: AtomicBool = AtomicBool::new(false);
static CALLS: AtomicUsize = AtomicUsize::new(0);
static BYTES: AtomicUsize = AtomicUsize::new(0);
fn record(n: usize) { if ACTIVE.load(Ordering::Relaxed) { CALLS.fetch_add(1, Ordering::Relaxed); BYTES.fetch_add(n, Ordering::Relaxed); } }
// SAFETY: all allocation operations are forwarded unchanged to System.
unsafe impl GlobalAlloc for Allocator {
    unsafe fn alloc(&self, l: Layout) -> *mut u8 { record(l.size()); unsafe { System.alloc(l) } }
    unsafe fn alloc_zeroed(&self, l: Layout) -> *mut u8 { record(l.size()); unsafe { System.alloc_zeroed(l) } }
    unsafe fn realloc(&self, p: *mut u8, l: Layout, n: usize) -> *mut u8 { record(n); unsafe { System.realloc(p, l, n) } }
    unsafe fn dealloc(&self, p: *mut u8, l: Layout) { unsafe { System.dealloc(p, l) } }
}
#[global_allocator] static ALLOCATOR: Allocator = Allocator;
fn point(x: i32, y: i32, z: i32) -> Point3 { Point3::new(x.into(), y.into(), z.into()) }
fn apply(a: &BodySet, b: &BodySet, op: usize) -> BodySet {
    match op { 0 => boolean::union(a, b), 1 => boolean::intersection(a, b), _ => boolean::difference(a, b) }.unwrap()
}
fn volume(result: &BodySet) -> Real { result.bodies().fold(Real::zero(), |v, s| v + s.volume().unwrap()) }
fn digest(bytes: &[u8]) -> u64 { bytes.iter().fold(0xcbf29ce484222325, |h,b| (h ^ u64::from(*b)).wrapping_mul(0x100000001b3)) }
fn verify(result: BodySet, expected: &Real) -> String {
    assert_eq!(volume(&result), *expected);
    let json = result.model().to_json().unwrap();
    let model = RawModel::from_json(&json, &ArchiveLimits::default()).unwrap().validate().unwrap();
    assert_eq!(model.to_json().unwrap(), json);
    assert_eq!(model.solids().fold(Real::zero(), |v,s| v+s.volume().unwrap()), *expected);
    json
}
fn main() {
    let a = builder::cuboid(point(0,0,0), point(4,4,2)).unwrap();
    let overlap = builder::cuboid(point(2,1,0), point(6,3,2)).unwrap();
    let disjoint = builder::cuboid(point(8,0,0), point(9,1,2)).unwrap();
    let hole = builder::cuboid(point(1,1,0), point(3,3,2)).unwrap();
    let sphere = builder::sphere(Real::one()).unwrap();
    let other_sphere = sphere.transformed(&Matrix4::affine_translation([4.into(),0.into(),0.into()])).unwrap();
    let cylinder = builder::cylinder(Real::one(), Real::from(6)).unwrap();
    let cutter = builder::cylinder(Real::one(), Real::from(2)).unwrap().transformed(&Matrix4::affine_translation([0.into(),0.into(),2.into()])).unwrap();
    for (label, a, b, op, expected) in [
        ("box_union", &a, &disjoint, 0, Real::from(34)),
        ("box_intersection", &a, &overlap, 1, Real::from(8)),
        ("complete_subtraction", &a, &a, 2, Real::zero()),
        ("through_hole", &a, &hole, 2, Real::from(24)),
        ("sphere_union", &sphere, &other_sphere, 0, (Real::from(8)*Real::pi()/Real::from(3)).unwrap()),
        ("cylinder_split", &cylinder, &cutter, 2, Real::from(4)*Real::pi()),
    ] {
        let expected_json = verify(apply(a,b,op), &expected);
        for sample in 0..5 {
            CALLS.store(0, Ordering::Relaxed); BYTES.store(0, Ordering::Relaxed);
            ACTIVE.store(true, Ordering::Relaxed);
            let start = Instant::now();
            for _ in 0..20 {
                let json = verify(apply(black_box(a),black_box(b),op), &expected);
                assert_eq!(json,expected_json); black_box(json);
            }
            let ns = start.elapsed().as_nanos();
            ACTIVE.store(false, Ordering::Relaxed);
            println!("{{\"label\":\"{label}\",\"sample\":{sample},\"iterations\":20,\"ns\":{ns},\"allocation_calls\":{},\"requested_bytes\":{},\"archive_bytes\":{},\"archive_fnv1a64\":\"{:016x}\",\"completion\":\"certified\"}}", CALLS.load(Ordering::Relaxed),BYTES.load(Ordering::Relaxed),expected_json.len(),digest(expected_json.as_bytes()));
        }
    }
}
