use hyperinterval::DyadicInterval;
use hyperlattice::IntervalMatrix;
use hypersolve::expression_program::{ExpressionError,JacobianMatrix,RegularJacobianEnclosure};
use std::mem::{size_of,align_of};
fn layout<const R:usize,const C:usize>() {
    println!("{R} {C} {} {} {} {} {} {}",
        size_of::<JacobianMatrix<'static,R,C>>(), align_of::<JacobianMatrix<'static,R,C>>(),
        size_of::<(&RegularJacobianEnclosure,IntervalMatrix<DyadicInterval,R,C>)>(),
        align_of::<(&RegularJacobianEnclosure,IntervalMatrix<DyadicInterval,R,C>)>(),
        size_of::<Result<JacobianMatrix<'static,R,C>,ExpressionError>>(),
        size_of::<Result<(&RegularJacobianEnclosure,IntervalMatrix<DyadicInterval,R,C>),ExpressionError>>());
}
fn main() { layout::<1,1>();layout::<3,2>();layout::<8,8>();layout::<0,1>();layout::<1,0>(); }
