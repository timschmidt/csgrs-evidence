use hyperreal::Real;
#[path="../../coefficients-probe/src/fixture.rs"] mod fixture;
use fixture::{graph,source};
#[unsafe(no_mangle)]
pub extern "C" fn verify(x: i32) -> u32 {
 let (source,requests,k)=source();
 let coefficients=source.coefficients(&requests,&mut graph()).unwrap();
 let values=coefficients.program().eval_real(&[Real::from(x)],&mut graph()).unwrap();
 let value=k.clone()*Real::from(i64::from(x)*i64::from(x))+Real::from(x);
 let first=k.clone()*Real::from(2*i64::from(x))+Real::one();
 let expected=vec![value.clone(),value,k.clone(),first.clone(),k.clone(),Real::zero(),first,k,Real::zero(),Real::zero(),Real::zero(),Real::zero()];
 u32::from(values==expected)
}
