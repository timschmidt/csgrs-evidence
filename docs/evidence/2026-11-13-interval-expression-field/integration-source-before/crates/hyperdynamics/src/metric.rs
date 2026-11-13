//! Exact metric input independent of a geometry carrier.
use crate::DynamicsError;
use hyperlimit::PredicatePolicy;
use hyperreal::Real;

/// Structural dynamics specialization supplied by the metric owner.
#[derive(Clone, Copy, Debug, Eq, PartialEq)]
pub enum SpanDynamicsClass {
    /// The span has constant tangent with respect to path distance.
    Affine,
    /// No constant-tangent specialization is asserted.
    General,
}

/// A retained source capable of supplying its exact path length.
///
/// Implementors must preserve the source's defining geometry and provenance.
/// The returned length must be exact, stable across calls, and refer to the same
/// retained span as its dynamics class. An unavailable exact length is an error;
/// sampling or fitting is not an implementation of this contract. This protocol
/// supplies metric data, not a certificate of the source geometry's validity.
/// Consumers request lengths lazily and may query a source again during replay.
pub trait MetricSpan {
    /// Obtain the retained source length under the caller's predicate policy.
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError>;
    /// Identify a structural specialization; this does not certify axis limits.
    fn dynamics_class(&self) -> SpanDynamicsClass;
}

/// A retained whole path with a stable empty/nonempty shape and exact length.
///
/// Geometry owners may provide borrowed views with stricter admitted domains.
/// Length acquisition is lazy and must retain the original source, traversal,
/// failure distinctions and exact scalar meaning. This contract does not verify
/// arbitrary provider code or establish geometry validity. Empty native slices
/// have zero length, while scheduling operations reject empty input first.
pub trait MetricPath {
    /// Whether this retained path contains no spans, without evaluating lengths.
    fn is_empty(&self) -> bool;
    /// Obtain the exact aggregate length under the caller's policy.
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError>;
}

impl<S: MetricSpan> MetricPath for [S] {
    fn is_empty(&self) -> bool {
        <[S]>::is_empty(self)
    }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        self.iter().try_fold(Real::zero(), |sum, span| {
            span.exact_length(policy).map(|length| sum + length)
        })
    }
}
impl<S: MetricSpan, const N: usize> MetricPath for [S; N] {
    fn is_empty(&self) -> bool {
        N == 0
    }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        MetricPath::exact_length(self.as_slice(), policy)
    }
}
impl<S: MetricSpan> MetricPath for Vec<S> {
    fn is_empty(&self) -> bool {
        Vec::is_empty(self)
    }
    fn exact_length(&self, policy: PredicatePolicy) -> Result<Real, DynamicsError> {
        MetricPath::exact_length(self.as_slice(), policy)
    }
}
