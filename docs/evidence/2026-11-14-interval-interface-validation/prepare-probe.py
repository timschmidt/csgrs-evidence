from pathlib import Path
import shutil
s=Path(__file__).parent;r=Path('/mnt/development');source=(r/'alumina-interface-validation/crates/alumina-interface-client/tests/validation_contracts.rs').read_text();a=source.index('fn summaries()');snapshots=source[a:].replace('#[test]\n','').replace('let json = serde_json::to_string(&snapshot).unwrap();','let json = serde_json::to_string(&snapshot).unwrap();\n                            if std::env::var_os("PROBE_TRANSCRIPT").is_some() { println!("SNAPSHOT {} {}",json,expected); }')
(s/'snapshots.rs').write_text(snapshots)
body='''use alumina_interface_client::{Response, network::{NetworkProvisioningMachine,NetworkUpdate,NetworkClientPhase}, worker::{ConfigurationPhaseSnapshot as Phase,ConfigurationSummarySnapshot as Summary,ConfigurationWorkerSnapshot as Snapshot,WorkerContractError,WorkerNetworkScanSnapshot}};
use alumina_net::{NetworkSupervisor,provisioning::{NetworkStatus,NetworkScanResult,NetworkScanEntry,NetworkAuthentication}};
use alumina_protocol::StatusCode;
use std::{hint::black_box,time::Instant};
include!("snapshots.rs");
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
   match &event {NetworkUpdate::Scan(scan)=>assert_eq!(scan.encode().as_slice(),response.body.as_slice()),NetworkUpdate::Status(status)=>assert_eq!(status.encode().as_slice(),response.body.as_slice()),_=>panic!("unexpected event")};drop(black_box(event));
  };
  for _ in 0..32 {run();}
  if transcript {
   let mut machine=prepared.clone();let event=machine.accept_response(&response).unwrap();println!("EVENT {event:?}");if let Some(scan)=machine.latest_scan() {println!("SCAN_JSON {}",serde_json::to_string(&WorkerNetworkScanSnapshot::from_scan(scan)).unwrap());}println!("WIRE {:?}",response.body);
  }
  if allocation {
   let guard=CountingGuard::start();for _ in 0..32 {run();}let stats=AllocationStats::snapshot();drop(guard);print_row("network",mode,32,stats);
   let mut machine=prepared.clone();let guard=CountingGuard::start();let event=machine.accept_response(&response).unwrap();let retained=AllocationStats::snapshot();drop(event);let after=AllocationStats::snapshot();drop(guard);assert_eq!(after.live_bytes,0);println!("RESOURCE {mode} retained={} peak={} after_drop={}",retained.live_bytes,retained.peak_live_bytes,after.live_bytes);
  } else {let start=Instant::now();for _ in 0..iterations {run();}let elapsed=start.elapsed();println!("TIME {mode} iterations={iterations} ns_per_operation={}",elapsed.as_nanos()/u128::from(iterations));}
 }
}
'''
body=body.replace('drop(black_box(event));','consume(event);').replace('drop(event);','consume(event);')
body=body.replace('fn main() {','fn consume<T>(value:T) { drop(black_box(value)); }\nfn main() {')
point=body.rfind('\n }\n}')
body=body[:point]+"""
  let mut machine=prepared.clone();let event=machine.accept_response(&response).unwrap();let clone_run=|| {let copy=event.clone();assert_eq!(copy,event);consume(copy);};
  for _ in 0..32 {clone_run();}
  if allocation {
   let guard=CountingGuard::start();for _ in 0..32 {clone_run();}let stats=AllocationStats::snapshot();drop(guard);print_row(mode,"clone",32,stats);
  } else {let start=Instant::now();for _ in 0..iterations {clone_run();}println!("TIME {mode}_clone iterations={iterations} ns_per_operation={}",start.elapsed().as_nanos()/u128::from(iterations));}
"""+body[point:]
previous=Path('/tmp/interval-refactor/taylor-model-composition/allocation/src/main.rs').read_text();allocator=previous[previous.index('use std::alloc::'):previous.index('struct Criterion;')];allocator=allocator[:allocator.index('fn measure<T>')]+allocator[allocator.index('fn print_row'):]
for variant,checkout in [('base','alumina-interface-validation-base'),('candidate','alumina-interface-validation')]:
 dest=s/('probe-'+variant);(dest/'src').mkdir(parents=True,exist_ok=True);(dest/'src/main.rs').write_text(body+'\n'+allocator);(dest/'src/snapshots.rs').write_text(snapshots);(dest/'Cargo.toml').write_text(f'''[package]
name="network-event-probe"
version="0.0.0"
edition="2024"
[workspace]
[dependencies]
alumina-interface-client={{path="{r/checkout}/crates/alumina-interface-client"}}
alumina-net={{path="{r}/alumina-firmware/crates/alumina-net"}}
alumina-protocol={{path="{r}/alumina-firmware/crates/alumina-protocol"}}
serde_json="1"
''');shutil.copy2(r/checkout/'Cargo.lock',dest/'Cargo.lock')
