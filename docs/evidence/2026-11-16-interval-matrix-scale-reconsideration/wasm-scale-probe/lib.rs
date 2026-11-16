use hyperlattice_interval::{IntervalMatrix, IntervalLatticeError};
use hyperlattice_interval::hyperinterval::{FixedInterval, IntervalError};
type I = FixedInterval<i32,16>;
type M = IntervalMatrix<I,2,2>;
fn scale(m:&M,s:&I)->Result<M,IntervalLatticeError>{
    #[cfg(feature="shared")] { m.scale(s,&mut ()) }
    #[cfg(not(feature="shared"))] {
        let Some(r)=m.rows() else {return M::empty()};
        if s.is_empty() {return M::empty()}
        M::new([[r[0][0].checked_mul(s)?,r[0][1].checked_mul(s)?],[r[1][0].checked_mul(s)?,r[1][1].checked_mul(s)?]])
    }
}
#[unsafe(no_mangle)]
pub extern "C" fn scale_entry(a:i32,b:i32,c:i32,d:i32,mode:u32,selector:u32)->i64{
    let x=match I::new(a,b){Ok(x)=>x,Err(_)=>return -1};
    let s=match I::new(c,d){Ok(x)=>x,Err(_)=>return -1};
    let p=I::point(1<<16).unwrap();let n=I::point(-(1<<16)).unwrap();
    let m=if mode==1 {M::empty().unwrap()}else{M::new([[x,p],[n,x]]).unwrap()};
    let s=if mode==2 {I::empty().unwrap()}else{s};
    let output=match scale(&m,&s){
        Ok(x)=>x,
        Err(IntervalLatticeError::Scalar(IntervalError::Overflow))=>return -2,
        Err(_)=>return -99,
    };
    let Some(r)=output.rows()else{return 0};
    if selector==0{return 1}
    if selector>8{return -99}
    let index=(selector-1)as usize;let (lo,hi)=r[index/4][(index/2)%2].bounds().unwrap();
    i64::from(if index%2==0{lo}else{hi})
}
