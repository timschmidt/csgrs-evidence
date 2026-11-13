//! Lazy source-owned join decisions with their complete retained evidence.
use crate::{CornerLookaheadJoinClass, DynamicsError};
use hyperlimit::PredicatePolicy;

/// A source-owned join decision and its original evidence.
///
/// The receipt must retain the endpoint/tangent relations, certainty and source
/// identity on which classification relies. A successful class asserts the
/// exact corresponding relation; invalid or undecided geometry remains a typed
/// error. This container is not itself a validator of arbitrary user providers.
#[derive(Clone, Debug)]
pub struct ClassifiedJoin<E> {
    /// Dynamics class or explicit failure from the geometry owner.
    pub classification: Result<CornerLookaheadJoinClass, DynamicsError>,
    /// Complete source-owned predicate receipt, including failure evidence.
    pub receipt: E,
}

/// Retained span data whose geometry owner can classify an adjacent join.
///
/// Classification is requested lazily under the supplied policy. Implementors
/// must preserve source identities and transport all consumed evidence in the
/// receipt. Repeated requests must remain valid for the same retained sources;
/// scheduling does not authorize precomputation, approximation or weaker proof.
pub trait JoinSpan {
    /// Geometry-owned receipt transported without replacing it by a class alone.
    type Receipt: Clone + core::fmt::Debug;
    /// Classify this span's end against the outgoing span's start.
    fn classify_join(
        &self,
        outgoing: &Self,
        policy: PredicatePolicy,
    ) -> ClassifiedJoin<Self::Receipt>;
}
