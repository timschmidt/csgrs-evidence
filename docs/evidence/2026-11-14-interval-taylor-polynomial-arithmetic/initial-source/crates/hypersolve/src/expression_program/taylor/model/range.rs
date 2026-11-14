//! Shared Cartesian image semantics for affine and polynomial Taylor maps.
use hyperinterval::DyadicInterval;

/// Certified Cartesian outer enclosure, distinguishing empty from the zero-dimensional unit.
#[derive(Clone, Debug)]
pub struct TaylorAffineRange {
    pub(super) bounds: Vec<DyadicInterval>,
    pub(super) empty: bool,
}
impl TaylorAffineRange {
    /// Coordinate bounds; an explicit projection, not a replacement source.
    pub fn bounds(&self) -> &[DyadicInterval] {
        &self.bounds
    }
    /// Whether the input parameter domain was empty, even with zero outputs.
    pub fn is_empty(&self) -> bool {
        self.empty
    }
}
