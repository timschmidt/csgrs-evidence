use std::alloc::{GlobalAlloc, Layout, System};
use std::hint::black_box;
use std::sync::atomic::{AtomicBool, AtomicIsize, AtomicUsize, Ordering};
use std::time::Instant;
use alumina_interface_core::machine_profile::{MachineDynamicsProfile2,MachineResolutionBudget2};
use hyperreal::Rational;
use alumina_board::{OwnerDomain, ResourceId};
use alumina_config::{BindingFlags, BindingRole, ConfigurationDocumentView, ConfigurationFlags, ConfigurationHeader, ConfigurationRecord, ExactScalar, FactEvidence, Rational as ConfigurationRational, ResourceBinding, ScalarFact, SignalPolarity};
use alumina_protocol::Digest;
use alumina_storage::sha256;
mod fixture;
struct CountingAllocator;

#[global_allocator]
static ALLOCATOR: CountingAllocator = CountingAllocator;

static ENABLED: AtomicBool = AtomicBool::new(false);
static ALLOCATIONS: AtomicUsize = AtomicUsize::new(0);
static DEALLOCATIONS: AtomicUsize = AtomicUsize::new(0);
static REALLOCATIONS: AtomicUsize = AtomicUsize::new(0);
static ALLOCATED_BYTES: AtomicUsize = AtomicUsize::new(0);
// Signed deltas expose any pre-epoch allocation freed during measurement
// instead of letting a saturating subtraction hide it as a clean zero.
static LIVE_BYTES: AtomicIsize = AtomicIsize::new(0);
static PEAK_LIVE_BYTES: AtomicIsize = AtomicIsize::new(0);

unsafe impl GlobalAlloc for CountingAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        let pointer = unsafe { System.alloc(layout) };
        if !pointer.is_null() && ENABLED.load(Ordering::Relaxed) {
            ALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            ALLOCATED_BYTES.fetch_add(layout.size(), Ordering::Relaxed);
            add_live_bytes(layout.size());
        }
        pointer
    }

    unsafe fn dealloc(&self, pointer: *mut u8, layout: Layout) {
        if ENABLED.load(Ordering::Relaxed) {
            DEALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            subtract_live_bytes(layout.size());
        }
        unsafe { System.dealloc(pointer, layout) };
    }

    unsafe fn realloc(&self, pointer: *mut u8, layout: Layout, new_size: usize) -> *mut u8 {
        let replacement = unsafe { System.realloc(pointer, layout, new_size) };
        if !replacement.is_null() && ENABLED.load(Ordering::Relaxed) {
            REALLOCATIONS.fetch_add(1, Ordering::Relaxed);
            ALLOCATED_BYTES.fetch_add(new_size, Ordering::Relaxed);
            if new_size >= layout.size() {
                add_live_bytes(new_size - layout.size());
            } else {
                subtract_live_bytes(layout.size() - new_size);
            }
        }
        replacement
    }
}

fn add_live_bytes(bytes: usize) {
    let bytes = bytes as isize;
    let live = LIVE_BYTES.fetch_add(bytes, Ordering::Relaxed) + bytes;
    let mut peak = PEAK_LIVE_BYTES.load(Ordering::Relaxed);
    while live > peak {
        match PEAK_LIVE_BYTES.compare_exchange_weak(
            peak,
            live,
            Ordering::Relaxed,
            Ordering::Relaxed,
        ) {
            Ok(_) => break,
            Err(observed) => peak = observed,
        }
    }
}

fn subtract_live_bytes(bytes: usize) {
    LIVE_BYTES.fetch_sub(bytes as isize, Ordering::Relaxed);
}

#[derive(Clone, Copy)]
struct AllocationStats {
    allocations: usize,
    deallocations: usize,
    reallocations: usize,
    allocated_bytes: usize,
    peak_live_bytes: isize,
    live_bytes: isize,
}

impl AllocationStats {
    fn snapshot() -> Self {
        Self {
            allocations: ALLOCATIONS.load(Ordering::Relaxed),
            deallocations: DEALLOCATIONS.load(Ordering::Relaxed),
            reallocations: REALLOCATIONS.load(Ordering::Relaxed),
            allocated_bytes: ALLOCATED_BYTES.load(Ordering::Relaxed),
            peak_live_bytes: PEAK_LIVE_BYTES.load(Ordering::Relaxed),
            live_bytes: LIVE_BYTES.load(Ordering::Relaxed),
        }
    }
}

struct CountingGuard;

impl CountingGuard {
    fn start() -> Self {
        for counter in [
            &ALLOCATIONS,
            &DEALLOCATIONS,
            &REALLOCATIONS,
            &ALLOCATED_BYTES,
        ] {
            counter.store(0, Ordering::Relaxed);
        }
        LIVE_BYTES.store(0, Ordering::Relaxed);
        PEAK_LIVE_BYTES.store(0, Ordering::Relaxed);
        ENABLED.store(true, Ordering::SeqCst);
        Self
    }
}

