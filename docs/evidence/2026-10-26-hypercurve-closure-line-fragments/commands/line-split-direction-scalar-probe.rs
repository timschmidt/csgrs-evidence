use hyperreal::Real;
fn main(){for (i,t) in [Real::zero(),Real::one(),(Real::one()/Real::from(3).sqrt().unwrap()).unwrap(),-Real::from(2).sqrt().unwrap(),Real::from(2).sqrt().unwrap()].into_iter().enumerate(){for (j,v) in [t.clone(),Real::one()-t].into_iter().enumerate(){println!("case={i}/{j} immediate={:?} facts={:?}",v.immediate_sign(),v.structural_facts());}}}
