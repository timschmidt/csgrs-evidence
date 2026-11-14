use alumina_interface_client::{Response, network::{NetworkProvisioningMachine,NetworkUpdate,NetworkClientPhase}, worker::{ConfigurationPhaseSnapshot as Phase,ConfigurationSummarySnapshot as Summary,ConfigurationWorkerSnapshot as Snapshot,WorkerContractError,WorkerNetworkScanSnapshot}};
use alumina_net::{NetworkSupervisor,provisioning::{NetworkStatus,NetworkScanResult,NetworkScanEntry,NetworkAuthentication}};
use alumina_protocol::StatusCode;
use std::{hint::black_box,time::Instant};
include!("snapshots.rs");
fn consume<T>(value:T) { drop(black_box(value)); }
fn main() {
 let iterations:u32=std::env::var("NETWORK_ITERATIONS").map(|v|v.parse().unwrap()).unwrap_or(100000);
 let allocation=std::env::var_os("PROBE_ALLOC").is_some();let transcript=std::env::var_os("PROBE_TRANSCRIPT").is_some();
 if transcript {snapshot_identity_authorization_and_summary_truth_table();}
 println!("LAYOUT update={} result={} machine={} status={} scan={}",std::mem::size_of::<NetworkUpdate>(),std::mem::size_of::<Result<NetworkUpdate,alumina_interface_client::network::NetworkClientError>>(),std::mem::size_of::<NetworkProvisioningMachine>(),std::mem::size_of::<NetworkStatus>(),std::mem::size_of::<NetworkScanResult>());
 for mode in ["status","scan"] {
  let mut prepared=NetworkProvisioningMachine::starting_at(42).unwrap();
  let (response,expected_scan,expected_status)=if mode=="scan" {
   let transaction=prepared.request_scan().unwrap();let entries:Vec<_>=(0..8u8).map(|i|NetworkScanEntry::try_new(&format!("Fixture-{i}"),NetworkAuthentication::Wpa2Personal,i+1,-30-i as i8,[2,0,0,0,0,i+1]).unwrap()).collect();let scan=NetworkScanResult::try_new(transaction,13,17,123456,&entries,true).unwrap();
   (Response {status:StatusCode::Ok,body:scan.encode().to_vec()},Some(scan),None)
  } else {
   prepared.request_status().unwrap();let mut supervisor=NetworkSupervisor::new();supervisor.begin_access_point().unwrap();supervisor.access_point_ready().unwrap();let status=NetworkStatus::provisioning(supervisor);
   (Response {status:StatusCode::Ok,body:status.encode().to_vec()},None,Some(status))
  };
  drop(prepared.next_request().unwrap().unwrap());
  let run=|| {
   let mut machine=prepared.clone();let event=machine.accept_response(black_box(&response)).unwrap();assert_eq!(machine.phase(),NetworkClientPhase::Idle);assert_eq!(machine.latest_scan(),expected_scan);assert_eq!(machine.latest_status(),expected_status);
   match &event {NetworkUpdate::Scan(scan)=>assert_eq!(scan.encode().as_slice(),response.body.as_slice()),NetworkUpdate::Status(status)=>assert_eq!(status.encode().as_slice(),response.body.as_slice()),_=>panic!("unexpected event")};consume(event);
  };
  for _ in 0..32 {run();}
  if transcript {
   let mut machine=prepared.clone();let event=machine.accept_response(&response).unwrap();println!("EVENT {event:?}");if let Some(scan)=machine.latest_scan() {println!("SCAN_JSON {}",serde_json::to_string(&WorkerNetworkScanSnapshot::from_scan(scan)).unwrap());}println!("WIRE {:?}",response.body);
  }
  if allocation {
   let guard=CountingGuard::start();for _ in 0..32 {run();}let stats=AllocationStats::snapshot();drop(guard);print_row("network",mode,32,stats);
   let mut machine=prepared.clone();let guard=CountingGuard::start();let event=machine.accept_response(&response).unwrap();let retained=AllocationStats::snapshot();consume(event);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);println!("RESOURCE {mode} retained={} peak={} after_drop={}",retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
  } else {let start=Instant::now();for _ in 0..iterations {run();}let elapsed=start.elapsed();println!("TIME {mode} iterations={iterations} ns_per_operation={}",elapsed.as_nanos()/u128::from(iterations));}
  let mut machine=prepared.clone();let event=machine.accept_response(&response).unwrap();let clone_run=|| {let copy=event.clone();assert_eq!(copy,event);consume(copy);};
  for _ in 0..32 {clone_run();}
  if allocation {
   let guard=CountingGuard::start();for _ in 0..32 {clone_run();}let stats=AllocationStats::snapshot();drop(guard);print_row(mode,"clone",32,stats);
  } else {let start=Instant::now();for _ in 0..iterations {clone_run();}println!("TIME {mode}_clone iterations={iterations} ns_per_operation={}",start.elapsed().as_nanos()/u128::from(iterations));}

 }
}

use std::alloc::{GlobalAlloc,Layout,System};
use std::sync::atomic::{AtomicBool,AtomicIsize,AtomicUsize,Ordering};
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

fn print_row(name: &str, operation: &str, iterations: usize, stats: AllocationStats) {
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




