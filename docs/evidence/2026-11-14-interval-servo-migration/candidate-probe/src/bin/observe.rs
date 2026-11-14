use servo_migration_probe::*;
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
