use csgrs::{GeometryContext, GeometryOutcome, Real, TriangleMesh, curve};
use hypercurve::{CircularArc2, Contour2, CurveRegion2, LineSeg2, Point2, Segment2};
use hyperlattice::Point3;
use hyperlimit::{PredicateOutcome, PredicatePolicy};
use std::alloc::{GlobalAlloc, Layout, System};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::time::Instant;
use std::io::Write;

struct CountingAllocator;
static ALLOCATED: AtomicUsize = AtomicUsize::new(0);
static LIVE: AtomicUsize = AtomicUsize::new(0);
static PEAK: AtomicUsize = AtomicUsize::new(0);
static CALLS: AtomicUsize = AtomicUsize::new(0);

fn grow(size: usize) {
    CALLS.fetch_add(1, Ordering::Relaxed);
    ALLOCATED.fetch_add(size, Ordering::Relaxed);
    let live = LIVE.fetch_add(size, Ordering::Relaxed) + size;
    PEAK.fetch_max(live, Ordering::Relaxed);
}

// SAFETY: The original pointers and layouts pass unchanged to System; the
// counters neither inspect allocations nor change their lifetime.
unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc(layout) }
    }
    unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
        grow(layout.size());
        unsafe { System.alloc_zeroed(layout) }
    }
    unsafe fn realloc(&self, ptr: *mut u8, layout: Layout, size: usize) -> *mut u8 {
        CALLS.fetch_add(1, Ordering::Relaxed);
        ALLOCATED.fetch_add(size, Ordering::Relaxed);
        if size >= layout.size() {
            let live = LIVE.fetch_add(size - layout.size(), Ordering::Relaxed) + size - layout.size();
            PEAK.fetch_max(live, Ordering::Relaxed);
        } else {
            LIVE.fetch_sub(layout.size() - size, Ordering::Relaxed);
        }
        unsafe { System.realloc(ptr, layout, size) }
    }
    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        LIVE.fetch_sub(layout.size(), Ordering::Relaxed);
        unsafe { System.dealloc(ptr, layout) }
    }
}

#[global_allocator]
static GLOBAL: CountingAllocator = CountingAllocator;





fn r(value: i64) -> Real {
    Real::from(value)
}

fn q(n: i64, d: i64) -> Real {
    (r(n) / r(d)).unwrap()
}

fn tiny() -> Real {
    (r(1) / r(2).powi(80.into()).unwrap()).unwrap()
}

fn equal(a: &Real, b: &Real) -> bool {
    matches!(
        hyperlimit::compare_reals(a, b, PredicatePolicy::STRICT),
        PredicateOutcome::Decided {
            value: std::cmp::Ordering::Equal,
            ..
        }
    )
}

fn circular_sibling() -> Contour2 {
    circle(r(10), r(0), r(1))
}

fn circle(x: Real, y: Real, radius: Real) -> Contour2 {
    let center = Point2::new(x.clone(), y.clone());
    let a = Point2::new(&x + &radius, y.clone());
    let b = Point2::new(x - radius, y);
    Contour2::try_new(vec![
        Segment2::Arc(
            CircularArc2::try_from_center(a.clone(), b.clone(), center.clone(), false)
                .unwrap(),
        ),
        Segment2::Arc(CircularArc2::try_from_center(b, a, center, false).unwrap()),
    ])
    .unwrap()
}

fn rectangle(x0: Real, y0: Real, x1: Real, y1: Real) -> Contour2 {
    Contour2::from_real_ring(&[
        [x0.clone(), y0.clone()],
        [x1.clone(), y0.clone()],
        [x1, y1.clone()],
        [x0.clone(), y1],
        [x0, y0],
    ])
    .unwrap()
}

fn model(
    profile: &CurveRegion2,
    operation: &str,
    context: &GeometryContext,
) -> Result<GeometryOutcome<TriangleMesh>, csgrs::errors::ValidationError> {
    match operation {
        "triangulate" => curve::try_triangulate(profile, context),
        "extrude" => curve::try_extrude(profile, r(2), context),
        "twist-zero" => curve::extrude_twisted(profile, r(2), r(0), [r(1), r(1)], 1, context),
        "sweep" => curve::try_sweep(
            profile,
            &[Point3::origin(), Point3::new(r(0), r(0), r(2))],
            context,
        ),
        "revolve" => curve::revolve(profile, r(360), 4, context),
        _ => unreachable!(),
    }
}

fn has_vertex(mesh: &TriangleMesh, x: &Real, y: &Real) -> bool {
    mesh.positions
        .iter()
        .any(|p| equal(&p.x, x) && equal(&p.y, y) && equal(&p.z, &r(0)))
}

fn assert_closed(mesh: &TriangleMesh) {
    let outcome = mesh
        .is_closed_manifold_geometry(&GeometryContext::STRICT.mesh_context())
        .unwrap();
    assert_eq!(outcome.certainty, hypermesh::MeshCertainty::Certified);
    assert!(outcome.value);
}

