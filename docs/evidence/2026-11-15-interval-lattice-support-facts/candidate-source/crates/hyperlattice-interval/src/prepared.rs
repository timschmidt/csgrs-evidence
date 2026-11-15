//! Borrowed exact-zero support for repeated Cartesian matrix products.
use crate::{
    IntervalArithmetic, IntervalLatticeError, IntervalMatrix, IntervalVector, array_result,
};
use hyperinterval::SignSet;

/// Immutable matrix source and its proven singleton-zero coefficient mask.
///
/// This opt-in view omits only identically zero terms from products. An interval
/// merely containing zero is never omitted. Retained terms use the same scalar
/// kernels and increasing inner-index order as ordinary matrix multiplication;
/// successful endpoint values and encodings agree. Skipped scalar work can let
/// a dyadic calculation finish under a budget that the ordinary path exhausts.
/// Preparation does not change the ordinary matrix's methods or stored layout.
///
/// The shared borrow binds every fact to its original source and prevents source
/// mutation while this view is usable. No source scalars are cloned. Serialize
/// the source matrix and prepare again after its validated replay; derived masks
/// are deliberately not deserializable as authority. Cloning a view copies only
/// its borrow and inline mask. Storage and preparation work grow with `R*C`;
/// primitive preparation/products allocate nothing, while scalar arithmetic keeps
/// the selected backend's resource contract. There is no total heap-byte bound.
#[derive(Clone, Debug)]
pub struct PreparedIntervalMatrix<'a, I: IntervalArithmetic, const R: usize, const C: usize> {
    source: &'a IntervalMatrix<I, R, C>,
    zeros: Option<[[bool; C]; R]>,
}

impl<I: IntervalArithmetic, const R: usize, const C: usize> IntervalMatrix<I, R, C> {
    /// Retain exact-zero support for repeated sparse products without cloning scalars.
    /// Dense/small matrices can cost more after preparation; select this explicitly
    /// when repeated work benefits. Empty and zero-dimensional unit products remain
    /// distinct. No scalar arithmetic budget is spent by structural sign queries.
    ///
    #[cfg_attr(
        feature = "fixed",
        doc = r#"
```compile_fail
use hyperlattice_interval::{IntervalMatrix, hyperinterval::FixedInterval};
type I = FixedInterval<i32, 0>;
let mut matrix = IntervalMatrix::new([[I::point(0).unwrap()]]).unwrap();
let view = matrix.prepare();
matrix = IntervalMatrix::new([[I::point(1).unwrap()]]).unwrap();
let _ = view.zero_entries(); // the original borrow still binds the facts
```
"#
    )]
    pub fn prepare(&self) -> PreparedIntervalMatrix<'_, I, R, C> {
        PreparedIntervalMatrix {
            source: self,
            zeros: self.rows().map(|rows| {
                core::array::from_fn(|r| {
                    core::array::from_fn(|c| rows[r][c].signs() == SignSet::Zero)
                })
            }),
        }
    }
}

impl<'a, I: IntervalArithmetic, const R: usize, const C: usize>
    PreparedIntervalMatrix<'a, I, R, C>
{
    /// Original validated matrix, borrowed for the full lifetime of these facts.
    pub fn source(&self) -> &'a IntervalMatrix<I, R, C> {
        self.source
    }

    /// Exact singleton-zero mask in row-major order, or None for an empty set.
    /// False includes zero-containing intervals that also have nonzero members.
    /// A nonempty unit product retains its correctly shaped empty mask.
    pub fn zero_entries(&self) -> Option<&[[bool; C]; R]> {
        self.zeros.as_ref()
    }

    /// Matrix-vector enclosure, omitting only proven zero coefficients.
    /// Retained scalar products and sums share one context, in original index
    /// order. Overflow/exhaustion publishes no partial output; empty operands
    /// produce the canonical empty image. The result can be consumed normally.
    pub fn mul_vector(
        &self,
        vector: &IntervalVector<I, C>,
        context: &mut I::Context,
    ) -> Result<IntervalVector<I, R>, IntervalLatticeError> {
        match (self.source.rows(), self.zeros.as_ref(), vector.lanes()) {
            (Some(a), Some(zeros), Some(b)) => IntervalVector::new(array_result(|r| {
                crate::dot(
                    a[r].iter()
                        .zip(b)
                        .enumerate()
                        .filter(|(c, _)| !zeros[r][*c])
                        .map(|(_, pair)| pair),
                    context,
                )
            })?),
            _ => IntervalVector::empty(),
        }
    }

    /// Matrix-matrix enclosure with the same retained-term and budget contract.
    /// Entries are evaluated in row-major order. Only left-source facts are
    /// prepared; no right-side coefficient is silently assumed to be zero.
    pub fn mul_matrix<const K: usize>(
        &self,
        other: &IntervalMatrix<I, C, K>,
        context: &mut I::Context,
    ) -> Result<IntervalMatrix<I, R, K>, IntervalLatticeError> {
        match (self.source.rows(), self.zeros.as_ref(), other.rows()) {
            (Some(a), Some(zeros), Some(b)) => IntervalMatrix::new(array_result(|r| {
                array_result(|k| {
                    crate::dot(
                        (0..C)
                            .filter(|&c| !zeros[r][c])
                            .map(|c| (&a[r][c], &b[c][k])),
                        context,
                    )
                })
            })?),
            _ => IntervalMatrix::empty(),
        }
    }
}
