from pathlib import Path
import shutil,json
s=Path(__file__).parent;p=s/'probe';p.mkdir();r=json.loads((s/'initial-state.json').read_text())['root']
old=Path('/tmp/interval-refactor/voxel-occupancy-counts/resource-probe')
for name in ['allocation.rs','build.rs','stack.c']:shutil.copyfile(old/name,p/name)
(p/'Cargo.toml').write_text(f'''[package]
name = "dyadic-quotient-current-probe"
version = "0.0.0"
edition = "2024"
[workspace]
[dependencies]
hyperinterval = {{ path = "{r}/crates/hyperinterval", features = ["hyperreal", "serde"] }}
hyperreal = {{ path = "{r}/crates/hyperreal" }}
num-bigint = "0.4.6"
serde = {{ version = "1", features = ["derive"] }}
serde_json = "1"
[features]
trace = ["hyperinterval/dispatch-trace", "hyperreal/dispatch-trace"]
allocation = []
[[bin]]
name = "dyadic-quotient-current-probe"
path = "main.rs"
[profile.release]
opt-level = 3
lto = "thin"
codegen-units = 1
''')
(p/'main.rs').write_text(r'''use hyperinterval::{DomainCoverage, DyadicBudget, DyadicInterval, ExtendedInterval, IntervalError, IntervalSet2, RangeEnclosure};
use hyperreal::Rational;
use num_bigint::BigInt;
use std::{ffi::c_void, hint::black_box};
#[cfg(feature="allocation")]
mod allocation;
#[derive(Debug,serde::Serialize)]
enum Output { Finite(DyadicInterval), Range(DyadicInterval,u8), Split(IntervalSet2<DyadicInterval>,u8) }
#[derive(Debug)]
struct Record { output: Result<Output,IntervalError>, remaining: u64 }
struct Input { name: String, a: DyadicInterval, b: DyadicInterval, rational: Rational, n: BigInt, q: BigInt }
fn d(a:i64,b:i64,e:i32)->DyadicInterval { DyadicInterval::new(a.into(),b.into(),e).unwrap() }
fn input(name:&str)->Input {
 let (a,b) = match name {
 "positive" => (d(1,3,-3),d(3,7,2)),
 "negative" => (d(-7,-3,-2),d(-9,-5,1)),
 "mixed" => (d(-3,7,3),d(-9,-5,-2)),
 "exact" => (d(8,16,0),d(2,4,0)),
 "zero" => (d(0,0,0),d(3,7,0)),
 "empty" => (DyadicInterval::empty(),d(3,7,0)),
 "wide" => {let x=BigInt::from(1)<<1024usize; (DyadicInterval::new(&x+3,&x+17,-512).unwrap(),DyadicInterval::new(&x+5,&x+19,-512).unwrap())},
 "sqrt"|"log"|"power"|"retry" => (d(2,3,0),d(3,7,0)),
 "split" => (d(1,3,0),d(-3,5,0)),
 "contains_zero" => (d(1,3,0),d(-1,1,0)),
 "rational"|"exp"|"atan"|"sin"|"cos"|"tan"|"size"|"work" => (d(1,3,-3),d(3,7,0)),
 _ => panic!("case")
 };
 Input{name:name.into(),a,b,rational:Rational::fraction(-7,13).unwrap(),n:1.into(),q:3.into()}
}
fn image(x:RangeEnclosure<DyadicInterval>)->Output {Output::Range(x.range,match x.domain {DomainCoverage::Complete=>0,DomainCoverage::Partial=>1})}
#[inline(never)]
fn execute(i:&Input)->Record {
 let mut budget=match i.name.as_str(){"size"=>DyadicBudget::new(1,10_000_000_000_000),"work"=>DyadicBudget::new(32768,0),_=>DyadicBudget::new(32768,10_000_000_000_000)};
 let a=black_box(&i.a);let b=black_box(&i.b);
 let output=match i.name.as_str(){
 "sqrt"=>a.sqrt(-256,&mut budget).map(image),
 "rational"=>DyadicInterval::from_rational(&i.rational,-64,&mut budget).map(Output::Finite),
 "exp"=>a.exp(-64,&mut budget).map(image),
 "log"=>a.log(-64,&mut budget).map(image),
 "atan"=>a.atan(-64,&mut budget).map(image),
 "sin"=>a.sin(-64,&mut budget).map(image),
 "cos"=>a.cos(-64,&mut budget).map(image),
 "tan"=>a.tan(-64,&mut budget).map(image),
 "power"=>a.pow_rational(&i.n,&i.q,-64,&mut budget).map(image),
 "split"=>ExtendedInterval::from_finite(a.clone()).div(&ExtendedInterval::from_finite(b.clone()),-64,&mut budget).map(|x|Output::Split(x.range,match x.domain {DomainCoverage::Complete=>0,DomainCoverage::Partial=>1})),
 "retry"=>{assert_eq!(a.div(b,-64,&mut DyadicBudget::new(32768,0)),Err(IntervalError::WorkExhausted));a.div(b,-64,&mut budget).map(Output::Finite)},
 "wide"=>a.div(b,-256,&mut budget).map(Output::Finite),
 _=>a.div(b,-64,&mut budget).map(Output::Finite)
 };
 Record{output,remaining:budget.remaining_work()}
}
fn print_output(r:&Record){
 let serialized=match &r.output {Ok(out)=>serde_json::to_string(out).unwrap(),Err(e)=>format!("error:{e:?}")};
 println!("output {} {}",r.remaining,serialized);
}
unsafe extern "C" {fn measure_stack(callback:extern "C" fn(*mut c_void),context:*mut c_void,warm:i32,pattern:u8)->usize;}
struct Job<'a>{input:&'a Input,result:Option<Record>}
extern "C" fn callback(context:*mut c_void){let job=unsafe{&mut *context.cast::<Job<'_>>()};job.result=Some(execute(job.input));}
fn main(){
 let args:Vec<_>=std::env::args().collect();let mode=&args[1];let case=&args[2];let warm:usize=args[3].parse().unwrap();let i=input(case);
 for _ in 0..warm {black_box(execute(&i));}
 if mode=="stack"{
  for pattern in [0xa5,0x5a,0,0xff]{let mut job=Job{input:&i,result:None};let peak=unsafe{measure_stack(callback,(&mut job as *mut Job<'_>).cast(),0,pattern)};
   println!("stack {case} {warm} {pattern} {peak}");print_output(job.result.as_ref().unwrap());}
  return;
 }
 #[cfg(feature="allocation")]
 if mode=="allocation"{
  use allocation::{AllocationStats as Stats,rust_tracking_enable as enable,rust_tracking_reset as reset};
  for iteration in 0..8 {reset();let before=Stats::rust_snapshot();enable(true);let result=execute(&i);let retained=Stats::rust_snapshot();enable(false);print_output(&result);enable(true);drop(result);let dropped=Stats::rust_snapshot();enable(false);
   println!("allocation {case} {warm} {iteration} {before:?} {retained:?} {dropped:?}");}
  return;
 }
 #[cfg(feature="trace")]
 if mode=="trace"{for iteration in 0..8{hyperreal::dispatch_trace::reset();let guard=hyperreal::dispatch_trace::recording_scope();let result=execute(&i);drop(guard);let trace=hyperreal::dispatch_trace::snapshot_trace();print_output(&result);println!("trace {case} {warm} {iteration} {trace:?}");}return;}
 if mode=="output"{print_output(&execute(&i));return;}
 panic!("mode")
}
''')
shutil.copyfile('/tmp/interval-refactor/dyadic-quotient-sharing/pinned-Cargo.lock',p/'Cargo.lock')
