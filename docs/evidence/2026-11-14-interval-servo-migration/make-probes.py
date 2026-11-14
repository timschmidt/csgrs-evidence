from pathlib import Path
import shutil
stage=Path('/tmp/interval-refactor/servo-migration')
src=Path('/mnt/development/alumina-servo-baseline/crates/alumina-foc/src/servo.rs').read_text()
fixtures=src.split('    const DIGEST: Digest = Digest([0x5a; 32]);')[1].split('    #[test]')[0]
common='use alumina_foc::*;\nuse alumina_protocol::{DeviceCycle, Digest};\nconst DIGEST: Digest = Digest([0x5a; 32]);\n'+fixtures
common+='''
pub const VALUES: [i64; 9] = [i64::MIN, i64::MIN + 1, -(1_i64 << 32), -1, 0, 1, 1_i64 << 32, i64::MAX - 1, i64::MAX];
pub fn trace(seed: i64, mode: u32, ticks: u64, mut observe: impl FnMut(Result<ServoCascadeUpdate, ServoCascadeError>)) -> CascadedServoController {
    let mut controller = CascadedServoController::new(grid(), config(), &snapshot()).unwrap();
    for index in 0..ticks {
        let at = 1000 + index * 100;
        let target = if index % 50 == 0 { Some(setpoint((index / 50 + 1) as u32, at, seed * (1 << 24))) } else { None };
        let observation = if index % 10 == 0 {
            let mut s = sample((index / 10 + 1) as u32, at, seed * (1 << 20) + index as i64, Q30::from_bits((seed * (1 << 16)) as i32));
            s.position = ServoPositionInterval::new(ServoPosition::from_bits(s.position.lower().bits()-3), ServoPosition::from_bits(s.position.upper().bits()+4)).unwrap();
            s.velocity = Q30Interval::new(Q30::from_bits(s.velocity.lower().bits()-2), Q30::from_bits(s.velocity.upper().bits()+3)).unwrap();
            if mode == 1 && index == 10 { s.sampled_at = DeviceCycle(at - 101); }
            if mode == 2 && index == 0 { s.position = ServoPositionInterval::point(ServoPosition::from_bits(i64::MIN)); }
            if mode == 3 && index == 0 { s.position = ServoPositionInterval::new(ServoPosition::from_bits(i64::MIN), ServoPosition::from_bits(i64::MAX)).unwrap(); }
            if mode == 4 && index == 0 { s.velocity = Q30Interval::point(Q30::from_bits(i32::MIN)); }
            Some(s)
        } else { None };
        observe(controller.service(DeviceCycle(at), target, observation));
    }
    controller
}
'''
observe='''use servo_migration_probe::*;
use alumina_foc::*;
fn main() {
 for lower in VALUES { for upper in VALUES {
  let value=ServoPositionInterval::new(ServoPosition::from_bits(lower),ServoPosition::from_bits(upper));
  println!("position,{lower},{upper},{:?}",value.map(|v|(v,v.midpoint(),v.width_ulps())));
 }}
 for seed in [-31,-7,-1,0,1,7,31] { for mode in 0..5 {
  let mut index=0;
  let controller=trace(seed,mode,150,|result| { println!("service,{seed},{mode},{index},{result:?}"); index+=1; });
  println!("state,{seed},{mode},{controller:?}");
 }}
}
'''
cost='''use servo_migration_probe::*;
use alumina_foc::*;
use std::{hint::black_box, time::Instant};
mod allocations;
fn run(action: u32)->(u64,u64) {
 let mut checksum=0u64; let mut completed=0;
 if action==0 {
  for _ in 0..128 { for lower in VALUES { for upper in VALUES { if lower>upper {continue;}
   let value=black_box(ServoPositionInterval::new(ServoPosition::from_bits(lower),ServoPosition::from_bits(upper)).unwrap());
   checksum=checksum.wrapping_add(black_box(value.midpoint()).bits() as u64).wrapping_add(black_box(value.width_ulps())); completed+=1;
  }}}
 } else {
  for seed in [-31,-7,-1,0,1,7,31] {
   black_box(trace(black_box(seed),if action==1 {0} else {1},500,|result| {
    if let Ok(update)=black_box(result) {
     checksum=checksum.wrapping_add(update.current_target.q.bits() as u64).wrapping_add(update.velocity_target.bits() as u64);
    } else { checksum=checksum.wrapping_add(1); }
    completed+=1;
   }));
  }
 }
 (completed,checksum)
}
fn main() {
 println!("action,sample,completed,elapsed_ns,allocation_calls,allocated_bytes,checksum");
 for action in 0..3 {
  for _ in 0..8 {black_box(run(action));}
  for sample in 0..20 {
   let start=Instant::now();
   let ((completed,checksum),calls,bytes)=allocations::measure(||run(black_box(action)));
   let elapsed=start.elapsed().as_nanos(); assert_eq!((calls,bytes),(0,0));
   println!("{action},{sample},{completed},{elapsed},{calls},{bytes},{checksum}");
  }
 }
}
'''
for kind,repo in [('baseline','alumina-servo-baseline'),('candidate','alumina-servo-migration')]:
 p=stage/f'{kind}-probe'; (p/'src/bin').mkdir(parents=True)
 (p/'src/lib.rs').write_text(common); (p/'src/bin/observe.rs').write_text(observe); (p/'src/bin/cost.rs').write_text(cost)
 shutil.copyfile('/tmp/interval-refactor/q30-migration/allocations.rs',p/'src/bin/allocations.rs')
 (p/'Cargo.toml').write_text(f'''[package]
name = "servo-migration-probe"
version = "0.0.0"
edition = "2024"
rust-version = "1.88"
autobins = false
[workspace]
[dependencies]
alumina-foc = {{ path = "/mnt/development/{repo}/crates/alumina-foc" }}
alumina-protocol = {{ path = "/mnt/development/{repo}/crates/alumina-protocol" }}
[[bin]]
name = "observe"
path = "src/bin/observe.rs"
[[bin]]
name = "cost"
path = "src/bin/cost.rs"
[profile.release]
opt-level = "s"
lto = "fat"
codegen-units = 1
overflow-checks = true
''')
