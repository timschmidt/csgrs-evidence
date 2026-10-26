use hyperreal::Real;
fn main(){let t=(Real::one()/Real::from(3).sqrt().unwrap()).unwrap();let right=Real::one()-&t;println!("right cold={:?}",right.structural_facts());println!("t facts={:?}",t.structural_facts());println!("right warm={:?}",right.structural_facts());println!("right rebuilt={:?}",(Real::one()-t).structural_facts());}