fn stepped_cap(origin: Real, step: Real) -> Contour2 {
    let a = Point2::new(origin.clone(), r(0));
    let b = Point2::new(&origin + step, r(0));
    let c = Point2::new(b.x().clone(), r(-1));
    let d = Point2::new(&origin + r(2), r(-1));
    let e = Point2::new(d.x().clone(), r(0));
    Contour2::try_new(vec![
        Segment2::Line(LineSeg2::try_new(a.clone(), b.clone()).unwrap()),
        Segment2::Line(LineSeg2::try_new(b, c.clone()).unwrap()),
        Segment2::Line(LineSeg2::try_new(c, d.clone()).unwrap()),
        Segment2::Line(LineSeg2::try_new(d, e.clone()).unwrap()),
        Segment2::Arc(
            CircularArc2::try_from_center(e, a, Point2::new(origin + r(1), r(0)), false)
                .unwrap(),
        ),
    ])
    .unwrap()
}

fn main() {
    let args: Vec<_> = std::env::args().collect();
    let mode = args[1].as_str(); let operation = args[2].as_str();
    let mut origin=r(1); let mut width=q(1,3);
    if mode.contains("tiny") { width=tiny(); }
    if mode.contains("sqrt") { width=r(2).sqrt().unwrap(); }
    if mode.contains("large") { origin=r(2).powi(70.into()).unwrap(); }
    let right=&origin+&width;
    let member=rectangle(origin,r(2),right.clone(),r(3));
    let (materials,holes,expected_x,expected_y) = match mode {
        "circle" => (vec![circular_sibling()], vec![], r(11),r(0)),
        "hole-tiny" => (vec![circle(r(10),r(0),r(2))],vec![rectangle(r(9),q(-1,3),r(9)+tiny(),q(1,3))],r(9)+tiny(),q(-1,3)),
        "span-third" => (vec![stepped_cap(q(1,3),tiny())],vec![],q(1,3)+tiny(),r(0)),
        x if x.starts_with("linear") => (vec![member],vec![],right,r(2)),
        _ => (vec![member,circular_sibling()],vec![],right,r(2)),
    };
    let profile=CurveRegion2::try_from_native_contours(materials,holes).unwrap();
    for sample in 0..5 {
        let live=LIVE.load(Ordering::Relaxed);
        let allocated=ALLOCATED.load(Ordering::Relaxed);
        let calls=CALLS.load(Ordering::Relaxed);
        PEAK.store(live,Ordering::Relaxed);
        let start=Instant::now();
        let result=model(&profile,operation,&GeometryContext::STRICT);
        let elapsed=start.elapsed().as_nanos();
        let allocated=ALLOCATED.load(Ordering::Relaxed)-allocated;
        let calls=CALLS.load(Ordering::Relaxed)-calls;
        let peak=PEAK.load(Ordering::Relaxed).saturating_sub(live);
        let mut row=serde_json::json!({"case":mode,"operation":operation,"sample":sample,"operation_ns":elapsed,"allocated_bytes":allocated,"allocation_calls":calls,"peak_growth_bytes":peak});
        match result {
            Ok(out) => {
                row["status"]=serde_json::json!("success");
                row["certainty"]=serde_json::json!(format!("{:?}",out.certainty));
                let mesh=out.value;
                row["exact_vertex"]=serde_json::json!(has_vertex(&mesh,&expected_x,&expected_y));
                row["sampled"]=serde_json::json!(mesh.construction_evidence().source_sampled());
                row["projected"]=serde_json::json!(mesh.construction_evidence().coordinates_projected());
                let start=Instant::now();
                if operation!="triangulate" { assert_closed(&mesh); }
                row["validation_ns"]=serde_json::json!(start.elapsed().as_nanos());
                let coordinates:Vec<_>=mesh.positions.iter().map(|p|[&p.x,&p.y,&p.z]).collect();
                let faces:Vec<_>=mesh.triangles.iter().map(|t|t.indices()).collect();
                let bytes=serde_json::to_vec(&(coordinates,faces)).unwrap();
                row["output_bytes"]=serde_json::json!(bytes.len());
                row["checksum"]=serde_json::json!(bytes.iter().fold(14695981039346656037u64,|hash,b|(hash^u64::from(*b)).wrapping_mul(1099511628211)).to_string());
                if sample==0 { std::fs::write(&args[3],bytes).unwrap(); }
                let start=Instant::now();drop(mesh);
                row["drop_ns"]=serde_json::json!(start.elapsed().as_nanos());
            },
            Err(error)=> {row["status"]=serde_json::json!(format!("{:?}",error.kind()));row["error"]=serde_json::json!(error.to_string());},
        }
        println!("{row}"); std::io::stdout().flush().unwrap();
    }
}
