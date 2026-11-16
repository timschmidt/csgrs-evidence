from pathlib import Path
import shutil
s=Path(__file__).parent;p=s/'probe';(p/'src').mkdir(parents=True)
(p/'Cargo.toml').write_text('''[package]
name = "foc-order-probe"
version = "0.0.0"
edition = "2024"
rust-version = "1.88"
[workspace]
[dependencies]
alumina-foc = { path = "/mnt/development/interval-profile-static/alumina-firmware/crates/alumina-foc" }
[lib]
crate-type = ["cdylib", "rlib"]
[profile.release]
opt-level = "s"
lto = "fat"
codegen-units = 1
overflow-checks = true
''')
(p/'src/lib.rs').write_text('''use alumina_foc::{AlphaBeta, FocError, ModulationResult, Q30, Q30Interval, space_vector_modulate};
fn interval(lo:i32,hi:i32)->Q30Interval {Q30Interval::new(Q30::from_bits(lo),Q30::from_bits(hi)).unwrap()}
pub fn input(index:u32)->(AlphaBeta,Q30) {
 let one=1_i32<<30;
 let (a,b,c,d,limit)=match index {
  0=>(0,0,0,0,one),
  1=>(one/2,one/2,0,0,one),
  2=>(-one/2,one/2,-one/4,one/4,one),
  3=>(one/4,one/4,one/8,one/8,one),
  4=>(0,0,0,0,0),
  5=>(0,0,0,0,-one),
  6=>(one+one/2,one+one/2,0,0,one),
  7=>(i32::MIN,i32::MAX,0,0,one),
  8=>(0,0,i32::MAX,i32::MAX,one),
  9=>(i32::MIN,i32::MIN,i32::MIN,i32::MIN,one),
  10=>(-1,1,-1,1,one),
  11=>(one,one,one,one,one),
  _=>{
   let mut state=index;
   let mut next=|| {state=state.wrapping_mul(1664525).wrapping_add(1013904223);state};
   let a=(next()%1_600_000_001) as i32-800_000_000;
   let b=a+(next()%100_000_001) as i32;
   let c=(next()%1_600_000_001) as i32-800_000_000;
   let d=c+(next()%100_000_001) as i32;
   (a,b,c,d,[one/2,one,one+one/2][(next()%3) as usize])
  }
 };
 (AlphaBeta{alpha:interval(a,b),beta:interval(c,d)},Q30::from_bits(limit))
}
pub fn operate(value:AlphaBeta,limit:Q30)->Result<ModulationResult,FocError> {space_vector_modulate(value,limit)}
pub fn fields(result:Result<ModulationResult,FocError>)->[i64;16] {
 match result {
  Err(e)=>{let mut v=[0;16];v[1]=e as i64;v},
  Ok(r)=>[1,0,r.common_mode.lower().bits() as i64,r.common_mode.upper().bits() as i64,
   r.centered_phases.a.lower().bits() as i64,r.centered_phases.a.upper().bits() as i64,
   r.centered_phases.b.lower().bits() as i64,r.centered_phases.b.upper().bits() as i64,
   r.centered_phases.c.lower().bits() as i64,r.centered_phases.c.upper().bits() as i64,
   r.duties.a.lower().bits() as i64,r.duties.a.upper().bits() as i64,
   r.duties.b.lower().bits() as i64,r.duties.b.upper().bits() as i64,
   r.duties.c.lower().bits() as i64,r.duties.c.upper().bits() as i64]
 }
}
#[unsafe(no_mangle)]
pub extern "C" fn foc_field(index:u32,slot:u32)->i64 {let(v,l)=input(index);fields(operate(v,l))[slot as usize]}
''')
shutil.copy2(s.with_name('q30-migration')/'allocations.rs',p/'src/allocations.rs')
(p/'src/main.rs').write_text('''use std::{hint::black_box,time::Instant};
use foc_order_probe::{input,operate,fields};
mod allocations;
fn main(){
 let timed=std::env::var_os("FOC_TIMING").is_some();
 println!("LAYOUT {} {} {}",size_of::<alumina_foc::Q30Interval>(),align_of::<alumina_foc::Q30Interval>(),size_of::<alumina_foc::ModulationResult>());
 for index in 0..if timed {12} else {4108} {
  let(value,limit)=input(index);
  let operation=|| operate(black_box(value),black_box(limit));
  let result=operation();
  println!("RAW {index} {:?}",fields(result));
  if index<12 {
   println!("RESULT {index} {result:?}");
   for _ in 0..128 {let _=black_box(operation());}
   let(_,calls,bytes)=allocations::measure(|| {for _ in 0..32 {let _=black_box(operation());}});
   println!("ALLOC {index} {calls} {bytes}");assert_eq!((calls,bytes),(0,0));
   if timed {
    let mut samples=Vec::new();
    for _ in 0..31 {let start=Instant::now();for _ in 0..4096 {let _=black_box(operation());}samples.push(start.elapsed().as_nanos() as f64/4096.0);}
    println!("TIMING {index} {samples:?}");
   }
  }
 }
}
''')