impl Drop for CountingGuard {
    fn drop(&mut self) {
        ENABLED.store(false, Ordering::SeqCst);
    }
}

fn measure<T>(iterations: usize, mut operation: impl FnMut() -> T) -> AllocationStats {
    // Exact-real approximation nodes refine lazily. Several warm-up passes
    // ensure the counting epoch measures a stable cache depth rather than
    // charging retained refinement state as an apparent live-byte leak.
    for _ in 0..8 {
        drop(black_box(operation()));
    }
    let guard = CountingGuard::start();
    for _ in 0..iterations {
        drop(black_box(operation()));
    }
    let stats = AllocationStats::snapshot();
    drop(guard);
    stats
}

fn print_row(name: &str, operation: &str, iterations: usize, stats: AllocationStats) {
    println!("RAW {name} {iterations} {} {} {} {} {} {}", stats.allocations,
        stats.deallocations, stats.allocated_bytes, stats.reallocations,
        stats.peak_live_bytes, stats.live_bytes);
    let divisor = iterations as f64;
    println!(
        "| {name} | {operation} | {:.2} | {:.2} | {:.1} | {:.2} | {} | {} |",
        stats.allocations as f64 / divisor,
        stats.deallocations as f64 / divisor,
        stats.allocated_bytes as f64 / divisor,
        stats.reallocations as f64 / divisor,
        stats.peak_live_bytes,
        stats.live_bytes,
    );
    assert_eq!(
        stats.live_bytes, 0,
        "{name}/{operation} retained or released foreign bytes during the counting epoch"
    );
}

fn prepared(index: usize) -> (Vec<u8>, Digest) {
 let mut records=fixture::machine_records();
 for record in &mut records { if let ConfigurationRecord::Scalar(s)=record {
  if index==5 && s.fact==ScalarFact::AxisPositionMinimumMetres {s.value=fixture::wire_rational(-3,10);}
  if index==6 {s.uncertainty=fixture::wire_rational(0,1);}
 }}
 fixture::document(&records)
}
fn allocations(index:usize)->(Rational,Rational,Rational) {
 match index {
  1=>(Rational::fraction(1,10).unwrap(),Rational::zero(),Rational::zero()),
  2=>(Rational::zero(),Rational::from(-1),Rational::from(-1)),
  3=>(Rational::fraction(1,10).unwrap(),Rational::from(-1),Rational::from(-1)),
  4=>(Rational::fraction(1,1000).unwrap(),Rational::zero(),Rational::zero()),
  _=>(Rational::fraction(1,10).unwrap(),Rational::fraction(1,100).unwrap(),Rational::fraction(1,100).unwrap()),
 }
}
fn serialized(result:&Result<MachineResolutionBudget2,alumina_interface_core::machine_profile::MachineProfileError>)->String {
 result.as_ref().map_or_else(|_|String::new(),|v|serde_json::to_string(&[
 v.requested_total_error_mm(),v.source_curve_allocation_mm(),v.controller_interpolation_allocation_mm(),
 v.endpoint_quantization_error_mm(),v.step_event_tracking_error_mm(),v.command_lattice_error_mm(),
 v.calibration_error_mm(),v.following_error_mm(),v.output_grid_position_error_mm(),v.required_total_error_mm()
 ]).unwrap())
}
fn main() {
 let timed=std::env::var_os("PROFILE_TIMING").is_some();
 for index in 0..7 {
  let(bytes,digest)=prepared(index);
  let view=ConfigurationDocumentView::decode::<32>(&board_mks_tinybee::PACKAGE,&bytes,digest).unwrap();
  let profile=MachineDynamicsProfile2::from_configuration(view).unwrap();
  let(total,source,controller)=allocations(index);
  let operation=||MachineResolutionBudget2::certify(black_box(&profile),total.clone(),source.clone(),controller.clone());
  hyperreal::dispatch_trace::reset();
  hyperreal::dispatch_trace::reset_rational_stats();
  let result=hyperreal::dispatch_trace::with_recording(operation);
  println!("TRACE {index} {:?}",hyperreal::dispatch_trace::take_trace());
  assert_eq!(result.is_ok(),!matches!(index,2|3|4));
  if let Ok(b)=&result {assert_eq!(b.configuration_digest(),profile.configuration_digest());assert_eq!(b.capability_digest(),profile.capability_digest());}
  println!("RESULT {index} {result:?}");
  println!("IDENTITY {index} {:?}",result.as_ref().ok().map(|b|(b.configuration_digest().0,b.capability_digest().0)));
  println!("SERIALIZED {index} {}",serialized(&result));drop(result);
  print_row(&index.to_string(),"budget",16,measure(16,operation));
  if timed {let mut times=Vec::new();for _ in 0..31 {let start=Instant::now();for _ in 0..64 {drop(black_box(operation()));}times.push(start.elapsed().as_nanos() as f64/64.0);}println!("TIMING {index} {times:?}");}
 }
}
